# Eksplorasi Batch 04 — Live Bidding dan Laporan Lelang, 8 Oktober 2026

Read-only pada Admin dan Vendor IK, Spot Rate/Kontrak. Pembanding: analysis serta `*.scenarios.json` AMS003/AMS005; format dokumen ini memakai ID semantik `AMS003-...`/`AMS005-...` dan field `requirement` tunggal. Tidak tersedia suite khusus Live Bidding/Laporan Kontrak. Tidak menjalankan suite formal atau Batch05, tidak submit bid/nego/order/perubahan setting. File XLSX di bawah merupakan **ekspor aplikasi yang dibaca**, bukan report verdict automation.

## Menu dan route

| Role | Route | Menu/aksi diperiksa | Hasil |
|---|---|---|---|
| Admin | `/lelang/live-bidding` | Live Bidding/Laporan pada route sama; sub-tab Semua/FCL/FTL, Filter, Reset/Terapkan, Export | Spot live kosong; laporan default82lelang, halaman1 berisi20lelang/33card |
| Admin | `/lelang-kontrak/live-bidding` | Live/Laporan, sub-tab, Export, Detail Lelang | Live satu FCL; laporan Semua4lelang/8card pada saat sesi |
| Admin | `/lelang-kontrak/{id}` | Detail Lelang dari laporan | Link card menuju detail kontrak yang benar |
| Vendor | `/vendor-portal/live-bidding` | Live saja, Filter, sub-tab, Tampilkan | Tidak ada card Spot Rate aktif, tidak ada tab Laporan |
| Vendor | `/vendor-portal/lelang-kontrak/live-bidding` | Live saja, Filter, kalender, sub-tab | Tidak ada card kontrak yang mengundang IK dan sedang buka; tanpa Laporan |

Jumlah adalah snapshot, bukan expected tetap. Admin melihat Kontrak FCL milik vendor lain; daftar Vendor kosong bukan bukti bug akses. Spot Rate yang buka pada batch sebelumnya sudah tutup ketika Batch04 berjalan sekitar13WIB.

## Kandidat

### B04-C01 — Ekspor mengambil Top 3, bukan seluruh penawaran; slot kosong ikut menjadi baris

Pembanding **AMS003 REQ-015**, `AMS003-LIVE-BIDDING-SHIPPER-POS-015` (semua penawaran sesuai filter) dan `AMS003-LIVE-BIDDING-SHIPPER-EDG-005` (tanpa penawaran satu baris kosong).

- Ekspor default Spot Rate mencakup **82 nomor lelang unik**, cocok total daftar dan melampaui halaman aktif20lelang. File valid ZIP/XLSX dan worksheet berhasil dibaca. Ini membuktikan cakupan nomor lintas halaman pada sampel, bukan kelengkapan seluruh penawaran.
- **FCL-NRM-15/071026**: API penawaran yang dipakai halaman memiliki **4 items** dengan total94.050 /99.000 /103.950 /108.900. Vendor urut Solutiva/Astra/Solutiva/Astra. `top3` hanya3items.
- File default hanya memuat tiga penawaran pertama. Recheck melalui filter nomor persis menghasilkan1lelang/1card; ekspor terpisah tetap3baris harga dan tidak memuat **Astra108.900**. Ini menghilangkan alasan pagination/filter campuran.
- FTL-NRM-06/081026 tanpa penawaran memiliki7jenis armada; file default membuat **21baris Top1/2/3** dengan vendor/harga `-`, alih-alih satu baris kosong per lelang sesuai analysis. Format saat ini menyerupai ekspor Top3 card.
- Kandidat terhadap requirement existing, belum verdict formal. Bila produk memang menghendaki laporan Top3, keputusan dan expected skenario perlu direvisi secara eksplisit. Jangan diam-diam menganggap Top3 sama dengan semua penawaran.
- Bukti: `main-api-responses.json`, `main-report-filter-fcl15.json`, `main-spot-export.json`, `main-export-filtered-fcl15.json`, XLSX default/filtered dan hasil parsing/reconciliation di folder Admin.

### B04-C02 — Workbook ekspor Kontrak berjudul Spot Rate

- UI Laporan Kontrak menunjukkan4lelang/8card; file **Laporan Lelang Kontrak - 08102026.xlsx** berhasil diunduh.
- Judul worksheet baris1 tetap **Laporan Lelang Spot Rate**. Header tabel juga memakai **Periode Pengiriman**, sementara UI konteks Kontrak memakai Periode Kontrak.
- Isi memuat nomor kontrak FTL04/081026, FTL02/031026, FTL10/021026 dan FTL08/021026. Ini kesalahan konteks judul/header, bukan kesimpulan seluruh data ekspor berasal dari Spot Rate.
- Belum ada requirement ekspor Kontrak khusus; kandidat berdasarkan konsistensi UI/file. Improve: template, judul, header periode dan metadata tipe lelang disesuaikan; uji template kedua tipe terpisah.
- Bukti: `main-contract-report.json`, `main-contract-export.json`, XLSX Kontrak dan `.parsed.json`.

