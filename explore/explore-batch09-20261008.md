# Eksplorasi Batch09 — Master Operasional dan Master Vendor

8 Oktober 2026. Admin lalu Vendor IK, login native dari config/env.md. Cakupan baca daftar/form/panel edit/kelola/riwayat, download template dan input lokal. Tidak Simpan/Import/Hapus, tidak mengganti status tersimpan/defaultCS, tidak mengubah fixture nego. Context utama ditutup tanpa storageState. Batch10 belum dijalankan.

## Pembanding dan scope

Inventaris4Oktober, keputusan dan hasil Batch07/08 dibandingkan dengan UI/API aktual. Pencarian nama/path pada scenario repository dan koleksi `/home/icun/Produk/AMS/` tidak menemukan suite/spec master khusus untuk cakupan ini. Spec Lelang/Order memakai master, tetapi bukan definisi seluruh aturan CRUD master. Tidak mengarang REQ/SCN atau mengubah expected/suite lama. Qty unit Order tetap terpisah dari keputusan user tentang qty Spot auction.

## Peta dan observasi

| Area | Interaksi baca | Hasil |
|---|---|---|
| Waktu Perjalanan `/master/waktu-perjalanan` |List/filter/Tambah/Edit/Riwayat |4rute:Surabaya→Batu3jam; Bangkalan→Bandung→Surabaya20jam; Bangkalan→Surabaya6jam; Surabaya→Bangkalan4jam. Tiga rute pertama mempunyai delete disabled dengan alasan sudah dipakai Order; edit mengunci asal/tujuan/transit tetapi target waktu masih editable. Tidak menghapus atau menyimpan. |
| Pelabuhan `/master/pelabuhan` |List/filter/Tambah/Edit/Riwayat |3aktif:Makassar/MKS,Semayang/BPN,TanjungPerak/TJP. Form nama/UNCode/kota wajib. Template memakai contohSUB/TanjungPerak, berbeda kode recordTJP; ini contoh, belum membuktikan kode mana yang resmi atau duplikasi. |
| Pelayaran `/master/pelayaran` |List/filter/Tambah/Edit/Riwayat/expand |3aktif:TANTO/SPIL/Meratus. Logo bertanda wajib, uploadJPG/JPEG/PNG4MB. Riwayat3catatan; SPIL mempunyai2perubahan, namaSPILL→SPIL dan filelogo sebelum/sesudah. Tidak upload/save. |
| Barang `/master/barang` |List/filter/Tambah/Edit/Riwayat |1Beras,SKU17896238912763,Karung,40×20×20cm=0,016m³,5kg,nilai83.000. Konsisten barang/berat/kubikasi pada Batch07. Form SKU/nama/kemasan/berat/dimensi wajib; kubikasi read-only, nilai barang terlihat. Tidak memeriksa harga/asuransi melalui submitOrder. |
| Kemasan `/master/kemasan` |List/filter/Tambah/Edit/Riwayat |1Karung aktif; nama wajib dan multirow. |
| Unit `/master/unit` |TabArmada/JenisArmada/JenisKontainer; Tambah dan Kelola |TabArmada20barisVendor, bukan20armada.18nama AUTOTEST lama, SolutivaBronze dan Verstappen. Verstappen2armada, yang lain `-` pada sampel list. Ini scope daftar aktual, bukan seluruhVendor perusahaan. |
| Jenis Armada |List/form/template/riwayat; dimensi lokal |13jenis,9aktif/4tidakaktif pada snapshot settled. Pickup235×162×130cm/1.500kg;CDE320×170×170cm/2.200kg;CDD440×200×190cm/5.000kg cocok referensiSimulator. Input lokal320×170×170 menampilkan volume9,25m³ disabled (9,248 dibulatkan). ArmadaKecil12³cm danSedang15³cm ditampilkan0m³; Besar19³cm0,01m³. Ini pembulatan display, belum kesalahan perhitungan. |
| Jenis Kontainer |List/form/template/riwayat |13jenis,11aktif/2tidakaktif.20ft590×235×239cm33,14m³/28.130kg;40ft1203×235×240cm67,85m³/30.000kg. LongBoy dan20Feet tidakaktif dengan dimensi ekstrem pada data lama; tidak diubah atau dianggap dimensi standar kontainer. |
| Admin Kelola Armada |Verstappen dari tombolKelolaArmada |2aktif:L3992UU/Trailer20FT,L2044YE/Trailer40FT. JenisTrailer40FT master tidakaktif, tetapi armada existing aktif; perlu rulepropagasi, bukan otomatis bug. Header2armada/tanggalupdate18September. Form tambahAdmin memintaVendor/jenis/nomorpolisi. |
| Admin Sopir `/master/sopir` |List/Tambah/KelolaVerstappen |20barisVendor; Verstappen0sopir, KelolaSopir empty dengan kolomNama/WA/KodeAkses/Status. FormAdmin memintaVendor/nama/WA. Kodeakses dan detail/edit tidak ada fixture. |
| CS `/master/cs`, `/master/cs/tambah` |List/Tambah/template/Riwayat |0CS. Formnama/WA wajib, checkboxJadikanCSdefaultperusahaan untukVendorbaru dikelolaAdmin. Tidak toggledefault atau simpan. DownloadTemplate gagal dua kali; lihat kandidat di bawah. |
| Vendor `/vendor-portal/master/armada`, `/vendor-portal/master/sopir` |List/Tambah/template/multirow/Batal |Kedua list0. Armada memintaJenis/nomorpolisi, fotoSTNK/KIR/Armada optional terlihat; Sopirnama/WA danfotoSIM. Copyupload4MB JPG/JPEG/PNG. Vendor otomatis dari sesi, tidak ada pickerVendor. Batal form meminta konfirmasi, lalu kembali list. |

