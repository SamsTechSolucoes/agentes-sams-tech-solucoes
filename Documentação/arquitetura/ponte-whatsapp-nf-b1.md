# B1 — Mapeamento somente leitura do WhatsApp no sistema de NF

**Data:** 2026-09-17  
**Fonte:** repositório privado `SamsTechSolucoes/nf-stream-analyze`, branch `main`  
**Ação realizada:** leitura via GitHub; zero clone, commit, deploy ou envio

## Fluxo existente

1. A interface escolhe Baileys quando `VITE_BAILEYS_API_URL` existe; caso
   contrário, usa Wppconnect.
2. Envio unitário:
   - Baileys: `POST {API_URL}/api/send-message`
   - Wppconnect: `POST {API_URL}/api/{session}/send-message`
3. Existe também a Edge Function `send-whatsapp-message`, autenticada por JWT
   Supabase, que chama a Evolution API.
4. O histórico é gravado em `whatsapp_send_history`.
5. Campanhas em massa existem, mas estão **fora do escopo dos Agentes**.

## Arquivos confirmados

- `src/services/whatsappService.ts`
- `src/hooks/useWhatsApp.ts`
- `supabase/functions/send-whatsapp-message/index.ts`
- `src/pages/WhatsAppSessions.tsx`
- `docs/decisoes/003-post-mortem-anti-spam-whatsapp.md`

## Ponte autorizável (não executada)

```text
Agente cria rascunho
  -> operacao/fila-aprovacoes
  -> Samuel aprova
  -> operador autenticado usa envio unitário do NF
  -> registra "enviado" na Central
```

Não criar segundo servidor WhatsApp neste repo. A ponte deve reutilizar o envio
unitário existente e nunca chamar bulk/campanha.

## Gates antes do primeiro envio

1. Sessão autenticada no NF.
2. Item `aprovado` na Central.
3. Número de teste explicitamente autorizado.
4. Confirmação de que a sessão WhatsApp está conectada.
5. Após envio, guardar ID/resultado sem copiar segredo.

## Riscos encontrados

- Existem caminhos legados Baileys, Wppconnect e Evolution; escolher um sem
  conferir configuração de produção pode enviar pela sessão errada.
- O serviço de frontend contém envio direto e bulk; a Central dos Agentes não
  está integrada tecnicamente a ele.
- Histórico antigo relata falsos negativos de entrega; o primeiro piloto deve
  ser 1:1 e conferido manualmente.
- Nenhum envio foi realizado durante B1.
