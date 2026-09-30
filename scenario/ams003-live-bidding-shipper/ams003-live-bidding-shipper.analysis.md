# Analysis — ams003-live-bidding-shipper

## Requirements

### Aktor dan cakupan

- Aktor utama: **Shipper Admin**, dengan akses monitoring lelang spot rate milik shipper.
- Cakupan jenis pengiriman: **FTL** dan **FCL**.
- Lelang kontrak tidak termasuk dalam halaman Live Bidding.
- Shipper Admin tidak dapat memasukkan atau mengubah bid dari halaman ini.

### Daftar requirement

| ID | Requirement | Acceptance criteria utama |
|---|---|---|
| REQ-001 | Akses dan struktur halaman | Halaman hanya memuat lelang Spot Rate milik shipper; tersedia tab `Live Bidding` dan `Laporan Lelang`; lelang kontrak tidak ditampilkan; seluruh waktu menggunakan WIB. |
| REQ-002 | Filter pencarian | Kedua tab menyediakan filter No. Lelang, Buka/Tutup Lelang, Periode Pengiriman, Jenis/Tipe Pengiriman, Kota Asal/Tujuan, dan Pelabuhan Asal/Tujuan; tab laporan menambah Vendor; `Terapkan` menjalankan filter dan `Reset` mengosongkannya. |
| REQ-003 | Aturan filter rute | Filter pelabuhan hanya berlaku untuk FCL; filter kota berlaku untuk FTL dan FCL; rute multipickup/multidrop cocok jika salah satu titik memenuhi filter. |
| REQ-004 | Sub-tab dan pagination | Sub-tab `Semua Jenis Pengiriman` aktif secara default; pilihan FCL/FTL membatasi card pada kedua tab; pagination dan `Tampilkan` bekerja dengan default 20 data per halaman. |
| REQ-005 | Siklus hidup card Live Bidding | Card muncul otomatis saat waktu buka tercapai, termasuk lelang ulang; hilang otomatis saat waktu tutup terlewati atau saat dibatalkan; setelah tutup berpindah ke laporan. |
| REQ-006 | Struktur card dan pemecahan armada | Satu nomor lelang menghasilkan satu card per jenis armada/kontainer; card memuat identitas lelang, badge relevan, rute, armada/kontainer, periode, countdown, Top 3, total penawaran, dan Detail Lelang; badge tipe hanya tampil bila tipe bukan Normal. |
| REQ-007 | Tampilan rute | Normal menampilkan `Kota Asal → Kota Tujuan`; multipickup, multidrop, dan multipoint menampilkan label/link pada sisi terkait dan membuka pop-up detail titik. |
| REQ-008 | Countdown realtime | Countdown memakai format Hari:Jam:Menit:Detik dan berkurang tiap detik menuju waktu tutup; warna abu untuk sisa hari, oranye untuk ≤24 jam, merah untuk ≤1 jam; pada nol card hilang tanpa reload. |
| REQ-009 | Ranking Top 3 | Top 3 diurutkan berdasarkan DPP terendah, lalu waktu input tercepat untuk harga sama, dilanjutkan rating, jumlah menang, jenis armada/kapal, dan created date; vendor baru memiliki rating default 3,0; satu vendor dapat menempati beberapa posisi bila penawarannya berbeda. |
| REQ-010 | Privasi dan realtime Top 3 saat buka | Saat lelang buka nama vendor disembunyikan, nominal tetap terlihat, slot kosong dimasking `Rp •••••••`, dan ranking berubah realtime tanpa reload saat bid diterima. |
| REQ-011 | Total penawaran dan lelang ulang | Total tampil `x dari y Vendor`; x menghitung vendor yang memenuhi input FTL atau harga+jadwal FCL, y adalah vendor diundang, dan x=0 berwarna merah; lelang ulang menghitung penawaran baru serta dapat mengambil harga lama sesuai proses lelang ulang. |
| REQ-012 | Navigasi dari Live Bidding | `Detail Lelang` menuju Detail Lelang Spot Rate yang sesuai; tombol `Lihat Penawaran` tidak tersedia selama lelang masih buka; card diurutkan berdasarkan waktu buka terbaru. |
| REQ-013 | Isi dan retensi Laporan Lelang | Lelang yang tutup muncul otomatis dengan badge `Tutup`; default hanya hasil sampai H+3, hasil lebih lama dapat dicari lewat filter; lelang batal tidak tampil; lelang ulang memiliki penanda; urutan berdasarkan waktu tutup terbaru. |
| REQ-014 | Top 3 dan aksi pada laporan | Setelah tutup ranking terkunci; Top 3 menampilkan nama vendor dan harga termasuk PPN/PPh, slot kosong tetap dimasking; `Lihat Penawaran` menuju Detail Harga Penawaran dan `Detail Lelang` menuju Detail Lelang Spot Rate. |
| REQ-015 | Ekspor laporan | Tombol Export hanya ada di laporan dan menghasilkan `.xlsx` berisi seluruh hasil sesuai filter/sub-tab, tidak terbatas halaman aktif dan mencakup data di luar H+3 jika terfilter; tiap penawaran satu baris, sedangkan lelang tanpa penawaran satu baris kosong; nama file `Laporan_Lelang_<tanggal export>.xlsx`. |

