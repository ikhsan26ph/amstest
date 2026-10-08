# Laporan Gabungan Eksplorasi AMS — Batch 01–10

Tanggal observasi: **8 Oktober 2026, WIB**. Lingkungan: staging AMS. Role yang diperiksa: Admin dan Vendor IK, berurutan. Excel gabungan menjadi laporan utama hasil eksplorasi; dokumen ini menjadi sumber regenerasi dan laporan per batch tetap menjadi sumber bukti rinci.

## Ringkasan hasil

Sepuluh batch telah selesai untuk cakupan eksplorasi baca yang direncanakan. Menu, tab, list, form yang dapat dibuka tanpa submit, detail, riwayat, pengaturan, template dan ekspor diperiksa. Kelengkapan eksplorasi ini tidak berarti semua aturan bisnis atau seluruh skenario telah lulus pengujian formal.

Hasil konsolidasi menghasilkan **9 kelompok kandidat dari eksplorasi** dan **2 kelompok temuan lama yang direproduksi sebagian/di UI**. Temuan draf expired dan navigasi riwayat Vendor digabung lintas Spot/Kontrak. Counter penawaran tetap membutuhkan keputusan definisi produk. Prioritas di bawah merupakan usulan urutan penanganan, bukan severity atau verdict skenario yang sudah disahkan.

Perhatian utama: kelengkapan ekspor penawaran, perbedaan harga nego pending dengan harga aktif, dan konsistensi guard tambah jadwal. Perbaikan lain mencakup konteks navigasi/filter, label periode dan harga, panduan impor, aksesibilitas, kualitas data serta cakupan suite yang belum tersedia.

Keputusan terbaru sudah dimasukkan: **Order FCL tanpa jadwal diizinkan oleh spec Order**, requirement jumlah kontainer/armada Spot telah ditiadakan oleh user, dan riwayat Vendor hanya mencatat edit. Ketiganya tidak diperlakukan sebagai bug karena absennya input/riwayat tersebut.

## Cakupan dan sumber per batch

Angka berikut adalah snapshot ketika masing-masing batch dijalankan, bukan total yang harus sama sepanjang hari. Rincian route dan aksi ada di laporan sumber serta [peta modul](module-map.md).

| Batch | Area | Hasil utama dan batas | Laporan sumber |
|---|---|---|---|
| 01 | Navigasi, Monitoring, Operasional, Distribusi & Muatan, Dashboard Lelang | Metrik, filter, periode, rincian dan 3 ekspor PDF. Dashboard Lelang 137 lelang/2 dengan Order; aritmetika konsisten, seluruh sumber belum direkonsiliasi. | [Batch01](explore-batch01-20261008.md), [lanjutan](explore-batch01-lanjutan-20261008.md) |
| 02 | Spot Rate FCL/FTL | Admin 435 data/109 draf; Vendor 98. Form, empat metode FCL, reuse, peserta, detail, ulang dan riwayat dibaca; tidak melanjutkan wizard/submit. | [Batch02](explore-batch02-20261008.md) |
| 03 | Lelang Kontrak dan periode | Admin 9 data termasuk 1 draf, 7 periode; Vendor IK 1 FTL. Volume Kontrak dan periode berbeda dari qty Spot. Persistensi/propagasi belum diuji. | [Batch03](explore-batch03-20261008.md) |
| 04 | Live Bidding dan Laporan Spot/Kontrak | Spot live kosong, Kontrak live 1; Vendor live kosong. Laporan default 82 Spot/4 Kontrak; 3 XLSX dibaca. Realtime setelah bid belum dibuktikan. | [Batch04](explore-batch04-20261008.md) |
| 05 | Penawaran, harga, jadwal, request | Vendor 77 penawaran: 32 belum lengkap/30 lengkap/15 expired. Guard dan form jadwal, detail pajak/audit diperiksa; tidak input harga atau kirim request. | [Batch05](explore-batch05-20261008.md) |
| 06 | Negosiasi | Admin 22 record utama dan 2 Tidak Direspons terpisah; Vendor 2. Status, harga, timer dan modal dibaca lalu dibatalkan; tidak merespons nego. | [Batch06](explore-batch06-20261008.md) |
| 07 | Order, Batch Order, Tracking, Simulator | Admin 4 Order, Vendor Order/Tracking kosong. Empat tipe form awal; 2 template dibaca; perhitungan packing berhasil, render 3D belum terverifikasi. | [Batch07](explore-batch07-20261008.md) |
| 08 | Wilayah dan Drop Point | 38 provinsi/514 kota/7.285 kecamatan/83.762 kelurahan, 11 perusahaan. Filter, cascade/reset, detail, audit dan template dibaca; tidak impor atau edit tersimpan. | [Batch08](explore-batch08-20261008.md) |
| 09 | Master operasional dan master Vendor | Rute, pelabuhan, pelayaran, barang, kemasan, unit, sopir, CS. 13 jenis armada/13 kontainer; CS kosong; 11 template berhasil dibaca. Template CS 404 dua kali. | [Batch09](explore-batch09-20261008.md) |
| 10 | Vendor, akun, hak akses, setting, notifikasi | 33 Vendor/26 audit; SubUser dan Hak Akses kosong. Setting dan preferensi dibaca; kedua inbox kosong. Tidak kirim OTP/undangan atau mengubah setting. | [Batch10](explore-batch10-20261008.md) |

