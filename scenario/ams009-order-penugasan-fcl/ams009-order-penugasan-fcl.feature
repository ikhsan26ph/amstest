# language: en
Feature: Order dan Penugasan FCL dengan AMS — ams009-order-penugasan-fcl
  Semua waktu WIB; asumsi dan fixture mengikuti analysis.md dan scenarios.json.

  @positive @priority-high @REQ-001 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-001 — Buat Order langsung FCL mempertahankan wizard OMS
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture baseline order langsung tersedia; semua field wajib baseline terisi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-001 pada scenarios.json
    When user mengklik elemen "Buat Order"
    And user memilih opsi "FCL" pada field "Jenis Pengiriman"
    Then sistem memverifikasi elemen "Alur OMS Eksisting" dengan assertion "baseline" bernilai "FCL"
    And sistem tidak menampilkan "No. Lelang pada form langsung"

  @positive @priority-high @REQ-001 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-002 — Buat Order langsung FTL mempertahankan wizard OMS
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture baseline order langsung tersedia; semua field wajib baseline terisi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-002 pada scenarios.json
    When user mengklik elemen "Buat Order"
    And user memilih opsi "FTL" pada field "Jenis Pengiriman"
    Then sistem memverifikasi elemen "Alur OMS Eksisting" dengan assertion "baseline" bernilai "FTL"
    And sistem tidak menampilkan "No. Lelang pada form langsung"

  @positive @priority-high @REQ-001 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-003 — Buat Order langsung LTL mempertahankan wizard OMS
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture baseline order langsung tersedia; semua field wajib baseline terisi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-003 pada scenarios.json
    When user mengklik elemen "Buat Order"
    And user memilih opsi "LTL" pada field "Jenis Pengiriman"
    Then sistem memverifikasi elemen "Alur OMS Eksisting" dengan assertion "baseline" bernilai "LTL"
    And sistem tidak menampilkan "No. Lelang pada form langsung"

  @positive @priority-high @REQ-001 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-004 — Buat Order langsung LCL mempertahankan wizard OMS
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture baseline order langsung tersedia; semua field wajib baseline terisi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-004 pada scenarios.json
    When user mengklik elemen "Buat Order"
    And user memilih opsi "LCL" pada field "Jenis Pengiriman"
    Then sistem memverifikasi elemen "Alur OMS Eksisting" dengan assertion "baseline" bernilai "LCL"
    And sistem tidak menampilkan "No. Lelang pada form langsung"

  @positive @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-005 — Pesan FCL membuka wizard empat step dengan penawaran yang dipilih
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang FCL milik shipper; OFFER-A aktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-005 pada scenarios.json
    When user mengklik elemen "Pesan [OFFER-A]"
    Then sistem memverifikasi elemen "Wizard Order" dengan assertion "items" bernilai "[\"Data Pengiriman\", \"Data Barang\", \"Vendor dan Harga\", \"Review\"]"
    And sistem memverifikasi elemen "No. Lelang" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @negative @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-001 — Vendor tidak dapat membuat order dari lelang milik shipper
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Sesi VENDOR-A membuka tautan lelang SHIPPER-A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-001 pada scenarios.json
    Then sistem tidak menampilkan "Pesan [OFFER-A]"
    And sistem memverifikasi elemen "Akses Order Lelang" dengan assertion "access" bernilai "ditolak"

  @negative @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-002 — Penawaran Tidak Berlaku tidak dapat dipesan
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A berstatus Tidak Berlaku."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-002 pada scenarios.json
    Then sistem memverifikasi elemen "Pesan [OFFER-A]" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-003 — Penawaran Kadaluarsa tidak dapat dipesan
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A berstatus Kadaluarsa."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-003 pada scenarios.json
    Then sistem memverifikasi elemen "Pesan [OFFER-A]" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-002 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-006 — Simpan satu transaksi Pesan menghasilkan tepat satu order
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard berasal dari satu klik Pesan; semua step valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-006 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @positive @priority-high @REQ-002 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-007 — Tiga Pesan terpisah pada satu lelang membuat tiga order berbeda
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Waktu masih sebelum akhir kirim; setiap wizard diisi valid melalui fixture UI; tiga transaksi terpisah."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-007 pada scenarios.json
    When user mengklik elemen "Pesan [OFFER-A]"
    And user berada di halaman "Buat Order - Review"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Detail Harga Penawaran"
    And user mengklik elemen "Pesan [OFFER-A]"
    And user berada di halaman "Buat Order - Review"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Detail Harga Penawaran"
    And user mengklik elemen "Pesan [OFFER-A]"
    And user berada di halaman "Buat Order - Review"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "3"
    And sistem memverifikasi elemen "ID Order" dengan assertion "uniqueCount" bernilai "3"

  @negative @priority-high @REQ-002 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-004 — Pesan setelah Rencana Akhir Kirim tidak membentuk order
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Clock 2026-10-10T18:01:00+07:00; lelang berakhir pukul 18:00 WIB."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-004 pada scenarios.json
    Then sistem memverifikasi elemen "Pesan [OFFER-A]" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"

  @edge @priority-high @REQ-002 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-001 — Lelang berakhir ketika wizard terbuka menolak simpan stale
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard dibuka sebelum akhir kirim; clock dimajukan melewati akhir kirim sebelum Simpan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-001 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "lelang telah melewati akhir kirim"
    And sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-003 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-008 — Prefill data lelang dan penawaran benar dan read-only
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A FCL 20 DRY SUB-PNJ Normal Door to Door; titik fixture sudah tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-008 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang" dengan assertion "text" bernilai "FCL-NRM-TEST-009"
    And sistem memverifikasi elemen "Jenis Kontainer" dengan assertion "text" bernilai "20 DRY"
    And sistem memverifikasi elemen "Pelabuhan Asal" dengan assertion "text" bernilai "Tanjung Perak (SUB)"
    And sistem memverifikasi elemen "Pelabuhan Tujuan" dengan assertion "text" bernilai "Panjang (PNJ)"
    And sistem memverifikasi elemen "Tipe Pengiriman" dengan assertion "text" bernilai "Normal"
    And sistem memverifikasi elemen "Metode Pengiriman" dengan assertion "text" bernilai "Door to Door"
    And sistem memverifikasi elemen "Data Rute" dengan assertion "readonly" bernilai "true"
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    Then sistem memverifikasi elemen "PIC Pengirim [Muat 1]" dengan assertion "value" bernilai "Widyawati"

  @negative @priority-high @REQ-003 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-005 — Data rute turunan tidak menyediakan kontrol edit
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard order lelang OFFER-A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-005 pada scenarios.json
    Then sistem tidak menampilkan "Input Pelabuhan Asal"
    And sistem tidak menampilkan "Input Pelabuhan Tujuan"
    And sistem tidak menampilkan "Input Jenis Pengiriman"
    And sistem memverifikasi elemen "Data Rute" dengan assertion "readonly" bernilai "true"

  @positive @priority-medium @REQ-004 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-009 — Daftar shipper menampilkan lelang di bawah ID order
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "List berisi ORD-FCL-009 dari lelang dan ORD-DIRECT-009 tanpa lelang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-009 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "text" bernilai "FCL-NRM-TEST-009"
    And sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "position" bernilai "di bawah ID Order"
    And sistem memverifikasi elemen "ID Order [ORD-DIRECT-009]" dengan assertion "text" bernilai "ORD-DIRECT-009"

  @negative @priority-medium @REQ-004 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-006 — Order langsung pada daftar shipper tidak mendapat No. Lelang palsu
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "List berisi ORD-DIRECT-009 dan ORD-FCL-009."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-006 pada scenarios.json
    Then sistem tidak menampilkan "No. Lelang [ORD-DIRECT-009]"
    And sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @positive @priority-medium @REQ-004 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-010 — Daftar vendor menampilkan lelang di bawah ID order
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "List berisi ORD-FCL-009 dari lelang dan ORD-DIRECT-009 tanpa lelang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-010 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "text" bernilai "FCL-NRM-TEST-009"
    And sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "position" bernilai "di bawah ID Order"
    And sistem memverifikasi elemen "ID Order [ORD-DIRECT-009]" dengan assertion "text" bernilai "ORD-DIRECT-009"

  @negative @priority-medium @REQ-004 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-007 — Order langsung pada daftar vendor tidak mendapat No. Lelang palsu
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "List berisi ORD-DIRECT-009 dan ORD-FCL-009."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-007 pada scenarios.json
    Then sistem tidak menampilkan "No. Lelang [ORD-DIRECT-009]"
    And sistem memverifikasi elemen "No. Lelang [ORD-FCL-009]" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @positive @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-011 — Gabungan filter lengkap daftar shipper mengembalikan order yang cocok
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture ORD-FCL-009 cocok seluruh kriteria; fixture lain berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-011 pada scenarios.json
    When user mengklik elemen "Filter"
    And user mengisi field "No. Lelang" dengan "FCL-NRM-TEST-009"
    And user mengisi field "ID Order" dengan "ORD-FCL-009"
    And user mengisi field "Vendor" dengan "VENDOR-A"
    And user memilih opsi "FCL" pada field "Jenis Pengiriman"
    And user memilih opsi "Kota Surabaya" pada field "Kota Asal"
    And user memilih opsi "Kota Bandar Lampung" pada field "Kota Tujuan"
    And user memilih opsi "Normal" pada field "Tipe Pengiriman"
    And user memilih opsi "Door to Door" pada field "Metode Pengiriman"
    And user mengisi field "Tanggal Buat" dengan "2026-10-07"
    And user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08"
    And user memilih opsi "SHIPPER-A" pada field "Pengirim"
    And user memilih opsi "PT Retail Jaya Abadi" pada field "Penerima"
    And user memilih opsi "Gudang MSK Region 2" pada field "Drop Point Asal"
    And user memilih opsi "Gudang Jaya Retail Lampung" pada field "Drop Point Tujuan"
    And user memilih opsi "Menunggu Konfirmasi" pada field "Status"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "items" bernilai "[\"ORD-FCL-009\"]"
    When user mengklik elemen "Reset"
    Then sistem memverifikasi elemen "Filter Order" dengan assertion "state" bernilai "kosong"
    And sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "2"

  @positive @priority-medium @REQ-005 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-012 — Gabungan filter lengkap daftar vendor mengembalikan order yang cocok
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture ORD-FCL-009 cocok seluruh kriteria; fixture lain berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-012 pada scenarios.json
    When user mengklik elemen "Filter"
    And user mengisi field "No. Lelang" dengan "FCL-NRM-TEST-009"
    And user mengisi field "ID Order" dengan "ORD-FCL-009"
    And user memilih opsi "FCL" pada field "Jenis Pengiriman"
    And user memilih opsi "Kota Surabaya" pada field "Kota Asal"
    And user memilih opsi "Kota Bandar Lampung" pada field "Kota Tujuan"
    And user memilih opsi "Normal" pada field "Tipe Pengiriman"
    And user memilih opsi "Door to Door" pada field "Metode Pengiriman"
    And user mengisi field "Tanggal Buat" dengan "2026-10-07"
    And user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08"
    And user memilih opsi "SHIPPER-A" pada field "Pengirim"
    And user memilih opsi "PT Retail Jaya Abadi" pada field "Penerima"
    And user memilih opsi "Gudang MSK Region 2" pada field "Drop Point Asal"
    And user memilih opsi "Gudang Jaya Retail Lampung" pada field "Drop Point Tujuan"
    And user memilih opsi "Menunggu Konfirmasi" pada field "Status"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "items" bernilai "[\"ORD-FCL-009\"]"
    When user mengklik elemen "Reset"
    Then sistem memverifikasi elemen "Filter Order" dengan assertion "state" bernilai "kosong"
    And sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "2"

  @negative @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-008 — Filter tanggal invalid tidak menjalankan pencarian
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Daftar awal berisi 2 order."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-008 pada scenarios.json
    When user mengklik elemen "Filter"
    And user mengisi field "Tanggal Buat" dengan "31/02/2026"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Tanggal Buat" dengan assertion "error" bernilai "tanggal tidak valid"
    And sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "2"

  @edge @priority-medium @REQ-005 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-002 — Filter tanpa hasil dapat direset oleh vendor
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada order dengan ID ORD-NOT-FOUND."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-002 pada scenarios.json
    When user mengisi field "ID Order" dengan "ORD-NOT-FOUND"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "0"
    And sistem menampilkan "Empty Order"
    When user mengklik elemen "Reset"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "2"

  @positive @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-013 — Detail rute pickup dan drop-off menampilkan titik berbeda
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki asal Gudang MSK Region 2 dan tujuan Gudang Jaya Retail Lampung."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-013 pada scenarios.json
    When user mengklik elemen "Rute Pickup [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Judul Detail Droppoint" dengan assertion "text" bernilai "Detail Pickup"
    And sistem memverifikasi elemen "Alamat Droppoint" dengan assertion "text" bernilai "Jl. Jambi No.35"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Rute Drop Off [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Judul Detail Droppoint" dengan assertion "text" bernilai "Detail Drop Off"
    And sistem memverifikasi elemen "Nama Droppoint" dengan assertion "text" bernilai "Gudang Jaya Retail Lampung"
    When user mengklik elemen "Tutup"
    Then sistem menampilkan "Baris Order"

  @positive @priority-medium @REQ-005 @screen-detail-droppoint
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-014 — Modal detail multipickup memuat semua titik asal
    Given user berada di halaman "Detail Pickup / Drop Off"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Modal dari link Multipickup dengan 2 titik fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-014 pada scenarios.json
    Then sistem memverifikasi elemen "Titik Droppoint" dengan assertion "count" bernilai "2"
    And sistem memverifikasi elemen "Nama Droppoint [Titik 2]" dengan assertion "text" bernilai "Gudang Sidoarjo"
    When user mengklik elemen "Tutup"
    Then sistem tidak menampilkan "Detail Droppoint"

  @positive @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-015 — Pagination sort dan salin ID menjaga pasangan order lelang
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "41 order fixture; urutan harga/vendor deterministik; clipboard dapat dibaca test harness."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-015 pada scenarios.json
    When user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "20"
    When user mengklik elemen "Halaman Terakhir"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "count" bernilai "1"
    When user mengklik elemen "Halaman Pertama"
    And user mengklik elemen "Urutkan Vendor"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "order" bernilai "vendor ascending"
    When user mengklik elemen "Urutkan Total Harga"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "order" bernilai "harga ascending"
    When user mengklik elemen "Salin ID Order [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Clipboard" dengan assertion "clipboard" bernilai "ORD-FCL-009"
    When user mengklik elemen "Salin No. Lelang [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Clipboard" dengan assertion "clipboard" bernilai "FCL-NRM-TEST-009"

  @positive @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-016 — Action eksisting tetap tersedia sesuai baseline setelah AMS
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture baseline action tersedia untuk status yang tepat; tiap action dibuka lalu dibatalkan bila mutasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-016 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Action Order" dengan assertion "baseline" bernilai "[\"Detail\", \"Lihat No. Resi\", \"Batalkan Order\", \"Order Kembali\", \"Riwayat Perubahan\"]"
    When user mengklik elemen "Detail"
    Then sistem memverifikasi elemen "ID Order" dengan assertion "text" bernilai "ORD-FCL-009"

  @positive @priority-medium @REQ-005 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-017 — Batch Order dan Riwayat Pembatalan tetap menggunakan halaman baseline
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Baseline OMS menyertakan kedua alur navigasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-017 pada scenarios.json
    When user mengklik elemen "Batch Order"
    Then sistem memverifikasi elemen "Batch Order" dengan assertion "baseline" bernilai "baseline OMS"
    When user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Riwayat Pembatalan"
    Then sistem memverifikasi elemen "Riwayat Pembatalan" dengan assertion "baseline" bernilai "baseline OMS"

  @positive @priority-high @REQ-006 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-018 — Status Menunggu Konfirmasi konsisten pada daftar dan detail shipper
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture telah menjalankan Simpan order valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-018 pada scenarios.json
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Detail"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @positive @priority-high @REQ-006 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-019 — Status Menunggu Penugasan konsisten pada daftar dan detail shipper
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture telah menjalankan Vendor menerima order valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-019 pada scenarios.json
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Detail"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @positive @priority-high @REQ-006 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-020 — Status Ditolak konsisten pada daftar dan detail shipper
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture telah menjalankan Vendor menolak dengan alasan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-020 pada scenarios.json
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Detail"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"

  @negative @priority-high @REQ-006 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-009 — Order Ditolak tidak dapat dikonfirmasi ulang menjadi diterima
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Ditolak; action hanya untuk Menunggu Konfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-009 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"

  @positive @priority-high @REQ-007 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-021 — Simpan ke Draf mempertahankan input dan step 1
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard pada step 1; satu field editable sudah terisi; untuk step lanjut fixture sebelumnya valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-021 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    And user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Lanjutkan Draf [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"
    And sistem memverifikasi elemen "Data Draf" dengan assertion "snapshot" bernilai "sama dengan input sebelum draft"

  @positive @priority-high @REQ-007 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-022 — Simpan ke Draf mempertahankan input dan step 2
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard pada step 2; satu field editable sudah terisi; untuk step lanjut fixture sebelumnya valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-022 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    And user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Lanjutkan Draf [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"
    And sistem memverifikasi elemen "Data Draf" dengan assertion "snapshot" bernilai "sama dengan input sebelum draft"

  @positive @priority-high @REQ-007 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-023 — Simpan ke Draf mempertahankan input dan step 3
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard pada step 3; satu field editable sudah terisi; untuk step lanjut fixture sebelumnya valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-023 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    And user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Lanjutkan Draf [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"
    And sistem memverifikasi elemen "Data Draf" dengan assertion "snapshot" bernilai "sama dengan input sebelum draft"

  @positive @priority-high @REQ-007 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-024 — Simpan ke Draf mempertahankan input dan step 4
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard pada step 4; satu field editable sudah terisi; untuk step lanjut fixture sebelumnya valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-024 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    And user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Lanjutkan Draf [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"
    And sistem memverifikasi elemen "Data Draf" dengan assertion "snapshot" bernilai "sama dengan input sebelum draft"

  @negative @priority-high @REQ-007 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-010 — Draft dengan semua input kosong tidak tersimpan
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua PIC/WhatsApp prefill telah dikosongkan; hanya teks turunan lelang tersisa."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-010 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    Then sistem memverifikasi elemen "Validasi Draf" dengan assertion "error" bernilai "minimal satu field terisi"
    And sistem memverifikasi elemen "Draft Order" dengan assertion "count" bernilai "0"

  @edge @priority-high @REQ-007 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-003 — Satu field PIC cukup untuk draft tanpa seluruh required lengkap
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua input editable kosong."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-003 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "A"
    And user mengklik elemen "Simpan ke Draf"
    Then sistem memverifikasi elemen "Draft Order" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Notifikasi Order Baru" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-008 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-025 — Sebelumnya dari step 2 menjaga data step terakhir
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua step sebelum 2 valid; current step berisi data fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-025 pada scenarios.json
    When user mengklik elemen "Sebelumnya"
    And user berada di halaman "Buat Order - Data Pengiriman"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data Step" dengan assertion "snapshot" bernilai "sama seperti sebelum kembali"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @positive @priority-high @REQ-008 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-026 — Sebelumnya dari step 3 menjaga data step terakhir
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua step sebelum 3 valid; current step berisi data fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-026 pada scenarios.json
    When user mengklik elemen "Sebelumnya"
    And user berada di halaman "Buat Order - Data Barang"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data Step" dengan assertion "snapshot" bernilai "sama seperti sebelum kembali"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @positive @priority-high @REQ-008 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-027 — Sebelumnya dari step 4 menjaga data step terakhir
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua step sebelum 4 valid; current step berisi data fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-027 pada scenarios.json
    When user mengklik elemen "Sebelumnya"
    And user berada di halaman "Buat Order - Vendor dan Harga"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data Step" dengan assertion "snapshot" bernilai "sama seperti sebelum kembali"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"

  @negative @priority-high @REQ-008 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-011 — Selanjutnya berhenti pada step barang yang belum lengkap
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Step pengiriman valid; kontainer 1 tanpa barang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-011 pada scenarios.json
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Barang Kontainer 1" dengan assertion "error" bernilai "wajib dipilih"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"
    And sistem tidak menampilkan "Review Order"

  @positive @priority-medium @REQ-009 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-028 — Batal dikonfirmasi mengembalikan shipper ke daftar
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard belum disimpan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-028 pada scenarios.json
    When user mengklik elemen "Batal"
    Then sistem menampilkan "Konfirmasi Batal"
    When user mengklik elemen "Ya Batalkan"
    And user berada di halaman "Daftar Order Shipper"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"

  @negative @priority-medium @REQ-009 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-012 — Tutup konfirmasi Batal tidak membatalkan wizard
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "PIC diisi dan belum disimpan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-012 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengklik elemen "Batal"
    And user mengklik elemen "Kembali Mengisi"
    Then sistem tidak menampilkan "Konfirmasi Batal"
    And sistem memverifikasi elemen "PIC Pengirim [Muat 1]" dengan assertion "value" bernilai "Widyawati"

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-029 — PIC WA dan catatan kedua sisi dapat disimpan
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Rute normal dari lelang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-029 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "Catatan [Muat 1]" dengan "Hubungi PIC sebelum tiba"
    And user mengisi field "Catatan [Bongkar 1]" dengan "Bongkar di pintu B"
    And user mengklik elemen "Selanjutnya"
    And user berada di halaman "Buat Order - Data Barang"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-013 — PIC Pengirim [Muat 1] kosong menahan Data Pengiriman
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; rute normal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-013 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "PIC Pengirim [Muat 1]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "PIC Pengirim [Muat 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-014 — No. WhatsApp PIC [Muat 1] kosong menahan Data Pengiriman
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; rute normal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-014 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "No. WhatsApp PIC [Muat 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-015 — PIC Penerima [Bongkar 1] kosong menahan Data Pengiriman
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; rute normal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-015 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "PIC Penerima [Bongkar 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-016 — No. WhatsApp PIC [Bongkar 1] kosong menahan Data Pengiriman
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; rute normal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-016 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "No. WhatsApp PIC [Bongkar 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-030 — Card dan PIC Multipickup tersimpan per titik
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang Multipickup dengan 2 pickup dan 1 drop."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-030 pada scenarios.json
    Then sistem menampilkan "Muat (1)"
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "PIC Muat 1"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567810"
    Then sistem menampilkan "Muat (2)"
    When user mengisi field "PIC Pengirim [Muat 2]" dengan "PIC Muat 2"
    And user mengisi field "No. WhatsApp PIC [Muat 2]" dengan "081234567820"
    Then sistem menampilkan "Bongkar (1)"
    When user mengisi field "PIC Penerima [Bongkar 1]" dengan "PIC Bongkar 1"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "081234567810"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data PIC Per Titik" dengan assertion "snapshot" bernilai "sama dengan fixture"

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-031 — Card dan PIC Multidrop tersimpan per titik
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang Multidrop dengan 1 pickup dan 2 drop."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-031 pada scenarios.json
    Then sistem menampilkan "Muat (1)"
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "PIC Muat 1"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567810"
    Then sistem menampilkan "Bongkar (1)"
    When user mengisi field "PIC Penerima [Bongkar 1]" dengan "PIC Bongkar 1"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "081234567810"
    Then sistem menampilkan "Bongkar (2)"
    When user mengisi field "PIC Penerima [Bongkar 2]" dengan "PIC Bongkar 2"
    And user mengisi field "No. WhatsApp PIC [Bongkar 2]" dengan "081234567820"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data PIC Per Titik" dengan assertion "snapshot" bernilai "sama dengan fixture"

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-032 — Card dan PIC Multipoint tersimpan per titik
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang Multipoint dengan 2 pickup dan 2 drop."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-032 pada scenarios.json
    Then sistem menampilkan "Muat (1)"
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "PIC Muat 1"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567810"
    Then sistem menampilkan "Muat (2)"
    When user mengisi field "PIC Pengirim [Muat 2]" dengan "PIC Muat 2"
    And user mengisi field "No. WhatsApp PIC [Muat 2]" dengan "081234567820"
    Then sistem menampilkan "Bongkar (1)"
    When user mengisi field "PIC Penerima [Bongkar 1]" dengan "PIC Bongkar 1"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "081234567810"
    Then sistem menampilkan "Bongkar (2)"
    When user mengisi field "PIC Penerima [Bongkar 2]" dengan "PIC Bongkar 2"
    And user mengisi field "No. WhatsApp PIC [Bongkar 2]" dengan "081234567820"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Data PIC Per Titik" dengan assertion "snapshot" bernilai "sama dengan fixture"

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-017 — PIC pada titik kedua multipoint wajib divalidasi
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Muat 1, Bongkar 1 dan Bongkar 2 valid; Muat 2 PIC kosong."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-017 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 2]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "PIC Pengirim [Muat 2]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "1"

  @positive @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-033 — Dua kontainer membentuk tepat dua card dan jenis read-only
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jenis lelang 20 DRY."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-033 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "2"
    Then sistem memverifikasi elemen "Card Kontainer" dengan assertion "count" bernilai "2"
    And sistem memverifikasi elemen "Jenis Kontainer" dengan assertion "text" bernilai "20 DRY"
    And sistem memverifikasi elemen "Jenis Kontainer" dengan assertion "readonly" bernilai "true"

  @negative @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-018 — Jumlah Kontainer invalid '' tidak dapat dilanjutkan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang card awal valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-018 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah Kontainer" dengan assertion "error" bernilai "wajib bilangan bulat minimal 1"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-019 — Jumlah Kontainer invalid 0 tidak dapat dilanjutkan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang card awal valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-019 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "0"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah Kontainer" dengan assertion "error" bernilai "wajib bilangan bulat minimal 1"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-020 — Jumlah Kontainer invalid -1 tidak dapat dilanjutkan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang card awal valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-020 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "-1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah Kontainer" dengan assertion "error" bernilai "wajib bilangan bulat minimal 1"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-021 — Jumlah Kontainer invalid '1.5' tidak dapat dilanjutkan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang card awal valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-021 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1.5"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah Kontainer" dengan assertion "error" bernilai "wajib bilangan bulat minimal 1"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-022 — Jumlah Kontainer invalid 'abc' tidak dapat dilanjutkan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang card awal valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-022 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "abc"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah Kontainer" dengan assertion "error" bernilai "wajib bilangan bulat minimal 1"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @edge @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-004 — Jumlah Kontainer tepat minimum satu menghasilkan satu card
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Wizard step barang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-004 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    Then sistem memverifikasi elemen "Card Kontainer" dengan assertion "count" bernilai "1"

  @edge @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-005 — Mengurangi tiga kontainer menjadi satu menjaga card pertama
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tiga card terisi SKU/DO berbeda; kebijakan konfirmasi penghapusan sesuai baseline."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-005 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    Then sistem memverifikasi elemen "Card Kontainer" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Data Kontainer 1" dengan assertion "snapshot" bernilai "tetap seperti sebelum pengurangan"
    And sistem tidak menampilkan "Kontainer 2"
    And sistem tidak menampilkan "Kontainer 3"

  @positive @priority-medium @REQ-012 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-034 — Multi tag Nomor DO dan barang master tersimpan per kontainer
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 aktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-034 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Nomor DO [Kontainer 1]" dengan "DO-009-A,DO-009-B"
    Then sistem memverifikasi elemen "Tag DO [Kontainer 1]" dengan assertion "items" bernilai "[\"DO-009-A\", \"DO-009-B\"]"
    When user mengklik elemen "Hapus DO [DO-009-B/Kontainer 1]"
    Then sistem memverifikasi elemen "Tag DO [Kontainer 1]" dengan assertion "items" bernilai "[\"DO-009-A\"]"
    And sistem memverifikasi elemen "Nama Barang [Kontainer 1/SKU-PPR-001]" dengan assertion "text" bernilai "Kertas HVS A4 80 gsm"

  @negative @priority-medium @REQ-012 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-023 — Pencarian master barang tanpa hasil tidak menambah baris palsu
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada SKU-NOT-FOUND pada master."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-023 pada scenarios.json
    When user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user mengisi field "Cari Barang" dengan "SKU-NOT-FOUND"
    Then sistem memverifikasi elemen "Hasil Barang Master" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Tambahkan Barang [Kontainer 1]" dengan assertion "enabled" bernilai "false"
    When user mengklik elemen "Batal Pilih Barang"
    Then sistem memverifikasi elemen "Baris Barang [Kontainer 1]" dengan assertion "count" bernilai "0"

  @edge @priority-medium @REQ-012 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-006 — Nomor DO kosong tidak menghalangi barang valid
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Kontainer belum berisi DO."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-006 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Nomor DO [Kontainer 1]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @positive @priority-medium @REQ-012 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-035 — Hapus barang mengubah tabel dan total kontainer
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Card memiliki 10 SKU-PPR-001 saja."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-035 pada scenarios.json
    When user mengklik elemen "Hapus Barang [Kontainer 1/SKU-PPR-001]"
    Then sistem memverifikasi elemen "Baris Barang [Kontainer 1]" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Total Berat [Kontainer 1]" dengan assertion "text" bernilai "0 kg"
    And sistem memverifikasi elemen "Total Kubikasi [Kontainer 1]" dengan assertion "text" bernilai "0 m3"

  @positive @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-036 — Jumlah dan nilai barang valid saat kontainer diasuransikan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Asuransi tersedia dari lelang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-036 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mencentang checkbox "Tambahkan Asuransi [Kontainer 1]"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "100000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-024 — Jumlah barang invalid '' ditolak per baris
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-024 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "Jumlah harus diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-025 — Jumlah barang invalid 0 ditolak per baris
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-025 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "0"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "Jumlah harus diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-026 — Jumlah barang invalid -1 ditolak per baris
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-026 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "-1"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "jumlah tidak valid"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-027 — Jumlah barang invalid '0.5' ditolak per baris
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-027 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "0.5"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "jumlah tidak valid"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-028 — Jumlah barang invalid 'abc' ditolak per baris
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Master SKU-PPR-001 dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-028 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "abc"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Jumlah [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "jumlah tidak valid"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-029 — Nilai Barang kosong pada asuransi memunculkan helper wajib
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Asuransi tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-029 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mencentang checkbox "Tambahkan Asuransi [Kontainer 1]"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "100000"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "Nilai Barang harus diisi"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-030 — Kontainer kedua kosong tidak dapat dilewati meskipun pertama valid
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Kontainer 1 terisi barang, kontainer 2 kosong."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-030 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "2"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Barang Kontainer 2" dengan assertion "error" bernilai "wajib dipilih"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @edge @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-007 — Mematikan asuransi menghilangkan kewajiban nilai barang
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Asuransi tersedia, barang jumlah valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-007 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mencentang checkbox "Tambahkan Asuransi [Kontainer 1]"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "100000"
    And user menghapus centang checkbox "Tambahkan Asuransi [Kontainer 1]"
    Then sistem tidak menampilkan "Nilai Barang [Kontainer 1/SKU-PPR-001]"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @positive @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-037 — Berat dan kubikasi dihitung dari jumlah barang master
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "SKU-PPR-001 berat 12.5 kg volume 0.018 m3/unit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-037 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    Then sistem memverifikasi elemen "Total Berat [Kontainer 1]" dengan assertion "text" bernilai "125 kg"
    And sistem memverifikasi elemen "Total Kubikasi [Kontainer 1]" dengan assertion "text" bernilai "0.18 m3"
    And sistem tidak menampilkan "Alert Kapasitas [Kontainer 1]"

  @negative @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-031 — Total weightKg melampaui kapasitas menampilkan alert
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture barang dengan dimensi melampaui satu kapasitas saja."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-031 pada scenarios.json
    When user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "2"
    Then sistem memverifikasi elemen "Alert Kapasitas [Kontainer 1]" dengan assertion "text" bernilai "Berat melebihi kapasitas armada"

  @negative @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-032 — Total volumeM3 melampaui kapasitas menampilkan alert
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture barang dengan dimensi melampaui satu kapasitas saja."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-032 pada scenarios.json
    When user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "2"
    Then sistem memverifikasi elemen "Alert Kapasitas [Kontainer 1]" dengan assertion "text" bernilai "Kubikasi melebihi kapasitas armada"

  @edge @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-008 — Total tepat kapasitas weightKg tidak diberi alert kelebihan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture 1 barang dengan jumlah 1 dan dimensi tepat batas; dimensi lain di bawah batas."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-008 pada scenarios.json
    When user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "1"
    Then sistem tidak menampilkan "Alert Kapasitas [Kontainer 1]"
    And sistem memverifikasi elemen "Total Kapasitas [Kontainer 1]" dengan assertion "numeric" bernilai "24800"

  @edge @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-009 — Total tepat kapasitas volumeM3 tidak diberi alert kelebihan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture 1 barang dengan jumlah 1 dan dimensi tepat batas; dimensi lain di bawah batas."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-009 pada scenarios.json
    When user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "1"
    Then sistem tidak menampilkan "Alert Kapasitas [Kontainer 1]"
    And sistem memverifikasi elemen "Total Kapasitas [Kontainer 1]" dengan assertion "numeric" bernilai "17.86"

  @positive @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-038 — Tanggal Permintaan Muat valid berada dalam rentang lelang
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Step 1/2 valid; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-038 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08T10:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"

  @negative @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-033 — Tanggal Permintaan Muat kosong tidak valid
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-033 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan assertion "error" bernilai "datetime wajib antara sekarang dan akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-034 — Tanggal Permintaan Muat sebelum sekarang tidak valid
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-034 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-07T09:59:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan assertion "error" bernilai "datetime wajib antara sekarang dan akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-035 — Tanggal Permintaan Muat setelah akhir kirim tidak valid
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-035 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan assertion "error" bernilai "datetime wajib antara sekarang dan akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-036 — Tanggal Permintaan Muat tanggal kalender invalid tidak valid
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-036 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "31/02/2026 10:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan assertion "error" bernilai "datetime wajib antara sekarang dan akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @edge @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-010 — Tanggal Permintaan Muat tepat sekarang diterima
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; clock tidak bergerak selama validasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-010 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-07T10:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"

  @edge @priority-high @REQ-015 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-011 — Tanggal Permintaan Muat tepat akhir kirim diterima
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Field lain valid; clock tidak bergerak selama validasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-011 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-10T18:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"

  @positive @priority-high @REQ-016 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-039 — Ringkasan dua kontainer memakai data terbaru Step 02
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "K1: 10 unit 12.5kg/0.018m3/nilai 100000; K2: 20 unit sama; keduanya diasuransikan; vendor A/harga satuan 1000000."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-039 pada scenarios.json
    Then sistem memverifikasi elemen "Vendor" dengan assertion "text" bernilai "VENDOR-A"
    And sistem memverifikasi elemen "Jumlah Kontainer Ringkasan" dengan assertion "text" bernilai "2"
    And sistem memverifikasi elemen "Harga Satuan" dengan assertion "text" bernilai "1000000"
    And sistem memverifikasi elemen "Ringkasan Kontainer" dengan assertion "rows" bernilai "[{\"container\": 1, \"goodsValue\": 1000000, \"volumeM3\": 0.18, \"weightKg\": 125}, {\"container\": 2, \"goodsValue\": 2000000, \"volumeM3\": 0.36, \"weightKg\": 250}]"

  @positive @priority-high @REQ-016 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-040 — Link multipoint menampilkan seluruh detail pickup dan drop-off
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Multipoint berisi 2 asal/2 tujuan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-040 pada scenarios.json
    When user mengklik elemen "Multipickup"
    Then sistem memverifikasi elemen "Judul Detail Droppoint" dengan assertion "text" bernilai "Detail Pickup"
    And sistem memverifikasi elemen "Titik Droppoint" dengan assertion "count" bernilai "2"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Multidrop"
    Then sistem memverifikasi elemen "Judul Detail Droppoint" dengan assertion "text" bernilai "Detail Drop Off"
    And sistem memverifikasi elemen "Titik Droppoint" dengan assertion "count" bernilai "2"
    When user mengklik elemen "Tutup"
    Then sistem tidak menampilkan "Detail Droppoint"

  @negative @priority-high @REQ-016 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-037 — Vendor harga satuan dan jumlah ringkasan tidak dapat diedit
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Data dari penawaran A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-037 pada scenarios.json
    Then sistem memverifikasi elemen "Vendor" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Harga Satuan" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jumlah Kontainer Ringkasan" dengan assertion "readonly" bernilai "true"
    And sistem tidak menampilkan "Input Vendor"
    And sistem tidak menampilkan "Input Harga Satuan"

  @positive @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-041 — DPP pajak asuransi dan total sesuai fixture dua kontainer
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Harga 1000000; jumlah 2; nilai barang total diasuransikan 6000000; PPN 10%, PPh 2%, asuransi 0.5%."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-041 pada scenarios.json
    Then sistem memverifikasi elemen "Harga DPP" dengan assertion "text" bernilai "2000000"
    And sistem memverifikasi elemen "PPN" dengan assertion "text" bernilai "200000"
    And sistem memverifikasi elemen "PPh" dengan assertion "text" bernilai "-40000"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "30000"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "2190000"

  @negative @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-038 — Tarif PPN PPh dan asuransi penawaran tidak dapat diubah shipper
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tarif penawaran A berbeda penawaran B."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-038 pada scenarios.json
    Then sistem memverifikasi elemen "PPN" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "PPh" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "readonly" bernilai "true"
    And sistem tidak menampilkan "Input Tarif PPN"
    And sistem tidak menampilkan "Input Tarif PPh"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "2190000"

  @edge @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-012 — Asuransi hanya menghitung kontainer yang dicentang
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "K1 diasuransikan total 1000000; K2 tidak diasuransikan total 5000000; DPP 2000000."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-012 pada scenarios.json
    Then sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "5000"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "2165000"
    And sistem memverifikasi elemen "Status Asuransi [Kontainer 2]" dengan assertion "text" bernilai "Tanpa Asuransi"

  @edge @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-013 — Tarif pajak nol dan asuransi nonaktif menghasilkan total sama DPP
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Harga 1000000; 2 kontainer; semua tarif fixture nol."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-013 pada scenarios.json
    Then sistem memverifikasi elemen "PPN" dengan assertion "text" bernilai "0"
    And sistem memverifikasi elemen "PPh" dengan assertion "text" bernilai "0"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "0"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "2000000"

  @edge @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-014 — Kembali mengubah jumlah dan barang menghitung ulang harga
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Dua kontainer, dua diasuransikan; barang awal fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-014 pada scenarios.json
    When user mengklik elemen "Sebelumnya"
    And user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "100000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Harga DPP" dengan assertion "text" bernilai "1000000"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "5000"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "1085000"

  @positive @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-042 — Toleransi Closing Time valid disimpan ke Review
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-042 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Closing Time [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Acuan Toleransi" dengan assertion "text" bernilai "Closing Time"
    And sistem memverifikasi elemen "Batas Toleransi Ringkasan" dengan assertion "text" bernilai "09/10/2026 20:00 WIB"

  @positive @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-043 — Toleransi Berangkat (ETD) valid disimpan ke Review
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-043 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Berangkat (ETD) [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Acuan Toleransi" dengan assertion "text" bernilai "Berangkat (ETD)"
    And sistem memverifikasi elemen "Batas Toleransi Ringkasan" dengan assertion "text" bernilai "09/10/2026 20:00 WIB"

  @positive @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-044 — Toleransi Tiba (ETA) valid disimpan ke Review
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-044 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Tiba (ETA) [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Acuan Toleransi" dengan assertion "text" bernilai "Tiba (ETA)"
    And sistem memverifikasi elemen "Batas Toleransi Ringkasan" dengan assertion "text" bernilai "09/10/2026 20:00 WIB"

  @negative @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-039 — Batas Toleransi kosong menahan step tiga
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-039 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Closing Time [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan ""
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Batas Toleransi" dengan assertion "error" bernilai "datetime wajib tidak melewati akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-040 — Batas Toleransi melewati akhir kirim menahan step tiga
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-040 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Closing Time [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Batas Toleransi" dengan assertion "error" bernilai "datetime wajib tidak melewati akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @negative @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-041 — Batas Toleransi invalid menahan step tiga
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-041 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Closing Time [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "31/02/2026 23:59"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Batas Toleransi" dengan assertion "error" bernilai "datetime wajib tidak melewati akhir kirim"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @edge @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-015 — Toleransi tepat akhir kirim mempertahankan jam pilihan
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-015 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengklik elemen "Tiba (ETA) [Acuan Toleransi]"
    And user mengisi field "Batas Toleransi" dengan "2026-10-10T18:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Batas Toleransi Ringkasan" dengan assertion "text" bernilai "10/10/2026 18:00 WIB"

  @edge @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-016 — Uncheck toleransi tidak mengirim batas lama tersembunyi
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-016 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengisi field "Batas Toleransi" dengan "2026-10-09T20:00:00+07:00"
    And user menghapus centang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    Then sistem tidak menampilkan "Batas Toleransi"
    When user mengklik elemen "Selanjutnya"
    Then sistem tidak menampilkan "Batas Toleransi Ringkasan"

  @positive @priority-high @REQ-019 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-045 — Jadwal Direct penawaran tampil read-only tanpa toggle toleransi
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penawaran memiliki jadwal Direct fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-045 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem tidak menampilkan "Gunakan Batas Toleransi Jadwal Kapal"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-019 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-046 — Jadwal Connecting penawaran tampil read-only tanpa toggle toleransi
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penawaran memiliki jadwal Connecting fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-046 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Connecting"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem tidak menampilkan "Gunakan Batas Toleransi Jadwal Kapal"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @negative @priority-high @REQ-019 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-042 — Jadwal penawaran tidak dapat diubah pada Vendor dan Harga
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penawaran memiliki jadwal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-042 pada scenarios.json
    Then sistem tidak menampilkan "Input Nama Kapal"
    And sistem tidak menampilkan "Input ETD"
    And sistem tidak menampilkan "Input ETA"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"

  @positive @priority-medium @REQ-020 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-047 — Banner tanpa jadwal terlihat pada step 1
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; field required pada step valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-047 pada scenarios.json
    Then sistem memverifikasi elemen "Banner Jadwal" dengan assertion "text" bernilai "Jadwal kapal saat ini belum tersedia"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @positive @priority-medium @REQ-020 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-048 — Banner tanpa jadwal terlihat pada step 2
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; field required pada step valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-048 pada scenarios.json
    Then sistem memverifikasi elemen "Banner Jadwal" dengan assertion "text" bernilai "Jadwal kapal saat ini belum tersedia"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "3"

  @positive @priority-medium @REQ-020 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-049 — Banner tanpa jadwal terlihat pada step 3
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; field required pada step valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-049 pada scenarios.json
    Then sistem memverifikasi elemen "Banner Jadwal" dengan assertion "text" bernilai "Jadwal kapal saat ini belum tersedia"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "4"

  @positive @priority-medium @REQ-020 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-050 — Banner tanpa jadwal terlihat pada step 4
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Lelang tanpa jadwal; field required pada step valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-050 pada scenarios.json
    Then sistem memverifikasi elemen "Banner Jadwal" dengan assertion "text" bernilai "Jadwal kapal saat ini belum tersedia"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-medium @REQ-020 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-043 — Banner tidak tampil untuk lelang dengan jadwal
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penawaran memiliki jadwal direct."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-043 pada scenarios.json
    Then sistem tidak menampilkan "Banner Jadwal"
    And sistem menampilkan "Wizard Order"

  @positive @priority-high @REQ-021 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-051 — Simpan Review read-only membentuk order dan satu notifikasi
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua step valid; vendor A terpilih; snapshot data lengkap fixture tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-051 pada scenarios.json
    Then sistem memverifikasi elemen "Review Order" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Review Order" dengan assertion "snapshot" bernilai "sama dengan snapshot Step 1/2/3"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Daftar Order Vendor"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Pusat Notifikasi Vendor A"
    Then sistem memverifikasi elemen "Notifikasi Order Baru" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Penerima Notifikasi" dengan assertion "value" bernilai "VENDOR-A"

  @negative @priority-high @REQ-021 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-044 — Gagal simpan Review tidak membentuk order parsial atau notifikasi
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Respons transaksi simpan pertama gagal sebelum commit; retry dapat dilakukan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-044 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem menampilkan "Error Simpan Order"
    And sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Notifikasi Order Baru" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Review Order" dengan assertion "snapshot" bernilai "data input tetap tersedia"

  @edge @priority-high @REQ-021 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-017 — Retry setelah commit tidak menduplikasi order atau notifikasi
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Simpan pertama commit sukses tetapi respons timeout; token transaksi dipertahankan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-017 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem menampilkan "Error Koneksi"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Notifikasi Order Baru" dengan assertion "count" bernilai "1"

  @positive @priority-high @REQ-021 @screen-detail-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-052 — Detail Order menampilkan data yang sama dengan Review
    Given user berada di halaman "Detail Order"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order baru sudah disimpan; fixture snapshot Review tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-052 pada scenarios.json
    Then sistem memverifikasi elemen "Detail Order" dengan assertion "snapshot" bernilai "sama dengan snapshot Review"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Data Rute" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Ringkasan Kontainer" dengan assertion "readonly" bernilai "true"

  @positive @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-053 — Vendor pemilik dapat membuka Konfirmasi Order
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik VENDOR-A Menunggu Konfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-053 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Konfirmasi Order"
    Then sistem menampilkan "Modal Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-045 — Konfirmasi Order tidak tersedia pada status Draft
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Draft."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-045 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-046 — Konfirmasi Order tidak tersedia pada status Menunggu Penugasan
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Menunggu Penugasan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-046 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-047 — Konfirmasi Order tidak tersedia pada status Ditolak
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Ditolak."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-047 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-048 — Konfirmasi Order tidak tersedia pada status Konfirmasi Jadwal
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Konfirmasi Jadwal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-048 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-049 — Konfirmasi Order tidak tersedia pada status Ditugaskan
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Ditugaskan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-049 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-050 — Konfirmasi Order tidak tersedia pada status Terkirim
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Terkirim."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-050 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-051 — Konfirmasi Order tidak tersedia pada status Dibatalkan
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik vendor tetapi status Dibatalkan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-051 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-052 — Vendor lain tidak dapat membuka konfirmasi order melalui URL
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "ORD-FCL-009 milik VENDOR-A; sesi VENDOR-B mengakses URL langsung."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-052 pada scenarios.json
    Then sistem memverifikasi elemen "Akses Konfirmasi Order" dengan assertion "access" bernilai "ditolak"
    And sistem tidak menampilkan "Ringkasan Konfirmasi Order"

  @negative @priority-high @REQ-022 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-053 — Shipper tidak mendapatkan action konfirmasi vendor
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi milik shipper."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-053 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Konfirmasi Order"

  @positive @priority-medium @REQ-023 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-054 — Modal menampilkan ringkasan read-only dan pilihan awal kosong
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi, muat 08/10 10:00, akhir kirim 10/10 18:00, 2x20 DRY SUB-PNJ."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-054 pada scenarios.json
    Then sistem memverifikasi elemen "Ringkasan Konfirmasi Order" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Ringkasan Konfirmasi Order" dengan assertion "snapshot" bernilai "{\"containerType\": \"20 DRY\", \"deadline\": \"10/10/2026 18:00 WIB\", \"destination\": \"Panjang (PNJ)\", \"loadAt\": \"08/10/2026 10:00 WIB\", \"origin\": \"Tanjung Perak (SUB)\", \"quantity\": 2, \"shippingType\": \"FCL\"}"
    And sistem memverifikasi elemen "Terima Order" dengan assertion "checked" bernilai "false"
    And sistem memverifikasi elemen "Tolak Order" dengan assertion "checked" bernilai "false"
    And sistem memverifikasi elemen "Simpan" dengan assertion "enabled" bernilai "false"

  @negative @priority-medium @REQ-023 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-054 — Simpan tanpa keputusan tidak mengubah status
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Modal terbuka; kedua radio belum dipilih."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-054 pada scenarios.json
    Then sistem memverifikasi elemen "Simpan" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "snapshot" bernilai "tetap seperti sebelum modal"

  @edge @priority-medium @REQ-023 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-018 — Batal atau X setelah memilih Terima tidak menyimpan keputusan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki jadwal; modal baru terbuka."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-018 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Batal"
    Then sistem tidak menampilkan "Modal Konfirmasi Order"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user mengklik elemen "Konfirmasi Order"
    And user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "Armada penuh"
    And user mengklik elemen "Tutup"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @positive @priority-high @REQ-024 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-055 — Terima order dengan jadwal Direct tidak meminta jadwal ulang
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi, penawaran berjadwal Direct."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-055 pada scenarios.json
    When user mengklik elemen "Terima Order"
    Then sistem tidak menampilkan "Form Jadwal Kapal"
    And sistem memverifikasi elemen "Simpan" dengan assertion "enabled" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-024 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-056 — Terima order dengan jadwal Connecting tidak meminta jadwal ulang
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi, penawaran berjadwal Connecting."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-056 pada scenarios.json
    When user mengklik elemen "Terima Order"
    Then sistem tidak menampilkan "Form Jadwal Kapal"
    And sistem memverifikasi elemen "Simpan" dengan assertion "enabled" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @negative @priority-high @REQ-024 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-055 — Gagal simpan penerimaan berjadwal menjaga status dan jadwal lama
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Simpan gagal sebelum commit; penawaran berjadwal direct."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-055 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Simpan"
    Then sistem menampilkan "Error Konfirmasi Order"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-057 — Terima order tanpa jadwal dengan form Direct lengkap
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi tanpa jadwal, tanpa toleransi; baseline Open Stack diturunkan dari master."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-057 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user berada di halaman "Tambah Penugasan"
    And user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-058 — Terima order tanpa jadwal dengan form Connecting lengkap
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi tanpa jadwal, tanpa toleransi; baseline Open Stack diturunkan dari master."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-058 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user berada di halaman "Tambah Penugasan"
    And user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-056 — Field wajib jadwal Pelayaran kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-056 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user memilih opsi "" pada field "Pelayaran"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Pelayaran" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-057 — Field wajib jadwal Nama Kapal kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-057 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Nama Kapal" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Nama Kapal" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-058 — Field wajib jadwal Voyage [Kapal Utama] kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-058 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Voyage [Kapal Utama]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Voyage [Kapal Utama]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-059 — Field wajib jadwal Closing Time [Kapal Utama] kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-059 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Closing Time [Kapal Utama]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Closing Time [Kapal Utama]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-060 — Field wajib jadwal Berangkat (ETD) [Kapal Utama] kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-060 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Berangkat (ETD) [Kapal Utama]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-061 — Field wajib jadwal Tiba (ETA) [Kapal Utama] kosong mencegah penerimaan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; semua field selain target valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-061 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tiba (ETA) [Kapal Utama]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-062 — Connecting field Pelabuhan Connecting [Leg 2] kosong divalidasi pada leg tambahan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; dua leg connecting; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-062 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user memilih opsi "" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Pelabuhan Connecting [Leg 2]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-063 — Connecting field Kapal Connecting [Leg 2] kosong divalidasi pada leg tambahan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; dua leg connecting; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-063 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Kapal Connecting [Leg 2]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-064 — Connecting field Voyage [Leg 2] kosong divalidasi pada leg tambahan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; dua leg connecting; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-064 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengisi field "Voyage [Leg 2]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Voyage [Leg 2]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-065 — Connecting field ETD Connecting [Leg 2] kosong divalidasi pada leg tambahan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; dua leg connecting; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-065 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengisi field "ETD Connecting [Leg 2]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "ETD Connecting [Leg 2]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-066 — Jadwal direct Closing setelah ETD gagal validasi baseline
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-066 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-09T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Jadwal" dengan assertion "error" bernilai "jadwal tidak valid sesuai baseline OMS"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-067 — Jadwal direct ETA sebelum ETD gagal validasi baseline
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-067 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-08T17:59:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Jadwal" dengan assertion "error" bernilai "jadwal tidak valid sesuai baseline OMS"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-068 — Jadwal direct datetime invalid gagal validasi baseline
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-068 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "31/02/2026 10:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Jadwal" dengan assertion "error" bernilai "jadwal tidak valid sesuai baseline OMS"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-069 — Urutan ETD connecting mundur tidak dapat disimpan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; leg 2 ETD sebelum leg 1."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-069 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-08T17:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "ETD Connecting [Leg 2]" dengan assertion "error" bernilai "urutan connecting tidak valid"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @edge @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-019 — Switch Terima ke Tolak tidak mewajibkan jadwal yang tersembunyi
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; form jadwal masih kosong."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-019 pada scenarios.json
    When user mengklik elemen "Terima Order"
    Then sistem menampilkan "Form Jadwal Kapal"
    When user mengklik elemen "Tolak Order"
    Then sistem tidak menampilkan "Form Jadwal Kapal"
    When user mengisi field "Alasan Penolakan" dengan "Armada tidak tersedia"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @edge @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-020 — Switch connecting ke direct tidak mengirim leg tersembunyi
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-020 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    Then sistem tidak menampilkan "Data Kapal Connecting"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-059 — Jadwal pada batas toleransi Closing Time diterima
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif acuan Closing Time; batas sama nilai jadwal fixture, field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-059 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    Then sistem memverifikasi elemen "Banner Batas Toleransi" dengan assertion "snapshot" bernilai "{\"limit\": \"2026-10-08T12:00:00+07:00\", \"reference\": \"Closing Time\", \"timezone\": \"WIB\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @negative @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-070 — Closing Time satu menit melewati toleransi menampilkan helper
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; toleransi aktif; field lain valid dan masih di bawah akhir kirim."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-070 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Closing Time [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @positive @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-060 — Jadwal pada batas toleransi Berangkat (ETD) diterima
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif acuan Berangkat (ETD); batas sama nilai jadwal fixture, field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-060 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    Then sistem memverifikasi elemen "Banner Batas Toleransi" dengan assertion "snapshot" bernilai "{\"limit\": \"2026-10-08T18:00:00+07:00\", \"reference\": \"Berangkat (ETD)\", \"timezone\": \"WIB\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @negative @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-071 — Berangkat (ETD) satu menit melewati toleransi menampilkan helper
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; toleransi aktif; field lain valid dan masih di bawah akhir kirim."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-071 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Berangkat (ETD) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @positive @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-061 — Jadwal pada batas toleransi Tiba (ETA) diterima
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif acuan Tiba (ETA); batas sama nilai jadwal fixture, field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-061 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    Then sistem memverifikasi elemen "Banner Batas Toleransi" dengan assertion "snapshot" bernilai "{\"limit\": \"2026-10-09T18:00:00+07:00\", \"reference\": \"Tiba (ETA)\", \"timezone\": \"WIB\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @negative @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-072 — Tiba (ETA) satu menit melewati toleransi menampilkan helper
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; toleransi aktif; field lain valid dan masih di bawah akhir kirim."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-072 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tiba (ETA) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "null"

  @edge @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-021 — Toleransi ETA connecting mengecek tiba akhir rangkaian
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order connecting tanpa jadwal; ETA akhir 10/10 12:00, batas ETA 10/10 12:00."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-021 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"

  @negative @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-073 — ETA akhir connecting melampaui toleransi tidak diterima
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal; batas ETA 10/10 11:59; rangkaian valid ETA 12:00."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-073 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tiba (ETA) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @positive @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-062 — Tanpa toleransi jadwal di bawah akhir kirim diterima
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada batas toleransi; order tanpa jadwal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-062 pada scenarios.json
    When user mengklik elemen "Terima Order"
    Then sistem tidak menampilkan "Banner Batas Toleransi"
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @negative @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-074 — Jadwal tanpa toleransi closing setelah akhir kirim ditolak
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada toleransi; kronologi tetap valid agar error batas terisolasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-074 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-10T18:02:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:03:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-075 — Jadwal tanpa toleransi etd setelah akhir kirim ditolak
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada toleransi; kronologi tetap valid agar error batas terisolasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-075 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:02:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-076 — Jadwal tanpa toleransi eta setelah akhir kirim ditolak
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada toleransi; kronologi tetap valid agar error batas terisolasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-076 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @edge @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-022 — ETA tepat akhir kirim diterima tanpa toleransi
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua field lain valid dan lebih awal."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-022 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @negative @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-077 — ETD connecting setelah akhir kirim tidak dapat disimpan
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order tanpa jadwal tanpa toleransi; ETA akhir juga setelah ETD connecting."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-077 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T19:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @positive @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-063 — Penolakan valid menetapkan Ditolak dan tetap terlihat kedua aktor
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi; belum ada penggantian penawaran."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-063 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "Armada tidak tersedia"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    When user berada di halaman "Daftar Order Vendor"
    Then sistem menampilkan "Baris ORD-FCL-009"
    When user berada di halaman "Daftar Order Shipper"
    Then sistem menampilkan "Baris ORD-FCL-009"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"

  @negative @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-078 — Alasan Penolakan '' tidak mengubah status
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-078 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @negative @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-079 — Alasan Penolakan '   ' tidak mengubah status
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-079 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "   "
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"

  @edge @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-023 — Alasan penolakan Unicode dan markup ditampilkan sebagai teks aman
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-023 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "Kapal tertunda — cuaca 🌧 <b>aman</b>"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Alasan Penolakan Tersimpan" dengan assertion "text" bernilai "Kapal tertunda — cuaca 🌧 <b>aman</b>"
    And sistem memverifikasi elemen "Markup Alasan" dengan assertion "htmlExecuted" bernilai "false"

  @positive @priority-high @REQ-029 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-064 — Penggantian menampilkan hanya penawaran lain dan tombol Pilih
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Ditolak dari OFFER-A; OFFER-B/OFFER-C aktif dari lelang yang sama."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-064 pada scenarios.json
    Then sistem memverifikasi elemen "Wizard Penggantian" dengan assertion "items" bernilai "[\"Pilih Penawaran\", \"Review\"]"
    And sistem tidak menampilkan "Card OFFER-A"
    And sistem menampilkan "Card OFFER-B"
    And sistem menampilkan "Card OFFER-C"
    And sistem memverifikasi elemen "Pilihan Penawaran" dengan assertion "items" bernilai "[\"OFFER-B\", \"OFFER-C\"]"
    And sistem tidak menampilkan "Pesan [OFFER-B]"
    When user mengklik elemen "Pilih [OFFER-B]"
    And user mengklik elemen "Selanjutnya"
    Then sistem menampilkan "Review Penawaran Lain"

  @positive @priority-high @REQ-029 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-065 — Shipper membuka Pilih Penawaran Lain dari order Ditolak
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Ditolak milik SHIPPER-A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-065 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Pilih Penawaran Lain"
    Then sistem menampilkan "Wizard Penggantian"

  @negative @priority-high @REQ-029 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-080 — Pilih Penawaran Lain tidak tersedia untuk vendor pada Ditolak
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order fixture dimiliki aktor sesuai role."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-080 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Pilih Penawaran Lain"

  @negative @priority-high @REQ-029 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-081 — Pilih Penawaran Lain tidak tersedia untuk shipper pada Menunggu Konfirmasi
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order fixture dimiliki aktor sesuai role."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-081 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Pilih Penawaran Lain"

  @negative @priority-high @REQ-029 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-082 — Pilih Penawaran Lain tidak tersedia untuk shipper pada Menunggu Penugasan
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order fixture dimiliki aktor sesuai role."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-082 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Pilih Penawaran Lain"

  @negative @priority-high @REQ-029 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-083 — Selanjutnya tanpa penawaran terpilih menahan pemilihan
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Ditolak, dua alternatif valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-083 pada scenarios.json
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Validasi Pilihan Penawaran" dengan assertion "error" bernilai "pilih penawaran terlebih dahulu"
    And sistem tidak menampilkan "Review Penawaran Lain"

  @edge @priority-high @REQ-029 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-024 — Tidak ada penawaran alternatif menampilkan empty dan menahan lanjut
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A adalah satu-satunya penawaran lelang."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-024 pada scenarios.json
    Then sistem memverifikasi elemen "Pilihan Penawaran" dengan assertion "count" bernilai "0"
    And sistem menampilkan "Empty Penawaran Lain"
    And sistem memverifikasi elemen "Selanjutnya" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"

  @positive @priority-high @REQ-029 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-066 — Filter penawaran pengganti tidak mengembalikan penawaran lama
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A lama, OFFER-B cocok kriteria, OFFER-C berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-066 pada scenarios.json
    When user mengklik elemen "Filter"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user memilih opsi "VENDOR-B" pada field "Vendor"
    And user memilih opsi "20 DRY" pada field "Jenis Kontainer"
    And user mengisi field "ETD" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "ETA" dengan "2026-10-09T18:00:00+07:00"
    And user memilih opsi "Direct" pada field "Jenis Jadwal"
    And user mengklik elemen "Terapkan"
    Then sistem memverifikasi elemen "Pilihan Penawaran" dengan assertion "items" bernilai "[\"OFFER-B\"]"
    When user mengklik elemen "Reset"
    Then sistem tidak menampilkan "Card OFFER-A"
    When user mengklik elemen "Urutkan"
    Then sistem memverifikasi elemen "Pilihan Penawaran" dengan assertion "order" bernilai "harga ascending"

  @positive @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-067 — Simpan penggantian mengarsipkan penolakan dan membuat order vendor baru
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-B VENDOR-B harga 1500000 berjadwal direct; PIC/barang lama dipertahankan; perubahan direview."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-067 pada scenarios.json
    Then sistem memverifikasi elemen "Review Penawaran Lain" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Vendor Baru" dengan assertion "text" bernilai "VENDOR-B"
    And sistem memverifikasi elemen "Harga Satuan Baru" dengan assertion "text" bernilai "1500000"
    And sistem memverifikasi elemen "Jadwal Baru" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "PIC dan Barang" dengan assertion "snapshot" bernilai "sama dengan order ditolak"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order Pengganti" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Riwayat Order Tidak Aktif"
    Then sistem memverifikasi elemen "Status Order Lama" dengan assertion "text" bernilai "Ditolak"
    When user berada di halaman "Daftar Order Vendor A"
    Then sistem menampilkan "Baris ORD-FCL-009"
    And sistem memverifikasi elemen "Status Order Lama" dengan assertion "text" bernilai "Ditolak"

  @positive @priority-high @REQ-030 @screen-riwayat-order-tidak-aktif
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-068 — Riwayat tidak aktif mengandung catatan Ditolak sesudah penggantian
    Given user berada di halaman "Riwayat Order Tidak Aktif"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penggantian OFFER-B sukses; catatan lama ORD-FCL-009."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-068 pada scenarios.json
    Then sistem memverifikasi elemen "ID Order Lama" dengan assertion "text" bernilai "ORD-FCL-009"
    And sistem memverifikasi elemen "Status Order Lama" dengan assertion "text" bernilai "Ditolak"
    And sistem memverifikasi elemen "Vendor Lama" dengan assertion "text" bernilai "VENDOR-A"
    And sistem memverifikasi elemen "Alasan Penolakan Tersimpan" dengan assertion "text" bernilai "Armada tidak tersedia"
    And sistem menampilkan "Referensi Order Pengganti"

  @negative @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-084 — Penggantian gagal simpan tidak mengarsipkan order lama
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Respons simpan gagal sebelum commit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-084 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem menampilkan "Error Penggantian Penawaran"
    When user berada di halaman "Daftar Order Shipper"
    Then sistem menampilkan "Baris ORD-FCL-009"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    When user berada di halaman "Riwayat Order Tidak Aktif"
    Then sistem memverifikasi elemen "Catatan Order Lama" dengan assertion "count" bernilai "0"

  @edge @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-025 — Pengganti tanpa jadwal menunggu konfirmasi dan input jadwal vendor baru
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-B tanpa jadwal; valid sampai akhir kirim."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-025 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order Pengganti" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Konfirmasi Order Vendor B"
    And user mengklik elemen "Terima Order"
    Then sistem menampilkan "Form Jadwal Kapal"

  @edge @priority-high @REQ-030 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-026 — Batal memilih alternatif tidak mengarsipkan penolakan
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Ditolak; OFFER-B telah dipilih tetapi belum disimpan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-026 pada scenarios.json
    When user mengklik elemen "Pilih [OFFER-B]"
    And user mengklik elemen "Batal"
    And user mengklik elemen "Ya Batalkan"
    And user berada di halaman "Daftar Order Shipper"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    When user berada di halaman "Riwayat Order Tidak Aktif"
    Then sistem memverifikasi elemen "Catatan Order Lama" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-085 — Alternatif kadaluarsa sebelum simpan tidak mengganti vendor
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-B valid saat dipilih, kedaluwarsa saat review; status lama Ditolak."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-085 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Penawaran" dengan assertion "error" bernilai "penawaran tidak berlaku"
    And sistem memverifikasi elemen "Vendor Lama" dengan assertion "text" bernilai "VENDOR-A"
    And sistem memverifikasi elemen "Order Pengganti" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-031 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-069 — Shipper vendor dikelola admin mengedit jadwal tanpa approval
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Penugasan; vendor dikelola admin; jadwal direct lama."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-069 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Baru"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Nama Kapal Efektif" dengan assertion "text" bernilai "KM Baru"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-031 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-070 — Vendor pemilik dapat membuka form Edit Jadwal
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order milik VENDOR-A siap penugasan dan jadwal telah ada."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-070 pada scenarios.json
    Then sistem menampilkan "Modal Edit Jadwal"
    And sistem memverifikasi elemen "Ringkasan Konfirmasi Order" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Nama Kapal" dengan assertion "value" bernilai "KM Swarna Bahari"

  @negative @priority-high @REQ-031 @screen-daftar-order-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-086 — Shipper tidak dapat mengedit jadwal vendor mandiri
    Given user berada di halaman "Daftar Order Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "vendorManagedByAdmin=false."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-086 pada scenarios.json
    When user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem tidak menampilkan "Edit Jadwal"
    When user berada di halaman "Edit Jadwal Shipper"
    Then sistem memverifikasi elemen "Akses Edit Jadwal" dengan assertion "access" bernilai "ditolak"

  @negative @priority-high @REQ-031 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-087 — Vendor lain tidak dapat mengedit jadwal order pemilik
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Sesi VENDOR-B pada order milik VENDOR-A melalui URL."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-087 pada scenarios.json
    Then sistem memverifikasi elemen "Akses Edit Jadwal" dengan assertion "access" bernilai "ditolak"
    And sistem tidak menampilkan "Modal Edit Jadwal"

  @positive @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-071 — edit-jadwal-shipper mengganti Direct menjadi Connecting dengan jadwal valid
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal Direct; vendor dikelola admin untuk shipper; approval vendor nonaktif untuk isolasi edit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-071 pada scenarios.json
    When user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Connecting"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"

  @positive @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-072 — edit-jadwal-shipper mengganti Connecting menjadi Direct dengan jadwal valid
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal Connecting; vendor dikelola admin untuk shipper; approval vendor nonaktif untuk isolasi edit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-072 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-088 — edit-jadwal-shipper melampaui toleransi Closing Time tidak disimpan
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-088 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Closing Time [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-089 — edit-jadwal-shipper melampaui toleransi Berangkat (ETD) tidak disimpan
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-089 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Berangkat (ETD) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-090 — edit-jadwal-shipper melampaui toleransi Tiba (ETA) tidak disimpan
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-090 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tiba (ETA) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-091 — edit-jadwal-shipper tanpa toleransi tetap menolak ETA setelah akhir kirim
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal lama valid; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-091 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @edge @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-027 — edit-jadwal-shipper Batal dan X tidak menyimpan perubahan
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal direct."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-027 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "KM Belum Disimpan"
    And user mengklik elemen "Batal"
    Then sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-073 — edit-jadwal-vendor mengganti Direct menjadi Connecting dengan jadwal valid
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal Direct; vendor dikelola admin untuk shipper; approval vendor nonaktif untuk isolasi edit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-073 pada scenarios.json
    When user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Connecting"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"

  @positive @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-074 — edit-jadwal-vendor mengganti Connecting menjadi Direct dengan jadwal valid
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal Connecting; vendor dikelola admin untuk shipper; approval vendor nonaktif untuk isolasi edit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-074 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-092 — edit-jadwal-vendor melampaui toleransi Closing Time tidak disimpan
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-092 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Closing Time [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-093 — edit-jadwal-vendor melampaui toleransi Berangkat (ETD) tidak disimpan
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-093 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Berangkat (ETD) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-094 — edit-jadwal-vendor melampaui toleransi Tiba (ETA) tidak disimpan
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi aktif; jadwal lama valid; field selain acuan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-094 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tiba (ETA) [Kapal Utama]" dengan assertion "error" bernilai "Melewati batas toleransi waktu"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-095 — edit-jadwal-vendor tanpa toleransi tetap menolak ETA setelah akhir kirim
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal lama valid; tanpa toleransi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-095 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @edge @priority-high @REQ-032 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-028 — edit-jadwal-vendor Batal dan X tidak menyimpan perubahan
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal awal direct."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-028 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "KM Belum Disimpan"
    And user mengklik elemen "Batal"
    Then sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-033 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-075 — Vendor submit jadwal menunggu approval dengan jadwal efektif lama
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "approvalRequired=true; jadwal lama direct; vendor mengajukan connecting."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-075 pada scenarios.json
    When user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Aksi Order [ORD-FCL-009]"
    Then sistem menampilkan "Konfirmasi Jadwal"

  @negative @priority-high @REQ-033 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-096 — Gagal simpan pengajuan tidak membentuk pending atau mengubah status
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "approval aktif; simpan gagal sebelum commit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-096 pada scenarios.json
    When user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem menampilkan "Error Pengajuan Jadwal"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @edge @priority-high @REQ-033 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-029 — Pengajuan kedua saat masih pending tidak menimpa proposal pertama
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Pengajuan connecting pertama pending; dua sesi vendor membuka snapshot awal yang sama."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-029 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "KM Proposal Kedua"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Konflik Pengajuan" dengan assertion "error" bernilai "pengajuan jadwal masih menunggu konfirmasi"
    And sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-034 @screen-pengaturan-approval
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-076 — Setting approval nonaktif tersimpan dan berlaku pada edit vendor
    Given user berada di halaman "Pengaturan Approval Jadwal"
    And prasyarat "Aktor admin terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Aktor admin pengaturan berwenang; approval awal aktif; tidak ada pending."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-076 pada scenarios.json
    When user menghapus centang checkbox "Persetujuan Shipper untuk Edit Jadwal"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Pengaturan Approval Jadwal"
    Then sistem memverifikasi elemen "Persetujuan Shipper untuk Edit Jadwal" dengan assertion "checked" bernilai "false"
    When user berada di halaman "Edit Jadwal Vendor"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Tanpa Approval"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Nama Kapal Efektif" dengan assertion "text" bernilai "KM Tanpa Approval"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-034 @screen-pengaturan-approval
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-077 — Setting approval aktif kembali memerlukan respons shipper
    Given user berada di halaman "Pengaturan Approval Jadwal"
    And prasyarat "Aktor admin terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Aktor admin berwenang; approval awal nonaktif; tidak ada pending."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-077 pada scenarios.json
    When user mencentang checkbox "Persetujuan Shipper untuk Edit Jadwal"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Edit Jadwal Vendor"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Perlu Approval"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Nama Kapal Efektif" dengan assertion "text" bernilai "KM Swarna Bahari"

  @negative @priority-high @REQ-034 @screen-pengaturan-approval
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-097 — Vendor tanpa hak setting tidak dapat mematikan approval
    Given user berada di halaman "Pengaturan Approval Jadwal"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Vendor biasa tanpa hak konfigurasi; approval aktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-097 pada scenarios.json
    Then sistem memverifikasi elemen "Akses Pengaturan Approval" dengan assertion "access" bernilai "ditolak"
    And sistem memverifikasi elemen "Setting Approval Efektif" dengan assertion "checked" bernilai "true"

  @negative @priority-high @REQ-034 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-098 — Approval nonaktif tidak mengizinkan jadwal invalid
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "ETA setelah akhir kirim; approval nonaktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-098 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:01:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Validasi Akhir Kirim" dengan assertion "error" bernilai "jadwal melewati Rencana Akhir Kirim"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-078 — Shipper Terima pengajuan mengembalikan status Menunggu Penugasan
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Konfirmasi Jadwal; jadwal lama direct; pengajuan connecting; shipper pemilik."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-078 pada scenarios.json
    Then sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Terima"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-079 — Shipper Tolak pengajuan mengembalikan status Menunggu Penugasan
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Konfirmasi Jadwal; jadwal lama direct; pengajuan connecting; shipper pemilik."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-079 pada scenarios.json
    Then sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jadwal Pengajuan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Tolak"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-099 — Shipper lain tidak dapat merespons pengajuan jadwal
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "SHIPPER-B membuka pengajuan milik SHIPPER-A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-099 pada scenarios.json
    Then sistem memverifikasi elemen "Akses Konfirmasi Jadwal" dengan assertion "access" bernilai "ditolak"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @negative @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-100 — Gagal respons Terima tidak menerapkan jadwal sebagian
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Pengajuan connecting pending; respons gagal sebelum commit."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-100 pada scenarios.json
    When user mengklik elemen "Terima"
    Then sistem menampilkan "Error Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @edge @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-030 — Menutup dialog persetujuan membiarkan pengajuan pending
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Pengajuan connecting pending."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-030 pada scenarios.json
    When user mengklik elemen "Tutup"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Konfirmasi Jadwal"
    And sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "1"

  @edge @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-031 — Keputusan kedua dari tab stale tidak membalik keputusan pertama
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tab A sudah Terima; tab B masih membuka snapshot pending yang sama."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-031 pada scenarios.json
    When user mengklik elemen "Tolak"
    Then sistem memverifikasi elemen "Konflik Keputusan" dengan assertion "error" bernilai "pengajuan sudah diproses"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-medium @REQ-036 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-080 — Perubahan jadwal shipper tercatat lengkap di Riwayat Perubahan
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal lama direct; perubahan langsung berlaku; admin vendor untuk shipper."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-080 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "KM Audit Baru"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Riwayat Perubahan"
    Then sistem memverifikasi elemen "Riwayat Jadwal" dengan assertion "auditEntry" bernilai "{\"actor\": \"shipper\", \"newShip\": \"KM Audit Baru\", \"oldShip\": \"KM Swarna Bahari\", \"timeWib\": \"2026-10-07T10:00:00+07:00\"}"
    And sistem memverifikasi elemen "Entri Perubahan Jadwal" dengan assertion "count" bernilai "1"

  @positive @priority-medium @REQ-036 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-081 — Perubahan jadwal vendor tercatat lengkap di Riwayat Perubahan
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal lama direct; perubahan langsung berlaku; admin vendor untuk shipper."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-081 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "KM Audit Baru"
    And user mengklik elemen "Simpan"
    And user berada di halaman "Riwayat Perubahan"
    Then sistem memverifikasi elemen "Riwayat Jadwal" dengan assertion "auditEntry" bernilai "{\"actor\": \"vendor\", \"newShip\": \"KM Audit Baru\", \"oldShip\": \"KM Swarna Bahari\", \"timeWib\": \"2026-10-07T10:00:00+07:00\"}"
    And sistem memverifikasi elemen "Entri Perubahan Jadwal" dengan assertion "count" bernilai "1"

  @positive @priority-medium @REQ-036 @screen-riwayat-perubahan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-082 — Riwayat pengajuan diterima mempertahankan pengaju dan approver
    Given user berada di halaman "Riwayat Perubahan"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Vendor mengajukan jadwal, shipper menerima; fixture audit keputusan tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-082 pada scenarios.json
    Then sistem memverifikasi elemen "Riwayat Jadwal" dengan assertion "auditEntry" bernilai "{\"approvedBy\": \"SHIPPER-A\", \"decision\": \"Terima\", \"newType\": \"Connecting\", \"oldType\": \"Direct\", \"submittedBy\": \"VENDOR-A\"}"

  @negative @priority-medium @REQ-036 @screen-riwayat-perubahan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-101 — Edit gagal atau batal tidak dicatat sebagai perubahan efektif
    Given user berada di halaman "Riwayat Perubahan"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture satu edit invalid dan satu edit Batal; tidak ada edit sukses."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-101 pada scenarios.json
    Then sistem memverifikasi elemen "Entri Perubahan Efektif" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @edge @priority-medium @REQ-036 @screen-riwayat-perubahan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-032 — Penolakan proposal tercatat tanpa perubahan efektif
    Given user berada di halaman "Riwayat Perubahan"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Vendor mengajukan connecting; shipper menolak."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-032 pada scenarios.json
    Then sistem memverifikasi elemen "Riwayat Keputusan" dengan assertion "auditEntry" bernilai "{\"decision\": \"Tolak\", \"proposedType\": \"Connecting\"}"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Entri Perubahan Efektif" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-083 — Penugasan master kontainer dan mode Tugaskan ke Sopir tersimpan
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order diterima Menunggu Penugasan; master armada/sopir aktif; 1 kontainer."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-083 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    Then sistem menampilkan "Banner Mode Penugasan"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Mode Penugasan Tersimpan" dengan assertion "text" bernilai "Tugaskan ke Sopir"
    And sistem memverifikasi elemen "No. Kontainer Tersimpan" dengan assertion "text" bernilai "MSCU1234566"

  @positive @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-084 — Penugasan master kontainer dan mode Tugaskan ke Pengurus tersimpan
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order diterima Menunggu Penugasan; master armada/sopir aktif; 1 kontainer."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-084 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Pengurus"
    Then sistem menampilkan "Banner Mode Penugasan"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Mode Penugasan Tersimpan" dengan assertion "text" bernilai "Tugaskan ke Pengurus"
    And sistem memverifikasi elemen "No. Kontainer Tersimpan" dengan assertion "text" bernilai "MSCU1234566"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-102 — Penugasan No. Kontainer [Kontainer 1] kosong ditolak oleh baseline
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order siap penugasan; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-102 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "No. Kontainer [Kontainer 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-103 — Penugasan No. Segel [Kontainer 1] kosong ditolak oleh baseline
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order siap penugasan; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-103 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengisi field "No. Segel [Kontainer 1]" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "No. Segel [Kontainer 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-104 — Penugasan No. Polisi/Jenis Armada [Kontainer 1] kosong ditolak oleh baseline
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order siap penugasan; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-104 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user memilih opsi "" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "No. Polisi/Jenis Armada [Kontainer 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-105 — Penugasan Sopir/No. WhatsApp [Kontainer 1] kosong ditolak oleh baseline
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order siap penugasan; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-105 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user memilih opsi "" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Sopir/No. WhatsApp [Kontainer 1]" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-106 — Order Menunggu Konfirmasi tidak dapat ditugaskan
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada penugasan existing pada order fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-106 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    Then sistem tidak menampilkan "ORD-FCL-009"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-107 — Order Ditolak tidak dapat ditugaskan
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada penugasan existing pada order fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-107 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    Then sistem tidak menampilkan "ORD-FCL-009"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @negative @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-108 — Order Konfirmasi Jadwal tidak dapat ditugaskan
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tidak ada penugasan existing pada order fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-108 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    Then sistem tidak menampilkan "ORD-FCL-009"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-085 — Armada dan sopir manual mengikuti validasi baseline OMS
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order diterima; baseline field manual tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-085 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Isi Data Manual [Armada Muat/Kontainer 1]"
    And user mengisi field "No. Polisi Manual" dengan "L 9876 QA"
    And user memilih opsi "Trailer" pada field "Jenis Armada Manual"
    And user mengklik elemen "Isi Data Manual [Sopir Muat/Kontainer 1]"
    And user mengisi field "Nama Sopir Manual" dengan "Budi Manual"
    And user mengisi field "No. WhatsApp Sopir Manual" dengan "081234567890"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Nama Sopir Tersimpan" dengan assertion "text" bernilai "Budi Manual"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-037 @screen-penugasan-sopir-bongkar
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-086 — Penugasan sopir bongkar valid mempertahankan jadwal order
    Given user berada di halaman "Penugasan Sopir Bongkar"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penugasan muat sudah ada; kontainer dan segel read-only."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-086 pada scenarios.json
    Then sistem memverifikasi elemen "No. Kontainer Tersimpan" dengan assertion "text" bernilai "MSCU1234566"
    And sistem memverifikasi elemen "Ringkasan Order Bongkar" dengan assertion "readonly" bernilai "true"
    When user mengisi field "Tanggal Permintaan Bongkar" dengan "2026-10-10T15:00:00+07:00"
    And user mengklik elemen "Pilih Dari Master [Armada Bongkar]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Bongkar]"
    And user mengklik elemen "Pilih Dari Master [Sopir Bongkar]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Bongkar]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan Bongkar" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @negative @priority-high @REQ-037 @screen-penugasan-sopir-bongkar
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-109 — Tanggal Permintaan Bongkar kosong tidak tersimpan
    Given user berada di halaman "Penugasan Sopir Bongkar"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Armada/sopir/mode bongkar fixture valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-109 pada scenarios.json
    When user mengisi field "Tanggal Permintaan Bongkar" dengan ""
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Tanggal Permintaan Bongkar" dengan assertion "error" bernilai "wajib diisi"
    And sistem memverifikasi elemen "Penugasan Bongkar" dengan assertion "count" bernilai "0"

  @edge @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-033 — Batal penugasan tidak menyimpan kontainer armada atau sopir
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order siap ditugaskan."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-033 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Batal"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @positive @priority-high @REQ-038 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-087 — tambah-penugasan menampilkan seluruh jadwal Direct read-only
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki jadwal Direct; field penugasan valid; edit memiliki penugasan existing."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-087 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Field Jadwal Read Only" dengan assertion "items" bernilai "[\"Pelayaran\", \"Nama Kapal\", \"Voyage\", \"Open Stack\", \"Closing Time\", \"Berangkat (ETD)\", \"Tiba (ETA)\"]"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-038 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-088 — tambah-penugasan menampilkan seluruh jadwal Connecting read-only
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki jadwal Connecting; field penugasan valid; edit memiliki penugasan existing."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-088 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Connecting"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Field Jadwal Read Only" dengan assertion "items" bernilai "[\"Pelayaran\", \"Nama Kapal\", \"Voyage\", \"Open Stack\", \"Closing Time\", \"Berangkat (ETD)\", \"Tiba (ETA)\"]"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"

  @negative @priority-high @REQ-038 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-110 — tambah-penugasan tidak menyediakan input jadwal atau override kapal
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal order sudah efektif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-110 pada scenarios.json
    Then sistem tidak menampilkan "Input Jenis Jadwal Kapal"
    And sistem tidak menampilkan "Input Pelayaran"
    And sistem tidak menampilkan "Input Nama Kapal"
    And sistem tidak menampilkan "Input Voyage"
    And sistem tidak menampilkan "Input Open Stack"
    And sistem tidak menampilkan "Input Closing Time"
    And sistem tidak menampilkan "Input ETD"
    And sistem tidak menampilkan "Input ETA"
    And sistem tidak menampilkan "Tambah Kapal Connecting"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"

  @positive @priority-high @REQ-038 @screen-edit-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-089 — edit-penugasan menampilkan seluruh jadwal Direct read-only
    Given user berada di halaman "Edit Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki jadwal Direct; field penugasan valid; edit memiliki penugasan existing."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-089 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Direct"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Field Jadwal Read Only" dengan assertion "items" bernilai "[\"Pelayaran\", \"Nama Kapal\", \"Voyage\", \"Open Stack\", \"Closing Time\", \"Berangkat (ETD)\", \"Tiba (ETA)\"]"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "0"

  @positive @priority-high @REQ-038 @screen-edit-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-090 — edit-penugasan menampilkan seluruh jadwal Connecting read-only
    Given user berada di halaman "Edit Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order memiliki jadwal Connecting; field penugasan valid; edit memiliki penugasan existing."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-090 pada scenarios.json
    Then sistem memverifikasi elemen "Jenis Jadwal Kapal" dengan assertion "text" bernilai "Connecting"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Field Jadwal Read Only" dengan assertion "items" bernilai "[\"Pelayaran\", \"Nama Kapal\", \"Voyage\", \"Open Stack\", \"Closing Time\", \"Berangkat (ETD)\", \"Tiba (ETA)\"]"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"

  @negative @priority-high @REQ-038 @screen-edit-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-111 — edit-penugasan tidak menyediakan input jadwal atau override kapal
    Given user berada di halaman "Edit Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jadwal order sudah efektif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-111 pada scenarios.json
    Then sistem tidak menampilkan "Input Jenis Jadwal Kapal"
    And sistem tidak menampilkan "Input Pelayaran"
    And sistem tidak menampilkan "Input Nama Kapal"
    And sistem tidak menampilkan "Input Voyage"
    And sistem tidak menampilkan "Input Open Stack"
    And sistem tidak menampilkan "Input Closing Time"
    And sistem tidak menampilkan "Input ETD"
    And sistem tidak menampilkan "Input ETA"
    And sistem tidak menampilkan "Tambah Kapal Connecting"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"

  @positive @priority-high @REQ-038 @screen-edit-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-091 — Edit armada penugasan tidak mengubah jadwal connecting
    Given user berada di halaman "Edit Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penugasan existing dengan connecting fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-091 pada scenarios.json
    When user memilih opsi "L 5678 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "No. Polisi Tersimpan" dengan assertion "text" bernilai "L 5678 QA"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @positive @priority-high @REQ-039 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-092 — Jadwal penugasan memakai sumber penawaran
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Penugasan; sumber jadwal fixture ditentukan; data master sumber lain berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-092 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jadwal Penugasan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Sumber Jadwal" dengan assertion "value" bernilai "penawaran"

  @positive @priority-high @REQ-039 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-093 — Jadwal penugasan memakai sumber konfirmasi-lelang
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Penugasan; sumber jadwal fixture ditentukan; data master sumber lain berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-093 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jadwal Penugasan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Sumber Jadwal" dengan assertion "value" bernilai "konfirmasi-lelang"

  @positive @priority-high @REQ-039 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-094 — Jadwal penugasan memakai sumber konfirmasi-tanpa-lelang
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Penugasan; sumber jadwal fixture ditentukan; data master sumber lain berbeda."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-094 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Jadwal Penugasan" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Sumber Jadwal" dengan assertion "value" bernilai "konfirmasi-tanpa-lelang"

  @negative @priority-high @REQ-039 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-112 — Order tanpa jadwal efektif tidak mengambil jadwal dari master acak
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture rusak: status Menunggu Penugasan tetapi sumber jadwal null; master kapal memiliki jadwal lain."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-112 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Error Jadwal Order" dengan assertion "error" bernilai "jadwal order belum tersedia"
    And sistem memverifikasi elemen "Simpan" dengan assertion "enabled" bernilai "false"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"

  @edge @priority-high @REQ-039 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-034 — Persetujuan perubahan memperbarui jadwal penugasan saat reload
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Shipper baru menerima proposal connecting; snapshot penugasan belum dimuat."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-034 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"

  @positive @priority-medium @REQ-040 @screen-detail-penugasan-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-095 — detail-penugasan-vendor menampilkan No. Lelang pada Detail Data Order
    Given user berada di halaman "Detail Penugasan Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penugasan order lelang FCL-NRM-TEST-009; actor pemilik."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-095 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "text" bernilai "FCL-NRM-TEST-009"
    And sistem memverifikasi elemen "ID Order" dengan assertion "text" bernilai "ORD-FCL-009"
    And sistem memverifikasi elemen "Detail Data Order" dengan assertion "readonly" bernilai "true"
    And sistem menampilkan "Informasi Penugasan Muat"
    And sistem menampilkan "Informasi Penugasan Bongkar"
    When user mengklik elemen "Lihat Detail Riwayat Penugasan"
    Then sistem menampilkan "Riwayat Penugasan"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Per Tahapan"
    Then sistem menampilkan "Tracking Per Tahapan"
    When user mengklik elemen "Timeline"
    Then sistem menampilkan "Tracking Timeline"

  @negative @priority-medium @REQ-040 @screen-detail-penugasan-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-113 — detail-penugasan-vendor order tanpa lelang tidak menampilkan No. Lelang
    Given user berada di halaman "Detail Penugasan Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order langsung ORD-DIRECT-009 dengan penugasan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-113 pada scenarios.json
    Then sistem tidak menampilkan "No. Lelang Detail Data Order"
    And sistem memverifikasi elemen "ID Order" dengan assertion "text" bernilai "ORD-DIRECT-009"

  @positive @priority-medium @REQ-040 @screen-detail-penugasan-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-096 — detail-penugasan-shipper menampilkan No. Lelang pada Detail Data Order
    Given user berada di halaman "Detail Penugasan Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Penugasan order lelang FCL-NRM-TEST-009; actor pemilik."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-096 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "text" bernilai "FCL-NRM-TEST-009"
    And sistem memverifikasi elemen "ID Order" dengan assertion "text" bernilai "ORD-FCL-009"
    And sistem memverifikasi elemen "Detail Data Order" dengan assertion "readonly" bernilai "true"
    And sistem menampilkan "Informasi Penugasan Muat"
    And sistem menampilkan "Informasi Penugasan Bongkar"
    When user mengklik elemen "Lihat Detail Riwayat Penugasan"
    Then sistem menampilkan "Riwayat Penugasan"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Per Tahapan"
    Then sistem menampilkan "Tracking Per Tahapan"
    When user mengklik elemen "Timeline"
    Then sistem menampilkan "Tracking Timeline"

  @negative @priority-medium @REQ-040 @screen-detail-penugasan-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-114 — detail-penugasan-shipper order tanpa lelang tidak menampilkan No. Lelang
    Given user berada di halaman "Detail Penugasan Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order langsung ORD-DIRECT-009 dengan penugasan valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-114 pada scenarios.json
    Then sistem tidak menampilkan "No. Lelang Detail Data Order"
    And sistem memverifikasi elemen "ID Order" dengan assertion "text" bernilai "ORD-DIRECT-009"

  @negative @priority-medium @REQ-040 @screen-detail-penugasan-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-115 — Detail Penugasan tenant lain tidak membocorkan No. Lelang
    Given user berada di halaman "Detail Penugasan Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "VENDOR-B mengakses detail order VENDOR-A."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-115 pada scenarios.json
    Then sistem memverifikasi elemen "Akses Detail Penugasan" dengan assertion "access" bernilai "ditolak"
    And sistem tidak menampilkan "No. Lelang Detail Data Order"

  @positive @priority-medium @REQ-040 @screen-detail-penugasan-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-097 — Edit Penugasan membuka form dengan jadwal sumber tetap read-only
    Given user berada di halaman "Detail Penugasan Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Detail order lelang dengan penugasan existing."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-097 pada scenarios.json
    When user mengklik elemen "Edit Penugasan"
    Then sistem menampilkan "Form Edit Penugasan"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "No. Lelang" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @edge @priority-high @REQ-002 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-035 — Pesan tepat Rencana Akhir Kirim memakai batas inklusif
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Clock tepat akhir kirim; transaksi segera selesai tanpa maju clock."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-035 pada scenarios.json
    Then sistem memverifikasi elemen "Pesan [OFFER-A]" dengan assertion "enabled" bernilai "true"
    When user mengklik elemen "Pesan [OFFER-A]"
    Then sistem menampilkan "Wizard Order"

  @edge @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-036 — Nama PIC Unicode apostrof dan catatan HTML dipertahankan sebagai teks
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Rute normal; field lain valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-036 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "PIC Pengirim [Muat 1]" dengan "O'Connor — Siti"
    And user mengisi field "Catatan [Bongkar 1]" dengan "<b>Pintu A</b> 🌟"
    And user mengklik elemen "Selanjutnya"
    And user berada di halaman "Buat Order - Review"
    Then sistem memverifikasi elemen "PIC Pengirim Review" dengan assertion "text" bernilai "O'Connor — Siti"
    And sistem memverifikasi elemen "Catatan Penerima Review" dengan assertion "text" bernilai "<b>Pintu A</b> 🌟"
    And sistem memverifikasi elemen "Markup Catatan" dengan assertion "htmlExecuted" bernilai "false"

  @negative @priority-high @REQ-018 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-116 — Toleransi aktif tanpa acuan terpilih gagal validasi
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture radio acuan tidak punya default; tanggal muat valid."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-116 pada scenarios.json
    When user mencentang checkbox "Gunakan Batas Toleransi Jadwal Kapal"
    And user mengisi field "Batas Toleransi" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Acuan Toleransi" dengan assertion "error" bernilai "wajib dipilih"

  @edge @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-037 — WIB pergantian hari dibandingkan sebagai waktu bukan teks tanggal
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Toleransi ETD 09/10 00:00 WIB; Closing 08/10 22:00; ETA 09/10 18:00."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-037 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T22:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-09T00:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"

  @edge @priority-high @REQ-032 @screen-edit-jadwal-shipper
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-038 — Edit ETA tepat akhir kirim diterima dan dicatat
    Given user berada di halaman "Edit Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Vendor dikelola admin; toleransi tidak aktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-038 pada scenarios.json
    When user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T18:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "ETA Efektif" dengan assertion "text" bernilai "10/10/2026 18:00 WIB"
    When user berada di halaman "Riwayat Perubahan"
    Then sistem memverifikasi elemen "Entri Perubahan Efektif" dengan assertion "count" bernilai "1"

  @edge @priority-high @REQ-038 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-039 — Simpan penugasan dengan versi jadwal stale meminta reload
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Tab penugasan membaca direct versi 1; sebelum Simpan shipper menyetujui connecting versi 2."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-039 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Konflik Jadwal" dengan assertion "error" bernilai "jadwal berubah, muat ulang order"
    And sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "0"
    When user berada di halaman "Tambah Penugasan"
    And user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @stress @priority-high @REQ-002 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-001 — 100 transaksi Pesan terpisah pada satu lelang
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "100 browser context shipper dengan data wizard valid dan transaksi berbeda."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-001 pada scenarios.json
    When user mengklik elemen "Pesan [OFFER-A]"
    And user berada di halaman "Buat Order - Review"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "100"
    And sistem memverifikasi elemen "ID Order" dengan assertion "uniqueCount" bernilai "100"

  @stress @priority-medium @REQ-005 @screen-daftar-order-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-002 — Daftar 1000 order pagination dan filter tetap mengikat tenant
    Given user berada di halaman "Daftar Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "1000 order fixture milik VENDOR-A ditambah 100 order tenant lain."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-002 pada scenarios.json
    When user mengisi field "No. Lelang" dengan "FCL-NRM-TEST-009"
    And user mengklik elemen "Terapkan"
    And user memilih opsi "20" pada field "Tampilkan"
    And user mengklik elemen "Halaman Berikutnya"
    Then sistem memverifikasi elemen "Baris Order" dengan assertion "allMatch" bernilai "semua sesuai tenant dan filter"
    And sistem memverifikasi elemen "Duplikat Antar Halaman" dengan assertion "count" bernilai "0"

  @stress @priority-high @REQ-007 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-003 — 20 sesi menyimpan dan membuka draft independen
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Satu order draft unik per sesi, PIC/DO unik per worker."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-003 pada scenarios.json
    When user mengklik elemen "Simpan ke Draf"
    And user berada di halaman "Daftar Order Shipper"
    And user mengklik elemen "Lanjutkan Draf [ORD-FCL-009]"
    Then sistem memverifikasi elemen "Data Draf" dengan assertion "snapshot" bernilai "milik worker yang sama"

  @stress @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-004 — Catatan 10000 karakter disimpan atau ditolak sesuai batas OMS
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Seluruh required valid; master batas panjang baseline diketahui harness."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-004 pada scenarios.json
    When user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengisi field "Catatan [Muat 1]" dengan "CATATAN_LOAD_10000"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Hasil Catatan Panjang" dengan assertion "controlledResult" bernilai "utuh jika diterima; helper batas jika ditolak; tanpa truncation diam-diam"

  @stress @priority-high @REQ-011 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-005 — 50 card kontainer terisi menjaga urutan dan input tiap card
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Batas kontainer baseline mendukung 50; setiap card memiliki 1 barang jumlah 1 dan DO unik."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-005 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "50"
    Then sistem memverifikasi elemen "Card Kontainer" dengan assertion "count" bernilai "50"
    When user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Ringkasan Kontainer" dengan assertion "count" bernilai "50"
    And sistem memverifikasi elemen "Data Kontainer" dengan assertion "snapshot" bernilai "tidak tertukar antar card"

  @stress @priority-medium @REQ-012 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-006 — 200 tag DO tidak bocor ke kontainer lain
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Dua kontainer, barang valid; batas tag baseline cukup."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-006 pada scenarios.json
    When user mengisi field "Nomor DO [Kontainer 1]" dengan "DO_LOAD_200"
    Then sistem memverifikasi elemen "Tag DO [Kontainer 1]" dengan assertion "count" bernilai "200"
    And sistem memverifikasi elemen "Tag DO [Kontainer 2]" dengan assertion "count" bernilai "0"

  @stress @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-007 — 200 barang per kontainer dihitung tanpa kehilangan presisi
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture 200 SKU unik berat 1kg volume 0.001m3; quantity 1 tiap baris; capacity cukup."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-007 pada scenarios.json
    When user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU_LOAD_200" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    Then sistem memverifikasi elemen "Baris Barang [Kontainer 1]" dengan assertion "count" bernilai "200"
    And sistem memverifikasi elemen "Total Berat [Kontainer 1]" dengan assertion "text" bernilai "200 kg"
    And sistem memverifikasi elemen "Total Kubikasi [Kontainer 1]" dengan assertion "text" bernilai "0.2 m3"

  @stress @priority-high @REQ-017 @screen-vendor-harga
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-008 — Harga 50 kontainer diasuransikan dihitung tanpa overflow
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "50 kontainer harga 1000000; setiap nilai barang total 1000000; tarif fixture A08."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-008 pada scenarios.json
    Then sistem memverifikasi elemen "Harga DPP" dengan assertion "text" bernilai "50000000"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "250000"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "54250000"

  @stress @priority-high @REQ-021 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-009 — 20 retry Simpan transaksi sama tidak menduplikasi order
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "20 retry memakai idempotency token sama; response delay setelah commit."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-009 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Aktif" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Notifikasi Order Baru" dengan assertion "count" bernilai "1"

  @stress @priority-high @REQ-022 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-010 — 20 sesi vendor bersaing menerima satu order
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Seluruh sesi vendor pemilik membaca versi Menunggu Konfirmasi yang sama; penawaran berjadwal."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-010 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Commit Konfirmasi Order" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Respons Sesi Lain" dengan assertion "controlledResult" bernilai "konflik atau already processed; tanpa commit kedua"

  @stress @priority-high @REQ-025 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-011 — Banyak order tanpa jadwal dikonfirmasi secara paralel
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "100 order tanpa jadwal unik, satu pemilik vendor; fixture per worker."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-011 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Dikonfirmasi" dengan assertion "count" bernilai "100"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "allMatch" bernilai "snapshot sesuai order masing-masing"

  @stress @priority-high @REQ-026 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-012 — Validasi toleransi konsisten pada 100 pengisian ETD
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "50 order ETD tepat batas, 50 ETD batas+1 menit; field lain valid."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-012 pada scenarios.json
    When user mengklik elemen "Terima Order"
    And user mengklik elemen "Direct"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-09T18:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "ETD_LOAD_CASE"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Hasil Validasi Toleransi" dengan assertion "aggregate" bernilai "{\"accepted\": 50, \"invalidCommitted\": 0, \"rejected\": 50}"

  @stress @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-013 — Alasan penolakan 10000 karakter ditangani sesuai batas baseline
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order Menunggu Konfirmasi; maksimum panjang alasan ditentukan baseline."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-013 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "REASON_LOAD_10000"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Hasil Alasan Panjang" dengan assertion "controlledResult" bernilai "utuh dengan status Ditolak atau validasi batas dengan status Menunggu Konfirmasi"

  @stress @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-014 — 20 simpan pengganti bersamaan menghasilkan satu pengganti aktif
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Semua sesi shipper memilih OFFER-B untuk order Ditolak sama; barrier sebelum commit."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-014 pada scenarios.json
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Order Pengganti" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Catatan Order Lama" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Respons Sesi Lain" dengan assertion "controlledResult" bernilai "konflik atau already processed"

  @stress @priority-high @REQ-033 @screen-edit-jadwal-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-015 — 20 edit vendor pada order sama tidak menimpa pending tanpa kontrol versi
    Given user berada di halaman "Edit Jadwal Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Approval aktif; semua worker membaca jadwal efektif versi 1."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-015 pada scenarios.json
    When user mengisi field "Nama Kapal" dengan "SHIP_WORKER_UNIQUE"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Pengajuan Jadwal Pending" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    And sistem memverifikasi elemen "Respons Sesi Lain" dengan assertion "controlledResult" bernilai "konflik versi atau pending"

  @stress @priority-high @REQ-035 @screen-konfirmasi-jadwal
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-016 — Terima dan Tolak paralel menghasilkan satu keputusan akhir
    Given user berada di halaman "Konfirmasi Jadwal Shipper"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "20 tab shipper; 10 Terima 10 Tolak pada proposal sama."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-016 pada scenarios.json
    When user mengklik elemen "DECISION_LOAD_CASE"
    Then sistem memverifikasi elemen "Keputusan Efektif" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "controlledResult" bernilai "sesuai keputusan transaksi pertama; tidak tercampur"

  @stress @priority-medium @REQ-036 @screen-riwayat-perubahan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-017 — 100 perubahan jadwal menjaga urutan audit WIB
    Given user berada di halaman "Riwayat Perubahan"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "100 perubahan sukses pada order fixture; nama kapal unik tiap versi; clock maju 1 menit per commit."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-017 pada scenarios.json
    Then sistem memverifikasi elemen "Entri Perubahan Efektif" dengan assertion "count" bernilai "100"
    And sistem memverifikasi elemen "Riwayat Jadwal" dengan assertion "allMatch" bernilai "aktor waktu nilai lama-baru lengkap dan berurutan"

  @stress @priority-high @REQ-037 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-018 — 20 sesi menugaskan kontainer yang sama mencegah penugasan ganda
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order satu kontainer Menunggu Penugasan; semua worker membaca versi sama."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-018 pada scenarios.json
    When user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    And sistem memverifikasi elemen "Respons Sesi Lain" dengan assertion "controlledResult" bernilai "kontainer sudah ditugaskan atau konflik versi"

  @stress @priority-high @REQ-038 @screen-tambah-penugasan
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-019 — Penugasan 50 kontainer memuat jadwal connecting utuh
    Given user berada di halaman "Tambah Penugasan"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order 50 kontainer diterima dengan 2 leg; setiap card penugasan terisi valid melalui harness."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-019 pada scenarios.json
    When user mengklik elemen "ORD-FCL-009"
    Then sistem memverifikasi elemen "Card Kontainer" dengan assertion "count" bernilai "50"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Leg Connecting" dengan assertion "count" bernilai "2"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Kontainer Ditugaskan" dengan assertion "count" bernilai "50"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

  @stress @priority-medium @REQ-040 @screen-detail-penugasan-vendor
  Scenario: AMS009-ORDER-PENUGASAN-FCL-STR-020 — 100 detail penugasan tidak mencampurkan No. Lelang antar order
    Given user berada di halaman "Detail Penugasan Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "100 order fixture dengan No. Lelang berbeda; navigasi worker disesuaikan ID fixture."
    And prasyarat "Harness menjalankan langkah pekerja sesuai execution dan mengecek oracle aggregate setelah seluruh worker selesai; tidak menetapkan SLA waktu."
    # testData: AMS009-ORDER-PENUGASAN-FCL-STR-020 pada scenarios.json
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "fixtureValue" bernilai "sesuai lelang order worker"
    And sistem memverifikasi elemen "ID Order" dengan assertion "fixtureValue" bernilai "sesuai order worker"

  @positive @priority-medium @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-098 — Jalur Pesan FTL tetap tersedia setelah AMS
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang FTL valid; regresi hanya jalur akses, rincian FTL mengikuti baseline."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-098 pada scenarios.json
    When user mengklik elemen "Pesan [OFFER-A]"
    Then sistem memverifikasi elemen "Jenis Pengiriman" dengan assertion "text" bernilai "FTL"
    And sistem memverifikasi elemen "Alur OMS Eksisting" dengan assertion "baseline" bernilai "order FTL dari lelang sesuai baseline"

  @positive @priority-medium @REQ-003 @screen-detail-harga-penawaran
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-099 — Informasi dan detail penawaran menjadi sumber order yang tepat
    Given user berada di halaman "Detail Harga Penawaran"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A valid; detail biaya dan kapal fixture tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-099 pada scenarios.json
    Then sistem memverifikasi elemen "Informasi Lelang" dengan assertion "readonly" bernilai "true"
    And sistem menampilkan "Syarat dan Ketentuan"
    And sistem menampilkan "Request Jadwal"
    And sistem menampilkan "Ajukan Nego"
    And sistem menampilkan "Lelang Ulang"
    When user mengklik elemen "Detail Biaya [OFFER-A]"
    Then sistem memverifikasi elemen "Detail Biaya Penawaran" dengan assertion "snapshot" bernilai "{\"pphRate\": 0.02, \"ppnRate\": 0.1, \"unitPrice\": 1000000}"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Detail Kapal [OFFER-A]"
    Then sistem memverifikasi elemen "Jadwal Penawaran" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Vendor Penawaran [OFFER-A]"
    Then sistem memverifikasi elemen "Vendor Penawaran Detail" dengan assertion "text" bernilai "VENDOR-A"
    When user mengklik elemen "Tutup"
    And user mengklik elemen "Dokumen_Lelang_1.pdf"
    Then sistem memverifikasi elemen "Dokumen Lelang" dengan assertion "document" bernilai "fixture PDF dapat dibuka"

  @positive @priority-low @REQ-021 @screen-review-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-100 — Accordion Review dapat ditutup dibuka tanpa mengubah data
    Given user berada di halaman "Buat Order - Review"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Seluruh data valid; snapshot review fixture tersedia."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-100 pada scenarios.json
    When user mengklik elemen "Accordion Data Pengirim"
    Then sistem tidak menampilkan "Isi Data Pengirim"
    When user mengklik elemen "Accordion Data Pengirim"
    Then sistem menampilkan "Isi Data Pengirim"
    When user mengklik elemen "Accordion Data Penerima"
    And user mengklik elemen "Accordion Data Penerima"
    And user mengklik elemen "Accordion Data Barang"
    And user mengklik elemen "Accordion Data Barang"
    And user mengklik elemen "Accordion Vendor dan Harga"
    And user mengklik elemen "Accordion Vendor dan Harga"
    And user mengklik elemen "Accordion Jadwal Kapal"
    And user mengklik elemen "Accordion Jadwal Kapal"
    Then sistem memverifikasi elemen "Review Order" dengan assertion "snapshot" bernilai "sama dengan snapshot sebelum toggle"

  @edge @priority-high @REQ-029 @screen-pilih-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-EDG-040 — Penawaran berbeda dari vendor lama tetap termasuk alternatif
    Given user berada di halaman "Pilih Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "OFFER-A lama vendor A; OFFER-D berbeda ID juga vendor A; OFFER-B vendor B."
    # testData: AMS009-ORDER-PENUGASAN-FCL-EDG-040 pada scenarios.json
    Then sistem tidak menampilkan "Card OFFER-A"
    And sistem menampilkan "Card OFFER-D"
    When user mengklik elemen "Pilih [OFFER-D]"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Vendor Baru" dengan assertion "text" bernilai "VENDOR-A"

  @positive @priority-high @REQ-030 @screen-review-penawaran-lain
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-101 — Harga penggantian dihitung ulang memakai tarif vendor baru
    Given user berada di halaman "Review Penawaran Lain"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Jumlah 2; nilai barang diasuransikan 6000000; OFFER-B harga 1500000, PPN5%, PPh1%, asuransi0.5%."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-101 pada scenarios.json
    Then sistem memverifikasi elemen "Harga DPP" dengan assertion "text" bernilai "3000000"
    And sistem memverifikasi elemen "PPN" dengan assertion "text" bernilai "150000"
    And sistem memverifikasi elemen "PPh" dengan assertion "text" bernilai "-30000"
    And sistem memverifikasi elemen "Asuransi" dengan assertion "text" bernilai "30000"
    And sistem memverifikasi elemen "Total Harga" dengan assertion "text" bernilai "3150000"
    And sistem memverifikasi elemen "Review Penawaran Lain" dengan assertion "readonly" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Total Harga Order Pengganti" dengan assertion "text" bernilai "3150000"

  @positive @priority-high @REQ-021 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-102 — Alur terpadu Pesan hingga penugasan Direct berjadwal
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang/penawaran aktif, barang master, armada dan sopir; sesi shipper/vendor disediakan harness, pergantian session mengikuti tujuan navigate; ID order hasil Simpan diikat ke orderId fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-102 pada scenarios.json
    When user berada di halaman "Detail Harga Penawaran"
    And user mengklik elemen "Pesan [OFFER-A]"
    And user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08T10:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Review Order" dengan assertion "readonly" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Daftar Order Vendor"
    And user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Konfirmasi Order"
    And user mengklik elemen "Terima Order"
    Then sistem tidak menampilkan "Form Jadwal Kapal"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    When user berada di halaman "Tambah Penugasan"
    And user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    When user berada di halaman "Detail Penugasan Vendor"
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @positive @priority-high @REQ-021 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-103 — Alur terpadu Pesan hingga penugasan Connecting berjadwal
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang/penawaran aktif, barang master, armada dan sopir; sesi shipper/vendor disediakan harness, pergantian session mengikuti tujuan navigate; ID order hasil Simpan diikat ke orderId fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-103 pada scenarios.json
    When user berada di halaman "Detail Harga Penawaran"
    And user mengklik elemen "Pesan [OFFER-A]"
    And user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08T10:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Review Order" dengan assertion "readonly" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Daftar Order Vendor"
    And user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Konfirmasi Order"
    And user mengklik elemen "Terima Order"
    Then sistem tidak menampilkan "Form Jadwal Kapal"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    When user berada di halaman "Tambah Penugasan"
    And user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    When user berada di halaman "Detail Penugasan Vendor"
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @positive @priority-high @REQ-021 @screen-data-pengiriman
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-104 — Alur terpadu Pesan hingga penugasan Connecting tanpa jadwal
    Given user berada di halaman "Buat Order - Data Pengiriman"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Fixture lelang/penawaran aktif, barang master, armada dan sopir; sesi shipper/vendor disediakan harness, pergantian session mengikuti tujuan navigate; ID order hasil Simpan diikat ke orderId fixture."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-104 pada scenarios.json
    When user berada di halaman "Detail Harga Penawaran"
    And user mengklik elemen "Pesan [OFFER-A]"
    And user mengisi field "PIC Pengirim [Muat 1]" dengan "Widyawati"
    And user mengisi field "No. WhatsApp PIC [Muat 1]" dengan "081234567890"
    And user mengisi field "PIC Penerima [Bongkar 1]" dengan "Marwanto"
    And user mengisi field "No. WhatsApp PIC [Bongkar 1]" dengan "089876543210"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mengklik elemen "Selanjutnya"
    And user mengisi field "Tanggal Permintaan Muat" dengan "2026-10-08T10:00:00+07:00"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Review Order" dengan assertion "readonly" bernilai "true"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Konfirmasi"
    When user berada di halaman "Daftar Order Vendor"
    And user mengklik elemen "Aksi Order [ORD-FCL-009]"
    And user mengklik elemen "Konfirmasi Order"
    And user mengklik elemen "Terima Order"
    And user mengklik elemen "Connecting"
    And user memilih opsi "Meratus" pada field "Pelayaran"
    And user mengisi field "Nama Kapal" dengan "KM Swarna Bahari"
    And user mengisi field "Voyage [Kapal Utama]" dengan "009"
    And user mengisi field "Closing Time [Kapal Utama]" dengan "2026-10-08T12:00:00+07:00"
    And user mengisi field "Berangkat (ETD) [Kapal Utama]" dengan "2026-10-08T18:00:00+07:00"
    And user mengisi field "Tiba (ETA) [Kapal Utama]" dengan "2026-10-10T12:00:00+07:00"
    And user memilih opsi "Banjarmasin (BDJ)" pada field "Pelabuhan Connecting [Leg 1]"
    And user mengisi field "Kapal Connecting [Leg 1]" dengan "KM Swarna Kartika"
    And user mengisi field "Voyage [Leg 1]" dengan "010"
    And user mengisi field "ETD Connecting [Leg 1]" dengan "2026-10-09T08:00:00+07:00"
    And user mengklik elemen "Tambah Kapal Connecting"
    And user memilih opsi "Tanjung Priok (JKT)" pada field "Pelabuhan Connecting [Leg 2]"
    And user mengisi field "Kapal Connecting [Leg 2]" dengan "KM Swarna Bahtera"
    And user mengisi field "Voyage [Leg 2]" dengan "011"
    And user mengisi field "ETD Connecting [Leg 2]" dengan "2026-10-09T20:00:00+07:00"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Menunggu Penugasan"
    When user berada di halaman "Tambah Penugasan"
    And user mengisi field "Cari Order" dengan "ORD-FCL-009"
    And user mengklik elemen "ORD-FCL-009"
    And user mengisi field "No. Kontainer [Kontainer 1]" dengan "MSCU1234566"
    And user mengisi field "No. Segel [Kontainer 1]" dengan "SGL009"
    And user mengklik elemen "Pilih Dari Master [Armada Muat/Kontainer 1]"
    And user memilih opsi "L 1234 QA / Trailer" pada field "No. Polisi/Jenis Armada [Kontainer 1]"
    And user mengklik elemen "Pilih Dari Master [Sopir Muat/Kontainer 1]"
    And user memilih opsi "Budi / 081234567890" pada field "Sopir/No. WhatsApp [Kontainer 1]"
    And user mengklik elemen "Tugaskan ke Sopir"
    Then sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "readonly" bernilai "true"
    And sistem memverifikasi elemen "Jadwal Kapal" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-10T12:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"legs\": [{\"etd\": \"2026-10-09T08:00:00+07:00\", \"port\": \"Banjarmasin (BDJ)\", \"ship\": \"KM Swarna Kartika\", \"voyage\": \"010\"}, {\"etd\": \"2026-10-09T20:00:00+07:00\", \"port\": \"Tanjung Priok (JKT)\", \"ship\": \"KM Swarna Bahtera\", \"voyage\": \"011\"}], \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"
    When user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Penugasan" dengan assertion "count" bernilai "1"
    When user berada di halaman "Detail Penugasan Vendor"
    Then sistem memverifikasi elemen "No. Lelang Detail Data Order" dengan assertion "text" bernilai "FCL-NRM-TEST-009"

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS009-ORDER-PENUGASAN-FCL-NEG-117 — Nilai Barang negatif pada asuransi tidak tersimpan
    Given user berada di halaman "Buat Order - Data Barang"
    And prasyarat "Aktor shipper terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Barang dan jumlah valid; asuransi aktif."
    # testData: AMS009-ORDER-PENUGASAN-FCL-NEG-117 pada scenarios.json
    When user mengisi field "Jumlah Kontainer" dengan "1"
    And user mengklik elemen "Pilih Barang [Kontainer 1]"
    And user memilih opsi "SKU-PPR-001" pada field "Barang Master [Kontainer 1]"
    And user mengklik elemen "Tambahkan Barang [Kontainer 1]"
    And user mengisi field "Jumlah [Kontainer 1/SKU-PPR-001]" dengan "10"
    And user mencentang checkbox "Tambahkan Asuransi [Kontainer 1]"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "100000"
    And user mengisi field "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan "-100"
    And user mengklik elemen "Selanjutnya"
    Then sistem memverifikasi elemen "Nilai Barang [Kontainer 1/SKU-PPR-001]" dengan assertion "error" bernilai "nilai barang tidak valid"
    And sistem memverifikasi elemen "Step Aktif" dengan assertion "value" bernilai "2"

  @positive @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS009-ORDER-PENUGASAN-FCL-POS-105 — Penolakan tidak menghapus jadwal penawaran yang sudah tersedia
    Given user berada di halaman "Konfirmasi Order Vendor"
    And prasyarat "Aktor vendor terautentikasi; tenant dan kepemilikan mengikuti testData."
    And prasyarat "Clock dibekukan pada clockWib; fixture tiap scenario terisolasi dan dipulihkan sesudah tes."
    And prasyarat "Order berjadwal direct; belum dikonfirmasi."
    # testData: AMS009-ORDER-PENUGASAN-FCL-POS-105 pada scenarios.json
    When user mengklik elemen "Tolak Order"
    And user mengisi field "Alasan Penolakan" dengan "Armada tidak tersedia"
    And user mengklik elemen "Simpan"
    Then sistem memverifikasi elemen "Status Order" dengan assertion "text" bernilai "Ditolak"
    And sistem memverifikasi elemen "Jadwal Efektif" dengan assertion "scheduleSnapshot" bernilai "{\"closing\": \"2026-10-08T12:00:00+07:00\", \"eta\": \"2026-10-09T18:00:00+07:00\", \"etd\": \"2026-10-08T18:00:00+07:00\", \"namaKapal\": \"KM Swarna Bahari\", \"openStack\": \"2026-10-07T11:00:00+07:00\", \"pelayaran\": \"Meratus\", \"voyage\": \"009\"}"

