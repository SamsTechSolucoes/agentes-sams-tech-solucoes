param(
  [Parameter(Mandatory=$true)][string]$Titulo,
  [string]$Descricao = "",
  [string]$Prazo = ""
)
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\tarefas"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$slug = ($Titulo.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
if (-not $slug) { $slug = "tarefa" }
$name = "{0}-{1}.md" -f (Get-Date -Format "yyyyMMdd"), $slug
$path = Join-Path $dir $name
@"
# $Titulo
- status: aberta
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:ss")-03:00
- prazo: $Prazo
- origem: script novo-tarefa
- descricao: $Descricao
"@ | Set-Content -Encoding UTF8 $path
Write-Host "Criado: $path"
