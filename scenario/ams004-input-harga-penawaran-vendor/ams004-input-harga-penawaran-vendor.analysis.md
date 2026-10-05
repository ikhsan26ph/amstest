# Analysis — ams004-input-harga-penawaran-vendor

## Requirements

### Daftar requirement

| ID | Requirement | Acceptance criteria utama |
|---|---|---|
| REQ-001 | Akses dan isolasi data vendor | Hanya pengguna vendor yang dapat menginput harga; vendor hanya melihat lelang yang mengundangnya dan hanya harga miliknya. Lelang dibatalkan tetap terlihat dengan badge `Dibatalkan`. |
| REQ-002 | Daftar Lelang vendor | Tersedia tab `Semua Lelang`, `Lelang Ulang` dengan counter, dan `Request Jadwal` dengan counter khusus FCL; card menampilkan informasi/filter sesuai desain serta penanda `Perlu Input Harga`, `Request Jadwal`, `Proses Nego`, dan `Lelang Ulang`. |
| REQ-003 | Detail Lelang vendor | Detail bersifat read-only dan memuat Informasi Umum, Syarat & Ketentuan, Data Pengirim, Data Penerima, serta Harga Penawaran milik vendor dengan filter/pengurutan; peserta lain tidak ditampilkan. Tombol `+ Input Harga` selalu tampil. |
| REQ-004 | Jalur dan kelayakan membuka Input Harga | Halaman Input Harga dapat dibuka dari Lelang Spot Rate (action atau detail) dan menu Penawaran. Dari konteks lelang, No. Lelang otomatis terisi dan disable; dari menu Penawaran dipilih manual. Input/edit/hapus hanya berhasil selama status `Sedang Buka`, termasuk lelang ulang; aksi pada status lain menampilkan alert dan tidak mengubah data. |
| REQ-005 | Informasi umum dan rute pada form | Dropdown No. Lelang wajib hanya memuat lelang `Sedang Buka` yang mengundang vendor. Setelah dipilih, sistem menampilkan jenis pengiriman, jumlah/jenis armada atau kontainer, asuransi, biaya termasuk, dan rute secara read-only. Rute FCL menggunakan POL/POD; FTL menggunakan kota asal/tujuan. Link Multipickup/Multidrop/Multipoint membuka detail Muat/Bongkar beserta kota, drop point, dan alamat. |
| REQ-006 | Baris harga FCL | Tiap baris FCL menyediakan Pelayaran, Jenis Kontainer, Harga, PPN, PPh, Mulai Berlaku, dan Deskripsi Harga. Pelayaran berasal dari master aktif dan dapat dicari; jenis hanya yang dibuka pada lelang; satu jenis otomatis terisi dan disable. Field wajib, numeric, dan tanggal mengikuti aturan validasi. |
| REQ-007 | Baris harga FTL | Tiap baris FTL menyediakan Jenis Kendaraan, Harga, PPN, PPh, Mulai Berlaku, Estimasi Pengiriman (jam), dan Deskripsi Harga. Jenis hanya yang dibuka pada lelang; satu jenis otomatis terisi dan disable. Field wajib, numeric, dan tanggal mengikuti aturan validasi. |
| REQ-008 | Input beberapa harga dalam satu form | `Tambah Baris Input` menambahkan beberapa baris dan seluruh baris disimpan sebagai harga terpisah. Ikon hapus baris tampil pada semua baris jika jumlah baris lebih dari satu dan tidak tampil jika hanya satu. Per vendor dalam satu lelang, FCL hanya satu input per kombinasi Pelayaran + Jenis Kontainer; FTL hanya satu per Jenis Armada. Kombinasi berbeda boleh beberapa harga. Harga atau tanggal berbeda tidak membebaskan duplikasi. Lihat regresi AMS009 untuk kasus rinci. |
| REQ-009 | Simpan harga dan perhitungan | Banner mengingatkan harga sebelum PPN/PPh. Harga adalah DPP; PPN/PPh default dari master, wajib, numeric, dan terkunci; total termasuk pajak ditampilkan pada card. Simpan memvalidasi field, scroll ke error pertama, meminta konfirmasi, lalu menyimpan, memperbarui status (`Input Harga` untuk FCL sebelum jadwal; `Input Penawaran` untuk FTL), memasukkan harga termurah per jenis ke Live Bidding, mengarahkan ke Daftar Penawaran, dan menampilkan toast sukses. Jika lelang tutup saat konfirmasi/simpan, tidak ada data tersimpan dan muncul alert. |
| REQ-010 | Status, keaktifan, dan lelang ulang | Status vendor mengikuti kelengkapan harga/jadwal. Bid/Edit memperbarui data yang sama dan tidak membentuk baris lama `Tidak Berlaku`. Saat Lelang Ulang sedang berjalan, harga lama vendor menjadi `Kadaluwarsa` setelah harga baru berhasil disimpan. Masa berlaku < hari ini menjadi `Tidak Berlaku`; = hari ini tetap aktif hari tersebut. Rencana Akhir Kirim yang lewat membuat penawaran `Tidak Berlaku`. Arah rule Closing Time perlu diagnosis karena teks perubahan ambigu. Harga sebelumnya pada lelang ulang tampil read-only dan tidak dapat dipakai ulang lewat opsi khusus. |
| REQ-011 | Pembatalan form | `Batal` menampilkan konfirmasi dan kembali ke halaman asal tanpa menyimpan bila disetujui; pembatalan konfirmasi mempertahankan form dan input pengguna. |
| REQ-012 | Edit Harga | Action `Edit Harga` membuka satu baris form berisi data harga dengan informasi lelang read-only, validasi sama dengan input, tanpa `Tambah Baris Input`. Simpan memperbarui ID penawaran yang sama tanpa menambah baris; harga boleh naik/turun selama valid. Konfirmasi tetap digunakan dan perubahan tercatat di Riwayat Perubahan. Di luar `Sedang Buka`, alert penolakan tampil dan data tidak berubah. |
| REQ-013 | Hapus Harga | Action `Hapus Harga` meminta konfirmasi dan melakukan soft delete hanya pada harga terpilih; jadwal FCL terkait ikut terhapus dan aksi tercatat dalam Riwayat Perubahan. Jika harga vendor terakhir terhapus, status kembali `Belum Input`. Di luar `Sedang Buka`, alert tampil dan data tidak berubah. |
| REQ-014 | Daftar Penawaran | Daftar memuat seluruh harga vendor lintas lelang, satu card per harga, default terbaru lebih dulu, tab/status/legend sesuai spesifikasi, detail harga yang dapat diperluas, badge relevan, dan pagination default 20. Action menu mengikuti kondisi lelang; action yang tidak valid tetap tampil tetapi menghasilkan alert. Action jadwal FCL diteruskan ke modul Jadwal Kapal dan dapat dilakukan sejak lelang buka hingga sebelum Rencana Akhir Kirim. |

