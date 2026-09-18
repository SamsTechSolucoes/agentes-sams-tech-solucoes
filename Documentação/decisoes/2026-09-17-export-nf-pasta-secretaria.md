# Decisão — Export local do sistema de NF para a Secretária (S1)

**Data:** 2026-09-17  
**Decisor:** Samuel (pedido explícito: pacote v1 + pasta com o banco em documentos)

## Autorizado

1. **S1** — o Engenheiro lê o Supabase do sistema de NF (somente SELECT) e grava documentos locais para a Secretária usar.
2. Pasta: `operacao/secretaria/sistema-nf/` (fora do git, salvo `LEIA-ME.md`).
3. Conteúdo: planilhas de clientes (CNPJ e CPF separados), catálogo, imagens públicas, índice de PDFs, notas (sem chave de acesso NF-e), itens, lembretes do app.
4. Rotina: a Secretária pede no Cursor ao Engenheiro “atualize os dados do sistema de notas”; o Engenheiro reexporta.

## Limites

- Sem alterar código de `nf-stream-analyze`.
- Sem enviar WhatsApp/e-mail a cliente.
- Sem chave de acesso NF-e na pasta.
- Sem Cursor para a Secretária.
- PDFs do bucket privado `invoices` só entram se o download autenticado for possível; senão permanece a lista + as planilhas.

## Resultado de 18/09/2026

Sessão administrativa usada somente em memória: 1.513 PDFs copiados. Outras
28 referências retornaram HTTP 400 em duas tentativas e foram registradas como
inconsistências do storage. Nenhuma credencial foi gravada.

## SoT

Supabase continua a verdade operacional. Esta pasta é **cópia de trabalho** da Secretária, não substitui o sistema de NF.
