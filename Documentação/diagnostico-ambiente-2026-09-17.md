# Diagnóstico de ambiente — 17/09/2026

Snapshot técnico para o Engenheiro Principal. **Não é autorização para implementar produto.**

Classificação usada em todo o documento:

| Rótulo | Significado |
|---|---|
| **EXISTENTE E FUNCIONANDO** | Há evidência de uso/estrutura; preservar. |
| **EXISTENTE E PRECISA SER ADAPTADA** | Existe, mas operação, higiene ou forma não servem como estão. |
| **EXISTENTE E PROVAVELMENTE SERÁ SUBSTITUÍDA** | Existe; não tratar como núcleo durável. |
| **NÃO EXISTE** | Ausente no inventário. |
| **NÃO FOI POSSÍVEL VALIDAR** | Inventário cita, mas este ambiente não confirmou de forma independente. |

Nenhum valor de segredo é reproduzido neste arquivo.

## 1. Método e limites desta sessão (Cloud Agent)

Fonte principal: inventário fornecido para preparação do ambiente (17/09/2026), cruzado com o handoff em `docs/conversa-handoff-15-09-2026.md` e `AMANHA.md`.

Validação independente **neste** agente:

- Clone de trabalho: só `agentes-sams-tech-solucoes` (este repo).
- GitHub visível ao token: este repo (privado) e `Dia-a-Dia` (público, git vazio, size 0).
- `nf-stream-analyze` e os demais privados **não** foram clonados (proibido tocar o código) e **não** responderam a este token (`404` / fora da lista).

Portanto: áreas do produto abaixo herdam a classificação do inventário. Onde este agente não abriu o git tree, isso está anotado.

**Desktop local do Samuel (não acessível daqui):** checkout de `nf-stream-analyze`; pasta de staging não-git `SamsTechSolucoes-Agentes` (com AGENTS + `.cursor`); material `Regras-Gerais-de-desinvolvimento`. Caminho de handoff já citado: `C:\Users\notebook\Desktop\Projeto Agentes Sams.Tech.Solucoes`.

## 2. Repositórios da organização

