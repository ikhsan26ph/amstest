# Eksplorasi Batch10 — Vendor, Akun, Pengaturan dan Notifikasi

8 Oktober 2026. Admin dan Vendor IK diperiksa berurutan, login native dari config/env.md. Eksplorasi baca UI/API: daftar, filter, form, detail, riwayat, matriks akses, pengaturan dan inbox. Tidak Simpan/Submit/Hapus, tidak kirim undangan/OTP/notifikasi, tidak mengubah password, status, hak akses, preferensi atau pengaturan tenant. Form dibatalkan atau ditinggalkan tanpa submit. Kedua browser ditutup tanpa storageState.

## Pembanding dan keputusan yang dipertahankan

Inventaris4Oktober, explore/manajemen-vendor.md (23September), shared/decisions.md dan hasil Batch01–09 menjadi pembanding. Pencarian nama/path scenario repository dan koleksi produk eksternal tidak menemukan suite/spec khusus SubUser/HakAkses/Pengaturan/Notifikasi atau ManajemenVendor yang siap dipakai sebagai daftar verdict. Tidak membuat nomor REQ/SCN atau mengubah expected.

Keputusan user23September tetap berlaku: **Riwayat Vendor hanya mencatat edit; create tidak masuk riwayat bukan bug.** Otorisasi run tulis lama tidak diterapkan otomatis pada eksplorasi baca ini. BUG-V1 WA, BUG-V2 tautan dokumen, BUG-V3 ukuran dokumen dan penolakan backend BUG-V4 tidak seluruhnya diretest; temuan lama tidak dihitung sebagai bug baru.

## Peta dan observasi

