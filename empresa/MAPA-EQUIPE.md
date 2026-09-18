# Mapa da equipe Grok Bot × fichas

Os **bots já foram criados** no Grok. Este arquivo liga o **nome do chat** à **ficha** neste git.  
Não é autorização para operar Comercial/Produtos/Financeiro ao vivo.

**Repo exclusivo:** https://github.com/SamsTechSolucoes/agentes-sams-tech-solucoes  
**Pasta:** `C:\Users\notebook\Desktop\SamsTechSolucoes-Agentes`  
**Nunca:** `nf-stream-analyze`.

Constituição (todos): [constituicao-comum.md](./constituicao-comum.md)  
Glossário: [glossario-ptbr.md](./glossario-ptbr.md)  
Organograma V2: Secretária → Gestor → [Comercial, Produtos, Financeiro] → Inteligência → Central de aprovações. Evolução **só sugere**.

## Tabela

| Bot no Grok (nome do chat) | Papel PT-BR | Ficha | Pasta de operação | Cursor | Estado 17/09 |
|---|---|---|---|---|---|
| **Secretária SamsTech** | Secretária Pessoal | [fichas/01-secretaria.md](./fichas/01-secretaria.md) | `operacao/tarefas`, `lembretes`, `registros`, `fila-aprovacoes`, `fontes/consultas` | Não | **Fase 1 concluída**; gravação via Engenheiro |
| **Gestor SamsTech** | Gestor da Equipe | [fichas/02-gestor.md](./fichas/02-gestor.md) | `operacao/gestor` | Não | **Handoff local** — não é Fase 8 ao vivo |
| **Comercial SamsTech** | Comercial | [fichas/03-comercial.md](./fichas/03-comercial.md) | `operacao/comercial/` | Não | **Fase 2 ativa em modo local**; sem envio |
| **Produtos SamsTech** | Produtos | [fichas/04-produtos.md](./fichas/04-produtos.md) | `operacao/produtos` | Não | Scaffolding |
| **Financeiro SamsTech** | Financeiro | [fichas/05-financeiro.md](./fichas/05-financeiro.md) | `operacao/financeiro` | Não | Scaffolding |
| **Inteligência SamsTech** | Inteligência Comercial e Operacional | [fichas/06-inteligencia.md](./fichas/06-inteligencia.md) | `operacao/inteligencia` | Não | Scaffolding |
| **Evolução SamsTech** | Evolução / Arquitetura | [fichas/07-evolucao.md](./fichas/07-evolucao.md) | (sugestões) | Não | Scaffolding |
| **SamsTech Engenheiro Principal** | Engenheiro Principal | [AGENTS.md](../AGENTS.md) | este git | **Sim** | **Operacional e pronto** no Grok |

Nomes sem acento no Grok (`Secretaria`, `Inteligencia`, `Evolucao`) = o mesmo bot. Preferir PT-BR na fala.

## Canal de grupo

**SamsTech Ops** — Engineer + Secretária + Gestor + Comercial.

Não colocar Produtos/Financeiro/Inteligência/Evolução no grupo até o Samuel pedir.  
O grupo **não** autoriza envio WhatsApp nem trabalho em NF.

## Configuração Grok (checklist)
Roteiro completo: [Documentação/CONFIGURAR-GROK-FINAL.md](../Documentação/CONFIGURAR-GROK-FINAL.md)

## Como usar

1. Samuel fala neste chat do **Engenheiro** (execução) ou com a **Secretária SamsTech** no Grok (conversa).  
2. Outros bots: colar/ler a ficha da coluna **Ficha**; não inventar regra de comissão, estoque ou cobrança.  
3. Dúvida de pasta ou “quem faz o quê”: este mapa, depois a ficha.
4. Configuração, git, scripts, fontes: **SamsTech Engineer** no Cursor.  
5. WhatsApp diretrizes (número pessoal Samuel): sessão no **navegador do Grok** do SamsTech Engineer — playbook `Documentação/playbooks/whatsapp-engenheiro-samuel.md`.
6. Dados reais de cliente/NF: só depois do pacote S1 — `operacao/fontes/STATUS.md`.

## O que o mapa não é

- Não é Fase 3–9 ao vivo.
- Não é organograma antigo (Jarvis, Alex, Caio, Bia, 18 cargos).
- Não é o sistema de NF.
