#Requires -Version 5.1
param(
  [int]$DiasInativo = 60,
  [int]$DiasPrevencao = 45
)

$ErrorActionPreference = "Stop"
if ($DiasInativo -lt 1) { throw "DiasInativo deve ser maior que zero." }
if ($DiasPrevencao -lt 1 -or $DiasPrevencao -ge $DiasInativo) {
  throw "DiasPrevencao deve ser positivo e menor que DiasInativo."
}

$root = Split-Path $PSScriptRoot -Parent
$nfDir = Join-Path $root "operacao\secretaria\sistema-nf\planilhas"
$clientesPath = Join-Path $nfDir "01-clientes-todos.csv"
$notasPath = Join-Path $nfDir "06-notas-fiscais.csv"
$outDir = Join-Path $root "operacao\comercial\privados"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

if (-not (Test-Path $clientesPath) -or -not (Test-Path $notasPath)) {
  throw "Export S1 ausente. Atualize os dados do sistema de notas."
}

$clientes = Import-Csv -LiteralPath $clientesPath -Delimiter ";"
$notas = Import-Csv -LiteralPath $notasPath -Delimiter ";"
$ultimaPorCliente = @{}
foreach ($nf in $notas) {
  if (-not $nf.client_id -or -not $nf.data_emissao) { continue }
  $data = [DateTime]::Parse($nf.data_emissao)
  if (-not $ultimaPorCliente.ContainsKey($nf.client_id) -or
      $data -gt $ultimaPorCliente[$nf.client_id]) {
    $ultimaPorCliente[$nf.client_id] = $data
  }
}

$limite = (Get-Date).Date.AddDays(-$DiasInativo)
$carteira = foreach ($c in $clientes) {
  $ultima = $ultimaPorCliente[$c.id]
  $diasSemCompra = if ($ultima) {
    [Math]::Max(0, ((Get-Date).Date - $ultima.Date).Days)
  } else { $null }
  $statusCarteira = if ($null -eq $diasSemCompra) {
    "sem_historico"
  } elseif ($diasSemCompra -ge $DiasInativo) {
    "inativo"
  } elseif ($diasSemCompra -ge $DiasPrevencao) {
    "prevencao"
  } else {
    "ativo"
  }
  [PSCustomObject]@{
    client_id = $c.id
    razao_social = $c.razao_social
    cnpj_cpf = $c.cnpj_cpf
    telefone = $c.telefone
    email = $c.email
    municipio = $c.municipio
    uf = $c.uf
    ultima_compra = if ($ultima) { $ultima.ToString("yyyy-MM-dd") } else { "" }
    inativo = if ($null -eq $diasSemCompra) {
      "revisar"
    } elseif ($ultima -lt $limite) {
      "sim"
    } else {
      "nao"
    }
    dias_sem_compra = if ($null -eq $diasSemCompra) { "" } else { $diasSemCompra }
    status_carteira = $statusCarteira
    criterio_prevencao_dias = $DiasPrevencao
    criterio_dias = $DiasInativo
  }
}

$path = Join-Path $outDir "carteira-atual.csv"
$carteira | Export-Csv -LiteralPath $path -Delimiter ";" -Encoding UTF8 -NoTypeInformation
$inativos = @($carteira | Where-Object { $_.inativo -eq "sim" }).Count
$prevencao = @($carteira | Where-Object { $_.status_carteira -eq "prevencao" }).Count

Write-Host "Carteira privada: $path"
Write-Host ("Clientes={0} Prevencao={1} Inativos={2} PrevencaoDias={3} InativoDias={4}" -f
  $carteira.Count, $prevencao, $inativos, $DiasPrevencao, $DiasInativo)
Write-Host "PII fora do git. Nenhuma mensagem enviada."
