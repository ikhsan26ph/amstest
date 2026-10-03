# Module Map — AMS

Eksplorasi langsung read-only dimulai 2026-10-03, diselesaikan 2026-10-04. Dua sesi browser terpisah: Admin dan Vendor. Tidak submit, simpan, hapus, atau mengubah pengaturan. Detail berdasarkan jenis halaman dan sampel record, bukan seluruh record/paginasi.

## Info Login & Environment

| Item | Hasil |
|---|---|
| Environment | staging; URL diambil dari config/env.md |
| Login | /login; selector dan pola sukses dari config/env.md |
| Admin | Admin / Administrator; halaman awal /monitoring |
| Vendor | Vendor; halaman awal /vendor-portal/order |
| Metode | Playwright lokal; MCP tersedia tetapi run-code tidak memiliki akses modul filesystem untuk membaca config secara aman |
| Kredensial | Tidak disalin ke laporan; observasi teks disamarkan sebelum disimpan |

**Cakupan:** 85 halaman route tanpa varian; 187 observasi unik halaman/tab/modal pada 93 pasangan role–route.

## Peta Modul

| # | Modul | Route | Jenis Halaman | Aksi Utama | Ada Dokumen Skenario? | Catatan |
|---|---|---|---|---|---|---|
| 1 | Prahu Hub - AMS | `/monitoring` | Dashboard | Aktifkan mode gelap, Toggle Sidebar, Semua Tahapan / 0, Selesai Muat / 0, Selesai Bongkar / 0, Melewati SLA / 0, Belum Ada Pencatatan / 0 | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 2 | Operasional | `/dashboard-operasional` | Dashboard | Aktifkan mode gelap, Toggle Sidebar, Harian, Mingguan, Bulanan, Pilih Tanggal, Export, Vendor, Keterlambatan, Persentase Keterlambatan | Belum | Admin; 2 input terlihat; 13 kolom tabel |
| 3 | Distribusi & Muatan | `/dashboard-distribusi` | Dashboard | Aktifkan mode gelap, Toggle Sidebar, Harian, Mingguan, Bulanan, Pilih Tanggal, Export, Pas-kan tampilan ke seluruh Indonesia, Perbesar, Perkecil | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 4 | Daftar Lelang | `/lelang` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Buat Lelang, Riwayat Pembatalan, Filter, Semua Lelang, Lelang Ulang / 0, Request Jadwal / 0, Draf / 103, Multipickup, Multidrop, 1, 2, 19 | ams001, ams002; ams007 untuk Request Jadwal | Admin; 1 input terlihat; 0 kolom tabel |
| 5 | Live Bidding | `/lelang/live-bidding` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Live Bidding, Laporan Lelang, Filter, DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm, Semua Jenis Pengiriman, Semua Tipe Pengiriman, Semua Kota, Semua Pelabuhan, Reset, Terapkan, FCL (Full Container Load), FTL (Full Truck Load) | ams003 | Admin; 2 input terlihat; 0 kolom tabel |
| 6 | Daftar Lelang | `/lelang-kontrak` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Buat Lelang, Riwayat Perubahan, Filter, Semua Lelang, Request Jadwal / 0, Draf / 0 | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 7 | Live Bidding | `/lelang-kontrak/live-bidding` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Live Bidding, Laporan Lelang, Filter, DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm, Semua Jenis Pengiriman, Semua Tipe Pengiriman, Semua Kota, Semua Pelabuhan, Reset, Terapkan, FCL (Full Container Load), FTL (Full Truck Load) | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 8 | Negosiasi | `/negosiasi` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Order, Pilih Kota Asal, Pilih Kota Tujuan, Pilih Tipe Pengiriman, Pilih Skema Pengiriman, Pilih Drop Point Asal, Pilih Drop Point Tujuan, Pilih Status, Reset, Terapkan, Semua | ams008 | Admin; 4 input terlihat; 6 kolom tabel |
| 9 | Order | `/order` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Buat Order, Batch Order, Riwayat Pembatalan, Riwayat Order Tidak Aktif, Filter, Semua Jenis, Semua Kota, Pilih Tanggal, Semua Tipe, Semua Drop Point, Semua Status, Reset | Belum | Admin; 5 input terlihat; 5 kolom tabel |
| 10 | Riwayat Order Tidak Aktif | `/order/riwayat-tidak-aktif` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Daftar Order | Belum | Admin; 0 input terlihat; 5 kolom tabel |
| 11 | Penugasan Tracking | `/penugasan-tracking` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Order, Pilih Rute, Pilih Status, Pilih Tahapan, Pilih Tanggal, Semua Vendor, Reset, Terapkan | Belum | Admin; 4 input terlihat; 5 kolom tabel |
| 12 | Simulasi Muatan | `/simulasi-muatan` | Simulator | Aktifkan mode gelap, Toggle Sidebar, Armada, Kontainer, Pilih Barang, Cek Visualisasi, Lanjutkan Order | Belum | Admin; 1 input terlihat; 6 kolom tabel |
| 13 | Master Provinsi | `/master/provinsi` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Tambah Provinsi, Filter, Riwayat, Pilih Status, Reset, Terapkan, Edit Data, Hapus Data, 1, 2 | Belum | Admin; 2 input terlihat; 4 kolom tabel |
| 14 | Master Kota | `/master/kota` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Provinsi, Semua Status, Reset, Terapkan, Edit, Hapus, 1, 2, 26 | Belum | Admin; 2 input terlihat; 5 kolom tabel |
| 15 | Master Kecamatan | `/master/kecamatan` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Kota/Kab., Pilih Provinsi, Pilih Status, Reset, Terapkan, Edit, Hapus, 1, 2, 365 | Belum | Admin; 2 input terlihat; 6 kolom tabel |
| 16 | Master Kelurahan | `/master/kelurahan` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Provinsi, Pilih Kota/Kab., Pilih Status, Reset, Terapkan, Edit Data, Hapus Data, 1, 2, 4189 | Belum | Admin; 4 input terlihat; 7 kolom tabel |
| 17 | Master Drop Point | `/master/customer` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Status, Reset, Terapkan, Detail, Edit Informasi Perusahaan, Hapus data | Belum | Admin; 5 input terlihat; 6 kolom tabel |
| 18 | Master Waktu Perjalanan | `/master/waktu-perjalanan` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Reset, Terapkan, Edit target waktu (rute terkunci), Tidak dapat dihapus — rute sudah digunakan pada order, Edit data, Hapus data | Belum | Admin; 3 input terlihat; 4 kolom tabel |
| 19 | Master Pelabuhan | `/master/pelabuhan` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Kota/Kab., Pilih Status, Reset, Terapkan, Edit data, Hapus data | Belum | Admin; 3 input terlihat; 6 kolom tabel |
| 20 | Master Pelayaran | `/master/pelayaran` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Status, Reset, Terapkan, Edit, Hapus | Belum | Admin; 2 input terlihat; 4 kolom tabel |
| 21 | Master Barang | `/master/barang` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Kemasan, Pilih Status, Reset, Terapkan, Edit data, Hapus data | Belum | Admin; 5 input terlihat; 7 kolom tabel |
| 22 | Master Kemasan | `/master/kemasan` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Status, Reset, Terapkan, Edit data, Hapus data | Belum | Admin; 2 input terlihat; 4 kolom tabel |
| 23 | Master Unit | `/master/unit` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Armada, Jenis Armada, Jenis Kontainer, Tambah Armada, Filter, Pilih Nama Vendor, Reset, Terapkan, Kelola Armada | Belum | Admin; 3 input terlihat; 5 kolom tabel |
| 24 | Master Sopir | `/master/sopir` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Tambah Sopir, Filter, Pilih Nama Vendor, Reset, Terapkan, Kelola Sopir | Belum | Admin; 3 input terlihat; 5 kolom tabel |
| 25 | Master CS | `/master/cs` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Status, Reset, Terapkan | Belum | Admin; 3 input terlihat; 6 kolom tabel |
| 26 | Manajemen Vendor | `/manajemen-vendor` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Riwayat, Pilih Status, Pilih Pengelola, Pilih CS Penanggung Jawab, Reset, Terapkan, 1, 2 | Belum | Admin; 6 input terlihat; 6 kolom tabel |
| 27 | Pengaturan Akun | `/pengaturan-akun` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Sub User, Hak Akses, Tambah Sub User, Riwayat, Filter, Pilih Status, Reset, Terapkan | Belum | Admin; 4 input terlihat; 6 kolom tabel |
| 28 | Akun Saya | `/akun-saya` | Profil | Aktifkan mode gelap, Toggle Sidebar, Edit Informasi, Ubah Password, Riwayat | Belum | Admin; 0 input terlihat; 0 kolom tabel |
| 29 | Pengaturan Sistem | `/setting/sistem` | Pengaturan | Aktifkan mode gelap, Toggle Sidebar, Durasi Kedaluwarsa Undangan Vendor / Batas waktu tautan undangan registrasi vendor berlaku sebelum kedaluwarsa, Pilihan Durasi Lelang / Atur pilihan durasi untuk lelang FTL dan FCL, Ubah urutan, Menit, Hapus durasi 1, Hapus durasi 2, Hapus durasi 3, Jam, Hapus durasi 4, Hapus durasi 5, Hapus durasi 6, Hapus durasi 7 | Belum | Admin; 17 input terlihat; 0 kolom tabel |
| 30 | Pengaturan Notifikasi | `/setting/general` | Pengaturan | Aktifkan mode gelap, Toggle Sidebar, Batal, Simpan | Belum | Admin; 0 input terlihat; 0 kolom tabel |
| 31 | Preferensi Notifikasi | `/setting/preferensi-notifikasi` | Pengaturan | Aktifkan mode gelap, Toggle Sidebar, Batal, Simpan | Belum | Admin; 6 input terlihat; 0 kolom tabel |
| 32 | Daftar Lelang → Riwayat Pembatalan | `/lelang/riwayat-pembatalan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Multipickup, 1, 2, 4 | ams001, ams002; ams007 untuk Request Jadwal | Admin; 1 input terlihat; 0 kolom tabel |
| 33 | Data Periode Kontrak | `/lelang-kontrak/periode` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Pilih Periode Kontrak, Pilih Periode Lelang | Belum | Admin; 1 input terlihat; 4 kolom tabel |
| 34 | Daftar Lelang → Buat Lelang | `/lelang-kontrak/buat` | Form | Aktifkan mode gelap, Toggle Sidebar, FTL / Full Truck Load, FCL / Full Container Load, Pilih Periode Kontrak, Buat Periode Kontrak, Batal, Simpan ke Draft, Selanjutnya | Belum | Admin; 0 input terlihat; 0 kolom tabel |
| 35 | Daftar Lelang → Riwayat Perubahan | `/lelang-kontrak/riwayat` | Riwayat | Aktifkan mode gelap, Toggle Sidebar | Belum | Admin; 0 input terlihat; 3 kolom tabel |
| 36 | Tidak Direspons | `/negosiasi/tidak-direspons` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Order, Pilih Kota Asal, Pilih Kota Tujuan, Pilih Tipe Pengiriman, Pilih Skema Pengiriman, Pilih Drop Point Asal, Pilih Drop Point Tujuan, Reset, Terapkan | ams008 | Admin; 4 input terlihat; 6 kolom tabel |
| 37 | Order → Buat Order | `/order/buat` | Form | Aktifkan mode gelap, Toggle Sidebar, FTL / Full Truck Load, FCL / Full Container Load, LTL / Less Than Truck Load, LCL / Less Than Container Load, Pilih Jenis Armada, Pilih Drop Point Asal, Semua Pengirim, Tambah Lokasi Muat, Pilih Drop Point Tujuan, Semua Penerima, Tambah Lokasi Bongkar, Batal | Belum | Admin; 19 input terlihat; 0 kolom tabel |
| 38 | Order → Riwayat Pembatalan | `/order/riwayat-pembatalan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar | Belum | Admin; 1 input terlihat; 5 kolom tabel |
| 39 | Master Provinsi → Tambah Provinsi | `/master/provinsi/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 40 | Master Provinsi → Riwayat | `/master/riwayat/provinsi` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 41 | Master Kota → Riwayat | `/master/riwayat/kota` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 42 | Master Kecamatan → Riwayat | `/master/riwayat/kecamatan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 43 | Master Kelurahan → Riwayat | `/master/riwayat/kelurahan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 44 | Master Drop Point → Riwayat | `/master/riwayat/customer` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan, 1. / PT. Integritas Karya (SMG) / 28/09/2026 11:55 / Admin / [akun main] / 1 Perubahan, 2. / PT. Integritas Karya (SUB) / 28/09/2026 11:54 / Admin / [akun main] / 1 Perubahan, 3. / PT. Integritas Karya (SUB) / 28/09/2026 11:18 / Admin / [akun main] / 1 Perubahan, 4. / PT. Solutiva Silver Warehouse / 25/09/2026 14:43 / Admin / [akun main] / 1 Perubahan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 45 | Master Waktu Perjalanan → Riwayat | `/master/riwayat/waktu-perjalanan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 46 | Master Pelabuhan → Riwayat | `/master/riwayat/pelabuhan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 47 | Master Pelayaran → Riwayat | `/master/riwayat/pelayaran` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan, 1. / Meratus / 01/10/2026 10:53 / Admin / [akun main] / 1 Perubahan, 2. / SPIL / 01/10/2026 10:52 / Admin / [akun main] / 2 Perubahan, 3. / TANTO / 01/10/2026 10:51 / Admin / [akun main] / 1 Perubahan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 48 | Master Barang → Riwayat | `/master/riwayat/barang` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 49 | Master Kemasan → Riwayat | `/master/riwayat/kemasan` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 50 | Master Unit → Tambah Armada | `/master/unit/tambah-armada` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih Nama Vendor, Pilih Jenis Armada, Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 51 | Master Sopir → Tambah Sopir | `/master/sopir/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih Nama Vendor, Tambah Baris Input, Batal, Simpan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 52 | Master CS → Riwayat | `/master/riwayat/customer-service` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 53 | Manajemen Vendor → Riwayat | `/manajemen-vendor/riwayat` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Filter, Reset, Terapkan, 1. / AUTOTEST-20260923-NEG-WA-HURUF / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan, 2. / AUTOTEST-20260923-NEG-WA-NON0 / 01/10/2026 13:14 / Admin / [akun main] / 1 Perubahan, 3. / AUTOTEST-20260923-NEG-WA-PLUS62 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan, 4. / AUTOTEST-20260923-NEG-WA-0812 / 01/10/2026 13:12 / Admin / [akun main] / 1 Perubahan, 5. / AUTOTEST-20260923-DIBANTU-ADMIN / 01/10/2026 13:10 / Admin / [akun main] / 1 Perubahan, 6. / AUTOTEST-20260924-V31 / 01/10/2026 13:09 / Admin / [akun main] / 1 Perubahan, 7. / AUTOTEST-20260925-V31 / 01/10/2026 13:05 / Admin / [akun main] / 1 Perubahan, 8. / AUTOTEST-20260925-V31B / 01/10/2026 13:04 / Admin / [akun main] / 1 Perubahan, 9. / AUTOTEST-20260929-V31B / 01/10/2026 11:16 / Admin / [akun main] / 1 Perubahan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 54 | Pengaturan Akun → Tambah Sub User | `/pengaturan-akun/sub-user/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Tampilkan password, Pilih Hak Akses, Batal, Simpan | Belum | Admin; 8 input terlihat; 0 kolom tabel |
| 55 | Pengaturan Akun → Riwayat | `/pengaturan-akun/sub-user/riwayat` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Riwayat Perubahan, Riwayat Penghapusan, Filter, Reset, Terapkan | Belum | Admin; 4 input terlihat; 0 kolom tabel |
| 56 | Akun Saya → Riwayat | `/akun-saya/riwayat` | Riwayat | Aktifkan mode gelap, Toggle Sidebar, Edit Akun Saya, Ubah Password, Filter, Reset, Terapkan | Belum | Admin; 3 input terlihat; 0 kolom tabel |
| 57 | Lihat Penawaran | `/lelang-kontrak/e169c340-7bcb-4933-b672-07ec709dad1d/penawaran` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Filter, Urutkan, Pilih Vendor, Pilih Jenis Armada, Reset, Terapkan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 58 | Detail Lelang | `/lelang-kontrak/e169c340-7bcb-4933-b672-07ec709dad1d` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Data Pengirim, Data Penerima, Peserta Lelang, Semua Status | Belum | Admin; 2 input terlihat; 5 kolom tabel |
| 59 | Lihat Penawaran | `/lelang-kontrak/10313ed4-c303-44ca-960b-3bf59298b1e8/penawaran` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Filter, Urutkan, Pilih Vendor, Pilih Jenis Armada, Reset, Terapkan, Detail Biaya, Detail Armada, Vendor, Tidak Berlaku | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 60 | Detail Lelang | `/lelang-kontrak/10313ed4-c303-44ca-960b-3bf59298b1e8` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Data Pengirim, Data Penerima, Peserta Lelang, Semua Status | Belum | Admin; 2 input terlihat; 5 kolom tabel |
| 61 | Lihat Penawaran | `/lelang-kontrak/bfe10761-415c-4b4d-a205-73c9a5c12872/penawaran` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Filter, Urutkan, Pilih Vendor, Pilih Jenis Armada, Reset, Terapkan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 62 | Detail Lelang | `/lelang-kontrak/bfe10761-415c-4b4d-a205-73c9a5c12872` | Detail | Aktifkan mode gelap, Toggle Sidebar, Syarat & Ketentuan, Data Pengirim, Data Penerima, Peserta Lelang, Semua Status | Belum | Admin; 2 input terlihat; 5 kolom tabel |
| 63 | Tambah Kota | `/master/kota/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Pilih Provinsi, Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 64 | Tambah Kecamatan | `/master/kecamatan/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Pilih Provinsi, Pilih Kota/Kab., Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 65 | Tambah Kelurahan | `/master/kelurahan/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Pilih Provinsi, Pilih Kota/Kab., Pilih Kecamatan, Tambah Baris Input, Batal, Simpan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 66 | Tambah Perusahaan | `/master/customer/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Pilih Provinsi, Pilih Kota/Kab., Pilih Kecamatan, Pilih Desa/Kelurahan, +, −, Tambah Baris Input, Batal, Simpan | Belum | Admin; 9 input terlihat; 0 kolom tabel |
| 67 | Tambah Waktu Perjalanan | `/master/waktu-perjalanan/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih Kota, Tambah Kota Transit, Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 68 | Tambah Pelabuhan | `/master/pelabuhan/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih Kota/Kab., Tambah Baris Input, Batal, Simpan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 69 | Tambah Pelayaran | `/master/pelayaran/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih File, Tambah Baris Input, Batal, Simpan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 70 | Tambah Barang | `/master/barang/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Pilih Kemasan, Tambah Baris Input, Batal, Simpan | Belum | Admin; 8 input terlihat; 0 kolom tabel |
| 71 | Tambah Kemasan | `/master/kemasan/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Tambah Baris Input, Batal, Simpan | Belum | Admin; 1 input terlihat; 0 kolom tabel |
| 72 | Tambah Jenis Armada | `/master/jenis-armada/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Tambah Baris Input, Batal, Simpan | Belum | Admin; 6 input terlihat; 0 kolom tabel |
| 73 | Tambah Jenis Kontainer | `/master/unit/tambah-jenis-kontainer` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Tambah Baris Input, Batal, Simpan | Belum | Admin; 6 input terlihat; 0 kolom tabel |
| 74 | Tambah Customer Service | `/master/cs/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Download Template, Import Data, Tambah Baris Input, Batal, Simpan | Belum | Admin; 3 input terlihat; 0 kolom tabel |
| 75 | Tambah Vendor | `/manajemen-vendor/tambah` | Form | Aktifkan mode gelap, Toggle Sidebar, Registrasi Mandiri /  / Vendor menerima email undangan dan melengkapi data registrasi secara mandiri., Registrasi Dibantu Admin /  / Admin shipper mengisi data vendor dan sistem mengirimkan informasi login., Vendor /  / Vendor mengelola armada, sopir, dan penugasan tracking secara mandiri., Admin /  / Admin mengelola armada, sopir, dan penugasan tracking atas nama vendor., Batal, Simpan | Belum | Admin; 2 input terlihat; 0 kolom tabel |
| 76 | Beranda | `/vendor-portal/order` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Semua Jenis, Semua Kota, Pilih Tanggal, Semua Tipe, Semua Drop Point, Semua Status, Reset, Terapkan | Belum | Vendor; 4 input terlihat; 5 kolom tabel |
| 77 | Daftar Lelang | `/vendor-portal/lelang` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Semua Lelang, Lelang Ulang / 0, Request Jadwal / 0, Multipickup, Multidrop, 1, 2, 4 | Belum | Vendor; 2 input terlihat; 0 kolom tabel |
| 78 | Live Bidding | `/vendor-portal/live-bidding` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm, Semua Jenis Pengiriman, Semua Tipe Pengiriman, Semua Kota, Semua Pelabuhan, Reset, Terapkan, FCL (Full Container Load), FTL (Full Truck Load) | ams005 | Vendor; 2 input terlihat; 0 kolom tabel |
| 79 | Penawaran | `/vendor-portal/penawaran` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Input Harga, Filter, Semua Penawaran / 49, Belum Input Jadwal / 16, Penawaran Lengkap / 20, Request Jadwal / 0, Kadaluwarsa / 13, Detail Harga, 1, 2, 3 | ams004 | Vendor; 1 input terlihat; 0 kolom tabel |
| 80 | Negosiasi | `/vendor-portal/negosiasi` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Order, Pilih Kota Asal, Pilih Kota Tujuan, Pilih Tipe Pengiriman, Pilih Skema Pengiriman, Pilih Drop Point Asal, Pilih Drop Point Tujuan, Pilih Status, Reset, Terapkan, Semua | ams008 | Vendor; 4 input terlihat; 6 kolom tabel |
| 81 | Penugasan Tracking | `/penugasan-tracking` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Order, Pilih Rute, Pilih Status, Pilih Tahapan, Pilih Tanggal, Reset, Terapkan | Belum | Vendor; 4 input terlihat; 5 kolom tabel |
| 82 | Master Armada | `/vendor-portal/master/armada` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Jenis Armada, Pilih Status, Reset, Terapkan | Belum | Vendor; 2 input terlihat; 5 kolom tabel |
| 83 | Master Sopir | `/vendor-portal/master/sopir` | Daftar | Aktifkan mode gelap, Toggle Sidebar, Filter, Pilih Status, Reset, Terapkan | Belum | Vendor; 3 input terlihat; 6 kolom tabel |
| 84 | Akun Saya | `/vendor-portal/akun-saya` | Profil | Aktifkan mode gelap, Toggle Sidebar, Edit Informasi, Ubah Password | Belum | Vendor; 0 input terlihat; 0 kolom tabel |
| 85 | Pusat Notifikasi | `/vendor-portal/setting/preferensi-notifikasi` | Pengaturan | Aktifkan mode gelap, Toggle Sidebar, Batal, Simpan | Belum | Vendor; 9 input terlihat; 0 kolom tabel |

