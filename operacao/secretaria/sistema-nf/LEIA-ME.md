# Pasta da Secretária — dados do sistema de notas

**Esta pasta é o banco do NF em documentos**, para a Secretária organizar segundo a ficha dela.

Caminho: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes\operacao\secretaria\sistema-nf`

## O que tem aqui

| Pasta / arquivo | Conteúdo |
|---|---|
| `planilhas/` | Clientes (todos, CNPJ, CPF, documento irregular), telefones/e-mail, notas, itens, catálogo, lembretes |
| `imagens-catalogo/` | Fotos públicas do catálogo |
| `pdfs-notas/` | PDFs das NFs após extração autenticada pelo Engenheiro |
| `_listas-download/` | Lista dos arquivos no storage (índice) |
| `00-indice-exportacao.json` | Totais da extração |

Planilhas abrem no Excel (CSV com `;` e UTF-8).

**Export 17/09/2026:** 941 clientes (337 CNPJ, 571 CPF, 33 documento
irregular), 1428 notas, 1543 itens, 1048 itens de catálogo, 151 lembretes,
**893 imagens baixadas** e **1.513 PDFs baixados**. Outras 28 referências do
storage retornaram HTTP 400 em duas tentativas autenticadas; os detalhes ficam
somente no arquivo local `00-download-resultado.json`.

## Como a Secretária trabalha

- Não faz upload nem processa uma NF por vez.
- Manipula as planilhas, PDFs e imagens desta pasta consolidada.
- Busca imagens primeiro em `imagens-catalogo/` ou no Drive autorizado.
- Toda segunda-feira às 07:30, uma tarefa local cria o pedido de atualização.

Quando precisar antecipar a rotina, para o **Engenheiro Principal**, uma frase basta:

> Atualize os dados do sistema de notas na pasta da Secretária.

O Engenheiro reexporta. A Secretária **não** usa Cursor e **não** altera o `nf-stream-analyze`.

## O que não vai nesta pasta

- Chave de acesso da NF-e (fica só no sistema de NF)
- Tokens, senhas, `.env`
- Envio de WhatsApp a cliente
- Campanhas de disparo em massa

## Documento irregular

Clientes cuja quantidade de dígitos do CNPJ/CPF não é 11 nem 14 ficam em `04-clientes-documento-irregular.csv`. A Secretária **não inventa** dígito: pergunta ao Samuel.

## Git

O conteúdo desta pasta **não vai para o GitHub** (PII). Só este `LEIA-ME.md` é versionado.
