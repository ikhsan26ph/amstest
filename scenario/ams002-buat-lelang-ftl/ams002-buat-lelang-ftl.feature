Feature: Lelang spot rate FTL dari sisi admin shipper
  Skenario dari spesifikasi dan desain; interpretasi ambigu tercatat dalam analysis.md.

  @positive @priority-high @REQ-001 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-001 — Nomor PGR dibuat pada submit
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; V-A dipilih; format PGR fixture FTL-NRM/{sequence:06}; sequence terakhir 41"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Nomor FTL-NRM/000042 terbentuk tepat sekali dan tersimpan"

  @negative @priority-high @REQ-001 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-001 — Draft tidak menerbitkan nomor resmi
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; step 2 belum submit; sequence terakhir 41"
    When user mengklik elemen "Simpan ke Draft"
    Then sistem memenuhi hasil "Nomor resmi kosong; sequence tetap 41; status Isi Peserta Lelang"

  @positive @priority-high @REQ-002 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-002 — FTL langsung menampilkan struktur tanpa tahap jadwal
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form baru"
    When user mengklik elemen "FTL"
    Then sistem memenuhi hasil "Card Informasi Umum, Syarat & Ketentuan, Data Pengirim dan Data Penerima terlihat"
    And sistem memenuhi hasil "Tidak ada field Pelabuhan, Metode Pengiriman, Skema Pengiriman atau tahap jadwal"

  @negative @priority-high @REQ-002 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-002 — Field FCL tidak terbawa setelah beralih FTL
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form sempat memilih FCL dengan pelabuhan contoh"
    When user mengklik elemen "FTL"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Validasi FTL tidak meminta pelabuhan, metode atau skema; payload FTL tidak membawa field khusus FCL"

  @positive @priority-high @REQ-003 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-003 — Order kedua menggunakan lelang yang sama
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang Aktif; satu order sudah terbentuk; harga V-A aktif; sekarang sebelum akhir kirim; OMS fixture menyelesaikan order setelah Pesan"
    When user mengklik elemen "Pesan [V-A]"
    Then sistem memenuhi hasil "Order kedua mereferensikan nomor lelang sama"
    And sistem memenuhi hasil "Lelang tetap Aktif"

  @negative @priority-high @REQ-003 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-003 — Order setelah akhir kirim ditolak
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Sekarang 30/09/2026 10:01; akhir kirim 30/09/2026 10:00; lelang Selesai"
    When user mengklik elemen "N/A [V-A]"
    Then sistem memenuhi hasil "Alert batas kirim terlewati; tidak ada order baru"

  @positive @priority-high @REQ-004 @screen-riwayat-perubahan
  Scenario: AMS002-BUAT-LELANG-FTL-POS-004 — Audit menampilkan mutasi data yang berhasil
    Given user berada di halaman "riwayat-perubahan"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture perubahan PIC Budi menjadi Budi Baru oleh admin-A pada 22/09/2026 09:00 berhasil disimpan"
    When user membuka halaman "riwayat-perubahan"
    And user memeriksa elemen "Riwayat Perubahan" dengan kondisi "Satu perubahan PIC Budi ke Budi Baru beserta admin-A dan 22/09/2026 09:00"
    Then sistem memenuhi hasil "Riwayat memuat field PIC, nilai lama Budi, baru Budi Baru, admin-A dan waktu yang benar"

  @negative @priority-high @REQ-004 @screen-riwayat-perubahan
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-004 — Mutasi gagal tidak ditulis sebagai perubahan sukses
    Given user berada di halaman "riwayat-perubahan"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture edit ditolak karena Rencana Akhir sebelum Awal; audit sebelum aksi disimpan"
    When user membuka halaman "riwayat-perubahan"
    Then sistem memenuhi hasil "Tidak ada entri perubahan sukses untuk edit ditolak; data lelang tetap"

  @positive @priority-high @REQ-005 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-005 — Menu edit tersedia untuk lelang terbuka
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang A Belum Buka"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Edit Data"
    Then sistem memenuhi hasil "Halaman Edit Lelang Spot Rate terbuka untuk lelang A"

  @negative @priority-high @REQ-005 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-005 — Menu edit status tutup memberi alert
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang A Tutup"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Edit Data"
    Then sistem memenuhi hasil "Edit Data tetap terlihat; alert status tidak mengizinkan edit; tidak berpindah ke form"

  @positive @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-006 — Status mengikuti waktu buka
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang A buka 22/09/2026 10:00; tutup besok; jam sekarang tepat buka"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Sedang Buka pada A; input penawaran vendor diizinkan"

  @negative @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-006 — Status dibatalkan tidak hidup kembali oleh scheduler
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang A Dibatalkan manual; jam melewati tanggal buka"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge tetap Dibatalkan; bidding tidak aktif"

  @positive @priority-high @REQ-007 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-007 — Substatus draft step 1 dan step 2 dibedakan
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 disimpan step 1; D2 disimpan step 2"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "D1 berlabel Isi Informasi Umum; D2 berlabel Isi Peserta Lelang"

  @negative @priority-high @REQ-007 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-007 — Draft tidak ditampilkan sebagai lelang submitted
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 masih draft dan jadwal buka sudah tiba"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "D1 tetap Isi Informasi Umum; tidak menjadi Sedang Buka; tidak mengundang vendor"

  @positive @priority-high @REQ-008 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-008 — Badge tanpa penawaran dan tanpa order
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup dengan nol penawaran; B Tutup dengan dua penawaran dan nol order"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "A menampilkan Tidak Ada Penawaran; B menampilkan Tidak Ada Order"

  @negative @priority-high @REQ-008 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-008 — Badge kosong tidak melekat pada data berisi
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif dengan satu penawaran dan satu order"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "A tidak menampilkan Tidak Ada Penawaran maupun Tidak Ada Order"

  @positive @priority-high @REQ-009 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-009 — Tab ulang dan draft menghitung dataset
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 2 lelang sedang ulang, 3 draft, 1 lelang biasa"
    When user mengklik elemen "Lelang Ulang"
    And user memeriksa elemen "Card Lelang" dengan kondisi "Hanya 2 lelang ulang aktif"
    And user mengklik elemen "Draf"
    Then sistem memenuhi hasil "Counter ulang 2 dan draft 3; Draf berisi tepat 3 draft"

  @negative @priority-high @REQ-009 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-009 — FTL tidak masuk tab Request Jadwal
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Dataset FTL dan FCL; hanya FCL memiliki request jadwal"
    When user mengklik elemen "Request Jadwal"
    Then sistem memenuhi hasil "Tidak ada FTL pada hasil; counter hanya menghitung request FCL"

  @positive @priority-high @REQ-010 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-010 — Warna membedakan proses nego dan ulang
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A sedang nego; B sedang ulang"
    When user membuka halaman "list-lelang"
    And user memeriksa elemen "Legenda" dengan kondisi "Proses Nego biru dan Lelang Ulang ungu"
    Then sistem memenuhi hasil "Border A biru sesuai legenda Proses Nego; B ungu sesuai legenda Lelang Ulang"

  @negative @priority-high @REQ-010 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-010 — Card tanpa proses tidak memakai penanda proses
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A tanpa nego/ulang/request jadwal"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "A tidak memiliki border penanda Proses Nego atau Lelang Ulang"

  @positive @priority-high @REQ-011 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-011 — Link multipoint membuka urutan titik lengkap
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A memiliki 2 pengirim Surabaya dan Malang serta 2 penerima Bandung dan Bogor"
    When user mengklik elemen "Multipickup [A]"
    And user memeriksa elemen "Detail Multipickup" dengan kondisi "Muat 1 Surabaya dan Muat 2 Malang dengan nama drop point serta alamat lengkap"
    And user mengklik elemen "Tutup Popup"
    And user mengklik elemen "Multidrop [A]"
    Then sistem memenuhi hasil "Detail Multidrop menampilkan Bongkar 1 Bandung dan Bongkar 2 Bogor dengan nama dan alamat sesuai urutan"

  @negative @priority-high @REQ-011 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-011 — Rute tidak memakai kota di luar drop point
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Normal DP-A01 kota Surabaya dan DP-A02 kota Malang; alamat perusahaan tenant Jakarta"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Rute Surabaya → Malang, bukan Jakarta; tidak ada link Multipickup/Multidrop pada card normal"

  @positive @priority-high @REQ-012 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-012 — Card lelang memetakan ringkasan tersimpan
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture A FTL Tutup, 2 dari 3 vendor menawar, rute Surabaya–Malang dan periode dari validForm"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Card A memuat nomor resmi, FTL, rute, status, 2 dari 3 Vendor, pengirim/penerima, periode lelang dan pengiriman sesuai fixture"

  @negative @priority-high @REQ-012 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-012 — Card tidak membocorkan data tenant lain
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "SHIPPER-B punya lelang SECRET-B; SHIPPER-A tidak memiliki lelang"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Daftar kosong untuk A; nomor dan nama dari SECRET-B tidak tampil"

  @positive @priority-high @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-013 — Draft hari kedaluwarsa masih tersedia merah
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Draft D1 kedaluwarsa 22/09/2026; sekarang 22/09/2026 23:59 lokal"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "D1 masih tampil; teks kedaluwarsa merah dan Hari ini"

  @negative @priority-high @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-013 — Draft lewat hari kedaluwarsa tidak dapat dibuka
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Draft D1 kedaluwarsa kemarin; job pembersihan telah dijalankan"
    When user mengklik elemen "Draf"
    And user membuka halaman "edit-lelang D1"
    Then sistem memenuhi hasil "D1 hilang dari daftar/counter; URL lama tidak memulihkan draft"

  @positive @priority-high @REQ-014 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-014 — Menu draft hanya lanjut edit dan hapus
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 draft step 2"
    When user mengklik elemen "Draf"
    And user mengklik elemen "Menu Aksi [D1]"
    And user memeriksa elemen "Menu Aksi" dengan kondisi "Hanya Edit Data dan Hapus Draft"
    And user mengklik elemen "Edit Data"
    Then sistem memenuhi hasil "Draft dibuka kembali pada step Peserta Lelang dengan data tersimpan"

  @negative @priority-high @REQ-014 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-014 — Riwayat ulang tidak ditawarkan sebelum pernah ulang
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang A belum pernah lelang ulang"
    When user mengklik elemen "Menu Aksi [A]"
    Then sistem memenuhi hasil "Riwayat Lelang Ulang tidak tampil; menu Detail dan Riwayat Perubahan tersedia"

  @positive @priority-high @REQ-015 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-015 — Pagination default dua puluh item
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 lelang dengan ID unik urut stabil"
    When user memeriksa elemen "Tampilkan" dengan kondisi "Nilai awal 20"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua hanya berisi item ke-21; counter rentang 21–21 dari 21"

  @negative @priority-high @REQ-015 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-015 — Navigasi tidak melewati halaman terakhir
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 lelang; halaman 2 sudah aktif"
    When user mengklik elemen "Halaman Terakhir"
    Then sistem memenuhi hasil "Tetap halaman 2; tidak ada halaman kosong tambahan atau duplikasi item"

  @positive @priority-high @REQ-016 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-016 — Memilih FTL membuka keempat card
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form baru jenis belum dipilih"
    When user mengklik elemen "FTL"
    Then sistem memenuhi hasil "Step 01 Informasi Umum aktif; Step 02 Peserta Lelang berikutnya; keempat card langsung terlihat"

  @negative @priority-high @REQ-016 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-016 — Melanjutkan tanpa jenis pengiriman ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form baru jenis belum dipilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Tetap step 1; jenis pengiriman wajib dipilih; tidak membuka peserta"

  @positive @priority-high @REQ-017 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-017 — Perbaikan required menghapus error
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid kecuali Durasi kosong; error sudah tampil"
    When user memilih opsi "1 Hari" pada field "Durasi Lelang"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Durasi hilang; masuk step 2"

  @negative @priority-high @REQ-017 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-017 — Semua required kosong menyorot field pertama
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "FTL dipilih; semua field wajib kosong; asuransi tidak dicentang"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper required dan border error pada field wajib; scroll ke Durasi Lelang sebagai field error pertama; tetap step 1"

  @positive @priority-high @REQ-018 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-018 — Konfirmasi batal meninggalkan form
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form berisi data belum disimpan; hitungan lelang/draft diketahui"
    When user mengklik elemen "Batal"
    And user mengklik elemen "Konfirmasi Batal"
    Then sistem memenuhi hasil "Kembali ke list; hitungan lelang dan draft tidak berubah"

  @negative @priority-high @REQ-018 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-018 — Menolak konfirmasi batal mempertahankan isi
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Deskripsi Barang diisi Kertas A"
    When user mengklik elemen "Batal"
    And user mengklik elemen "Lanjut Mengisi"
    Then sistem memenuhi hasil "Tetap di form; Deskripsi Barang tetap Kertas A; tidak ada penyimpanan"

  @positive @priority-high @REQ-019 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-019 — Draft menerima required belum lengkap
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "FTL dipilih; Durasi, tanggal dan drop point kosong"
    When user mengklik elemen "Simpan ke Draft"
    Then sistem memenuhi hasil "Tersimpan sebagai Isi Informasi Umum tanpa error required; tidak ada nomor resmi"

  @negative @priority-high @REQ-019 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-019 — Gagal simpan draft tidak memberi sukses palsu
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form sebagian terisi; fixture respons simpan draft gagal sebelum commit"
    When user mengklik elemen "Simpan ke Draft"
    Then sistem memenuhi hasil "Pesan kegagalan terlihat; isian tetap tersedia; tidak ada draft baru atau toast sukses"

  @positive @priority-high @REQ-020 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-020 — Kembali mempertahankan seluruh data step 1
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid berisi catatan, 2 pengirim unik dan lampiran lalu sudah di step 2"
    When user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "Semua data step 1, urutan baris dan referensi lampiran tetap; tidak perlu mengisi ulang"

  @negative @priority-high @REQ-020 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-020 — Step 2 tidak dibuka lewat URL tanpa step 1 valid
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Belum ada sesi form valid"
    When user membuka halaman "peserta-lelang"
    Then sistem memenuhi hasil "Akses step 2 ditolak atau kembali ke Informasi Umum; tidak dapat submit lelang kosong"

  @positive @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-021 — Uncheck salinan mempertahankan hasil
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Checkbox belum dicentang; sumber A valid milik tenant"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user memilih opsi "A" pada field "Data Lelang"
    And user menghapus centang checkbox "Gunakan data lelang yang pernah dibuat"
    Then sistem memenuhi hasil "Periode dan Data Lelang tersembunyi; data hasil salinan tetap di form"

  @negative @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-021 — Checkbox aktif tanpa sumber tidak lolos
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; salinan dicentang tetapi sumber kosong"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error pada Data Lelang; tetap step 1"

  @positive @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-022 — Periode memfilter tanggal dibuat
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif; A dibuat 01/08/2026 dan B dibuat 01/09/2026"
    When user mengisi field "Periode Lelang Dibuat" dengan "01/08/2026 - 31/08/2026"
    And user mengklik elemen "Data Lelang"
    Then sistem memenuhi hasil "A tersedia; B tidak tersedia; filter memakai createdAt bukan tanggal buka"

  @negative @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-022 — Periode lebih dari sembilan puluh hari ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif"
    When user mengisi field "Periode Lelang Dibuat" dengan "01/06/2026 - 31/08/2026"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Selisih 91 hari ditolak; error periode; tidak lanjut"

  @positive @priority-high @REQ-023 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-023 — Sumber salinan tanpa periode mencakup semua FTL tenant
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif; periode kosong; tenant punya A FTL submitted"
    When user mengklik elemen "Data Lelang"
    And user memilih opsi "A" pada field "Data Lelang"
    Then sistem memenuhi hasil "Dropdown No. Lelang dan Rute memuat A; source terpilih valid"

  @negative @priority-high @REQ-023 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-023 — Sumber FCL draft dan tenant lain dikecualikan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif; FCL-A, DRAFT-A dan FTL-B milik tenant B tersedia di backend"
    When user mengklik elemen "Data Lelang"
    Then sistem memenuhi hasil "Ketiga sumber terlarang tidak tersedia; tidak dapat disalin"

  @positive @priority-high @REQ-024 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-024 — Salin multipoint dan edit data hasil
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Sumber A punya 2 pengirim 2 penerima, asuransi, catatan, dokumen; field waktu target awalnya kosong"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user memilih opsi "A" pada field "Data Lelang"
    And user mengisi field "Deskripsi Barang" dengan "Kertas salinan direvisi"
    Then sistem memenuhi hasil "Jumlah dan isi 4 baris, asuransi, nilai barang, catatan dan dokumen tersalin; Deskripsi Barang dapat diubah"

  @negative @priority-high @REQ-024 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-024 — Waktu lama sumber tidak ikut disalin
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Sumber A berisi durasi dan empat tanggal masa lalu; field waktu target kosong"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user memilih opsi "A" pada field "Data Lelang"
    Then sistem memenuhi hasil "Durasi, Buka, Tutup, Rencana Awal dan Rencana Akhir tetap kosong; tidak memakai tanggal lama"

  @positive @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-025 — Durasi memakai konfigurasi terbaru
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Pengaturan Sistem fixture hanya 2 Jam dan 3 Hari; form lainnya valid"
    When user mengklik elemen "Durasi Lelang"
    And user memilih opsi "2 Jam" pada field "Durasi Lelang"
    Then sistem memenuhi hasil "Pilihan tepat 2 Jam dan 3 Hari; nilai terpilih 2 Jam"

  @negative @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-025 — Durasi kosong ditolak saat lanjut
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid kecuali Durasi kosong"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error wajib Durasi; tetap step 1"

  @positive @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-026 — Tanggal buka masa depan diterima
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Masuk step 2 dengan tanggal buka tersimpan"

  @negative @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-026 — Tanggal buka masa lalu ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; sekarang 22/09/2026 10:00"
    When user mengisi field "Buka Lelang" dengan "22/09/2026 09:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Buka Lelang tidak boleh sebelum sekarang; tetap step 1"

  @positive @priority-high @REQ-027 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-027 — Mengubah durasi menghitung ulang tutup
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 23/09/2026 10:00; setting memiliki 2 Jam"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    Then sistem memenuhi hasil "Tutup Lelang 23/09/2026 12:00; field read-only"

  @negative @priority-high @REQ-027 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-027 — Tutup tidak dapat diketik manual
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 23/09/2026 10:00 durasi 1 Hari"
    When user memeriksa elemen "Tutup Lelang" dengan kondisi "Read-only atau disabled; bukan editable"
    Then sistem memenuhi hasil "Tutup tetap 24/09/2026 10:00; tidak ada jalur input manual"

  @positive @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-028 — Rencana awal setelah tutup diterima
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tutup 24/09/2026 10:00; form valid"
    When user mengisi field "Rencana Awal Kirim" dengan "24/09/2026 10:01"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Masuk step 2; rencana awal tersimpan"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-028 — Rencana awal sebelum tutup ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tutup 24/09/2026 10:00; form valid"
    When user mengisi field "Rencana Awal Kirim" dengan "24/09/2026 09:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Rencana Awal Kirim; tetap step 1"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-029 — Rencana akhir setelah awal diterima
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Awal 24/09/2026 10:00; form valid"
    When user mengisi field "Rencana Akhir Kirim" dengan "30/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Masuk step 2; batas akhir kirim tersimpan"

  @negative @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-029 — Rencana akhir sebelum awal ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Awal 24/09/2026 10:00; form valid"
    When user mengisi field "Rencana Akhir Kirim" dengan "24/09/2026 09:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Rencana Akhir Kirim; tetap step 1"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-030 — Jumlah armada opsional boleh kosong
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "Jumlah Armada" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Masuk step 2; jumlah armada tidak diwajibkan"

  @negative @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-030 — Jumlah armada nol ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "Jumlah Armada" dengan "0"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error minimal 1; tidak lanjut"

  @positive @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-031 — Cari dan pilih beberapa armada aktif
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Master aktif Tronton Box dan Tronton Wing Box, CDD nonaktif; pilihan awal kosong"
    When user mengklik elemen "Jenis Armada"
    And user mengisi field "Cari Jenis Armada" dengan "Tronton"
    And user mencentang checkbox "Tronton Box"
    And user mencentang checkbox "Tronton Wing Box"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Dua tag armada tersimpan; CDD nonaktif tidak ditawarkan; lanjut step 2"

  @negative @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-031 — Tanpa jenis armada ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid kecuali jenis armada tidak dipilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error minimal satu Jenis Armada; tetap step 1"

  @positive @priority-high @REQ-032 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-032 — Deskripsi dan catatan kosong valid
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "Deskripsi Barang" dengan ""
    And user mengisi field "Catatan Tambahan" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Masuk step 2 tanpa error pada kedua field opsional"

  @negative @priority-high @REQ-032 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-032 — Teks markup tidak dieksekusi
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; payload teks literal"
    When user mengisi field "Deskripsi Barang" dengan "<img src=x onerror=alert(1)>"
    And user mengisi field "Catatan Tambahan" dengan "<script>alert(1)</script>"
    And user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "Isi diperlakukan sebagai teks; tidak ada eksekusi script/dialog; teks tidak merusak form"

  @positive @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-033 — Asuransi menampilkan rentang dan format ribuan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mencentang checkbox "Gunakan Asuransi"
    And user mengisi field "Nilai Barang Min" dengan "1000000"
    And user mengisi field "Nilai Barang Max" dengan "2000000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Rentang diterima; tampilan rupiah menggunakan pemisah ribuan; tidak ada Biaya Termasuk/Metode Pengiriman"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-033 — Rentang asuransi terbalik ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mencentang checkbox "Gunakan Asuransi"
    And user mengisi field "Nilai Barang Min" dengan "2000000"
    And user mengisi field "Nilai Barang Max" dengan "1000000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error maksimum harus >= minimum; tetap step 1"

  @positive @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-034 — Upload beberapa format valid dan hapus satu
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; fixture file chooser memasang a.jpg b.jpeg c.png d.pdf masing-masing 1024 byte setelah Pilih File"
    When user mengklik elemen "Pilih File"
    And user memeriksa elemen "Dokumen Tambahan" dengan kondisi "Empat file terlihat"
    And user mengklik elemen "Hapus Dokumen [b.jpeg]"
    Then sistem memenuhi hasil "Hanya a.jpg c.png d.pdf tersisa; file lain tidak terhapus"

  @negative @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-034 — File melebihi batas ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang besar.pdf ukuran 4194305 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Error ukuran maksimum 4MB; besar.pdf tidak menjadi lampiran tersimpan"

  @positive @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-035 — Tipe otomatis multipoint dari tambah kedua sisi
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form baru FTL default 1 pengirim 1 penerima"
    When user mengklik elemen "Tambah Baris Input Pengirim"
    And user mengklik elemen "Tambah Baris Input Penerima"
    Then sistem memenuhi hasil "Masing-masing 2 baris; tipe turunan Multipoint; tidak ada input manual Tipe Pengiriman"

  @negative @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-035 — Baris baru kosong menghalangi lanjut
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 1+1; tambah penerima kosong"
    When user mengklik elemen "Tambah Baris Input Penerima"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error required pada baris Bongkar 2; tidak mengabaikan baris tambahan"

  @positive @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-036 — Hapus tengah menomori ulang tanpa menukar titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form 3 pengirim DP-A01 DP-A03 DP-A04"
    When user mengklik elemen "Hapus Muat [2]"
    Then sistem memenuhi hasil "Tersisa Muat 1 DP-A01 dan Muat 2 DP-A04; urutan stabil; banner urutan terlihat"

  @negative @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-036 — Satu baris terakhir tidak dapat dihapus
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form default 1 pengirim 1 penerima"
    When user memeriksa elemen "Hapus Muat" dengan kondisi "Tidak terlihat"
    And user memeriksa elemen "Hapus Bongkar" dengan kondisi "Tidak terlihat"
    Then sistem memenuhi hasil "Tidak ada label Muat 1/Bongkar 1 atau ikon hapus; minimal satu baris tetap"

  @positive @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-037 — Drop point mengisi pengirim dan pencarian penerima memfilter
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "DP-A01 milik PT Pengirim A; PT Penerima A punya DP-A02 dan DP-A05"
    When user memilih opsi "DP-A01" pada field "Drop Point Asal"
    And user memilih opsi "PT Penerima A" pada field "Penerima"
    And user mengklik elemen "Drop Point Tujuan"
    Then sistem memenuhi hasil "Pengirim otomatis PT Pengirim A; pilihan tujuan hanya DP-A02 dan DP-A05"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-037 — Master tenant lain tidak dapat dipilih
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Master DP-B01 dan PT B milik SHIPPER-B"
    When user mengklik elemen "Drop Point Asal"
    And user mengisi field "Cari Drop Point" dengan "DP-B01"
    Then sistem memenuhi hasil "Tidak ada opsi DP-B01 atau PT B; data tenant A tetap"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-038 — Alamat terisi dan PIC dapat diubah
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "DP-A01 beralamat lengkap Jawa Timur Surabaya Wonokromo Darmo 60241 Jl Jambi 35"
    When user memilih opsi "DP-A01" pada field "Drop Point Asal"
    And user mengisi field "PIC Pengirim" dengan "Budi Baru"
    And user mengisi field "No. WhatsApp PIC Pengirim" dengan "081111111111"
    Then sistem memenuhi hasil "Enam field administratif sesuai DP-A01 dan read-only; PIC serta WhatsApp berubah tanpa mengubah master"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-038 — WhatsApp mengandung huruf ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "No. WhatsApp PIC Penerima" dengan "08ABC123"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Huruf ditolak atau helper angka tampil; nilai 08ABC123 tidak disimpan; tidak lanjut dengan nilai invalid"

  @positive @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-039 — Titik berbeda lintas seluruh baris valid
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2 pengirim DP-A01 DP-A03 dan 2 penerima DP-A02 DP-A04"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Lanjut step 2; keempat drop point tersimpan unik"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-039 — Drop point asal sama dengan tujuan ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid DP-A01 sudah pada pengirim"
    When user memilih opsi "DP-A01" pada field "Drop Point Tujuan"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Duplikasi ditolak oleh pilihan atau error; tidak lanjut dengan titik ganda"

  @positive @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-040 — Vendor eligible dan rating baru ditampilkan
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture V-A dan V-C aktif FTL pengelola vendor"
    When user membuka halaman "peserta-lelang"
    Then sistem memenuhi hasil "V-A menampilkan nama/kota/15 menang/rating 4.8; V-C rating awal 3.0"

  @negative @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-040 — Vendor tidak eligible tidak bisa diundang
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture X inaktif, Y FCL saja, Z pengelola shipper"
    When user mengisi field "Cari nama vendor" dengan "X"
    And user memeriksa elemen "Vendor" dengan kondisi "Tidak ada X"
    And user mengisi field "Cari nama vendor" dengan "Y"
    And user memeriksa elemen "Vendor" dengan kondisi "Tidak ada Y"
    And user mengisi field "Cari nama vendor" dengan "Z"
    Then sistem memenuhi hasil "Vendor Z tidak muncul; tidak ada checkbox untuk vendor tidak eligible"

  @positive @priority-high @REQ-041 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-041 — Gabungan filter vendor dan rating
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A Surabaya 4.8; V-B Malang 4.0; V-C Surabaya 3.0"
    When user memilih opsi "Surabaya" pada field "Semua Kota"
    And user memilih opsi "4 ke atas" pada field "Semua Rating"
    And user mengisi field "Cari nama vendor" dengan "V-A"
    Then sistem memenuhi hasil "Hanya V-A; urutan tanpa filter mengikuti rating tertinggi"

  @negative @priority-high @REQ-041 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-041 — Pencarian tanpa kecocokan tidak mempertahankan hasil lama
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Ada vendor eligible tetapi tidak bernama TIDAK-ADA"
    When user mengisi field "Cari nama vendor" dengan "TIDAK-ADA"
    Then sistem memenuhi hasil "Empty state; hasil sebelumnya tidak tersisa"

  @positive @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-042 — Pilihan dan counter bertahan lintas halaman
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Ada 21 vendor; V-A halaman 1 dan V-21 halaman 2"
    When user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Halaman Berikutnya"
    And user mencentang checkbox "Vendor [V-21]"
    And user mengklik elemen "Halaman Sebelumnya"
    And user memeriksa elemen "Counter Vendor" dengan kondisi "2 vendor diundang"
    Then sistem memenuhi hasil "Counter 2 vendor diundang; V-A tetap checked; V-21 tetap tersimpan"

  @negative @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-042 — Uncheck tidak meninggalkan hitungan vendor tersembunyi
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A dan V-21 terpilih pada dua halaman"
    When user mengklik elemen "Halaman Berikutnya"
    And user menghapus centang checkbox "Vendor [V-21]"
    And user mengklik elemen "Halaman Sebelumnya"
    Then sistem memenuhi hasil "Counter 1; submit hanya mengundang V-A"

  @positive @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-043 — Pilih semua berlangganan vendor baru eligible
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Ada 30 eligible; fixture menambahkan V-31 eligible setelah lelang tersimpan dan masih Belum Buka"
    When user mengklik elemen "Pilih Semua"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "30 vendor awal diundang; V-31 otomatis menjadi peserta tanpa edit manual"

  @negative @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-043 — Vendor baru ineligible tidak ikut pilih semua
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang memakai Pilih Semua; fixture menambahkan vendor inaktif dan vendor pengelola shipper"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Kedua vendor baru tidak menjadi peserta dan tidak mendapat undangan"

  @positive @priority-high @REQ-044 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-044 — Submit dengan satu vendor valid
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; awal belum ada pilihan"
    When user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Lelang tersimpan dengan tepat satu peserta V-A"

  @negative @priority-high @REQ-044 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-044 — Submit tanpa vendor ditolak
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; tidak ada vendor terpilih"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Error minimal satu vendor; tidak ada lelang submitted/nomor/notifikasi"

  @positive @priority-high @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-045 — Submit menjadwalkan bidding dan notifikasi
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; buka besok; V-A dan V-B terpilih"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Toast sukses dan redirect list"
    And sistem memenuhi hasil "Status Belum Buka, nomor resmi tersedia, satu email dan push per peserta serta jadwal bidding terdaftar"

  @negative @priority-high @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-045 — Submit gagal sebelum commit tidak mengirim undangan
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; V-A dipilih; fixture API gagal sebelum commit"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Error simpan; tetap di form; tidak ada nomor/lelang/jadwal/notifikasi sukses"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-046 — Detail normal read-only dan opsional dash
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A normal 1+1, deskripsi dan catatan kosong, data master lengkap"
    When user membuka halaman "detail-lelang"
    And user memeriksa elemen "Ringkasan Lelang" dengan kondisi "Nomor, badge, tipe Normal, jumlah, armada, periode dan deskripsi sesuai fixture; TOP dash bila kosong"
    Then sistem memenuhi hasil "Seluruh data sesuai fixture; tipe Normal; tanpa label Pick Up/Drop Off; field kosong tanda -; tidak ada input editable"

  @negative @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-046 — Detail tenant lain tidak terbaca melalui URL
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Admin A; lelang SECRET-B milik tenant B"
    When user membuka halaman "detail-lelang SECRET-B"
    Then sistem memenuhi hasil "Akses ditolak tanpa data nomor, peserta, kontak atau dokumen tenant B"

  @positive @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-047 — Section detail dapat ditutup dan dibuka
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; seluruh section awal expanded"
    When user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Penerima"
    And user mengklik elemen "Data Penerima"
    And user mengklik elemen "Peserta Lelang"
    And user mengklik elemen "Peserta Lelang"
    Then sistem memenuhi hasil "Keempat section kembali expanded dan data utuh; Edit Data terlihat"

  @negative @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-047 — Edit disembunyikan pada detail selesai
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Selesai"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Button Edit Data tidak terlihat; URL edit langsung juga tidak mengizinkan mutasi"

  @positive @priority-high @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-048 — Tabel peserta menghitung dan memfilter status
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A menawar terakhir 22/09 09:00; V-B belum input; waktu undangan 21/09 08:00"
    When user memilih opsi "Input Penawaran" pada field "Semua Status"
    And user mengisi field "Cari nama vendor" dengan "V-A"
    And user mengklik elemen "Vendor"
    And user mengklik elemen "Tanggal Terkirim"
    And user mengklik elemen "Tanggal Penawaran"
    And user memeriksa elemen "Tabel Peserta" dengan kondisi "Kolom sesuai spec; V-A satu hasil filter; total 1 dari 2"
    Then sistem memenuhi hasil "Kolom No/Vendor/Tanggal Terkirim/Tanggal Penawaran/Status tersedia; baris V-A benar; total 1 dari 2 Vendor"

  @negative @priority-high @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-048 — FTL tidak memiliki status Input Harga perantara
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-B belum input; V-A sudah harga valid tanpa jadwal"
    When user memilih opsi "Semua Status" pada field "Semua Status"
    Then sistem memenuhi hasil "V-B Belum Input dengan tanggal penawaran -; V-A Input Penawaran; tidak ada status Input Harga atau prasyarat jadwal"

  @positive @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-049 — Edit isi baris menjaga jenis dan tipe
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka Multipickup 2+1; asumsi A02"
    When user mengisi field "PIC Pengirim [1]" dengan "Budi Edit"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "PIC berubah; jenis FTL dan tipe Multipickup read-only; jumlah baris tetap 2+1"

  @negative @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-049 — Edit lelang tutup ditolak melalui URL
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup; URL form diketahui"
    When user membuka halaman "edit-lelang A"
    Then sistem memenuhi hasil "Akses mutasi ditolak; tidak dapat mengubah data atau jenis/tipe"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-050 — Edit durasi menghitung tutup dan mengaudit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka besok; setting 2 Jam; admin A; peserta V-A/V-B"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Tutup menjadi 23/09/2026 12:00; audit mencatat nilai lama/baru, user/waktu; peserta menerima notifikasi perubahan"

  @negative @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-050 — Edit rentang tidak valid tidak mengubah data
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; awal 24/09/2026 10:00"
    When user mengisi field "Rencana Akhir Kirim" dengan "23/09/2026 10:00"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Error akhir kirim; nilai lama backend tetap; tanpa audit sukses/notifikasi perubahan"

  @positive @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-POS-051 — Tambah peserta saat terbuka menjaga ringkasan
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka; V-A lama belum input; V-B eligible baru"
    When user mencentang checkbox "Vendor [V-B]"
    And user mengklik elemen "Simpan"
    And user memeriksa elemen "Ringkasan Lelang" dengan kondisi "Data A read-only dan identik sebelum/sesudah simpan"
    Then sistem memenuhi hasil "V-B menjadi peserta; ringkasan nomor/rute/waktu tetap read-only dan tidak berubah"

  @negative @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-051 — Tambah peserta setelah tutup ditolak
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup; URL tambah peserta diketahui"
    When user membuka halaman "tambah-peserta A"
    Then sistem memenuhi hasil "Akses perubahan peserta ditolak; daftar undangan tetap"

  @positive @priority-high @REQ-052 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-POS-052 — Hapus peserta belum menawar dan tambah vendor baru
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A belum input dan V-B sudah input diundang; V-C belum diundang"
    When user menghapus centang checkbox "Vendor [V-A]"
    And user mencentang checkbox "Vendor [V-C]"
    And user memeriksa elemen "Counter Vendor" dengan kondisi "2 vendor diundang"
    Then sistem memenuhi hasil "Counter total 2; V-B checked disabled, V-C checked; V-A tidak dipilih"

  @negative @priority-high @REQ-052 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-052 — Peserta sudah menawar tidak dapat dihapus
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-B sudah Input Penawaran"
    When user memeriksa elemen "Vendor [V-B]" dengan kondisi "Checked dan disabled"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "V-B tetap menjadi peserta; tidak ada notifikasi pengeluaran untuk V-B"

  @positive @priority-high @REQ-053 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-POS-053 — Notifikasi hanya untuk perubahan himpunan peserta
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Awal V-A dan V-B, V-A belum input; ubah menjadi V-B dan V-C"
    When user menghapus centang checkbox "Vendor [V-A]"
    And user mencentang checkbox "Vendor [V-C]"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Sink notifikasi hanya V-A dikeluarkan dan V-C diundang; V-B tidak dinotifikasi ulang"

  @negative @priority-high @REQ-053 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-053 — Simpan tanpa perubahan tidak menggandakan undangan
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Daftar peserta awal V-A V-B tidak berubah"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Himpunan peserta tetap; tidak ada email/push undangan duplikat"

  @positive @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-054 — Pembatalan valid memuat identitas read-only
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup belum ada order; dialog dibuka dari menu A"
    When user memeriksa elemen "Batalkan Lelang" dengan kondisi "Dialog memuat nomor A, pengirim, penerima dan alasan wajib sebelum submit"
    And user memeriksa elemen "No. Lelang" dengan kondisi "Nomor A read-only"
    And user memeriksa elemen "Pengirim" dengan kondisi "PT Pengirim A read-only"
    And user memeriksa elemen "Penerima" dengan kondisi "PT Penerima A read-only"
    And user mengisi field "Alasan Pembatalan" dengan "Kebutuhan kirim dibatalkan"
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Pembatalan diterima dengan alasan tersimpan"

  @negative @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-054 — Alasan kosong menahan pembatalan
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup tanpa order; dialog terbuka"
    When user mengisi field "Alasan Pembatalan" dengan ""
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Error alasan wajib; status tetap Tutup"

  @positive @priority-high @REQ-055 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-055 — Batalkan Order mengubah status dan riwayat
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka tanpa order; alasan valid"
    When user mengisi field "Alasan Pembatalan" dengan "Perubahan rencana"
    And user mengklik elemen "Batalkan Order"
    And user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge A Dibatalkan; masuk Riwayat Pembatalan; audit tersimpan; data tetap di list"

  @negative @priority-high @REQ-055 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-055 — Aksi mutasi lelang dibatalkan terkunci
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Dibatalkan dan pernah ulang"
    When user membuka halaman "list-lelang"
    And user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Tambah Peserta Lelang"
    Then sistem memenuhi hasil "Alert/disabled mencegah perubahan; hanya Detail, Riwayat Perubahan, Riwayat Lelang Ulang tersedia untuk dibuka"

  @positive @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-056 — Harga tersedia setelah tutup tanpa request jadwal
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup punya penawaran V-A"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Harga V-A terlihat; tidak ada button Request Jadwal"

  @negative @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-056 — Harga belum boleh terlihat sebelum buka
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Popup Lelang belum dibuka; nilai harga tidak terlihat"

  @positive @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-057 — Filter penawaran diterapkan dan direset
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Penawaran V-A Tronton Box 4 jam dan V-B Fuso 8 jam"
    When user mengklik elemen "Filter"
    And user memilih opsi "V-A" pada field "Vendor"
    And user memilih opsi "Tronton Box" pada field "Jenis Armada"
    And user mengisi field "Target Waktu Perjalanan" dengan "4"
    And user mengklik elemen "Terapkan"
    And user memeriksa elemen "Card Penawaran" dengan kondisi "Hanya V-A Tronton Box 4 jam"
    And user mengklik elemen "Reset"
    And user mengklik elemen "Urutkan"
    Then sistem memenuhi hasil "Filter kosong setelah Reset; seluruh penawaran kembali; kontrol Urutkan terbuka"

  @negative @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-057 — Target waktu nonnumeric ditolak
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Penawaran tersedia"
    When user mengklik elemen "Filter"
    And user mengisi field "Target Waktu Perjalanan" dengan "abc"
    And user mengklik elemen "Terapkan"
    Then sistem memenuhi hasil "Input nonnumeric ditolak/ditandai error; filter abc tidak dikirim sebagai numeric valid"

  @positive @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-058 — Tanggal efektif terbaru menjadi ranking utama
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P1 efektif 22/09 harga 200; P2 efektif 21/09 harga 100"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P1 tampil sebelum P2 walau lebih mahal"

  @negative @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-058 — Harga termurah tidak menimpa tie-break efektif
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P1 efektif 22/09 harga 300; P2 efektif 20/09 harga 50; response fixture diacak"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Urutan tetap P1 P2; tidak mengurutkan hanya harga atau urutan response"

  @positive @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-059 — Card dan tab memetakan harga master serta pajak
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Penawaran P1 memakai oracle pajak fixture independen; master Tronton Box maks 18000kg, 54.72m3, dimensi 1200x250x250cm, target 4 jam"
    When user mengklik elemen "Detail Biaya [P1]"
    And user memeriksa elemen "Card Penawaran" dengan kondisi "Total sama oracle DPP+komponen pajak, label Termasuk PPN & PPh, tanggal efektif dan deskripsi harga benar"
    And user mengklik elemen "Detail Armada [P1]"
    And user memeriksa elemen "Detail Armada" dengan kondisi "1200 x 250 x 250 cm"
    And user mengklik elemen "Tab Vendor [P1]"
    And user mengklik elemen "Lihat Profil [P1]"
    Then sistem memenuhi hasil "Profil vendor P1 terbuka; nama/rating/menang sesuai master; kapasitas dan target 4 jam benar"

  @negative @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-059 — DPP tidak ditampilkan sebagai total termasuk pajak
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Oracle fixture memiliki pajak bersih nonnol; DPP 1000000; total oracle 1110000 sebagai data sintetis bukan tarif produksi"
    When user mengklik elemen "Detail Biaya [P1]"
    Then sistem memenuhi hasil "Card total 1110000, bukan 1000000; rincian pajak konsisten dengan oracle fixture"

  @positive @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-060 — Harga berlaku dapat dipesan
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif sebelum akhir kirim; P1 harga terbaru efektif"
    When user mengklik elemen "Pesan [P1]"
    Then sistem memenuhi hasil "Buat Order terbuka dengan P1"

  @negative @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-060 — Harga diganti tidak dapat dipesan
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P1 sudah diganti P2; A Aktif"
    When user mengklik elemen "N/A [P1]"
    Then sistem memenuhi hasil "Alert harga sudah tidak berlaku; tidak masuk OMS untuk P1"

  @positive @priority-high @REQ-061 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-061 — Order mengisi OMS dan memberi email penawar lain
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; V-A dipilih; V-B telah menawar; V-C belum input; OMS fixture menyelesaikan order setelah navigasi"
    When user mengklik elemen "Pesan [V-A]"
    Then sistem memenuhi hasil "OMS auto draft nomor/rute/baris/armada/vendor/harga sesuai lelang dan V-A"
    And sistem memenuhi hasil "Setelah order tercipta status tetap Aktif; V-B menerima email penawaran belum terpilih; V-C tidak"

  @negative @priority-high @REQ-061 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-061 — Batal di OMS tidak dianggap order terbentuk
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; klik Pesan lalu OMS fixture kembali tanpa menyimpan"
    When user mengklik elemen "Pesan [V-A]"
    And user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Jumlah order tetap; tidak ada email penawaran belum terpilih sebelum order terbentuk"

  @positive @priority-high @REQ-062 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-062 — Boleh memilih penawaran bukan ranking pertama
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; P1 ranking 1, P2 ranking 2 masih valid"
    When user mengklik elemen "Pesan [P2]"
    Then sistem memenuhi hasil "OMS memakai P2; sistem tidak memaksa P1"

  @negative @priority-high @REQ-062 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-062 — Nego ditolak pada lelang selesai
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Selesai"
    When user mengklik elemen "Ajukan Nego"
    Then sistem memenuhi hasil "Alert status tidak mengizinkan; tidak membuat proses nego"

  @positive @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-063 — Ulang aktif memakai nomor yang sama
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif sebelum akhir kirim, tidak sedang ulang; form ulang berisi waktu valid; vendor lama ada"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Proses ulang dibuat dengan nomor A; tidak menerbitkan nomor baru"

  @negative @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-063 — Ulang kedua ditolak ketika proses pertama berjalan
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A sedang lelang ulang; URL ulang diketahui"
    When user membuka halaman "lelang-ulang A"
    Then sistem memenuhi hasil "Tidak dapat memulai ulang bersamaan; proses dan nomor tetap satu"

  @positive @priority-high @REQ-064 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-064 — Form ulang mempertahankan ringkasan dan asuransi
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif dengan asuransi dan rentang barang"
    When user memeriksa elemen "Data Pengirim" dengan kondisi "Collapsed awal"
    And user memeriksa elemen "Data Penerima" dengan kondisi "Collapsed awal"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Penerima"
    And user memeriksa elemen "Ringkasan Lelang" dengan kondisi "Data asal A read-only"
    And user memeriksa elemen "Nilai Barang" dengan kondisi "Rentang sama lelang asal"
    And user memeriksa elemen "Perlu Diketahui" dengan kondisi "Dua informasi: harga lama terkunci; harga baru tertutup sampai lelang ulang tutup"
    Then sistem memenuhi hasil "Ringkasan read-only; Nilai Barang terlihat sesuai data asal; Perlu Diketahui menjelaskan harga lama terkunci dan harga baru tersembunyi"

  @negative @priority-high @REQ-064 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-064 — Ulang tidak menambah asuransi pada lelang tanpa asuransi
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif tanpa asuransi"
    When user membuka halaman "lelang-ulang"
    Then sistem memenuhi hasil "Nilai Barang tidak terlihat; tidak ada input untuk mengubah syarat asli"

  @positive @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-065 — Waktu ulang valid dihitung otomatis
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; akhir kirim 30/09 10:00; setting 2 Jam; buka sekarang"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    And user mengisi field "Buka Lelang" dengan "22/09/2026 10:00"
    And user memeriksa elemen "Tutup Lelang" dengan kondisi "22/09/2026 12:00 disabled/read-only"
    Then sistem memenuhi hasil "Tutup read-only 22/09/2026 12:00; dapat Simpan"

  @negative @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-065 — Tutup ulang melewati akhir kirim ditolak
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; akhir kirim 22/09/2026 11:00; setting 2 Jam"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    And user mengisi field "Buka Lelang" dengan "22/09/2026 10:00"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Error tutup melebihi akhir kirim; tidak membuat proses ulang"

  @positive @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-066 — Ulang tanpa vendor baru tetap valid
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Vendor lama V-A sudah input dan V-B belum input; waktu valid"
    When user menghapus centang checkbox "Vendor [V-B]"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Ulang tersimpan dengan V-A; counter vendor baru 0 diperbolehkan"

  @negative @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-066 — Vendor lama menawar tetap terkunci saat ulang
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A sudah Input Penawaran; V-B belum Input"
    When user memeriksa elemen "Vendor [V-A]" dengan kondisi "Checked disabled"
    And user memeriksa elemen "Vendor [V-B]" dengan kondisi "Checked editable"
    Then sistem memenuhi hasil "V-A tidak dapat dikeluarkan; tidak ada perubahan ke status belum diundang"

  @positive @priority-high @REQ-067 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-067 — Submit ulang mengubah list dan audit
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; buka sekarang durasi 2 Jam; V-A lama dan V-C baru dipilih"
    When user mengklik elemen "Simpan"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Lelang Ulang"
    Then sistem memenuhi hasil "A Sedang Buka pada tab ulang dengan border ungu; email/push dibuka kembali ke V-A dan V-C; audit ulang mencatat buka/tutup/vendor/user/waktu"

  @negative @priority-high @REQ-067 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-067 — Gagal simpan ulang tidak mengubah status
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; waktu valid; fixture gagal sebelum commit"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Pesan gagal; A tetap Aktif; tidak ada tab/riwayat/notifikasi ulang baru"

  @positive @priority-high @REQ-068 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-068 — Harga lama vendor berubah setelah update vendor tersebut
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Siklus ulang sudah tutup; V-A memperbarui P-A1 menjadi P-A2; V-B tidak update P-B1"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P-A1 Expired; P-A2 aktif; P-B1 tetap aktif"

  @negative @priority-high @REQ-068 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-068 — Memulai ulang tidak langsung mengexpire semua harga
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Siklus ulang dimulai; belum ada vendor memperbarui harga; fixture memeriksa status penawaran backend"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P-A1 dan P-B1 belum Expired; hanya terkunci sampai proses ulang tutup"

  @positive @priority-high @REQ-069 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-069 — Proses ulang menampilkan countdown dan menutup harga baru
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A sedang ulang dengan tutup 22/09/2026 12:00; sekarang 10:00; V-A sudah update harga baru"
    When user membuka halaman "harga-penawaran"
    And user memeriksa elemen "Countdown" dengan kondisi "Sisa waktu menuju 22/09/2026 12:00, berkurang seiring clock fixture"
    Then sistem memenuhi hasil "State proses lelang ulang; countdown menuju 12:00; nominal harga baru tidak terlihat"

  @negative @priority-high @REQ-069 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-069 — Order dan nego harga lama ditolak selama ulang
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A sedang ulang; P1 lama masih aktif secara data"
    When user mengklik elemen "Pesan [P1]"
    And user memeriksa elemen "Card Penawaran" dengan kondisi "Alert harga terkunci"
    And user mengklik elemen "Ajukan Nego"
    Then sistem memenuhi hasil "Order dan nego tidak tercipta; harga baru tetap tersembunyi"

  @positive @priority-high @REQ-070 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-070 — Ulang tutup menggabungkan harga aktif
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Jam tepat tutup ulang; V-A update P-A2, V-B tidak update P-B1; akhir kirim besok"
    When user membuka halaman "harga-penawaran"
    And user memeriksa elemen "Card Penawaran" dengan kondisi "P-A2 dan P-B1 aktif terlihat"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Lelang Ulang"
    Then sistem memenuhi hasil "A kembali Tutup/Aktif sesuai A04; tidak ada pada tab ulang; counter berkurang satu"

  @negative @priority-high @REQ-070 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-070 — Harga terganti tidak aktif kembali setelah ulang tutup
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P-A1 terganti P-A2 saat ulang; kini ulang tutup"
    When user membuka halaman "harga-penawaran"
    And user mengklik elemen "Expired [P-A1]"
    Then sistem memenuhi hasil "P-A1 tetap Expired; tidak dapat dipesan; P-A2 saja harga aktif V-A"

  @edge @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-001 — Buka tepat sekarang
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; jam server 22/09/2026 10:00"
    When user mengisi field "Buka Lelang" dengan "22/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Buka diterima; masuk step 2"

  @edge @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-002 — Buka satu menit ke depan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; jam server 22/09/2026 10:00"
    When user mengisi field "Buka Lelang" dengan "22/09/2026 10:01"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Buka diterima; masuk step 2"

  @edge @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-003 — Rencana Awal Kirim sama dengan batas bawah
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tutup tepat 24/09/2026 10:00; field lain valid"
    When user mengisi field "Rencana Awal Kirim" dengan "24/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Kesetaraan diterima; masuk step 2"

  @edge @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-004 — Rencana Akhir Kirim sama dengan batas bawah
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Awal tepat 24/09/2026 10:00; field lain valid"
    When user mengisi field "Rencana Akhir Kirim" dengan "24/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Kesetaraan diterima; masuk step 2"

  @edge @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-005 — Status pada 22/09/2026 09:59
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 22/09 10:00; tutup 23/09 10:00; akhir 30/09 10:00; jam 22/09/2026 09:59"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Belum Buka; tidak perlu perubahan status manual"

  @edge @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-006 — Status pada 22/09/2026 10:00
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 22/09 10:00; tutup 23/09 10:00; akhir 30/09 10:00; jam 22/09/2026 10:00"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Sedang Buka; tidak perlu perubahan status manual"

  @edge @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-007 — Status pada 23/09/2026 09:59
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 22/09 10:00; tutup 23/09 10:00; akhir 30/09 10:00; jam 23/09/2026 09:59"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Sedang Buka; tidak perlu perubahan status manual"

  @edge @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-008 — Status pada 23/09/2026 10:00
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 22/09 10:00; tutup 23/09 10:00; akhir 30/09 10:00; jam 23/09/2026 10:00"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Tutup/Aktif sesuai A04; tidak perlu perubahan status manual"

  @edge @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-009 — Status pada 30/09/2026 10:01
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Buka 22/09 10:00; tutup 23/09 10:00; akhir 30/09 10:00; jam 30/09/2026 10:01"
    When user membuka halaman "list-lelang"
    Then sistem memenuhi hasil "Badge Selesai; tidak perlu perubahan status manual"

  @edge @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-010 — Order tepat batas akhir kirim
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; sekarang tepat akhir kirim 30/09/2026 10:00; harga aktif"
    When user mengklik elemen "Pesan [P1]"
    Then sistem memenuhi hasil "Dapat masuk Buat Order sesuai interpretasi setelah melewati (A07)"

  @edge @priority-high @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-011 — Warna draft kedaluwarsa 25/09/2026
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 kedaluwarsa 25/09/2026; sekarang 22/09/2026"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "D1 terlihat dengan warna oranye H-3"

  @edge @priority-high @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-012 — Warna draft kedaluwarsa 26/09/2026
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 kedaluwarsa 26/09/2026; sekarang 22/09/2026"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "D1 terlihat dengan warna netral di luar H-3"

  @positive @priority-high @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-071 — Masa berlaku draft memakai setting
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Setting masa berlaku 7 hari; draft disimpan 22/09/2026; aturan tanggal tenant fixture"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "Kedaluwarsa mengikuti setting 7 hari dan data terisi/terakhir disimpan sesuai fixture"

  @edge @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-013 — Periode tepat sembilan puluh hari
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif; dua tanggal selisih 90 hari"
    When user mengisi field "Periode Lelang Dibuat" dengan "01/06/2026 - 30/08/2026"
    And user mengklik elemen "Data Lelang"
    Then sistem memenuhi hasil "Rentang diterima; hasil mencakup kedua tanggal batas"

  @negative @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-071 — Periode terbalik ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Salinan aktif"
    When user mengisi field "Periode Lelang Dibuat" dengan "31/08/2026 - 01/08/2026"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error periode terbalik; tidak memakai query rentang invalid"

  @negative @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-072 — Buka Lelang kosong
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Buka Lelang" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Buka Lelang; tidak lanjut dengan nilai invalid"

  @negative @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-073 — Buka Lelang tanggal dan jam tidak valid
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Buka Lelang" dengan "31/02/2026 25:61"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Buka Lelang; tidak lanjut dengan nilai invalid"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-074 — Rencana Awal Kirim kosong
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Rencana Awal Kirim" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Rencana Awal Kirim; tidak lanjut dengan nilai invalid"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-075 — Rencana Awal Kirim tanggal dan jam tidak valid
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Rencana Awal Kirim" dengan "31/02/2026 25:61"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Rencana Awal Kirim; tidak lanjut dengan nilai invalid"

  @negative @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-076 — Rencana Akhir Kirim kosong
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Rencana Akhir Kirim" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Rencana Akhir Kirim; tidak lanjut dengan nilai invalid"

  @negative @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-077 — Rencana Akhir Kirim tanggal dan jam tidak valid
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lain valid"
    When user mengisi field "Rencana Akhir Kirim" dengan "31/02/2026 25:61"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper error pada Rencana Akhir Kirim; tidak lanjut dengan nilai invalid"

  @edge @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-014 — Jumlah armada bernilai 1
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lainnya valid"
    When user mengisi field "Jumlah Armada" dengan "1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Diterima dan lanjut step 2"

  @negative @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-078 — Jumlah armada bernilai -1
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lainnya valid"
    When user mengisi field "Jumlah Armada" dengan "-1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Ditolak minimal 1"

  @negative @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-079 — Jumlah armada bernilai 1.5
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lainnya valid"
    When user mengisi field "Jumlah Armada" dengan "1.5"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Ditolak bilangan bulat sesuai A08"

  @negative @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-080 — Jumlah armada bernilai abc
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form lainnya valid"
    When user mengisi field "Jumlah Armada" dengan "abc"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Karakter nonnumeric ditolak"

  @edge @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-015 — Batas nilai asuransi 1000000
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid dan asuransi aktif"
    When user mengisi field "Nilai Barang Min" dengan "1000000"
    And user mengisi field "Nilai Barang Max" dengan "1000000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Min=max diterima dengan format ribuan"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-081 — Batas nilai asuransi -1
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid dan asuransi aktif"
    When user mengisi field "Nilai Barang Min" dengan "-1"
    And user mengisi field "Nilai Barang Max" dengan "-1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Nilai negatif ditolak sesuai A08"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-082 — Batas nilai asuransi abc
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid dan asuransi aktif"
    When user mengisi field "Nilai Barang Min" dengan "abc"
    And user mengisi field "Nilai Barang Max" dengan "abc"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Nonnumeric ditolak"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-083 — Nilai Barang Min wajib saat asuransi aktif
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Asuransi aktif; min 1000 max 2000; form lain valid"
    When user mengisi field "Nilai Barang Min" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper required pada Nilai Barang Min; tidak lanjut"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-084 — Nilai Barang Max wajib saat asuransi aktif
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Asuransi aktif; min 1000 max 2000; form lain valid"
    When user mengisi field "Nilai Barang Max" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Helper required pada Nilai Barang Max; tidak lanjut"

  @edge @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-016 — Asuransi dimatikan menghapus validasi tersembunyi
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Asuransi aktif dengan nilai kosong"
    When user menghapus centang checkbox "Gunakan Asuransi"
    And user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Nilai Barang Min/Max tersembunyi; form valid dapat lanjut tanpa error nilai barang"

  @edge @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-017 — PDF ukuran 4194303 byte
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang batas.pdf ukuran 4194303 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Lampiran diterima; tidak ada error ukuran"

  @edge @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-018 — PDF ukuran 4194304 byte
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang batas.pdf ukuran 4194304 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Lampiran diterima; tidak ada error ukuran"

  @negative @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-085 — Lampiran format exe ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang berkas.exe ukuran 1024 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Format tidak didukung; file tidak tersimpan"

  @negative @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-086 — Lampiran format docx ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang berkas.docx ukuran 1024 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Format tidak didukung; file tidak tersimpan"

  @negative @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-087 — Lampiran format zip ditolak
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang berkas.zip ukuran 1024 byte"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Format tidak didukung; file tidak tersimpan"

  @positive @priority-high @REQ-034 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-072 — Lihat dan unduh dokumen tersimpan
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A memiliki d.pdf fixture dengan hash dan nama diketahui"
    When user mengklik elemen "Dokumen Tambahan [d.pdf]"
    Then sistem memenuhi hasil "Viewer/download membuka file yang benar; nama dan hash sama dengan upload"

  @negative @priority-high @REQ-034 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-088 — Dokumen tenant lain tidak dapat diunduh
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Link file SECRET-B milik tenant B diketahui"
    When user membuka halaman "dokumen SECRET-B"
    Then sistem memenuhi hasil "Akses ditolak; tidak menerima isi biner dokumen B"

  @edge @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-019 — Tipe Normal dari 1+1 titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 1 pengirim dan 1 penerima unik"
    When user mengklik elemen "Selanjutnya"
    And user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    And user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Tipe Normal diturunkan otomatis; jumlah dan urutan titik sama dengan form"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-073 — Label detail Normal
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang Normal dengan 1 pengirim 1 penerima"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Pengirim tanpa label; penerima tanpa label; data seluruh titik read-only"

  @edge @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-020 — Tipe Multipickup dari 2+1 titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2 pengirim dan 1 penerima unik"
    When user mengklik elemen "Selanjutnya"
    And user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    And user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Tipe Multipickup diturunkan otomatis; jumlah dan urutan titik sama dengan form"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-074 — Label detail Multipickup
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang Multipickup dengan 2 pengirim 1 penerima"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Pengirim berlabel Pick Up 1 dan Pick Up 2 sesuai spec; penerima tanpa label; data seluruh titik read-only"

  @edge @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-021 — Tipe Multidrop dari 1+2 titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 1 pengirim dan 2 penerima unik"
    When user mengklik elemen "Selanjutnya"
    And user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    And user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Tipe Multidrop diturunkan otomatis; jumlah dan urutan titik sama dengan form"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-075 — Label detail Multidrop
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang Multidrop dengan 1 pengirim 2 penerima"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Pengirim tanpa label; penerima berlabel Drop Off 1 dan Drop Off 2 sesuai spec; data seluruh titik read-only"

  @edge @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-022 — Tipe Multipoint dari 2+2 titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2 pengirim dan 2 penerima unik"
    When user mengklik elemen "Selanjutnya"
    And user mencentang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    And user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Tipe Multipoint diturunkan otomatis; jumlah dan urutan titik sama dengan form"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-076 — Label detail Multipoint
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang Multipoint dengan 2 pengirim 2 penerima"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Pengirim berlabel Pick Up 1 dan Pick Up 2 sesuai spec; penerima berlabel Drop Off 1 dan Drop Off 2 sesuai spec; data seluruh titik read-only"

  @edge @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-023 — Hapus penerima kedua kembali menjadi normal
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 1 pengirim 2 penerima"
    When user mengklik elemen "Hapus Bongkar [2]"
    Then sistem memenuhi hasil "Tersisa satu penerima tanpa label/ikon hapus; tipe kembali Normal; titik pertama tetap"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-089 — Drop Point Asal wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field Drop Point Asal pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Drop Point Asal pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-090 — Pengirim wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field Pengirim pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Pengirim pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-091 — PIC Pengirim wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field PIC Pengirim pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error PIC Pengirim pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-092 — No. WhatsApp PIC Pengirim wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field No. WhatsApp PIC Pengirim pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error No. WhatsApp PIC Pengirim pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-077 — Alamat dan catatan Pengirim mengikuti titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; master alamat lengkap di fixture"
    When user memilih opsi "DP-A01" pada field "Drop Point Asal"
    And user mengisi field "Catatan Pengirim" dengan "Titip dokumen di pos"
    And user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "Provinsi, Kota/Kab, Kecamatan, Desa/Kelurahan, Kode Pos dan Alamat sesuai master dan disabled; catatan tersimpan"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-093 — Drop Point Tujuan wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field Drop Point Tujuan pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Drop Point Tujuan pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-094 — Penerima wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field Penerima pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error Penerima pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-095 — PIC Penerima wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field PIC Penerima pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error PIC Penerima pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-096 — No. WhatsApp PIC Penerima wajib pada baris tambahan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid 2+2; fixture hanya field No. WhatsApp PIC Penerima pada baris 2 kosong; dependent auto-draft dinonaktifkan untuk fixture missing master"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Error No. WhatsApp PIC Penerima pada baris 2; field baris 1 tidak terkena error; tidak lanjut"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-078 — Alamat dan catatan Penerima mengikuti titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; master alamat lengkap di fixture"
    When user memilih opsi "DP-A02" pada field "Drop Point Tujuan"
    And user mengisi field "Catatan Penerima" dengan "Titip dokumen di pos"
    And user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "Provinsi, Kota/Kab, Kecamatan, Desa/Kelurahan, Kode Pos dan Alamat sesuai master dan disabled; catatan tersimpan"

  @edge @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-024 — WhatsApp mempertahankan nol di depan
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid"
    When user mengisi field "No. WhatsApp PIC Pengirim" dengan "081234567890"
    And user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "Nilai persis 081234567890, tidak berubah menjadi angka tanpa nol"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-097 — Duplikasi drop point sesama Pengirim
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form 2+2; dua baris Pengirim fixture memilih DP-A03 yang sama"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Duplikasi ditolak pada baris Pengirim; tidak lanjut"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-098 — Duplikasi drop point sesama Penerima
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form 2+2; dua baris Penerima fixture memilih DP-A03 yang sama"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Duplikasi ditolak pada baris Penerima; tidak lanjut"

  @edge @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-025 — Mengganti perusahaan tidak menyisakan drop point lama
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Pengirim A memiliki DP-A01; Pengirim C hanya DP-A03"
    When user memilih opsi "PT Pengirim C" pada field "Pengirim"
    And user mengklik elemen "Drop Point Asal"
    Then sistem memenuhi hasil "Opsi hanya DP-A03; pasangan lama DP-A01 tidak dipertahankan sebagai pasangan valid"

  @positive @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-079 — Pilih semua armada lalu hapus satu tag
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tiga armada aktif; satu nonaktif"
    When user mengklik elemen "Jenis Armada"
    And user mencentang checkbox "Pilih Semua Armada"
    And user mengklik elemen "Hapus tag Tronton Box"
    Then sistem memenuhi hasil "Seluruh armada aktif semula dipilih; setelah hapus tag hanya dua tersisa; nonaktif tidak dipilih"

  @negative @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-099 — Master armada dinonaktifkan sebelum submit
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tronton Box dipilih; fixture master berubah nonaktif sebelum Selanjutnya"
    When user mengklik elemen "Selanjutnya"
    Then sistem memenuhi hasil "Pilihan tidak valid ditolak/harus diperbarui; tidak menyimpan referensi armada nonaktif"

  @positive @priority-high @REQ-044 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-080 — Draft step dua tanpa peserta
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Step 1 valid; nol peserta terpilih"
    When user mengklik elemen "Simpan ke Draft"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Draf"
    Then sistem memenuhi hasil "Draft Isi Peserta Lelang tersimpan; tidak mengirim undangan atau jadwal bidding"

  @edge @priority-high @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-026 — Submit tepat waktu buka
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Jam server tetap 22/09/2026 10:00; Buka sama; step 1 valid; V-A dipilih"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Status langsung Sedang Buka; jadwal bidding aktif"

  @edge @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-027 — Pilih semua melintasi halaman terakhir
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "31 vendor eligible dengan halaman default 20"
    When user mengklik elemen "Pilih Semua"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Counter 31; seluruh 11 vendor halaman 2 tercentang"

  @edge @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-028 — Tidak ada vendor eligible
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Master hanya vendor inaktif"
    When user membuka halaman "peserta-lelang"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Empty state; counter 0; error minimal satu peserta saat submit"

  @positive @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-081 — Pembatalan tanpa order status Belum Buka
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka tanpa order; dialog identitas benar"
    When user mengisi field "Alasan Pembatalan" dengan "Kebutuhan berubah"
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Status Dibatalkan; alasan tersimpan; tidak menghapus lelang"

  @positive @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-082 — Pembatalan tanpa order status Sedang Buka
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka tanpa order; dialog identitas benar"
    When user mengisi field "Alasan Pembatalan" dengan "Kebutuhan berubah"
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Status Dibatalkan; alasan tersimpan; tidak menghapus lelang"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-100 — Pembatalan status Belum Buka dengan 1 order ditolak
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka memiliki 1 order; A03 berlaku"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Batalkan Lelang"
    Then sistem memenuhi hasil "Alert tidak dapat dibatalkan; tidak membuka pembatalan efektif atau mengubah status"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-101 — Pembatalan status Sedang Buka dengan 1 order ditolak
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka memiliki 1 order; A03 berlaku"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Batalkan Lelang"
    Then sistem memenuhi hasil "Alert tidak dapat dibatalkan; tidak membuka pembatalan efektif atau mengubah status"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-102 — Pembatalan status Tutup dengan 1 order ditolak
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup memiliki 1 order; A03 berlaku"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Batalkan Lelang"
    Then sistem memenuhi hasil "Alert tidak dapat dibatalkan; tidak membuka pembatalan efektif atau mengubah status"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-103 — Pembatalan status Aktif dengan 0 order ditolak
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif memiliki 0 order; A03 berlaku"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Batalkan Lelang"
    Then sistem memenuhi hasil "Alert tidak dapat dibatalkan; tidak membuka pembatalan efektif atau mengubah status"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-104 — Pembatalan status Selesai dengan 0 order ditolak
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Selesai memiliki 0 order; A03 berlaku"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Batalkan Lelang"
    Then sistem memenuhi hasil "Alert tidak dapat dibatalkan; tidak membuka pembatalan efektif atau mengubah status"

  @negative @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-105 — Alasan hanya whitespace ditolak
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka tanpa order"
    When user mengisi field "Alasan Pembatalan" dengan "   "
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Alasan dianggap kosong; status tidak berubah"

  @negative @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-106 — Harga tersembunyi saat bidding terbuka
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka; vendor sudah input harga"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Popup Lelang sedang dibuka; nominal harga tidak tampil"

  @positive @priority-high @REQ-062 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-083 — Ajukan nego pada status Tutup
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup; harga aktif; tidak sedang ulang"
    When user mengklik elemen "Ajukan Nego"
    Then sistem memenuhi hasil "Navigasi/integrasi Negosiasi membawa lelang yang benar; setelah proses dibuat fixture, card list mendapat penanda Proses Nego"

  @positive @priority-high @REQ-062 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-POS-084 — Ajukan nego pada status Aktif
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; harga aktif; tidak sedang ulang"
    When user mengklik elemen "Ajukan Nego"
    Then sistem memenuhi hasil "Navigasi/integrasi Negosiasi membawa lelang yang benar; setelah proses dibuat fixture, card list mendapat penanda Proses Nego"

  @negative @priority-high @REQ-063 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-107 — Lelang ulang tidak tersedia efektif pada Selesai
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Selesai"
    When user mengklik elemen "Lelang Ulang"
    Then sistem memenuhi hasil "Alert status tidak mengizinkan; tidak membuat siklus ulang"

  @negative @priority-high @REQ-063 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-108 — Lelang ulang tidak tersedia efektif pada Dibatalkan
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Dibatalkan"
    When user mengklik elemen "Lelang Ulang"
    Then sistem memenuhi hasil "Alert status tidak mengizinkan; tidak membuat siklus ulang"

  @edge @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-029 — Tutup ulang tepat akhir kirim
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; akhir 22/09 12:00; setting 2 Jam; buka sekarang 10:00"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    And user mengisi field "Buka Lelang" dengan "22/09/2026 10:00"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Siklus ulang diterima karena tutup sama dengan akhir kirim"

  @negative @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-109 — Buka ulang di masa lalu ditolak
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; sekarang 22/09/2026 10:00"
    When user memilih opsi "2 Jam" pada field "Durasi Lelang"
    And user mengisi field "Buka Lelang" dengan "22/09/2026 09:59"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Error buka tidak boleh kurang dari sekarang; tidak membuat siklus"

  @negative @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-110 — Durasi Lelang kosong pada ulang
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form ulang valid kecuali Durasi Lelang kosong"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Required Durasi Lelang tampil; tidak submit ulang"

  @negative @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-111 — Buka Lelang kosong pada ulang
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form ulang valid kecuali Buka Lelang kosong"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Required Buka Lelang tampil; tidak submit ulang"

  @edge @priority-high @REQ-067 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-030 — Ulang dijadwalkan buka masa depan
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Aktif; buka 23/09 10:00, tutup 23/09 12:00 sebelum akhir; peserta valid"
    When user mengklik elemen "Simpan"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Lelang Ulang"
    Then sistem memenuhi hasil "Status Belum Buka; masuk tab ulang dan penanda ungu; nomor tetap"

  @positive @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-085 — Counter ulang hanya menghitung peserta baru
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A lama terkunci; V-B lama belum input; V-C dan V-D baru eligible"
    When user mencentang checkbox "Vendor [V-C]"
    And user mencentang checkbox "Vendor [V-D]"
    And user menghapus centang checkbox "Vendor [V-B]"
    And user memeriksa elemen "Counter Vendor Baru" dengan kondisi "2 vendor baru diundang"
    Then sistem memenuhi hasil "Counter 2 vendor baru diundang; total peserta 3; V-A tetap locked"

  @positive @priority-high @REQ-067 @screen-riwayat-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-086 — Riwayat dua siklus terpisah
    Given user berada di halaman "riwayat-lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A telah ulang dua kali; fixture tanggal, vendor, admin dan waktu berbeda tiap siklus"
    When user membuka halaman "riwayat-lelang-ulang"
    And user memeriksa elemen "Riwayat Lelang Ulang" dengan kondisi "Dua entri sesuai fixture tiap siklus"
    Then sistem memenuhi hasil "Dua entri memuat buka–tutup, himpunan vendor, user dan waktu masing-masing tanpa tertukar"

  @edge @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-031 — Tie-break ranking Harga
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P1/P2 tanggal efektif sama; P1 harga 100 P2 harga 200; urutan response dibalik"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P1 sebelum P2"

  @edge @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-032 — Tie-break ranking Rating
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Efektif dan harga sama; P1 rating 4.8 P2 4.2; urutan response dibalik"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P1 sebelum P2"

  @edge @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-033 — Tie-break ranking Menang
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Efektif/harga/rating sama; P1 menang 20 P2 menang 10; urutan response dibalik"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P1 sebelum P2"

  @edge @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-034 — Tie-break ranking Armada
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Efektif/harga/rating/menang sama; P1 CDD Box P2 Tronton Box; urutan response dibalik"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "P1 sebelum P2 menurut A10 A–Z"

  @edge @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-035 — Filter tanpa penawaran cocok
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Penawaran V-A dan V-B tersedia; filter vendor eligible V-C tidak menawar"
    When user mengklik elemen "Filter"
    And user memilih opsi "V-C" pada field "Vendor"
    And user mengklik elemen "Terapkan"
    Then sistem memenuhi hasil "Empty state; Reset dapat mengembalikan semua hasil"

  @positive @priority-high @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-087 — Sorting tabel kedua arah
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture tiga vendor nama A B C dan tanggal kirim/penawaran berbeda; nilai oracle urutan diketahui"
    When user mengklik elemen "Vendor"
    And user mengklik elemen "Vendor"
    And user mengklik elemen "Tanggal Terkirim"
    And user mengklik elemen "Tanggal Terkirim"
    And user mengklik elemen "Tanggal Penawaran"
    And user mengklik elemen "Tanggal Penawaran"
    Then sistem memenuhi hasil "Tiap klik menukar arah urutan kolom; baris dan status tetap melekat pada vendor benar"

  @edge @priority-high @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-036 — Semua peserta belum input
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "10 peserta belum input sama sekali"
    When user memilih opsi "Input Penawaran" pada field "Semua Status"
    Then sistem memenuhi hasil "Total 0 dari 10 Vendor; tabel filter kosong; denominator tetap 10"

  @edge @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-037 — Edit PIC ketika waktu buka lama sudah lewat
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka; Buka 21/09/2026; Buka tidak diubah; A17 berlaku"
    When user mengisi field "PIC Penerima" dengan "Sari Edit"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Edit PIC berhasil; Buka lama tidak memicu validasi masa lalu; audit dan notifikasi tersedia"

  @negative @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-112 — Tambah hapus baris edit dibekukan sesuai asumsi
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka Multipoint 2+2; A02 sebagai oracle sementara"
    When user memeriksa elemen "Tambah Baris Input Pengirim" dengan kondisi "Tidak dapat menambah baris"
    And user memeriksa elemen "Tambah Baris Input Penerima" dengan kondisi "Tidak dapat menambah baris"
    And user memeriksa elemen "Hapus Muat" dengan kondisi "Tidak dapat menghapus"
    And user memeriksa elemen "Hapus Bongkar" dengan kondisi "Tidak dapat menghapus"
    Then sistem memenuhi hasil "Jumlah baris tetap 2+2; konflik desain ditandai untuk review produk"

  @positive @priority-high @REQ-014 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-088 — Hapus draft hanya menghapus target
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "D1 dan D2 draft tersimpan; D1 target hapus; konfirmasi jika implementasi memilikinya disetujui fixture"
    When user mengklik elemen "Draf"
    And user mengklik elemen "Menu Aksi [D1]"
    And user mengklik elemen "Hapus Draft"
    Then sistem memenuhi hasil "D1 hilang; D2 tetap; counter berkurang tepat satu; tidak mengirim notifikasi lelang"

  @positive @priority-high @REQ-014 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-089 — Navigasi riwayat pembatalan
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Ada lelang A Dibatalkan"
    When user mengklik elemen "Riwayat Pembatalan"
    Then sistem memenuhi hasil "Halaman Riwayat Pembatalan terbuka; batas integrasi modul terpisah"

  @positive @priority-high @REQ-012 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-090 — Panel filter list dapat dibuka dan ditutup
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Daftar lelang tampil; desain hanya memperlihatkan tombol Filter"
    When user mengklik elemen "Filter"
    And user memeriksa elemen "Panel Filter" dengan kondisi "Terlihat"
    And user mengklik elemen "Filter"
    Then sistem memenuhi hasil "Panel filter ditutup tanpa mengubah data; field filter tidak diasumsikan dari screenshot lain"

  @edge @priority-high @REQ-015 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-038 — Navigasi pertama terakhir dan ukuran halaman
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 41 lelang; opsi Tampilkan 20 tersedia"
    When user mengklik elemen "Halaman Terakhir"
    And user memeriksa elemen "Card Lelang" dengan kondisi "Satu item nomor 41"
    And user mengklik elemen "Halaman Pertama"
    And user mengklik elemen "Halaman Berikutnya"
    And user mengklik elemen "Halaman Sebelumnya"
    And user memilih opsi "20" pada field "Tampilkan"
    Then sistem memenuhi hasil "Kembali halaman 1, 20 item unik; tombol batas tidak memuat halaman invalid"

  @edge @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-039 — Pagination peserta-lelang dengan dua puluh satu data
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 entri unik eligible; ukuran halaman 20"
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua memuat satu entri; total 21 dan identitas baris tetap; tidak ada duplikasi"

  @edge @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-040 — Pagination tambah-peserta dengan dua puluh satu data
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 entri unik eligible; ukuran halaman 20"
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua memuat satu entri; total 21 dan identitas baris tetap; tidak ada duplikasi"

  @edge @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-041 — Pagination lelang-ulang dengan dua puluh satu data
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 entri unik eligible; ukuran halaman 20"
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua memuat satu entri; total 21 dan identitas baris tetap; tidak ada duplikasi"

  @edge @priority-high @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-042 — Pagination detail-lelang dengan dua puluh satu data
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 entri unik eligible; ukuran halaman 20"
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua memuat satu entri; total 21 dan identitas baris tetap; tidak ada duplikasi"

  @edge @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-043 — Pagination harga-penawaran dengan dua puluh satu data
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture 21 entri unik eligible; ukuran halaman 20"
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "Halaman kedua memuat satu entri; total 21 dan identitas baris tetap; tidak ada duplikasi"

  @positive @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-POS-091 — Filter dan pilih semua pada tambah-peserta
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture V-A Surabaya 4.8, V-B Malang 4.0, V-C Surabaya 3.0; vendor locked tetap terkunci"
    When user mengisi field "Cari nama vendor" dengan "V-A"
    And user memilih opsi "Surabaya" pada field "Semua Kota"
    And user memilih opsi "4 ke atas" pada field "Semua Rating"
    And user memeriksa elemen "Vendor" dengan kondisi "Hanya V-A sesuai filter"
    And user mengisi field "Cari nama vendor" dengan ""
    And user memilih opsi "Semua Kota" pada field "Semua Kota"
    And user memilih opsi "Semua Rating" pada field "Semua Rating"
    And user mengklik elemen "Pilih Semua"
    Then sistem memenuhi hasil "Seluruh vendor eligible dipilih sesuai A09; counter sesuai definisi layar; peserta menawar tetap locked"

  @positive @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-092 — Filter dan pilih semua pada lelang-ulang
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture V-A Surabaya 4.8, V-B Malang 4.0, V-C Surabaya 3.0; vendor locked tetap terkunci"
    When user mengisi field "Cari nama vendor" dengan "V-A"
    And user memilih opsi "Surabaya" pada field "Semua Kota"
    And user memilih opsi "4 ke atas" pada field "Semua Rating"
    And user memeriksa elemen "Vendor" dengan kondisi "Hanya V-A sesuai filter"
    And user mengisi field "Cari nama vendor" dengan ""
    And user memilih opsi "Semua Kota" pada field "Semua Kota"
    And user memilih opsi "Semua Rating" pada field "Semua Rating"
    And user mengklik elemen "Pilih Semua"
    Then sistem memenuhi hasil "Seluruh vendor eligible dipilih sesuai A09; counter sesuai definisi layar; peserta menawar tetap locked"

  @negative @priority-high @REQ-018 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-113 — Batal perubahan pada peserta-lelang
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form memiliki perubahan belum disimpan; fixture mengonfirmasi batal bila muncul dialog"
    When user mengklik elemen "Batal"
    Then sistem memenuhi hasil "Kembali ke halaman asal/list tanpa menyimpan perubahan; backend, audit sukses dan notifikasi tetap"

  @negative @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-114 — Batal perubahan pada edit-lelang
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form memiliki perubahan belum disimpan; fixture mengonfirmasi batal bila muncul dialog"
    When user mengklik elemen "Batal"
    Then sistem memenuhi hasil "Kembali ke halaman asal/list tanpa menyimpan perubahan; backend, audit sukses dan notifikasi tetap"

  @negative @priority-high @REQ-053 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-115 — Batal perubahan pada tambah-peserta
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form memiliki perubahan belum disimpan; fixture mengonfirmasi batal bila muncul dialog"
    When user mengklik elemen "Batal"
    Then sistem memenuhi hasil "Kembali ke halaman asal/list tanpa menyimpan perubahan; backend, audit sukses dan notifikasi tetap"

  @negative @priority-high @REQ-067 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-NEG-116 — Batal perubahan pada lelang-ulang
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form memiliki perubahan belum disimpan; fixture mengonfirmasi batal bila muncul dialog"
    When user mengklik elemen "Batal"
    Then sistem memenuhi hasil "Kembali ke halaman asal/list tanpa menyimpan perubahan; backend, audit sukses dan notifikasi tetap"

  @positive @priority-high @REQ-064 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-093 — Panel tanggal dan syarat ulang dapat dibuka tutup
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form ulang valid asuransi aktif"
    When user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Tanggal Tutup Lelang"
    And user mengklik elemen "Tanggal Tutup Lelang"
    Then sistem memenuhi hasil "Section kembali expanded; input tanggal dan data syarat tetap"

  @positive @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-POS-094 — Ringkasan syarat dan dokumen tambah peserta
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Lelang mempunyai lampiran d.pdf dan syarat asuransi"
    When user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Dokumen Tambahan [d.pdf]"
    Then sistem memenuhi hasil "Syarat kembali terlihat read-only; dokumen yang benar dibuka/diunduh"

  @edge @priority-high @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-044 — Klik Simpan dua kali
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid satu vendor; dua event click berdekatan"
    When user mengklik elemen "Simpan"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Maksimal satu lelang, nomor, jadwal dan undangan per vendor untuk operasi sama"

  @edge @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-045 — Status tutup berubah saat simpan edit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka saat form dibuka; hook clock tepat tutup sebelum commit"
    When user mengisi field "PIC Pengirim" dengan "Budi Baru"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Backend menolak edit setelah tutup; tidak ada mutasi/audit sukses"

  @edge @priority-high @REQ-052 @screen-tambah-peserta
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-046 — Vendor mengirim harga saat akan dikeluarkan
    Given user berada di halaman "tambah-peserta"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "V-A belum input saat form dibuka; hook membuat harga valid sebelum commit"
    When user menghapus centang checkbox "Vendor [V-A]"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Pengeluaran V-A ditolak dan UI direfresh; penawaran serta keanggotaan tetap"

  @edge @priority-high @REQ-054 @screen-batalkan-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-047 — Order terbentuk ketika dialog batal terbuka
    Given user berada di halaman "batalkan-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Tutup tanpa order saat buka dialog; hook menambahkan order sebelum commit"
    When user mengisi field "Alasan Pembatalan" dengan "Rencana berubah"
    And user mengklik elemen "Batalkan Order"
    Then sistem memenuhi hasil "Pembatalan ditolak; order valid tidak menjadi yatim; status tidak Dibatalkan"

  @edge @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-048 — Harga berubah setelah card dibuka
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "P1 aktif saat render; hook mengganti dengan P2 sebelum Pesan diproses"
    When user mengklik elemen "Pesan [P1]"
    Then sistem memenuhi hasil "Tidak membuat order dengan harga usang; refresh/alert dan verifikasi ulang harga"

  @edge @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-049 — Dua admin memulai ulang bersamaan
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Dua sesi admin membuka A Aktif; hook sesi B submit dulu"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Hanya satu siklus ulang tercipta; sesi kalah mendapat informasi konflik"

  @edge @priority-high @REQ-069 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-050 — Tab lama mencoba pesan setelah ulang dimulai
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Halaman A masih menampilkan Pesan; sesi lain memulai ulang sebelum klik"
    When user mengklik elemen "Pesan [P1]"
    Then sistem memenuhi hasil "Backend menolak pemesanan; halaman memperlihatkan proses ulang"

  @stress @priority-medium @REQ-035 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-STR-001 — Seratus baris tiap sisi
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form fixture berisi 100 pengirim dan 100 penerima unik lengkap"
    When user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "200 baris tetap lengkap dan berurutan; tidak ada batas maksimal buatan"

  @stress @priority-medium @REQ-036 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-STR-002 — Hapus bergantian pada banyak titik
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form fixture 100 pengirim; driver menghapus baris genap melalui ikon masing-masing"
    When user mengklik elemen "Hapus Muat [100]"
    Then sistem memenuhi hasil "50 titik ganjil tersisa sesuai driver; label 1–50 tanpa duplikasi dan data tidak tertukar"

  @stress @priority-medium @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-STR-003 — Pencarian master besar
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Master tenant A 10000 drop point; B 10000; pencarian DP-A9999"
    When user mengklik elemen "Drop Point Asal"
    And user mengisi field "Cari Drop Point" dengan "DP-A9999"
    Then sistem memenuhi hasil "Hanya hasil tenant A yang sesuai; hasil dapat dipilih; tidak memuat data tenant B"

  @stress @priority-medium @REQ-042 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-004 — Pilih seribu vendor lintas pagination
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "1000 vendor eligible; setiap halaman 20"
    When user mengklik elemen "Pilih Semua"
    And user mengklik elemen "Halaman Berikutnya"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Tepat 1000 peserta unik; tidak ada kehilangan pilihan/counter akibat pagination"

  @stress @priority-medium @REQ-043 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-005 — Seratus vendor baru setelah pilih semua
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Pilih Semua telah disimpan; hook menambahkan 100 eligible dan 20 ineligible paralel"
    When user membuka halaman "detail-lelang"
    Then sistem memenuhi hasil "Hanya 100 eligible ditambahkan sekali; 20 ineligible dikecualikan"

  @stress @priority-medium @REQ-015 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-006 — Daftar sepuluh ribu lelang
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Tenant A 10000 lelang; driver 50 kali pindah halaman"
    When user mengklik elemen "Halaman Berikutnya"
    Then sistem memenuhi hasil "ID stabil tanpa hilang/duplikat per halaman; ukuran 20; UI tetap bisa dinavigasi"

  @stress @priority-medium @REQ-058 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-STR-007 — Ranking lima ribu penawaran
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "5000 penawaran dengan tie seluruh tingkatan; oracle sort independen disiapkan"
    When user mengklik elemen "Urutkan"
    Then sistem memenuhi hasil "Urutan global sesuai comparator 5 tingkat termasuk lintas pagination; harga aktif tidak hilang"

  @stress @priority-medium @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-008 — Lima puluh submit independen paralel
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "50 sesi form berbeda milik tenant A; masing-masing 2 vendor; driver menjalankan klik serentak"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "50 lelang dan nomor unik; tiap operasi punya satu jadwal dan satu email/push per vendor; tidak tertukar"

  @stress @priority-medium @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-009 — Dua puluh editor lelang yang sama
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "20 sesi membaca A Belum Buka; tiap sesi mengubah PIC berbeda dan submit serentak"
    When user mengisi field "PIC Pengirim" dengan "PIC-S01"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Hasil akhir satu versi konsisten; tiap commit sukses memiliki audit lama/baru/user/waktu; konflik tidak menghapus audit"

  @stress @priority-medium @REQ-067 @screen-lelang-ulang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-010 — Ulang dengan seribu undangan
    Given user berada di halaman "lelang-ulang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "1000 vendor lama dan baru; waktu valid; sink notifikasi menampung seluruh job"
    When user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Satu siklus ulang; 1000 peserta unik; email/push lengkap tanpa duplikasi logis setelah queue drain"

  @stress @priority-medium @REQ-034 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-STR-011 — Dua puluh lampiran batas per file
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Fixture file chooser memasang 20 PDF masing-masing 4194304 byte; tidak ada batas jumlah yang ditentukan"
    When user mengklik elemen "Pilih File"
    Then sistem memenuhi hasil "Tidak salah memakai batas 4MB sebagai total gabungan; semua file yang diterima tetap utuh; batas infrastrukur bila ada dilaporkan tanpa sukses palsu"

  @stress @priority-medium @REQ-032 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-STR-012 — Teks panjang Unicode
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid; fixture menghasilkan 100000 karakter Unicode dan newline pada deskripsi/catatan"
    When user mengisi field "Deskripsi Barang" dengan "${TEXT_100K}"
    And user mengisi field "Catatan Tambahan" dengan "${TEXT_100K}"
    And user mengklik elemen "Simpan ke Draft"
    Then sistem memenuhi hasil "Tidak crash atau diam-diam memotong data; simpan utuh atau berikan error kapasitas eksplisit dengan isian dipertahankan"

  @stress @priority-medium @REQ-045 @screen-peserta-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-013 — Timeout sesudah commit dan retry
    Given user berada di halaman "peserta-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Simpan pertama commit backend tetapi respons diputus; retry memakai operasi sama"
    When user mengklik elemen "Simpan"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Setelah rekonsiliasi hanya satu lelang dan nomor serta undangan; UI menampilkan hasil tersimpan atau status dapat dipulihkan"

  @stress @priority-medium @REQ-069 @screen-harga-penawaran
  Scenario: AMS002-BUAT-LELANG-FTL-STR-014 — Refresh paralel saat ulang tutup
    Given user berada di halaman "harga-penawaran"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "100 sesi membuka harga; server clock melintasi tutup; fixture 500 harga baru"
    When user membuka halaman "harga-penawaran"
    Then sistem memenuhi hasil "Tidak ada harga baru bocor sebelum tutup; setelah tutup semua sesi konvergen pada himpunan harga aktif benar"

  @stress @priority-medium @REQ-013 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-015 — Pembersihan ribuan draft pada pergantian hari
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "10000 draft kedaluwarsa kemarin dan 1000 hari ini; job pembersihan berjalan"
    When user mengklik elemen "Draf"
    Then sistem memenuhi hasil "10000 draft lama hilang; 1000 hari ini tetap; counter dan pagination sesuai tanpa menghapus lelang submitted"

  @stress @priority-medium @REQ-048 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-STR-016 — Pembaruan seribu status peserta
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "1000 peserta; hook 700 vendor menawar paralel, 300 belum input"
    When user mengklik elemen "Peserta Lelang"
    Then sistem memenuhi hasil "Total 700 dari 1000 Vendor; timestamp terbaru dan status masing-masing benar; tidak menghitung jumlah versi harga sebagai vendor"

  @positive @priority-high @REQ-016 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-095 — Buat Lelang dari daftar membuka step pertama
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Halaman list tenant A"
    When user mengklik elemen "Buat Lelang"
    Then sistem memenuhi hasil "Halaman informasi-umum terbuka pada step 01"

  @positive @priority-high @REQ-014 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-096 — Navigasi aksi baca pada lelang pernah ulang
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A submitted pernah ulang; menu setiap kali dibuka ulang"
    When user mengklik elemen "Semua Lelang"
    And user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Detail"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Riwayat Perubahan"
    And user membuka halaman "list-lelang"
    And user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Riwayat Lelang Ulang"
    Then sistem memenuhi hasil "Detail dan kedua riwayat menampilkan lelang A; identitas tidak tertukar"

  @positive @priority-high @REQ-051 @screen-list-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-097 — Menu tambah peserta membuka form yang benar
    Given user berada di halaman "list-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; B berbeda nomor"
    When user mengklik elemen "Menu Aksi [A]"
    And user mengklik elemen "Tambah Peserta Lelang"
    Then sistem memenuhi hasil "Halaman tambah-peserta memuat ringkasan A dan peserta A, bukan B"

  @positive @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-098 — Button edit detail membuka form tersimpan
    Given user berada di halaman "detail-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Sedang Buka"
    When user mengklik elemen "Edit Data"
    Then sistem memenuhi hasil "Edit Lelang Spot Rate terbuka dengan seluruh data A"

  @edge @priority-high @REQ-002 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-EDG-051 — Beralih jenis FCL kembali FTL
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form baru tanpa data"
    When user mengklik elemen "FCL"
    And user mengklik elemen "FTL"
    Then sistem memenuhi hasil "Keempat card FTL langsung tampil; tidak ada input pelabuhan atau skema FCL tersisa"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-099 — PIC penerima dapat dikoreksi tanpa mengubah master
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid DP-A02"
    When user mengisi field "PIC Penerima" dengan "Sari Koreksi"
    And user mengklik elemen "Selanjutnya"
    And user mengklik elemen "Kembali"
    Then sistem memenuhi hasil "PIC Penerima tetap Sari Koreksi; PIC master DP-A02 tetap Sari"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-100 — Edit Buka Lelang tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 11:00"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Buka Lelang tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-101 — Edit Rencana Awal Kirim tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Rencana Awal Kirim" dengan "25/09/2026 10:00"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Rencana Awal Kirim tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-102 — Edit Jumlah Armada tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Jumlah Armada" dengan "3"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Jumlah Armada tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-103 — Edit Jenis Armada tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user memilih opsi "Tronton Wing Box" pada field "Jenis Armada"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Jenis Armada tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-104 — Edit Deskripsi Barang tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Deskripsi Barang" dengan "Kertas revisi"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Deskripsi Barang tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-105 — Edit Gunakan Asuransi tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user menghapus centang checkbox "Gunakan Asuransi"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Gunakan Asuransi tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-106 — Edit Nilai Barang Min tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Nilai Barang Min" dengan "1500000"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Nilai Barang Min tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-107 — Edit Nilai Barang Max tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Nilai Barang Max" dengan "3000000"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Nilai Barang Max tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-108 — Edit Catatan Tambahan tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Catatan Tambahan" dengan "Dokumen revisi"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Catatan Tambahan tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-109 — Edit Drop Point Asal tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user memilih opsi "DP-A03" pada field "Drop Point Asal"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Drop Point Asal tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-110 — Edit Drop Point Tujuan tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user memilih opsi "DP-A04" pada field "Drop Point Tujuan"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Drop Point Tujuan tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-111 — Edit Pengirim tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user memilih opsi "PT Pengirim A" pada field "Pengirim"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Pengirim tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-112 — Edit Penerima tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user memilih opsi "PT Penerima A" pada field "Penerima"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Penerima tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-113 — Edit No. WhatsApp PIC Pengirim tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "No. WhatsApp PIC Pengirim" dengan "082222222222"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan No. WhatsApp PIC Pengirim tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-114 — Edit No. WhatsApp PIC Penerima tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "No. WhatsApp PIC Penerima" dengan "083333333333"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan No. WhatsApp PIC Penerima tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-115 — Edit Catatan Pengirim tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Catatan Pengirim" dengan "Muat pagi"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Catatan Pengirim tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-116 — Edit Catatan Penerima tersimpan dengan audit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; buka 23/09 10:00; tutup 24/09 10:00; awal 25/09 10:00; akhir 30/09; asuransi aktif min 1000000 max 2000000; master DP-A03/A04 unik dan aktif; field lain valid"
    When user mengisi field "Catatan Penerima" dengan "Bongkar sore"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Perubahan Catatan Penerima tersimpan sesuai input; field bergantung dihitung/diisi ulang; audit benar dan peserta menerima notifikasi"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-117 — Lampiran ditambahkan saat edit
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka; fixture chooser memasang revisi.pdf 1024 byte"
    When user mengklik elemen "Pilih File"
    And user mengklik elemen "Simpan"
    Then sistem memenuhi hasil "Lampiran revisi.pdf tersimpan dan dapat dibuka di detail; audit perubahan tersedia"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS002-BUAT-LELANG-FTL-POS-118 — Seluruh field alamat otomatis terkunci pada informasi-umum
    Given user berada di halaman "informasi-umum"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid DP-A01 dan DP-A02; master enam field alamat lengkap"
    When user memeriksa elemen "Provinsi Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kota/Kab Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kecamatan Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Desa/Kelurahan Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kode Pos Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Alamat Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Provinsi Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kota/Kab Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kecamatan Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Desa/Kelurahan Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kode Pos Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Alamat Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    Then sistem memenuhi hasil "Dua belas field alamat tampil sesuai master; user tidak mengubah alamat master lewat form"

  @positive @priority-high @REQ-050 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-119 — Seluruh field alamat otomatis terkunci pada edit-lelang
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "Form valid DP-A01 dan DP-A02; master enam field alamat lengkap"
    When user memeriksa elemen "Provinsi Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kota/Kab Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kecamatan Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Desa/Kelurahan Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Kode Pos Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Alamat Asal" dengan kondisi "Nilai sama master DP-A01; disabled atau read-only"
    And user memeriksa elemen "Provinsi Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kota/Kab Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kecamatan Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Desa/Kelurahan Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Kode Pos Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    And user memeriksa elemen "Alamat Tujuan" dengan kondisi "Nilai sama master DP-A02; disabled atau read-only"
    Then sistem memenuhi hasil "Dua belas field alamat tampil sesuai master; user tidak mengubah alamat master lewat form"

  @positive @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS002-BUAT-LELANG-FTL-POS-120 — Jenis tipe dan tutup edit bersifat read-only
    Given user berada di halaman "edit-lelang"
    And kondisi uji "Admin shipper A terautentikasi; master dan fixture uji terisolasi; waktu dibekukan kecuali override."
    And kondisi uji "A Belum Buka Normal; buka 23/09/2026 10:00 durasi 1 Hari"
    When user memeriksa elemen "Jenis Pengiriman" dengan kondisi "Teks FTL read-only"
    And user memeriksa elemen "Tipe Pengiriman" dengan kondisi "Teks Normal read-only"
    And user memeriksa elemen "Tutup Lelang" dengan kondisi "24/09/2026 10:00 read-only"
    Then sistem memenuhi hasil "Tidak ada editor jenis/tipe; tutup hanya hasil kalkulasi"
