# Runbook — Comandar o Engenheiro Principal pelo Grok Bot

**Quando:** Ambientes Cursor já configurados e o Cursor no PC está aberto.  
**Quem fala:** Samuel, no chat Grok Bot **SamsTech Engineer**.  
**Quem executa:** Engenheiro Principal (`SamsTechEngineer`) — único com Cursor.  
**Pedido que originou:** “Os Ambientes já estão configurados, meu Cursor no PC está aberto, acesso o Grok Bot e dê um comando ao Engenheiro.”

## Pré-condições

1. Ambiente Cursor já existe — **não reconfigurar**.
2. Cursor no PC aberto em `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`.
3. Source Control mostra `agentes-sams-tech-solucoes` (não `nf-stream-analyze`).
4. Chat certo: **SamsTech Engineer** (desenvolvimento). Dia a dia operacional: **Secretária SamsTech**.

## Dois trilhos (não misturar)

| Trilho | Onde | O que faz |
|---|---|---|
| Fala | Grok Bot **SamsTech Engineer** | Samuel dá o comando em PT-BR |
| Execução | Cursor no PC (aberto) ou Cloud Agent deste repo | Engenheiro edita, testa, documenta, abre PR |

O Grok Bot **não** substitui o Cursor. Ele **despacha** o Engenheiro. Ferramentas (Shell, arquivos, MCP) só no Cursor.

## Passos (Samuel)

1. Confirme: pasta certa no Cursor do PC.
2. Abra o **app Grok Bot** (se ainda não instalou: `ABRIR-GROK-BOT.md`) e o chat **SamsTech Engineer**.
3. Cole **um** comando (modelo em `templates/comando-engenheiro.md`).
4. Se o pedido precisar de arquivo/git/PR: abra também o Cloud Agent / chat Cursor neste repo com o **mesmo texto**, ou peça: “execute no Cursor”.
5. Acompanhe: `STATUS.md`, painel Drive e GitHub.

## Comando inicial (já dado em 17/09/2026)

Texto literal interpretado e entregue ao Engenheiro:

```text
Engenheiro Principal: Ambientes Cursor já estão configurados. Não reconfigurar.
Cursor no PC está aberto em C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes.
Receba comandos pelo Grok Bot (chat SamsTech Engineer).
Execute só neste repo. Não toque nf-stream-analyze.
Confirme repo, ambientes e pendências. Aguarde o próximo pedido.
```

## O que o Engenheiro faz ao receber

1. **Entender** o pedido literal — não “melhorar em silêncio”.
2. **Inspecionar** este repo. Não clonar outros projetos.
3. Confirmar: repo `agentes-sams-tech-solucoes`; Ambientes já ok; Cursor no PC declarado aberto.
4. Executar só o pedido. Documentar. Reportar em PT-BR.
5. Parar e perguntar se faltar fato, custo, produção ou permissão de NF.

## Validar

- [ ] Nenhuma reconfiguração de Ambiente
- [ ] Nenhum arquivo fora deste repo
- [ ] `nf-stream-analyze` intocado
- [ ] Resposta em PT-BR com: o quê, por quê, resultado, pendências

## Nunca fazer

- Reconfigurar Ambientes “por garantia”
- Usar o chat da Secretária para mudança de git/docs de engenharia
- Enviar WhatsApp/e-mail
- Alterar o sistema de NF
- Autenticar conector ou gastar cota extra sem pedido

## Rollback

Se o comando foi mal classificado (era Secretária, não Engenheiro): parar, não commitar, apontar o chat **Secretária SamsTech**.