## Rule yang diamati

| Area | Observasi/bukti | Batas |
|---|---|---|
| Pemisahan tipe | Spot API `/api/lelang`; Kontrak `/api/lelang-kontrak`; laporan memilih `sudahTutup=true`, live `status=SEDANG_BUKA` | Tidak memperlakukan Kontrak sebagai scope AMS003/005 yang eksplisit Spot Rate |
| Filter | No, Buka/Tutup, periode pengiriman/kontrak, jenis/tipe, kota asal/tujuan, pelabuhan asal/tujuan; laporan menambah Vendor | Label/filter tersedia bukan bukti semua kombinasi/backend benar |
| Search/Reset laporan | Nomor fiktif82→0; Reset→82. NomorFCL15→1 | Filter harus dibuka melalui tombol; kontrol terklip masih bisa terdeteksi visible oleh locator |
| Sub-tab laporan | Semua82, FCL99, FTL146 dengan request serviceType sesuai pilihan | Filtering memperluas historical scope; jangan menyimpulkan146+99 harus82 tanpa melihat rule retensi ketika filter aktif |
| Retensi | Default ekspor metadata5–8Oktober,82nomor; halaman pertama waktu tutup7–8Oktober walaupun sebagian nomor bertanggal2Oktober | Tanggal dalam nomor bukan waktu tutup. Semua82waktu sumber/H+3 tepat WIB dan query historis khusus belum divalidasi menyeluruh |
| Paging | Default20 **lelang**, bukan20card; satu lelang pecah per jenis unit | UI menuliskan33data(20lelang) Total82. Kontrol pagination terlihat; pindah halaman belum diuji khusus, ekspor melampaui halaman aktif terbukti |
| Top3 setelah tutup | Nama vendor dan nominal terlihat; vendor sama dapat menempati beberapa ranking; slot kosong `Rp •••••••` | RankingDPP/tie-break/locking setelah tutup belum dibuktikan dengan bid/transisi |
| Counter FCL | FCL03 laporan1/2, sama dengan Batch02 ketika harga tanpa jadwal dihitung | Perlu definisi produk terbaru; lanjutkan B02-C02, bukan kandidat baru yang menolak harga tanpa jadwal |
| Multipickup laporan | FCL-MPT-23/021026 membuka rincian Pickup1Balikpapan/Pickup2KabupatenTangerang | Tidak menguji filter kota semua titik atau seluruh urutan drop |
| Live Kontrak | FCL04/021026,20Feet,0/1vendor, semuaTop3masked; Detail mengarah `/lelang-kontrak/9245...` | Tidak ada harga sampel; privasi nama/harga peserta nyata belum diuji |
| Countdown | Sebelum06hari10jam50menit29detik → sesudah25detik selama observasi sekitar3detik | Berkurang tanpa reload; bukan bukti ketepatan perdetik/batas warna atau card hilang pada nol |
| Aksi | Admin live tidak memiliki Export/Lihat Penawaran; laporan memiliki Export/Lihat Penawaran/Detail; Vendor tanpa Laporan | Pengujian akses backend bukan sekadar keberadaan menu |
| Vendor kosong | Spot/Kontrak empty state sesuai konteks | Bid/history tidak tersedia tanpa card; tidak klik Bid Harga atau membuat fixture |
| Kalender | Filter Admin Spot50 `button.h-9.w-9` terhitung, tanpa input date/datetime-local | Angka mencakup elemen navigasi/overflow; jangan hardcode jumlah43 dari form buat lelang |
| Nama file Spot | `Laporan Lelang Spot Rate - 08102026.xlsx` | Berbeda dari pola `Laporan_Lelang_<tanggal>.xlsx` pada REQ015; gap naming dipisahkan dari kehilangan data |

## Improve dan gap skenario

