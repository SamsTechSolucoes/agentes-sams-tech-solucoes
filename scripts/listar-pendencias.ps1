<#
.SYNOPSIS
  Lista tarefas abertas, lembretes pendentes e rascunhos aguardando aprovação.
#>
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot

function Show-Folder([string]$Rel, [string]$Label) {
  $dir = Join-Path $Root $Rel
  Write-Host ""
  Write-Host "=== $Label ($Rel) ==="
  if (-not (Test-Path $dir)) { Write-Host "(pasta inexistente)"; return }
  $files = Get-ChildItem -Path $dir -Filter *.md -File | Where-Object { $_.Name -notin @('README.md') -and $_.Name -notlike 'EXEMPLO*' } | Sort-Object Name
  if (-not $files) { Write-Host "(vazio)"; return }
  foreach ($f in $files) {
    $raw = Get-Content -Raw -Encoding UTF8 $f.FullName
    $status = if ($raw -match '\|\s*\*\*Status\*\*\s*\|\s*([^|]+)\|') { $Matches[1].Trim() } else { '?' }
    $skip = $false
    if ($Label -eq 'Tarefas' -and $status -match 'feita|concluida|concluída|cancelada') { $skip = $true }
    if ($Label -eq 'Lembretes' -and $status -match 'feito|cancelado|adiado') { $skip = $true }
    if ($Label -eq 'Aprovações' -and $status -match 'aprovado|rejeitado|enviado|cancelado') { $skip = $true }
    if ($skip) { continue }
    Write-Host ("- [{0}] {1}" -f $status, $f.Name)
  }
}

Write-Host ("Pendências locais — {0}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm'))
Show-Folder 'operacao\tarefas' 'Tarefas'
Show-Folder 'operacao\lembretes' 'Lembretes'
Show-Folder 'operacao\fila-aprovacoes' 'Aprovações'
Write-Host ""
Write-Host "Dica: EXEMPLO* e README.md são ignorados."
