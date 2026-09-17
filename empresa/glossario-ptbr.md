# Glossário PT-BR — SamsTech Agents

Termos oficiais do projeto. Preferir sempre a forma em português.

## Papéis (agentes)

| Termo PT-BR | Identificador técnico (se houver) | Função resumida |
|---|---|---|
| Engenheiro Principal | SamsTechEngineer | Configura, desenvolve, testa e evolui o sistema. Único com Cursor por enquanto. |
| Secretária Pessoal | — | Interface principal com Samuel: conversas, tarefas, lembretes, registros. |
| Gestor da Equipe | — | Decompõe pedidos, delega e acompanha execução entre agentes. |
| Comercial | — | Carteira, clientes, acompanhamentos, inativos, histórico, propostas. |
| Produtos | — | Catálogo, estoque, entradas, equivalentes, aviso de produto aguardado. |
| Financeiro | — | Inadimplência, cobranças, boletos, comissões (só com regra oficial). |
| Inteligência Comercial e Operacional | — | Faturamento, metas, ofensores, logística, tickets/SLA. |
| Evolução / Arquitetura | — | Sugere especialização ou novos agentes; nunca cria sozinho. |

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
