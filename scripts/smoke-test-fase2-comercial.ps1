#Requires -Version 5.1
# Smoke test Fase 2 Comercial — somente arquivos locais ficticios.

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$exemplos = Join-Path $root "operacao\_exemplos"
$followups = Join-Path $root "operacao\comercial\follow-ups"
$fila = Join-Path $root "operacao\fila-aprovacoes"
$falhas = New-Object System.Collections.Generic.List[string]
$marca = "smoke-fase2-" + (Get-Date -Format "yyyyMMdd-HHmmss")

Write-Host "=== smoke-test-fase2-comercial ==="

& (Join-Path $PSScriptRoot "novo-followup-comercial.ps1") `
  -Cliente $marca `
  -Motivo "teste ficticio" `
  -ProximaAcao "validar fluxo local" `
  -Canal "nenhum" `
  -Prazo "2099-01-01" `
  -Fonte "smoke-test" `
  -Rascunho "NAO ENVIAR. Mensagem ficticia."

& (Join-Path $PSScriptRoot "novo-rascunho-aprovacao.ps1") `
  -Tipo $marca `
  -Destinatario "numero-ficticio" `
  -Rascunho "NAO ENVIAR. Rascunho ficticio da Fase 2."

$followup = Get-ChildItem -LiteralPath $followups -File |
  Where-Object { $_.Name -like "*$marca*" } |
  Select-Object -First 1
$aprovacao = Get-ChildItem -LiteralPath $fila -File |
  Where-Object { $_.Name -like "*$marca*" } |
  Select-Object -First 1

if (-not $followup) {
  $falhas.Add("Follow-up smoke nao foi criado.")
} else {
  $conteudo = Get-Content -LiteralPath $followup.FullName -Raw
  if ($conteudo -notmatch "status:\s*aberto") { $falhas.Add("Follow-up sem status aberto.") }
  if ($conteudo -notmatch "envio:\s*nao autorizado") { $falhas.Add("Follow-up sem trava de envio.") }
}

if (-not $aprovacao) {
  $falhas.Add("Rascunho de aprovacao smoke nao foi criado.")
} else {
  $conteudoFila = Get-Content -LiteralPath $aprovacao.FullName -Raw
  if ($conteudoFila -notmatch "status:\s*pendente") { $falhas.Add("Rascunho sem status pendente.") }
}

New-Item -ItemType Directory -Force -Path $exemplos | Out-Null
foreach ($arquivo in @($followup, $aprovacao)) {
  if ($arquivo) {
    Move-Item -LiteralPath $arquivo.FullName -Destination (Join-Path $exemplos $arquivo.Name) -Force
    Write-Host ("Arquivado como exemplo: " + $arquivo.Name)
  }
}

if ($falhas.Count -eq 0) {
  Write-Host "SMOKE FASE 2 RESULT: PASS"
  exit 0
}

foreach ($falha in $falhas) { Write-Host ("FALHA: " + $falha) }
Write-Host "SMOKE FASE 2 RESULT: FAIL"
exit 1
