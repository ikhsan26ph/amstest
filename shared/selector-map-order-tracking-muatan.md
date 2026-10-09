# Selector eksplorasi Order / Tracking / Simulasi Muatan — 8 Oktober 2026

Bukti dan batas: explore/explore-batch07-20261008.md. Login memakai parameter config/env.md, klik native; jangan hardcode akun/URL dasar. Tidak ada data-testid pada inventaris list/form yang diperiksa.

| Area | Locator/pola teramati | Catatan |
|---|---|---|
| List Order |getByRole('button', {name:/^Filter/}), Reset; select ukuran halaman |Dropdown filter kustom button/option; selectOption hanya untuk select native. |
| Baris Order |Scope row berisi ID, lalu tombol menu/Detail |getByText ID global strict dapat cocok dua kali dengan tombol Salin; jangan pilih nomor pertama tanpa memeriksa row. |
| Detail |Visualisasi Muatan; Edit Order; Batalkan Order |Dua terakhir berpotensi write, tidak dieksekusi. Visualisasi membuka modal;3D belum terverifikasi. |
| Create/Batch |Buat Order, Batch Order; FTL/FCL/LTL/LCL; Batal |Selanjutnya dapat menyimpan progress, bukan navigasi baca yang aman. Batal membuka konfirmasi tanpa role=dialog; Ya hanya untuk membuang input lokal pada form yang dibuka sesi. |
| Template |Download Template Excel → Normal/Multipickup/Multidrop/Multipoint |Pasang listener download sebelum memilih submenu yang benar. File input teramati; jangan import. |
| Riwayat perubahan |Menu Riwayat Perubahan → /order/{id}/riwayat |Halaman, bukan modal. Filter tanggal/pelaku dan Terapkan/Reset. |
| Kalender filter Vendor |.flatpickr-day |70sel termasuk tanggal overflow; button.h-9.w-9 bukan selector sel hari. Periksa bulan/disabled sebelum memilih. |
| Tracking |/penugasan-tracking; Filter, Reset |Kedua role kosong; Admin memiliki filter Vendor. Belum locator detail/penugasan. |
| Simulator |radio Armada/Kontainer; Pilih Barang; Cek Visualisasi; Lanjutkan Order |Radio check native berhasil. Lanjutkan Order tidak dijalankan. |
| Picker barang |Checkbox barang; button /^Tambahkan/; Tutup |Nama dinamis Tambahkan(1), tidak exact Tambahkan. Picker tanpa role=dialog pada sampel. |

Perhitungan baca memakai POST: /api/order/stuffing/visualisasi, /api/simulasi-muatan/rekomendasi, /api/simulasi-muatan/hitung. Allowlist harus spesifik setelah memastikan fungsi tidak menyimpan data. Simpan/Submit/Import/konfirmasi/penugasan tetap diblokir. Toast akibat abort harness tidak menjadi temuan aplikasi. Jangan menunggu seluruh pending response tanpa batas; response stream dapat menggantung.

## Pemeriksaan fokus AMS009 — 8 Oktober 2026 malam

Bukti: explore/ams009-order-penugasan-fcl-20261008.md dan artifacts/explore-batches/20261008/batch07-2026-10-08T13-19-46-391Z.

