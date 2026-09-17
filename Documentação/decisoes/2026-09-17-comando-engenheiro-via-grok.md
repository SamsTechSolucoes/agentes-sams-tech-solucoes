# Comando ao Engenheiro Principal via Grok Bot

- **Data:** 2026-09-17
- **Status:** vigente
- **Decisor:** Samuel
- **Contexto:** Ambientes Cursor já configurados. Cursor no PC aberto na pasta `SamsTechSolucoes-Agentes`. Samuel acessa o Grok Bot e dá o comando ao Engenheiro Principal — sem reconfigurar ambiente e sem misturar com o sistema de NF.
- **Decisão:** o canal de **fala** com o Engenheiro Principal é o Grok Bot **SamsTech Engineer**. A **execução com ferramentas** continua só no Cursor (desktop aberto ou Cloud Agent deste repo). Não reconfigurar Ambientes.
- **Consequências:** o Engenheiro recebe o pedido no Grok Bot (ou no Cloud Agent disparado a partir desse comando), confirma o repo certo e executa só em `agentes-sams-tech-solucoes`. Demais papéis continuam sem Cursor.
- **Fora de escopo:** não autoriza Fase 2–9 ao vivo, envio WhatsApp/e-mail, serviço pago, nem alteração de `nf-stream-analyze`.

Runbook: `Documentação/runbooks/comandar-engenheiro-grok.md`  
Texto para colar: `templates/comando-engenheiro.md`