Filter nama fiktif/Reset pada WaktuPerjalanan/Pelabuhan/Pelayaran/Barang/Kemasan:4/3/3/1/1→0→totalawal. Belum menguji seluruh filterangka/status/lintaspage/sort atau filter daftarVendor kosong. Ukuranpage select native10/20/50/100. Filter tanggalUpdateArmadaAdmin membuka flatpickr42sel hari; button.h-9.w-9 hanya1, bukan selector kalenderhari.

Riwayat perubahan: WaktuPerjalanan/Pelabuhan/Barang/Kemasan/CS kosong; Pelayaran3catatan; JenisArmada4; JenisKontainer2. Tabpenghapusan kedelapan area kosong pada bukti settled. Audit setelah mutasi belum diuji. Riwayat perVendorArmada/Sopir belum dibuka.

## Kandidat dan gap rule

**B09-C01 — DownloadTemplateCS tersedia tetapi ditolak.** Pada `/master/cs/tambah`, kliknative DownloadTemplate memicu GET `/api/master-import/customer-service/template`, HTTP404, JSON `success:false`, `message:Not found`, `error:PRODUCT_NOT_ACTIVE`. Direproduksi dua kali. UI memberi Gagal mengunduh template. Coba lagi. Tidak ada unduhanCS; bukan abortguard atau kegagalan login. Usulkan menyelaraskan entitlement fitur dan tombol: bilaCS aktif, sediakan template; bilaimport belumaktif, jelaskan/disableaksi tersebut. Belum menentukan akar masalah route/backend/konfigurasi produk atau menguji Import. Kandidat terukur, bukan verdictformal terhadap REQ yang belum tersedia.

**B09-R01 — penggunaan jenis tidakaktif.** DropdownTambahArmadaVendor memuat13jenis termasukArmadaKecil/Sedang/Besar danTrailer40FT, yang TidakAktif di masterAdmin. DOM option tidakmenandai aria-disabled; Trailer40FT bisa dipilih lokal. Selain itu armadaexistingVerstappenTrailer40FT tetapAktif. Perlu definisi: apakah jenisnonaktif hanya tidakditawarkanuntukorderbaru, atau juga melarang createarmada. Tidak submit, jadi penerimaanbackend dan rulelegacy belumdibuktikan. Jangan langsung menyatakan bypassstatus atau mengubahexpected.

## Improve di luar skenario yang tersedia

