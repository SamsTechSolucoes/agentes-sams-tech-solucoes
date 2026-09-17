<#
.SYNOPSIS
  Cria um lembrete markdown em operacao/lembretes/ (local only).
#>
param(
  [Parameter(Mandatory = $true)][string]$Titulo,
  [Parameter(Mandatory = $true)][string]$Quando,
  [string]$Descricao = ""
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$DestDir = Join-Path $Root 'operacao\lembretes'
if (-not (Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir | Out-Null }

$stamp = Get-Date -Format 'yyyyMMdd-HHmm'
$slug = ($Titulo.ToLower() -replace '[^a-z0-9áàâãéêíóôõúç]+','-').Trim('-')
if ([string]::IsNullOrWhiteSpace($slug)) { $slug = 'lembrete' }
if ($slug.Length -gt 40) { $slug = $slug.Substring(0,40).Trim('-') }
$id = "$stamp-$slug"
$path = Join-Path $DestDir "$id.md"
$criada = Get-Date -Format 'yyyy-MM-dd HH:mm'
if (-not $Descricao) { $Descricao = $Titulo }

$tplPath = Join-Path $Root 'templates\lembrete.md'
if (Test-Path $tplPath) {
  $body = Get-Content -Raw -Encoding UTF8 $tplPath
  $body = $body.Replace('{titulo}', $Titulo).Replace('{id}', $id).Replace('{criada}', $criada).Replace('{quando}', $Quando).Replace('{descricao}', $Descricao)
} else {
  $body = @"
# Lembrete: $Titulo

| Campo | Valor |
|---|---|
| **ID** | ``$id`` |
| **Status** | pendente |
| **Quando** | $Quando |
| **Criado em** | $criada |

## O que lembrar

$Descricao
"@
}

Set-Content -Path $path -Value $body -Encoding UTF8
Write-Host "OK lembrete: $path"
