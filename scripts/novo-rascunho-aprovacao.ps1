param(
  [Parameter(Mandatory=$true)][string]$Tipo,
  [Parameter(Mandatory=$true)][string]$Rascunho,
  [string]$Destinatario = ""
)
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\fila-aprovacoes"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$slug = ($Tipo.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
$name = "{0}-{1}.md" -f (Get-Date -Format "yyyyMMdd-HHmm"), $slug
$path = Join-Path $dir $name
@"
# Aprovacao pendente
- status: pendente
- tipo: $Tipo
- destinatario: $Destinatario
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:ss")-03:00
- rascunho: |
$($Rascunho -split "`n" | ForEach-Object { "    $_" } | Out-String)
"@ | Set-Content -Encoding UTF8 $path
Write-Host "Criado: $path"
Write-Host "NAO enviado. Aguardando OK do Samuel."
