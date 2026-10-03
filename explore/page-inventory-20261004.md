# Inventaris Detail Halaman AMS — 2026-10-04

Bukti observasi langsung Admin dan Vendor, read-only. Field `required` di bawah merujuk atribut HTML; kewajiban bisnis juga bisa ditandai `*` di label tanpa atribut HTML. Tombol yang terlihat tidak berarti aksi menyimpannya diuji.

## 1. Admin — Prahu Hub - AMS

- Route: `/monitoring`.
- Jenis: Dashboard; varian/tab/aksi pembuka: halaman utama.
- Judul: Monitoring | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Monitoring; Daftar Armada Berjalan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Semua Tahapan / 0; Selesai Muat / 0; Selesai Bongkar / 0; Melewati SLA / 0; Belum Ada Pencatatan / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-monitoring.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari armada berjalan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Monitoring · Monitoring · Pembaruan terakhir: · 04 Okt, 00.06 · Total Armada · 0 · Sedang dalam proses pengiriman · Melewati SLA · 0 · Lewat dari estimasi waktu tiba · Semua Tahapan · 0 · Selesai Muat · 0 · Selesai Bongkar · 0 · Melewati SLA · 0 · Belum Ada Pencatatan · 0 · Daftar Armada Berjalan · Belum ada armada yang sedang dalam proses pengiriman.

## 2. Admin — Operasional

- Route: `/dashboard-operasional`.
- Jenis: Dashboard; varian/tab/aksi pembuka: halaman utama.
- Judul: Dashboard Operasional | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Dashboard Operasional; Volume dan Aktivitas; Jenis Pengiriman; Tren Volume Order; Produktivitas Vendor; 5 Vendor Paling Produktif; Performa Pengiriman; Ketepatan Waktu; Daftar Keterlambatan Pengiriman.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Harian; Mingguan; Bulanan; Pilih Tanggal; Export; Vendor; Keterlambatan; Persentase Keterlambatan.
- Kolom tabel: No; Vendor; Trip Selesai; Order Terkirim; No; Vendor; Keterlambatan; Persentase Keterlambatan; Aksi; No; Vendor; Keterlambatan; Persentase Keterlambatan.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-dashboard-operasional.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | Semua Tipe Order, FTL (Full Truck Load), LTL (Less Than Truck Load), FCL (Full Container Load), LCL (Less Than Container Load), Airfreight |
| Cari data | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Prahu Hub - AMS · Dashboard · Monitoring · Operasional · Distribusi & Muatan · Lelang Spot Rate · Daftar Lelang · Live Bidding · Lelang Kontrak · Daftar Lelang · Live Bidding · Negosiasi · Order · Riwayat Order Tidak Aktif · Penugasan Tracking · Simulasi Muatan · Master Wilayah · Master Provinsi · Master Kota · Master Kecamatan · Master Kelurahan · Master Operasional · Master Drop Point · Master Waktu Perjalanan · Master Pelabuhan · Master Pelayaran · Master Barang · Master Kemasan · Master Unit · Master Sopir · Master CS · Manajemen Vendor · Pengaturan Akun · Akun Saya · Pengaturan Sistem · Pusat Notifikasi · Pengaturan Notifikasi · Preferensi Notifikasi · Kuota Order · 0/200 · 0% · Prahu Hub - AMS - Versi 1.0.0 · Admin · Administrator · Admin · [akun main] · Dashboard · Operasional · Dashboard Operasional · Periode Permintaan Muat · Harian · Mingguan · Bulanan · Pilih Tanggal · Semua Tipe Order · FTL (Full Truck Load) · LTL (Less Than Truck Load) · FCL (Full Container Load) · LCL (Less Than Container Load) · Airfreight · Export · Volume dan Aktivitas · Total Order · Jumlah seluruh order, kecuali order dengan status "Dibatalkan" · 0 · -100.0% · vs periode lalu · Jenis Pengiriman · Tidak ada data · Tren Volume Order

Catatan kondisi: Tidak ada data · Tidak ada data. · Tidak ada data keterlambatan.

## 3. Admin — Distribusi & Muatan

- Route: `/dashboard-distribusi`.
- Jenis: Dashboard; varian/tab/aksi pembuka: halaman utama.
- Judul: Distribusi & Muatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Distribusi & Muatan; Jangkauan Distribusi; Utilitas Armada; Profil Barang Terkirim; Tingkat Keterisian Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Harian; Mingguan; Bulanan; Pilih Tanggal; Export; Pas-kan tampilan ke seluruh Indonesia; Perbesar; Perkecil.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-dashboard-distribusi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | Kota Tujuan (Penerima), Kota Asal (Pengirim) |

Urutan konten/label yang terlihat:

> Prahu Hub - AMS · Dashboard · Monitoring · Operasional · Distribusi & Muatan · Lelang Spot Rate · Daftar Lelang · Live Bidding · Lelang Kontrak · Daftar Lelang · Live Bidding · Negosiasi · Order · Riwayat Order Tidak Aktif · Penugasan Tracking · Simulasi Muatan · Master Wilayah · Master Provinsi · Master Kota · Master Kecamatan · Master Kelurahan · Master Operasional · Master Drop Point · Master Waktu Perjalanan · Master Pelabuhan · Master Pelayaran · Master Barang · Master Kemasan · Master Unit · Master Sopir · Master CS · Manajemen Vendor · Pengaturan Akun · Akun Saya · Pengaturan Sistem · Pusat Notifikasi · Pengaturan Notifikasi · Preferensi Notifikasi · Kuota Order · 0/200 · 0% · Prahu Hub - AMS - Versi 1.0.0 · Admin · Administrator · Admin · [akun main] · Dashboard · Distribusi · Distribusi & Muatan · Periode Permintaan Muat · Harian · Mingguan · Bulanan · Pilih Tanggal · Export · Jangkauan Distribusi · Kota Terjangkau · 0 · Tersebar di 0 provinsi · Jumlah Pengirim Aktif · 0 · Titik asal pengiriman barang · Jumlah Penerima Aktif · 0 · Titik tujuan penerima barang · Jumlah Order · Akumulasi order per provinsi · Sangat Tinggi · > 100.000 · Tinggi

Catatan kondisi: Tidak ada data barang pada periode ini

## 4. Admin — Daftar Lelang

- Route: `/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Pembatalan; Filter; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Draf / 103; Multipickup; Multidrop; 1; 2; 19.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Buat Lelang · Riwayat Pembatalan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Draf · 103 · Request Jadwal · Proses Nego · Lelang Ulang

## 5. Admin — Daftar Lelang → Buat Lelang

- Route: `/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Buat Lelang.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Pembatalan; Filter; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Draf / 103; Multipickup; Multidrop; 1; 2; 19.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Buat Lelang · Riwayat Pembatalan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Draf · 103 · Request Jadwal · Proses Nego · Lelang Ulang

## 6. Admin — Daftar Lelang → Riwayat Pembatalan

- Route: `/lelang/riwayat-pembatalan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Pembatalan.
- Judul: Riwayat Pembatalan Lelang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Pembatalan Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-riwayat-pembatalan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Riwayat Pembatalan · Riwayat Pembatalan Lelang · Tampilkan · 10 · 20 · 50 · 100 · data · Memuat riwayat pembatalan... · Menampilkan 0–0 data dari 0 data

## 7. Admin — Live Bidding

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 8. Admin — Live Bidding → Live Bidding

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Live Bidding.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 9. Admin — Live Bidding → Laporan Lelang

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Laporan Lelang.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; Export; Semua Vendor; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Export · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Vendor · Semua Vendor · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Memuat laporan lelang... · Menampilkan 0–0 lelang dari 0 lelang

## 10. Admin — Live Bidding → Semua Jenis Pengiriman

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua Jenis Pengiriman.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 11. Admin — Live Bidding → FCL (Full Container Load)

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FCL (Full Container Load).
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 12. Admin — Live Bidding → FTL (Full Truck Load)

- Route: `/lelang/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FTL (Full Truck Load).
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 13. Admin — Daftar Lelang

- Route: `/lelang-kontrak`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Kontrak.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Perubahan; Filter; Semua Lelang; Request Jadwal / 0; Draf / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Lelang Kontrak · Buat Lelang · Riwayat Perubahan · Data Periode Kontrak · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Request Jadwal · 0 · Draf · 0 · Request Jadwal

## 14. Admin — Daftar Lelang → Buat Lelang

- Route: `/lelang-kontrak/buat`.
- Jenis: Form; varian/tab/aksi pembuka: Buat Lelang.
- Judul: Buat Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Lelang Kontrak; Informasi Umum.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; Pilih Periode Kontrak; Buat Periode Kontrak; Batal; Simpan ke Draft; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-buat.png`.

Urutan konten/label yang terlihat:

> Lelang Kontrak · Buat Lelang Kontrak · Buat Lelang Kontrak · 01 · Informasi Umum · 02 · Peserta Lelang · Informasi Umum · FTL · Full Truck Load · FCL · Full Container Load · Periode Kontrak * · Pilih Periode Kontrak · Buat Periode Kontrak · Batal · Simpan ke Draft · Selanjutnya

## 15. Admin — Daftar Lelang → Riwayat Perubahan

- Route: `/lelang-kontrak/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Perubahan Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar.
- Kolom tabel: Field; Nilai Lama; Nilai Baru.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-riwayat.png`.

Urutan konten/label yang terlihat:

> Lelang Kontrak · Riwayat Perubahan · Riwayat Perubahan · Admin · 03/10/2026, 08.10 · Field	Nilai Lama	Nilai Baru · Buka Lelang	2026-10-07T17:00:00.000Z	2026-10-03T01:11:00.000Z · Tutup Lelang	2026-10-07T17:10:00.000Z	2026-10-03T01:21:00.000Z

## 16. Admin — Live Bidding

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang kontrak yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang kontrak yang sedang berjalan.

## 17. Admin — Live Bidding → Live Bidding

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Live Bidding.
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang kontrak yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang kontrak yang sedang berjalan.

## 18. Admin — Live Bidding → Laporan Lelang

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Laporan Lelang.
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; Export; Semua Vendor; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load); Lihat Penawaran.
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Export · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Vendor · Semua Vendor · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · FTL-NRM-02/031026 · FTL · Kota Surabaya · → · Kota Batu · Jenis Armada · Trailer 20 FT · Periode Kontrak · 03/10/2026 08:42 - 01/05/2027 00:00 · Top 3 · Tutup · #1 · Rp ••••••• · #2 · Rp ••••••• · #3 · Rp ••••••• · Total Penawaran : 0 dari 2 Vendor · Lihat Penawaran · Detail Lelang · FTL-NRM-10/021026 · FTL · Kota Surabaya · → · Kota Semarang · Jenis Armada · Trailer 20 FT · Periode Kontrak · 15/10/2026 00:00 - 23/10/2026 00:00 · Top 3 · Tutup

## 19. Admin — Live Bidding → Semua Jenis Pengiriman

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua Jenis Pengiriman.
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang kontrak yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang kontrak yang sedang berjalan.

## 20. Admin — Live Bidding → FCL (Full Container Load)

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FCL (Full Container Load).
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang kontrak yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang kontrak yang sedang berjalan.

## 21. Admin — Live Bidding → FTL (Full Truck Load)

- Route: `/lelang-kontrak/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FTL (Full Truck Load).
- Judul: Live Bidding Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Live Bidding.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Live Bidding; Laporan Lelang; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Live Bidding; Laporan Lelang; Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Live Bidding · Live Bidding · Live Bidding · Laporan Lelang · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Kontrak · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang kontrak yang sedang berjalan. · Menampilkan 0–0 lelang dari 0 lelang

Catatan kondisi: Tidak ada lelang kontrak yang sedang berjalan.

## 22. Admin — Negosiasi

- Route: `/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 1; Menunggu Vendor / 1; Selesai / 11; FTL-NRM-06/031026; Aksi negosiasi; FTL-NRM-05/021026; FTL-NRM-04/031026; FCL-NRM-17/300926; FTL-NRM-20/300926; FCL-NRM-19/300926; FTL-NRM-23/300926; FTL-NRM-02/230926.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 1; Menunggu Vendor / 1; Selesai / 11.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tidak Direspons · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 1 · Menunggu Vendor · 1 · Selesai · 11 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · FTL-NRM-06/031026 · PT. Solutiva Silver · Kota Surabaya → Kota Batu · FTL · Trailer 20 FT · - · Rp. 65.000 · Rp. 99.000 · Menunggu Vendor · Nego #3 · FTL-NRM-06/031026 · PT. Astra Honda Motor · Kota Surabaya → Kota Batu · FTL · Trailer 20 FT · - · Rp. 50.000 · Rp. 98.010 · Nego Berakhir · Nego #2 · FTL-NRM-05/021026 · PT. Astra Honda Motor · Kota Surabaya → Kota Batu

## 23. Admin — Negosiasi → Semua

- Route: `/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 1; Menunggu Vendor / 1; Selesai / 11; FTL-NRM-06/031026; Aksi negosiasi; FTL-NRM-05/021026; FTL-NRM-04/031026; FCL-NRM-17/300926; FTL-NRM-20/300926; FCL-NRM-19/300926; FTL-NRM-23/300926; FTL-NRM-02/230926.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 1; Menunggu Vendor / 1; Selesai / 11.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tidak Direspons · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 1 · Menunggu Vendor · 1 · Selesai · 11 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · FTL-NRM-06/031026 · PT. Solutiva Silver · Kota Surabaya → Kota Batu · FTL · Trailer 20 FT · - · Rp. 65.000 · Rp. 99.000 · Menunggu Vendor · Nego #3 · FTL-NRM-06/031026 · PT. Astra Honda Motor · Kota Surabaya → Kota Batu · FTL · Trailer 20 FT · - · Rp. 50.000 · Rp. 98.010 · Nego Berakhir · Nego #2 · FTL-NRM-05/021026 · PT. Astra Honda Motor · Kota Surabaya → Kota Batu

## 24. Admin — Order

- Route: `/order`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Daftar Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Daftar Order.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Order; Batch Order; Riwayat Pembatalan; Riwayat Order Tidak Aktif; Filter; Semua Jenis; Semua Kota; Pilih Tanggal; Semua Tipe; Semua Drop Point; Semua Status; Reset; Terapkan; ORD0662578386; Multipickup; Multidrop; ORD9702856385.
- Kolom tabel: ID Order / Vendor; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Nama Pengirim | INPUT text | False | False |  |
| Masukkan Nama Penerima | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Order · Daftar Order · Buat Order · Batch Order · Riwayat Pembatalan · Riwayat Order Tidak Aktif · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Semua Jenis · Vendor · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Tanggal Buat · Pilih Tanggal · Tanggal Permintaan Muat · Pilih Tanggal · Tipe Pengiriman · Semua Tipe · Drop Point Asal · Semua Drop Point · Drop Point Tujuan · Semua Drop Point · Pengirim · Penerima · Status · Semua Status · Reset · Terapkan · ID Order · Vendor · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · ORD0662578386 · FTL · VERSY · Multipickup	Multidrop · Rp. 300.000 · Menunggu Penugasan · ORD9702856385 · FTL · PT. Hamilton · Kabupaten Bangkalan · HAM - BKL · Kota Surabaya · HAM - Gudang SBY · Rp. 7.000.000 · Menunggu Penugasan · Menampilkan 1–2 data dari 2 data

## 25. Admin — Order → Buat Order

- Route: `/order/buat`.
- Jenis: Form; varian/tab/aksi pembuka: Buat Order.
- Judul: Buat Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Order; Jenis Pengiriman; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; LTL / Less Than Truck Load; LCL / Less Than Container Load; Pilih Jenis Armada; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draf; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-buat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jumlah Armada | INPUT text | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Order · Buat Order · Buat Order · 01 · Data Pengiriman · 02 · Data Barang · 03 · Vendor dan Harga · 04 · Review · Jenis Pengiriman · FTL · Full Truck Load · FCL · Full Container Load · LTL · Less Than Truck Load · LCL · Less Than Container Load · Jenis Armada * · Pilih Jenis Armada · Jumlah Armada * · Tipe Pengiriman: Normal — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Drop Point Asal * · Pilih Drop Point Asal · Pengirim · Semua Pengirim · PIC Pengirim * · No. WhatsApp PIC * · Provinsi Asal · Kota/Kab. Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima · Semua Penerima · PIC Penerima * · No. WhatsApp PIC * · Provinsi Tujuan · Kota/Kab. Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Tambah Lokasi Bongkar · Batal · Simpan ke Draf · Selanjutnya

## 26. Admin — Order → Riwayat Pembatalan

- Route: `/order/riwayat-pembatalan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Pembatalan.
- Judul: Riwayat Pembatalan Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Pembatalan Order.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar.
- Kolom tabel: ID Order / Vendor; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-riwayat-pembatalan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Order · Riwayat Pembatalan · Riwayat Pembatalan Order · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Vendor · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · Menampilkan 0–0 data dari 0 data

## 27. Admin — Order → Riwayat Order Tidak Aktif

- Route: `/order/riwayat-tidak-aktif`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Order Tidak Aktif.
- Judul: Riwayat Order Tidak Aktif | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Order Tidak Aktif.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Daftar Order.
- Kolom tabel: ID Order / Vendor; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-riwayat-tidak-aktif.png`.

Urutan konten/label yang terlihat:

> Prahu Hub - AMS · Dashboard · Monitoring · Operasional · Distribusi & Muatan · Lelang Spot Rate · Daftar Lelang · Live Bidding · Lelang Kontrak · Daftar Lelang · Live Bidding · Negosiasi · Order · Riwayat Order Tidak Aktif · Penugasan Tracking · Simulasi Muatan · Master Wilayah · Master Provinsi · Master Kota · Master Kecamatan · Master Kelurahan · Master Operasional · Master Drop Point · Master Waktu Perjalanan · Master Pelabuhan · Master Pelayaran · Master Barang · Master Kemasan · Master Unit · Master Sopir · Master CS · Manajemen Vendor · Pengaturan Akun · Akun Saya · Pengaturan Sistem · Pusat Notifikasi · Pengaturan Notifikasi · Preferensi Notifikasi · Kuota Order · 0/200 · 0% · Prahu Hub - AMS - Versi 1.0.0 · Admin · Administrator · Admin · [akun main] · Daftar Order · Riwayat Order Tidak Aktif · Riwayat Order Tidak Aktif · Order ditolak yang sudah memiliki order pengganti · Daftar Order · ID Order · Vendor · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 28. Admin — Riwayat Order Tidak Aktif

