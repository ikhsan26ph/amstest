# language: id
Feature: Monitoring Live Bidding Spot Rate dari POV Shipper
  Sebagai Shipper Admin
  Saya ingin memonitor lelang berjalan dan laporan hasil
  Agar status, ranking, dan ekspor lelang akurat

  @positive @priority-high @REQ-001 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-001] Live Bidding hanya menampilkan lelang Spot Rate milik shipper
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Tab Live Bidding dan Laporan Lelang: tersedia"
    Then sistem menampilkan "Daftar lelang: hanya Spot Rate FTL/FCL milik shipper dengan waktu WIB"

  @negative @priority-high @REQ-001 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-001] Lelang kontrak dan milik shipper lain tidak bocor ke halaman
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengisi field "No. Lelang" dengan "KONTRAK-OTHER-001"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Daftar lelang: tidak memuat lelang kontrak atau milik shipper lain"

  @positive @priority-medium @REQ-002 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-002] Filter gabungan diterapkan dan Reset mengosongkan seluruh filter
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengisi field "No. Lelang" dengan "FTL-NRM-01/200726"
    And user mengisi field "Buka Lelang" dengan "11/05/2026 08:11"
    And user memilih "FTL" pada field "Jenis Pengiriman"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Card lelang: sesuai seluruh filter"
    And user mengklik tombol "Reset"
    Then sistem menampilkan "Filter: kembali kosong"

  @negative @priority-medium @REQ-002 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-002] Rentang tanggal terbalik ditolak
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengisi field "Periode Pengiriman" dengan "18/05/2026 15:00 - 11/05/2026 08:11"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Validasi Periode Pengiriman: tanggal awal tidak boleh setelah tanggal akhir"

  @positive @priority-medium @REQ-003 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-003] Filter kota mencocokkan salah satu titik multipickup atau multidrop
    Given user berada di halaman "Live Bidding Spot Rate"
    When user memilih "Surabaya" pada field "Kota Asal"
    And user memilih "Makassar" pada field "Kota Tujuan"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Card rute multipoint: muncul bila salah satu titik cocok"

  @negative @priority-medium @REQ-003 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-003] Filter pelabuhan tidak menghasilkan kecocokan semu pada FTL
    Given user berada di halaman "Live Bidding Spot Rate"
    When user memilih "FTL" pada field "Jenis Pengiriman"
    And user memilih "Tanjung Perak" pada field "Pelabuhan Asal"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Card FTL: tidak difilter menggunakan atribut pelabuhan"

  @positive @priority-medium @REQ-004 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-004] Sub-tab FCL dan pagination mempertahankan filter aktif
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengklik tombol "FCL (Full Container Load)"
    And user memilih "20" pada field "Tampilkan"
    And user mengklik tombol "Halaman 2"
    Then sistem menampilkan "Card lelang: hanya FCL dan filter tetap aktif"

  @negative @priority-medium @REQ-004 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-004] Nilai page size di luar opsi tidak diterapkan
    Given user berada di halaman "Live Bidding Spot Rate"
    When user memilih "nilai tidak didukung" pada field "Tampilkan"
    Then sistem menampilkan "Tampilkan: tetap pada opsi valid dan default 20 saat awal"

  @positive @priority-high @REQ-005 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-005] Card muncul saat buka dan berpindah otomatis saat tutup
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Card lelang: muncul tepat saat status Sedang Buka"
    Then sistem menampilkan "Laporan Lelang: menerima card setelah waktu tutup tanpa reload"

  @negative @priority-high @REQ-005 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-005] Lelang yang dibatalkan langsung hilang dan tidak masuk laporan
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Card lelang dibatalkan: hilang dari Live Bidding"
    And user mengklik tombol "Laporan Lelang"
    Then sistem menampilkan "Laporan Lelang: tidak memuat lelang dibatalkan"

  @positive @priority-medium @REQ-006 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-006] Nomor lelang dengan beberapa armada menjadi card terpisah
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengisi field "No. Lelang" dengan "FTL-NRM-01/200726"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Card lelang: satu card per jenis armada dengan Top 3 masing-masing"

  @negative @priority-medium @REQ-006 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-006] Badge tipe Normal tidak ditampilkan dan data antar armada tidak tercampur
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Badge tipe Normal: tidak tampil"
    Then sistem menampilkan "Top 3 per armada: tidak menggunakan penawaran armada lain"

  @positive @priority-medium @REQ-007 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-007] Link multipickup dan multidrop membuka detail titik yang tepat
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengklik tombol "Multipickup"
    Then sistem menampilkan "Detail Multipickup: seluruh titik asal"
    And user mengklik tombol "Multidrop"
    Then sistem menampilkan "Detail Multidrop: seluruh titik tujuan"

  @negative @priority-medium @REQ-007 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-007] Rute tanpa detail lengkap tidak membuka dialog kosong atau salah
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengklik tombol "Link detail rute tidak lengkap"
    Then sistem menampilkan "Detail rute: menampilkan fallback aman tanpa mencampur lelang lain"

  @positive @priority-high @REQ-008 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-008] Countdown berkurang per detik dan card hilang pada nol
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Countdown: format Hari:Jam:Menit:Detik dan berkurang realtime"
    Then sistem menampilkan "Card lelang: hilang ketika countdown 00:00:00:00"

  @negative @priority-high @REQ-008 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-008] Countdown tidak menjadi negatif saat waktu klien berbeda
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Countdown: tidak menampilkan nilai negatif dan mengikuti waktu WIB server"

  @positive @priority-high @REQ-009 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-009] Top 3 mengikuti DPP dan seluruh aturan tie-break
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3: DPP terendah lalu waktu, rating, kemenangan, armada atau kapal, dan created date"

  @negative @priority-high @REQ-009 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-009] Bid tidak valid tidak memengaruhi ranking
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3: mengabaikan harga kosong, negatif, atau bid di luar periode"

  @positive @priority-high @REQ-010 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-010] Top 3 realtime menyembunyikan vendor dan menampilkan nominal
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3: berubah tanpa reload, nama vendor tersembunyi, harga terlihat"

  @negative @priority-high @REQ-010 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-010] Identitas vendor tidak terekspos pada UI lelang terbuka
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Nama vendor: tidak terlihat pada slot, tooltip, atau label aksesibel Top 3"

  @positive @priority-medium @REQ-011 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-011] Total penawaran dan ranking lelang ulang dihitung benar
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Total Penawaran: x dari y Vendor sesuai input valid"
    Then sistem menampilkan "Lelang Ulang: Top 3 memakai bid yang berlaku pada periode ulang"

  @negative @priority-medium @REQ-011 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-011] Vendor FCL tanpa jadwal tidak dihitung sebagai pemberi penawaran
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Total Penawaran FCL: tidak menambah x sampai harga dan jadwal lengkap"

  @positive @priority-medium @REQ-012 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-012] Detail Lelang membuka lelang tepat dan halaman tetap read-only
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengklik tombol "Detail Lelang"
    Then sistem menampilkan "Detail Lelang Spot Rate: nomor lelang yang dipilih"

  @negative @priority-medium @REQ-012 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-012] Kontrol bid dan Lihat Penawaran tidak tersedia saat lelang buka
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Aksi card: tidak memuat input bid atau tombol Lihat Penawaran"

  @positive @priority-high @REQ-013 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-013] Laporan default H+3 dan filter menemukan data lebih lama
    Given user berada di halaman "Laporan Lelang"
    Then sistem menampilkan "Card laporan: lelang tutup sampai H+3 dalam urutan terbaru"
    And user mengisi field "Tutup Lelang" dengan "01/05/2026 00:00"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "Card historis: lelang lebih lama dari H+3"

  @negative @priority-high @REQ-013 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-013] Lelang belum tutup dan dibatalkan tidak tampil di laporan
    Given user berada di halaman "Laporan Lelang"
    Then sistem menampilkan "Card laporan: tidak memuat lelang aktif atau dibatalkan"

  @positive @priority-medium @REQ-014 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-014] Laporan menampilkan vendor harga final dan navigasi penawaran
    Given user berada di halaman "Laporan Lelang"
    Then sistem menampilkan "Top 3: nama vendor dan harga termasuk PPN/PPh"
    And user mengklik tombol "Lihat Penawaran"
    Then sistem menampilkan "Detail Harga Penawaran: lelang yang dipilih"

  @negative @priority-medium @REQ-014 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-014] Bid terlambat tidak mengubah ranking yang sudah terkunci
    Given user berada di halaman "Laporan Lelang"
    Then sistem menampilkan "Top 3 setelah tutup: tetap sama setelah bid terlambat diterima atau ditolak"

  @positive @priority-high @REQ-015 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-POS-015] Export menghasilkan seluruh hasil filter sesuai template
    Given user berada di halaman "Laporan Lelang"
    When user memilih "PT Trans Logistik Jaya" pada field "Vendor"
    And user mengklik tombol "Terapkan"
    And user mengklik tombol "Export"
    Then sistem menampilkan "File Excel: seluruh hasil filter lintas halaman dengan satu baris per penawaran"

  @negative @priority-high @REQ-015 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-NEG-015] Kegagalan export tidak menghasilkan file rusak
    Given user berada di halaman "Laporan Lelang"
    When user mengklik tombol "Export"
    Then sistem menampilkan "Status export: kesalahan ditampilkan dan file parsial tidak diunduh"

  @edge @priority-high @REQ-008 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-EDG-001] Warna countdown tepat pada batas 24 jam dan 1 jam
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Countdown 24:00:00: oranye"
    Then sistem menampilkan "Countdown 01:00:00: merah"
    Then sistem menampilkan "Countdown di atas 24 jam: abu"

  @edge @priority-high @REQ-009 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-EDG-002] Tie-break berakhir pada vendor baru rating default 3,0
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3 harga sama: menggunakan timestamp lalu rating default 3,0 dan tie-break lanjutan"

  @edge @priority-high @REQ-010 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-EDG-003] Top 3 menangani nol satu dan tepat tiga penawaran
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3: slot kosong dimasking untuk jumlah penawaran 0, 1, dan 3"

  @edge @priority-high @REQ-013 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-EDG-004] Retensi laporan tepat pada batas H+3
    Given user berada di halaman "Laporan Lelang"
    Then sistem menampilkan "Card laporan pada tepat H+3: masih tampil"
    Then sistem menampilkan "Card laporan setelah H+3: hanya tampil melalui filter"

  @edge @priority-high @REQ-015 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-EDG-005] Lelang tanpa penawaran tetap diekspor satu baris kosong
    Given user berada di halaman "Laporan Lelang"
    When user mengisi field "No. Lelang" dengan "FCL-MTD-NOBID"
    And user mengklik tombol "Terapkan"
    And user mengklik tombol "Export"
    Then sistem menampilkan "File Excel: satu baris lelang dengan kolom penawaran kosong"

  @stress @priority-medium @REQ-004 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-STR-001] Pagination dan filter stabil pada ribuan card
    Given user berada di halaman "Live Bidding Spot Rate"
    When user memilih "20" pada field "Tampilkan"
    And user mengklik tombol "Halaman terakhir"
    Then sistem menampilkan "Daftar lelang volume besar: responsif, urutan konsisten, tanpa duplikasi"

  @stress @priority-medium @REQ-010 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-STR-002] Top 3 tetap konsisten saat banyak bid realtime bersamaan
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Top 3 saat bid paralel: hasil akhir konsisten tanpa reload atau urutan sementara salah"

  @stress @priority-medium @REQ-008 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-STR-003] Ratusan countdown diperbarui serentak tanpa membekukan UI
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Seluruh countdown: berkurang per detik dan card jatuh tempo hilang tepat waktu"

  @stress @priority-medium @REQ-015 @screen-laporan-lelang
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-STR-004] Export volume besar mencakup semua halaman tanpa timeout senyap
    Given user berada di halaman "Laporan Lelang"
    When user mengklik tombol "Export"
    Then sistem menampilkan "File Excel volume besar: lengkap, dapat dibuka, dan jumlah baris sesuai hasil filter"

  @stress @priority-medium @REQ-005 @screen-live-bidding
  Scenario: [AMS003-LIVE-BIDDING-SHIPPER-STR-005] Perpindahan card konsisten saat cutoff dan bid terjadi bersamaan
    Given user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "Card pada waktu cutoff: muncul tepat sekali di laporan dan tidak tersisa di Live Bidding"

