# Agentes Sams.Tech.Soluções

Repositório **privado** e **exclusivo** do projeto SamsTech Agents.  
Não tornar público.

**GitHub (único):** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta local (clone / fonte do dia a dia):** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`

Este GitHub e essa pasta são **o mesmo projeto**. Não use `nf-stream-analyze` nem qualquer outro repositório para o trabalho de Agentes.

## Comece aqui

| Ordem | Arquivo | Para quê |
|---|---|---|
| 1 | [STATUS.md](./STATUS.md) | Briefing da manhã |
| 2 | [AGENTS.md](./AGENTS.md) | Escopo do Engenheiro Principal |
| 3 | [ABRIR-NO-CURSOR.md](./ABRIR-NO-CURSOR.md) | Abrir a pasta certa no Cursor |
| 4 | [ABRIR-GROK-BOT.md](./ABRIR-GROK-BOT.md) | Baixar o app Grok Bot (não é o Cursor) |
| 5 | [WEB-ACOMPANHAMENTO.md](./WEB-ACOMPANHAMENTO.md) | Comandar o Engenheiro pelo Grok Bot |
| 6 | [AMANHA-TESTES.md](./AMANHA-TESTES.md) | Guia rápido dos testes A–C |
| 7 | [Documentação/TESTES-REAIS-AMANHA.md](./Documentação/TESTES-REAIS-AMANHA.md) | Checklist completo da Secretária |
| 8 | [empresa/MAPA-EQUIPE.md](./empresa/MAPA-EQUIPE.md) | Equipe Grok Bot × fichas |
| 9 | [empresa/fichas/01-secretaria.md](./empresa/fichas/01-secretaria.md) | Secretária (Fase 1 operacional) |
| 10 | [Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md](./Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md) | Arquitetura V2 (16/09/2026) |

## Estado em 17/09/2026

- **Engenheiro Principal** ativo neste repo (Cursor só para ele, temporário).
- **Fase 1 — Secretária Pessoal: operacional** (piloto A–C confirmado em 16/09). Sem envio externo autônomo.
- **Equipe Grok criada:** Secretária, Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução + Engineer. Mapa: [empresa/MAPA-EQUIPE.md](./empresa/MAPA-EQUIPE.md). Só a Secretária opera de verdade até o Samuel autorizar o resto.
- **Sistema de NF:** externo. Não alterar `nf-stream-analyze` sem permissão explícita do Samuel.
- **Código de produto:** não vive aqui e **não** deve ser escrito daqui.
- **Arquitetura V2:** texto integral (seções 1–11), não índice curto. Plano fases 0–9 versionado.
- Autonomia noturna 17/09: documentação, fichas, fases, scripts locais — ver [Documentação/decisoes/2026-09-17-autonomia-noturna.md](./Documentação/decisoes/2026-09-17-autonomia-noturna.md).

## Pastas

| Pasta | Conteúdo |
|---|---|
| `AGENTS.md` + `.cursor/rules/` | Identidade do Engenheiro Principal e regras Cursor |
| `empresa/` | Constituição, glossário, [MAPA-EQUIPE.md](./empresa/MAPA-EQUIPE.md), fichas 01–07 |
| `operacao/` | Dia a dia + `_exemplos/` (não são pendência) |
| `AMANHA-TESTES.md` | Guia rápido de amanhã |
| `Documentação/` | Arquitetura V2, plano de fases, decisões, runbooks, playbooks |
| `scripts/` | Helpers PowerShell **locais** (não são o sistema de NF) |
| `templates/` | Markdown em branco |
| `docs/conversa-handoff-15-09-2026.md` | Snapshot histórico 14–15/09/2026 |
| `AMANHA.md` | Handoff da Fase 0 (preservar) |

## O que este repo não é

- Não é o código do NF-Stream-Analyze (https://github.com/SamsTechSolucoes/nf-stream-analyze).
- Não é autorização para merge/deploy de produto, disparo WhatsApp ou limpeza de secrets de outro git.
- Não é a frota Grok Bot da Fase 0 (Jarvis, Alex, …). A V2 e o mapa atual: Secretária, Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução.

## Segurança

Sem segredos, sem `.env` real, sem tokens. Envio WhatsApp/e-mail só depois de aprovação em `operacao/fila-aprovacoes/`.
