# Playbook — WhatsApp Engenheiro ↔ Samuel

**Canal autorizado:** só o contato pessoal de Samuel, mantido fora do Git.  
**Decisão:** `Documentação/decisoes/2026-09-17-whatsapp-engenheiro-samuel.md`  
**Sessão:** WhatsApp Web no **navegador do Grok Bot** (SamsTech Engineer)

## Quem executa o envio
O bot **SamsTech Engineer** no Grok (tem o browser com a sessão).  
O Engenheiro no Cursor **não** compartilha automaticamente esse browser — se estiver só no Cursor, use Slack ou peça ao Samuel para abrir o chat Grok do Engineer.

## Mensagem de abertura (enviar agora)
```
Olá Samuel — aqui é o Engenheiro Principal (SamsTech Engineer).

Canal WhatsApp pessoal autorizado para diretrizes e acompanhamento do projeto Agents.

Estou pronto. Pode me enviar:
1) prioridade de hoje
2) se autoriza leitura do nf-stream só para mapear WhatsApp
3) qualquer bloqueio que estiver vendo

Repo: agentes-sams-tech-solucoes | Modo atual: diário (pedir "modo software" se quiser desenvolver)
```

## Se o bot pede QR mas Samuel ligou por CÓDIGO

WhatsApp Web tem dois jeitos de vincular:
- **QR** (câmera)
- **Código de 8 dígitos** (“vincular com número de telefone”)

Se Samuel usou **código**, a sessão **já está logada**. Pedir QR é erro: o bot provavelmente abriu uma **aba nova** deslogada.

O Engenheiro deve:
1. Listar abas do browser  
2. Usar a aba com **lista de conversas**  
3. Fechar aba que só mostra QR  
4. Só então abrir o contato pessoal autorizado de Samuel

Comando pronto: `COLAR-NO-GROK-ENGINEER-WHATSAPP.md`

## Se a sessão WA Web caiu
1. No Grok Bot → navegador → web.whatsapp.com  
2. Samuel reconecta (QR **ou** código — o que ele preferir)  
3. Repetir a mensagem de abertura

## Nunca
- Mensagem a cliente / cobrança / massa  
- Pedir 2FA/senha no chat  
- Alterar código do NF sem OK  
- Insistir em QR quando a sessão foi por código e já existe aba logada  