| Area | Locator aktual | Batas |
|---|---|---|
| Sidebar Order Admin | getByRole('link', {name:'Order', exact:true}) → /order | Tunggu waitForURL dan heading Daftar Order; klik SPA dapat selesai sebelum route berubah. |
| Row FCL | getByRole('row').filter({hasText:'ORD1427559140'}); getByRole('button').last() | ID ini hanya sampel existing, bukan fixture run. Ada baris kosong; jangan first() tbody. |
| Menu Detail | getByText('Detail', {exact:true}) setelah membuka menu row | Menu sampel tidak memiliki menuitem. Edit terkunci pada order lelang tersimpan. |
| Filter ID | getByPlaceholder('Masukkan ID Order', {exact:true}); button Terapkan/Reset | ID fiktif memberi0data; Reset mengembalikan4data sampel. |
| Filter jenis | button Semua Jenis → option | Native select hanya untuk ukuran halaman10/20/50/100. |
| Kalender filter Admin | button Pilih Tanggal pertama → .flatpickr-day |70sel; hindari overflow/disabled. |
| Form FCL | button /^FCL\s/; button Pilih Jenis Kontainer/Pilih Pelabuhan Asal | Opsi aktual kontainer20ft/40ft/dll; pelabuhan Makassar(MKS),Semayang(BPN),TanjungPerak(TJP), bukan fixture JSON SUB/PNJ. |
| Jumlah Kontainer | getByPlaceholder('Masukkan Jumlah Kontainer', {exact:true}) | input type=text, bukan spinbutton usulan. |
| PIC | placeholder Masukkan PIC Pengirim/Penerima; Masukkan No. WhatsApp PIC | WhatsApp dua field; scope pengirim/penerima. Wilayah/alamat disabled pada form sampel. |
| Batal lokal | button Batal → teks Apakah Anda yakin ingin membatalkan ?; button Tidak/Ya | Tidak memiliki role=dialog. Ya hanya membuang input lokal yang dibuka run. |
| Batch FCL | button /^FCL\s/ → button Download Template Excel | Menu Normal/Multipickup/Multidrop/Multipoint; Import adalah write, tidak dicoba. |

Eksplorasi ini tidak mengeksekusi Selanjutnya/Simpan/Draf/Import, konfirmasi order atau penugasan. Tidak ada data-testid pada list/form yang diperiksa.

Vendor fokus AMS009: sidebar link Order → /vendor-portal/order, heading Daftar Order render async; tunggu settled bila timeout awal. Buat Order tidak tersedia. Tracking link → /penugasan-tracking. Keduanya0data akun sampel, belum locator konfirmasi/penugasan berisi record.

## Verifikasi AMS010 — 9 Oktober 2026

Bukti eksekusi: `artifacts/test-module/ams010-order-ftl-shipper/20261009-002826/`.
Klik native tetap bekerja, tanpa `data-testid`. Tunggu `waitForURL` dan elemen/data tujuan;
`domcontentloaded` saja tidak menjamin navigasi SPA atau daftar eligible sudah selesai.
Tidak ada elemen `<main>` pada halaman yang diuji: baca body dengan sanitasi akun.

