#Requires -Version 5.1
param(
  [string]$Horario = "08:00",
  [string]$Nome = "SamsTech-Agents-Resumo-Diario"
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$script = Join-Path $PSScriptRoot "rotina-diaria.ps1"
$logDir = Join-Path $root "operacao\registros\logs-locais"
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$log = Join-Path $logDir "rotina-diaria.log"

$acao = New-ScheduledTaskAction `
  -Execute "powershell.exe" `
  -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$script`" >> `"$log`" 2>&1"
$gatilho = New-ScheduledTaskTrigger -Weekly `
  -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday `
  -At $Horario
$config = New-ScheduledTaskSettingsSet `
  -StartWhenAvailable `
  -AllowStartIfOnBatteries `
  -DontStopIfGoingOnBatteries

Register-ScheduledTask `
  -TaskName $Nome `
  -Action $acao `
  -Trigger $gatilho `
  -Settings $config `
  -Description "Atualiza Central, resumo e valida export NF; nao envia mensagens." `
  -Force | Out-Null

Write-Host "Rotina instalada: $Nome, seg-sex as $Horario"
Write-Host "Log local (fora do git): $log"
