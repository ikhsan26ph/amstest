# AMS — Claude Code

Baca dan ikuti `docs/agent-guide.md` sebagai sumber utama aturan proyek.
Semua path relatif terhadap root repository.

Aplikasi target: **AMS (Auction Management System)** — staging `https://auction-staging.prahu-hub.com/`.

Slash command di `.claude/commands/` meneruskan tugas dan argumen ke
`docs/workflows/`. Definisi `.claude/agents/` merujuk `docs/roles/`.
Gunakan peran secara berurutan; delegasi opsional mengikuti izin dan kemampuan sesi.
Konfigurasi browser MCP Claude ada di `.mcp.json`.
Perbarui prosedur bersama di `docs/`, bukan menyalinnya ke adapter ini.

## Aturan Keras

- Kredensial hanya boleh ada di `config/env.md` (gitignored) — **tidak pernah** dicetak ke
  log/output/commit/dokumentasi. Kredensial diisi manual oleh manusia, jangan diisi otomatis.
- Semua parameter login (`loginPath`, `loginSuccessUrlPattern`, `loginEmailSelector`,
  `loginPasswordSelector`, `loginButtonSelector`) dibaca dari `config/env.md` — jangan
  di-hardcode di test/fixture.
- Login gagal 2x berturut-turut = **berhenti**, jangan retry otomatis, lapor ke user.
- Dilarang aksi destruktif terhadap data yang bukan dibuat oleh run testing itu sendiri.
- Data test yang dibuat wajib berprefix `AUTOTEST-<tanggal>-`.
- Repo GitHub proyek ini harus **private sejak awal dibuat**; jangan pernah public.

## Hipotesis Belum Terverifikasi (dibawa dari OMS)

Mesin ini disalin dari mesin testing OMS. Perilaku UI berikut ditemukan di OMS dan **mungkin**
berlaku di AMS, tapi **belum dicek**. Semua item **WAJIB diverifikasi ulang** saat `/explore`
dan `/harvest-selectors` di AMS — minimal pada 1 halaman list dan 1 halaman form — dan
**jangan diasumsikan benar begitu saja**. Setelah dicek, ubah kolom Status menjadi salah satu:
`TERVERIFIKASI SAMA (YYYY-MM-DD)`, `BERBEDA (YYYY-MM-DD; penjelasan singkat)`, atau
`BELUM DICEK (YYYY-MM-DD; alasan)`.

| # | Hipotesis (perilaku di OMS) | Dampak jika benar | Status |
|---|---|---|---|
| 1 | Klik elemen butuh `dispatchEvent('click')` (bukan klik native Playwright biasa) | set `loginClickMode: dispatch` di `config/env.md`; executor pakai `dispatchEvent` | BERBEDA (2026-09-23; login sungguhan berhasil dengan `page.click()` native pada tombol Login, `dispatchEvent` tidak diperlukan — lihat `explore/module-map.md`) |
| 2 | Backend menolak `storageState` lintas context → login 1x per worker, `workers=1` | pertahankan pola `tests/helpers/fixtures.js` + `workers: 1` di `playwright.config.js` | BERBEDA (2026-09-23; diuji langsung — storageState dari context A BERHASIL dipakai di context B baru untuk akses `/monitoring`, tidak ditolak. `workers: 1` tetap dipertahankan untuk saat ini sebagai kehati-hatian pada data staging nyata, bukan keterpaksaan teknis — lihat `explore/module-map.md`) |
| 3 | Pola dropdown: tombol (button) + daftar opsi, bukan `<select>` native | jangan pakai `selectOption()`; klik button lalu pilih opsi | TERVERIFIKASI SAMA (2026-09-23; tombol filter di Master Provinsi: `aria-haspopup="listbox"` `aria-expanded`). Pengecualian: "Tampilkan" di `/lelang` adalah `<select>` native) |
| 4 | Datepicker pakai selector `button.h-9.w-9`, dengan baris berisi sisa tanggal bulan sebelumnya/berikutnya yang perlu difilter | filter tombol tanggal yang bukan bulan aktif sebelum klik | BERBEDA (2026-09-23; AMS pakai library flatpickr — sel tanggal `span.flatpickr-day`, bukan `button.h-9.w-9`. Konsep overflow-tanggal tetap ada, ditandai class `prevMonthDay`/`nextMonthDay` — lihat `explore/module-map.md`). Update 2026-09-23: form `/lelang/buat` memakai picker KUSTOM (grid `button` hari + overflow bulan lain, input `aria-label="Waktu (24 jam)"`) — mirip pola OMS; lihat `shared/selector-map-lelang.md`) |
| 5 | Modal tidak memakai atribut `role="dialog"` | `getByRole('dialog')` tidak bisa dipakai; cari modal via heading/teks | TERVERIFIKASI SAMA (2026-09-23; dialog konfirmasi Batal di `/lelang/buat` = div `position:fixed` tanpa `role="dialog"`/`aria-modal`, tombol `Tidak`/`Ya` — lihat `shared/selector-map-lelang.md`) |
| 6 | Tidak ada atribut `data-testid` di elemen-elemen interaktif | selector priority mulai dari `getByRole`/`getByLabel`; `getByTestId` hanya jika ditemukan | TERVERIFIKASI SAMA (2026-09-23; 0 elemen `[data-testid]` di 28 route yang dipindai) |

Catatan: bila hasil verifikasi `BERBEDA`, perbarui juga komentar terkait di
`tests/helpers/fixtures.js`, `playwright.config.js`, dan `docs/agent-guide.md`. (Sudah dilakukan
untuk item #1, #2, #4 di atas per 2026-09-23.)
