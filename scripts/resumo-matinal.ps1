#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$raiz = "C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes"
$agora = Get-Date
$dia = $agora.ToString("yyyyMMdd")
$iso = $agora.ToString("yyyy-MM-ddTHH:mm:ssK")

function Coletar([string]$Rel) {
  $dir = Join-Path $raiz $Rel
  if (-not (Test-Path $dir)) { return @() }
  Get-ChildItem -Path $dir -Filter "*.md" -File |
    Where-Object { $_.Name -notmatch '^(EXEMPLO-|README)' } |
    ForEach-Object { $_.Name }
}

$linhas = New-Object System.Collections.Generic.List[string]
$linhas.Add("# Registro - Resumo matinal")
$linhas.Add("- data: $($agora.ToString('yyyy-MM-dd'))")
$linhas.Add("- tipo: nota")
$linhas.Add("- conteudo: |")
$linhas.Add("    Gerado em $iso pelo Engenheiro Principal (script resumo-matinal.ps1).")
$linhas.Add("    Cursor: somente Engenheiro Principal autorizado nesta fase.")
$linhas.Add("")
$linhas.Add("    ## Tarefas")
foreach ($i in (Coletar "operacao\tarefas")) { $linhas.Add("    - $i") }
$linhas.Add("    ## Lembretes")
foreach ($i in (Coletar "operacao\lembretes")) { $linhas.Add("    - $i") }
$linhas.Add("    ## Fila de aprovacoes")
foreach ($i in (Coletar "operacao\fila-aprovacoes")) { $linhas.Add("    - $i") }
$linhas.Add("    ## Handoffs")
foreach ($i in (Coletar "operacao\gestor")) { $linhas.Add("    - $i") }

$destino = Join-Path $raiz ("operacao\registros\" + $dia + "-resumo-matinal.md")
Set-Content -LiteralPath $destino -Value $linhas -Encoding UTF8
Write-Host ("Resumo: " + $destino)
