# Playbook — Notas fiscais (orientação)

Fonte: Arquitetura V2 §9. Sistema de NF = **externo** (`nf-stream-analyze`). Este playbook **não** muda aquele produto.

## Política atual
Upload de NF: **Samuel**. Agentes não processam NF sozinhos nesta fase. Loop-alvo da V2 (receber → extrair → validar → relacionar cliente → histórico/faturamento/estoque → alertar) **não** está implementado neste repo.

## O que a equipe pode fazer
- Avisar que há NF a tratar (se a informação existir em registro/e-mail autorizado — integração ainda pendente).
- Registrar follow-up em `operacao/registros/`.

## O que não fazer
- Alterar `nf-stream-analyze` sem permissão.
- Inventar valor, cliente ou item de NF.
- Usar Cursor (exceto Engenheiro Principal, e mesmo assim sem mudar o sistema de NF sem OK).
