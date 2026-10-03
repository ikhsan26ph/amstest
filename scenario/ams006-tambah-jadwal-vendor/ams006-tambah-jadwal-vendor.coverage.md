# Coverage — ams006-tambah-jadwal-vendor

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 22 |
| Negative | 29 |
| Edge | 7 |
| Stress | 4 |
| **Total** | **62** |

Seluruh 22 requirement memiliki minimal satu scenario positive dan satu scenario negative. Scenario edge mencakup batas waktu, multi-baris, integritas sort/filter, dan penghapusan sebagian; scenario stress mencakup volume jadwal/transit, operasi tabel, serta audit paralel.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Jadwal hanya untuk FCL dan dikelola vendor. | AMS006-TAMBAH-JADWAL-VENDOR-POS-001<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-001 |
| REQ-002 | Banyak jadwal terikat permanen pada satu harga. | AMS006-TAMBAH-JADWAL-VENDOR-POS-002<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-002<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-005<br>AMS006-TAMBAH-JADWAL-VENDOR-STR-001 |
| REQ-003 | Minimal satu jadwal aktif menentukan kelengkapan dan pemesanan. | AMS006-TAMBAH-JADWAL-VENDOR-POS-003<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-003 |
| REQ-004 | Periode tambah dari buka lelang sampai sebelum akhir kirim. | AMS006-TAMBAH-JADWAL-VENDOR-POS-004<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-004<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-001 |
| REQ-005 | Edit/hapus dibatasi waktu, status harga, dan penggunaan order. | AMS006-TAMBAH-JADWAL-VENDOR-POS-005<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-005<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-023<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-024<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-025<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-026 |
| REQ-006 | Menu Tambah/Lihat menuju layar yang tepat. | AMS006-TAMBAH-JADWAL-VENDOR-POS-006<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-006 |
| REQ-007 | Detail menampilkan informasi lelang/harga read-only. | AMS006-TAMBAH-JADWAL-VENDOR-POS-007<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-007 |
| REQ-008 | Kolom, sorting, urutan default, dan pagination tabel. | AMS006-TAMBAH-JADWAL-VENDOR-POS-008<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-008<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-006<br>AMS006-TAMBAH-JADWAL-VENDOR-STR-003 |
| REQ-009 | Filter jadwal serta Reset/Terapkan. | AMS006-TAMBAH-JADWAL-VENDOR-POS-009<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-009<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-007 |
| REQ-010 | Pop-up rangkaian kapal connecting. | AMS006-TAMBAH-JADWAL-VENDOR-POS-010<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-010 |
| REQ-011 | Informasi umum dan detail multipickup/multidrop. | AMS006-TAMBAH-JADWAL-VENDOR-POS-011<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-011 |
| REQ-012 | Pilihan Direct/Connecting dinamis dan mempertahankan data utama. | AMS006-TAMBAH-JADWAL-VENDOR-POS-012<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-012 |
| REQ-013 | Field dan kronologi Detail Kapal Utama. | AMS006-TAMBAH-JADWAL-VENDOR-POS-013<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-013<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-027<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-028<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-002 |
| REQ-014 | Baris, pelabuhan, dan kronologi kapal connecting. | AMS006-TAMBAH-JADWAL-VENDOR-POS-014<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-014<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-029<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-003<br>AMS006-TAMBAH-JADWAL-VENDOR-STR-002 |
| REQ-015 | Helper/border error dan scroll ke error pertama. | AMS006-TAMBAH-JADWAL-VENDOR-POS-015<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-015 |
| REQ-016 | Batal dengan konfirmasi tanpa menyimpan. | AMS006-TAMBAH-JADWAL-VENDOR-POS-016<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-016 |
| REQ-017 | Simpan, toast, Tanggal Buat, dan larangan duplikasi. | AMS006-TAMBAH-JADWAL-VENDOR-POS-017<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-017 |
| REQ-018 | Edit prefilled dengan validasi setara tambah. | AMS006-TAMBAH-JADWAL-VENDOR-POS-018<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-018 |
| REQ-019 | Hapus terkonfirmasi dan pemulihan status bila jadwal terakhir. | AMS006-TAMBAH-JADWAL-VENDOR-POS-019<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-019<br>AMS006-TAMBAH-JADWAL-VENDOR-EDG-004 |
| REQ-020 | Audit tambah/edit/hapus lengkap. | AMS006-TAMBAH-JADWAL-VENDOR-POS-020<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-020<br>AMS006-TAMBAH-JADWAL-VENDOR-STR-004 |
| REQ-021 | Sinkronisasi perubahan ke Detail Harga shipper. | AMS006-TAMBAH-JADWAL-VENDOR-POS-021<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-021 |
| REQ-022 | Download template dan import jadwal Direct. | AMS006-TAMBAH-JADWAL-VENDOR-POS-022<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-022 |

