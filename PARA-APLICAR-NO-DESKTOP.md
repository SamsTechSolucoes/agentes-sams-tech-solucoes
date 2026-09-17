# Aplicar este pacote no Desktop (agente pai)

Subagente **não** conseguiu executar Shell/Read com `machineId` `f014f11d-25d8-46c2-a6f3-5f5414d34abc` (chamadas caíram na box Linux).

## Ação do agente pai

1. Confirmar que `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` existe.
2. **Não apagar** `operacao\lembretes\20260917-0222-desligar-torneira.md`.
3. Copiar/mesclar o conteúdo de `/workspace/SamsTechSolucoes-Agentes-overnight/` **para dentro** dessa pasta (criar pastas novas; não sobrescrever fichas/READMEs existentes sem diff).
4. Preferência: expandir `overnight-package.zip` (ao lado) no destino com `-Force` só em arquivos **novos** deste pacote.

Arquivos deste pacote são **aditivos** (scripts, fichas 02–07, fases, templates, STATUS, README). Se `README.md` / `STATUS.md` já existirem no Desktop, fazer merge consciente.
