#Requires -Version 5.1
# Smoke test Fase 1
# Cria artefatos temporarios via novo-*.ps1
# Confere no filesystem com Get-ChildItem *smoke* (pastas operacao)
# NAO valida sucesso pela captura de Write-Host (Write-Host nao vai para o pipeline)
# NAO apaga lembretes reais

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root

$falhas = New-Object System.Collections.Generic.List[string]
$nomeLembreteReal = "20260917-0222-desligar-torneira.md"

function Get-OperacaoSearchRoots {
  $dirs = New-Object System.Collections.Generic.List[string]
  $nativo = Join-Path $root "operacao"
  if (Test-Path -LiteralPath $nativo) { $dirs.Add($nativo) }
  Get-ChildItem -LiteralPath $root -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -like "operacao*" } |
    ForEach-Object {
      if (-not $dirs.Contains($_.FullName)) { $dirs.Add($_.FullName) }
    }
  return @($dirs)
}

function Get-SmokeFiles {
  # Filesystem only. Nao usar saida de Write-Host.
  $acc = @()
  foreach ($base in Get-OperacaoSearchRoots) {
    $acc += @(Get-ChildItem -LiteralPath $base -Recurse -File -ErrorAction SilentlyContinue |
      Where-Object { $_.Name -like "*smoke*" })
  }
  return @($acc)
}

Write-Host "=== smoke-test-fase1 ==="
Write-Host ("Raiz: " + $root)
Write-Host "Verificacao: Get-ChildItem *smoke* no filesystem (operacao/)"
Write-Host "NAO usar captura de pipeline de Write-Host"
Write-Host ""

Write-Host "[1] Criando artefatos via novo-*.ps1 ..."
# Chamada direta. Nao fazer: $out = & script; if ($out -match "Criado")
# Write-Host dos scripts pode aparecer na tela; ignorar para o resultado.
& (Join-Path $PSScriptRoot "novo-tarefa.ps1") -Titulo "smoke-tarefa-fase1" -Descricao "artefato smoke; nao e pedido real"
& (Join-Path $PSScriptRoot "novo-lembrete.ps1") -Texto "smoke-lembrete-fase1" -Quando "2099-01-01T08:00:00-03:00"
& (Join-Path $PSScriptRoot "novo-rascunho-aprovacao.ps1") -Tipo "smoke-rascunho-fase1" -Rascunho "NAO ENVIAR. Artefato de smoke test." -Destinatario "smoke"

Write-Host ""
Write-Host "[2] Get-ChildItem *smoke* ..."
$smoke = @(Get-SmokeFiles)
Write-Host ("  encontrados: " + $smoke.Count)
foreach ($f in $smoke) {
  Write-Host ("    - " + $f.FullName)
}

$tarefas = @($smoke | Where-Object { $_.DirectoryName -match "tarefas" })
$lembretesSmoke = @($smoke | Where-Object { $_.DirectoryName -match "lembretes" })
$fila = @($smoke | Where-Object { $_.DirectoryName -match "fila-aprovacoes" })

if ($tarefas.Count -lt 1) { $falhas.Add("Nenhum arquivo *smoke* em operacao/tarefas") }
if ($lembretesSmoke.Count -lt 1) { $falhas.Add("Nenhum arquivo *smoke* em operacao/lembretes") }
if ($fila.Count -lt 1) { $falhas.Add("Nenhum arquivo *smoke* em operacao/fila-aprovacoes") }

Write-Host ""
Write-Host "[3] Lembrete real intacto (nao apagar) ..."
$real = $null
foreach ($base in Get-OperacaoSearchRoots) {
  $hit = Get-ChildItem -LiteralPath $base -Recurse -File -Filter $nomeLembreteReal -ErrorAction SilentlyContinue |
    Select-Object -First 1
  if ($hit) { $real = $hit; break }
}
if (-not $real) {
  $falhas.Add("Lembrete real ausente: " + $nomeLembreteReal)
} else {
  Write-Host ("  OK: " + $real.FullName)
}

Write-Host ""
Write-Host "Artefatos *smoke* em operacao/ sao opcionais (nao sao pedido real)."
Write-Host ""

if ($falhas.Count -eq 0) {
  Write-Host "SMOKE RESULT PASS"
  exit 0
}

foreach ($f in $falhas) {
  Write-Host ("FALHA: " + $f)
}
Write-Host "SMOKE RESULT FAIL"
exit 1
