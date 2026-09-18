# Configurar Grok Bot — checklist final (como planejado)

**Atualizado:** 2026-09-17  
**Objetivo:** deixar o Grok alinhado ao plano V2 / Fase 1, sem inventar Fase 2–9 ao vivo.

Eu (Engenheiro no Cursor) **não consigo clicar** no app Grok por você. Este arquivo é o roteiro que **você** executa; os textos para colar estão prontos.

---

## Resultado da execução — 17/09/2026

- [x] Uso do Grok disponível: 34% utilizado; sob demanda = nenhum
- [x] Secretária SamsTech configurada e `PRONTA`
- [x] Testes reais A–C executados por Samuel e aprovados
- [x] SamsTech Engenheiro Principal configurado e `PRONTO`

**Situação:** configuração obrigatória da Fase 1 concluída. Grupo, Slack adicional, WhatsApp e bots em scaffolding permanecem opcionais ou destinados a fases futuras.

---

## Meta do plano (o que “pronto” significa agora)

| Item | Meta |
|---|---|
| Bots criados | 8 (já existem no print) |
| Operacional de verdade | **Secretária SamsTech** + **SamsTech Engenheiro Principal** |
| Demais (Gestor, Comercial, …) | Existem, mas **não ao vivo** — só ficha |
| Cursor | Só Engenheiro |
| Channels no Grok | **Opcional / pode não existir** — não bloqueia |
| Slack | Plugin Grok **ou** agente **Cursor** no Slack (MD) |
| WhatsApp Engenheiro↔Samuel | Só por **código**; se instável, usar Cursor/Slack |
| Routines / Skills | **Não** criar agora (custo + aprovação) |

---

## BLOCO 1 — Conta Grok (5 min)

- [ ] Grok Bot → **Settings → Usage**: tem cota? Se esgotou, bots ficam mudos.
- [ ] **Não** use Reset Agent Computer (derruba WA).
- [ ] Plugins (barra lateral) → se quiser: **Slack** instalado/autorizado. Se não achar Channels, ignore Channels.

## BLOCO 2 — Identidade dos bots operacionais (colar ficha)

### 2.1 Secretária SamsTech
1. Abra o chat **Secretária SamsTech**.
2. Cole o arquivo: `Documentação/playbooks/COLAR-NO-GROK-SECRETARIA.md`
3. Peça: “Confirme que leu a ficha e a constituição. Responda PRONTA.”

### 2.2 SamsTech Engenheiro Principal
1. Abra o chat **SamsTech Engenheiro Principal** (ou SamsTech Engineer).
2. Cole: `Documentação/playbooks/COLAR-NO-GROK-ENGINEER-IDENTIDADE.md`
3. Peça: “Confirme PRONTO. Não peça QR. WhatsApp só por código se eu pedir.”

### 2.3 Demais bots (Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução)
Para cada um, cole **uma vez** (texto curto em `COLAR-NO-GROK-SCAFFOLDING.md`):
- “Você está em scaffolding. Não opere ao vivo. Leia só sua ficha quando eu pedir.”

## BLOCO 3 — Grupo SamsTech Ops (se a UI tiver grupo)

- [ ] Criar/abrir grupo **SamsTech Ops** com: Engenheiro + Secretária + Gestor + Comercial.
- [ ] **Não** colocar Produtos/Financeiro/Inteligência/Evolução ainda.
- [ ] No grupo, avisar: “Sem envio WhatsApp a clientes. Sem NF.”

## BLOCO 4 — Slack (teste do vínculo)

Pelo print, no Slack você tem o agente **Cursor** ativo em 3 canais/MDs:

1. Slack → **Agentes e ferramentas** → clique em **Cursor**.
2. Abra a **MD** (ou um dos 3 canais).
3. Envie: `ping Agents — responda OK`
4. Marque aqui: Slack Cursor **OK** / **falhou**

(Grok “Channels” não é obrigatório.)

## BLOCO 5 — WhatsApp Engenheiro (opcional agora)

Só se quiser o canal Zap pessoal:

1. Agent Computer do Engenheiro → `web.whatsapp.com`
2. Vincular **só por código** (não QR) — ver `COLAR-NO-GROK-ENGINEER-WHATSAPP.md`
3. Mensagem de abertura para o contato pessoal autorizado de Samuel
4. Se travar/cota: **pule** e use Cursor + Slack

## BLOCO 6 — Validação Fase 1 (obrigatório)

No chat **Secretária SamsTech**:

| # | Pedido | Esperado |
|---|---|---|
| A | Anota tarefa: … (real) | Confirma caminho / registra pedido |
| B | Me lembra às … de … | Lembrete |
| C | Rascunha WhatsApp … | Só rascunho; **não envia** |

Detalhe: `Documentação/TESTES-REAIS-AMANHA.md`

Quando A–C passarem, responda neste Cursor: **“Grok Fase 1 OK”**.

## BLOCO 7 — Não fazer agora

- Routines a cada poucos minutos (consome cota)
- Ativar Comercial/Financeiro ao vivo
- Reset Agent Computer
- Insistir em Channels
- Enviar WhatsApp a cliente
- Alterar `nf-stream-analyze`

---

## Depois que você marcar os blocos

Volte aqui e diga o que ficou verde. Eu atualizo `STATUS.md` / `MAPA-EQUIPE.md` e seguimos (Fase 2 só com seu OK).