### Aturan validasi dan data uji

| Area | Aturan |
|---|---|
| Rentang tanggal | Tanggal awal tidak boleh melampaui tanggal akhir; waktu ditafsirkan dalam WIB. |
| Jenis pengiriman | Nilai yang didukung pada halaman ini hanya `FTL` dan `FCL`; default sub-tab adalah semua jenis. |
| Jumlah data | Default `Tampilkan` adalah 20; perpindahan halaman tidak boleh mengubah filter aktif. |
| Countdown | Empat segmen numerik non-negatif; transisi warna diuji pada >24 jam, tepat/di bawah 24 jam, tepat/di bawah 1 jam, dan nol. |
| Ranking | Perhitungan per jenis armada/kontainer dan menggunakan DPP untuk urutan saat lelang berjalan. |
| Total FCL | Vendor baru dihitung pada x setelah harga dan jadwal tersedia. |
| Export | Ekstensi `.xlsx`; nama file diawali `Laporan_Lelang_` dan diikuti tanggal ekspor. |

### Alur utama dan alternatif

1. Shipper Admin membuka Live Bidding, melihat sub-tab semua jenis dan card lelang aktif dalam urutan terbaru.
2. Admin menyaring card, berpindah sub-tab FTL/FCL, mengatur jumlah data, atau membuka detail tanpa dapat mengajukan bid.
3. Data countdown, Top 3, dan total penawaran berubah realtime. Ketika lelang selesai, card berpindah otomatis ke laporan.
4. Di laporan, admin dapat mencari hasil historis, membuka detail penawaran/lelang, dan mengekspor seluruh hasil yang cocok.
5. Alur alternatif mencakup lelang ulang, pembatalan, rute multipoint, Top 3 yang belum penuh, tidak ada penawaran, dan lelang lebih lama dari H+3.

## UI Inventory

### Layar Live Bidding Spot Rate — tab Live Bidding (`054.png`)

