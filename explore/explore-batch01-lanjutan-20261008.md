# Batch 01 lanjutan — Interaksi Dashboard dan Ekspor

8 Oktober 2026, sekitar 11.22–11.30 WIB. Cakupan: empat dashboard Admin, melanjutkan inventaris Batch 01. Login berhasil dari config/env.md; satu context, tanpa storageState, browser sudah ditutup. Tidak berpindah ke Batch 02 dan tidak submit perubahan bisnis atau setting. Membuka Pengaturan Jumlah Order lalu Batal, tanpa mengubah nilai. Hasil adalah eksplorasi, bukan verdict seluruh skenario formal.

## Pemeriksaan yang selesai

| Area | Interaksi dan bukti | Hasil / batas |
|---|---|---|
| Monitoring | Semua Tahapan, Selesai Muat, Selesai Bongkar, Melewati SLA, Belum Ada Pencatatan; parameter status ALL/SELESAI_MUAT/SELESAI_BONGKAR/MELEWATI_SLA/BELUM_ADA_PENCATATAN | Semua counter 0. Empat tab menampilkan Tidak ada armada yang cocok dengan filter; Semua Tahapan menampilkan Belum ada armada yang sedang dalam proses pengiriman. Tidak dapat membuktikan klasifikasi SLA/tahapan tanpa armada berjalan |
| Operasional | Harian/Mingguan/Bulanan; datepicker 1–8 Oktober; seluruh opsi tipe order FTL/FCL/LTL/LCL/Airfreight dan kembali Semua | Respons API dan render diperiksa setelah respons selesai. Custom FTL = 1 order. Ada kandidat ketidakkonsistenan diagram di periode standar, lihat B01-C01 |
| Tabel Keterlambatan | Pencarian, Enter, sort Vendor/Keterlambatan/Persentase Keterlambatan | Request membawa search dan sortBy yang sesuai. Tabel kosong; urutan baris dan detail keterlambatan belum terbukti |
| Distribusi & Muatan | Harian/Bulanan/Mingguan, datepicker dengan klik akhir 8 Oktober lalu awal 1 Oktober, Perbesar/Perkecil/pas-kan peta | Satu tanggal belum mengirim request dashboard; pasangan tanggal dinormalisasi ke 1–8 Oktober. API custom: 1 armada, 200 koli, volume 8,5333%, berat 4%; UI/PDF membulatkan volume 9% dan berat 4% |
| Dashboard Lelang | Filter asal Surabaya, tujuan Balikpapan, unit 20 ft FCL; pencarian opsi; Terapkan/Reset; Harian/Bulanan/Mingguan; custom 1–8 Oktober; Refresh | Draft opsi kota tidak mengirim request sampai Terapkan. Filter asal menghasilkan 62 lelang; Reset kembali 137. Filter tujuan + unit menghasilkan 9; custom tetap 9; Refresh mempertahankan filter |
| Empty state Lelang | Tambahkan asal Kota Sabang pada tujuan Balikpapan + 20 ft FCL + custom 1–8 Oktober | 0 lelang; partisipasi/persentase konversi tampil -, tanpa NaN/Infinity; pesan kosong tiap bagian |
| Rincian Lelang | Dua rincian respons dan satu rincian konversi dibuka dengan fokus keyboard + Enter | Elemen details memakai sr-only focus-within:not-sr-only; klik pointer langsung awal tertutup elemen lain karena target tersembunyi untuk screen reader. Ini bukan bukti bug klik atau kebutuhan dispatchEvent |
| Pengaturan Jumlah Order | Buka modal, baca input/preview, Batal | Modal role=dialog; input number nilai 5, min 2, step 1, tanpa max HTML. Kelompok 0/1 tetap; batas Order Berulang dapat diubah dan Order Tinggi menyesuaikan. Tidak menguji simpan atau validasi backend |
| Export | Export Operasional, Distribusi dan Lelang; file diperiksa dengan pdfinfo dan render halaman pertama | Tiga PDF valid A4: Operasional 2 halaman, Distribusi 1, Lelang 2. File memuat visual dan angka, bukan PDF kosong. Tidak mengklaim seluruh baris/halaman ekspor sudah diperiksa |