## Register temuan gabungan

Identitas GAB berikut hanya indeks konsolidasi, bukan nomor bug/REQ/SCN baru. Rujukan asli dipertahankan agar setiap baris dapat ditelusuri. P1 = didahulukan untuk risiko interpretasi data/aksi bisnis; P2 = perbaikan fungsi/konteks; P3 = perbaikan presentasi.

| ID / sumber | Status | Prioritas usulan | Bukti dan dampak | Tindak lanjut serta batas pembuktian |
|---|---|---|---|---|
| GAB-01 / B04-C01 | Kandidat terhadap requirement existing | P1 | FCL15 mempunyai 4 penawaran API, tetapi ekspor default dan filtered hanya 3; harga 108.900 tidak ikut. FTL06 tanpa harga/7 unit menjadi 21 slot kosong. Laporan berpotensi dianggap lengkap padahal Top3. | Rekonsiliasi AMS003 REQ-015, POS-015 dan EDG-005; tetapkan seluruh penawaran atau ekspor Top3 berlabel eksplisit. Verifikasi 4+ penawaran, tanpa harga dan lintas halaman dengan fixture sendiri. |
| GAB-02 / B05-C01 | Kandidat konsistensi guard | P1 | Quote FCL03 TANTO40: Tambah Jadwal dari card ditolak, tetapi Lihat Jadwal → Tambah membuka form Direct/Connecting; metadata dapatInput=true. Jalur UI berbeda untuk quote yang sama. | Selaraskan guard dan alasan penolakan per aksi. Belum membuktikan submit diterima atau bypass backend. |
| GAB-03 / B02-C01, B03-C01 | Kandidat gabungan draf expired | P2 | Spot: 14 dari 20 draf pertama sudah expired menurut server; contoh 30 September berlabel Hari ini pada 8 Oktober dan Edit terbuka. Pola sama pada Kontrak. | Spot: AMS002 REQ-013/SCN-0026 dan AMS001 REQ-008/SCN-0016. Konfirmasi expected Kontrak tersendiri; uji batas WIB/deep link dan guard. Save belum dicoba. |
| GAB-04 / B02-C02, B04-I06 | Kandidat konteks; perlu keputusan rule | P2 | FCL03 counter 1/2 menghitung Input Harga tanpa jadwal, sementara caption menyebut harga dan jadwal. Form ulang FTL juga memakai caption jadwal. | Putuskan arti Penawaran per tipe/tahap; selaraskan caption/status/counter. Izin Order FCL tanpa jadwal tidak otomatis menetapkan definisi counter. |
| GAB-05 / B02-C03, B03-C02 | Kandidat gabungan navigasi | P2 | Riwayat Perubahan Vendor Spot/Kontrak menuju daftar umum `/vendor-portal/penawaran`, tanpa scope lelang; Spot direcheck dua kali. Konteks riwayat hilang. | Perbaiki tujuan dan pertahankan ID lelang. Definisi isi/entitlement riwayat Vendor masih perlu sumber produk. |
| GAB-06 / B01-C01 | Kandidat scope diagram | P2 | Periode standar FCL/FTL total 1 tetapi diagram 50/50; tipe tanpa Order tetap 50/50. Custom FTL menunjukkan 100% FTL. Payload API mendukung perbedaan scope. | Tentukan diagram mengikuti filter atau sengaja komparasi global; bila global beri label. Rekonsiliasi data sumber sebelum verdict formal. |
| GAB-07 / B09-C01 | Kandidat entitlement/UI | P2 | Download Template CS tampil aktif tetapi GET template dua kali 404 PRODUCT_NOT_ACTIVE; UI memberi error unduh. | Selaraskan ketersediaan fitur, endpoint dan tombol; tampilkan alasan bila tidak aktif. Akar backend/konfigurasi belum ditentukan. |
| GAB-08 / B10-C01 | Kandidat konteks filter | P2 | Tab Hak Akses menampilkan filter Nama SubUser/Email/Bagian Staff/Status, sedangkan tabel nama/deskripsi/total akses. Screenshot mendukung. | Gunakan field Hak Akses yang relevan. Tabel kosong, sehingga hasil filtering backend belum dibuktikan. |
| GAB-09 / B04-C02 | Kandidat konteks ekspor | P3 | XLSX Kontrak berjudul Laporan Lelang Spot Rate dan header Periode Pengiriman; nomor kontrak di isi benar. | Pisahkan template/header Kontrak dan validasi metadata. Tidak menyimpulkan seluruh data berasal dari Spot. |
| GAB-10 / CAND-NEGO-LIST-PENDING, Batch06 | Temuan lama direproduksi | P1 | FCL25 list Harga Terbaru 5.000.000 (pending), detail Harga Saat Ini 12.000.000. Pengguna dapat menganggap nominal pending sudah disepakati. | Pisahkan harga aktif dari nominal nego terakhir; recheck terhadap DOCX dan alur harga Order. Belum membuktikan Order memakai 5 juta. CAND-NEGO-OFFER-PRICE lama belum direcheck. |
| GAB-11 / BUG-V4, B10-R01 | Temuan lama direproduksi pada UI | P2 | List Vendor Menunggu sudah tanpa Edit, tetapi detail masih mempunyai Edit Vendor yang membuka form Status Aktif. | Recheck guard detail/form dan status dengan fixture terkontrol. Penolakan Save400 lama belum diuji ulang; belum dapat ditandai fixed. |

