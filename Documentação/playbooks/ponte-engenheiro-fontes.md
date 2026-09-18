# Playbook — Ponte Engenheiro → fontes (v1)

**Decisão:** `Documentação/decisoes/2026-09-17-engenheiro-executa-samuel-autoriza.md`  
**Quem executa:** só o Engenheiro Principal (Cursor + MCP).  
**Quem consome o brief:** Secretária, Comercial, Gestor — via arquivos em `operacao/fontes/consultas/`.

## Regras

1. Sem o pacote S1/S2/S3/B1 autorizado: **não** consultar linha de cliente, e-mail, agenda nem código de NF.
2. Com S1: só `SELECT` / ferramentas de leitura. Sem `INSERT`/`UPDATE`/`DELETE`/`apply_migration`.
3. Dado identificável (nome + telefone + valor + CNPJ juntos) vai só em `operacao/fontes/privados/` (**gitignored**).
4. O que entra no git: totais, datas, pendências, IDs internos se úteis, **sem** dump de carteira.
5. WhatsApp a cliente: continua rascunho em `operacao/fila-aprovacoes/`.
6. Inventário conhecido do banco (nomes de tabela, não conteúdo): ver `operacao/fontes/STATUS.md`.

## Consultas-piloto da V2 (depois de S1)

| Pedido do Samuel | Fonte | Saída |
|---|---|---|
| Clientes inativos | `clients` (+ critério informado por Samuel; **não inventar dias**) | brief em `consultas/` |
| Última NF do cliente X | `invoices` / `invoice_items` | brief privado + confirmação no chat |
| O que preciso aprovar? | `operacao/fila-aprovacoes` + índice da Central | `operacao/central-aprovacoes/indice-atual.md` |
| Lembretes do sistema de NF | `reminders` | brief; não misturar com `operacao/lembretes` sem dizer a origem |

## Depois de S2

- Listar eventos do dia / amanhã (Calendar).
- Detectar e-mail com NF no Gmail **autorizado** → só avisar Samuel. Upload continua com Samuel.

## Depois de S3

- Copiar o resumo executivo (sem PII de dump) para a pasta Drive `03-docs-executivos` já existente.

## Depois de B1

- Mapear **como** o NF envia WhatsApp. Sem envio, sem commit no repo de NF.
