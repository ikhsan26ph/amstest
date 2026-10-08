# Eksplorasi Batch06 — Negosiasi

8 Oktober 2026, Admin dan Vendor IK. Hanya Batch06, baca UI dan respons GET yang dipicu UI. Login native dari config/env.md; tidak memerlukan kalibrasi baru. Context berurutan, tanpa storageState, zona Asia/Jakarta. Tidak mengajukan, menerima, menolak, membalas atau mengakhiri nego; input nominal/chip hanya lokal lalu Batal/Tutup. Browser ditutup.

## Pembanding dan batas rule

AMS008 analysis dan49 skenario awal dibandingkan dengan Nego.docx asli yang tersedia di `/home/icun/Produk/AMS/AMS008 - Negosiasi/Nego.docx`,20 skenario DOCX terpisah, keputusan7–8 Oktober dan audit20261008-082744. Jawaban tebal DOCX mengoreksi rule lama: nominal shipper boleh naik/turun antarputaran selama di bawah harga saat ini; status final mengakhiri putaran, bukan kesempatan pengajuan berikutnya; respons vendor terakhir menjadi acuan harga; detail shipper hanya Ajukan/Akhiri; timeout shipper Nego Berakhir, timeout vendor Tidak Direspons. Frasa tebal Tidak ada batasan pengajuan nego. Ada 5 tetap ambigu. Paragraf63 tentang batas balasan vendor tidak tebal; jangan otomatis menjadikannya jawaban final menggantikan rule lama.

Tidak mengubah analysis, expected, hasil atau verdict formal. Harga Saat Ini/detail, Harga Terbaru/list, dan harga card penawaran adalah tiga observasi berbeda; keselarasan semua harga untuk Order belum dibuktikan.

## Peta dan interaksi

| Area | Pemeriksaan | Hasil |
|---|---|---|
| Admin daftar `/negosiasi` | Semua, Perlu Aksi, Menunggu Vendor, Selesai; select100 |22 record utama:1 Perlu Aksi,2 Menunggu Vendor,19 Selesai. API utama22 record:9 Nego Berakhir,6 Diterima,4 Ditolak,2 Menunggu Vendor,1 Perlu Aksi. Tab cocok dengan data. |
| Tidak Direspons | Link `/negosiasi/tidak-direspons`, list, menu, detailFCL29 Astra |2 record, dipisahkan dari utama. API meta counter Semua24/Selesai21 menyertakan2Tidak Direspons; UI22/19 mengecualikannya. Selisih counter ini bukan bug aritmetika. |
| Filter Admin | Label ID Order, nomorFTL18, nomor fiktif, Reset |FTL18→1, fiktif→0, Reset→22. Counter tab tetap global ketika filter aktif. |
| Menu Admin | Perlu Aksi, Menunggu Vendor, Ditolak, Diterima, Nego Berakhir, Tidak Direspons |Perlu Aksi:Detail Nego/Terima Nego/Riwayat Nego. Menunggu Vendor:Detail/Riwayat. Ditolak/Diterima:Detail/Ajukan Nego Kembali/Riwayat. Nego Berakhir:Detail/Riwayat. Tidak Direspons:Detail/Ajukan Kembali. Tidak ada sampel Harga Tidak Berlaku. |
| Detail dan riwayat Admin | FTL18 aktif, FCL25 pending, FTL09 berakhir, FTL08 Solutiva ditolak, FCL29 tidak direspons |Informasi read-only, harga awal/nominal/saatini, putaran dan riwayat. Riwayat Nego dari menuFTL09 menuju halaman detail, bukan modal terpisah. |
| Form shipper | Ajukan dari detailFTL18, Ajukan Kembali dari DiterimaFTL27, bulkFTL02 dari penawaran |Modal menampilkan harga awal/saatini; input83000→83.000, lalu Batal. Diterima membuka modal pengajuan kembali. Bulk5 opsi eligible dari2 vendor, dua checkbox→2 Terpilih,800000→800.000, lalu link Batal kembali penawaran. Tidak Kirim/konfirmasi final. |
| Guard pending | Ajukan Nego detailFCL25 Menunggu Vendor |Tombol terlihat enabled, tetapi klik menampilkan AksiTidakDapatDilakukan / Nego sedang menunggu respon vendor. Tidak membuka modal pengajuan. |
| Vendor daftar `/vendor-portal/negosiasi` | Semua, Perlu Aksi, Menunggu Shipper, Selesai |2 record milikIK:1 Perlu Aksi,1 Menunggu Shipper,0 Selesai; semua tab cocok. Tidak ada link Tidak Direspons. Ini membuktikan scope sampel, bukan otorisasi backend lintasvendor. |
| Vendor filter/sort | Fiktif/Reset, jenisFTL, Rute dua arah |2→0→2; FTL→1; Reset→2. Rute naik menempatkanBalikpapan dahulu, turunSurabaya dahulu. Hanya Rute tampak sortable pada header list yang diperiksa. |
| Detail Vendor | FTL18Menunggu Shipper danFCL25Perlu Aksi |FTL18 tanpa tombol respons, menuDetail/Riwayat. FCL25 menuDetail/Terima/Tolak/AjukanBalasan/Riwayat dan tiga tombol respons di detail. |
| Modal Vendor | Terima, Balasan, Tolak, chip dan perubahan lokal |Terima menyebut5 juta mengikat, dibatalkan sebelum Ya. Balasan menunjukkan awal12,5 juta/saatini12 juta/nego5 juta;6 juta diformat6.000.000, lalu Batal. Tolak memuat3 chip; chip mengisi textarea dan tetap editable, lalu Tutup. Reload tetap putaran 2/Perlu Aksi/nominal5 juta. |

