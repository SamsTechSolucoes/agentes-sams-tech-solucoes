#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$raiz = "C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes"

function Listar-Pasta([string]$Rel, [string]$Titulo) {
  $dir = Join-Path $raiz $Rel
  Write-Host ""
  Write-Host ("=== " + $Titulo + " ===")
  if (-not (Test-Path $dir)) { Write-Host "(pasta ausente)"; return }
  $itens = Get-ChildItem -Path $dir -Filter "*.md" -File | Where-Object { $_.Name -notmatch '^(EXEMPLO-|README)' }
  if (-not $itens) { Write-Host "(vazio)"; return }
  foreach ($f in $itens) { Write-Host ("- " + $f.FullName) }
}

Write-Host "Pendencias - SamsTech Agents"
Listar-Pasta "operacao\tarefas" "Tarefas"
Listar-Pasta "operacao\lembretes" "Lembretes"
Listar-Pasta "operacao\fila-aprovacoes" "Fila de aprovacoes"
Listar-Pasta "operacao\gestor" "Handoffs (Gestor)"
Listar-Pasta "operacao\central-aprovacoes" "Central de aprovacoes"
Listar-Pasta "operacao\comercial" "Comercial"
Listar-Pasta "operacao\produtos" "Produtos"
Listar-Pasta "operacao\financeiro" "Financeiro"
Listar-Pasta "operacao\inteligencia" "Inteligencia"
