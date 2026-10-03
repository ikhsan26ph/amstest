# language: id
Feature: Live Bidding Spot Rate dari POV vendor
  Vendor terundang dapat memantau dan menurunkan harga penawaran secara aman selama lelang berlangsung.

  @positive @priority-high @REQ-001 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-001] Vendor melihat satu tampilan Live Bidding berisi lelang aktif yang mengundangnya
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "aktif tanpa tab Laporan Lelang" pada "Navigasi Live Bidding"
    And sistem menampilkan "lelang aktif yang mengundang vendor" pada "Card lelang"

  @negative @priority-high @REQ-001 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-001] Lelang yang tidak mengundang vendor tidak ditampilkan
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tidak terlihat" pada "Card lelang tidak berhak"

  @positive @priority-high @REQ-002 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-002] Card muncul otomatis saat waktu buka tercapai dalam WIB
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "muncul otomatis saat waktu buka WIB" pada "Card lelang terjadwal"

  @negative @priority-high @REQ-002 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-002] Card lelang yang dibatalkan langsung hilang
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tidak terlihat tanpa reload" pada "Card lelang dibatalkan"

  @positive @priority-high @REQ-003 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-003] Setiap jenis armada memiliki card sendiri dan urutan terbaru di atas
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "dua card terpisah untuk dua jenis armada" pada "Daftar card lelang"
    And sistem menampilkan "berada paling atas" pada "Card lelang terbaru"

  @negative @priority-high @REQ-003 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-003] Data lintas jenis tidak tercampur pada satu card
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tidak memuat Top 3 atau opsi Wing Box" pada "Card Tronton Box"

  @positive @priority-medium @REQ-004 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-004] Vendor menerapkan seluruh filter daftar lelang
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Filter"
    And user mengisi field "No. Lelang" dengan "FCL-NRM-01/200526"
    And user mengisi field "Buka Lelang" dengan "11/05/2026 08:00 - 11/05/2026 09:00"
    And user mengisi field "Tutup Lelang" dengan "18/05/2026 14:00 - 18/05/2026 16:00"
    And user mengisi field "Periode Pengiriman" dengan "20/05/2026 00:00 - 31/05/2026 23:59"
    And user memilih "FCL" pada "Jenis Pengiriman"
    And user memilih "Normal" pada "Tipe Pengiriman"
    And user memilih "Surabaya" pada "Kota Asal"
    And user memilih "Makassar" pada "Kota Tujuan"
    And user memilih "Tanjung Perak" pada "Pelabuhan Asal"
    And user memilih "Makassar" pada "Pelabuhan Tujuan"
    And user mengklik "Terapkan"
    Then sistem menampilkan "hanya data yang memenuhi seluruh filter" pada "Daftar card lelang"

  @negative @priority-medium @REQ-004 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-004] Rentang tanggal terbalik ditolak
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Filter"
    And user mengisi field "Buka Lelang" dengan "12/05/2026 09:00 - 11/05/2026 08:00"
    And user mengklik "Terapkan"
    Then sistem menampilkan "Tanggal awal tidak boleh melewati tanggal akhir" pada "Validasi Buka Lelang"

  @positive @priority-medium @REQ-005 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-005] Filter kota cocok dengan salah satu titik rute multipickup
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Filter"
    And user memilih "Sidoarjo" pada "Kota Asal"
    And user mengklik "Terapkan"
    Then sistem menampilkan "terlihat karena salah satu titik cocok" pada "Card Multipickup"

  @negative @priority-medium @REQ-005 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-005] Filter pelabuhan tidak memasukkan lelang FTL
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Filter"
    And user memilih "Tanjung Perak" pada "Pelabuhan Asal"
    And user mengklik "Terapkan"
    Then sistem menampilkan "tidak terlihat akibat filter pelabuhan" pada "Card FTL"

  @positive @priority-medium @REQ-006 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-006] Sub-tab FCL dan pagination menampilkan kelompok data yang tepat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "aktif" pada "Tab Semua Jenis Pengiriman"
    And sistem menampilkan "20" pada "Tampilkan"
    When user mengklik "Tab FCL"
    Then sistem menampilkan "hanya card FCL" pada "Daftar card lelang"
    When user mengklik "Tab FTL"
    Then sistem menampilkan "hanya card FTL" pada "Daftar card lelang"
    When user mengklik "Tab FCL"
    And user mengklik "Halaman 2"
    Then sistem menampilkan "hanya FCL pada data 21 sampai 40" pada "Daftar card lelang"

  @negative @priority-low @REQ-006 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-006] Nilai page size tidak didukung dikembalikan ke default
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user memilih "7" pada "Tampilkan"
    Then sistem menampilkan "20" pada "Tampilkan"
    And sistem menampilkan "maksimal 20 card" pada "Daftar card lelang"

  @positive @priority-high @REQ-007 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-007] Card menampilkan seluruh informasi dan aksi wajib
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "No. Lelang, jenis pengiriman, rute, jenis armada, periode, countdown, Top 3, Total Penawaran, form Bid, Riwayat Harga Penawaran, dan Detail Lelang" pada "Card lelang"

  @negative @priority-low @REQ-007 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-007] Badge tipe pengiriman tidak tampil untuk tipe Normal
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tidak terlihat pada card Normal" pada "Badge tipe pengiriman"
    And sistem menampilkan "terlihat" pada "Badge FTL"

  @positive @priority-medium @REQ-008 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-008] Card Lelang Ulang menampilkan badge dan memindahkan Detail Lelang
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "terlihat pada baris Top 3" pada "Badge Lelang Ulang"
    And sistem menampilkan "terlihat di bagian bawah card" pada "Detail Lelang"

  @negative @priority-low @REQ-008 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-008] Card biasa tidak menampilkan badge Lelang Ulang
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tidak terlihat" pada "Badge Lelang Ulang"
    And sistem menampilkan "terlihat pada baris Top 3" pada "Detail Lelang"

  @positive @priority-medium @REQ-009 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-009] Link rute Multipoint membuka detail pada kedua sisi
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Multipickup"
    Then sistem menampilkan "daftar titik asal" pada "Dialog Detail Multipickup"
    When user mengklik "Tutup dialog rute"
    And user mengklik "Multidrop"
    Then sistem menampilkan "daftar titik tujuan" pada "Dialog Detail Multidrop"

  @negative @priority-low @REQ-009 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-009] Rute Normal tidak membuka dialog titik banyak
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Teks rute Normal"
    Then sistem menampilkan "tidak terlihat" pada "Dialog detail rute"

  @positive @priority-high @REQ-010 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-010] Countdown berkurang setiap detik dan warna mengikuti sisa waktu
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "format Hari Jam Menit Detik" pada "Countdown"
    And sistem menampilkan "berkurang satu detik" pada "Countdown detik berikutnya"
    And sistem menampilkan "sesuai sisa waktu" pada "Warna countdown"

  @negative @priority-high @REQ-010 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-010] Card kedaluwarsa tidak bertahan pada 00:00:00:00
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "00:00:00:00" pada "Countdown"
    And sistem menampilkan "tidak terlihat" pada "Card lelang kedaluwarsa"

  @positive @priority-high @REQ-011 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-011] Posisi vendor sendiri ditampilkan sementara posisi lain dimasking
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "highlight, nama vendor, dan Rp 8.000.000" pada "Rank vendor sendiri"
    And sistem menampilkan "Rp â€¢â€¢â€¢â€¢â€¢â€¢â€¢" pada "Rank vendor lain"

  @negative @priority-high @REQ-011 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-011] Vendor di luar Top 3 tidak dapat melihat identitas semua peringkat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "Rp â€¢â€¢â€¢â€¢â€¢â€¢â€¢" pada "Rank 1"
    And sistem menampilkan "Rp â€¢â€¢â€¢â€¢â€¢â€¢â€¢" pada "Rank 2"
    And sistem menampilkan "Rp â€¢â€¢â€¢â€¢â€¢â€¢â€¢" pada "Rank 3"

  @positive @priority-high @REQ-012 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-012] Top 3 mengikuti harga dan tie-break lalu diperbarui realtime
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "harga terendah dan timestamp tercepat berada lebih atas" pada "Top 3"
    And sistem menampilkan "bid baru tampil tanpa reload" pada "Top 3 realtime"

  @negative @priority-high @REQ-012 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-012] Top 3 yang sudah ditutup tidak berubah oleh event bid terlambat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "urutan tetap setelah lelang tutup" pada "Top 3 terkunci"

  @positive @priority-high @REQ-013 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-013] Total Penawaran dan ranking Lelang Ulang memakai data yang tepat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Lelang sedang berada pada periode Lelang Ulang dan memiliki harga lama vendor
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "3 dari 10 Vendor" pada "Total Penawaran"
    And sistem menampilkan "normal" pada "Warna Total Penawaran"
    And sistem menampilkan "tersedia sebagai basis bid" pada "Opsi harga lama"
    And sistem menampilkan "hanya bid yang diajukan selama periode ulang" pada "Top 3 Lelang Ulang"

  @negative @priority-high @REQ-013 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-013] FCL tanpa jadwal tidak dihitung sebagai penawaran lengkap
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "0 dari 10 Vendor" pada "Total Penawaran"
    And sistem menampilkan "merah" pada "Warna Total Penawaran"

  @positive @priority-high @REQ-014 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-014] Form Bid menampilkan opsi aktif sesuai jenis dan format Rupiah
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user memilih "ASDP" pada "Pelayaran"
    And user mengisi field "Harga Baru" dengan "15900000"
    Then sistem menampilkan "Rp 15.900.000" pada "Harga Baru"

  @negative @priority-high @REQ-014 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-014] Opsi tidak aktif atau milik card lain tidak tersedia
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Pelayaran"
    Then sistem menampilkan "tidak terlihat" pada "Opsi Pelayaran nonaktif"
    And sistem menampilkan "tidak terlihat" pada "Opsi Pelayaran dari kontainer lain"

  @positive @priority-high @REQ-015 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-015] Vendor dengan penawaran awal mendapat opsi Bid
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Jenis Kendaraan"
    Then sistem menampilkan "terlihat" pada "Opsi Tronton Box"

  @negative @priority-high @REQ-015 @screen-tidak-dapat-bid-harga
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-015] Vendor tanpa penawaran awal mendapat alert arahan
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Bid Harga"
    Then sistem menampilkan "Anda belum memiliki harga penawaran pada lelang ini. Silakan input harga melalui menu Input Harga Penawaran" pada "Dialog belum punya penawaran"

  @positive @priority-high @REQ-016 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-016] Harga lebih rendah lolos validasi awal
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user memilih "Tronton Box" pada "Jenis Kendaraan"
    And user mengisi field "Harga Baru" dengan "7900000"
    And user mengklik "Bid Harga"
    Then sistem menampilkan "Apakah Harga Telah Sesuai?" pada "Dialog konfirmasi bid"

  @negative @priority-high @REQ-016 @screen-tidak-dapat-bid-harga
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-016] Harga sama atau lebih besar ditolak dengan pesan yang sesuai
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user memilih "Tronton Box" pada "Jenis Kendaraan"
    And user mengisi field "Harga Baru" dengan "8100000"
    And user mengklik "Bid Harga"
    Then sistem menampilkan "Harga penawaran tidak boleh lebih besar dari harga sebelumnya" pada "Dialog Tidak Dapat Bid Harga"
    When user mengklik "Mengerti"
    And user mengisi field "Harga Baru" dengan "8000000"
    And user mengklik "Bid Harga"
    Then sistem menampilkan "Harga penawaran sama dengan harga sebelumnya" pada "Dialog Tidak Dapat Bid Harga"

  @positive @priority-high @REQ-017 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-017] Konfirmasi Ya menyimpan bid dan memperbarui card
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user memilih "ASDP" pada "Pelayaran"
    And user mengisi field "Harga Baru" dengan "15900000"
    And user mengklik "Bid Harga"
    And user mengklik "Ya"
    Then sistem menampilkan "Harga penawaran berhasil disimpan" pada "Toast sukses"
    And sistem menampilkan "Rp 0" pada "Harga Baru"
    And sistem menampilkan "Rp 15.900.000" pada "Top 3"

  @negative @priority-high @REQ-017 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-017] Konfirmasi Batal tidak menyimpan bid
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user memilih "ASDP" pada "Pelayaran"
    And user mengisi field "Harga Baru" dengan "15900000"
    And user mengklik "Bid Harga"
    And user mengklik "Batal"
    Then sistem menampilkan "tetap memakai harga sebelumnya" pada "Top 3"
    And sistem menampilkan "tidak terlihat" pada "Toast sukses"

  @positive @priority-high @REQ-018 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-018] Beberapa bid selama lelang buka seluruhnya tercatat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    Then sistem menampilkan "harga awal dan seluruh bid terbaru" pada "Tabel riwayat"

  @negative @priority-high @REQ-018 @screen-tidak-dapat-bid-harga
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-018] Submit saat lelang baru saja tutup ditolak
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user memilih "Tronton Box" pada "Jenis Kendaraan"
    And user mengisi field "Harga Baru" dengan "7900000"
    And user mengklik "Bid Harga"
    And user mengklik "Ya"
    Then sistem menampilkan "Harga penawaran sudah melewati tanggal tutup lelang" pada "Dialog lelang tutup"
    And sistem menampilkan "tidak tersedia" pada "Aksi ubah atau hapus harga"

  @positive @priority-medium @REQ-019 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-019] Link Detail Lelang membuka lelang Spot Rate yang tepat
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Detail Lelang"
    Then sistem menampilkan "nomor lelang yang dipilih" pada "Halaman Detail Lelang Spot Rate"

  @negative @priority-high @REQ-019 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-019] Deep link detail lelang tanpa hak akses ditolak
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    When user membuka "Detail Lelang Spot Rate tanpa undangan"
    Then sistem menampilkan "Anda tidak memiliki akses ke lelang ini" pada "Pesan akses ditolak"

  @positive @priority-high @REQ-020 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-020] Dialog riwayat menampilkan konteks FCL dan harga milik vendor
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    Then sistem menampilkan "No. Lelang, Jenis Pengiriman, Jenis Kontainer, Skema Pengiriman, rute dan alamat" pada "Dialog Riwayat Harga Penawaran"
    And sistem menampilkan "harga awal dan bid milik vendor" pada "Tabel riwayat"

  @negative @priority-high @REQ-020 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-020] Dialog riwayat tidak menampilkan harga vendor lain
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    Then sistem menampilkan "tidak terlihat" pada "Baris vendor lain"

  @positive @priority-medium @REQ-021 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-POS-021] Riwayat dapat difilter diurutkan dan dipaginasi
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    And user memilih "ASDP" pada "Semua Pelayaran"
    And user mengklik "Pelayaran header"
    And user mengklik "Harga Penawaran header"
    And user mengklik "Tanggal Input"
    And user memilih "20" pada "Tampilkan riwayat"
    And user mengklik "Halaman 2 riwayat"
    Then sistem menampilkan "data ASDP terurut pada halaman kedua" pada "Tabel riwayat"

  @negative @priority-low @REQ-021 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-NEG-021] Filter riwayat tanpa kecocokan menampilkan empty state stabil
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga dan jadwal aktif untuk Pelayaran ASDP pada kontainer 20 Feet Dry
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    And user memilih "Pelayaran tanpa riwayat" pada "Semua Pelayaran"
    Then sistem menampilkan "Tidak ada data" pada "Tabel riwayat"
    And sistem menampilkan "tidak aktif" pada "Pagination riwayat"
    When user mengklik "Tutup Riwayat Harga Penawaran"

  @edge @priority-high @REQ-002 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-EDG-001] Batas waktu buka memakai WIB saat zona klien berbeda
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "muncul tepat pada 00:00:00 WIB" pada "Card lelang batas WIB"

  @edge @priority-high @REQ-010 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-EDG-002] Warna dan visibilitas tepat pada batas 24 jam 1 jam dan nol
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "oranye" pada "Countdown 24 jam"
    And sistem menampilkan "merah" pada "Countdown 1 jam"
    And sistem menampilkan "card hilang" pada "Countdown nol"

  @edge @priority-high @REQ-016 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-EDG-003] Harga kosong dan nol menampilkan helper serta border error
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user memilih "Tronton Box" pada "Jenis Kendaraan"
    And user mengisi field "Harga Baru" dengan ""
    And user mengklik "Bid Harga"
    Then sistem menampilkan "Harga Baru wajib diisi" pada "Helper Harga Baru"
    When user mengisi field "Harga Baru" dengan "0"
    And user mengklik "Bid Harga"
    Then sistem menampilkan "error" pada "Border Harga Baru"

  @edge @priority-high @REQ-012 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-EDG-004] Tie-break lengkap menghasilkan urutan deterministik
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "urutan konsisten untuk harga dan timestamp yang sama" pada "Top 3"

  @edge @priority-medium @REQ-004 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-EDG-005] Filter menerima karakter khusus sebagai data dan Reset membersihkan semua
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Filter"
    And user mengisi field "No. Lelang" dengan "' OR 1=1 -- <script>"
    And user mengklik "Terapkan"
    Then sistem menampilkan "Tidak ada data" pada "Daftar card lelang"
    When user mengklik "Reset"
    Then sistem menampilkan "kosong" pada "No. Lelang"
    And sistem menampilkan "kembali ke daftar tanpa filter" pada "Daftar card lelang"

  @stress @priority-medium @REQ-003 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-STR-001] Seribu card tetap terurut dan dipaginasi konsisten
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "20 card pertama dari 1000 data" pada "Daftar card lelang"
    When user mengklik "Halaman terakhir"
    Then sistem menampilkan "card tersisa tanpa duplikasi" pada "Daftar card lelang"

  @stress @priority-high @REQ-012 @screen-live-bidding-spot-rate
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-STR-002] Bid paralel banyak vendor menghasilkan Top 3 konsisten realtime
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    When user membuka "Live Bidding Spot Rate"
    Then sistem menampilkan "tiga peringkat final konsisten setelah 100 bid paralel" pada "Top 3 realtime"

  @stress @priority-high @REQ-018 @screen-riwayat-harga-penawaran
  Scenario: [AMS005-LIVE-BIDDING-VENDOR-STR-003] Seratus bid berurutan tercatat lengkap tanpa kehilangan data
    Given Vendor terautentikasi dan memiliki akses ke menu Lelang Spot Rate
    And Vendor diundang ke lelang Spot Rate yang berstatus Sedang Buka
    And Vendor memiliki harga penawaran aktif untuk Jenis Kendaraan Tronton Box
    When user membuka "Live Bidding Spot Rate"
    And user mengklik "Riwayat Harga Penawaran"
    Then sistem menampilkan "101 entri termasuk harga awal" pada "Tabel riwayat"
    When user mengklik "Halaman terakhir riwayat"
    Then sistem menampilkan "bid pertama tetap tersedia" pada "Baris riwayat terakhir"
