/**
 * Converte dumps SQL do MCP (JSON em untrusted-data) em CSV UTF-8 BOM
 * na pasta local da Secretária. Não envia nada. Não commita PII.
 */
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const raiz = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const dest = path.join(raiz, "operacao", "secretaria", "sistema-nf");
const planilhas = path.join(dest, "planilhas");

function parseArgs(argv) {
  const values = {};
  for (let i = 0; i < argv.length; i += 2) {
    const key = argv[i]?.replace(/^--/, "");
    const value = argv[i + 1];
    if (!key || !value) throw new Error("Argumentos devem usar --nome caminho");
    values[key] = path.resolve(value);
  }
  return values;
}

const dumps = parseArgs(process.argv.slice(2));
const obrigatorios = ["clientes", "notas", "itens", "catalogo", "lembretes", "imagens", "pdfs"];
const ausentes = obrigatorios.filter((nome) => !dumps[nome] || !fs.existsSync(dumps[nome]));
if (ausentes.length) {
  throw new Error(
    "Fontes ausentes: " + ausentes.join(", ") +
    ". Informe cada dump com --clientes, --notas, --itens, --catalogo, " +
    "--lembretes, --imagens e --pdfs."
  );
}

function extractRows(file) {
  const t = fs.readFileSync(file, "utf8");
  let payload = t;
  try {
    const outer = JSON.parse(t);
    if (outer && typeof outer.result === "string") payload = outer.result;
  } catch {
    /* arquivo ja e texto do MCP */
  }
  const m = payload.match(/<untrusted-data-[0-9a-f-]+>\s*(\[[\s\S]*?\])\s*<\/untrusted-data-/i);
  if (!m) throw new Error("JSON nao encontrado em " + file);
  const data = JSON.parse(m[1]);
  if (!Array.isArray(data)) throw new Error("esperado array em " + file);
  return data;
}

function csvEscape(v) {
  if (v === null || v === undefined) return "";
  const s = typeof v === "object" ? JSON.stringify(v) : String(v);
  if (/[;"\n\r]/.test(s)) return '"' + s.replace(/"/g, '""') + '"';
  return s;
}

function writeCsv(file, rows) {
  if (!rows.length) {
    fs.writeFileSync(file, "\uFEFF", "utf8");
    return 0;
  }
  const cols = Object.keys(rows[0]);
  const lines = [cols.join(";")];
  for (const r of rows) lines.push(cols.map((c) => csvEscape(r[c])).join(";"));
  fs.writeFileSync(file, "\uFEFF" + lines.join("\r\n"), "utf8");
  return rows.length;
}

function ensureDirs() {
  for (const d of [
    dest,
    planilhas,
    path.join(dest, "imagens-catalogo"),
    path.join(dest, "pdfs-notas"),
    path.join(dest, "_listas-download"),
  ]) {
    fs.mkdirSync(d, { recursive: true });
  }
}

ensureDirs();

const clientes = extractRows(dumps.clientes);
const cnpj = clientes.filter((r) => Number(r.digitos) === 14);
const cpf = clientes.filter((r) => Number(r.digitos) === 11);
const irreg = clientes.filter((r) => ![11, 14].includes(Number(r.digitos)));

const telefonesCadastro = clientes.map((r) => ({
  razao_social: r.razao_social,
  cnpj_cpf: r.cnpj_cpf,
  tipo: Number(r.digitos) === 14 ? "CNPJ" : Number(r.digitos) === 11 ? "CPF" : "irregular",
  telefone: r.telefone,
  email: r.email,
  municipio: r.municipio,
  uf: r.uf,
}));

const counts = {
  clientes: writeCsv(path.join(planilhas, "01-clientes-todos.csv"), clientes),
  clientes_cnpj: writeCsv(path.join(planilhas, "02-clientes-cnpj.csv"), cnpj),
  clientes_cpf: writeCsv(path.join(planilhas, "03-clientes-cpf.csv"), cpf),
  clientes_irregular: writeCsv(path.join(planilhas, "04-clientes-documento-irregular.csv"), irreg),
  telefones: writeCsv(path.join(planilhas, "05-telefones-e-email.csv"), telefonesCadastro),
  notas: writeCsv(path.join(planilhas, "06-notas-fiscais.csv"), extractRows(dumps.notas)),
  itens: writeCsv(path.join(planilhas, "07-itens-das-notas.csv"), extractRows(dumps.itens)),
  catalogo: writeCsv(path.join(planilhas, "08-catalogo-itens.csv"), extractRows(dumps.catalogo)),
  lembretes: writeCsv(path.join(planilhas, "11-lembretes-app-nf.csv"), extractRows(dumps.lembretes)),
};

const imagens = extractRows(dumps.imagens);
const pdfs = extractRows(dumps.pdfs);
writeCsv(path.join(dest, "_listas-download", "imagens-catalogo.csv"), imagens);
writeCsv(path.join(dest, "_listas-download", "pdfs-notas-storage.csv"), pdfs);
counts.imagens_storage = imagens.length;
counts.pdfs_storage = pdfs.length;

const clientePorId = Object.fromEntries(clientes.map((c) => [c.id, c]));
const notasComCliente = extractRows(dumps.notas).map((n) => {
  const c = clientePorId[n.client_id] || {};
  const d = Number(c.digitos);
  return {
    data_emissao: n.data_emissao,
    numero_nf: n.numero_nf,
    valor_total: n.valor_total,
    razao_social: c.razao_social || "",
    cnpj_cpf: c.cnpj_cpf || "",
    tipo_doc: d === 14 ? "CNPJ" : d === 11 ? "CPF" : "irregular",
    municipio: c.municipio || "",
    uf: c.uf || "",
    file_name: n.file_name,
    invoice_id: n.id,
    client_id: n.client_id,
  };
});
counts.notas_com_cliente = writeCsv(
  path.join(planilhas, "06b-notas-com-cliente.csv"),
  notasComCliente
);

fs.writeFileSync(
  path.join(dest, "00-indice-exportacao.json"),
  JSON.stringify({ gerado: new Date().toISOString(), counts }, null, 2),
  "utf8"
);

console.log(JSON.stringify(counts, null, 2));
console.log("OK pasta " + dest);
