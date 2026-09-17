# Fase 5 — Produtos: estoque + cliente aguardando (papel)

**Status:** stub. Ficha `empresa/fichas/04-produtos.md` = **PENDENTE SAMUEL**.  
**Fonte:** Plano Fase 5 e V2 §11.1.

## Objetivo
Avisar quando entrar produto que o cliente aguarda (notificação idempotente).

## Funcionalidades
Cadastro “aguarda X para cliente Y”; entrada de estoque; aviso à Secretária; equivalências depois.

## Arquivos / Dados / Integrações
Neste repo: ficha 04 + `operacao/produtos/`. Código de estoque no NF: **só com permissão explícita**.

## Dependências / Riscos / Testes / Critérios
Fases 1–3; regras de equivalência. Risco: estoque impreciso. Teste: aguarda → entra → notifica uma vez.

## Decisões Samuel
Como mede “entrada”; equivalências iniciais. **PENDENTE SAMUEL.** Não inventar.
