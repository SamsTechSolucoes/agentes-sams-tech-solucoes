# STATUS — briefing da manhã (SamsTech Agents)

**Atualizado:** 17/09/2026 (cloud + push local)  
**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta local:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (clone deste repo)

---

## Em uma frase

A **Secretária (Fase 1) está operacional** nesta pasta/GitHub; scripts locais passaram na validação; o **PR #1** leva a Arquitetura V2 completa + README coerente para o `main`. O sistema de **NF não foi (e não deve ser) alterado**.

---

## Verificação (OK — push local)

- Pasta = repo exclusivo `agentes-sams-tech-solucoes` (não é NF). Ver `ABRIR-NO-CURSOR.md`.
- `main` já tem scripts, templates comerciais, checklists de ativação (Fases 2 / 5 / 6) e STATUS contínuo.
- `scripts\validar-estrutura.ps1`: 24/24 OK (máquina do Samuel).
- Scripts de pendência / tarefa / lembrete / rascunho corrigidos (encoding) e testados no Desktop.

## Pronto neste git

- Fase 1 operacional (Secretária + pastas + scripts + templates)
- Scaffolding Fase 2+ (fichas 02–07, `operacao/comercial/`, playbooks)
- Bots: Secretária, Gestor, Comercial (Cursor só Engenheiro Principal)
- Rotina Grok: resumo matinal 8:00 seg–sex
- Pendências reais: `scripts\listar-pendencias.ps1` (ignorar `EXEMPLO-*`)

## O que o PR #1 ainda adiciona ao `main` (não redundante)

O `main` local ainda tem `README.md` da **Fase 0 (Jarvis / papel)** e a V2 só no texto curto. O PR #1 traz:

1. `README.md` alinhado ao repo exclusivo e à Fase 1
2. Arquitetura V2 **seções 1–11** com notas de operação (NF externo; sem regra de negócio inventada)
3. `AGENTS.md`, constituição, runbook e Fase 1 detalhados
4. Diagnóstico 17/09 e decisões de escopo / autonomia noturna

## Escopo fixo

| Pode | Não pode |
|---|---|
| Este GitHub / esta pasta | `nf-stream-analyze` sem permissão explícita |
| Docs, fichas, `operacao/`, scripts locais | Código de produto, secrets, `.env` |
| Rascunho na fila de aprovações | Envio WhatsApp/e-mail sozinho |
| Consultar a tela de NF se o Samuel pedir | Alterar o git/código do NF |

## Teste rápido (2 minutos)

1. Open Folder: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`
2. Source Control = `agentes-sams-tech-solucoes` (não o repo de NF)
3. Pedir à Secretária: tarefa real + rascunho de WhatsApp → só `operacao/fila-aprovacoes/`
4. Não apagar `operacao/lembretes/20260917-0222-desligar-torneira.md`

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
.\scripts\resumo-matinal.ps1
```

## Aguardando Samuel

- [ ] Validar Fase 1 (tarefa + lembrete + rascunho)
- [ ] Merge do PR #1 (README + V2 completa no `main`)
- [ ] SoT: recomendação Supabase = verdade / Sheets = espelho — **PENDENTE SAMUEL**
- [ ] Autorizar ou não a Fase 2 ao vivo (`Documentação/fases/fase-2-comercial-ATIVACAO.md`)
- [ ] Upload de NF continua manual? **PENDENTE SAMUEL**
- [ ] Regras de comissão — **não inventar**
- [ ] Três dores da semana

## Não feito (de propósito)

- Código em `nf-stream-analyze`
- Envio automático WhatsApp
- Drive/Sheets ligados (Fase 4)
- Skills/Routines permanentes
- Fases 5–6 ao vivo (só checklist **PENDENTE SAMUEL**)

## Como abrir o dia

1. Este `STATUS.md`
2. `AGENTS.md`
3. Ficha `empresa/fichas/01-secretaria.md`
4. Arquitetura V2 + plano de fases, se for decidir produto
