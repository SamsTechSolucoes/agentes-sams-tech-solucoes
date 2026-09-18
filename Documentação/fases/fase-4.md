# Fase 4 — Camada Google (Drive / Sheets)

**Status:** **PARCIAL** — Drive/Docs em uso; Sheets e sincronização não iniciados.  
Detalhe completo: `Documentação/Plano_Implementacao_Fases_V2.md` (FASE 4).  
V2 §10: `Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md`.

Este arquivo **não** é um índice incompleto. O plano-mãe já tem as seções pedidas.

## Neste repo (hoje)

Gmail e Calendar foram consultados em leitura pelo Engenheiro (S2). O Drive
recebeu o resumo executivo S3 e a estrutura de pastas. Sheets, workbook e
sincronização com o Supabase não foram ativados.

Decisão vigente: Supabase = fonte da verdade operacional; Sheets = espelho
analítico futuro.

## Condição para sair do papel

1. Definir a estrutura das abas e a frequência de sincronização.
2. Autorizar explicitamente o workbook/Sheets.
3. Validar amostra Sheet ↔ Supabase sem editar a fonte da verdade.

## Não fazer

- Duplicar verdade no Sheet
- Ligar conector “para adiantar”
