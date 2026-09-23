// Fixture sesi login AMS. Semua parameter login (path, selector, pola URL sukses, kredensial)
// dibaca dari config/env.md lewat tests/helpers/env.js — tidak ada yang di-hardcode di sini.
//
// Pola "login SEKALI per worker, satu context dibagi seluruh test" dibawa dari OMS, di mana
// backend menolak storageState lintas context. DIVERIFIKASI 2026-09-23 di AMS (CLAUDE.md →
// hipotesis #2): BERBEDA — storageState TERNYATA berhasil dipakai lintas context (lihat
// explore/module-map.md). Pola login-sekali-per-worker tetap dipertahankan di sini untuk
// SEMENTARA sebagai kehati-hatian (staging berisi data nyata), BUKAN karena keterpaksaan
// teknis — beralih ke storageState + workers>1 kini mungkin, tapi itu keputusan yang perlu
// dikonfirmasi eksplisit dengan user sebelum diterapkan.
const fs = require('fs');
const path = require('path');
const base = require('@playwright/test');
const { parseEnv, requireLogin, successUrlRegex } = require('./env');

// Guard aturan docs/agent-guide.md: login gagal 2x berturut-turut -> BERHENTI (jangan sampai akun
// terkunci). Playwright me-restart worker setelah fixture gagal, yang tanpa guard ini akan
// mencoba login terus-menerus.
const FAIL_FILE = path.join(__dirname, '..', '..', 'artifacts', '.auth', 'login-failures.json');

function readFailures() {
  try {
    return JSON.parse(fs.readFileSync(FAIL_FILE, 'utf8')).count || 0;
  } catch {
    return 0;
  }
}

function writeFailures(count) {
  fs.mkdirSync(path.dirname(FAIL_FILE), { recursive: true });
  fs.writeFileSync(FAIL_FILE, JSON.stringify({ count, at: new Date().toISOString() }));
}

// Selector di config/env.md boleh ditulis sebagai:
//   placeholder=Masukkan Email   -> page.getByPlaceholder('Masukkan Email')
//   label=Email                  -> page.getByLabel('Email')
//   testid=login-email           -> page.getByTestId('login-email')
//   role=button:Login            -> page.getByRole('button', { name: 'Login' })
//   selain itu                   -> page.locator(spec): CSS biasa atau engine Playwright
//                                   (text=, xpath=, role=button[name="Login"], dll.)
function resolveLocator(page, spec) {
  const m = /^(placeholder|label|testid|role)=(.*)$/s.exec(spec);
  if (!m || (m[1] === 'role' && m[2].includes('['))) return page.locator(spec);
  const [, kind, val] = m;
  if (kind === 'placeholder') return page.getByPlaceholder(val);
  if (kind === 'label') return page.getByLabel(val);
  if (kind === 'testid') return page.getByTestId(val);
  const idx = val.indexOf(':');
  if (idx === -1) return page.getByRole(val);
  return page.getByRole(val.slice(0, idx), { name: val.slice(idx + 1) });
}

// Hipotesis #1 (CLAUDE.md): di OMS klik kadang butuh dispatchEvent('click'). DIVERIFIKASI
// 2026-09-23 di AMS: BERBEDA — klik native berhasil untuk tombol Login. Default tetap native;
// set `loginClickMode: dispatch` di config/env.md hanya jika suatu saat terbukti perlu untuk
// tombol/elemen lain.
async function clickByMode(locator, mode) {
  if (mode === 'dispatch') return locator.dispatchEvent('click');
  return locator.click();
}

const test = base.test.extend({
  authedContext: [
    async ({ browser }, use) => {
      const env = requireLogin(parseEnv());
      const { baseUrl, main } = env;
      if (readFailures() >= 2) {
        throw new Error(
          'Login sudah gagal 2x berturut-turut — eksekusi dihentikan demi keamanan akun. ' +
          'Periksa config/env.md (kredensial + selector login), lalu hapus artifacts/.auth/login-failures.json untuk mencoba lagi.'
        );
      }
      const context = await browser.newContext({
        baseURL: baseUrl,
        viewport: { width: 1440, height: 900 },
      });
      const page = await context.newPage();
      try {
        await page.goto(env.loginPath);
        await resolveLocator(page, env.loginEmailSelector).fill(main.email);
        await resolveLocator(page, env.loginPasswordSelector).fill(main.password);
        await clickByMode(resolveLocator(page, env.loginButtonSelector), env.loginClickMode);
        await page.waitForURL(successUrlRegex(env), { timeout: 30_000 });
        writeFailures(0);
      } catch (err) {
        writeFailures(readFailures() + 1);
        await context.close();
        // Pesan ini dikenali scripts/playwright_to_results.py sebagai kegagalan environment (blocked).
        throw new Error(`Login AMS gagal (percobaan ${readFailures()}/2): ${err.message}`);
      }
      await page.close();
      await use(context);
      await context.close();
    },
    { scope: 'worker' },
  ],

  context: async ({ authedContext }, use) => {
    await use(authedContext);
  },

  page: async ({ authedContext }, use) => {
    const page = await authedContext.newPage();
    await use(page);
    await page.close();
  },

  // Context manual tidak mendapat auto-screenshot dari konfigurasi `screenshot:` —
  // ambil manual saat gagal agar konverter tetap menemukan attachment "screenshot".
  attachScreenshotOnFailure: [
    async ({ page }, use, testInfo) => {
      await use();
      if (testInfo.status !== testInfo.expectedStatus && !page.isClosed()) {
        const shot = testInfo.outputPath('test-failed-1.png');
        try {
          await page.screenshot({ path: shot, fullPage: true });
          testInfo.attachments.push({ name: 'screenshot', path: shot, contentType: 'image/png' });
        } catch {
          /* halaman keburu mati — biarkan tanpa screenshot */
        }
      }
    },
    { auto: true },
  ],
});

module.exports = { test, expect: base.expect, resolveLocator };
