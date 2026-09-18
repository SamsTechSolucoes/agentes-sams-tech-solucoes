# Status das fontes (Engenheiro)

**Atualizado:** 2026-09-18 02:05  
Leitura operacional de linhas: **LIBERADA (S1)** para a pasta da Secretária `operacao/secretaria/sistema-nf/` (PII fora do git).  
Gmail/Agenda (S2), Drive resumo (S3) e B1 (código NF) foram concluídos nos
limites autorizados: leitura, publicação do resumo e mapeamento sem alteração.

## Conectores já autenticados no Cursor do Engenheiro

| Fonte | Auth MCP | Uso liberado agora |
|---|---|---|
| Supabase | sim | **S1** — pasta da Secretária (sem escrita) |
| Gmail | sim | leitura pelo Engenheiro para resumo; sem envio |
| Google Calendar | sim | leitura pelo Engenheiro; sem alteração |
| Google Drive | sim | resumo executivo S3 publicado; Sheets não ativo |
| Slack | sim | canal interno; não substitui aprovação |
| WhatsApp clientes | não (MCP inexistente no Cursor) | rascunho local |
| WhatsApp 1:1 Samuel | sessão no Grok Engineer | já autorizado à parte |

## Metadado Supabase (public) — sem conteúdo de cliente

Inventário por `list_tables` em 17/09/2026. RLS ligado nas tabelas abaixo.

| Tabela | Linhas (total) | Papel na v1 |
|---|---|---|
| clients | 941 | carteira (S1) |
| invoices | 1428 | NF (S1) |
| invoice_items | 1543 | itens de NF (S1) |
| reminders | 151 | lembretes do app NF (S1) |
| client_phones | 16 | telefones tipados (S1; não disparar) |
| whatsapp_sessions | 1 | sessão Evolution — **não usar para envio** |
| bulk_sends / bulk_send_contacts | 134 / 8358 | histórico de massa — **não repetir disparo** |
| catalogs / catalog_items / promotions | 0 | Fase 5 (papel) |
| suppliers | 0 | fora da v1 |

## Pastas

- `consultas/` — briefs que podem ir ao git (totais, pedidos, sem dump)
- `privados/` — dados identificáveis; **fora do git**
