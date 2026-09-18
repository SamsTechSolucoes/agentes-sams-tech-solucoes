# Integridade — Fases, ferramentas e o que falta

**Atualizado:** 2026-09-18 01:35 (America/Recife)  
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
| V1 operacional | **Utilizável localmente** — Fase 1 validada; Fase 2 local; S1/S2/S3/B1 executados |

## 2. Fases

| Fase | Status | Evidência |
|---|---|---|
| 0 Fundação | Concluída | Supabase SoT; regras comerciais/financeiras seguem como gates de domínio |
| 1 Secretária MVP | Concluída e validada | Ficha, pastas, scripts, S1 e testes humanos |
| 2 Comercial | Ativa localmente | Follow-ups e fila; sem envio |
| 3 NF alinhada V2 | Parcial | Export completo: 893 imagens, 1.513 PDFs; alertas/política e-mail pendentes |
| 4 Google Sheets espelho | Parcial | Drive/Docs ativos; Sheets e sync não feitos |
| 5 Produtos / estoque | Esqueleto local | Sem integração |
| 6 Financeiro real | Esqueleto | Sem regra oficial de comissão |
| 7 Inteligência | Esqueleto | Templates fato≠interpretação |
| 8 Gestor + equipe viva | Recorte local | Handoff + índice da Central; equipe completa ainda não |
| 9 Secretária completa | Parcial | Gmail/Agenda via Engenheiro; Teams/Contacts/áudio pendentes |

## 3. Testes executados agora

```text
validar-estrutura.ps1 → 44/44 OK
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
| WhatsApp MCP Cursor | Ausente | WhatsApp profissional ainda não conectado |
| Teams | Pendente | Canal auxiliar aprovado; login/convite na máquina do agente |
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
| Painel Drive (ao vivo) | Google Doc operacional; identificador fora do Git |
| GitHub (código) | https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes |
| Cursor Web | Open Folder / Open in Cursor no repo acima — ver `ABRIR-NO-CURSOR.md` e `WEB-ACOMPANHAMENTO.md` |
| Comandos ao Engenheiro | Chat **SamsTech Engineer** (este) |
| Testes Secretária | Chat **Secretaria SamsTech** — roteiro `Documentação/TESTES-REAIS-AMANHA.md` |

## 7. Gates restantes

- [x] Testes A–C no chat da Secretária
- [x] Gravação via Engenheiro confirmada; Secretária permanece sem Cursor
- [x] Autorizar **leitura** do `nf-stream-analyze` para mapear WhatsApp
- [ ] Autorizar **um envio piloto** WhatsApp (número seu / teste) via NF — ou negar e manter só fila
- [ ] Fechar 3 dores da v1
- [x] Horário: expediente 06:00–20:00; resumo 08:00
- [ ] Decidir se Secretária ganha Cursor depois da Fase 1 estável

## 8. Próximas ações do Engenheiro (quando você autorizar)

1. Ativar Teams Web na máquina sempre ligada da Secretária e validar convite.
2. Definir escopo do WhatsApp profissional antes do login operacional.
3. Obter respostas de Produtos, Financeiro e Inteligência no Google Doc.
4. Implementar Sheets/Contacts/áudio somente após os respectivos gates.
