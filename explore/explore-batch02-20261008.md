# Eksplorasi Batch 02 — Spot Rate FCL/FTL, 8 Oktober 2026

Batch 02 diperiksa pada role Admin dan Vendor IK. Cakupan: daftar, filter/search, form informasi umum, reuse, peserta dari draf existing, detail, lelang ulang dan riwayat. Eksplorasi read-only selesai dengan batas di bawah; tidak menjalankan suite formal atau Batch 03–10.

Pembanding: analysis dan canonical `*_scenarios.json` AMS001/AMS002, selector-map dan keputusan terbaru di `shared/decisions.md`. Path spec mentah yang dirujuk analysis tidak tersedia di checkout; laporan tidak mengklaim membaca spec tersebut. Rule harga terbaru AMS009/5 Oktober tetap diprioritaskan. Jumlah Kontainer FCL dan Jumlah Armada FTL tidak berlaku sesuai keputusan user; absennya input bukan bug.

## Peta menu dan akses yang diperiksa

| Role | Route ditemukan dari UI | Isi/aksi baca | Hasil |
|---|---|---|---|
| Admin | `/lelang` | Semua, Lelang Ulang, Request Jadwal, Draf; Filter, Reset, multipickup, menu Aksi | Snapshot 435 data, 109 draf; dua tab khusus 0. Angka sesaat, bukan konstanta |
| Admin | `/lelang/buat` | Form FTL/FCL, salin data, empat metode FCL, unit, asuransi, biaya, lokasi, kalender | Input lokal tanpa Selanjutnya/Simpan |
| Admin | `/lelang/buat?id={draftId}` | Edit Data draf existing langsung membuka step 02 | FTL dan FCL dapat dibaca tanpa membuat draf baru |
| Admin | `/lelang/{id}` | Detail FTL/FCL, bagian pengirim/penerima/syarat/peserta, filter status | Sampel aktif kedua tipe |
| Admin | `/lelang/{id}/ulang` | Ringkasan sumber, waktu baru, nilai barang, undangan peserta | Kedua tipe dibuka tanpa Simpan |
| Admin | `/lelang/{id}/riwayat` | Riwayat Perubahan | FCL03 terbuka; empty state riwayat, bukan 404 |
| Admin | `/lelang/riwayat-pembatalan` | Daftar pembatalan existing | Berisi data; tidak membuat pembatalan |
| Vendor | `/vendor-portal/lelang` | Semua, Ulang, Request Jadwal, search nomor/pelabuhan, menu card | Snapshot 98 data; tidak tampil Buat/Draf. Bukan bukti otorisasi backend |
| Vendor | `/vendor-portal/penawaran` (dari menu Riwayat Perubahan) | Daftar Penawaran terbuka salah tujuan | Dua kali pada FCL03; B02-C03 |
| Vendor | `/vendor-portal/lelang/{id}` | Detail FTL/FCL dan Harga Penawaran Saya | Sampel sama seperti Admin; harga hanya dibaca sebagai bagian detail |

Menu Admin aktual: Detail, Edit Data, **Edit Peserta Lelang**, Lihat Penawaran, Lelang Ulang, Batalkan Lelang, Riwayat Perubahan dan **Hapus Draf** sesuai status. Menu Vendor sampel: Detail, Input Harga Penawaran, Riwayat Perubahan. Aksi input harga/penawaran, edit peserta lelang submitted belum dieksekusi; sebagian menjadi backlog di bawah. Status disabled/menu bukan bukti aturan backend.

## Kandidat yang perlu ditindaklanjuti

### B02-C01 — Draf lewat hari kedaluwarsa tetap tersedia dan dapat dibuka

- Bukti waktu dari server sendiri: GET `/api/lelang?tab=DRAF&page=1&limit=20` mencatat `serverNow=2026-10-08T04:41:17.457Z`. Dari 20 baris pertama, **14** memiliki tanggal kedaluwarsa sebelum 8 Oktober. Tidak menggeneralisasi ke seluruh 109 draf.
- FTL ID `be47c2f2-cffa-456e-9329-4e406110262a`: `kedaluwarsaAt=2026-09-30T07:58:53.255Z`, `sisaHariKedaluwarsa=0`, `actions.EDIT.allowed=true`. Card menampilkan tanggal 30/09/2026 dengan **Hari ini** pada 8 Oktober.
- Klik Edit Data melalui UI membuka `/lelang/buat?id=...`, step Peserta Lelang; form dan vendor dapat dibaca. FCL ID `13902fcd-fffa-41fb-ab80-7e8356fa553f` juga membuka step peserta, padahal expiry API 02/10/2026.
- Pembanding: AMS002 REQ-013 / SCN-0026 dan AMS001 REQ-008 / SCN-0016 menyatakan draf lewat hari kedaluwarsa hilang/tidak dapat dilanjutkan. Kandidat mencakup filtering/akses baca dan label, **belum membuktikan backend mengizinkan penyimpanan**.
- Usulan: label expired berbeda dari Hari ini, konsistensi filtering dan guard akses draf, cleanup sesuai rule. Tambahkan cek draf stale beberapa hari, pergantian hari zona WIB, serta deep link draf expired dalam run formal dengan fixture sendiri.
- Bukti Admin: `main-expired-draft-evidence.json`, `main-draft-expired-open.json`, `main-participants-fcl.json`, screenshot `draft-expired-card.png` dan `draft-expired-open.png`.

