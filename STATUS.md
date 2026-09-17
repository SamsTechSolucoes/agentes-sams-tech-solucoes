# STATUS — briefing da manhã (SamsTech Agents)

**Atualizado:** 17/09/2026 (consolidação documental no `main` mais recente)  
**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta local:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (clone deste repo)

---

## Em uma frase

A **Secretária (Fase 1) está operacional** nesta pasta/GitHub; a **Arquitetura V2 está completa** (seções 1–11); o plano cobre **fases 0–9**. O sistema de **NF não foi (e não deve ser) alterado**.

---

## Verificação (OK — `main` + esta consolidação)

- Pasta = repo exclusivo `agentes-sams-tech-solucoes` (não é NF). Ver `ABRIR-NO-CURSOR.md`.
- `main` já tinha STATUS, scripts PS1, templates, fichas, fases, checklists de ativação (2 / 5 / 6) e `operacao/`.
- Arquitetura V2: texto integral (não é índice curto).
- `scripts\validar-estrutura.ps1`: 24/24 OK na máquina do Samuel (push local anterior).
- Scripts de pendência / tarefa / lembrete / rascunho corrigidos (encoding) e testados no Desktop.

## Pronto neste git

- Fase 1 operacional (Secretária + pastas + scripts + templates)
- Scaffolding Fase 2+ (fichas 02–07, `operacao/comercial/`, playbooks)
- Plano fases 0–9 em `Documentação/Plano_Implementacao_Fases_V2.md` + índice em `Documentação/fases/README.md`
- Bots: Secretária, Gestor, Comercial (Cursor só Engenheiro Principal)
- Rotina Grok: resumo matinal 8:00 seg–sex
- Pendências reais: `scripts\listar-pendencias.ps1` (ignorar `EXEMPLO-*`)

## Escopo fixo

| Pode | Não pode |
|---|---|
| Este GitHub / esta pasta | `nf-stream-analyze` sem permissão explícita |
| Docs, fichas, `operacao/`, scripts locais | Código de produto, secrets, `.env` |
| Rascunho na fila de aprovações | Envio WhatsApp/e-mail sozinho |
| Consultar a tela de NF se o Samuel pedir | Alterar o git/código do NF |

## Teste de amanhã (Samuel)

Siga **[Documentação/TESTES-REAIS-AMANHA.md](./Documentação/TESTES-REAIS-AMANHA.md)**:

1. Open Folder: `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`
2. Source Control = `agentes-sams-tech-solucoes` (não o repo de NF)
3. Secretária: **tarefa** + **lembrete** + **rascunho** (só `operacao/fila-aprovacoes/`)
4. Não apagar `operacao/lembretes/20260917-0222-desligar-torneira.md`

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
.\scripts\resumo-matinal.ps1
```

## Aguardando Samuel

- [ ] Validar Fase 1 (checklist em `Documentação/TESTES-REAIS-AMANHA.md`)
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
2. `ABRIR-NO-CURSOR.md` (se for no Desktop)
3. `Documentação/TESTES-REAIS-AMANHA.md` (testes reais)
4. `AGENTS.md`
5. Ficha `empresa/fichas/01-secretaria.md`
6. Arquitetura V2 + plano de fases, se for decidir produto
