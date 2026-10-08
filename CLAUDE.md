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
| 1 | Klik elemen butuh `dispatchEvent('click')` (bukan klik native Playwright biasa) | set `loginClickMode: dispatch` di `config/env.md`; executor pakai `dispatchEvent` | BERBEDA (2026-10-08; login Admin/Vendor, navigasi list dan form Spot Rate serta Kontrak Batch03 serta filter/tab Live Bidding Batch04 berhasil dengan klik native; dispatchEvent tidak diperlukan pada sampel eksplorasi; Batch05 list/formHarga/Jadwal/Request juga native; Batch06 list/detail/modalNegosiasi/checkbox/sort juga native; Batch07 list/formOrder/Batch/picker/radio native; Batch08 list/formwilayah/lokasi/filter/menu native; Batch09 list/formMasterOperasional/Vendor/tab/filter/picker native; Batch10 Vendor/Akun/Settings/Notif native) |
| 2 | Backend menolak `storageState` lintas context → login 1x per worker, `workers=1` | pertahankan pola `tests/helpers/fixtures.js` + `workers: 1` di `playwright.config.js` | BERBEDA (2026-10-04; storageState Vendor diterima di context baru untuk akses Order; navigasi sesi asal berikutnya redirect login, penyebab belum terverifikasi. Tidak membuktikan stabilitas jangka panjang) |
| 3 | Pola dropdown: tombol (button) + daftar opsi, bukan `<select>` native | jangan pakai `selectOption()`; klik button lalu pilih opsi | TERVERIFIKASI SAMA (2026-10-04; filter list dan Pilih No. Lelang pada form kustom); tambahan 2026-10-08: filter Dashboard Lelang kustom, Tipe Order Operasional select native seperti Tampilkan — pilih berdasarkan elemen aktual; Batch02: select ukuran halaman list/peserta native, dropdown form/filter kustom; Batch03 Kontrak juga memakai dropdown periode kustom dan Tampilkan native; Batch04 tab memakai role=tab, filter kustom/Tampilkan native; Batch06 tab role=tab, filter button/listbox/option kustom, select ukuranpage native; Batch07 Order/Tracking dropdown kustom dan ukuran halaman select native; Batch08 dropdown wilayah button/option, Tampilkan select native; Batch09 dropdownJenis/Vendor kustom dan Tampilkan select native; Batch10 dropdownstatus/HakAkses kustom, ukuranpage/satuanundangan select native |
| 4 | Datepicker pakai selector `button.h-9.w-9`, dengan baris berisi sisa tanggal bulan sebelumnya/berikutnya yang perlu difilter | filter tombol tanggal yang bukan bulan aktif sebelum klik | BERBEDA (2026-10-04; dashboard Operasional memakai flatpickr: 70 sel hari, 9 overflow. Form lelang memakai kalender kustom; diverifikasi ulang 2026-10-08: 43 button.h-9.w-9 dan input Waktu (24 jam); modal kalender periode Kontrak Batch03 juga 43tombol kustom, tanpa input date/datetime-local; kalender filter Live Bidding Admin Spot Batch04 terhitung50tombol, perlu periksa navigasi/overflow; Batch06 tidak ada datepicker pada filter/modalnego yang diperiksa, tidak diuji ulang; Batch07 filter Order Vendor flatpickr70sel, bukan button.h-9.w-9; Batch08 kalender tidak dibuka; Batch09 filterTanggalUpdateUnit flatpickr42sel,1button.h-9.w-9; Batch10 kalender tidak dibuka) |
| 5 | Modal tidak memakai atribut `role="dialog"` | periksa per modal; gunakan role jika ada, heading/teks jika tidak | BERBEDA (2026-10-08; modal tidak seragam: Pengelompokan Jumlah Order Dashboard Lelang memiliki role=dialog. Bukti 2026-10-04 tetap: Batal /lelang/buat dan penolakan Tambah Jadwal tanpa role=dialog; Batal form Spot Rate, Batal Kontrak dan create periode Kontrak diverifikasi tanpa role=dialog pada 2026-10-08; Batch05 guard/BatalJadwal juga tanpa role=dialog; Batch06 modalAjukan/Accept/Counter/Reject/guard juga tanpa role=dialog; Batch07 Batal Order/Batch dan picker barang juga tanpa role=dialog; Batch08 panelEditWilayah/DetailEditTambahDropPoint dan BatalKelurahan/Perusahaan tanpa role=dialog; Batch09 panelEditcommon/BatalcreateArmadaAdmin danVendor tanpa role=dialog; Batch10 modalProfile/OTP/BatalVendor/HakAkses tanpa role=dialog; periksa setiap modal) |
| 6 | Tidak ada atribut `data-testid` di elemen-elemen interaktif | selector priority mulai dari `getByRole`/`getByLabel`; `getByTestId` hanya jika ditemukan | TERVERIFIKASI SAMA (2026-10-08; inventaris Spot Rate dan Batch03 list/form/periode/detail Kontrak serta inventory Live Bidding/Laporan Batch04 serta Batch05 Penawaran/Jadwal/Request list/form serta Batch06 list/detail/modalform tetap 0 data-testid; Batch07 list/formOrder/Batch/Tracking/Simulator juga0; Batch08 list/form/panelWilayah/DropPoint juga0; Batch09 list/form/auditMasterOperasional/Vendor juga0; Batch10 Vendor/Akun/Settings/Notif juga0) |

Catatan: bila hasil verifikasi `BERBEDA`, perbarui juga komentar terkait di
`tests/helpers/fixtures.js`, `playwright.config.js`, dan `docs/agent-guide.md`. (Sudah dilakukan
untuk item #1, #2, #4 di atas per 2026-09-23.)
