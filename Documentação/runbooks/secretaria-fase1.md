# Runbook — Secretária Fase 1

Procedimento operacional da Secretária Pessoal.  
Chat Grok: **Secretária SamsTech**. Ficha: `empresa/fichas/01-secretaria.md`. Mapa: `empresa/MAPA-EQUIPE.md`. Constituição: `empresa/constituicao-comum.md`.

---

## Quando usar

Qualquer pedido do Samuel que caiba em: tarefa, lembrete, registro, rascunho para aprovação, “o que está pendente?”, resumo do dia.

## Quem executa

- **Secretária Pessoal** — conversa e classificação (sem Cursor).
- **Engenheiro Principal** — scripts, arquivos, Git, se a Secretária não tiver ferramenta no canal.
- **Samuel** — aprova envio e decide o que está fora do runbook.

## Máquina e pasta

- Computador do Samuel (label DESKTOP-AS3DT75)
- Raiz: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`
- GitHub: `agentes-sams-tech-solucoes` (o mesmo projeto)
- **Só esta pasta.** Nunca `nf-stream-analyze` nem outros diretórios.

## Idioma e Cursor

- Termos em PT-BR (`empresa/glossario-ptbr.md`).
- Cursor / Shell / navegador / MCP: **só** Engenheiro Principal.
- Secretária **não** usa essas ferramentas até nova decisão.

---

## Pré-condições

1. Pasta aberta é a dos Agentes (ver `ABRIR-NO-CURSOR.md`).
2. Constituição lida.
3. Não há pedido de envio real sem passar pela fila.
4. Arquivos `EXEMPLO-*` não são trabalho real.

---

## Ao receber um pedido (passos)

1. **Classifique:** tarefa | lembrete | registro | rascunho para aprovação | dúvida (perguntar) | fora de escopo (NF código, outro repo, dinheiro).
2. Se for **dúvida ou falta de fato:** pergunte ao Samuel. Não invente.
3. Se for **fora de escopo:** recuse em uma frase e aponte `AGENTS.md` / este runbook.
4. **Grave** o `.md` no formato da pasta (ou peça ao Engenheiro Principal).
5. **Confirme** a Samuel com o **caminho completo** do arquivo.
6. Se for envio externo: **somente** rascunho em `operacao\fila-aprovacoes\` e peça OK. Não envie.

### Onde gravar

| Tipo | Pasta | Script (Engenheiro Principal) |
|---|---|---|
| Tarefa | `operacao\tarefas\` | `scripts\novo-tarefa.ps1` |
| Lembrete | `operacao\lembretes\` | `scripts\novo-lembrete.ps1` |
| Registro | `operacao\registros\` | (template `templates\registro.md`) |
| Rascunho WhatsApp/e-mail | `operacao\fila-aprovacoes\` | `scripts\novo-rascunho-aprovacao.ps1` |

### Comandos típicos (Samuel)

- “Anota tarefa: …”
- “Me lembra em/às … de …”
- “Registra que …”
- “Rascunha WhatsApp/e-mail …”
- “O que está pendente?” → listar `tarefas` abertas + `fila-aprovacoes` pendentes + `lembretes` pendentes

### Listar pendências

O Engenheiro Principal pode rodar:

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
.\scripts\resumo-matinal.ps1
```

Ignorar READMEs e arquivos `EXEMPLO-*`.

---

## Como validar

- O arquivo existe no caminho informado.
- Nada foi enviado ao cliente.
- Nenhum outro repositório foi modificado.
- Lembrete real `operacao\lembretes\20260917-0222-desligar-torneira.md` continua intacto.

## Rollback / se falhar

- Arquivo no lugar errado: mover para a pasta da tabela acima; avisar Samuel.
- Pedido ambíguo já gravado: marcar o arquivo como `PENDENTE SAMUEL` e perguntar.
- Script PowerShell falhou: não repetir às cegas; registrar o erro em `operacao\registros\` (sem secrets) e corrigir o script **neste** repo.

## O que nunca fazer

- Enviar WhatsApp/e-mail/cobrança.
- Alterar `nf-stream-analyze`.
- Ligar Gmail/Drive/Sheets.
- Inventar telefone, CNPJ, valor ou comissão.
- Usar Cursor na identidade da Secretária.
- Apagar o lembrete real da torneira.
- Tratar `EXEMPLO-*` como pedido do dia.
