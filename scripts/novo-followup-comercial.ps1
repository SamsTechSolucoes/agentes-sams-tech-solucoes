param(
  [Parameter(Mandatory=$true)][string]$Cliente,
  [Parameter(Mandatory=$true)][string]$Motivo,
  [Parameter(Mandatory=$true)][string]$ProximaAcao,
  [string]$Contato = "",
  [string]$Canal = "",
  [string]$Prazo = "",
  [string]$Responsavel = "Comercial SamsTech",
  [string]$Rascunho = "",
  [string]$Fonte = "Samuel"
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\comercial\follow-ups"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

if ([string]::IsNullOrWhiteSpace($Cliente)) { throw "Cliente e obrigatorio." }
if ([string]::IsNullOrWhiteSpace($Motivo)) { throw "Motivo e obrigatorio." }
if ([string]::IsNullOrWhiteSpace($ProximaAcao)) { throw "ProximaAcao e obrigatoria." }

$slug = ($Cliente.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
if (-not $slug) { $slug = "cliente" }
$name = "{0}-{1}-{2}.md" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $slug, "followup"
$path = Join-Path $dir $name

$rascunhoIndentado = ""
if ($Rascunho) {
  $rascunhoIndentado = ($Rascunho -split "`n" | ForEach-Object { "    $_" }) -join "`n"
}

@"
# Follow-up comercial — $Cliente
- status: aberto
- criado: $(Get-Date -Format "yyyy-MM-ddTHH:mm:ss")-03:00
- cliente: $Cliente
- contato: $Contato
- motivo: $Motivo
- canal: $Canal
- prazo: $Prazo
- responsavel: $Responsavel
- fonte: $Fonte
- proxima_acao: $ProximaAcao
- rascunho_mensagem: |
$rascunhoIndentado
- envio: nao autorizado; copiar para operacao/fila-aprovacoes e aguardar OK do Samuel
"@ | Set-Content -Encoding UTF8 -LiteralPath $path

Write-Host "Criado: $path"
Write-Host "NAO enviado. Follow-up local aberto."
