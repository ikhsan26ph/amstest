# Module Map — AMS (Auction Management System)

Hasil `/explore` read-only, diperbarui **2026-09-27**. Login sebagai **Admin Utama** (role tampil di header: "Admin / Administrator"). Akun tunggal — pembatasan akses per role belum diverifikasi.

## Info Login & Environment

| Key | Nilai |
|---|---|
| baseUrl | `https://auction-staging.prahu-hub.com/` |
| loginPath | `/login` |
| Judul halaman login | "Login \| Prahu Hub - AMS" |
| Field login | placeholder "Masukkan Email", placeholder "Masukkan Password", tombol "Login" |
| loginSuccessUrlPattern | `/monitoring` |
| Klik tombol login | native `page.click()` berhasil |
| Role yang tampil | Admin / Administrator |
| Kuota Order | 0/200 (0%) per 2026-09-27 |
| Versi | Prahu Hub - AMS - Versi 1.0.0 |

## Peta Modul

| # | Modul | Route | Jenis Halaman | Aksi Utama | Ada Dokumen Skenario? | Catatan |
|---|---|---|---|---|---|---|
| 1 | Monitoring | `/monitoring` | Dashboard | — (read-only) | Belum | Kartu statistik: Total Armada, Sedang dalam proses, Melewati SLA, Daftar Armada Berjalan. Tabs: Semua Tahapan / Selesai Muat / Selesai Bongkar / Belum Ada Pencatatan. Pembaruan terakhir: 27 Sep 12.24. |
| 2 | Dashboard Operasional | `/dashboard-operasional` | Dashboard | Filter periode, Export | Belum | Date-range picker (flatpickr). |
| 3 | Distribusi & Muatan | `/dashboard-distribusi` | Dashboard | Filter periode, Export | Belum | Pola sama dengan Dashboard Operasional. |
| 4 | Daftar Lelang | `/lelang` | List | Buat Lelang, Riwayat Pembatalan, Filter | **Ya** (ams001, ams002) | Tabs: Semua Lelang / Lelang Ulang (0) / Request Jadwal (0) / Draf (84). Tombol: Buat Lelang, Riwayat Pembatalan, Filter. |
| 5 | Live Bidding | `/lelang/live-bidding` | List (live) | Laporan Lelang, Filter | Belum | Submenu Lelang Spot Rate. |
| 6 | Negosiasi | `/negosiasi` | List | Filter | Belum | **BARU** — belum ada di module-map sebelumnya. Tabs: Semua / Perlu Aksi (0) / Menunggu Vendor (0) / Selesai (1). Filter: Tidak Direspons, Jenis Order, Kota Asal/Tujuan, Tipe/Skema Pengiriman, Drop Point, Status. |
| 7 | Order | `/order` | List | Buat Order, Batch Order, Riwayat Pembatalan, Filter | Belum | Filter: Semua Jenis, Semua Kota, Pilih Tanggal, Semua Tipe, Semua Drop Point, Semua Status. |
| 8 | Penugasan Tracking | `/penugasan-tracking` | List | Filter | Belum | Filter: jenis order, rute, status, tahapan, vendor. |
| 9 | Simulasi Muatan | `/simulasi-muatan` | Tool/Kalkulator | Pilih Armada/Kontainer/Barang | Belum | Alat bantu simulasi muat sebelum lanjut ke Order. |
| 10 | Master Provinsi | `/master/provinsi` | List | Tambah Provinsi, Filter, Riwayat | Belum | Filter: Pilih Status. Dropdown kustom (dikonfirmasi). |
| 11 | Master Kota | `/master/kota` | List | Filter, Riwayat | Belum | Filter: Pilih Provinsi, Semua Status. |
| 12 | Master Kecamatan | `/master/kecamatan` | List | Filter, Riwayat | Belum | Filter: Pilih Kota/Kab., Pilih Provinsi. |
| 13 | Master Kelurahan | `/master/kelurahan` | List | Filter, Riwayat | Belum | Filter: Pilih Provinsi, Pilih Kota/Kab. |
| 14 | Master Drop Point | `/master/customer` | List | Filter, Riwayat | Belum | Route API memakai istilah lama "customer". Filter: Pilih Status. |
| 15 | Master Waktu Perjalanan | `/master/waktu-perjalanan` | List | Filter, Riwayat | Belum | |
| 16 | Master Pelabuhan | `/master/pelabuhan` | List | Filter, Riwayat | Belum | Filter: Pilih Kota/Kab., Pilih Status. |
| 17 | Master Pelayaran | `/master/pelayaran` | List | Filter, Riwayat | Belum | Filter: Pilih Status. |
| 18 | Master Barang | `/master/barang` | List | Filter, Riwayat | Belum | Filter: Pilih Kemasan, Pilih Status. |
| 19 | Master Kemasan | `/master/kemasan` | List | Filter, Riwayat | Belum | Filter: Pilih Status. |
| 20 | Master Unit | `/master/unit` | List (3 tab) | Tambah Armada, Import Data | Belum | Tab: Armada / Jenis Armada / Jenis Kontainer. Tombol Tambah Armada → halaman penuh. |
| 21 | Master Sopir | `/master/sopir` | List | Tambah Sopir, Filter | Belum | Filter: Pilih Nama Vendor. |
| 22 | Master CS | `/master/cs` | List | Filter, Riwayat | Belum | Filter: Pilih Status. |
| 23 | Manajemen Vendor | `/manajemen-vendor` | List | Filter, Riwayat | Belum | Filter: Pilih Status, Pilih Pengelola, Pilih CS Penanggung Jawab. Detail eksplorasi: `explore/manajemen-vendor.md`. |
| 24 | Pengaturan Akun | `/pengaturan-akun` | List (2 tab) | Tambah Sub User, Riwayat | Belum | Tab: Sub User / Hak Akses. |
| 25 | Akun Saya | `/akun-saya` | Profil | Edit Informasi, Ubah Password, Riwayat | Belum | |
| 26 | Pengaturan Sistem | `/setting/sistem` | Form pengaturan | Batal, Simpan | Belum | Field: Durasi Kedaluwarsa Undangan Vendor (Durasi + Satuan: Menit/Jam/Hari), Pilihan Durasi Lelang FTL & FCL (Tambah Durasi). |
| 27 | Pengaturan Notifikasi | `/setting/general` | Form pengaturan | Batal, Simpan | Belum | |
| 28 | Preferensi Notifikasi | `/setting/preferensi-notifikasi` | Form pengaturan (toggle) | Batal, Simpan | Belum | |

