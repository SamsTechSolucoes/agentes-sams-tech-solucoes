#Requires -Version 5.1
param(
  [Parameter(Mandatory = $true)]
  [ValidateSet("tarefa", "lembrete", "aprovacao", "registro", "handoff")]
  [string]$Tipo,
  [Parameter(Mandatory = $true)]
  [string]$Titulo,
  [string]$Texto = ""
)

$ErrorActionPreference = "Stop"
$raiz = "C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes"
$agora = Get-Date
$stamp = $agora.ToString("yyyyMMdd")
$iso = $agora.ToString("yyyy-MM-ddTHH:mm:ssK")
$slug = ($Titulo.ToLower() -replace "[^a-z0-9]+", "-" -replace "-+", "-" -replace "^-|-$", "")
if ([string]::IsNullOrWhiteSpace($slug)) { $slug = "item" }

switch ($Tipo) {
  "tarefa" {
    $pasta = "operacao\tarefas"
    $nome = "$stamp-$slug.md"
    $corpo = "# $Titulo`r`n- status: aberta`r`n- criado: $iso`r`n- prazo:`r`n- origem: Samuel`r`n- descricao: $Texto`r`n"
  }
  "lembrete" {
    $hhmm = $agora.ToString("HHmm")
    $pasta = "operacao\lembretes"
    $nome = "$stamp-$hhmm-$slug.md"
    $corpo = "# Lembrete - $Titulo`r`n- status: pendente`r`n- quando: $iso`r`n- texto: $Texto`r`n"
  }
  "aprovacao" {
    $pasta = "operacao\fila-aprovacoes"
    $nome = "$stamp-$slug.md"
    $corpo = "# Aprovacao pendente - $Titulo`r`n- status: pendente`r`n- tipo: outro`r`n- destinatario:`r`n- criado: $iso`r`n- rascunho: |`r`n    $Texto`r`n"
  }
  "registro" {
    $pasta = "operacao\registros"
    $nome = "$stamp-$slug.md"
    $corpo = "# Registro - $Titulo`r`n- data: $($agora.ToString('yyyy-MM-dd'))`r`n- tipo: nota`r`n- conteudo: $Texto`r`n"
  }
  "handoff" {
    $pasta = "operacao\gestor"
    $nome = "$stamp-handoff-$slug.md"
    $corpo = "# Handoff - $Titulo`r`n- status: aberto`r`n- de: Gestor da Equipe`r`n- para:`r`n- criado: $iso`r`n- pedido: $Texto`r`n- resultado_esperado:`r`n"
  }
}

$destino = Join-Path (Join-Path $raiz $pasta) $nome
Set-Content -LiteralPath $destino -Value $corpo -Encoding UTF8
Write-Host ("Criado: " + $destino)