### Aturan validasi

| Field/aksi | Aturan |
|---|---|
| No. Lelang | Wajib; pilihan hanya lelang `Sedang Buka` yang mengundang vendor; otomatis terisi dan disable bila masuk dari konteks lelang. |
| Pelayaran (FCL) | Wajib; berasal dari master pelayaran aktif; dropdown mendukung pencarian. |
| Jenis Kontainer/Kendaraan | Wajib; terbatas pada jenis yang dibuka lelang; otomatis terisi dan disable jika hanya satu jenis. |
| Harga | Wajib; numeric; format Rupiah dengan pemisah ribuan; nilai DPP harus lebih besar dari 0. |
| PPN dan PPh | Wajib; numeric persen; default dari master setting; disable/tidak dapat diubah vendor. |
| Mulai Berlaku | Wajib; format `DD/MM/YYYY`; tidak boleh lebih kecil dari tanggal hari ini. Tanggal yang tercantum tetap inklusif untuk evaluasi keaktifan. |
| Estimasi Pengiriman (FTL) | Wajib; numeric; satuan jam; minimum 1. |
| Deskripsi Harga | Opsional; textarea. |
| Submit dengan field invalid | Tampilkan helper error dan border error, lalu scroll ke field error pertama; data tidak tersimpan. |
| Batas waktu mutasi | Input, edit, dan hapus hanya bila `Tgl Buka ≤ sekarang < Tgl Tutup`; validasi kembali dilakukan ketika Simpan/konfirmasi dieksekusi. |