### B02-C02 — Definisi “Penawaran” dan counter tidak konsisten

- Detail Admin FCL **FCL-NRM-03/081026** (`eba6dfe6-ff53-422e-8ea4-8d6a251a5e03`) menulis **Penawaran = Telah input harga dan jadwal**, namun total **1 dari 2 vendor** menghitung peserta IK berstatus **Input Harga**. API `jumlahPenawaran=1`, peserta IK `status=INPUT_HARGA`; peserta kedua BELUM_INPUT.
- Detail Vendor untuk lelang yang sama menampilkan enam harga, seluruhnya **Belum Input Jadwal / 0 jadwal**. Ini menguatkan perbedaan antara keterangan dan perhitungan, bukan sekadar asumsi dari nama badge.
- Detail FTL02 memakai keterangan harga saja, tetapi form Lelang Ulang FTL02 memakai keterangan **harga dan jadwal**. Penyebutan jadwal FTL tidak sesuai alur FTL yang diamati.
- Pembanding FCL REQ-046 / SCN-0091–0092 membedakan Input Harga dan Input Penawaran. Rule terbaru harga tanpa jadwal harus tetap dipertimbangkan sebelum menentukan expected counter. Kandidat belum menjadi failed formal atau alasan menolak harga tanpa jadwal.
- Usulan: putuskan counter menghitung vendor yang menginput harga atau vendor yang melengkapi penawaran; selaraskan keterangan, status dan counter per FCL/FTL. Uji satu vendor dengan banyak harga dan campuran harga tanpa/dengan jadwal.
- Bukti: `main-detail-fcl.json`, `main-api-responses.json`, `main-repeat-ftl-form.json`, Vendor `vendor-detail-fcl.json` serta screenshot detail dan ulang.

### B02-C03 — Riwayat Perubahan Vendor menuju daftar Penawaran

- Dari daftar Vendor, buka menu card FCL-NRM-03/081026 lalu klik tombol dengan teks persis **Riwayat Perubahan**. Dua kali percobaan dari daftar menghasilkan `/vendor-portal/penawaran`, halaman daftar harga seluruh penawaran, bukan riwayat lelang yang dipilih.
- Percobaan kedua menyimpan outerHTML tombol dan inventory sebelum/sesudah; GET tujuan `/api/vendor/penawaran?tab=SEMUA_PENAWARAN&page=1&limit=20` tanpa scope ID lelang. Tidak ada API gagal; kandidat salah tujuan menu, bukan masalah autentikasi atau timeout.
- Expected berdasarkan label menu adalah riwayat perubahan lelang terpilih; detail entitlement/isi riwayat Vendor belum dinyatakan eksplisit oleh skenario yang dibandingkan. Usulkan triage tujuan menu lalu skenario navigasi/role Vendor tersendiri; jangan mengubah expected suite dari observasi ini saja.
- Bukti Vendor: `vendor-history-menu-before.json`, `vendor-history-fcl-recheck.json`, `vendor-history-fcl.json`, `vendor-api-responses.json`, screenshot `vendor-history-redirect-recheck.png`. Snapshot bernama history-fcl merupakan **tujuan salah**, bukan bukti riwayat berhasil. Halaman Penawaran terbuka sebagai akibat menu tersebut; tidak melanjutkan eksplorasi aksi harga Batch05.

## Rule yang diamati dan perubahan dari bukti lama

