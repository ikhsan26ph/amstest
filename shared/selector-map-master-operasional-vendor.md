# Selector Master Operasional dan Master Vendor — 8 Oktober 2026

Sumber explore/explore-batch09-20261008.md. Login/config env, nativeclick,0testid pada inventaris. TidakSave/Import/Delete/status/defaultCS.0role=dialog pada sampelpanel/modal; selalu periksa komponenaktual.

| Area | Pola | Catatan |
|---|---|---|
| Adminmaster |/master/waktu-perjalanan,pelabuhan,pelayaran,barang,kemasan,unit,sopir,cs |Navigasi dari menu/modulemap; Filter dibuka eksplisit, bukanvisibilityReset di panelterklip. |
| Filter |PlaceholderMasukkanRute, MasukanNamaPelabuhan, MasukkanNamaPelayaran/Barang/Kemasan |Perbedaan ejaan Masukan/Masukkan; Terapkan/Reset, tunggucounter settled. |
| Unit tabs |getByText Armada/JenisArmada/JenisKontainer exact |Baca route setelahklik; tabelskeleton bukan0recordfinal. |
| Tambah |LinkTambah dariUI |TambahJenisKontainer **/master/unit/tambah-jenis-kontainer**, bukan /master/jenis-kontainer/tambah. |
| Download |buttonDownloadTemplate; listenerdownloadsebelumclick |Promise diberi catchsegera; responsCS404 tidakakanmendownload. Jangan menunggu tanpa batas. |
| WaktuPerjalananedit |Edit target waktu (rute terkunci) |3routeused, delete disabled. Fieldasal/tujuan/transitlocked; targetwaktu editable. Batal, tidakSave. |
| Editcommon |Pelabuhan/Barang/Kemasan:Editdata; Pelayaran:Edit |Panelread+Batal. KelolaArmada tombolEditbelumterpetakan; janganreuseasumsi. |
| Volumejenis |PlaceholderPanjang/Lebar/Tinggi; disabledinputvolume |320/170/170→9,25 display; tidakSave. |
| AdminKelola |RowVendorVerstappen→buttonKelolaArmada/KelolaSopir |Armada2,Sopir0; datavendorberbeda dariVendorIK. |
| Riwayat |ButtonRiwayat→routeobserved; teksPerubahan/Penghapusan |SPILexpandbuttonmemuatnama+timestamp; auditlogo filename. Jenisriwayatsettledrequired. |
| TanggalUpdateUnit |DD/MM/YYYY→.flatpickr-day |42sel;1button.h-9.w-9 bukanhari. Tidakmemilihtanggal. |
| Vendorlist |/vendor-portal/master/armada,sopir |Kedua0; createviaTambahlink. |
| Vendorcreate |/vendor-portal/master/armada/tambah,sopir/tambah |TambahBarisInput, Batal→Ya untukdiscardinputlokal. Fileinputfoto ada; tidakupload. |
| Vendorjenis |buttonPilihJenisArmada→roleoption |13opsi termasukmasterTidakAktif; Trailer40FT bisa dipilih lokal. PenerimaanSave belumdiperiksa. |

Guard jaringan GET/HEAD/OPTIONS/auth saja, tidak mengirim writebisnis. B09-C01 templateCS404PRODUCT_NOT_ACTIVE direproduksi2kali; bedakan dari kesalahanpathKontainer/harness. StorageState tidakdiujiulang. Scopeselist kosong tidakmembuktikan isolasi/validasifilterbackend.
