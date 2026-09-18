import fs from "fs";
import http from "http";
import https from "https";
import path from "path";
import { fileURLToPath } from "url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const base = path.join(root, "operacao", "secretaria", "sistema-nf");
const lista = path.join(base, "_listas-download", "pdfs-notas-storage.csv");
const destino = path.join(base, "pdfs-notas");
const projectUrl = process.env.SUPABASE_PROJECT_URL ||
  "https://qshhbpyjwalpjyksforn.supabase.co";
const porta = Number(process.env.SAMSTECH_SESSAO_PORTA || 8765);
const origens = new Set([
  "https://nf-stream-analyze.vercel.app",
  "https://nf-stream-analyze-samstechsolucoes-projects.vercel.app",
  "",
  "null",
]);

function nomesCsv(file) {
  const linhas = fs.readFileSync(file, "utf8")
    .replace(/^\uFEFF/, "").split(/\r?\n/).filter(Boolean);
  const colunas = linhas[0].split(";");
  const indice = colunas.indexOf("name");
  return linhas.slice(1).map((linha) => {
    const partes = linha.split(";");
    return partes[indice] || partes[1] || partes[0];
  }).filter(Boolean);
}

function nomeSeguro(storagePath) {
  return storagePath.replace(/[\\/:*?"<>|]/g, "_");
}

function baixar(url, arquivo, token) {
  return new Promise((resolve) => {
    const stream = fs.createWriteStream(arquivo);
    https.get(url, { headers: { Authorization: `Bearer ${token}` } }, (res) => {
      if (res.statusCode !== 200) {
        stream.close();
        try { fs.unlinkSync(arquivo); } catch {}
        res.resume();
        resolve({ ok: false, status: res.statusCode });
        return;
      }
      res.pipe(stream);
      stream.on("finish", () =>
        stream.close(() => resolve({ ok: true, status: 200 }))
      );
    }).on("error", () => {
      stream.close();
      try { fs.unlinkSync(arquivo); } catch {}
      resolve({ ok: false, status: 0 });
    });
  });
}

async function baixarTodos(token) {
  const nomes = nomesCsv(lista);
  fs.mkdirSync(destino, { recursive: true });
  let atual = 0;
  let ok = 0;
  let falhas = 0;
  const falhasDetalhes = [];

  async function trabalhador() {
    while (atual < nomes.length) {
      const indice = atual++;
      const nome = nomes[indice];
      const arquivo = path.join(destino, nomeSeguro(nome));
      if (fs.existsSync(arquivo) && fs.statSync(arquivo).size > 0) {
        ok++;
        continue;
      }
      const objeto = nome.split("/").map(encodeURIComponent).join("/");
      const url = `${projectUrl}/storage/v1/object/authenticated/invoices/${objeto}`;
      const resultado = await baixar(url, arquivo, token);
      if (resultado.ok) ok++;
      else {
        falhas++;
        falhasDetalhes.push({ name: nome, status: resultado.status });
      }
      if ((indice + 1) % 100 === 0) {
        console.log(`PDFs ${indice + 1}/${nomes.length}: ok=${ok} falhas=${falhas}`);
      }
    }
  }

  await Promise.all(Array.from({ length: 6 }, () => trabalhador()));
  const resultado = {
    gerado: new Date().toISOString(),
    modo: "pdfs-sessao-local",
    pdfs: {
      ok,
      fail: falhas,
      total: nomes.length,
      falhas_arquivos: falhasDetalhes,
    },
  };
  fs.writeFileSync(
    path.join(base, "00-download-resultado.json"),
    JSON.stringify(resultado, null, 2)
  );
  console.log(`PDF DOWNLOAD RESULT: ok=${ok} falhas=${falhas} total=${nomes.length}`);
  process.exitCode = falhas ? 1 : 0;
}

let usada = false;
const servidor = http.createServer((req, res) => {
  const origem = req.headers.origin || "";
  if (origens.has(origem)) {
    res.setHeader("Access-Control-Allow-Origin", origem);
    res.setHeader("Vary", "Origin");
    res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type");
    res.setHeader("Access-Control-Allow-Private-Network", "true");
  }
  if (req.method === "OPTIONS") {
    res.writeHead(origens.has(origem) ? 204 : 403).end();
    return;
  }
  if (usada || req.method !== "POST" || req.url !== "/sessao") {
    res.writeHead(404).end();
    return;
  }
  if (!origens.has(origem)) {
    res.writeHead(403).end("Origem recusada.");
    return;
  }
  let corpo = "";
  req.setEncoding("utf8");
  req.on("data", (parte) => {
    corpo += parte;
    if (corpo.length > 65536) req.destroy();
  });
  req.on("end", async () => {
    usada = true;
    clearTimeout(timeout);
    const token = new URLSearchParams(corpo).get("token") || "";
    if (!token || token.split(".").length !== 3) {
      res.writeHead(400).end("Sessao invalida.");
      servidor.close();
      return;
    }
    res.writeHead(200, { "Content-Type": "text/plain; charset=utf-8" });
    res.end("Sessao recebida localmente. O download dos PDFs foi iniciado.");
    servidor.close();
    try {
      await baixarTodos(token);
    } finally {
      corpo = "";
    }
  });
});

servidor.listen(porta, "127.0.0.1", () => {
  console.log(`SESSAO LOCAL PRONTA: http://127.0.0.1:${porta}/sessao`);
});

const timeout = setTimeout(() => {
  if (!usada) {
    console.error("Tempo esgotado sem receber a sessao.");
    servidor.close(() => { process.exitCode = 1; });
  }
}, 600000);
