# Eksplorasi Batch08 — Master Wilayah dan Drop Point

8 Oktober 2026. Admin dan Vendor IK diperiksa berurutan, login native menggunakan config/env.md. Cakupan baca: daftar, filter, halaman tambah, form edit, dependensi wilayah, detail, riwayat dan download template. Tidak Simpan/Submit/Import/Hapus, tidak mengganti status tersimpan atau mengubah fixture nego. Input pilihan/baris hanya lokal, ditutup lewat Batal atau navigasi. Kedua browser ditutup tanpa storageState. Batch09 belum dijalankan.

## Pembanding dan batas rule

Pembanding adalah inventaris4Oktober, module-map, prosedur bersama serta UI/API aktual. Pencarian nama/path pada scenario repository dan koleksi `/home/icun/Produk/AMS/` tidak menemukan spec/suite khusus Master Wilayah atau Drop Point. Referensi Drop Point dalam spec Lelang/Order adalah pemakai data master, bukan definisi CRUD master. Tidak mengarang nomor REQ/SCN atau menetapkan verdict formal berdasarkan label saja.

Rule yang diamati berikut adalah indikasi UI. Uniqueness, normalisasi nomor WA, validasi email/kodepos/Maps, batas file backend, propagasi perubahan status, dependensi data yang sudah dipakai Order, isolasi tenant dan audit sesudah mutasi belum dibuktikan.

## Peta dan hasil

| Area | Pemeriksaan | Hasil |
|---|---|---|
| Master Provinsi `/master/provinsi` |List, filter nama fiktif/Reset, halaman2, Tambah/Edit/Riwayat |38data. Halaman1 berisi20, halaman2 berisi18 dengan nomor21–38. Filter38→0→38. |
| Master Kota `/master/kota` |List, filter fiktif/Reset, filter provinsiJawaTimur, Tambah/Edit/Riwayat |514data. Fiktif514→0→514; JawaTimur→38 kota/kabupaten. |
| Master Kecamatan `/master/kecamatan` |List, filter fiktif/Reset, Tambah/Edit/Riwayat |7.285data; filter7.285→0→7.285. Filter list menyediakan nama, kota/kabupaten, provinsi dan status. |
| Master Kelurahan `/master/kelurahan` |List, filter fiktif/Reset, Tambah/Edit/Riwayat |83.762data; filter83.762→0→83.762. Filter nama, kodepos, kecamatan, provinsi, kota/kabupaten, status terlihat. |
| Tambah wilayah `/master/{provinsi,kota,kecamatan,kelurahan}/tambah` |Inventaris empat form, Tambah Baris Input semua form; rantai pilihan pada Kelurahan |Nama wilayah wajib. Kota mempunyai provinsi; Kecamatan mempunyai provinsi/kota; Kelurahan mempunyai provinsi/kota/kecamatan serta kodepos wajib. Tambah Baris Input menambah field set. Pada sampel Kelurahan, JawaTimur→Surabaya→Benowo dapat dipilih; mengganti ke JawaTengah mengosongkan kota/kecamatan baris tersebut, baris kedua tetap kosong. |
| Edit wilayah |Tombol aksi pada sampel tiap daftar, baca lalu Batal |Form edit berbentuk panel di halaman list, field nama/induk/status. Status Aktif/Tidak Aktif tersedia pada sampel Provinsi. Tidak menyimpan perubahan. |
| Master Drop Point `/master/customer` |List perusahaan, filter fiktif/Reset, tambah/detail/edit/riwayat |11perusahaan, fiktif11→0→11. Copy UI menjelaskan Drop Point dikelola melalui detail perusahaan. Nama PIC/WA perusahaan pada daftar adalah `-` untuk sampel, meski lokasi mempunyai PIC; keduanya scope data berbeda. |
| Perusahaan SUB `/master/customer/36bb4dcf-ab61-43ac-ab08-becae20891f8` |Detail perusahaan, detail/edit Estate89, tambah Drop Point |5lokasi aktif. Detail lokasi memuat PIC/WA/alamat/seluruhwilayah/kodepos/linkMaps/catatan/koordinat/peta. Edit memuat kembali data lengkap setelah loading selesai, lalu Batal. |
| Tambah perusahaan `/master/customer/tambah` |Informasi utama, toggle Tambah Detail Lainnya, input lokal, Batal |Nama Perusahaan wajib; minimal set DropPoint1 terlihat dengan nama/PIC/WA/wilayah/alamat bertanda wajib. Detail tambahan perusahaan mencakup alias/email/PIC/WA/wilayah/alamat/dokumen. Copy upload4MB, PDF/JPG, maksimal10file; tidak upload. Batal memakai konfirmasi Ya/Tidak tanpa role=dialog. |
| Edit Informasi Perusahaan |Dari aksi list, tunggu settled |Halaman tersendiri; nama/alias SUB terisi. Copy `Drop point terdaftar:5 • Kelola drop point di halaman Detail Perusahaan`; tidak menduplikasi editor lokasi di form perusahaan. Tidak menyimpan. |
| Tambah Drop Point |Panel pada detail perusahaan; rantai wilayah, kodepos, baris kedua, Batal |JawaTimur→KotaSurabaya→Benowo→Kandangan menghasilkan kodepos60199 disabled. Ganti provinsi ke JawaTengah mengosongkan kota/kecamatan/kelurahan/kodepos. Baris kedua mempunyai field set sendiri. Batal panel mengembalikan detail setelah transisi, tidak ada konfirmasi terlihat pada sampel. |
| Riwayat `/master/riwayat/{provinsi,kota,kecamatan,kelurahan,customer}` |Tab Perubahan/Penghapusan semua area; expand satu catatan perusahaan |Wilayah: kedua tab kosong. Perusahaan:4catatan perubahan,0penghapusan. Expand SUB28September11:54 memperlihatkan fieldAlias `IKKK`→`IKSUB`, konsisten alias saat ini. Tidak menguji audit setelah write. |
| Vendor IK |Inventaris sidebar/menu setelah login |Tidak ada Master Wilayah atau Master Drop Point. Master yang terlihat Armada/Sopir di luar Batch08. Ini pembatasan navigasi yang diamati, bukan bukti otorisasi backend; tidak melakukan probe URL Admin. |

