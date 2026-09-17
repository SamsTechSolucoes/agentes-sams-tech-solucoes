# Fase 1 — MVP Secretária Pessoal

**Autorizada:** 2026-09-17  
**Restrição:** somente `SamsTechSolucoes-Agentes`  
**Idioma:** PT-BR  
**Cursor:** só Engenheiro Principal (`SamsTechEngineer`) — demais agentes sem Cursor

## Objetivo
Secretária Pessoal operacional para conversas, tarefas, lembretes e registros.

## Entregue
- Ficha + constituição comum + glossário PT-BR
- Fichas da equipe (Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução) — esqueleto, sem Cursor
- Pastas operacionais + exemplos `EXEMPLO-*`
- Playbooks e scripts (`scripts/`)
- Runbook `Documentação/runbooks/secretaria-fase1.md`
- Decisão Cursor: `Documentação/decisoes/2026-09-17-cursor-somente-engenheiro-e-termos-ptbr.md`

## Validação automática (Engenheiro Principal)
- Piloto tarefa / lembrete / fila WhatsApp (sem envio)
- Scripts: `validar-estrutura.ps1`, `listar-pendencias.ps1`, `resumo-matinal.ps1`

## Validação pendente (Samuel)
Testar a Secretária Pessoal nos 3 pedidos piloto (sem esperar que ela use Cursor).

## Não fazer ainda
Fase 2 integrada, sistema de NF, envio real, dar Cursor a outros agentes.
