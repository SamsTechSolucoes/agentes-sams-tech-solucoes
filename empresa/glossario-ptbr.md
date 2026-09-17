# Glossário PT-BR — SamsTech Agents

Termos oficiais do projeto. Preferir sempre a forma em português.

## Papéis (agentes)

| Termo PT-BR | Bot no Grok | Identificador técnico | Função resumida |
|---|---|---|---|
| Engenheiro Principal | SamsTech Engineer | SamsTechEngineer | Configura, desenvolve, testa e evolui. Único com Cursor por enquanto. |
| Secretária Pessoal | Secretária SamsTech | — | Interface principal: conversas, tarefas, lembretes, registros. |
| Gestor da Equipe | Gestor SamsTech | — | Decompõe pedidos, delega e acompanha execução. |
| Comercial | Comercial SamsTech | — | Carteira, acompanhamentos, inativos, histórico, propostas. |
| Produtos | Produtos SamsTech | — | Catálogo, estoque, equivalentes, aviso de produto aguardado. |
| Financeiro | Financeiro SamsTech | — | Inadimplência, cobranças, boletos, comissões (só com regra oficial). |
| Inteligência Comercial e Operacional | Inteligência SamsTech | — | Faturamento, metas, ofensores, logística, tickets/SLA. |
| Evolução / Arquitetura | Evolução SamsTech | — | Sugere especialização ou novos agentes; nunca cria sozinho. |

Mapa: `empresa/MAPA-EQUIPE.md`. Canal de grupo: **SamsTech Ops** (Engineer + Secretária + Gestor + Comercial).

## Autonomia

| Termo PT-BR | Significado |
|---|---|
| Pode fazer sozinho | Ação permitida sem pedir OK na hora. |
| Precisa de aprovação | Rascunho ou proposta; só executa com OK explícito de Samuel. |
| Nunca fazer sozinho | Proibido sem decisão formal (ex.: dinheiro, jurídico, irreversível). |

## Operação

| Termo PT-BR | Significado |
|---|---|
| Tarefa | Compromisso a executar; arquivo em `operacao/tarefas/`. |
| Lembrete | Aviso em data/hora; arquivo em `operacao/lembretes/`. |
| Registro | Nota do dia / acompanhamento / preferência. |
| Fila de aprovações | Rascunhos que não são enviados sozinhos. |
| Central de aprovações | Visão organizada do que depende do OK de Samuel. |
| Handoff | Passagem formal de uma demanda de um agente para outro. |
| Aprendizado | Classificar: comando pontual, preferência, procedimento ou regra permanente. |
| Regra permanente | Só após confirmação explícita de Samuel. |
| Ofensor | Fato ou hipótese que prejudica meta/resultado (separar fato de interpretação). |
| Cliente aguardando | Cliente esperando entrada de produto no estoque. |

## Fontes e sistemas

| Termo PT-BR | Significado |
|---|---|
| Sistema de notas fiscais | Referência externa `nf-stream-analyze` (não alterar sem permissão). |
| Fonte da verdade | Onde o dado oficial vive (decisão pendente: banco do sistema vs planilhas). |
| Camada operacional | Pastas e arquivos visíveis da operação local nesta pasta. |

## Ambiente Cursor (só Engenheiro Principal, por enquanto)

| Termo PT-BR | Significado |
|---|---|
| Cursor IA | Ambiente onde o Engenheiro Principal age com ferramentas. |
| Ferramentas do Cursor | Shell, arquivos, navegador, conectores (MCP), etc. |
| Navegador do Cursor | Ferramenta de browser da sessão (quando disponível). |
| Conector (MCP) | Ligação a serviço externo (Gmail, Agenda, etc.), se autenticado. |