### Aktor dan hak akses

| Aktor | Hak akses |
|---|---|
| Vendor yang diundang | Melihat lelang undangan dan harga miliknya; input/edit/hapus harga pada periode yang diizinkan; melihat riwayat dan menjalankan action jadwal FCL sesuai kondisi. |
| Vendor yang tidak diundang | Tidak melihat/memilih lelang dan tidak dapat mengakses data atau memasukkan harga untuk lelang tersebut. |
| Shipper | Membuat lelang, menentukan peserta/ketentuan/jenis/biaya; bukan pelaku input harga pada modul ini. |
| Sistem | Memvalidasi periode lelang, menghitung pajak/total, mengelola status dan badge, menjaga isolasi data, merekam riwayat, serta menentukan harga termurah vendor per jenis untuk Live Bidding. |

### User flow

1. Vendor membuka Daftar Lelang atau Daftar Penawaran.
2. Vendor membuka Input Harga melalui action/card/detail lelang atau tombol pada Daftar Penawaran.
3. Sistem mengunci No. Lelang dari konteks lelang, atau vendor memilih lelang eligible secara manual.
4. Sistem menampilkan informasi/rute lelang; vendor mengisi satu atau beberapa baris harga FCL/FTL.
5. Vendor memilih Simpan; sistem memvalidasi seluruh field dan periode lelang, lalu menampilkan konfirmasi.
6. Setelah konfirmasi `Ya`, sistem menyimpan tiap baris, menghitung total termasuk PPN/PPh, memperbarui status dan Live Bidding, lalu membuka Daftar Penawaran dengan toast sukses.
7. Alternatif: vendor membatalkan form, memperbaiki validasi, mengedit/menghapus harga selama lelang buka, atau menerima alert tanpa perubahan data bila periode/aksi tidak valid.
8. Pada lelang ulang, sistem menampilkan harga lama read-only; penyimpanan harga baru membuat harga lama berstatus `Kadaluwarsa`.

## UI Inventory

### Daftar Lelang Vendor (`056.png`, `067-ftl.png`)

State yang terlihat: daftar lintas status (`Sedang Buka`, `Belum Buka`, `Tutup`, `Aktif`, `Dibatalkan`, `Selesai`), card ber-border warna legend, badge FCL/FTL, badge `Tidak Ada Order`/`Tidak Ada Penawaran`, action menu terbuka, counter tab, dan pagination.

| Elemen | Tipe/state | Saran selector Playwright |
|---|---|---|
| Filter | button | `getByRole('button', { name: 'Filter' })`; `data-testid=auction-filter-toggle` |
| Filter ID/No. Lelang | textbox | `getByRole('textbox', { name: /ID Order|No. Lelang/ })`; label `ID Order`/`No. Lelang`; `data-testid=auction-number-filter` |
| Filter Jenis Order/Jenis Pengiriman, Kota Asal/Tujuan, Tipe/Skema, Drop Point, Status | combobox | `getByRole('combobox', { name: '<label>' })`; `data-testid=auction-<nama>-filter` |
| Reset / Terapkan | button | `getByRole('button', { name: 'Reset' })`, `getByRole('button', { name: 'Terapkan' })` |
| Tab Semua Lelang / Lelang Ulang / Request Jadwal | tab | `getByRole('tab', { name: /Semua Lelang|Lelang Ulang|Request Jadwal/ })`; `data-testid=auction-tab-<slug>` |
| Card lelang | article | `getByRole('article', { name: /<No. Lelang>/ })`; `data-testid=auction-card-<id>` |
| Action card | button/menu | `getByRole('button', { name: /Aksi <No. Lelang>/ })`; menuitem `Detail`, `Input Harga Penawaran`, `Respon Request Jadwal`, `Riwayat Perubahan` |
| Jumlah data dan pagination | combobox/navigation | `getByRole('combobox', { name: 'Tampilkan' })`; `getByRole('navigation', { name: 'Pagination' })` |

