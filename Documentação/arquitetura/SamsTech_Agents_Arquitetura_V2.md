# SamsTech Agents — Arquitetura V2

**Data oficial:** 16/09/2026  
**Decisor:** Samuel  
**Status:** consolidado como **fonte de produto** neste repositório.  
**Implementação:** **não começar** features. Só após **plano por fases** e **autorização explícita** do Samuel.

Produto de código (não está neste repo): https://github.com/SamsTechSolucoes/nf-stream-analyze  
Produção: https://nf-stream-analyze.vercel.app

---

## Proveniência deste arquivo

O Samuel entregou o documento oficial de arquitetura V2 em **16/09/2026**.

Este Cloud Agent recebeu, em 17/09/2026, a ordem de versionar o **conteúdo integral colado**, com o seguinte **índice oficial** (literal):

> Secretária, Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução; autonomia; NF; Drive/Sheets; estoque; inadimplência; ofensores; custo/segurança.

O **texto corrido completo não veio no payload** deste agente (sem anexo, sem URL, sem corpo além do índice).  
**Não inventar** papéis, SLAs, ferramentas, fluxos ou regras que não estejam escritos aqui.  
Se o Samuel reenviar o documento integral, **substituir** as seções abaixo pelo texto original — não “completar” com suposição.

Enquanto o corpo integral não estiver neste arquivo, ninguém deve implementar produto “com base na V2”.

---

## 1. O que a V2 é (e o que não é)

| É | Não é |
|---|---|
| Fonte de produto para agentes (mapa de domínios oficiais) | Autorização para implementar agora |
| Substitui o *placeholder* de `Documentação/arquitetura/` | Desenho para reconstruir o NF-Stream-Analyze do zero |
| Convivência com a diretriz do Engenheiro Principal | Autorização para criar a frota Grok Bot da Fase 0 (Jarvis, Alex, …) |

O sistema que já opera continua sendo o **NF-Stream-Analyze**. A V2 organiza **domínios de agentes** em cima desse produto. Satélites Lovable (`neon-flow`, `prospecta-b2b-lead-finder`) não viram núcleo por inércia.

Handoff histórico (não apagar): `AMANHA.md`, `docs/conversa-handoff-15-09-2026.md`. Não misturar organograma teórico da Fase 0 com estes sete domínios até o Samuel dizer o recorte.

---

## 2. Mapa oficial de domínios (16/09/2026)

Sete domínios nomeados pelo Samuel, nesta ordem:

1. **Secretária**
2. **Gestor**
3. **Comercial**
4. **Produtos**
5. **Financeiro**
6. **Inteligência**
7. **Evolução**

Não acrescentar um oitavo domínio. Não renomear. Não fundir. Não criar sub-bots sem autorização.

---

## 3. Domínio — Secretária

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Qualquer ritual de agenda, atendimento, triagem ou despacho **só** entra aqui quando o texto integral do Samuel estiver colado. Até lá: não implementar.

## 4. Domínio — Gestor

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Decisões de gestão, autonomia entre agentes e escalonamento para o Samuel **não** devem ser inventadas.

## 5. Domínio — Comercial

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Campanhas, disparo, carteira e ofensores comerciais: ver temas transversais. Envio em massa e scraping de WhatsApp Web permanecem **recusados** sem aval (handoff 15/09/2026, vigente até o Samuel mudar).

## 6. Domínio — Produtos

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Catálogo no NF-Stream-Analyze está classificado como **EXISTENTE E FUNCIONANDO** (diagnóstico 17/09/2026). **Estoque** é tema transversal da V2 — não assumir que catálogo = estoque.

## 7. Domínio — Financeiro

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

**Inadimplência** é tema transversal da V2. Lembretes/alertas no produto estão **EXISTENTE E FUNCIONANDO**; não igualar automaticamente a política financeira da V2.

## 8. Domínio — Inteligência

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Analytics/dashboards no produto estão **EXISTENTE E FUNCIONANDO**. **Ofensores** é tema transversal da V2 — sem regra versionada aqui.

## 9. Domínio — Evolução

Domínio oficial da V2. Sem detalhe operacional versionado neste git além do nome.

Evolução do produto é **trilho B** (código), separado da operação de tela. Skills/Routines só após processo estável **e** aprovação explícita.

---

## 10. Temas transversais oficiais (índice V2)

Estes temas foram nomeados no mesmo documento de 16/09/2026. Não são licença para implementar.

### 10.1 Autonomia

- Agente **não** amplia autonomia por conta própria.
- Perguntar ao Samuel em arquitetura, negócio, produção, custo e serviços pagos.
- Skills/Routines: só depois de processo estável + aprovação explícita.
- Detalhe fino de “o que cada domínio pode fazer sozinho” **não** está neste git até o texto integral.

### 10.2 NF

- Upload de NF, no handoff vigente, é do **Samuel**.
- No produto: NF/PDF (`pdf-parse`, pdfjs, `process-invoice` / Gemini) = **EXISTENTE E FUNCIONANDO**.
- Não reconstruir pipeline de NF. Não processar lote histórico “para testar agente”.

### 10.3 Drive / Sheets

- Tema oficial da V2.
- **Não** aparece como núcleo no diagnóstico 17/09/2026 deste ambiente.
- Classificação até validar: **NÃO FOI POSSÍVEL VALIDAR** (pode ser novo, satélite ou processo manual do Samuel).
- Não ligar Gmail/Drive/Sheets em Bot sem autorização (Fase 0: não ligar Gmail).

### 10.4 Estoque

- Tema oficial da V2. Sem regra de reposição, reserva ou ruptura versionada aqui.
- Não inventar módulo de estoque no NF-Stream-Analyze.

### 10.5 Inadimplência

- Tema oficial da V2. Sem política de cobrança, prazo ou tom de mensagem versionada aqui.
- Não disparar cobrança.

### 10.6 Ofensores

- Tema oficial da V2 (clientes/produtos/comportamentos que ofendem a meta — sentido a confirmar no texto integral).
- Sem lista, critério ou ação automática versionada aqui.

### 10.7 Custo e segurança

Vigente (diretriz do Engenheiro Principal + diagnóstico):

- Cursor Pro; modelo **automático**; sem overage/serviço pago sem aprovação.
- Segredos **nunca** em código, commit, log ou chat.
- Achado crítico: `.env*` e `Tokens & Keys.txt` aparentam estar no git tree do produto → **EXISTENTE E PRECISA SER ADAPTADA**. Não copiar valores.
- Produção, 2FA, merge, deploy e envio ao cliente: Samuel.

---

## 11. Relação com o que já existe

Ver [../diagnostico-ambiente-2026-09-17.md](../diagnostico-ambiente-2026-09-17.md).

Preservar o que está **EXISTENTE E FUNCIONANDO** (frontend, Edge Functions, DB+RLS, auth, storage, NF/PDF, catálogo, clientes, dashboards, alertas, CI, deploy Vercel).  
Adaptar só o marcado como tal (WhatsApp/Baileys, docs espalhados, Vitest, higiene de segredos).

A V2 **não** autoriza apagar isso para caber um domínio novo.

---

## 12. Condição para sair do papel

1. Corpo integral da V2 versionado neste arquivo (texto do Samuel, não reconstrução).
2. **Plano por fases** escrito e aprovado.
3. **Autorização explícita** para a fase em questão.
4. Trabalho no repo certo (`nf-stream-analyze` para código de produto; este repo só docs/agentes).

Até lá: **implementação de produto NÃO começou e não deve começar.**
