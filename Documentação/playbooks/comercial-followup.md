# Playbook — Follow-up comercial

**Status:** **operacional local**, autorizado por Samuel em 17/09/2026.  
**Ficha:** `empresa/fichas/03-comercial.md`  
**Template:** [`templates/follow-up-comercial.md`](../../templates/follow-up-comercial.md)  
**Pasta:** `operacao/comercial/follow-ups/`

Não enviar automaticamente. Não inventar comissão %, preço, histórico de compras ou lista de inativos.

---

## Quando usar

1. Receber cliente, motivo e próxima ação de Samuel/Secretária.
2. Executar `scripts/novo-followup-comercial.ps1` ou copiar o template.
3. Preencher só dados informados. Buracos = `PENDENTE SAMUEL`.
4. Mensagem ao cliente → copiar para `operacao/fila-aprovacoes/`.
5. Esperar OK explícito antes de qualquer envio.
6. Ao concluir a ação, atualizar `status: concluido` e registrar o resultado.

---

## Template

Campos do `templates/follow-up-comercial.md`:

- status: rascunho
- cliente: PENDENTE SAMUEL (nao inventar)
- contato / motivo / proxima_acao
- rascunho_mensagem
- Envio só após OK (copiar para `operacao/fila-aprovacoes`)

Há também `templates/follow-up.md` (formato longo). Preferir **`follow-up-comercial.md`** neste playbook.

---

## Fora de escopo

| Proibido | Motivo |
|---|---|
| Envio WhatsApp / e-mail | só fila + OK |
| Inventar comissão % | **PENDENTE SAMUEL** |
| Inventar inativos / histórico | sem fonte |
| Ler banco do sistema de NF | repo/sistema externos |
| Scraping / disparo em massa | recusado |

Handoff Secretária → Comercial: `Documentação/playbooks/handoff-secretaria-comercial.md`.
