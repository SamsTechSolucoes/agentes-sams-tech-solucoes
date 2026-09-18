# Smoke da ponte v1 (local): handoff + indice da Central + status fontes
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root

$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$pedido = "smoke-ponte-v1-$stamp"

& "$PSScriptRoot\novo-handoff-gestor.ps1" -De "Engenheiro Principal" -Para "Comercial" -Pedido $pedido -ResultadoEsperado "apenas teste local"
& "$PSScriptRoot\indice-central-aprovacoes.ps1" | Out-Null
& "$PSScriptRoot\status-fontes.ps1" | Out-Null

$handoff = Get-ChildItem (Join-Path $root "operacao\gestor") -File -Filter "*smoke-ponte-v1*" | Select-Object -First 1
$indice = Join-Path $root "operacao\central-aprovacoes\indice-atual.md"
$status = Join-Path $root "operacao\fontes\STATUS.md"

$ok = $true
if (-not $handoff) { Write-Host "FALTA handoff smoke"; $ok = $false }
if (-not (Test-Path -LiteralPath $indice)) { Write-Host "FALTA indice-atual.md"; $ok = $false }
if (-not (Test-Path -LiteralPath $status)) { Write-Host "FALTA fontes/STATUS.md"; $ok = $false }

if ($ok) {
  Write-Host "SMOKE RESULT PASS"
  exit 0
} else {
  Write-Host "SMOKE RESULT FAIL"
  exit 1
}
