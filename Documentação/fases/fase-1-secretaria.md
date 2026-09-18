# Fase 1 — Secretária (operacional local)

**Status:** **concluída e validada** por Samuel em 17/09/2026.  
**Detalhe:** `Documentação/fases/fase-1-mvp-secretaria.md`.  
**Testes reais:** `Documentação/TESTES-REAIS-AMANHA.md`.  
**Autorização de envio externo:** **não** — só rascunhos em `fila-aprovacoes/`.

## O que está sólido

- Ficha: `empresa/fichas/01-secretaria.md`
- Pastas: `operacao/tarefas|lembretes|registros|fila-aprovacoes`
- Scripts: `scripts/novo-*.ps1`, `scripts/listar-pendencias.ps1`, `scripts/smoke-test-fase1.ps1`
- Templates: `templates/`

## Como testar (Samuel)

Siga o checklist: `Documentação/TESTES-REAIS-AMANHA.md`. Resumo:

1. Abrir a pasta certa no Cursor (`ABRIR-NO-CURSOR.md`).
2. Pedir à Secretária: tarefa real / lembrete real / rascunho de mensagem.
3. Ou rodar:
   ```powershell
   .\scripts\novo-tarefa.ps1 -Titulo "Teste Fase 1"
   .\scripts\listar-pendencias.ps1
   ```
4. Confirmar que **nenhuma** mensagem sai sozinha.
5. Preservar o lembrete real `operacao/lembretes/20260917-0222-desligar-torneira.md`.

## Critério para fechar Fase 1

- [x] Samuel usou Secretária em rotina real (tarefas + lembretes + rascunho na fila)
- [x] Formatos markdown validados com a ficha 01
- [x] Samuel autorizou a Fase 2 em modo local

## Limites preservados

- WhatsApp/e-mail reais
- Ligar APIs do nf-stream-analyze
- Ativar Produtos, Financeiro e Inteligência ao vivo sem regras oficiais
