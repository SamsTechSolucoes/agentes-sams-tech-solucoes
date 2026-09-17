# Acompanhamento web + comandos ao Engenheiro

## Objetivo
Samuel acompanha a configuração pela web e dá comandos ao Engenheiro Principal para acelerar — sem misturar com o sistema de NF.

## Canal oficial (17/09/2026)
Ambientes Cursor **já configurados** — não reconfigurar. Cursor no PC aberto em `SamsTechSolucoes-Agentes`.  
O app da equipe é o **Grok Bot** (programa separado do Cursor). Download: `ABRIR-GROK-BOT.md` → https://cursor.com/download/bot  
Samuel fala no Grok Bot **SamsTech Engineer**. Execução: Cursor no PC ou Cloud Agent deste repo.

- Decisão: `Documentação/decisoes/2026-09-17-comando-engenheiro-via-grok.md`
- Runbook comando: `Documentação/runbooks/comandar-engenheiro-grok.md`
- Runbook instalação: `Documentação/runbooks/baixar-grok-bot.md`
- Texto para colar: `templates/comando-engenheiro.md`

## 1. Painel ao vivo (Google Docs)
https://docs.google.com/document/d/1i_dHYla1wpAWrXPtI_g9oTunBZtPs6Sl8Wc1T3hYl9M/edit

O Engenheiro atualiza este painel quando houver mudança de fase/ferramenta.

## 2. Código no GitHub
https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes

## 3. Abrir no Cursor (desktop ou web)
1. File → Open Folder → `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`  
   **ou** abrir o repo GitHub no Cursor Web / Cloud Agent.
2. Confirme no Source Control: `agentes-sams-tech-solucoes` (não `nf-stream-analyze`).
3. Chat do Engenheiro: Grok Bot **SamsTech Engineer** (colar o pedido) e, se precisar de arquivo/git, o Cursor já aberto. Modelo: `templates/comando-engenheiro.md`.

## 4. Como comandar em paralelo
| Você quer… | Onde falar |
|---|---|
| Conversar com a equipe (Secretária, Engineer) | App **Grok Bot** — baixar em `ABRIR-GROK-BOT.md` |
| Dar ordem ao Engenheiro | **SamsTech Engineer** no Grok Bot → execução no Cursor |
| Git / PR / arquivos agora | Cursor no PC ou Cloud Agent (`cursor.com/agents` / Slack `@cursor`) |
| Testar rotina diária | **Secretaria SamsTech** no Grok Bot |
| Ver status sem IDE | **Painel Drive** (link acima) |

## 5. Regras
- Só o Engenheiro usa Cursor/MCP por enquanto.
- Envio WhatsApp / e-mail externo: só com OK explícito.
- Não alterar `nf-stream-analyze` sem permissão nova.
