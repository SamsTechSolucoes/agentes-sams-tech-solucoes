<#
.SYNOPSIS
  Cria rascunho em operacao/fila-aprovacoes/ (NUNCA envia mensagem).
#>
param(
  [Parameter(Mandatory = $true)][string]$Titulo,
  [Parameter(Mandatory = $true)][string]$Mensagem,
  [ValidateSet('whatsapp','email','outro')][string]$Canal = 'whatsapp',
  [string]$Destino = '(PENDENTE SAMUEL)',
  [string]$Contexto = ""
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$DestDir = Join-Path $Root 'operacao\fila-aprovacoes'
if (-not (Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir | Out-Null }

$stamp = Get-Date -Format 'yyyyMMdd-HHmm'
$slug = ($Titulo.ToLower() -replace '[^a-z0-9áàâãéêíóôõúç]+','-').Trim('-')
if ([string]::IsNullOrWhiteSpace($slug)) { $slug = 'rascunho' }
if ($slug.Length -gt 40) { $slug = $slug.Substring(0,40).Trim('-') }
$id = "$stamp-$slug"
$path = Join-Path $DestDir "$id.md"
$criada = Get-Date -Format 'yyyy-MM-dd HH:mm'
if (-not $Contexto) { $Contexto = 'Rascunho automático local. Aguardar aprovação explícita.' }

$tplPath = Join-Path $Root 'templates\aprovacao.md'
if (Test-Path $tplPath) {
  $body = Get-Content -Raw -Encoding UTF8 $tplPath
  $body = $body.Replace('{titulo}', $Titulo).Replace('{id}', $id).Replace('{criada}', $criada).Replace('{canal}', $Canal).Replace('{destino}', $Destino).Replace('{mensagem}', $Mensagem).Replace('{contexto}', $Contexto)
} else {
  $body = @"
# Rascunho para aprovação: $Titulo

| Campo | Valor |
|---|---|
| **ID** | ``$id`` |
| **Status** | aguardando-samuel |
| **Canal** | $Canal |
| **Destinatário** | $Destino |

## Mensagem proposta

``````
$Mensagem
``````
"@
}

Set-Content -Path $path -Value $body -Encoding UTF8
Write-Host "OK rascunho (NÃO ENVIADO): $path"
