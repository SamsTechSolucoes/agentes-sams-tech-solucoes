# Recriar a SamsTech Agents em outra plataforma

Este é o caminho mínimo para uma IA reconstruir a lógica do projeto sem acesso
às conversas antigas do Grok ou Cursor.

## Ordem obrigatória de leitura

1. `AGENTS.md` — identidade e limites do Engenheiro Principal.
2. `STATUS.md` — estado operacional mais recente.
3. `Documentação/arquitetura/SamsTech_Agents_Arquitetura_V2.md` — desenho oficial.
4. `Documentação/Plano_Implementacao_Fases_V2.md` — ordem e critérios das fases.
5. `empresa/constituicao-comum.md` — autonomia compartilhada.
6. `empresa/MAPA-EQUIPE.md` — ligação entre papéis, fichas e operação.
7. `Documentação/decisoes/README.md` — decisões posteriores ao plano.
8. `Documentação/runbooks/backup-e-recuperacao-plataforma.md` — restauração.

## Papéis a recriar

- Secretária Pessoal;
- Gestor da Equipe;
- Comercial;
- Produtos;
- Financeiro;
- Inteligência Comercial e Operacional;
- Evolução / Arquitetura;
- Engenheiro Principal (`SamsTechEngineer`).

As instruções de cada papel estão em `empresa/fichas/`. O Engenheiro Principal
não é um departamento adicional: é o executor técnico que mantém arquivos,
scripts, conectores e backups. O bot “SamsTech Engineer” em outra plataforma é
apenas uma interface adicional para o mesmo papel.

## Sequência de reconstrução

1. Clonar este repositório.
2. Recriar os papéis usando constituição, mapa e fichas.
3. Ativar primeiro Secretária e Engenheiro.
4. Restaurar os dados privados a partir de backup privado; nunca do Git público.
5. Reautorizar Gmail, Calendar, Drive, Teams, WhatsApp e Supabase pelos fluxos
   oficiais, sem copiar tokens antigos.
6. Recriar as tarefas agendadas na máquina sempre ligada.
7. Executar `scripts/validar-estrutura.ps1` e os smoke tests.
8. Liberar os demais departamentos somente pelos gates das fases.

## Identidade visual

- logo e avatares recuperáveis:
  `Avatares do Sistema/SamsTechSolucoes_AVATARES/`;
- mapeamento dos papéis:
  `Documentação/arquitetura/mapa-avatares-agentes.md`.

## O Git não recupera sozinho

- PDFs, imagens privadas e dados identificáveis do NF;
- logins, tokens, sessões do navegador e 2FA;
- tarefas do Windows;
- configuração interna dos bots em cada fornecedor;
- sessões do Teams e WhatsApp.

Esses componentes exigem backup privado e nova autorização. Restaurar a
estrutura nunca libera automaticamente envio a cliente, cobrança ou produção.