| Area | Observasi sekarang | Batas/implikasi |
|---|---|---|
| Filter Admin | Nomor fiktif menghasilkan 0; Reset mengembalikan 435/109 | Filter aktif mengubah accessible name menjadi `FilterFilter aktif`; locator exact lama gagal, bukan bug filter |
| Multipickup | FTL-MPT-07/071026 menampilkan dua pickup Surabaya dan alamatnya berurutan | Tunggu data tooltip/popover selesai; klik ulang saat overlay menutup tombol bukan bukti aplikasi gagal |
| Draf | 109 data; kedua step dapat ditemukan; Edit Data menuju query `buat?id=` | Jangan menyamakan route draf dengan `/lelang/{id}/edit` |
| Metode FCL | THC/LOLO asal/tujuan wajib terkunci; trucking mengikuti Door/CY | Matriks empat metode direkam, bukan hanya Door to Door |
| Lokasi FCL | Door–Door bisa tambah muat/bongkar; Door–CY hanya tambah muat; CY–Door hanya bongkar; CY–CY keduanya disabled | Ganti Door–Door dua lokasi menjadi CY–CY memangkas ke satu per sisi, tipe kembali Normal; perubahan hanya lokal |
| Kontainer | 11 opsi tersedia; 20 ft dan 40 ft dapat dipilih bersama | Temuan lama pilihan kontainer terlalu sedikit tidak tereproduksi pada master saat ini |
| Asuransi | Input 1000000/2000000 tampil 1.000.000/2.000.000; detail FTL menunjukkan nilai barang | Temuan format lama dan nilai barang hilang pada ulang FTL tidak tereproduksi pada sampel |
| Durasi | 5/10/15/25 menit, 1/3/6/12 jam, 1/2/3/7 hari | Berasal setting/master; jangan hardcode jumlah opsi sebagai expected tetap |
| Waktu | Buka 09/10/2026 12:00 +10 menit → Tutup disabled 12:10 | Belum memverifikasi boundary rencana awal > tutup, timezone server, lintas tengah malam atau submit |
| Reuse FTL | FTL-MPT-07/071026 menyalin Trailer 20 FT/Trailer 40 Feet, dua muat/dua bongkar dan syarat | Temuan jenis armada tidak tersalin tidak tereproduksi; uncheck mempertahankan hasil |
| Reuse FCL | FCL03 menyalin kontainer 20/40, metode, pelabuhan dan biaya termasuk Forklift | Waktu lama sumber tidak tersalin; Buka yang telah diisi lokal bertahan, durasi reset. Jangan menyatakan seluruh input waktu otomatis dikosongkan |
| Peserta | Step draf FTL/FCL memuat 10 vendor; kota sekarang terisi; Surabaya menyaring 10→4; pencarian fiktif →0 | Rating/filter rating tidak terlihat pada form peserta dan ulang yang dibaca; gap terhadap AMS001 REQ-040 dan AMS002 REQ-040/041 masih perlu triage |
| Pilih semua | Checklist lokal menampilkan “Semua vendor diundang” | Tidak membuktikan undangan terkirim atau persistensi; tidak Simpan |
| Status detail FCL | Semua Status, Belum Input, Input Harga, Input Penawaran | Konfirmasi makna counter dibutuhkan pada B02-C02 |
| Riwayat perubahan | Route FCL03 terbuka dengan “Belum ada riwayat perubahan” | Temuan 404 lama tidak tereproduksi; belum membuktikan audit setelah edit |
| Ulang | Banner harga lama terkunci selama ulang; harga baru tertutup sampai tutup; harga lama yang belum diperbarui kembali bersama harga baru | Rule terlihat di UI; tidak memicu ulang atau menguji transisi/pesanan/nego |
| Batal form | Konfirmasi Tidak/Ya tanpa role=dialog; Tidak mempertahankan input | Tidak submit/meninggalkan data tersimpan |
| Vendor | FCL03 Input Harga, FTL02 Input Penawaran; daftar menunjukkan Harga saya 6/3 | Hanya observasi role dan detail, bukan pengujian aturan input harga Batch 05 |

Label TOP sudah dikenal di analysis/detail; bukan fitur baru di luar spec. Label jumlah unit “-” pada detail tidak dijadikan bug karena keputusan user meniadakan input jumlah tersebut.

## Improve dan gap skenario

