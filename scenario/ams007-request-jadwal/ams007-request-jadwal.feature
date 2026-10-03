# language: id
Fitur: Request jadwal lelang FCL oleh shipper dan vendor
  Sebagai shipper dan vendor
  Saya ingin mengajukan serta merespons request jadwal
  Agar jadwal kapal pada harga penawaran selalu mutakhir

  @positive @priority-high @REQ-001 @screen-lelang-spot-rate-shipper @AMS007-POS-001
  Skenario: [AMS007-POS-001] Aksi Request Jadwal tersedia pada lelang FCL
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Buka menu aksi"
    Then sistem menampilkan "aksi terlihat" pada "Request Jadwal"

  @negative @priority-high @REQ-001 @screen-lelang-spot-rate-shipper @AMS007-NEG-001
  Skenario: [AMS007-NEG-001] Fitur Request Jadwal tidak tersedia pada lelang FTL
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Buka menu aksi"
    Then sistem menampilkan "aksi tidak tersedia" pada "Request Jadwal"

  @positive @priority-high @REQ-002 @screen-request-jadwal-shipper @AMS007-POS-002
  Skenario: [AMS007-POS-002] Kedua jalur membuka halaman Request Jadwal yang sama
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "No. Lelang yang dipilih" pada "Request Jadwal"
    And user berada di halaman "Detail Harga Penawaran"
    And user mengklik tombol "Request Jadwal"
    And sistem menampilkan "No. Lelang yang sama" pada "Request Jadwal"

  @negative @priority-medium @REQ-002 @screen-request-jadwal-shipper @AMS007-NEG-002
  Skenario: [AMS007-NEG-002] Tautan Request Jadwal dengan nomor lelang tidak valid ditolak
    Given user berada di halaman "Request Jadwal Shipper"
    When user mengisi field "No. Lelang" dengan "FCL-TIDAK-ADA"
    Then sistem menampilkan "tidak ditemukan" pada "Data Lelang"

  @positive @priority-high @REQ-003 @screen-request-jadwal-shipper @AMS007-POS-003
  Skenario: [AMS007-POS-003] Lelang tutup dengan penawaran dan sebelum batas kirim dapat diajukan
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "daftar penawaran tampil" pada "Pilih Harga Penawaran"

  @negative @priority-high @REQ-003 @screen-lelang-spot-rate-shipper @AMS007-NEG-003
  Skenario: [AMS007-NEG-003] Lelang belum tutup menampilkan alert kelayakan
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "Nomor lelang belum melewati batas tutup lelang" pada "Alert"

  @negative @priority-high @REQ-003 @screen-lelang-spot-rate-shipper @AMS007-NEG-004
  Skenario: [AMS007-NEG-004] Lelang tanpa penawaran menampilkan alert
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "Belum ada peserta lelang yang mengajukan penawaran" pada "Alert"

  @negative @priority-high @REQ-003 @screen-lelang-spot-rate-shipper @AMS007-NEG-005
  Skenario: [AMS007-NEG-005] Lelang melewati Rencana Akhir Kirim ditolak
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "Nomor lelang sudah melewati tgl. rencana akhir kirim. Silahkan hubungi CS" pada "Alert"

  @negative @priority-high @REQ-003 @screen-lelang-spot-rate-shipper @AMS007-NEG-006
  Skenario: [AMS007-NEG-006] Lelang dibatalkan tidak dapat diajukan
    Given user berada di halaman "Lelang Spot Rate Shipper"
    When user mengklik tombol "Buka menu aksi"
    Then sistem menampilkan "nonaktif" pada "Request Jadwal"
    And sistem menampilkan "lelang dibatalkan" pada "Alert"

  @positive @priority-high @REQ-004 @screen-request-jadwal-shipper @AMS007-POS-004
  Skenario: [AMS007-POS-004] Halaman menampilkan info read-only dan seluruh penawaran eligible
    Given user berada di halaman "Request Jadwal Shipper"
    Then sistem menampilkan "read-only" pada "Informasi Lelang"
    And sistem menampilkan "tampil" pada "Card Penawaran Aktif"
    And sistem menampilkan "tampil" pada "Card Belum Input Jadwal"

  @negative @priority-high @REQ-004 @screen-request-jadwal-shipper @AMS007-NEG-007
  Skenario: [AMS007-NEG-007] Harga kadaluwarsa akibat lelang ulang tidak dapat dipilih
    Given user berada di halaman "Request Jadwal Shipper"
    Then sistem menampilkan "tidak tampil pada pilihan" pada "Harga Kadaluwarsa"

  @positive @priority-medium @REQ-005 @screen-request-jadwal-shipper @AMS007-POS-005
  Skenario: [AMS007-POS-005] Penawaran tanpa jadwal menampilkan badge dan tanda strip
    Given user berada di halaman "Request Jadwal Shipper"
    Then sistem menampilkan "badge merah" pada "Belum Input Jadwal"
    And sistem menampilkan "-" pada "ETD ETA Open Stack Closing Time"

  @negative @priority-medium @REQ-005 @screen-request-jadwal-shipper @AMS007-NEG-008
  Skenario: [AMS007-NEG-008] Penawaran yang sudah memiliki jadwal tidak diberi badge belum input
    Given user berada di halaman "Request Jadwal Shipper"
    Then sistem menampilkan "tidak tampil" pada "Belum Input Jadwal"
    And sistem menampilkan "nilai jadwal aktual" pada "ETD ETA Open Stack Closing Time"

  @positive @priority-high @REQ-006 @screen-request-jadwal-shipper @AMS007-POS-006
  Skenario: [AMS007-POS-006] Multi-select memperbarui counter secara real-time
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran 1"
    And user mencentang checkbox "Penawaran 2"
    And user mencentang checkbox "Penawaran 3"
    And user mencentang checkbox "Penawaran 4"
    Then sistem menampilkan "4 Terpilih" pada "Counter Terpilih"

  @negative @priority-high @REQ-006 @screen-request-jadwal-shipper @AMS007-NEG-009
  Skenario: [AMS007-NEG-009] Melepas satu pilihan menghapus status penuh Pilih Semua
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Pilih Semua"
    And user menghapus centang checkbox "Penawaran 2"
    Then sistem menampilkan "tidak tercentang penuh" pada "Pilih Semua"
    And sistem menampilkan "berkurang satu" pada "Counter Terpilih"

  @edge @priority-high @REQ-006 @screen-request-jadwal-shipper @AMS007-EDG-001
  Skenario: [AMS007-EDG-001] Pilihan lintas pagination tetap dihitung
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran Halaman 1"
    And user mengklik tombol "Halaman 2"
    And user mencentang checkbox "Penawaran Halaman 2"
    And user mengklik tombol "Halaman 1"
    Then sistem menampilkan "2 Terpilih" pada "Counter Terpilih"
    And sistem menampilkan "tetap tercentang" pada "Penawaran Halaman 1"

  @positive @priority-medium @REQ-007 @screen-request-jadwal-shipper @AMS007-POS-007
  Skenario: [AMS007-POS-007] Batal kembali tanpa menyimpan pilihan
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran 1"
    And user mengklik tombol "Batal"
    Then sistem menampilkan "halaman sebelumnya" pada "Lelang Spot Rate Shipper"
    And sistem menampilkan "tidak tersimpan" pada "Request Baru"

  @negative @priority-high @REQ-007 @screen-request-jadwal-shipper @AMS007-NEG-010
  Skenario: [AMS007-NEG-010] Nol pilihan membuat Kirim nonaktif
    Given user berada di halaman "Request Jadwal Shipper"
    Then sistem menampilkan "0 Terpilih" pada "Counter Terpilih"
    And sistem menampilkan "nonaktif" pada "Kirim"

  @positive @priority-high @REQ-008 @screen-request-jadwal-shipper @AMS007-POS-008
  Skenario: [AMS007-POS-008] Konfirmasi menyimpan request dan memberi notifikasi serta penanda
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran Vendor A"
    And user mencentang checkbox "Penawaran Vendor B"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "tampil" pada "Konfirmasi Request Jadwal"
    And user mengklik tombol "Konfirmasi"
    And sistem menampilkan "tersimpan per harga" pada "Request Jadwal"
    And sistem menampilkan "terkirim ke vendor terkait" pada "Push Notification"
    And sistem menampilkan "tampil" pada "Penanda Request Jadwal"

  @negative @priority-high @REQ-008 @screen-request-jadwal-shipper @AMS007-NEG-011
  Skenario: [AMS007-NEG-011] Pembatalan dialog konfirmasi tidak menyimpan request
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran 1"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Batal Konfirmasi"
    Then sistem menampilkan "tidak tersimpan" pada "Request Baru"
    And sistem menampilkan "pilihan tetap tersedia" pada "Request Jadwal Shipper"

  @positive @priority-high @REQ-009 @screen-detail-harga-penawaran-shipper @AMS007-POS-009
  Skenario: [AMS007-POS-009] Request berulang menambah jumlah request
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran yang Sama"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Konfirmasi"
    And user berada di halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "3" pada "Jumlah Request Jadwal"

  @negative @priority-high @REQ-009 @screen-detail-harga-penawaran-shipper @AMS007-NEG-012
  Skenario: [AMS007-NEG-012] Request jadwal tidak boleh mengubah harga penawaran
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Penawaran Rp16.000.000"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Konfirmasi"
    And user berada di halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "Rp16.000.000" pada "Harga Penawaran"

  @stress @priority-medium @REQ-009 @screen-detail-harga-penawaran-shipper @AMS007-STR-001
  Skenario: [AMS007-STR-001] Seratus request berulang tetap tercatat tanpa batas buatan
    Given user berada di halaman "Request Jadwal Shipper"
    When user mengklik tombol "Kirim Request Berulang 100 Kali"
    And user berada di halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "100" pada "Jumlah Request Jadwal"
    And sistem menampilkan "tetap" pada "Harga Penawaran"

  @positive @priority-high @REQ-010 @screen-daftar-penawaran-vendor @AMS007-POS-010
  Skenario: [AMS007-POS-010] Vendor membuka Update Jadwal dari card request aktif
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Tab Request Jadwal"
    Then sistem menampilkan "tampil" pada "Badge Request Jadwal"
    And user mengklik tombol "Buka menu aksi"
    And user mengklik tombol "Update Jadwal"
    And sistem menampilkan "dialog tampil" pada "Update Jadwal"

  @negative @priority-high @REQ-010 @screen-daftar-penawaran-vendor @AMS007-NEG-013
  Skenario: [AMS007-NEG-013] Aksi Update Jadwal hilang setelah request direspons
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Buka menu aksi"
    Then sistem menampilkan "tidak tampil" pada "Update Jadwal"
    And sistem menampilkan "tidak tampil" pada "Badge Request Jadwal"

  @positive @priority-high @REQ-011 @screen-lelang-spot-rate-vendor @AMS007-POS-011
  Skenario: [AMS007-POS-011] Vendor membuka Respon Request Jadwal dari Lelang Spot Rate
    Given user berada di halaman "Lelang Spot Rate Vendor"
    When user mengklik tombol "Tab Request Jadwal"
    And user mengklik tombol "Buka menu aksi"
    And user mengklik tombol "Respon Request Jadwal"
    Then sistem menampilkan "halaman tampil" pada "Respon Request Jadwal"

  @negative @priority-high @REQ-011 @screen-lelang-spot-rate-vendor @AMS007-NEG-014
  Skenario: [AMS007-NEG-014] Aksi Respon Request Jadwal tidak tampil tanpa request pending
    Given user berada di halaman "Lelang Spot Rate Vendor"
    When user mengklik tombol "Buka menu aksi"
    Then sistem menampilkan "tidak tampil" pada "Respon Request Jadwal"

  @positive @priority-high @REQ-012 @screen-respon-request-jadwal-vendor @AMS007-POS-012
  Skenario: [AMS007-POS-012] Dropdown No. Lelang memindahkan konteks request aktif
    Given user berada di halaman "Respon Request Jadwal Vendor"
    Then sistem menampilkan "read-only" pada "Informasi Umum"
    When user memilih "FCL-NRM-02/200526" pada field "No. Lelang"
    And sistem menampilkan "data FCL-NRM-02/200526" pada "Informasi Umum"
    And sistem menampilkan "daftar sesuai lelang kedua" pada "Pilih Harga Penawaran"

  @negative @priority-high @REQ-012 @screen-respon-request-jadwal-vendor @AMS007-NEG-015
  Skenario: [AMS007-NEG-015] Dropdown tidak memuat lelang vendor lain atau tanpa request aktif
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "No. Lelang"
    Then sistem menampilkan "tidak tersedia" pada "Lelang Vendor Lain"
    And sistem menampilkan "tidak tersedia" pada "Lelang Tanpa Request Aktif"

  @stress @priority-medium @REQ-012 @screen-respon-request-jadwal-vendor @AMS007-STR-002
  Skenario: [AMS007-STR-002] Dropdown tetap responsif untuk seribu lelang aktif
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "No. Lelang"
    And user mengisi field "Cari No. Lelang" dengan "FCL-NRM-999"
    And user memilih "FCL-NRM-999" pada field "No. Lelang"
    Then sistem menampilkan "diperbarui tanpa timeout" pada "Informasi Umum"

  @positive @priority-high @REQ-013 @screen-respon-request-jadwal-vendor @AMS007-POS-013
  Skenario: [AMS007-POS-013] Card hilang setelah Update berhasil
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "Update pada Penawaran 1"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "hilang dari daftar" pada "Penawaran 1"
    And sistem menampilkan "tetap tampil" pada "Penawaran 2"

  @negative @priority-high @REQ-013 @screen-respon-request-jadwal-vendor @AMS007-NEG-016
  Skenario: [AMS007-NEG-016] Daftar tidak menampilkan harga yang tidak diminta atau sudah direspons
    Given user berada di halaman "Respon Request Jadwal Vendor"
    Then sistem menampilkan "tidak tampil" pada "Harga Non-request"
    And sistem menampilkan "tidak tampil" pada "Harga Sudah Direspons"

  @positive @priority-high @REQ-014 @screen-respon-request-jadwal-vendor @AMS007-POS-014
  Skenario: [AMS007-POS-014] Seluruh respons membersihkan tab dan penanda request
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "Update"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "list kosong" pada "Pilih Harga Penawaran"
    And user mengklik tombol "Simpan"
    And user berada di halaman "Lelang Spot Rate Vendor"
    And sistem menampilkan "hilang" pada "Penanda Request Jadwal"

  @negative @priority-high @REQ-014 @screen-respon-request-jadwal-vendor @AMS007-NEG-017
  Skenario: [AMS007-NEG-017] Simpan tidak menutup halaman selama masih ada update pending
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "Simpan"
    Then sistem menampilkan "tetap terbuka" pada "Respon Request Jadwal Vendor"
    And sistem menampilkan "masih tampil" pada "Request Belum Direspons"

  @positive @priority-high @REQ-015 @screen-update-jadwal-vendor @AMS007-POS-015
  Skenario: [AMS007-POS-015] Modal membuka form jadwal baru Direct dalam keadaan kosong
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Update Jadwal"
    Then sistem menampilkan "read-only" pada "Informasi Harga"
    And sistem menampilkan "Direct terpilih" pada "Jenis Jadwal Kapal"
    And sistem menampilkan "kosong" pada "Field Jadwal"
    And user memilih "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM TIDAR"
    And user mengisi field "Voyage" dengan "088"

  @negative @priority-high @REQ-015 @screen-update-jadwal-vendor @AMS007-NEG-018
  Skenario: [AMS007-NEG-018] Batal modal membuang input tanpa menyimpan
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Nama Kapal" dengan "KAPAL SEMENTARA"
    And user mengklik tombol "Batal"
    Then sistem menampilkan "dialog tertutup" pada "Update Jadwal"
    And sistem menampilkan "tidak tersimpan" pada "Jadwal Baru"

  @positive @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-POS-016
  Skenario: [AMS007-POS-016] Jadwal Direct valid dapat dikirim tanpa Open Stack
    Given user berada di halaman "Update Jadwal Vendor"
    When user memilih "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM TIDAR"
    And user mengisi field "Voyage" dengan "088"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "berhasil disimpan" pada "Jadwal"

  @negative @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-NEG-019
  Skenario: [AMS007-NEG-019] Closing Time wajib diisi
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "wajib diisi" pada "Closing Time"

  @negative @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-NEG-020
  Skenario: [AMS007-NEG-020] Closing Time harus setelah waktu sekarang dan Open Stack
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Open Stack" dengan "24/09/2026 12:00"
    And user mengisi field "Closing Time" dengan "24/09/2026 11:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus lebih besar dari Open Stack dan waktu saat ini" pada "Closing Time"

  @negative @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-NEG-021
  Skenario: [AMS007-NEG-021] ETD wajib setelah Closing Time
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "24/09/2026 09:59"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus lebih besar dari Closing Time" pada "Berangkat (ETD)"

  @negative @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-NEG-022
  Skenario: [AMS007-NEG-022] ETA wajib setelah ETD
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "25/09/2026 09:59"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus lebih besar dari ETD" pada "Tiba (ETA)"

  @negative @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-NEG-023
  Skenario: [AMS007-NEG-023] ETD Connecting di luar rentang ditolak
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengklik tombol "Connecting"
    And user mengisi field "ETD Utama" dengan "25/09/2026 10:00"
    And user mengisi field "ETD Connecting 1" dengan "25/09/2026 09:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus setelah ETD sebelumnya dan tidak melebihi ETA" pada "ETD Connecting 1"

  @edge @priority-high @REQ-016 @screen-update-jadwal-vendor @AMS007-EDG-002
  Skenario: [AMS007-EDG-002] Batas waktu yang sama persis ditolak kecuali Connecting sama dengan ETA
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Open Stack" dengan "24/09/2026 10:00"
    And user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengisi field "ETD Connecting 1" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus lebih besar dari Open Stack" pada "Closing Time"

  @positive @priority-high @REQ-017 @screen-daftar-penawaran-vendor @AMS007-POS-017
  Skenario: [AMS007-POS-017] Kirim berhasil memperbarui status dan menghapus badge request
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    And user berada di halaman "Daftar Penawaran Vendor"
    Then sistem menampilkan "Input Penawaran" pada "Status Penawaran"
    And sistem menampilkan "hilang" pada "Belum Input Jadwal"
    And sistem menampilkan "hilang" pada "Request Jadwal"

  @negative @priority-high @REQ-017 @screen-daftar-penawaran-vendor @AMS007-NEG-024
  Skenario: [AMS007-NEG-024] Kirim gagal mempertahankan status request dan badge lama
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengklik tombol "Kirim"
    Then sistem menampilkan "tampil" pada "Validasi Jadwal"
    And user mengklik tombol "Batal"
    And user berada di halaman "Daftar Penawaran Vendor"
    And sistem menampilkan "tetap tampil" pada "Belum Input Jadwal"
    And sistem menampilkan "tetap tampil" pada "Request Jadwal"

  @positive @priority-high @REQ-018 @screen-detail-harga-penawaran-shipper @AMS007-POS-018
  Skenario: [AMS007-POS-018] Jadwal vendor langsung tercermin pada detail shipper
    Given user berada di halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "nilai jadwal baru" pada "ETD ETA Closing Time"
    And sistem menampilkan "detail transit baru" pada "Info Connecting"
    And sistem menampilkan "status sesuai jadwal" pada "Tombol Pesan"
    And sistem menampilkan "nilai semula" pada "Harga Penawaran"

  @negative @priority-high @REQ-018 @screen-detail-harga-penawaran-shipper @AMS007-NEG-025
  Skenario: [AMS007-NEG-025] Perubahan jadwal tidak boleh mengubah harga shipper
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "24/09/2026 10:00"
    And user mengisi field "Berangkat (ETD)" dengan "25/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "27/09/2026 10:00"
    And user mengklik tombol "Kirim"
    And user berada di halaman "Detail Harga Penawaran Shipper"
    Then sistem menampilkan "Rp16.000.000" pada "Harga Penawaran"

  @positive @priority-high @REQ-019 @screen-riwayat-perubahan-vendor @AMS007-POS-019
  Skenario: [AMS007-POS-019] Update jadwal berhasil tercatat di Riwayat Perubahan
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Buka menu aksi"
    And user mengklik tombol "Riwayat Perubahan"
    Then sistem menampilkan "aktor, waktu WIB, dan nilai perubahan" pada "Update Jadwal"

  @negative @priority-high @REQ-019 @screen-update-jadwal-vendor @AMS007-NEG-026
  Skenario: [AMS007-NEG-026] Update setelah Rencana Akhir Kirim ditolak
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Update Jadwal"
    Then sistem menampilkan "sudah melewati Rencana Akhir Kirim" pada "Alert"
    And sistem menampilkan "tidak dapat disimpan" pada "Update Jadwal"

  @negative @priority-high @REQ-019 @screen-update-jadwal-vendor @AMS007-NEG-027
  Skenario: [AMS007-NEG-027] Harga N/A atau kadaluwarsa tidak dapat di-update
    Given user berada di halaman "Daftar Penawaran Vendor"
    When user mengklik tombol "Update Jadwal"
    Then sistem menampilkan "harga N/A atau kadaluwarsa" pada "Alert"
    And sistem menampilkan "tidak dapat disimpan" pada "Update Jadwal"

  @positive @priority-high @REQ-020 @screen-update-jadwal-vendor @AMS007-POS-020
  Skenario: [AMS007-POS-020] Validasi dan riwayat menggunakan waktu WIB
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "23/09/2026 09:01"
    And user mengisi field "Berangkat (ETD)" dengan "23/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "24/09/2026 10:00"
    And user mengklik tombol "Kirim"
    And user berada di halaman "Riwayat Perubahan Vendor"
    Then sistem menampilkan "23/09/2026 09:00 WIB" pada "Waktu Perubahan"

  @negative @priority-high @REQ-020 @screen-update-jadwal-vendor @AMS007-NEG-028
  Skenario: [AMS007-NEG-028] Validasi tidak salah memakai UTC sebagai waktu lokal
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "23/09/2026 08:59"
    And user mengisi field "Berangkat (ETD)" dengan "23/09/2026 10:00"
    And user mengisi field "Tiba (ETA)" dengan "24/09/2026 10:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "harus lebih besar dari waktu saat ini" pada "Closing Time"

  @edge @priority-high @REQ-020 @screen-update-jadwal-vendor @AMS007-EDG-003
  Skenario: [AMS007-EDG-003] Pergantian hari WIB divalidasi tanpa bergeser tanggal
    Given user berada di halaman "Update Jadwal Vendor"
    When user mengisi field "Closing Time" dengan "01/01/2027 00:00"
    And user mengisi field "Berangkat (ETD)" dengan "01/01/2027 01:00"
    And user mengisi field "Tiba (ETA)" dengan "02/01/2027 01:00"
    And user mengklik tombol "Kirim"
    Then sistem menampilkan "berhasil disimpan dengan tanggal 1 Januari WIB" pada "Jadwal"

  @stress @priority-medium @REQ-006 @screen-request-jadwal-shipper @AMS007-STR-003
  Skenario: [AMS007-STR-003] Pilih Semua dan counter stabil pada seribu penawaran
    Given user berada di halaman "Request Jadwal Shipper"
    When user mencentang checkbox "Pilih Semua Halaman 1"
    And user mengklik tombol "Halaman 50"
    And user mencentang checkbox "Pilih Semua Halaman 50"
    Then sistem menampilkan "40 Terpilih" pada "Counter Terpilih"
    And user mengklik tombol "Halaman 1"
    And sistem menampilkan "tetap tercentang" pada "Pilih Semua"

  @stress @priority-high @REQ-008 @screen-request-jadwal-shipper @AMS007-STR-004
  Skenario: [AMS007-STR-004] Pengajuan massal lintas vendor menyimpan dan mengirim notifikasi sekali per target
    Given user berada di halaman "Request Jadwal Shipper"
    When user mengklik tombol "Pilih 500 Penawaran"
    And user mengklik tombol "Kirim"
    And user mengklik tombol "Konfirmasi"
    Then sistem menampilkan "500 request tersimpan" pada "Request Jadwal"
    And sistem menampilkan "terkirim ke 100 vendor tanpa duplikat tidak semestinya" pada "Push Notification"

  @stress @priority-high @REQ-013 @screen-respon-request-jadwal-vendor @AMS007-STR-005
  Skenario: [AMS007-STR-005] Dua sesi paralel merespons request yang sama secara idempoten
    Given user berada di halaman "Respon Request Jadwal Vendor"
    When user mengklik tombol "Kirim Jadwal dari Sesi A"
    And user mengklik tombol "Kirim Jadwal dari Sesi B"
    Then sistem menampilkan "hanya satu respons efektif" pada "Request Jadwal"
    And sistem menampilkan "pesan request sudah diproses" pada "Sesi B"
    And sistem menampilkan "tidak ada duplikasi inkonsisten" pada "Riwayat Perubahan"

