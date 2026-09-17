# Plano de Implementação por Fases — SamsTech Agents V2

Data do plano: 17/09/2026
Base: Arquitetura V2 (16/09/2026) × diagnóstico nf-stream-analyze × regras do Engenheiro Principal
Status: AGUARDANDO AUTORIZAÇÃO PARA INICIAR QUALQUER FASE
Princípio: reutilizar o SaaS atual (nf-stream-analyze); substituir progressivamente; primeira versão pequena e testável.

## Síntese da comparação

### Já existe e deve ser reutilizado (nf-stream-analyze)
- Pipeline NF/PDF (upload, process-invoice, Gemini, clientes, faturamento)
- CRM parcial (clients, histórico, inativos, notas, alertas)
- Catálogo / promoções
- Dashboard / metas
- Lembretes + notificações
- WhatsApp/Baileys (envio, campanhas, bulk) — com gate de aprovação humana
- Auth Supabase + RLS + Storage
- Docs e regras de desenvolvimento no repo

### Existe e precisa adaptar
- WhatsApp/Baileys (ops multi-host, anti-ban)
- Documentação espalhada
- Testes ainda rasos
- Higiene de segredos no git (.env*, Tokens & Keys.txt)

### Arquitetura V2 pede e ainda NÃO existe (ou só no papel)
- Equipe multiagente (Secretária, Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução)
- Central de Aprovações formal
- Camada Google Drive/Sheets como superfície operacional visível
- Integração Gmail / Calendar / Contacts (padrão CNPJ/CPF - Nome [Cliente Cantu])
- Estoque + “cliente aguardando produto”
- Inadimplência semanal + boletos + comissões (regras da empresa)
- Tickets internos + SLA
- Relatórios de ofensores (fatos ≠ interpretações)
- Aprendizado tipado (comando / preferência / procedimento / regra permanente)

### Tensões a resolver com Samuel (antes ou durante Fase 0)
1. Fonte da verdade: Supabase (atual) vs Sheets (V2) — recomendação: Supabase SoT operacional; Sheets espelho analítico.
2. Upload de NF: continua manual (política handoff) ou Secretária lê e-mail autorizado?
3. Onde vive a “equipe”: só Grok Bots, ou também rotinas/código no nf-stream?
4. Escopo v1: só uso pessoal do Samuel (sim) — quais 3 dores da semana priorizar?

---

## FASE 0 — Fundação e alinhamento (pré-código de produto)

### Objetivo
Fechar decisões, higiene de segurança e baseline documental para desenvolver com custo previsível e sem apagar o que funciona.

### Funcionalidades
- Consolidar arquitetura V2 no repo de agentes
- Merge/revisão do PR de instruções
- Inventário de segredos e plano de rotação (sem expor valores)
- Definir SoT (Supabase vs Sheets) e mapa de reuso
- Critérios de custo (sem overage)

