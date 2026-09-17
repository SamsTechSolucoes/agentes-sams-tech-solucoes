param(
  [Parameter(Mandatory=$true)][string]$Texto,
  [Parameter(Mandatory=$true)][string]$Quando
)
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\lembretes"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$slug = ($Texto.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
if (-not $slug) { $slug = "lembrete" }
if ($slug.Length -gt 40) { $slug = $slug.Substring(0,40).Trim("-") }
$stamp = Get-Date -Format "yyyyMMdd-HHmm"
$name = "{0}-{1}.md" -f $stamp, $slug
$path = Join-Path $dir $name
@"
# Lembrete
- status: pendente
- quando: $Quando
- texto: $Texto
- origem: script novo-lembrete
"@ | Set-Content -Encoding UTF8 $path
Write-Host "Criado: $path"
