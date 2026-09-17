# Scripts locais (PowerShell)

**Quem executa:** Engenheiro Principal (`SamsTechEngineer`) via Cursor/Shell.  
Demais agentes: sem permissão Cursor nesta fase.

| Script | Função |
|---|---|
| `validar-estrutura.ps1` | Confere arquivos obrigatórios |
| `listar-pendencias.ps1` | Lista itens reais (ignora EXEMPLO/README) |
| `novo-item.ps1` | Cria tarefa/lembrete/aprovação/registro/handoff |
| `resumo-matinal.ps1` | Gera resumo em `operacao/registros/` |

Exemplo:

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes\scripts
.\validar-estrutura.ps1
.\listar-pendencias.ps1
.\resumo-matinal.ps1
.\novo-item.ps1 -Tipo tarefa -Titulo "Ligar cliente" -Texto "Retornar Metro Max"
```
