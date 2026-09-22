# AMS Automation Testing Machine (Claude Code + Codex)

Mesin automation testing **AMS (Auction Management System)** berbasis **Claude Code atau Codex + Playwright**.
Target: `https://auction-staging.prahu-hub.com/`.

Mesin ini disalin dari mesin testing OMS. Pengetahuan spesifik OMS (peta modul, selector,
skenario) **tidak** ikut dibawa. Asumsi perilaku UI yang dibawa dari OMS dicatat sebagai
hipotesis di `CLAUDE.md` → "Hipotesis Belum Terverifikasi" dan wajib dicek ulang di AMS.

> **Repo ini harus private.** Isi `explore/`, `shared/`, dan `scenario/` bisa memuat URL
> staging, nama akun, dan data pelanggan. Jangan pernah membuat repo public.

## Setup (sekali saja)

1. Buka folder ini di VS Code, pastikan extension/CLI Claude Code terpasang (butuh Node.js ≥ 22, lihat `.nvmrc`).
2. Isi `config/env.md` (format `key: value`, contoh lengkap: `config/env.example.md`):
   - `email` dan `password` **diisi manual oleh manusia** — jangan di-commit, jangan dicetak ke log.
   - `loginPath`, `loginSuccessUrlPattern`, dan tiga selector login diisi saat **kalibrasi login** (langkah pertama sesi Tahap B), boleh kosong sebelum itu.
3. Taruh dokumen skenario per modul ke `scenario/<nama-modul>/` (analysis, ui-inventory, .feature, scenarios.json, coverage — skema: `scenario/README.md`). Contoh nama modul: `ams001-auction-list`.
4. Pilih agent: jalankan `claude` (MCP dari `.mcp.json`) atau `codex` (MCP dari `.codex/config.toml`) di folder ini. Untuk Codex, konfigurasi proyek hanya dimuat setelah proyek dipercaya. Mulai ulang sesi setelah konfigurasi berubah; cek `codex mcp list` dan `/mcp` untuk memastikan server tersedia.
5. Install dependency Playwright: `npm ci`, lalu `npx playwright install chromium`.
6. Install dependency script report: `pip install openpyxl` (biasanya sudah ada).

## Cara Pakai Codex

Codex membaca `AGENTS.md`, lalu mengikuti panduan dan workflow bersama di `docs/`.
Gunakan instruksi biasa, misalnya:

```text
Jalankan workflow explore.
Jalankan workflow test-module untuk ams001 dengan filter smoke.
Jalankan workflow test-module untuk ams002 dengan filter category:negative max:20.
Jalankan workflow report all.
```

Untuk perintah yang eksplisit: `Baca docs/workflows/harvest-selectors.md dan jalankan
untuk modul ams001.` Slash command di tabel berikut khusus Claude Code.
`/task` belum tersedia pada kedua agent.

## Cara Pakai Claude Code

| Perintah | Fungsi |
|---|---|
| `/explore` | Login + petakan semua modul secara general → `explore/module-map.md` |
| `/smoke` | Cek cepat semua modul (halaman terbuka & render, read-only) |
| `/harvest-selectors <modul>` | Ekstrak selector asli aplikasi live → `shared/selector-map-*.md` |
| `/test-module <modul> [filter]` | Eksekusi skenario satu modul dari scenarios.json |
| `/report [modul\|all]` | Generate ulang Excel dari hasil run |
| `/task` | Perintah bebas (**belum tersedia**) |

Contoh:

```
/explore
/test-module ams001 smoke
/test-module auction-list priority:high
/test-module ams002 category:negative max:20
/report all
```

## Struktur

```
CLAUDE.md                  adapter instruksi Claude Code + aturan keras + checklist hipotesis
AGENTS.md                  adapter instruksi Codex
.codex/config.toml         konfigurasi Playwright MCP untuk Codex
docs/agent-guide.md        aturan bersama kedua agent
docs/workflows/            prosedur explore, smoke, harvest, test, report
docs/roles/                prosedur explorer, planner, executor, triager
.claude/commands/          slash command: explore, smoke, harvest-selectors, test-module, report
.claude/agents/            subagent: ams-explorer, test-planner, test-executor, bug-triager
.mcp.json                  browser agent (Playwright MCP)
config/env.md              link + parameter login + akun (gitignore, jangan di-commit)
config/env.example.md      contoh format env.md
explore/                   output /explore (module-map.md)
scenario/<modul>/          dokumen skenario per modul (skema: scenario/README.md)
task/                      fitur perintah bebas /task (belum diimplementasikan)
shared/                    lintas fitur: selector-map-<area>.md, decisions.md
scripts/                   run-playwright.sh, playwright_to_results.py, generate_report.py, merge_batches.py, env_md.py
tests/helpers/             fixtures login (baca config/env.md) + parser env
tests/<modul>.spec.js      spec Playwright per modul (dibuat setelah harvest-selectors)
results/                   hasil run (JSON) + execution plan — gitignore
reports/                   report Excel — gitignore
artifacts/screenshots/     bukti screenshot — gitignore
```

## Alur Kerja Agent

```
User ── /explore ──────────▶ ams-explorer ──▶ explore/module-map.md
User ── /harvest-selectors ▶ (browser) ─────▶ shared/selector-map-*.md
User ── /test-module X ────▶ test-planner ──▶ execution plan (batch)
                             test-executor ─▶ results/X__runId.json + screenshot
                             bug-triager ───▶ klasifikasi failed (BUG / GAP / TEST ISSUE)
                             generate_report.py ─▶ reports/X__runId.xlsx
```

## Berpindah Agent dan Kerja Bersamaan

Untuk bergantian, selesaikan run aktif lalu beri agent berikutnya nama modul,
filter, lokasi plan/hasil, dan pekerjaan tersisa. Keduanya memakai skenario, selector,
runner, serta format hasil yang sama. Riwayat percakapan tidak otomatis dibagikan.

Untuk bekerja bersamaan gunakan Git worktree terpisah, siapkan dependency dan
`config/env.md` pada masing-masing worktree, serta pisahkan sesi browser dan data
uji. Runner menulis `results/_playwright/last-run.json`, sehingga dua run tidak boleh
berjalan bersamaan dalam working directory yang sama. Jika backend/akun uji belum
bisa diisolasi, jalankan testing bergantian. Detail: `docs/agent-guide.md`.
