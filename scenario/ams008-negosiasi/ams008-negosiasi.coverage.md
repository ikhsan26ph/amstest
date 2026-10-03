# Coverage — ams008-negosiasi

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 21 |
| Negative | 21 |
| Edge | 3 |
| Stress | 4 |
| **Total** | **49** |

Seluruh 21 requirement memiliki minimal satu skenario positive dan satu skenario negative. Tambahan edge mencakup batas minimum nominal, rentang eksklusif balasan, dan presisi deadline; tambahan stress mencakup 1.000 pilihan lintas halaman, 500 pengajuan bulk, 10.000 baris daftar, dan aksi paralel.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Kelayakan lelang dan akses Ajukan Nego | AMS008-NEGOSIASI-POS-001, AMS008-NEGOSIASI-NEG-001 |
| REQ-002 | Kelayakan penawaran aktif dan Closing Time FCL | AMS008-NEGOSIASI-POS-002, AMS008-NEGOSIASI-NEG-002 |
| REQ-003 | Maksimal lima putaran per penawaran | AMS008-NEGOSIASI-POS-003, AMS008-NEGOSIASI-NEG-003 |
| REQ-004 | Batas respons, timeout, dan waktu WIB | AMS008-NEGOSIASI-POS-004, AMS008-NEGOSIASI-NEG-004, AMS008-NEGOSIASI-EDG-003 |
| REQ-005 | Pemetaan status menurut sudut pandang | AMS008-NEGOSIASI-POS-005, AMS008-NEGOSIASI-NEG-005 |
| REQ-006 | Penghentian otomatis saat harga tidak berlaku | AMS008-NEGOSIASI-POS-006, AMS008-NEGOSIASI-NEG-006 |
| REQ-007 | Pilihan penawaran, pagination, counter, dan Batal | AMS008-NEGOSIASI-POS-007, AMS008-NEGOSIASI-NEG-007, AMS008-NEGOSIASI-STR-001 |
| REQ-008 | Validasi dan format Nominal Negosiasi | AMS008-NEGOSIASI-POS-008, AMS008-NEGOSIASI-NEG-008, AMS008-NEGOSIASI-EDG-001 |
| REQ-009 | Batas nominal pengajuan tunggal | AMS008-NEGOSIASI-POS-009, AMS008-NEGOSIASI-NEG-009 |
| REQ-010 | Penyaringan bulk berdasarkan harga aktif | AMS008-NEGOSIASI-POS-010, AMS008-NEGOSIASI-NEG-010 |
| REQ-011 | Penyaringan bulk berdasarkan nego pertama | AMS008-NEGOSIASI-POS-011, AMS008-NEGOSIASI-NEG-011 |
| REQ-012 | Konfirmasi dan pembentukan proses negosiasi | AMS008-NEGOSIASI-POS-012, AMS008-NEGOSIASI-NEG-012, AMS008-NEGOSIASI-STR-002 |
| REQ-013 | Daftar, tab, filter, sort, dan halaman Tidak Direspons shipper | AMS008-NEGOSIASI-POS-013, AMS008-NEGOSIASI-NEG-013, AMS008-NEGOSIASI-STR-003 |
| REQ-014 | Matriks menu aksi shipper | AMS008-NEGOSIASI-POS-014, AMS008-NEGOSIASI-NEG-014 |
| REQ-015 | Detail, aksi, dan riwayat shipper | AMS008-NEGOSIASI-POS-015, AMS008-NEGOSIASI-NEG-015 |
| REQ-016 | Ajukan Nego Kembali dari detail | AMS008-NEGOSIASI-POS-016, AMS008-NEGOSIASI-NEG-016 |
| REQ-017 | Daftar, detail, timer, dan aksi vendor | AMS008-NEGOSIASI-POS-017, AMS008-NEGOSIASI-NEG-017 |
| REQ-018 | Vendor menerima negosiasi | AMS008-NEGOSIASI-POS-018, AMS008-NEGOSIASI-NEG-018 |
| REQ-019 | Vendor menolak dengan alasan wajib | AMS008-NEGOSIASI-POS-019, AMS008-NEGOSIASI-NEG-019 |
| REQ-020 | Vendor mengajukan balasan | AMS008-NEGOSIASI-POS-020, AMS008-NEGOSIASI-NEG-020, AMS008-NEGOSIASI-EDG-002, AMS008-NEGOSIASI-STR-004 |
| REQ-021 | Riwayat dan dampak status terhadap harga/pemesanan | AMS008-NEGOSIASI-POS-021, AMS008-NEGOSIASI-NEG-021 |