| Elemen | Tampilan/state | Selector Playwright yang disarankan | Usulan `data-testid` |
|---|---|---|---|
| Tab Live Bidding | Aktif, garis bawah biru | `getByRole('tab', { name: 'Live Bidding' })` | `tab-live-bidding` |
| Tab Laporan Lelang | Tidak aktif | `getByRole('tab', { name: 'Laporan Lelang' })` | `tab-auction-report` |
| Tombol Filter | Outline biru dengan ikon pengaturan | `getByRole('button', { name: 'Filter' })` | `button-filter` |
| Dropdown Tampilkan | Nilai default 20 | `getByRole('combobox', { name: 'Tampilkan' })` | `page-size` |
| No. Lelang | Textbox, placeholder `Masukkan No. Lelang` | `getByRole('textbox', { name: 'No. Lelang' })` | `filter-auction-number` |
| Buka Lelang | Date-time input, placeholder `DD/MM/YYYY hh:mm` | `getByLabel('Buka Lelang')` | `filter-open-at` |
| Tutup Lelang | Date-time input, placeholder `DD/MM/YYYY hh:mm` | `getByLabel('Tutup Lelang')` | `filter-close-at` |
| Periode Pengiriman | Date-time range input | `getByLabel('Periode Pengiriman')` | `filter-delivery-period` |
| Jenis Pengiriman | Combobox `Pilih Jenis Pengiriman` | `getByRole('combobox', { name: 'Jenis Pengiriman' })` | `filter-shipment-kind` |
| Tipe Pengiriman | Combobox `Pilih Tipe Pengiriman` | `getByRole('combobox', { name: 'Tipe Pengiriman' })` | `filter-shipment-type` |
| Kota Asal/Tujuan | Dua combobox | `getByRole('combobox', { name: /Kota Asal|Kota Tujuan/ })` | `filter-origin-city`, `filter-destination-city` |
| Pelabuhan Asal/Tujuan | Dua combobox | `getByRole('combobox', { name: /Pelabuhan Asal|Pelabuhan Tujuan/ })` | `filter-origin-port`, `filter-destination-port` |
| Reset | Tombol outline merah | `getByRole('button', { name: 'Reset' })` | `button-reset-filter` |
| Terapkan | Tombol solid biru | `getByRole('button', { name: 'Terapkan' })` | `button-apply-filter` |
| Sub-tab Semua/FCL/FTL | Semua aktif secara default | `getByRole('tab', { name: /Semua Jenis Pengiriman|FCL|FTL/ })` | `shipment-tab-all`, `shipment-tab-fcl`, `shipment-tab-ftl` |
| Card lelang | Grid 3 kolom; sebagian berbingkai oranye | `getByTestId('auction-card')` lalu filter teks No. Lelang | `auction-card-<auction>-<fleet>` |
| Badge jenis | Badge FTL hijau muda atau FCL ungu muda | `getByText(/^(FTL|FCL)$/)` dalam card | `shipment-kind-badge` |
| Badge Lelang Ulang | Label ungu pada card terkait | `getByText('Lelang Ulang')` dalam card | `rebid-badge` |
| Rute | Teks kota atau link `Multipickup`/`Multidrop` | `getByRole('link', { name: /Multipickup|Multidrop/ })` | `route-origin-detail`, `route-destination-detail` |
| Countdown | Empat kotak Hari/Jam/Menit/Detik; terlihat state abu, oranye, merah | `getByTestId('auction-countdown')` | `auction-countdown` |
| Top 3 | Slot #1–#3; vendor tersembunyi, harga nyata atau masking | `getByTestId('top-three')` | `top-three` |
| Total Penawaran | Contoh `0 dari 10 Vendor` merah atau jumlah normal | `getByText(/\d+ dari \d+ Vendor/)` | `bid-total` |
| Detail Lelang | Link di bawah setiap card | `getByRole('link', { name: 'Detail Lelang' })` | `auction-detail-link` |
| Pagination | Info `Menampilkan 1 - 20 dari 30 data`; first/prev/pages/next/last | `getByRole('navigation', { name: 'Pagination' })` | `auction-pagination` |

State yang terlihat: filter terbuka, daftar terisi, card FTL/FCL, lelang ulang, Top 3 penuh/kosong/sebagian, total penawaran nol/positif, serta countdown abu/oranye/merah. Tidak ada pesan error, loading, empty state, atau tombol Lihat Penawaran pada desain Live Bidding.

### Layar Live Bidding Spot Rate — tab Laporan Lelang (`055.png`)

