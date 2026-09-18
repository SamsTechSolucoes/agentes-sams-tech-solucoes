# DESTRAVAR — SamsTech Engineer (Grok) + WhatsApp

## Diagnóstico (17/09/2026)

Dois problemas diferentes:

| Sintoma | Causa mais comum | O que NÃO fazer |
|---|---|---|
| Chat “enviando…” / sem resposta | **Cota Grok Bot esgotada** (trial ou semanal). A UI muitas vezes **não avisa**. | Reset Agent Computer (pode apagar sessão WA) |
| WA Web conectado mas o bot “não reconhece” | Chat travado **ou** o bot não olhou o browser ainda | Pedir login de novo se a tela já mostra conversas |

Fonte Cursor forum (set/2026): bots silenciosos = Usage; Reset não resolve cota e pode piorar WA.

## Passo A — Samuel (agora, 30s)

1. Grok Bot → **Settings → Usage**
2. Se aparecer trial/included **esgotado**:
   - esperar reset da cota, **ou**
   - ligar on-demand em cursor.com/dashboard (**custa**; só se você autorizar)
3. **Não** clique em Reset Agent Computer enquanto o WA estiver logado.

## Passo B — Se o chat voltar a responder

Cole **só isto** no **SamsTech Engineer**:

```
IGNORE mensagens antigas travadas. Execute agora:

1) Abra o Agent Computer / navegador.
2) Liste as abas. Se houver web.whatsapp.com JÁ logado, USE essa aba — não peça QR.
3) Se não houver aba, abra https://web.whatsapp.com e diga o que aparece (lista de chats OU QR).
4) Com a sessão logada, abra o contato pessoal autorizado de Samuel e envie:

"Olá Samuel — Engenheiro Principal online no canal autorizado. Pode enviar as diretrizes."

5) Responda neste chat: ENVIADO ou BLOQUEIO:<motivo>.
Não invente. Não fale com cliente. Não reset o computador.
```

## Passo C — Enquanto o Grok estiver mudo

Use estes canais (funcionam sem o chat do Engineer no Grok):

| Canal | Uso |
|---|---|
| **Este Cursor** — SamsTech Engineer | desenvolvimento / docs / sync |
| **Slack** DM Samuel | status rápido |
| **Secretária SamsTech** (se responder) | tarefas/lembretes do dia |

WhatsApp pelo Grok só volta quando o bot **responder de novo** + seguir o Passo B.

## Passo D — Se Usage estiver OK e ainda travado

1. Feche e reabra **só o app** Grok Bot (não Reset Computer).
2. Abra um chat **novo** com SamsTech Engineer (não o thread antigo travado) e cole o Passo B.
3. Confira Agent Computer: desktop visível (não ícone de monitor vazio).
4. Se Computer unreachable: **Recover** (não Reset), depois reconecte WA se necessário.
