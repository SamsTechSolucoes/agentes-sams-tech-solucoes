/**
 * Baixa imagens publicas do catalogo para a pasta da Secretaria.
 * PDFs de NF sao bucket privado: tenta e registra falha sem expor chave.
 */
import fs from "fs";
import path from "path";
import https from "https";
import { fileURLToPath } from "url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const dest = path.join(root, "operacao", "secretaria", "sistema-nf");
const listImg = path.join(dest, "_listas-download", "imagens-catalogo.csv");
const listPdf = path.join(dest, "_listas-download", "pdfs-notas-storage.csv");
const dirImg = path.join(dest, "imagens-catalogo");
const dirPdf = path.join(dest, "pdfs-notas");
const projectUrl = process.env.SUPABASE_PROJECT_URL || "https://qshhbpyjwalpjyksforn.supabase.co";
const storageToken = process.env.SUPABASE_STORAGE_TOKEN || "";
const basePublic = projectUrl + "/storage/v1/object/public/";
const baseAuthenticated = projectUrl + "/storage/v1/object/authenticated/";

function parseCsv(file) {
  const t = fs.readFileSync(file, "utf8").replace(/^\uFEFF/, "");
  const lines = t.split(/\r?\n/).filter(Boolean);
  if (lines.length < 2) return [];
  const cols = lines[0].split(";");
  const nameIdx = cols.indexOf("name");
  return lines.slice(1).map((ln) => {
    const parts = ln.split(";");
    return parts[nameIdx] || parts[1] || parts[0];
  }).filter(Boolean);
}

function download(url, outFile, headers = {}) {
  return new Promise((resolve) => {
    const file = fs.createWriteStream(outFile);
    https
      .get(url, { headers }, (res) => {
        if (res.statusCode !== 200) {
          file.close();
          try { fs.unlinkSync(outFile); } catch {}
          resolve({ ok: false, status: res.statusCode });
          res.resume();
          return;
        }
        res.pipe(file);
        file.on("finish", () => file.close(() => resolve({ ok: true, status: 200 })));
      })
      .on("error", (err) => {
        file.close();
        try { fs.unlinkSync(outFile); } catch {}
        resolve({ ok: false, status: 0, err: err.message });
      });
  });
}

function safeName(storagePath) {
  return storagePath.replace(/[\\/:*?"<>|]/g, "_");
}

async function runBatch(items, bucket, dir, concurrency, authenticated = false) {
  let ok = 0;
  let fail = 0;
  let i = 0;
  async function worker() {
    while (i < items.length) {
      const idx = i++;
      const name = items[idx];
      const base = authenticated ? baseAuthenticated : basePublic;
      const url = base + bucket + "/" + name.split("/").map(encodeURIComponent).join("/");
      const out = path.join(dir, safeName(name));
      const dirn = path.dirname(out);
      fs.mkdirSync(dirn, { recursive: true });
      if (fs.existsSync(out) && fs.statSync(out).size > 0) {
        ok++;
        continue;
      }
      const headers = authenticated
        ? { Authorization: "Bearer " + storageToken }
        : {};
      const r = await download(url, out, headers);
      if (r.ok) ok++;
      else fail++;
      if ((idx + 1) % 50 === 0) console.log(bucket, idx + 1, "/", items.length, "ok", ok, "fail", fail);
    }
  }
  await Promise.all(Array.from({ length: concurrency }, () => worker()));
  return { ok, fail, total: items.length };
}

fs.mkdirSync(dirImg, { recursive: true });
fs.mkdirSync(dirPdf, { recursive: true });

const mode = process.argv[2] || "imagens";

const imgs = parseCsv(listImg);
const pdfs = parseCsv(listPdf);
console.log("imagens na lista", imgs.length, "pdfs na lista", pdfs.length, "modo", mode);

const result = { gerado: new Date().toISOString(), modo: mode };

if (mode === "imagens" || mode === "tudo") {
  result.imagens = await runBatch(imgs, "catalog-images", dirImg, 8);
  console.log("imagens", JSON.stringify(result.imagens));
}

if (mode === "pdfs" || mode === "tudo") {
  if (!storageToken) {
    throw new Error(
      "SUPABASE_STORAGE_TOKEN ausente. Forneca uma sessao de usuario autorizada " +
      "somente pelo ambiente seguro; nunca grave o token em arquivo."
    );
  }
  result.pdfs = await runBatch(pdfs, "invoices", dirPdf, 6, true);
  console.log("pdfs", JSON.stringify(result.pdfs));
}

fs.writeFileSync(
  path.join(dest, "00-download-resultado.json"),
  JSON.stringify(result, null, 2)
);
