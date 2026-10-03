# Analysis — ams005-live-bidding-vendor

## Requirements

### Daftar Requirement

| ID | Requirement | Acceptance criteria utama |
|---|---|---|
| REQ-001 | Vendor dapat mengakses halaman Live Bidding dengan satu tampilan tanpa tab Laporan Lelang. | Halaman hanya menampilkan area Live Bidding; vendor hanya dapat melihat lelang Spot Rate FTL/FCL yang mengundangnya dan sedang berstatus Sedang Buka, termasuk Lelang Ulang. |
| REQ-002 | Sistem mengelola kemunculan card lelang secara otomatis berdasarkan status dan waktu WIB. | Card muncul saat tanggal buka tercapai, hilang tanpa reload ketika tanggal tutup terlewati atau lelang dibatalkan, dan seluruh timestamp/countdown menggunakan WIB. |
| REQ-003 | Sistem menampilkan satu card untuk setiap kombinasi nomor lelang dan jenis armada/kontainer serta mengurutkannya berdasarkan tanggal buka terbaru. | Lelang dengan beberapa jenis menghasilkan card terpisah; Top 3 dan Bid dihitung per jenis; card dengan tanggal buka paling baru tampil lebih dahulu. |
| REQ-004 | Vendor dapat memfilter card Live Bidding menggunakan kriteria yang tersedia. | Filter mencakup No. Lelang, Buka Lelang, Tutup Lelang, Periode Pengiriman (range), Jenis Pengiriman, Tipe Pengiriman, Kota Asal, Kota Tujuan, Pelabuhan Asal, dan Pelabuhan Tujuan; Terapkan menjalankan filter dan Reset mengosongkan semuanya. |
| REQ-005 | Filter lokasi mengikuti jenis pengiriman dan mendukung rute bertitik banyak. | Pelabuhan hanya berlaku untuk FCL; kota berlaku untuk FTL dan FCL; kota pada salah satu titik multipickup/multidrop dianggap cocok. |
| REQ-006 | Vendor dapat memakai sub-tab jenis pengiriman dan pagination. | Sub-tab Semua Jenis Pengiriman aktif secara default, pilihan FCL/FTL membatasi card sesuai jenis, dan jumlah data default adalah 20 dengan kontrol pagination/Tampilkan. |
| REQ-007 | Card menampilkan identitas dan ringkasan lelang yang sesuai konteks. | Card memuat No. Lelang, badge jenis FTL/FCL, rute, jenis armada/kontainer, periode, countdown, Top 3, Total Penawaran, form Bid, Riwayat Harga Penawaran, dan Detail Lelang; badge tipe hanya muncul bila tipe bukan Normal. |
| REQ-008 | Card Lelang Ulang memiliki penanda dan tata letak aksi khusus. | Badge “Lelang Ulang” menggantikan posisi Detail Lelang di baris Top 3 dan Detail Lelang berpindah ke bagian bawah card. |
| REQ-009 | Sistem menampilkan rute Normal, Multipickup, Multidrop, dan Multipoint dengan benar. | Normal menampilkan Kota Asal → Kota Tujuan; sisi bertitik banyak menjadi link Multipickup/Multidrop yang membuka pop-up detail; Multipoint menyediakan link pada kedua sisi. |
| REQ-010 | Countdown berjalan real-time dan memberi indikator warna berdasarkan sisa waktu. | Format Hari : Jam : Menit : Detik berubah tiap detik; warna abu-abu untuk sisa hari, oranye dalam 24 jam, merah dalam 1 jam; pada 00:00:00:00 card hilang tanpa reload. |
| REQ-011 | Top 3 menampilkan peringkat penawaran per jenis dengan privasi vendor. | Harga DPP terendah berada di atas; posisi vendor sendiri menampilkan highlight, nama, dan harga; vendor lain dan slot kosong dimasking; bila vendor tidak masuk Top 3/belum menawar, seluruh posisi dimasking. |
| REQ-012 | Sistem menentukan Top 3 dengan aturan tie-break dan memperbaruinya secara real-time. | Untuk armada/pelayaran yang sama milik vendor digunakan harga terendah; satu vendor dapat menempati beberapa posisi; harga sama diurutkan berdasarkan timestamp, rating, jumlah kemenangan, jenis armada/kapal, lalu created; ranking diperbarui tanpa reload dan terkunci setelah tutup. |
| REQ-013 | Total Penawaran menunjukkan partisipasi vendor secara akurat. | Teks “x dari y Vendor” memakai x vendor yang telah mengisi harga (FTL) atau harga dan jadwal (FCL), y vendor yang diundang; bila x=0 teks merah. Pada Lelang Ulang, Top 3 memakai harga baru selama periode ulang dan boleh bersumber dari harga lama. |
| REQ-014 | Form Bid hanya menawarkan harga awal aktif milik vendor untuk card terkait. | FCL menampilkan dropdown wajib Pelayaran, FTL menampilkan dropdown wajib Jenis Kendaraan, Harga Baru wajib numerik berformat Rupiah ribuan, dan opsi dropdown terbatas pada penawaran aktif vendor untuk lelang serta jenis armada/kontainer tersebut. |
| REQ-015 | Sistem menolak bid bila vendor belum mempunyai harga penawaran awal. | Dropdown kosong dan klik Bid Harga menampilkan alert “Anda belum memiliki harga penawaran pada lelang ini. Silakan input harga melalui menu Input Harga Penawaran”; tidak ada data bid tersimpan. |
| REQ-016 | Sistem memvalidasi Harga Baru terhadap harga sebelumnya untuk pelayaran/jenis kendaraan yang sama. | Harga lebih besar menampilkan alert “Tidak Dapat Bid Harga – Harga penawaran tidak boleh lebih besar dari harga sebelumnya”; harga sama menampilkan alert “Tidak Dapat Bid Harga – Harga penawaran sama dengan harga sebelumnya”; kosong/0 menampilkan helper dan border error. |
| REQ-017 | Sistem mengonfirmasi dan menyimpan bid valid selama lelang masih buka. | Klik Bid Harga yang valid menampilkan konfirmasi “Apakah Harga Telah Sesuai? Harga tidak dapat diubah setelah melewati tanggal tutup lelang” dengan Batal/Ya; Batal tidak menyimpan; Ya menyimpan harga baru, mewarisi PPN/PPh/Mulai Berlaku/Deskripsi/jadwal FCL, menandai harga lama Tidak Berlaku, memperbarui Top 3, mereset form, dan menampilkan toast sukses. |
| REQ-018 | Bid hanya dapat disimpan selama periode buka dan semua perubahan tercatat. | Tidak ada batas jumlah bid selama buka; tiap bid masuk Riwayat Harga Penawaran dan Riwayat Perubahan; submit setelah tutup menampilkan alert “Harga penawaran sudah melewati tanggal tutup lelang” tanpa menyimpan; setelah tutup vendor tidak dapat mengubah/menghapus harga. |
| REQ-019 | Vendor dapat membuka Detail Lelang Spot Rate dari card. | Link Detail Lelang mengarahkan vendor ke halaman Detail Lelang untuk nomor lelang yang dipilih. |
| REQ-020 | Vendor dapat melihat riwayat harga miliknya sendiri pada konteks card. | Link Riwayat Harga Penawaran membuka pop-up read-only berisi No. Lelang, Jenis Pengiriman, Jenis Armada/Kontainer, Skema Pengiriman untuk FCL, rute serta alamat, dan tabel yang hanya memuat harga awal serta seluruh bid vendor tersebut. |
| REQ-021 | Tabel riwayat mendukung kolom, filter, sorting, dan pagination yang ditentukan. | Kolom: No, Pelayaran (FCL)/Jenis Kendaraan (FTL), Harga Penawaran (DPP), Tanggal Input; setiap kolom dapat di-sort; filter default Semua; urutan default tanggal terbaru; jumlah data default 20 dan pagination tersedia. |

