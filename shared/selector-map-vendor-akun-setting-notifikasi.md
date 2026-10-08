# Selector Vendor / Akun / Pengaturan / Notifikasi — 8 Oktober 2026

Bukti explore/explore-batch10-20261008.md. Login native dari config/env.md, jangan hardcode kredensial/baseURL. Inventaris0testid; modal sampel tanpa role=dialog, baca tiap komponen.

| Area | Pola teramati | Catatan |
|---|---|---|
| Vendorlist |/manajemen-vendor; rownama→getByTitle('Aksi') |Spacerrow, jangan tbodyfirst. Tunggu data/menu; menu toggle bisa perlu dibuka ulang setelah navigasi. |
| Vendormenu |getByText Detail/Edit exact |Menunggu:Detail/KirimUndangan; **jangan KirimUndangan**. Detail masihlinkEditVendor. |
| Vendorcreate |linkTambahVendor→/manajemen-vendor/tambah |KartuRegistrasiDibantuAdmin, kartuPengelola scoped deskripsi. Input lokal saja. |
| Vendoraudit |/manajemen-vendor/riwayat; expandbuttonnama+timestamp |Nama bisa berulang. Create bukan riwayat sesuai keputusanuser. |
| PengaturanAkun |/pengaturan-akun; SubUser/HakAkses exact |FilterHakAkses masih fieldSubUser B10-C01. |
| TambahHakAkses |getByText TambahHakAkses exact (button)→/pengaturan-akun/hak-akses/tambah |Bukanlink. Matriks akses bukanradio native; jangan mengasumsikan check(). |
| SubUser |/pengaturan-akun/sub-user/tambah; PilihHakAkses |Dropdown kosong; password tidakdiisi/reveal atau disimpan. |
| RiwayatAkun |/pengaturan-akun/{sub-user,hak-akses}/riwayat; /akun-saya/riwayat |Tunggu heading/countersettled. |
| ProfileAdmin |/akun-saya; buttonEditInformasi/UbahPassword |Modal, Batal dapat membukaYa/Tidak meski belumedit. |
| ProfileVendor |/vendor-portal/akun-saya; EditInformasi→/vendor-portal/akun-saya/edit |Halamanasync, tunggu formexisting. Batal→konfirmasi laluYa hanya discard sesi. |
| UbahPassword |buttonUbahPassword→KirimOTPviaemail/Lanjutkan |Buka laluBatal; **jangan Lanjutkan/kirimOTP**. |
| Sistem |/setting/sistem |Bukan/pengaturan-sistem. UndanganselectnativevalueJAM; semua settingdibaca tanpa perubahan. |
| Notifsettings |/setting/general,/setting/preferensi-notifikasi; Vendor /vendor-portal/setting/preferensi-notifikasi |Jangan togglesimpan. CounterVendor9kanal/8jenis, OrderBaruEmail+Push. |
| BellHeader |header button.dropdown-toggle:visible first setelah memeriksaSVGBell |Tanpaaria-label, duaresponsiveDOM. Jangan klik ketika modalBatalbelumditutup. |
| Inbox |linkLihatsemuanotifikasi→/notifikasi atau/vendor-portal/notifikasi |0record. JanganBacaSemua/TandaiDibaca/Hapus atauklikitemyangmengubahreadstate. |

Simpan/Undangan/OTP/markread/delete/settings tidak dijalankan. Guardjaringan hanyaGET/HEAD/OPTIONS/auth.0APIerror/0writebisnis di summarykeduarole. StorageState/kalender/akunSubUserterbatas belumdiuji.