- Route: `/order/riwayat-tidak-aktif`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Order Tidak Aktif | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Order Tidak Aktif.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Daftar Order.
- Kolom tabel: ID Order / Vendor; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-riwayat-tidak-aktif.png`.

Urutan konten/label yang terlihat:

> Prahu Hub - AMS · Dashboard · Monitoring · Operasional · Distribusi & Muatan · Lelang Spot Rate · Daftar Lelang · Live Bidding · Lelang Kontrak · Daftar Lelang · Live Bidding · Negosiasi · Order · Riwayat Order Tidak Aktif · Penugasan Tracking · Simulasi Muatan · Master Wilayah · Master Provinsi · Master Kota · Master Kecamatan · Master Kelurahan · Master Operasional · Master Drop Point · Master Waktu Perjalanan · Master Pelabuhan · Master Pelayaran · Master Barang · Master Kemasan · Master Unit · Master Sopir · Master CS · Manajemen Vendor · Pengaturan Akun · Akun Saya · Pengaturan Sistem · Pusat Notifikasi · Pengaturan Notifikasi · Preferensi Notifikasi · Kuota Order · 0/200 · 0% · Prahu Hub - AMS - Versi 1.0.0 · Admin · Administrator · Admin · [akun main] · Daftar Order · Riwayat Order Tidak Aktif · Riwayat Order Tidak Aktif · Order ditolak yang sudah memiliki order pengganti · Daftar Order · ID Order · Vendor · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 29. Admin — Penugasan Tracking

- Route: `/penugasan-tracking`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Penugasan Tracking | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Penugasan Tracking.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Rute; Pilih Status; Pilih Tahapan; Pilih Tanggal; Semua Vendor; Reset; Terapkan.
- Kolom tabel: ID Order / Vendor; Rute; No. Polisi/No. Kontainer / Sopir; Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-penugasan-tracking.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan No. Polisi/No. Kontainer | INPUT text | False | False |  |
| Masukkan Nama Sopir/Petugas | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Penugasan Tracking · Penugasan Tracking · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Kota Asal · Pilih Rute · Kota Tujuan · Pilih Rute · No. Polisi / Kontainer · Sopir / Petugas · Status · Pilih Status · Tahapan Tracking · Pilih Tahapan · Tanggal Permintaan Muat · Pilih Tanggal · Nama Vendor · Semua Vendor · Reset · Terapkan · ID Order · Vendor · Rute · No. Polisi/No. Kontainer · Sopir · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 30. Admin — Simulasi Muatan

- Route: `/simulasi-muatan`.
- Jenis: Simulator; varian/tab/aksi pembuka: halaman utama.
- Judul: Simulasi Muatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Simulasi Muatan; Unit Pengiriman; Data Muatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Armada; Kontainer; Pilih Barang; Cek Visualisasi; Lanjutkan Order.
- Kolom tabel: Kode SKU / Nama Barang; Kemasan; Kubikasi / Dimensi; Berat; Jumlah; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-simulasi-muatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | INPUT checkbox | False | False |  |

Urutan konten/label yang terlihat:

> Simulasi Muatan · Simulasi Muatan · Unit Pengiriman · Armada · Kontainer · Data Muatan · Pertimbangkan kapasitas berat · Berlaku untuk seluruh barang pada armada ini · Kode SKU · Nama Barang · Kemasan · Kubikasi · Dimensi · Berat	Jumlah · Belum ada barang. Klik "Pilih Barang" · Pilih Barang · Total Kubikasi: 0 m³ · • · Total Berat: 0 kg · Cek Visualisasi · Lanjutkan Order

## 31. Admin — Master Provinsi

- Route: `/master/provinsi`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Provinsi; Filter; Riwayat; Pilih Status; Reset; Terapkan; Edit Data; Hapus Data; 1; 2.
- Kolom tabel: No; Nama Provinsi; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-provinsi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Provinsi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Master Provinsi · Tambah Provinsi · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Provinsi · Status · Pilih Status · Reset · Terapkan · No · Nama Provinsi · Status	Aksi · 1	Sumatera Utara	Aktif · 2	Sumatera Selatan	Aktif · 3	Sumatera Barat	Aktif · 4	Sulawesi Utara	Aktif · 5	Sulawesi Tenggara	Aktif · 6	Sulawesi Tengah	Aktif · 7	Sulawesi Selatan	Aktif · 8	Sulawesi Barat	Aktif · 9	Riau	Aktif · 10	Papua Tengah	Aktif · 11	Papua Selatan	Aktif · 12	Papua Pegunungan	Aktif · 13	Papua Barat Daya	Aktif · 14	Papua Barat	Aktif · 15	Papua	Aktif · 16	Nusa Tenggara Timur	Aktif · 17	Nusa Tenggara Barat	Aktif · 18	Maluku Utara	Aktif · 19	Maluku	Aktif · 20	Lampung	Aktif · Menampilkan 1–20 data dari 38 data · 1 · 2

## 32. Admin — Master Provinsi → Tambah Provinsi

- Route: `/master/provinsi/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Provinsi.
- Judul: Tambah Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-provinsi-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Provinsi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Tambah Provinsi · Tambah Provinsi · Provinsi * · Tambah Baris Input · Batal · Simpan

## 33. Admin — Master Provinsi → Riwayat

- Route: `/master/riwayat/provinsi`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-provinsi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Provinsi | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Riwayat · Riwayat Master Provinsi · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 34. Admin — Master Kota

- Route: `/master/kota`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Provinsi; Semua Status; Reset; Terapkan; Edit; Hapus; 1; 2; 26.
- Kolom tabel: No; Kota/Kab.; Provinsi; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kota.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan nama kota | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Master Kota · Tambah Kota · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Kota/Kab. · Provinsi · Pilih Provinsi · Status · Semua Status · Reset · Terapkan · No · Kota/Kab. · Provinsi · Status	Aksi · 1	Kota Tebing Tinggi	Sumatera Utara	Aktif · 2	Kota Tanjungbalai	Sumatera Utara	Aktif · 3	Kota Sibolga	Sumatera Utara	Aktif · 4	Kota Pematangsiantar	Sumatera Utara	Aktif · 5	Kota Padangsidimpuan	Sumatera Utara	Aktif · 6	Kota Medan	Sumatera Utara	Aktif · 7	Kota Gunungsitoli	Sumatera Utara	Aktif · 8	Kota Binjai	Sumatera Utara	Aktif · 9	Kabupaten Toba	Sumatera Utara	Aktif · 10	Kabupaten Tapanuli Utara	Sumatera Utara	Aktif · 11	Kabupaten Tapanuli Tengah	Sumatera Utara	Aktif · 12	Kabupaten Tapanuli Selatan	Sumatera Utara	Aktif · 13	Kabupaten Simalungun	Sumatera Utara	Aktif · 14	Kabupaten Serdang Bedagai	Sumatera Utara	Aktif · 15	Kabupaten Samosir	Sumatera Utara	Aktif · 16	Kabupaten Pakpak Bharat	Sumatera Utara	Aktif · 17	Kabupaten Padang Lawas Utara	Sumatera Utara	Aktif · 18	Kabupaten Padang Lawas	Sumatera Utara	Aktif · 19	Kabupaten Nias Utara	Sumatera Utara	Aktif · 20	Kabupaten Nias Selatan	Sumatera Utara	Aktif · Menampilkan 1–20 data dari 514 data · 1 · 2 · ... · 26

## 35. Admin — Master Kota → Riwayat

- Route: `/master/riwayat/kota`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kota.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kota | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Riwayat · Riwayat Master Kota · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kota · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kota · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 36. Admin — Master Kecamatan

- Route: `/master/kecamatan`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Kota/Kab.; Pilih Provinsi; Pilih Status; Reset; Terapkan; Edit; Hapus; 1; 2; 365.
- Kolom tabel: No; Kecamatan; Kota/Kab.; Provinsi; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kecamatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan kecamatan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Master Kecamatan · Tambah Kecamatan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Kecamatan · Kota/Kab. · Pilih Kota/Kab. · Provinsi · Pilih Provinsi · Status · Pilih Status · Reset · Terapkan · No · Kecamatan · Kota/Kab. · Provinsi · Status	Aksi · 1	Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 2	Bajenis	Kota Tebing Tinggi	Sumatera Utara	Aktif · 3	Rambutan	Kota Tebing Tinggi	Sumatera Utara	Aktif · 4	Padang Hulu	Kota Tebing Tinggi	Sumatera Utara	Aktif · 5	Padang Hilir	Kota Tebing Tinggi	Sumatera Utara	Aktif · 6	Sei Tualang Raso	Kota Tanjungbalai	Sumatera Utara	Aktif · 7	Datuk Bandar	Kota Tanjungbalai	Sumatera Utara	Aktif · 8	Tanjungbalai Utara	Kota Tanjungbalai	Sumatera Utara	Aktif · 9	Teluk Nibung	Kota Tanjungbalai	Sumatera Utara	Aktif · 10	Datuk Bandar Timur	Kota Tanjungbalai	Sumatera Utara	Aktif · 11	Tanjungbalai Selatan	Kota Tanjungbalai	Sumatera Utara	Aktif · 12	Sibolga Sambas	Kota Sibolga	Sumatera Utara	Aktif · 13	Sibolga Utara	Kota Sibolga	Sumatera Utara	Aktif · 14	Sibolga Selatan	Kota Sibolga	Sumatera Utara	Aktif · 15	Sibolga Kota	Kota Sibolga	Sumatera Utara	Aktif · 16	Siantar Utara	Kota Pematangsiantar	Sumatera Utara	Aktif · 17	Siantar Timur	Kota Pematangsiantar	Sumatera Utara	Aktif · 18	Siantar Martoba	Kota Pematangsiantar	Sumatera Utara	Aktif · 19	Siantar Marihat	Kota Pematangsiantar	Sumatera Utara	Aktif · 20	Siantar Marimbun	Kota Pematangsiantar	Sumatera Utara	Aktif · Menampilkan 1–20 data dari 7285 data · 1 · 2 · ... · 365

## 37. Admin — Master Kecamatan → Riwayat

- Route: `/master/riwayat/kecamatan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kecamatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kecamatan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Riwayat · Riwayat Master Kecamatan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 38. Admin — Master Kelurahan

- Route: `/master/kelurahan`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Provinsi; Pilih Kota/Kab.; Pilih Status; Reset; Terapkan; Edit Data; Hapus Data; 1; 2; 4189.
- Kolom tabel: No; Kelurahan/Desa / Kode Pos; Kecamatan; Kota/Kab.; Provinsi; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kelurahan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Kelurahan/Desa | INPUT text | False | False |  |
| Masukkan Kode Pos | INPUT text | False | False |  |
| Masukkan Kecamatan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Master Kelurahan · Tambah Kelurahan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Kelurahan/Desa · Kode Pos · Kecamatan · Provinsi · Pilih Provinsi · Kota/Kab. · Pilih Kota/Kab. · Status · Pilih Status · Reset · Terapkan · No · Kelurahan/Desa · Kode Pos · Kecamatan · Kota/Kab. · Provinsi · Status	Aksi · 1 · Rambung · 20633 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 2 · Pasar Gambir · 20628 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 3 · Pasar Baru · 20627 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 4 · Bandar Utama · 20613 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 5 · Tebing Tinggi Lama · 20632 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 6 · Badak Bejuang · 20615 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 7 · Mandailing · 20626 · Tebing Tinggi Kota	Kota Tebing Tinggi	Sumatera Utara	Aktif · 8 · Tanjung Marulak · 20616 · Rambutan	Kota Tebing Tinggi	Sumatera Utara	Aktif · 9 · Sri Padang · 20616 · Rambutan	Kota Tebing Tinggi	Sumatera Utara	Aktif · 10 · Tanjung Marulak Hilir · 20616 · Rambutan	Kota Tebing Tinggi	Sumatera Utara	Aktif · 11

## 39. Admin — Master Kelurahan → Riwayat

- Route: `/master/riwayat/kelurahan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kelurahan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kelurahan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Riwayat · Riwayat Master Kelurahan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 40. Admin — Master Drop Point

- Route: `/master/customer`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Drop Point | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Status; Reset; Terapkan; Detail; Edit Informasi Perusahaan; Hapus data.
- Kolom tabel: No; Nama Perusahaan / Alias; Nama PIC; No. WhatsApp PIC; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-customer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Perusahaan | INPUT text | False | False |  |
| Masukkan Alias | INPUT text | False | False |  |
| Masukkan Nama PIC | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Master Drop Point · Tambah Perusahaan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Perusahaan · Alias · Nama PIC · No. WhatsApp PIC · Status · Pilih Status · Reset · Terapkan · Drop point dikelola melalui halaman detail masing-masing perusahaan · No · Nama Perusahaan · Alias · Nama PIC · No. WhatsApp PIC · Status	Aksi · 1 · PT. Integritas Karya (BPN) · IKBPN · -	-	Aktif · 2 · PT. Integritas Karya (JKT) · IKJKT · -	-	Aktif · 3 · PT. Integritas Karya (SMG) · IKSMG · -	-	Aktif · 4 · PT. Integritas Karya (SUB) · IKSUB · -	-	Aktif · 5 · PT. Solutiva Charcoal · -	-	Aktif · 6 · PT. Solutiva Bronze Warehouse · -	-	Aktif · 7 · PT. Solutiva Gold Warehouse · -	-	Aktif · 8 · PT. Solutiva Silver Warehouse · -	-	Aktif · 9 · PT. Haas · -	-	Aktif · 10 · PT. Haier Sales Indonesia · -	-	Aktif · 11 · PT. Hamilton · -	-	Aktif · Menampilkan 1–11 data dari 11 data

## 41. Admin — Master Drop Point → Riwayat

- Route: `/master/riwayat/customer`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Drop Point | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / PT. Integritas Karya (SMG) / 28/09/2026 11:55 / Admin / [akun main] / 1 Perubahan; 2. / PT. Integritas Karya (SUB) / 28/09/2026 11:54 / Admin / [akun main] / 1 Perubahan; 3. / PT. Integritas Karya (SUB) / 28/09/2026 11:18 / Admin / [akun main] / 1 Perubahan; 4. / PT. Solutiva Silver Warehouse / 25/09/2026 14:43 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Customer | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Riwayat · Riwayat Master Drop Point · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Customer · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Customer · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · PT. Integritas Karya (SMG) · 28/09/2026 11:55 · Admin · [akun main] · 1 Perubahan · 2. · PT. Integritas Karya (SUB) · 28/09/2026 11:54 · Admin · [akun main] · 1 Perubahan · 3. · PT. Integritas Karya (SUB) · 28/09/2026 11:18 · Admin · [akun main] · 1 Perubahan · 4. · PT. Solutiva Silver Warehouse · 25/09/2026 14:43 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–4 data dari 4 data

## 42. Admin — Master Waktu Perjalanan

- Route: `/master/waktu-perjalanan`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Waktu Perjalanan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Reset; Terapkan; Edit target waktu (rute terkunci); Tidak dapat dihapus — rute sudah digunakan pada order; Edit data; Hapus data.
- Kolom tabel: No.; Rute; Waktu Perjalanan; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-waktu-perjalanan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Rute | INPUT text | False | False |  |
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Master Waktu Perjalanan · Tambah Waktu Perjalanan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Rute · Waktu Perjalanan · Jam · Reset · Terapkan · No.	Rute · Waktu Perjalanan · Aksi · 1	Kabupaten Bangkalan→Kota Bandung→Kota Surabaya	20 Jam · 2	Kabupaten Bangkalan→Kota Surabaya	6 Jam · 3	Kota Surabaya→Kabupaten Bangkalan	4 Jam · Menampilkan 1–3 data dari 3 data

## 43. Admin — Master Waktu Perjalanan → Riwayat

- Route: `/master/riwayat/waktu-perjalanan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Waktu Perjalanan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-waktu-perjalanan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Rute | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Riwayat · Riwayat Master Waktu Perjalanan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Rute · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Rute · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 44. Admin — Master Pelabuhan

- Route: `/master/pelabuhan`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Kota/Kab.; Pilih Status; Reset; Terapkan; Edit data; Hapus data.
- Kolom tabel: No; UN Code; Nama Pelabuhan; Nama Kota/Kab.; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-pelabuhan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan UN Code | INPUT text | False | False |  |
| Masukan Nama Pelabuhan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Master Pelabuhan · Tambah Pelabuhan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · UN Code · Nama Pelabuhan · Kota/Kab. · Pilih Kota/Kab. · Status · Pilih Status · Reset · Terapkan · No · UN Code · Nama Pelabuhan · Nama Kota/Kab. · Status	Aksi · 1	MKS	Makassar	Kota Makassar	Aktif · 2	BPN	Semayang	Kota Balikpapan	Aktif · 3	TJP	Tanjung Perak	Kota Surabaya	Aktif · Menampilkan 1–3 data dari 3 data

## 45. Admin — Master Pelabuhan → Riwayat

- Route: `/master/riwayat/pelabuhan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelabuhan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelabuhan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Riwayat · Riwayat Master Pelabuhan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 46. Admin — Master Pelayaran