| ID | Usulan | Hubungan dengan skenario existing |
|---|---|---|
| B02-I01 | Jelaskan secara rinci field yang disalin/reset, termasuk durasi dan lima waktu; beri peringatan saat perubahan metode memangkas lokasi | Reuse sudah tercakup, mis. AMS002 SCN-0041/0047/0048. Tambahan: reuse setelah pengguna mengisi waktu lokal dan peringatan kehilangan lokasi |
| B02-I02 | Putuskan kelanjutan rating/filter rating atau revisi expected yang telah disetujui produk | Gap existing AMS001 SCN-0079/0080; AMS002 SCN-0079/0081. Absennya bukan improve baru dan tidak diam-diam dihapus dari skenario |
| B02-I03 | Definisi counter penawaran eksplisit per tipe dan tahap; tooltip jumlah vendor vs jumlah harga | Memperluas status existing FCL SCN-0091/0092, terkait B02-C02 |
| B02-I04 | Label ikon Aksi/paging dan selector stabil; Filter memiliki nama aksesibel stabil saat aktif | Observasi 0 testid; menu title=Aksi tanpa aria-label. Mendukung otomasi dan aksesibilitas |
| B02-I05 | Pisahkan Hari ini/Expired, serta guard stale draft dan deep link | Rule expiry sudah existing; tambahan matriks beberapa hari overdue dan WIB terkait B02-C01 |
| B02-I06 | Counter numerik vendor terpilih tetap terlihat ketika pilih semua; jelaskan apakah mencakup hasil filter atau semua eligible | Existing counter lintas pagination belum dibuktikan karena fixture hanya 10 vendor; jangan mengklaim lintas halaman lulus |

## Hipotesis dan metode

Login Admin/Vendor memakai konfigurasi existing dan klik native berhasil; kalibrasi ulang tidak diperlukan. Tidak menyimpan storageState dan tidak mengulang uji lintas context (#2 tetap bukti historis). Dropdown form/filter kustom, ukuran halaman select native. Kalender form kustom dengan 43 `button.h-9.w-9` serta input Waktu (24 jam); perlu memilah overflow/disabled. Dialog Batal tanpa role=dialog, sementara modal dashboard Batch 01 punya role tersebut. Inventaris list/form yang dibaca tetap 0 data-testid.

Harness memblokir request bisnis non-GET/HEAD/OPTIONS setelah login, dengan pengecualian auth. Summary tiap role mencatat request dan blockedWrites: **0 request bisnis non-read, 0 blockedWrites, 0 API status >=400**; POST yang tercatat hanya auth/refresh otomatis. Kedua browser ditutup. Perubahan form/pilihan peserta hanya lokal, tidak Selanjutnya/Simpan/Simpan ke Draf/hapus/batalkan lelang; fixture nego berdeadline 9 Oktober tidak disentuh.

## Bukti dan pekerjaan tersisa

- Admin JSON/screenshot asli: `artifacts/explore-batches/20261008/batch02-2026-10-08T04-39-05-116Z/`.
- Vendor JSON/screenshot asli: `artifacts/explore-batches/20261008/batch02-2026-10-08T04-53-32-026Z/`.
- Salinan screenshot sesuai workflow: `artifacts/screenshots/explore/20261008/batch02-main/` dan `batch02-vendor/`.
- JSON utama: `main-list-initial.json`, `main-filter-no-match.json`, `main-filter-reset.json`, `main-fcl-method-matrix.json`, `main-fcl-insurance-format.json`, `main-fcl-time-calculation.json`, reuse, peserta, detail, riwayat dan ulang; `main-api-responses.json`, `main-session-summary.json`; Vendor list/detail/tab/search/API/summary.
- Beberapa snapshot awal diambil sebelum navigasi/data selesai; `detail-ftl-settled`, `history-fcl-settled`, `multipickup-settled` dan hasil form reuse terisi adalah bukti pengganti. FCL dropdown reuse sempat tercatat 0 sebelum load, lalu sumber berhasil dipilih; bukan bug dropdown kosong. Error locator/timing disimpan terpisah, bukan verdict aplikasi.
- Belum: periode reuse batas 90/91 hari, durasi lintas hari, semua kondisi biaya/validasi negatif, upload, perpindahan step melalui submit, rating/default sorting, counter lintas pagination, edit data submitted/edit peserta, riwayat ulang berisi data dan riwayat perubahan Vendor yang benar, alasan/status pembatalan, audit setelah edit, persistensi draf, transisi expiry/ulang, akses backend role lain. Pengujian yang membutuhkan tulis memakai fixture run sendiri dan workflow test-module.
- Batch 02 read-only selesai untuk cakupan yang diperiksa, dengan backlog eksplisit; bukan seluruh skenario AMS001/002 lulus. Batch berikutnya **03 Lelang Kontrak**, belum dijalankan.

Verifikasi artefak: 101 JSON valid, 21 screenshot tersalin, tidak ditemukan kredensial akun pada JSON/dokumen yang diperiksa; `git diff --check` bersih.
