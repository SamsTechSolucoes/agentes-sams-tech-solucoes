# Playbook — Follow-up comercial (scaffolding)

**Status:** **scaffolding only.** Fase 2 **não** está ao vivo.  
**Ficha:** `empresa/fichas/03-comercial.md`  
**Template:** [`templates/follow-up-comercial.md`](../../templates/follow-up-comercial.md)  
**Pasta (vazia de propósito):** `operacao/comercial/follow-ups/`

Não enviar. Não inventar comissão %, preço, histórico de compras ou lista de inativos.

---

## Quando usar (depois que Samuel autorizar Fase 2)

1. Abrir o template `templates/follow-up-comercial.md`.
2. Copiar para `operacao/comercial/follow-ups/YYYYMMDD-<cliente>.md` (sem inventar cliente).
3. Preencher só o que Samuel informou. Buracos = `PENDENTE SAMUEL`.
4. Mensagem ao cliente → **copiar** para `operacao/fila-aprovacoes/` (nunca enviar daqui).
5. Esperar OK explícito.

Até lá: este arquivo documenta o trilho. Não opera carteira de verdade.

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

## Fora de escopo (agora)

| Proibido | Motivo |
|---|---|
| Envio WhatsApp / e-mail | só fila + OK |
| Inventar comissão % | **PENDENTE SAMUEL** |
| Inventar inativos / histórico | sem fonte |
| Ler banco do sistema de NF | repo/sistema externos |
| Scraping / disparo em massa | recusado |

Handoff Secretária → Comercial: `Documentação/playbooks/handoff-secretaria-comercial.md`.
