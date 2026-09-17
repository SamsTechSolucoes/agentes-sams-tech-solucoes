# Fase 1 — MVP Secretária Pessoal

**Autorizada (docs/ops neste repo):** 17/09/2026  
**Status:** **OPERACIONAL** — validação humana do Samuel na manhã ainda pendente  
**Restrição de pasta/repo:** somente `agentes-sams-tech-solucoes` / `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`  
**Sistema de NF:** externo — não alterar  
**Idioma:** PT-BR  
**Cursor:** só Engenheiro Principal (`SamsTechEngineer`)

Este arquivo é o detalhe operacional da Fase 1. O plano-mãe (todas as fases) está em `Documentação/Plano_Implementacao_Fases_V2.md`.

---

## Objetivo

Samuel conversa com **uma** interface (Secretária Pessoal) que:

- registra tarefas, lembretes e acontecimentos **nesta pasta**;
- avisa o que está pendente **sem ele precisar lembrar de perguntar**;
- rascunha mensagens e **para** na fila de aprovação;
- não envia WhatsApp/e-mail, não cobra, não mexe em dinheiro, não toca no git do NF.

Frase da V2: *“Samuel não deve precisar lembrar que precisa perguntar.”*

---

## Funcionalidades (o que está no ar neste repo)

| Função | Como | Envio externo? |
|---|---|---|
| Tarefa | `operacao/tarefas/` + `scripts/novo-tarefa.ps1` | Não |
| Lembrete | `operacao/lembretes/` + `scripts/novo-lembrete.ps1` | Não |
| Registro | `operacao/registros/` | Não |
| Rascunho WhatsApp/e-mail | `operacao/fila-aprovacoes/` + `scripts/novo-rascunho-aprovacao.ps1` | **Só depois do OK do Samuel** |
| Listar pendências | `scripts/listar-pendencias.ps1` | Não |
| Resumo matinal | `scripts/resumo-matinal.ps1` (rotina combinada 8:00 seg–sex) | Não |
| Dúvida | Perguntar ao Samuel; marcar `PENDENTE SAMUEL` | Não |

Áudio, Gmail, Calendar, Contacts, consulta automática ao banco do NF: **não** nesta fase.

---

## Arquivos

| Arquivo | Papel |
|---|---|
| `empresa/fichas/01-secretaria.md` | Ficha para colar / operar |
| `empresa/constituicao-comum.md` | Regras de todos os papéis |
| `empresa/glossario-ptbr.md` | Termos PT-BR |
| `Documentação/runbooks/secretaria-fase1.md` | Procedimento passo a passo |
| `Documentação/playbooks/resumo-matinal.md` | Resumo das 8:00 |
| `operacao/tarefas\|lembretes\|registros\|fila-aprovacoes/` | Dia a dia |
| `scripts/*.ps1` | Helpers **locais** |
| `templates/` | Markdown em branco |
| `STATUS.md` | Briefing |

Não criar arquivos em outros repositórios.

---

## Dados

- Markdown operacional (títulos, prazos, rascunhos). **Sem** dump de clientes, telefones ou NFs copiados do SaaS.
- Preferências leves só depois de classificar (comando vs preferência vs regra — V2 §7).
- Lembrete real a preservar: `operacao/lembretes/20260917-0222-desligar-torneira.md`.
- Ignorar `EXEMPLO-*` e READMEs como pedidos reais.

---

## Integrações

| Integração | Fase 1 |
|---|---|
| GitHub deste repo | Sync / PR |
| Cursor (Engenheiro Principal) | Configuração e scripts |
| Grok Bot Secretária | Conversa (sem Cursor) |
| nf-stream-analyze | **Externo.** Tela só se Samuel pedir. Zero commits |
| Gmail / Drive / Sheets / Calendar | Desligados |
| WhatsApp produção | Proibido enviar |

---

## Dependências

- Fase 0 documental (AGENTS, V2, constituição, pastas `operacao/`) — **feita** neste git.
- Samuel validar 3 pedidos piloto na manhã.
- Não depende de código novo no sistema de NF.

---

## Riscos

- Drift pasta local ↔ GitHub se o Samuel trabalhar só offline.
- Secretária “virar” Comercial/Financeiro sem autorização.
- Vazamento se alguém colar NF/cliente no markdown.
- Custo de rotina diária no Pro se ligarem routines cedo demais.
- Pedido para “já ajustar o nf-stream” — recusar e apontar este arquivo.

---

## Testes

### Automático / Engenheiro Principal

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\validar-estrutura.ps1
.\scripts\listar-pendencias.ps1
.\scripts\resumo-matinal.ps1
.\scripts\smoke-test-fase1.ps1
```

Piloto: 1 tarefa, 1 lembrete, 1 rascunho na fila (sem envio).

### Samuel (critério real)

1. Abrir a pasta certa (`ABRIR-NO-CURSOR.md`) — Source Control = `agentes-sams-tech-solucoes`.
2. Pedir à Secretária uma tarefa real.
3. Pedir um rascunho de WhatsApp → deve aparecer só em `operacao/fila-aprovacoes/`.
4. Confirmar que **nada** saiu sozinho.

---

## Critérios de conclusão

- [x] Ficha + constituição + runbook + pastas + scripts neste git
- [x] Zero envios externos autônomos
- [ ] Samuel usou a Secretária em **1 dia real** de trabalho
- [ ] 3 consultas/pedidos confiáveis + 1 resumo matinal útil
- [ ] Samuel autoriza (ou não) a Fase 2

---

## Decisões que dependem de Samuel

- Validar a Fase 1 ao acordar.
- Horário do resumo matinal (hoje: 8:00 seg–sex — confirmar).
- Nome de exibição da Secretária no Grok Bot, se quiser mudar.
- Se a Secretária poderá, no futuro, **consultar** o NF só leitura — ainda assim **sem** editar aquele repo daqui.
- Autorizar Fase 2 (Comercial) só depois do teste acima.
- Continuar **sem** Cursor para a Secretária (decisão vigente).

---

## Não fazer ainda

- Fase 2 integrada ao vivo
- Sistema de NF (código, secrets, deploy)
- Envio real
- Dar Cursor a outros agentes
- Ligar Gmail
- Inventar comissão, estoque ou ofensor
