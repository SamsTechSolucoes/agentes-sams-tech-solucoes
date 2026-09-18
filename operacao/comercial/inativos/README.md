# inativos/

Inativos / reativação manual da Fase 2.

O cliente é considerado inativo após **60 dias sem compra**, contados da data
de emissão da última NF vinculada ao cliente.

- iniciar prevenção no 45º dia sem compra;
- usar a janela de 45 a 59 dias para impedir a inatividade;
- registrar a fonte e a data da última NF;
- cliente sem NF vinculada exige revisão, não contato automático;
- qualquer mensagem segue para `operacao/fila-aprovacoes/`.

Decisão: `Documentação/decisoes/2026-09-18-cliente-inativo-60-dias.md`.