- Route: `/master/pelayaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Status; Reset; Terapkan; Edit; Hapus.
- Kolom tabel: No; Nama Pelayaran; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-pelayaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelayaran | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Master Pelayaran · Tambah Pelayaran · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelayaran · Status · Pilih Status · Reset · Terapkan · No · Nama Pelayaran · Status	Aksi · 1 · TANTO · Aktif · 2 · SPIL · Aktif · 3 · Meratus · Aktif · Menampilkan 1–3 data dari 3 data

## 47. Admin — Master Pelayaran → Riwayat

- Route: `/master/riwayat/pelayaran`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / Meratus / 01/10/2026 10:53 / Admin / [akun main] / 1 Perubahan; 2. / SPIL / 01/10/2026 10:52 / Admin / [akun main] / 2 Perubahan; 3. / TANTO / 01/10/2026 10:51 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelayaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelayaran | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Riwayat · Riwayat Master Pelayaran · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · Meratus · 01/10/2026 10:53 · Admin · [akun main] · 1 Perubahan · 2. · SPIL · 01/10/2026 10:52 · Admin · [akun main] · 2 Perubahan · 3. · TANTO · 01/10/2026 10:51 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–3 data dari 3 data

## 48. Admin — Master Barang

- Route: `/master/barang`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Kemasan; Pilih Status; Reset; Terapkan; Edit data; Hapus data.
- Kolom tabel: No.; Kode SKU; Nama Barang / Nilai Barang; Kubikasi / Dimensi; Berat / Kemasan; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-barang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Kode SKU | INPUT text | False | False |  |
| Masukkan Nama Barang | INPUT text | False | False |  |
| Masukkan Kubikasi | INPUT text | False | False |  |
| Masukkan Berat | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Master Barang · Tambah Barang · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Kode SKU · Nama Barang · Kemasan · Pilih Kemasan · Kubikasi · m³ · Berat · Kg · Status · Pilih Status · Reset · Terapkan · No. · Kode SKU · Nama Barang · Nilai Barang · Kubikasi · Dimensi · Berat · Kemasan · Status	Aksi · 1	17896238912763 · Beras · Rp. 83.000 · 0,016 m³ · 40 × 20 × 20 cm · 5 kg · Karung · Aktif · Menampilkan 1–1 data dari 1 data

## 49. Admin — Master Barang → Riwayat

- Route: `/master/riwayat/barang`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-barang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Barang | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Riwayat · Riwayat Master Barang · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Barang · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Barang · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 50. Admin — Master Kemasan

- Route: `/master/kemasan`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Status; Reset; Terapkan; Edit data; Hapus data.
- Kolom tabel: No; Nama Kemasan; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kemasan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kemasan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Master Kemasan · Tambah Kemasan · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kemasan · Status · Pilih Status · Reset · Terapkan · No · Nama Kemasan · Status	Aksi · 1	Karung	Aktif · Menampilkan 1–1 data dari 1 data

## 51. Admin — Master Kemasan → Riwayat

- Route: `/master/riwayat/kemasan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kemasan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kemasan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Riwayat · Riwayat Master Kemasan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 52. Admin — Master Unit

- Route: `/master/unit`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Unit | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Unit.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Armada; Jenis Armada; Jenis Kontainer; Tambah Armada; Filter; Pilih Nama Vendor; Reset; Terapkan; Kelola Armada.
- Kolom tabel: No.; Nama Vendor; Jumlah Armada; Tanggal Update; .
- Tab semantik: Armada; Jenis Armada; Jenis Kontainer.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Jumlah Armada | INPUT number | False | False |  |
| DD/MM/YYYY | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Master Unit · Armada · Jenis Armada · Jenis Kontainer · Tambah Armada · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Pilih Nama Vendor · Jumlah Armada · Tanggal Update · Reset · Terapkan · No. · Nama Vendor · Jumlah Armada · Tanggal Update · 1.	AUTOTEST-20260923-DIBANTU-ADMIN	-	- · 2.	AUTOTEST-20260923-DIBANTU-VENDOR-ED	-	- · 3.	AUTOTEST-20260923-NEG-WA-0812	-	- · 4.	AUTOTEST-20260923-NEG-WA-HURUF	-	- · 5.	AUTOTEST-20260923-NEG-WA-NON0	-	- · 6.	AUTOTEST-20260923-NEG-WA-PLUS62	-	- · 7.	AUTOTEST-20260924-ADMINMGR	-	- · 8.	AUTOTEST-20260924-V31	-	- · 9.	AUTOTEST-20260925-ADMMG2	-	- · 10.	AUTOTEST-20260925-V31	-	- · 11.	AUTOTEST-20260925-V31B	-	- · 12.	AUTOTEST-20260929-ADMG29	-	- · 13.	AUTOTEST-20260929-PAGE-1	-	- · 14.	AUTOTEST-20260929-PAGE-2	-	- · 15.	AUTOTEST-20260929-PAGE-3	-	- · 16.	AUTOTEST-20260929-PAGE-4	-	- · 17.	AUTOTEST-20260929-PAGE-5	-	- · 18.	AUTOTEST-20260929-V31B	-	- · 19.	PT. Solutiva Bronze	-	- · 20.	Verstappen	2 Armada	18/09/2026 · Menampilkan 1–20 data dari 20 data

## 53. Admin — Master Unit → Tambah Armada

- Route: `/master/unit/tambah-armada`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Armada.
- Judul: Tambah Armada | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Nama Vendor; Pilih Jenis Armada; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit-tambah-armada.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan No. Polisi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Tambah Armada · Tambah Armada · Download Template · Import Data · Nama Vendor * · Pilih Nama Vendor · Jenis Armada * · Pilih Jenis Armada · No. Polisi * · Tambah Baris Input · Batal · Simpan

## 54. Admin — Master Unit → Armada

- Route: `/master/unit`.
- Jenis: Daftar; varian/tab/aksi pembuka: Armada.
- Judul: Master Unit | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Unit.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Armada; Jenis Armada; Jenis Kontainer; Tambah Armada; Filter; Pilih Nama Vendor; Reset; Terapkan; Kelola Armada.
- Kolom tabel: No.; Nama Vendor; Jumlah Armada; Tanggal Update; .
- Tab semantik: Armada; Jenis Armada; Jenis Kontainer.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Jumlah Armada | INPUT number | False | False |  |
| DD/MM/YYYY | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Master Unit · Armada · Jenis Armada · Jenis Kontainer · Tambah Armada · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Pilih Nama Vendor · Jumlah Armada · Tanggal Update · Reset · Terapkan · No. · Nama Vendor · Jumlah Armada · Tanggal Update · 1.	AUTOTEST-20260923-DIBANTU-ADMIN	-	- · 2.	AUTOTEST-20260923-DIBANTU-VENDOR-ED	-	- · 3.	AUTOTEST-20260923-NEG-WA-0812	-	- · 4.	AUTOTEST-20260923-NEG-WA-HURUF	-	- · 5.	AUTOTEST-20260923-NEG-WA-NON0	-	- · 6.	AUTOTEST-20260923-NEG-WA-PLUS62	-	- · 7.	AUTOTEST-20260924-ADMINMGR	-	- · 8.	AUTOTEST-20260924-V31	-	- · 9.	AUTOTEST-20260925-ADMMG2	-	- · 10.	AUTOTEST-20260925-V31	-	- · 11.	AUTOTEST-20260925-V31B	-	- · 12.	AUTOTEST-20260929-ADMG29	-	- · 13.	AUTOTEST-20260929-PAGE-1	-	- · 14.	AUTOTEST-20260929-PAGE-2	-	- · 15.	AUTOTEST-20260929-PAGE-3	-	- · 16.	AUTOTEST-20260929-PAGE-4	-	- · 17.	AUTOTEST-20260929-PAGE-5	-	- · 18.	AUTOTEST-20260929-V31B	-	- · 19.	PT. Solutiva Bronze	-	- · 20.	Verstappen	2 Armada	18/09/2026 · Menampilkan 1–20 data dari 20 data

## 55. Admin — Master Unit → Jenis Armada

- Route: `/master/unit`.
- Jenis: Daftar; varian/tab/aksi pembuka: Jenis Armada.
- Judul: Master Unit | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Unit.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Armada; Jenis Armada; Jenis Kontainer; Filter; Riwayat; Pilih Status; Reset; Terapkan; Edit; Hapus.
- Kolom tabel: No; Jenis Armada / Dimensi Area Kargo; Volume; Kapasitas; Status; Aksi.
- Tab semantik: Armada; Jenis Armada; Jenis Kontainer.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Jenis Armada | INPUT text | False | False |  |
| Panjang | INPUT text | False | False |  |
| Lebar | INPUT text | False | False |  |
| Tinggi | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |
| Masukkan Kapasitas | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Master Unit · Armada · Jenis Armada · Jenis Kontainer · Tambah Jenis Armada · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Jenis Armada · Dimensi Area Kargo · cm · cm · cm · Volume · m³ · Kapasitas · kg · Status · Pilih Status · Reset · Terapkan · No · Jenis Armada · Dimensi Area Kargo · Volume · Kapasitas · Status	Aksi · 1 · Trailer 20 FT · L : 600 cm W : 240 cm H : 260 cm · 37,44 m3	25.000 kg	Aktif · 2 · Trailer 40 FT · L : 1220 cm W : 240 cm H : 260 cm · 76,13 m3	30.000 kg	Aktif · Menampilkan 1–2 data dari 2 data

## 56. Admin — Master Unit → Jenis Kontainer

- Route: `/master/unit`.
- Jenis: Daftar; varian/tab/aksi pembuka: Jenis Kontainer.
- Judul: Master Unit | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Unit.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Armada; Jenis Armada; Jenis Kontainer; Filter; Riwayat; Pilih Status; Reset; Terapkan; Edit; Hapus.
- Kolom tabel: No; Jenis Kontainer / Dimensi Area Kargo; Volume; Kapasitas; Status; Aksi.
- Tab semantik: Armada; Jenis Armada; Jenis Kontainer.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Jenis Kontainer | INPUT text | False | False |  |
| Panjang | INPUT number | False | False |  |
| Lebar | INPUT number | False | False |  |
| Tinggi | INPUT number | False | False |  |
| Masukkan Volume | INPUT text | False | False |  |
| Masukkan Kapasitas | INPUT number | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Master Unit · Armada · Jenis Armada · Jenis Kontainer · Tambah Jenis Kontainer · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Jenis Kontainer · Dimensi Area Kargo · cm · cm · cm · Volume · m³ · Kapasitas · kg · Status · Pilih Status · Reset · Terapkan · No · Jenis Kontainer · Dimensi Area Kargo · Volume · Kapasitas · Status	Aksi · 1 · 20 Feet · L : 4000 cm W : 3000 cm H : 2000 cm · 24.000,00 m3	1.000 kg	Aktif · Menampilkan 1–1 data dari 1 data

## 57. Admin — Master Sopir

- Route: `/master/sopir`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Sopir | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Sopir.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Sopir; Filter; Pilih Nama Vendor; Reset; Terapkan; Kelola Sopir.
- Kolom tabel: No.; Nama Vendor; Jumlah Sopir; Tanggal Update; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-sopir.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Jumlah Sopir | INPUT number | False | False |  |
| DD/MM/YYYY | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Sopir · Master Sopir · Tambah Sopir · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Pilih Nama Vendor · Jumlah Sopir · Tanggal Update · Reset · Terapkan · No. · Nama Vendor · Jumlah Sopir · Tanggal Update · 1.	AUTOTEST-20260923-DIBANTU-ADMIN	-	- · 2.	AUTOTEST-20260923-DIBANTU-VENDOR-ED	-	- · 3.	AUTOTEST-20260923-NEG-WA-0812	-	- · 4.	AUTOTEST-20260923-NEG-WA-HURUF	-	- · 5.	AUTOTEST-20260923-NEG-WA-NON0	-	- · 6.	AUTOTEST-20260923-NEG-WA-PLUS62	-	- · 7.	AUTOTEST-20260924-ADMINMGR	-	- · 8.	AUTOTEST-20260924-V31	-	- · 9.	AUTOTEST-20260925-ADMMG2	-	- · 10.	AUTOTEST-20260925-V31	-	- · 11.	AUTOTEST-20260925-V31B	-	- · 12.	AUTOTEST-20260929-ADMG29	-	- · 13.	AUTOTEST-20260929-PAGE-1	-	- · 14.	AUTOTEST-20260929-PAGE-2	-	- · 15.	AUTOTEST-20260929-PAGE-3	-	- · 16.	AUTOTEST-20260929-PAGE-4	-	- · 17.	AUTOTEST-20260929-PAGE-5	-	- · 18.	AUTOTEST-20260929-V31B	-	- · 19.	PT. Solutiva Bronze	-	- · 20.	Verstappen	-	- · Menampilkan 1–20 data dari 20 data

## 58. Admin — Master Sopir → Tambah Sopir

- Route: `/master/sopir/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Sopir.
- Judul: Tambah Sopir | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Sopir.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Nama Vendor; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-sopir-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Sopir | INPUT text | False | False |  |
| Contoh: 081234567898 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Sopir · Tambah Sopir · Tambah Sopir · Download Template · Import Data · Nama Vendor * · Pilih Nama Vendor · Nama Sopir * · No. WhatsApp * · Tambah Baris Input · Batal · Simpan

## 59. Admin — Master CS

- Route: `/master/cs`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Master Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Master Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Status; Reset; Terapkan.
- Kolom tabel: No; Nama CS; No. WhatsApp CS; Jumlah Vendor; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-cs.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama CS | INPUT text | False | False |  |
| Masukkan No. WhatsApp CS | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Master Customer Service · Tambah Customer Service · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Nama CS · No. WhatsApp CS · Status · Pilih Status · Reset · Terapkan · No · Nama CS · No. WhatsApp CS · Jumlah Vendor	Status	Aksi · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 60. Admin — Master CS → Riwayat

- Route: `/master/riwayat/customer-service`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Master Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer-service.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama CS | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Riwayat · Riwayat Master Customer Service · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama CS · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama CS · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 61. Admin — Manajemen Vendor

- Route: `/manajemen-vendor`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Manajemen Vendor | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Manajemen Vendor.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Riwayat; Pilih Status; Pilih Pengelola; Pilih CS Penanggung Jawab; Reset; Terapkan; 1; 2.
- Kolom tabel: Nama Vendor / Alias; Email / No. WhatsApp; Pengelola; CS Penanggung Jawab / No. WhatsApp CS; Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-manajemen-vendor.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Vendor | INPUT text | False | False |  |
| Masukkan Alias | INPUT text | False | False |  |
| Masukkan Email | INPUT text | False | False |  |
| Masukkan No. WhatsApp | INPUT text | False | False |  |
| Masukkan No. WhatsApp CS | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Manajemen Vendor · Manajemen Vendor · Tambah Vendor · Filter · Riwayat · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Alias · Status · Pilih Status · Email · No. WhatsApp · Pengelola · Pilih Pengelola · CS Penanggung Jawab · Pilih CS Penanggung Jawab · No. WhatsApp CS · Reset · Terapkan · Nama Vendor · Alias · Email · No. WhatsApp · Pengelola · CS Penanggung Jawab · No. WhatsApp CS · Status · PT. Indah Karya (IK) · - · pengirimphv24@gmail.com · 62838300118812 · Vendor · CS Vendor · - · Aktif · PT. Nusantara Logistik · NLG · kampusmail8@gmail.com · 6281232460619 · Vendor · CS Vendor · - · Aktif · PT. Wahana Logistik · WLG · amel.prahu@gmail.com · 62881232460618 · Vendor · CS Vendor · - · Aktif · AUTOTEST-20260929-PAGE-5 · PG5 · autotest.20260929.page5@yopmail.com · 6281290929005 · Admin · - · - · Aktif · AUTOTEST-20260929-PAGE-4 · PG4 · autotest.20260929.page4@yopmail.com · 6281290929004 · Admin · -

## 62. Admin — Manajemen Vendor → Riwayat

- Route: `/manajemen-vendor/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Manajemen Vendor | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Manajemen Vendor.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Reset; Terapkan; 1. / AUTOTEST-20260923-NEG-WA-HURUF / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan; 2. / AUTOTEST-20260923-NEG-WA-NON0 / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan; 3. / AUTOTEST-20260923-NEG-WA-PLUS62 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan; 4. / AUTOTEST-20260923-NEG-WA-0812 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan; 5. / AUTOTEST-20260923-DIBANTU-ADMIN / 01/10/2026 13:10 / Admin / [akun main] / 1 Perubahan; 6. / AUTOTEST-20260924-V31 / 01/10/2026 13:09 / Admin / [akun main] / 1 Perubahan; 7. / AUTOTEST-20260925-V31 / 01/10/2026 13:05 / Admin / [akun main] / 1 Perubahan; 8. / AUTOTEST-20260925-V31B / 01/10/2026 13:04 / Admin / [akun main] / 1 Perubahan; 9. / AUTOTEST-20260929-V31B / 01/10/2026 11:16 / Admin / [akun main] / 1 Perubahan; 10. / AUTOTEST-20260929-PAGE-1 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 11. / AUTOTEST-20260929-PAGE-2 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 12. / AUTOTEST-20260929-PAGE-3 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 13. / AUTOTEST-20260929-PAGE-4 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 14. / AUTOTEST-20260929-PAGE-5 / 01/10/2026 11:13 / Admin / [akun main] / 1 Perubahan; 15. / PT. Integrasi Kinerja (IK) / 28/09/2026 13:19 / Admin / [akun main] / 1 Perubahan; 16. / PT. Hamilton / 25/09/2026 16:11 / Admin / [akun main] / 1 Perubahan; 17. / PT. Integrasi Karya (IK) / 23/09/2026 15:46 / PT. Integrasi Karya (IK) / [akun vendor] / 11 Perubahan; 18. / AUTOTEST-20260923-DIBANTU-VENDOR-ED / 23/09/2026 15:02 / Admin / [akun main] / 1 Perubahan; 19. / AUTOTEST-20260923-DIBANTU-ADMIN / 23/09/2026 15:01 / Admin / [akun main] / 1 Perubahan; 20. / AUTOTEST-20260923-DIBANTU-ADMIN / 23/09/2026 15:00 / Admin / [akun main] / 1 Perubahan; 1; 2.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-manajemen-vendor-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Vendor | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Manajemen Vendor · Riwayat · Riwayat Manajemen Vendor · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Vendor · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · AUTOTEST-20260923-NEG-WA-HURUF · 01/10/2026 13:14 · Admin · [akun main] · 1 Perubahan · 2. · AUTOTEST-20260923-NEG-WA-NON0 · 01/10/2026 13:14 · Admin · [akun main] · 1 Perubahan · 3. · AUTOTEST-20260923-NEG-WA-PLUS62 · 01/10/2026 13:12 · Admin · [akun main] · 1 Perubahan · 4. · AUTOTEST-20260923-NEG-WA-0812 · 01/10/2026 13:12 · Admin · [akun main] · 1 Perubahan · 5. · AUTOTEST-20260923-DIBANTU-ADMIN · 01/10/2026 13:10 · Admin · [akun main] · 1 Perubahan · 6. · AUTOTEST-20260924-V31 · 01/10/2026 13:09 · Admin · [akun main] · 1 Perubahan · 7. · AUTOTEST-20260925-V31 · 01/10/2026 13:05 · Admin · [akun main] · 1 Perubahan · 8. · AUTOTEST-20260925-V31B · 01/10/2026 13:04 · Admin · [akun main] · 1 Perubahan · 9. · AUTOTEST-20260929-V31B

