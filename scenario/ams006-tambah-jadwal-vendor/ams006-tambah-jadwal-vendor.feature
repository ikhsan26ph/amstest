Feature: Pengelolaan jadwal vendor FCL
  Sebagai vendor
  Saya ingin menambah, melihat, mengubah, menghapus, dan mengimpor jadwal kapal
  Agar harga penawaran FCL dapat dipesan sesuai jadwal yang valid

  @positive @priority-high @REQ-001 @screen-daftar-penawaran
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-001] Aksi jadwal tersedia hanya pada harga FCL
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol atau link "Menu Aksi harga FCL"
    Then sistem menampilkan "Tambah Jadwal dan Lihat Jadwal" pada "Menu Aksi"
    When user mengklik tombol atau link "Menu Aksi harga FTL"
    Then sistem menampilkan "tidak memuat Tambah Jadwal atau Lihat Jadwal" pada "Menu Aksi"

  @positive @priority-high @REQ-002 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-002] Banyak jadwal tersimpan pada satu harga asal
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Tambah Jadwal"
    And user mengisi field "Nama Kapal" dengan "KM Satu"
    And user mengisi field "Voyage" dengan "V001"
    And user mengklik tombol atau link "Simpan"
    And user mengklik tombol atau link "Tambah Jadwal"
    And user mengisi field "Nama Kapal" dengan "KM Dua"
    And user mengisi field "Voyage" dengan "V002"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "KM Satu dan KM Dua pada No. Lelang yang sama" pada "Tabel Jadwal"

  @positive @priority-high @REQ-003 @screen-daftar-penawaran
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-003] Jadwal pertama melengkapi penawaran FCL
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Meratus"
    And user mengisi field "Voyage" dengan "M001"
    And user mengisi field "Closing Time" dengan "25/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "26/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "28/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"
    When user membuka halaman "Daftar Penawaran"
    And user mengklik tombol atau link "Tab Penawaran Lengkap"
    Then sistem menampilkan "status Input Penawaran dan tanpa badge Belum Input Jadwal" pada "Card Harga"
    When user membuka halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "aktif" pada "Tombol Pesan"

  @positive @priority-high @REQ-004 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-004] Tambah jadwal setelah lelang tutup sebelum akhir kirim
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol atau link "Menu Aksi harga FCL"
    And user mengklik tombol atau link "Tambah Jadwal"
    And user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Pasca Tutup"
    And user mengisi field "Voyage" dengan "PT01"
    And user mengisi field "Closing Time" dengan "25/09/2026 09:00"
    And user mengisi field "Berangkat (ETD)" dengan "26/09/2026 09:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 09:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @positive @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-005] Edit dan hapus jadwal yang masih memenuhi syarat
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    And user mengisi field "Voyage" dengan "EDIT-01"
    And user mengklik tombol atau link "Kirim"
    Then sistem menampilkan "Voyage EDIT-01" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Hapus Jadwal"
    And user mengklik tombol atau link "Konfirmasi Hapus"
    Then sistem menampilkan "jadwal tidak tampil" pada "Tabel Jadwal"

  @positive @priority-medium @REQ-006 @screen-daftar-penawaran
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-006] Menu jadwal membuka layar sesuai aksi
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol atau link "Menu Aksi harga FCL"
    And user mengklik tombol atau link "Tambah Jadwal"
    Then sistem menampilkan "Tambah Jadwal" pada "Heading"
    When user membuka halaman "Daftar Penawaran"
    And user mengklik tombol atau link "Menu Aksi harga FCL"
    And user mengklik tombol atau link "Lihat Jadwal"
    Then sistem menampilkan "Detail Jadwal" pada "Heading"

  @positive @priority-medium @REQ-007 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-007] Informasi lelang dan harga tampil lengkap serta read-only
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Panel Informasi Lelang dan Harga"
    Then sistem menampilkan "No. Lelang, Jenis, Tipe, Skema, Pelayaran, Kontainer, Harga, Mulai Berlaku, PPN, PPh, rute, Biaya Termasuk, Deskripsi Harga" pada "Informasi Lelang dan Harga"
    And sistem menampilkan "read-only" pada "Informasi Lelang dan Harga"

  @positive @priority-medium @REQ-008 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-008] Tabel jadwal memakai urutan terbaru dan pagination 20
    Given user berada di halaman "Detail Jadwal"
    Then sistem menampilkan "Tanggal Buat, Nama Kapal, Voyage, Closing Time, Open Stack, Berangkat (ETD), Tiba (ETA), Edit, Hapus" pada "Header Tabel Jadwal"
    And sistem menampilkan "Tanggal Buat terbaru" pada "Baris Pertama"
    And sistem menampilkan "20" pada "Ukuran Halaman"
    When user mengklik tombol atau link "Header Nama Kapal"
    Then sistem menampilkan "terurut berdasarkan Nama Kapal" pada "Tabel Jadwal"

  @positive @priority-medium @REQ-009 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-009] Filter jadwal diterapkan lalu direset
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Filter"
    And user mengisi field "Nama Kapal" dengan "KM Tidar"
    And user mengisi field "Voyage" dengan "088"
    And user memilih "Direct" pada field "Jenis Jadwal"
    And user mengklik tombol atau link "Terapkan"
    Then sistem menampilkan "hanya KM Tidar voyage 088 Direct" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Reset"
    Then sistem menampilkan "semua nilai kosong" pada "Filter Jadwal"
    And sistem menampilkan "semua jadwal kembali tampil" pada "Tabel Jadwal"

  @positive @priority-medium @REQ-010 @screen-detail-kapal-connecting
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-010] Badge connecting menampilkan seluruh rangkaian kapal
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "2x Connecting"
    Then sistem menampilkan "asal dengan kapal utama, dua pelabuhan transit, dan tujuan" pada "Dialog Detail Kapal Connecting"
    And sistem menampilkan "ETD Asal, ETD Connecting, dan ETA Tujuan" pada "Rangkaian Connecting"
    When user mengklik tombol atau link "Tutup Dialog"

  @positive @priority-medium @REQ-011 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-011] Informasi umum dan detail multipickup multidrop tampil
    Given user berada di halaman "Tambah Jadwal"
    Then sistem menampilkan "terisi otomatis dan nonaktif" pada "No. Lelang"
    And sistem menampilkan "jenis, jumlah kontainer, asuransi, biaya, POL-POD dan alamat" pada "Informasi Umum"
    When user mengklik tombol atau link "Multipickup"
    Then sistem menampilkan "seluruh drop point asal" pada "Dialog Detail Pickup"
    When user mengklik tombol atau link "Tutup Dialog"
    And user mengklik tombol atau link "Multidrop"
    Then sistem menampilkan "seluruh drop point tujuan" pada "Dialog Detail Drop"

  @positive @priority-high @REQ-012 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-012] Pergantian jenis mempertahankan detail kapal utama
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Persisten"
    And user mengisi field "Voyage" dengan "P001"
    And user memilih "Connecting" pada field "Jenis Jadwal Kapal"
    Then sistem menampilkan "tampil tanpa reload" pada "Data Kapal Connecting"
    And sistem menampilkan "KM Persisten" pada "Nama Kapal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    Then sistem menampilkan "tidak tampil" pada "Data Kapal Connecting"
    And sistem menampilkan "P001" pada "Voyage"

  @positive @priority-high @REQ-013 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-013] Simpan jadwal Direct dengan urutan waktu valid
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    Then sistem menampilkan "Meratus dan nonaktif" pada "Pelayaran"
    When user mengisi field "Nama Kapal" dengan "KM Valid"
    And user mengisi field "Voyage" dengan "VAL-01"
    And user mengisi field "Open Stack" dengan "24/09/2026 08:00"
    And user mengisi field "Closing Time" dengan "24/09/2026 12:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 12:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 12:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @positive @priority-high @REQ-014 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-014] Simpan connecting dengan beberapa transit unik
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Connecting" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Utama"
    And user mengisi field "Voyage" dengan "U001"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "30/09/2026 10:00"
    And user memilih "Benoa" pada field "Pelabuhan Connecting"
    And user mengisi field "Kapal Connecting" dengan "KM Bali"
    And user mengisi field "Voyage Connecting" dengan "B001"
    And user mengisi field "ETD Connecting" dengan "26/09/2026 10:00"
    And user mengklik tombol atau link "Tambah Kapal Connecting"
    And user memilih "Ende" pada field "Pelabuhan Connecting 2"
    And user mengisi field "Kapal Connecting 2" dengan "KM Ende"
    And user mengisi field "Voyage Connecting 2" dengan "E001"
    And user mengisi field "ETD Connecting 2" dengan "28/09/2026 10:00"
    Then sistem menampilkan "tampil saat baris lebih dari satu" pada "Hapus Kapal Connecting"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "2x Connecting" pada "Tabel Jadwal"

  @positive @priority-high @REQ-015 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-015] Koreksi field error sampai penyimpanan berhasil
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "terlihat dan menjadi posisi scroll" pada "Field Error Pertama"
    And sistem menampilkan "field wajib harus diisi" pada "Helper Error"
    When user mengisi field "Nama Kapal" dengan "KM Koreksi"
    And user mengisi field "Voyage" dengan "K001"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "26/09/2026 10:00"
    And user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @positive @priority-medium @REQ-016 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-016] Batal terkonfirmasi membuang perubahan
    Given user berada di halaman "Tambah Jadwal"
    When user mengisi field "Nama Kapal" dengan "KM Tidak Jadi"
    And user mengklik tombol atau link "Batal"
    Then sistem menampilkan "perubahan tidak akan disimpan" pada "Dialog Konfirmasi Batal"
    When user mengklik tombol atau link "Ya, Batal"
    Then sistem menampilkan "Detail Jadwal" pada "Heading"
    And sistem menampilkan "KM Tidak Jadi tidak tampil" pada "Tabel Jadwal"

  @positive @priority-high @REQ-017 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-017] Simpan unik mencatat tanggal buat dan toast
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Unik"
    And user mengisi field "Voyage" dengan "UNQ-01"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"
    And sistem menampilkan "KM Unik, UNQ-01, dan Tanggal Buat saat ini" pada "Tabel Jadwal"

  @positive @priority-high @REQ-018 @screen-edit-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-018] Edit jadwal memuat data existing dan menyimpan perubahan
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "data existing terisi" pada "Dialog Edit Jadwal"
    And sistem menampilkan "Direct terpilih" pada "Jenis Jadwal Kapal"
    When user mengisi field "Voyage" dengan "088-REV"
    And user mengklik tombol atau link "Kirim"
    Then sistem menampilkan "Voyage 088-REV" pada "Tabel Jadwal"

  @positive @priority-high @REQ-019 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-019] Hapus jadwal aktif terakhir mengembalikan status harga
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "konfirmasi penghapusan" pada "Dialog Konfirmasi Hapus"
    When user mengklik tombol atau link "Konfirmasi Hapus"
    Then sistem menampilkan "kosong" pada "Tabel Jadwal"
    When user membuka halaman "Daftar Penawaran"
    Then sistem menampilkan "badge Belum Input Jadwal dan status Input Harga" pada "Card Harga"
    When user membuka halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "nonaktif" pada "Tombol Pesan"

  @positive @priority-medium @REQ-020 @screen-riwayat-perubahan
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-020] Tambah edit hapus tercatat lengkap di riwayat
    Given user berada di halaman "Riwayat Perubahan"
    When user mengklik tombol atau link "Filter Riwayat Perubahan"
    Then sistem menampilkan "entri Tambah Jadwal" pada "Tabel Riwayat"
    And sistem menampilkan "entri Edit Jadwal dengan nilai lama dan baru" pada "Tabel Riwayat"
    And sistem menampilkan "entri Hapus Jadwal" pada "Tabel Riwayat"
    And sistem menampilkan "user dan waktu pada setiap entri" pada "Tabel Riwayat"

  @positive @priority-high @REQ-021 @screen-detail-harga-penawaran-shipper
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-021] Perubahan pascalelang langsung terlihat oleh shipper
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    And user mengisi field "Closing Time" dengan "25/09/2026 12:00"
    And user mengisi field "Berangkat (ETD)" dengan "26/09/2026 12:00"
    And user mengisi field "Tiba (ETA)" dengan "28/09/2026 12:00"
    And user mengklik tombol atau link "Kirim"
    When user membuka halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "Closing Time 25/09/2026 12:00, ETD 26/09/2026 12:00, ETA 28/09/2026 12:00" pada "Detail Jadwal Shipper"
    And sistem menampilkan "data terbaru" pada "Tab Detail Kapal"
    And sistem menampilkan "sesuai ketersediaan jadwal" pada "Tombol Pesan"

  @positive @priority-medium @REQ-022 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-POS-022] Unduh template dan import jadwal Direct valid
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Download Template"
    Then sistem menampilkan "Template Jadwal Kapal Direct.xlsx" pada "Unduhan"
    When user mengklik tombol atau link "Import Jadwal"
    Then sistem menampilkan "data Excel valid terisi" pada "Detail Kapal Utama"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @negative @priority-high @REQ-001 @screen-daftar-penawaran
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-001] FTL tidak mengekspos pengelolaan jadwal
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol atau link "Menu Aksi harga FTL"
    Then sistem menampilkan "Tambah Jadwal dan Lihat Jadwal tidak tersedia" pada "Menu Aksi"

  @negative @priority-high @REQ-002 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-002] Jadwal tidak dapat dipindahkan ke harga lain
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "Harga A dan nonaktif" pada "No. Lelang"
    And sistem menampilkan "tidak memiliki kontrol pindah harga" pada "Dialog Edit Jadwal"
    When user mengklik tombol atau link "Kirim"
    Then sistem menampilkan "jadwal tetap pada Harga A" pada "Tabel Jadwal"

  @negative @priority-high @REQ-003 @screen-daftar-penawaran
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-003] Harga tanpa jadwal tidak dapat dipesan
    Given user berada di halaman "Daftar Penawaran"
    Then sistem menampilkan "badge Belum Input Jadwal dan status Input Harga" pada "Card Harga"
    When user mengklik tombol atau link "Tab Penawaran Lengkap"
    Then sistem menampilkan "harga tidak tampil" pada "Daftar Penawaran"
    When user membuka halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "nonaktif" pada "Tombol Pesan"

  @negative @priority-high @REQ-004 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-004] Simpan ditolak setelah rencana akhir kirim
    Given user berada di halaman "Tambah Jadwal"
    When user mengisi field "Nama Kapal" dengan "KM Terlambat"
    And user mengisi field "Voyage" dengan "LATE-01"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Lelang sudah melewati rencana akhir kirim. Tidak bisa tambah jadwal" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    Then sistem menampilkan "data tidak tersimpan" pada "Tabel Jadwal"

  @negative @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-005] Edit dan hapus ditolak setelah akhir kirim
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Sudah melewati rencana akhir kirim" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    And user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Sudah melewati rencana akhir kirim" pada "Alert"
    And sistem menampilkan "data tidak berubah" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-006 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-006] Akses detail tanpa konteks harga tidak mencampur data
    Given user berada di halaman "Detail Jadwal tanpa Harga"
    When user mengklik tombol atau link "Muat Ulang"
    Then sistem menampilkan "harga penawaran tidak ditemukan" pada "Halaman Error"
    And sistem menampilkan "tidak menampilkan jadwal harga lain" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-007 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-007] Informasi read-only tidak dapat dimodifikasi
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Informasi Lelang dan Harga"
    And user mengisi field "Harga" dengan "Rp1"
    Then sistem menampilkan "tetap sesuai harga penawaran" pada "Harga"
    And sistem menampilkan "tidak menyediakan tombol Simpan" pada "Informasi Lelang dan Harga"

  @negative @priority-medium @REQ-008 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-008] Interaksi tabel tidak mengubah data sel
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Sel Nama Kapal"
    And user mengisi field "Nama Kapal pada Tabel" dengan "Manipulasi"
    Then sistem menampilkan "nilai asli tetap tampil" pada "Tabel Jadwal"
    And sistem menampilkan "tidak memiliki kontrol simpan inline" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-009 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-009] Filter tanpa kecocokan menghasilkan empty state
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Filter"
    And user mengisi field "Nama Kapal" dengan "KM TIDAK ADA"
    And user mengklik tombol atau link "Terapkan"
    Then sistem menampilkan "Data jadwal tidak ditemukan" pada "Empty State Tabel"
    When user mengklik tombol atau link "Reset"
    Then sistem menampilkan "data kembali tampil" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-010 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-010] Jadwal Direct tidak menampilkan badge connecting
    Given user berada di halaman "Detail Jadwal"
    Then sistem menampilkan "badge nx Connecting tidak tampil" pada "Baris Jadwal Direct"
    When user mengklik tombol atau link "Baris Jadwal Direct"
    Then sistem menampilkan "tidak terbuka" pada "Dialog Detail Kapal Connecting"

  @negative @priority-high @REQ-011 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-011] No. Lelang dan informasi umum tidak dapat diganti
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Harga B" pada field "No. Lelang"
    And user mengisi field "Jenis Pengiriman" dengan "FTL"
    Then sistem menampilkan "tetap Harga A" pada "No. Lelang"
    And sistem menampilkan "tetap FCL" pada "Jenis Pengiriman"
    And sistem menampilkan "nonaktif/read-only" pada "Informasi Umum"

  @negative @priority-high @REQ-012 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-012] Simpan tanpa memilih jenis jadwal ditolak
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "border error" pada "Jenis Jadwal Kapal"
    And sistem menampilkan "Jenis Jadwal Kapal wajib dipilih" pada "Helper Error"
    And sistem menampilkan "sukses tidak tampil" pada "Toast"

  @negative @priority-high @REQ-013 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-013] Validasi field wajib dan kronologi kapal utama
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Closing Time" dengan "23/09/2026 09:00"
    And user mengisi field "Berangkat (ETD)" dengan "23/09/2026 08:00"
    And user mengisi field "Tiba (ETA)" dengan "23/09/2026 07:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "wajib diisi" pada "Nama Kapal"
    And sistem menampilkan "wajib diisi" pada "Voyage"
    And sistem menampilkan "tidak boleh lebih kecil dari waktu saat ini" pada "Closing Time"
    And sistem menampilkan "harus lebih besar dari Closing Time" pada "Berangkat (ETD)"
    And sistem menampilkan "harus lebih besar dari ETD" pada "Tiba (ETA)"

  @negative @priority-high @REQ-014 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-014] Connecting menolak pelabuhan dan waktu transit invalid
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Connecting" pada field "Jenis Jadwal Kapal"
    And user memilih "Tanjung Perak" pada field "Pelabuhan Connecting"
    And user mengisi field "ETD Connecting" dengan "24/09/2026 10:00"
    And user mengklik tombol atau link "Tambah Kapal Connecting"
    And user memilih "Tanjung Perak" pada field "Pelabuhan Connecting 2"
    And user mengisi field "ETD Connecting 2" dengan "01/10/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "tidak boleh sama dengan asal, tujuan, atau transit lain" pada "Pelabuhan Connecting"
    And sistem menampilkan "harus setelah ETD sebelumnya dan tidak melebihi ETA" pada "ETD Connecting"
    And sistem menampilkan "sukses tidak tampil" pada "Toast"

  @negative @priority-high @REQ-015 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-015] Simpan tidak melewati field error yang belum dikoreksi
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Simpan"
    And user mengisi field "Nama Kapal" dengan "KM Parsial"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "border dan helper error tetap tampil" pada "Voyage"
    And sistem menampilkan "Voyage menjadi posisi scroll" pada "Field Error Pertama"
    And sistem menampilkan "data tidak tersimpan" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-016 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-016] Menutup konfirmasi Batal mempertahankan form
    Given user berada di halaman "Tambah Jadwal"
    When user mengisi field "Nama Kapal" dengan "KM Pertahankan"
    And user mengklik tombol atau link "Batal"
    And user mengklik tombol atau link "Tidak, Kembali"
    Then sistem menampilkan "Tambah Jadwal" pada "Heading"
    And sistem menampilkan "KM Pertahankan" pada "Nama Kapal"

  @negative @priority-high @REQ-017 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-017] Kombinasi jadwal duplikat ditolak
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Nama Kapal" dengan "KM Sama"
    And user mengisi field "Voyage" dengan "DUP-01"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "kombinasi Nama Kapal, Voyage, ETD, dan ETA sudah terdaftar" pada "Alert"
    And sistem menampilkan "tidak menambah duplikat" pada "Tabel Jadwal"

  @negative @priority-high @REQ-018 @screen-edit-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-018] Edit dengan kronologi invalid tidak tersimpan
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    And user mengisi field "Closing Time" dengan "28/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "27/09/2026 10:00"
    And user mengklik tombol atau link "Kirim"
    Then sistem menampilkan "harus lebih besar dari Closing Time" pada "Berangkat (ETD)"
    When user mengklik tombol atau link "Batal"
    Then sistem menampilkan "data existing tidak berubah" pada "Tabel Jadwal"

  @negative @priority-high @REQ-019 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-019] Batal pada konfirmasi hapus mempertahankan jadwal
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "tampil" pada "Dialog Konfirmasi Hapus"
    When user mengklik tombol atau link "Batal Hapus"
    Then sistem menampilkan "jadwal tetap tampil" pada "Tabel Jadwal"

  @negative @priority-medium @REQ-020 @screen-riwayat-perubahan
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-020] Aksi gagal tidak membuat audit perubahan sukses
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "field wajib harus diisi" pada "Helper Error"
    When user membuka halaman "Riwayat Perubahan"
    Then sistem menampilkan "tidak ada entri Tambah Jadwal untuk percobaan gagal" pada "Tabel Riwayat"

  @negative @priority-high @REQ-021 @screen-detail-harga-penawaran-shipper
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-021] Perubahan yang ditolak tidak bocor ke sisi shipper
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Sudah melewati rencana akhir kirim" pada "Alert"
    When user membuka halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "nilai lama tetap tampil" pada "Detail Jadwal Shipper"

  @negative @priority-medium @REQ-022 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-022] Import format invalid mengosongkan field terkait
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Import Jadwal"
    Then sistem menampilkan "kosong" pada "Jenis Jadwal Kapal"
    And sistem menampilkan "kosong" pada "Closing Time"
    And sistem menampilkan "kosong" pada "Berangkat (ETD)"
    And sistem menampilkan "kosong" pada "Tiba (ETA)"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "field wajib harus diisi" pada "Helper Error"

  @negative @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-023] Edit dan hapus ditolak ketika jadwal sudah digunakan order
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Jadwal sudah digunakan pada order" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    And user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Jadwal sudah digunakan pada order" pada "Alert"
    And sistem menampilkan "data tetap tampil" pada "Tabel Jadwal"

  @negative @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-024] Edit ditolak untuk harga N/A
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Harga N/A" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    Then sistem menampilkan "data tidak berubah" pada "Tabel Jadwal"

  @negative @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-025] Hapus ditolak untuk harga kadaluwarsa
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "Tidak Dapat Edit dan Hapus Jadwal – Harga kadaluwarsa" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    Then sistem menampilkan "jadwal tidak terhapus" pada "Tabel Jadwal"

  @negative @priority-high @REQ-005 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-026] Edit dan hapus ditolak untuk harga Tidak Berlaku
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Edit Jadwal"
    Then sistem menampilkan "harga Tidak Berlaku tidak dapat diedit atau dihapus" pada "Alert"
    When user mengklik tombol atau link "Mengerti"
    And user mengklik tombol atau link "Hapus Jadwal"
    Then sistem menampilkan "harga Tidak Berlaku tidak dapat diedit atau dihapus" pada "Alert"
    And sistem menampilkan "data tidak berubah" pada "Tabel Jadwal"

  @negative @priority-high @REQ-013 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-027] Closing Time sebelum mulai berlaku harga ditolak
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Closing Time" dengan "24/09/2026 23:59"
    And user mengisi field "Berangkat (ETD)" dengan "26/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "tidak boleh lebih kecil dari Tanggal Mulai Berlaku" pada "Closing Time"
    And sistem menampilkan "data tidak tersimpan" pada "Tabel Jadwal"

  @negative @priority-high @REQ-013 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-028] Closing Time harus setelah Open Stack
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Direct" pada field "Jenis Jadwal Kapal"
    And user mengisi field "Open Stack" dengan "25/09/2026 10:00"
    And user mengisi field "Closing Time" dengan "25/09/2026 09:59"
    And user mengisi field "Berangkat (ETD)" dengan "26/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "harus lebih besar dari Open Stack" pada "Closing Time"
    And sistem menampilkan "data tidak tersimpan" pada "Tabel Jadwal"

  @negative @priority-high @REQ-014 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-NEG-029] Connecting tidak dapat disimpan dengan baris transit kosong
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Connecting" pada field "Jenis Jadwal Kapal"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "wajib diisi" pada "Pelabuhan Connecting"
    And sistem menampilkan "wajib diisi" pada "Kapal Connecting"
    And sistem menampilkan "wajib diisi" pada "Voyage Connecting"
    And sistem menampilkan "wajib diisi" pada "ETD Connecting"
    And sistem menampilkan "tidak tampil pada satu baris" pada "Hapus Kapal Connecting"

  @edge @priority-medium @REQ-004 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-001] Batas awal tepat pada Tanggal Buka Lelang
    Given user berada di halaman "Tambah Jadwal"
    When user mengisi field "Nama Kapal" dengan "KM Boundary"
    And user mengisi field "Voyage" dengan "BND-OPEN"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @edge @priority-high @REQ-013 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-002] Timestamp sama pada batas kronologi ditolak
    Given user berada di halaman "Tambah Jadwal"
    When user mengisi field "Open Stack" dengan "25/09/2026 10:00"
    And user mengisi field "Closing Time" dengan "25/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "25/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "setiap waktu yang mensyaratkan lebih besar menolak nilai sama" pada "Helper Error"

  @edge @priority-medium @REQ-014 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-003] ETD connecting tepat sama dengan ETA diterima
    Given user berada di halaman "Tambah Jadwal"
    When user memilih "Connecting" pada field "Jenis Jadwal Kapal"
    And user mengisi field "ETD Connecting" dengan "30/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "30/09/2026 10:00"
    And user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"

  @edge @priority-medium @REQ-019 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-004] Hapus satu dari banyak jadwal tidak menurunkan status
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Hapus Jadwal"
    And user mengklik tombol atau link "Konfirmasi Hapus"
    Then sistem menampilkan "satu jadwal aktif tersisa" pada "Tabel Jadwal"
    When user membuka halaman "Daftar Penawaran"
    Then sistem menampilkan "tetap Input Penawaran tanpa badge Belum Input Jadwal" pada "Card Harga"

  @edge @priority-medium @REQ-002 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-005] Tambah lalu hapus baris input Direct mempertahankan baris pertama
    Given user berada di halaman "Tambah Jadwal"
    When user mengklik tombol atau link "Tambah Baris Input"
    Then sistem menampilkan "tampil dengan field kosong" pada "Jadwal 2"
    When user mengklik tombol atau link "Hapus Baris Input 2"
    Then sistem menampilkan "tidak tampil" pada "Jadwal 2"
    And sistem menampilkan "data awal tetap terisi" pada "Jadwal 1"

  @edge @priority-medium @REQ-008 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-006] Setiap kolom sortable menjaga pasangan data baris
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Header Tanggal Buat"
    Then sistem menampilkan "terurut Tanggal Buat" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Nama Kapal"
    Then sistem menampilkan "terurut Nama Kapal" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Voyage"
    Then sistem menampilkan "terurut Voyage" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Open Stack"
    Then sistem menampilkan "terurut Open Stack" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Closing Time"
    Then sistem menampilkan "terurut Closing Time" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Berangkat (ETD)"
    Then sistem menampilkan "terurut ETD" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Header Tiba (ETA)"
    Then sistem menampilkan "terurut ETA tanpa memisahkan pasangan data baris" pada "Tabel Jadwal"

  @edge @priority-medium @REQ-009 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-EDG-007] Filter rentang waktu mencakup nilai batas
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Filter"
    And user mengisi field "Tanggal Buat" dengan "25/09/2026 10:00"
    And user mengisi field "Open Stack" dengan "26/09/2026 10:00"
    And user mengisi field "Closing Time" dengan "27/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "28/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "30/09/2026 10:00"
    And user mengklik tombol atau link "Terapkan"
    Then sistem menampilkan "baris pada seluruh batas filter tampil" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Reset"
    Then sistem menampilkan "seluruh tanggal kosong" pada "Filter Jadwal"

  @stress @priority-low @REQ-002 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-STR-001] Seratus jadwal pada satu harga tetap terikat dan dapat dinavigasi
    Given user berada di halaman "Detail Jadwal"
    Then sistem menampilkan "100 data" pada "Ringkasan Pagination"
    When user mengklik tombol atau link "Halaman Terakhir"
    Then sistem menampilkan "seluruh baris tetap memakai No. Lelang yang sama" pada "Tabel Jadwal"
    And sistem menampilkan "navigasi selesai tanpa error atau duplikasi" pada "Respons UI"

  @stress @priority-low @REQ-014 @screen-tambah-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-STR-002] Lima puluh baris connecting tetap tervalidasi berurutan
    Given user berada di halaman "Tambah Jadwal"
    Then sistem menampilkan "50 baris" pada "Data Kapal Connecting"
    When user mengklik tombol atau link "Simpan"
    Then sistem menampilkan "Jadwal berhasil disimpan" pada "Toast"
    And sistem menampilkan "50x Connecting" pada "Tabel Jadwal"
    When user mengklik tombol atau link "50x Connecting"
    Then sistem menampilkan "50 transit berurutan" pada "Dialog Detail Kapal Connecting"

  @stress @priority-low @REQ-008 @screen-detail-jadwal
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-STR-003] Sorting filtering dan pagination pada seribu jadwal
    Given user berada di halaman "Detail Jadwal"
    When user mengklik tombol atau link "Header Tanggal Buat"
    And user mengklik tombol atau link "Filter"
    And user mengisi field "Nama Kapal" dengan "KM-0999"
    And user mengklik tombol atau link "Terapkan"
    Then sistem menampilkan "hasil benar tanpa baris duplikat" pada "Tabel Jadwal"
    When user mengklik tombol atau link "Reset"
    And user mengklik tombol atau link "Halaman Terakhir"
    Then sistem menampilkan "operasi selesai tanpa timeout" pada "Respons UI"

  @stress @priority-low @REQ-020 @screen-riwayat-perubahan
  Scenario: [AMS006-TAMBAH-JADWAL-VENDOR-STR-004] Audit konsisten untuk aksi paralel beberapa sesi
    Given user berada di halaman "Riwayat Perubahan"
    When user mengklik tombol atau link "Refresh Riwayat"
    Then sistem menampilkan "setiap aksi paralel memiliki entri unik" pada "Tabel Riwayat"
    And sistem menampilkan "user dan timestamp sesuai sesi" pada "Tabel Riwayat"
    And sistem menampilkan "nilai lama dan baru tidak tertukar" pada "Tabel Riwayat"
