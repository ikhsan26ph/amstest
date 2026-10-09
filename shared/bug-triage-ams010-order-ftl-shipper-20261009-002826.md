# Triage AMS010 — 20261009-002826

Hasil final: **88 passed, 7 failed, 41 blocked, 13 skipped (stress)**.

Hasil final dan jumlah verdict berada di `results/ams010-order-ftl-shipper__20261009-002826.json`.
Sumber assertion adalah skenario dan analysis AMS010; fixture aktual dicatat pada binding dan
notes setiap kasus. Tidak mengubah expected sumber. PNG/spec asli pada `inputs/ams010-order-ftl-shipper`
tidak tersedia di checkout; inventory berasal dari bagian UI Inventory pada analysis yang diberikan.
Tidak ada FND terverifikasi di inventory ini, sehingga tidak mengarang kode FND.

| SCN | Klasifikasi | Rujukan (REQ/FND) | Severity | Analisis singkat | Rekomendasi |
|---|---|---|---|---|---|
| SCN-0013 | BUG (probable) | REQ-007; tanpa FND terverifikasi | major | Draft baru berhasil201. Setelah resume di Data Barang, simpan perubahan DO/quantity menolak PATCH422 karena Tanggal Permintaan Muat belum diisi, padahal inputnya baru tersedia pada step berikutnya. Reproduksi tersimpan di `main-draft-patch-api.json` dan `main-draft-patch-blocker.json`. Menambahkan tanggal pada step03 memungkinkan draft disimpan. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0013.png) | Pisahkan validasi draft dari validasi submit final; simpan data/progress step tanpa memerlukan tanggal step03. Ulang draft Step01/02 dan resume setelah perbaikan. |
| SCN-0051 | BUG (probable) | REQ-026; tanpa FND terverifikasi | major | Order run berhasil difinalisasi dan terlihat pada vendor terkait. Unread tetap0 dan inbox `Tidak ada notifikasi`; preferensi Order Baru Email/Push aktif saat dibaca, tanpa diubah. Bukti `vendor-notification-inbox-after-orders.json`, `vendor-notification-preferences-readonly.json` dan commit order main. Ini belum membuktikan kegagalan email atau penyebab backend tertentu. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0051.png) | Trace event Order Baru dan delivery inbox untuk ID order pada main-binding. Pastikan event terpanggil baik pada finalisasi draft maupun create final; konfirmasi SLA delivery. |
| SCN-0131 | BUG (probable) | REQ-026; A09 | major | Replay/double click menghasilkan satu commit/order milik run, tetapi assertion satu notifikasi gagal pada inbox vendor kosong yang sama dengan SCN-0051. Tidak menyatakan idempotensi order gagal. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0131.png) | Gabungkan investigasi delivery dengan SCN-0051; pertahankan pemeriksaan satu commit/order ketika mengulang setelah perbaikan. |
| SCN-0009 | BUG (probable) | REQ-005; UI Inventory daftar-order | minor | Panel filter aktual mempunyai ID, jenis, vendor, kota, tanggal, tipe, drop point, pengirim/penerima dan status, tetapi tidak memiliki No. Lelang. Bukti `main-filter-fields.json`; ini bukan timeout locator yang diasumsikan. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0009.png) | Tambahkan filter No. Lelang sesuai kontrak desain, lalu uji kombinasi dengan Menunggu Konfirmasi dan Reset. |
| SCN-0023 | BUG (probable) | REQ-012; tanpa FND terverifikasi | minor | Ringkasan Jenis Pengiriman dan Rute pada Normal FTL-NRM-02/081026 menampilkan Kota Asal/Tujuan `-`, sementara detail pengirim/penerima menunjukkan Surabaya/Semarang dan alamat benar. No. Lelang tetap tersedia. Bukti `main-shipping-readonly-route-empty.json`; tidak menyatakan alamat database hilang. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0023.png) | Periksa binding nama kota sumber ke ringkasan Step01/Review; tetap read-only dan konsisten dengan titik lelang. |
| SCN-0098 | NEED RECHECK | REQ-005; UI Inventory filter-metode | — | Filter Metode Pengiriman tidak ditampilkan setelah Jenis FTL dipilih. Desain menyebut kontrol tampak pudar dan fixture langkah memakai `baseline-metode` yang belum terikat. Absence teramati, tetapi ketersediaan/eligibility metode bagi FTL perlu dipastikan sebelum disebut bug produk. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0098.png) | Konfirmasi apakah desain mengharuskan kontrol disabled untuk FTL atau hanya tersedia pada service tertentu; ikat nilai metode resmi dan ulang kombinasi lengkap. |
| SCN-0099 | BUG (probable) | REQ-005; UI Inventory copy-lelang | minor | Sel ID mempunyai satu tombol Salin ID; No. Lelang hanya span teks tanpa tombol salin tersendiri. HTML disimpan pada `main-order-copy-cell.json`. Bagian paginasi20 belum dijalankan penuh karena jumlah data kurang dari20; kegagalan yang dicatat khusus aksi salin No. Lelang. [Screenshot](../artifacts/screenshots/20261009-002826/SCN-0099.png) | Sediakan aksi salin No. Lelang sesuai kontrak inventory/desain dan scope per baris; kemudian ulang sort, clipboard dan paginasi dengan fixture cukup. Konfirmasi PNG asli saat tersedia. |