### Aturan Validasi

| Area/field | Aturan |
|---|---|
| Akses card | Vendor harus termasuk daftar undangan, lelang Spot Rate harus FTL/FCL dan berstatus Sedang Buka. |
| Filter tanggal/periode | Buka Lelang, Tutup Lelang, dan Periode Pengiriman diperlakukan sebagai rentang; batas awal tidak boleh sesudah batas akhir. |
| Filter pelabuhan | Hanya diterapkan pada lelang FCL. |
| Pelayaran / Jenis Kendaraan | Wajib; opsi harus berasal dari harga penawaran aktif vendor pada lelang dan jenis card yang sama. |
| Harga Baru | Wajib, angka Rupiah/DPP, nilai lebih dari 0, dan harus lebih rendah dari harga sebelumnya untuk opsi yang sama. |
| Periode bid | Status harus masih Sedang Buka pada saat penyimpanan server; penutupan yang terjadi setelah form dibuka tetap menggagalkan penyimpanan. |
| Privasi | Nama dan nominal milik vendor lain tidak boleh terlihat, termasuk saat vendor belum masuk Top 3. |
| Riwayat | Data dibatasi pada vendor yang login, nomor lelang, dan jenis armada/kontainer card yang dibuka. |

### Aktor dan Hak Akses