## Harga, timer dan perubahan fixture

- FTL18, nego `665c9aca-7075-4a00-8ab0-d70c9020562c`: kedua daftar/detail menunjukkan85.000; nominal shipper80.000, harga awal100.000, putaran 2. Status Admin Perlu Aksi/Vendor Menunggu Shipper. DeadlineAPI `2026-10-09T01:29:39.206Z` =9 Oktober08:29:39WIB; UI saat observasi18 Jam Lagi, list 1 hari lagi. Riwayat putaran 1 berlabelNegosiasi, putaran 2 mengikuti status kedua role. Tidak menunggu deadline nyata atau mengubah jam. API/detail harga belum dibandingkan ulang dengan card penawaranFTL18; kandidat CAND-NEGO-OFFER-PRICE lama tetap terbuka.
- **FixtureFCL25 berubah sebelum Batch06.** ID `24cd0349-8e42-4c8b-82c3-ca1f16cc728b` kini putaran 2, nominal5.000.000, harga saatini12.000.000. Riwayat mencatat TERIMA_VENDOR8 Oktober10:56:16WIB danAJUKAN_KEMBALI11:02:58WIB, sebelum sesi Batch06. Deadline sekarang `2026-10-09T04:02:58.969Z` =9 Oktober11:02:58WIB; Vendor 21 Jam Lagi/list 1 hari lagi. Deadline audit awal08:30:32 bukan lagi acuan current record. Tidak mengatribusi perubahan itu ke pelaku tertentu; sesi Batch06 tidak melakukan write bisnis.
- **Reproduksi kandidat lama CAND-NEGO-LIST-PENDING:** FCL25 Harga Terbaru list kedua role5.000.000 (nominal shipper belum diterima), Harga Saat Ini detail12.000.000. DOCX menyebut harga respons vendor terakhir sebagai acuan. Ini perbedaan yang terukur, bukan temuan baru atau bukti nominal5 juta sudah menjadi harga Order.
- FTL08 Solutiva Ditolak: list/detail191.000, nominal186.000; putaran 1 harga baru191.000, putaran 2Harga Baru `-`, alasan kapasitas penuh. Konsisten bukti7 Oktober/DOCX SCN0001–0003. FTL09 Astra Nego Berakhir tetap450.000/putaran 3; tidak ada shortcut Ajukan Kembali di menu. Ketiadaan shortcut bukan bukti tidak dapat nego lagi lewat penawaran.

## Improve dan gap tambahan

**B06-I01 — label filter salah konteks.** ID Order/Masukkan ID Order benar-benar menyaring nomorlelang; Jenis Order berisiFCL/FTL. Usulkan No. Lelang/Jenis Pengiriman, atau pisahkan pencarian Order bila memang ada. Ini presentasi/desain, bukan filter gagal. Peta4 Oktober sudah mencatat label lama; bukan klaim fitur baru. Pembanding AMS008REQ013/POS013.

