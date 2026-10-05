# Coverage — ams005-live-bidding-vendor

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 21 |
| Negative | 21 |
| Edge | 5 |
| Stress | 3 |
| **Total** | **50** |

Seluruh 21 requirement memiliki minimal satu scenario positive dan satu scenario negative. Scenario edge berfokus pada boundary waktu WIB/countdown, tie-break, validasi harga kosong/nol, serta karakter khusus filter. Scenario stress mencakup 1.000 card, 100 bid paralel, dan 100 bid berurutan.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Akses satu tampilan Live Bidding dan pembatasan lelang terundang | AMS005-LIVE-BIDDING-VENDOR-POS-001, AMS005-LIVE-BIDDING-VENDOR-NEG-001 |
| REQ-002 | Visibilitas card otomatis berdasarkan status, waktu, dan WIB | AMS005-LIVE-BIDDING-VENDOR-POS-002, AMS005-LIVE-BIDDING-VENDOR-NEG-002, AMS005-LIVE-BIDDING-VENDOR-EDG-001 |
| REQ-003 | Card per jenis dan urutan tanggal buka terbaru | AMS005-LIVE-BIDDING-VENDOR-POS-003, AMS005-LIVE-BIDDING-VENDOR-NEG-003, AMS005-LIVE-BIDDING-VENDOR-STR-001 |
| REQ-004 | Filter daftar, Terapkan, dan Reset | AMS005-LIVE-BIDDING-VENDOR-POS-004, AMS005-LIVE-BIDDING-VENDOR-NEG-004, AMS005-LIVE-BIDDING-VENDOR-EDG-005 |
| REQ-005 | Cakupan filter lokasi FTL/FCL dan rute bertitik banyak | AMS005-LIVE-BIDDING-VENDOR-POS-005, AMS005-LIVE-BIDDING-VENDOR-NEG-005 |
| REQ-006 | Sub-tab jenis pengiriman, page size, dan pagination | AMS005-LIVE-BIDDING-VENDOR-POS-006, AMS005-LIVE-BIDDING-VENDOR-NEG-006 |
| REQ-007 | Kelengkapan konten card dan badge tipe kondisional | AMS005-LIVE-BIDDING-VENDOR-POS-007, AMS005-LIVE-BIDDING-VENDOR-NEG-007 |
| REQ-008 | Badge dan tata letak card Lelang Ulang | AMS005-LIVE-BIDDING-VENDOR-POS-008, AMS005-LIVE-BIDDING-VENDOR-NEG-008 |
| REQ-009 | Tampilan dan pop-up rute Normal/Multipickup/Multidrop/Multipoint | AMS005-LIVE-BIDDING-VENDOR-POS-009, AMS005-LIVE-BIDDING-VENDOR-NEG-009 |
| REQ-010 | Countdown real-time, warna, dan penghilangan card saat nol | AMS005-LIVE-BIDDING-VENDOR-POS-010, AMS005-LIVE-BIDDING-VENDOR-NEG-010, AMS005-LIVE-BIDDING-VENDOR-EDG-002 |
| REQ-011 | Top 3 dan privasi/masking vendor | AMS005-LIVE-BIDDING-VENDOR-POS-011, AMS005-LIVE-BIDDING-VENDOR-NEG-011 |
| REQ-012 | Ranking, tie-break, update real-time, dan penguncian hasil | AMS005-LIVE-BIDDING-VENDOR-POS-012, AMS005-LIVE-BIDDING-VENDOR-NEG-012, AMS005-LIVE-BIDDING-VENDOR-EDG-004, AMS005-LIVE-BIDDING-VENDOR-STR-002 |
| REQ-013 | Total Penawaran dan aturan periode Lelang Ulang | AMS005-LIVE-BIDDING-VENDOR-POS-013, AMS005-LIVE-BIDDING-VENDOR-NEG-013 |
| REQ-014 | Opsi aktif pada form Bid dan format Rupiah | AMS005-LIVE-BIDDING-VENDOR-POS-014, AMS005-LIVE-BIDDING-VENDOR-NEG-014 |
| REQ-015 | Penanganan vendor dengan/tanpa harga awal | AMS005-LIVE-BIDDING-VENDOR-POS-015, AMS005-LIVE-BIDDING-VENDOR-NEG-015 |
| REQ-016 | Validasi Harga Baru terhadap harga sebelumnya | AMS005-LIVE-BIDDING-VENDOR-POS-016, AMS005-LIVE-BIDDING-VENDOR-NEG-016, AMS005-LIVE-BIDDING-VENDOR-EDG-003 |
| REQ-017 | Konfirmasi, penyimpanan, pewarisan data, dan pembaruan card | AMS005-LIVE-BIDDING-VENDOR-POS-017, AMS005-LIVE-BIDDING-VENDOR-NEG-017 |
| REQ-018 | Batas periode bid, pencatatan berulang, dan larangan setelah tutup | AMS005-LIVE-BIDDING-VENDOR-POS-018, AMS005-LIVE-BIDDING-VENDOR-NEG-018, AMS005-LIVE-BIDDING-VENDOR-STR-003 |
| REQ-019 | Navigasi dan otorisasi Detail Lelang Spot Rate | AMS005-LIVE-BIDDING-VENDOR-POS-019, AMS005-LIVE-BIDDING-VENDOR-NEG-019 |
| REQ-020 | Isi dan privasi dialog Riwayat Harga Penawaran | AMS005-LIVE-BIDDING-VENDOR-POS-020, AMS005-LIVE-BIDDING-VENDOR-NEG-020 |
| REQ-021 | Kolom, sorting, filter, page size, pagination, dan empty state riwayat | AMS005-LIVE-BIDDING-VENDOR-POS-021, AMS005-LIVE-BIDDING-VENDOR-NEG-021 |

