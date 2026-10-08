# Eksplorasi Batch05 — Penawaran, Harga, Jadwal dan Request Jadwal

8 Oktober 2026. Admin dan Vendor IK; eksplorasi read-only, bukan verdict test-module. Hanya Batch05. Tidak menyimpan harga/jadwal/request/order, tidak bid/hapus/nego atau mengubah setting. Login native berhasil tanpa retry; browser ditutup tanpa storageState.

## Cakupan dan observasi

| Area | Yang diperiksa | Hasil dan batas |
|---|---|---|
| Penawaran Vendor | Daftar, Detail Harga FCL, menu FCL/FTL, tab Penawaran Lengkap | Snapshot 77 harga; Belum Input Jadwal32, Lengkap30, Request0, Kadaluwarsa15. Tidak seluruh record/pagination diperiksa. FTL tidak memiliki Tambah/Lihat Jadwal, sesuai AMS006 REQ-001. |
| Input/Edit/Bid | Input Harga, dropdown No. Lelang, Edit harga FCL03 | Dropdown kosong: Tidak ada lelang yang sedang buka; Simpan disabled sebelum pemilihan. Edit ditolak karena lelang bukan Sedang Buka meski label Aktif. Form rincian harga, default pajak, edit in-place dan Bid belum dapat diverifikasi. |
| Harga dan audit | FCL03 TANTO40, riwayat harga | DPP6.000.000 + PPN660.000 − PPh720.000 = total5.940.000, konsisten API/UI. Riwayat harga membuka panel pada daftar, bukan redirect riwayat lelang dari Batch02/03. |
| Jadwal | FCL03 kosong; form Direct/Connecting; tambah baris lokal; kalender; Batal | Pelayaran utama TANTO locked; Nama Kapal/Voyage/Closing/ETD/ETA wajib menurut label, Open Stack tanpa bintang. Direct dapat menambah Jadwal2; Connecting dapat menambah transit. Batal meminta konfirmasi lalu kembali tanpa save. Tidak membuktikan validasi backend, persistensi/switch-retention atau batas baris. |
| Jadwal existing | FCL13/051026, satu Direct RULES-01 | API ETD08/10 12:28Z tampil19.28 WIB; Closing07/10 12:28Z tampil19.28. Reload zona browser UTC→Asia/Jakarta tidak mengubah tampilan. Bukti ini hanya tabel, bukan regresi timezone modal edit lama. |
| Request Admin | FCL03 dari menu list dan Detail Harga | Dua jalur menuju form yang sama; enam harga tanpa jadwal, harga urut naik. Kirim disabled tanpa pilihan, dua checkbox →2 Terpilih dan Kirim enabled. Tidak dikirim. Filter/sort dibuka; efektivitas filter/sort dan counter lintaspage belum diuji. |
| Pesan tanpa jadwal | FCL03 Meratus20 | Pesan enabled, membuka step01 Buat Order dari Lelang dengan pesan bahwa Vendor akan mengisi jadwal saat konfirmasi order. Tidak melanjutkan step atau simpan draf. Ini hanya batas alur Batch05, bukan eksplorasi modul Order Batch07. |

## Kandidat dan perubahan rule

**B05-C01 — akses Tambah Jadwal tidak konsisten untuk harga yang sama.** Harga `35c5895f-75cb-41c8-956f-efbf2df0eba1`, FCL-NRM-03/081026 TANTO40. Menu card Tambah Jadwal dua kali menampilkan Aksi Tidak Dapat Dilakukan / Harga hanya dapat diubah saat lelang berstatus Sedang Buka. API daftar `actions.TAMBAH_JADWAL.allowed=false` dengan alasan edit harga. Namun Lihat Jadwal → Tambah Jadwal membuka form Direct/Connecting; API jadwal `meta.dapatInputJadwal=true`, alasan null. Rencana Akhir Kirim30/10/2026 17:00Z (31 Oktober00WIB), belum lewat. Pembanding AMS006 REQ-004/006: tambah setelah tutup diperbolehkan sebelum akhir pengiriman. Kandidat perbedaan guard/entrypoint; belum membuktikan save diterima atau backend bypass. Bukti vendor-add-schedule-guard.json/png, schedule-empty-settled.json, schedule-form-settled.json dan vendor-api.json.

**B05-R01 — order FCL tanpa jadwal: perilaku baru berbeda dari analysis.** AMS006 REQ-003 meminta Pesan nonaktif; keenam card FCL03 tanpa jadwal kini Pesan enabled. Klik Meratus20 membuka `/order/buat-dari-lelang` dan copy eksplisit: Jadwal kapal saat ini belum tersedia. Vendor akan mengisinya saat konfirmasi order. Ini menunjukkan alur UI yang sengaja mengakomodasi jadwal belakangan, tetapi belum ada keputusan user yang mengganti REQ-003. Perlu keputusan produk: adopsi rule baru dan perbarui skenario, atau perbaiki guard sesuai rule lama. Tidak otomatis mengubah expected atau menyatakan order berhasil dibuat. Bukti main-order-guards.json, main-no-schedule-order-settled.json/png dan main-api.json.

**B05-I01 — audit harga sulit dibaca.** Riwayat FCL03 menampilkan Harga DPP `6000000` dan Mulai Berlaku `2026-09-30T17:00:00.000Z`, sementara detail menampilkan Rp6.000.000 dan01/10/2026. Usulan: format mata uang dan waktu WIB konsisten, tetap menyimpan nilai mentah untuk audit. Ini improve presentasi, bukan bukti kesalahan tanggal tersimpan.