## 63. Admin — Pengaturan Akun

- Route: `/pengaturan-akun`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Pengaturan Akun | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Pengaturan Akun.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Sub User; Hak Akses; Tambah Sub User; Riwayat; Filter; Pilih Status; Reset; Terapkan.
- Kolom tabel: No; Nama Sub User; Email; Bagian Staff; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sub User | INPUT text | False | False |  |
| Masukkan Email | INPUT text | False | False |  |
| Masukkan Bagian Staff | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Pengaturan Akun · Sub User · Hak Akses · Tambah Sub User · Riwayat · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sub User · Email · Bagian Staff · Status · Pilih Status · Reset · Terapkan · No · Nama Sub User · Email · Bagian Staff · Status	Aksi · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 64. Admin — Pengaturan Akun → Tambah Sub User

- Route: `/pengaturan-akun/sub-user/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Sub User.
- Judul: Tambah Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Sub User; Informasi Umum; Hak Akses.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tampilkan password; Pilih Hak Akses; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Sub User | INPUT text | False | False |  |
| Masukkan Email | INPUT email | False | False |  |
| Masukkan Nomor WhatsApp | INPUT text | False | False |  |
| Masukkan Bagian Staff | INPUT text | False | False |  |
| Masukkan Password | INPUT password | False | False |  |
| Masukkan Konfirmasi Password | INPUT password | False | False |  |
| perm-mode | INPUT radio | False | False |  |
| perm-mode | INPUT radio | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Tambah Sub User · Tambah Sub User · Informasi Umum · Nama Sub User * · Email * · Nomor WhatsApp * · Contoh: 081234567898 · Bagian Staff * · Password * · Konfirmasi Password * · Hak Akses · Pilih Hak Akses · Buat Hak Akses · Hak Akses * · Pilih Hak Akses · Batal · Simpan

## 65. Admin — Pengaturan Akun → Riwayat

- Route: `/pengaturan-akun/sub-user/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Sub User.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sub User | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Riwayat Sub User · Riwayat Sub User · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 66. Admin — Akun Saya

- Route: `/akun-saya`.
- Jenis: Profil; varian/tab/aksi pembuka: halaman utama.
- Judul: Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Informasi; Ubah Password; Riwayat.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya.png`.

Urutan konten/label yang terlihat:

> Akun Saya · Akun Saya · Edit Informasi · Ubah Password · Riwayat · Nama · : · Admin · Email · : · [akun main] · Nomor WhatsApp · : · - · Bagian Staff · : · Admin

## 67. Admin — Akun Saya → Edit Informasi

- Route: `/akun-saya`.
- Jenis: Profil; varian/tab/aksi pembuka: Edit Informasi.
- Judul: Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Informasi; Ubah Password; Riwayat; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |
| 08xxxxxxxxxx | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |

Urutan konten/label yang terlihat:

> Akun Saya · Akun Saya · Edit Informasi · Ubah Password · Riwayat · Nama · : · Admin · Email · : · [akun main] · Nomor WhatsApp · : · - · Bagian Staff · : · Admin · Edit Informasi · Nama * · Email * · No. WhatsApp * · Contoh: 081234567898 · Bagian Staff · Batal · Simpan

## 68. Admin — Akun Saya → Riwayat

- Route: `/akun-saya/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat.
- Judul: Riwayat Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Akun Saya; Ubah Password; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Edit Akun Saya; Ubah Password.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Akun Saya · Riwayat Perubahan · Riwayat Perubahan Akun Saya · Edit Akun Saya · Ubah Password · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan akun.

## 69. Admin — Pengaturan Sistem

- Route: `/setting/sistem`.
- Jenis: Pengaturan; varian/tab/aksi pembuka: halaman utama.
- Judul: Pengaturan Sistem | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Pengaturan Sistem.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Durasi Kedaluwarsa Undangan Vendor / Batas waktu tautan undangan registrasi vendor berlaku sebelum kedaluwarsa; Pilihan Durasi Lelang / Atur pilihan durasi untuk lelang FTL dan FCL; Ubah urutan; Menit; Hapus durasi 1; Hapus durasi 2; Hapus durasi 3; Jam; Hapus durasi 4; Hapus durasi 5; Hapus durasi 6; Hapus durasi 7; Hari; Hapus durasi 8; Hapus durasi 9; Hapus durasi 10; Hapus durasi 11; Tambah Durasi; Kadaluarsa Draft Lelang / Atur masa berlaku draft dan kapan peringatan kadaluarsa mulai tampil pada Daftar Lelang; Persetujuan Edit Jadwal Order / Atur persetujuan perubahan jadwal kapal yang diajukan vendor pada order dari lelang; Nomor WhatsApp CS / Nomor tujuan tombol "Hubungi Kami" di halaman publik: Lacak Pengiriman, Registrasi Vendor, dan Atur Kata Sandi Vendor; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-setting-sistem.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| 0 | INPUT number | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | Select an option, Menit, Jam |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| Angka | INPUT number | False | False |  |
| (tanpa label atribut) | INPUT number | False | False |  |
| (tanpa label atribut) | INPUT number | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| 08xxxxxxxxxx | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Sistem · Pengaturan Sistem · Durasi Kedaluwarsa Undangan Vendor · Batas waktu tautan undangan registrasi vendor berlaku sebelum kedaluwarsa · Durasi * · Satuan * · Select an option · Menit · Jam · Pilihan Durasi Lelang · Atur pilihan durasi untuk lelang FTL dan FCL · Urutan pilihan akan tampil di Buat Lelang. Seret ikon di kiri untuk mengubah urutan. · Durasi · Satuan · 1 · Menit · 2 · Menit · 3 · Menit · 4 · Jam · 5 · Jam · 6 · Jam · 7 · Jam · 8 · Hari · 9 · Hari · 10 · Hari · 11 · Hari · Tambah Durasi · Kadaluarsa Draft Lelang · Atur masa berlaku draft dan kapan peringatan kadaluarsa mulai tampil pada Daftar Lelang · Durasi Kadaluarsa * · hari · Alert Kadaluarsa (Tampil) * · hari sebelum · Persetujuan Edit Jadwal Order · Atur persetujuan perubahan jadwal kapal yang diajukan vendor pada order dari lelang · Edit jadwal oleh vendor memerlukan persetujuan shipper · Nomor WhatsApp CS · Nomor tujuan tombol "Hubungi Kami" di halaman publik: Lacak Pengiriman, Registrasi Vendor, dan Atur Kata Sandi Vendor · Nomor WhatsApp CS · Batal · Simpan

## 70. Admin — Pengaturan Notifikasi

- Route: `/setting/general`.
- Jenis: Pengaturan; varian/tab/aksi pembuka: halaman utama.
- Judul: Pengaturan Notifikasi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Pengaturan Notifikasi; Daftar Notifikasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-setting-general.png`.

Urutan konten/label yang terlihat:

> Pengaturan Notifikasi · Pengaturan Notifikasi · Aktifkan semua notifikasi · 6 dari 6 notifikasi aktif secara global · Daftar Notifikasi · On/off menentukan apakah notifikasi ini bisa diterima oleh siapapun di sistem · Order · Semua · Order Selesai · Push · Order Dibatalkan · Push · Order Telah Ditugaskan · Push · Tracking · Semua · Tahap Pengiriman - Selesai Muat · Push · Tahap Pengiriman - Selesai Bongkar · Push · Lelang Kontrak · Semua · Lelang Kontrak · Push · Batal · Simpan

## 71. Admin — Preferensi Notifikasi

- Route: `/setting/preferensi-notifikasi`.
- Jenis: Pengaturan; varian/tab/aksi pembuka: halaman utama.
- Judul: Preferensi Notifikasi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Preferensi Notifikasi; Order (3/3); Tracking (2/2); Lelang Kontrak (1/1).
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-setting-preferensi-notifikasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |

Urutan konten/label yang terlihat:

> Preferensi Notifikasi · Preferensi Notifikasi · Order (3/3) · Semua · Order Selesai · Push · Order Dibatalkan · Push · Order Telah Ditugaskan · Push · Tracking (2/2) · Semua · Tahap Pengiriman - Selesai Muat · Push · Tahap Pengiriman - Selesai Bongkar · Push · Lelang Kontrak (1/1) · Semua · Lelang Kontrak · Push · Batal · Simpan

## 72. Admin — Daftar Lelang → Riwayat Pembatalan

- Route: `/lelang/riwayat-pembatalan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Pembatalan Lelang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Pembatalan Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Multipickup; 1; 2; 4.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-riwayat-pembatalan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Riwayat Pembatalan · Riwayat Pembatalan Lelang · Tampilkan · 10 · 20 · 50 · 100 · data

## 73. Admin — Data Periode Kontrak

- Route: `/lelang-kontrak/periode`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Data Periode Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Data Periode Kontrak.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Periode Kontrak; Pilih Periode Lelang.
- Kolom tabel: Periode Kontrak; Periode Lelang; Jumlah Lelang; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-periode.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Data Periode Kontrak · Data Periode Kontrak · Periode Kontrak · Pilih Periode Kontrak · Periode Lelang · Pilih Periode Lelang · Tampilkan · 10 · 20 · 50 · 100 · data · Periode Kontrak	Periode Lelang	Jumlah Lelang · Menampilkan 0–0 data dari 0 data

## 74. Admin — Daftar Lelang → Buat Lelang

- Route: `/lelang-kontrak/buat`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Buat Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Lelang Kontrak; Informasi Umum.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; Pilih Periode Kontrak; Buat Periode Kontrak; Batal; Simpan ke Draft; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-buat.png`.

Urutan konten/label yang terlihat:

> Lelang Kontrak · Buat Lelang Kontrak · Buat Lelang Kontrak · 01 · Informasi Umum · 02 · Peserta Lelang · Informasi Umum · FTL · Full Truck Load · FCL · Full Container Load · Periode Kontrak * · Pilih Periode Kontrak · Buat Periode Kontrak · Batal · Simpan ke Draft · Selanjutnya

## 75. Admin — Daftar Lelang → Riwayat Perubahan

- Route: `/lelang-kontrak/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Perubahan Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar.
- Kolom tabel: Field; Nilai Lama; Nilai Baru.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-riwayat.png`.

Urutan konten/label yang terlihat:

> Lelang Kontrak · Riwayat Perubahan · Riwayat Perubahan · Admin · 03/10/2026, 08.10 · Field	Nilai Lama	Nilai Baru · Buka Lelang	2026-10-07T17:00:00.000Z	2026-10-03T01:11:00.000Z · Tutup Lelang	2026-10-07T17:10:00.000Z	2026-10-03T01:21:00.000Z

## 76. Admin — Tidak Direspons

- Route: `/negosiasi/tidak-direspons`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Nego Tidak Direspons | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Nego Tidak Direspons.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Reset; Terapkan.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-negosiasi-tidak-direspons.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Nego Tidak Direspons · Nego Tidak Direspons · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Reset · Terapkan · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 77. Admin — Order → Buat Order

- Route: `/order/buat`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Buat Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Order; Jenis Pengiriman; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; LTL / Less Than Truck Load; LCL / Less Than Container Load; Pilih Jenis Armada; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draf; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-buat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jumlah Armada | INPUT text | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Order · Buat Order · Buat Order · 01 · Data Pengiriman · 02 · Data Barang · 03 · Vendor dan Harga · 04 · Review · Jenis Pengiriman · FTL · Full Truck Load · FCL · Full Container Load · LTL · Less Than Truck Load · LCL · Less Than Container Load · Jenis Armada * · Pilih Jenis Armada · Jumlah Armada * · Tipe Pengiriman: Normal — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Drop Point Asal * · Pilih Drop Point Asal · Pengirim · Semua Pengirim · PIC Pengirim * · No. WhatsApp PIC * · Provinsi Asal · Kota/Kab. Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima · Semua Penerima · PIC Penerima * · No. WhatsApp PIC * · Provinsi Tujuan · Kota/Kab. Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Tambah Lokasi Bongkar · Batal · Simpan ke Draf · Selanjutnya

## 78. Admin — Order → Buat Order → Tambah Lokasi Muat

- Route: `/order/buat`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Lokasi Muat.
- Judul: Buat Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Order; Jenis Pengiriman; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; LTL / Less Than Truck Load; LCL / Less Than Container Load; Pilih Jenis Armada; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draf; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-buat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jumlah Armada | INPUT text | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Order · Buat Order · Buat Order · 01 · Data Pengiriman · 02 · Data Barang · 03 · Vendor dan Harga · 04 · Review · Jenis Pengiriman · FTL · Full Truck Load · FCL · Full Container Load · LTL · Less Than Truck Load · LCL · Less Than Container Load · Jenis Armada * · Pilih Jenis Armada · Jumlah Armada * · Tipe Pengiriman: Multipickup — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Muat 1 · Drop Point Asal * · Pilih Drop Point Asal · Pengirim · Semua Pengirim · PIC Pengirim * · No. WhatsApp PIC * · Provinsi Asal · Kota/Kab. Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Muat 2 · Drop Point Asal * · Pilih Drop Point Asal · Pengirim · Semua Pengirim · PIC Pengirim * · No. WhatsApp PIC * · Provinsi Asal · Kota/Kab. Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima · Semua Penerima · PIC Penerima * · No. WhatsApp PIC * · Provinsi Tujuan · Kota/Kab. Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Tambah Lokasi Bongkar · Batal

## 79. Admin — Order → Buat Order → Tambah Lokasi Bongkar

- Route: `/order/buat`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Lokasi Bongkar.
- Judul: Buat Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Order; Jenis Pengiriman; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; LTL / Less Than Truck Load; LCL / Less Than Container Load; Pilih Jenis Armada; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draf; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-buat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jumlah Armada | INPUT text | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Order · Buat Order · Buat Order · 01 · Data Pengiriman · 02 · Data Barang · 03 · Vendor dan Harga · 04 · Review · Jenis Pengiriman · FTL · Full Truck Load · FCL · Full Container Load · LTL · Less Than Truck Load · LCL · Less Than Container Load · Jenis Armada * · Pilih Jenis Armada · Jumlah Armada * · Tipe Pengiriman: Multidrop — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Drop Point Asal * · Pilih Drop Point Asal · Pengirim · Semua Pengirim · PIC Pengirim * · No. WhatsApp PIC * · Provinsi Asal · Kota/Kab. Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Bongkar 1 · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima · Semua Penerima · PIC Penerima * · No. WhatsApp PIC * · Provinsi Tujuan · Kota/Kab. Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Bongkar 2 · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima · Semua Penerima · PIC Penerima * · No. WhatsApp PIC * · Provinsi Tujuan · Kota/Kab. Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Tambah Lokasi Bongkar · Batal

## 80. Admin — Order → Riwayat Pembatalan

- Route: `/order/riwayat-pembatalan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Pembatalan Order | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Pembatalan Order.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar.
- Kolom tabel: ID Order / Vendor; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-order-riwayat-pembatalan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Order · Riwayat Pembatalan · Riwayat Pembatalan Order · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Vendor · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 81. Admin — Master Provinsi → Tambah Provinsi

- Route: `/master/provinsi/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-provinsi-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Provinsi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Tambah Provinsi · Tambah Provinsi · Provinsi * · Tambah Baris Input · Batal · Simpan

## 82. Admin — Master Provinsi → Riwayat

- Route: `/master/riwayat/provinsi`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-provinsi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Provinsi | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Riwayat · Riwayat Master Provinsi · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 83. Admin — Master Provinsi → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/provinsi`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-provinsi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Provinsi | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Riwayat · Riwayat Master Provinsi · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Provinsi · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 84. Admin — Master Provinsi → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/provinsi`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Provinsi | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Provinsi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Provinsi; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-provinsi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Provinsi | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Provinsi · Riwayat · Riwayat Master Provinsi · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Provinsi · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Provinsi	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 85. Admin — Master Kota → Riwayat

- Route: `/master/riwayat/kota`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kota.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kota | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Riwayat · Riwayat Master Kota · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kota · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kota · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 86. Admin — Master Kota → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/kota`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kota.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kota | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Riwayat · Riwayat Master Kota · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kota · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kota · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 87. Admin — Master Kota → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/kota`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Kota; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kota.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kota | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Riwayat · Riwayat Master Kota · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kota · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Kota	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 88. Admin — Master Kecamatan → Riwayat

- Route: `/master/riwayat/kecamatan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kecamatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kecamatan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Riwayat · Riwayat Master Kecamatan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 89. Admin — Master Kecamatan → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/kecamatan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kecamatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kecamatan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Riwayat · Riwayat Master Kecamatan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kecamatan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 90. Admin — Master Kecamatan → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/kecamatan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Kecamatan; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kecamatan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kecamatan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Riwayat · Riwayat Master Kecamatan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kecamatan · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Kecamatan	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 91. Admin — Master Kelurahan → Riwayat

- Route: `/master/riwayat/kelurahan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kelurahan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kelurahan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Riwayat · Riwayat Master Kelurahan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 92. Admin — Master Kelurahan → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/kelurahan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kelurahan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kelurahan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Riwayat · Riwayat Master Kelurahan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kelurahan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 93. Admin — Master Kelurahan → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/kelurahan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Kelurahan; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kelurahan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kelurahan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Riwayat · Riwayat Master Kelurahan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kelurahan · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Kelurahan	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 94. Admin — Master Drop Point → Riwayat

- Route: `/master/riwayat/customer`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Drop Point | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / PT. Integritas Karya (SMG) / 28/09/2026 11:55 / Admin / [akun main] / 1 Perubahan; 2. / PT. Integritas Karya (SUB) / 28/09/2026 11:54 / Admin / [akun main] / 1 Perubahan; 3. / PT. Integritas Karya (SUB) / 28/09/2026 11:18 / Admin / [akun main] / 1 Perubahan; 4. / PT. Solutiva Silver Warehouse / 25/09/2026 14:43 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Customer | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Riwayat · Riwayat Master Drop Point · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Customer · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Customer · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · PT. Integritas Karya (SMG) · 28/09/2026 11:55 · Admin · [akun main] · 1 Perubahan · 2. · PT. Integritas Karya (SUB) · 28/09/2026 11:54 · Admin · [akun main] · 1 Perubahan · 3. · PT. Integritas Karya (SUB) · 28/09/2026 11:18 · Admin · [akun main] · 1 Perubahan · 4. · PT. Solutiva Silver Warehouse · 25/09/2026 14:43 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–4 data dari 4 data

## 95. Admin — Master Drop Point → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/customer`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Drop Point | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / PT. Integritas Karya (SMG) / 28/09/2026 11:55 / Admin / [akun main] / 1 Perubahan; 2. / PT. Integritas Karya (SUB) / 28/09/2026 11:54 / Admin / [akun main] / 1 Perubahan; 3. / PT. Integritas Karya (SUB) / 28/09/2026 11:18 / Admin / [akun main] / 1 Perubahan; 4. / PT. Solutiva Silver Warehouse / 25/09/2026 14:43 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Customer | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Riwayat · Riwayat Master Drop Point · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Customer · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Customer · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · PT. Integritas Karya (SMG) · 28/09/2026 11:55 · Admin · [akun main] · 1 Perubahan · 2. · PT. Integritas Karya (SUB) · 28/09/2026 11:54 · Admin · [akun main] · 1 Perubahan · 3. · PT. Integritas Karya (SUB) · 28/09/2026 11:18 · Admin · [akun main] · 1 Perubahan · 4. · PT. Solutiva Silver Warehouse · 25/09/2026 14:43 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–4 data dari 4 data

