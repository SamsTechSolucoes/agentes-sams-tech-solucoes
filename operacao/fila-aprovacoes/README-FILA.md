# Fila de aprovações

Esta pasta pode conter itens `pendente`, `aprovado`, `recusado` ou `enviado`.
O estado atual é gerado em `operacao/central-aprovacoes/indice-atual.md`.

Comandos do Engenheiro:

```powershell
.\scripts\indice-central-aprovacoes.ps1
.\scripts\decidir-aprovacao.ps1 -Arquivo "nome.md" -Decisao aprovado
```

`aprovado` não significa `enviado`. O envio exige canal autorizado e registro
posterior com a decisão `enviado`.
