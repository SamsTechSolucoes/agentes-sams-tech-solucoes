# Testes reais — amanhã (Samuel)

Checklist para **validar a Fase 1 (Secretária)** no dia a dia real.  
Não é código. Não é envio. Não é o sistema de NF.

Guia de 4 linhas: [AMANHA-TESTES.md](../AMANHA-TESTES.md)  
Mapa Bot ↔ ficha: [empresa/MAPA-EQUIPE.md](../empresa/MAPA-EQUIPE.md)

**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta a abrir:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`  
**Como abrir:** [ABRIR-NO-CURSOR.md](../ABRIR-NO-CURSOR.md)  
**Briefing:** [STATUS.md](../STATUS.md)  
**Chat Grok:** **Secretária SamsTech** (ficha [01-secretaria.md](../empresa/fichas/01-secretaria.md))

Arquivos `EXEMPLO-*` estão em `operacao/_exemplos/` — **não** são pendência do dia.

---

## 0. Antes de pedir qualquer coisa

1. No Cursor: **File → Open Folder**.
2. Escolher **somente** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`.
3. No Source Control, o remoto deve ser `agentes-sams-tech-solucoes`.
4. Se aparecer outro repo (`nf-stream-analyze` ou pasta antiga `Projeto Agentes…`): **fechar** e abrir de novo a pasta certa.
5. Ler `STATUS.md` (1 minuto). Abrir o chat **Secretária SamsTech**.

---

## Roteiro (~15 min)

Fazer **na conversa da Secretária SamsTech** (não no Engenheiro, se os dois existirem).  
Pedir coisas **suas**, do dia — não copiar `operacao/_exemplos/`.

### A — Tarefa

> Anota tarefa: ligar para [cliente real seu] amanhã de manhã  
> (ou o que você realmente precisa fazer hoje)

**Esperado:** arquivo novo em `operacao/tarefas/` + caminho completo na resposta. Nada sai por WhatsApp/e-mail.

**Não esperado:** tarefa virar follow-up comercial sozinha; Secretária usar Cursor/Shell.

### B — Lembrete

> Me lembra às 10:00 de revisar a carteira  
> (ou hora/prazo reais)

**Esperado:** arquivo em `operacao/lembretes/` com status pendente + caminho.  
O lembrete `operacao/lembretes/20260917-0222-desligar-torneira.md` **continua lá** (não apagar).

**Não esperado:** notificação no celular / WhatsApp / Calendar; Gmail ligado.

### C — Rascunho WhatsApp (SEM envio)

> Rascunha um WhatsApp pedindo retorno ao comprador [nome real]

**Esperado:** arquivo **somente** em `operacao/fila-aprovacoes/`, status pendente. A Secretária pede o seu OK. **Nada enviado.**

**Não esperado:** envio real; cobrança iniciada; telefone inventado se você não passou o dado.

### D — Pendências

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
```

Ignorar `README.md` e `operacao/_exemplos/`. Os itens A–C devem aparecer.

### E — Opcional (scripts)

```powershell
.\scripts\novo-tarefa.ps1 -Titulo "Teste manual" -Descricao "ok"
.\scripts\resumo-matinal.ps1
```

---

## O que NÃO esperar ainda

| Ainda não | Por quê |
|---|---|
| Envio WhatsApp / e-mail sozinho | Só rascunho + sua aprovação |
| Leitura automática do sistema de NF | NF é **externo**; upload continua com você |
| Gestor / Comercial / Produtos / Financeiro / Inteligência / Evolução **ao vivo** | Bots e fichas **já existem**; operar de verdade = **PENDENTE SAMUEL** |
| Drive, Sheets, Gmail, Calendar | Fases 4 / 9 |
| Comissão, estoque, ofensores calculados | Não inventar; falta documento seu |
| Código em `nf-stream-analyze` | Proibido neste projeto |
| Cursor na Secretária | Só o **SamsTech Engineer** usa Cursor nesta fase |

---

## Critério de “Fase 1 ok para mim”

- [x] Abri a pasta certa no Cursor
- [x] **A** — 1 tarefa real em `operacao/tarefas/`
- [x] **B** — 1 lembrete real em `operacao/lembretes/`
- [x] **C** — 1 rascunho **só** na fila (`operacao/fila-aprovacoes/`)
- [x] Confirmei que **nada** foi enviado sozinho

Samuel confirmou em 17/09/2026: piloto da Fase 1 **concluído ontem (16/09)**.  
Fase 2 ao vivo **só** com autorização escrita — `Documentação/fases/fase-2-comercial-ATIVACAO.md`.

---

## Se algo falhar

1. Source Control = `agentes-sams-tech-solucoes`.
2. Não abrir o repo de NF “para consertar”.
3. Anotar no chat do **SamsTech Engineer** o que pediu e o que aconteceu.
4. Não apagar o lembrete da torneira.

Fonte: `Documentação/runbooks/secretaria-fase1.md`.