## 96. Admin — Master Drop Point → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/customer`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Drop Point | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Customer; Tanggal Dihapus; Dihapus Oleh; .
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Customer | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Riwayat · Riwayat Master Drop Point · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Customer · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Customer	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 97. Admin — Master Waktu Perjalanan → Riwayat

- Route: `/master/riwayat/waktu-perjalanan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Waktu Perjalanan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-waktu-perjalanan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Rute | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Riwayat · Riwayat Master Waktu Perjalanan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Rute · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Rute · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 98. Admin — Master Waktu Perjalanan → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/waktu-perjalanan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Waktu Perjalanan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-waktu-perjalanan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Rute | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Riwayat · Riwayat Master Waktu Perjalanan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Rute · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Rute · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 99. Admin — Master Waktu Perjalanan → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/waktu-perjalanan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Waktu Perjalanan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Rute; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-waktu-perjalanan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Rute | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Riwayat · Riwayat Master Waktu Perjalanan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Rute · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Rute	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 100. Admin — Master Pelabuhan → Riwayat

- Route: `/master/riwayat/pelabuhan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelabuhan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelabuhan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Riwayat · Riwayat Master Pelabuhan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 101. Admin — Master Pelabuhan → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/pelabuhan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelabuhan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelabuhan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Riwayat · Riwayat Master Pelabuhan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelabuhan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 102. Admin — Master Pelabuhan → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/pelabuhan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Pelabuhan; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelabuhan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelabuhan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Riwayat · Riwayat Master Pelabuhan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelabuhan · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Pelabuhan	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 103. Admin — Master Pelayaran → Riwayat

- Route: `/master/riwayat/pelayaran`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / Meratus / 01/10/2026 10:53 / Admin / [akun main] / 1 Perubahan; 2. / SPIL / 01/10/2026 10:52 / Admin / [akun main] / 2 Perubahan; 3. / TANTO / 01/10/2026 10:51 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelayaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelayaran | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Riwayat · Riwayat Master Pelayaran · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · Meratus · 01/10/2026 10:53 · Admin · [akun main] · 1 Perubahan · 2. · SPIL · 01/10/2026 10:52 · Admin · [akun main] · 2 Perubahan · 3. · TANTO · 01/10/2026 10:51 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–3 data dari 3 data

## 104. Admin — Master Pelayaran → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/pelayaran`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan; 1. / Meratus / 01/10/2026 10:53 / Admin / [akun main] / 1 Perubahan; 2. / SPIL / 01/10/2026 10:52 / Admin / [akun main] / 2 Perubahan; 3. / TANTO / 01/10/2026 10:51 / Admin / [akun main] / 1 Perubahan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelayaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelayaran | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Riwayat · Riwayat Master Pelayaran · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Pelayaran · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · Meratus · 01/10/2026 10:53 · Admin · [akun main] · 1 Perubahan · 2. · SPIL · 01/10/2026 10:52 · Admin · [akun main] · 2 Perubahan · 3. · TANTO · 01/10/2026 10:51 · Admin · [akun main] · 1 Perubahan · Menampilkan 1–3 data dari 3 data

## 105. Admin — Master Pelayaran → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/pelayaran`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Pelayaran; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-pelayaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Pelayaran | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Riwayat · Riwayat Master Pelayaran · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Pelayaran · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Pelayaran	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 106. Admin — Master Barang → Riwayat

- Route: `/master/riwayat/barang`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-barang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Barang | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Riwayat · Riwayat Master Barang · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Barang · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Barang · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 107. Admin — Master Barang → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/barang`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-barang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Barang | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Riwayat · Riwayat Master Barang · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Barang · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Barang · Tanggal Perubahan · Diubah Oleh · Total Perubahan

## 108. Admin — Master Barang → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/barang`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Barang; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-barang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Barang | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Riwayat · Riwayat Master Barang · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Barang · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Barang	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 109. Admin — Master Kemasan → Riwayat

- Route: `/master/riwayat/kemasan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kemasan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kemasan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Riwayat · Riwayat Master Kemasan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 110. Admin — Master Kemasan → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/kemasan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kemasan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kemasan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Riwayat · Riwayat Master Kemasan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Kemasan · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 111. Admin — Master Kemasan → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/kemasan`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Kemasan; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-kemasan.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Kemasan | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Riwayat · Riwayat Master Kemasan · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Kemasan · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Kemasan	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 112. Admin — Master Unit → Tambah Armada

- Route: `/master/unit/tambah-armada`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Armada | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Nama Vendor; Pilih Jenis Armada; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit-tambah-armada.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan No. Polisi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Tambah Armada · Tambah Armada · Download Template · Import Data · Nama Vendor * · Pilih Nama Vendor · Jenis Armada * · Pilih Jenis Armada · No. Polisi * · Tambah Baris Input · Batal · Simpan

## 113. Admin — Master Sopir → Tambah Sopir

- Route: `/master/sopir/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Sopir | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Sopir.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Nama Vendor; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-sopir-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Sopir | INPUT text | False | False |  |
| Contoh: 081234567898 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Sopir · Tambah Sopir · Tambah Sopir · Download Template · Import Data · Nama Vendor * · Pilih Nama Vendor · Nama Sopir * · No. WhatsApp * · Tambah Baris Input · Batal · Simpan

## 114. Admin — Master CS → Riwayat

- Route: `/master/riwayat/customer-service`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Master Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer-service.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama CS | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Riwayat · Riwayat Master Customer Service · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama CS · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama CS · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 115. Admin — Master CS → Riwayat → Riwayat Perubahan

- Route: `/master/riwayat/customer-service`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Master Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer-service.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama CS | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Riwayat · Riwayat Master Customer Service · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama CS · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama CS · Tanggal Perubahan · Diubah Oleh · Total Perubahan

## 116. Admin — Master CS → Riwayat → Riwayat Penghapusan

- Route: `/master/riwayat/customer-service`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Master Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Master Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama CS; Tanggal Dihapus; Dihapus Oleh.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-riwayat-customer-service.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama CS | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Riwayat · Riwayat Master Customer Service · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama CS · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama CS	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 117. Admin — Manajemen Vendor → Riwayat

- Route: `/manajemen-vendor/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Manajemen Vendor | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Manajemen Vendor.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Reset; Terapkan; 1. / AUTOTEST-20260923-NEG-WA-HURUF / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan; 2. / AUTOTEST-20260923-NEG-WA-NON0 / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan; 3. / AUTOTEST-20260923-NEG-WA-PLUS62 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan; 4. / AUTOTEST-20260923-NEG-WA-0812 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan; 5. / AUTOTEST-20260923-DIBANTU-ADMIN / 01/10/2026 13:10 / Admin / [akun main] / 1 Perubahan; 6. / AUTOTEST-20260924-V31 / 01/10/2026 13:09 / Admin / [akun main] / 1 Perubahan; 7. / AUTOTEST-20260925-V31 / 01/10/2026 13:05 / Admin / [akun main] / 1 Perubahan; 8. / AUTOTEST-20260925-V31B / 01/10/2026 13:04 / Admin / [akun main] / 1 Perubahan; 9. / AUTOTEST-20260929-V31B / 01/10/2026 11:16 / Admin / [akun main] / 1 Perubahan; 10. / AUTOTEST-20260929-PAGE-1 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 11. / AUTOTEST-20260929-PAGE-2 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 12. / AUTOTEST-20260929-PAGE-3 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 13. / AUTOTEST-20260929-PAGE-4 / 01/10/2026 11:15 / Admin / [akun main] / 1 Perubahan; 14. / AUTOTEST-20260929-PAGE-5 / 01/10/2026 11:13 / Admin / [akun main] / 1 Perubahan; 15. / PT. Integrasi Kinerja (IK) / 28/09/2026 13:19 / Admin / [akun main] / 1 Perubahan; 16. / PT. Hamilton / 25/09/2026 16:11 / Admin / [akun main] / 1 Perubahan; 17. / PT. Integrasi Karya (IK) / 23/09/2026 15:46 / PT. Integrasi Karya (IK) / [akun vendor] / 11 Perubahan; 18. / AUTOTEST-20260923-DIBANTU-VENDOR-ED / 23/09/2026 15:02 / Admin / [akun main] / 1 Perubahan; 19. / AUTOTEST-20260923-DIBANTU-ADMIN / 23/09/2026 15:01 / Admin / [akun main] / 1 Perubahan; 20. / AUTOTEST-20260923-DIBANTU-ADMIN / 23/09/2026 15:00 / Admin / [akun main] / 1 Perubahan; 1; 2.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-manajemen-vendor-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Vendor | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Manajemen Vendor · Riwayat · Riwayat Manajemen Vendor · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Vendor · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Vendor · Tanggal Perubahan · Diubah Oleh · Total Perubahan · 1. · AUTOTEST-20260923-NEG-WA-HURUF · 01/10/2026 13:14 · Admin · [akun main] · 1 Perubahan · 2. · AUTOTEST-20260923-NEG-WA-NON0 · 01/10/2026 13:14 · Admin · [akun main] · 1 Perubahan · 3. · AUTOTEST-20260923-NEG-WA-PLUS62 · 01/10/2026 13:12 · Admin · [akun main] · 1 Perubahan · 4. · AUTOTEST-20260923-NEG-WA-0812 · 01/10/2026 13:12 · Admin · [akun main] · 1 Perubahan · 5. · AUTOTEST-20260923-DIBANTU-ADMIN · 01/10/2026 13:10 · Admin · [akun main] · 1 Perubahan · 6. · AUTOTEST-20260924-V31 · 01/10/2026 13:09 · Admin · [akun main] · 1 Perubahan · 7. · AUTOTEST-20260925-V31 · 01/10/2026 13:05 · Admin · [akun main] · 1 Perubahan · 8. · AUTOTEST-20260925-V31B · 01/10/2026 13:04 · Admin · [akun main] · 1 Perubahan · 9. · AUTOTEST-20260929-V31B

## 118. Admin — Pengaturan Akun → Tambah Sub User

- Route: `/pengaturan-akun/sub-user/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Sub User; Informasi Umum; Hak Akses.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tampilkan password; Pilih Hak Akses; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Sub User | INPUT text | False | False |  |
| Masukkan Email | INPUT email | False | False |  |
| Masukkan Nomor WhatsApp | INPUT text | False | False |  |
| Masukkan Bagian Staff | INPUT text | False | False |  |
| Masukkan Password | INPUT password | False | False |  |
| Masukkan Konfirmasi Password | INPUT password | False | False |  |
| perm-mode | INPUT radio | False | False |  |
| perm-mode | INPUT radio | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Tambah Sub User · Tambah Sub User · Informasi Umum · Nama Sub User * · Email * · Nomor WhatsApp * · Contoh: 081234567898 · Bagian Staff * · Password * · Konfirmasi Password * · Hak Akses · Pilih Hak Akses · Buat Hak Akses · Hak Akses * · Pilih Hak Akses · Batal · Simpan

## 119. Admin — Pengaturan Akun → Riwayat

- Route: `/pengaturan-akun/sub-user/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Sub User.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sub User | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Riwayat Sub User · Riwayat Sub User · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 120. Admin — Pengaturan Akun → Riwayat → Riwayat Perubahan

- Route: `/pengaturan-akun/sub-user/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Perubahan.
- Judul: Riwayat Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Sub User.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sub User | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Riwayat Sub User · Riwayat Sub User · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Nama Sub User · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan.

## 121. Admin — Pengaturan Akun → Riwayat → Riwayat Penghapusan

- Route: `/pengaturan-akun/sub-user/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Riwayat Penghapusan.
- Judul: Riwayat Sub User | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Sub User.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Riwayat Perubahan; Riwayat Penghapusan; Filter; Reset; Terapkan.
- Kolom tabel: No; Nama Sub User; Tanggal Dihapus; Dihapus Oleh; .
- Tab semantik: Riwayat Perubahan; Riwayat Penghapusan.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-pengaturan-akun-sub-user-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sub User | INPUT text | False | False |  |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Pengaturan Akun · Riwayat Sub User · Riwayat Sub User · Riwayat Perubahan · Riwayat Penghapusan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sub User · Tanggal Dihapus · Dihapus Oleh · Reset · Terapkan · No	Nama Sub User	Tanggal Dihapus	Dihapus Oleh · Belum ada riwayat penghapusan.

## 122. Admin — Akun Saya → Riwayat

- Route: `/akun-saya/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: halaman utama.
- Judul: Riwayat Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Akun Saya; Ubah Password; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Edit Akun Saya; Ubah Password.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Akun Saya · Riwayat Perubahan · Riwayat Perubahan Akun Saya · Edit Akun Saya · Ubah Password · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan akun.

## 123. Admin — Akun Saya → Riwayat → Edit Akun Saya

- Route: `/akun-saya/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Edit Akun Saya.
- Judul: Riwayat Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Akun Saya; Ubah Password; Filter; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: Edit Akun Saya; Ubah Password.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| dd/mm/yyyy | INPUT text | False | False |  |
| Nama atau email user | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Akun Saya · Riwayat Perubahan · Riwayat Perubahan Akun Saya · Edit Akun Saya · Ubah Password · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Perubahan · Diubah Oleh · Reset · Terapkan · No · Tanggal Perubahan · Diubah Oleh · Total Perubahan · Belum ada riwayat perubahan akun.

## 124. Admin — Akun Saya → Riwayat → Ubah Password

- Route: `/akun-saya/riwayat`.
- Jenis: Riwayat; varian/tab/aksi pembuka: Ubah Password.
- Judul: Riwayat Akun Saya | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Riwayat Perubahan Akun Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Akun Saya; Ubah Password; Filter; Reset; Terapkan.
- Kolom tabel: No; Tanggal Perubahan.
- Tab semantik: Edit Akun Saya; Ubah Password.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-akun-saya-riwayat.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| dd/mm/yyyy | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Akun Saya · Riwayat Perubahan · Riwayat Perubahan Akun Saya · Edit Akun Saya · Ubah Password · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Perubahan · Reset · Terapkan · No	Tanggal Perubahan · Belum ada riwayat ubah password.

## 125. Admin — Lihat Penawaran

- Route: `/lelang-kontrak/e169c340-7bcb-4933-b672-07ec709dad1d/penawaran`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Harga Penawaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Harga Penawaran; Syarat & Ketentuan; Harga Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Filter; Urutkan; Pilih Vendor; Pilih Jenis Armada; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-e169c340-7bcb-4933-b672-07ec709dad1d-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Harga Penawaran · Detail Harga Penawaran · No. Lelang · FTL-NRM-02/031026 · Dibuat: 03/10/2026 08:30 · Aktif · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 2000 · Deskripsi Barang · asdf · Jenis Armada · Trailer 20 FT · Ketentuan Lelang Kontrak · Cek Lelang Kontrak FTL · Durasi Lelang • 10 Menit · 03/10/2026 08:31 - 03/10/2026 08:41 · Periode Kontrak · 03/10/2026 08:42 - 01/05/2027 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Harga Penawaran · Filter · Urutkan · Tampilkan · 10 · 20 · 50 · 100 · data · Vendor · Pilih Vendor · Jenis Armada · Pilih Jenis Armada · Target Waktu Perjalanan · Jam · Reset · Terapkan · Belum ada penawaran pada lelang ini. · Menampilkan 0–0 data dari 0 data

## 126. Admin — Detail Lelang

- Route: `/lelang-kontrak/e169c340-7bcb-4933-b672-07ec709dad1d`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Lelang Kontrak; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang; Semua Status.
- Kolom tabel: No; Vendor; Tanggal Terkirim; Tanggal Penawaran; Status.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-e169c340-7bcb-4933-b672-07ec709dad1d.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Cari nama vendor | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Lelang Kontrak · Detail Lelang Kontrak · No. Lelang · FTL-NRM-02/031026 · Dibuat: 03/10/2026 08:30 · Tidak Ada Penawaran · Tidak Ada Order · Aktif · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 2000 · Deskripsi Barang · asdf · Jenis Armada · Trailer 20 FT · Ketentuan Lelang Kontrak · Cek Lelang Kontrak FTL · Durasi Lelang • 10 Menit · 03/10/2026 08:31 - 03/10/2026 08:41 · Periode Kontrak · 03/10/2026 08:42 - 01/05/2027 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Data Pengirim · Drop Point Asal · : · SolVer - Surabaya - Pagesangan · Pengirim · : · PT. Solutiva Silver Warehouse · PIC Pengirim · : · Bambang · Nomor WhatsApp PIC · : · 628123123123123 · Provinsi Asal · : · Jawa Timur · Kota/Kab. Asal · : · Kota Surabaya · Kecamatan Asal · : · Jambangan · Desa/Kelurahan Asal · : · Pagesangan · Kode Pos · : · 60233 · Alamat Asal

## 127. Admin — Lihat Penawaran

