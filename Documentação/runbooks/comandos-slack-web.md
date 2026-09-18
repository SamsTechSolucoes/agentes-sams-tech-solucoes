# Runbook — Slack no Grok Bot (atualizado)

## Importante
- O menu **⋯ / botão direito** na barra lateral (**Fixar, Renomear, Editar perfil…**) **não** tem Channels.
- O painel direito **Configurações / Editar perfil** (nome, rótulo, descrição) também **não** é Channels.
- **Slack MCP** no Cursor já pode estar ok. **Channels** é opcional (comando pelo Slack Web acordando o bot).

## Caminho A — Channels (se existir na sua versão)

1. Abra o chat do bot (ex.: SamsTech Engenheiro Principal).
2. No **centro**, no **topo da conversa**, clique no **nome do bot** (header do chat — não na lista da esquerda).
3. Procure abas: Perfil / **Channels** / etc.
4. Se aparecer **Channels** → **Slack** → conectar.
5. Repita na **Secretária SamsTech**.

Atalho citado em algumas versões: `Cmd+Shift+I` / `Ctrl+Shift+I` com o chat aberto.

## Caminho B — Plugins (oficial Cursor; use se não achar Channels)

Documentação: https://cursor.com/help/grok-bot/connect-plugins

### No PC (Grok Bot)
1. Na **barra lateral**, clique em **Plugins** (não no menu ⋯ do bot).
2. Busque **Slack** → **Add** / Instalar.
3. **Authorize** / Authenticate no navegador.
4. Confirme em **Installed**.

### No celular
1. Toque no **avatar** (canto superior esquerdo).
2. **Plugins** → Slack → autorizar.

Um plugin instalado vale para **todos** os bots da conta.

## Depois
1. Abra https://app.slack.com
2. DM para você mesmo ou canal da SamsTech.
3. No Grok, diga: `Slack Channels ok` **só se** o Channels ficou verde.
4. Se só instalou Plugin: diga `Slack Plugin ok` — o Engenheiro no Cursor já testa MCP.

## Se Channels sumiu da UI
Não force. Use **Plugins → Slack**. Channels pode não existir na sua build; não bloqueia o projeto.