Jumlah register: **11 kelompok = 9 kandidat eksplorasi + 2 temuan lama**. Satu kelompok kandidat mencakup keputusan definisi counter. Status kandidat tidak disetarakan dengan bug terkonfirmasi atau skenario failed.

## Rule dan keputusan yang menjadi acuan

| Area / sumber | Acuan konsolidasi | Yang masih perlu dibuktikan atau diputuskan |
|---|---|---|
| Order FCL / B05-R01 → B07-R01 | Spec Order eksternal mengizinkan Order tanpa jadwal; banner dan pengisian jadwal saat konfirmasi Vendor. Observasi Batch05 direkonsiliasi, bukan bug UI terkonfirmasi. | Pemetaan konflik AMS006 REQ003 lama, banner, toleransi Closing/ETD/ETA dan Rencana Akhir Kirim, konfirmasi backend. AMS009 Order eksternal berbeda dari AMS009 harga di repo. |
| Qty Spot / keputusan user | Jumlah Kontainer/Armada Spot tidak lagi requirement. Volume Kontrak dan qty Order merupakan konsep terpisah. | Dokumentasi/skenario jangan mengembalikan requirement Spot yang ditiadakan. |
| Audit Vendor / keputusan user | Riwayat Vendor hanya edit; create tidak masuk riwayat bukan bug. | Audit setelah perubahan terkontrol, bukan inferensi dari riwayat kosong. |
| Dashboard / B01-R01–R17 | Harian/Mingguan/Bulanan adalah granularity minggu/bulan/tahun; custom pembanding sama panjang; sampel batas WIB inklusif. Rentang harga memerlukan minimal dua Vendor pada kombinasi lelang/unit. | Formula transaksi/pajak, SLA, partisipasi, kapasitas dan rekonsiliasi semua sumber; boundary lintas bulan/tahun. |
| Order berulang / B01-R15, Batch10 | Kelas 0, 1, 2–B dan >B; B tersimpan saat observasi =5, bukan konstanta. | Validasi/persistensi/scope setting dan efek reload dengan fixture terkontrol. |
| Penawaran/harga / Batch02/05/06 | Harga tanpa jadwal tetap harus dipertimbangkan sesuai rule terbaru. DPP/PPN/PPh berbeda dari harga final; nominal pending berbeda dari harga aktif. | Makna counter, pergantian harga penawaran setelah respons nego dan sumber harga untuk Pesan/Order. |
| Negosiasi / Batch06, Batch10 | Jawaban DOCX: nominal shipper boleh naik/turun selama di bawah harga saat ini; respons Vendor terakhir acuan harga; final mengakhiri putaran. Setting respons sekarang 5 menit berlaku deadline baru, bukan mengubah deadline aktif. | Frasa batas pengajuan “Tidak ada batasan… Ada 5” tetap ambigu; shortcut Terima di list Shipper, submit/batas nominal/timeout nyata. |
| Jadwal / Batch05/07/10 | Direct/Connecting dan approval edit jadwal tenant dibedakan; approval tersimpan aktif. | Guard per aksi, toleransi tanggal, approval/penolakan/notifikasi dan import jadwal. |
| Kontrak / Batch03/07 | Volume Kontrak, periode bersama dan batas periode kontrak diperlakukan sesuai konteksnya. | Eligibility periode lelang lampau, propagasi edit periode, harga berlaku dan audit lintas lelang. |
| Retensi/pagination / Batch04/10 | Live retensi 3 hari; filter dapat memperluas historis. Page20 lelang dapat menghasilkan 33 card; unit dan lelang bukan denominator sama. | Seluruh boundary H+3/WIB, filter gabungan, ranking/tie-break, realtime dan pagination. |
| Master inactive / B09-R01 | Jenis nonaktif masih terlihat/dapat dipilih lokal saat tambah Armada Vendor; armada existing dapat memakai jenis nonaktif. | Tetapkan larangan create baru versus menjaga referensi legacy. Belum terbukti backend menerima create. |
| Notifikasi / Batch10 | Admin 6 jenis/6 Push; Vendor 8 jenis/9 kanal karena Order Baru Email+Push. Autohapus inbox 3 bulan tertera di UI. | Pemetaan kategori/global/pribadi, delivery, deep link, mark-read/delete dan retensi dengan inbox berisi. |