| Area | Locator aktual / perilaku |
|---|---|
| Card penawaran | `div.min-w-0.flex-1` berisi nama vendor dan jenis armada; pilih container terkecil dengan mengecualikan descendant container sekelas. Scope `Pesan` ke card, karena beberapa vendor/armada memiliki tombol yang sama. Badge Nego dapat membuat teks jenis armada bukan node exact terpisah; verifikasi teks card dan keunikan binding. |
| Wizard lelang | `/order/buat-dari-lelang`; empat step Data Pengiriman, Data Barang, Vendor dan Harga, Review. Input PIC/WA berulang harus di-scope ke section Data Pengirim/Penerima atau Muat tertentu. Pesan required shipping berupa toast `Lengkapi PIC dan No. WhatsApp setiap titik`. |
| Barang Normal | Heading `Armada n` berada pada header div; parent dua tingkat memuat unit. Baris barang di-scope dengan SKU, bukan semua row halaman. Quantity input teks; input nilai menggunakan placeholder `0` ketika asuransi unit aktif. |
| Barang Multipickup | Satu unit armada mempunyai grup barang terpisah untuk setiap Pick Up. Ada beberapa `Pilih Barang` di dalam unit yang sama: scope lagi ke grup pickup/alamat. Jangan menganggap satu heading armada berarti satu tabel. |
| Picker barang | Placeholder `Cari Kode SKU atau Nama Barang`; row picker memiliki checkbox. Scope row berdasarkan SKU + checkbox supaya tidak menangkap row barang yang sudah ditambahkan. Tombol `Tambahkan...`; tunggu picker hilang sebelum menekan Selanjutnya. |
| DO | Input pada container label `Nomor DO`; penambahan tag dengan koma. Placeholder dapat hilang setelah tag terbentuk. Tombol hapus SKU berbeda dari tombol hapus tag DO. |
| Tanggal muat | Picker kustom, tanpa textbox datetime bebas atau input datetime-local. Tentukan tanggal aktif/bulan dan waktu melalui kontrol aktual, bukan input DOM buatan. |
| Review | Accordion button exact `Jenis Pengiriman dan Rute`, `Data Pengirim`, `Data Penerima`, `Data Barang`, `Vendor dan Harga`; periksa `aria-expanded` sebelum membandingkan isi. Nama step juga muncul di header wizard, sehingga getByText tanpa role bisa ambigu. |
| List shipper | Row berisi ID → `button[title="Aksi"]`. Lanjut draft bernama `Lanjutkan Pengisian`. ID memiliki button aria-label `Salin <ID>`, Nomor Lelang berupa teks di sel ID. Filter dibuka eksplisit; Reset bisa sudah terlihat saat panel tertutup. |
| List vendor | Pending mempunyai shortcut button `Konfirmasi Order`; action utama `button[title="Detail"]`, bukan dropdown Aksi. Shortcut hilang setelah Terima/Tolak. |
| Konfirmasi vendor | Container `div.fixed` yang memiliki radio `Terima Order`; tanpa role=dialog. Radio exact `Terima Order`/`Tolak Order`, alasan textarea, `Batal`/`Simpan`. Simpan disabled sebelum pilihan. Submit popup stale setelah tab lain menolak memberi409. |
| Penggantian | Action shipper `Pilih Penawaran Lain`; daftar alternatif memakai `Pilih`, bukan Pesan. Review dua step. Commit aktual POST `/api/order/auction` dengan `replacedFromOrderId`, membuat ID pengganti baru; bukan PATCH ID lama. Mock kegagalan hanya pada request terikat order uji sebelum commit. |
| Riwayat | Pembatalan `/order/riwayat-pembatalan` dan penolakan diganti `/order/riwayat-tidak-aktif` berbeda. Order lama Ditolak tetap terlihat pada list vendor asal. |
| Penugasan | `/penugasan-tracking/tambah`, placeholder `Cari order...`; tunggu card order eligible terlihat setelah navigasi. Master `Pilih No. Polisi/Jenis Armada`, `Pilih Sopir/No. WhatsApp`; radio berulang `Pilih Dari Master`/`Isi Data Manual`, scope ke unit dan kategori. Simpan form membuka `Konfirmasi Penugasan`; Simpan kedua harus di-scope ke modal. |
| Detail penugasan | `/penugasan-tracking/<assignmentId>` dari menu Detail. Button accordion `Detail Data Order`, `Informasi Penugasan`, `History Tracking`; `Per Lokasi`/`Timeline` berupa button pada sampel. Tunggu `Memuat timeline...` hilang sebelum menilai empty state. No. Lelang berada di section Detail Data Order. |
| Notifikasi | Vendor preferensi `/vendor-portal/setting/preferensi-notifikasi`, inbox `/vendor-portal/notifikasi`. Baca state checkbox, jangan Simpan setting. Bukti inbox kosong lebih kuat daripada unread-count saja; jangan klik tandai dibaca/hapus untuk pemeriksaan delivery. |

Perhitungan aktual pada sampel: SKU12,5kg/0,018m³ ×qty200 =2500kg/3,6m³.
`Nilai Barang` digunakan sebagai total baris pada UI/API yang teramati; tidak otomatis dikalikan qty.
Ini belum mengesahkan asumsi oracle A18 yang menyebut nilai satuan. Kapasitas, pajak, harga dan
tarif asuransi harus dibaca dari offer/master aktual, bukan angka contoh mockup.
# Verifikasi fokus blocked AMS010 — 9 Oktober 2026, run20261009-020419

