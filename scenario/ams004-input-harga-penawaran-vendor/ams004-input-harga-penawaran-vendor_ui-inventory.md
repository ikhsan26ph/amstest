# UI Inventory — ams004-input-harga-penawaran-vendor

Diekstrak dari analysis untuk penggunaan executor. Selector berikut usulan desain; gunakan selector-map terverifikasi dan fallback sesuai docs/agent-guide.md. Label/domain yang berubah perlu diagnosis.

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