| Elemen | Tampilan/state | Selector Playwright yang disarankan | Usulan `data-testid` |
|---|---|---|---|
| Tab Laporan Lelang | Aktif, garis bawah biru | `getByRole('tab', { name: 'Laporan Lelang' })` | `tab-auction-report` |
| Tombol Export | Outline biru dengan ikon download | `getByRole('button', { name: 'Export' })` | `button-export` |
| Filter Vendor | Combobox tambahan `Pilih Vendor` | `getByRole('combobox', { name: 'Vendor' })` | `filter-vendor` |
| Filter umum | Sama dengan Live Bidding | Selector berlabel sama seperti tabel sebelumnya | Sama seperti tab Live Bidding |
| Card laporan | Grid 3 kolom dengan identitas/rute/armada/periode | `getByTestId('report-card')` | `report-card-<auction>-<fleet>` |
| Badge Tutup | Badge oranye di area Top 3 | `getByText('Tutup')` dalam card | `closed-badge` |
| Badge Lelang Ulang | Badge ungu pada card terkait | `getByText('Lelang Ulang')` dalam card | `rebid-badge` |
| Top 3 laporan | Slot #1–#3 memuat nama vendor dan nominal, atau masking | `getByTestId('top-three')` | `top-three` |
| Lihat Penawaran | Tombol outline biru selebar card | `getByRole('button', { name: 'Lihat Penawaran' })` | `view-bids-button` |
| Detail Lelang | Link di bawah tombol | `getByRole('link', { name: 'Detail Lelang' })` | `auction-detail-link` |
| Pagination | Sama dengan tab Live Bidding | `getByRole('navigation', { name: 'Pagination' })` | `auction-pagination` |

State yang terlihat: laporan terisi, hasil normal dan lelang ulang, Top 3 penuh/kosong, total penawaran nol/positif, badge Tutup, serta pagination. Desain tidak memperlihatkan dialog konfirmasi ekspor, notifikasi sukses/gagal, loading, empty state, pop-up detail rute, atau pesan validasi filter.

## Assumptions Log

1. Batas warna countdown ditafsirkan inklusif: merah saat sisa waktu ≤1 jam, oranye saat >1 jam dan ≤24 jam, abu saat >24 jam.
2. Frasa “dapat diambil dari harga lama” pada lelang ulang ditafsirkan sebagai harga lama dapat menjadi referensi/sumber awal, tetapi ranking periode ulang hanya memakai bid yang berlaku pada periode ulang.
3. Harga pada laporan dan ekspor menggunakan nilai final termasuk komponen pajak sesuai Detail Harga Penawaran; ranking saat berjalan tetap memakai DPP.
4. Format tanggal pada nama file ekspor tidak ditentukan; pengujian menerima format tanggal lokal yang konsisten dan valid, dengan contoh `Laporan_Lelang_11-09-2026.xlsx`.
5. Rentang tanggal yang terbalik dianggap input tidak valid dan sistem diharapkan tidak menjalankan pencarian sampai dikoreksi.
6. File ekstra `laporan-lelang-spot-rate-11092026.xlsx` terbaca. Template menunjukkan metadata Tanggal Export, Tanggal Lelang, Total Laporan, serta kolom: No, Tgl Lelang, No Lelang, Rute, Periode Pengiriman, Jenis Pengiriman, Deskripsi Barang, Buka Lelang, Tutup Lelang, Ranking, Vendor, Harga Penawaran, Deskripsi Harga.
7. Border oranye pada beberapa card dianggap state penekanan waktu/countdown, bukan kontrol interaktif, karena desain tidak memberi legenda terpisah.
8. Ikon/link Multipickup dan Multidrop diuji sebagai kontrol pembuka dialog meskipun desain PNG tidak memperlihatkan isi dialog.
9. Nama aksesibel dan `data-testid` di UI Inventory adalah target implementasi yang disarankan; keberadaannya perlu dikonfirmasi pada aplikasi aktual.
