const { defineConfig, devices } = require('@playwright/test');
const { parseEnv } = require('./tests/helpers/env');

// Hanya butuh baseUrl di sini; kelengkapan parameter login divalidasi di tests/helpers/fixtures.js.
const env = parseEnv();

module.exports = defineConfig({
  testDir: './tests',
  outputDir: 'artifacts/test-results',
  timeout: 90_000,
  expect: { timeout: 10_000 },
  // workers=1 dibawa dari OMS: di sana backend menolak sesi lintas context (storageState tidak
  // berfungsi). DIVERIFIKASI 2026-09-23 di AMS (CLAUDE.md hipotesis #2): BERBEDA — storageState
  // ternyata BERHASIL lintas context di AMS (lihat explore/module-map.md). workers=1 tetap
  // dipertahankan untuk SEMENTARA sebagai kehati-hatian pada staging berisi data nyata, bukan
  // karena keterpaksaan teknis. Beralih ke storageState + workers>1 mungkin secara teknis, tapi
  // perlu keputusan eksplisit user dulu sebelum diterapkan.
  fullyParallel: false,
  workers: 1,
  // Login gagal tidak boleh di-retry otomatis (aturan: 2x gagal = berhenti;
  // guard tambahan ada di fixtures.js).
  retries: 0,
  reporter: [
    ['line'],
    ['json', { outputFile: 'results/_playwright/last-run.json' }],
  ],
  use: {
    baseURL: env.baseUrl,
    actionTimeout: 10_000,
    navigationTimeout: 30_000,
    trace: 'retain-on-failure',
  },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
  ],
});