| Area | Pemeriksaan | Hasil |
|---|---|---|
| `/manajemen-vendor` |List settled, filter nama fiktif/Reset, menu status Aktif/Menunggu |33Vendor; halaman pertama20. Filter33→0→33. Aktif sampel menampilkan Detail/Edit; Menunggu SolutivaGold menampilkan Detail/KirimUndangan, tanpa Edit. Tidak klik KirimUndangan. Tidak ada aksi Hapus Vendor pada menu sampel. |
| `/manajemen-vendor/tambah` |Mandiri, DibantuAdmin+Vendor, DibantuAdmin+Admin, Batal |Mandiri meminta nama/email dan pengelolaVendor; Admin tidak dapat dipilih pada kondisi Mandiri. Dibantu menampilkan nama/alias/WA/email/PIC/wilayah/kodepos/alamat/catatan/dokumen. Copy menjelaskan Vendor mengelola armada/sopir/tracking sendiri, Admin mengelola atas nama Vendor. Upload4MB PDF/JPG/JPEG hanya dibaca. Batal meminta konfirmasi. |
| Vendor Aktif, Edit |Menu AUTOTEST-20260929-ADMG29→Edit, tunggu settled |Form terisi, statusAktif, pengelola, wilayah, dokumen terlihat; tidak mengubah/simpan. Tidak menganggap Vendor AUTOTEST lama milik run saat ini. |
| Vendor Menunggu, Detail/Edit |SolutivaGold, linkEdit dari detail |DetailMenunggu memberi penjelasan data belum lengkap, tetapi masih mempunyai linkEditVendor. Link membuka form dengan StatusAktif dan field data wajib kosong. Ini reproduksi bagian UI temuan BUG-V4 lama, bukan bug baru atau bukti submit berhasil; lihat B10-R01. |
| `/manajemen-vendor/riwayat` |List dan expand AUTOTEST-20260929-V31B |26catatan,20pada halaman1. Expand memperlihatkan Pengelola Vendor→Admin pada1Oktober11:16. Tidak memeriksa audit setelah write. Label CSVendor di daftar adalah fallback lama, bukan bukti masterCS terisi; Batch09 CS0. |
| `/pengaturan-akun` |SubUser/HakAkses, filterHakAkses |0SubUser/0HakAkses. Tabel HakAkses mempunyai nama/deskripsi/totalakses, tetapi filter yang dibuka memakai field SubUser; B10-C01. Tidak menguji efektivitas filter pada role berisi data. |
| `/pengaturan-akun/sub-user/tambah` |Form dan dropdownHakAkses |Nama/email/WA/bagianstaff/password/konfirmasipassword/hakakses bertanda wajib. Dropdown Tidak ada hak akses, tombol BuatHakAkses tersedia. Tidak isi/reveal password, simpan atau membuat akun. |
| `/pengaturan-akun/hak-akses/tambah` |Baca matriks lengkap, Batal |Nama/deskripsi; quickapply AksesPenuh/LihatSaja/TidakAdaAkses; pilihan FTL/LTL/FCL/LCL; beberapa modul menawarkan cakupan SemuaData/DataSendiri. Daftar mencakup ManajemenVendor, Order, Simulator, Tracking, Dashboard, Akun, Notifikasi, Wilayah dan master. Menu operasional LelangSpot/Kontrak/Negosiasi tidak terlihat sebagai baris tersendiri pada matriks yang dibaca; perlu pemetaan produk, belum menyimpulkan tidak dilindungi backend. Tidak mengubah akses tersimpan. |
| Riwayat Akun |`/pengaturan-akun/sub-user/riwayat`, `/pengaturan-akun/hak-akses/riwayat` |SubUser Perubahan/Penghapusan kosong; HakAkses Perubahan kosong. Tab Penghapusan HakAkses belum dibuka. |
| Admin `/akun-saya` |Profil/EditInformasi/UbahPassword/Riwayat |Nama/email/WA/bagianstaff; edit berupa modal. UbahPassword mulai dari KirimOTPviaemail dengan Lanjutkan; tidak Lanjutkan. Riwayat `/akun-saya/riwayat` kosong setelah settled. Batal edit/password membutuhkan konfirmasi pada sampel. |
| `/setting/sistem` |Baca field/help, GET `/api/setting/system`, selectDOM |Undangan99JAM; responsnego5menit;12opsidurasilelang; draft2hari/alert1hari sebelumnya; retensiLiveBidding3hari; approvaljadwalVendortrue; batasOrderBerulang5; WA publikCS kosong. Tidak simpan/toggle/reorder/tambah/hapusdurasi. NilaiUI/API selaras pada sampel. |
| `/setting/general` |PengaturanNotifikasi global |6dari6jenis aktif, semua kanalPush: OrderSelesai/Dibatalkan/Ditugaskan, SelesaiMuat/Bongkar, LelangKontrak. On/off menentukan bisa diterima siapapun. Tidak toggle. |
| `/setting/preferensi-notifikasi` |PreferensiAdmin |Order3/3,Tracking2/2,LelangKontrak1/1, total6kanalPush aktif. Tidak simpan/batal sebagai uji persistensi. |
| Header dan `/notifikasi` |Bell→Lihatsemuanotifikasi |Tidak ada notifikasi baru; inbox kosong. TabSemua/Order/Tracking/Monitoring&Tracking/Invoice/KIRArmada; copy autohapus3bulan. PilihSemua/TandaiDibaca/Hapus tidak dijalankan. |
| Vendor `/vendor-portal/akun-saya`, `/edit` |Profil, EditInformasi settled, UbahPassword dan Batal |Profil perusahaan/PIC/wilayah/alamat dan6dokumen; edit halaman tersendiri. Dokumen tampil336,93–336,98KB pada sampel, bukan0,07KB lama; ini bukan pembuktian perbaikan BUG-V3 pada fixture asal. UbahPassword juga langkahOTPemail, tidak dikirim. |
| Vendor `/vendor-portal/setting/preferensi-notifikasi` |Baca kategori/kanal |8jenis notifikasi dengan9kanal aktif:4Order dengan OrderBaru Email+Push sehingga5/5kanalOrder;2TrackingPush;1LelangKontrakPush;1RequestJadwalPush. Countkanal berbeda countjenis, bukan bug aritmetika. Tidak mengasumsikan opsiVendor identik globalAdmin tanpa definisi lintasrole. |
| Vendor header, `/vendor-portal/notifikasi` |Bell→Lihatsemua |Inbox kosong, autohapus3bulan; tabSemua/Order/Tracking/Monitoring&Tracking/KIRArmada, tanpaInvoice. Tidak markread/delete atau menjalankan aksi notifikasi. |

