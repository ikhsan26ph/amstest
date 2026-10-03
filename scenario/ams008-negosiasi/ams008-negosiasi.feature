Feature: Negosiasi harga lelang FTL dan FCL
  Sebagai shipper dan vendor
  Saya ingin melakukan negosiasi harga dengan status, validasi, dan riwayat yang konsisten
  Agar harga penawaran dapat disepakati sebelum pemesanan

  @positive @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS008-NEGOSIASI-POS-001 - Membuka Ajukan Nego dari lelang FCL yang memenuhi syarat
    Given user berada di halaman "Detail Harga Penawaran"
    When user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "Ajukan Nego"

  @positive @priority-high @REQ-002 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-POS-002 - Hanya penawaran aktif dan belum melewati closing time yang tersedia
    Given user berada di halaman "Ajukan Nego"
    Then sistem menampilkan "Penawaran Aktif FCL"
    Then sistem menampilkan "tidak tampil"

  @positive @priority-high @REQ-003 @screen-detail-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-POS-003 - Pengajuan kelima menambah putaran tanpa menghitung balasan vendor
    Given user berada di halaman "Detail Negosiasi Shipper"
    When user mengklik tombol "Ajukan Nego"
    And user mengisi field "Nominal Negosiasi" dengan "Rp 12.500.000"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Ajukan"
    Then sistem menampilkan "Nego #5"

  @positive @priority-high @REQ-004 @screen-daftar-negosiasi-vendor
  Scenario: AMS008-NEGOSIASI-POS-004 - Timer respons mengikuti pengaturan shipper dan waktu WIB
    Given user berada di halaman "Daftar Negosiasi Vendor"
    Then sistem menampilkan "Perlu Aksi"
    Then sistem menampilkan "3 hari lagi"
    And user mengklik tombol "Detail Nego"
    Then sistem menampilkan "WIB"

  @positive @priority-high @REQ-005 @screen-daftar-negosiasi
  Scenario: AMS008-NEGOSIASI-POS-005 - Label status dipetakan sesuai sudut pandang pihak yang bertindak
    Given user berada di halaman "Daftar Negosiasi Shipper"
    Then sistem menampilkan "Menunggu Vendor"
    And user berada di halaman "Daftar Negosiasi Vendor"
    Then sistem menampilkan "Perlu Aksi"
    Then sistem menampilkan "Menunggu Shipper"

  @positive @priority-high @REQ-006 @screen-detail-negosiasi
  Scenario: AMS008-NEGOSIASI-POS-006 - Penawaran otomatis menjadi Harga Tidak Berlaku akibat bid baru vendor
    Given user berada di halaman "Detail Negosiasi"
    Then sistem menampilkan "Harga Tidak Berlaku"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "Harga Tidak Berlaku"

  @positive @priority-medium @REQ-007 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-POS-007 - Memilih penawaran lintas halaman lalu membatalkan tanpa menyimpan
    Given user berada di halaman "Ajukan Nego"
    When user mencentang checkbox "Pilih OFF-001"
    And user mengklik tombol "Halaman berikutnya"
    And user mencentang checkbox "Pilih OFF-021"
    Then sistem menampilkan "2 Terpilih"
    And user mengklik tombol "Batal"
    Then sistem menampilkan "Detail Harga Penawaran"

  @positive @priority-high @REQ-008 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-POS-008 - Memformat nominal rupiah valid dan menerapkannya ke semua pilihan
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "12500000"
    Then sistem menampilkan "Rp 12.500.000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "2 penawaran"

  @positive @priority-high @REQ-009 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-POS-009 - Mengirim pengajuan tunggal lebih rendah dari harga aktif dan nego pertama
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "13000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "1 penawaran"

  @positive @priority-high @REQ-010 @screen-dialog-nominal-nego-belum-sesuai
  Scenario: AMS008-NEGOSIASI-POS-010 - Memproses hanya harga bulk yang sesuai
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "18000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Nego Belum Sesuai"
    And user mengklik tombol "Proses Harga yang Sesuai"
    Then sistem menampilkan "1 penawaran"

  @positive @priority-high @REQ-011 @screen-dialog-nominal-melebihi-nego-sebelumnya
  Scenario: AMS008-NEGOSIASI-POS-011 - Memproses sisa penawaran setelah validasi nego pertama
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "13000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Melebihi Nego Sebelumnya"
    And user mengklik tombol "Proses Sisanya"
    Then sistem menampilkan "2 penawaran"

  @positive @priority-high @REQ-012 @screen-konfirmasi-pengajuan-nego
  Scenario: AMS008-NEGOSIASI-POS-012 - Mengonfirmasi pengajuan bulk dan membuat proses per penawaran
    Given user berada di halaman "Ajukan Nego"
    When user mengklik tombol "Kirim"
    Then sistem menampilkan "3 penawaran"
    And user mengklik tombol "Ajukan"
    Then sistem menampilkan "Negosiasi berhasil diajukan"
    Then sistem menampilkan "Proses Nego"

  @positive @priority-medium @REQ-013 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-POS-013 - Memfilter, mengurutkan, dan membuka tab daftar shipper
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Filter"
    And user mengisi field "ID Order" dengan "FCL-NRM-01/200526"
    And user memilih "Perlu Aksi" pada field "Status"
    And user mengklik tombol "Terapkan"
    And user mengklik tombol "Perlu Aksi"
    Then sistem menampilkan "FCL-NRM-01/200526"

  @positive @priority-high @REQ-014 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-POS-014 - Menu aksi shipper sesuai status negosiasi
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Aksi negosiasi Perlu Aksi"
    Then sistem menampilkan "Detail Nego"
    Then sistem menampilkan "Terima Nego"
    Then sistem menampilkan "Riwayat Nego"

  @positive @priority-high @REQ-015 @screen-detail-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-POS-015 - Menampilkan data terbaru dan riwayat lengkap serta mengakhiri nego
    Given user berada di halaman "Detail Negosiasi Shipper"
    Then sistem menampilkan "Harga Penawaran Awal"
    Then sistem menampilkan "Putaran Nego"
    And user mengklik tombol "Akhiri Nego"
    Then sistem menampilkan "Akhiri Nego"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "Nego Berakhir"

  @positive @priority-high @REQ-016 @screen-dialog-ajukan-nego
  Scenario: AMS008-NEGOSIASI-POS-016 - Mengajukan nego kembali dari detail dengan nominal valid
    Given user berada di halaman "Detail Negosiasi Shipper"
    When user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "FCL-NRM-01/200526"
    And user mengisi field "Nominal Negosiasi" dengan "13000000"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Ajukan"
    Then sistem menampilkan "Menunggu Vendor"

  @positive @priority-high @REQ-017 @screen-detail-negosiasi-vendor
  Scenario: AMS008-NEGOSIASI-POS-017 - Vendor melihat tab, timer, aksi, tooltip, dan riwayat sesuai status
    Given user berada di halaman "Daftar Negosiasi Vendor"
    When user mengklik tombol "Perlu Aksi"
    Then sistem menampilkan "3 hari lagi"
    And user mengklik tombol "Detail Nego"
    Then sistem menampilkan "Terima Nego"
    And user mengklik tombol "Info sisa waktu respons"
    Then sistem menampilkan "Sisa waktu Vendor untuk merespon nego Shipper"

  @positive @priority-high @REQ-018 @screen-dialog-terima-nego
  Scenario: AMS008-NEGOSIASI-POS-018 - Vendor menerima nominal nego yang masih valid
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Terima Nego"
    Then sistem menampilkan "Rp 13.500.000"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "Diterima"
    Then sistem menampilkan "Rp 13.500.000"

  @positive @priority-high @REQ-019 @screen-dialog-tolak-nego
  Scenario: AMS008-NEGOSIASI-POS-019 - Vendor menolak dengan chip alasan yang dapat diedit
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Tolak Nego"
    And user mengklik tombol "Harga di bawah biaya operasional kami"
    And user mengisi field "Alasan penolakan" dengan "Harga di bawah biaya operasional kami untuk rute ini"
    And user mengklik tombol "Tolak Nego"
    Then sistem menampilkan "Ditolak"
    Then sistem menampilkan "Harga di bawah biaya operasional kami untuk rute ini"

  @positive @priority-high @REQ-020 @screen-dialog-ajukan-balasan
  Scenario: AMS008-NEGOSIASI-POS-020 - Vendor mengirim nominal balasan di antara nego terbaru dan harga aktif
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Ajukan Balasan"
    Then sistem menampilkan "Rp 13.000.000"
    And user mengisi field "Nominal Balasan" dengan "13500000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Menunggu Shipper"
    Then sistem menampilkan "Perlu Aksi"

  @positive @priority-high @REQ-021 @screen-detail-harga-penawaran
  Scenario: AMS008-NEGOSIASI-POS-021 - Harga hasil nego diterima dipakai untuk pemesanan dan tetap menyimpan riwayat
    Given user berada di halaman "Detail Harga Penawaran"
    Then sistem menampilkan "Rp 13.500.000"
    And user mengklik tombol "Pesan"
    Then sistem menampilkan "Rp 13.500.000"
    And user berada di halaman "Detail Negosiasi Shipper"
    Then sistem menampilkan "Rp 15.000.000"

  @negative @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS008-NEGOSIASI-NEG-001 - Menolak Ajukan Nego setelah Rencana Akhir Kirim
    Given user berada di halaman "Detail Harga Penawaran"
    When user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "Nomor lelang sudah melewati tgl. rencana akhir kirim"
    Then sistem menampilkan "Detail Harga Penawaran"

  @negative @priority-high @REQ-002 @screen-detail-harga-penawaran
  Scenario: AMS008-NEGOSIASI-NEG-002 - Menolak negosiasi penawaran FCL yang melewati Closing Time
    Given user berada di halaman "Detail Harga Penawaran"
    When user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "penawaran tidak tersedia"
    Then sistem menampilkan "tidak dapat dipilih"

  @negative @priority-high @REQ-003 @screen-detail-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-NEG-003 - Menolak pengajuan keenam pada penawaran yang sama
    Given user berada di halaman "Detail Negosiasi Shipper"
    When user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "Maksimal 5 putaran nego"
    Then sistem menampilkan "Nego #5"

  @negative @priority-high @REQ-004 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-NEG-004 - Menandai Tidak Direspons ketika timer vendor terlewati
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Nego Tidak Direspons"
    Then sistem menampilkan "Tidak Direspons"
    Then sistem menampilkan "tidak tersedia"

  @negative @priority-high @REQ-005 @screen-detail-negosiasi
  Scenario: AMS008-NEGOSIASI-NEG-005 - Mencegah aksi pada status final
    Given user berada di halaman "Detail Negosiasi Vendor"
    Then sistem menampilkan "Ditolak"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "tidak tersedia"

  @negative @priority-high @REQ-006 @screen-detail-negosiasi
  Scenario: AMS008-NEGOSIASI-NEG-006 - Menolak aksi lanjutan setelah lelang ulang membuat harga tidak berlaku
    Given user berada di halaman "Detail Negosiasi Shipper"
    Then sistem menampilkan "Harga Tidak Berlaku"
    And user mengklik tombol "Ajukan Nego"
    Then sistem menampilkan "Penawaran tidak lagi berlaku"

  @negative @priority-high @REQ-007 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-NEG-007 - Menolak Kirim tanpa penawaran terpilih
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "12000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Pilih minimal 1 penawaran"

  @negative @priority-high @REQ-008 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-NEG-008 - Menolak nominal kosong, nonnumerik, nol, dan negatif
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "0"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Negosiasi harus lebih dari 0"
    And user mengisi field "Nominal Negosiasi" dengan "abc"
    Then sistem menampilkan "input nonnumerik ditolak"

  @negative @priority-high @REQ-009 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-NEG-009 - Menolak nominal tunggal sama dengan harga aktif
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "15000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal nego tidak dapat lebih tinggi dari harga sebelumnya"

  @negative @priority-high @REQ-010 @screen-dialog-nominal-nego-belum-sesuai
  Scenario: AMS008-NEGOSIASI-NEG-010 - Tidak memproses bulk ketika seluruh harga tidak sesuai
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "18000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Nego Belum Sesuai"
    And user mengklik tombol "Cek Kembali"
    Then sistem menampilkan "2 Terpilih"

  @negative @priority-high @REQ-011 @screen-dialog-nominal-melebihi-nego-sebelumnya
  Scenario: AMS008-NEGOSIASI-NEG-011 - Menonaktifkan Proses Sisanya ketika semua penawaran melebihi nego pertama
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "14000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Melebihi Nego Sebelumnya"
    Then sistem menampilkan "disabled"
    Then sistem menampilkan "Tidak ada penawaran yang dapat diproses"

  @negative @priority-medium @REQ-012 @screen-konfirmasi-pengajuan-nego
  Scenario: AMS008-NEGOSIASI-NEG-012 - Membatalkan konfirmasi tanpa membuat proses negosiasi
    Given user berada di halaman "Ajukan Nego"
    When user mengklik tombol "Kirim"
    Then sistem menampilkan "2 penawaran"
    And user mengklik tombol "Batal"
    Then sistem menampilkan "2 Terpilih"

  @negative @priority-high @REQ-013 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-NEG-013 - Tidak Direspons tidak muncul pada list utama atau tab Selesai
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Semua"
    Then sistem menampilkan "status Tidak Direspons tidak tampil"
    And user mengklik tombol "Selesai"
    Then sistem menampilkan "status Tidak Direspons tidak tampil"
    And user mengklik tombol "Nego Tidak Direspons"
    Then sistem menampilkan "Tidak Direspons"

  @negative @priority-high @REQ-014 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-NEG-014 - Menyembunyikan aksi yang tidak diizinkan untuk Harga Tidak Berlaku
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Aksi negosiasi Harga Tidak Berlaku"
    Then sistem menampilkan "Detail Nego"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "tidak tersedia"

  @negative @priority-high @REQ-015 @screen-detail-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-NEG-015 - Menyembunyikan aksi berjalan pada status Nego Berakhir
    Given user berada di halaman "Detail Negosiasi Shipper"
    Then sistem menampilkan "Nego Berakhir"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "tidak tersedia"
    Then sistem menampilkan "tetap tampil"

  @negative @priority-high @REQ-016 @screen-dialog-ajukan-nego
  Scenario: AMS008-NEGOSIASI-NEG-016 - Menolak nominal nego kembali di atas nego pertama
    Given user berada di halaman "Detail Negosiasi Shipper"
    When user mengklik tombol "Ajukan Nego"
    And user mengisi field "Nominal Negosiasi" dengan "13000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal nego tidak dapat lebih tinggi dari nominal nego sebelumnya"

  @negative @priority-high @REQ-017 @screen-daftar-negosiasi-vendor
  Scenario: AMS008-NEGOSIASI-NEG-017 - Vendor tidak melihat status atau halaman Tidak Direspons
    Given user berada di halaman "Daftar Negosiasi Vendor"
    Then sistem menampilkan "Tidak Direspons tidak tersedia"
    Then sistem menampilkan "Tidak Direspons tidak tersedia"
    Then sistem menampilkan "Tidak Direspons tidak tampil"

  @negative @priority-high @REQ-018 @screen-dialog-terima-nego
  Scenario: AMS008-NEGOSIASI-NEG-018 - Menolak Terima Nego setelah batas respons berakhir
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Terima Nego"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "Batas waktu respons telah berakhir"
    Then sistem menampilkan "Tidak Direspons pada sisi shipper"

  @negative @priority-high @REQ-019 @screen-dialog-tolak-nego
  Scenario: AMS008-NEGOSIASI-NEG-019 - Menolak submit tanpa alasan penolakan
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Tolak Nego"
    And user mengisi field "Alasan penolakan" dengan ""
    And user mengklik tombol "Tolak Nego"
    Then sistem menampilkan "Alasan penolakan wajib diisi"

  @negative @priority-high @REQ-020 @screen-dialog-ajukan-balasan
  Scenario: AMS008-NEGOSIASI-NEG-020 - Menolak balasan sama dengan batas bawah atau batas atas
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Ajukan Balasan"
    And user mengisi field "Nominal Balasan" dengan "13000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Balasan harus lebih besar dari Nominal Nego Terbaru"
    And user mengisi field "Nominal Balasan" dengan "14000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Nominal Balasan harus lebih kecil dari Harga Saat Ini"

  @negative @priority-high @REQ-021 @screen-detail-harga-penawaran
  Scenario: AMS008-NEGOSIASI-NEG-021 - Status Ditolak tidak mengubah harga aktif
    Given user berada di halaman "Detail Harga Penawaran"
    Then sistem menampilkan "Rp 15.000.000"
    And user mengklik tombol "Pesan"
    Then sistem menampilkan "Rp 15.000.000"
    And user berada di halaman "Detail Negosiasi Shipper"
    Then sistem menampilkan "Ditolak"

  @edge @priority-medium @REQ-008 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-EDG-001 - Menerima nilai minimum Rp 1 jika masih di bawah harga aktif
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "1"
    Then sistem menampilkan "Rp 1"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "1 penawaran"

  @edge @priority-high @REQ-020 @screen-dialog-ajukan-balasan
  Scenario: AMS008-NEGOSIASI-EDG-002 - Menerima balasan satu rupiah di atas nego dan satu rupiah di bawah harga aktif
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Ajukan Balasan"
    And user mengisi field "Nominal Balasan" dengan "13000001"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "Menunggu Shipper"

  @edge @priority-high @REQ-004 @screen-detail-negosiasi-vendor
  Scenario: AMS008-NEGOSIASI-EDG-003 - Memproses satu respons tepat sebelum deadline dan menolak respons sesudahnya
    Given user berada di halaman "Detail Negosiasi Vendor"
    When user mengklik tombol "Terima Nego satu milidetik sebelum deadline"
    Then sistem menampilkan "Diterima"
    And user mengklik tombol "Terima Nego satu milidetik setelah deadline"
    Then sistem menampilkan "Batas waktu respons telah berakhir"

  @stress @priority-medium @REQ-007 @screen-ajukan-nego
  Scenario: AMS008-NEGOSIASI-STR-001 - Mempertahankan Pilih Semua dan counter pada seribu penawaran lintas 50 halaman
    Given user berada di halaman "Ajukan Nego"
    When user mencentang checkbox "Pilih Semua"
    And user mengklik tombol "Halaman 50"
    Then sistem menampilkan "1000 Terpilih"
    And user mengklik tombol "Filter"
    And user memilih "PT Trans Logistics" pada field "Vendor"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "1000 Terpilih"

  @stress @priority-high @REQ-012 @screen-konfirmasi-pengajuan-nego
  Scenario: AMS008-NEGOSIASI-STR-002 - Membuat lima ratus proses bulk tanpa duplikat
    Given user berada di halaman "Ajukan Nego"
    When user mengisi field "Nominal Negosiasi" dengan "10000000"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "500 penawaran"
    And user mengklik tombol "Ajukan"
    Then sistem menampilkan "500 negosiasi berhasil diajukan"

  @stress @priority-medium @REQ-013 @screen-daftar-negosiasi-shipper
  Scenario: AMS008-NEGOSIASI-STR-003 - Memfilter dan mengurutkan sepuluh ribu negosiasi lintas lelang
    Given user berada di halaman "Daftar Negosiasi Shipper"
    When user mengklik tombol "Filter"
    And user memilih "FCL" pada field "Jenis Order"
    And user memilih "Perlu Aksi" pada field "Status"
    And user mengklik tombol "Terapkan"
    And user mengklik tombol "Urutkan tanggal update terbaru"
    Then sistem menampilkan "20 baris halaman pertama"

  @stress @priority-high @REQ-020 @screen-dialog-ajukan-balasan
  Scenario: AMS008-NEGOSIASI-STR-004 - Menjamin hanya satu respons final saat aksi vendor paralel
    Given user berada di halaman "Detail Negosiasi Vendor sesi A dan B"
    When user mengisi field "Nominal Balasan sesi A" dengan "13500000"
    And user mengklik tombol "Kirim sesi A"
    And user mengklik tombol "Terima Nego sesi B"
    Then sistem menampilkan "Menunggu Shipper"
    Then sistem menampilkan "Negosiasi sudah direspons"


