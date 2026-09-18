#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\tarefas"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

$data = Get-Date -Format "yyyyMMdd"
$path = Join-Path $dir "$data-atualizar-export-sistema-nf.md"
if (Test-Path -LiteralPath $path) {
  Write-Host "Solicitacao ja existe: $path"
  exit 0
}

@"
# Atualizar dados do sistema de notas
- status: aberta
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz")
- responsavel: Engenheiro Principal
- solicitante: Secretária Pessoal
- recorrencia: semanal, segunda-feira 07:30
- pedido: Atualize a extracao completa do Supabase para operacao/secretaria/sistema-nf.
- escopo: clientes, CNPJ/CPF, NFs, itens, catalogo, imagens e lembretes.
- pdfs: baixar somente com sessao autenticada; nunca gravar token.
- upload_nf: nao; a Secretária manipula a pasta consolidada.
- envio_externo: nenhum
"@ | Set-Content -LiteralPath $path -Encoding UTF8

Write-Host "Solicitacao criada: $path"
