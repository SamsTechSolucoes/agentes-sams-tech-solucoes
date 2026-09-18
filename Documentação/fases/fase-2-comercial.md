# Fase 2 — Comercial

**Status:** **ATIVA EM MODO LOCAL**, autorizada por Samuel em 17/09/2026.

## Pré-requisitos

1. Fase 1 validada por Samuel — **concluído**.
2. Autorização explícita para avançar — **concluído em 17/09/2026**.
3. Inatividade definida em 60 dias; segmentação e comissão permanecem pendentes.

## Entregue

- Ficha `03-comercial.md`
- Pastas `operacao/comercial/{carteira,follow-ups,inativos}/` (READMEs)
- Template `templates/follow-up.md`
- Script `scripts/novo-followup-comercial.ps1`
- Listagem de follow-ups em `scripts/listar-pendencias.ps1`
- Teste `scripts/smoke-test-fase2-comercial.ps1`

## Fluxo ativo

1. Listar follow-ups abertos no início do dia — **só local**.
2. Todo contato externo vira rascunho em `fila-aprovacoes/`.
3. Samuel aprova/edita/recusa; nenhum envio automático.
4. Conector só será discutido com autorização separada.

## Explicitamente fora até nova autorização

- Disparo em massa, scraping, promessas comerciais inventadas.