## Template Drop Point

`Template_droppoint-kelola.xlsx` diunduh dari panel Tambah Drop Point, valid sebagai ZIP/XLSX dan worksheet dibaca dari XML. Satu sheet, headerNo/NamaDroppoint/NamaPIC/NoWhatsappPIC/Provinsi/KotaKab/Kecamatan/DesaKelurahan/Alamat, satu baris contoh lokasi Surabaya. Nomor WA contoh diawali0. Tidak ada panduan terpisah atau kolom LinkMaps/Catatan/KodePos pada template; kodepos UI otomatis dari kelurahan. Tidak menganggap kolom opsional yang absen sebagai bug atau mengklaim import berhasil. Tidak membaca template sebagai laporan automation.

## Improve di luar spec/skenario yang tersedia

- **B08-I01 — panduan impor lokasi:** tambahkan sheet petunjuk berisi field wajib, pilihan nama wilayah yang tepat, penanganan nama ganda, normalisasi WA, nomor disimpan sebagai teks, error perbaris dan batas file. Template saat ini hanya header dan contoh; dukungan validasi backend belum diuji.
- **B08-I02 — konsistensi alamat dan kodepos:** detail Estate89 memuat alamat bebas berakhiran60185 sedangkan kodepos master Sambikerep60217. Usulkan indikator perbedaan dan kesempatan mengoreksi alamat setelah verifikasi; ini kualitas data sampel, bukan bukti aplikasi menghitung kodepos salah. Jangan mengubah data otomatis.
- **B08-I03 — konteks dan istilah:** menu Master Drop Point membuka daftar perusahaan, riwayat memakai Nama Customer, form memakai Perusahaan dan template memakai Droppoint. Samakan istilah atau tambahkan scope Perusahaan/Lokasi. PIC perusahaan kosong sementara PIC lokasi terisi adalah perbedaan scope yang perlu dijelaskan, bukan kehilangan data terbukti.
- **B08-I04 — keselamatan input dan aksesibilitas:** toggle Tambah Detail Lainnya tidak ditemukan sebagai button, tetapi berhasil lewat getByText. Usulkan label/role kontrol yang jelas. Panel Tambah Drop Point dibatalkan langsung pada sampel pilihan/baris lokal, sedangkan halaman Tambah Perusahaan/Kelurahan meminta konfirmasi; pertimbangkan aturan dirty-state yang konsisten. Belum memeriksa semua kondisi input atau keyboard/focus.
- **B08-I05 — peta dan tautan:** form meminta link dengan latlong, tetapi Estate89 yang sudah tersimpan memakai tautan Maps singkat dan mempunyai koordinat. Jelaskan format yang didukung, hasil resolusi dan fallback pemilihan peta. Tidak mengklaim tautan pendek ditolak, geocoding berhasil, atau titik cocok alamat dari observasi ini.
- **B08-G01 — coverage master:** buat spec/suite tersendiri untuk uniqueness perinduk, status induk/nonaktif dan referensi downstream, validasi WA/email/kodepos, multirow, file/deduplikasi impor, Maps, audit perubahan/penghapusan dan isolasi tenant. Operasi tulis membutuhkan fixture test terkontrol. Pencarian daftar besar/dropdown dan paging semua level masih backlog, bukan diuji stres.

