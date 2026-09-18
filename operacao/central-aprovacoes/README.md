# Indice da Central de Aprovacoes (visao)

A fila operacional do dia a dia e:
`operacao/fila-aprovacoes/`

O indice atual e gerado pelo Engenheiro:

```powershell
.\scripts\indice-central-aprovacoes.ps1
```

Saida: `operacao/central-aprovacoes/indice-atual.md`

Fluxo:
1. Agente rascunha → fila-aprovacoes (status pendente)
2. Samuel: aprovar | recusar | editar (neste chat, uma frase basta)
3. Envio (quando existir canal) so apos OK — o envio continua bloqueado sem OK pontual