## Cakupan Layar dan Elemen UI

| Layar/state | Cakupan |
|---|---|
| Live Bidding Spot Rate | Heading/navigasi, toggle dan seluruh field filter, Reset, Terapkan, seluruh sub-tab, page size, card, badge, rute, countdown, Top 3, Total Penawaran, form Bid, link riwayat/detail, dan pagination tercakup. |
| Riwayat Harga Penawaran | Dialog, info lelang/rute, filter Pelayaran, ketiga header sort, page size, tabel, empty state, pagination, dan tombol tutup tercakup. |
| Tidak Dapat Bid Harga / dialog transaksi | Pesan harga lebih besar, harga sama, belum punya penawaran, lelang tutup, tombol Mengerti, serta konfirmasi Ya/Batal dan toast sukses tercakup. |

## Gap dan Rekomendasi

Tidak ada gap requirement atau elemen UI penting berdasarkan `analysis.md`. Asumsi yang belum dapat divalidasi tanpa implementasi—misalnya SLA update real-time dan urutan backend untuk tie-break terakhir—telah dicatat di Assumptions Log dan dibuat sebagai scenario yang hasilnya harus deterministik.

## Validasi Gherkin dan JSON

- 50 Scenario Gherkin memiliki 50 pasangan ID JSON yang unik; tidak ada ID yatim pada salah satu artefak.
- Tag kategori, prioritas, REQ, dan screen konsisten dengan field `category`, `priority`, `requirement`, dan `screen` di JSON.
- Setiap Scenario memiliki Given, When, dan Then; transisi aksi setelah assertion dimulai kembali dengan When.
- Seluruh `steps[].action` berada dalam enum yang diizinkan: `navigate`, `fill`, `click`, `select`, `check`, `uncheck`, atau `expect`.
- `summary` JSON sama dengan hitungan aktual: 21 positive + 21 negative + 5 edge + 3 stress = 50.
- Ketiga screen/state unik dalam JSON tercakup: Live Bidding Spot Rate, Riwayat Harga Penawaran, dan Tidak Dapat Bid Harga.

## Pemeriksaan Duplikat

Tidak ditemukan judul atau tujuan scenario yang duplikat. Beberapa requirement memiliki tambahan edge/stress, tetapi masing-masing menguji dimensi berbeda dari pasangan positive/negative; tidak ada scenario yang dibuang.


## Revisi 2026-10-05

Rule duplikasi, Edit/Bid dan masa berlaku diperbarui sesuai user. Kasus batas dan regresi rinci: `../ams009-harga-penawaran-rules/`. Hasil run lama tetap bukti historis, tidak dihitung ulang terhadap rule baru.
