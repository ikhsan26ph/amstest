# Module Map — AMS (Auction Management System)

Hasil `/explore` read-only, 2026-09-23. Login sebagai **Admin Utama** (email di `config/env.md`,
role tampil di header: "Admin / Administrator"). Belum ada akun role lain untuk membandingkan
pembatasan akses — kolom "Pembatasan Role" di bawah berdasarkan observasi 1 akun saja (gap, lihat
bagian "Keterbatasan" di akhir dokumen).

## Info Login & Environment

| Key | Nilai |
|---|---|
| baseUrl | `https://auction-staging.prahu-hub.com/` |
| loginPath | `/login` |
| Judul halaman login | "Login | Prahu Hub - AMS" |
| Field login | placeholder "Masukkan Email", placeholder "Masukkan Password", tombol "Login" |
| loginSuccessUrlPattern | `/monitoring` (redirect setelah login sukses) |
| Klik tombol login | native `page.click()` berhasil (tidak perlu `dispatchEvent`) |
| Role yang tampil | Admin / Administrator (header kanan atas) |

## Peta Modul

| # | Modul | Route | Jenis Halaman | Aksi Utama | Ada Dokumen Skenario? | Catatan |
|---|---|---|---|---|---|---|
| 1 | Monitoring | `/monitoring` | Dashboard | (read-only, kartu statistik) | Belum | Halaman awal setelah login. `/` redirect ke sini. |
| 2 | Dashboard Operasional | `/dashboard-operasional` | Dashboard | Filter periode (Harian/Mingguan/Bulanan/Tahunan/Pilih Tanggal), Export | Belum | Punya date-range picker (flatpickr) — lihat bagian hipotesis #4. Tabel di halaman ini adalah tabel ringkasan (bukan list CRUD). |
| 3 | Distribusi & Muatan | `/dashboard-distribusi` | Dashboard | Filter periode, Export | Belum | Sama polanya dengan Dashboard Operasional. |
| 4 | Daftar Lelang | `/lelang` | List | Buat Lelang, Riwayat Pembatalan, Filter | Belum | Modul inti "Lelang Spot Rate". Tab tersirat: Semua Lelang / Lelang Ulang / Request Jadwal / Draf. |
| 5 | Live Bidding | `/lelang/live-bidding` | List (live) | Laporan Lelang, Filter (rentang tanggal-jam, jenis/tipe pengiriman, kota) | Belum | Submenu dari Lelang Spot Rate. |
| 6 | Order | `/order` | List | Buat Order, Batch Order, Riwayat Pembatalan, Filter | Belum | |
| 7 | Penugasan Tracking | `/penugasan-tracking` | List | Filter (jenis order, rute, status, tahapan, vendor) | Belum | |
| 8 | Simulasi Muatan | `/simulasi-muatan` | Tool/Kalkulator | Pilih Armada/Kontainer/Barang, Cek Visualisasi, Lanjutkan Order | Belum | Bukan list CRUD biasa — alat bantu simulasi muat sebelum lanjut ke Order. |
| 9 | Master Provinsi | `/master/provinsi` | List | Tambah Provinsi, Filter, Riwayat | Belum | Submenu "Master Wilayah". Tombol Tambah → **halaman penuh** `/master/provinsi/tambah`, bukan modal. |
| 10 | Master Kota | `/master/kota` | List | Filter, Riwayat | Belum | Submenu "Master Wilayah". |
| 11 | Master Kecamatan | `/master/kecamatan` | List | Filter, Riwayat | Belum | Submenu "Master Wilayah". |
| 12 | Master Kelurahan | `/master/kelurahan` | List | Filter, Riwayat | Belum | Submenu "Master Wilayah". |
| 13 | Master Drop Point | `/master/customer` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". Route API/URL memakai istilah lama "customer". |
| 14 | Master Waktu Perjalanan | `/master/waktu-perjalanan` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 15 | Master Pelabuhan | `/master/pelabuhan` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 16 | Master Pelayaran | `/master/pelayaran` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 17 | Master Barang | `/master/barang` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 18 | Master Kemasan | `/master/kemasan` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 19 | Master Unit | `/master/unit` | List (tab: Armada/Jenis Armada/Jenis Kontainer) | Tambah Armada, Import Data, Download Template, Filter | Belum | Submenu "Master Operasional". Tombol Tambah Armada → **halaman penuh** `/master/unit/tambah-armada`, bukan modal. Form ini TIDAK punya field tanggal. |
| 20 | Master Sopir | `/master/sopir` | List | Tambah Sopir, Filter | Belum | Submenu "Master Operasional". |
| 21 | Master CS | `/master/cs` | List | Filter, Riwayat | Belum | Submenu "Master Operasional". |
| 22 | Manajemen Vendor | `/manajemen-vendor` | List | Tambah Vendor, Filter (status, pengelola, CS penanggung jawab), Riwayat; aksi baris Detail/Edit | Belum | Eksplorasi detail 2026-09-23: `explore/manajemen-vendor.md` (sub-route `/tambah`, `/riwayat`, `/{uuid}`, `/{uuid}/edit`). Sidebar kini juga punya menu top-level **Negosiasi** (`/negosiasi`) yang belum dipetakan. |
| 23 | Pengaturan Akun | `/pengaturan-akun` | List (tab: Sub User/Hak Akses) | Tambah Sub User, Filter, Riwayat | Belum | |
| 24 | Akun Saya | `/akun-saya` | Detail/Profil | Edit Informasi, Ubah Password, Riwayat | Belum | |
| 25 | Pengaturan Sistem | `/setting/sistem` | Form pengaturan | Batal, Simpan | Belum | Field: durasi kedaluwarsa undangan vendor, nomor WhatsApp CS. Tidak dibungkus tag `<form>` (JS-driven). |
| 26 | Pengaturan Notifikasi | `/setting/general` | Form pengaturan | Batal, Simpan | Belum | |
| 27 | Preferensi Notifikasi | `/setting/preferensi-notifikasi` | Form pengaturan (toggle) | Batal, Simpan | Belum | 5 input, kemungkinan toggle/checkbox preferensi. |

