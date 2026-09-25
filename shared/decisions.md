# Keputusan Triage & Eksekusi

## 2026-09-23 — ams001-buat-lelang-fcl-shipper (run 20260923-105725)

- **Cakupan read-only**: user tidak memilih cakupan; dipakai default aman read-only (tanpa Simpan/Draft/submit). 0 request tulis ke API tercatat.
- **Normalisasi skenario**: dibuat `*_scenarios.json` (SCN-0001..0303, `requirements` array, id asli di `sourceId`); file `.scenarios.json` asli tidak diubah.
- **Blocker environment**: master Pelabuhan 0 data & Jenis Kontainer kosong → lelang FCL tidak dapat dibuat; 199 skenario blocked. Perlu master data FCL (atau tenant lain) sebelum run lanjutan.
- **Triage failed**:
  - SCN-0140, SCN-0270 (REQ-070) — tombol Filter di `/lelang` tidak membuka panel (native & dispatchEvent). → **kandidat bug aplikasi**.
  - SCN-0055, SCN-0164 (REQ-028) — Nilai Barang min/maks tidak diformat ribuan ("1000000"). → **kandidat bug aplikasi** (atau desain format belum diimplementasi).
  - ~~SCN-0049 (REQ-025/A07) — field "Jumlah Kontainer" tidak ada di form FCL.~~ **Dibatalkan 2026-09-23 (konfirmasi user):** field Jumlah Kontainer memang TIDAK tersedia di form FCL — bukan temuan. SCN-0049, 0050, 0158–0161 = skenario tidak valid → `skipped`. REQ-025 dan aturan jumlah kontainer di A07 (`*.analysis.md`) tidak berlaku; jangan dibuat skenario baru untuk field ini.
- **Selisih desain vs aplikasi (bukan failed, dicatat)**: Buat Lelang tanpa pop-up pilih jenis (langsung form, FCL via card); checkbox reuse "Gunakan data lelang" tidak ditemukan; Pengirim/Penerima auto dari drop point (disabled); opsi Durasi 1/3/6/12 Jam & 1/2/3/7 Hari (tidak ada 120 menit); banner "Pastikan urutan pengiriman" tampil walau 1 baris.
- **Script flake**: SCN-0053/0070/0148/0298 gagal di run pertama karena skrip (selector/picker), lulus setelah perbaikan skrip; SCN-0209 lulus pada percobaan ulang.

## 2026-09-23 — manajemen-vendor (eksplorasi + verifikasi Riwayat)

- **Riwayat Manajemen Vendor hanya mencatat edit**: proses Tambah Vendor memang **tidak** masuk Riwayat (konfirmasi user). Jangan jadikan temuan/bug; skenario Riwayat cukup menguji edit (per-field before/after, aktor, urutan terbaru di atas). Bukti: `explore/manajemen-vendor.md` § Verifikasi Riwayat (V-3).
- **Data test tertinggal**: vendor `AUTOTEST-20260923-VENDOR-RIWAYAT` (Tidak Aktif) — vendor tidak bisa dihapus dari UI.
- **Pengujian menyeluruh Tambah/Edit/Detail (run tulis disetujui user, ±14:50–15:10 WIB)**: 4 bug terkonfirmasi (BUG-V1 WA tanpa validasi min/format, BUG-V2 tautan dokumen `/api/api/` 401, BUG-V3 ukuran file salah, BUG-V4 vendor Menunggu bisa dibuka Edit dengan status salah lalu ditolak backend) + 3 kandidat (filter WA format 08, upload hanya cek ekstensi, tanpa kirim ulang undangan). Detail & daftar 8 vendor AUTOTEST tertinggal: `explore/manajemen-vendor.md` § Pengujian Menyeluruh.


## 2026-09-24 — ams002-buat-lelang-ftl

