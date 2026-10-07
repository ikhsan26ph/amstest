# Triase AMS004 — 2026-10-05

Run `20261005-072048`. Total: blocked 6, failed 12, passed 16, skipped 4.

Verdict mengikuti langkah literal skenario. SCN0008/0024/0026 gagal hanya pada wording alert; penolakan bisnis terverifikasi. Tidak ada kode FND khusus yang ditetapkan untuk kandidat di bawah; rujukan memakai REQ dan observasi aktual.

| SCN | Klasifikasi | Rujukan (REQ/FND) | Severity | Analisis singkat | Rekomendasi |
|---|---|---|---|---|---|
| SCN-0002 | BUG (probable) | REQ-001 | minor | Detail privat API404 dan tidak membocorkan data, tetapi halaman tanpa pesan penolakan. | Tampilkan error akses yang jelas. |
| SCN-0003 | DESIGN GAP | REQ-002 | minor | Daftar Lelang hanya menyediakan pencarian; kontrol Filter Status tidak ada. | Sinkronkan UI dengan requirement atau sepakati revisi desain. |
| SCN-0005 | DESIGN GAP | REQ-003 | minor | Section Syarat/Data Pengirim/Penerima dan fitur filter/urutkan detail tidak tersedia. | Lengkapi section dan kontrol sesuai desain. |
| SCN-0007 | BUG (probable) | REQ-004 | minor | No Lelang terkunci/terisi sudah benar; breadcrumb dari Detail tetap Daftar Penawaran. | Pertahankan konteks halaman asal. |
| SCN-0008 | DESIGN GAP | REQ-004 | minor | Input closed ditolak dan form tidak dibuka. Teks alert berbeda dari literal langkah. | Sepakati wording; tidak perlu mengubah rule penolakan. |
| SCN-0011 | BUG (probable) | REQ-006 / REQ-009 | major | PPN/PPh default0 dan dapat diedit, padahal diwajibkan default master serta terkunci. | Periksa pemetaan master, kunci field, dan validasi nilai di server. |
| SCN-0012 | BUG (probable) | REQ-006 | minor | Kalender hari kemarin enabled, minDate null, dan tidak ada helper tanggal lampau saat validasi. Tidak ada POST karena field lain invalid. | Batasi pemilihan/validasi tanggal; lanjut cek backend terisolasi bila diperlukan. |
| SCN-0021 | BUG (probable) | REQ-011 | major | Batal langsung menuju Daftar Penawaran tanpa konfirmasi, meskipun asal dari Detail. | Tambahkan konfirmasi dan kembali ke asal. |
| SCN-0022 | BUG (probable) | REQ-011 | major | Tidak ada pilihan Tidak; input valid hilang setelah Batal. Temuan yang sama dengan SCN0021. | Pertahankan input saat pengguna menolak Batal. |
| SCN-0024 | DESIGN GAP | REQ-012 | minor | Edit closed berhasil ditolak tanpa membuka form, tetapi heading/pesan tidak sesuai literal desain. | Sepakati wording alert; bukan kegagalan enforcement. |
| SCN-0025 | BUG (probable) | REQ-013 | minor | Harga terakhir DELETE200, hilang dari daftar, vendor Belum Input. Menu Riwayat Perubahan tidak membuka audit penghapusan. | Tampilkan audit soft delete; cek audit backend dan cascade jadwal secara terpisah. |
| SCN-0026 | DESIGN GAP | REQ-013 | minor | Hapus closed ditolak, record tetap ada sebelum reauction. Pesan hanya menyebut status Sedang Buka. | Sepakati wording; enforcement sudah menolak. |

Ringkasan klasifikasi failed: 7 BUG (probable), 5 DESIGN GAP. SCN0021/0022 satu kandidat yang sama. Tidak ada timeout/selector issue yang dibiarkan sebagai bug aplikasi setelah recheck.

Prasyarat blocked:

- SCN-0001: Error: Tidak tersedia akun/penawaran vendor B pada lelang yang sama.
- SCN-0006: Error: Tidak tersedia akun/penawaran vendor B pada lelang yang sama; tidak dapat memverifikasi isolasi filter.
- SCN-0017: Error: Prasyarat master PPN 1,1% / PPh 2% tidak tersedia: form memakai 0/0%. Tidak mengubah master tenant.
- SCN-0027: Error: Prasyarat request jadwal belum tersedia (counter 0); seluruh kombinasi tab/action dan connecting belum dapat diverifikasi.
- SCN-0032: Error: Prasyarat tiga penawaran aktif vendor yang sama untuk armada sama bertentangan rule unik FTL; fixture legacy aktif belum tersedia.
- SCN-0033: Error: Tanggal akhir masa berlaku belum terverifikasi (UI hanya Mulai Berlaku); pergantian hari bisnis aktual belum terjadi.

Batas bukti dan pemulihan:

- SCN0030 memakai field targetWaktuJam; SCN0019 memakai badge KADALUWARSA, bukan berlakuState tanggal. Assertion awal dikoreksi berdasarkan UI dan API aktual.
- SCN0023 memilih ulang card harga seed 10 juta setelah selector awal terlalu luas. Kedua mutasi tetap pada fixture run ini; ID dan jumlah record tetap sama.
- SCN0034 memakai range total harga Rp1–Rp10 juta (tepat21 record existing), 20+1 ID unik, urutan createdAt turun dan Reset mengembalikan67 data. Bukan membuat21 harga baru.
- SCN0018 melewati waktu tutup server nyata: dialog sebelum tutup, konfirmasi sesudah tutup, POST409 dan tidak ada harga baru.
- Sesi berhenti akibat promise timeout pada selector konfirmasi hapus; login baru dan melanjutkan pada fixture yang sama. Harga yang dihapus sebelumnya memiliki1 jadwal. Tidak menyimpulkan audit backend/cascade jadwal dari absennya dialog.
- Fixture privat menggunakan lelang existing secara read-only karena pencarian vendor lain saat pembuatan fixture gagal. Akses API404, tanpa mutasi.

Bukti: `results/ams004-input-harga-penawaran-vendor__20261005-072048.json`, screenshot failed di `artifacts/screenshots/20261005-072048/`, percobaan awal dan fixture di `artifacts/ams004-run/20261005-072048/`.