## Rule baru yang perlu masuk dokumentasi/skenario

| ID | Rule teramati | Bukti dan implikasi |
|---|---|---|
| B01-R10 | Harian = grafik hari dalam minggu berjalan; Mingguan = grafik minggu dalam bulan berjalan; Bulanan = grafik bulan dalam tahun berjalan | Ketiga API dashboard: Harian 5–11 Oktober, Mingguan 1–31 Oktober, Bulanan 1 Januari–31 Desember 2026. Ini granularity agregasi, bukan otomatis rentang 1 hari/7 hari/1 bulan. Perlu label bantuan eksplisit |
| B01-R11 | Periode pembanding custom sama panjang dan langsung mendahului periode terpilih | Operasional/Distribusi 1–8 Oktober dibandingkan 23–30 September; belum menguji semua boundary bulan/tahun |
| B01-R12 | Dashboard Lelang memakai Asia/Jakarta pada batas periode | Custom awal 30 September 17:00:00 UTC dan akhir 8 Oktober 16:59:59.999 UTC = 1 Oktober 00:00 hingga 8 Oktober 23:59:59.999 WIB; akhir hari inklusif pada payload ini |
| B01-R13 | Unit 20 ft (FCL) menambahkan serviceType=FCL bersama jenisUnitId | Filter gabungan tujuan/unit/periode dikirim bersama; filter ini bukan hanya teks label |
| B01-R14 | Reset Lelang langsung memulihkan data aktif, dapat memakai cache | Surabaya 62 → Reset 137 tanpa GET baru. Penantian request sempat timeout; recheck render/snapshot membuktikan Reset bekerja. Timeout harness bukan bug aplikasi |
| B01-R15 | Batas 5 pada B01-R07 adalah konfigurasi saat observasi, bukan konstanta | Modal menjelaskan batas atas Order Berulang dapat diubah. Rule umum: 0, 1, 2–B dan >B, dengan B saat ini 5; atribut min=2/step=1 hanya bukti UI |
| B01-R16 | Rentang harga memerlukan minimal dua vendor pada kombinasi lelang/unit | Empty state eksplisit. Filter 20 ft FCL tidak memiliki pasangan eligible pada sampel walau beberapa lelang mempunyai penawaran; jangan menyamakan jumlah penawaran dengan jumlah vendor |
| B01-R17 | Rincian grafik menyediakan tabel aksesibel | details disembunyikan secara visual hingga fokus keyboard. Tidak memakai dispatch/force click. Menjadi tambahan cakupan aksesibilitas |

## Kandidat bug dan usulan improve

**B01-C01 — diagram Jenis Pengiriman tidak konsisten dengan filter tipe pada periode standar.**

Reproduksi: Operasional → Mingguan → pilih FCL/FTL/Airfreight/LTL/LCL, tunggu respons GET /api/dashboard-operasional dan render selesai. FCL dan FTL masing-masing Total Order 1, tetapi volume.jenisPengiriman tetap FTL count 1 + FCL count 1 dan diagram 50%/50%. Airfreight/LTL/LCL Total Order 0, tetapi diagram tetap 50%/50% dari FTL/FCL. Tanpa filter, Total Order 2 dan diagram tersebut konsisten. Pada Bulanan + FTL, Total Order 3 sementara diagram FTL 75% / FCL 25%; PDF juga memuat selisih ini. Payload API sendiri mengandung komposisi tersebut, jadi bukan hanya angka UI lama akibat menunggu terlalu singkat. Custom 1–8 Oktober + FTL sebelumnya memberi diagram FTL 100%; masalah terbukti pada periode standar yang diuji, jangan digeneralisasi ke semua rentang.

