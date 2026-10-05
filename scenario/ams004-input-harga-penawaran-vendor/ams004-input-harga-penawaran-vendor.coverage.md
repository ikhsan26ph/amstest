# Coverage — ams004-input-harga-penawaran-vendor

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 14 |
| Negative | 14 |
| Edge | 6 |
| Stress | 4 |
| **Total** | **38** |

Seluruh 14 requirement memiliki sedikitnya satu skenario positive dan satu negative. Sepuluh skenario edge/stress (26,3% dari total) mencakup batas minimum, angka besar, transisi tanggal, pagination boundary, batch 50 baris, 20 sesi paralel, dataset 10.000 penawaran, dan master pelayaran berukuran besar.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Akses dan isolasi data vendor | AMS004-POS-001, AMS004-NEG-001 |
| REQ-002 | Daftar Lelang vendor | AMS004-POS-002, AMS004-NEG-002 |
| REQ-003 | Detail Lelang vendor | AMS004-POS-003, AMS004-NEG-003 |
| REQ-004 | Jalur dan kelayakan membuka Input Harga | AMS004-POS-004, AMS004-NEG-004 |
| REQ-005 | Informasi umum dan rute pada form | AMS004-POS-005, AMS004-NEG-005 |
| REQ-006 | Baris harga FCL | AMS004-POS-006, AMS004-NEG-006, AMS004-EDG-001, AMS004-STR-004 |
| REQ-007 | Baris harga FTL | AMS004-POS-007, AMS004-NEG-007, AMS004-EDG-002 |
| REQ-008 | Input beberapa harga dalam satu form | AMS004-POS-008, AMS004-NEG-008, AMS004-EDG-003, AMS004-STR-001 |
| REQ-009 | Simpan harga dan perhitungan | AMS004-POS-009, AMS004-NEG-009, AMS004-EDG-004, AMS004-STR-002 |
| REQ-010 | Status, keaktifan, dan lelang ulang | AMS004-POS-010, AMS004-NEG-010, AMS004-EDG-005 |
| REQ-011 | Pembatalan form | AMS004-POS-011, AMS004-NEG-011 |
| REQ-012 | Edit Harga | AMS004-POS-012, AMS004-NEG-012 |
| REQ-013 | Hapus Harga | AMS004-POS-013, AMS004-NEG-013 |
| REQ-014 | Daftar Penawaran dan action jadwal | AMS004-POS-014, AMS004-NEG-014, AMS004-EDG-006, AMS004-STR-003 |

## Coverage Layar dan Elemen Penting

| Layar | Scenario utama | Elemen/state yang tersentuh |
|---|---|---|
| Daftar Lelang | AMS004-POS-001, AMS004-POS-002, AMS004-NEG-002, AMS004-NEG-004 | tab/counter, filter, Reset/Terapkan, legend/border, card/status/badge, action menu, page size, pagination |
| Detail Lelang Spot Rate | AMS004-POS-003, AMS004-NEG-003, AMS004-POS-004 | accordion informasi, dokumen/read-only, daftar harga milik vendor, filter, urutkan, tab detail/connecting, tombol Input Harga |
| Input Harga Penawaran FCL | AMS004-POS-005, AMS004-POS-006, AMS004-POS-008, AMS004-NEG-006, AMS004-NEG-008, AMS004-EDG-001, AMS004-STR-001, AMS004-STR-004 | No. Lelang, info umum, POL/POD, Multipickup/Multidrop dan dialog, banner DPP, seluruh field FCL, default/disabled, tambah/hapus baris, validasi, Batal/Simpan/konfirmasi |
| Input Harga Penawaran FTL | AMS004-POS-007, AMS004-NEG-007, AMS004-EDG-002, AMS004-EDG-003 | Jenis Kendaraan, Harga, PPN/PPh, tanggal, Estimasi Pengiriman, deskripsi, multirow dan ikon hapus |
| Daftar Penawaran | AMS004-POS-009 hingga AMS004-NEG-014, AMS004-EDG-005, AMS004-EDG-006, AMS004-STR-003 | lima tab, filter/reset, card/detail/badge, total pajak, connecting, action edit/hapus/jadwal/riwayat, alert, urutan, page size, pagination |
| Edit Harga Penawaran | AMS004-POS-012, AMS004-NEG-012 | satu baris edit, tanpa Tambah Baris, konfirmasi, riwayat, update record yang sama, tanpa versi Tidak Berlaku, alert lelang tutup |
| Live Bidding Spot Rate | AMS004-POS-009, AMS004-EDG-004, AMS004-STR-002 | filter, ranking harga termurah per jenis, konkurensi, isolasi vendor |

## Gap dan Rekomendasi

Tidak ada gap requirement atau elemen UI penting yang teridentifikasi pada lingkup spesifikasi. Proses detail di modul Jadwal Kapal tidak dibuat sebagai skenario end-to-end karena dinyatakan sebagai spesifikasi terpisah; coverage saat ini berhenti pada handoff dan validasi kelayakan action.

Ambiguitas produk mengenai arti tanggal `Mulai Berlaku` versus contoh tanggal akhir inklusif, key duplikasi FTL/FCL, dan variasi label desain telah dicatat di `Assumptions Log` pada dokumen analisis. Setelah keputusan produk tersedia, skenario REQ-006/REQ-007/REQ-010 perlu disesuaikan bila interpretasinya berubah.

## Hasil Validasi

- JSON berhasil diparse dan berisi 38 ID unik serta 38 judul unik.
- Summary JSON cocok dengan hitungan aktual: 14 positive, 14 negative, 6 edge, 4 stress, total 38.
- Seluruh 38 Scenario Gherkin berhasil dikenali secara mekanis dan memiliki tepat satu padanan ID di JSON.
- Tag `@kategori`, `@priority-high|medium|low`, `@REQ-001`–`@REQ-014`, dan `@screen-*` konsisten dengan metadata JSON.
- Setiap Scenario mempunyai `Given` dan `Then`; urutan fase kembali ke `When` bila ada aksi setelah assertion. Semua langkah JSON memakai action yang diizinkan: `navigate`, `fill`, `click`, `select`, atau `expect`.
- Seluruh scenario JSON memiliki preconditions, steps terstruktur, expected, testData, dan selectorHints dengan `role`, `name`, serta `testid`.
- Pemeriksaan deduplikasi tidak menemukan skenario identik atau tumpang tindih material. Tidak ada skenario yang dibuang.


## Revisi 2026-10-05

Rule duplikasi, Edit/Bid dan masa berlaku diperbarui sesuai user. Kasus batas dan regresi rinci: `../ams009-harga-penawaran-rules/`. Hasil run lama tetap bukti historis, tidak dihitung ulang terhadap rule baru.