| ID | Usulan | Hubungan coverage |
|---|---|---|
| B04-I01 | Tegaskan laporan seluruh penawaran vs ringkasan Top3; metadata jumlah lelang/card/baris harga dan file kosong | Existing REQ015/EDG005; perlu rekonsiliasi4+penawaran dan7unit tanpa harga, terkait C01 |
| B04-I02 | Template terpisah Spot/Kontrak, header periode benar, nama file stabil | Kontrak belum suite khusus; C02. Nama Spot tidak mengikuti pattern analysis |
| B04-I03 | Indikator “hasil historis” ketika filter/sub-tab memperluasH+3; tooltip bahwa Tampilkan menghitung lelang | Existing AMS003REQ004/013; data total82→99/146 perlu penjelasan scope supaya tidak dianggap counter rusak |
| B04-I04 | Status koneksi live dan waktu update terakhir; pemulihan reconnect tanpa kehilangan filter | Koneksi live terus terbuka diamati; hanya keberadaan koneksi, bukan bukti realtime bid diterima. Coverage existing realtime dapat diperluas reconnect/tablama/offline |
| B04-I05 | Fixture sendiri FTL/FCL vendor diundang, posisi sendiri Top3/tidakTop3, bid≥4, lelang mendekati tutup | AMS005REQ011/014–021 tersedia tetapi belum terverifikasi pada sesi kosong; tidak membuat fixture lewat explore |
| B04-I06 | Konsistensi nama/hitungan peserta FCL harga vs harga+jadwal di list/detail/live/laporan | B02-C02 berlanjut; reconcile dengan AMS009 rule baru sebelum mengubah expected |
| B04-I07 | Selector tab berdasarkan role, label filter stabil dan keadaan panel yang aksesibel | Filter tertutup masih meninggalkan kontrol dalam DOM; gunakan klik pembuka dan tunggu keadaan aktual, bukan force/dispatch |

## Hipotesis, metode dan batas

Login existing native sukses, tanpa kalibrasi. Context role dijalankan berurutan tanpa storageState. Dropdown filter kustom, Tampilkan native, tab memakai role=tab. Tidak ada form Bid aktif yang bisa dibaca; checklist form sebelumnya tetap historis, observasi baru hanya form filter/kalender. Modal Bid/history Vendor belum tersedia; jangan mengubah hipotesis modal berdasarkan empty state. Testid0 pada inventaris yang dibaca; storageState tidak diuji ulang.

Sesi Admin awal dihentikan karena pengumpulan respons menunggu koneksi stream/event yang terus terbuka. Sesi berikutnya mengecualikan stream dari parsing JSON dan memakai batas tunggu/elemen selesai loading. Snapshot awal `main-spot-live.json` masih Memuat; `main-spot-live-settled.json` adalah bukti pengganti. Tidak melaporkan hang harness sebagai bug aplikasi. Timeout Terapkan ketika panel terklip ditangani dengan membuka Filter secara eksplisit; interaksi berikutnya native berhasil.

Belum: otomatis muncul/hilang saatbuka/tutup/cancel, zero countdown, warna24jam/1jam, tie-breakDPP/rating/timestamp, seluruh defaultretention82record/H+3boundary, seluruh kombinasi filter/rute, page navigation, exportfailure, semua harga/retensi Kontrak, akses/privasi payload Vendor, riwayat dan validasi Bid, realtime Top3 setelahsubmit/reconnect. Tidak memberi verdict formal seluruh AMS003/005 atau menghasilkan Excel hasil test.

## Bukti dan handoff

- Admin utama: `artifacts/explore-batches/20261008/batch04-2026-10-08T06-06-40-878Z/`.
- Admin awal dihentikan: `artifacts/explore-batches/20261008/batch04-2026-10-08T06-05-34-399Z/`; bukan run utama.
- Vendor: `artifacts/explore-batches/20261008/batch04-2026-10-08T06-11-31-066Z/`.
- Screenshot salinan: `artifacts/screenshots/explore/20261008/batch04-main/` dan `batch04-vendor/`; header akun disembunyikan lokal, JSON disanitasi.
- Tiga ekspor aplikasi: default Spot, Spot filteredFCL15, Kontrak. XLSX valid dan worksheetdibaca lewat ZIP/XML; tidak menganggap fileterunduh saja berarti data benar.
- Tidak submit/simpan/hapus/bid/order/nego, tidak mengubah setting atau fixturedeadline9Oktober. Batch04 selesai untuk cakupan baca yang diperiksa; **Batch05 Penawaran/Harga/Jadwal belum dijalankan**.

Verifikasi akhir: 49 JSON valid, 7 screenshot tersalin, tiga workbook XLSX valid/dibaca; tidak ditemukan kredensial pada JSON/dokumen yang diperiksa. Summary utama kedua role: 0 API status >=400, 0 request tulis bisnis, 0 blockedWrites; POST hanya auth/refresh. Kedua browser ditutup dan `git diff --check` bersih. Kalender Vendor sempat tetap terbuka setelah Escape dan menghalangi tab; klik luar pada No. Lelang menutupnya, lalu native click sub-tab berhasil. Bukti filter Vendor: contract-filter-empty/reset dan contract-datepicker; empty state tidak membuktikan filtering record populated.
