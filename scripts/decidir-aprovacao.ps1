#Requires -Version 5.1
param(
  [Parameter(Mandatory=$true)][string]$Arquivo,
  [Parameter(Mandatory=$true)]
  [ValidateSet("aprovado", "recusado", "enviado")]
  [string]$Decisao,
  [string]$Observacao = ""
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$fila = Join-Path $root "operacao\fila-aprovacoes"
$historico = Join-Path $root "operacao\central-aprovacoes\historico"
$path = Join-Path $fila ([IO.Path]::GetFileName($Arquivo))

if (-not (Test-Path -LiteralPath $path)) {
  throw "Item da fila nao encontrado: $Arquivo"
}

$conteudo = Get-Content -LiteralPath $path -Raw
$atual = [regex]::Match($conteudo, '(?m)^- status:\s*(\S+)').Groups[1].Value
if (-not $atual) {
  throw "O arquivo nao possui campo '- status:'."
}

$permitido = (
  ($atual -eq "pendente" -and $Decisao -in @("aprovado", "recusado")) -or
  ($atual -eq "aprovado" -and $Decisao -eq "enviado")
)
if (-not $permitido) {
  throw "Transicao invalida: $atual -> $Decisao"
}

$agora = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$novo = [regex]::Replace($conteudo, '(?m)^- status:\s*\S+', "- status: $Decisao", 1)
$novo += "`r`n- decisao_em: $agora"
if ($Observacao) {
  $limpa = $Observacao -replace '[\r\n]+', ' '
  $novo += "`r`n- decisao_observacao: $limpa"
}
$novo += "`r`n"
$novo | Set-Content -LiteralPath $path -Encoding UTF8

New-Item -ItemType Directory -Force -Path $historico | Out-Null
$registro = Join-Path $historico ("{0}-{1}-{2}.md" -f
  (Get-Date -Format "yyyyMMdd-HHmmss"),
  ([IO.Path]::GetFileNameWithoutExtension($path)),
  $Decisao)
@"
# Historico de aprovacao
- item: $([IO.Path]::GetFileName($path))
- de: $atual
- para: $Decisao
- registrado_em: $agora
- observacao: $Observacao
"@ | Set-Content -LiteralPath $registro -Encoding UTF8

& (Join-Path $PSScriptRoot "indice-central-aprovacoes.ps1") | Out-Null
Write-Host "Decisao registrada: $atual -> $Decisao"
Write-Host "Item: $path"
Write-Host "Historico: $registro"