## Detail, Bukti, dan Batas Cakupan

- Inventaris lengkap per halaman/tab/modal: [page-inventory-20261004.md](page-inventory-20261004.md).
- Bukti DOM tersamarkan: `artifacts/explore-detail-20261003/main-pages.json` dan `vendor-pages.json`.
- Screenshot: `artifacts/screenshots/explore/20261003/`; tangkapan tersedia dilaporkan pada inventaris.
- Modul baru terhadap peta 2026-09-27: Lelang Kontrak, Live Bidding Kontrak, Data Periode Kontrak, Riwayat Order Tidak Aktif; portal Vendor kini dipetakan terpisah.
- Role lain tidak diuji; keberadaan menu pada kedua akun tidak membuktikan semua aturan otorisasi backend.
- Dropdown Input Harga Vendor tidak memiliki lelang yang sedang buka; form lanjut harga belum dapat diperiksa dari sampel tersebut.
- Tambah Jadwal pada sampel terpilih ditolak karena melewati rencana akhir kirim. Penolakan dicatat, tanpa memaksa bypass.
- Detail Harga Vendor merupakan ekspansi kartu; Lihat Jadwal navigasi ke halaman detail.
- Tidak ada verdict skenario formal; pemetaan ini bukan test-module/report Excel.

## Verifikasi Checklist Hipotesis (2026-10-04)