Tujuh failed: enam BUG (probable) pada lima masalah unik, satu NEED RECHECK,
nol TEST ISSUE yang masih failed setelah recheck, nol DESIGN GAP/FND terverifikasi.
SCN-0051 dan SCN-0131 adalah satu masalah delivery notifikasi.

Masalah harness yang telah didiagnosis dan diperiksa ulang:

- Run audit `20261009-001330` dihentikan setelah pola locator `<main>` yang tidak tersedia. Hasil lama dipertahankan untuk audit, bukan bukti tujuh bug produk.
- UI SPA memerlukan `waitForURL` dan card data selesai dimuat. Assertion heading tunggal dapat menangkap breadcrumb juga; konfirmasi penugasan memerlukan Simpan kedua pada modal.
- Tombol Hapus SKU bukan Hapus DO; required PIC memakai toast umum, bukan pesan inline yang semula diasumsikan. Verdict SCN-0117/0022 telah diperbaiki setelah langkah aktual diulang.
- Commit penggantian memakai POST `/api/order/auction`, bukan PATCH ID lama. Mock awal salah matcher dan menghasilkan penggantian nyata pada order uji sendiri; bukti tetap disimpan. Recheck SCN-0068 pada order uji lain menahan POST aktual503 sebelum backend dan menjaga order lama Ditolak.
- Multipickup FTL-MPU-11 memiliki tiga Muat dan satu Bongkar, bukan dua Muat. Diagnosis diperbarui dari form aktual. Kasus geometri lain tetap memiliki blocker sendiri.

Oracle/prasyarat yang belum terpenuhi tidak diperlakukan sebagai bug:

- A18 menganggap Nilai Barang sebagai nilai satuan; UI yang teramati memakai total per baris. Qty200/nilai100.000 menghasilkan totalnilai100.000, berat2500kg dan volume3,6m³. SCN-0041/0042 blocked sambil menunggu basis nilai disahkan.
- Nominal harga, kapasitas Wing Box, pajak/asuransi1%, serta tanggal tetap pada fixture berbeda dari sumber aktual CDD/CDE. Assertion nominal asli tidak diganti menjadi angka staging untuk menyatakan passed.
- Clock browser/server07/10 tidak dikendalikan. Pemeriksaan tambahan terhadap akhir aktual31/10/2026 menunjukkan tepat00:00 diterima dan00:01 ditahan, tanpa commit; bukti `main-future-boundary-checks.json`. Hasil tambahan bukan pengganti verdict literal SCN-0087/0110.
- Baseline OMS, akun shipper kedua/Vendor Indah, geometri Multipoint/Multidrop tertentu, dan tracking perjalanan terisi belum tersedia untuk kasus terkait. Pemeriksaan UI parsial dicatat di notes; tidak menyatakan seluruh assertion baseline lulus.

Data uji tidak dibersihkan secara destruktif. Lelang/master dari run audit hanya dibaca sebagai
sumber; order/penugasan baru memakai data run dan prefix AUTOTEST-20261009-. Preferensi/setting
tenant tidak disimpan, order existing pihak lain tidak diubah.
