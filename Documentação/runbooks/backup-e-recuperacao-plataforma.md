# Backup e recuperação da operação SamsTech Agents

## Objetivo

Preservar arquitetura, decisões, fichas, procedimentos, scripts e experiência
operacional mesmo se Grok Bot, Cursor ou outro fornecedor ficar indisponível.

## O que o GitHub preserva

- arquitetura e plano por fases;
- constituição, organograma e fichas dos agentes;
- decisões autorizadas por Samuel;
- playbooks, runbooks, templates e scripts locais;
- estrutura de `operacao/` e registros sem dados privados;
- histórico de evolução por commits e branches.

## O que não deve ir ao GitHub

- senhas, tokens, códigos 2FA e arquivos `.env`;
- dados pessoais exportados de clientes;
- PDFs de notas fiscais e imagens privadas;
- logs locais que contenham sessão ou conteúdo sensível.

Esses itens devem permanecer em armazenamento privado com backup próprio. O
GitHub recupera a lógica da empresa, mas não substitui o backup dos dados.

## Procedimento de backup

1. Executar os validadores e smoke tests aplicáveis.
2. Conferir `git status` e o diff completo.
3. Confirmar que arquivos privados estão ignorados.
4. Criar uma branch de backup; nunca enviar diretamente para `main`.
5. Criar commit em padrão Conventional Commits.
6. Enviar a branch ao GitHub.
7. Abrir PR para revisão antes de integrar em `develop` e depois em `main`.
8. Registrar data, branch, commit, testes e pendências em `operacao/registros/`.

## Recuperação em outra plataforma

1. Clonar o repositório oficial.
2. Ler `AGENTS.md`, `STATUS.md`, a Arquitetura V2 e este runbook.
3. Recriar os sete papéis e o Engenheiro Principal usando as fichas.
4. Aplicar a constituição comum e o organograma sem inverter delegações.
5. Reautorizar conectores pelo fluxo seguro da nova plataforma; nunca copiar
   tokens antigos para documentos.
6. Restaurar os dados privados a partir do backup privado.
7. Executar `scripts/validar-estrutura.ps1` e os smoke tests.
8. Ativar primeiro a Secretária; depois os demais domínios pelos gates das
   fases. Nenhum envio externo é liberado apenas porque a estrutura foi
   restaurada.

## Frequência recomendada

- após decisão estrutural ou mudança operacional relevante;
- ao fim de cada sessão de implementação;
- antes de trocar plataforma, conta, máquina ou conector;
- revisão semanal para confirmar que a branch foi integrada e que o backup
  privado dos dados também está atualizado.

## Limitação atual

As tarefas agendadas do Windows executam na máquina em que foram instaladas e
dependem das condições de logon dessa máquina. Elas precisam ser recriadas e
testadas na máquina sempre ligada da Secretária antes de serem tratadas como
rotinas contínuas.
