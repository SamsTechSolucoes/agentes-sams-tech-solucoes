#Requires -Version 5.1
param(
  [string]$Horario = "07:30",
  [string]$Nome = "SamsTech-Agents-Solicitar-Atualizacao-NF"
)

$ErrorActionPreference = "Stop"
$script = Join-Path $PSScriptRoot "solicitar-atualizacao-nf.ps1"
$acao = New-ScheduledTaskAction `
  -Execute "powershell.exe" `
  -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$script`""
$gatilho = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At $Horario
$config = New-ScheduledTaskSettingsSet `
  -StartWhenAvailable `
  -AllowStartIfOnBatteries `
  -DontStopIfGoingOnBatteries

Register-ScheduledTask `
  -TaskName $Nome `
  -Action $acao `
  -Trigger $gatilho `
  -Settings $config `
  -Description "Cria pedido semanal para o Engenheiro atualizar a pasta consolidada do NF." `
  -Force | Out-Null

Write-Host "Solicitacao semanal instalada: segunda-feira as $Horario"
