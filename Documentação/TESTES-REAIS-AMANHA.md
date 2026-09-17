# Testes reais — amanhã (Samuel)

Checklist para **validar a Fase 1 (Secretária)** no dia a dia real.  
Não é código. Não é envio. Não é o sistema de NF.

**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta a abrir:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`  
**Como abrir:** [ABRIR-NO-CURSOR.md](../ABRIR-NO-CURSOR.md)  
**Briefing:** [STATUS.md](../STATUS.md)  
**Ficha:** [empresa/fichas/01-secretaria.md](../empresa/fichas/01-secretaria.md)

---

## 0. Antes de pedir qualquer coisa

1. No Cursor: **File → Open Folder**.
2. Escolher **somente** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`.
3. No Source Control, o remoto deve ser `agentes-sams-tech-solucoes`.
4. Se aparecer outro repo (`nf-stream-analyze` ou pasta antiga `Projeto Agentes…`): **fechar** e abrir de novo a pasta certa.
5. Ler `STATUS.md` (1 minuto). Não precisa ler a Arquitetura V2 para estes testes.

---

## 1. Secretária — três pedidos reais

Fazer **na conversa da Secretária** (não no Engenheiro Principal, se os dois existirem).  
Pedir coisas **suas**, do dia — não copiar os `EXEMPLO-*`.

### 1.1 Tarefa

Diga, no tom que você usa de verdade, algo como:

> Anota tarefa: [o que você precisa fazer hoje].

**Esperado**

- Arquivo novo em `operacao/tarefas/`.
- A Secretária responde com o **caminho completo** do arquivo.
- Nada sai por WhatsApp/e-mail.

**Não esperado**

- Tarefa virar follow-up comercial sozinha.
- A Secretária usar Cursor / Shell.

### 1.2 Lembrete

> Me lembra [hora ou prazo] de [o quê].

**Esperado**

- Arquivo novo em `operacao/lembretes/`.
- Caminho completo na resposta.
- O lembrete real `operacao/lembretes/20260917-0222-desligar-torneira.md` **continua lá** (não apagar).

**Não esperado**

- Notificação no celular / WhatsApp / Calendar (ainda não).
- Gmail ligado.

### 1.3 Rascunho na fila (WhatsApp ou e-mail)

> Rascunha um WhatsApp para [quem] dizendo [o quê].  
> (ou e-mail — mesmo fluxo)

**Esperado**

- Arquivo **somente** em `operacao/fila-aprovacoes/`.
- Texto é rascunho. A Secretária **pede o seu OK**.
- **Nenhuma** mensagem é enviada.

**Não esperado**

- Envio real.
- Cobrança iniciada.
- Cliente/telefone inventado se você não passou o dado.

---

## 2. Conferir pendências (opcional, 30 segundos)

No Cursor, pasta certa aberta, o Engenheiro Principal (ou você) pode rodar:

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
```

Ignorar `README.md` e arquivos `EXEMPLO-*`.  
Os três itens do passo 1 devem aparecer como pendentes.

---

## 3. O que NÃO esperar ainda

| Ainda não | Por quê |
|---|---|
| Envio WhatsApp / e-mail sozinho | Só rascunho + sua aprovação |
| Consulta automática ao banco de NF | Sistema de NF é **externo**; upload continua com você |
| Gestor / Comercial / Produtos / Financeiro **ao vivo** | Fichas existem; operação ao vivo = **PENDENTE SAMUEL** (Fase 2+) |
| Drive, Sheets, Gmail, Calendar ligados | Fase 4 / 9 |
| Regras de comissão, estoque, ofensores | Não inventar; falta documento seu |
| Código novo no `nf-stream-analyze` | Proibido neste projeto |
| Skills / Routines permanentes | Só depois de processo estável **e** o seu OK |
| Cursor na Secretária | Só o Engenheiro Principal usa Cursor nesta fase |

---

## 4. Critério de “Fase 1 ok para mim”

Marque só o que você **fez de verdade** neste teste:

- [ ] Abri a pasta certa no Cursor (`ABRIR-NO-CURSOR.md`)
- [ ] Pedi **1 tarefa real** e vi o arquivo em `operacao/tarefas/`
- [ ] Pedi **1 lembrete real** e vi o arquivo em `operacao/lembretes/`
- [ ] Pedi **1 rascunho** e vi **só** a fila (`operacao/fila-aprovacoes/`)
- [ ] Confirmei que **nada** foi enviado sozinho
- [ ] O formato dos markdowns serve (se não servir: anotar o que mudar; não inventar regra)

Se os três pedidos funcionarem no seu dia, a Fase 1 está validada.  
Fase 2 (Comercial ao vivo) **só** se você autorizar por escrito — checklist: `Documentação/fases/fase-2-comercial-ATIVACAO.md`.

---

## 5. Se algo falhar

1. Confirmar de novo o Source Control = `agentes-sams-tech-solucoes`.
2. Não abrir o repo de NF “para consertar”.
3. Anotar o que pediu e o que aconteceu em `operacao/registros/` (ou no chat).
4. Não apagar o lembrete da torneira.

Fonte operacional: `Documentação/runbooks/secretaria-fase1.md`.
