# Triase Bug — run 20260928-095629 (FTL + FCL)

Sumber: `results/ams002-buat-lelang-ftl__20260928-095629.json` (40 failed) dan
`results/ams001-buat-lelang-fcl-shipper__20260928-095629.json` (4 failed).
Dihasilkan oleh subagent `bug-triager` (hanya baca; belum diverifikasi ulang di browser).
`*.analysis.md` kedua modul tidak memuat kode FND-xx, jadi rujukan memakai REQ.
Jumlah Kontainer tidak dihitung (sudah dinyatakan bukan bug).

## Koreksi atas temuan lama (dari screenshot)

- **Riwayat Perubahan FTL tidak lagi 404.** SCN-0278 memuat halaman dengan No. Lelang dan "Belum ada riwayat perubahan untuk lelang ini"; tag `RIWAYAT404` basi. SCN-0007 gagal karena harness membaca halaman saat masih "Memuat riwayat perubahan...".
- **Link dokumen tambahan kemungkinan sudah diperbaiki.** Detail (SCN-0008) menampilkan kartu `revisi.pdf`, href host `apiauction-staging`. SCN-0300 gagal karena assertion. Unduhan belum diklik.
- Nilai Barang FCL kini terformat ribuan.

## Temuan

| ID | Judul | Klasifikasi | Severity | FTL | FCL | REQ |
|---|---|---|---|---|---|---|
| TRI-01 | Field Jumlah Armada tidak ada di form Buat/Edit FTL — DIABAIKAN user 2026-09-30, skenario `skipped` | DITUTUP | minor | 0059, 0060, 0162–0165, 0285 | - | REQ-030, 050 |
| TRI-02 | PDF 4.194.304 B (FTL) serta 4.194.303 & 4.194.304 B (FCL) ditolak "maksimal 4MB"; kemungkinan batas 4.000.000 B. User mengonfirmasi batas = 4 MiB | BUG (konfirmasi user 2026-09-30) | minor | 0173 | 0193, 0194 | REQ-034 / REQ-033 |
| TRI-03 | Filter Kota vendor hanya berisi "Semua Kota" | BUG | major | 0081, 0247 | - | REQ-041, 051, 066 |
| TRI-04 | Rating vendor tidak tampil, tidak ada filter Rating, API rating 0 (spec 3.0) | BUG | minor | 0079, 0081 | - | REQ-040, 041 |
| TRI-05 | Buka Lelang = sekarang ditolak (presisi detik), submit step 2 tanpa pesan | GAP (aturan) / BUG minor (pesan tidak muncul) | minor | 0141, 0205 | - | REQ-026, 045 |
| TRI-06 | Periode salin tepat 90 hari ditolak; 89 hari diterima | GAP | minor | 0154 | - | REQ-022 |
| TRI-07 | Lelang Ulang Belum Buka tidak masuk tab Lelang Ulang / tanpa penanda ungu (konsisten 24/09, 25/09, 29/09) | BUG (kandidat) | major | 0125, 0133, 0225 | - | REQ-063, 067 |
| TRI-08 | Form Lelang Ulang menampilkan Nilai Barang padahal sumber tanpa asuransi | BUG (FCL); FTL 0127 = RECHECK (harness mendarat di Detail) | minor | 0127 | 0236 | REQ-063 / REQ-064 |
| TRI-09 | Menu kartu Draft mengaktifkan "Detail" | GAP | minor | 0027 | - | REQ-014 |
| TRI-10 | Tidak ada opsi "Pilih Semua Armada" | GAP | minor | 0202 | - | REQ-031 |
| TRI-11 | Salin data: Durasi ikut tersalin (0048); Jenis Armada tidak tersalin (0047, passed + candidate) | BUG (kandidat); 0048 cek dulu apakah "1 Hari" hanya default | minor | 0048, 0047 | - | REQ-024 |
| TRI-12 | Detail "Total Penawaran 0 dari 0 Vendor" padahal 21 peserta | BUG (kandidat), sebagian TEST | minor | 0234 | - | REQ-048 |
| TRI-13 | Assertion tabel peserta Detail tidak akurat (fixture tanpa penawaran / <2 penawar) | TEST | - | 0095, 0096, 0233 | - | REQ-048 |
| TRI-14 | "Pilih semua" di Tambah Peserta mencentang 16 dari 21 vendor (mungkin hanya halaman aktif) | RECHECK | minor | 0246 | - | REQ-051 |
| TRI-15 | Edit lelang masih bisa menghapus baris (ikon Hapus=4, Tambah Baris=0), asumsi A02 baris dibekukan | GAP | minor | 0236 | - | REQ-049 |
| TRI-16 | Datepicker mengoreksi nilai tidak valid otomatis; edit tidak valid tersimpan (toast sukses). Terkait 0052, 0056, 0058, 0100 | GAP (perlu keputusan produk) | minor | 0008 | - | REQ-004, 050 |
| TRI-17 | Halaman Detail menampilkan tombol "Edit Data" (REQ-045 vs REQ-049); perilaku sama di FTL | GAP | minor | - | 0090 | REQ-045, 049 |

