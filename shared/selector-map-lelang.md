# Selector Map — area `/lelang`

Hasil `/harvest-selectors` (read-only) 2026-09-23 untuk modul `ams001-buat-lelang-fcl-shipper`.
Akun: Admin Utama (label header "Admin / Administrator"). Modul belum punya `*_ui-inventory.md`,
jadi layar dipetakan dari route + nama `screen` di `*_scenarios.json`.
Tidak ada `data-testid` sama sekali (hipotesis #6). Tidak ada `id` stabil (id listbox pola `_r_4_-listbox` = auto-generated, DITOLAK).

## Layar yang dipetakan / di-skip

| screen (scenarios.json) | Route | Status |
|---|---|---|
| list-lelang | `/lelang` | Dipetakan |
| filter-lelang | `/lelang` → tombol Filter | **Tombol Filter tidak membuka panel apa pun** (klik native maupun `dispatchEvent`, 2026-09-23) — elemen filter tidak bisa dipetakan |
| informasi-umum | `/lelang/buat` (step 01) | Dipetakan (mode FCL) |
| peserta-lelang, tambah-peserta, harga-penawaran | step 02 / dari lelang FCL | SKIPPED — butuh lolos step 01, yang mustahil karena master Pelabuhan & Jenis Kontainer kosong (lihat bawah); membuka step 02 juga berarti menulis data |
| detail-lelang, edit-lelang, batalkan-lelang, lelang-ulang | dari menu aksi kartu | SKIPPED — tidak ada satu pun lelang FCL di staging (4 lelang, semuanya FTL) |
| (riwayat) | `/lelang/riwayat-pembatalan` | Hanya URL dikonfirmasi (heading "Detail Lelang Spot Rate") |

**Kendala environment (2026-09-23):** `/master/pelabuhan` = 0 data, API `GET /api/pelabuhans?status=true` dan
`GET /api/jenis-kontainers?status=true` kosong → dropdown Pelabuhan Asal/Tujuan & Jenis Kontainer menampilkan
"Tidak ada pilihan". Lelang FCL tidak dapat dibuat di staging ini.

## list-lelang (`/lelang`)

| SCR | Elemen | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| list-lelang | Buat Lelang | `getByRole('button', { name: 'Buat Lelang' })` | role | Navigasi langsung ke `/lelang/buat` — TIDAK ada pop-up pilih jenis (beda dari desain 003-pop-up) |
| list-lelang | Riwayat Pembatalan | `getByRole('button', { name: 'Riwayat Pembatalan' })` | role | → `/lelang/riwayat-pembatalan` |
| list-lelang | Filter | `getByRole('button', { name: 'Filter', exact: true })` | role | Tidak membuka panel (lihat atas) |
| list-lelang | Tampilkan | `page.locator('select')` (satu-satunya `<select>` native) | TIDAK STABIL | `<select>` NATIVE opsi 10/20/50/100, default 20 → `selectOption()` BOLEH di sini (pengecualian hipotesis #3) |
| list-lelang | Tab Semua Lelang / Lelang Ulang / Request Jadwal / Draf | `getByRole('button', { name: /^Lelang Ulang/ })` dst. | role | Berupa `button`, bukan `role=tab`; nama tab + counter dalam satu teks, mis. "Draf 1" |
| list-lelang | Legend | `getByText('Request Jadwal')`, `'Proses Nego'`, `'Lelang Ulang'` (di bawah tab) | text | |
| list-lelang | Card lelang | card berisi teks `No. Lelang:` | text | Nomor mis. `FTL-NRM-02/220926`; badge status `Sedang Buka`/`Dibatalkan`/`Aktif`/`Isi Informasi Umum` |
| list-lelang | Menu aksi (titik tiga) | tombol ikon tanpa teks, sisi kanan card (x>1300 pada viewport 1440) | TIDAK STABIL | Tanpa aria-label |
| list-lelang | Item menu aksi | `getByRole('button', { name: 'Detail' })`, `'Edit Data'`, `'Tambah Peserta Lelang'`, `'Lihat Penawaran'`, `'Lelang Ulang'`, `'Batalkan Lelang'`, `'Riwayat Perubahan'`, `'Hapus Draft'` | role | Selalu 8 item dirender; item tidak berlaku ditampilkan abu-abu via class (bukan atribut `disabled`/`aria-disabled`) |
| list-lelang | Info jumlah | `getByText(/Menampilkan \d+–\d+ data dari \d+ data/)` | text | |

## informasi-umum (`/lelang/buat`)

| SCR | Elemen | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| informasi-umum | Stepper | `getByText('Informasi Umum')` / `getByText('Peserta Lelang')` | text | 01 / 02 |
| informasi-umum | Jenis FTL / FCL | `getByText('FCL', { exact: true })` (klik card) | text | Card radio kustom; default FTL terpilih; tidak ada `input[type=radio]` |
| informasi-umum | Pelabuhan Asal / Tujuan | `locator('button[aria-haspopup="listbox"]', { hasText: 'Pilih Pelabuhan Asal' })` | role (haspopup) | Dropdown kustom + input `Cari...`; opsi `getByRole('option')`; kosong di staging |
| informasi-umum | Durasi Lelang | `button[aria-haspopup="listbox"]` hasText `Pilih Durasi Lelang` | role | Opsi: 1 Jam, 3 Jam, 6 Jam, 12 Jam, 1 Hari, 2 Hari, 3 Hari, 7 Hari (tidak ada "120 menit"/2 Jam) |
| informasi-umum | Buka Lelang / Rencana Awal Kirim / Rencana Akhir Kirim | `locator('div[role="button"]', { hasText: 'DD/MM/YYYY hh:mm' }).nth(0/1/2)` | TIDAK STABIL | Picker KUSTOM (bukan flatpickr): grid `button` hari termasuk overflow bulan lain (warna abu), navigasi bulan `‹ ›`, input jam `00:00`, kolom JAM/MENIT |
| informasi-umum | Tutup Lelang | `getByPlaceholder('DD/MM/YYYY hh:mm')` (input disabled) | placeholder | Read-only, dihitung otomatis |
| informasi-umum | Jenis Kontainer | `button[aria-haspopup="listbox"]` hasText `Pilih Jenis Kontainer` | role | Kosong di staging |
| informasi-umum | Deskripsi Barang | `getByPlaceholder('Masukkan Deskripsi Barang')` | placeholder | |
| informasi-umum | Metode Pengiriman | `getByText('Door to Door', { exact: true })` / `'Door to CY'` / `'CY to CY'` / `'CY to Door'` | text | Card radio kustom |
| informasi-umum | Syarat & Ketentuan (card) | `getByText('Syarat & Ketentuan')` | text | Muncul setelah metode dipilih |
| informasi-umum | Gunakan Asuransi | `getByRole('checkbox', { name: /Gunakan Asuransi/ })` | role | Terlihat juga sebelum metode dipilih pada FTL |
| informasi-umum | Biaya (THC/LOLO/Trucking Asal/Tujuan, Buruh Muat/Bongkar, Kawalan Muat/Bongkar, Lainnya) | `getByRole('checkbox', { name: 'THC Asal' })` dst. | role (label) | Biaya wajib: `checked` + `disabled` |
| informasi-umum | Catatan Tambahan | `getByPlaceholder('Tulis Catatan Tambahan')` | placeholder | |
| informasi-umum | Tipe Pengiriman | `getByText(/Tipe Pengiriman:/)` | text | "Normal — mengikuti jumlah baris Data Pengirim & Data Penerima" |
| informasi-umum | Drop Point Asal/Tujuan | `button[aria-haspopup="listbox"]` hasText `Pilih Drop Point Asal`/`Tujuan` | role | Opsi staging: "HAM - BKL", "HAM - Gudang SBY" |
| informasi-umum | Pengirim / Penerima | `getByPlaceholder('Nama Pengirim')` / `'Nama Penerima'` | placeholder | Input DISABLED, auto dari drop point — tidak bisa dipilih manual (beda dari skenario "pilih Pengirim dahulu") |
| informasi-umum | PIC / No. WhatsApp PIC | input teks di bawah label `PIC Pengirim *` / `No. WhatsApp PIC *` | TIDAK STABIL | Tanpa placeholder/name; pakai label → input berikutnya |
| informasi-umum | Alamat (Provinsi, Kota/Kab., Kecamatan, Desa/Kelurahan, Kode Pos, Alamat) | input/textarea disabled | TIDAK STABIL | textarea alamat placeholder "Enter your message" |
| informasi-umum | Catatan pengirim/penerima | `getByPlaceholder('Masukkan catatan')` nth(0/1) | placeholder | |
| informasi-umum | Tambah Baris Input | `getByRole('button', { name: 'Tambah Baris Input' })` nth(0 pengirim / 1 penerima) | role | |
| informasi-umum | Batal / Simpan ke Draft / Selanjutnya | `getByRole('button', { name: 'Batal', exact: true })` dst. | role | Batal → konfirmasi "Apakah Anda yakin ingin membatalkan ?" tombol `Tidak` / `Ya` — div `position:fixed` TANPA `role="dialog"` (hipotesis #5) |
| informasi-umum | Kembali | `getByRole('button', { name: /Kembali/ })` | role | |
| informasi-umum | Pesan validasi | teks merah di bawah field, mis. "Pelabuhan Asal harus dipilih", "Jenis Kontainer harus dipilih minimal 1", "Metode Pengiriman harus dipilih", "PIC harus diisi", "No. WhatsApp PIC harus diisi" | text | Muncul setelah klik Selanjutnya |

## Rekomendasi data-testid untuk developer

- `lelang-filter-button`, `lelang-card-menu-<noLelang>`, `lelang-page-size`
- `buat-lelang-jenis-ftl`, `buat-lelang-jenis-fcl`, `buat-lelang-metode-<d2d|d2cy|cy2cy|cy2d>`
- `buat-lelang-buka`, `buat-lelang-rencana-awal`, `buat-lelang-rencana-akhir` (trigger picker)
- `pic-pengirim-<n>`, `wa-pengirim-<n>`, `pic-penerima-<n>`, `wa-penerima-<n>`
- `confirm-dialog` + `role="dialog"` pada konfirmasi Batal

## Tambahan FTL (ams002, 2026-09-24)

| SCR | Elemen | Selector terbaik | Catatan |
|---|---|---|---|
| list-lelang | Menu aksi card | `button[title="Aksi"]` (urutan = urutan card) | card = `div.rounded-xl` berisi `No. Lelang:`; item abu-abu → toast alert singkat |
| list-lelang | Filter | `getByRole('button', { name: 'Filter', exact: true })` | 24/09: panel "Filter Lelang" kini terbuka |
| list-lelang | Popup Multidrop/Multipickup | klik teks `Multidrop` di card | isi "Drop Off n — Kota — Drop Point" |
| informasi-umum | Salin data | `input[type=checkbox]` pertama; Periode = flatpickr range (`span.flatpickr-day[aria-label="September 24, 2026"]`, `.flatpickr-prev-month/next-month`); Data Lelang = listbox "Pilih No. Lelang \| Rute" | |
| informasi-umum | Jenis Armada | `button[aria-haspopup="listbox"]` "Pilih Jenis Armada" + `getByPlaceholder('Cari Jenis Armada...')` | multiselect tag, tanpa Pilih Semua |
| informasi-umum | Pengirim/Penerima | listbox "Semua Pengirim"/"Semua Penerima" (filter drop point per perusahaan) | |
| informasi-umum | PIC / WA | `getByPlaceholder('Masukkan PIC Pengirim')`, `'Masukkan PIC Penerima'`, `'Masukkan No. WhatsApp PIC'` nth(0/1) | WA membuang huruf |
| informasi-umum | Nilai Barang | `getByPlaceholder('Rp 0')` nth(0/1) | muncul saat Gunakan Asuransi dicentang |
| informasi-umum | Baris multi | `getByRole('button', { name: 'Hapus Muat 2' })` / `'Hapus Bongkar 2'` | label "Muat n"/"Bongkar n" |
| informasi-umum | Dokumen | file chooser via `Pilih File` (multiple) | |
| peserta-lelang | Vendor | `label` berisi checkbox + nama; `getByPlaceholder('Cari nama vendor')`; `getByText('Pilih semua vendor')`; counter `getByText(/vendor diundang/)` | "Selanjutnya" di step 01 langsung membuat draft (POST /api/lelang) |
| detail/edit/peserta/penawaran/ulang | Route | `/lelang/{id}`, `/edit`, `/peserta`, `/penawaran`, `/ulang`, `/riwayat-ulang` | `/riwayat` = 404 |
| harga-penawaran | Filter/Urutkan/Ajukan Nego | tombol teks; Filter membuka panel (Vendor, Jenis Armada, Target Waktu, Reset, Terapkan); tab card `getByText('Detail Biaya'|'Detail Armada'|'Vendor')` | opsi dropdown: `[role=listbox] [role=option]` (hindari `<select>` Tampilkan) |
| batalkan-lelang | Dialog | `getByPlaceholder('Tuliskan alasan pembatalan')`, tombol `Batalkan Order` / `Kembali` | |
| draft | Hapus | menu `Hapus Draft` → dialog "Hapus Draf Lelang?" tombol `Tidak` / `Hapus Draft` | |
