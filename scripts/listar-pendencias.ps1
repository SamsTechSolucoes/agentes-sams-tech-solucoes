# Lista pendencias na pasta operacao (ignora README, EXEMPLO* e smoke tests)
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root

function Get-PendingFiles($relDir, $statusNeedle) {
  $dir = Join-Path $root $relDir
  if (-not (Test-Path $dir)) { return @() }
  Get-ChildItem $dir -File -Filter *.md |
    Where-Object {
      $_.Name -notmatch '^(README|EXEMPLO)' -and $_.Name -notmatch 'smoke'
    } |
    Where-Object {
      $c = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
      $c -match ("status:\s*" + $statusNeedle)
    }
}

Write-Host ("Pendencias locais - {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm"))
Write-Host ""

$tarefas = Get-PendingFiles "operacao\tarefas" "aberta"
$lembretes = Get-PendingFiles "operacao\lembretes" "pendente"
$fila = Get-PendingFiles "operacao\fila-aprovacoes" "pendente"
$followups = Get-PendingFiles "operacao\comercial\follow-ups" "(aberto|rascunho)"
$handoffs = Get-PendingFiles "operacao\gestor" "aberto"

Write-Host ("Tarefas abertas: {0}" -f $tarefas.Count)
$tarefas | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ("Lembretes pendentes: {0}" -f $lembretes.Count)
$lembretes | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ("Fila aprovacao pendente: {0}" -f $fila.Count)
$fila | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ("Follow-ups comerciais abertos: {0}" -f $followups.Count)
$followups | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ("Handoffs do Gestor abertos: {0}" -f $handoffs.Count)
$handoffs | ForEach-Object { Write-Host ("  - " + $_.Name) }
Write-Host ""
Write-Host "Dica: EXEMPLO*, smoke e README.md sao ignorados. Fontes: .\\scripts\\status-fontes.ps1"