Sidebar lengkap (urutan): Dashboard (Monitoring / Operasional / Distribusi & Muatan) → Lelang Spot Rate (Daftar Lelang / Live Bidding) → Negosiasi → Order → Penugasan Tracking → Simulasi Muatan → Master Wilayah (Provinsi / Kota / Kecamatan / Kelurahan) → Master Operasional (Drop Point / Waktu Perjalanan / Pelabuhan / Pelayaran / Barang / Kemasan / Unit / Sopir / CS) → Manajemen Vendor → Pengaturan Akun → Akun Saya → Pengaturan Sistem → Pusat Notifikasi (Pengaturan Notifikasi / Preferensi Notifikasi).

**Total modul: 28** (bertambah 1 vs sebelumnya — Negosiasi `/negosiasi` sekarang muncul sebagai menu top-level tersendiri).

## Perubahan vs Eksplorasi Sebelumnya (2026-09-23)

| Item | Sebelumnya | Sekarang |
|---|---|---|
| Modul Negosiasi | Dicatat sebagai "ada di sidebar tapi belum dipetakan" | Dipetakan: list dengan 4 tab, filter lengkap |
| Draf counter | Draf 52 (25/09) | Draf **84** (27/09) |
| Lelang Ulang | — | Counter 0 |
| Request Jadwal | — | Counter 0 |
| Kuota Order | — | 0/200 (0%) |

## Verifikasi Checklist Hipotesis

| # | Hipotesis | Status |
|---|---|---|
| 1 | Klik butuh dispatchEvent | **BERBEDA (2026-09-23)** — native berhasil |
| 2 | Backend tolak storageState lintas context | **BERBEDA (2026-09-23)** — storageState berfungsi |
| 3 | Dropdown = tombol kustom, bukan `<select>` | **TERVERIFIKASI SAMA (2026-09-23)** — dikonfirmasi ulang 2026-09-27 |
| 4 | Datepicker flatpickr vs button.h-9.w-9 | **BERBEDA (2026-09-23)** — AMS pakai flatpickr di dashboard; form `/lelang/buat` pakai picker kustom |
| 5 | Modal tanpa role="dialog" | **TERVERIFIKASI SAMA (2026-09-23)** — dialog Batal tanpa role="dialog" |
| 6 | Tidak ada data-testid | **TERVERIFIKASI SAMA (2026-09-23)** — 0 elemen di 28 route |

## Keterbatasan Eksplorasi Ini

- Hanya 1 akun (Admin Utama) — pembatasan akses per role belum bisa diverifikasi.
- Modul Negosiasi dipetakan dari list saja; sub-route detail/edit belum ditelusuri.
- Screenshot tersimpan di `artifacts/screenshots/explore/` untuk 7 modul (master-provinsi s.d. master-waktu-perjalanan); sisanya timeout screenshot.
- Hipotesis #5 (modal) masih bergantung pada konteks spesifik — sudah terkonfirmasi di `/lelang/buat` (dialog Batal).
