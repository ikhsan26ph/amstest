# language: id
Feature: Input Harga Penawaran Vendor FTL dan FCL
  Sebagai vendor peserta lelang Spot Rate
  Saya ingin mengelola harga penawaran selama periode yang diizinkan
  Agar penawaran saya tercatat aman, akurat, dan masuk perhitungan Live Bidding

  @positive @priority-high @REQ-001 @screen-daftar-lelang
  Scenario: [AMS004-POS-001] Vendor hanya melihat lelang undangan dan harga miliknya
    Given user berada di halaman "Daftar Lelang"
    Then sistem menampilkan "FCL-NRM-01/200526" pada "Daftar Lelang"
    When user mengklik tombol "Detail" untuk "FCL-NRM-01/200526"
    Then sistem menampilkan "harga milik Vendor A" pada "Harga Penawaran"

  @negative @priority-high @REQ-001 @screen-detail-lelang-spot-rate
  Scenario: [AMS004-NEG-001] Vendor tidak dapat membuka lelang yang tidak mengundangnya melalui URL langsung
    Given user berada di halaman "URL Detail FCL-PRIVATE-02"
    Then sistem menampilkan "Lelang tidak ditemukan atau Anda tidak memiliki akses" pada "Akses ditolak"
    And sistem menampilkan "tidak tampil" pada "Data vendor"

  @positive @priority-medium @REQ-002 @screen-daftar-lelang
  Scenario: [AMS004-POS-002] Tab, filter, legend, counter, dan pagination Daftar Lelang berfungsi
    Given user berada di halaman "Daftar Lelang"
    When user mengklik tombol "Filter"
    And user memilih "Sedang Buka" pada field "Status"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "status Sedang Buka" pada "Card lelang"
    When user mengklik tombol "Lelang Ulang"
    Then sistem menampilkan "sesuai jumlah data" pada "Counter Lelang Ulang"
    When user memilih "20" pada field "Tampilkan"
    Then sistem menampilkan "1 - 20 data" pada "Pagination"

  @negative @priority-medium @REQ-002 @screen-daftar-lelang
  Scenario: [AMS004-NEG-002] Tab Request Jadwal tidak memasukkan lelang FTL atau data tanpa request
    Given user berada di halaman "Daftar Lelang"
    When user mengklik tombol "Request Jadwal"
    Then sistem menampilkan "tidak memuat FTL dan FCL tanpa request" pada "Daftar Request Jadwal"

  @positive @priority-medium @REQ-003 @screen-detail-lelang-spot-rate
  Scenario: [AMS004-POS-003] Detail FCL menampilkan data read-only dan fitur daftar harga vendor
    Given user berada di halaman "Detail Lelang Spot Rate"
    When user mengklik tombol "Syarat & Ketentuan"
    And user mengklik tombol "Data Pengirim"
    And user mengklik tombol "Data Penerima"
    And user mengklik tombol "Filter"
    And user mengklik tombol "Urutkan"
    And user mengklik tombol "Detail Biaya"
    And user mengklik tombol "Info Connecting"
    Then sistem menampilkan "data lelang read-only dan harga vendor" pada "Detail Lelang Spot Rate"

  @negative @priority-high @REQ-003 @screen-detail-lelang-spot-rate
  Scenario: [AMS004-NEG-003] Manipulasi filter detail tidak dapat menampilkan harga vendor lain
    Given user berada di halaman "Detail Lelang Spot Rate"
    When user mengklik tombol "Filter"
    And user mengisi field "Vendor" dengan "Vendor B"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "tidak ada harga Vendor B" pada "Harga Penawaran"

  @positive @priority-high @REQ-004 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-004] Dua jalur membuka form menghasilkan konteks No. Lelang yang benar
    Given user berada di halaman "Detail Lelang Spot Rate"
    When user mengklik tombol "Input Harga"
    Then sistem menampilkan "FCL-NRM-01/200526; disabled" pada "No. Lelang"
    When user berada di halaman "Daftar Penawaran"
    And user mengklik tombol "Input Harga"
    Then sistem menampilkan "kosong; enabled" pada "No. Lelang"

  @negative @priority-high @REQ-004 @screen-daftar-lelang
  Scenario: [AMS004-NEG-004] Input Harga pada lelang di luar Sedang Buka ditolak
    Given user berada di halaman "Daftar Lelang"
    When user mengklik tombol "Aksi FCL-NRM-CLOSED"
    And user mengklik tombol "Input Harga Penawaran"
    Then sistem menampilkan "Harga penawaran sudah melewati tanggal tutup lelang" pada "Alert"
    When user mengklik tombol "Mengerti"

  @positive @priority-medium @REQ-005 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-005] Pemilihan lelang menampilkan informasi FCL dan detail multipoint
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user memilih "FCL-MULTI-01" pada field "No. Lelang"
    Then sistem menampilkan "FCL, jumlah kontainer, jenis, asuransi, biaya, POL dan POD" pada "Informasi Umum"
    When user mengklik tombol "Multipickup"
    Then sistem menampilkan "Muat 1 dan Muat 2 beserta kota, drop point, alamat" pada "Detail Multipickup"
    When user mengklik tombol "Tutup"
    And user mengklik tombol "Multidrop"
    Then sistem menampilkan "daftar Bongkar" pada "Detail Multidrop"

  @negative @priority-high @REQ-005 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-005] Dropdown No. Lelang mengecualikan lelang tidak eligible
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "No. Lelang"
    Then sistem menampilkan "hanya lelang Sedang Buka yang mengundang vendor" pada "Pilihan No. Lelang"

  @positive @priority-high @REQ-006 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-006] Vendor mengisi satu baris harga FCL valid
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user memilih "FCL-NRM-01/200526" pada field "No. Lelang"
    And user memilih "ASDP" pada field "Pelayaran"
    And user memilih "20 Feet Dry" pada field "Jenis Kontainer"
    And user mengisi field "Harga" dengan "12000000"
    Then sistem menampilkan "Rp 12.000.000" pada "Harga"
    And sistem menampilkan "default master dan disabled" pada "PPN dan PPh"
    When user mengisi field "Mulai Berlaku" dengan "24/09/2026"
    And user mengisi field "Deskripsi Harga" dengan "Termasuk biaya operasional"

  @negative @priority-high @REQ-006 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-006] Baris FCL kosong, harga nol, dan tanggal lampau ditolak
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user memilih "FCL-NRM-01/200526" pada field "No. Lelang"
    And user mengisi field "Harga" dengan "0"
    And user mengisi field "Mulai Berlaku" dengan "22/09/2026"
    And user mengklik tombol "Simpan"
    Then sistem menampilkan "Pelayaran wajib; Jenis Kontainer wajib; Harga harus lebih dari 0; tanggal tidak boleh lampau" pada "Validasi form"

  @positive @priority-high @REQ-007 @screen-input-harga-penawaran-ftl
  Scenario: [AMS004-POS-007] Vendor mengisi satu baris harga FTL valid
    Given user berada di halaman "Input Harga Penawaran FTL"
    When user memilih "FTL-NRM-01/200526" pada field "No. Lelang"
    Then sistem menampilkan "Tronton Box; disabled" pada "Jenis Kendaraan"
    When user mengisi field "Harga" dengan "12000000"
    And user mengisi field "Mulai Berlaku" dengan "24/09/2026"
    And user mengisi field "Estimasi Pengiriman" dengan "4"
    And user mengisi field "Deskripsi Harga" dengan "Muatan reguler"

  @negative @priority-high @REQ-007 @screen-input-harga-penawaran-ftl
  Scenario: [AMS004-NEG-007] Estimasi nol dan harga nonnumeric pada FTL ditolak
    Given user berada di halaman "Input Harga Penawaran FTL"
    When user memilih "FTL-NRM-01/200526" pada field "No. Lelang"
    And user mengisi field "Harga" dengan "dua belas juta"
    And user mengisi field "Estimasi Pengiriman" dengan "0"
    And user mengklik tombol "Simpan"
    Then sistem menampilkan "Harga wajib numeric dan Estimasi Pengiriman minimal 1 jam" pada "Validasi form"

  @positive @priority-high @REQ-008 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-008] Dua baris dengan kombinasi sama dan tanggal berbeda tersimpan terpisah
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user memilih "FCL-NRM-01/200526" pada field "No. Lelang"
    And user mengklik tombol "Tambah Baris Input"
    And user memilih "ASDP" pada field "Pelayaran baris 1"
    And user memilih "20 Feet Dry" pada field "Jenis Kontainer baris 1"
    And user mengisi field "Harga baris 1" dengan "12000000"
    And user mengisi field "Mulai Berlaku baris 1" dengan "24/09/2026"
    And user memilih "ASDP" pada field "Pelayaran baris 2"
    And user memilih "20 Feet Dry" pada field "Jenis Kontainer baris 2"
    And user mengisi field "Harga baris 2" dengan "12000000"
    And user mengisi field "Mulai Berlaku baris 2" dengan "30/09/2026"
    And user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "dua card harga terpisah" pada "Daftar Penawaran"

  @negative @priority-high @REQ-008 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-008] Satu baris invalid menggagalkan penyimpanan seluruh batch
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Simpan"
    Then sistem menampilkan "field wajib" pada "Validasi baris 2"
    And sistem menampilkan "tidak ada record baru dari baris 1 maupun baris 2" pada "Daftar Penawaran"

  @positive @priority-high @REQ-009 @screen-input-harga-penawaran-ftl
  Scenario: [AMS004-POS-009] Simpan FTL menghitung pajak, memperbarui status, dan Live Bidding
    Given user berada di halaman "Input Harga Penawaran FTL"
    When user mengisi field "Harga" dengan "12000000"
    And user mengisi field "Mulai Berlaku" dengan "24/09/2026"
    And user mengisi field "Estimasi Pengiriman" dengan "4"
    And user mengklik tombol "Simpan"
    Then sistem menampilkan "Apakah Harga Telah Sesuai?" pada "Dialog konfirmasi"
    When user mengklik tombol "Ya"
    Then sistem menampilkan "Harga penawaran berhasil disimpan" pada "Toast"
    And sistem menampilkan "total termasuk PPN dan PPh serta status Input Penawaran" pada "Daftar Penawaran"
    When user berada di halaman "Live Bidding Spot Rate"
    Then sistem menampilkan "harga termurah per jenis kendaraan" pada "Peringkat vendor"

  @negative @priority-high @REQ-009 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-009] Lelang yang tutup saat konfirmasi tidak menyimpan harga
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Simpan"
    Then sistem menampilkan "Apakah Harga Telah Sesuai?" pada "Dialog konfirmasi"
    When user mengklik tombol "Ya"
    Then sistem menampilkan "Harga penawaran sudah melewati tanggal tutup lelang" pada "Alert"

  @positive @priority-high @REQ-010 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-010] Input pada lelang ulang mengkadaluwarsakan harga lama
    Given user berada di halaman "Input Harga Penawaran FCL"
    Then sistem menampilkan "read-only" pada "Harga sebelumnya"
    When user mengisi field "Harga" dengan "12500000"
    And user mengisi field "Mulai Berlaku" dengan "30/09/2026"
    And user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "harga baru aktif dan harga lama berbadge Kadaluwarsa" pada "Daftar Penawaran"

  @negative @priority-medium @REQ-010 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-010] Harga lama lelang ulang tidak dapat diedit atau dipakai ulang
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Harga sebelumnya"
    Then sistem menampilkan "tidak dapat diubah dan tidak ada tombol Gunakan Harga Sebelumnya" pada "Kontrol harga lama"

  @positive @priority-medium @REQ-011 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-POS-011] Konfirmasi Batal mengembalikan vendor tanpa menyimpan
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengisi field "Harga" dengan "12000000"
    And user mengklik tombol "Batal"
    Then sistem menampilkan "Batalkan input harga?" pada "Dialog konfirmasi batal"
    When user mengklik tombol "Ya"
    Then sistem menampilkan "halaman asal" pada "Detail Lelang Spot Rate"

  @negative @priority-medium @REQ-011 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-NEG-011] Menolak konfirmasi Batal mempertahankan data form
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Batal"
    Then sistem menampilkan "Batalkan input harga?" pada "Dialog konfirmasi batal"
    When user mengklik tombol "Tidak"
    Then sistem menampilkan "Rp 12.000.000" pada "Harga"
    And sistem menampilkan "form tetap terbuka" pada "Input Harga Penawaran"

  @positive @priority-high @REQ-012 @screen-edit-harga-penawaran
  Scenario: [AMS004-POS-012] Edit harga saat lelang buka membuat versi baru dan riwayat
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Aksi penawaran"
    And user mengklik tombol "Edit Harga"
    Then sistem menampilkan "satu baris tanpa Tambah Baris Input" pada "Edit Harga Penawaran"
    When user mengisi field "Harga" dengan "13000000"
    And user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    And user mengklik tombol "Riwayat Perubahan"
    Then sistem menampilkan "harga lama dan harga baru" pada "Riwayat Perubahan"
    And sistem menampilkan "badge Tidak Berlaku" pada "Harga lama"

  @negative @priority-high @REQ-012 @screen-daftar-penawaran
  Scenario: [AMS004-NEG-012] Edit Harga setelah lelang tutup menampilkan alert
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Aksi penawaran"
    And user mengklik tombol "Edit Harga"
    Then sistem menampilkan "Harga penawaran sudah melewati tanggal tutup lelang" pada "Tidak Dapat Mengedit Data"
    When user mengklik tombol "Mengerti"

  @positive @priority-high @REQ-013 @screen-daftar-penawaran
  Scenario: [AMS004-POS-013] Hapus harga FCL terakhir menghapus jadwal dan mengembalikan status
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Aksi penawaran"
    And user mengklik tombol "Hapus Harga"
    Then sistem menampilkan "Hapus harga penawaran?" pada "Dialog konfirmasi hapus"
    When user mengklik tombol "Ya"
    Then sistem menampilkan "harga terpilih tidak tampil" pada "Daftar Penawaran"
    When user mengklik tombol "Riwayat Perubahan"
    Then sistem menampilkan "soft delete" pada "Riwayat Perubahan"
    And sistem menampilkan "Belum Input" pada "Status vendor"

  @negative @priority-high @REQ-013 @screen-daftar-penawaran
  Scenario: [AMS004-NEG-013] Hapus Harga setelah lelang tutup ditolak
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Aksi penawaran"
    And user mengklik tombol "Hapus Harga"
    Then sistem menampilkan "Harga penawaran sudah melewati tanggal tutup lelang" pada "Alert"

  @positive @priority-medium @REQ-014 @screen-daftar-penawaran
  Scenario: [AMS004-POS-014] Daftar Penawaran memfilter, mengurutkan, dan menampilkan detail/action sesuai kondisi
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Filter"
    And user memilih "FCL" pada field "Jenis Pengiriman"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "hanya FCL; terbaru lebih dulu" pada "Card penawaran"
    When user mengklik tombol "Belum Input Jadwal"
    And user mengklik tombol "Detail Harga"
    And user mengklik tombol "Info Connecting"
    And user mengklik tombol "Penawaran Lengkap"
    And user mengklik tombol "Request Jadwal"
    And user mengklik tombol "Kadaluwarsa"
    And user mengklik tombol "Aksi penawaran"
    Then sistem menampilkan "Tambah Jadwal, Lihat Jadwal, Respon Request Jadwal, Riwayat Perubahan" pada "Menu aksi"

  @negative @priority-medium @REQ-014 @screen-daftar-penawaran
  Scenario: [AMS004-NEG-014] Action jadwal di luar kondisi yang diizinkan tetap terlihat tetapi ditolak
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Aksi penawaran"
    And user mengklik tombol "Tambah Jadwal"
    Then sistem menampilkan "Aksi jadwal tidak dapat dilakukan" pada "Alert"
    When user mengklik tombol "Mengerti"

  @edge @priority-high @REQ-006 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-EDG-001] Batas minimum harga satu Rupiah dan tanggal hari ini diterima
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengisi field "Harga" dengan "1"
    And user mengisi field "Mulai Berlaku" dengan "23/09/2026"
    And user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "Rp 1 dan penawaran aktif" pada "Daftar Penawaran"

  @edge @priority-medium @REQ-007 @screen-input-harga-penawaran-ftl
  Scenario: [AMS004-EDG-002] Batas minimum estimasi satu jam diterima dan angka besar diformat
    Given user berada di halaman "Input Harga Penawaran FTL"
    When user mengisi field "Harga" dengan "999999999999"
    And user mengisi field "Estimasi Pengiriman" dengan "1"
    And user mengisi field "Mulai Berlaku" dengan "23/09/2026"
    Then sistem menampilkan "Rp 999.999.999.999" pada "Harga"
    When user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "estimasi 1 jam" pada "Daftar Penawaran"

  @edge @priority-medium @REQ-008 @screen-input-harga-penawaran-ftl
  Scenario: [AMS004-EDG-003] Ikon hapus mengikuti transisi jumlah baris satu dan dua
    Given user berada di halaman "Input Harga Penawaran FTL"
    Then sistem menampilkan "tidak tampil" pada "Hapus baris 1"
    When user mengklik tombol "Tambah Baris Input"
    Then sistem menampilkan "tampil" pada "Hapus baris 1 dan 2"
    When user mengklik tombol "Hapus baris 2"
    Then sistem menampilkan "tidak tampil" pada "Hapus baris 1"

  @edge @priority-high @REQ-009 @screen-live-bidding-spot-rate
  Scenario: [AMS004-EDG-004] Live Bidding memakai harga termurah vendor untuk tiap jenis
    Given user berada di halaman "Live Bidding Spot Rate"
    When user mengklik tombol "Filter"
    And user mengisi field "No. Lelang" dengan "FTL-NRM-01/200526"
    And user mengklik tombol "Terapkan"
    Then sistem menampilkan "hanya Rp 12.000.000 mewakili Vendor A untuk Tronton Box" pada "Peringkat vendor"

  @edge @priority-high @REQ-010 @screen-daftar-penawaran
  Scenario: [AMS004-EDG-005] Tanggal berlaku aktif secara inklusif lalu expired hari berikutnya
    Given user berada di halaman "Daftar Penawaran pada 23/09/2026"
    Then sistem menampilkan "Aktif" pada "Penawaran"
    When user berada di halaman "Daftar Penawaran pada 24/09/2026"
    Then sistem menampilkan "Expired atau Kadaluwarsa" pada "Penawaran"

  @edge @priority-medium @REQ-014 @screen-daftar-penawaran
  Scenario: [AMS004-EDG-006] Data ke-21 muncul di halaman kedua dan urutan terbaru konsisten
    Given user berada di halaman "Daftar Penawaran"
    When user memilih "20" pada field "Tampilkan"
    Then sistem menampilkan "20 card dengan tanggal terbaru lebih dulu" pada "Halaman 1"
    When user mengklik tombol "Halaman 2"
    Then sistem menampilkan "1 card tertua" pada "Halaman 2"
    When user mengklik tombol "Reset"
    Then sistem menampilkan "kembali default" pada "Filter"

  @stress @priority-medium @REQ-008 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-STR-001] Lima puluh baris harga tersimpan atomik dalam satu submit
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Tambah Baris Input" untuk "hingga 50 baris"
    And user mengklik tombol "Simpan"
    And user mengklik tombol "Ya"
    Then sistem menampilkan "50 card baru tanpa duplikat atau baris hilang" pada "Daftar Penawaran"

  @stress @priority-high @REQ-009 @screen-live-bidding-spot-rate
  Scenario: [AMS004-STR-002] Dua puluh vendor menyimpan serentak tanpa kebocoran atau urutan salah
    Given user berada di halaman "Input Harga Penawaran pada 20 sesi paralel"
    When user mengklik tombol "Simpan pada semua sesi"
    And user mengklik tombol "Ya pada semua sesi"
    Then sistem menampilkan "20 penawaran terproses dan urutan termurah benar" pada "Live Bidding Spot Rate"
    And sistem menampilkan "masing-masing hanya melihat harga sendiri" pada "Sesi vendor"

  @stress @priority-medium @REQ-014 @screen-daftar-penawaran
  Scenario: [AMS004-STR-003] Sepuluh ribu penawaran tetap dapat difilter dan dipaginasi konsisten
    Given user berada di halaman "Daftar Penawaran"
    When user mengklik tombol "Filter"
    And user memilih "FCL" pada field "Jenis Pengiriman"
    And user memilih "Sedang Buka" pada field "Status Lelang"
    And user mengklik tombol "Terapkan"
    And user memilih "20" pada field "Tampilkan"
    And user mengklik tombol "Halaman terakhir"
    Then sistem menampilkan "total, rentang, dan data tanpa duplikat" pada "Pagination"
    When user mengklik tombol "Kadaluwarsa"
    Then sistem menampilkan "hanya data kadaluwarsa" pada "Daftar Penawaran"

  @stress @priority-low @REQ-006 @screen-input-harga-penawaran-fcl
  Scenario: [AMS004-STR-004] Pencarian master pelayaran besar tidak menggandakan atau kehilangan opsi
    Given user berada di halaman "Input Harga Penawaran FCL"
    When user mengklik tombol "Pelayaran"
    And user mengisi field "Cari Pelayaran" dengan "ASDP"
    Then sistem menampilkan "semua kecocokan aktif unik dan tanpa master nonaktif" pada "Hasil Pelayaran"
    When user memilih "ASDP" pada field "Pelayaran"


