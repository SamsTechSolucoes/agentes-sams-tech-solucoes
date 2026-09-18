# Proposta — Teams como canal Samuel ↔ agentes

**Status:** Teams aprovado como canal auxiliar; conta, convite e piloto web
aguardam execução na máquina do agente.

Teams foi acrescentado como canal auxiliar pela decisão
`Documentação/decisoes/2026-09-18-canais-teams-whatsapp-e-revisao-6h.md`.
Os canais anteriores permanecem válidos.

## Recomendação

Começar com **Teams Web** usando o Gmail da SamsTech como conta Microsoft na
máquina sempre ligada do agente. Não criar Outlook apenas para isso e não
instalar Teams inicialmente.

Motivos:

- A Microsoft permite criar Teams Free com um e-mail pessoal, inclusive Gmail.
- O navegador já suporta texto, imagens, áudio e arquivos.
- O piloto não exige instalação, atualização automática nem nova credencial no
  computador dos agentes.
- O aplicativo local não cria uma integração para agentes; automação confiável
  ainda exigiria Microsoft Graph ou conector autorizado.
- O Teams corporativo de Samuel pode exigir que o administrador permita ou
  convide a conta Gmail como externa/convidada.
- Para automação dos agentes hoje, Slack é o caminho tecnicamente disponível.
  Teams é candidato para comunicação humana com o ambiente corporativo.

## Piloto proposto

1. Criar/associar uma conta Microsoft ao Gmail SamsTech pelo fluxo oficial.
2. Samuel, no Teams corporativo, convida essa conta como externa/convidada.
3. Testar no Teams Web: texto, imagem, áudio e arquivo sem dado sensível.
4. Definir quais agentes podem responder; inicialmente Secretária Pessoal e
   Gestor da Equipe.
5. Registrar aprovação antes de qualquer envio automático.
6. Só instalar o aplicativo após o piloto provar necessidade de notificações ou
   chamadas contínuas.

O piloto depende de Samuel ou do administrador corporativo convidar o Gmail
SamsTech. Slack permanece contingência gratuita, sem contratação.

## Aplicativos e integrações

- **Contatos:** não há conector direto disponível nesta sessão. Avaliar Google
  Contacts por navegador somente para piloto; escrita/migração exige aprovação.
- **Teams:** não há conector direto disponível. Navegador serve para teste
  assistido, mas não deve virar automação silenciosa.
- **WhatsApp:** manter o canal 1:1 já autorizado no Grok. Não instalar outro
  WhatsApp nem fazer scraping.
- **Áudio:** receber arquivo no Teams e criar transcrição/ação somente após
  política de retenção e consentimento.

## Fontes Microsoft

- https://support.microsoft.com/en-us/teams/free/settings/sign-in-sign-up-sign-out-and-add-a-new-account-in-microsoft-teams-free
- https://learn.microsoft.com/en-us/microsoftteams/teams-client-system-requirements