**B05-I02 — konteks label dan waktu.** Request Jadwal menampilkan Durasi Lelang0Hari untuk lelang10menit, sementara Detail Harga10Menit. Gunakan durasi menit/jam bila kurang dari sehari. Form Request menyebut1vendor diundang, daftar lelang menyebut1dari2Vendor: kemungkinan angka kontributor harga dipakai sebagai label undangan; perlu rekonsiliasi daftar peserta sebelum dijadikan bug. Daftar Vendor tetap memuat heading Belum Input Jadwal setelah tab Penawaran Lengkap dipilih (termasuk card FTL); usulkan heading mengikuti tab. Label status Aktif juga perlu dibedakan dari Sedang Buka untuk menjelaskan guard Edit.

## Rule pembanding dan gap yang tetap terbuka

- AMS009 rule user5Oktober menjadi acuan: uniqueness FCL vendor/lelang/pelayaran/kontainer; FTL vendor/lelang/armada; Edit/Bid in-place, Bid hanya turun; Ulang mengexpired harga lama setelah sukses; expiry masa berlaku hari ini inklusif; isolasi vendor/lelang. Semuanya memerlukan fixture dan mutasi terkontrol untuk pembuktian, tidak dijalankan dalam eksplorasi ini.
- Mulai Berlaku bukan otomatis tanggal akhir masa berlaku. API FCL03 `berlakuState=EXPIRED`, badge null/hargaMerahtrue meski lelangAktif: tidak menafsirkan ini sebagai bug expiry hanya dari tanggal mulai. Boundary Closing dan kesetaraan Rencana Akhir Kirim tetap NEED RECHECK menurut keputusan sebelumnya. Kandidat AMS009 SCN-0025 lama belum direproduksi pada record asal.
- Form Direct yang dibaca tidak mempunyai Import/Template Excel, masih konsisten gap lama AMS006 REQ-022/POS-022; jangan hitung sebagai temuan baru. Belum memeriksa semua jenis/sumber form atau download template.
- Request Vendor0: respon/update request dan notifikasi tidak dapat diperiksa tanpa request pending. Seleksi dua harga membuktikan counter lokal, bukan lintaspage atau sukses kirim (AMS007).
- AMS004 gap pajak editable, Batal form harga dan validasi masa lalu belum diretest karena dropdown lelang kosong. Delete dan audit setelah mutasi tidak dijalankan. Qty Spot Jumlah Kontainer/Jumlah Armada tetap tidak berlaku sesuai user; label Jumlah Kontainer kosong pada detail bukan missing-field bug.
- Belum seluruh filter/pagination/sort, connecting existing/detail, edit jadwal, expiry/backend order guards, vendor kedua atau Kontrak FCL dengan harga. Tidak ada spec mentah inputs/ yang tersedia; pembanding memakai analysis, scenario JSON dan keputusan lokal yang tersedia.

## Bukti, locator dan hipotesis

Vendor: `artifacts/explore-batches/20261008/batch05-2026-10-08T06-17-54-294Z`. Admin: `artifacts/explore-batches/20261008/batch05-2026-10-08T06-24-42-856Z`. Screenshot salinan `artifacts/screenshots/explore/20261008/batch05-vendor/` dan `batch05-main/`. Peta locator: shared/selector-map-penawaran-jadwal.md.

Klik native berhasil pada list/form/menu dan checkbox; dropdown kustom, Tampilkan select native. Kalender jadwal43button.h-9.w-9, input HH:mm serta pilihan jam/menit. Request filter memakai input datetime-local. Guard dan Batal Jadwal tanpa role=dialog; inventaris halaman list/form0testid. StorageState tidak diuji ulang. Timeout Lihat Jadwal pada card FTL, tombol Tambah Baris ketika mode Connecting, selector TANTO getByRole yang salah, dan save hasil eval undefined merupakan kesalahan harness/locator, bukan bug aplikasi. Snapshot Memuat diganti bukti settled. Tidak mengklaim filter berhasil.

Summary kedua sesi:0writebisnis,0blockedWrites dan0API>=400; POST hanya auth/refresh. Fixture nego deadline9Oktober tidak diubah. Tidak ada laporan Excel/verdict formal. Batch05 selesai untuk cakupan baca ini; berikutnya Batch06 Negosiasi hanya saat diminta.


## Rekonsiliasi pada Batch07 — 8 Oktober 2026

Spec asli Order FCL ditemukan di luar repository (`/home/icun/Produk/AMS/AMS009 - Order & Penugasan - FCL/AMS009 - Order & Penugasan - FCL.txt`). Dokumen secara eksplisit mengizinkan Order tanpa jadwal, banner dan pengisian jadwal saat konfirmasi Vendor. B05-R01 kini merupakan konflik pembanding AMS006 REQ003 lama dengan spec Order, bukan bug UI terkonfirmasi. Perlu rekonsiliasi lintas dokumen; jangan mengubah expected lama tanpa pemetaan sumber. Banner/validasi/konfirmasi backend belum dibuktikan. AMS009 Order eksternal berbeda dari AMS009 harga repository. Lihat laporan Batch07. Catatan sumber sebelumnya mencerminkan sumber yang tersedia ketika Batch05 dijalankan.
