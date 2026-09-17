# Scripts locais (PowerShell)

Helpers **só locais** para a pasta `operacao/`. Não enviam WhatsApp, não chamam API de produção, não leem `.env`.

## Uso (na raiz do projeto Agentes)

```powershell
.\scripts\novo-tarefa.ps1 -Titulo "Ligar fulano" -Descricao "Retornar ligação"
.\scripts\novo-lembrete.ps1 -Titulo "Desligar torneira" -Quando "2026-09-17 07:00"
.\scripts\novo-rascunho-aprovacao.ps1 -Titulo "Aviso cliente X" -Mensagem "Olá..." -Canal whatsapp
.\scripts\listar-pendencias.ps1
```

Requer PowerShell 5+ no Windows. Caminhos relativos à raiz `SamsTechSolucoes-Agentes`.
