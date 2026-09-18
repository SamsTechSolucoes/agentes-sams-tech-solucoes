# Decisão pendente — Ponte WhatsApp / NF

**Data:** 2026-09-17  
**Contexto:** Samuel pediu concluir integrações reais WhatsApp e serviços já vinculados.

## Fatos (não decisões)
- Cursor Agents **não** tem MCP WhatsApp.
- Supabase já tem tabelas WhatsApp (`whatsapp_sessions`=1 linha, bulk_sends, campanhas, etc.).
- O código de envio está no `nf-stream-analyze` (proibido alterar sem OK).
- Gmail, Calendar, Drive, Slack e Supabase já autenticam no Engenheiro.

## Já decidido (parcial)
- [x] Canal WhatsApp **Engenheiro ↔ Samuel (pessoal)**, contato mantido fora do Git, via WA Web no Grok Bot — `2026-09-17-whatsapp-engenheiro-samuel.md`
- [x] Mandato: Engenheiro executa; Samuel só autoriza acessos — `2026-09-17-engenheiro-executa-samuel-autoriza.md`
- [x] Ponte local `operacao/fontes/` criada (sem leitura de linha)

## Ainda precisa autorizar (pacote v1 — um clique no chat)
- [x] **S1** — Leitura Supabase (clientes, NFs, lembretes). Sem escrita. Pasta local da Secretária em `operacao/secretaria/sistema-nf/` (PII fora do git). Decisão: `2026-09-17-export-nf-pasta-secretaria.md`.
- [x] **S2** — Gmail + Agenda lidos para resumo; sem resposta/processamento.
- [x] **S3** — Resumo executivo publicado no Drive; Sheets não é SoT.
- [x] **B1** — `nf-stream-analyze` inspecionado somente em leitura; mapeamento em `arquitetura/ponte-whatsapp-nf-b1.md`.
- [ ] **B1+envio** — Além de B1, **um envio piloto** para número de teste, só após rascunho + OK.
- [ ] **Negar ponte NF** — WhatsApp de clientes continua só no app de NF / manual.

## Serviços Google/Slack
Já vinculados ao Engenheiro. Secretária **não** ganha Cursor por esta lista.
