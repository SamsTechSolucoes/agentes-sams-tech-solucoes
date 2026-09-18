param(
  [Parameter(Mandatory=$true)][string]$De,
  [Parameter(Mandatory=$true)][string]$Para,
  [Parameter(Mandatory=$true)][string]$Pedido,
  [string]$ResultadoEsperado = "",
  [string]$Prioridade = "normal"
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\gestor"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

$slug = ($Pedido.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
if (-not $slug) { $slug = "handoff" }
if ($slug.Length -gt 40) { $slug = $slug.Substring(0, 40).Trim("-") }
$name = "{0}-{1}.md" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $slug
$path = Join-Path $dir $name

@"
# Handoff
- status: aberto
- de: $De
- para: $Para
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:ss")-03:00
- prioridade: $Prioridade
- pedido: $Pedido
- resultado_esperado: $ResultadoEsperado
- envio_externo: nao
- nota: Handoff local. Nao autoriza WhatsApp a cliente nem codigo de NF.
"@ | Set-Content -Encoding UTF8 -LiteralPath $path

Write-Host "Criado: $path"
