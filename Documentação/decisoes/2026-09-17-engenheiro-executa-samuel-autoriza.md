# Decisão — Engenheiro executa; Samuel só autoriza acessos

**Data:** 2026-09-17  
**Decisor:** Samuel (pedido explícito neste chat)  
**Papel executor:** Engenheiro Principal (`SamsTechEngineer`)

## O que Samuel pediu

Assumir a função de Engenheiro e completar o que falta para os agentes funcionarem como o projeto V2 prevê. Samuel permanece **apenas para autorizar acessos**. Ele não opera scripts, não cola ficha no Grok e não configura ferramenta.

## Recorte v1 (o que passa a valer agora)

A V2 completa (Fases 3–9 ao vivo, estoque, comissão, envio a cliente) **não** cabe em um único passo e ainda depende de regra oficial (inativo, comissão, e-mail de NF).  
O recorte que torna os agentes **úteis como previsto na v1** é:

1. **Canal de execução:** este chat do Engenheiro no Cursor. Samuel pede; o Engenheiro grava, consulta, rascunha e reporta.
2. **Secretária:** continua a interface do dia a dia no Grok **se** Samuel quiser falar lá; a gravação real na pasta fica a cargo do Engenheiro enquanto ela não tem Cursor.
3. **Comercial:** permanece em modo local (já autorizado).
4. **Gestor:** handoffs **locais** (decompor pedido → pasta do papel). Sem SLA inventado.
5. **Central de aprovações:** índice automático da fila. Envio a cliente continua só após OK pontual.
6. **Ponte de leitura:** o Engenheiro lê fontes autorizadas e escreve briefs em `operacao/fontes/`. Dado bruto de cliente **não** entra no git.

## O que este recorte NÃO autoriza

- Enviar WhatsApp/e-mail a cliente
- WhatsApp de produção na Secretária
- Cursor para Secretária ou outros papéis
- Alterar código do `nf-stream-analyze`
- Inventar comissão, preço, regra de inativo ou política
- Skill, Routine, overage ou serviço pago
- Fases 5–9 ao vivo (Produtos, Financeiro, Inteligência, Gestor multiagente completo, Gmail operacional da Secretária)

## Acessos (Samuel autoriza no chat; Engenheiro executa em seguida)

Pacote pedido nesta conversa (um clique):

| Código | Acesso | Uso |
|---|---|---|
| **S1** | Leitura Supabase | clientes, NFs, lembretes, inativos — só SELECT; brief sanitizado |
| **S2** | Leitura Gmail + Agenda | resumo do dia e aviso de NF no e-mail — sem responder e sem processar PDF |
| **S3** | Drive (pastas já criadas) | publicar resumo executivo; Sheets **não** vira SoT |
| **B1** | Inspecionar `nf-stream-analyze` só leitura | mapear WhatsApp de clientes; zero commit/envio |

**Estado após esta decisão:** S1 foi autorizado e executado em
`2026-09-17-export-nf-pasta-secretaria.md`. S2, S3 e B1 continuam sujeitos a
gate próprio.

**SoT vigente:** Supabase = verdade operacional; Sheets = espelho depois (Fase 4).

Sem S2/S3/B1, o Engenheiro **não** abre e-mail, não publica no Drive e não
entra no repo de NF.

## Como Samuel usa daqui para frente

Falar neste chat. Exemplos: “o que está pendente?”, “rascunha WhatsApp para X”, “quais inativos?”, “resumo de amanhã”.  
O Engenheiro executa e devolve o caminho do arquivo + o que precisa de OK.
