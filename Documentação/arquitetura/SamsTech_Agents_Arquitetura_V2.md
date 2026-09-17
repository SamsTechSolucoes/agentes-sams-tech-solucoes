# SamsTech Agents — Arquitetura V2 / Especificação para Cursor AI

Data: 16/09/2026
Status: consolidado para início do desenvolvimento
Objetivo: construir a primeira versão utilizável do SamsTech Agents para uso pessoal de Samuel na rotina comercial, substituindo progressivamente o SaaS SamsTech atual.

## 1. INSTRUÇÃO PRINCIPAL
- Inspecione completamente o repositório atual.
- Identifique o que já existe, o que funciona e o que pode ser reutilizado.
- Não apague nem substitua componentes sem entender sua finalidade.
- Priorize uma primeira versão pequena, funcional e testável.
- Samuel é o usuário final, vendedor e tomador das decisões importantes.

## 2. OBJETIVO CENTRAL
"Samuel não deve precisar lembrar que precisa perguntar."
Se o sistema possui informação suficiente para identificar que algo relevante aconteceu, deve monitorar e avisar no momento adequado.
"Samuel não deve precisar operar os sistemas para obter informações que o SamsTech já consegue consultar."

## 3. MODELO ORGANIZACIONAL
SAMUEL (Vendedor / Diretor) -> SECRETÁRIA -> GESTOR SAMSTECH -> [COMERCIAL, PRODUTOS, FINANCEIRO] -> INTELIGÊNCIA COMERCIAL E OPERACIONAL -> CENTRAL DE APROVAÇÕES -> DADOS/FONTES.

## 4. EQUIPE INICIAL
- Secretária Pessoal (Interface principal, recebe instruções, texto/áudio, agenda, e-mails, NF, contatos, solicita aprovações).
- Gestor da Equipe SamsTech (Coordenação, decompõe e delega tarefas, acompanha execução).
- Comercial / CRM (Carteira, clientes, follow-ups, inativos, histórico de compras, propostas).
- Produtos (Catálogo, estoque, entradas, produtos equivalentes, avisa quando entra produto esperado).
- Financeiro (Inadimplência, cobranças, boletos, cálculo de comissões segundo regras da empresa).
- Inteligência Comercial e Operacional (Análise de faturamento, metas, ofensores, logística, tickets/SLA).
- Evolução / Arquitetura (Identifica quando a equipe precisa de especialização ou novos agentes, sempre com aprovação humana).

## 5. AUTONOMIA
- Pode fazer sozinho: Pesquisar, organizar, analisar, cadastrar, atualizar CRM, criar lembretes, processar NF, preparar relatórios e rascunhar mensagens.
- Precisa de aprovação: Enviar mensagens comerciais, iniciar cobranças, cancelar registros, alterar informações críticas.
- Nunca fazer sozinho: Movimentações financeiras, contratações, compromissos jurídicos, ações irreversíveis.

## 6. REGRA FUNDAMENTAL DE DÚVIDA
Nunca inventar. Se houver dúvida, informação ausente ou conflito, pergunte a Samuel.

## 7. APRENDIZADO
Separar comando pontual, preferência do cliente, procedimento e regra permanente. Regras permanentes só após confirmação explícita de Samuel.

## 8. CONTATOS E E-MAIL
Padrão de nome de contato: CNPJ/CPF - Nome da empresa [Cliente Cantu]. Preservar múltiplos telefones (WhatsApp, comprador, financeiro). Secretária processa e-mails autorizados dentro do escopo.

## 9. NOTAS FISCAIS
Receber NF -> extrair -> validar -> relacionar cliente -> atualizar histórico, faturamento e estoque -> alertar se necessário.

## 10. BANCO DE DADOS E FONTES
Google Drive + Google Sheets como camada operacional visível (Sheets = camada analítica, Docs = executiva). Fontes: Sheets, Drive, Gmail, Calendar, Contacts, WhatsApp, PDFs.

## 11. DEMAIS MÓDULOS E REQUISITOS
- Estoque + Cliente Aguardando: Notificar quando produto aguardado entrar no estoque.
- Inadimplência e Tickets: Processamento semanal de inadimplência; controle e análise de SLA de tickets internos.
- Relatórios de Ofensores: Relatórios categorizados por Comercial, Produto, Logística, Processos e Financeiro (separando fatos de interpretações).
- Custo e Segurança: Custo mensal previsível (sem overage/cobranças variáveis). Segurança e LGPD estritos, sem bypass de autenticação.