### Arquivos afetados
- `agentes-sams-tech-solucoes`: Documentação/arquitetura/*, AGENTS.md, PR #1
- Possivelmente `.gitignore` / remoção de secrets no `nf-stream-analyze` (só após autorização)

### Dados envolvidos
- Nenhum dado de produção alterado
- Inventário de variáveis (nomes, não valores)

### Integrações
- GitHub; opcional: checklist Supabase/Vercel/Baileys (somente leitura)

### Dependências
- Autorização Samuel para limpeza de secrets
- Confirmação SoT e escopo v1

### Riscos
- Segredos no histórico git continuam exploráveis até limpeza/rotação
- Drift pasta local vs GitHub

### Testes
- Checklist: PR revisado; arquitetura versionada; lista de decisões fechadas

### Critérios de conclusão
- Arquitetura V2 no GitHub
- Decisões SoT + escopo v1 registradas em Documentação/decisoes/
- Plano de secrets aprovado (executado ou agendado)
- Nenhuma feature de produto iniciada sem OK da Fase 1

### Decisões que dependem de Samuel
- Autorizar limpeza/rotação de secrets
- Confirmar Supabase como SoT + Sheets como espelho (ou outra opção)
- Confirmar se upload NF permanece manual na v1
- Confirmar 3 dores prioritárias da v1
- Merge do PR #1

---

## FASE 1 — Secretária Pessoal (MVP utilizável)

### Objetivo
Samuel fala com uma interface única (Secretária) que consulta o que o nf-stream já sabe e avisa o que importa — sem ele precisar “lembrar de perguntar”.

### Funcionalidades
- Bot Secretária no Grok Bot (texto; áudio depois)
- Consultas read-only: cliente, última compra, inativos, NF recente, lembretes
- Criar/listar lembretes (via app/API existente ou procedimento assistido)
- Rascunhar mensagem WhatsApp (NÃO enviar sem aprovação)
- Fila simples de “precisa da sua aprovação”
- Rotina matinal: resumo do que precisa atenção

### Arquivos afetados
- `agentes-sams-tech-solucoes`: fichas/empresa, routines docs
- Possivelmente endpoints/views read-only no `nf-stream-analyze` (mínimo)
- Skills/routines do Grok Bot (após aprovação)

### Dados envolvidos
- clients, invoices, reminders, user_settings (leitura)
- Preferências leves da Secretária (sem regra permanente sem OK)

### Integrações
- nf-stream (Supabase read) via conector seguro ou fluxo aprovado
- Opcional depois: Calendar

### Dependências
- Fase 0
- Acesso autenticado sem expor service role no bot compartilhado

### Riscos
- Vazamento de dados entre bots da mesma conta
- Custo de rotinas diárias no plano Pro
- Escopo creep (“já faz financeiro”)

### Testes
- Perguntas-piloto: “clientes inativos 90d”, “última NF do cliente X”, “o que preciso aprovar?”
- Garantir que envio WhatsApp exige OK explícito

### Critérios de conclusão
- Samuel usa a Secretária em 1 dia real de trabalho
- 3 consultas confiáveis + 1 resumo matinal
- Zero envios externos autônomos

### Decisões que dependem de Samuel
- Nome/ficha da Secretária
- Horário do resumo matinal
- Autorizar conector(ões) necessários
- Autorizar criação da routine

---

## FASE 2 — Comercial / CRM sobre dados existentes

### Objetivo
Cobrir carteira, follow-ups e inativos com alertas proativos, reusando o CRM do nf-stream.

### Funcionalidades
- Alertas de inativos (já parcialmente no app) → Secretária/Comercial
- Sugestão de follow-up com histórico de compras
- Padrão de contato CNPJ/CPF - Nome [Cliente Cantu] (migração gradual)
- Múltiplos telefones tipados (WhatsApp / comprador / financeiro)
- Rascunhos de proposta (template; envio com aprovação)

### Arquivos afetados
- `nf-stream-analyze`: clients schema/UI (phones tipados, naming), alertas
- Agente Comercial (ficha) + regras de delegação da Secretária

### Dados envolvidos
- clients, client_notes, client_analytics, phones

### Integrações
- WhatsApp (rascunho); Contacts depois

### Dependências
- Fase 1
- Definição do sufixo “[Cliente Cantu]” e casos especiais

### Riscos
- Renomear contatos em massa quebra histórico WhatsApp
- Dados incompletos de telefone

### Testes
- Amostra de 20 clientes com padrão de nome
- Alerta de inativo dispara e aparece na Secretária

### Critérios de conclusão
- Fluxo inativo→sugestão→rascunho→aprovação→envio (manual/aprovado) validado
- Padrão de contato documentado e aplicado em novos cadastros

### Decisões que dependem de Samuel
- Regras de inatividade (dias)
- Se migra nomes antigos ou só novos
- Templates de mensagem permitidos

---

## FASE 3 — Notas fiscais alinhadas à V2

### Objetivo
Fechar o loop NF → cliente → histórico/faturamento → alerta, reusando process-invoice; opcionalmente estoque quando Fase 5 existir.

### Funcionalidades
- Manter upload (Samuel) + extração/validação/relação cliente
- Alertas pós-NF (cliente novo, divergência, valor atípico)
- Se e-mail autorizado: Secretária detecta NF e avisa (ainda sem processar sozinha, salvo OK)
- Atualização de faturamento/metas (já existente) com notificação

### Arquivos afetados
- `supabase/functions/process-invoice`, UI upload, docs NF
- Secretária: playbook de NF

### Dados envolvidos
- invoices, invoice_items, clients, storage PDFs

### Integrações
- Gemini (já); Gmail (opcional); Storage

### Dependências
- Fases 0–1
- Política de e-mail NF

### Riscos
- Custo Gemini em picos (ex.: agosto)
- Duplicidade / idempotência

### Testes
- Lote pequeno de PDFs; idempotência; alerta gerado

### Critérios de conclusão
- Pipeline atual estável + alertas V2 mínimos
- Política e-mail/NF documentada

### Decisões que dependem de Samuel
- Secretária pode ou não puxar NF do e-mail na v1
- Thresholds de alerta

---

## FASE 4 — Camada Google (Drive / Sheets) visível

### Objetivo
Expor visão operacional/analítica em Sheets sem abandonar Supabase como SoT.

### Funcionalidades
- Espelho read-only: clientes, NFs recentes, inativos, metas
- Docs executivos (resumos) no Drive
- Rotina de sync com custo controlado

### Arquivos afetados
- Scripts/sync (novo, mínimo) ou MCP Google
- Documentação de mapeamento de abas

### Dados envolvidos
- Cópias derivadas (não SoT)

### Integrações
- Google Drive, Sheets

### Dependências
- Fase 1–2; OAuth Google; decisão SoT

### Riscos
- Duplicidade de verdade; sync stale; escopo LGPD

### Testes
- Conferência amostral Sheet ↔ Supabase

### Critérios de conclusão
- 1 workbook operacional usado por Samuel sem editar SoT no Sheet

### Decisões que dependem de Samuel
- Estrutura das abas
- Frequência de sync
- Conta Google a conectar

---

## FASE 5 — Produtos: estoque + cliente aguardando

### Objetivo
Avisar quando entrar produto que cliente aguarda.

### Funcionalidades
- Cadastro de “aguardando produto X para cliente Y”
- Entrada de estoque (manual ou via NF/itens)
- Notificação automática à Secretária/Samuel
- Equivalências de produto (fase interna ou seguinte)

### Arquivos afetados
- Novas tabelas/UI no nf-stream; catálogo existente; agente Produtos

### Dados envolvidos
- catalog_items, stock (novo), waiting_list (novo), invoice_items

### Integrações
- NF (entrada); WhatsApp rascunho com aprovação

### Dependências
- Fases 1–3; regras de equivalência

### Riscos
- Estoque impreciso sem processo de entrada disciplinado

### Testes
- Cenário: aguarda → entra → notifica uma vez (idempotente)

### Critérios de conclusão
- 1 fluxo real ponta a ponta no mês

### Decisões que dependem de Samuel
- Como mede “entrada” (NF compra? planilha?)
- Regras de equivalência iniciais

---

## FASE 6 — Financeiro (inadimplência, cobrança, comissões)

### Objetivo
Processar inadimplência semanal e preparar cobranças/comissões sem executar dinheiro.

### Funcionalidades
- Import/processamento semanal de inadimplência
- Fila de cobrança com aprovação
- Cálculo de comissões segundo regras oficiais da empresa
- Nunca movimentar valores sozinho

### Arquivos afetados
- Novos módulos nf-stream ou Sheets financeiros; agente Financeiro; Central de Aprovações

### Dados envolvidos
- Débitos, boletos (refs), regras de comissão, histórico de cobrança

### Integrações
- Planilhas/PDF de inadimplência; WhatsApp/e-mail (aprovado)

### Dependências
- Regras de comissão por escrito; fonte oficial de inadimplência

### Riscos
- Regra financeira inventada (proibido); LGPD; reputação

### Testes
- Semana simulada; comissão bate com exemplo manual do Samuel

### Critérios de conclusão
- 1 ciclo semanal completo com aprovação humana em todo envio

### Decisões que dependem de Samuel
- Documento oficial de comissões
- Fonte e formato da inadimplência
- Textos e canais de cobrança

---

## FASE 7 — Inteligência: ofensores, metas, tickets/SLA

### Objetivo
Relatórios que separam fatos de interpretações; visão de metas e tickets.

### Funcionalidades
- Relatórios de ofensores: Comercial, Produto, Logística, Processos, Financeiro
- Uso das metas/dashboard existentes
- Tickets internos + SLA (se houver fonte)

### Arquivos afetados
- Relatórios/export; agente Inteligência; possível Sheet analítico

### Dados envolvidos
- Faturamento, metas, tickets (novo ou importado)

### Integrações
- Sheets; fontes de ticket (a definir)

### Dependências
- Fases 1–2; definição de taxonomia de ofensores

### Riscos
- Interpretação passada como fato; dados incompletos de logística

### Testes
- Relatório revisado por Samuel marca fatos vs hipóteses corretamente

### Critérios de conclusão
- 1 relatório semanal útil na rotina

### Decisões que dependem de Samuel
- Taxonomia e pesos
- Existe sistema de tickets hoje? Qual?

---

## FASE 8 — Gestor + Central de Aprovações + equipe completa

### Objetivo
Secretária não faz tudo: Gestor decompõe/delega; aprovações centralizadas.

### Funcionalidades
- Gestor: decomposição de tarefas e handoff entre agentes
- Central de Aprovações (enviar mensagem, cobrança, cancelar, alterar crítico)
- Agentes Comercial/Produtos/Financeiro/Inteligência operando sob o Gestor
- Evolução/Arquitetura só sugere novos agentes (nunca cria sozinho)

### Arquivos afetados
- Fichas de agentes; routines; possível UI de aprovações no app

### Dados envolvidos
- Fila de aprovações, audit log

### Integrações
- Todos os módulos anteriores

### Dependências
- Fases 1–7 mínimas estáveis; orçamento de Bots no Pro

### Riscos
- Custo de muitos bots/rotinas; complexidade; falha de handoff

### Testes
- Pedido composto: “prepare cobrança dos inativos do item X” → Gestor → Financeiro/Comercial → aprovação

### Critérios de conclusão
- 1 fluxo multiagente com aprovação registrada
- Nenhum agente novo criado sem OK

### Decisões que dependem de Samuel
- Quais agentes criar na ordem (cortar organograma)
- Limite de gasto Pro / on-demand = 0

---

## FASE 9 — Secretária completa (Gmail, Calendar, Contacts, áudio)

### Objetivo
Fechar interface principal da V2 com agenda e e-mails autorizados.

### Funcionalidades
- Gmail no escopo autorizado
- Calendar + lembretes
- Contacts com padrão de nome
- Áudio → texto → ação

### Arquivos afetados
- Conectores; playbooks Secretária; permissões

### Dados envolvidos
- E-mails/eventos/contatos no escopo

### Integrações
- Gmail, Calendar, Contacts

### Dependências
- Fase 1 e 8; política de escopo de e-mail

### Riscos
- Escopo amplo demais; LGPD; custo

### Testes
- Casos autorizados vs recusados

### Critérios de conclusão
- Secretária trata agenda + e-mail NF/comercial no escopo sem ações irreversíveis

### Decisões que dependem de Samuel
- Contas e filtros de e-mail autorizados
- O que a Secretária pode responder sozinha vs rascunhar

---

## Ordem recomendada de autorização
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9

**Primeira versão utilizável sugerida:** concluir Fases 0–2 (Secretária + Comercial proativo sobre o que já existe).

**Não iniciar código até Samuel autorizar explicitamente a Fase 0 ou a Fase 1.**