## Coverage Layar dan Elemen Penting

| Layar/komponen | Jumlah scenario bertag | Bukti coverage utama |
|---|---:|---|
| Daftar Penawaran | 5 | AMS006-TAMBAH-JADWAL-VENDOR-POS-001<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-003<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-006<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-001<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-003 |
| Detail Harga Penawaran Shipper | 2 | AMS006-TAMBAH-JADWAL-VENDOR-POS-021<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-021 |
| Detail Jadwal | 23 | AMS006-TAMBAH-JADWAL-VENDOR-POS-002<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-005<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-007<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-008<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-009<br>… |
| Detail Kapal Connecting | 1 | AMS006-TAMBAH-JADWAL-VENDOR-POS-010 |
| Edit Jadwal | 2 | AMS006-TAMBAH-JADWAL-VENDOR-POS-018<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-018 |
| Riwayat Perubahan | 3 | AMS006-TAMBAH-JADWAL-VENDOR-POS-020<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-020<br>AMS006-TAMBAH-JADWAL-VENDOR-STR-004 |
| Tambah Jadwal | 26 | AMS006-TAMBAH-JADWAL-VENDOR-POS-004<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-011<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-012<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-013<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-014<br>… |
| Alert Aksi Terlarang | lintas scenario Detail Jadwal | AMS006-TAMBAH-JADWAL-VENDOR-NEG-005<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-023<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-024<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-025<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-026 |
| Kontrol multi-baris Direct/Connecting | lintas scenario Tambah Jadwal | AMS006-TAMBAH-JADWAL-VENDOR-EDG-005<br>AMS006-TAMBAH-JADWAL-VENDOR-POS-014<br>AMS006-TAMBAH-JADWAL-VENDOR-NEG-029 |

## Gap dan Discrepancy

Tidak ada gap coverage terhadap REQ-001–REQ-022 atau elemen UI penting dalam cakupan tambah jadwal vendor. Hal berikut tetap merupakan gap spesifikasi/desain dan diuji berdasarkan asumsi yang terdokumentasi:

- Teks persis alert duplikasi tidak tersedia; assertion menggunakan makna duplikasi kombinasi kapal, voyage, ETD, dan ETA.
- Teks persis alert status `Tidak Berlaku` tidak tersedia; assertion menggunakan pesan semantik.
- Import Connecting tidak dicakup karena spesifikasi hanya menyebut `Template Jadwal Kapal Direct`.
- Tidak ada SLA performa; scenario stress memverifikasi konsistensi dan tidak timeout tanpa menetapkan ambang milidetik.
- Mockup menampilkan No. Lelang/Pelayaran seperti combobox, Open Stack wajib pada Edit, dan alert `Tidak Dapat Edit Harga`; scenario mengikuti aturan bisnis tertulis (field terkunci, Open Stack opsional, dan alert jadwal).

Rekomendasi setelah produk mengklarifikasi gap tersebut: tambahkan assertion salinan pesan persis, template Connecting bila didukung, dan ambang performa terukur.

## Hasil Review

- Validasi struktural Gherkin: **lulus**. Semua 62 scenario memiliki Given/When/Then, tag kategori, prioritas, REQ, dan screen dengan format yang benar.
- Konsistensi feature ↔ JSON: **lulus**. Seluruh ID, judul, kategori, prioritas, requirement, dan screen cocok satu-per-satu.
- Validasi JSON: **lulus**. Semua action berada pada enum yang diizinkan; summary sama dengan hitungan aktual.
- Coverage requirement: **lulus**. Semua 22 REQ memiliki ≥1 positive dan ≥1 negative.
- Coverage UI: **lulus**. Navigasi card, tab, radio Direct/Connecting, form utama/transit, dynamic rows, import/template, filter/sort/pagination, modal detail/edit, alert, konfirmasi, toast, riwayat, dan tampilan shipper tersentuh.
- Dedup: tidak ada ID atau judul identik. Tidak ada scenario dibuang; kemiripan pada REQ-005 dan REQ-013 dipertahankan karena masing-masing menguji kondisi blokir atau batas validasi yang berbeda.

