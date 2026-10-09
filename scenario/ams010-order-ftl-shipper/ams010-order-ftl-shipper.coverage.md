# Coverage — ams010-order-ftl-shipper

Review terhadap artefak di disk memakai parser Gherkin resmi (`gherkin-official`) dan pemeriksaan schema/relasi JSON. Ini validasi dokumen skenario; aplikasi OMS, Playwright, beban dan pengiriman notifikasi belum dijalankan.

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| positive | 57 |
| negative | 55 |
| edge | 24 |
| stress | 13 |
| **Total** | **149** |

- Requirements: **36/36** mempunyai minimal satu positive dan satu negative.
- Layar: **15/15** tercakup.
- Elemen UI inventory: **164/164** direferensikan langkah/assertion; beberapa elemen sengaja diuji tidak ada/disabled/read-only.
- Input: satu spec, **11 PNG** telah dibaca, extras kosong.
- Tidak ditemukan duplikat kontrak exact. Variasi nilai batas, aktor, titik/unit, state dan skala beban dipertahankan karena oracle atau pemicunya berbeda.

## Requirements Traceability Matrix

| REQ | Deskripsi | Positive / Negative / Edge / Stress | Scenario IDs |
|---|---|---|---|
| REQ-001 | FTL memiliki dua jalur: Pesan dari Detail Harga Penawaran memakai wizard berbasis lelang; Buat Order dari menu Order memakai alur eksisting. | 3 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-001`, `AMS010-ORDER-FTL-SHIPPER-NEG-001`, `AMS010-ORDER-FTL-SHIPPER-POS-037`, `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| REQ-002 | LTL/LCL dan seluruh order tanpa lelang tetap mengikuti tampilan, validasi, dan alur eksisting. | 2 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-002`, `AMS010-ORDER-FTL-SHIPPER-NEG-002`, `AMS010-ORDER-FTL-SHIPPER-POS-038` |
| REQ-003 | Setiap transaksi Pesan pada penawaran menghasilkan satu order; lelang boleh menghasilkan banyak order selama belum melewati Rencana Akhir Kirim. | 1 / 1 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-003`, `AMS010-ORDER-FTL-SHIPPER-NEG-003`, `AMS010-ORDER-FTL-SHIPPER-EDG-004`, `AMS010-ORDER-FTL-SHIPPER-STR-001` |
| REQ-004 | Daftar Order shipper/vendor menampilkan No. Lelang di bawah ID Order hanya untuk order dari lelang. | 3 / 2 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-004`, `AMS010-ORDER-FTL-SHIPPER-NEG-004`, `AMS010-ORDER-FTL-SHIPPER-POS-039`, `AMS010-ORDER-FTL-SHIPPER-POS-055`, `AMS010-ORDER-FTL-SHIPPER-NEG-055` |
| REQ-005 | Filter mengikuti desain; action eksisting tetap tersedia sesuai status/role; status tambahan Menunggu Konfirmasi dan Ditolak, sedangkan terima menghasilkan Menunggu Penugasan. | 5 / 1 / 0 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-005`, `AMS010-ORDER-FTL-SHIPPER-NEG-005`, `AMS010-ORDER-FTL-SHIPPER-POS-044`, `AMS010-ORDER-FTL-SHIPPER-POS-045`, `AMS010-ORDER-FTL-SHIPPER-POS-046`, `AMS010-ORDER-FTL-SHIPPER-POS-047`, `AMS010-ORDER-FTL-SHIPPER-STR-006` |
| REQ-006 | Wizard Buat Order memiliki Data Pengiriman, Data Barang, Vendor dan Harga, Review; Selanjutnya memvalidasi required pada step aktif. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-006`, `AMS010-ORDER-FTL-SHIPPER-NEG-006` |
| REQ-007 | Simpan ke Draf memerlukan minimal satu field terisi; draft menyimpan data dan step terakhir untuk dilanjutkan. | 1 / 1 / 2 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-007`, `AMS010-ORDER-FTL-SHIPPER-NEG-007`, `AMS010-ORDER-FTL-SHIPPER-EDG-005`, `AMS010-ORDER-FTL-SHIPPER-EDG-006`, `AMS010-ORDER-FTL-SHIPPER-STR-002` |
| REQ-008 | Sebelumnya kembali satu step tanpa menghilangkan data maupun progres step terakhir yang telah diisi. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-008`, `AMS010-ORDER-FTL-SHIPPER-NEG-008` |
| REQ-009 | Batal membuka konfirmasi; konfirmasi pembatalan menuju Daftar Order; membatalkan dialog tetap pada wizard. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-009`, `AMS010-ORDER-FTL-SHIPPER-NEG-009` |
| REQ-010 | PIC Pengirim, No. WhatsApp PIC Pengirim, PIC Penerima, No. WhatsApp PIC Penerima wajib dan editable; Catatan Pengirim/Penerima opsional dan editable, berlaku di setiap titik. | 2 / 3 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-010`, `AMS010-ORDER-FTL-SHIPPER-NEG-010`, `AMS010-ORDER-FTL-SHIPPER-NEG-037`, `AMS010-ORDER-FTL-SHIPPER-NEG-038`, `AMS010-ORDER-FTL-SHIPPER-POS-040`, `AMS010-ORDER-FTL-SHIPPER-EDG-010`, `AMS010-ORDER-FTL-SHIPPER-STR-007` |
| REQ-011 | Multipickup/Multidrop/Multipoint menampilkan setiap titik dalam card pengirim/penerima dengan Muat (n)/Bongkar (n) sesuai rute. | 1 / 1 / 1 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-011`, `AMS010-ORDER-FTL-SHIPPER-NEG-011`, `AMS010-ORDER-FTL-SHIPPER-EDG-011` |
| REQ-012 | No. Lelang, Jenis Pengiriman, Jenis Armada, Tipe Pengiriman dan data rute/pengirim/penerima dari lelang ditampilkan read-only, kecuali data PIC dan catatan. | 2 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-012`, `AMS010-ORDER-FTL-SHIPPER-NEG-012`, `AMS010-ORDER-FTL-SHIPPER-POS-049` |
| REQ-013 | Jenis Armada pada Step 02 read-only; Jumlah Armada default 1, editable minimal 1; jumlah card unit mengikuti nilai tersebut. | 1 / 4 / 2 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-013`, `AMS010-ORDER-FTL-SHIPPER-NEG-013`, `AMS010-ORDER-FTL-SHIPPER-NEG-039`, `AMS010-ORDER-FTL-SHIPPER-NEG-040`, `AMS010-ORDER-FTL-SHIPPER-NEG-041`, `AMS010-ORDER-FTL-SHIPPER-EDG-007`, `AMS010-ORDER-FTL-SHIPPER-EDG-008`, `AMS010-ORDER-FTL-SHIPPER-STR-003` |
| REQ-014 | Nomor DO tidak wajib, mendukung multi tag; Pilih Barang mengambil barang dari master ke tabel unit terkait. | 2 / 1 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-014`, `AMS010-ORDER-FTL-SHIPPER-NEG-014`, `AMS010-ORDER-FTL-SHIPPER-POS-041`, `AMS010-ORDER-FTL-SHIPPER-EDG-009`, `AMS010-ORDER-FTL-SHIPPER-STR-004` |
| REQ-015 | Tiap baris barang memerlukan Jumlah; setiap unit harus memiliki barang dengan jumlah terisi sebelum Selanjutnya. | 1 / 3 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-015`, `AMS010-ORDER-FTL-SHIPPER-NEG-015`, `AMS010-ORDER-FTL-SHIPPER-NEG-042`, `AMS010-ORDER-FTL-SHIPPER-NEG-043` |
| REQ-016 | Nilai Barang wajib hanya ketika lelang menggunakan asuransi; tanpa asuransi nilai barang boleh kosong. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-016`, `AMS010-ORDER-FTL-SHIPPER-NEG-016` |
| REQ-017 | Total Kubikasi/Berat dihitung dari barang dan jumlah; batas kapasitas armada memicu alert sesuai kondisi eksisting. | 1 / 2 / 3 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-017`, `AMS010-ORDER-FTL-SHIPPER-NEG-017`, `AMS010-ORDER-FTL-SHIPPER-NEG-044`, `AMS010-ORDER-FTL-SHIPPER-EDG-012`, `AMS010-ORDER-FTL-SHIPPER-EDG-013`, `AMS010-ORDER-FTL-SHIPPER-EDG-014`, `AMS010-ORDER-FTL-SHIPPER-STR-005` |
| REQ-018 | Tanggal Permintaan Muat wajib datetime, tidak sebelum waktu saat ini, tidak setelah Rencana Akhir Kirim; perbandingan dilakukan dalam WIB. | 1 / 4 / 3 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-018`, `AMS010-ORDER-FTL-SHIPPER-NEG-018`, `AMS010-ORDER-FTL-SHIPPER-NEG-045`, `AMS010-ORDER-FTL-SHIPPER-NEG-046`, `AMS010-ORDER-FTL-SHIPPER-NEG-047`, `AMS010-ORDER-FTL-SHIPPER-EDG-001`, `AMS010-ORDER-FTL-SHIPPER-EDG-002`, `AMS010-ORDER-FTL-SHIPPER-EDG-003` |
| REQ-019 | Vendor, drop point, jenis/jumlah armada, Harga Satuan mengikuti penawaran terpilih dan data Step 02, serta read-only pada Step 03. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-019`, `AMS010-ORDER-FTL-SHIPPER-NEG-019` |
| REQ-020 | Untuk Multipickup/Multidrop/Multipoint tersedia textlink yang membuka popup detail seluruh drop point. | 3 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-020`, `AMS010-ORDER-FTL-SHIPPER-NEG-020`, `AMS010-ORDER-FTL-SHIPPER-POS-042`, `AMS010-ORDER-FTL-SHIPPER-POS-043` |
| REQ-021 | Ringkasan tiap unit berupa Total Berat, Total Kubikasi, Total Nilai Barang dihitung dari Step 02 dan diperbarui setelah perubahan. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-021`, `AMS010-ORDER-FTL-SHIPPER-NEG-021` |
| REQ-022 | Harga DPP = Harga Satuan × Jumlah Armada; Total Harga = DPP + PPN − PPh + Asuransi; PPN/PPh mengikuti vendor dan tidak dapat diubah. | 1 / 1 / 1 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-022`, `AMS010-ORDER-FTL-SHIPPER-NEG-022`, `AMS010-ORDER-FTL-SHIPPER-EDG-015` |
| REQ-023 | Asuransi dihitung dari Total Nilai Barang pada order dengan tarif lelang/master; mengikuti perubahan nilai barang. | 1 / 1 / 1 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-023`, `AMS010-ORDER-FTL-SHIPPER-NEG-023`, `AMS010-ORDER-FTL-SHIPPER-EDG-016` |
| REQ-024 | FTL tidak memiliki input jadwal, data jadwal maupun checkbox Batas Toleransi Jadwal pada harga, konfirmasi, pilih penawaran lain, dan penugasan. Tanggal Permintaan Muat tetap wajib. | 1 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-024`, `AMS010-ORDER-FTL-SHIPPER-NEG-024` |
| REQ-025 | Review menampilkan seluruh data order read-only dan konsisten dengan data wizard. | 2 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-025`, `AMS010-ORDER-FTL-SHIPPER-NEG-025`, `AMS010-ORDER-FTL-SHIPPER-POS-050` |
| REQ-026 | Simpan dari Review membentuk order Menunggu Konfirmasi dan memberikan notifikasi order baru kepada vendor terpilih. | 2 / 1 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-026`, `AMS010-ORDER-FTL-SHIPPER-NEG-026`, `AMS010-ORDER-FTL-SHIPPER-EDG-023`, `AMS010-ORDER-FTL-SHIPPER-STR-009`, `AMS010-ORDER-FTL-SHIPPER-POS-056` |
| REQ-027 | Konfirmasi Order hanya tersedia bagi vendor terkait dan order Menunggu Konfirmasi melalui action Daftar Order. | 1 / 4 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-027`, `AMS010-ORDER-FTL-SHIPPER-NEG-027`, `AMS010-ORDER-FTL-SHIPPER-NEG-048`, `AMS010-ORDER-FTL-SHIPPER-NEG-049`, `AMS010-ORDER-FTL-SHIPPER-NEG-050` |
| REQ-028 | Popup konfirmasi menampilkan ringkasan read-only, radio Terima Order/Tolak Order; Simpan disabled sebelum ada pilihan. | 2 / 1 / 2 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-028`, `AMS010-ORDER-FTL-SHIPPER-NEG-028`, `AMS010-ORDER-FTL-SHIPPER-POS-051`, `AMS010-ORDER-FTL-SHIPPER-EDG-017`, `AMS010-ORDER-FTL-SHIPPER-EDG-018` |
| REQ-029 | Terima Order tanpa form tambahan/jadwal; Simpan memindahkan status ke Menunggu Penugasan. | 1 / 1 / 0 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-029`, `AMS010-ORDER-FTL-SHIPPER-NEG-029`, `AMS010-ORDER-FTL-SHIPPER-STR-008` |
| REQ-030 | Tolak Order menampilkan textarea Alasan Penolakan wajib; Simpan yang valid memindahkan status ke Ditolak. | 1 / 2 / 1 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-030`, `AMS010-ORDER-FTL-SHIPPER-NEG-030`, `AMS010-ORDER-FTL-SHIPPER-NEG-051`, `AMS010-ORDER-FTL-SHIPPER-EDG-019` |
| REQ-031 | Order Ditolak tetap terlihat pada list vendor; shipper tetap melihatnya sampai memilih dan menyimpan penawaran lain, kemudian rekaman penolakan tampil di Riwayat Order Tidak Aktif. | 1 / 1 / 0 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-031`, `AMS010-ORDER-FTL-SHIPPER-NEG-031`, `AMS010-ORDER-FTL-SHIPPER-STR-013` |
| REQ-032 | Shipper dapat membuka Pilih Penawaran Lain dari order Ditolak; hanya penawaran lelang terkait selain yang sudah dipilih sebelumnya, dengan tombol Pilih. | 1 / 2 / 2 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-032`, `AMS010-ORDER-FTL-SHIPPER-NEG-032`, `AMS010-ORDER-FTL-SHIPPER-NEG-052`, `AMS010-ORDER-FTL-SHIPPER-EDG-020`, `AMS010-ORDER-FTL-SHIPPER-EDG-021`, `AMS010-ORDER-FTL-SHIPPER-STR-011` |
| REQ-033 | Pilih Penawaran Lain mempunyai Memilih Penawaran dan Review; review menunjukkan perubahan vendor/harga, tanpa jadwal FTL. | 2 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-033`, `AMS010-ORDER-FTL-SHIPPER-NEG-033`, `AMS010-ORDER-FTL-SHIPPER-POS-052` |
| REQ-034 | Simpan penggantian penawaran memperbarui order menjadi Menunggu Konfirmasi dan mengirim notifikasi kepada vendor baru. | 1 / 1 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-034`, `AMS010-ORDER-FTL-SHIPPER-NEG-034`, `AMS010-ORDER-FTL-SHIPPER-EDG-022`, `AMS010-ORDER-FTL-SHIPPER-STR-010` |
| REQ-035 | Penugasan vendor setelah penerimaan tetap mengikuti pemilihan order, armada, sopir, mode dan validasi eksisting FTL tanpa section/input jadwal. | 3 / 3 / 1 / 1 | `AMS010-ORDER-FTL-SHIPPER-POS-035`, `AMS010-ORDER-FTL-SHIPPER-NEG-035`, `AMS010-ORDER-FTL-SHIPPER-NEG-053`, `AMS010-ORDER-FTL-SHIPPER-NEG-054`, `AMS010-ORDER-FTL-SHIPPER-POS-053`, `AMS010-ORDER-FTL-SHIPPER-EDG-024`, `AMS010-ORDER-FTL-SHIPPER-STR-012`, `AMS010-ORDER-FTL-SHIPPER-POS-057` |
| REQ-036 | Detail Penugasan menampilkan No. Lelang di Detail Data Order untuk order dari lelang; order tanpa lelang tetap eksisting. | 2 / 1 / 0 / 0 | `AMS010-ORDER-FTL-SHIPPER-POS-036`, `AMS010-ORDER-FTL-SHIPPER-NEG-036`, `AMS010-ORDER-FTL-SHIPPER-POS-054` |

## Cakupan layar dan elemen UI

| Layar | Scenario IDs yang berawal di layar | Elemen inventory tersentuh |
|---|---|---|
| daftar-order | `AMS010-ORDER-FTL-SHIPPER-POS-002`, `AMS010-ORDER-FTL-SHIPPER-POS-004`, `AMS010-ORDER-FTL-SHIPPER-NEG-004`, `AMS010-ORDER-FTL-SHIPPER-POS-005`, `AMS010-ORDER-FTL-SHIPPER-NEG-005`, `AMS010-ORDER-FTL-SHIPPER-POS-027`, `AMS010-ORDER-FTL-SHIPPER-NEG-027`, `AMS010-ORDER-FTL-SHIPPER-NEG-031`, `AMS010-ORDER-FTL-SHIPPER-NEG-032`, `AMS010-ORDER-FTL-SHIPPER-POS-037`, `AMS010-ORDER-FTL-SHIPPER-POS-038`, `AMS010-ORDER-FTL-SHIPPER-POS-039`, `AMS010-ORDER-FTL-SHIPPER-NEG-048`, `AMS010-ORDER-FTL-SHIPPER-NEG-050`, `AMS010-ORDER-FTL-SHIPPER-NEG-052`, `AMS010-ORDER-FTL-SHIPPER-POS-044`, `AMS010-ORDER-FTL-SHIPPER-POS-045`, `AMS010-ORDER-FTL-SHIPPER-POS-046`, `AMS010-ORDER-FTL-SHIPPER-POS-047`, `AMS010-ORDER-FTL-SHIPPER-STR-006`, `AMS010-ORDER-FTL-SHIPPER-STR-013` | 41/41 |
| detail-harga-penawaran | `AMS010-ORDER-FTL-SHIPPER-POS-001`, `AMS010-ORDER-FTL-SHIPPER-NEG-001`, `AMS010-ORDER-FTL-SHIPPER-NEG-003`, `AMS010-ORDER-FTL-SHIPPER-POS-048`, `AMS010-ORDER-FTL-SHIPPER-POS-056` | 20/20 |
| data-pengiriman | `AMS010-ORDER-FTL-SHIPPER-NEG-002`, `AMS010-ORDER-FTL-SHIPPER-POS-006`, `AMS010-ORDER-FTL-SHIPPER-NEG-006`, `AMS010-ORDER-FTL-SHIPPER-NEG-007`, `AMS010-ORDER-FTL-SHIPPER-POS-010`, `AMS010-ORDER-FTL-SHIPPER-NEG-010`, `AMS010-ORDER-FTL-SHIPPER-POS-011`, `AMS010-ORDER-FTL-SHIPPER-NEG-011`, `AMS010-ORDER-FTL-SHIPPER-POS-012`, `AMS010-ORDER-FTL-SHIPPER-NEG-012`, `AMS010-ORDER-FTL-SHIPPER-NEG-037`, `AMS010-ORDER-FTL-SHIPPER-NEG-038`, `AMS010-ORDER-FTL-SHIPPER-POS-040`, `AMS010-ORDER-FTL-SHIPPER-POS-049`, `AMS010-ORDER-FTL-SHIPPER-EDG-005`, `AMS010-ORDER-FTL-SHIPPER-EDG-010`, `AMS010-ORDER-FTL-SHIPPER-EDG-011`, `AMS010-ORDER-FTL-SHIPPER-STR-007` | 15/15 |
| data-barang | `AMS010-ORDER-FTL-SHIPPER-POS-007`, `AMS010-ORDER-FTL-SHIPPER-POS-008`, `AMS010-ORDER-FTL-SHIPPER-POS-013`, `AMS010-ORDER-FTL-SHIPPER-NEG-013`, `AMS010-ORDER-FTL-SHIPPER-POS-015`, `AMS010-ORDER-FTL-SHIPPER-NEG-015`, `AMS010-ORDER-FTL-SHIPPER-POS-016`, `AMS010-ORDER-FTL-SHIPPER-NEG-016`, `AMS010-ORDER-FTL-SHIPPER-POS-017`, `AMS010-ORDER-FTL-SHIPPER-NEG-017`, `AMS010-ORDER-FTL-SHIPPER-NEG-039`, `AMS010-ORDER-FTL-SHIPPER-NEG-040`, `AMS010-ORDER-FTL-SHIPPER-NEG-041`, `AMS010-ORDER-FTL-SHIPPER-POS-041`, `AMS010-ORDER-FTL-SHIPPER-NEG-042`, `AMS010-ORDER-FTL-SHIPPER-NEG-043`, `AMS010-ORDER-FTL-SHIPPER-NEG-044`, `AMS010-ORDER-FTL-SHIPPER-EDG-007`, `AMS010-ORDER-FTL-SHIPPER-EDG-008`, `AMS010-ORDER-FTL-SHIPPER-EDG-009`, `AMS010-ORDER-FTL-SHIPPER-EDG-012`, `AMS010-ORDER-FTL-SHIPPER-EDG-013`, `AMS010-ORDER-FTL-SHIPPER-EDG-014`, `AMS010-ORDER-FTL-SHIPPER-STR-002`, `AMS010-ORDER-FTL-SHIPPER-STR-003`, `AMS010-ORDER-FTL-SHIPPER-STR-004`, `AMS010-ORDER-FTL-SHIPPER-STR-005` | 17/17 |
| pilih-barang | `AMS010-ORDER-FTL-SHIPPER-POS-014`, `AMS010-ORDER-FTL-SHIPPER-NEG-014` | 4/4 |
| vendor-dan-harga | `AMS010-ORDER-FTL-SHIPPER-NEG-008`, `AMS010-ORDER-FTL-SHIPPER-POS-018`, `AMS010-ORDER-FTL-SHIPPER-NEG-018`, `AMS010-ORDER-FTL-SHIPPER-POS-019`, `AMS010-ORDER-FTL-SHIPPER-NEG-019`, `AMS010-ORDER-FTL-SHIPPER-NEG-020`, `AMS010-ORDER-FTL-SHIPPER-POS-021`, `AMS010-ORDER-FTL-SHIPPER-NEG-021`, `AMS010-ORDER-FTL-SHIPPER-POS-022`, `AMS010-ORDER-FTL-SHIPPER-NEG-022`, `AMS010-ORDER-FTL-SHIPPER-POS-023`, `AMS010-ORDER-FTL-SHIPPER-NEG-023`, `AMS010-ORDER-FTL-SHIPPER-POS-024`, `AMS010-ORDER-FTL-SHIPPER-NEG-045`, `AMS010-ORDER-FTL-SHIPPER-NEG-046`, `AMS010-ORDER-FTL-SHIPPER-NEG-047`, `AMS010-ORDER-FTL-SHIPPER-POS-042`, `AMS010-ORDER-FTL-SHIPPER-POS-043`, `AMS010-ORDER-FTL-SHIPPER-EDG-001`, `AMS010-ORDER-FTL-SHIPPER-EDG-002`, `AMS010-ORDER-FTL-SHIPPER-EDG-003`, `AMS010-ORDER-FTL-SHIPPER-EDG-015`, `AMS010-ORDER-FTL-SHIPPER-EDG-016` | 12/12 |
| detail-drop-point | `AMS010-ORDER-FTL-SHIPPER-POS-020` | 3/3 |
| review | `AMS010-ORDER-FTL-SHIPPER-POS-003`, `AMS010-ORDER-FTL-SHIPPER-POS-025`, `AMS010-ORDER-FTL-SHIPPER-NEG-025`, `AMS010-ORDER-FTL-SHIPPER-POS-026`, `AMS010-ORDER-FTL-SHIPPER-NEG-026`, `AMS010-ORDER-FTL-SHIPPER-POS-050`, `AMS010-ORDER-FTL-SHIPPER-EDG-004`, `AMS010-ORDER-FTL-SHIPPER-EDG-006`, `AMS010-ORDER-FTL-SHIPPER-EDG-023`, `AMS010-ORDER-FTL-SHIPPER-STR-001`, `AMS010-ORDER-FTL-SHIPPER-STR-009` | 7/7 |
| detail-order | `AMS010-ORDER-FTL-SHIPPER-POS-055`, `AMS010-ORDER-FTL-SHIPPER-NEG-055` | 4/4 |
| konfirmasi-batal | `AMS010-ORDER-FTL-SHIPPER-POS-009`, `AMS010-ORDER-FTL-SHIPPER-NEG-009` | 3/3 |
| konfirmasi-order | `AMS010-ORDER-FTL-SHIPPER-NEG-024`, `AMS010-ORDER-FTL-SHIPPER-POS-028`, `AMS010-ORDER-FTL-SHIPPER-NEG-028`, `AMS010-ORDER-FTL-SHIPPER-POS-029`, `AMS010-ORDER-FTL-SHIPPER-NEG-029`, `AMS010-ORDER-FTL-SHIPPER-POS-030`, `AMS010-ORDER-FTL-SHIPPER-NEG-030`, `AMS010-ORDER-FTL-SHIPPER-NEG-049`, `AMS010-ORDER-FTL-SHIPPER-NEG-051`, `AMS010-ORDER-FTL-SHIPPER-POS-051`, `AMS010-ORDER-FTL-SHIPPER-EDG-017`, `AMS010-ORDER-FTL-SHIPPER-EDG-018`, `AMS010-ORDER-FTL-SHIPPER-EDG-019`, `AMS010-ORDER-FTL-SHIPPER-STR-008` | 7/7 |
| pilih-penawaran-lain | `AMS010-ORDER-FTL-SHIPPER-POS-032`, `AMS010-ORDER-FTL-SHIPPER-POS-033`, `AMS010-ORDER-FTL-SHIPPER-NEG-033`, `AMS010-ORDER-FTL-SHIPPER-POS-034`, `AMS010-ORDER-FTL-SHIPPER-NEG-034`, `AMS010-ORDER-FTL-SHIPPER-POS-052`, `AMS010-ORDER-FTL-SHIPPER-EDG-020`, `AMS010-ORDER-FTL-SHIPPER-EDG-021`, `AMS010-ORDER-FTL-SHIPPER-EDG-022`, `AMS010-ORDER-FTL-SHIPPER-STR-010`, `AMS010-ORDER-FTL-SHIPPER-STR-011` | 7/7 |
| riwayat-order-tidak-aktif | `AMS010-ORDER-FTL-SHIPPER-POS-031` | 2/2 |
| tambah-penugasan | `AMS010-ORDER-FTL-SHIPPER-POS-035`, `AMS010-ORDER-FTL-SHIPPER-NEG-035`, `AMS010-ORDER-FTL-SHIPPER-NEG-053`, `AMS010-ORDER-FTL-SHIPPER-NEG-054`, `AMS010-ORDER-FTL-SHIPPER-POS-053`, `AMS010-ORDER-FTL-SHIPPER-EDG-024`, `AMS010-ORDER-FTL-SHIPPER-STR-012`, `AMS010-ORDER-FTL-SHIPPER-POS-057` | 14/14 |
| detail-penugasan | `AMS010-ORDER-FTL-SHIPPER-POS-036`, `AMS010-ORDER-FTL-SHIPPER-NEG-036`, `AMS010-ORDER-FTL-SHIPPER-POS-054` | 8/8 |

Pemetaan rinci berikut memastikan tiap elemen memiliki skenario rujukan; satu rujukan ditampilkan agar tabel tetap ringkas. Layar asal skenario dapat berbeda ketika skenario menavigasi beberapa layar.

| Elemen / testid usulan | Scenario ID contoh |
|---|---|
| order-menu | `AMS010-ORDER-FTL-SHIPPER-POS-056` |
| buat-order | `AMS010-ORDER-FTL-SHIPPER-POS-002` |
| batch-order | `AMS010-ORDER-FTL-SHIPPER-POS-047` |
| riwayat-pembatalan | `AMS010-ORDER-FTL-SHIPPER-POS-047` |
| filter | `AMS010-ORDER-FTL-SHIPPER-POS-005` |
| filter-lelang | `AMS010-ORDER-FTL-SHIPPER-POS-005` |
| filter-order | `AMS010-ORDER-FTL-SHIPPER-NEG-005` |
| filter-jenis | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-vendor | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-asal | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-tujuan | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-tipe | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-metode | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-buat | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-muat | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-pengirim | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-penerima | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-drop-asal | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-drop-tujuan | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| filter-status | `AMS010-ORDER-FTL-SHIPPER-POS-005` |
| reset | `AMS010-ORDER-FTL-SHIPPER-POS-044` |
| terapkan | `AMS010-ORDER-FTL-SHIPPER-POS-005` |
| tabel-order | `AMS010-ORDER-FTL-SHIPPER-POS-003` |
| id-order | `AMS010-ORDER-FTL-SHIPPER-POS-004` |
| no-lelang | `AMS010-ORDER-FTL-SHIPPER-POS-004` |
| copy-order | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| copy-lelang | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| sort-vendor | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| sort-harga | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| status-order | `AMS010-ORDER-FTL-SHIPPER-POS-003` |
| rute-order | `AMS010-ORDER-FTL-SHIPPER-POS-004` |
| action-order | `AMS010-ORDER-FTL-SHIPPER-POS-007` |
| page-size | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| page-next | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| page-prev | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| page-first | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| page-last | `AMS010-ORDER-FTL-SHIPPER-POS-045` |
| detail-order-action | `AMS010-ORDER-FTL-SHIPPER-POS-046` |
| konfirmasi-action | `AMS010-ORDER-FTL-SHIPPER-POS-027` |
| ganti-action | `AMS010-ORDER-FTL-SHIPPER-NEG-031` |
| lanjut-draft | `AMS010-ORDER-FTL-SHIPPER-POS-007` |
| lelang-heading | `AMS010-ORDER-FTL-SHIPPER-POS-056` |
| pesan | `AMS010-ORDER-FTL-SHIPPER-POS-001` |
| tidak-berlaku | `AMS010-ORDER-FTL-SHIPPER-NEG-001` |
| syarat | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| detail-biaya | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| detail-armada | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| detail-vendor | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| profil-vendor | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-filter | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| urutkan | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| ajukan-nego | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| lelang-ulang | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-vendor | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-armada | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-waktu | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-reset | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-terapkan | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| dokumen | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-page-size | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| offer-page-next | `AMS010-ORDER-FTL-SHIPPER-POS-048` |
| wizard | `AMS010-ORDER-FTL-SHIPPER-POS-001` |
| shipping-section | `AMS010-ORDER-FTL-SHIPPER-POS-049` |
| shipping-readonly | `AMS010-ORDER-FTL-SHIPPER-POS-001` |
| sender-section | `AMS010-ORDER-FTL-SHIPPER-POS-012` |
| receiver-section | `AMS010-ORDER-FTL-SHIPPER-POS-012` |
| pic-pengirim | `AMS010-ORDER-FTL-SHIPPER-NEG-006` |
| wa-pengirim | `AMS010-ORDER-FTL-SHIPPER-POS-010` |
| catatan-pengirim | `AMS010-ORDER-FTL-SHIPPER-NEG-009` |
| pic-penerima | `AMS010-ORDER-FTL-SHIPPER-POS-010` |
| wa-penerima | `AMS010-ORDER-FTL-SHIPPER-POS-010` |
| catatan-penerima | `AMS010-ORDER-FTL-SHIPPER-POS-010` |
| route-cards | `AMS010-ORDER-FTL-SHIPPER-POS-011` |
| batal | `AMS010-ORDER-FTL-SHIPPER-POS-049` |
| draft | `AMS010-ORDER-FTL-SHIPPER-POS-007` |
| next | `AMS010-ORDER-FTL-SHIPPER-NEG-002` |
| jenis-armada | `AMS010-ORDER-FTL-SHIPPER-POS-013` |
| jumlah-armada | `AMS010-ORDER-FTL-SHIPPER-POS-013` |
| unit-cards | `AMS010-ORDER-FTL-SHIPPER-POS-006` |
| nomor-do | `AMS010-ORDER-FTL-SHIPPER-POS-007` |
| hapus-do | `AMS010-ORDER-FTL-SHIPPER-POS-041` |
| pilih-barang | `AMS010-ORDER-FTL-SHIPPER-STR-005` |
| tabel-barang | `AMS010-ORDER-FTL-SHIPPER-POS-014` |
| jumlah-barang | `AMS010-ORDER-FTL-SHIPPER-POS-007` |
| nilai-barang | `AMS010-ORDER-FTL-SHIPPER-POS-016` |
| hapus-barang | `AMS010-ORDER-FTL-SHIPPER-NEG-043` |
| total-kubikasi | `AMS010-ORDER-FTL-SHIPPER-POS-017` |
| total-berat | `AMS010-ORDER-FTL-SHIPPER-POS-017` |
| error-nilai | `AMS010-ORDER-FTL-SHIPPER-NEG-016` |
| alert-kubikasi | `AMS010-ORDER-FTL-SHIPPER-POS-017` |
| alert-berat | `AMS010-ORDER-FTL-SHIPPER-NEG-017` |
| empty-barang | `AMS010-ORDER-FTL-SHIPPER-NEG-014` |
| previous | `AMS010-ORDER-FTL-SHIPPER-POS-008` |
| master-barang | `AMS010-ORDER-FTL-SHIPPER-POS-056` |
| sku | `AMS010-ORDER-FTL-SHIPPER-POS-014` |
| gunakan-barang | `AMS010-ORDER-FTL-SHIPPER-POS-014` |
| close-master | `AMS010-ORDER-FTL-SHIPPER-NEG-014` |
| tanggal-muat | `AMS010-ORDER-FTL-SHIPPER-POS-006` |
| vendor-readonly | `AMS010-ORDER-FTL-SHIPPER-POS-019` |
| waktu-perjalanan | `AMS010-ORDER-FTL-SHIPPER-POS-019` |
| detail-drop | `AMS010-ORDER-FTL-SHIPPER-NEG-020` |
| ringkasan-unit | `AMS010-ORDER-FTL-SHIPPER-POS-015` |
| harga-dpp | `AMS010-ORDER-FTL-SHIPPER-POS-022` |
| ppn | `AMS010-ORDER-FTL-SHIPPER-POS-022` |
| pph | `AMS010-ORDER-FTL-SHIPPER-POS-022` |
| asuransi | `AMS010-ORDER-FTL-SHIPPER-POS-016` |
| total-harga | `AMS010-ORDER-FTL-SHIPPER-POS-022` |
| batas-toleransi | `AMS010-ORDER-FTL-SHIPPER-POS-024` |
| jadwal | `AMS010-ORDER-FTL-SHIPPER-POS-024` |
| drop-dialog | `AMS010-ORDER-FTL-SHIPPER-POS-020` |
| drop-content | `AMS010-ORDER-FTL-SHIPPER-POS-020` |
| drop-close | `AMS010-ORDER-FTL-SHIPPER-POS-042` |
| review-shipping | `AMS010-ORDER-FTL-SHIPPER-POS-025` |
| review-sender | `AMS010-ORDER-FTL-SHIPPER-POS-025` |
| review-receiver | `AMS010-ORDER-FTL-SHIPPER-POS-025` |
| review-goods | `AMS010-ORDER-FTL-SHIPPER-POS-025` |
| review-price | `AMS010-ORDER-FTL-SHIPPER-POS-025` |
| review-data | `AMS010-ORDER-FTL-SHIPPER-POS-006` |
| simpan | `AMS010-ORDER-FTL-SHIPPER-POS-003` |
| detail-order | `AMS010-ORDER-FTL-SHIPPER-POS-046` |
| detail-order-data | `AMS010-ORDER-FTL-SHIPPER-POS-046` |
| batalkan-order | `AMS010-ORDER-FTL-SHIPPER-POS-046` |
| edit-order | `AMS010-ORDER-FTL-SHIPPER-POS-046` |
| cancel-dialog | `AMS010-ORDER-FTL-SHIPPER-POS-009` |
| cancel-yes | `AMS010-ORDER-FTL-SHIPPER-POS-009` |
| cancel-no | `AMS010-ORDER-FTL-SHIPPER-NEG-009` |
| confirmation-dialog | `AMS010-ORDER-FTL-SHIPPER-POS-027` |
| confirmation-data | `AMS010-ORDER-FTL-SHIPPER-POS-028` |
| terima | `AMS010-ORDER-FTL-SHIPPER-NEG-024` |
| tolak | `AMS010-ORDER-FTL-SHIPPER-POS-028` |
| alasan | `AMS010-ORDER-FTL-SHIPPER-POS-029` |
| confirmation-save | `AMS010-ORDER-FTL-SHIPPER-NEG-024` |
| confirmation-close | `AMS010-ORDER-FTL-SHIPPER-POS-051` |
| replacement-wizard | `AMS010-ORDER-FTL-SHIPPER-POS-033` |
| replacement-offers | `AMS010-ORDER-FTL-SHIPPER-POS-032` |
| pilih-penawaran | `AMS010-ORDER-FTL-SHIPPER-POS-032` |
| replacement-review | `AMS010-ORDER-FTL-SHIPPER-POS-033` |
| replacement-save | `AMS010-ORDER-FTL-SHIPPER-POS-034` |
| replacement-back | `AMS010-ORDER-FTL-SHIPPER-POS-052` |
| replacement-cancel | `AMS010-ORDER-FTL-SHIPPER-NEG-033` |
| inactive-history | `AMS010-ORDER-FTL-SHIPPER-POS-031` |
| inactive-record | `AMS010-ORDER-FTL-SHIPPER-POS-031` |
| assignment-menu | `AMS010-ORDER-FTL-SHIPPER-POS-057` |
| assignment-heading | `AMS010-ORDER-FTL-SHIPPER-POS-057` |
| cari-order | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| pilih-order | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| assignment-order | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| armada-master | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| armada-manual | `AMS010-ORDER-FTL-SHIPPER-POS-053` |
| sopir-master | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| sopir-manual | `AMS010-ORDER-FTL-SHIPPER-POS-053` |
| no-polisi | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| sopir | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| assignment-mode | `AMS010-ORDER-FTL-SHIPPER-POS-053` |
| assignment-save | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| assignment-cancel | `AMS010-ORDER-FTL-SHIPPER-POS-053` |
| assignment-detail-heading | `AMS010-ORDER-FTL-SHIPPER-POS-035` |
| assignment-detail-order | `AMS010-ORDER-FTL-SHIPPER-POS-036` |
| assignment-lelang | `AMS010-ORDER-FTL-SHIPPER-POS-036` |
| assignment-info | `AMS010-ORDER-FTL-SHIPPER-POS-036` |
| riwayat-penugasan | `AMS010-ORDER-FTL-SHIPPER-POS-054` |
| tracking-history | `AMS010-ORDER-FTL-SHIPPER-POS-054` |
| tracking-lokasi | `AMS010-ORDER-FTL-SHIPPER-POS-054` |
| tracking-timeline | `AMS010-ORDER-FTL-SHIPPER-POS-054` |

## Validasi Gherkin dan JSON

- PASS — parser Gherkin resmi membaca satu Feature dan 149 Scenario tanpa syntax error.
- PASS — ID unik mengikuti pola modul/kategori/nomor; nama Scenario, kategori, priority, REQ dan screen sama dengan JSON.
- PASS — setiap Scenario tepat empat tag wajib; Given/And precondition dan langkah Then/And mengikuti struktur yang valid. Kasus pemeriksaan state menggunakan Given → Then tanpa aksi mutasi.
- PASS — seluruh teks precondition dan langkah Gherkin dibandingkan satu per satu dengan JSON; escaping kutip, Unicode dan newline lolos parse. Komentar target menyediakan key untuk label UI yang berulang.
- PASS — setiap scenario memiliki field wajib, actions dalam enum, target pada inventory, selectorHints sesuai inventory, value tipe benar, expected sama dengan seluruh langkah expect.
- PASS — fill hanya textbox/spinbutton dan select hanya combobox; control numeric/custom dropdown memerlukan adapter DOM sesuai analysis A16.
- PASS — source menunjuk file yang ada dan mencantumkan seluruh 11 PNG, extras kosong; summary persis hitungan aktual.
- PASS — semua requirement minimal satu positive dan negative; semua 15 layar dan 164 elemen inventory direferensikan; edge/stress tersedia.
- PASS — oracle harga fixture dua unit: DPP 12.000.000 + PPN 132.000 − PPh 240.000 + asuransi 400.000 = 12.292.000. Oracle alur lengkap satu unit: 6.000.000 + 66.000 − 120.000 + 200.000 = 6.146.000.

## Dedup dan perbaikan review

- Duplikat dibuang: **0**. Pemeriksaan kontrak identik mengabaikan judul/ID, membandingkan kategori, REQ, layar, preconditions, steps, expected dan testData.
- Tinjauan overlap: validasi PIC pada titik berbeda, expiry saat Pesan versus saat final submit, data read-only pada Step 01/03/Review, serta replay transaksi versus order independen menguji kegagalan berbeda dan dipertahankan.
- Gap awal diperbaiki sebelum final: tambah layar Detail Order (valid/akses shipper lain), konteks menu/heading, popup Pilih Barang, dan satu alur shipper lengkap dari Pesan sampai status/notifikasi.
- Draft sekarang memiliki aksi membuka kembali melalui menu Lanjutkan Draf; bukan hanya assertion bahwa data akan pulih.

## Gap dan dependensi implementasi

- **Tidak ada gap terhadap 36 requirement yang diekstrak maupun inventory UI penting.** Angka coverage menunjukkan cakupan rancangan, bukan bukti aplikasi lulus.
- Baseline OMS eksisting belum disertakan: format WhatsApp, validasi penugasan/manual/mode, batas maksimum, sifat blokir alert kapasitas dan detail alur direct/Batch/negosiasi/lelang ulang masih membutuhkan baseline saat codegen/eksekusi.
- Basis pajak, pembulatan dan basis Nilai Barang perlu dikonfirmasi melalui master/implementasi. Fixture tarif 1% dan nominal pajak adalah data uji; tidak mengganti tarif bisnis.
- Konfirmasi/batal/pilih barang/drop point/penggantian/riwayat tidak punya PNG. Label/role/testid di area ini berupa usulan; selesaikan mapping DOM dan routes sebelum menghasilkan test executable.
- Spec/desain berbeda: card armada, contoh angka total, Waktu Perjalanan, label LTL di Detail Penugasan dan Riwayat Pembatalan versus Riwayat Order Tidak Aktif tercatat A12–A15.
- Isolasi akses, validasi ulang deadline, replay/timeout/race dan pemindahan rekaman histori memiliki asumsi eksplisit A05/A08/A09. Jika implementasi memakai model berbeda, sesuaikan oracle terkait tanpa menghilangkan requirement inti.
- Untuk stress, runner wajib menjalankan workload pada testData: concurrency, iterasi, payload/seed dan injeksi kegagalan. Langkah representatif tidak cukup menjadi satu test serial. Beban yang melampaui batas resmi diuji sebagai validasi batas, tanpa SLA yang direkayasa.
- Assertion `expect.value` mendeskripsikan kontrak: visible/absent/readonly/disabled/count/value/notification/state. Gunakan assertion Playwright yang sesuai; jangan memetakan semua expect menjadi toBeVisible().

## Rekomendasi lanjutan

Saat implementasi tersedia, petakan route dan locator berscope, seed clock/data/master/baseline, serta mekanisme notifikasi dan fault injection. Jalankan alur lengkap dan seluruh validasi mandatory, kemudian boundary WIB/perhitungan/histori dan workload stress sesuai lingkungan uji.
