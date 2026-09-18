#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$fila = Join-Path $root "operacao\fila-aprovacoes"
$exemplos = Join-Path $root "operacao\_exemplos"
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$nome = "$stamp-smoke-central.md"
$path = Join-Path $fila $nome

New-Item -ItemType Directory -Force -Path $fila, $exemplos | Out-Null
@"
# Smoke Central de Aprovacoes
- status: pendente
- tipo: teste-local
- destinatario: nenhum
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz")
- envio: proibido; teste de transicao de estado
"@ | Set-Content -LiteralPath $path -Encoding UTF8

& (Join-Path $PSScriptRoot "decidir-aprovacao.ps1") `
  -Arquivo $nome `
  -Decisao aprovado `
  -Observacao "Smoke local; sem envio"

$conteudo = Get-Content -LiteralPath $path -Raw
if ($conteudo -notmatch '(?m)^- status:\s*aprovado\s*$') {
  throw "Status aprovado nao foi registrado."
}

Move-Item -LiteralPath $path -Destination (Join-Path $exemplos $nome)
& (Join-Path $PSScriptRoot "indice-central-aprovacoes.ps1") | Out-Null
Write-Host "SMOKE CENTRAL PASS"
