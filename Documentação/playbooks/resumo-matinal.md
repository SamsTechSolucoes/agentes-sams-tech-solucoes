# Playbook — Resumo matinal

**Quem executa com Cursor (temporário):** só Engenheiro Principal.

## Objetivo
Listar o que precisa da atenção de Samuel hoje, a partir das pastas locais.

## Fontes (ignorar README e EXEMPLO-*)
1. `operacao/tarefas/` com status aberta
2. `operacao/lembretes/` com status pendente
3. `operacao/fila-aprovacoes/` com status pendente
4. `operacao/gestor/` handoffs abertos
5. `operacao/central-aprovacoes/` pendentes

## Saída
Arquivo em `operacao/registros/YYYYMMDD-resumo-matinal.md` e mensagem curta a Samuel.

## Não fazer
Enviar mensagem externa. Inventar pendência. Alterar sistema de NF.