## Rule Pengaturan Sistem yang ditemukan

- Help responsnego menyebut nilai awal24jam, tetapi **nilai tersimpan sekarang5menit**. Perubahan hanya berlaku saat deadline baru dibuat; deadline nego aktif tetap. Jadi nilai konfigurasi saat ini bukan alasan menyatakan fixture deadline9Oktober salah. Tidak mengubah fixture atau menunggu timeout nyata.
- Opsidurasilelang tersimpan dalam menit:5/10/15/25/60/180/360/720/1440/2880/4320/10080; UI menampilkan menit/jam/hari sesuai unit. Membaca opsi bukan menguji efek simpan ke seluruh formLelang.
- RetensiLiveBidding default3hari; lelang lebih lama tetap dapat ditemukan dengan filter. Ini mendukung penjelasan retensi/filter Batch04, bukan pembuktian seluruh boundaryH+3.
- OrderBerulang mencakup2sampaiB, OrderTinggi lebihdariB; B=5. Nilai tersimpan berlaku setelah Dashboard dimuatulang/refresh. Tidak mengganti B atau menghitung ulang dashboard.
- Approval editjadwalVendor aktif; spec Order Batch07 sudah menyebut opsi approvaltenant. Belum ada fixture permintaanedit untuk menguji approval/penolakan/notifikasi.
- API memuat parameter monitoring/fleet lain yang tidak menjadi field pada layarPengaturanSistem yang dibaca. Itu bukan menu baru yang terbukti tersedia atau fitur yang otomatis harus diubah. Tidak mengeksekusi parameter tersebut.

## Kandidat, rekonsiliasi dan improve

**B10-C01 — filter tab HakAkses memakai konteks SubUser.** KlikHakAkses lalu bukaFilter secara eksplisit: label NamaSubUser/Email/BagianStaff/Status, placeholderSubUser, sedangkan tabelNamaHakAkses/Deskripsi/TotalAkses. Screenshot diperiksa visual. Usulkan filter nama/deskripsiHakAkses dan field yang relevan. Ini kandidat kesalahan konteksUI yang teramati, bukan bukti filterbackend salah dengan data atau verdictformal terhadap spec yang belum tersedia.

**B10-R01 — BUG-V4 lama baru diperbaiki sebagian pada navigasi.** MenuListMenunggu tidaklagiEdit dan menyediakanKirimUndangan. Namun Detail masihEditVendor dan form StatusAktif untuk recordMenunggu. Pertahankan buglama sebagai perlu recheck lengkap, jangan menandai fixed dari menuList saja. BackendSave400 lama tidakdiretest dan tidakmembuatdata. KirimUndangan baru tersedia dibanding inventaris23September, belum dibuktikan pengiriman/expiry.

**B10-I01 — matriks akses dan menu.** Tambahkan penjelasan inheritance/cakupan untuk LelangSpot/Kontrak/Negosiasi, PengaturanSistem danMasterCS yang tidak terlihat sebagai baris tersendiri di form. Bedakan hak menu dan otorisasiAPI; perlu akunSubUser terkontrol untuk pembuktian. Jelaskan bahwa hakakses harus dibuat dahulu ketika dropdownSubUser kosong.

