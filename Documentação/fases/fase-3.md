# Fase 3 — Notas fiscais alinhadas à V2 (papel)

**Status:** stub. **Não implementar.** Sistema de NF é **externo**.  
**Fonte:** `Documentação/Plano_Implementacao_Fases_V2.md` (Fase 3) e V2 §9.

## Objetivo
Fechar o loop NF → cliente → histórico/faturamento → alerta **reusando o SaaS existente**, sem reconstruir pipeline neste repo.

## Funcionalidades (quando autorizado *e* com permissão no repo de NF)
Manter upload (Samuel) + extração/validação; alertas pós-NF; política de e-mail documentada.

## Arquivos
Neste repo: playbook `Documentação/playbooks/notas-fiscais.md`.  
`nf-stream-analyze`: **proibido** até permissão explícita.

## Dados / Integrações / Dependências
invoices, invoice_items, clients (no sistema externo). Gemini já no produto. Depende de Fases 0–1 e da política de e-mail.

## Riscos / Testes / Critérios
Custo Gemini em picos; duplicidade. Testes só no repo de NF se Samuel autorizar. Critério: pipeline estável + alertas mínimos **sem** este agente tocar aquele git.

## Decisões Samuel
Secretária pode ou não puxar NF do e-mail na v1; thresholds de alerta. **PENDENTE SAMUEL.**
