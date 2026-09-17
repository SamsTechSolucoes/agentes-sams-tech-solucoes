# Fase 1 — Secretária (operacional local)

Documento curto. Detalhe completo: [fase-1-mvp-secretaria.md](./fase-1-mvp-secretaria.md).

**Status:** em consolidação (papéis + pastas + scripts locais).  
**Autorização de envio externo:** **não** — só rascunhos em `fila-aprovacoes/`.

## O que está sólido

- Ficha: `empresa/fichas/01-secretaria.md`
- Pastas: `operacao/tarefas|lembretes|registros|fila-aprovacoes`
- Scripts: `scripts/novo-*.ps1`, `scripts/listar-pendencias.ps1`
- Templates: `templates/`

## Como testar (Samuel)

1. Abrir a pasta `SamsTechSolucoes-Agentes` no Cursor.
2. Pedir à Secretária: “cria uma tarefa X” / “lembrete Y” / “rascunho de mensagem Z”.
3. Ou rodar:
   ```powershell
   .\scripts\novo-tarefa.ps1 -Titulo "Teste Fase 1"
   .\scripts\listar-pendencias.ps1
   ```
4. Confirmar que **nenhuma** mensagem sai sozinha.
5. Preservar o lembrete real `operacao/lembretes/20260917-0222-desligar-torneira.md`.

## Critério para fechar Fase 1

- [ ] Samuel usou Secretária em rotina real (tarefas + lembretes)
- [ ] Formatos markdown batem com a ficha 01 (ajustar scripts se necessário)
- [ ] Samuel autoriza explicitamente início da Fase 2

## Não fazer ainda

- WhatsApp/e-mail reais
- Ligar APIs do nf-stream-analyze
- Ativar papéis 02–07 ao vivo