**B10-I02 — dirty state dan loading.** KonfirmasiBatal muncul pada beberapa form/modal yang baru dibuka tanpa input. Pertimbangkan hanya meminta konfirmasi ketika ada perubahan dan membuatloading jelas sampai data selesai. SnapshotVendorDetail/ProfileEdit awal masihMemuat/halamanlama; setelahsettled data benar. Ini usulan UX, bukan bug kehilangan field.

**B10-I03 — aksesibilitas notifikasi dan counter.** BellHeader berupa button tanpa accessible name, dua versi responsive ada di DOM. Beri aria-label dan bedakan counterjenis/kanal pada preferensi. DaftarNotifikasi mempunyai tabInvoice/KIR/Monitoring sementara preferensi yang dibaca lebih sedikit kategori; tambahkan penjelasan kategori yang dikendalikan global/pribadi atau belum aktif. Tidak menyatakan kategori itu pasti gagal dikirim.

**B10-I04 — kualitas alamat profil.** VendorIK wilayahSulawesiUtara/SangkubII/kodepos95762, tetapi alamatbebas menyebutSurabaya/JawaTimur60177. Ini data existing (ada audit lama), bukan sesi ini mengubah wilayah. Usulkan indikasi ketidaksesuaian alamat/wilayah dan verifikasi manusia, konsisten improveBatch08; jangan koreksi otomatis.

**B10-G01 — verifikasi yang membutuhkan fixture/aksi tulis.** AkunSubUser rolelihat/dataSendiri/jenis tertentu; enforcementAPI/lintastenant; invitationexpiry/resend dan akunVendoradmin-managed; validasiWA/email/password/OTP/lockout; uploaddokumen; defaultCS/approvaljadwal; toggleglobal/pribadi/push/email; inboxberisi/actiondeep-link/markread/delete/retensi3bulan; perubahanpengaturan dan audit. Tidak dilaksanakan dalam explorebaca. Tidak melakukan uji login gagal untuk membuktikan lockout.

## Bukti dan hipotesis

Admin: `artifacts/explore-batches/20261008/batch10-2026-10-08T08-03-13-632Z/`. Vendor: `batch10-2026-10-08T08-12-25-796Z/`. Screenshot disalin ke `artifacts/screenshots/explore/20261008/batch10-main/` dan `batch10-vendor/`; screenshotfilterHakAkses diperiksa visual. [Peta selector](../shared/selector-map-vendor-akun-setting-notifikasi.md). Kredensial disamarkan; password/OTP/token/cookie/storageState tidak direkam.

Kliknative berhasil pada list/form/tab/menu/modal. DropdownHakAkses/wilayah/status kustom; ukuranhalaman dan satuanundangan selectnative, DOM menunjukkan JAMselected. Jangan membaca semua teksoptionSelectanoption/Menit/Jam sebagai nilai kosong. FormHakAkses pilihanakses bukan radio native pada inventaris. Inventaris0testid; modalProfile/UbahPassword/BatalVendor/HakAkses yang diperiksa tidak memakai role=dialog. Kalender tidakdibuka; storageState tidakdiujiulang.

PathPengaturanSistem yang sempat sayaasumsikan `/pengaturan-sistem` menampilkan404UI; pathobserved yang benar `/setting/sistem` berhasil. Ini kesalahanharness, bukanbugmenu. TambahHakAkses adalahbutton/teks, bukanlink. TogglemenuAksi dan snapshotasync perluwait; Batalprofile/password membuka konfirmasi yang harus ditutup sebelum bell/buttonlain. Timeoutintercept dan locator tidak dihitungbugaplikasi.

Summary kedua role:0businesswrites,0blockedWrites,0responsAPI>=400; nonGET hanyaauthrefresh. TidakKirimUndangan/OTP, perubahanpreferensi/status/default/settings atau fixturedeadline9Oktober. Tidak ada Excel atau verdictformal. Batch10 selesai untuk cakupan baca ini. Sepuluhbatch rencana sudah dilaporkan; rulebackend/mutasi dan batasfixture tetap backlog, bukan klaim seluruhrule lulus.