**B06-I02 — harga pending perlu nama yang menjelaskan makna.** Reproduksi kandidat lama di atas: pisahkan Harga Aktif/Harga Saat Ini dari Nominal Nego Terakhir agar pending5 juta tidak dianggap sudah disepakati. Keputusan mengenai kapan respons vendor mengganti harga card penawaran tetap diperlukan (DOC-PRICE).

**B06-I03 — aksi dan deadline perlu lebih jelas.** Saat Menunggu Vendor, Ajukan Nego enabled tetapi hanya menghasilkan guard. Usulkan disabled dengan alasan dekat tombol. List Terima Nego untuk Shipper masih tampil padaPerlu Aksi, sedangkan detail hanyaAjukan/Akhiri sesuai jawabanDOCX; apakah shortcutTerima masih diizinkan perlu keputusan produk, bukan otomatisbug. Timer hanya hari/jam: usulkan deadline absolutWIB dan penjelasan pembulatan, agar perubahan fixture mudah dikenali. Perbedaan1 hari/18–21jam bukan otomatis salah hitung.

**B06-I04 — aksesibilitas pengurutan.** Header Rute berupa th cursor-pointer, tanpa tabindex/aria-sort pada DOM yang diperiksa. Nativepointer berfungsi; usulkan tombol fokus keyboard dan aria-sort agar arah urutan dapat diketahui. Belum menguji semua keyboard/screenreader.

## Coverage dan pekerjaan tersisa

Baca saja mencakup bagian AMS008REQ004/005/007/008/013–017/019/020 dan DOC-PRICE/HISTORY/REOPEN/TIMER; tidak sama dengan lulus semua acceptance criteria. Menggunakan49 ID semantik lama dan20 SCN-DOCX terpisah, tidak mencampur verdict keduanya.

Belum: submit dan validasi batas nominal/kosong/bulk, seleksi lintaspage, batas putaran ambigu, timeout nyata setelah deadline, guard expired/ClosingTime/lelangulang, perubahan harga untukPesan/order, statusHarga Tidak Berlaku, vendorfinal/privasi backend akun lain, kalender bila tersedia pada jalur lain, tooltiphover, sort riwayat/filtergabungan/performa, NegosiasiKontrak dan semua metode pengiriman. Form bulk5harga sudah memfilter satu cardIndahKaryaPickup yang pending; alasan eksplisit per pengecualian belum dibaca, jangan menyimpulkan uniqueness/backend dari omission.

## Bukti dan checklist hipotesis

Artefak utama di `artifacts/explore-batches/20261008/`:

- `batch06-2026-10-08T06-49-41-357Z` (Adminutama).
- `batch06-2026-10-08T06-54-24-393Z` (Vendor).
- `batch06-2026-10-08T06-57-08-615Z` (Admin guardpending/menuDiterima/reopen).

Snapshot/API JSON tersamarkan; screenshot salinan `artifacts/screenshots/explore/20261008/batch06-main/`, `batch06-vendor/`, `batch06-main-recheck/`. Screenshot modalbalasan dilihat secara visual. Selector shared/selector-map-negosiasi.md.

Nativeclick pada list/form/modal/checkbox berhasil; dropdownfilterbutton + role option, ukuranpage select native, tabrole=tab. Modal shipper/reponsVendor/guard yang diinventarisasi tanpa role=dialog, 0 testid list/detail/form. Datepicker tidak tersedia pada jalurfilter/modalnego yang diperiksa; hipotesisdate tidak diverifikasi ulang. StorageState tidak diuji ulang. Error tbodyfirstbariskosong, salah nama Detail/Tidak Diresponsbutton, placeholder0bulkambigu bukan bug aplikasi; gunakanrole aktual dan scopefield. MenuDiterima awal belumsettled diperiksa ulang dan hasilbaru disimpan.

Semua sesi summary:0 write bisnis,0 blockedWrites,0 API>=400; POST yang terlihat hanya auth/refresh. Hasil lama dan fixture tidak diubah oleh Batch06. Tidak ada Excel/verdict formal. Batch06 selesai untuk cakupan baca dengan batas di atas; Batch07 belum dijalankan.

Validasi akhir:93 JSON valid,10 screenshot,0 kecocokan kredensial pada JSON/dokumen baru; diff whitespace bersih. Semua browser dan proses harness Batch06 ditutup.