- Route: `/lelang-kontrak/10313ed4-c303-44ca-960b-3bf59298b1e8/penawaran`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Harga Penawaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Harga Penawaran; Syarat & Ketentuan; Harga Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Filter; Urutkan; Pilih Vendor; Pilih Jenis Armada; Reset; Terapkan; Detail Biaya; Detail Armada; Vendor; Tidak Berlaku.
- Kolom tabel: —.
- Tab semantik: Detail Biaya; Detail Armada; Vendor; Detail Biaya; Detail Armada; Vendor.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-10313ed4-c303-44ca-960b-3bf59298b1e8-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Harga Penawaran · Detail Harga Penawaran · No. Lelang · FTL-NRM-10/021026 · Dibuat: 02/10/2026 16:04 · Tutup · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 1 · Deskripsi Barang · fsa · Jenis Armada · Trailer 20 FT, Trailer 40 FT · Ketentuan Lelang Kontrak · - · Durasi Lelang • 10 Menit · 03/10/2026 08:11 - 03/10/2026 08:21 · Periode Kontrak · 15/10/2026 00:00 - 23/10/2026 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Harga Penawaran · Filter · Urutkan · Tampilkan · 10 · 20 · 50 · 100 · data · Vendor · Pilih Vendor · Jenis Armada · Pilih Jenis Armada · Target Waktu Perjalanan · Jam · Reset · Terapkan · Trailer 40 FT · Maks: 30.000 kg • 76,128 m³ · spf · ± 1 jam · Target Waktu Perjalanan · Rp60.000 · (Termasuk PPN & PPh) · Detail Biaya · Detail Armada · Vendor · Tidak Berlaku · Trailer 20 FT · Maks: 25.000 kg • 37,44 m³ · spf

## 128. Admin — Detail Lelang

- Route: `/lelang-kontrak/10313ed4-c303-44ca-960b-3bf59298b1e8`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Lelang Kontrak; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang; Semua Status.
- Kolom tabel: No; Vendor; Tanggal Terkirim; Tanggal Penawaran; Status.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-10313ed4-c303-44ca-960b-3bf59298b1e8.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Cari nama vendor | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Lelang Kontrak · Detail Lelang Kontrak · No. Lelang · FTL-NRM-10/021026 · Dibuat: 02/10/2026 16:04 · Tutup · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 1 · Deskripsi Barang · fsa · Jenis Armada · Trailer 20 FT, Trailer 40 FT · Ketentuan Lelang Kontrak · - · Durasi Lelang • 10 Menit · 03/10/2026 08:11 - 03/10/2026 08:21 · Periode Kontrak · 15/10/2026 00:00 - 23/10/2026 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Data Pengirim · Drop Point Asal · : · IK - SUB PT. Gold Coin Indonesia - Surabaya · Pengirim · : · PT. Integritas Karya (SUB) · PIC Pengirim · : · Leli · Nomor WhatsApp PIC · : · 6283830011881 · Provinsi Asal · : · Jawa Timur · Kota/Kab. Asal · : · Kota Surabaya · Kecamatan Asal · : · Asem Rowo · Desa/Kelurahan Asal · : · Asem Rowo · Kode Pos · : · 60182 · Alamat Asal · : · Kawasan, Jl. Pergudangan Suri Mulia Jl. Greges Tim. No.1, RW.3, Kalianak, Kec. Asem Rowo, Surabaya, Jawa Timur 60183

## 129. Admin — Lihat Penawaran

- Route: `/lelang-kontrak/bfe10761-415c-4b4d-a205-73c9a5c12872/penawaran`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Harga Penawaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Harga Penawaran; Syarat & Ketentuan; Harga Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Filter; Urutkan; Pilih Vendor; Pilih Jenis Armada; Reset; Terapkan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-bfe10761-415c-4b4d-a205-73c9a5c12872-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Harga Penawaran · Detail Harga Penawaran · No. Lelang · FTL-NRM-08/021026 · Dibuat: 02/10/2026 15:55 · Tutup · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 1 · Deskripsi Barang · fsa · Jenis Armada · Trailer 20 FT, Trailer 40 FT · Ketentuan Lelang Kontrak · - · Durasi Lelang • 6 Jam · 02/10/2026 15:56 - 02/10/2026 21:56 · Periode Kontrak · 15/10/2026 00:00 - 29/10/2026 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Harga Penawaran · Filter · Urutkan · Tampilkan · 10 · 20 · 50 · 100 · data · Vendor · Pilih Vendor · Jenis Armada · Pilih Jenis Armada · Target Waktu Perjalanan · Jam · Reset · Terapkan · Belum ada penawaran pada lelang ini. · Menampilkan 0–0 data dari 0 data

## 130. Admin — Detail Lelang

- Route: `/lelang-kontrak/bfe10761-415c-4b4d-a205-73c9a5c12872`.
- Jenis: Detail; varian/tab/aksi pembuka: halaman utama.
- Judul: Detail Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Lelang Kontrak; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang; Semua Status.
- Kolom tabel: No; Vendor; Tanggal Terkirim; Tanggal Penawaran; Status.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak-bfe10761-415c-4b4d-a205-73c9a5c12872.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Cari nama vendor | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Detail Lelang Kontrak · Detail Lelang Kontrak · No. Lelang · FTL-NRM-08/021026 · Dibuat: 02/10/2026 15:55 · Tidak Ada Penawaran · Tutup · Jenis Pengiriman · FTL (Full Truck Load) · Tipe Pengiriman · Normal · Volume Armada · 1 · Deskripsi Barang · fsa · Jenis Armada · Trailer 20 FT, Trailer 40 FT · Ketentuan Lelang Kontrak · - · Durasi Lelang • 6 Jam · 02/10/2026 15:56 - 02/10/2026 21:56 · Periode Kontrak · 15/10/2026 00:00 - 29/10/2026 00:00 · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Catatan Tambahan · : · - · TOP · : · - · Nilai Barang · : · - · Dokumen Tambahan · : · - · Data Pengirim · Drop Point Asal · : · IK - SUB PT. Gold Coin Indonesia - Surabaya · Pengirim · : · PT. Integritas Karya (SUB) · PIC Pengirim · : · Leli · Nomor WhatsApp PIC · : · 6283830011881 · Provinsi Asal · : · Jawa Timur · Kota/Kab. Asal · : · Kota Surabaya · Kecamatan Asal · : · Asem Rowo · Desa/Kelurahan Asal · : · Asem Rowo · Kode Pos · : · 60182 · Alamat Asal · :

## 131. Admin — Tambah Kota

- Route: `/master/kota/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Kota | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Kota.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Provinsi; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kota-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Kota | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kota · Tambah Kota · Tambah Kota · Provinsi * · Pilih Provinsi · Kota/Kab. * · Tambah Baris Input · Batal · Simpan

## 132. Admin — Tambah Kecamatan

- Route: `/master/kecamatan/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Kecamatan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Kecamatan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Provinsi; Pilih Kota/Kab.; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kecamatan-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Kecamatan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kecamatan · Tambah Kecamatan · Tambah Kecamatan · Provinsi * · Pilih Provinsi · Kota/Kab. * · Pilih Kota/Kab. · Kecamatan * · Tambah Baris Input · Batal · Simpan

## 133. Admin — Tambah Kelurahan

- Route: `/master/kelurahan/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Kelurahan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Kelurahan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Provinsi; Pilih Kota/Kab.; Pilih Kecamatan; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kelurahan-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Kelurahan/Desa | INPUT text | False | False |  |
| Masukkan Kode Pos | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kelurahan · Tambah Kelurahan · Tambah Kelurahan · Provinsi * · Pilih Provinsi · Kota/Kab. * · Pilih Kota/Kab. · Kecamatan * · Pilih Kecamatan · Kelurahan/Desa * · Kode Pos * · Tambah Baris Input · Batal · Simpan

## 134. Admin — Tambah Perusahaan

- Route: `/master/customer/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Perusahaan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Perusahaan; Informasi Perusahaan; Data Drop Point.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Provinsi; Pilih Kota/Kab.; Pilih Kecamatan; Pilih Desa/Kelurahan; +; −; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-customer-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Perusahaan | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| Masukkan Nama Drop Point | INPUT text | False | False |  |
| Masukkan Nama PIC | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Tempel link Google Maps di sini | INPUT text | False | False |  |
| Kode Pos | INPUT text | False | True |  |
| Masukkan Alamat | TEXTAREA textarea | False | False |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Master Drop Point · Tambah Perusahaan · Tambah Perusahaan · Informasi Perusahaan · Nama Perusahaan * · Tambah Detail Lainnya · Data Drop Point · Drop Point 1 · Nama Drop Point * · Nama PIC * · Nama PIC Pengirim · No. WhatsApp PIC * · Contoh: 081234567898 · Link Maps · Masukkan link maps yang sudah memiliki latlong · Provinsi * · Pilih Provinsi · Kota/Kab. * · Pilih Kota/Kab. · Kecamatan * · Pilih Kecamatan · Desa/Kelurahan * · Pilih Desa/Kelurahan · Kode Pos · Alamat * · Lokasi Peta · Klik pada peta untuk menentukan/geser titik lokasi · OpenStreetMap · + · − · Catatan · Tambah Baris Input · Batal · Simpan

## 135. Admin — Tambah Waktu Perjalanan

- Route: `/master/waktu-perjalanan/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Waktu Perjalanan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Waktu Perjalanan; Detail Rute.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Kota; Tambah Kota Transit; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-waktu-perjalanan-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Waktu Perjalanan · Tambah Waktu Perjalanan · Tambah Waktu Perjalanan · Download Template · Import Data · Detail Rute · Kota Asal (Origin) * · Pilih Kota · Kota Tujuan (Destinasi) * · Pilih Kota · Tambah Kota Transit · Waktu Perjalanan * · Jam · Contoh: Waktu Perjalanan untuk rute Kota Surabaya → Kota Surakarta = 48 jam. · Tambah Baris Input · Batal · Simpan

## 136. Admin — Tambah Pelabuhan

- Route: `/master/pelabuhan/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Pelabuhan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Pelabuhan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Kota/Kab.; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-pelabuhan-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan UN Code | INPUT text | False | False |  |
| Masukan Nama Pelabuhan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelabuhan · Tambah Pelabuhan · Tambah Pelabuhan · Download Template · Import Data · UN Code * · Kode UN · Nama Pelabuhan * · Kota/Kab. * · Pilih Kota/Kab. · Tambah Baris Input · Batal · Simpan

## 137. Admin — Tambah Pelayaran

- Route: `/master/pelayaran/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Pelayaran | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Pelayaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih File; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-pelayaran-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Pelayaran | INPUT text | False | False |  |
| Masukkan Logo Pelayaran | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Pelayaran · Tambah Pelayaran · Tambah Pelayaran · Download Template · Import Data · Nama Pelayaran * · Logo Pelayaran * · Pilih File · Maksimal 4MB dengan Format .jpg .jpeg atau .png · Tambah Baris Input · Batal · Simpan

## 138. Admin — Tambah Barang

- Route: `/master/barang/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Barang | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Barang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Kemasan; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-barang-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Kode SKU | INPUT text | False | False |  |
| Masukkan Nama Barang | INPUT text | False | False |  |
| 0 | INPUT text | False | False |  |
| 0 | INPUT text | False | False |  |
| 0 | INPUT text | False | False |  |
| 0 | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |
| 0 | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Barang · Tambah Barang · Tambah Barang · Download Template · Import Data · Kode SKU * · Nama Barang * · Kemasan * · Pilih Kemasan · Berat * · Kg · Panjang * · cm · Lebar * · cm · Tinggi * · cm · Kubikasi · m³ · Nilai Barang · Rp · Tambah Baris Input · Batal · Simpan

## 139. Admin — Tambah Kemasan

- Route: `/master/kemasan/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Kemasan | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Kemasan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-kemasan-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Kemasan | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Kemasan · Tambah Kemasan · Tambah Kemasan · Download Template · Import Data · Nama Kemasan * · Tambah Baris Input · Batal · Simpan

## 140. Admin — Tambah Jenis Armada

- Route: `/master/jenis-armada/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Jenis Armada | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Jenis Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-jenis-armada-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jenis Armada | INPUT text | False | False |  |
| Panjang | INPUT text | False | False |  |
| Lebar | INPUT text | False | False |  |
| Tinggi | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |
| Masukkan Kapasitas | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Jenis Armada · Tambah Jenis Armada · Tambah Jenis Armada · Download Template · Import Data · Jenis Armada * · Dimensi Area Kargo * · cm · cm · cm · Volume · m³ · Kapasitas * · kg · Tambah Baris Input · Batal · Simpan

## 141. Admin — Tambah Jenis Kontainer

- Route: `/master/unit/tambah-jenis-kontainer`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Jenis Kontainer | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Jenis Kontainer.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-unit-tambah-jenis-kontainer.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Jenis Kontainer | INPUT text | False | False |  |
| Panjang | INPUT text | False | False |  |
| Lebar | INPUT text | False | False |  |
| Tinggi | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT text | False | True |  |
| Masukkan Kapasitas | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Unit · Tambah Jenis Kontainer · Tambah Jenis Kontainer · Download Template · Import Data · Jenis Kontainer * · Dimensi Area Kargo * · cm · cm · cm · Volume · m³ · Kapasitas * · kg · Tambah Baris Input · Batal · Simpan

## 142. Admin — Tambah Customer Service

- Route: `/master/cs/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Customer Service | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Customer Service.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-master-cs-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama CS | INPUT text | False | False |  |
| Masukkan No. WhatsApp CS | INPUT text | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |

Urutan konten/label yang terlihat:

> Master Customer Service · Tambah Customer Service · Tambah Customer Service · Download Template · Import Data · Nama CS * · No. WhatsApp CS * · Jadikan CS default perusahaan · Dipakai otomatis untuk vendor baru yang dikelola oleh admin · Tambah Baris Input · Batal · Simpan

## 143. Admin — Tambah Vendor

- Route: `/manajemen-vendor/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: halaman utama.
- Judul: Tambah Vendor | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Tambah Vendor; Metode Registrasi dan Pengelola; Informasi Dasar.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Registrasi Mandiri /  / Vendor menerima email undangan dan melengkapi data registrasi secara mandiri.; Registrasi Dibantu Admin /  / Admin shipper mengisi data vendor dan sistem mengirimkan informasi login.; Vendor /  / Vendor mengelola armada, sopir, dan penugasan tracking secara mandiri.; Admin /  / Admin mengelola armada, sopir, dan penugasan tracking atas nama vendor.; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-manajemen-vendor-tambah.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Perusahaan | INPUT text | False | False |  |
| Masukkan Email | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Manajemen Vendor · Tambah Vendor · Tambah Vendor · Metode Registrasi dan Pengelola · Metode Registrasi * · Registrasi Mandiri · Vendor menerima email undangan dan melengkapi data registrasi secara mandiri. · Registrasi Dibantu Admin · Admin shipper mengisi data vendor dan sistem mengirimkan informasi login. · Pengelola * · Vendor · Vendor mengelola armada, sopir, dan penugasan tracking secara mandiri. · Admin · Admin mengelola armada, sopir, dan penugasan tracking atas nama vendor. · Registrasi Mandiri hanya berlaku untuk Pengelola Vendor. · Informasi Dasar · Nama Perusahaan * · Email * · Email perusahaan/PIC perusahaan · Batal · Simpan

## 144. Admin — Admin Buat Lelang Spot Rate diperiksa ulang

- Route: `/lelang/buat`.
- Jenis: Form; varian/tab/aksi pembuka: Form Buat Lelang.
- Judul: Buat Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Lelang Spot Rate; Informasi Umum; Syarat & Ketentuan; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; Pilih Durasi Lelang; Pilih Jenis Armada; Pilih File; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draft; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| DD/MM/YYYY hh:mm | INPUT text | False | True |  |
| Masukkan Deskripsi Barang | TEXTAREA textarea | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| Unggah Dokumen | INPUT text | False | False |  |
| Tulis Catatan Tambahan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Buat Lelang Spot Rate · Buat Lelang Spot Rate · 01 · Informasi Umum · 02 · Peserta Lelang · Informasi Umum · FTL · Full Truck Load · FCL · Full Container Load · Gunakan data lelang yang pernah dibuat · Semua data disalin kecuali tanggal periode lelang · Durasi Lelang * · Pilih Durasi Lelang · Buka Lelang * · DD/MM/YYYY hh:mm · Tutup Lelang · Rencana Awal Kirim * · DD/MM/YYYY hh:mm · Rencana Akhir Kirim * · DD/MM/YYYY hh:mm · Jenis Armada * · Pilih Jenis Armada · Deskripsi Barang · Syarat & Ketentuan · Gunakan Asuransi · Berlaku untuk seluruh muatan yang nanti akan dipesan · Dokumen Tambahan · Pilih File · Maksimal 4MB dengan format .jpg, .jpeg, .png, atau .pdf · Catatan Tambahan · Tipe Pengiriman: Normal — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Pastikan urutan pengiriman sudah sesuai · Drop Point Asal * · Pilih Drop Point Asal · Pengirim * · Semua Pengirim · PIC Pengirim * · Nama PIC Pengirim · No. WhatsApp PIC * · Contoh: 081234567898 · Provinsi Asal · Kota/Kab. Pengirim Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Pastikan urutan pengiriman sudah sesuai · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima * · Semua Penerima · PIC Penerima * · Nama PIC Penerima · No. WhatsApp PIC * · Contoh: 081234567898 · Provinsi Tujuan · Kota/Kab. Penerima Tujuan · Kecamatan Tujuan · Desa/Kelurahan Tujuan · Kode Pos · Alamat Tujuan · Catatan · Tambah Lokasi Bongkar

## 145. Admin — Admin /lelang Lelang Ulang

- Route: `/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Lelang Ulang.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Pembatalan; Filter; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Draf / 103.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Buat Lelang · Riwayat Pembatalan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Draf · 103 · Request Jadwal · Proses Nego · Lelang Ulang · Belum ada lelang pada tab ini. · Menampilkan 0–0 data dari 0 data

## 146. Admin — Admin /lelang Request Jadwal

- Route: `/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Request Jadwal.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Pembatalan; Filter; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Draf / 103.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Buat Lelang · Riwayat Pembatalan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Draf · 103 · Request Jadwal · Proses Nego · Lelang Ulang · Belum ada lelang pada tab ini. · Menampilkan 0–0 data dari 0 data

## 147. Admin — Admin /lelang Draf

