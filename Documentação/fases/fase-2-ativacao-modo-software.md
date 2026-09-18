# Fase 2 — Comercial / CRM — checklist de ativacao (modo software)

**Status:** ATIVA EM MODO LOCAL (Samuel autorizou em 17/09/2026)
**Data:** 2026-09-17
**Escopo:** so SamsTechSolucoes-Agentes / agentes-sams-tech-solucoes

## Ja pronto (scaffolding)
- [x] Ficha empresa/fichas/03-comercial.md
- [x] Bot Comercial SamsTech
- [x] Pasta operacao/comercial/
- [x] Template templates/follow-up-comercial.md
- [x] Playbook Documentacao/playbooks/comercial-followup.md
- [x] Handoff Documentacao/playbooks/handoff-secretaria-comercial.md
- [x] Canal Ops (Engenheiro+Secretaria+Gestor+Comercial)

## Ativacao
- [x] Fase 1 A-C validada
- [x] Autorizacao explicita para Fase 2 local
- [x] Fonte da carteira: export S1 do Supabase em `operacao/secretaria/sistema-nf/`
- [x] Campos minimos do follow-up (cliente, motivo, proxima acao; demais quando conhecidos)
- [x] Regra de inativo: 60 dias desde a emissão da última NF
- [x] WhatsApp comercial: so via fila-aprovacoes

## Ao ativar (Engenheiro)
1. [x] Atualizar ficha 03 status = operacional
2. [x] Atualizar MAPA-EQUIPE
3. [ ] Samuel colar `COLAR-NO-GROK-COMERCIAL-FASE2.md` no bot Comercial
4. [x] Registrar em operacao/registros/
5. [x] Atualizar STATUS.md
6. [x] Smoke Fase 2 local PASS

## Fora de escopo nesta ativacao
- nf-stream-analyze
- Comissoes % inventadas
- Disparo em massa
