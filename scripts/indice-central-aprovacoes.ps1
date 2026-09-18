# Indice da Central de Aprovacoes a partir da fila local
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root

$filaDir = Join-Path $root "operacao\fila-aprovacoes"
$outDir = Join-Path $root "operacao\central-aprovacoes"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

function Get-ByStatus([string]$status) {
  if (-not (Test-Path $filaDir)) { return @() }
  Get-ChildItem $filaDir -File -Filter *.md |
    Where-Object { $_.Name -notmatch '^(README|EXEMPLO)' } |
    Where-Object {
      $c = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
      $c -match ("(?m)^- status:\s*" + [regex]::Escape($status) + "\s*$")
    }
}

$pendentes = @(Get-ByStatus "pendente")
$aprovados = @(Get-ByStatus "aprovado")
$recusados = @(Get-ByStatus "recusado")
$enviados = @(Get-ByStatus "enviado")

function Format-Items($items) {
  if ($items.Count -eq 0) {
    "- (nenhum)"
  } else {
    ($items | ForEach-Object { "- $($_.Name)" }) -join "`n"
  }
}

$linhasPend = Format-Items $pendentes
$linhasAprov = Format-Items $aprovados
$linhasRec = Format-Items $recusados
$linhasEnv = Format-Items $enviados

$path = Join-Path $outDir "indice-atual.md"
@"
# Central de aprovacoes - indice atual
- gerado: $(Get-Date -Format "yyyy-MM-dd HH:mm")
- fonte: operacao/fila-aprovacoes
- pendentes: $($pendentes.Count)
- aprovados_no_indice: $($aprovados.Count)
- recusados_no_indice: $($recusados.Count)
- enviados_no_indice: $($enviados.Count)
- envio: so depois de OK pontual do Samuel

## Pendentes

$linhasPend

## Aprovados (ainda nao enviados)

$linhasAprov

## Recusados

$linhasRec

## Enviados

$linhasEnv

## Regra
Rascunho aprovado nao e envio. WhatsApp a cliente exige canal autorizado.
"@ | Set-Content -Encoding UTF8 -LiteralPath $path

Write-Host "Indice: $path"
Write-Host ("Pendentes=" + $pendentes.Count)
