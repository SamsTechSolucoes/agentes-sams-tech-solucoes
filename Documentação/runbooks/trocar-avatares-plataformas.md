# Trocar avatares dos agentes nas plataformas

## Quando usar

Depois que a conta da plataforma estiver autenticada por Samuel e houver acesso
à configuração dos agentes. Login, senha, 2FA, QR e códigos nunca são enviados
ao Engenheiro pelo chat.

## Fonte visual

Usar o mapa:

`Documentação/arquitetura/mapa-avatares-agentes.md`

Não usar arquivos de `referencias`, `testes`, `_descartadas`,
`_amador_backup` ou `BACKUP_NAO_BOM_*`.

## Procedimento

1. Samuel faz o login manual seguro.
2. O Engenheiro abre a lista de agentes da conta.
3. Confere nome e ficha do papel antes de editar.
4. Envia somente a imagem proposta para aquele papel.
5. Salva e volta à lista de agentes.
6. Confere nome, imagem e função.
7. Registra o resultado no mapa e em `operacao/registros/`.

## Validação

- Secretária, Gestor, Comercial e Inteligência não podem ficar com imagens
  trocadas entre si.
- Engenheiro Principal deve continuar identificado como papel técnico, não
  como novo departamento.
- Produtos, Financeiro e Evolução usam a logo provisória até decisão específica.
- A imagem precisa permanecer legível no recorte circular da plataforma.

## Reversão

Se a plataforma cortar texto, rosto ou logo de forma inadequada, restaurar a
imagem anterior ou usar temporariamente `LOGO_OFICIAL/LOGO_OFICIAL.png`.

## Estado atual

O Grok aberto neste Cursor não possui sessão autenticada. A aplicação aguarda
Samuel concluir o login manual. Teams e WhatsApp não definem avatares dos bots
nesta etapa.
