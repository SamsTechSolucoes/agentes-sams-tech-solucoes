# Operação Comercial — Fase 2

**Status:** ativa em modo local desde 17/09/2026, por autorização explícita de Samuel.

Subpastas:

- `carteira/` — clientes informados por Samuel ou por fonte autorizada
- `follow-ups/` — próximos contatos e ações
- `inativos/` — prevenção e reativação; regra oficial de 60 dias

## Fluxo operacional

1. Samuel ou a Secretária informa cliente, motivo e próxima ação.
2. Comercial registra o item em `follow-ups/`.
3. Se houver texto para cliente, copia para `operacao/fila-aprovacoes/`.
4. Samuel aprova, edita ou recusa.
5. O envio continua manual/fora deste fluxo até autorização específica.

## Script

```powershell
.\scripts\novo-followup-comercial.ps1 `
  -Cliente "Cliente informado" `
  -Motivo "retorno de proposta" `
  -ProximaAcao "ligar amanhã" `
  -Prazo "2026-09-18"
```

Sem envio, scraping, acesso ao NF ou comissão inventada.
