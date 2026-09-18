# Comercial — entrevista guiada de critérios

- status: em andamento
- responsável: Comercial

## Evidência do documento base

A Arquitetura V2 usa “clientes inativos 90d” como **teste piloto**, mas declara
que a regra de inatividade em dias depende de Samuel. Portanto, 90 dias é
exemplo, não regra aprovada.

## Decisão concluída — quando o cliente vira inativo?

**60 dias sem compra**, contados da emissão da última NF. O objetivo é agir
antes desse limite para preservar a propriedade e o relacionamento da conta.

## Decisão concluída — início da prevenção

**45 dias sem compra**, criando uma janela preventiva de 15 dias.

## Perguntas seguintes

1. Separar cliente novo, recorrente e sazonal?
2. Tom do primeiro acompanhamento: consultivo, direto ou promocional?
3. Quantas tentativas e em quais intervalos dentro da janela?
4. Encerrar acompanhamento após silêncio, recusa ou nova compra?

Qualquer mensagem continua como rascunho sujeito à aprovação.