Deadline fixture FCL25 berubah sebelum Batch06 menjadi 9 Oktober 11:02:58 WIB; FTL18 9 Oktober 08:29:39 WIB. Eksplorasi tidak mengubah fixture. Angka ini adalah bukti historis sesi, bukan deadline yang selalu berlaku.

## Backlog improve gabungan

Setiap kelompok mencakup usulan produk atau tambahan cakupan. Usulan yang sudah terkait requirement existing tetap dicatat sebagai gap existing, bukan seluruhnya fitur baru di luar spec.

| Kelompok | Improve yang disarankan | Rujukan sumber |
|---|---|---|
| IMP-01 — istilah, counter dan scope | Selaraskan harga aktif/pending, Penawaran, jenis/kanal notifikasi, lelang/card/unit, Perusahaan/Lokasi/Customer, dan label filter No. Lelang. Tambahkan keterangan historical scope dan denominator. | B02-I03/I06, B04-I01/I03/I06, B05-I02, B06-I01/I02, B08-I03, B09-I05, B10-I03 |
| IMP-02 — periode dan konfigurasi | Tampilkan rentang efektif dan WIB; jelaskan granularity dashboard, deadline absolut nego, efek setting pada deadline baru dan kelas 2–B/>B. Dokumentasikan Volume/periode/harga Kontrak. | B01-I02/I03/I06, B03-I02/I03/I04, B06-I03 |
| IMP-03 — ekspor lengkap dan mudah dibaca | Metadata periode/filter/timestamp, jumlah lelang/baris harga, template Spot/Kontrak yang sesuai, PDF searchable dan tabel terstruktur. Validasi isi file selain berhasil download. | B01-I04/I05, B04-I01/I02 |
| IMP-04 — reuse dan perubahan input | Enumerasi field yang disalin/reset, peringatan ketika perubahan metode memangkas lokasi, dan konfirmasi dirty-state konsisten. Loading harus jelas sampai nilai existing selesai dimuat. | B02-I01, B03-I05, B08-I04, B10-I02 |
| IMP-05 — panduan impor | Petunjuk field wajib, referensi aktif, format wilayah/WA/transit/angka, batas file dan error per baris. Contoh tanggal relevan; istilah Kontainer pada FCL; jelaskan perbedaan template/form pajak/KIR dan logo. | B07-I01/I02, B08-I01, B09-I01/I02 |
| IMP-06 — aksesibilitas | Accessible name Aksi/bell/toggle/paging, label filter stabil, tab/panel yang jelas, sort keyboard/aria-sort, indikator disabled dengan alasan. | B02-I04, B03-I07, B04-I07, B06-I03/I04, B08-I04, B10-I03 |
| IMP-07 — ketahanan live dan 3D | Status koneksi/update terakhir, reconnect yang mempertahankan filter, batas loading 3D dan ringkasan muatan/fallback yang tetap terbaca. | B04-I04, B07-I04; B07-L01 masih batas verifikasi |
| IMP-08 — kualitas data dan presisi | Indikator mismatch alamat/wilayah/kodepos, format Maps yang didukung, presisi adaptif volume kecil, dimensi/varian jenis di pilihan dan preview audit logo sesuai izin. | B08-I02/I05, B09-I03/I04/I05, B10-I04 |
| IMP-09 — alur kosong dan prasyarat akses | Petunjuk langkah berikut pada Order/Tracking kosong dan Hak Akses sebelum SubUser; jelaskan inheritance serta Semua Data/Data Sendiri. | B07-I03, B10-I01 |
| IMP-10 — gap existing dan suite baru | Putuskan rating/filter rating Spot, import/template jadwal yang belum tampak, expired/deep-link guard, periode bersama/audit, serta suite dashboard, Kontrak, Order/Tracking/Simulator, master, akun/settings/notifikasi. | B01-I01, B02-I02/I05, B03-I01/I06, B04-I05, gap Batch05, B07-G01, B08-G01, B09-G01, B10-G01 |

