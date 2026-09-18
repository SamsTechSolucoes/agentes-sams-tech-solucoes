# Decisão — Canal WhatsApp Engenheiro ↔ Samuel (pessoal)

**Data:** 2026-09-17  
**Decisão de:** Samuel (pedido explícito neste chat)

## O que foi autorizado
O **Engenheiro Principal** (`SamsTechEngineer` / bot **SamsTech Engineer** no Grok) pode **enviar e receber** WhatsApp **somente** com o número pessoal do Samuel, para:
- receber diretrizes;
- acompanhar o processo de desenvolvimento;
- reportar status e pedir confirmações.

**Destino autorizado:** contato pessoal de Samuel, mantido fora do Git.

## Onde está a sessão WhatsApp Web
Samuel conectou WhatsApp Web no **navegador do Grok Bot** (computador na nuvem do bot), **não** no navegador deste chat Cursor.

## Escopo
- **Pode:** mensagens 1:1 Engenheiro ↔ Samuel neste número.
- **Não autoriza:** WhatsApp a clientes, cobrança, disparo em massa, scraping, nem alterar `nf-stream-analyze`.
- Scraping genérico de WhatsApp Web continua **recusado**; uso da sessão já logada pelo Samuel para falar **com ele** é o canal operacional.

## Como o Engenheiro age
1. No Grok: abrir chat **SamsTech Engineer** (máquina do bot com WA Web).
2. Abrir WhatsApp Web / conversa com o número acima.
3. Enviar a mensagem de abertura (ver playbook).
4. No Cursor: registrar em `operacao/registros/` o que foi combinado (sem copiar conversa sensível demais).

## Playbook
`Documentação/playbooks/whatsapp-engenheiro-samuel.md`
