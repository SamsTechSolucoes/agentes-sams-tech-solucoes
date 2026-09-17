<#
.SYNOPSIS
  Cria uma tarefa markdown em operacao/tarefas/ (local only).
#>
param(
  [Parameter(Mandatory = $true)][string]$Titulo,
  [string]$Descricao = "",
  [string]$Prazo = "",
  [ValidateSet('baixa','normal','alta','urgente')][string]$Prioridade = 'normal'
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$DestDir = Join-Path $Root 'operacao\tarefas'
if (-not (Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir | Out-Null }

$stamp = Get-Date -Format 'yyyyMMdd-HHmm'
$slug = ($Titulo.ToLower() -replace '[^a-z0-9áàâãéêíóôõúç]+','-').Trim('-')
if ([string]::IsNullOrWhiteSpace($slug)) { $slug = 'tarefa' }
if ($slug.Length -gt 40) { $slug = $slug.Substring(0,40).Trim('-') }
$id = "$stamp-$slug"
$path = Join-Path $DestDir "$id.md"
$criada = Get-Date -Format 'yyyy-MM-dd HH:mm'
if (-not $Prazo) { $Prazo = '(sem prazo)' }
if (-not $Descricao) { $Descricao = '(descrever)' }

$tplPath = Join-Path $Root 'templates\tarefa.md'
if (Test-Path $tplPath) {
  $body = Get-Content -Raw -Encoding UTF8 $tplPath
  $body = $body.Replace('{titulo}', $Titulo).Replace('{id}', $id).Replace('{criada}', $criada).Replace('{prazo}', $Prazo).Replace('{descricao}', $Descricao)
  $body = $body -replace '\|\s*\*\*Prioridade\*\*\s*\|\s*normal\s*\|', "| **Prioridade** | $Prioridade |"
} else {
  $body = @"
# Tarefa: $Titulo

| Campo | Valor |
|---|---|
| **ID** | ``$id`` |
| **Status** | aberta |
| **Prioridade** | $Prioridade |
| **Criada em** | $criada |
| **Prazo** | $Prazo |

## Descrição

$Descricao
"@
}

Set-Content -Path $path -Value $body -Encoding UTF8
Write-Host "OK tarefa: $path"
