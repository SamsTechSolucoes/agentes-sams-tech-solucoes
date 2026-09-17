# Como abrir no Cursor (corrige "Incorrect Repository")

O erro aparece quando o Cursor Agent é do repo `SamsTechSolucoes/agentes-sams-tech-solucoes`, mas o IDE não tem esse repositório aberto.

## Correção (já feita nesta pasta)
Esta pasta agora é um git clone ligado a:
`https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes.git`

## O que fazer no Cursor IDE
1. **File → Open Folder…** (ou Abrir pasta)
2. Escolha exatamente:
   `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`
3. Confirme que na barra de status / Source Control aparece o repo `agentes-sams-tech-solucoes`
4. Volte no Grok Bot / Cloud Agent e clique **Open in Cursor** de novo

## Se quiser a branch do cloud agent
No terminal desta pasta:
```powershell
git fetch origin
git checkout cursor/engenheiro-principal-docs-5753
```

## Não fazer
- Abrir a pasta do sistema de NF (`nf-stream-analyze`) e esperar que o agent de agentes abra — é outro repo.
