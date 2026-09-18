# Decisão — Atualização consolidada da pasta do NF

- **Data:** 2026-09-17
- **Status:** vigente
- **Decisor:** Samuel
- **Contexto:** evitar custo e trabalho de upload de NF/imagem uma a uma pela
  Secretária.
- **Decisão:** a Secretária não faz upload de notas. Ela manipula a cópia
  consolidada em `operacao/secretaria/sistema-nf/` e consulta imagens na pasta
  local ou no Drive. Toda segunda-feira às 07:30 é criada uma solicitação para
  o Engenheiro atualizar a extração completa antes do resumo das 08:00.
- **Fonte:** Supabase continua como SoT; a pasta e o Drive são cópias de
  trabalho.
- **Fora de escopo:** upload automático de NF, Google Fotos, envio de mensagem,
  alteração do `nf-stream-analyze` ou armazenamento de credenciais.