| # | Hasil terbaru | Bukti |
|---|---|---|
| 1 | BERBEDA: native click berhasil pada login/list/form | Login Admin/Vendor; pembukaan form dan dropdown |
| 2 | BERBEDA: storageState diterima di context baru; stabilitas sesi belum terbukti | vendor-storage-check.json; vendor-session-end.json mencatat redirect login berikutnya |
| 3 | Dropdown kustom, dengan pengecualian select native Tampilkan | Field/button inventaris list dan form Input Harga |
| 4 | BERBEDA: flatpickr di dashboard; kalender kustom pada form lelang | main-datepicker-list.json: 70 hari/9 overflow; main-datepicker-form.json: 43 tombol hari/input waktu |
| 5 | Modal Batal tanpa role=dialog/aria-modal | main-cancel-modal.json: 0/0, konfirmasi Tidak/Ya terlihat |
| 6 | 0 data-testid pada seluruh observasi | main-pages.json dan vendor-pages.json |

Seluruh path bukti JSON di atas relatif terhadap `artifacts/explore-detail-20261003/`.

## Batasan Tambahan

- Selanjutnya, Simpan, Simpan ke Draft, submit penawaran, dan aksi bisnis lain tidak dieksekusi. Step lanjutan yang membutuhkan validasi/pembuatan data belum dipastikan dari eksplorasi read-only ini.
- Sampel detail tiap tipe bukan pemeriksaan semua record; status lelang dan data staging berubah selama sesi.
- Sesi Vendor kemudian redirect login. Tidak ada login ulang; penelusuran Vendor yang sudah berhasil tetap tersimpan.
- Timeout interaksi locator pada beberapa tab diperiksa lewat role tab/regex; bukan verdict bug aplikasi.
- Dokumen skenario tersedia untuk ams001–ams008; pemetaan ke modul ada di tabel. Modul bertanda Belum memerlukan skenario sebelum uji detail formal.
