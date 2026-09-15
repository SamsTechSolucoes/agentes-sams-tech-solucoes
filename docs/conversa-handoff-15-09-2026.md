# Handoff da conversa — 14–15/09/2026

Snapshot para continuar no Cursor Web ou em outro PC. Não é o JSONL bruto do chat.

**Repo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Chat desktop (ID):** `4344bddb-cf5a-4230-867b-f9ba106f718b`

---

## O que o Samuel pediu nesta sessão

1. Desenvolver teoricamente a equipe de agentes no Grok Bot (não configurar ainda).
2. Organograma, fichas, diagrama de fluxo.
3. Tempo de configurar o Grok Bot e se o Cursor Pro (US$ 20) dá direito — **sim, dá**.
4. Simular gastos da cota com o histórico real do NF-Stream.
5. Se ele fizer o **upload das NFs na mão** e os Bots só acessarem sites / tarefas simples — o que muda.
6. Dormir; amanhã criar o Grok; até lá pensar o que deixar e o que tirar. Salvar no GitHub e deixar o caminho do Cursor Web.

---

## Decisões já tomadas (não reabrir sem ele pedir)

- NF-Stream-Analyze **já é** o sistema. Não reconstruir Jarvis em Python.
- Dois trilhos: **A** operar a tela / **B** mudar código. Não misturar no mesmo turno.
- Samuel fala **só com o Jarvis**. Envio ao cliente, 2FA, aval do plano, merge e deploy são dele.
- Disparo em massa sem aval = recusado. Scraping WhatsApp Web = recusado.
- **Upload de NF: Samuel.** Bots: consulta na tela, rascunho, despacho.
- Grok Bot incluso no Cursor Pro. Cota semanal **própria**, não come o chat do IDE.
- Nada criado no Grok Bot até ele autorizar a Fase 1.

---

## Números reais do NF-Stream (Supabase, 15/09/2026)

- 1 usuário, 1.428 NFs, 941 clientes (925 com telefone), 634 inativos 90d
- Upload: 17/11/2025 → 01/09/2026
- Ritmo estável nov–mar: ~20 NFs por dia em que ele sentou para subir
- Agosto: 730 NFs; pior semana 3–9/08 = 557 NFs (não cabe no Bot)
- Últimos 7 dias: 0 NF; WhatsApp ativo (bulk)

Cota Pro (simulação, cota não publicada):

| Modo | Núcleo sem rotina | Núcleo + 8h/18h | Lote ago no Bot |
|---|---|---|---|
| Alex sobe NF | ~US$ 39 | ~US$ 60 | ~US$ 418 |
| Samuel sobe NF; Bot só tela | ~US$ 16 | ~US$ 38 | ~US$ 16 |

18 Bots com rotina (~US$ 180) não cabem no Pro, com ou sem upload.

---

## Equipe no papel (ele vai cortar amanhã)

Ordem combinada se autorizar: Jarvis → Alex+Caio → Bia → Nia+Leo → resto.

Alex no recorte novo: **não** e-mail/PDF; só `nf-stream-analyze.vercel.app` (lista, filtro, export). Ficha em `empresa/fichas/` ainda descreve o ritual de e-mail — **atualizar se ele confirmar este recorte**.

Cursor **não** é Bot Grok. É o inner loop do Leo.

---

## Pendente de confirmação dele

- Biografia seção 5 (`perfil/biografia.md`)
- O que fica / o que sai do organograma
- Autorizar Fase 1 (criar só o Jarvis)
- 4 pontos antigos: carteira pesada vs passeio; +100 clientes/dia; sistemas do dia; dor nº 1 da semana

---

## Amanhã — criação do Grok (depois do corte)

1. App Grok Bot, mesma conta Cursor.
2. Colar Jarvis: `empresa/fichas/01-gabinete-e-operacao.md` (e constituição comum).
3. Teste: lembrete + “se eu pedir lista 275 Metro Max, quem você dispara?” → Alex+Caio, não “eu busco no código”.
4. On-demand monthly limit em US$ 0 até ver a barra Weekly usage.

Não ligar Gmail. Não criar a frota inteira.