Tidak ada bug fungsional baru yang terkonfirmasi dalam cakupan baca ini. Daftar kelurahan menampilkan urutan beberapa baris yang berbeda pada pembukaan berikutnya sementara total tetap83.762; penyebab (urutan backend/perubahan eksternal) tidak ditentukan dan sesi tidak melakukan write. Jangan mengasumsikan indeks row selalu menunjuk record yang sama.

## Bukti dan hipotesis

Admin: `artifacts/explore-batches/20261008/batch08-2026-10-08T07-25-01-898Z/`. Vendor: `batch08-2026-10-08T07-32-14-599Z/`. Screenshot salinan di `artifacts/screenshots/explore/20261008/batch08-main/` dan `batch08-vendor/`; screenshot form DropPoint diperiksa visual, peta tampil. File raw memuat data bisnis, akun login disamarkan; tanpa token/cookie/storageState. Sesi awal nonTTY tidak menerima stdin dan ditutup tanpa interaksi modul, bukan run utama.

Native click list/form/menu/dropdown/radio tanpa dispatch. Dropdown wilayah button/listbox/option; Tampilkan select native. Inventaris list/form/panel yang diperiksa0testid/0role=dialog; konfirmasi Batal Kelurahan/Perusahaan juga0dialog. Kalender tidak dibuka pada Batch08, storageState tidak diuji ulang. Selector map: [Master Wilayah/DropPoint](../shared/selector-map-master-wilayah-drop-point.md).

Timeout Terapkan awal terjadi karena helper menganggap filter terklip sebagai visible; membuka tombol Filter secara eksplisit membuat klik berhasil. Toggle Tambah Detail Lainnya bukan button. Snapshot EditPerusahaan awal dan kelurahan EditDropPoint yang belum terisi diganti bukti settled; kelurahan akhirnya Sambikerep dan kodepos60217. Batal panel juga perlu tunggu transisi. Semua ini bukan bug aplikasi yang terkonfirmasi.

Summary Admin/Vendor masing-masing0writebisnis,0blockedWrites,0responsAPI>=400; nonGET tercatat hanya auth/refresh. Belum submit/validasi wajib/duplikat/backend/statuspropagation, upload/import, hapus/dependencyguard, seluruhfilter/sort/paging, geocoding/dragmarker, audit sesudah mutasi, role lain dan tenant lain. Tidak ada verdict formal atau Excel automation. Batch08 selesai untuk cakupan eksplorasi baca ini; Batch09 hanya saat diminta.