## Cakupan layar dan elemen penting

| Layar/komponen | Jumlah skenario | Elemen yang tersentuh |
|---|---:|---|
| Detail Harga Penawaran | 5 | Ajukan Nego, harga aktif, Pesan, alert kelayakan, card penawaran |
| Ajukan Nego | 9 | Filter, pilihan per card, Pilih Semua, pagination, counter, Nominal Negosiasi, Batal, Kirim |
| Dialog validasi/konfirmasi shipper | 9 | Nominal Nego Belum Sesuai, Cek Kembali, Proses Harga yang Sesuai, Nominal Melebihi Nego Sebelumnya, Proses Sisanya, Ajukan/Batal |
| Daftar Negosiasi Shipper | 6 | Filter, Reset/Terapkan, tab/counter, tabel, menu aksi, halaman Tidak Direspons, sort/pagination |
| Detail Negosiasi Shipper | 6 | Status, data terbaru, Ajukan Nego, Akhiri Nego, tooltip waktu, tabel Riwayat |
| Daftar Negosiasi Vendor | 2 | Tab/counter, sisa respons, tabel, menu Detail, ketiadaan Tidak Direspons |
| Detail dan dialog Vendor | 10 | Grup Respon Nego, Terima, Tolak, chip/textarea alasan, Ajukan Balasan, timer, riwayat |

Seluruh kelompok layar pada UI Inventory memiliki skenario. Selector hint untuk elemen aksi, input, status, dialog, tabel, tab, pagination, dan pesan penting tersedia di JSON.

## Gap

Tidak ada gap requirement atau layar yang belum tercakup berdasarkan spesifikasi dan UI Inventory saat ini.

Catatan risiko desain yang tetap perlu dikonfirmasi saat implementasi:

- Desain lama masih menampilkan Tidak Direspons pada list utama shipper, sedangkan spesifikasi memindahkannya ke halaman khusus.
- Dialog `Nominal Melebihi Nego Sebelumnya` belum memiliki mockup; skenario mengikuti isi dan aksi dari spesifikasi.
- Beberapa mockup modal menampilkan identitas aktor yang tidak konsisten; hak aksi dalam skenario mengikuti spesifikasi.

## Hasil validasi Gherkin dan JSON

- 49 blok Scenario berhasil dipetakan satu-ke-satu ke 49 objek JSON berdasarkan ID.
- Tag kategori, priority, REQ, dan screen pada setiap Scenario cocok dengan `category`, `priority`, `requirement`, dan `screen` di JSON.
- Semua langkah JSON memakai action yang diizinkan: `navigate`, `fill`, `click`, `select`, `check`, atau `expect`.
- `summary.total` dan jumlah per kategori sama dengan hitungan aktual.
- Semua ID dan judul unik; tidak ditemukan ID JSON yang hilang dari feature atau sebaliknya.
- Struktur langkah Given/When/Then/And lolos pemeriksaan pola. Parser Gherkin eksternal tidak tersedia di dependensi proyek, sehingga validasi sintaks dilakukan secara mekanis terhadap keyword dan struktur blok.

## Duplikat

Tidak ditemukan skenario dengan judul atau rangkaian langkah yang identik. Tidak ada skenario yang dibuang.
