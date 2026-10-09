Feature: Skenario Order FTL dengan AMS untuk shipper dan vendor (ams010-order-ftl-shipper)
  Seluruh tanggal dan waktu mengacu WIB; fixture dan baseline mengikuti analysis.md.
  Oracle assertion dan workload stress diterjemahkan runner sesuai testData, bukan pencocokan teks semata.

  @positive @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-001 — Pesan membuka wizard dengan sumber penawaran yang dipilih
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang belum melewati akhir; OFFER-A masih berlaku."
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    Given user berada di halaman "Detail Harga Penawaran"
    # target: pesan
    When user mengklik elemen "Pesan"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Empat step terlihat; Data Pengiriman aktif."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "No. Lelang FTL-NRM-01/AMS010 dan armada Tronton Wing Box sesuai OFFER-A."

  @negative @priority-high @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-001 — Penawaran Tidak Berlaku tidak dapat memulai order
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-A memiliki state Tidak Berlaku sesuai card disabled pada desain."
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    Given user berada di halaman "Detail Harga Penawaran"
    # target: tidak-berlaku
    Then sistem memverifikasi elemen "Tidak Berlaku" dengan kondisi "Disabled; tidak ada aksi Pesan yang enabled untuk OFFER-A."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Wizard tidak terbuka dan order baru tidak tercipta."

  @positive @priority-high @REQ-002 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-002 — Order langsung LTL memakai baseline tanpa kewajiban lelang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Baseline LTL tanpa lelang dan data valid disiapkan."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: buat-order
    When user mengklik elemen "Buat Order"
    # target: shipping-readonly
    Then sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Form LTL sesuai baseline; No. Lelang tidak menjadi field required."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Alur langsung sesuai baseline OMS; bukan auto-draft OFFER-A."

  @negative @priority-high @REQ-002 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-002 — Validasi eksisting tetap menolak order langsung LCL yang tidak lengkap
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Form order langsung LCL; required pengirim baseline kosong."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: next
    When user mengklik elemen "Selanjutnya"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap pada step aktif; validasi required baseline muncul."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Tidak menambahkan error wajib No. Lelang atau kewajiban memilih penawaran."

  @positive @priority-high @REQ-003 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-003 — Dua transaksi Pesan dari satu lelang menghasilkan dua order
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Transaksi pertama sudah berhasil disimpan; transaksi kedua memiliki ID transaksi berbeda dan seluruh step valid."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tepat dua order dengan ID berbeda berasal dari lelang yang sama."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Kedua order Menunggu Konfirmasi, masing-masing satu notifikasi vendor."

  @negative @priority-high @REQ-003 @screen-detail-harga-penawaran
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-003 — Pesan sesudah Rencana Akhir Kirim ditolak
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Clock satu menit setelah Rencana Akhir Kirim; card penawaran termuat sebelum expiry."
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    Given user berada di halaman "Detail Harga Penawaran"
    # target: pesan
    When user mengklik elemen "Pesan"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Order dari lelang yang sudah melewati akhir tidak dapat dibuat."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Jumlah order dan notifikasi tidak bertambah."

  @positive @priority-high @REQ-004 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-004 — No Lelang tampil di bawah ID Order pada list shipper
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order ORD-AMS-001 dari lelang terlihat."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: id-order
    Then sistem memverifikasi elemen "ID Order" dengan kondisi "ID ORD-AMS-001 terlihat."
    # target: no-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "FTL-NRM-01/AMS010 berada di bawah ID dalam baris ORD-AMS-001."
    # target: rute-order
    And sistem memverifikasi elemen "Rute" dengan kondisi "Rute dan vendor sesuai order fixture."

  @negative @priority-high @REQ-004 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-004 — Order tanpa lelang tidak mewarisi No Lelang baris lain
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "List mencampur order dari lelang dan order langsung ORD-DIRECT-001."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: id-order
    Then sistem memverifikasi elemen "ID Order" dengan kondisi "ORD-DIRECT-001 terlihat."
    # target: no-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "Tidak ada No. Lelang dalam baris ORD-DIRECT-001; baris lelang lain tetap memiliki nomor."

  @positive @priority-high @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-005 — Filter status Menunggu Konfirmasi dan No Lelang tepat sasaran
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dataset mencampur status dan lelang; sedikitnya satu record cocok."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: filter
    When user mengklik elemen "Filter"
    # target: filter-lelang
    And user mengisi field "No. Lelang" dengan "FTL-NRM-01/AMS010"
    # target: filter-status
    And user memilih opsi "Menunggu Konfirmasi" pada field "Status"
    # target: terapkan
    And user mengklik elemen "Terapkan"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Semua baris memenuhi No. Lelang dan status; fixture cocok tidak hilang."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Setiap baris hasil Menunggu Konfirmasi."

  @negative @priority-high @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-005 — Filter kombinasi tanpa kecocokan tidak menampilkan order lain
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Tidak ada ID ORD-TIDAK-ADA pada tenant."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: filter
    When user mengklik elemen "Filter"
    # target: filter-order
    And user mengisi field "ID Order" dengan "ORD-TIDAK-ADA"
    # target: terapkan
    And user mengklik elemen "Terapkan"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Hasil kosong; tidak menampilkan data stale atau tenant lain."

  @positive @priority-high @REQ-006 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-006 — Wizard menjalankan empat step berurutan ketika required valid
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "PIC valid; Step 02 satu unit barang valid diasuransikan; Step 03 waktu valid."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: next
    When user mengklik elemen "Selanjutnya"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Data Barang aktif."
    # target: next
    When user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Vendor dan Harga aktif."
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026 14:30"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Review aktif; ketiga step terdahulu selesai."
    # target: review-data
    And sistem memverifikasi elemen "Review Order" dengan kondisi "Data seluruh step konsisten."

  @negative @priority-high @REQ-006 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-006 — Selanjutnya tidak melompati required PIC yang kosong
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Semua required kecuali PIC Pengirim terisi."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-pengirim
    When user mengisi field "PIC Pengirim" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Pengiriman; Data Barang belum dapat dilanjutkan."
    # target: pic-pengirim
    And sistem memverifikasi elemen "PIC Pengirim" dengan kondisi "Required gagal pada PIC Pengirim."

  @positive @priority-high @REQ-007 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-007 — Draft lelang menyimpan input dan step terakhir
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data Pengiriman valid; unit 1 berisi barang, DO dan jumlah; minimal satu field terisi."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan "DO-001"
    # target: jumlah-barang
    And user mengisi field "Jumlah" dengan "200"
    # target: draft
    And user mengklik elemen "Simpan ke Draf"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Draft ditandai sesuai step Data Barang/baseline."
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: lanjut-draft
    And user mengklik elemen "Lanjutkan Draf"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Draft ORD-AMS-001 terbuka pada Data Barang, DO dan jumlah 200 pulih."

  @negative @priority-high @REQ-007 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-007 — Draft benar-benar kosong tidak dapat disimpan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Jalur Buat Order eksisting; semua field termasuk sumber auto-draft kosong, bukan draft lelang."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: draft
    When user mengklik elemen "Simpan ke Draf"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tidak ada draft baru; minimal satu field harus terisi."

  @positive @priority-high @REQ-008 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-008 — Sebelumnya menjaga PIC dan isi barang saat bolak balik
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data Pengiriman sudah valid; barang unit 1 terisi."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan "DO-KEMBALI"
    # target: previous
    And user mengklik elemen "Sebelumnya"
    # target: pic-pengirim
    Then sistem memverifikasi elemen "PIC Pengirim" dengan kondisi "Nilai Widyawati dipertahankan."
    # target: next
    When user mengklik elemen "Selanjutnya"
    # target: nomor-do
    Then sistem memverifikasi elemen "Nomor DO" dengan kondisi "DO-KEMBALI masih tersimpan."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Progres Data Barang tetap tersimpan."

  @negative @priority-high @REQ-008 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-008 — Kembali dengan data harga belum valid tidak menghapus barang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Step 02 valid; Tanggal Permintaan Muat kosong di Step 03."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: previous
    When user mengklik elemen "Sebelumnya"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Kembali ke Data Barang meski Step 03 belum lengkap."
    # target: jumlah-barang
    And sistem memverifikasi elemen "Jumlah" dengan kondisi "Jumlah 200 dan nilai barang tetap; progres terakhir tidak di-reset."

  @positive @priority-high @REQ-009 @screen-konfirmasi-batal
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-009 — Konfirmasi pembatalan wizard kembali ke Daftar Order
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Wizard memiliki input belum disimpan; dialog dibuka dengan tombol Batal."
    # target: Konfirmasi Pembatalan; route: {{routes.konfirmasi-batal}}
    Given user berada di halaman "Konfirmasi Pembatalan"
    # target: cancel-yes
    When user mengklik elemen "Ya, Batalkan"
    # target: cancel-dialog
    Then sistem memverifikasi elemen "Konfirmasi Pembatalan" dengan kondisi "Dialog tertutup."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Daftar Order terlihat; tidak ada order final atau notifikasi baru."

  @negative @priority-high @REQ-009 @screen-konfirmasi-batal
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-009 — Menolak pembatalan tidak membuang input wizard
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dialog Batal terbuka dari Data Pengiriman dengan catatan terisi."
    # target: Konfirmasi Pembatalan; route: {{routes.konfirmasi-batal}}
    Given user berada di halaman "Konfirmasi Pembatalan"
    # target: cancel-no
    When user mengklik elemen "Kembali"
    # target: pic-pengirim
    Then sistem memverifikasi elemen "PIC Pengirim" dengan kondisi "Wizard tetap terbuka dan PIC masih Widyawati."
    # target: catatan-pengirim
    And sistem memverifikasi elemen "Catatan" dengan kondisi "Catatan yang belum disimpan tetap sama."

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-010 — PIC dan kedua catatan dapat diedit tanpa mengubah rute
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Rute lelang auto-draft."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-pengirim
    When user mengisi field "PIC Pengirim" dengan "Dewi"
    # target: wa-pengirim
    And user mengisi field "No. WhatsApp PIC" dengan "081234567898"
    # target: catatan-pengirim
    And user mengisi field "Catatan" dengan "Hubungi sebelum muat"
    # target: pic-penerima
    And user mengisi field "PIC Penerima" dengan "Budi"
    # target: wa-penerima
    And user mengisi field "No. WhatsApp PIC" dengan "089436546675"
    # target: catatan-penerima
    And user mengisi field "Catatan" dengan "Bongkar di pintu 2"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Berpindah ke Data Barang."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Rute tetap sesuai lelang; PIC dan catatan baru tersimpan."

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-010 — WhatsApp PIC Penerima wajib walaupun PIC lain lengkap
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Seluruh PIC valid kecuali No. WhatsApp PIC pada Data Penerima."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: wa-penerima
    When user mengisi field "No. WhatsApp PIC" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: wa-penerima
    Then sistem memverifikasi elemen "No. WhatsApp PIC" dengan kondisi "Validasi required pada No. WhatsApp PIC dalam Data Penerima."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Pengiriman."

  @positive @priority-high @REQ-011 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-011 — Multipoint menampilkan semua Muat dan Bongkar sesuai urutan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang Multipoint memiliki 2 pickup dan 3 drop; semua PIC tiap titik terisi."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: route-cards
    Then sistem memverifikasi elemen "Muat dan Bongkar" dengan kondisi "Tepat Muat (1), Muat (2), Bongkar (1), Bongkar (2), Bongkar (3), tanpa titik hilang/duplikat."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Alamat/drop point tiap card sama dengan lelang."

  @negative @priority-high @REQ-011 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-011 — PIC titik terakhir Multipickup tetap divalidasi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang Multipickup mempunyai 3 Muat; hanya PIC Muat (3) kosong."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-pengirim
    When user mengisi field "PIC Pengirim" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: route-cards
    Then sistem memverifikasi elemen "Muat dan Bongkar" dengan kondisi "Muat (3) memuat error required; urutan titik tidak berubah."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tidak lanjut ke Data Barang."

  @positive @priority-high @REQ-012 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-012 — Identitas pengiriman dan alamat lelang read-only
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-A dipilih pada lelang Normal."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: shipping-readonly
    Then sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "No. Lelang, jenis FTL, Tronton Wing Box, tipe Normal dan rute berupa read-only."
    # target: sender-section
    And sistem memverifikasi elemen "Data Pengirim" dengan kondisi "Alamat asal sesuai fixture."
    # target: receiver-section
    And sistem memverifikasi elemen "Data Penerima" dengan kondisi "Alamat tujuan sesuai fixture."

  @negative @priority-high @REQ-012 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-012 — Klik data rute tidak menyediakan editor identitas lelang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data rute auto-draft terlihat."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: shipping-readonly
    When user mengklik elemen "Data Lelang dan Rute"
    # target: shipping-readonly
    Then sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Tidak ada input editable untuk No. Lelang/jenis/armada/tipe/drop point/alamat; nilai sumber tetap sama."
    # target: pic-pengirim
    And sistem memverifikasi elemen "PIC Pengirim" dengan kondisi "Field PIC tetap editable."

  @positive @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-013 — Jumlah Armada default satu dan perubahan dua membuat dua card
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Baru pertama membuka Step 02 dari lelang, tanpa draft terdahulu."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    Then sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Default 1; tepat satu card unit."
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "2"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Tepat dua card unit, bukan tiga seperti contoh mockup."
    # target: jenis-armada
    And sistem memverifikasi elemen "Jenis Armada" dengan kondisi "Tronton Wing Box read-only sesuai lelang."

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-013 — Jumlah Armada nol ditolak
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Satu unit valid semula."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "0"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-armada
    Then sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Minimum 1; angka 0 tidak diterima."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tidak lanjut ke Vendor dan Harga."

  @positive @priority-high @REQ-014 @screen-pilih-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-014 — Pilih Barang mengambil SKU master ke unit yang aktif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup dari Pilih Barang pada Unit 2; master SKU-PPR-001 tersedia."
    # target: Pilih Barang; route: {{routes.pilih-barang}}
    Given user berada di halaman "Pilih Barang"
    # target: sku
    When user mengklik elemen "SKU-PPR-001"
    # target: gunakan-barang
    And user mengklik elemen "Pilih"
    # target: tabel-barang
    Then sistem memverifikasi elemen "Barang Unit" dengan kondisi "SKU-PPR-001 beserta nama, kemasan, dimensi, kubikasi dan berat master masuk hanya Unit 2."
    # target: nomor-do
    And sistem memverifikasi elemen "Nomor DO" dengan kondisi "Nomor DO boleh kosong; tidak menjadi validasi required."

  @negative @priority-high @REQ-014 @screen-pilih-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-014 — Menutup pemilihan barang tanpa memilih tidak menambah baris
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup terbuka, Unit 1 kosong; belum memilih SKU."
    # target: Pilih Barang; route: {{routes.pilih-barang}}
    Given user berada di halaman "Pilih Barang"
    # target: close-master
    When user mengklik elemen "Tutup"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: empty-barang
    Then sistem memverifikasi elemen "Belum ada barang. Klik “Pilih Barang.”" dengan kondisi "Unit 1 tetap kosong; tidak ada SKU terpilih implisit."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tidak lanjut karena belum ada barang."

  @positive @priority-high @REQ-015 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-015 — Semua unit dengan Jumlah barang terisi dapat dilanjutkan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dua unit masing-masing punya SKU-PPR-001, nilai valid, DO opsional."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "200"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Vendor dan Harga terbuka."
    # target: ringkasan-unit
    And sistem memverifikasi elemen "Ringkasan Armada" dengan kondisi "Dua unit mempunyai data barang valid."

  @negative @priority-high @REQ-015 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-015 — Jumlah baris barang kosong memblokir Selanjutnya
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Barang terpilih pada Unit 1; Nilai Barang valid."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-barang
    Then sistem memverifikasi elemen "Jumlah" dengan kondisi "Required gagal pada baris SKU-PPR-001 Unit 1."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang."

  @positive @priority-high @REQ-016 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-016 — Tanpa asuransi Nilai Barang boleh kosong
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang tanpa asuransi; jumlah 200 dan barang terisi."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nilai-barang
    When user mengisi field "Nilai Barang" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Vendor dan Harga terbuka tanpa error Nilai Barang required."
    # target: asuransi
    And sistem memverifikasi elemen "Asuransi" dengan kondisi "Biaya Asuransi 0 / tidak diterapkan."

  @negative @priority-high @REQ-016 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-016 — Lelang diasuransikan menolak Nilai Barang kosong
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang insured=true; barang dan jumlah valid."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nilai-barang
    When user mengisi field "Nilai Barang" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: error-nilai
    Then sistem memverifikasi elemen "Nilai Barang harus diisi" dengan kondisi "Pesan Nilai Barang harus diisi tampil pada baris yang kosong."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang."

  @positive @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-017 — Total berat dan kubikasi dihitung dari jumlah barang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU master berat 12,5 kg, kubikasi 0,018 m³; kapasitas 18.000 kg / 54,72 m³."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "200"
    # target: total-berat
    Then sistem memverifikasi elemen "Total Berat" dengan kondisi "Total 2.500 kg / kapasitas 18.000 kg."
    # target: total-kubikasi
    And sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "Total 3,6 m³ / kapasitas 54,72 m³."
    # target: alert-kubikasi
    And sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Tidak ada alert melebihi kapasitas."

  @negative @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-017 — Kelebihan berat saja memicu alert berat
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU-BERAT berat 20 kg volume 0,001 m³; kapasitas sama dengan fixture."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "901"
    # target: total-berat
    Then sistem memverifikasi elemen "Total Berat" dengan kondisi "Total 18.020 kg > 18.000 kg."
    # target: alert-berat
    And sistem memverifikasi elemen "Berat melebihi kapasitas armada" dengan kondisi "Alert batas berat mengikuti baseline."
    # target: alert-kubikasi
    And sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Tidak ada alert kubikasi; volume 0,901 m³ < 54,72 m³."

  @positive @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-018 — Waktu muat dalam interval WIB diterima
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Now 07/10/2026 10:00 WIB; akhir 09/10/2026 22:00 WIB; step terdahulu valid."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026 14:30"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Review terbuka, Tanggal Permintaan Muat 08/10/2026 14:30 WIB."

  @negative @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-018 — Waktu muat satu menit sebelum now ditolak
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Clock tepat 07/10/2026 10:00 WIB."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "07/10/2026 09:59"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Validasi waktu sebelum saat ini; input invalid tetap dapat diperbaiki."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Vendor dan Harga."

  @positive @priority-high @REQ-019 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-019 — Vendor harga dan armada mengikuti penawaran serta Step 02
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-A; Jumlah Armada Step 02=2."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: vendor-readonly
    Then sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Vendor A, drop point fixture, Tronton Wing Box, Jumlah Armada 2 dan Harga Satuan Rp6.000.000 read-only."
    # target: waktu-perjalanan
    And sistem memverifikasi elemen "Waktu Perjalanan" dengan kondisi "Informasi 4 jam dari penawaran; bukan input jadwal."

  @negative @priority-high @REQ-019 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-019 — Data Vendor tidak dapat diganti pada Step 03
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-A sudah dipilih; sumber penawaran terkunci."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: vendor-readonly
    When user mengklik elemen "Vendor dan Penawaran"
    # target: vendor-readonly
    Then sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Tidak ada selector vendor/harga/drop point editable; tetap Vendor A dan Rp6.000.000."
    # target: tanggal-muat
    And sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Tanggal Permintaan Muat tetap editable."

  @positive @priority-high @REQ-020 @screen-detail-drop-point
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-020 — Popup Multidrop menampilkan detail seluruh titik
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup dibuka melalui Detail Drop Point pada lelang 3 tujuan."
    # target: Detail Drop Point; route: {{routes.detail-drop-point}}
    Given user berada di halaman "Detail Drop Point"
    # target: drop-dialog
    Then sistem memverifikasi elemen "Detail Drop Point" dengan kondisi "Dialog Detail Drop Point terlihat."
    # target: drop-content
    And sistem memverifikasi elemen "Daftar Drop Point" dengan kondisi "Ketiga drop tujuan lengkap dengan urutan/alamat sesuai lelang."

  @negative @priority-high @REQ-020 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-020 — Rute Normal tidak menampilkan link detail multi titik palsu
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang Normal satu asal dan satu tujuan."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: detail-drop
    Then sistem memverifikasi elemen "Detail Drop Point" dengan kondisi "Link multipoint tidak tersedia."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Satu asal dan tujuan tampil langsung; tidak mencampur drop point lelang lain."

  @positive @priority-high @REQ-021 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-021 — Ringkasan per unit menjaga pemisahan total barang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Unit 1 qty=200 nilai satuan=100000; Unit 2 qty=100 nilai satuan=200000; SKU berat 12,5 volume 0,018."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: ringkasan-unit
    Then sistem memverifikasi elemen "Ringkasan Armada" dengan kondisi "Unit 1: 2.500 kg, 3,6 m³, Rp20.000.000; Unit 2: 1.250 kg, 1,8 m³, Rp20.000.000."

  @negative @priority-high @REQ-021 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-021 — Ringkasan tidak memakai subtotal stale setelah koreksi barang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Step 02 Unit 1 semula qty=200; sudah sampai Step 03."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: previous
    When user mengklik elemen "Sebelumnya"
    # target: jumlah-barang
    And user mengisi field "Jumlah" dengan "100"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: ringkasan-unit
    Then sistem memverifikasi elemen "Ringkasan Armada" dengan kondisi "Unit 1 menjadi 1.250 kg, 1,8 m³, Rp10.000.000; subtotal lama tidak tampil."

  @positive @priority-high @REQ-022 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-022 — Harga menggunakan DPP tambah PPN kurang PPh tambah asuransi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dua unit, Harga Satuan 6.000.000, nominal PPN 132.000 dan PPh 240.000 untuk DPP fixture; total nilai 40.000.000, tarif asuransi 1%."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: harga-dpp
    Then sistem memverifikasi elemen "Harga DPP" dengan kondisi "Rp12.000.000."
    # target: ppn
    And sistem memverifikasi elemen "PPN" dengan kondisi "Rp132.000 sesuai penawaran; read-only."
    # target: pph
    And sistem memverifikasi elemen "PPh" dengan kondisi "Rp240.000 dikurangkan; read-only."
    # target: asuransi
    And sistem memverifikasi elemen "Asuransi" dengan kondisi "Rp400.000."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Rp12.292.000 = 12.000.000 + 132.000 - 240.000 + 400.000."

  @negative @priority-high @REQ-022 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-022 — Klik PPN PPh tidak membuka editor pajak
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Tarif/nominal pajak telah ditetapkan vendor pada penawaran."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: ppn
    When user mengklik elemen "PPN"
    # target: pph
    And user mengklik elemen "PPh"
    # target: ppn
    Then sistem memverifikasi elemen "PPN" dengan kondisi "Tidak ada input PPN editable; nilai sumber tidak berubah."
    # target: pph
    And sistem memverifikasi elemen "PPh" dengan kondisi "Tidak ada input PPh editable; tetap dikurangkan dalam total."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Tidak berubah akibat klik label pajak."

  @positive @priority-high @REQ-023 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-023 — Biaya asuransi mengikuti Total Nilai Barang dengan tarif fixture
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Satu unit qty 200 nilai satuan 100000; insured=true, tarif fixture 1%."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: asuransi
    Then sistem memverifikasi elemen "Asuransi" dengan kondisi "Rp200.000 = Rp20.000.000 × 1%; tariff bukan konstanta aplikasi."
    # target: ringkasan-unit
    And sistem memverifikasi elemen "Ringkasan Armada" dengan kondisi "Total Nilai Barang Rp20.000.000."

  @negative @priority-high @REQ-023 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-023 — Asuransi tidak mempertahankan nilai lama setelah koreksi nilai barang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Nilai satuan semula 100000; asuransi semula 200000."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: previous
    When user mengklik elemen "Sebelumnya"
    # target: nilai-barang
    And user mengisi field "Nilai Barang" dengan "50000"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: asuransi
    Then sistem memverifikasi elemen "Asuransi" dengan kondisi "Rp100.000 dari 200 × 50.000 × 1%; bukan Rp200.000."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Total harga diperbarui dengan biaya asuransi baru."

  @positive @priority-high @REQ-024 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-024 — FTL dapat lanjut tanpa jadwal dan toleransi jadwal
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data barang valid; tidak ada data jadwal dibuat."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026 14:30"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Review terbuka tanpa membutuhkan jadwal FTL."
    # target: batas-toleransi
    And sistem memverifikasi elemen "Batas Toleransi Jadwal" dengan kondisi "Checkbox tidak ada."
    # target: jadwal
    And sistem memverifikasi elemen "Jadwal" dengan kondisi "Section/data jadwal tidak ada; tanggal muat tetap terlihat."

  @negative @priority-high @REQ-024 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-024 — Terima FTL tidak memunculkan form jadwal LTL
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order FTL Menunggu Konfirmasi; popup vendor terbuka."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: jadwal
    Then sistem memverifikasi elemen "Jadwal" dengan kondisi "Tidak ada section/input/validasi jadwal FTL."
    # target: batas-toleransi
    And sistem memverifikasi elemen "Batas Toleransi Jadwal" dengan kondisi "Tidak ada checkbox toleransi jadwal."
    # target: confirmation-save
    And sistem memverifikasi elemen "Simpan" dengan kondisi "Enabled setelah Terima walaupun jadwal tidak diisi."

  @positive @priority-high @REQ-025 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-025 — Review menampilkan seluruh data order secara read-only
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Seluruh step valid; dua unit, PIC baru, DO dan nilai tersedia."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "PIC/WA/catatan/rute/No. Lelang/DO/barang/jumlah/nilai/vendor/muat/pajak/asuransi/total sama dengan fixture."
    # target: review-shipping
    And sistem memverifikasi elemen "Jenis Pengiriman dan Rute" dengan kondisi "Data rute read-only."
    # target: review-sender
    And sistem memverifikasi elemen "Data Pengirim" dengan kondisi "PIC pengirim read-only."
    # target: review-receiver
    And sistem memverifikasi elemen "Data Penerima" dengan kondisi "PIC penerima read-only."
    # target: review-goods
    And sistem memverifikasi elemen "Data Barang" dengan kondisi "Data barang read-only."
    # target: review-price
    And sistem memverifikasi elemen "Vendor dan Harga" dengan kondisi "Data vendor dan harga read-only."

  @negative @priority-high @REQ-025 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-025 — Data review tidak dapat diedit langsung
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review sudah terbuka dengan data valid."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: review-data
    When user mengklik elemen "Review Order"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Tidak ada input PIC/jumlah/nilai/harga editable; perubahan hanya lewat Sebelumnya."
    # target: simpan
    And sistem memverifikasi elemen "Simpan" dengan kondisi "Tombol Simpan tetap tersedia untuk submit data yang sama."

  @positive @priority-high @REQ-026 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-026 — Simpan membuat status Menunggu Konfirmasi dan notifikasi vendor
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Seluruh required valid dan deadline belum berlalu; belum ada order final untuk TX-A."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order baru Menunggu Konfirmasi, belum Menunggu Penugasan."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tepat satu order untuk TX-A."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Vendor A menerima tepat satu notifikasi order baru; vendor lain tidak menerima."

  @negative @priority-high @REQ-026 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-026 — Kegagalan simpan tidak menampilkan order sukses semu
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner menggagalkan persist sebelum commit dengan respons gagal; data valid."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Tetap Review, data tetap; error dapat dipahami tanpa teks spesifik yang dipaksakan."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tidak ada order final baru dan tidak ada notifikasi vendor."

  @positive @priority-high @REQ-027 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-027 — Vendor pemilik membuka Konfirmasi Order hanya pada pending
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A memiliki ORD-AMS-001 Menunggu Konfirmasi."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: konfirmasi-action
    And user mengklik elemen "Konfirmasi Order"
    # target: confirmation-dialog
    Then sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Dialog untuk ORD-AMS-001 terbuka, bukan order lain."

  @negative @priority-high @REQ-027 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-027 — Konfirmasi Order tidak tersedia setelah order ditolak
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A memiliki ORD-AMS-001 berstatus Ditolak."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: konfirmasi-action
    Then sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Aksi tidak tersedia untuk status Ditolak."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Status Ditolak tetap; tidak dapat dikonfirmasi ulang melalui menu stale."

  @positive @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-028 — Popup konfirmasi menampilkan ringkasan dan radio saling eksklusif
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup Menunggu Konfirmasi milik vendor A dibuka."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: confirmation-save
    Then sistem memverifikasi elemen "Simpan" dengan kondisi "Disabled sebelum pilihan."
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: tolak
    And user mengklik elemen "Tolak Order"
    # target: confirmation-data
    Then sistem memverifikasi elemen "Ringkasan Order" dengan kondisi "Muat, akhir kirim, FTL, armada dipesan, Kota Surabaya - Kota Bandar Lampung sesuai order dan read-only."
    # target: terima
    And sistem memverifikasi elemen "Terima Order" dengan kondisi "Tidak terpilih setelah Tolak dipilih."
    # target: tolak
    And sistem memverifikasi elemen "Tolak Order" dengan kondisi "Terpilih; alasan tampil."

  @negative @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-028 — Tanpa radio dipilih Simpan tidak dapat mengubah status
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup baru dibuka; belum memilih Terima/Tolak."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: confirmation-save
    Then sistem memverifikasi elemen "Simpan" dengan kondisi "Disabled; tidak dapat submit."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Konfirmasi; tidak ada side effect."

  @positive @priority-high @REQ-029 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-029 — Terima dan Simpan memindahkan ke Menunggu Penugasan
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order FTL pending vendor A."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "ORD-AMS-001 Menunggu Penugasan."
    # target: alasan
    And sistem memverifikasi elemen "Alasan Penolakan" dengan kondisi "Tidak ada form Alasan Penolakan ketika Terima."
    # target: jadwal
    And sistem memverifikasi elemen "Jadwal" dengan kondisi "Tidak ada input jadwal pada alur Terima."

  @negative @priority-high @REQ-029 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-029 — Penerimaan dari popup stale tidak menimpa penolakan yang sudah tersimpan
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Popup dimuat saat pending; sesi vendor lain telah commit Tolak sebelum Simpan sesi ini."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Ditolak setelah refresh; Terima stale ditolak sebagai konflik."
    # target: confirmation-dialog
    And sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Konflik ditangani tanpa menampilkan sukses penerimaan palsu."

  @positive @priority-high @REQ-030 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-030 — Tolak dengan alasan valid menyimpan status Ditolak
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order pending vendor A."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: tolak
    When user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan "Armada tidak tersedia pada tanggal permintaan muat"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "ORD-AMS-001 Ditolak."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Order Ditolak masih ada dalam list vendor A; alasan tersimpan."

  @negative @priority-high @REQ-030 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-030 — Tolak tanpa Alasan Penolakan tidak tersimpan
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order pending; radio Tolak terpilih."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: tolak
    When user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan ""
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: alasan
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan kondisi "Required gagal; textarea alasan masih dapat diperbaiki."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Konfirmasi."

  @positive @priority-high @REQ-031 @screen-riwayat-order-tidak-aktif
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-031 — Penolakan menjadi riwayat shipper setelah penggantian tersimpan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A telah menolak; shipper telah sukses menyimpan penggantian ke OFFER-B."
    # target: Riwayat Order Tidak Aktif; route: {{routes.riwayat-order-tidak-aktif}}
    Given user berada di halaman "Riwayat Order Tidak Aktif"
    # target: inactive-history
    Then sistem memverifikasi elemen "Riwayat Order Tidak Aktif" dengan kondisi "Riwayat Order Tidak Aktif terlihat."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "Rekaman penolakan vendor A ada; vendor A tetap melihat order Ditolak di listnya."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Order aktif untuk vendor B Menunggu Konfirmasi; penolakan lama tidak tampil sebagai order aktif shipper."

  @negative @priority-high @REQ-031 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-031 — Membuka penawaran lain saja tidak memindahkan penolakan ke riwayat
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order Ditolak vendor A; shipper hanya membuka penggantian, belum Simpan."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: ganti-action
    And user mengklik elemen "Pilih Penawaran Lain"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order Ditolak masih di list aktif shipper."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "Penolakan belum dipindahkan; membuka halaman bukan commit perubahan."

  @positive @priority-high @REQ-032 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-032 — Pilih Penawaran Lain hanya menyediakan penawaran lelang terkait
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper membuka penggantian dari Ditolak OFFER-A; OFFER-B/C ada pada lelang sama."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-offers
    Then sistem memverifikasi elemen "Harga Penawaran Lain" dengan kondisi "OFFER-B dan OFFER-C tersedia; OFFER-A tidak tersedia; penawaran lelang lain tidak tersedia."
    # target: pilih-penawaran
    And sistem memverifikasi elemen "Pilih" dengan kondisi "Tombol Pilih, bukan Pesan, pada penawaran alternatif."

  @negative @priority-high @REQ-032 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-032 — Pilih Penawaran Lain tidak tersedia sebelum vendor menolak
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order Menunggu Konfirmasi, belum Ditolak."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: ganti-action
    Then sistem memverifikasi elemen "Pilih Penawaran Lain" dengan kondisi "Aksi tidak tersedia pada Menunggu Konfirmasi."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tidak berubah dan vendor tidak terganti."

  @positive @priority-high @REQ-033 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-033 — Review penggantian menunjukkan vendor dan harga baru
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper membuka penggantian Ditolak; OFFER-B berlaku dan terkait lelang."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: pilih-penawaran
    When user mengklik elemen "Pilih"
    # target: replacement-wizard
    Then sistem memverifikasi elemen "Memilih Penawaran dan Review" dengan kondisi "Dua step: Memilih Penawaran lalu Review; Review aktif."
    # target: replacement-review
    And sistem memverifikasi elemen "Review Perubahan" dengan kondisi "Vendor A → Vendor B dan harga baru ditinjau; rute/PIC/barang tidak diubah."
    # target: jadwal
    And sistem memverifikasi elemen "Jadwal" dengan kondisi "Tidak ada jadwal FTL."

  @negative @priority-high @REQ-033 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-033 — Batal pada review penggantian tidak menyimpan vendor baru
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review OFFER-B terbuka; perubahan belum tersimpan."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-cancel
    When user mengklik elemen "Batal"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order masih Ditolak vendor A."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Vendor belum berubah; tidak ada notifikasi ke vendor B."

  @positive @priority-high @REQ-034 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-034 — Simpan penggantian kembali pending dan memberi notifikasi vendor baru
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review OFFER-B valid; penggantian belum pernah commit."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-save
    When user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order aktif Menunggu Konfirmasi vendor B."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Vendor/harga berasal dari OFFER-B; PIC/barang tetap."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Vendor B menerima satu notifikasi; vendor A tetap memiliki rekaman Ditolak."

  @negative @priority-high @REQ-034 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-034 — Kegagalan commit penggantian menjaga vendor lama dan penolakan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review OFFER-B valid; runner menggagalkan simpan sebelum commit."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-save
    When user mengklik elemen "Simpan"
    # target: replacement-review
    Then sistem memverifikasi elemen "Review Perubahan" dengan kondisi "Data pilihan dapat dicoba kembali; tidak menampilkan sukses palsu."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Ditolak vendor A; penolakan belum dipindahkan."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Vendor B tidak menerima notifikasi order."

  @positive @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-035 — Penugasan FTL diterima memakai armada dan sopir master
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order vendor A Menunggu Penugasan; master armada L-1234-AMS dan sopir SOPIR-01 tersedia; mode eksisting disiapkan."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: cari-order
    When user mengisi field "Cari Order" dengan "ORD-AMS-001"
    # target: pilih-order
    And user mengklik elemen "ORD-AMS-001"
    # target: armada-master
    And user mengklik elemen "Pilih Dari Master"
    # target: no-polisi
    And user memilih opsi "L-1234-AMS" pada field "No. Polisi"
    # target: sopir-master
    And user mengklik elemen "Pilih Dari Master"
    # target: sopir
    And user memilih opsi "SOPIR-01" pada field "Sopir"
    # target: assignment-save
    And user mengklik elemen "Simpan"
    # target: assignment-order
    Then sistem memverifikasi elemen "Data Order Terpilih" dengan kondisi "Order terpilih FTL, jumlah armada dan Tanggal Permintaan Muat sesuai."
    # target: assignment-detail-heading
    And sistem memverifikasi elemen "Detail Penugasan" dengan kondisi "Penugasan sukses sesuai baseline OMS."
    # target: jadwal
    And sistem memverifikasi elemen "Jadwal" dengan kondisi "Tidak ada section/input jadwal."

  @negative @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-035 — Required sopir eksisting tetap memblokir penugasan FTL
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order diterima; armada master dipilih tetapi sopir kosong."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: pilih-order
    When user mengklik elemen "ORD-AMS-001"
    # target: no-polisi
    And user memilih opsi "L-1234-AMS" pada field "No. Polisi"
    # target: assignment-save
    And user mengklik elemen "Simpan"
    # target: sopir
    Then sistem memverifikasi elemen "Sopir" dengan kondisi "Validasi sopir required mengikuti baseline; tidak tercipta penugasan."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Penugasan, tanpa kewajiban jadwal tambahan."

  @positive @priority-high @REQ-036 @screen-detail-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-036 — Detail Penugasan FTL menampilkan No Lelang pada Detail Data Order
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A memiliki penugasan order dari lelang FTL."
    # target: Detail Penugasan; route: {{routes.detail-penugasan}}
    Given user berada di halaman "Detail Penugasan"
    # target: assignment-detail-order
    Then sistem memverifikasi elemen "Detail Data Order" dengan kondisi "Section Detail Data Order terlihat."
    # target: assignment-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "FTL-NRM-01/AMS010 tampil pada section Detail Data Order, bukan data vendor/sopir."
    # target: assignment-info
    And sistem memverifikasi elemen "Informasi Penugasan" dengan kondisi "Armada, sopir, WA mengikuti penugasan."

  @negative @priority-high @REQ-036 @screen-detail-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-036 — Detail penugasan tanpa lelang tidak menampilkan No Lelang palsu
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Penugasan order langsung FTL, tanpa hubungan lelang."
    # target: Detail Penugasan; route: {{routes.detail-penugasan}}
    Given user berada di halaman "Detail Penugasan"
    # target: assignment-lelang
    Then sistem memverifikasi elemen "No. Lelang" dengan kondisi "Tidak menampilkan nomor lelang; tidak mewarisi nomor order lain."
    # target: assignment-detail-order
    And sistem memverifikasi elemen "Detail Data Order" dengan kondisi "Detail lain sesuai baseline order langsung."

  @positive @priority-high @REQ-001 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-037 — Buat Order langsung FTL mempertahankan alur eksisting
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "FTL direct valid; tidak memilih penawaran."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: buat-order
    When user mengklik elemen "Buat Order"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Wizard langsung menggunakan baseline OMS."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Tidak mengunci data dengan OFFER-A atau mewajibkan No. Lelang."

  @positive @priority-high @REQ-002 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-038 — Order langsung LCL tetap dapat dibuat tanpa penawaran
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data LCL baseline valid."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: buat-order
    When user mengklik elemen "Buat Order"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "LCL langsung tetap mengikuti baseline."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Tidak mewajibkan lelang atau notifikasi konfirmasi khusus lelang."

  @positive @priority-high @REQ-004 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-039 — No Lelang terlihat pada list vendor pemilik
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A memiliki order FTL dari lelang."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: no-lelang
    Then sistem memverifikasi elemen "No. Lelang" dengan kondisi "Nomor lelang di bawah ID ORD-AMS-001; hanya order vendor A terlihat."

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-037 — PIC Penerima kosong ditolak terpisah dari required lain
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Semua required terisi kecuali PIC Penerima."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-penerima
    When user mengisi field "PIC Penerima" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: pic-penerima
    Then sistem memverifikasi elemen "PIC Penerima" dengan kondisi "Error required pada field yang kosong."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Pengiriman."

  @negative @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-038 — WhatsApp PIC Pengirim kosong ditolak terpisah dari required lain
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Semua required terisi kecuali WhatsApp PIC Pengirim."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: wa-pengirim
    When user mengisi field "No. WhatsApp PIC" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: wa-pengirim
    Then sistem memverifikasi elemen "No. WhatsApp PIC" dengan kondisi "Error required pada field yang kosong."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Pengiriman."

  @positive @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-040 — Catatan opsional boleh kosong saat PIC lengkap
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Empat required PIC valid."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: catatan-pengirim
    When user mengisi field "Catatan" dengan ""
    # target: catatan-penerima
    And user mengisi field "Catatan" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Data Barang terbuka; tidak ada validasi required catatan."

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-039 — Jumlah Armada kosong tidak memenuhi integer positif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Barang unit awal lengkap."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-armada
    Then sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Input kosong/negatif/pecahan tidak menjadi jumlah unit valid."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang; tidak menciptakan card dengan jumlah tidak valid."

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-040 — Jumlah Armada -1 tidak memenuhi integer positif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Barang unit awal lengkap."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "-1"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-armada
    Then sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Input kosong/negatif/pecahan tidak menjadi jumlah unit valid."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang; tidak menciptakan card dengan jumlah tidak valid."

  @negative @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-041 — Jumlah Armada 1.5 tidak memenuhi integer positif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Barang unit awal lengkap."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "1.5"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-armada
    Then sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Input kosong/negatif/pecahan tidak menjadi jumlah unit valid."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang; tidak menciptakan card dengan jumlah tidak valid."

  @positive @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-041 — Multi tag DO dapat ditambah dan dihapus pada unit yang benar
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Unit 1 berisi barang valid."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan "DO-001,DO-002"
    # target: nomor-do
    Then sistem memverifikasi elemen "Nomor DO" dengan kondisi "Dua tag DO-001 dan DO-002."
    # target: hapus-do
    When user mengklik elemen "Hapus Nomor DO"
    # target: nomor-do
    Then sistem memverifikasi elemen "Nomor DO" dengan kondisi "Hanya DO-002 tersisa; DO-001 yang di-scope dihapus."
    # target: tabel-barang
    And sistem memverifikasi elemen "Barang Unit" dengan kondisi "Barang unit tidak berubah."

  @negative @priority-high @REQ-015 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-042 — Satu unit kosong tetap memblokir meskipun unit pertama valid
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Jumlah Armada=2; Unit 1 valid, Unit 2 tidak memiliki barang."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: next
    When user mengklik elemen "Selanjutnya"
    # target: empty-barang
    Then sistem memverifikasi elemen "Belum ada barang. Klik “Pilih Barang.”" dengan kondisi "Unit 2 menampilkan empty state."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Data Barang; unit kosong tidak dilewati."

  @negative @priority-high @REQ-015 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-043 — Menghapus barang terakhir membuat unit tidak dapat dilanjutkan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Unit 1 hanya memiliki satu SKU valid."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: hapus-barang
    When user mengklik elemen "Hapus Barang"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: empty-barang
    Then sistem memverifikasi elemen "Belum ada barang. Klik “Pilih Barang.”" dengan kondisi "Unit 1 kosong."
    # target: total-berat
    And sistem memverifikasi elemen "Total Berat" dengan kondisi "Total berat menjadi 0."
    # target: total-kubikasi
    And sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "Total kubikasi menjadi 0."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Selanjutnya gagal karena tidak ada barang."

  @negative @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-044 — Kelebihan kubikasi saja menampilkan alert sesuai desain
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU-VOLUME volume 1 m³, berat 1 kg; capacityM3=54,72."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "55"
    # target: alert-kubikasi
    Then sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Kubikasi melebihi kapasitas armada terlihat."
    # target: total-kubikasi
    And sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "55 m³ > 54,72 m³."
    # target: alert-berat
    And sistem memverifikasi elemen "Berat melebihi kapasitas armada" dengan kondisi "Tidak ada alert berat; 55 kg < 18.000 kg."

  @negative @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-045 — Tanggal Permintaan Muat kosong tidak dapat dilanjutkan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Step terdahulu valid; akhir 09/10/2026 22:00 WIB."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Validasi datetime kosong gagal; input dapat diperbaiki."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Vendor dan Harga."

  @negative @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-046 — Tanggal Permintaan Muat setelah akhir kirim tidak dapat dilanjutkan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Step terdahulu valid; akhir 09/10/2026 22:00 WIB."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "10/10/2026 00:00"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Validasi datetime setelah akhir kirim gagal; input dapat diperbaiki."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Vendor dan Harga."

  @negative @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-047 — Tanggal Permintaan Muat format invalid tidak dapat dilanjutkan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Step terdahulu valid; akhir 09/10/2026 22:00 WIB."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "tanggal-tidak-valid"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Validasi datetime format invalid gagal; input dapat diperbaiki."
    # target: wizard
    And sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Tetap Vendor dan Harga."

  @positive @priority-high @REQ-020 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-042 — Textlink Multipickup membuka popup dan dapat ditutup
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang Multipickup dua asal satu tujuan."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: detail-drop
    When user mengklik elemen "Detail Drop Point"
    # target: drop-content
    Then sistem memverifikasi elemen "Daftar Drop Point" dengan kondisi "Dua asal dan satu tujuan lengkap."
    # target: drop-close
    When user mengklik elemen "Tutup"
    # target: drop-dialog
    Then sistem memverifikasi elemen "Detail Drop Point" dengan kondisi "Dialog tertutup."
    # target: vendor-readonly
    And sistem memverifikasi elemen "Vendor dan Penawaran" dengan kondisi "Data penawaran tidak berubah."

  @positive @priority-high @REQ-020 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-043 — Detail Drop Point Multipoint tidak menukar Muat dan Bongkar
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Multipoint dua Muat dan dua Bongkar."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: detail-drop
    When user mengklik elemen "Detail Drop Point"
    # target: drop-content
    Then sistem memverifikasi elemen "Daftar Drop Point" dengan kondisi "Muat (1)/(2) dan Bongkar (1)/(2) sesuai asal/tujuan dan urutannya."

  @negative @priority-high @REQ-027 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-048 — Shipper tidak memiliki action Konfirmasi Order vendor
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper A melihat order pending."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: konfirmasi-action
    Then sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Tidak tersedia untuk role shipper."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Konfirmasi."

  @negative @priority-high @REQ-027 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-049 — Vendor lain tidak dapat membuka konfirmasi order vendor A
    Given prasyarat "User login sebagai vendor-B; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor B membuka URL/orderId vendor A melalui route binding tanpa akses tenant/order."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: confirmation-dialog
    Then sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Ringkasan order vendor A tidak bocor; akses ditolak."
    # target: confirmation-save
    And sistem memverifikasi elemen "Simpan" dengan kondisi "Tidak ada Simpan yang dapat mengubah order."

  @negative @priority-high @REQ-027 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-050 — Action Konfirmasi Order hilang setelah Terima
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order vendor A sudah Menunggu Penugasan."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: konfirmasi-action
    Then sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Tidak tersedia lagi setelah order diterima."

  @negative @priority-high @REQ-030 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-051 — Alasan hanya whitespace dianggap kosong
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order pending vendor A."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: tolak
    When user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan "   "
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: alasan
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan kondisi "Required gagal setelah trim."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Konfirmasi."

  @negative @priority-high @REQ-032 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-052 — Vendor tidak memperoleh action Pilih Penawaran Lain shipper
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A melihat order Ditolak."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: ganti-action
    Then sistem memverifikasi elemen "Pilih Penawaran Lain" dengan kondisi "Tidak tersedia bagi vendor; vendor tidak dapat memilih pengganti."

  @negative @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-053 — Order pending tidak boleh ditugaskan sebelum diterima
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order vendor A Menunggu Konfirmasi, belum Menunggu Penugasan."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: cari-order
    When user mengisi field "Cari Order" dengan "ORD-AMS-001"
    # target: pilih-order
    Then sistem memverifikasi elemen "ORD-AMS-001" dengan kondisi "Tidak tersedia sebagai order yang dapat ditugaskan."
    # target: assignment-save
    And sistem memverifikasi elemen "Simpan" dengan kondisi "Tidak menciptakan penugasan untuk order pending."

  @negative @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-054 — Armada required baseline tetap divalidasi
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order diterima; sopir valid tetapi kendaraan belum dipilih."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: pilih-order
    When user mengklik elemen "ORD-AMS-001"
    # target: sopir
    And user memilih opsi "SOPIR-01" pada field "Sopir"
    # target: assignment-save
    And user mengklik elemen "Simpan"
    # target: no-polisi
    Then sistem memverifikasi elemen "No. Polisi" dengan kondisi "Armada required sesuai baseline gagal."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Penugasan."

  @positive @priority-medium @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-044 — Seluruh filter desain dapat diterapkan dan direset
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dataset fixture memiliki record yang memenuhi semua nilai filter; kontrol pudar diaktifkan melalui prasyarat baseline."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: filter
    When user mengklik elemen "Filter"
    # target: filter-order
    And user mengisi field "ID Order" dengan "ORD-AMS-001"
    # target: filter-jenis
    And user memilih opsi "FTL" pada field "Jenis Pengiriman"
    # target: filter-vendor
    And user mengisi field "Vendor" dengan "Vendor A"
    # target: filter-asal
    And user memilih opsi "Kota Surabaya" pada field "Kota Asal"
    # target: filter-tujuan
    And user memilih opsi "Kota Bandar Lampung" pada field "Kota Tujuan"
    # target: filter-tipe
    And user memilih opsi "Normal" pada field "Tipe Pengiriman"
    # target: filter-metode
    And user memilih opsi "baseline-metode" pada field "Metode Pengiriman"
    # target: filter-buat
    And user mengisi field "Tanggal Buat" dengan "07/10/2026"
    # target: filter-muat
    And user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026"
    # target: filter-pengirim
    And user memilih opsi "PT Mentari Sumber Kertas" pada field "Pengirim"
    # target: filter-penerima
    And user memilih opsi "PT Retail Jaya Abadi" pada field "Penerima"
    # target: filter-drop-asal
    And user memilih opsi "Gudang MSK Region 2" pada field "Drop Point Asal"
    # target: filter-drop-tujuan
    And user memilih opsi "Gudang Jaya Retail Lampung" pada field "Drop Point Tujuan"
    # target: terapkan
    And user mengklik elemen "Terapkan"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Hanya ORD-AMS-001 memenuhi kombinasi."
    # target: reset
    When user mengklik elemen "Reset"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Data baseline tanpa filter dipulihkan; semua filter kosong."

  @positive @priority-medium @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-045 — Sort pagination dan salin ID tidak mengubah relasi order lelang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "30 record unik lintas lelang, angka harga/vendor terkontrol; clipboard mock/read diizinkan runner."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: sort-vendor
    When user mengklik elemen "Vendor"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Urutan vendor sesuai arah sort."
    # target: sort-harga
    When user mengklik elemen "Total Harga"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Urutan harga sesuai arah sort."
    # target: page-size
    When user memilih opsi "20" pada field "Tampilkan data"
    # target: page-next
    And user mengklik elemen "Halaman berikutnya"
    # target: page-prev
    And user mengklik elemen "Halaman sebelumnya"
    # target: page-last
    And user mengklik elemen "Halaman terakhir"
    # target: page-first
    And user mengklik elemen "Halaman pertama"
    # target: copy-order
    And user mengklik elemen "Salin ID Order"
    # target: copy-order
    Then sistem memverifikasi elemen "Salin ID Order" dengan kondisi "Clipboard sama dengan ID order yang di-scope."
    # target: copy-lelang
    When user mengklik elemen "Salin No. Lelang"
    # target: copy-lelang
    Then sistem memverifikasi elemen "Salin No. Lelang" dengan kondisi "Clipboard sama dengan No. Lelang order yang di-scope."
    # target: no-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "ID/No. Lelang tidak bergeser antarbaris setelah sort/page."

  @positive @priority-medium @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-046 — Action detail dan kontrol eksisting tetap tersedia sesuai baseline
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order diterima; izin eksisting tersedia untuk pengguna fixture."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: detail-order-action
    And user mengklik elemen "Detail Order"
    # target: detail-order
    Then sistem memverifikasi elemen "Detail Order" dengan kondisi "Detail Order terbuka."
    # target: detail-order-data
    And sistem memverifikasi elemen "Detail Data Order" dengan kondisi "Detail memuat No. Lelang dan status Menunggu Penugasan."
    # target: batalkan-order
    And sistem memverifikasi elemen "Batalkan Order" dengan kondisi "Tombol mengikuti hak akses baseline."
    # target: edit-order
    And sistem memverifikasi elemen "Edit Order" dengan kondisi "Tombol mengikuti hak akses baseline; tidak membuka semua data lelang untuk edit."

  @positive @priority-low @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-047 — Batch Order dan tautan riwayat mempertahankan tujuan eksisting
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Baseline tujuan Batch Order/Riwayat Pembatalan tersedia; tidak mengunggah batch atau membatalkan order."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: batch-order
    When user mengklik elemen "Batch Order"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: riwayat-pembatalan
    And user mengklik elemen "Riwayat Pembatalan"
    # target: batch-order
    Then sistem memverifikasi elemen "Batch Order" dengan kondisi "Navigasi Batch Order sesuai baseline tanpa side effect pada order lelang."
    # target: inactive-history
    And sistem memverifikasi elemen "Riwayat Order Tidak Aktif" dengan kondisi "Tujuan riwayat dipetakan sesuai A14; tidak menganggap label Pembatalan identik dengan penolakan tanpa binding implementasi."

  @positive @priority-medium @REQ-001 @screen-detail-harga-penawaran
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-048 — Detail penawaran mempertahankan konteks sebelum Pesan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Offer A valid; dokumen/profil dan fitur eksisting memiliki binding baseline; hanya buka dialog, tidak submit negosiasi/lelang ulang."
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    Given user berada di halaman "Detail Harga Penawaran"
    # target: syarat
    When user mengklik elemen "Syarat & Ketentuan"
    # target: syarat
    And user mengklik elemen "Syarat & Ketentuan"
    # target: detail-biaya
    And user mengklik elemen "Detail Biaya"
    # target: ppn
    Then sistem memverifikasi elemen "PPN" dengan kondisi "Detail tarif pajak penawaran terlihat."
    # target: detail-armada
    When user mengklik elemen "Detail Armada"
    # target: detail-vendor
    And user mengklik elemen "Vendor"
    # target: profil-vendor
    And user mengklik elemen "Lihat Profil"
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    When user berada di halaman "Detail Harga Penawaran"
    # target: offer-filter
    And user mengklik elemen "Filter"
    # target: offer-vendor
    And user memilih opsi "Vendor A" pada field "Vendor"
    # target: offer-armada
    And user memilih opsi "Tronton Wing Box" pada field "Jenis Armada"
    # target: offer-waktu
    And user mengisi field "Target Waktu Perjalanan" dengan "4"
    # target: offer-terapkan
    And user mengklik elemen "Terapkan"
    # target: urutkan
    And user mengklik elemen "Urutkan"
    # target: offer-reset
    And user mengklik elemen "Reset"
    # target: offer-page-size
    And user memilih opsi "20" pada field "Tampilkan data"
    # target: offer-page-next
    And user mengklik elemen "Halaman berikutnya"
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    When user berada di halaman "Detail Harga Penawaran"
    # target: dokumen
    And user mengklik elemen "Dokumen_Lelang_1.pdf"
    # target: ajukan-nego
    And user mengklik elemen "Ajukan Nego"
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    When user berada di halaman "Detail Harga Penawaran"
    # target: lelang-ulang
    And user mengklik elemen "Lelang Ulang"
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    When user berada di halaman "Detail Harga Penawaran"
    # target: pesan
    And user mengklik elemen "Pesan"
    # target: wizard
    Then sistem memverifikasi elemen "Tahapan Buat Order" dengan kondisi "Wizard berasal dari offer A yang di-scope."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Konteks lelang benar setelah interaksi tab/filter/eksisting."

  @positive @priority-medium @REQ-012 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-049 — Accordion rute pengirim penerima tidak menghilangkan input PIC
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "PIC valid, accordion awal terbuka."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: shipping-section
    When user mengklik elemen "Jenis Pengiriman dan Rute"
    # target: shipping-section
    And user mengklik elemen "Jenis Pengiriman dan Rute"
    # target: sender-section
    And user mengklik elemen "Data Pengirim"
    # target: sender-section
    And user mengklik elemen "Data Pengirim"
    # target: receiver-section
    And user mengklik elemen "Data Penerima"
    # target: receiver-section
    And user mengklik elemen "Data Penerima"
    # target: batal
    And user mengklik elemen "Batal"
    # target: pic-pengirim
    Then sistem memverifikasi elemen "PIC Pengirim" dengan kondisi "Nilai PIC tetap tersimpan setelah collapse/expand."
    # target: cancel-dialog
    And sistem memverifikasi elemen "Konfirmasi Pembatalan" dengan kondisi "Batal membuka dialog konfirmasi, bukan langsung membuang data."

  @positive @priority-medium @REQ-025 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-050 — Accordion Review mempertahankan semua bagian data
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review valid; seluruh section terbuka."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: review-shipping
    When user mengklik elemen "Jenis Pengiriman dan Rute"
    # target: review-shipping
    And user mengklik elemen "Jenis Pengiriman dan Rute"
    # target: review-sender
    And user mengklik elemen "Data Pengirim"
    # target: review-sender
    And user mengklik elemen "Data Pengirim"
    # target: review-receiver
    And user mengklik elemen "Data Penerima"
    # target: review-receiver
    And user mengklik elemen "Data Penerima"
    # target: review-goods
    And user mengklik elemen "Data Barang"
    # target: review-goods
    And user mengklik elemen "Data Barang"
    # target: review-price
    And user mengklik elemen "Vendor dan Harga"
    # target: review-price
    And user mengklik elemen "Vendor dan Harga"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Semua bagian kembali terlihat; total/PIC/barang tidak berubah."

  @positive @priority-medium @REQ-028 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-051 — Menutup popup tanpa Simpan tidak merespons order
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A belum merespons; popup terbuka."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: confirmation-close
    And user mengklik elemen "Tutup"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap Menunggu Konfirmasi; memilih radio saja tidak commit."

  @positive @priority-medium @REQ-033 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-052 — Sebelumnya dari review penggantian mempertahankan pilihan
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review OFFER-B terbuka belum disimpan."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-back
    When user mengklik elemen "Sebelumnya"
    # target: replacement-offers
    Then sistem memverifikasi elemen "Harga Penawaran Lain" dengan kondisi "Memilih Penawaran kembali terbuka; hanya offer terkait yang belum pernah dipilih."
    # target: replacement-review
    And sistem memverifikasi elemen "Review Perubahan" dengan kondisi "Jika OFFER-B dipilih kembali, harga yang direview tetap OFFER-B."

  @positive @priority-medium @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-053 — Mode armada sopir manual serta batal mengikuti baseline
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order diterima; baseline field manual dan mode OMS tersedia."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: pilih-order
    When user mengklik elemen "ORD-AMS-001"
    # target: armada-manual
    And user mengklik elemen "Isi Data Manual"
    # target: sopir-manual
    And user mengklik elemen "Isi Data Manual"
    # target: assignment-mode
    Then sistem memverifikasi elemen "Mode Penugasan" dengan kondisi "Mode/field manual muncul menurut baseline, tanpa input jadwal."
    # target: assignment-cancel
    When user mengklik elemen "Batal"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order tetap Menunggu Penugasan; tidak terbentuk penugasan ketika Batal."

  @positive @priority-medium @REQ-036 @screen-detail-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-054 — Detail penugasan shipper dan tracking tetap mempertahankan No Lelang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper memiliki order FTL dengan tracking baseline terisi."
    # target: Detail Penugasan; route: {{routes.detail-penugasan}}
    Given user berada di halaman "Detail Penugasan"
    # target: assignment-detail-heading
    Then sistem memverifikasi elemen "Detail Penugasan" dengan kondisi "Detail Penugasan terlihat."
    # target: assignment-detail-order
    When user mengklik elemen "Detail Data Order"
    # target: assignment-detail-order
    And user mengklik elemen "Detail Data Order"
    # target: assignment-info
    And user mengklik elemen "Informasi Penugasan"
    # target: assignment-info
    And user mengklik elemen "Informasi Penugasan"
    # target: riwayat-penugasan
    And user mengklik elemen "Lihat Detail"
    # target: Detail Penugasan; route: {{routes.detail-penugasan}}
    When user berada di halaman "Detail Penugasan"
    # target: tracking-history
    And user mengklik elemen "History Tracking"
    # target: tracking-history
    And user mengklik elemen "History Tracking"
    # target: tracking-timeline
    And user mengklik elemen "Timeline"
    # target: tracking-lokasi
    And user mengklik elemen "Per Lokasi"
    # target: assignment-lelang
    Then sistem memverifikasi elemen "No. Lelang" dengan kondisi "No. Lelang tetap FTL-NRM-01/AMS010 pada Detail Data Order."
    # target: tracking-history
    And sistem memverifikasi elemen "History Tracking" dengan kondisi "Per Lokasi dan Timeline mengikuti tracking baseline, bukan jadwal FTL."

  @edge @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-001 — Waktu muat sama dengan now diterima pada batas inklusif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Clock dikendalikan tepat pada now fixture; presisi menit."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "07/10/2026 10:00"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Review terbuka; waktu 07/10/2026 10:00 WIB diterima."

  @edge @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-002 — Waktu muat sama dengan Rencana Akhir Kirim diterima pada batas inklusif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Clock dikendalikan tepat pada now fixture; presisi menit."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "09/10/2026 22:00"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Review terbuka; waktu 09/10/2026 22:00 WIB diterima."

  @edge @priority-high @REQ-018 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-003 — UTC tanggal berbeda tetap divalidasi sebagai WIB
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Clock 2026-10-07T17:30:00Z = 08/10/2026 00:30 WIB; akhir fixture masih lebih besar."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: tanggal-muat
    When user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026 00:30"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Waktu 08/10/2026 00:30 WIB diterima; tidak dibandingkan sebagai tanggal UTC 07/10."

  @edge @priority-high @REQ-003 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-004 — Draft yang dibuka sampai lewat deadline tidak dapat difinalisasi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Draft valid dimulai sebelum akhir; now sudah 09/10/2026 22:01 WIB."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Submit ditolak karena melewati akhir; draft/data dapat ditangani sesuai baseline."
    # target: tabel-order
    And sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tidak ada order final/notifikasi baru."

  @edge @priority-high @REQ-007 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-005 — Auto-draft lelang cukup untuk batas minimal satu field draft
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Data lelang otomatis terisi; user belum mengubah PIC apa pun."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: draft
    When user mengklik elemen "Simpan ke Draf"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Draft dapat disimpan karena ada data sumber terisi; asumsi A04."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Relasi lelang/penawaran tersimpan untuk resume."

  @edge @priority-high @REQ-007 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-006 — Draft dari Review pulih dengan step terakhir dan total harga
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review valid, belum order final."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: draft
    When user mengklik elemen "Simpan ke Draf"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Draft Review tersimpan; belum Menunggu Konfirmasi/notifikasi vendor."
    # target: action-order
    When user mengklik elemen "Action Order"
    # target: lanjut-draft
    And user mengklik elemen "Lanjutkan Draf"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Draft terbuka pada Review dan seluruh total pulih."

  @edge @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-007 — Batas minimum satu armada menghasilkan tepat satu card
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Nilai awal 2; unit 2 kosong sehingga pengurangan tidak memerlukan keputusan data berisi."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "1"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Tepat satu card; data Unit 1 tetap."
    # target: jumlah-armada
    And sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Nilai 1 valid."

  @edge @priority-high @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-008 — Pengurangan unit berisi data ditangani tanpa subtotal tersembunyi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Tiga unit berisi barang; pengurangan mengikuti konfirmasi/perilaku baseline."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "2"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Jika pengurangan diterima setelah keputusan baseline, tepat dua unit; jika dibatalkan data tiga unit tetap."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Setelah pengurangan commit, subtotal Unit 3 tidak dihitung lagi; data Unit 1/2 tetap."

  @edge @priority-high @REQ-014 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-009 — DO opsional kosong tetap valid untuk satu unit lengkap
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Barang/jumlah/nilai valid, DO sebelumnya tidak diisi."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan ""
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    Then sistem memverifikasi elemen "Tanggal Permintaan Muat" dengan kondisi "Vendor dan Harga terbuka tanpa error DO required."

  @edge @priority-high @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-010 — Nama dan catatan Unicode bertanda kutip tersimpan sebagai teks
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Nomor WhatsApp mengikuti baseline valid; tidak ada batas panjang dilanggar."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-pengirim
    When user mengisi field "PIC Pengirim" dengan "Dewi O'Neil"
    # target: catatan-pengirim
    And user mengisi field "Catatan" dengan "Muat “A&B” — pintu timur"
    # target: catatan-penerima
    And user mengisi field "Catatan" dengan "Terima paket 日本語"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Data Barang terbuka; Unicode/apostrof tidak merusak state."
    # target: review-data
    And sistem memverifikasi elemen "Review Order" dengan kondisi "Setelah mencapai Review, teks catatan identik dan tidak dieksekusi sebagai markup."

  @edge @priority-high @REQ-011 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-011 — Multidrop tiga penerima memisahkan data PIC tiap titik
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Satu Muat dan tiga Bongkar; PIC tiap Bongkar berbeda."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: pic-penerima
    When user mengisi field "PIC Penerima" dengan "PIC Bongkar 3"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: route-cards
    Then sistem memverifikasi elemen "Muat dan Bongkar" dengan kondisi "Hanya PIC Bongkar (3) berubah; Bongkar (1)/(2) tetap."
    # target: unit-cards
    And sistem memverifikasi elemen "Unit Armada" dengan kondisi "Data Barang terbuka jika semua titik lengkap."

  @edge @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-012 — Berat tepat kapasitas tidak memicu alert melebihi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU berat 20 kg volume 0,001 m³, kapasitas 18.000 kg."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "900"
    # target: total-berat
    Then sistem memverifikasi elemen "Total Berat" dengan kondisi "18.000 kg tepat kapasitas."
    # target: alert-berat
    And sistem memverifikasi elemen "Berat melebihi kapasitas armada" dengan kondisi "Tidak ada alert berat melebihi."
    # target: alert-kubikasi
    And sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Tidak ada alert kubikasi."

  @edge @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-013 — Kubikasi tepat kapasitas tidak memicu alert melebihi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU volume 0,018 m³, berat 1 kg; kapasitas 54,72 m³."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "3040"
    # target: total-kubikasi
    Then sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "54,72 m³ tepat kapasitas tanpa kesalahan floating point."
    # target: alert-kubikasi
    And sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Tidak ada alert kubikasi melebihi."

  @edge @priority-high @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-014 — Berat dan kubikasi sama-sama berlebih menampilkan kedua alert
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "SKU berat 1000 kg volume 4 m³; kapasitas 18.000 kg/54,72 m³."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-barang
    When user mengisi field "Jumlah" dengan "20"
    # target: total-berat
    Then sistem memverifikasi elemen "Total Berat" dengan kondisi "20.000 kg."
    # target: total-kubikasi
    And sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "80 m³."
    # target: alert-berat
    And sistem memverifikasi elemen "Berat melebihi kapasitas armada" dengan kondisi "Alert berat sesuai baseline."
    # target: alert-kubikasi
    And sistem memverifikasi elemen "Kubikasi melebihi kapasitas armada" dengan kondisi "Alert Kubikasi melebihi kapasitas armada."

  @edge @priority-high @REQ-022 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-015 — Penawaran pajak nol dan tanpa asuransi menghasilkan total DPP
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Satu unit; PPN=0/PPh=0; lelang tidak diasuransikan."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: harga-dpp
    Then sistem memverifikasi elemen "Harga DPP" dengan kondisi "Rp6.000.000."
    # target: ppn
    And sistem memverifikasi elemen "PPN" dengan kondisi "0."
    # target: pph
    And sistem memverifikasi elemen "PPh" dengan kondisi "0."
    # target: asuransi
    And sistem memverifikasi elemen "Asuransi" dengan kondisi "0."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Rp6.000.000 tepat DPP."

  @edge @priority-high @REQ-023 @screen-vendor-dan-harga
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-016 — Nilai asuransi pecahan memakai pembulatan baseline sekali
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Fixture total nilai Rp100.005, tarif 0,2%; aturan pembulatan baseline tersedia."
    # target: Buat Order - Vendor dan Harga; route: {{routes.vendor-dan-harga}}
    Given user berada di halaman "Buat Order - Vendor dan Harga"
    # target: asuransi
    Then sistem memverifikasi elemen "Asuransi" dengan kondisi "Nilai mentah 200,01; nilai tampil/simpan menggunakan aturan pembulatan baseline yang sama."
    # target: total-harga
    And sistem memverifikasi elemen "Total Harga" dengan kondisi "Harga konsisten antara Step 03/Review/tersimpan, tidak dibulatkan ganda."

  @edge @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-017 — Beralih Tolak ke Terima tidak menyimpan alasan sebagai penolakan
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order pending vendor A."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: tolak
    When user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan "Armada penuh"
    # target: terima
    And user mengklik elemen "Terima Order"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: alasan
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan kondisi "Disembunyikan/tidak diwajibkan pada Terima."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Menunggu Penugasan; alasan terdahulu tidak membuat keputusan Tolak."

  @edge @priority-high @REQ-028 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-018 — Beralih Terima ke Tolak mengaktifkan required alasan
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order pending vendor A."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: tolak
    And user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan ""
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: alasan
    Then sistem memverifikasi elemen "Alasan Penolakan" dengan kondisi "Required gagal setelah beralih ke Tolak."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tetap pending; pilihan Terima sebelumnya tidak tersimpan."

  @edge @priority-high @REQ-030 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-019 — Alasan penolakan multibaris tersimpan sebagai teks
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A memilih Tolak, payload masih dalam batas baseline."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: tolak
    When user mengklik elemen "Tolak Order"
    # target: alasan
    And user mengisi field "Alasan Penolakan" dengan "Armada penuh\nHubungi “PIC A” & tim operasi"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Ditolak."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "Alasan multibaris dan Unicode utuh pada rekaman; tidak menjadi markup."

  @edge @priority-high @REQ-032 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-020 — Tidak ada penawaran alternatif menampilkan empty state
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Satu-satunya penawaran yang berlaku adalah OFFER-A yang sudah ditolak."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-offers
    Then sistem memverifikasi elemen "Harga Penawaran Lain" dengan kondisi "Daftar alternatif kosong dengan informasi yang dapat dipahami."
    # target: pilih-penawaran
    And sistem memverifikasi elemen "Pilih" dengan kondisi "Tidak ada Pilih yang enabled."
    # target: replacement-save
    And sistem memverifikasi elemen "Simpan" dengan kondisi "Tidak dapat menyimpan tanpa penawaran pengganti."

  @edge @priority-high @REQ-032 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-021 — Penolakan berulang mengecualikan seluruh penawaran terdahulu
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-A lalu OFFER-B sudah dipilih dan ditolak; OFFER-C masih tersedia."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-offers
    Then sistem memverifikasi elemen "Harga Penawaran Lain" dengan kondisi "Hanya OFFER-C dapat dipilih; OFFER-A dan OFFER-B tidak ditawarkan kembali."

  @edge @priority-high @REQ-034 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-022 — Vendor baru menolak setelah penggantian dan histori kedua vendor tetap ada
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "OFFER-B sudah berhasil mengganti OFFER-A; vendor B menolak dengan alasan valid."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order aktif shipper kembali Ditolak dengan vendor B."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "Histori penolakan vendor A tidak hilang; vendor B melihat penolakannya sendiri."

  @edge @priority-high @REQ-026 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-023 — Dua klik Simpan transaksi sama tidak menggandakan order
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Review valid; respons submit pertama ditunda hingga klik kedua, transaksi tetap TX-A."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: simpan
    And user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tepat satu order final untuk TX-A; tombol busy boleh mencegah klik kedua."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Menunggu Konfirmasi; tepat satu notifikasi vendor."

  @edge @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-EDG-024 — Multi armada FTL memerlukan pasangan kendaraan sopir setiap unit
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Order diterima dengan 2 unit; pasangan unit 1 valid, sopir unit 2 kosong."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: pilih-order
    When user mengklik elemen "ORD-AMS-001"
    # target: assignment-save
    And user mengklik elemen "Simpan"
    # target: sopir
    Then sistem memverifikasi elemen "Sopir" dengan kondisi "Required gagal pada Unit 2; Unit 1 tetap valid."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tidak ada penugasan parsial/sukses palsu menurut baseline."

  @stress @priority-high @REQ-003 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-001 — Lima puluh sesi membuat order independen dari lelang yang sama
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Semua 50 transaksi berbeda, clock sebelum akhir, data valid tiap sesi."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tepat 50 order unik untuk 50 transaksi berhasil; tidak saling menimpa."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Setiap order sukses pending dan satu notifikasi vendor per order."

  @stress @priority-high @REQ-007 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-002 — Simpan resume draft berulang menjaga data dan step
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Draft terisolasi tiap sesi; 10 sesi masing-masing 20 siklus simpan/buka ulang."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan "DO-SIKLUS"
    # target: draft
    And user mengklik elemen "Simpan ke Draf"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: action-order
    And user mengklik elemen "Action Order"
    # target: lanjut-draft
    And user mengklik elemen "Lanjutkan Draf"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Draft setelah tiap reopen tetap pada Data Barang dengan DO, barang/jumlah/nilai yang sama."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Tidak berubah menjadi order final atau mengirim notifikasi vendor."

  @stress @priority-medium @REQ-013 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-003 — Seratus unit armada tidak membuat jumlah card dan subtotal menyimpang
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner menyiapkan barang valid untuk seluruh unit jika beban didukung; profil bukan batas bisnis."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: jumlah-armada
    When user mengisi field "Jumlah Armada" dengan "100"
    # target: unit-cards
    Then sistem memverifikasi elemen "Unit Armada" dengan kondisi "Jika 100 didukung, tepat 100 card dapat diakses, tanpa data silang; jika batas lebih rendah, validasi rapi sebelum render."
    # target: jumlah-armada
    And sistem memverifikasi elemen "Jumlah Armada" dengan kondisi "Nilai jumlah/card konsisten; tidak crash/NaN."

  @stress @priority-medium @REQ-014 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-004 — Dua ratus tag DO tetap terikat pada unit aktif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner membentuk DO-001 hingga DO-200, dipisahkan koma."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: nomor-do
    When user mengisi field "Nomor DO" dengan "DO-001,DO-002,DO-003,DO-004,DO-005,DO-006,DO-007,DO-008,DO-009,DO-010,DO-011,DO-012,DO-013,DO-014,DO-015,DO-016,DO-017,DO-018,DO-019,DO-020,DO-021,DO-022,DO-023,DO-024,DO-025,DO-026,DO-027,DO-028,DO-029,DO-030,DO-031,DO-032,DO-033,DO-034,DO-035,DO-036,DO-037,DO-038,DO-039,DO-040,DO-041,DO-042,DO-043,DO-044,DO-045,DO-046,DO-047,DO-048,DO-049,DO-050,DO-051,DO-052,DO-053,DO-054,DO-055,DO-056,DO-057,DO-058,DO-059,DO-060,DO-061,DO-062,DO-063,DO-064,DO-065,DO-066,DO-067,DO-068,DO-069,DO-070,DO-071,DO-072,DO-073,DO-074,DO-075,DO-076,DO-077,DO-078,DO-079,DO-080,DO-081,DO-082,DO-083,DO-084,DO-085,DO-086,DO-087,DO-088,DO-089,DO-090,DO-091,DO-092,DO-093,DO-094,DO-095,DO-096,DO-097,DO-098,DO-099,DO-100,DO-101,DO-102,DO-103,DO-104,DO-105,DO-106,DO-107,DO-108,DO-109,DO-110,DO-111,DO-112,DO-113,DO-114,DO-115,DO-116,DO-117,DO-118,DO-119,DO-120,DO-121,DO-122,DO-123,DO-124,DO-125,DO-126,DO-127,DO-128,DO-129,DO-130,DO-131,DO-132,DO-133,DO-134,DO-135,DO-136,DO-137,DO-138,DO-139,DO-140,DO-141,DO-142,DO-143,DO-144,DO-145,DO-146,DO-147,DO-148,DO-149,DO-150,DO-151,DO-152,DO-153,DO-154,DO-155,DO-156,DO-157,DO-158,DO-159,DO-160,DO-161,DO-162,DO-163,DO-164,DO-165,DO-166,DO-167,DO-168,DO-169,DO-170,DO-171,DO-172,DO-173,DO-174,DO-175,DO-176,DO-177,DO-178,DO-179,DO-180,DO-181,DO-182,DO-183,DO-184,DO-185,DO-186,DO-187,DO-188,DO-189,DO-190,DO-191,DO-192,DO-193,DO-194,DO-195,DO-196,DO-197,DO-198,DO-199,DO-200"
    # target: nomor-do
    Then sistem memverifikasi elemen "Nomor DO" dengan kondisi "Jika 200 tag didukung semua tersimpan utuh pada Unit 1; jika dibatasi, validasi tidak memotong diam-diam."
    # target: tabel-barang
    And sistem memverifikasi elemen "Barang Unit" dengan kondisi "Data barang tidak rusak akibat payload tag."

  @stress @priority-medium @REQ-017 @screen-data-barang
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-005 — Lima ratus baris barang menghitung total tanpa kehilangan presisi
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner memilih 500 SKU berbeda dari master, per baris berat 1 kg volume 0,001 m³ qty=1; kapasitas cukup."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Data Barang; route: {{routes.data-barang}}
    Given user berada di halaman "Buat Order - Data Barang"
    # target: pilih-barang
    When user mengklik elemen "Pilih Barang"
    # target: gunakan-barang
    And user mengklik elemen "Pilih"
    # target: tabel-barang
    Then sistem memverifikasi elemen "Barang Unit" dengan kondisi "Jika 500 didukung semua baris hadir; jika dibatasi validasi rapi."
    # target: total-berat
    And sistem memverifikasi elemen "Total Berat" dengan kondisi "500 kg untuk 500 baris yang diterima."
    # target: total-kubikasi
    And sistem memverifikasi elemen "Total Kubikasi" dengan kondisi "0,5 m³ untuk 500 baris yang diterima; tidak hilang saat scroll."

  @stress @priority-medium @REQ-005 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-006 — Sepuluh ribu order mempertahankan filter sort dan pagination
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dataset 10.000 order fixture bercampur direct/lelang/status; 20 sesi menjalankan filter dan paging."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: filter-lelang
    When user mengisi field "No. Lelang" dengan "FTL-NRM-01/AMS010"
    # target: filter-status
    And user memilih opsi "Menunggu Konfirmasi" pada field "Status"
    # target: terapkan
    And user mengklik elemen "Terapkan"
    # target: sort-harga
    And user mengklik elemen "Total Harga"
    # target: page-next
    And user mengklik elemen "Halaman berikutnya"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Hasil/paging tepat dataset terfilter tanpa duplikat/hilang dan tanpa kebocoran tenant."
    # target: no-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "Relasi ID order/lelang tetap benar; durasi dan error dicatat."

  @stress @priority-medium @REQ-010 @screen-data-pengiriman
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-007 — Catatan panjang tidak merusak penyimpanan PIC dan rute
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Payload catatan 10.000 karakter Unicode; PIC/nomor valid."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Data Pengiriman; route: {{routes.data-pengiriman}}
    Given user berada di halaman "Buat Order - Data Pengiriman"
    # target: catatan-pengirim
    When user mengisi field "Catatan" dengan "{{testData.longNote}}"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: catatan-pengirim
    Then sistem memverifikasi elemen "Catatan" dengan kondisi "Jika panjang didukung tersimpan utuh; jika batas lebih kecil validasi jelas, tanpa pemotongan diam-diam."
    # target: shipping-readonly
    And sistem memverifikasi elemen "Data Lelang dan Rute" dengan kondisi "Rute/PIC tidak rusak; tidak menjalankan teks sebagai markup."

  @stress @priority-high @REQ-029 @screen-konfirmasi-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-008 — Keputusan Terima Tolak paralel hanya mengubah pending sekali
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "20 konteks vendor A membuka order pending yang sama; separuh memilih Terima, separuh Tolak dengan alasan valid."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Konfirmasi Order; route: {{routes.konfirmasi-order}}
    Given user berada di halaman "Konfirmasi Order"
    # target: terima
    When user mengklik elemen "Terima Order"
    # target: confirmation-save
    And user mengklik elemen "Simpan"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Tepat satu keputusan terminal memenangkan commit: Ditolak atau Menunggu Penugasan; respons lain konflik."
    # target: confirmation-dialog
    And sistem memverifikasi elemen "Konfirmasi Order" dengan kondisi "Tidak ada sukses palsu atau penugasan yang terbentuk untuk keputusan Ditolak."

  @stress @priority-high @REQ-026 @screen-review
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-009 — Timeout setelah commit lalu retry tidak menggandakan order
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner memutus respons setelah create-order commit; retry memakai transaksi yang sama."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Buat Order - Review; route: {{routes.review}}
    Given user berada di halaman "Buat Order - Review"
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: simpan
    And user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Tepat satu order untuk transaksi yang sudah commit; retry memulihkan hasil atau memberi informasi konsisten."
    # target: status-order
    And sistem memverifikasi elemen "Status Order" dengan kondisi "Pending dan satu notifikasi vendor; data review tidak hilang."

  @stress @priority-high @REQ-034 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-010 — Simpan penggantian paralel mempertahankan satu vendor aktif
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "10 sesi shipper membuka penggantian order Ditolak sama; pilihan OFFER-B atau OFFER-C berbeda."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: pilih-penawaran
    When user mengklik elemen "Pilih"
    # target: replacement-save
    And user mengklik elemen "Simpan"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Tepat satu penggantian valid menang dari versi Ditolak; order aktif pending pada satu vendor."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "Riwayat vendor A tetap; tidak ada notifikasi sukses untuk vendor kalah."

  @stress @priority-medium @REQ-032 @screen-pilih-penawaran-lain
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-011 — Sepuluh ribu penawaran tetap mengecualikan penawaran terdahulu
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Dataset 10.000 penawaran lelang terkait serta penawaran lelang lain; runner menelusuri semua halaman hasil."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Pilih Penawaran Lain; route: {{routes.pilih-penawaran-lain}}
    Given user berada di halaman "Pilih Penawaran Lain"
    # target: replacement-offers
    Then sistem memverifikasi elemen "Harga Penawaran Lain" dengan kondisi "Tidak ada OFFER-A atau penawaran lelang lain pada semua halaman; setiap alternatif valid dapat diakses."
    # target: pilih-penawaran
    And sistem memverifikasi elemen "Pilih" dengan kondisi "Pilihan menjaga offerId vendor dan harga yang tepat pada review."

  @stress @priority-high @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-012 — Penugasan paralel order sama mengikuti konsistensi baseline
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "10 sesi vendor A memilih order diterima sama; armada/sopir tiap sesi valid baseline."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: pilih-order
    When user mengklik elemen "ORD-AMS-001"
    # target: no-polisi
    And user memilih opsi "L-1234-AMS" pada field "No. Polisi"
    # target: sopir
    And user memilih opsi "SOPIR-01" pada field "Sopir"
    # target: assignment-save
    And user mengklik elemen "Simpan"
    # target: assignment-detail-order
    Then sistem memverifikasi elemen "Detail Data Order" dengan kondisi "Hanya penugasan yang diizinkan baseline terbentuk, tidak ada duplikasi akibat stale submit."
    # target: jadwal
    And sistem memverifikasi elemen "Jadwal" dengan kondisi "Tidak ada input jadwal FTL yang muncul pada konflik/beban."

  @stress @priority-medium @REQ-031 @screen-daftar-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-STR-013 — Riwayat penolakan banyak vendor tetap terisolasi setelah banyak penggantian
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Runner menyiapkan 100 order dengan 3 penolakan dan penggantian sukses per order pada vendor berbeda."
    And prasyarat "Runner menjalankan operasi pada steps sesuai workload (sessions/iterations/payload) di testData; tiap sesi memakai data dan konteks terisolasi. Catat durasi/error; tidak ada SLA numerik dari spec."
    # target: Daftar Order; route: {{routes.daftar-order}}
    Given user berada di halaman "Daftar Order"
    # target: tabel-order
    Then sistem memverifikasi elemen "Daftar Order" dengan kondisi "Shipper melihat hanya versi aktif; tiap vendor melihat penolakan miliknya tanpa data vendor lain."
    # target: inactive-record
    And sistem memverifikasi elemen "Order Ditolak" dengan kondisi "300 rekaman penolakan fixture tersedia di riwayat shipper sesuai commit, tanpa hilang/duplikat."

  @positive @priority-high @REQ-004 @screen-detail-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-055 — Detail Order menjaga relasi lelang dan data setelah vendor menerima
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper A membuka order lelang yang telah diterima vendor A; fixture Step 01/02/03 tersimpan."
    # target: Detail Order; route: {{routes.detail-order}}
    Given user berada di halaman "Detail Order"
    # target: detail-order
    Then sistem memverifikasi elemen "Detail Order" dengan kondisi "Heading Detail Order terlihat."
    # target: detail-order-data
    And sistem memverifikasi elemen "Detail Data Order" dengan kondisi "ID/No. Lelang, FTL, PIC, barang, muat dan harga sesuai order tersimpan; status Menunggu Penugasan."

  @negative @priority-high @REQ-004 @screen-detail-order
  Scenario: AMS010-ORDER-FTL-SHIPPER-NEG-055 — Detail order milik shipper lain tidak membocorkan No Lelang
    Given prasyarat "User login sebagai shipper-B; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Shipper B mencoba route orderId milik shipper A; tenant berbeda."
    # target: Detail Order; route: {{routes.detail-order}}
    Given user berada di halaman "Detail Order"
    # target: detail-order-data
    Then sistem memverifikasi elemen "Detail Data Order" dengan kondisi "Data order, No. Lelang, PIC dan harga tidak dapat diakses; penolakan akses sesuai implementasi."

  @positive @priority-high @REQ-026 @screen-detail-harga-penawaran
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-056 — Alur lengkap shipper mengisi semua step lalu menyimpan order FTL
    Given prasyarat "User login sebagai shipper-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Lelang Normal insured=true, OFFER-A valid; barang master tersedia; Step 02 default satu armada; pajak fixture untuk satu unit PPN=66000/PPh=120000."
    # target: Detail Harga Penawaran; route: {{routes.detail-harga-penawaran}}
    Given user berada di halaman "Detail Harga Penawaran"
    # target: lelang-heading
    Then sistem memverifikasi elemen "Detail Harga Penawaran" dengan kondisi "Detail Harga Penawaran terlihat."
    # target: pesan
    When user mengklik elemen "Pesan"
    # target: pic-pengirim
    And user mengisi field "PIC Pengirim" dengan "Widyawati"
    # target: wa-pengirim
    And user mengisi field "No. WhatsApp PIC" dengan "0812677827823"
    # target: pic-penerima
    And user mengisi field "PIC Penerima" dengan "Marwanto"
    # target: wa-penerima
    And user mengisi field "No. WhatsApp PIC" dengan "089436546675"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: jumlah-armada
    And user mengisi field "Jumlah Armada" dengan "1"
    # target: pilih-barang
    And user mengklik elemen "Pilih Barang"
    # target: master-barang
    Then sistem memverifikasi elemen "Pilih Barang" dengan kondisi "Dialog Pilih Barang terlihat."
    # target: sku
    When user mengklik elemen "SKU-PPR-001"
    # target: gunakan-barang
    And user mengklik elemen "Pilih"
    # target: jumlah-barang
    And user mengisi field "Jumlah" dengan "200"
    # target: nilai-barang
    And user mengisi field "Nilai Barang" dengan "100000"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: tanggal-muat
    And user mengisi field "Tanggal Permintaan Muat" dengan "08/10/2026 14:30"
    # target: next
    And user mengklik elemen "Selanjutnya"
    # target: review-data
    Then sistem memverifikasi elemen "Review Order" dengan kondisi "Satu unit: berat 2500 kg, kubikasi 3,6 m³, nilai Rp20.000.000; DPP Rp6.000.000, PPN Rp66.000, PPh Rp120.000, Asuransi Rp200.000, Total Rp6.146.000."
    # target: simpan
    When user mengklik elemen "Simpan"
    # target: Daftar Order; route: {{routes.daftar-order}}
    When user berada di halaman "Daftar Order"
    # target: order-menu
    And user mengklik elemen "Order"
    # target: status-order
    Then sistem memverifikasi elemen "Status Order" dengan kondisi "Order Menunggu Konfirmasi; tepat satu notifikasi Vendor A."
    # target: no-lelang
    And sistem memverifikasi elemen "No. Lelang" dengan kondisi "No. Lelang berada di bawah ID order baru."

  @positive @priority-medium @REQ-035 @screen-tambah-penugasan
  Scenario: AMS010-ORDER-FTL-SHIPPER-POS-057 — Navigasi Penugasan Tracking menjaga konteks vendor dan order FTL
    Given prasyarat "User login sebagai vendor-A; data hanya milik tenant fixture."
    And prasyarat "Clock browser dan server dikendalikan sesuai testData.clock; semua tanggal/waktu bisnis WIB."
    And prasyarat "Vendor A login; order Menunggu Penugasan; menu mengarah halaman daftar penugasan baseline."
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    Given user berada di halaman "Tambah Penugasan"
    # target: assignment-menu
    When user mengklik elemen "Penugasan Tracking"
    # target: Tambah Penugasan; route: {{routes.tambah-penugasan}}
    When user berada di halaman "Tambah Penugasan"
    # target: assignment-heading
    Then sistem memverifikasi elemen "Tambah Penugasan" dengan kondisi "Tambah Penugasan terlihat."
    # target: cari-order
    And sistem memverifikasi elemen "Cari Order" dengan kondisi "Pencarian order tersedia sesuai desain; hanya order eligible vendor A."
