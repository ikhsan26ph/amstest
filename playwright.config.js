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
  // berfungsi), sehingga satu context login dibagi seluruh test lewat tests/helpers/fixtures.js.
  // Untuk AMS ini masih HIPOTESIS (CLAUDE.md → "Hipotesis Belum Terverifikasi" #2).
  // Tetap 1 worker sampai terverifikasi — staging bisa berisi data nyata, jangan paralel.
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
