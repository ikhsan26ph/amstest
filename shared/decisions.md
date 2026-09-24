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