Sidebar lengkap (dari header ke bawah): Dashboard (Monitoring, Operasional, Distribusi & Muatan) →
Lelang Spot Rate (Daftar Lelang, Live Bidding) → Order → Penugasan Tracking → Simulasi Muatan →
Master Wilayah (Provinsi/Kota/Kecamatan/Kelurahan) → Master Operasional (Drop Point/Waktu
Perjalanan/Pelabuhan/Pelayaran/Barang/Kemasan/Unit/Sopir/CS) → Manajemen Vendor → Pengaturan Akun
→ Akun Saya → Pengaturan Sistem → Pusat Notifikasi (Pengaturan Notifikasi/Preferensi Notifikasi).
Tidak ada folder `scenario/` yang cocok untuk modul mana pun saat ini — semua modul baru bisa
di-smoke-test, belum ada dokumen skenario detail.

## Verifikasi Checklist Hipotesis (Tahap B4)

Diverifikasi 2026-09-23 pada halaman list **Master Provinsi** (`/master/provinsi`), halaman form
**Tambah Armada** (`/master/unit/tambah-armada`), halaman **Dashboard Operasional** (untuk
datepicker), dan pengujian langsung `storageState` lintas context. Status final sudah disalin ke
`CLAUDE.md`; detail bukti di bawah ini.

1. **Klik native vs `dispatchEvent`** — BERBEDA. Login sungguhan berhasil dengan `page.click()`
   biasa pada tombol "Login" (redirect ke `/monitoring` terjadi normal). `dispatchEvent('click')`
   tidak diperlukan, setidaknya untuk tombol ini.
2. **`storageState` ditolak lintas context** — BERBEDA. Diuji langsung: login di context A,
   ambil `context.storageState()`, buat context B baru dengan storageState itu, buka
   `/monitoring` di context B → **berhasil**, tetap dianggap authenticated, tidak diarahkan ke
   `/login`. AMS **tidak** menolak storageState lintas context seperti OMS. `workers: 1` dan pola
   login-sekali-per-worker di `tests/helpers/fixtures.js` **tetap dipertahankan untuk saat ini**
   sebagai langkah hati-hati (staging berisi data nyata), tapi ini kini pilihan desain, bukan
   keterpaksaan teknis — beri tahu user bila ingin mempertimbangkan storageState + parallel
   workers untuk mempercepat eksekusi.
3. **Dropdown = tombol + daftar opsi, bukan `<select>` native** — TERVERIFIKASI SAMA. Tombol
   filter "Pilih Status" di Master Provinsi: `<button aria-haspopup="listbox" aria-expanded="false">`.
   Tiap halaman list hanya punya 1 `<select>` native (dugaan: kontrol jumlah baris per halaman),
   sementara semua filter ("Pilih Status", "Pilih Provinsi", dst.) adalah tombol custom.
4. **Datepicker `button.h-9.w-9` + baris sisa tanggal bulan lain** — BERBEDA. AMS memakai library
   **flatpickr**: sel tanggal adalah `<span class="flatpickr-day">`, BUKAN `button.h-9.w-9` sama
   sekali (dicoba di form Tambah Armada — ternyata form itu tidak punya field tanggal; diuji ulang
   di date-range picker Dashboard Operasional). Konsepnya tetap mirip: sel tanggal bulan
   sebelumnya/berikutnya memang ada di DOM (class `prevMonthDay`/`nextMonthDay`, ditambah class
   `hidden` pada tampilan dua-bulan) dan perlu difilter — tapi selector konkretnya harus
   `span.flatpickr-day:not(.prevMonthDay):not(.nextMonthDay)`, bukan `button.h-9.w-9`.
5. **Modal tanpa `role="dialog"`** — BELUM DICEK (alasan: tombol "Tambah" pada 2 halaman yang
   dicoba — Master Provinsi dan Master Unit — ternyata navigasi ke **halaman penuh**
   (`/master/provinsi/tambah`, `/master/unit/tambah-armada`), bukan modal, jadi belum ada modal
   sungguhan yang bisa diuji. Kemungkinan modal muncul di alur lain, mis. konfirmasi hapus/batal —
   belum dicoba karena berisiko menyentuh data. Perlu dicek ulang saat `/harvest-selectors`
   menemukan modal sungguhan di modul spesifik.
6. **Tidak ada `data-testid`** — TERVERIFIKASI SAMA. 0 elemen `[data-testid]` ditemukan di
   seluruh 28 route yang dipindai (termasuk 2 halaman create/full-page form).

## Keterbatasan Eksplorasi Ini

- Hanya 1 akun (Admin Utama) yang tersedia di `config/env.md` — pembatasan akses per role belum
  bisa diverifikasi (semua menu terlihat dan bisa diakses oleh akun ini).
- Submenu ditelusuri via link `<a href>` yang ada di DOM saat sidebar dalam kondisi default
  (tidak mencoba mengklik untuk expand grup — ternyata semua submenu sudah ada di DOM, tidak
  disembunyikan lewat lazy-render).
- Screenshot per modul: `artifacts/screenshots/explore/<slug-modul>.png` (gitignored, tidak
  ter-commit). Bukti tambahan hipotesis: `artifacts/screenshots/explore/hyp-*.png`,
  `dashboard-datepicker-open.png`.
- Hipotesis #5 (modal) masih terbuka — dicatat jelas di atas, bukan diasumsikan.
