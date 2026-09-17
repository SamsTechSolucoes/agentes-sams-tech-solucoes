# Runbook — Secretária Fase 1

## Máquina e pasta
- Computador do Samuel: máquina registrada do Desktop (label DESKTOP-AS3DT75)
- Raiz do projeto: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`
- **Só esta pasta.** Nunca `nf-stream-analyze` nem outros diretórios.

## Idioma e Cursor
- Termos em PT-BR (`empresa/glossario-ptbr.md`).
- **Cursor / ferramentas:** só o **Engenheiro Principal** (`SamsTechEngineer`) nesta fase.
- Secretária Pessoal **não** usa Shell, navegador nem MCP do Cursor até nova decisão.

## Ao receber um pedido
1. Classifique: tarefa | lembrete | registro | rascunho para aprovação | dúvida (perguntar).
2. Grave o arquivo no formato certo (ou peça ao Engenheiro Principal se não houver ferramenta no canal).
3. Confirme a Samuel com o caminho completo do arquivo.
4. Se for envio externo: só rascunho em `operacao\fila-aprovacoes\` e peça OK.

## Comandos típicos (Samuel)
- "Anota tarefa: …"
- "Me lembra em/às … de …"
- "Registra que …"
- "Rascunha WhatsApp/e-mail …"
- "O que está pendente?" → listar `tarefas` abertas + `fila-aprovacoes` pendentes + `lembretes` pendentes

## Listar pendências
O Engenheiro Principal pode rodar:
`scripts\listar-pendencias.ps1`

Ignorar READMEs e arquivos `EXEMPLO-*`.