Klasifikasi: **bug-candidate**, sebab definisi formal cakupan diagram terhadap filter belum tersedia. Jika diagram memang sengaja menampilkan semua tipe sebagai pembanding, UI perlu menyatakan cakupan berbeda tersebut. Tidak menandai suite lama failed atau mengubah expected tanpa rule produk.

Bukti: main-operasional-filter-recheck.json, main-operasional-ltl-lcl.json, main-operasional-settled-periods.json, main-operasional-airfreight.json; screenshot operasional-airfreight-inconsistent.png; PDF dashboard-operasional-20261008.pdf.

Usulan improve lainnya:

- **B01-I03 — arti tab periode:** jelaskan Harian/Mingguan/Bulanan sebagai tingkat agregasi dan tampilkan tanggal awal/akhir efektif agar pengguna tidak menganggap Harian hanya hari ini.
- **B01-I04 — konteks ekspor:** Operasional halaman pertama yang diperiksa langsung mulai Volume dan Aktivitas tanpa identitas periode/filter tipe. Tambahkan judul, tanggal rentang efektif, tipe order, waktu pengambilan. Dashboard Lelang lebih lengkap dengan filter dan timestamp, tetapi chip custom hanya Tanggal Pilihan; tambahkan tanggal awal–akhir pada header. Distribusi mempunyai tanggal di legenda peta, tetapi akan lebih mudah dibaca sebagai header laporan.
- **B01-I05 — ekspor aksesibel:** pdftotext tidak menemukan teks pada ketiga PDF, sedangkan render memperlihatkan data. Usulkan teks yang dapat dicari/disalin dan ekspor tabel terstruktur; ini gap usability, bukan gagal download.
- **B01-I06 — dokumentasi konfigurasi:** masukkan rule B, default saat ini 5, validasi batas, persistensi dan cakupan pengguna/tenant ke spec; persistensi/cakupan belum terbukti karena tidak menyimpan setting.

## Rekonsiliasi yang berhasil dan batasnya

Payload Mingguan Dashboard Lelang: jumlah dibuka = 137; sum kelompok pemakaian = 137; sum rincian komposisi respons = 137; total rincian konversi = 137; lelang dengan order = 2; 2/137 × 100 = 1,459854% cocok tampilan 1,46%. Selisih min/max pada lima rentang harga dan persentase diikuti/diundang pada vendor teraktif konsisten secara aritmetika. Bukti reconciliation.json.

Ini **konsistensi internal** payload dan tampilan, belum rekonsiliasi dengan semua record sumber Order/penawaran. Agregasi harga aktif/expired/nego/pajak, batas SLA, kapasitas 50%/100%, data tanpa kapasitas, lelang tanpa undangan dan hari/periode lintas tahun belum diuji dengan fixture presisi. Data kosong bukan alasan mengarang verdict lulus.

## Bukti dan handoff

Folder bukti: artifacts/explore-batches/20261008/continuation-2026-10-08T04-21-55-916Z/. Screenshot dan render PDF juga disalin ke artifacts/screenshots/explore/20261008/batch01-continuation/. Bukti lama dipertahankan.

main-session-summary.json mencatat respons selama eksplorasi: tidak ada respons API >=400; request non-read yang tercatat hanya POST /api/auth/refresh otomatis (6), bukan mutasi bisnis. Login tidak dihitung sebagai pengujian rule bisnis. Tidak menyimpan cookie/token/storageState atau mencetak kredensial.

Checklist hipotesis: native login/klik berhasil; dropdown filter Lelang kustom, tipe order Operasional select native; kalender dashboard flatpickr dengan tanggal overflow; modal pengelompokan role=dialog sehingga modal AMS tidak seragam; Monitoring 0 data-testid pada recheck. Sesi lintas context dan sampel form bisnis belum diuji pada lanjutan ini; bukti form historis 4 Oktober dipertahankan.

**Status Batch 01:** inventaris dan interaksi utama dashboard selesai untuk eksplorasi read-only, dengan kandidat dan backlog terukur di atas. Batas fixture/kalkulasi menyeluruh tetap dicatat. Batch 02 belum dijalankan.
