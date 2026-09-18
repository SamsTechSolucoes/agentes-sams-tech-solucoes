#Requires -Version 5.1
param(
  [int]$MaximoHoras = 24
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$dir = Join-Path $root "operacao\secretaria\sistema-nf"
$indicePath = Join-Path $dir "00-indice-exportacao.json"
$downloadPath = Join-Path $dir "00-download-resultado.json"

if (-not (Test-Path -LiteralPath $indicePath)) {
  throw "Indice do export ausente: $indicePath"
}

$indice = Get-Content -LiteralPath $indicePath -Raw | ConvertFrom-Json
$gerado = [DateTimeOffset]::Parse($indice.gerado)
$idade = [DateTimeOffset]::Now - $gerado
$falhas = @()

$minimos = @{
  clientes = 1
  notas = 1
  itens = 1
  catalogo = 1
}
foreach ($campo in $minimos.Keys) {
  if ([int]$indice.counts.$campo -lt $minimos[$campo]) {
    $falhas += "$campo vazio"
  }
}

$imagensDir = Join-Path $dir "imagens-catalogo"
$imagensLocais = if (Test-Path $imagensDir) {
  @(Get-ChildItem $imagensDir -File -Recurse).Count
} else { 0 }
if ($imagensLocais -lt [int]$indice.counts.imagens_storage) {
  $falhas += "imagens incompletas: $imagensLocais/$($indice.counts.imagens_storage)"
}

$pdfsDir = Join-Path $dir "pdfs-notas"
$pdfsLocais = if (Test-Path $pdfsDir) {
  @(Get-ChildItem $pdfsDir -File -Recurse).Count
} else { 0 }
$pdfsFalhosConhecidos = 0
if (Test-Path -LiteralPath $downloadPath) {
  $download = Get-Content -LiteralPath $downloadPath -Raw | ConvertFrom-Json
  if ($download.pdfs) {
    $pdfsFalhosConhecidos = [int]$download.pdfs.fail
  }
}

Write-Host ("Export gerado: {0}" -f $gerado.ToLocalTime())
Write-Host ("Idade (horas): {0:N1}" -f $idade.TotalHours)
Write-Host ("Clientes={0} NFs={1} Itens={2} Catalogo={3}" -f
  $indice.counts.clientes,
  $indice.counts.notas,
  $indice.counts.itens,
  $indice.counts.catalogo)
Write-Host ("Imagens locais={0}/{1}" -f $imagensLocais, $indice.counts.imagens_storage)
Write-Host ("PDFs locais={0}/{1}" -f $pdfsLocais, $indice.counts.pdfs_storage)

if ($idade.TotalHours -gt $MaximoHoras) {
  Write-Warning "EXPORT DESATUALIZADO: idade maior que $MaximoHoras horas."
}
if ($falhas.Count) {
  $falhas | ForEach-Object { Write-Host "[FALHA] $_" }
  exit 1
}

if ($pdfsLocais -lt [int]$indice.counts.pdfs_storage) {
  if (($pdfsLocais + $pdfsFalhosConhecidos) -eq [int]$indice.counts.pdfs_storage) {
    Write-Warning ("PDFs contabilizados com {0} referencias indisponiveis no storage." -f
      $pdfsFalhosConhecidos)
  } else {
    Write-Warning "PDFs privados incompletos e sem conciliacao integral."
  }
}
Write-Host "EXPORT RESULT PASS"
