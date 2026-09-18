# Mostra se a ponte de fontes esta autorizada e se ha briefs
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$statusFile = Join-Path $root "operacao\fontes\STATUS.md"
$consultas = Join-Path $root "operacao\fontes\consultas"

Write-Host "=== Status das fontes ==="
if (Test-Path -LiteralPath $statusFile) {
  Select-String -LiteralPath $statusFile -Pattern "Leitura operacional|BLOQUEADA|liberada|S1" |
    ForEach-Object { Write-Host $_.Line.Trim() }
} else {
  Write-Host "STATUS.md ausente"
}

$n = 0
if (Test-Path $consultas) {
  $n = @(Get-ChildItem $consultas -File -Filter *.md | Where-Object { $_.Name -notmatch '^README' }).Count
}
Write-Host ("Briefs em consultas/: {0}" -f $n)
Write-Host "Linhas de cliente: usar somente a copia consolidada S1; nova consulta direta exige o Engenheiro."
