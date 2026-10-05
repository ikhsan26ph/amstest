# UI Inventory — ams005-live-bidding-vendor

Diekstrak dari analysis untuk penggunaan executor. Selector berikut usulan desain; gunakan selector-map terverifikasi dan fallback sesuai docs/agent-guide.md. Label/domain yang berubah perlu diagnosis.

## UI Inventory

### Layar Live Bidding Spot Rate (`071.png`)

State yang tampak: daftar terisi, filter terbuka, sub-tab Semua Jenis Pengiriman aktif, card FTL/FCL Normal dan Multidrop, card Lelang Ulang, Top 3 milik vendor yang di-highlight serta posisi termasking, countdown abu-abu/oranye/merah, pagination halaman pertama, dan form Bid dengan nilai awal `Rp 0`.

| Elemen | Tipe/state/label yang tampak | Saran selector Playwright | Usulan `data-testid` |
|---|---|---|---|
| Judul halaman | Heading “Live Bidding Spot Rate” | `getByRole('heading', { name: 'Live Bidding Spot Rate' })` | `live-bidding-title` |
| Filter | Button toggle “Filter” | `getByRole('button', { name: 'Filter' })` | `filter-toggle` |
| No. Lelang | Textbox, placeholder “Masukkan No. Lelang” | `getByLabel('No. Lelang')` | `filter-auction-number` |
| Buka Lelang | Date-time range input, placeholder `DD/MM/YYYY hh:mm` | `getByLabel('Buka Lelang')` | `filter-auction-open` |
| Tutup Lelang | Date-time range input, placeholder `DD/MM/YYYY hh:mm` | `getByLabel('Tutup Lelang')` | `filter-auction-close` |
| Periode Pengiriman | Date-time range input, placeholder `DD/MM/YYYY hh:mm - DD/MM/YYYY hh:mm` | `getByLabel('Periode Pengiriman')` | `filter-delivery-period` |
| Jenis Pengiriman | Combobox, placeholder “Pilih Jenis Pengiriman” | `getByRole('combobox', { name: 'Jenis Pengiriman' })` | `filter-shipment-kind` |
| Tipe Pengiriman | Combobox, placeholder “Pilih Tipe Pengiriman” | `getByRole('combobox', { name: 'Tipe Pengiriman' })` | `filter-shipment-type` |
| Kota Asal | Combobox, placeholder “Pilih Kota Asal” | `getByRole('combobox', { name: 'Kota Asal' })` | `filter-origin-city` |
| Kota Tujuan | Combobox, placeholder “Pilih Kota Tujuan” | `getByRole('combobox', { name: 'Kota Tujuan' })` | `filter-destination-city` |
| Pelabuhan Asal | Combobox, placeholder “Pilih Pelabuhan Asal” | `getByRole('combobox', { name: 'Pelabuhan Asal' })` | `filter-origin-port` |
| Pelabuhan Tujuan | Combobox, placeholder “Pilih Pelabuhan Tujuan” | `getByRole('combobox', { name: 'Pelabuhan Tujuan' })` | `filter-destination-port` |
| Reset | Button outlined “Reset” | `getByRole('button', { name: 'Reset' })` | `filter-reset` |
| Terapkan | Button primary “Terapkan” | `getByRole('button', { name: 'Terapkan' })` | `filter-apply` |
| Sub-tab jenis | Tab “Semua Jenis Pengiriman”, “FCL (Full Container Load)”, “FTL (Full Truck Load)” | `getByRole('tab', { name: /Semua Jenis Pengiriman|FCL|FTL/ })` | `shipment-tab-all`, `shipment-tab-fcl`, `shipment-tab-ftl` |
| Tampilkan | Combobox jumlah data, nilai tampak 20 | `getByRole('combobox', { name: 'Tampilkan' })` | `page-size` |
| Card lelang | Region per nomor lelang dan jenis; badge `FTL`/`FCL`, badge `Multidrop` bila non-Normal | `getByTestId('auction-card').filter({ hasText: '<No. Lelang>' })` | `auction-card` + atribut `data-auction-id`, `data-equipment` |
| Rute | Teks kota normal atau link “Multipickup”/“Multidrop” | `getByRole('link', { name: /Multipickup|Multidrop/ })` | `route-origin-detail`, `route-destination-detail` |
| Detail armada/kontainer | Label/value “Jenis Armada”/“Jenis Kontainer” dan “Periode Pengiriman” | Locator card dengan `getByText('Jenis Armada')`/`getByText('Jenis Kontainer')` | `equipment-name`, `delivery-period` |
| Countdown | Empat nilai dengan label Hari, Jam, Menit, Detik; terlihat state abu-abu/oranye/merah | `getByTestId('auction-countdown')` | `auction-countdown`, `countdown-days`, `countdown-hours`, `countdown-minutes`, `countdown-seconds` |
| Top 3 | Region “Top 3”, baris `#1`–`#3`; posisi sendiri berlatar biru, lainnya `Rp •••••••` | `getByRole('region', { name: 'Top 3' })` lalu locator baris | `top-three`, `rank-1`, `rank-2`, `rank-3` |
| Badge Lelang Ulang | Badge/link-style “Lelang Ulang” pada area Top 3 | `getByText('Lelang Ulang', { exact: true })` | `rebid-badge` |
| Total Penawaran | Teks “x dari y Vendor” (terlihat jelas pada `78.png`) | `getByText(/\d+ dari \d+ Vendor/)` | `total-offers` |
| Pelayaran | Combobox wajib pada card FCL, nilai awal “Pilih” | Locator card lalu `getByRole('combobox', { name: 'Pelayaran' })` | `bid-shipping-line` |
| Jenis Kendaraan | Combobox wajib pada card FTL (berdasarkan spesifikasi; mockup card memakai label Pelayaran secara generik) | Locator card lalu `getByRole('combobox', { name: 'Jenis Kendaraan' })` | `bid-vehicle-type` |
| Harga Baru | Textbox wajib, prefix Rp dan nilai awal 0 | Locator card lalu `getByRole('textbox', { name: 'Harga Baru' })` | `bid-new-price` |
| Bid Harga | Button outlined pada tiap card | Locator card lalu `getByRole('button', { name: 'Bid Harga' })` | `submit-bid` |
| Riwayat Harga Penawaran | Link di bawah form | Locator card lalu `getByRole('link', { name: 'Riwayat Harga Penawaran' })` | `bid-history-link` |
| Detail Lelang | Link dengan ikon panah; posisinya bervariasi pada Lelang Ulang | Locator card lalu `getByRole('link', { name: 'Detail Lelang' })` | `auction-detail-link` |
| Pagination | Tombol first/previous, halaman 1/2/3/…/12, next/last; teks “Menampilkan 1 - 20 data dari 30 data” | `getByRole('navigation', { name: 'Pagination' })` | `auction-pagination` |