- Route: `/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Draf.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Pembatalan; Filter; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Draf / 103; 1; 2; 6.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Buat Lelang · Riwayat Pembatalan · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Draf · 103 · Request Jadwal · Proses Nego · Lelang Ulang

## 148. Admin — Admin /lelang-kontrak Request Jadwal

- Route: `/lelang-kontrak`.
- Jenis: Daftar; varian/tab/aksi pembuka: Request Jadwal.
- Judul: Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Kontrak.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Perubahan; Filter; Semua Lelang; Request Jadwal / 0; Draf / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Lelang Kontrak · Buat Lelang · Riwayat Perubahan · Data Periode Kontrak · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Request Jadwal · 0 · Draf · 0 · Request Jadwal · Belum ada lelang pada tab ini. · Menampilkan 0–0 data dari 0 data

## 149. Admin — Admin /lelang-kontrak Draf

- Route: `/lelang-kontrak`.
- Jenis: Daftar; varian/tab/aksi pembuka: Draf.
- Judul: Lelang Kontrak | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Lelang Kontrak.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Buat Lelang; Riwayat Perubahan; Filter; Semua Lelang; Request Jadwal / 0; Draf / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-lelang-kontrak.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Kontrak · Lelang Kontrak · Buat Lelang · Riwayat Perubahan · Data Periode Kontrak · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Request Jadwal · 0 · Draf · 0 · Request Jadwal · Belum ada lelang pada tab ini. · Menampilkan 0–0 data dari 0 data

## 150. Admin — Admin Detail Lelang Spot Rate

- Route: `/lelang/44b7c65b-e8ef-435b-a05a-508666fc6def`.
- Jenis: Detail; varian/tab/aksi pembuka: Detail.
- Judul: Detail Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Detail Lelang Spot Rate; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Data; Syarat & Ketentuan; Data Pengirim; Data Penerima; Peserta Lelang; Semua Status.
- Kolom tabel: No; Vendor; Tanggal Terkirim; Tanggal Penawaran; Status.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Cari nama vendor | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Detail Lelang Spot Rate · Detail Lelang Spot Rate · Edit Data · No. Lelang · - · Dibuat: 30/09/2026 20:24 · Isi Informasi Umum · Jenis Pengiriman · FCL (Full Container Load) · Tipe Pengiriman · Normal · Skema Pengiriman · - · Deskripsi Barang · - · Jenis Kontainer · - · Jumlah Kontainer · - · Pelabuhan Asal · - · Pelabuhan Tujuan · - · Durasi Lelang • 1 Jam · - - - · Periode Rencana Pengiriman · - - - · Syarat & Ketentuan · Asuransi · : · Tidak Digunakan · Biaya Termasuk · : · - · Nilai Barang · : · - · Catatan Tambahan · : · - · TOP · : · - · Dokumen Tambahan · : · - · Data Pengirim · Drop Point Asal · : · - · Pengirim · : · - · PIC Pengirim · : · - · Nomor WhatsApp PIC · : · - · Provinsi Asal · : · - · Kota/Kab. Asal · : · - · Kecamatan Asal · : · - · Desa/Kelurahan Asal

Catatan kondisi: Tidak ada data.

## 151. Admin — Operasional Datepicker

- Route: `/dashboard-operasional`.
- Jenis: Dashboard; varian/tab/aksi pembuka: Pilih Tanggal.
- Judul: Dashboard Operasional | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Dashboard Operasional; Volume dan Aktivitas; Jenis Pengiriman; Tren Volume Order; Produktivitas Vendor; 5 Vendor Paling Produktif; Performa Pengiriman; Ketepatan Waktu; Daftar Keterlambatan Pengiriman.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Harian; Mingguan; Bulanan; Pilih Tanggal; Export; Vendor; Keterlambatan; Persentase Keterlambatan.
- Kolom tabel: No; Vendor; Trip Selesai; Order Terkirim; No; Vendor; Keterlambatan; Persentase Keterlambatan; Aksi; No; Vendor; Keterlambatan; Persentase Keterlambatan.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/main-dashboard-operasional.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Year | INPUT number | False | False |  |
| Year | INPUT number | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | Semua Tipe Order, FTL (Full Truck Load), LTL (Less Than Truck Load), FCL (Full Container Load), LCL (Less Than Container Load), Airfreight |
| Cari data | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Prahu Hub - AMS · Dashboard · Monitoring · Operasional · Distribusi & Muatan · Lelang Spot Rate · Daftar Lelang · Live Bidding · Lelang Kontrak · Daftar Lelang · Live Bidding · Negosiasi · Order · Riwayat Order Tidak Aktif · Penugasan Tracking · Simulasi Muatan · Master Wilayah · Master Provinsi · Master Kota · Master Kecamatan · Master Kelurahan · Master Operasional · Master Drop Point · Master Waktu Perjalanan · Master Pelabuhan · Master Pelayaran · Master Barang · Master Kemasan · Master Unit · Master Sopir · Master CS · Manajemen Vendor · Pengaturan Akun · Akun Saya · Pengaturan Sistem · Pusat Notifikasi · Pengaturan Notifikasi · Preferensi Notifikasi · Kuota Order · 0/200 · 0% · Prahu Hub - AMS - Versi 1.0.0 · Admin · Administrator · Admin · [akun main] · Dashboard · Operasional · Dashboard Operasional · Periode Permintaan Muat · Harian · Mingguan · Bulanan · Pilih Tanggal · October · November · Sun · Mon · Tue · Wed · Thu · Fri · Sat · Sun · Mon · Tue · Wed · Thu · Fri · Sat

Catatan kondisi: Tidak ada data · Tidak ada data. · Tidak ada data keterlambatan.

## 152. Admin — Admin Form Lelang FCL

- Route: `/lelang/buat`.
- Jenis: Form; varian/tab/aksi pembuka: FCL.
- Judul: Buat Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Kuota Order; Buat Lelang Spot Rate; Informasi Umum; Data Pengirim; Data Penerima.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; FTL / Full Truck Load; FCL / Full Container Load; Pilih Pelabuhan Asal; Pilih Pelabuhan Tujuan; Pilih Durasi Lelang; Pilih Jenis Kontainer; Door to Door / Kontainer diambil dari lokasi pengirim dan diantar hingga lokasi penerima.; Door to CY / Kontainer diambil dari lokasi pengirim dan dikirim hingga Container Yard (CY).; CY to CY / Kontainer diambil dari Container Yard (CY) asal dan dikirim ke Container Yard (CY) tujuan.; CY to Door / Kontainer diambil dari Container Yard (CY) dan diantar hingga lokasi penerima.; Pilih Drop Point Asal; Semua Pengirim; Tambah Lokasi Muat; Pilih Drop Point Tujuan; Semua Penerima; Tambah Lokasi Bongkar; Batal; Simpan ke Draft; Selanjutnya.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| DD/MM/YYYY hh:mm | INPUT text | False | True |  |
| Masukkan Deskripsi Barang | TEXTAREA textarea | False | False |  |
| Masukkan PIC Pengirim | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Asal | INPUT text | False | True |  |
| Kota/Kab. Asal | INPUT text | False | True |  |
| Kecamatan Asal | INPUT text | False | True |  |
| Desa/Kelurahan Asal | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Asal | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |
| Masukkan PIC Penerima | INPUT text | False | False |  |
| Masukkan No. WhatsApp PIC | INPUT text | False | False |  |
| Provinsi Tujuan | INPUT text | False | True |  |
| Kota/Kab. Tujuan | INPUT text | False | True |  |
| Kecamatan Tujuan | INPUT text | False | True |  |
| Desa/Kelurahan Tujuan | INPUT text | False | True |  |
| Kode Pos | INPUT text | False | True |  |
| Alamat Tujuan | TEXTAREA textarea | False | True |  |
| Masukkan Catatan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Buat Lelang Spot Rate · Buat Lelang Spot Rate · 01 · Informasi Umum · 02 · Peserta Lelang · Informasi Umum · FTL · Full Truck Load · FCL · Full Container Load · Gunakan data lelang yang pernah dibuat · Semua data disalin kecuali tanggal periode lelang · Pelabuhan Asal * · Pilih Pelabuhan Asal · Pelabuhan Tujuan * · Pilih Pelabuhan Tujuan · Durasi Lelang * · Pilih Durasi Lelang · Buka Lelang * · DD/MM/YYYY hh:mm · Tutup Lelang · Rencana Awal Kirim * · DD/MM/YYYY hh:mm · Rencana Akhir Kirim * · DD/MM/YYYY hh:mm · Jenis Kontainer * · Pilih Jenis Kontainer · Deskripsi Barang · Metode Pengiriman * · Door to Door · Kontainer diambil dari lokasi pengirim dan diantar hingga lokasi penerima. · Door to CY · Kontainer diambil dari lokasi pengirim dan dikirim hingga Container Yard (CY). · CY to CY · Kontainer diambil dari Container Yard (CY) asal dan dikirim ke Container Yard (CY) tujuan. · CY to Door · Kontainer diambil dari Container Yard (CY) dan diantar hingga lokasi penerima. · Tipe Pengiriman: Normal — mengikuti jumlah baris Data Pengirim & Data Penerima · Data Pengirim · Pastikan urutan pengiriman sudah sesuai · Drop Point Asal * · Pilih Drop Point Asal · Pengirim * · Semua Pengirim · PIC Pengirim * · Nama PIC Pengirim · No. WhatsApp PIC * · Contoh: 081234567898 · Provinsi Asal · Kota/Kab. Pengirim Asal · Kecamatan Asal · Desa/Kelurahan Asal · Kode Pos · Alamat Asal · Catatan · Tambah Lokasi Muat · Data Penerima · Pastikan urutan pengiriman sudah sesuai · Drop Point Tujuan * · Pilih Drop Point Tujuan · Penerima * · Semua Penerima · PIC Penerima * · Nama PIC Penerima · No. WhatsApp PIC * · Contoh: 081234567898 · Provinsi Tujuan · Kota/Kab. Penerima Tujuan

## 153. Vendor — Beranda

- Route: `/vendor-portal/order`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Daftar Order.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Semua Jenis; Semua Kota; Pilih Tanggal; Semua Tipe; Semua Drop Point; Semua Status; Reset; Terapkan.
- Kolom tabel: ID Order; Kota Asal / Warehouse Asal; Kota Tujuan / Warehouse Tujuan; Total Harga / Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-order.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Nama Pengirim | INPUT text | False | False |  |
| Masukkan Nama Penerima | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Order · Daftar Order · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Semua Jenis · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Tanggal Buat · Pilih Tanggal · Tanggal Permintaan Muat · Pilih Tanggal · Tipe Pengiriman · Semua Tipe · Drop Point Asal · Semua Drop Point · Drop Point Tujuan · Semua Drop Point · Pengirim · Penerima · Status · Semua Status · Reset · Terapkan · ID Order · Kota Asal · Warehouse Asal · Kota Tujuan · Warehouse Tujuan · Total Harga · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 154. Vendor — Daftar Lelang

- Route: `/vendor-portal/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Multipickup; Multidrop; 1; 2; 4.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari No. Lelang / pelabuhan | INPUT text | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Perlu Input Harga · Request Jadwal · Proses Nego · Lelang Ulang

## 155. Vendor — Live Bidding

- Route: `/vendor-portal/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 156. Vendor — Live Bidding → Semua Jenis Pengiriman

- Route: `/vendor-portal/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua Jenis Pengiriman.
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 157. Vendor — Live Bidding → FCL (Full Container Load)

- Route: `/vendor-portal/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FCL (Full Container Load).
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 158. Vendor — Live Bidding → FTL (Full Truck Load)

- Route: `/vendor-portal/live-bidding`.
- Jenis: Daftar; varian/tab/aksi pembuka: FTL (Full Truck Load).
- Judul: Live Bidding Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Live Bidding Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm; Semua Jenis Pengiriman; Semua Tipe Pengiriman; Semua Kota; Semua Pelabuhan; Reset; Terapkan; FCL (Full Container Load); FTL (Full Truck Load).
- Kolom tabel: —.
- Tab semantik: Semua Jenis Pengiriman; FCL (Full Container Load); FTL (Full Truck Load).
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-live-bidding.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Lelang | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Live Bidding Spot Rate · Live Bidding Spot Rate · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · No. Lelang · Buka Lelang · DD/MM/YYYY hh:mm · Tutup Lelang · DD/MM/YYYY hh:mm · Periode Pengiriman · DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm · Jenis Pengiriman · Semua Jenis Pengiriman · Tipe Pengiriman · Semua Tipe Pengiriman · Kota Asal · Semua Kota · Kota Tujuan · Semua Kota · Pelabuhan Asal · Semua Pelabuhan · Pelabuhan Tujuan · Semua Pelabuhan · Reset · Terapkan · Semua Jenis Pengiriman · FCL (Full Container Load) · FTL (Full Truck Load) · Tidak ada lelang spot rate yang sedang berjalan. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada lelang spot rate yang sedang berjalan.

## 159. Vendor — Penawaran

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga; 1; 2; 3.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 160. Vendor — Penawaran → Detail Harga

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Detail Harga.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga; 1; 2; 3.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 161. Vendor — Negosiasi

- Route: `/vendor-portal/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 0 · Menunggu Shipper · 0 · Selesai · 0 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 162. Vendor — Negosiasi → Semua

- Route: `/vendor-portal/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 0 · Menunggu Shipper · 0 · Selesai · 0 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 163. Vendor — Penugasan Tracking

- Route: `/penugasan-tracking`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Penugasan Tracking | Prahu Hub - AMS.
- Heading: ; ; Penugasan Tracking.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Rute; Pilih Status; Pilih Tahapan; Pilih Tanggal; Reset; Terapkan.
- Kolom tabel: ID Order; Rute; No. Polisi/No. Kontainer / Sopir; Status; .
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-penugasan-tracking.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan No. Polisi/No. Kontainer | INPUT text | False | False |  |
| Masukkan Nama Sopir/Petugas | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Penugasan Tracking · Penugasan Tracking · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Kota Asal · Pilih Rute · Kota Tujuan · Pilih Rute · No. Polisi / Kontainer · Sopir / Petugas · Status · Pilih Status · Tahapan Tracking · Pilih Tahapan · Tanggal Permintaan Muat · Pilih Tanggal · Reset · Terapkan · ID Order · Rute · No. Polisi/No. Kontainer · Sopir · Status · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 164. Vendor — Master Armada

- Route: `/vendor-portal/master/armada`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Master Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Armada; Pilih Status; Reset; Terapkan.
- Kolom tabel: No; Jenis Armada; Nomor Polisi; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-master-armada.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan No. Polisi | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Armada · Master Armada · Tambah Armada · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Jenis Armada · Pilih Jenis Armada · No. Polisi · Status · Pilih Status · Reset · Terapkan · No · Jenis Armada · Nomor Polisi · Status	Aksi · Menampilkan 0–0 data dari 0 data

## 165. Vendor — Master Sopir

- Route: `/vendor-portal/master/sopir`.
- Jenis: Daftar; varian/tab/aksi pembuka: halaman utama.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Master Sopir.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Status; Reset; Terapkan.
- Kolom tabel: No; Nama Sopir; No. WhatsApp; Kode Akses; Status; Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-master-sopir.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan Nama Sopir | INPUT text | False | False |  |
| Masukkan No. WhatsApp | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Sopir · Master Sopir · Tambah Sopir · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Nama Sopir · No. WhatsApp · Status · Pilih Status · Reset · Terapkan · No · Nama Sopir · No. WhatsApp · Kode Akses	Status	Aksi · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 166. Vendor — Akun Saya

- Route: `/vendor-portal/akun-saya`.
- Jenis: Profil; varian/tab/aksi pembuka: halaman utama.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Akun Saya; Informasi Umum; Informasi Perusahaan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Edit Informasi; Ubah Password.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-akun-saya.png`.

Urutan konten/label yang terlihat:

> Akun Saya · Akun Saya · Edit Informasi · Ubah Password · Informasi Umum · Nama Perusahaan · : · PT. Integrasi Kinerja (IK) · Alias Perusahaan · : · IKIKIK · No. WhatsApp · : · 6283830011881 · Email · : · [akun vendor] · Nama PIC Perusahaan · : · Luminare · Informasi Perusahaan · Provinsi Asal · : · Sulawesi Utara · Kota/Kab. Asal · : · Kabupaten Bolaang Mongondow Utara · Kecamatan Asal · : · Sangkub · Desa/Kelurahan Asal · : · Sangkub Ii · Kode Pos · : · 95762 · Alamat · : · Jl. Perak Bar. No.9-11, Perak Bar., Kec. Krembangan, Surabaya, Jawa Timur 60177 · Catatan Tambahan · : · - · Dokumen Tambahan · : · Boarding #STLM7001711-001.pdf · 23/09/2026 15:46 - 336.96 KB · Boarding #STLM7001711-002.pdf · 23/09/2026 15:46 - 336.94 KB · Boarding #STLM7001711-003.pdf · 23/09/2026 15:46 - 336.98 KB · Boarding #STLM7001711-004.pdf · 23/09/2026 15:46 - 336.93 KB · Boarding #STLM7001711-005.pdf · 23/09/2026 15:46 - 336.98 KB · Boarding #STLM7001711-006.pdf · 23/09/2026 15:46 - 336.94 KB

## 167. Vendor — Pusat Notifikasi

- Route: `/vendor-portal/setting/preferensi-notifikasi`.
- Jenis: Pengaturan; varian/tab/aksi pembuka: halaman utama.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Preferensi Notifikasi; Order (5/5); Tracking (2/2); Lelang Kontrak (1/1); Lelang (1/1).
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-setting-preferensi-notifikasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |
| (tanpa label atribut) | INPUT checkbox | False | False |  |

Urutan konten/label yang terlihat:

> Pusat Notifikasi · Preferensi · Preferensi Notifikasi · Order (5/5) · Semua · Order Baru · Email · Push · Order Telah Ditugaskan · Push · Order Selesai · Push · Order Dibatalkan · Push · Tracking (2/2) · Semua · Tahap Pengiriman - Selesai Muat · Push · Tahap Pengiriman - Selesai Bongkar · Push · Lelang Kontrak (1/1) · Semua · Lelang Kontrak · Push · Lelang (1/1) · Semua · Request Jadwal · Push · Batal · Simpan

## 168. Vendor — Akun Saya → Edit Informasi

