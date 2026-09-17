# Escopo da pasta e do repositório dos Agentes

- **Data:** 2026-09-17
- **Status:** vigente
- **Decisor:** Samuel
- **Contexto:** o Cursor e os cloud agents tentaram (ou poderiam tentar) trabalhar no repo de NF. Samuel confirmou que o projeto exclusivo dos Agentes é um só.

## Decisão

O desenvolvimento e a operação do **SamsTech Agents** ocorrem **somente** em:

1. GitHub: https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes
2. Pasta local (clone deste mesmo repositório, fonte do **dia a dia**):  
   `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`

Não há segundo repositório de Agentes. Abrir essa pasta no Cursor **é** abrir este GitHub.

É **proibido** alterar o diretório/repositório do sistema de notas fiscais (`nf-stream-analyze`) ou qualquer outro projeto (`neon-flow`, `prospecta-b2b-lead-finder`, `baileys-whatsapp-server-`, `Dia-a-Dia`, etc.) **sem permissão explícita e pontual** de Samuel.

O sistema de NF é **externo**: pode ser consultado na tela se Samuel pedir; não pode ser modificado daqui.

O Agents é construído **nesta** pasta/repo (docs, fichas, `operacao/`, scripts locais). Não misturar git trees.

## Consequências

- Engenheiro Principal e cloud agents: `AGENTS.md` § Escopo.
- PRs só neste GitHub.
- Fase 1 (Secretária) grava arquivos só em `operacao/` desta pasta.
- Mensagem “Incorrect Repository” no Cursor: seguir `ABRIR-NO-CURSOR.md`.

## Fora de escopo

Esta decisão **não** autoriza código de produto, limpeza de secrets no git do NF, Skills, Drive/Sheets, nem envio WhatsApp.
