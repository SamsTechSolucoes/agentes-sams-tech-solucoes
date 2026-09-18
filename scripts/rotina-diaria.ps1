#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$registroDir = Join-Path $root "operacao\registros"
New-Item -ItemType Directory -Force -Path $registroDir | Out-Null

& (Join-Path $PSScriptRoot "indice-central-aprovacoes.ps1")
& (Join-Path $PSScriptRoot "resumo-matinal.ps1")
& (Join-Path $PSScriptRoot "validar-export-sistema-nf.ps1") -MaximoHoras 48

$registro = Join-Path $registroDir ("{0}-rotina-diaria.md" -f (Get-Date -Format "yyyyMMdd"))
@"
# Rotina diaria dos Agentes
- status: concluida
- executada_em: $(Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz")
- central: atualizada
- resumo_matinal: atualizado
- export_nf: validado; verificar avisos de idade/PDFs no console
- envio_externo: nenhum
"@ | Set-Content -LiteralPath $registro -Encoding UTF8

Write-Host "ROTINA DIARIA PASS"
Write-Host "Registro: $registro"