## Urutan tindak lanjut per batch

Tetap dikerjakan per batch, sesuai permintaan awal. Daftar ini merupakan backlog; penyusunan laporan gabungan tidak menjalankan semua modul.

| Urutan | Fokus | Hasil yang diharapkan |
|---|---|---|
| A | Triage ekspor, harga pending dan guard jadwal | Keputusan expected, pemetaan sumber/REQ yang berlaku, serta reproduksi terisolasi GAB-01/02/10. |
| B | Draf, navigasi Vendor, counter dan dashboard | Pisahkan perbaikan fungsi dari perubahan definisi; verifikasi GAB-03–06 dengan fixture yang sesuai. |
| C | Master CS, Hak Akses dan Vendor Menunggu | Recheck GAB-07/08/11, kebijakan inactive, inheritance akses dan guard backend. |
| D | Improve presentasi dan dokumen | Rapikan label/metadata, panduan template, aksesibilitas, empty state dan dirty-state berdasarkan IMP-01–09. |
| E | Lengkapi suite dan validasi lifecycle | Tambahkan skenario yang belum tersedia, fixture milik run sendiri, lalu uji submit/transisi/expiry/tenant per modul. |

Temuan lama BUG-V1/V2/V3, CAND-NEGO-OFFER-PRICE, tautan dokumen dan backend Save BUG-V4 belum diretest lengkap. Perubahan ukuran dokumen atau satu menu yang membaik tidak cukup untuk menutup temuan lama.

