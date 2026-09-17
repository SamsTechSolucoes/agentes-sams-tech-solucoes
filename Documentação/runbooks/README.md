# Runbooks

Procedimentos operacionais da SamsTech. **Pasta stub.** Não há processo estável o bastante para Skills/Routines (isso exige aprovação explícita do Samuel).

Quando um procedimento for confirmado, um arquivo por runbook:

`AAAA-MM-DD-nome-do-procedimento.md`

## Modelo

```markdown
# Nome do procedimento

- **Quando usar:**
- **Quem executa:** (Samuel / Engenheiro Principal / outro)
- **Pré-condições:**
- **Passos:** (numerados; sem atalhos que quebrem produção)
- **Como validar:**
- **Rollback / o que fazer se falhar:**
- **O que nunca fazer:**
```

## Não colocar aqui

- Segredos, tokens, `.env`.
- Playbook de disparo em massa ou scraping.
- Instruções de deploy em produção sem aval.

WhatsApp/Baileys está classificado como **EXISTENTE E PRECISA SER ADAPTADA** — qualquer runbook dessa área só depois de decisão de arquitetura/ops.

Diagnóstico: [../diagnostico-ambiente-2026-09-17.md](../diagnostico-ambiente-2026-09-17.md).
