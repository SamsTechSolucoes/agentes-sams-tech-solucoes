# Testes reais — amanha (Samuel)

Repo/pasta: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (= GitHub `agentes-sams-tech-solucoes`)

## Antes
1. Cursor IDE → File → Open Folder → esta pasta (evita Incorrect Repository)
2. Abrir chat **Secretaria SamsTech**

## Roteiro (15 min)
### A — Tarefa
Peca: "Anota tarefa: ligar para [cliente real seu] amanha de manha"
Espere: arquivo novo em `operacao\tarefas\` (nao EXEMPLO) + caminho confirmado.

### B — Lembrete
Peca: "Me lembra as 10:00 de revisar a carteira"
Espere: arquivo em `operacao\lembretes\` com status pendente.

### C — Rascunho WhatsApp (SEM envio)
Peca: "Rascunha um WhatsApp pedindo retorno ao comprador [nome real]"
Espere: arquivo em `operacao\fila-aprovacoes\` status pendente. **Nada enviado.**

### D — Pendencias
No PowerShell nesta pasta:
```powershell
.\scripts\listar-pendencias.ps1
```

### E — Opcional scripts
```powershell
.\scripts\novo-tarefa.ps1 -Titulo "Teste manual" -Descricao "ok"
.\scripts\resumo-matinal.ps1
```

## Ainda NAO espere
- Leitura automatica do sistema de NF
- Envio real de WhatsApp
- Comissoes/inadimplencia calculadas
- Sheets/Drive sincronizados

## Se algo falhar
Anote no chat do **SamsTech Engineer** o que pediu e o que aconteceu.