- **B09-I01 — panduan template dan referensi:**11XLSX berhasil diunduh/dibaca (9Admin,2Vendor). TemplateBarang memakaiDus, sementaramasterKemasan saatini hanyaKarung; templateArmada/jenisArmada memakaiFusoBox yang belum ada di daftarjenis aktual. Tambahkan pilihan referensi/master aktif dan contoh yang mudah disesuaikan, serta panduanseparatorTransit `>`/desimal`,`/ribuan`.`/WAsebagaitext. Belum membuktikan importmencocokkan case, membuatmasterbaru atau menolakcontoh.
- **B09-I02 — bentuk data UI/template:** templateVendorArmada mempunyai AkhirBerlakuPajak/KIR dengan contoh31Desember2026; fieldtanggal tidak terlihat pada inventaris formTambahArmada yang diperiksa. TemplatePelayaran hanyaNo/Pelayaran sedangkan formmewajibkanLogo. Jelaskan alur melengkapi data setelahimport atau selaraskan kolom/form; tidak menganggap seluruhimport gagal.
- **B09-I03 — presisi volume kecil:** jangan tampilkan0m³ untukdimensi validkecil tanpa indikator pembulatan; gunakan presisi adaptif atau `<0,01m³`. Nilai9,248→9,25m³ normaldisplay, bukan bugpacking.
- **B09-I04 — penamaan jenis:** Trailer20Feet danTrailer20FT sama-samaaktif dengan dimensi600×250×250 versus600×240×260cm. Tampilkan varian/dimensi dalam pilihan agar pengguna tidak salah jenis; jangan mergeotomatis karena datanya berbeda. MasterKontainer20ft dan20Feet juga berbeda status/dimensi, bukan otomatis duplikat.
- **B09-I05 — keterbacaan audit dan scope:** riwayatlogo hanyafilenameUUID; berikanpreview/linkyangsesuaiizin. ListUnit/Sopir adalah ringkasan perVendor; jelaskan `-` versus0 dan alasan Vendor yang tidakmasukscope, jangan menganggap20baris adalah20kendaraan. Labelaksesstatusnonaktif perlu mengikuti keputusan B09-R01.
- **B09-G01 — coverage:** suite khusus CRUDmaster/uniqueness/dependencyguard/propagasistatus/versiondimensi/defaultCS/WA/nomorpolisi/upload/import/audit/tenant. PrioritasfixtureVendorArmada/Sopir danCS, konsistensisumberSimulator/Order serta efekeditwaktuterhadaporderlama. Operasi tulis terkontrol, bukanexplorebaca.

## Bukti dan keterbatasan harness

Admin awal: `artifacts/explore-batches/20261008/batch09-2026-10-08T07-48-10-128Z/` (8list,tab,6template/form). Adminlanjutan: `batch09-2026-10-08T07-50-55-713Z/`. Vendor: `batch09-2026-10-08T07-56-26-036Z/`. PNG disalin ke `artifacts/screenshots/explore/20261008/batch09-main-initial/`, `batch09-main/`, `batch09-vendor/`. ScreenshotCSerror diperiksa visual. Selector: [MasterOperasional/Vendor](../shared/selector-map-master-operasional-vendor.md).

SesiAdminawal terhenti karena promise waitdownload tidaktertangani setelah saya mengasumsikan pathTambahKontainer `/master/jenis-kontainer/tambah`; pathitu404UI. Pathasli diperoleh dari linkUI `/master/unit/tambah-jenis-kontainer`, lalu form/templateberhasil. Kesalahan path dan timeout awal adalahharness, bukanbug aplikasi. SummaryAPI sesi awal tidaktersimpan; jangan mengklaim ledger lengkap atau0APIerror untuksesiitu. Semuaaksi awalmelalui readguard dan tidakklikSave/Import/Delete. Pada harnesslanjutan summary/API disimpan setiapcommand.

SnapshotJenisArmada awalmasihskeleton0record danheader0/0 diganti settled13record/0/200. RiwayatpenghapusanJenisArmada juga ditunggu selesai. TimeoutbuttonEdit diKelolaArmada berasal dari locatornama yang belumterpetakan, bukan bukti Edit hilang/gagal. Tidak melanjutkan submit. Nativeclick berhasil di list/form/filter/tab/picker/baris;0testid/0role=dialog pada inventaris terkait, termasukBatalformVendor/Admin. StorageState tidakdiujiulang.

SummaryAdminlanjutan0businesswrites/0blockedWrites,2API404 khususTemplateCS; Vendor0writes/0blocked/0APIerror. Initialnetworksummary tidaktersedia sebagaimanadiatas.11XLSX dibaca sebagaiZIP/XML, bukan Excelhasilautomation. Tidak ada loginretry, data bisnisbaru atau perubahanfixturedeadline9Oktober.

Belum seluruhCRUD/validasi/backend/statusguard/hapus/uniqueness, filter/sort/paging, editJenisArmada/Kontainer, semuaVendor, kodeakses/foto/detailSopir, geocoding/routetransit interaktif, batasfile/import, entitlementCS dan efekdefaultCS. Batch09 selesai untuk cakupan baca ini; Batch10 hanya saatdiminta. Tidak ada verdictformal atau reportExcelautomation.
