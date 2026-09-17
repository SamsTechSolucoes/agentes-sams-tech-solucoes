# STATUS — briefing da manhã (SamsTech Agents)

**Atualizado:** 17/09/2026 (cloud agent overnight, America/Sao_Paulo)  
**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta local:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (clone deste repo)

---

## Em uma frase

A documentação e o esqueleto da equipe de Agentes estão neste GitHub; a **Secretária (Fase 1) está operacional** na pasta local; o sistema de **NF não foi (e não deve ser) alterado**.

---

## O que o Samuel encontra ao acordar

1. **PR #1** neste repo, com a visão local (fichas, fases, scripts, operação) **mais** a diretriz do Engenheiro Principal e o diagnóstico 17/09.
2. **Arquitetura V2 integral** (seções 1–11, 16/09/2026) em `Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md`.
3. **Plano de fases 0–9** com Objetivo / Funcionalidades / Arquivos / Dados / Integrações / Dependências / Riscos / Testes / Critérios / Decisões Samuel.
4. **Fichas 01–07** + constituição comum. 04–07 continuam **PENDENTE SAMUEL** (não ao vivo).
5. **Runbook da Secretária** e scripts PowerShell locais.

## Escopo fixo (não negociar no silêncio)

| Pode | Não pode |
|---|---|
| Este GitHub / esta pasta | `nf-stream-analyze` sem permissão explícita |
| Docs, fichas, `operacao/`, scripts locais | Código de produto, secrets, `.env` |
| Rascunho na fila de aprovações | Envio WhatsApp/e-mail sozinho |
| Consultar a tela de NF se o Samuel pedir | Alterar o git/código do NF |

Decisões: `Documentação/decisoes/2026-09-17-escopo-pasta-agentes.md` e `Documentação/decisoes/2026-09-17-autonomia-noturna.md`.

## Fase 1 — teste rápido (2 minutos)

1. Abrir no Cursor a pasta `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (ver `ABRIR-NO-CURSOR.md`).
2. Source Control deve mostrar `agentes-sams-tech-solucoes` — **não** o repo de NF.
3. Abrir a **Secretária SamsTech** (ou pedir no chat usando a ficha `empresa/fichas/01-secretaria.md`).
4. Pedir uma **tarefa real**.
5. Pedir um **rascunho de WhatsApp** — deve ir para `operacao/fila-aprovacoes/`, **sem enviar**.
6. Não apagar o lembrete real `operacao/lembretes/20260917-0222-desligar-torneira.md`.

Scripts, se preferir o terminal:

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\listar-pendencias.ps1
.\scripts\resumo-matinal.ps1
```

## Aguardando o Samuel (manhã)

- [ ] Validar a Fase 1 na rotina real (tarefa + lembrete + rascunho).
- [ ] Revisar / mergear o PR #1 deste repo.
- [ ] Confirmar SoT: recomendação **Supabase = verdade operacional**, **Sheets = espelho analítico** — ainda **PENDENTE SAMUEL**.
- [ ] Autorizar (ou não) a Fase 2 ao vivo (Comercial).
- [ ] Confirmar se upload de NF permanece manual na v1.
- [ ] Três dores da semana para priorizar.

## Não feito (de propósito)

- Nenhuma linha de código em `nf-stream-analyze`.
- Integração de produção com o sistema de NF.
- Envio automático de WhatsApp.
- Regras de comissão (faltam regras oficiais).
- Drive/Sheets como camada operacional (Fase 4).
- Skills/Routines permanentes.
- Cursor para Secretária / Gestor / Comercial (só Engenheiro Principal).

## Overnight (o que avançou)

- Pacote local (scripts, templates, fichas, fases 0–9, `operacao/`) já estava no `main`.
- Este turno: merge do `main` no PR #1 + preenchimento integral dos documentos exigidos + esclarecimento **repo exclusivo = esta pasta**.
- Autonomia noturna: temporária; termina quando o Samuel acordar / revogar.

## Como abrir o dia

1. `STATUS.md` (este arquivo)
2. `AGENTS.md`
3. Ficha `01-secretaria.md`
4. Se for decidir produto: Arquitetura V2 + Plano de fases
