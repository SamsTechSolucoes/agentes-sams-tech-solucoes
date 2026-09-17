# Decisão pendente — Ponte WhatsApp / NF

**Data:** 2026-09-17  
**Contexto:** Samuel pediu concluir integrações reais WhatsApp e serviços já vinculados.

## Fatos (não decisões)
- Cursor Agents **não** tem MCP WhatsApp.
- Supabase já tem tabelas WhatsApp (`whatsapp_sessions`=1 linha, bulk_sends, campanhas, etc.).
- O código de envio está no `nf-stream-analyze` (proibido alterar sem OK).
- Gmail, Calendar, Drive, Slack e Supabase já autenticam no Engenheiro.

## O que Samuel precisa autorizar (marque um)
- [ ] **B1** — Autorizo o Engenheiro a **inspecionar (somente leitura)** o `nf-stream-analyze` e mapear o fluxo WhatsApp, sem alterar código e sem enviar mensagem.
- [ ] **B1+envio** — Além de B1, autorizo **um envio piloto** para um número de teste meu, só após rascunho na fila + meu OK por mensagem.
- [ ] **Negar por agora** — Manter WhatsApp só como rascunho na fila; envio continua manual no app de NF.

## Serviços Google/Slack
Já vinculados ao Engenheiro. Uso operacional pela Secretária exige outra decisão (Cursor para ela).
