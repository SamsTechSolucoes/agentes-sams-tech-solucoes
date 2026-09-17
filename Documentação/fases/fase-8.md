# Fase 8 — Gestor + Central de Aprovações + equipe (papel)

**Status:** stub. Fichas 02 e 07 prontas em papel; **não ao vivo**.  
**Fonte:** Plano Fase 8 e V2 §§3–5.

## Objetivo
Secretária não faz tudo: Gestor decompõe/delega; aprovações centralizadas.

## Funcionalidades
Gestor: decomposição e handoff; Central de Aprovações (enviar, cobrar, cancelar, alterar crítico); demais papéis sob o Gestor; Evolução só sugere agentes.

## Arquivos / Dados / Integrações
`empresa/fichas/02-gestor.md`, `07-evolucao.md`, `operacao/gestor/`, `operacao/central-aprovacoes/`, `operacao/fila-aprovacoes/`.

## Dependências / Riscos / Testes / Critérios
Fases 1–7 mínimas estáveis; orçamento de Bots no Pro. Risco: custo e falha de handoff. Critério: 1 fluxo multiagente com aprovação registrada; nenhum agente novo sem OK.

## Decisões Samuel
Quais papéis criar na ordem; limite Pro / on-demand = 0. **PENDENTE SAMUEL.**
