# STATUS — briefing da manhã (SamsTech Agents)

**Atualizado:** 17/09/2026 (noite — sync do commit Desktop que não subiu por credencial)  
**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta local:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes` (clone deste repo)  
**NF (`nf-stream-analyze`):** intocado

---

## Em uma frase

**PR #2 já estava merged** no `main`. A Secretária (Fase 1) segue operacional. **Smoke test PASS no Desktop.** Aguardando o Samuel para os **testes reais amanhã** (A–C). Sistema de NF **não** foi alterado.

## O que entrou agora (este PR)

- Tabelas sólidas de autonomia (**Pode / Precisa de aprovação / Nunca**) nas fichas `01`–`07` — **sem** inventar comissão %
- Playbook de conversa da Secretária (tarefa / lembrete / rascunho / dúvida → Samuel; **sem envio**)
- Playbook de follow-up comercial (**scaffolding**; template `templates/follow-up-comercial.md`)
- `scripts/smoke-test-fase1.ps1` — cria via `novo-*.ps1` e confere com `Get-ChildItem *smoke*` (não captura `Write-Host`)

## Para amanhã (testes reais — Samuel)

1. Open Folder nesta pasta → [ABRIR-NO-CURSOR.md](./ABRIR-NO-CURSOR.md)
2. Guia rápido: [AMANHA-TESTES.md](./AMANHA-TESTES.md)
3. Roteiro A–C: [Documentação/TESTES-REAIS-AMANHA.md](./Documentação/TESTES-REAIS-AMANHA.md)
4. Chat **Secretária SamsTech**: tarefa + lembrete + rascunho WhatsApp (**só** fila)
5. Playbook: [Documentação/playbooks/secretaria-conversa.md](./Documentação/playbooks/secretaria-conversa.md)

Smoke automático (Engenheiro, já PASS no Desktop):

```powershell
cd C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes
.\scripts\smoke-test-fase1.ps1
```

Arquivos `*smoke*` em `operacao/` são artefato opcional — **não** apagar lembretes reais.

## Equipe Grok Bot

Mapa completo: **[empresa/MAPA-EQUIPE.md](./empresa/MAPA-EQUIPE.md)** (Bot ↔ ficha ↔ pasta).

| Bot Grok | Estado |
|---|---|
| Secretária SamsTech | Fase 1 **operacional** (testes reais = amanhã, Samuel) |
| Gestor / Comercial / Produtos / Financeiro / Inteligência / Evolução | Bots + fichas criados; **não ao vivo** |
| SamsTech Engineer | Cursor só ele (temporário) |

Canal de grupo: **SamsTech Ops** (Engineer + Secretária + Gestor + Comercial).

## Pronto neste git

- PR #2 merged (V2 integral + mapa equipe Grok)
- Scripts locais (`listar-pendencias`, `novo-*`, `resumo-matinal`, `validar-estrutura`, **`smoke-test-fase1`**)
- `EXEMPLO-*` em `operacao/_exemplos/` (não são pendência do dia)
- Rotina: resumo matinal 8:00 seg–sex

## Escopo fixo

| Pode | Não pode |
|---|---|
| Este GitHub / esta pasta | `nf-stream-analyze` sem permissão explícita |
| Docs, fichas, `operacao/`, scripts locais | Código de produto, secrets, `.env` |
| Rascunho na fila de aprovações | Envio WhatsApp/e-mail sozinho |

## Aguardando Samuel

- [ ] Validar Fase 1 (testes reais A–C) **amanhã**
- [ ] Autorizar ou não Fase 2 ao vivo
- [ ] SoT / comissões / fontes de inadimplência — **não inventar**

## Como abrir o dia

1. Este `STATUS.md`
2. `ABRIR-NO-CURSOR.md`
3. `AMANHA-TESTES.md` → `Documentação/TESTES-REAIS-AMANHA.md`
4. `empresa/MAPA-EQUIPE.md` se for falar com outro bot
5. `AGENTS.md` (Engenheiro)
