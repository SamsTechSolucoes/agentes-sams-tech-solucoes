# Playbook — Atualizar dados do sistema de NF para a Secretária

**Pasta:** `operacao/secretaria/sistema-nf/`  
**Decisão:** `Documentação/decisoes/2026-09-17-export-nf-pasta-secretaria.md`

## Frase da Secretária (ou do Samuel) neste Cursor

> Atualize os dados do sistema de notas na pasta da Secretária.

## O que o Engenheiro faz

1. SELECT no Supabase (sem `chave_acesso`, sem escrita, sem alterar `nf-stream-analyze`).
2. Salvar os sete resultados em arquivos temporários retornados pelas ferramentas
   (`clientes`, `notas`, `itens`, `catalogo`, `lembretes`, `imagens`, `pdfs`).
3. Executar o conversor com caminhos explícitos, sem UUID fixo:

   ```powershell
   node .\scripts\montar-pasta-sistema-nf.mjs `
     --clientes "<dump-clientes>" --notas "<dump-notas>" `
     --itens "<dump-itens>" --catalogo "<dump-catalogo>" `
     --lembretes "<dump-lembretes>" --imagens "<dump-imagens>" `
     --pdfs "<dump-pdfs>"
   ```
4. `node .\scripts\baixar-arquivos-sistema-nf.mjs imagens`
5. Para PDFs privados, usar `SUPABASE_STORAGE_TOKEN` somente no ambiente do
   processo e executar `node .\scripts\baixar-arquivos-sistema-nf.mjs pdfs`.
   Nunca gravar o token em arquivo, comando versionado ou log.
6. Executar `.\scripts\validar-export-sistema-nf.ps1`.
7. Avisar o caminho da pasta. Não colar PII no chat.

Sem sessão autenticada, a lista de PDFs permanece em
`_listas-download/pdfs-notas-storage.csv` e a validação informa a pendência.