### Detail Lelang FCL/FTL (`057.png`, `068.png`)

State yang terlihat: detail read-only, accordion terbuka, dokumen lelang, daftar/card harga, filter, urutkan, pagination, serta tab detail card. Detail FCL menampilkan pelayaran, jadwal kapal dan `Info Connecting`; detail FTL menampilkan jenis/dimensi armada dan target waktu perjalanan.

| Elemen | Tipe/state | Saran selector Playwright |
|---|---|---|
| Judul Detail Lelang Spot Rate / No. Lelang / badge status | heading/text | `getByRole('heading', { name: 'Detail Lelang Spot Rate' })`; `getByText('<No. Lelang>')`; `data-testid=auction-status` |
| Syarat & Ketentuan, Data Pengirim, Data Penerima | button/region accordion | `getByRole('button', { name: '<section>' })`; `getByRole('region', { name: '<section>' })` |
| Dokumen Lelang | link | `getByRole('link', { name: /Dokumen_Lelang/ })`; `data-testid=auction-document` |
| Input Harga | button | `getByRole('button', { name: /Input Harga/ })`; `data-testid=detail-input-price` |
| Filter / Urutkan / Request Jadwal | button | `getByRole('button', { name: '<label>' })`; `data-testid=offer-<aksi>` |
| Card Harga Penawaran | article | `getByRole('article', { name: /<jenis atau pelayaran>/ })`; `data-testid=offer-card-<id>` |
| Detail Biaya / Detail Kapal / Detail Armada / Vendor / Info Connecting | tab | `getByRole('tab', { name: '<label>' })`; `data-testid=offer-detail-tab-<slug>` |
| Pesan | button, enabled/disabled | `getByRole('button', { name: 'Pesan' })`; `data-testid=offer-order` |

### Input Harga Penawaran FCL (`058.png`–`061.png`, `064a.png`)

State yang terlihat: masuk dari Lelang Spot Rate dan Daftar Penawaran (breadcrumb berbeda), No. Lelang terisi, asuransi `Digunakan`/`Tidak Digunakan`, rute langsung atau link Multipickup/Multidrop, satu/dua baris harga, nilai default dan placeholder, serta ikon hapus baris.

| Elemen | Tipe/state | Saran selector Playwright |
|---|---|---|
| No. Lelang | combobox, required; disabled dari konteks lelang | `getByRole('combobox', { name: 'No. Lelang' })`; label `No. Lelang`; `data-testid=auction-number` |
| Informasi jenis/jumlah/kontainer, asuransi, biaya | text/read-only | region `getByRole('region', { name: 'Informasi Umum' })`; `data-testid=auction-info` |
| Multipickup / Multidrop | link | `getByRole('link', { name: 'Multipickup' })`; `getByRole('link', { name: 'Multidrop' })` |
| Banner harga sebelum PPN/PPh | status/note | `getByRole('status')` atau `getByText(/harga sebelum PPN dan PPh/)`; `data-testid=pre-tax-price-note` |
| Pelayaran | searchable combobox, required | `getByRole('combobox', { name: 'Pelayaran' }).nth(n)`; `data-testid=offer-row-<n>-shipping-line` |
| Jenis Kontainer | combobox, required; dapat disabled | `getByRole('combobox', { name: 'Jenis Kontainer' }).nth(n)`; `data-testid=offer-row-<n>-container-type` |
| Harga | textbox/spinbutton, required, prefix Rp | `getByRole('textbox', { name: 'Harga' }).nth(n)`; `data-testid=offer-row-<n>-price` |
| PPN / PPh | spinbutton, required, disabled, suffix `%` | `getByRole('spinbutton', { name: 'PPN' }).nth(n)` dan `PPh`; `data-testid=offer-row-<n>-ppn|pph` |
| Mulai Berlaku | textbox/date, required | `getByRole('textbox', { name: 'Mulai Berlaku' }).nth(n)`; `data-testid=offer-row-<n>-effective-date` |
| Deskripsi Harga | textbox multiline, optional | `getByRole('textbox', { name: 'Deskripsi Harga' }).nth(n)`; `data-testid=offer-row-<n>-description` |
| Hapus baris | button | `getByRole('button', { name: /Hapus baris <n>/ })`; `data-testid=offer-row-<n>-remove` |
| Tambah Baris Input | button | `getByRole('button', { name: 'Tambah Baris Input' })`; `data-testid=add-offer-row` |
| Batal / Simpan | button | `getByRole('button', { name: 'Batal' })`, `getByRole('button', { name: 'Simpan' })` |

