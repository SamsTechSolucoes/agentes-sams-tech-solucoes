# Integridade — Fases, ferramentas e o que falta

**Data:** 2026-09-17 06:15 (America/Sao_Paulo)  
**Autor:** Engenheiro Principal (`SamsTechEngineer`)  
**Escopo:** só `SamsTechSolucoes-Agentes` (+ leitura MCP; sem alterar `nf-stream-analyze`)

## 1. Resumo executivo

| Área | Situação |
|---|---|
| Fase 1 (Secretária local + scripts) | **Funcionando** — smoke PASS |
| Ferramentas Cursor do Engenheiro | **Gmail, Calendar, Drive, Slack, Supabase = OK** |
| WhatsApp “WebZap” no Cursor | **Não há MCP WhatsApp** |
| WhatsApp no sistema de NF | **Existe no Supabase** (sessões/campanhas/bulk) — código no `nf-stream-analyze` (intocado) |
| Instância web de acompanhamento | **Painel Drive + GitHub** (links abaixo) |
| “Tudo funcionando” ponta a ponta | **Não** — falta autorizar ponte Agents ↔ NF/WhatsApp e testes A–C da Secretária |

## 2. Fases

| Fase | Status | Evidência |
|---|---|---|
| 0 Fundação | Parcial | Decisões SoT/comissões ainda em `PENDENTE-fase0-checklist.md` |
| 1 Secretária MVP | Pronta (local) | Ficha, pastas, scripts, smoke PASS 06:11 |
| 2 Comercial | Esqueleto | `fase-2-comercial-ATIVACAO.md` — aguarda OK após A–C |
| 3 NF alinhada V2 | Não iniciada | Requer `nf-stream` + política e-mail |
| 4 Google Sheets espelho | Não iniciada | Drive/Gmail já autenticados; sync não feito |
| 5 Produtos / estoque | Esqueleto local | Sem integração |
| 6 Financeiro real | Esqueleto | Sem regra oficial de comissão |
| 7 Inteligência | Esqueleto | Templates fato≠interpretação |
| 8 Gestor + equipe viva | Scaffolding | Fichas existem; Bots sem Cursor |
| 9 Gmail/Agenda na Secretária | Bloqueado | MCPs OK no Engenheiro; Secretária sem Cursor |

## 3. Testes executados agora

```text
validar-estrutura.ps1 → 24/24 OK
smoke-test-fase1.ps1  → PASS (tarefa + lembrete + rascunho sem envio)
listar-pendencias.ps1 → OK
Artefatos smoke → movidos para operacao/_exemplos/
```

## 4. Ferramentas / conectores (teste real)

| Conector | Status | Observação |
|---|---|---|
| Gmail | OK | Inbox acessível (`sams.tech.solucoes`) |
| Google Calendar | OK | Calendário principal listado |
| Google Drive | OK | Leitura + criação do painel |
| Slack | OK | Workspace `samstechsolucoes` |
| Supabase | OK | `clients` 941, `invoices` 1428, `reminders` 151, WhatsApp tables presentes |
| WhatsApp MCP Cursor | Ausente | Envio não disponível neste chat |
| Baileys / Evolution no NF | Fora desta pasta | Tabelas `whatsapp_sessions` (1), `bulk_sends` (133), etc. |

**Quem pode usar Cursor/MCP hoje:** só Engenheiro Principal (decisão 2026-09-17).

## 5. WhatsApp — o que é verdade

1. No **Agents**, o fluxo correto hoje é: **rascunho** em `operacao/fila-aprovacoes/` → OK do Samuel → envio **manual** ou via sistema de NF.
2. O envio automatizado (WebZap / Baileys / Evolution / campanhas) vive no **nf-stream-analyze** + tabelas Supabase — **não** foi alterado.
3. Para “concluir integração real WhatsApp” neste projeto Agents, Samuel precisa autorizar **explicitamente**:
   - leitura do código/API do NF (e/ou endpoints), e
   - política de envio (sempre com aprovação humana na Fase 1).

Sem isso, inventar um segundo WhatsApp aqui seria arquitetura paralela proibida.

## 6. Instância web para acompanhar

| Canal | URL / caminho |
|---|---|
| Painel Drive (ao vivo) | https://docs.google.com/document/d/1i_dHYla1wpAWrXPtI_g9oTunBZtPs6Sl8Wc1T3hYl9M/edit |
| GitHub (código) | https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes |
| Cursor Web | Open Folder / Open in Cursor no repo acima — ver `ABRIR-NO-CURSOR.md` e `WEB-ACOMPANHAMENTO.md` |
| App Grok Bot | Download oficial: https://cursor.com/download/bot — guia `ABRIR-GROK-BOT.md` |
| Comandos ao Engenheiro | Chat **SamsTech Engineer** no **app** Grok Bot → Cursor. Ambientes já ok. |
| Testes Secretária | Chat **Secretaria SamsTech** no app Grok Bot — piloto A–C **concluído** (16/09) |

## 7. O que falta para testes reais seus (checklist)

- [x] Testes A–C no chat da Secretária (tarefa, lembrete, rascunho sem envio) — piloto 16/09
- [ ] Confirmar se a Secretária **grava arquivos** ou só responde em texto (sem Cursor ela pode só conversar)
- [ ] Autorizar **leitura** do `nf-stream-analyze` para mapear WhatsApp
- [ ] Autorizar **um envio piloto** WhatsApp (número seu / teste) via NF — ou negar e manter só fila
- [ ] Fechar 3 dores da v1 + horário do resumo matinal
- [ ] Decidir se Secretária ganha Cursor depois da Fase 1 estável

## 8. Próximas ações do Engenheiro (quando você autorizar)

1. Inspecionar (somente leitura) fluxo WhatsApp no NF + `whatsapp_sessions`.
2. Documentar ponte Agents → fila → envio aprovado no NF.
3. Ativar Fase 2 comercial local (sem envio).
4. Playbook Engenheiro: Gmail/Agenda **leitura** para resumo matinal (sem limpar caixa sozinho).