| Repositório | Papel | Classificação |
|---|---|---|
| [nf-stream-analyze](https://github.com/SamsTechSolucoes/nf-stream-analyze) | Produto principal. Privado. TS/React/Vite. Vercel: https://nf-stream-analyze.vercel.app. Inventário: ~2196 blobs. | **EXISTENTE E FUNCIONANDO** (produto). Acesso git **NÃO FOI POSSÍVEL VALIDAR** neste agente. |
| [agentes-sams-tech-solucoes](https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes) | Este repo. Agentes/docs. | **EXISTENTE E FUNCIONANDO** (docs/handoff). Até 17/09 só havia `README.md`, `AMANHA.md`, `docs/conversa-handoff-15-09-2026.md`. |
| neon-flow | Protótipo Lovable de UI WhatsApp. Satélite, não núcleo. | **EXISTENTE E PROVAVELMENTE SERÁ SUBSTITUÍDA**. Independente: **NÃO FOI POSSÍVEL VALIDAR**. |
| prospecta-b2b-lead-finder | Busca de leads B2B (Lovable). Satélite. | **EXISTENTE E PROVAVELMENTE SERÁ SUBSTITUÍDA** (satélite). Independente: **NÃO FOI POSSÍVEL VALIDAR**. |
| baileys-whatsapp-server- | Repo separado de Baileys; inventário descreve como vazio. | **EXISTENTE E PRECISA SER ADAPTADA** no conjunto WhatsApp (repo vazio; ops no produto). Independente: **NÃO FOI POSSÍVEL VALIDAR**. |
| [Dia-a-Dia](https://github.com/SamsTechSolucoes/Dia-a-Dia) | Canal público de P&D. | **EXISTENTE E FUNCIONANDO** como canal; **conteúdo git vazio** (confirmado: repositório empty). |

## 3. Áreas do nf-stream-analyze

Inventário do produto. Código **não** foi alterado nem inspecionado arquivo a arquivo nesta sessão.

| Área | Stack / notas | Classificação |
|---|---|---|
| Frontend | React + TypeScript + Vite + shadcn + Tailwind + React Query. Páginas: Index, Clients, Catalog, Reminders, Campaigns, BulkSend, WhatsAppSessions, Alerts, etc. | **EXISTENTE E FUNCIONANDO** |
| Backend | Supabase Edge Functions: `process-invoice`, `process-bulk-send`, `manage-whatsapp-session`, `send-whatsapp-message`, `create-campaign`, `health`, `process-reminder-notifications`, `transcribe-invoice`, etc. | **EXISTENTE E FUNCIONANDO** |
| Banco | PostgreSQL + RLS + migrations. Tabelas: clients, invoices, invoice_items, reminders, catalogs, campaigns, … | **EXISTENTE E FUNCIONANDO** |
| Auth | Supabase Auth | **EXISTENTE E FUNCIONANDO** |
| Storage | Buckets de invoices / avatars / catalog | **EXISTENTE E FUNCIONANDO** |
| WhatsApp / Baileys | `baileys-server/` + edge functions; docs de Railway / Hostinger / Render; anti-ban; repo Baileys separado vazio | **EXISTENTE E PRECISA SER ADAPTADA** (complexidade operacional) |
| NF / PDF | pdf-parse, pdfjs, `process-invoice` com Gemini | **EXISTENTE E FUNCIONANDO** |
| Catálogo / promoções | | **EXISTENTE E FUNCIONANDO** |
| Clientes / analytics | | **EXISTENTE E FUNCIONANDO** |
| Dashboards | | **EXISTENTE E FUNCIONANDO** |
| Alertas / lembretes | | **EXISTENTE E FUNCIONANDO** |
| Docs `docs/` no produto | Volume grande, espalhado; muitos MD na raiz | **EXISTENTE E PRECISA SER ADAPTADA** |
| Testes Vitest | Estrutura básica | **EXISTENTE E PRECISA SER ADAPTADA** |
| CI | `.github/workflows` | **EXISTENTE E FUNCIONANDO** |
| Deploy | Vercel + Lovable | **EXISTENTE E FUNCIONANDO** |
| `AGENTS.md` no produto | Inventário: só `.cursor/rules/regras.mdc` | **NÃO EXISTE** |
| Higiene de segredos | `.env*` e `Tokens & Keys.txt` aparentam estar no git tree | **EXISTENTE E PRECISA SER ADAPTADA** — ver §4 |

Números operacionais citados no handoff 15/09/2026 (Supabase, não revalidados aqui): 1 usuário, 1.428 NFs, 941 clientes (925 com telefone). Não copiar dados pessoais para novos arquivos além dessa referência já pública no handoff.

## 4. Achado crítico — segredos no git tree do produto

**Classificação:** **EXISTENTE E PRECISA SER ADAPTADA** (segurança).

O inventário indica que `.env*` e `Tokens & Keys.txt` aparecem no histórico/árvore do `nf-stream-analyze`.

O que o Engenheiro Principal deve fazer se trabalhar nesse repo no futuro (somente com autorização):

- **não** imprimir, colar ou commitar valores;
- tratar rotação e remoção do histórico como decisão do Samuel (custo + produção);
- nunca copiar esses arquivos para `agentes-sams-tech-solucoes`.

Este repositório de agentes **não** contém esses arquivos.

## 5. Desktop local (Samuel)

| Item | Nota | Classificação |
|---|---|---|
| Checkout `nf-stream-analyze` | Máquina do Samuel | **NÃO FOI POSSÍVEL VALIDAR** da nuvem |
| `SamsTechSolucoes-Agentes` | Staging **não-git** com AGENTS + `.cursor` | **EXISTENTE E PRECISA SER ADAPTADA** (material a consolidar neste repo git) |
| `Regras-Gerais-de-desinvolvimento` | Material de regras de desenvolvimento | **EXISTENTE E PRECISA SER ADAPTADA** (absorver princípios na diretriz; não duplicar segredos) |

## 6. Este repo após a preparação de 17/09/2026

Objetivo cumprido nesta leva: esqueleto durável de instruções (`AGENTS.md`, `.cursor/rules/`, `Documentação/`).

| Item | Classificação |
|---|---|
| Handoff Fase 0 (`AMANHA.md`, `docs/conversa-handoff-15-09-2026.md`) | **EXISTENTE E FUNCIONANDO** (preservado) |
| Diretriz Engenheiro Principal | passou a existir neste repo |
| Documento oficial de arquitetura do Samuel | **EXISTENTE E PRECISA SER ADAPTADA** — V2 versionada em `Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md` (índice oficial 16/09; corpo corrido integral ainda não chegou a este git) |
| Features de produto implementadas daqui | **NÃO EXISTE** — e não devem existir até plano por fases + autorização |

## 7. Implicações para o próximo agente

1. Não implementar produto.
2. Não clonar/editar `nf-stream-analyze` “para adiantar”.
3. Não inventar o corpo da Arquitetura V2. Fonte: `Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md`. Implementação só após plano por fases + autorização.
4. WhatsApp/Baileys e higiene de segredos são as adaptações mais sensíveis — só com plano aprovado.
5. Satélites Lovable não viram núcleo por inércia.