## Bukti, metode dan keterbatasan

Sumber konsolidasi adalah 11 laporan Markdown (Batch01 memiliki laporan lanjutan), [rencana batch](explore-batch-plan-20261008.md), [peta modul](module-map.md) dan [keputusan bersama](../shared/decisions.md). JSON, screenshot dan ekspor aplikasi berada di `artifacts/explore-batches/20261008/` serta `artifacts/screenshots/explore/20261008/`; path dan nama bukti spesifik tercantum di setiap laporan sumber. Artefak lokal diabaikan Git dan perlu disertakan terpisah bila laporan dibagikan.

Eksplorasi tidak submit/simpan/hapus data bisnis, bid atau merespons nego, mengubah pengaturan, maupun mengirim undangan/OTP/notifikasi. Batch07 mengizinkan **4 POST perhitungan baca** yang berhasil; POST perhitungan dibedakan dari mutasi bisnis. Abort guard awal pada perhitungan/telemetri menghasilkan error harness yang tidak dihitung sebagai bug.

Summary jaringan awal Admin Batch09 tidak tersimpan akibat kegagalan harness. Sesi lanjut merekam dua API404 template CS. Karena itu laporan tidak mengklaim ledger lengkap atau nol error API untuk seluruh sepuluh batch. Salah asumsi route, locator/race, snapshot skeleton dan timeout stream dipisahkan dari temuan aplikasi; bukti settled/recheck digunakan ketika tersedia.

API packing Batch07 memberi 200 dan susunan muatan diperiksa, tetapi pembacaan render3D timeout pada browser headless: **B07-L01 belum terverifikasi**, bukan bukti API gagal. Data kosong membatasi bid realtime, penugasan/tracking, SubUser/Hak Akses dan delivery notifikasi. Tidak ada uji stress, seluruh kombinasi filter, otorisasi lintas tenant, persistensi, validasi upload/import atau lifecycle tulis dalam laporan ini.

Klik native berhasil pada sampel; dropdown, kalender dan role dialog tidak seragam antarhalaman. Peta selector di `shared/selector-map-*.md` dan checklist di `CLAUDE.md` menyimpan detail untuk eksekusi berikutnya. Pengujian storageState lintas context tidak diulang dalam batch ini.

Laporan ini adalah hasil eksplorasi dan triage awal. Verdict formal membutuhkan eksekusi canonical skenario melalui workflow test-module; laporan Excel hasil eksekusi menggunakan `scripts/generate_report.py` atas JSON hasil run yang benar. Tidak dibuat verdict sintetis dari observasi baca.

## Berkas laporan

- Laporan utama untuk dibaca/dibagikan: `reports/explore-consolidated-20261008.xlsx`.
- Sumber regenerasi: `explore/explore-consolidated-20261008.md`.
- Sumber rinci: sepuluh laporan batch dan satu lanjutan Batch01 tetap dipertahankan.

Workbook Excel memuat isi konsolidasi dalam sheet terpisah. Referensi bukti lengkap tersedia di repository; workbook tidak menyematkan semua screenshot/JSON dan tidak memuat kredensial atau sesi login. Regenerasi menggunakan `python scripts/generate_report.py --explore explore/explore-consolidated-20261008.md`.
