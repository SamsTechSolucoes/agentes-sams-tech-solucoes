# Scripts locais (PowerShell)

Helpers **só locais** para a pasta `operacao/`. Não enviam WhatsApp, não chamam API de produção, não leem `.env`.

## Uso (na raiz do projeto Agentes)

```powershell
.\scripts\novo-tarefa.ps1 -Titulo "Ligar fulano" -Descricao "Retornar ligação"
.\scripts\novo-lembrete.ps1 -Titulo "Desligar torneira" -Quando "2026-09-17 07:00"
.\scripts\novo-rascunho-aprovacao.ps1 -Titulo "Aviso cliente X" -Mensagem "Olá..." -Canal whatsapp
.\scripts\listar-pendencias.ps1
.\scripts\smoke-test-fase1.ps1
.\scripts\novo-handoff-gestor.ps1 -De "Secretária Pessoal" -Para "Comercial" -Pedido "exemplo"
.\scripts\indice-central-aprovacoes.ps1
.\scripts\status-fontes.ps1
.\scripts\smoke-test-ponte-v1.ps1
node .\scripts\montar-pasta-sistema-nf.mjs
node .\scripts\baixar-arquivos-sistema-nf.mjs imagens
.\scripts\solicitar-atualizacao-nf.ps1
.\scripts\instalar-solicitacao-semanal-nf.ps1 -Horario "07:30"
```

`smoke-test-fase1.ps1` cria itens `*smoke*` via `novo-*.ps1` e **confirma no filesystem** (`Get-ChildItem *smoke*`). Não usa captura de `Write-Host`. Imprime `SMOKE RESULT PASS` ou `SMOKE RESULT FAIL`. Não apaga lembretes reais. Artefatos `*smoke*` em `operacao/` são opcionais.

Requer PowerShell 5+ no Windows. Caminhos relativos à raiz `SamsTechSolucoes-Agentes`.

A solicitação semanal apenas abre uma tarefa local para o Engenheiro. Ela não
faz upload, não envia mensagem e não armazena credenciais.
