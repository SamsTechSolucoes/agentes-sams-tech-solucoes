# Gera resumo das pendencias em operacao/registros
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root
. "$PSScriptRoot\listar-pendencias.ps1" | Out-Null

function Count-Status($relDir, $needle) {
  $dir = Join-Path $root $relDir
  if (-not (Test-Path $dir)) { return 0 }
  @(Get-ChildItem $dir -File -Filter *.md | Where-Object {
    $_.Name -notmatch '^(README|EXEMPLO)' -and ((Get-Content $_.FullName -Raw) -match ("status:\s*" + $needle))
  }).Count
}

$t = Count-Status "operacao\tarefas" "aberta"
$l = Count-Status "operacao\lembretes" "pendente"
$f = Count-Status "operacao\fila-aprovacoes" "pendente"
$h = Count-Status "operacao\gestor" "aberto"
$fu = Count-Status "operacao\comercial\follow-ups" "aberto"
$outDir = Join-Path $root "operacao\registros"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$name = "{0}-resumo-matinal-auto.md" -f (Get-Date -Format "yyyyMMdd")
$path = Join-Path $outDir $name
@"
# Resumo matinal automatico
- data: $(Get-Date -Format "yyyy-MM-dd HH:mm")
- tarefas_abertas: $t
- lembretes_pendentes: $l
- fila_aprovacao_pendente: $f
- handoffs_gestor_abertos: $h
- followups_comerciais_abertos: $fu
- fontes: ver operacao/fontes/STATUS.md (linhas de cliente so com pacote S1)
- nota: Gerado por scripts/resumo-matinal.ps1. Nao inventa clientes nem dados de NF.
"@ | Set-Content -Encoding UTF8 $path
Write-Host "Resumo: $path"
