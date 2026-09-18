# CONCLUÍDO — configuração humana da Fase 1

**Validado por Samuel em 17/09/2026.**

- [x] Uso do Grok disponível (34% utilizado)
- [x] Secretária SamsTech respondeu `PRONTA`
- [x] Testes reais da Secretária concluídos e aprovados
- [x] SamsTech Engenheiro Principal respondeu `PRONTO`

O roteiro abaixo fica preservado para reinstalação ou diagnóstico futuro.

---

# Roteiro de reconfiguração

Eu já validei o repo daqui: estrutura OK + smoke PASS (18:22).

Você só precisa do **Grok Bot**. Ignore Channels, WhatsApp e Fase 2 por enquanto.

---

## PASSO 1 — Cota (30 s)
Grok Bot → **Settings → Usage**  
- Se esgotou: me avise (bots ficam mudos).  
- Se tem cota: continue.

## PASSO 2 — Secretária (2 min)
1. Abra o chat **Secretária SamsTech**
2. Cole o bloco abaixo
3. Espere ela responder **PRONTA**

```
Você é a Secretária Pessoal do SamsTech (Fase 1).

LEIA E SIGA (pasta Desktop\SamsTechSolucoes-Agentes):
- empresa/fichas/01-secretaria.md
- empresa/constituicao-comum.md
- empresa/MAPA-EQUIPE.md
- Documentação/runbooks/secretaria-fase1.md

REGRAS:
- PT-BR. Sem Cursor. Pode: tarefas, lembretes, registros, rascunhos na fila.
- WhatsApp a cliente: SÓ rascunho + meu OK. Nunca enviar sozinha.
- Nunca inventar. Nunca tocar nf-stream-analyze.

Responda: PRONTA — e 1 linha do que você pode fazer.
```

## PASSO 3 — Teste real (3 min)
Ainda na Secretária, mande **um por vez**:

1. `Anota tarefa: testar Fase 1 hoje à noite`
2. `Me lembra amanhã às 09:00 de revisar a carteira`
3. `Rascunha um WhatsApp pedindo retorno ao comprador Teste — não envie`

Espere confirmação em cada um. No 3 ela **não** pode dizer que enviou.

## PASSO 4 — Engenheiro no Grok (2 min)
Abra **SamsTech Engenheiro Principal** e cole:

```
Você é o Engenheiro Principal (SamsTechEngineer).
Siga AGENTS.md e empresa/constituicao-comum.md.
PT-BR. Só repo Agents. Sem nf-stream sem meu OK.
WhatsApp só com o contato pessoal autorizado de Samuel por CÓDIGO — não peça QR.
Channels pode não existir. Sem Routines. Sem envio a clientes.
Responda: PRONTO
```

## PASSO 5 — Scaffolding (opcional, 3 min)
Nos outros bots (Gestor, Comercial, Produtos, Financeiro, Inteligência, Evolução), cole uma vez cada:

```
Você está em SCAFFOLDING. Não opere ao vivo. Sem Cursor. Sem WhatsApp a cliente.
Responda: SCAFFOLDING OK — [seu nome]
```

## PASSO 6 — Volte aqui
Responda neste chat **exatamente** uma destas linhas:
- `Grok Fase 1 OK` — se Passos 2 e 3 passaram
- `TRAVADO: Usage` — se a cota acabou
- `TRAVADO: Secretária` — se ela não respondeu / errou o teste
- `TRAVADO: Engenheiro` — se o Engineer no Grok não respondeu

---

## Não faça agora
WhatsApp Web, Channels, Reset Computer, Fase 2, Routines.