### Input Harga Penawaran FTL (`069.png`, `070.png`)

State yang terlihat: No. Lelang FTL, informasi Jumlah Armada/Jenis Armada, rute kota langsung atau link Multipickup/Multidrop, serta dua baris harga FTL. Selector umum sama dengan layar FCL kecuali elemen khusus berikut.

| Elemen | Tipe/state | Saran selector Playwright |
|---|---|---|
| Jenis Kendaraan | combobox, required; dapat disabled | `getByRole('combobox', { name: 'Jenis Kendaraan' }).nth(n)`; label `Jenis Kendaraan`; `data-testid=offer-row-<n>-vehicle-type` |
| Estimasi Pengiriman | spinbutton, required, suffix Jam | `getByRole('spinbutton', { name: 'Estimasi Pengiriman' }).nth(n)`; `data-testid=offer-row-<n>-delivery-hours` |
| Rute kota asal/tujuan | text/read-only | `data-testid=origin-city`, `data-testid=destination-city` |

### Modal detail dan konfirmasi (`062.png`, `063.png`, `066.png`)

| Elemen/state | Teks terlihat | Saran selector Playwright |
|---|---|---|
| Dialog detail Multipickup | `Detail Multipickup`, `Muat 1 - Kota Surabaya`, `Muat 2 - Kota Malang`, drop point dan alamat | `getByRole('dialog', { name: 'Detail Multipickup' })`; close `getByRole('button', { name: 'Tutup' })`; `data-testid=multipoint-detail-dialog` |
| Dialog konfirmasi simpan | `Apakah Harga Telah Sesuai?`, peringatan melewati tanggal tutup | `getByRole('dialog', { name: 'Apakah Harga Telah Sesuai?' })`; button `Batal`, `Ya`; `data-testid=save-offer-confirmation` |
| Dialog gagal edit | `Tidak Dapat Mengedit Data`, `Harga penawaran sudah melewati tanggal tutup lelang` | `getByRole('alertdialog', { name: 'Tidak Dapat Mengedit Data' })`; button `Mengerti`; `data-testid=edit-offer-expired-alert` |

### Daftar Penawaran dan Edit Harga (`064.png`, `065.png`)

State yang terlihat: daftar gabungan FCL/FTL, filter terbuka, lima tab, badge status, card collapse/expand, card FCL connecting, card FTL dengan estimasi, detail biaya/armada/vendor, action titik tiga, dan satu baris form edit tanpa tombol tambah baris.

| Elemen | Tipe/state | Saran selector Playwright |
|---|---|---|
| Input Harga / Filter | button | `getByRole('button', { name: 'Input Harga' })`; `getByRole('button', { name: 'Filter' })` |
| Filter No. Lelang, jenis/status pengiriman, kota/pelabuhan, total, tipe, pelayaran, kontainer/armada | textbox/combobox | `getByRole('textbox'|'combobox', { name: '<label>' })`; `data-testid=offer-<nama>-filter` |
| Tab penawaran | tab | `getByRole('tab', { name: /Semua Penawaran|Belum Input Jadwal|Penawaran Lengkap|Request Jadwal|Kadaluwarsa/ })` |
| Card penawaran | article | `getByRole('article', { name: /<No. Lelang>/ })`; `data-testid=offer-card-<id>` |
| Detail Harga / Info Connecting / Detail Armada / Vendor | button/tab | `getByRole('button'|'tab', { name: '<label>' })` |
| Action card | button/menu | `getByRole('button', { name: /Aksi penawaran/ })`; menuitem `Edit Harga`, `Hapus Harga`, `Tambah Jadwal`, `Lihat Jadwal`, `Respon Request Jadwal`, `Riwayat Perubahan` |
| Form Edit Harga | form | `getByRole('form', { name: 'Edit Harga Penawaran' })`; field sama dengan satu baris input; `data-testid=edit-offer-form` |

