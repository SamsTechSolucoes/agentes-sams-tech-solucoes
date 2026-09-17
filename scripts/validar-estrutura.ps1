#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$raiz = "C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes"

function Test-PathFlex([string]$rel) {
  $p1 = Join-Path $raiz $rel
  if (Test-Path -LiteralPath $p1) { return $true }
  $comAcento = $rel -replace '^Documentacao', ([string]([char]0x0044) + 'ocumenta' + [char]0x00E7 + [char]0x00E3 + 'o')
  # fallback: Discover Documentacao* folder
  $docDir = Get-ChildItem -LiteralPath $raiz -Directory | Where-Object { $_.Name -like 'Documenta*' } | Select-Object -First 1
  if ($docDir -and $rel -like 'Documentacao\*') {
    $rest = $rel.Substring('Documentacao\'.Length)
    $p2 = Join-Path $docDir.FullName $rest
    return (Test-Path -LiteralPath $p2)
  }
  return $false
}

$obrigatorios = @(
  "AGENTS.md",
  "empresa\constituicao-comum.md",
  "empresa\glossario-ptbr.md",
  "empresa\fichas\01-secretaria.md",
  "empresa\fichas\02-gestor.md",
  "empresa\fichas\03-comercial.md",
  "empresa\fichas\04-produtos.md",
  "empresa\fichas\05-financeiro.md",
  "empresa\fichas\06-inteligencia.md",
  "empresa\fichas\07-evolucao.md",
  "Documentacao\decisoes\2026-09-17-cursor-somente-engenheiro-e-termos-ptbr.md",
  "Documentacao\arquitetura\SamsTech_Agents_Arquitetura_V2.md",
  "operacao\tarefas\README.md",
  "operacao\lembretes\README.md",
  "operacao\registros\README.md",
  "operacao\fila-aprovacoes\README.md",
  "operacao\gestor\README.md",
  "operacao\comercial\README.md",
  "operacao\produtos\README.md",
  "operacao\financeiro\README.md",
  "operacao\inteligencia\README.md",
  "operacao\central-aprovacoes\README.md",
  "operacao\aprendizado\README.md",
  ".cursor\rules\05-idioma-e-cursor.mdc"
)

$ok = 0
$falta = 0
Write-Host "=== Validar estrutura ==="
foreach ($p in $obrigatorios) {
  if (Test-PathFlex $p) {
    Write-Host "[OK] $p"
    $ok++
  } else {
    Write-Host "[FALTA] $p"
    $falta++
  }
}
Write-Host ("OK=" + $ok + " FALTA=" + $falta)
if ($falta -gt 0) { exit 1 } else { exit 0 }
