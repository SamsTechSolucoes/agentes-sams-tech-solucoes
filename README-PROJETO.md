# SamsTech Soluções — Agentes

Projeto de **agentes e documentação**, construído **do zero nesta pasta** (`Desktop/SamsTechSolucoes-Agentes`).

O sistema de NF em produção (**nf-stream-analyze**) é **referência externa apenas** — não editar a partir daqui sem autorização explícita do Samuel.

## O que tem aqui

| Área | Conteúdo |
|---|---|
| `AGENTS.md` / `.cursor/rules/` | Identidade Engenheiro Principal + regras |
| `empresa/` | Constituição comum + fichas dos domínios |
| `operacao/` | Tarefas, lembretes, registros, fila de aprovações (+ stubs comerciais) |
| `scripts/` | Helpers PowerShell **locais** |
| `templates/` | Markdown em branco |
| `Documentação/` | Diretriz, diagnóstico, arquitetura V2, fases, decisões |

## Fases (resumo)

0. Fundação (docs/pastas)  
1. **Secretária** — operacional local (sem envio externo sozinho)  
2. Comercial — scaffolding; **não ao vivo** até validar F1  
3–9. Stubs apontando à Arquitetura V2  

## Começar

1. Leia `STATUS.md`
2. Leia `empresa/fichas/01-secretaria.md`
3. Use `scripts/` ou peça à Secretária no chat

## Segurança

Sem segredos, sem `.env` real, sem Tokens. Envio WhatsApp/e-mail só após aprovação em `operacao/fila-aprovacoes/`.