### Dialog Riwayat Harga Penawaran (`072.png`)

State yang tampak: dialog terbuka di atas overlay, konteks FCL terisi, filter Semua Pelayaran, tabel tujuh baris, sorting tersedia, jumlah data 20, dan pagination halaman pertama.

| Elemen | Tipe/state/label yang tampak | Saran selector Playwright | Usulan `data-testid` |
|---|---|---|---|
| Dialog | Dialog “Riwayat Harga Penawaran” | `getByRole('dialog', { name: 'Riwayat Harga Penawaran' })` | `bid-history-dialog` |
| Tutup dialog | Button ikon X | Dialog lalu `getByRole('button', { name: /Tutup|Close/ })` | `bid-history-close` |
| Info lelang | Read-only: No. Lelang, Jenis Pengiriman, Jenis Kontainer, Skema Pengiriman | Dialog lalu `getByText('<nilai>')` pada kelompok info | `history-auction-info` |
| Info rute | Panel POL/POD, kota, nama lokasi, dan alamat lengkap | Dialog lalu `getByTestId('history-route')` | `history-route` |
| Semua Pelayaran | Combobox filter, default “Semua Pelayaran” | Dialog lalu `getByRole('combobox', { name: 'Pelayaran' })` | `history-carrier-filter` |
| Tampilkan | Combobox jumlah data, nilai 20 | Dialog lalu `getByRole('combobox', { name: 'Tampilkan' })` | `history-page-size` |
| Tabel riwayat | Table dengan kolom No., Pelayaran, Harga Penawaran, Tanggal Input | Dialog lalu `getByRole('table')` | `bid-history-table` |
| Header sorting | Button/header Pelayaran, Harga Penawaran, Tanggal Input dengan ikon sort | `getByRole('columnheader', { name: /Pelayaran|Harga Penawaran|Tanggal Input/ })` | `sort-carrier`, `sort-price`, `sort-input-date` |
| Baris riwayat | Data contoh ASDP/Meratus/Temas, harga Rupiah, timestamp | Table lalu `getByRole('row')` | `bid-history-row` |
| Pagination riwayat | First/previous, 1/2/3/…/12, next/last; ringkasan 1–20 dari 30 | Dialog lalu `getByRole('navigation', { name: 'Pagination' })` | `history-pagination` |

### Dialog Tidak Dapat Bid Harga (`78.png`)

State yang tampak: error modal akibat harga baru lebih besar, overlay menonaktifkan interaksi halaman, judul dan pesan tampil, serta satu aksi untuk menutup dialog.

| Elemen | Tipe/state/label yang tampak | Saran selector Playwright | Usulan `data-testid` |
|---|---|---|---|
| Dialog error | Dialog “Tidak Dapat Bid Harga” | `getByRole('dialog', { name: 'Tidak Dapat Bid Harga' })` | `bid-error-dialog` |
| Pesan error | “Harga penawaran tidak boleh lebih besar dari harga sebelumnya” | Dialog lalu `getByText('Harga penawaran tidak boleh lebih besar dari harga sebelumnya')` | `bid-error-message` |
| Mengerti | Button primary “Mengerti” | Dialog lalu `getByRole('button', { name: 'Mengerti' })` | `bid-error-acknowledge` |