| Aktor | Hak akses |
|---|---|
| Vendor terundang | Melihat card lelang aktif yang mengundangnya, melihat posisi/harga sendiri, memfilter daftar, mengirim bid dari penawaran awal aktif miliknya, melihat riwayat harga sendiri, dan membuka detail lelang. |
| Vendor tidak terundang | Tidak melihat card lelang tersebut dan tidak dapat melakukan bid atau membaca riwayatnya. |
| Sistem | Mengatur visibilitas card berdasarkan waktu/status, menghitung countdown/ranking/total, menjaga masking data vendor lain, memvalidasi serta mencatat bid, dan memperbarui tampilan real-time. |

### User Flow Utama dan Alternatif

1. Vendor membuka Live Bidding → sistem memuat seluruh card aktif yang relevan → vendor dapat menyaring melalui filter/sub-tab dan pagination.
2. Vendor memilih Pelayaran/Jenis Kendaraan dengan penawaran aktif → mengisi harga yang lebih rendah → klik Bid Harga → meninjau konfirmasi → memilih Ya → sistem menyimpan, memperbarui ranking, mereset form, dan menampilkan toast.
3. Vendor memilih Batal pada konfirmasi → pop-up tertutup dan tidak ada harga baru tersimpan.
4. Vendor tanpa penawaran awal menekan Bid Harga → sistem menampilkan arahan untuk mengisi harga melalui menu Input Harga Penawaran.
5. Vendor mengirim harga kosong, nol, sama, atau lebih tinggi → sistem menolak sesuai jenis validasi tanpa membuat riwayat baru.
6. Lelang menutup ketika form sedang digunakan → validasi server menolak submit dan card kemudian hilang otomatis.
7. Vendor membuka Riwayat Harga Penawaran → sistem menampilkan pop-up data milik sendiri → vendor memfilter, mengurutkan, atau berpindah halaman.
8. Vendor membuka Detail Lelang atau link Multipickup/Multidrop → sistem menuju detail lelang atau membuka pop-up rute yang sesuai.

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

## Assumptions Log

1. Folder `extras` kosong; analisis hanya memakai `spec.txt` dan desain PNG yang akan dianalisis pada tahap berikutnya.
2. Ambang warna countdown ditafsirkan sebagai merah untuk sisa waktu `≤ 1 jam`, oranye untuk `> 1 jam sampai ≤ 24 jam`, dan abu-abu untuk `> 24 jam`.
3. Tanggal/rentang filter dianggap inklusif dan kombinasi batas awal yang lebih besar dari batas akhir dianggap tidak valid, karena spesifikasi tidak mendefinisikan perilakunya.
4. Harga Baru diperlakukan sebagai bilangan bulat Rupiah positif tanpa desimal; batas maksimum tidak ditentukan oleh spesifikasi.
5. Urutan tie-break “jenis armada/kapal” dan “tanggal created” memerlukan urutan deterministik dari backend; skenario memverifikasi konsistensi hasil, dengan tanggal created lebih awal diprioritaskan bila seluruh kriteria sebelumnya sama.
6. Frasa “berlaku di kedua tab” pada aturan sub-tab ditafsirkan sebagai berlaku pada seluruh daftar yang relevan; halaman vendor tetap hanya memiliki satu tampilan Live Bidding tanpa tab Laporan Lelang sesuai general rule.
7. “Top 3 hanya dihitung dari harga baru selama lelang ulang; dan dapat diambil dari harga lama” ditafsirkan bahwa harga lama boleh dijadikan basis/opsi bid, tetapi ranking periode ulang hanya berisi penawaran yang diajukan pada periode ulang.
8. Update real-time diasumsikan dapat diuji dari dua sesi vendor berbeda dan harus tampil tanpa reload manual dalam waktu respons aplikasi yang wajar.
9. Desain `071.png` menampilkan label “Pelayaran” pada seluruh contoh card, termasuk FTL; spesifikasi dianggap sumber kebenaran sehingga implementasi FTL diharapkan memakai label “Jenis Kendaraan”.
10. Header desain menampilkan identitas “Administrator” walaupun konteks fitur adalah POV vendor; hal ini diperlakukan sebagai data mockup dan skenario akses tetap menggunakan aktor Vendor.
11. Tiga PNG merupakan state dari dua layar fungsional: halaman Live Bidding serta dua dialog di atas halaman yang sama; bukan tiga rute halaman terpisah.