- **Cakupan TULIS PENUH (konfirmasi user 2026-09-24):** "bebas tambah hapus edit karena ini versi staging". Filter: semua kecuali stress (287 skenario). Data buatan run diberi prefix `AUTOTEST-20260924-`; mutasi destruktif (batal/hapus/edit) tetap diarahkan ke lelang buatan run ini bila memungkinkan.
- **Normalisasi skenario**: dibuat `ams002-buat-lelang-ftl_scenarios.json` (SCN-0001..0303, `requirements` array, id asli di `sourceId`); file asli tidak diubah.
- **Run 20260924-093000** (harness Node `artifacts/probe/ams002/`, tulis penuh). Hasil: `results/ams002-buat-lelang-ftl__20260924-093000.json`.
- **Triage failed (akar masalah):**
  - **BUG — Riwayat Perubahan 404** (REQ-004/050/055/067): menu → `/lelang/{id}/riwayat` "Oops! Halaman Tidak Tersedia". Nilai edit/batal/ulang tersimpan, audit tidak dapat dilihat. SCN-0007, 0008, 0099, 0109, 0133, 0235, 0278, 0283, 0284, 0286–0300.
  - **BUG — Link Dokumen Tambahan 404** (REQ-034): href memakai host frontend (`auction-staging…/api/uploads/...`); file ada di host API. Nama file tidak tampil (label "Dokumen n"). SCN-0177. Ukuran file 1024 B tampil "0.07 KB" (catatan SCN-0067).
  - **BUG — Tombol Pesan tidak berfungsi** (REQ-060): klik tanpa request/navigasi. SCN-0119.
  - **BUG — Filter Kota vendor kosong** (REQ-041/051/066): hanya opsi "Semua Kota"; tidak ada filter Rating; rating tidak tampil di card (API rating 0, spec 3.0 untuk vendor baru). SCN-0079, 0081, 0246, 0247.
  - **BUG — Buka Lelang = sekarang ditolak** (REQ-026/045): validasi presisi detik; submit tepat menit buka ditolak backend dan UI tidak menampilkan pesan. SCN-0141, 0205.
  - **BUG — Batas file tepat 4 MB (4.194.304 B) ditolak** "Ukuran file maksimal 4MB" (REQ-034). SCN-0173.
  - **BUG (kandidat) — Periode salin tepat 90 hari ditolak** (hitung inklusif?) (REQ-022). SCN-0154.
  - **BUG — Ringkasan rute "- → -"** di Tambah Peserta & Lelang Ulang; Tambah Peserta tanpa ringkasan syarat/dokumen; form ulang tanpa Nilai Barang (REQ-051/064). SCN-0101, 0127, 0253.
  - **BUG — Denominator peserta tidak ikut vendor auto-join "Pilih semua"** (9 baris, "0 dari 8") (REQ-048). SCN-0234.
  - **BUG (kandidat) — Ulang terjadwal (Belum Buka) tidak masuk tab Lelang Ulang/penanda ungu** sampai buka (REQ-067). SCN-0225. Countdown ulang tidak tampil di halaman penawaran (REQ-069). SCN-0137.
  - **BUG (kandidat) — Jenis Armada tidak tersalin** saat "Gunakan data lelang" (REQ-024; SCN-0047 passed + catatan).
  - **GAP DESAIN / perlu konfirmasi:** field **Jumlah Armada** tidak ada di form FTL (SCN-0059, 0060, 0162–0165, 0285 — mirip kasus Jumlah Kontainer ams001); label titik detail "Muat/Bongkar" vs spec "Pick Up/Drop Off" (0182, 0184, 0186; popup list memakai "Drop Off"); tidak ada "Pilih Semua Armada" (0202); tabel peserta tanpa sort (0233); menu Detail aktif pada draft (0027); edit masih bisa tambah/hapus baris (0236, asumsi A02).
- **Perubahan sejak ams001:** panel **Filter Lelang kini terbuka** (SCN-0239 passed) → temuan ams001 SCN-0140/0270 perlu diuji ulang. Master Pelabuhan & Jenis Kontainer kini terisi → ams001 (FCL) bisa dijalankan ulang dengan cakupan lebih luas.
- **Catatan alert:** item menu abu-abu memberi alert berupa **toast singkat** (mis. "Lelang sudah dibatalkan.", "Lelang pada status ini tidak dapat dibatalkan.") — assertion harus menangkap toast, bukan dialog.
- **Data run tertinggal:** lelang AUTOTEST FTL-NRM-11…-26 (sebagian dibatalkan), ±40 draft (Deskripsi/PIC `AUTOTEST-20260924-`), vendor `AUTOTEST-20260924-V31` (Dibantu+Vendor, Aktif, otomatis masuk lelang "Pilih semua" pihak lain seperti FTL-NRM-03/230926) & `AUTOTEST-20260924-ADMINMGR`. Daftar: `artifacts/probe/ams002/created.md`, `created-api.log`.
