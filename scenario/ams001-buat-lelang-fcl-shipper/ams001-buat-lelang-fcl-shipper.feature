Feature: Siklus lelang spot rate FCL dari sisi admin shipper
  Sumber oracle dan asumsi: ams001-buat-lelang-fcl-shipper.analysis.md
  Fixture server, upload, email sink dan beban harus dipasang sebelum eksekusi.

  @positive @priority-high @REQ-001 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-001 — Nomor lelang otomatis sesuai PGR hanya saat submit — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid, vendor V1 dipilih, PGR klien tersedia"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Nomor unik sesuai PGR dibuat dan tersimpan"

  @negative @priority-high @REQ-001 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-001 — Submit tidak valid tidak mengalokasikan nomor final
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Step1 valid; step2 tidak memilih vendor"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Minimal satu vendor error; tidak ada nomor final atau lelang baru"

  @positive @priority-high @REQ-002 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-002 — Order berulang selama rentang kirim — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang Aktif, order O1 sudah ada, penawaran P1 masih valid"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Buat Order menerima data P1; order O2 dapat dibuat dan lelang tetap Aktif"

  @negative @priority-high @REQ-002 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-002 — Order berulang selama rentang kirim — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang melewati Rencana Akhir Kirim"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Order baru ditolak dan penawaran N/A"

  @positive @priority-high @REQ-003 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-003 — Audit seluruh perubahan data — kondisi valid
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka, PIC lama Budi"
    When user mengisi field "PIC Pengirim 1" dengan "Sari"
    And user mengklik elemen "Simpan"
    And user mengklik elemen "Riwayat Perubahan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Audit mencatat PIC Budi menjadi Sari, user dan waktu"

  @negative @priority-high @REQ-003 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-003 — Audit seluruh perubahan data — kondisi terlarang atau pengecualian
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka, PIC wajib dihapus"
    When user mengisi field "PIC Pengirim 1" dengan ""
    And user mengklik elemen "Simpan"
    And user mengklik elemen "Riwayat Perubahan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Perubahan gagal tidak dicatat sebagai perubahan berhasil; data lama tetap"

  @positive @priority-high @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-004 — Status otomatis berdasarkan waktu — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam uji T0, Buka=T0, Tutup=T0+1 jam"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Badge Sedang Buka; penawaran dapat diinput vendor"

  @negative @priority-high @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-004 — Status otomatis berdasarkan waktu — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam uji T0, Buka=T0+1 menit"
    When user mengklik elemen "Lihat Penawaran"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Badge Belum Buka; harga tidak bocor dan pesan Lelang belum dibuka"

  @positive @priority-high @REQ-005 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-005 — Tab dan counter berdasarkan proses aktif — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua lelang ulang aktif, satu selesai, tiga request jadwal, dua draf"
    When user mengklik elemen "Lelang Ulang"
    And user mengklik elemen "Request Jadwal"
    And user mengklik elemen "Draf"
    And user mengklik elemen "Semua Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Counter 2/3/2; tiap tab hanya memuat kelompok yang sesuai"

  @negative @priority-high @REQ-005 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-005 — Tab dan counter berdasarkan proses aktif — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Hanya satu lelang ulang historis tanpa proses aktif"
    When user mengklik elemen "Lelang Ulang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Lelang historis tidak tampil dan counter 0"

  @positive @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-006 — Legend warna dan badge tambahan — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Fixture terpisah request jadwal, nego, lelang ulang, tutup tanpa penawaran/order"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Border sesuai legend; Tidak Ada Penawaran dan Tidak Ada Order sesuai data"

  @negative @priority-high @REQ-006 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-006 — Legend warna dan badge tambahan — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang tutup memiliki penawaran dan order"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Tidak ada badge Tidak Ada Penawaran atau Tidak Ada Order palsu"

  @positive @priority-high @REQ-007 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-007 — Rute normal dan popup multipoint — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Multipoint dengan 2 asal dan 2 tujuan, alamat master berbeda"
    When user mengklik elemen "Multipickup"
    And user mengklik elemen "Tutup popup"
    And user mengklik elemen "Multidrop"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Popup Detail Multipickup/Detail Multidrop memuat kota, drop point, alamat sesuai urutan"

  @negative @priority-high @REQ-007 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-007 — Rute normal dan popup multipoint — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Normal 1 asal 1 tujuan"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Rute Kota Asal ke Kota Tujuan; tidak ada link multipoint palsu"

  @positive @priority-high @REQ-008 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-008 — Kedaluwarsa draf berdasarkan konfigurasi — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Draf kedaluwarsa tanggal D, waktu D 23:59 Asia/Jakarta"
    When user mengklik elemen "Draf"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Draf masih tampil dengan indikator Hari ini"

  @negative @priority-high @REQ-008 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-008 — Kedaluwarsa draf berdasarkan konfigurasi — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Draf kedaluwarsa D, waktu D+1 00:01, job expiry telah berjalan"
    When user mengklik elemen "Draf"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Draf tidak tampil dan tidak dapat dilanjutkan"

  @positive @priority-high @REQ-009 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-009 — Menu aksi sesuai status dan riwayat — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka dan pernah lelang ulang"
    When user mengklik elemen "Menu aksi"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Detail, Edit Data, Tambah Peserta Lelang, Batalkan Lelang, Riwayat Lelang Ulang, Riwayat Perubahan tersedia"

  @negative @priority-high @REQ-009 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-009 — Menu aksi sesuai status dan riwayat — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup dan tidak pernah lelang ulang"
    When user mengklik elemen "Menu aksi"
    And user mengklik elemen "Edit Data"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Edit ditolak dengan alert; Riwayat Lelang Ulang tidak tampil"

  @positive @priority-high @REQ-010 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-010 — Draf hanya dapat dilanjutkan atau dihapus — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Draf Isi Informasi Umum dengan data parsial"
    When user mengklik elemen "Menu aksi"
    And user mengklik elemen "Edit Data"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Form dilanjutkan dengan data parsial; menu hanya Edit Data dan Hapus Draft"

  @negative @priority-high @REQ-010 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-010 — Draf hanya dapat dilanjutkan atau dihapus — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Draf D1 dihapus"
    When user mengklik elemen "Hapus Draft"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Draf D1 hilang dan tidak dapat disubmit dari halaman lama"

  @positive @priority-high @REQ-011 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-011 — Pagination default 20 dan Tampilkan — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "21 lelang dengan ID berbeda"
    When user membuka halaman "Daftar Lelang"
    And user mengklik elemen "Halaman berikutnya"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Halaman awal 20 data, halaman kedua 1; tidak ada duplikasi"

  @negative @priority-high @REQ-011 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-011 — Pagination default 20 dan Tampilkan — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dataset kosong"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Empty state dan navigasi halaman berikutnya tidak menghasilkan data palsu"

  @positive @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-012 — Form dua tahap dan jenis FCL — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form baru"
    When user mengklik elemen "FCL"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Step 01 Informasi Umum aktif, step 02 Peserta Lelang berikutnya, field FCL tampil"

  @negative @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-012 — Form dua tahap dan jenis FCL — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form kosong dengan FCL terpilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tetap step 01; field wajib diberi helper, border error, scroll error pertama"

  @positive @priority-high @REQ-013 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-013 — Batal dengan konfirmasi tanpa simpan — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form berisi perubahan belum disimpan"
    When user mengklik elemen "Batal"
    And user mengklik elemen "Konfirmasi batal"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Kembali ke list tanpa lelang atau draf baru"

  @negative @priority-high @REQ-013 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-013 — Batal dengan konfirmasi tanpa simpan — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dialog konfirmasi Batal terbuka"
    When user mengklik elemen "Lanjut mengisi"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tetap pada form dan input tidak hilang"

  @positive @priority-high @REQ-014 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-014 — Draft step 1 tanpa required — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form hanya Deskripsi Barang terisi"
    When user mengklik elemen "Simpan ke Draft"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Draf Isi Informasi Umum dapat dibuka kembali dengan deskripsi tersimpan"

  @negative @priority-high @REQ-014 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-014 — Draft step 1 tanpa required — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form tidak lengkap"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak lanjut ke step 2 dan tidak membuat lelang final"

  @positive @priority-high @REQ-015 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-015 — Persistensi step 1 ketika kembali — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Step 1 valid, seluruh nilai fixture telah dicatat"
    When user mengklik elemen "Kembali"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Semua nilai step 1 termasuk baris, metode, biaya dan dokumen tetap"

  @negative @priority-high @REQ-015 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-015 — Persistensi step 1 ketika kembali — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Kembali ke step 1 lalu kosongkan Pelabuhan Asal"
    When user mengklik elemen "Kembali"
    And user memilih field "Pelabuhan Asal" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Validasi kembali dijalankan dan step 2 tidak terbuka"

  @positive @priority-high @REQ-016 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-016 — Reuse daftar milik shipper FCL non-draf — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada lelang FCL/FTL/draf milik A dan FCL milik B, login A"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user mengklik elemen "Data Lelang"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya lelang FCL non-draf milik A tersedia tanpa periode"

  @negative @priority-high @REQ-016 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-016 — Reuse daftar milik shipper FCL non-draf — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Checkbox reuse aktif, Data Lelang belum dipilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Data Lelang wajib ditandai error"

  @positive @priority-high @REQ-017 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-017 — Periode reuse maksimal 90 hari — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Reuse aktif; tanggal pembuatan fixture di dalam dan luar periode"
    When user mengisi field "Periode Lelang Dibuat" dengan "01/01/2026 - 31/03/2026"
    And user mengklik elemen "Data Lelang"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Pilihan terfilter tanggal dibuat, rentang 90 hari inklusif diterima"

  @negative @priority-high @REQ-017 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-017 — Periode reuse maksimal 90 hari — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Reuse aktif"
    When user mengisi field "Periode Lelang Dibuat" dengan "01/01/2026 - 01/04/2026"
    And user mengklik elemen "Data Lelang"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Rentang 91 hari ditolak; tidak mengambil hasil di luar batas"

  @positive @priority-high @REQ-018 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-018 — Reuse menyalin data selain lima field waktu — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang sumber 2 pengirim, 2 penerima, biaya dan asuransi lengkap"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user memilih field "Data Lelang" dengan "FCL-SUMBER"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Informasi umum, syarat, semua baris tersalin; Durasi/Buka/Tutup/Awal/Akhir tidak disalin"

  @negative @priority-high @REQ-018 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-018 — Reuse menyalin data selain lima field waktu — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sumber memiliki jadwal lama yang sudah lewat"
    When user mencentang checkbox "Gunakan data lelang yang pernah dibuat"
    And user memilih field "Data Lelang" dengan "FCL-SUMBER"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak dapat lanjut sebelum jadwal baru valid; tanggal sumber tidak menjadi nilai form"

  @positive @priority-high @REQ-019 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-019 — Hasil reuse dapat diubah dan tetap saat uncheck — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Data FCL-SUMBER sudah disalin"
    When user mengisi field "Deskripsi Barang" dengan "Barang revisi"
    And user melepas centang checkbox "Gunakan data lelang yang pernah dibuat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Field periode dan sumber hilang; Barang revisi dan data lain tetap"

  @negative @priority-high @REQ-019 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-019 — Hasil reuse dapat diubah dan tetap saat uncheck — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Reuse sudah di-uncheck dan pilihan sumber tersembunyi"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak muncul error Data Lelang wajib; validasi hanya field form aktif"

  @positive @priority-high @REQ-020 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-020 — Pelabuhan aktif, searchable, asal berbeda tujuan — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master aktif Tanjung Perak dan Panjang; master nonaktif X"
    When user memilih field "Pelabuhan Asal" dengan "Tanjung Perak"
    And user memilih field "Pelabuhan Tujuan" dengan "Panjang"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Dua pelabuhan aktif berbeda diterima"

  @negative @priority-high @REQ-020 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-020 — Pelabuhan aktif, searchable, asal berbeda tujuan — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Field lain valid"
    When user memilih field "Pelabuhan Asal" dengan "Tanjung Perak"
    And user memilih field "Pelabuhan Tujuan" dengan "Tanjung Perak"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Asal sama tujuan ditolak; master nonaktif X tidak tersedia"

  @positive @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-021 — Durasi dari pengaturan dan tutup otomatis — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Pengaturan durasi 60 dan 120 menit; Buka 23/09/2026 10:00"
    When user memilih field "Durasi Lelang" dengan "120 menit"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tutup 23/09/2026 12:00 read-only; pilihan sesuai pengaturan"

  @negative @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-021 — Durasi dari pengaturan dan tutup otomatis — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Durasi belum dipilih, field lain valid"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Durasi wajib error dan Tutup tidak dapat diisi manual"

  @positive @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-022 — Buka lelang tidak lebih kecil dari sekarang — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam dibekukan 23/09/2026 09:00; field lain valid"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 09:01"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tanggal masa depan diterima"

  @negative @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-022 — Buka lelang tidak lebih kecil dari sekarang — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam dibekukan 23/09/2026 09:00"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 08:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Buka masa lalu ditolak tanpa submit"

  @positive @priority-high @REQ-023 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-023 — Rencana awal tidak sebelum tutup — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup 23/09/2026 10:00; field lain valid"
    When user mengisi field "Rencana Awal Kirim" dengan "23/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Awal sama dengan Tutup diterima"

  @negative @priority-high @REQ-023 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-023 — Rencana awal tidak sebelum tutup — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup 23/09/2026 10:00"
    When user mengisi field "Rencana Awal Kirim" dengan "23/09/2026 09:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Awal sebelum Tutup ditolak"

  @positive @priority-high @REQ-024 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-024 — Rencana akhir tidak sebelum awal — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Awal 24/09/2026 10:00; field lain valid"
    When user mengisi field "Rencana Akhir Kirim" dengan "24/09/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Akhir sama dengan Awal diterima"

  @negative @priority-high @REQ-024 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-024 — Rencana akhir tidak sebelum awal — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Awal 24/09/2026 10:00"
    When user mengisi field "Rencana Akhir Kirim" dengan "24/09/2026 09:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Akhir sebelum Awal ditolak"

  @positive @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-025 — Jumlah kontainer opsional minimal satu — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Field lain valid"
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Jumlah 1 diterima"

  @negative @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-025 — Jumlah kontainer opsional minimal satu — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Field lain valid"
    When user mengisi field "Jumlah Kontainer" dengan "0"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Jumlah 0 ditolak"

  @positive @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-026 — Jenis kontainer multi-select master aktif — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master aktif 20 Feet Dry dan 20 Feet HC, nonaktif X"
    When user memilih field "Jenis Kontainer" dengan "20 Feet Dry"
    And user memilih field "Jenis Kontainer" dengan "20 Feet HC"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Dua tag tersimpan, master X tidak tersedia"

  @negative @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-026 — Jenis kontainer multi-select master aktif — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tidak ada jenis kontainer terpilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Minimal satu jenis kontainer wajib"

  @positive @priority-high @REQ-027 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-027 — Metode wajib dan card syarat bersyarat — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum memilih metode"
    When user mengklik elemen "Door to Door"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya satu metode terpilih dan card Syarat & Ketentuan muncul"

  @negative @priority-high @REQ-027 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-027 — Metode wajib dan card syarat bersyarat — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Metode belum dipilih, field lain valid"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Metode wajib error; card syarat belum tampil"

  @positive @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-028 — Asuransi dan rentang nilai barang — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Metode terpilih"
    When user mencentang checkbox "Gunakan Asuransi"
    And user mengisi field "Nilai Barang minimum" dengan "1000000"
    And user mengisi field "Nilai Barang maksimum" dengan "2000000"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai wajib diterima dan diformat ribuan"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-028 — Asuransi dan rentang nilai barang — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asuransi aktif, field lain valid"
    When user mengisi field "Nilai Barang minimum" dengan "2000000"
    And user mengisi field "Nilai Barang maksimum" dengan "1000000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Maksimum kurang dari minimum ditolak"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-029 — Biaya terkunci mengikuti empat metode — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Door to Door dipilih"
    When user mengklik elemen "Door to Door"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "THC dan LOLO kedua sisi serta Trucking kedua sisi tercentang disabled"

  @negative @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-029 — Biaya terkunci mengikuti empat metode — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Door to Door dipilih"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Trucking Asal" dengan kondisi "checked dan disabled"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Trucking wajib tidak dapat di-uncheck dengan keyboard maupun pointer"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-030 — Biaya opsional dan reset saat ganti metode — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Door to Door dengan Buruh Muat dipilih"
    When user mencentang checkbox "Buruh Muat"
    And user mengklik elemen "CY to CY"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya THC/LOLO kedua sisi wajib; pilihan Buruh Muat dan Trucking direset"

  @negative @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-030 — Biaya opsional dan reset saat ganti metode — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "CY to CY dengan Trucking Tujuan tidak dipilih"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak menuntut Trucking Tujuan sebagai biaya wajib"

  @positive @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-031 — Lainnya minimal satu multi-tag — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Metode terpilih"
    When user mencentang checkbox "Lainnya"
    And user mengisi field "Tag biaya lainnya" dengan "Parkir"
    And user mengisi field "Tag biaya lainnya" dengan "Inap"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Dua tag biaya tersimpan"

  @negative @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-031 — Lainnya minimal satu multi-tag — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lainnya dicentang tanpa tag"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Minimal satu tag biaya wajib error"

  @positive @priority-high @REQ-032 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-032 — Biaya shipper diwariskan ke penawaran vendor — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang dengan biaya wajib dan tag Parkir; penawaran vendor sudah masuk"
    When user mengklik elemen "Detail Biaya"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Biaya Termasuk sama dengan konfigurasi shipper"

  @negative @priority-high @REQ-032 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-032 — Biaya shipper diwariskan ke penawaran vendor — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Vendor mencoba mengganti biaya terkunci melalui jalur vendor pada fixture"
    When user mengklik elemen "Detail Biaya"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Perubahan biaya vendor ditolak; biaya shipper tetap menjadi acuan"

  @positive @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-033 — Upload multi-file maksimum 4 MB format terbatas — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "File a.jpg b.jpeg c.png d.pdf masing-masing 1 MiB disiapkan fixture"
    When user mengklik elemen "Dokumen Tambahan"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Keempat file terunggah dan tampil terpisah"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-033 — Upload multi-file maksimum 4 MB format terbatas — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "File x.exe 1 KiB disiapkan fixture"
    When user mengklik elemen "Dokumen Tambahan"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Format exe ditolak dan tidak menjadi lampiran tersimpan"

  @positive @priority-high @REQ-034 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-034 — Hapus dan unduh lampiran — kondisi valid
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dokumen a.pdf sudah disimpan dan hash fixture diketahui"
    When user mengklik elemen "Dokumen Tambahan a.pdf"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "File dapat dilihat/diunduh dengan isi sama fixture"

  @negative @priority-high @REQ-034 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-034 — Hapus dan unduh lampiran — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lampiran b.pdf telah dihapus dari form sebelum submit"
    When user membuka halaman "Detail Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "b.pdf tidak tampil dan tidak dapat diunduh lewat lelang"

  @positive @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-035 — Baris default dan tipe otomatis — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form baru"
    When user mengklik elemen "FCL"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Satu pengirim dan satu penerima, tipe Normal otomatis, tanpa label nomor dan ikon hapus"

  @negative @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-035 — Baris default dan tipe otomatis — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form baru satu baris tiap sisi"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Hapus Pengirim 1" dengan kondisi "tidak tersedia"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Baris terakhir tidak dapat dihapus dan tipe tidak dapat dipilih manual"

  @positive @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-036 — Tambah hapus baris dan renumber — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga pengirim unik A B C dan satu penerima"
    When user mengklik elemen "Hapus Pengirim 2"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tersisa A C sebagai Pick Up 1/2; banner urutan tampil; tipe Multipickup"

  @negative @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-036 — Tambah hapus baris dan renumber — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua pengirim A B, B dihapus"
    When user mengklik elemen "Hapus Pengirim 2"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Kembali satu pengirim tanpa label/ikon; tidak ada data B tersisa"

  @positive @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-037 — Drop point dan pihak saling terkait — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DP-A milik Pengirim A, DP-B milik Pengirim B"
    When user memilih field "Drop Point Asal 1" dengan "DP-A"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Pengirim A dan alamat/PIC master auto terisi"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-037 — Drop point dan pihak saling terkait — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Pengirim B dipilih dahulu"
    When user memilih field "Pengirim 1" dengan "Pengirim B"
    And user mengklik elemen "Drop Point Asal 1"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "DP-A tidak tersedia; hanya drop point milik B pada shipper aktif"

  @positive @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-038 — Alamat master read-only PIC dapat diubah — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DP-A terpilih dengan alamat master lengkap"
    When user mengisi field "PIC Pengirim 1" dengan "Sari"
    And user mengisi field "No. WhatsApp PIC Pengirim 1" dengan "081234567890"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "PIC/WhatsApp dapat diedit; Provinsi/Kota/Kecamatan/Desa/Kode Pos/Alamat read-only"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-038 — Alamat master read-only PIC dapat diubah — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DP-A terpilih"
    When user mengisi field "No. WhatsApp PIC Pengirim 1" dengan "08abc123"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Karakter selain angka ditolak; tidak tersimpan sebagai nomor valid"

  @positive @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-039 — Drop point unik di seluruh lelang — kondisi valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DP-A asal dan DP-B tujuan aktif milik shipper"
    When user memilih field "Drop Point Asal 1" dengan "DP-A"
    And user memilih field "Drop Point Tujuan 1" dengan "DP-B"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Dua drop point unik diterima"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-039 — Drop point unik di seluruh lelang — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DP-A sudah dipilih sebagai asal"
    When user memilih field "Drop Point Tujuan 1" dengan "DP-A"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Duplikasi lintas pengirim/penerima ditolak"

  @positive @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-040 — Vendor aktif FCL filter dan rating — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Vendor aktif FCL V1 rating5 Surabaya, V2 rating4 Malang; nonaktif V3 dan FTL V4"
    When user memilih field "Semua Kota" dengan "Surabaya"
    And user memilih field "Semua Rating" dengan "5"
    And user mengisi field "Cari nama vendor" dengan "V1"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "V1 tampil dengan kota/jumlah menang; default rating menurun"

  @negative @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-040 — Vendor aktif FCL filter dan rating — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Cari vendor tidak ada"
    When user mengisi field "Cari nama vendor" dengan "TIDAK-ADA"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Empty state; tidak menampilkan vendor nonaktif/FTL/hasil stale"

  @positive @priority-high @REQ-041 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-041 — Multi-select counter lintas pagination — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada 30 vendor aktif eligible"
    When user mencentang checkbox "Vendor V1"
    And user mengklik elemen "Halaman berikutnya"
    And user mencentang checkbox "Vendor V21"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Counter 2; kembali halaman pertama V1 tetap terpilih"

  @negative @priority-high @REQ-041 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-041 — Multi-select counter lintas pagination — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 dan V21 terpilih"
    When user melepas centang checkbox "Vendor V21"
    And user mengklik elemen "Halaman sebelumnya"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Counter 1 dan V21 tidak ikut undangan"

  @positive @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-042 — Pilih semua mencakup vendor baru eligible — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Pilih semua aktif, fixture menambahkan vendor baru V31 aktif FCL pengelola vendor setelah simpan"
    When user mengklik elemen "Pilih Semua"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "V31 otomatis menjadi peserta tanpa tambah manual"

  @negative @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-042 — Pilih semua mencakup vendor baru eligible — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Pilih semua aktif; vendor baru nonaktif/FTL/pengelola shipper"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Vendor baru yang tidak eligible tidak otomatis diundang"

  @positive @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-043 — Simpan wajib vendor dan efek sukses — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Step 1 valid, Buka di masa depan, satu V1 aktif dipilih"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Belum Buka, toast sukses, kembali list, email/push V1 dan jadwal live bidding aktif"

  @negative @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-043 — Simpan wajib vendor dan efek sukses — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tidak ada vendor dipilih"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Error minimal satu vendor, tidak ada nomor/notifikasi/jadwal baru"

  @positive @priority-high @REQ-044 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-044 — Draf step 2 substatus peserta — kondisi valid
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Step 1 valid, tidak ada vendor dipilih"
    When user mengklik elemen "Simpan ke Draft"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Draf Isi Peserta Lelang menyimpan data step 1 dan pilihan vendor"

  @negative @priority-high @REQ-044 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-044 — Draf step 2 substatus peserta — kondisi terlarang atau pengecualian
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Draf step 2 belum submit"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Tidak ada undangan atau live bidding untuk draf"

  @positive @priority-high @REQ-045 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-045 — Detail lengkap read-only collapsible — kondisi valid
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang multipoint dengan field opsional kosong"
    When user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Penerima"
    And user mengklik elemen "Peserta Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Section dapat collapse/expand; data sesuai simpan, tipe dan badge benar, kosong ditampilkan -"

  @negative @priority-high @REQ-045 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-045 — Detail lengkap read-only collapsible — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang Selesai"
    When user membuka halaman "Detail Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Semua data read-only dan tombol Edit Data tidak tampil"

  @positive @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-046 — Status peserta dan total penawaran — kondisi valid
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 Belum Input, V2 Input Harga, V3 Input Penawaran"
    When user mengklik elemen "Peserta Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Tabel No/Vendor/Tanggal Terkirim/Tanggal Penawaran/Status; total 1 dari 3 Vendor"

  @negative @priority-high @REQ-046 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-046 — Status peserta dan total penawaran — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V2 baru mengisi harga tanpa jadwal"
    When user mengklik elemen "Peserta Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "V2 tidak dihitung sebagai Input Penawaran; total tetap 1 dari 3"

  @positive @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-047 — Filter cari sorting tabel peserta — kondisi valid
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Vendor bernama berbeda dengan tanggal undangan dan update berbeda"
    When user memilih field "Status peserta" dengan "Input Penawaran"
    And user mengisi field "Cari nama vendor" dengan "V3"
    And user mengklik elemen "Vendor"
    And user mengklik elemen "Tanggal Terkirim"
    And user mengklik elemen "Tanggal Penawaran"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Filter dan pencarian beririsan; kolom mengurut sesuai arah indikator"

  @negative @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-047 — Filter cari sorting tabel peserta — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Cari nama yang tidak cocok filter"
    When user mengisi field "Cari nama vendor" dengan "TIDAK-ADA"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Tabel kosong tanpa mengubah total peserta lelang"

  @positive @priority-high @REQ-048 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-048 — Edit hanya Belum Buka atau Sedang Buka — kondisi valid
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka milik shipper login"
    When user mengisi field "Deskripsi Barang" dengan "Revisi"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Revisi tersimpan, audit lengkap, semua vendor undangan menerima notifikasi perubahan"

  @negative @priority-high @REQ-048 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-048 — Edit hanya Belum Buka atau Sedang Buka — kondisi terlarang atau pengecualian
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Status Tutup, URL edit lama masih terbuka"
    When user mengisi field "Deskripsi Barang" dengan "Revisi ilegal"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Perubahan ditolak server dan tidak ada notifikasi perubahan sukses"

  @positive @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-049 — Edit jenis tipe metode read-only dan baris tetap — kondisi valid
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang Multipickup dengan 2 pengirim, 1 penerima"
    When user mengisi field "PIC Pengirim 1" dengan "Sari"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Isi baris berubah; jenis FCL, tipe Multipickup, metode tetap read-only"

  @negative @priority-high @REQ-049 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-049 — Edit jenis tipe metode read-only dan baris tetap — kondisi terlarang atau pengecualian
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang Multipickup pada edit"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Tambah Baris Input" dengan kondisi "tidak tersedia pada edit sesuai A02"
    And sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Tidak dapat mengubah jumlah baris atau metode; tipe tidak berubah"

  @positive @priority-high @REQ-050 @screen-tambah-peserta
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-050 — Tambah peserta penguncian vendor lama — kondisi valid
    Given user berada di halaman "Tambah Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka; V1 Belum Input, V2 Input Harga, V3 Input Penawaran, V4 baru"
    When user melepas centang checkbox "Vendor V1"
    And user mencentang checkbox "Vendor V4"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "V1 keluar, V4 masuk; counter benar; hanya V1/V4 menerima notifikasi"

  @negative @priority-high @REQ-050 @screen-tambah-peserta
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-050 — Tambah peserta penguncian vendor lama — kondisi terlarang atau pengecualian
    Given user berada di halaman "Tambah Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V2/V3 telah menawar"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Vendor V2" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Vendor V3" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "Vendor yang sudah input harga/penawaran tidak dapat dikeluarkan"

  @positive @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-051 — Tambah peserta dibatasi status — kondisi valid
    Given user berada di halaman "Tambah Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sedang Buka dan V4 belum diundang"
    When user mencentang checkbox "Vendor V4"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "V4 ditambahkan dan menerima undangan; ringkasan read-only"

  @negative @priority-high @REQ-051 @screen-tambah-peserta
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-051 — Tambah peserta dibatasi status — kondisi terlarang atau pengecualian
    Given user berada di halaman "Tambah Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Status berubah Tutup setelah halaman dibuka"
    When user mencentang checkbox "Vendor V4"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "Simpan ditolak dan peserta tidak berubah"

  @positive @priority-high @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-052 — Pembatalan wajib alasan dan tanpa order — kondisi valid
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup tanpa order; modal berisi nomor dan pihak read-only"
    When user mengisi field "Alasan Pembatalan" dengan "Kebutuhan berubah"
    And user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Status Dibatalkan tetap di list dan masuk Riwayat Pembatalan"

  @negative @priority-high @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-052 — Pembatalan wajib alasan dan tanpa order — kondisi terlarang atau pengecualian
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka tanpa order, alasan kosong"
    When user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Error alasan wajib, status tidak berubah"

  @positive @priority-high @REQ-053 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-053 — Pembatalan ditolak jika order sudah ada — kondisi valid
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sedang Buka tanpa order"
    When user mengisi field "Alasan Pembatalan" dengan "Duplikat"
    And user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Pembatalan berhasil dan tercatat"

  @negative @priority-high @REQ-053 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-053 — Pembatalan ditolak jika order sudah ada — kondisi terlarang atau pengecualian
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang mempunyai order O1"
    When user mengisi field "Alasan Pembatalan" dengan "Duplikat"
    And user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Pembatalan ditolak dan order O1 tetap utuh"

  @positive @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-054 — Aksi lelang dibatalkan terkunci — kondisi valid
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dibatalkan dan pernah lelang ulang"
    When user mengklik elemen "Menu aksi"
    And user mengklik elemen "Detail"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Detail dan riwayat dapat diakses"

  @negative @priority-high @REQ-054 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-054 — Aksi lelang dibatalkan terkunci — kondisi terlarang atau pengecualian
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dibatalkan"
    When user mengklik elemen "Menu aksi"
    Then sistem memverifikasi elemen "Edit Data" dengan kondisi "disabled"
    And sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "disabled"
    And sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Semua aksi mutasi terkunci; lelang tidak berubah oleh waktu"

  @positive @priority-high @REQ-055 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-055 — Kerahasiaan harga sebelum tutup — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup dengan penawaran valid"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Harga tampil setelah tutup"

  @negative @priority-high @REQ-055 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-055 — Kerahasiaan harga sebelum tutup — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sedang Buka dengan penawaran sudah tersimpan"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Pesan Lelang sedang dibuka; nilai penawaran tidak terlihat"

  @positive @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-056 — Ranking penawaran enam tingkat — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Fixture ranking berbeda pada efektif, harga, closing, rating, menang dan nama kapal"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Efektif terbaru, harga terendah, closing terdekat, rating tertinggi, menang terbanyak, nama kapal menaik"

  @negative @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-056 — Ranking penawaran enam tingkat — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Penawaran murah efektif lama dibanding mahal efektif baru"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Murah efektif lama tidak mengalahkan efektif terbaru"

  @positive @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-057 — Kartu harga pajak dan detail biaya — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "DPP 1000000, PPN/PPh dan aturan pembulatan dari konfigurasi fixture"
    When user mengklik elemen "Detail Biaya"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Total sesuai kalkulasi konfigurasi; label Termasuk PPN & PPh; rincian pajak, efektif, biaya, deskripsi tampil"

  @negative @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-057 — Kartu harga pajak dan detail biaya — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Konfigurasi fixture menghasilkan pajak bukan nol"
    When user mengklik elemen "Detail Biaya"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Total tidak sekadar DPP dan pajak tidak dihitung dua kali"

  @positive @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-058 — Jadwal kapal connecting dan vendor — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P1 connecting 2 transit dengan pelayaran/vendor/container/harga lengkap"
    When user mengklik elemen "Info Connecting"
    And user mengklik elemen "Detail Kapal"
    And user mengklik elemen "Vendor"
    And user mengklik elemen "Lihat Profil"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Badge 2x Connecting dan urutan pelabuhan/kapal/voyage/ETD/ETA benar; profil vendor sesuai"

  @negative @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-058 — Jadwal kapal connecting dan vendor — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P2 belum memiliki jadwal"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Open/Closing/ETD/ETA -; tab Detail Kapal tidak tampil; Pesan Belum Input Jadwal disabled"

  @positive @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-059 — Pesan hanya harga dan jadwal masih valid — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Aktif, P1 harga aktif, closing dan akhir kirim belum lewat"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Buat Order menerima data lelang dan penawaran P1 otomatis"

  @negative @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-059 — Pesan hanya harga dan jadwal masih valid — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P1 closing time sudah lewat"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "N/A dan alert closing lewat; tidak ada order dibuat"

  @positive @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-060 — Pesan bebas ranking dan notifikasi vendor lain — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P1 dan P2 valid; P2 bukan peringkat1; V1 sudah input harga, V3 belum input"
    When user mengklik elemen "Pesan P2"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Buat Order untuk P2; setelah order, V1 menerima email penawaran belum terpilih, V3 tidak"

  @negative @priority-high @REQ-060 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-060 — Pesan bebas ranking dan notifikasi vendor lain — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P2 harga lama tergantikan harga baru"
    When user mengklik elemen "Pesan P2"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "N/A; harga lama tidak dapat dipesan walaupun pernah berperingkat1"

  @positive @priority-high @REQ-061 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-061 — Nego dan request jadwal integrasi modul — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup dengan penawaran eligible"
    When user mengklik elemen "Ajukan Nego"
    And user membuka halaman "Detail Harga Penawaran"
    And user mengklik elemen "Request Jadwal"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Masuk modul terkait membawa ID lelang/penawaran; setelah proses aktif warna list sesuai"

  @negative @priority-high @REQ-061 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-061 — Nego dan request jadwal integrasi modul — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Selesai atau Dibatalkan"
    When user mengklik elemen "Ajukan Nego"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Aksi tidak berjalan dan alert sesuai status; tidak membuat nego baru"

  @positive @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-062 — Lelang ulang eligibility dan nomor tetap — kondisi valid
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup, belum akhir kirim, tidak ada lelang ulang aktif, nomor FCL-A"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Lelang ulang memakai FCL-A tanpa nomor baru"

  @negative @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-062 — Lelang ulang eligibility dan nomor tetap — kondisi terlarang atau pengecualian
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang ulang lain sedang berjalan"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Permintaan lelang ulang kedua ditolak"

  @positive @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-063 — Lelang ulang data read-only dan jadwal wajib — kondisi valid
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asuransi aktif, akhir kirim 30/09/2026 10:00; jam 23/09/2026 09:00"
    When user memilih field "Durasi Lelang" dengan "60 menit"
    And user mengisi field "Buka Lelang" dengan "23/09/2026 10:00"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tutup 11:00 read-only; Nilai Barang tampil; pengirim/penerima default collapsed dan info statis tampil"

  @negative @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-063 — Lelang ulang data read-only dan jadwal wajib — kondisi terlarang atau pengecualian
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam 23/09/2026 09:00"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 08:59"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Buka masa lalu ditolak"

  @positive @priority-high @REQ-064 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-064 — Tutup lelang ulang tidak lewat akhir kirim — kondisi valid
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Akhir kirim 24/09/2026 10:00, durasi60 menit"
    When user mengisi field "Buka Lelang" dengan "24/09/2026 09:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tutup sama akhir kirim diterima"

  @negative @priority-high @REQ-064 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-064 — Tutup lelang ulang tidak lewat akhir kirim — kondisi terlarang atau pengecualian
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Akhir kirim 24/09/2026 10:00, durasi60 menit"
    When user mengisi field "Buka Lelang" dengan "24/09/2026 09:01"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tutup lewat akhir kirim ditolak"

  @positive @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-065 — Peserta lelang ulang lama terkunci baru opsional — kondisi valid
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 Input Harga, V2 Input Penawaran, V3 Belum Input, tanpa vendor baru"
    When user melepas centang checkbox "Vendor V3"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "V1/V2 tetap ikut; boleh tanpa vendor baru, counter vendor baru 0"

  @negative @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-065 — Peserta lelang ulang lama terkunci baru opsional — kondisi terlarang atau pengecualian
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 Input Harga dan V2 Input Penawaran"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Vendor V1" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Vendor V2" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak dapat menghapus vendor yang sudah menawar"

  @positive @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-066 — Efek simpan lelang ulang dan riwayat — kondisi valid
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jadwal valid buka masa depan, vendor V1/V2 dipilih"
    When user mengklik elemen "Simpan"
    And user membuka halaman "Daftar Lelang"
    And user mengklik elemen "Riwayat Lelang Ulang"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Belum Buka, tab/counter/warna lelang ulang aktif; email/push ke semua peserta; riwayat tanggal/vendor/user/waktu"

  @negative @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-066 — Efek simpan lelang ulang dan riwayat — kondisi terlarang atau pengecualian
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form lelang ulang tidak valid"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak ada riwayat sukses, notifikasi, atau penanda proses palsu"

  @positive @priority-high @REQ-067 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-067 — Expired harga lama hanya ketika vendor update — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang ulang tutup, V1 harga baru, V2 tidak update"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Harga lama V1 Expired; harga baru V1 dan harga lama V2 masih aktif"

  @negative @priority-high @REQ-067 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-067 — Expired harga lama hanya ketika vendor update — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Harga lama V1 Expired dipilih"
    When user mengklik elemen "Pesan harga lama V1"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Order ditolak dengan label Expired; harga lama V2 tidak ikut expired"

  @positive @priority-high @REQ-068 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-068 — Lelang ulang berjalan menyembunyikan baru mengunci lama — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang ulang sedang berjalan dengan harga baru dan lama"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "State proses lelang ulang dan countdown; harga baru tersembunyi"

  @negative @priority-high @REQ-068 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-068 — Lelang ulang berjalan menyembunyikan baru mengunci lama — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Harga lama sebelumnya eligible"
    When user mengklik elemen "Pesan"
    And user mengklik elemen "Ajukan Nego"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Order dan nego ditolak selama proses lelang ulang"

  @positive @priority-high @REQ-069 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-069 — Akhir lelang ulang menggabungkan harga aktif — kondisi valid
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam melewati tutup ulang; V1 update, V2 tidak update"
    When user membuka halaman "Detail Harga Penawaran"
    And user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Harga aktif baru V1 dan lama V2 tampil; Tutup/Aktif; keluar tab lelang ulang"

  @negative @priority-high @REQ-069 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-069 — Akhir lelang ulang menggabungkan harga aktif — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Harga lama V1 sudah tergantikan"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Harga expired tidak tampil sebagai harga aktif atau dapat dipesan"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-070 — Filter list dari desain dan reset — kondisi valid
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dataset berbeda nomor/jenis/tipe/status/rute/periode/badge"
    When user mengisi field "No. Lelang" dengan "FCL-A"
    And user memilih field "Jenis Pengiriman" dengan "FCL"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya FCL-A sesuai filter tampil"

  @negative @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-070 — Filter list dari desain dan reset — kondisi terlarang atau pengecualian
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Filter tidak punya kecocokan"
    When user mengisi field "No. Lelang" dengan "TIDAK-ADA"
    And user mengklik elemen "Terapkan"
    And user mengklik elemen "Filter"
    And user mengklik elemen "Reset"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hasil awal kosong; setelah reset seluruh data kembali"

  @positive @priority-high @REQ-071 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-071 — Otorisasi shipper dan isolasi klien — kondisi valid
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Admin shipper A membuka lelang milik A"
    When user membuka halaman "Detail Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Data A terbaca sesuai hak akses"

  @negative @priority-high @REQ-071 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-071 — Otorisasi shipper dan isolasi klien — kondisi terlarang atau pengecualian
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Admin shipper B mengakses ID milik A melalui URL langsung"
    When user membuka halaman "Detail Lelang milik A"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Akses ditolak tanpa bocor detail, dokumen, peserta, atau harga"

  @negative @priority-high @REQ-020 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-072 — Pelabuhan Asal kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Pelabuhan Asal"
    When user memilih field "Pelabuhan Asal" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Pelabuhan Asal; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-020 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-073 — Pelabuhan Tujuan kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Pelabuhan Tujuan"
    When user memilih field "Pelabuhan Tujuan" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Pelabuhan Tujuan; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-074 — Durasi Lelang kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Durasi Lelang"
    When user memilih field "Durasi Lelang" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Durasi Lelang; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-075 — Buka Lelang kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Buka Lelang"
    When user mengisi field "Buka Lelang" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Buka Lelang; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-023 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-076 — Rencana Awal Kirim kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Rencana Awal Kirim"
    When user mengisi field "Rencana Awal Kirim" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Rencana Awal Kirim; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-024 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-077 — Rencana Akhir Kirim kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Rencana Akhir Kirim"
    When user mengisi field "Rencana Akhir Kirim" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Rencana Akhir Kirim; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-078 — Jenis Kontainer kosong pada form valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya Jenis Kontainer"
    When user memilih field "Jenis Kontainer" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Helper wajib dan border error pada Jenis Kontainer; scroll ke field tersebut, tidak lanjut ke peserta"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-079 — Drop Point Asal 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user memilih field "Drop Point Asal 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Drop Point Asal 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-080 — Pengirim 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user memilih field "Pengirim 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Pengirim 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-081 — PIC Pengirim 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user mengisi field "PIC Pengirim 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "PIC Pengirim 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-082 — No. WhatsApp PIC Pengirim 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user mengisi field "No. WhatsApp PIC Pengirim 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "No. WhatsApp PIC Pengirim 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-083 — Drop Point Tujuan 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user memilih field "Drop Point Tujuan 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Drop Point Tujuan 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-084 — Penerima 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user memilih field "Penerima 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Penerima 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-085 — PIC Penerima 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user mengisi field "PIC Penerima 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "PIC Penerima 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-086 — No. WhatsApp PIC Penerima 1 wajib pada setiap baris
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid; kosongkan hanya field target"
    When user mengisi field "No. WhatsApp PIC Penerima 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "No. WhatsApp PIC Penerima 1 error required; master auto draft tidak menghilangkan validasi ketika nilai kosong"

  @negative @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-087 — Jumlah kontainer menolak bilangan negatif
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengisi field "Jumlah Kontainer" dengan "-1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak lanjut; jumlah harus bilangan bulat ≥1 sesuai A07"

  @negative @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-088 — Jumlah kontainer menolak pecahan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengisi field "Jumlah Kontainer" dengan "1.5"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak lanjut; jumlah harus bilangan bulat ≥1 sesuai A07"

  @negative @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-089 — Jumlah kontainer menolak huruf
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengisi field "Jumlah Kontainer" dengan "dua"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak lanjut; jumlah harus bilangan bulat ≥1 sesuai A07"

  @edge @priority-high @REQ-025 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-001 — Jumlah kontainer kosong tetap valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengisi field "Jumlah Kontainer" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Lanjut peserta tanpa error jumlah kontainer"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-090 — Nilai Barang minimum kosong saat asuransi aktif
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dan asuransi aktif; nilai sisi lain 1000000"
    When user mengisi field "Nilai Barang minimum" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai Barang minimum wajib error"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-091 — Nilai Barang maksimum kosong saat asuransi aktif
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dan asuransi aktif; nilai sisi lain 1000000"
    When user mengisi field "Nilai Barang maksimum" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai Barang maksimum wajib error"

  @edge @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-002 — Nilai barang minimum sama maksimum
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asuransi aktif"
    When user mengisi field "Nilai Barang minimum" dengan "1000000"
    And user mengisi field "Nilai Barang maksimum" dengan "1000000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai sama diterima dan format ribuan tidak mengubah angka"

  @positive @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-072 — Asuransi dilepas menyembunyikan nilai
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asuransi aktif dengan dua nilai kosong"
    When user melepas centang checkbox "Gunakan Asuransi"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai Barang tersembunyi; tidak ada required tersembunyi; lanjut peserta"

  @negative @priority-high @REQ-028 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-092 — Nilai barang tidak numerik
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asuransi aktif"
    When user mengisi field "Nilai Barang minimum" dengan "abc"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai nonnumerik ditolak"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-073 — Matriks biaya Door to Door
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengklik elemen "Door to Door"
    Then sistem memverifikasi elemen "THC Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "THC Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Trucking Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Trucking Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Semua biaya wajib tepat sesuai metode; biaya nonwajib dapat diubah"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-074 — Door to Door menerima biaya opsional Buruh Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to Door"
    When user mencentang checkbox "Buruh Muat"
    And user melepas centang checkbox "Buruh Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-075 — Door to Door menerima biaya opsional Buruh Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to Door"
    When user mencentang checkbox "Buruh Bongkar"
    And user melepas centang checkbox "Buruh Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-076 — Door to Door menerima biaya opsional Kawalan Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to Door"
    When user mencentang checkbox "Kawalan Muat"
    And user melepas centang checkbox "Kawalan Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-077 — Door to Door menerima biaya opsional Kawalan Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to Door"
    When user mencentang checkbox "Kawalan Bongkar"
    And user melepas centang checkbox "Kawalan Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-078 — Matriks biaya Door to CY
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengklik elemen "Door to CY"
    Then sistem memverifikasi elemen "THC Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "THC Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Trucking Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Semua biaya wajib tepat sesuai metode; biaya nonwajib dapat diubah"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-079 — Door to CY menerima biaya opsional Trucking Tujuan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to CY"
    When user mencentang checkbox "Trucking Tujuan"
    And user melepas centang checkbox "Trucking Tujuan"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-080 — Door to CY menerima biaya opsional Buruh Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to CY"
    When user mencentang checkbox "Buruh Muat"
    And user melepas centang checkbox "Buruh Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-081 — Door to CY menerima biaya opsional Buruh Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to CY"
    When user mencentang checkbox "Buruh Bongkar"
    And user melepas centang checkbox "Buruh Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-082 — Door to CY menerima biaya opsional Kawalan Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to CY"
    When user mencentang checkbox "Kawalan Muat"
    And user melepas centang checkbox "Kawalan Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-083 — Door to CY menerima biaya opsional Kawalan Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan Door to CY"
    When user mencentang checkbox "Kawalan Bongkar"
    And user melepas centang checkbox "Kawalan Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-084 — Matriks biaya CY to Door
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengklik elemen "CY to Door"
    Then sistem memverifikasi elemen "THC Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "THC Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Trucking Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Semua biaya wajib tepat sesuai metode; biaya nonwajib dapat diubah"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-085 — CY to Door menerima biaya opsional Trucking Asal
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to Door"
    When user mencentang checkbox "Trucking Asal"
    And user melepas centang checkbox "Trucking Asal"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-086 — CY to Door menerima biaya opsional Buruh Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to Door"
    When user mencentang checkbox "Buruh Muat"
    And user melepas centang checkbox "Buruh Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-087 — CY to Door menerima biaya opsional Buruh Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to Door"
    When user mencentang checkbox "Buruh Bongkar"
    And user melepas centang checkbox "Buruh Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-088 — CY to Door menerima biaya opsional Kawalan Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to Door"
    When user mencentang checkbox "Kawalan Muat"
    And user melepas centang checkbox "Kawalan Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-089 — CY to Door menerima biaya opsional Kawalan Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to Door"
    When user mencentang checkbox "Kawalan Bongkar"
    And user melepas centang checkbox "Kawalan Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-029 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-090 — Matriks biaya CY to CY
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mengklik elemen "CY to CY"
    Then sistem memverifikasi elemen "THC Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "THC Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Asal" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "LOLO Tujuan" dengan kondisi "checked disabled"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Semua biaya wajib tepat sesuai metode; biaya nonwajib dapat diubah"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-091 — CY to CY menerima biaya opsional Trucking Asal
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Trucking Asal"
    And user melepas centang checkbox "Trucking Asal"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-092 — CY to CY menerima biaya opsional Trucking Tujuan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Trucking Tujuan"
    And user melepas centang checkbox "Trucking Tujuan"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-093 — CY to CY menerima biaya opsional Buruh Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Buruh Muat"
    And user melepas centang checkbox "Buruh Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-094 — CY to CY menerima biaya opsional Buruh Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Buruh Bongkar"
    And user melepas centang checkbox "Buruh Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-095 — CY to CY menerima biaya opsional Kawalan Muat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Kawalan Muat"
    And user melepas centang checkbox "Kawalan Muat"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @positive @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-096 — CY to CY menerima biaya opsional Kawalan Bongkar
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan CY to CY"
    When user mencentang checkbox "Kawalan Bongkar"
    And user melepas centang checkbox "Kawalan Bongkar"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Biaya opsional dapat dicentang dan dilepas tanpa mengubah lock wajib"

  @negative @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-093 — Hapus tag biaya terakhir saat Lainnya aktif
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lainnya aktif dan hanya tag Parkir"
    When user mengisi field "Tag biaya lainnya" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Minimal satu tag error; tidak submit"

  @edge @priority-high @REQ-031 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-003 — Tag biaya Unicode dan tanda baca
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid"
    When user mencentang checkbox "Lainnya"
    And user mengisi field "Tag biaya lainnya" dengan "Biaya gudang — Jakarta & Surabaya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tag Unicode utuh saat detail; tidak merusak format atau menjalankan HTML"

  @edge @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-004 — Upload PDF 4MiB kurang satu byte
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "File valid batas.pdf tersedia melalui fixture upload"
    When user mengklik elemen "Pilih File"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Diterima; file lain tidak hilang"

  @edge @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-005 — Upload PDF tepat 4MiB
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "File valid batas.pdf tersedia melalui fixture upload"
    When user mengklik elemen "Pilih File"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Diterima; file lain tidak hilang"

  @negative @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-094 — Upload PDF 4MiB lebih satu byte
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "File valid batas.pdf tersedia melalui fixture upload"
    When user mengklik elemen "Pilih File"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Ditolak karena batas per file; file lain tidak hilang"

  @edge @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-006 — Total banyak file lebih dari 4MiB tetap valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga PDF valid, masing-masing 3MiB"
    When user mengklik elemen "Pilih File"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Ketiganya diterima; batas berlaku per file bukan total"

  @positive @priority-high @REQ-034 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-097 — Hapus satu lampiran mempertahankan lainnya
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "a.pdf dan b.pdf sudah diunggah"
    When user mengklik elemen "Hapus dokumen a.pdf"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya b.pdf dipertahankan dan dapat diunduh setelah submit"

  @positive @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-098 — Tipe otomatis Multipickup
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form awal 1+1; hook mengisi tiap baris tambahan dengan drop point unik"
    When user mengklik elemen "Tambah Baris Input Pengirim"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tipe Multipickup; label Pick Up/Drop Off sesuai jumlah, hanya sisi >1 memiliki ikon hapus"

  @positive @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-099 — Tipe otomatis Multidrop
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form awal 1+1; hook mengisi tiap baris tambahan dengan drop point unik"
    When user mengklik elemen "Tambah Baris Input Penerima"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tipe Multidrop; label Pick Up/Drop Off sesuai jumlah, hanya sisi >1 memiliki ikon hapus"

  @positive @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-100 — Tipe otomatis Multipoint
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form awal 1+1; hook mengisi tiap baris tambahan dengan drop point unik"
    When user mengklik elemen "Tambah Baris Input Pengirim"
    And user mengklik elemen "Tambah Baris Input Penerima"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tipe Multipoint; label Pick Up/Drop Off sesuai jumlah, hanya sisi >1 memiliki ikon hapus"

  @edge @priority-high @REQ-036 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-007 — Hapus penerima tengah melakukan renumber
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga penerima DP-B DP-C DP-D"
    When user mengklik elemen "Hapus Penerima 2"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "DP-B/DP-D tetap urutan semula menjadi Drop Off 1/2"

  @positive @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-101 — Pilih penerima dahulu memfilter tujuan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master Penerima B memiliki DP-B dan DP-D"
    When user memilih field "Penerima 1" dengan "Penerima B"
    And user mengklik elemen "Drop Point Tujuan 1"
    And user memilih field "Drop Point Tujuan 1" dengan "DP-D"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya DP-B/DP-D dapat dipilih; PIC/WA/alamat mengikuti DP-D"

  @edge @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-008 — Ganti drop point memperbarui seluruh auto draft
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Asal DP-A sudah terisi"
    When user memilih field "Drop Point Asal 1" dengan "DP-C"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Pihak, PIC, WA dan enam field alamat berganti ke master DP-C, tidak bercampur data A"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-095 — Drop point duplikat pada sesama Pengirim
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua baris Pengirim, baris1 DP-A"
    When user memilih field "Drop Point Asal 2" dengan "DP-A"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Duplikasi ditolak sebelum lanjut"

  @negative @priority-high @REQ-039 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-096 — Drop point duplikat pada sesama Penerima
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua baris Penerima, baris1 DP-A"
    When user memilih field "Drop Point Tujuan 2" dengan "DP-A"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Duplikasi ditolak sebelum lanjut"

  @edge @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-009 — WhatsApp mempertahankan nol awal
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master valid"
    When user mengisi field "No. WhatsApp PIC Penerima 1" dengan "081234567890"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nol awal tetap tersimpan sebagai teks angka"

  @edge @priority-high @REQ-022 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-010 — Buka sama sekarang diterima
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam tepat 23/09/2026 09:00"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 09:00"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Buka sama sekarang diterima"

  @edge @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-011 — Tutup 24/09/2026 01:30
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Durasi120 menit"
    When user mengisi field "Buka Lelang" dengan "23/09/2026 23:30"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tutup 24/09/2026 01:30"

  @edge @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-012 — Tutup 01/01/2027 00:30
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Durasi60 menit"
    When user mengisi field "Buka Lelang" dengan "31/12/2026 23:30"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tutup 01/01/2027 00:30"

  @edge @priority-high @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-013 — Boundary status tepat tutup
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam server T0; Buka T0-1 jam, Tutup T0, Akhir T0+1 hari"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Tidak lagi Sedang Buka; input vendor ditolak dan harga sudah dapat dilihat"

  @edge @priority-high @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-014 — Boundary status tepat akhir kirim
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam server T0; Akhir T0, harga aktif, closing T0+1 jam"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Belum Selesai; order masih diizinkan menurut A01"

  @edge @priority-high @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-015 — Boundary status sesudah akhir kirim
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam server T0; Akhir T0-1 detik"
    When user membuka halaman "Daftar Lelang"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Selesai; semua Pesan N/A"

  @negative @priority-high @REQ-017 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-097 — Periode reuse terbalik
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Reuse aktif"
    When user mengisi field "Periode Lelang Dibuat" dengan "31/03/2026 - 01/01/2026"
    And user mengklik elemen "Data Lelang"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tanggal akhir sebelum awal ditolak"

  @edge @priority-high @REQ-018 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-016 — Reuse sumber tanpa asuransi dan lampiran
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form sebelumnya asuransi aktif dan lampiran A; sumber tanpa asuransi/lampiran"
    When user memilih field "Data Lelang" dengan "FCL-TANPA-OPSIONAL"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Nilai opsional mengikuti sumber; tidak ada asuransi/lampiran stale dari pilihan sebelumnya"

  @edge @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-017 — Pilih Semua saat filter aktif
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "30 vendor eligible lintas kota; filter hanya 5"
    When user memilih field "Semua Kota" dengan "Surabaya"
    And user mengklik elemen "Pilih Semua"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Counter 30 sesuai A05, tidak hanya 5 atau halaman aktif"

  @edge @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-018 — Submit tepat waktu buka
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Jam dibekukan sama Buka dan V1 dipilih"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Status Sedang Buka, nomor unik, email/push dan live bidding satu kali"

  @negative @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-098 — Vendor menjadi nonaktif sebelum submit
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 satu-satunya pilihan; fixture menonaktifkan V1 setelah dipilih"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Submit menolak vendor stale; tidak mengundang vendor nonaktif"

  @negative @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-099 — Gagal simpan akibat jaringan
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Data valid; hook memutus request simpan sebelum server commit"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Error dapat dipahami; form dan vendor tetap; tidak ada nomor/undangan sukses"

  @positive @priority-high @REQ-048 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-102 — Edit Sedang Buka mempertahankan Buka lama
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sedang Buka, Buka kemarin tetap; waktu lain valid"
    When user mengisi field "Deskripsi Barang" dengan "Revisi saat buka"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Edit berhasil sesuai A14, waktu buka tidak dipaksa menjadi masa depan"

  @negative @priority-high @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-100 — Batal ditolak pada Aktif tanpa order
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Aktif tanpa order; A03"
    When user mengisi field "Alasan Pembatalan" dengan "Uji status"
    And user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Status tetap; aturan khusus menolak pembatalan"

  @negative @priority-high @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-101 — Batal ditolak pada Selesai tanpa order
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Selesai tanpa order; A03"
    When user mengisi field "Alasan Pembatalan" dengan "Uji status"
    And user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Status tetap; aturan khusus menolak pembatalan"

  @edge @priority-high @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-019 — Tutup modal batal tanpa mutasi
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Modal terbuka dengan alasan terisi"
    When user mengklik elemen "Tutup popup"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Modal tertutup; status dan audit tidak berubah"

  @edge @priority-high @REQ-055 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-020 — Tutup tanpa penawaran
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tutup, vendor diundang tetapi belum input"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Empty state Belum ada penawaran kali ini; tidak ada kartu harga palsu"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-021 — Ranking tie-break efektif
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "P1 efektif25 harga200; P2 efektif24 harga100"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P1,P2"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-022 — Ranking tie-break harga
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Efektif sama; P1 harga200; P2 harga100"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P2,P1"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-023 — Ranking tie-break closing
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Efektif/harga sama; P1 closing12; P2 closing11"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P2,P1"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-024 — Ranking tie-break rating
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Efektif/harga/closing sama; P1 rating4; P2 rating5"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P2,P1"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-025 — Ranking tie-break menang
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Efektif/harga/closing/rating sama; P1 menang5; P2 menang7"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P2,P1"

  @edge @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-026 — Ranking tie-break nama kapal
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lima kunci sama; P1 kapal Bima; P2 kapal Arjuna"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan P2,P1"

  @positive @priority-high @REQ-058 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-103 — Jadwal kapal langsung
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Penawaran kapal langsung lengkap"
    When user mengklik elemen "Detail Kapal"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Nama kapal dan voyage sesuai; ikon kapal tampil dan Info Connecting tidak tampil"

  @edge @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-027 — Pesan pada batas closing time
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Closing tepat T0, akhir kirim besok, jam T0"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Sesuai arti belum lewat: tepat closing diterima sementara; clock presisi server harus disamakan"

  @negative @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-102 — Lelang ulang ditolak pada Belum Buka
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka, tidak ada proses ulang lain"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak membuat proses ulang atau mengubah nomor/status"

  @negative @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-103 — Lelang ulang ditolak pada Sedang Buka
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sedang Buka, tidak ada proses ulang lain"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak membuat proses ulang atau mengubah nomor/status"

  @negative @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-104 — Lelang ulang ditolak pada Selesai
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Selesai, tidak ada proses ulang lain"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak membuat proses ulang atau mengubah nomor/status"

  @negative @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-105 — Lelang ulang ditolak pada Dibatalkan
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dibatalkan, tidak ada proses ulang lain"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak membuat proses ulang atau mengubah nomor/status"

  @positive @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-104 — Ulang tanpa asuransi menyembunyikan Nilai Barang
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang sumber tidak menggunakan asuransi"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Nilai Barang minimum" dengan kondisi "tidak tampil"
    And sistem memverifikasi elemen "Nilai Barang maksimum" dengan kondisi "tidak tampil"
    And sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Tidak ada field nilai barang atau validasi required tersembunyi"

  @positive @priority-high @REQ-065 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-105 — Ulang menambah vendor baru dan counter khusus
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1/V2 peserta lama, V4 baru"
    When user mencentang checkbox "Vendor V4"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Counter 1 vendor baru diundang; total peserta3 dan V1/V2 tetap terkunci"

  @edge @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-028 — Ulang buka tepat sekarang
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form ulang valid; Buka sama jam server"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Status Sedang Buka dan countdown aktif, riwayat/email/push sekali"

  @negative @priority-high @REQ-071 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-106 — Sesi kedaluwarsa saat submit
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Sesi habis setelah form valid terisi"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Diminta autentikasi; tidak ada lelang berhasil tanpa sesi sah"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-106 — Filter list Tipe Pengiriman
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Tipe Pengiriman" dengan "Multipoint"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Tipe Pengiriman Multipoint tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-107 — Filter list Status
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Status" dengan "Aktif"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Status Aktif tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-108 — Filter list Kota Asal
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Kota Asal" dengan "Surabaya"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Kota Asal Surabaya tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-109 — Filter list Kota Tujuan
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Kota Tujuan" dengan "Balikpapan"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Kota Tujuan Balikpapan tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-110 — Filter list Pelabuhan Asal
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Pelabuhan Asal" dengan "Tanjung Perak"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Pelabuhan Asal Tanjung Perak tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-111 — Filter list Pelabuhan Tujuan
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada fixture cocok dan tidak cocok"
    When user memilih field "Pelabuhan Tujuan" dengan "Panjang"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai Pelabuhan Tujuan Panjang tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-112 — Filter badge Tidak Ada Order
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada lelang dengan dan tanpa kondisi tersebut"
    When user mencentang checkbox "Tidak Ada Order"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai kondisi checkbox tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-113 — Filter badge Tidak Ada Penawaran
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada lelang dengan dan tanpa kondisi tersebut"
    When user mencentang checkbox "Tidak Ada Penawaran"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai kondisi checkbox tampil"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-114 — Filter badge Lelang Ulang
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Ada lelang dengan dan tanpa kondisi tersebut"
    When user mencentang checkbox "Lelang Ulang"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya data sesuai kondisi checkbox tampil"

  @positive @priority-high @REQ-011 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-115 — Ubah Tampilkan dan navigasi ujung
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Data 55 lelang"
    When user memilih field "Tampilkan" dengan "50"
    And user mengklik elemen "Halaman terakhir"
    And user mengklik elemen "Halaman pertama"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Awal50, terakhir5, kembali pertama50 tanpa duplikasi"

  @positive @priority-high @REQ-061 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-116 — Riwayat Pembatalan membuka modul terkait
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Lelang dibatalkan tersedia"
    When user mengklik elemen "Riwayat Pembatalan"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Halaman riwayat pembatalan terbuka membawa konteks shipper"

  @positive @priority-high @REQ-057 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-117 — Filter harga penawaran dari desain
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Penawaran berbeda vendor/pelayaran/container/jadwal"
    When user mengklik elemen "Filter"
    And user memilih field "Pelayaran" dengan "Meratus"
    And user memilih field "Vendor filter" dengan "V1"
    And user memilih field "Jenis Kontainer" dengan "20 Feet Dry"
    And user mengisi field "ETD" dengan "25/09/2026"
    And user mengisi field "ETA" dengan "27/09/2026"
    And user memilih field "Jenis Jadwal" dengan "Langsung"
    And user mengklik elemen "Terapkan"
    And user mengklik elemen "Reset"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Filter menampilkan kecocokan; reset memulihkan daftar"

  @positive @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-118 — Kontrol Urutan harga penawaran
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Daftar penawaran tersedia"
    When user mengklik elemen "Urutan"
    And user memilih field "Urutan penawaran" dengan "Harga terendah"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Urutan harga sesuai pilihan eksplisit tanpa mengubah default ketika reset"

  @stress @priority-high @REQ-001 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-001 — Submit paralel dan nomor unik
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "100 sesi dengan requestId berbeda"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "100 lelang unik, tidak ada nomor bentrok, tepat satu set undangan per lelang"

  @stress @priority-high @REQ-043 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-002 — Retry setelah respons simpan hilang
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Commit sukses tetapi respons pertama diputus; retry requestId sama"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Hanya satu lelang dan satu set undangan; UI dapat pulih"

  @stress @priority-high @REQ-035 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-003 — Volume baris tanpa batas buatan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "500 pengirim dan 500 penerima dengan DP unik"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "1000 baris tersimpan berurutan; tidak ada truncation atau maksimum bisnis buatan"

  @stress @priority-high @REQ-040 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-004 — Pencarian vendor pada master besar
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "10000 vendor, query cepat dengan respons diacak"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengisi field "Cari nama vendor" dengan "V9999"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Hasil hanya query terakhir; tidak bocor vendor noneligible"

  @stress @priority-high @REQ-041 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-005 — Seleksi banyak halaman
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "1000 vendor dipilih lalu 100 dilepas lintas50 halaman"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Pilih Semua"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Counter900 dan peserta tersimpan tepat900 sesuai fixture"

  @stress @priority-high @REQ-033 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-006 — Upload banyak lampiran valid
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "100 PDF 1MiB, hook upload paralel"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Pilih File"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak korup atau kehilangan file diam-diam; kegagalan infrastruktur jelas dan dapat dicoba ulang"

  @stress @priority-high @REQ-003 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-007 — Edit paralel audit
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "20 admin berizin edit PIC pada lelang yang sama"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Setiap commit berhasil punya audit lama/baru/user/waktu; konflik ditolak atau diserialisasi tanpa audit hilang"

  @stress @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-008 — Balapan dua lelang ulang
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua sesi klik Simpan ulang pada lelang yang sama bersamaan"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Hanya satu proses ulang aktif dan satu siklus riwayat"

  @stress @priority-high @REQ-053 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-009 — Balapan order dengan pembatalan
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Order dan batal pada lelang eligible bersamaan"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Batalkan Order"
    Then sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Jika order menang batal ditolak; jika batal menang order ditolak; tidak ada order pada lelang dibatalkan"

  @stress @priority-high @REQ-059 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-010 — Balapan order dengan akhir kirim
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "50 request sekitar Akhir T0±1 detik"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Tidak ada order dengan waktu validasi sesudah akhir; yang sah tetap konsisten"

  @stress @priority-high @REQ-008 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-011 — Expiry draf massal
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "10000 draf kedaluwarsa D dan100 belum expired"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Draf"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Sesudah job D+1 hanya100 draf valid; tidak menghapus lelang final"

  @stress @priority-high @REQ-056 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-012 — Ranking dataset besar
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "10000 penawaran dengan enam tie-break terkontrol"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Ranking dan pagination stabil tanpa hilang/duplikat"

  @stress @priority-high @REQ-066 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-013 — Fanout notifikasi lelang ulang
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "5000 peserta aktif, sebagian sink notifikasi timeout"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Siklus tersimpan satu kali; retry notifikasi tidak menggandakan event; kegagalan terpantau"

  @stress @priority-high @REQ-030 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-014 — Pergantian metode cepat
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Empat metode diganti100 kali"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengklik elemen "CY to Door"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "State akhir tepat lock CY to Door; biaya opsional lama tidak kembali"

  @stress @priority-high @REQ-038 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-015 — Teks panjang karakter khusus
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Deskripsi dan catatan100000 karakter termasuk Unicode dan markup"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user mengisi field "Deskripsi Barang" dengan "fixture.longText"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tidak crash atau eksekusi script; penolakan batas teknis jelas tanpa simpan parsial/truncation diam-diam"

  @stress @priority-high @REQ-067 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-STR-016 — Update harga vendor paralel
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "100 vendor update harga bersamaan pada ulang;100 tidak update"
    And prasyarat "Jalankan hanya di staging terisolasi; load driver menyiapkan beban paralel sesuai testData, bukan loop click tunggal; ukur latensi tanpa menetapkan SLA baru"
    When user membuka halaman "Detail Harga Penawaran"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Expired hanya harga milik vendor yang berhasil update; vendor lainnya tetap aktif"

  @positive @priority-medium @REQ-004 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-119 — Inventaris tampilan Daftar Lelang
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Buat Lelang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Filter" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman sebelumnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Tersedia/terlarang sesuai status; draf hanya edit/hapus"
    And sistem memverifikasi elemen "Riwayat Lelang Ulang" dengan kondisi "Tersedia/terlarang sesuai status; draf hanya edit/hapus"
    And sistem memverifikasi elemen "Riwayat Perubahan" dengan kondisi "Tersedia/terlarang sesuai status; draf hanya edit/hapus"
    And sistem memverifikasi elemen "Card lelang" dengan kondisi "Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data"
    And sistem memverifikasi elemen "Legend warna" dengan kondisi "Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data"
    And sistem memverifikasi elemen "Badge status" dengan kondisi "Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data"
    And sistem memverifikasi elemen "Detail Multipickup" dengan kondisi "Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data"
    And sistem memverifikasi elemen "Detail Multidrop" dengan kondisi "Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data"
    And sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-120 — Inventaris tampilan Filter Lelang
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Buka Lelang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tutup Lelang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Rencana Awal Kirim" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Rencana Akhir Kirim" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tutup filter" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-121 — Inventaris tampilan Buat Lelang — Informasi Umum
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "FTL" dengan kondisi "Single-select card; empat metode berbeda lock biaya"
    And sistem memverifikasi elemen "Catatan Tambahan" dengan kondisi "Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter"
    And sistem memverifikasi elemen "Tutup Lelang" dengan kondisi "Read-only, auto Buka + Durasi"
    And sistem memverifikasi elemen "Syarat & Ketentuan" dengan kondisi "Banner: Pastikan urutan pengiriman sudah sesuai"
    And sistem memverifikasi elemen "Banner urutan pengiriman" dengan kondisi "Banner: Pastikan urutan pengiriman sudah sesuai"
    And sistem memverifikasi elemen "Catatan Pengirim 1" dengan kondisi "Auto draft PIC/WA editable; catatan opsional"
    And sistem memverifikasi elemen "Provinsi Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kota/Kab Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kecamatan Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Desa/Kelurahan Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kode Pos Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Alamat Pengirim 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Catatan Penerima 1" dengan kondisi "Auto draft PIC/WA editable; catatan opsional"
    And sistem memverifikasi elemen "Provinsi Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kota/Kab Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kecamatan Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Desa/Kelurahan Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Kode Pos Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Alamat Penerima 1" dengan kondisi "Auto master disabled; scope card/baris"
    And sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-001 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-122 — Inventaris tampilan Buat Lelang — Peserta Lelang
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Tampilkan" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Batal" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Vendor V2" dengan kondisi "Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang"
    And sistem memverifikasi elemen "Vendor V3" dengan kondisi "Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang"
    And sistem memverifikasi elemen "Vendor V4" dengan kondisi "Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang"
    And sistem memverifikasi elemen "Counter vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Card vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-050 @screen-tambah-peserta
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-123 — Inventaris tampilan Tambah Peserta Lelang
    Given user berada di halaman "Tambah Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Cari nama vendor" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Semua Kota" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Semua Rating" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tampilkan" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Pilih Semua" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman berikutnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman sebelumnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Batal" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Vendor V21" dengan kondisi "Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang"
    And sistem memverifikasi elemen "Counter vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Card vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Syarat & Ketentuan" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Pengirim" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Penerima" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Dokumen Tambahan a.pdf" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Ringkasan lelang" dengan kondisi "Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber"
    And sistem memverifikasi elemen "Tambah Peserta Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-124 — Inventaris tampilan Lelang Ulang
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Cari nama vendor" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Semua Kota" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Semua Rating" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tampilkan" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Pilih Semua" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman berikutnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman sebelumnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Batal" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Vendor V21" dengan kondisi "Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang"
    And sistem memverifikasi elemen "Counter vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Card vendor" dengan kondisi "Nama, kota, jumlah menang; counter total atau vendor baru pada ulang"
    And sistem memverifikasi elemen "Syarat & Ketentuan" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Pengirim" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Penerima" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Dokumen Tambahan a.pdf" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Ringkasan lelang" dengan kondisi "Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber"
    And sistem memverifikasi elemen "Tutup Lelang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Perlu Diketahui" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-034 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-125 — Inventaris tampilan Detail Lelang
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Ringkasan lelang" dengan kondisi "Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber"
    And sistem memverifikasi elemen "Edit Data" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tampilkan" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Tabel peserta" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-002 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-126 — Inventaris tampilan Detail Harga Penawaran
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Syarat & Ketentuan" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Pengirim" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Data Penerima" dengan kondisi "Collapsible; pengirim/penerima default collapsed pada ulang"
    And sistem memverifikasi elemen "Dokumen Tambahan a.pdf" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Ringkasan lelang" dengan kondisi "Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber"
    And sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Halaman berikutnya" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Card penawaran" dengan kondisi "State belum buka/sedang buka/belum ada penawaran/ulang countdown; N/A, Expired, Belum Input Jadwal; logo/pelayaran/open/closing/ETD/ETA/vendor/container/total"
    And sistem memverifikasi elemen "Harga Penawaran" dengan kondisi "State belum buka/sedang buka/belum ada penawaran/ulang countdown; N/A, Expired, Belum Input Jadwal; logo/pelayaran/open/closing/ETD/ETA/vendor/container/total"
    And sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-003 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-127 — Inventaris tampilan Edit Lelang
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Buka Lelang" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Rencana Awal Kirim" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Rencana Akhir Kirim" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Batal" dengan kondisi "Normal; nama ARIA/testid usulan, perlu cocokkan DOM"
    And sistem memverifikasi elemen "Jenis Pengiriman" dengan kondisi "Read-only; baris tetap menurut A02; field editable lain mengikuti create"
    And sistem memverifikasi elemen "Tipe Pengiriman" dengan kondisi "Read-only; baris tetap menurut A02; field editable lain mengikuti create"
    And sistem memverifikasi elemen "Skema Pengiriman" dengan kondisi "Read-only; baris tetap menurut A02; field editable lain mengikuti create"
    And sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-medium @REQ-052 @screen-batalkan-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-128 — Inventaris tampilan Batalkan Lelang
    Given user berada di halaman "Batalkan Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Gunakan fixture state per elemen: render bagian terkait dahulu (expand section/aktifkan checkbox/buka menu); field bersyarat tidak wajib tampil serentak"
    When user memeriksa keadaan halaman
    Then sistem memverifikasi elemen "Ringkasan pembatalan" dengan kondisi "No. Lelang, Pengirim, Penerima read-only"
    And sistem memverifikasi elemen "Batalkan Lelang" dengan kondisi "Elemen yang terdaftar mengikuti label, data fixture dan state inventaris; selector diverifikasi sebelum codegen"

  @positive @priority-high @REQ-012 @screen-list-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-129 — Buat Lelang dari list memilih FCL
    Given user berada di halaman "Daftar Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Admin shipper A pada list"
    When user mengklik elemen "Buat Lelang"
    And user mengklik elemen "FCL"
    Then sistem memverifikasi elemen "Daftar Lelang" dengan kondisi "Form FCL step1 terbuka dengan dua step"

  @edge @priority-high @REQ-027 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-029 — Beralih FTL ke FCL tidak membawa validasi FTL
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "FTL sempat dipilih tetapi belum disimpan"
    When user mengklik elemen "FTL"
    And user mengklik elemen "FCL"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Field FCL sesuai desain; field FTL tersembunyi tidak menghalangi submit"

  @positive @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-130 — Opsional kosong Deskripsi Barang
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan field opsional kosong"
    When user mengisi field "Deskripsi Barang" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Lanjut peserta tanpa required untuk Deskripsi Barang"

  @positive @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-131 — Opsional kosong Catatan Tambahan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan field opsional kosong"
    When user mengisi field "Catatan Tambahan" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Lanjut peserta tanpa required untuk Catatan Tambahan"

  @positive @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-132 — Opsional kosong Catatan Pengirim 1
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan field opsional kosong"
    When user mengisi field "Catatan Pengirim 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Lanjut peserta tanpa required untuk Catatan Pengirim 1"

  @positive @priority-high @REQ-012 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-133 — Opsional kosong Catatan Penerima 1
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form valid dengan field opsional kosong"
    When user mengisi field "Catatan Penerima 1" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Lanjut peserta tanpa required untuk Catatan Penerima 1"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-134 — Filter periode Buka Lelang
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua lelang dengan nilai tanggal berbeda"
    When user mengisi field "Buka Lelang" dengan "24/09/2026 09:00"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya lelang dengan periode sesuai filter tampil; reset memulihkan data"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-135 — Filter periode Tutup Lelang
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua lelang dengan nilai tanggal berbeda"
    When user mengisi field "Tutup Lelang" dengan "24/09/2026 09:00"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya lelang dengan periode sesuai filter tampil; reset memulihkan data"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-136 — Filter periode Rencana Awal Kirim
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua lelang dengan nilai tanggal berbeda"
    When user mengisi field "Rencana Awal Kirim" dengan "24/09/2026 09:00"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya lelang dengan periode sesuai filter tampil; reset memulihkan data"

  @positive @priority-high @REQ-070 @screen-filter-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-137 — Filter periode Rencana Akhir Kirim
    Given user berada di halaman "Filter Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Dua lelang dengan nilai tanggal berbeda"
    When user mengisi field "Rencana Akhir Kirim" dengan "24/09/2026 09:00"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Filter Lelang" dengan kondisi "Hanya lelang dengan periode sesuai filter tampil; reset memulihkan data"

  @positive @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-138 — Pencarian kontainer dan hapus salah satu tag
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "20 Feet Dry dan 20 Feet HC terpilih"
    When user mengklik elemen "Hapus tag 20 Feet HC"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "20 Feet Dry tetap terpilih dan validasi minimal satu tetap lulus"

  @positive @priority-high @REQ-020 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-139 — Pencarian master pelabuhan
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master aktif Tanjung Perak/Panjang dan nonaktif X"
    When user mengisi field "Pencarian Pelabuhan Asal" dengan "Perak"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya master aktif yang cocok pencarian tampil"

  @positive @priority-high @REQ-026 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-140 — Pencarian master kontainer
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master aktif 20 Feet Dry/40 Feet Dry dan nonaktif X"
    When user mengisi field "Pencarian Jenis Kontainer" dengan "20"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hanya master aktif yang cocok20 tampil"

  @positive @priority-high @REQ-037 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-141 — Pencarian drop point dan pihak
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Master shipper A dan B memiliki nama serupa"
    When user mengisi field "Pencarian Drop Point Asal 1" dengan "DP-A"
    And user mengisi field "Pencarian Pengirim 1" dengan "Pengirim A"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Hasil hanya master milik shipper login, sesuai query dan relasi yang dipilih"

  @positive @priority-high @REQ-045 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-142 — Expand setelah collapse mempertahankan data
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Detail semua section expanded; snapshot fixture disiapkan"
    When user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Syarat & Ketentuan"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Pengirim"
    And user mengklik elemen "Data Penerima"
    And user mengklik elemen "Data Penerima"
    And user mengklik elemen "Peserta Lelang"
    And user mengklik elemen "Peserta Lelang"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Setiap section kembali expanded dengan nilai sama; tidak mengubah data lelang"

  @edge @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-030 — Toggle sorting naik turun Vendor
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga peserta dengan nilai berbeda dan satu tanggal penawaran kosong"
    When user mengklik elemen "Vendor"
    And user mengklik elemen "Vendor"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Urutan mengikuti arah indikator kedua; nilai kosong tampil - dan tidak menyebabkan error"

  @edge @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-031 — Toggle sorting naik turun Tanggal Terkirim
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga peserta dengan nilai berbeda dan satu tanggal penawaran kosong"
    When user mengklik elemen "Tanggal Terkirim"
    And user mengklik elemen "Tanggal Terkirim"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Urutan mengikuti arah indikator kedua; nilai kosong tampil - dan tidak menyebabkan error"

  @edge @priority-high @REQ-047 @screen-detail-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-032 — Toggle sorting naik turun Tanggal Penawaran
    Given user berada di halaman "Detail Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Tiga peserta dengan nilai berbeda dan satu tanggal penawaran kosong"
    When user mengklik elemen "Tanggal Penawaran"
    And user mengklik elemen "Tanggal Penawaran"
    Then sistem memverifikasi elemen "Detail Lelang" dengan kondisi "Urutan mengikuti arah indikator kedua; nilai kosong tampil - dan tidak menyebabkan error"

  @negative @priority-high @REQ-048 @screen-edit-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-107 — Edit waktu wajib mengikuti aturan create
    Given user berada di halaman "Edit Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Belum Buka, Tutup24/09/2026 10:00"
    When user mengisi field "Rencana Awal Kirim" dengan "24/09/2026 09:59"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Edit Lelang" dengan kondisi "Awal sebelum Tutup ditolak; audit dan notifikasi sukses tidak dibuat"

  @positive @priority-high @REQ-021 @screen-informasi-umum
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-143 — Mengubah Buka menghitung ulang Tutup
    Given user berada di halaman "Buat Lelang — Informasi Umum"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Durasi60 menit, Buka semula24/09/2026 09:00"
    When user mengisi field "Buka Lelang" dengan "24/09/2026 11:00"
    Then sistem memverifikasi elemen "Buat Lelang — Informasi Umum" dengan kondisi "Tutup menjadi24/09/2026 12:00 tanpa nilai lama tertinggal"

  @negative @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-108 — Durasi ulang kosong
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form ulang valid selain durasi kosong"
    When user memilih field "Durasi Lelang" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Error durasi required; tidak mulai siklus ulang"

  @negative @priority-high @REQ-063 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-109 — Buka ulang kosong
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Form ulang valid selain Buka kosong"
    When user mengisi field "Buka Lelang" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Error Buka required; tidak mulai siklus ulang"

  @positive @priority-high @REQ-062 @screen-lelang-ulang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-POS-144 — Lelang ulang dari status Aktif
    Given user berada di halaman "Lelang Ulang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Aktif sebelum akhir kirim, tidak ada ulang aktif; jadwal ulang valid"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Lelang Ulang" dengan kondisi "Siklus baru dimulai pada nomor sama"

  @edge @priority-high @REQ-068 @screen-harga-penawaran
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-EDG-033 — Ulang terjadwal juga mengunci harga lama
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "Siklus ulang sudah disimpan dengan Buka besok; belum tutup ulang"
    When user mengklik elemen "Pesan"
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Harga lama terkunci selama proses ulang termasuk fase Belum Buka sesuai asumsi proses aktif"

  @negative @priority-high @REQ-042 @screen-peserta-lelang
  Scenario: AMS001-BUAT-LELANG-FCL-SHIPPER-NEG-110 — Seleksi manual tidak auto mengundang vendor baru
    Given user berada di halaman "Buat Lelang — Peserta Lelang"
    And prasyarat "Login Admin shipper A; data milik shipper aktif kecuali fixture menyebut aktor lain"
    And prasyarat "Gunakan fixture validForm; override mengikuti fixture kasus, semua field yang tidak diuji tetap valid"
    And prasyarat "V1 dipilih manual, Pilih Semua tidak aktif; V31 dibuat sesudah submit"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Buat Lelang — Peserta Lelang" dengan kondisi "V31 tidak menjadi peserta otomatis; hanya V1 menerima undangan"

