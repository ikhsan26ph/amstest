// Parser config/env.md — satu-satunya sumber baseUrl, parameter login, dan kredensial
// (aturan docs/agent-guide.md: jangan pernah menebak URL/kredensial).
// JANGAN PERNAH mencetak password ke log/report/output.
//
// Format config/env.md: satu `key: value` per baris.
//   - Baris kosong dan baris yang diawali `#` diabaikan.
//   - Sisa baris mulai `# ` (pagar + spasi; di awal nilai atau setelah spasi) dianggap komentar —
//     KECUALI pada key `password`. Selector CSS seperti `#password` (pagar tanpa spasi) tetap aman.
//   - Nilai kosong = belum diisi.
// Key yang dikenal: baseUrl, loginPath, loginSuccessUrlPattern, loginEmailSelector,
//   loginPasswordSelector, loginButtonSelector, loginClickMode (opsional: native|dispatch),
//   email, password, role (opsional).
const fs = require('fs');
const path = require('path');

const ENV_FILE = path.join(__dirname, '..', '..', 'config', 'env.md');

const LOGIN_KEYS = [
  'loginPath',
  'loginSuccessUrlPattern',
  'loginEmailSelector',
  'loginPasswordSelector',
  'loginButtonSelector',
];

function readRaw(file = ENV_FILE) {
  const md = fs.readFileSync(file, 'utf8');
  const raw = {};
  for (const line of md.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const m = /^([A-Za-z_][A-Za-z0-9_]*)\s*:\s*(.*)$/.exec(trimmed);
    if (!m) continue;
    const key = m[1];
    let value = m[2];
    if (key !== 'password') value = value.replace(/(^|\s+)#\s.*$/, '');
    raw[key] = value.trim();
  }
  return raw;
}

function isPlaceholder(v) {
  return !v || /ISI_DISINI|ISI SAAT|ISI MANUAL/i.test(v);
}

function parseEnv(opts = {}) {
  const raw = readRaw(opts.file);

  let baseUrl = raw.baseUrl || '';
  if (isPlaceholder(baseUrl)) {
    throw new Error('config/env.md: baseUrl belum diisi — hentikan dan minta user mengisinya.');
  }
  if (!/^https?:\/\//.test(baseUrl)) baseUrl = 'https://' + baseUrl;

  const accounts = [];
  const email = raw.email || '';
  const password = raw.password || '';
  if (!isPlaceholder(email) && !isPlaceholder(password)) {
    accounts.push({ email, password, role: raw.role || '' });
  }

  const env = {
    baseUrl,
    loginPath: isPlaceholder(raw.loginPath) ? '' : raw.loginPath,
    loginSuccessUrlPattern: isPlaceholder(raw.loginSuccessUrlPattern) ? '' : raw.loginSuccessUrlPattern,
    loginEmailSelector: isPlaceholder(raw.loginEmailSelector) ? '' : raw.loginEmailSelector,
    loginPasswordSelector: isPlaceholder(raw.loginPasswordSelector) ? '' : raw.loginPasswordSelector,
    loginButtonSelector: isPlaceholder(raw.loginButtonSelector) ? '' : raw.loginButtonSelector,
    loginClickMode: (raw.loginClickMode || 'native').toLowerCase() === 'dispatch' ? 'dispatch' : 'native',
    accounts,
    main: accounts[0] || null,
  };
  return env;
}

// Validasi semua yang dibutuhkan fixture login. Dipanggil oleh tests/helpers/fixtures.js,
// BUKAN oleh playwright.config.js — config hanya butuh baseUrl supaya `npx playwright test --list`
// tetap jalan sebelum kalibrasi login selesai.
function requireLogin(env) {
  const missing = LOGIN_KEYS.filter((k) => !env[k]);
  if (!env.main) missing.push('email/password');
  if (missing.length) {
    throw new Error(
      `config/env.md belum lengkap untuk login — masih kosong: ${missing.join(', ')}. ` +
      'Kredensial diisi manual oleh manusia; selector/pola URL login diisi saat kalibrasi login (Tahap B).'
    );
  }
  return env;
}

// loginSuccessUrlPattern ditulis sebagai source regex JS TANPA garis miring pembungkus,
// mis. `/dashboard` atau `\/auction\/list`. Dicocokkan ke URL penuh setelah login.
function successUrlRegex(env) {
  return new RegExp(env.loginSuccessUrlPattern);
}

module.exports = { parseEnv, requireLogin, successUrlRegex, LOGIN_KEYS };