### Bukti singkat
- TRI-01: label form hanya Durasi, Buka, Tutup, Rencana Awal/Akhir Kirim, Jenis Armada, Deskripsi Barang.
- TRI-02: error `Ukuran file maksimal 4MB`, konsisten sejak 24/09.
- TRI-03: dropdown `["Semua Kota"]`; pencarian "Bangkalan" kosong padahal card menampilkan kota.
- TRI-05: 0141 "Buka Lelang tidak boleh lebih kecil dari waktu saat ini"; 0205 submit 08:53:03 dengan Buka 08:53 ditolak `VALIDATION_ERROR bukaAt`.
- TRI-06: rentang 01/06–30/08 ditolak "Maksimal range tanggal 90 hari".
- TRI-10: dropdown hanya Trailer 20 FT dan Trailer 40 FT.
- TRI-16: toast "Perubahan berhasil disimpan" pada edit tidak valid.

### Langkah reproduksi
- TRI-01: Admin → `/lelang/buat` → FTL → Informasi Umum; ulangi di Edit Data.
- TRI-02: unggah PDF 4.194.303 / 4.194.304 byte; bandingkan 4.000.000 B.
- TRI-03/04: step Peserta / Tambah Peserta / Lelang Ulang → Filter Kota, amati card vendor.
- TRI-05: Buka = menit berjalan, Simpan di detik ≥1 menit itu.
- TRI-06: "Gunakan Data Lelang", Periode 01/06/2026–30/08/2026.
- TRI-07: lelang Tutup/Aktif → Lelang Ulang dengan Buka masa depan → Simpan → cek list.
- TRI-08: FCL tanpa asuransi status Tutup → Lelang Ulang → cek Nilai Barang.
- TRI-09: kartu Draft → menu titik tiga.
- TRI-11: salin dari sumber ber-Durasi non-default dengan Jenis Armada terpilih.
- TRI-12: Detail FTL-NRM-14/290926, bandingkan Total Penawaran dengan jumlah peserta.
- TRI-14: Tambah Peserta pada lelang 21 vendor → Pilih Semua → hitung tercentang.
- TRI-15: Edit Data lelang multipoint → cek ikon hapus baris.
- TRI-16: edit dengan Akhir < Awal / masa lalu → Simpan.
- TRI-17: Detail lelang Belum/Sedang Buka.

## Failed FTL yang TEST/RECHECK murni

0007 (tunggu spinner riwayat), 0021 (selector link multipoint), 0023 (parser kartu `reading 'text'`), 0100 (click timeout, field terkunci/fixture), 0101 (cek apakah ringkasan "- → -" masih ada), 0250 (tombol Batal Tambah Peserta tidak ditemukan), 0279 (fixture bukan Belum/Sedang Buka), 0289 & 0290 (fixture Asuransi Tidak, pakai fixture beras asuransi), 0299 (`page.goto` timeout 10 dtk), 0300 (assertion bandingkan href, bukan nama), 0278 (riwayat memuat tapi kosong; ulangi terisolasi), 0127 (harness tidak sampai form ulang).

## Pertanyaan konfirmasi untuk user

1. Jumlah Armada (TRI-01): memang tidak ada di FTL seperti Jumlah Kontainer di FCL? Jika ya, REQ-030 dan 8 skenarionya → `skipped`.
2. Batas "4MB" (TRI-02): 4.000.000 byte atau 4 MiB?
3. Buka = sekarang (TRI-05): validasi presisi detik disengaja? Pesan error harus tampil di submit step 2?
4. Periode salin 90 hari (TRI-06): ≤89 hari atau inklusif 90?
5. Tab Lelang Ulang (TRI-07): lelang ulang Belum Buka langsung masuk tab + penanda ungu, atau setelah dibuka?
6. Menu Draft (TRI-09): "Detail" boleh aktif pada draft?
7. "Pilih Semua Armada" dan penguncian baris edit (TRI-10, TRI-15): dihapus dari desain?
8. Auto-koreksi datepicker (TRI-16): disengaja?
9. Tombol Edit Data di Detail (TRI-17): boleh saat Belum/Sedang Buka?
10. Durasi pada salinan (TRI-11): termasuk field yang tidak disalin?

## Ringkasan

- BUG: TRI-03, 04, 07, 08, 11, 12 (6). GAP: 8. TEST: 1 kelompok + 12 skenario. RECHECK: TRI-14.
- Hanya FTL: TRI-01, 03–07, 09–12, 14–16. Di kedua modul: TRI-02, 08, 17.
- Riwayat Perubahan FCL berfungsi sejak awal; FTL baru memuat pada 29/09.