- Heading `Detail Penugasan` memiliki child link `aria-label=Kembali`; accessible name heading mencakup Kembali. Gunakan `getByRole('heading',{name:/Detail Penugasan/})`, lalu tunggu visible. Exact name Detail Penugasan dapat timeout meski teks terlihat.
- Wizard order dari lelang: PIC/WA di Step01 berupa input tanpa placeholder. Scope per card/label atau inventaris empatinput Normal; jangan membawa placeholder form order langsung ke form dari lelang.
- Step02 warning dua kapasitas berlebih memakai satu teks `Kubikasi dan Berat melebihi kapasitas armada`. Subtotal0,901m³ ditampilkan0,9m³; masterbarang tetap0,001m³. Equality18.000kg dan54,72m³ tidak memberi alert.
- Step03 pada fixtureMultipickup2/1,Multidrop1/3,Multipoint2/2 menampilkan daftar drop point sebagai teks. Tidak ditemukan textlink/popup Detail Drop Point yang dimintaREQ020. Jangan menebak locator dialog atau menganggap fixture geometri tidak tersedia; lihat triage run20261009-020419.
- Vendor list Order: `Konfirmasi Order` adalah button bernama, bukan `button[title="Konfirmasi Order"]`. Tombol ikon Detail memakai titleDetail. Penugasan row memakai titleAksi.
- Jenisarmada fixture950×240×240cm menghasilkan54,72m³/18.000kg; UI menghapus tanda hubung pada nama jenisarmada dan nopol setelah save. Gunakan label aktual yang dibaca kembali.
- Tracking CURRENT dengan eventMuat/Bongkar terisi: tabTimeline danPerLokasi berupa button; HistoryTracking/DetailDataOrder/InformasiPenugasan buttonaccordion; LihatDetail membuka riwayatpenugasan. NoLelang tetap pada orderlelang, absent pada orderdirect.


## Verifikasi AMS009 dengan Vendor B — 9 Oktober 2026

Bukti: `artifacts/test-module/ams009-order-penugasan-fcl/20261009-vendor-b/`.

- Akun `env.vendorB` membuka portal yang sama dengan role Vendor; profile GET dari UI membuktikan perusahaan PT. Indah Karya (IK), pengelola VENDOR. Jangan menyamakan akun Vendor B dengan akun Shipper tenant kedua.
- Card replacement adalah `div.rounded-xl.border` yang mempunyai button exact `Pilih`. Scope lagi dengan teks exact nama perusahaan dan `20 ft · Meratus/SPIL/TANTO`; pelayaran sama pada vendor berbeda bukan selector unik. Old offer ID dikecualikan, offer lain dari vendor lama tetap tampil.
- Pada sampel mixed-vendor, daftar replacement tidak memiliki Filter/Urutkan. Pilih langsung menuju Review; tidak ada button Selanjutnya terpisah. Ini berbeda dengan langkah usulan source, bukan alasan mengarang locator.
- Konfirmasi Order tanpa jadwal: field Nama Kapal/Voyage tidak mempunyai placeholder. Scope modal melalui `//input[@value="TERIMA"]/ancestor::div[contains(@class,"fixed")][1]`, lalu label aktual; modal mempunyai2input text dan4input datetime-local. Terima Order menampilkan form ini; jangan menyimpulkan form absen dari timeout placeholder.
- Detail penugasan actual `/penugasan-tracking/<assignmentId>` memanggil GET `/api/penugasan-tracking/<assignmentId>/detail`. Assignment owner Vendor A mendapat200, Vendor B mendapat404 dan UI tidak menampilkan data order/No.Lelang pada fixture yang diuji. Tidak memerlukan APIwrite.
- POST UI `/api/order/auction` menghasilkan order ID baru dengan `replacedFromOrderId`. Jadwal8field, PIC dan goods dapat dibandingkan terhadap source yang sama setelah mengabaikan ID/createdAt record baru. Inactive History shipper dan daftar Vendor A diperiksa terpisah; kedua bukti diperlukan untuk SCN0174.