### Layar konteks Live Bidding/Laporan (`054.png`, `055.png`)

Kedua desain memperlihatkan konteks hilir harga: tab `Live Bidding` dan `Laporan Lelang`, filter, card top-3, countdown, total penawaran, `Detail Lelang`, `Lihat Penawaran`, Export, dan pagination. Layar ini bukan tempat vendor menginput harga, tetapi dipakai untuk memverifikasi dampak harga termurah pada urutan Live Bidding.

| Elemen | Saran selector Playwright |
|---|---|
| Tab Live Bidding / Laporan Lelang | `getByRole('tab', { name: '<label>' })`; `data-testid=live-bidding-tab|auction-report-tab` |
| Card top-3 | `getByRole('article', { name: /<No. Lelang>/ })`; `data-testid=bidding-card-<id>` |
| Peringkat #1/#2/#3 | `getByText('#1')` dalam card; `data-testid=rank-1|2|3` |
| Countdown / Total Penawaran | `data-testid=auction-countdown`, `data-testid=total-offers` |

## Assumptions Log

1. Diperbarui user 2026-10-05: key unik FCL = vendor + lelang + Pelayaran + Jenis Kontainer; FTL = vendor + lelang + Jenis Armada. Harga dan tanggal bukan pembeda. Harga putaran lama tidak boleh menghalangi input pertama Lelang Ulang; cakupan per putaran merupakan interpretasi gabungan rule, lihat AMS009.
2. Istilah “Mulai Berlaku” pada form bertentangan dengan contoh “masa berlaku sampai tanggal yang tercantum”. Untuk skenario, tanggal diperlakukan sebagai tanggal batas keaktifan yang inklusif sesuai contoh; label UI tetap mengikuti desain/spesifikasi. User 2026-10-05 mengonfirmasi batas masa berlaku inklusif hari ini; pemetaan tanggal akhir masa berlaku ke label UI Mulai Berlaku tetap perlu bukti.
3. Status `Input Harga` untuk FCL berubah menjadi `Input Penawaran` setelah jadwal terisi; proses pengisian jadwal sendiri berada di luar lingkup modul dan hanya diuji sebagai handoff.
4. Persentase default PPN/PPh tidak disebutkan; skenario memakai nilai contoh dari master tanpa mengunci angka kebijakan tertentu.
5. Workbook `laporan-lelang-spot-rate-11092026.xlsx` berhasil dibaca sebagai konteks data uji. Contoh yang digunakan mencakup lelang FCL `HIR/2026/09/14` rute Surabaya–Ambon dan FTL `JBT/2026/09/15` rute Malang–Bandung; data contoh tidak dianggap sebagai aturan bisnis normatif.
6. Pesan alert yang tidak ditulis lengkap menggunakan pola generik desain: judul kegagalan aksi, alasan status/periode, dan tombol `Mengerti`, tanpa mensyaratkan copy persis selain teks yang secara eksplisit diberikan spesifikasi.
7. Desain `054.png` dan `055.png` menampilkan header role `Shipper/Staff Operasional`; keduanya diperlakukan sebagai referensi visual dampak Live Bidding/Laporan, bukan sebagai bukti bahwa vendor boleh melihat harga vendor lain.
8. Beberapa desain memakai istilah `ID Order`, `Jenis Order`, atau `Jenis Armada`, sedangkan spesifikasi modul memakai `No. Lelang`, `Jenis Pengiriman`, dan `Jenis Kendaraan`. Skenario memakai label domain spesifikasi pada layar inti dan menerima label desain sebagai alias hanya untuk filter yang memang terlihat.
9. Ikon tanpa label visual (titik tiga, tempat sampah, tutup dialog) diasumsikan memiliki accessible name yang kontekstual; saran `data-testid` disediakan bila implementasi belum mempunyai nama aksesibel.
