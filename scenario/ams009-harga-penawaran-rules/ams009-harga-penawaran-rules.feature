Feature: Regresi rule Harga Penawaran 2026-10-05

  @positive @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0001] Input pertama FCL tersimpan
    Given Buka Input Harga pada lelang FCL Sedang Buka buatan run.
    When Isi Pelayaran A, Kontainer X, harga valid, masa berlaku hari ini.
    And Simpan dan konfirmasi Ya.
    Then Satu penawaran tersimpan dan dapat dilihat kembali.

  @negative @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0002] Duplikasi FCL dalam satu submit ditolak
    Given Gunakan lelang FCL buatan run tanpa harga untuk kombinasi B/X.
    When Isi dua baris Pelayaran B dan Kontainer X dengan harga/tanggal berbeda.
    And Simpan dan konfirmasi bila tersedia.
    Then Duplikasi ditolak; tidak terbentuk dua penawaran kombinasi yang sama.

  @negative @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0003] Duplikasi FCL tersimpan ditolak meski harga dan tanggal berbeda
    Given Catat ID dan jumlah penawaran A/X yang sudah tersimpan.
    When Input lagi A/X dengan harga dan masa berlaku berbeda.
    And Simpan lalu baca ulang penawaran.
    Then Input kedua ditolak; ID, jumlah, harga, dan status penawaran pertama tidak berubah.

  @positive @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0004] FCL pelayaran berbeda dengan kontainer sama diizinkan
    Given Input kombinasi Pelayaran C/Kontainer X di lelang yang sudah memiliki A/X.
    When Simpan dan baca ulang data.
    Then A/X dan C/X tersimpan sebagai penawaran berbeda.

  @positive @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0005] FCL pelayaran sama dengan kontainer berbeda diizinkan
    Given Gunakan lelang FCL yang membuka Kontainer X dan Y.
    When Input A/Y setelah A/X tersimpan.
    Then A/X dan A/Y dapat tersimpan terpisah.

  @positive @priority-high @REQ-002 @SCR-01
  Scenario: [SCN-0006] Input pertama FTL tersimpan
    Given Input harga Jenis Armada X pada lelang FTL Sedang Buka buatan run.
    When Simpan dan konfirmasi Ya.
    Then Satu penawaran Armada X tersimpan.

  @negative @priority-high @REQ-002 @SCR-01
  Scenario: [SCN-0007] Duplikasi FTL dalam satu submit ditolak
    Given Isi dua baris untuk Armada Y yang belum punya harga, dengan harga/tanggal berbeda.
    When Simpan dan konfirmasi bila tersedia.
    Then Duplikasi ditolak; tidak terbentuk dua penawaran Armada Y.

  @negative @priority-high @REQ-002 @SCR-01
  Scenario: [SCN-0008] Duplikasi FTL tersimpan ditolak meski harga dan tanggal berbeda
    Given Catat penawaran Armada X.
    When Input lagi Armada X dengan harga dan tanggal berbeda.
    And Simpan dan baca ulang.
    Then Input kedua ditolak; data pertama tidak berubah.

  @positive @priority-high @REQ-002 @SCR-01
  Scenario: [SCN-0009] FTL armada berbeda diizinkan
    Given Input Armada Y setelah Armada X tersimpan pada lelang yang membuka keduanya.
    Then Masing-masing jenis armada dapat memiliki satu harga vendor.

  @positive @priority-high @REQ-001 @SCR-01
  Scenario: [SCN-0010] Kombinasi sama di lelang berbeda diizinkan
    Given Input A/X pada lelang FCL buatan run lainnya.
    Then Keunikan dibatasi per lelang; penawaran dapat tersimpan.

  @edge @priority-high @REQ-003 @SCR-02
  Scenario: [SCN-0011] Harga lama belum Kadaluwarsa sebelum harga ulang disimpan
    Given Tutup putaran awal fixture buatan run yang telah memiliki harga.
    When Mulai Lelang Ulang dan tunggu Sedang Buka.
    And Baca harga lama sebelum menyimpan harga baru.
    Then Pembukaan Lelang Ulang saja tidak membuat harga lama Kadaluwarsa.

  @positive @priority-high @REQ-003 @SCR-01
  Scenario: [SCN-0012] Simpan harga baru Lelang Ulang membuat harga lama Kadaluwarsa
    Given Pada Lelang Ulang Sedang Buka, input kembali kombinasi putaran awal.
    When Simpan berhasil lalu baca harga baru dan lama.
    Then Harga baru tersimpan; harga lama vendor menjadi Kadaluwarsa.

  @negative @priority-high @REQ-003 @SCR-01
  Scenario: [SCN-0013] Simpan ulang gagal tidak membuat harga lama Kadaluwarsa
    Given Pada Lelang Ulang Sedang Buka sebelum harga baru berhasil disimpan, isi harga invalid lalu Simpan.
    When Baca kembali harga lama.
    Then Tidak ada harga baru tersimpan; harga lama tidak Kadaluwarsa akibat percobaan gagal.

  @positive @priority-high @REQ-004 @SCR-03
  Scenario: [SCN-0014] Edit naik memperbarui ID penawaran yang sama
    Given Catat ID, jumlah, harga, dan atribut penawaran fixture aktif.
    When Edit Harga ke nominal lebih tinggi dan Simpan.
    And Baca ulang ID dan jumlah.
    Then Harga naik pada ID yang sama; tidak ada baris baru atau Tidak Berlaku akibat edit; riwayat dapat mencatat perubahan.

  @positive @priority-high @REQ-004 @SCR-03
  Scenario: [SCN-0015] Edit turun memperbarui ID penawaran yang sama
    Given Catat ID dan jumlah penawaran aktif.
    When Edit ke nominal lebih rendah dan Simpan.
    Then ID dan jumlah tidak berubah; harga turun; tidak ada Tidak Berlaku akibat edit.

  @positive @priority-high @REQ-005 @SCR-04
  Scenario: [SCN-0016] Bid turun memperbarui ID penawaran yang sama
    Given Catat ID, jumlah, harga, dan atribut penawaran aktif.
    When Dari Live Bidding, pilih kombinasi terkait lalu bid lebih rendah.
    And Konfirmasi Ya dan baca ulang penawaran.
    Then Harga turun pada ID yang sama; jumlah tidak bertambah; tidak ada Tidak Berlaku akibat bid; atribut selain harga tetap.

  @negative @priority-high @REQ-005 @SCR-04
  Scenario: [SCN-0017] Bid sama ditolak tanpa perubahan
    Given Bid dengan nominal sama dengan harga penawaran saat ini.
    Then Bid ditolak; ID, jumlah, dan harga tetap.

  @negative @priority-high @REQ-005 @SCR-04
  Scenario: [SCN-0018] Bid naik ditolak tanpa perubahan
    Given Bid dengan nominal di atas harga penawaran saat ini.
    Then Bid ditolak; ID, jumlah, dan harga tetap.

  @edge @priority-high @REQ-005 @SCR-04
  Scenario: [SCN-0019] Bid berulang tidak menambah baris penawaran
    Given Lakukan bid turun kedua pada penawaran yang telah dibid.
    When Baca ulang seluruh penawaran fixture.
    Then Tetap memakai ID awal dan jumlah baris awal; riwayat bid boleh bertambah.

  @edge @priority-high @REQ-006 @SCR-02
  Scenario: [SCN-0020] Masa berlaku kemarin menjadi Tidak Berlaku
    Given Cari fixture penawaran yang masa berlakunya sebelum tanggal hari ini.
    When Pastikan belum Kadaluwarsa, Closing Time dan Rencana Akhir Kirim belum lewat.
    And Baca status penawaran dan tanggal bisnis.
    Then Penawaran menjadi Tidak Berlaku; bukan Kadaluwarsa karena tanggal.

  @edge @priority-high @REQ-006 @SCR-02
  Scenario: [SCN-0021] Masa berlaku hari ini tetap aktif
    Given Gunakan penawaran masa berlaku hari ini dengan seluruh batas lain belum lewat.
    When Baca ulang status.
    Then Penawaran masih aktif pada hari tersebut; tanpa badge Tidak Berlaku atau Kadaluwarsa.

  @edge @priority-high @REQ-006 @SCR-02
  Scenario: [SCN-0022] Pergantian hari mengubah masa berlaku menjadi Tidak Berlaku
    Given Gunakan fixture masa berlaku hari D tanpa pemicu status lain.
    When Amati sebelum dan setelah pergantian tanggal bisnis aktual.
    Then Aktif pada D; Tidak Berlaku pada D+1. Jam browser yang dimajukan saja bukan bukti waktu backend.

  @edge @priority-high @REQ-007 @SCR-05
  Scenario: [SCN-0023] Diagnosis status saat Closing Time sudah lewat
    Given Cari penawaran FCL dengan Closing Time sebelum sekarang, masa berlaku dan Rencana Akhir Kirim belum lewat.
    When Baca jadwal dan status penawaran aktual.
    Then Catat apakah Tidak Berlaku. Verdict rule ditunda bila arah pembanding belum dikonfirmasi; jangan menyimpulkan bug dari asumsi.

  @edge @priority-high @REQ-007 @SCR-05
  Scenario: [SCN-0024] Diagnosis status saat Closing Time belum lewat
    Given Cari penawaran FCL dengan Closing Time setelah sekarang tanpa pemicu status lain.
    When Baca jadwal dan status aktual.
    Then Catat perilaku pembanding tanggal masa depan; arah rule masih ambigu.

  @edge @priority-high @REQ-008 @SCR-02
  Scenario: [SCN-0025] Rencana Akhir Kirim lewat membuat penawaran Tidak Berlaku
    Given Cari penawaran non-Kadaluwarsa dengan Rencana Akhir Kirim sebelum sekarang.
    When Catat masa berlaku dan Closing Time agar pemicu lain terlihat.
    And Baca status penawaran.
    Then Penawaran Tidak Berlaku karena Rencana Akhir Kirim lewat; jika pemicu tidak dapat diisolasi catat keterbatasan.

  @edge @priority-high @REQ-008 @SCR-02
  Scenario: [SCN-0026] Rencana Akhir Kirim belum lewat tidak memicu Tidak Berlaku
    Given Gunakan fixture dengan masa berlaku hari ini, Rencana Akhir Kirim di masa depan, dan Closing Time belum lewat bila ada.
    When Baca status penawaran.
    Then Tidak ada Tidak Berlaku akibat Rencana Akhir Kirim.

  @positive @priority-high @REQ-009 @SCR-01
  Scenario: [SCN-0027] Keunikan kombinasi tidak melarang vendor lain
    Given Gunakan dua akun vendor yang diundang pada lelang uji yang sama.
    When Vendor A dan B masing-masing input kombinasi sama satu kali.
    Then Masing-masing vendor dapat memiliki satu penawaran kombinasi tersebut; data terisolasi.

  @negative @priority-high @REQ-003 @SCR-01
  Scenario: [SCN-0028] Duplikasi kombinasi dalam putaran ulang yang sama ditolak
    Given Setelah harga putaran ulang tersimpan, input kombinasi sama sekali lagi pada putaran tersebut.
    Then Input kedua ditolak; harga lama yang sudah Kadaluwarsa tidak menghalangi input pertama putaran baru.

  @positive @priority-high @REQ-005 @SCR-04
  Scenario: [SCN-0029] Bid FCL berulang memperbarui ID yang sama dan mempertahankan jadwal
    Given Gunakan harga FCL aktif fixture dengan jadwal kapal terisi, catat ID dan seluruh atribut.
    When Bid turun pada kombinasi pelayaran/kontainer yang sama dua kali.
    And Baca ulang penawaran dan jadwal setelah tiap bid.
    Then ID dan jumlah penawaran tetap; tidak ada Tidak Berlaku akibat bid; jadwal dan atribut selain harga tetap.

  @positive @priority-high @REQ-004 @SCR-03
  Scenario: [SCN-0030] Edit FTL naik dan turun memperbarui ID yang sama
    Given Catat ID, harga dan jumlah penawaran FTL fixture aktif.
    When Edit harga ke lebih tinggi, Simpan lalu baca ulang.
    And Edit lagi ke lebih rendah, Simpan lalu baca ulang.
    Then Kedua edit berhasil pada ID yang sama; jumlah record tidak bertambah dan tidak membuat Tidak Berlaku.