- Route: `/vendor-portal/akun-saya/edit`.
- Jenis: Form; varian/tab/aksi pembuka: Edit Informasi.
- Judul: Prahu Hub - AMS.
- Heading: ; ; Edit Informasi; Informasi Perusahaan.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih Provinsi; Pilih Kota/Kab.; Pilih Kecamatan; Pilih Desa/Kelurahan; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Perusahaan | INPUT text | False | True |  |
| Masukkan Alias Perusahaan | INPUT text | False | False |  |
| Contoh: 081234567899 | INPUT text | False | False |  |
| Masukkan Email | INPUT text | False | True |  |
| Masukkan Nama PIC Perusahaan | INPUT text | False | False |  |
| Kode Pos | INPUT text | False | True |  |
| Masukkan Alamat | TEXTAREA textarea | False | False |  |
| Tuliskan Catatan Tambahan | TEXTAREA textarea | False | False |  |

Urutan konten/label yang terlihat:

> Akun Saya · Edit Informasi · Edit Informasi · Informasi Perusahaan · Nama Perusahaan * · Alias Perusahaan · Alias/nama lain/singkatan · No. WhatsApp * · No. WhatsApp perusahaan/PIC perusahaan · Email * · Email perusahaan/PIC perusahaan · Nama PIC Perusahaan * · Provinsi * · Pilih Provinsi · Kota/Kab. * · Pilih Kota/Kab. · Kecamatan * · Pilih Kecamatan · Desa/Kelurahan * · Pilih Desa/Kelurahan · Kode Pos · Alamat * · Catatan Tambahan · Dokumen Tambahan · Boarding #STLM7001711-001.pdf · 23/09/2026 15:46 - 336.96 KB · Boarding #STLM7001711-002.pdf · 23/09/2026 15:46 - 336.94 KB · Boarding #STLM7001711-003.pdf · 23/09/2026 15:46 - 336.98 KB · Boarding #STLM7001711-004.pdf · 23/09/2026 15:46 - 336.93 KB · Boarding #STLM7001711-005.pdf · 23/09/2026 15:46 - 336.98 KB · Boarding #STLM7001711-006.pdf · 23/09/2026 15:46 - 336.94 KB · Klik untuk upload atau drag & drop di sini · Maksimal 4MB dengan format .pdf, .jpg atau .jpeg · Batal · Simpan

## 169. Vendor — Vendor Detail Lelang

- Route: `/vendor-portal/lelang/4df35f68-38e1-4d0a-a496-8642aa1e61ac`.
- Jenis: Detail; varian/tab/aksi pembuka: Detail.
- Judul: Detail Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Detail Lelang Spot Rate; Harga Penawaran Saya.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Detail Lelang Spot Rate · Detail Lelang Spot Rate · No. Lelang · FTL-NRM-09/031026 · Aktif · Belum Input · Jenis Pengiriman · FTL (Full Truck Load) · Jenis Armada · Trailer 20 FT, Trailer 40 FT · Asuransi · Tidak Digunakan · Biaya Termasuk · - · Kota Administrasi Jakarta Barat · IK - JKT PT. Asia Paramita Indah · Jl. Perniagaan Bar. No.12, RT.12/RW.1, Roa Malaka, Kec. Tambora, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11240, Roa Malaka, Tambora, Kota Administrasi Jakarta Barat, Dki Jakarta 11230 · Kota Semarang · IK - SMG PT. ISS Semarang · Jl. Kedungmundu No.47, Tandang, Kec. Tembalang, Kota Semarang, Jawa Tengah 50274, Tandang, Tembalang, Kota Semarang, Jawa Tengah 50274 · Periode Lelang · 03/10/2026, 12.08 - 03/10/2026, 13.08 · Periode Rencana Pengiriman · 03/10/2026, 11.31 - 31/10/2026, 00.00 · Harga Penawaran Saya · Input Harga · Anda belum menginput harga pada lelang ini.

## 170. Vendor — Vendor Detail Harga

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Detail Harga diperiksa ulang.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga; 1; 2; 3.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 171. Vendor — Vendor Jadwal Penawaran

- Route: `/vendor-portal/penawaran/f49e644d-385c-4500-882e-e0ed96699efd/jadwal`.
- Jenis: Detail jadwal; varian/tab/aksi pembuka: Lihat Jadwal.
- Judul: Detail Jadwal | Prahu Hub - AMS.
- Heading: ; ; Detail Jadwal; Jadwal.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Jadwal; Filter; Tanggal Buat; Nama Kapal; Closing Time; Berangkat (ETD); Tiba (ETA).
- Kolom tabel: Tanggal Buat; Nama Kapal / Voyage; Closing Time / Open Stack; Berangkat (ETD); Tiba (ETA); Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Penawaran · Detail Jadwal · Detail Jadwal · No. Lelang · FCL-NRM-19/011026 · Jenis Pengiriman · FCL (Full Container Load) · Jenis Kontainer · 20 Feet · Asuransi · Tidak Digunakan · Biaya Termasuk · THC Asal, THC Tujuan, LOLO Asal, LOLO Tujuan, Trucking Asal, Trucking Tujuan · POL: Tanjung Perak (TJP) - Kota Surabaya · IK - SUB Estate 89 · Jl. Raya Jelidro II No.89, Sambikerep, Kec. Sambikerep, Surabaya, Jawa Timur 60185, Sambikerep, Sambikerep, Kota Surabaya, Jawa Timur 60217 · POD: Semayang (BPN) - Kota Balikpapan · IK - BPN PT.AMP · Graha Indah, Jl. MT Haryono No.120, Batu Ampar, Kec. Balikpapan Utara, Kota Balikpapan, Kalimantan Timur 76126, Graha Indah, Balikpapan Utara, Kota Balikpapan, Kalimantan Timur 76129 · Tipe Pengiriman · NORMAL · Skema Pengiriman · DOOR_TO_DOOR · Pelayaran · Meratus · Jenis Kontainer · 20 Feet · Harga · Rp15.000.000 · Mulai Berlaku · 01/10/2026 · PPN · 11% · PPh · 2% · Deskripsi Harga · AUTOTEST-20261001-A6-ORDER · Jadwal · Tambah Jadwal · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Buat · Nama Kapal · Voyage · Closing Time · Open Stack · Berangkat (ETD) · Tiba (ETA) · Aksi · 01/10/2026 · AUTOTEST-20261001-A6-KM-ORDER-2 · ORD-02 · 02/10/2026, 18.00 · - · 02/10/2026, 21.00	03/10/2026, 15.00 · 01/10/2026 · AUTOTEST-20261001-A6-KM-ORDER · ORD-01 · 02/10/2026, 17.00 · - · 02/10/2026, 21.00	03/10/2026, 15.00 · Menampilkan 1–2 data dari 2 data

## 172. Vendor — Vendor Form Tambah Jadwal

- Route: `/vendor-portal/penawaran/f49e644d-385c-4500-882e-e0ed96699efd/jadwal`.
- Jenis: Detail jadwal; varian/tab/aksi pembuka: Tambah Jadwal.
- Judul: Detail Jadwal | Prahu Hub - AMS.
- Heading: ; ; Detail Jadwal; Jadwal.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Tambah Jadwal; Filter; Tanggal Buat; Nama Kapal; Closing Time; Berangkat (ETD); Tiba (ETA); Mengerti.
- Kolom tabel: Tanggal Buat; Nama Kapal / Voyage; Closing Time / Open Stack; Berangkat (ETD); Tiba (ETA); Aksi.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Penawaran · Detail Jadwal · Detail Jadwal · No. Lelang · FCL-NRM-19/011026 · Jenis Pengiriman · FCL (Full Container Load) · Jenis Kontainer · 20 Feet · Asuransi · Tidak Digunakan · Biaya Termasuk · THC Asal, THC Tujuan, LOLO Asal, LOLO Tujuan, Trucking Asal, Trucking Tujuan · POL: Tanjung Perak (TJP) - Kota Surabaya · IK - SUB Estate 89 · Jl. Raya Jelidro II No.89, Sambikerep, Kec. Sambikerep, Surabaya, Jawa Timur 60185, Sambikerep, Sambikerep, Kota Surabaya, Jawa Timur 60217 · POD: Semayang (BPN) - Kota Balikpapan · IK - BPN PT.AMP · Graha Indah, Jl. MT Haryono No.120, Batu Ampar, Kec. Balikpapan Utara, Kota Balikpapan, Kalimantan Timur 76126, Graha Indah, Balikpapan Utara, Kota Balikpapan, Kalimantan Timur 76129 · Tipe Pengiriman · NORMAL · Skema Pengiriman · DOOR_TO_DOOR · Pelayaran · Meratus · Jenis Kontainer · 20 Feet · Harga · Rp15.000.000 · Mulai Berlaku · 01/10/2026 · PPN · 11% · PPh · 2% · Deskripsi Harga · AUTOTEST-20261001-A6-ORDER · Jadwal · Tambah Jadwal · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Tanggal Buat · Nama Kapal · Voyage · Closing Time · Open Stack · Berangkat (ETD) · Tiba (ETA) · Aksi · 01/10/2026 · AUTOTEST-20261001-A6-KM-ORDER-2 · ORD-02 · 02/10/2026, 18.00 · - · 02/10/2026, 21.00	03/10/2026, 15.00 · 01/10/2026 · AUTOTEST-20261001-A6-KM-ORDER · ORD-01 · 02/10/2026, 17.00 · - · 02/10/2026, 21.00	03/10/2026, 15.00 · Menampilkan 1–2 data dari 2 data · Aksi Tidak Dapat Dilakukan · Lelang sudah melewati rencana akhir kirim. Tidak bisa tambah jadwal · Mengerti

Catatan kondisi: Aksi Tidak Dapat Dilakukan · Lelang sudah melewati rencana akhir kirim. Tidak bisa tambah jadwal

## 173. Vendor — Penawaran → Semua Penawaran

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua Penawaran.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga; 1; 2; 3.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 174. Vendor — Penawaran → Belum Input Jadwal

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Belum Input Jadwal.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 175. Vendor — Penawaran → Penawaran Lengkap

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Penawaran Lengkap.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 176. Vendor — Penawaran → Request Jadwal

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Request Jadwal.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal · Belum ada harga penawaran pada tab ini. · Menampilkan 0–0 data dari 0 data

## 177. Vendor — Penawaran → Kadaluwarsa

- Route: `/vendor-portal/penawaran`.
- Jenis: Daftar; varian/tab/aksi pembuka: Kadaluwarsa.
- Judul: Daftar Penawaran | Prahu Hub - AMS.
- Heading: ; ; Daftar Penawaran.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Input Harga; Filter; Semua Penawaran / 49; Belum Input Jadwal / 16; Penawaran Lengkap / 20; Request Jadwal / 0; Kadaluwarsa / 13; Detail Harga.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-penawaran.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Daftar Penawaran · Input Harga · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Penawaran · 49 · Belum Input Jadwal · 16 · Penawaran Lengkap · 20 · Request Jadwal · 0 · Kadaluwarsa · 13 · Belum Input Jadwal

## 178. Vendor — Vendor Input Harga

- Route: `/vendor-portal/penawaran/input-harga`.
- Jenis: Form; varian/tab/aksi pembuka: Input Harga.
- Judul: Input Harga Penawaran | Prahu Hub - AMS.
- Heading: ; ; Input Harga Penawaran; Informasi Umum.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih No. Lelang; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

Urutan konten/label yang terlihat:

> Daftar Penawaran · Input Harga Penawaran · Input Harga Penawaran · Informasi Umum · No. Lelang * · Pilih No. Lelang · Pilih No. Lelang untuk menampilkan informasi umum. · Batal · Simpan

## 179. Vendor — Vendor Pilihan No Lelang

- Route: `/vendor-portal/penawaran/input-harga`.
- Jenis: Form; varian/tab/aksi pembuka: Dropdown No Lelang.
- Judul: Input Harga Penawaran | Prahu Hub - AMS.
- Heading: ; ; Input Harga Penawaran; Informasi Umum.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Pilih No. Lelang; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari... | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Penawaran · Input Harga Penawaran · Input Harga Penawaran · Informasi Umum · No. Lelang * · Pilih No. Lelang · Tidak ada lelang yang sedang buka · Pilih No. Lelang untuk menampilkan informasi umum. · Batal · Simpan

Catatan kondisi: Tidak ada lelang yang sedang buka

## 180. Vendor — Vendor Semua Lelang

- Route: `/vendor-portal/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Semua Lelang.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0; Multipickup; Multidrop; 1; 2; 4.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari No. Lelang / pelabuhan | INPUT text | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Perlu Input Harga · Request Jadwal · Proses Nego · Lelang Ulang

## 181. Vendor — Vendor Lelang Ulang

- Route: `/vendor-portal/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Lelang Ulang.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari No. Lelang / pelabuhan | INPUT text | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Perlu Input Harga · Request Jadwal · Proses Nego · Lelang Ulang · Belum ada lelang yang mengundang Anda pada tab ini. · Menampilkan 0–0 data dari 0 data

## 182. Vendor — Vendor Request Jadwal

- Route: `/vendor-portal/lelang`.
- Jenis: Daftar; varian/tab/aksi pembuka: Request Jadwal.
- Judul: Lelang Spot Rate | Prahu Hub - AMS.
- Heading: ; ; Lelang Spot Rate.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Semua Lelang; Lelang Ulang / 0; Request Jadwal / 0.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-lelang.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Cari No. Lelang / pelabuhan | INPUT text | False | False |  |
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |

Urutan konten/label yang terlihat:

> Lelang Spot Rate · Lelang Spot Rate · Tampilkan · 10 · 20 · 50 · 100 · data · Semua Lelang · Lelang Ulang · 0 · Request Jadwal · 0 · Perlu Input Harga · Request Jadwal · Proses Nego · Lelang Ulang · Belum ada lelang yang mengundang Anda pada tab ini. · Menampilkan 0–0 data dari 0 data

## 183. Vendor — Vendor Negosiasi Perlu Aksi

- Route: `/vendor-portal/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: Perlu Aksi.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 0 · Menunggu Shipper · 0 · Selesai · 0 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 184. Vendor — Vendor Negosiasi Menunggu Shipper

- Route: `/vendor-portal/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: Menunggu Shipper.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 0 · Menunggu Shipper · 0 · Selesai · 0 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 185. Vendor — Vendor Negosiasi Selesai

- Route: `/vendor-portal/negosiasi`.
- Jenis: Daftar; varian/tab/aksi pembuka: Selesai.
- Judul: Daftar Negosiasi | Prahu Hub - AMS.
- Heading: ; ; Daftar Negosiasi.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Filter; Pilih Jenis Order; Pilih Kota Asal; Pilih Kota Tujuan; Pilih Tipe Pengiriman; Pilih Skema Pengiriman; Pilih Drop Point Asal; Pilih Drop Point Tujuan; Pilih Status; Reset; Terapkan; Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- Kolom tabel: No. Lelang / Vendor; Rute; Unit / Pelayaran; Harga Terbaru / Harga Awal; Status / Putaran Nego; .
- Tab semantik: Semua; Perlu Aksi / 0; Menunggu Shipper / 0; Selesai / 0.
- DOM: 0 elemen data-testid; 0 role=dialog.
- Screenshot route: `artifacts/screenshots/explore/20261003/vendor-vendor-portal-negosiasi.png`.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| (tanpa label atribut) | SELECT select-one | False | False | 10, 20, 50, 100 |
| Masukkan ID Order | INPUT text | False | False |  |
| Masukkan Vendor | INPUT text | False | False |  |
| Masukkan Total Harga | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Daftar Negosiasi · Daftar Negosiasi · Filter · Tampilkan · 10 · 20 · 50 · 100 · data · ID Order · Jenis Order · Pilih Jenis Order · Vendor · Kota Asal · Pilih Kota Asal · Kota Tujuan · Pilih Kota Tujuan · Total Harga · Tipe Pengiriman · Pilih Tipe Pengiriman · Skema Pengiriman · Pilih Skema Pengiriman · Drop Point Asal · Pilih Drop Point Asal · Drop Point Tujuan · Pilih Drop Point Tujuan · Status · Pilih Status · Reset · Terapkan · Semua · Perlu Aksi · 0 · Menunggu Shipper · 0 · Selesai · 0 · No. Lelang · Vendor · Rute · Unit · Pelayaran · Harga Terbaru · Harga Awal · Status · Putaran Nego · Tidak ada data. · Menampilkan 0–0 data dari 0 data

Catatan kondisi: Tidak ada data.

## 186. Vendor — Vendor Tambah Armada

- Route: `/vendor-portal/master/armada/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Armada.
- Judul: Tambah Armada | Prahu Hub | Prahu Hub - AMS.
- Heading: ; ; Tambah Armada.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih Jenis Armada; Pilih File; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nomor Polisi | INPUT text | False | False |  |
| Pilih Foto STNK | INPUT text | False | False |  |
| Pilih Foto KIR | INPUT text | False | False |  |
| Pilih Foto Armada | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Armada · Tambah Armada · Tambah Armada · Download Template · Import Data · Jenis Armada * · Pilih Jenis Armada · Nomor Polisi * · Foto STNK · Pilih File · Maksimal 4MB dengan Format .jpg .jpeg atau .png · Foto KIR · Pilih File · Maksimal 4MB dengan Format .jpg .jpeg atau .png · Foto Armada · Pilih File · Maksimal 4MB dengan Format .jpg .jpeg atau .png · Tambah Baris Input · Batal · Simpan

## 187. Vendor — Vendor Tambah Sopir

- Route: `/vendor-portal/master/sopir/tambah`.
- Jenis: Form; varian/tab/aksi pembuka: Tambah Sopir.
- Judul: Tambah Sopir | Prahu Hub | Prahu Hub - AMS.
- Heading: ; ; Tambah Sopir.
- Aksi/opsi terlihat: Aktifkan mode gelap; Toggle Sidebar; Download Template; Import Data; Pilih File; Tambah Baris Input; Batal; Simpan.
- Kolom tabel: —.
- Tab semantik: —.
- DOM: 0 elemen data-testid; 0 role=dialog.

| Field / placeholder / label | Jenis | Wajib HTML | Disabled | Opsi native |
|---|---|---|---|---|
| Masukkan Nama Sopir | INPUT text | False | False |  |
| Masukkan Nomor WhatsApp | INPUT text | False | False |  |
| Pilih Foto SIM | INPUT text | False | False |  |

Urutan konten/label yang terlihat:

> Master Sopir · Tambah Sopir · Tambah Sopir · Download Template · Import Data · Nama Sopir * · Nomor WhatsApp * · Contoh: 081234567898 · Foto SIM · Pilih File · Maksimal 4MB dengan Format .jpg .jpeg atau .png · Tambah Baris Input · Batal · Simpan

