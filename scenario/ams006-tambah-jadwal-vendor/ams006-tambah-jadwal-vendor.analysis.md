# Analysis — ams006-tambah-jadwal-vendor

## Requirements

### Daftar Requirement

| ID | Requirement |
|---|---|
| REQ-001 | Fitur jadwal hanya berlaku untuk harga penawaran FCL dan hanya dapat dikelola vendor melalui menu Penawaran; aksi Tambah/Lihat Jadwal tidak tampil untuk FTL. |
| REQ-002 | Satu harga penawaran FCL dapat memiliki banyak jadwal dan setiap jadwal tetap terikat pada harga asalnya serta tidak dapat dipindahkan ke harga lain. |
| REQ-003 | Harga FCL memerlukan minimal satu jadwal aktif agar dapat dipesan shipper. Tanpa jadwal, status vendor adalah `Input Harga`, badge `Belum Input Jadwal` tampil, harga tidak termasuk Penawaran Lengkap, dan tombol Pesan shipper nonaktif. Setelah jadwal pertama tersimpan, status menjadi `Input Penawaran`, harga masuk tab `Penawaran Lengkap`, dan dapat dipesan. |
| REQ-004 | Vendor dapat menambah jadwal sejak Tanggal Buka Lelang sampai sebelum Rencana Akhir Kirim, termasuk setelah lelang ditutup. Simpan yang terjadi setelah batas akhir harus ditolak tanpa menyimpan data. |
| REQ-005 | Aksi jadwal tetap tampil pada kondisi terlarang dan menghasilkan alert yang sesuai. Edit/hapus hanya berhasil sebelum Rencana Akhir Kirim, pada harga yang masih berlaku, dan bila jadwal belum memiliki order. |
| REQ-006 | Menu `Tambah Jadwal` pada card harga membuka form Tambah Jadwal, sedangkan `Lihat Jadwal` membuka halaman Detail Jadwal untuk harga terkait. |
| REQ-007 | Detail Jadwal menampilkan informasi lelang dan harga secara read-only: No. Lelang, Jenis/Tipe/Skema Pengiriman, Pelayaran, Jenis Kontainer, Harga, Mulai Berlaku, PPN, PPh, Pelabuhan Asal–Tujuan, Biaya Termasuk, dan Deskripsi Harga. |
| REQ-008 | Tabel Jadwal menampilkan Tanggal Buat, badge jumlah connecting bila relevan, Nama Kapal dan Voyage, Closing Time dan Open Stack, ETD, ETA, serta aksi Edit dan Hapus; semua kolom dapat diurutkan. Urutan awal adalah Tanggal Buat terbaru dan pagination awal 20 item. |
| REQ-009 | Tabel dapat difilter berdasarkan Tanggal Buat, Nama Kapal, Voyage, Jenis Jadwal, Open Stack, Closing Time, ETD, dan ETA, dengan aksi Reset dan Terapkan. |
| REQ-010 | Badge `nx Connecting` membuka pop-up Detail Kapal Connecting yang menampilkan rangkaian asal (kapal utama, voyage, ETD Asal), setiap transit (kapal, voyage, ETD Connecting), hingga tujuan (ETA Tujuan). |
| REQ-011 | Form Tambah Jadwal menampilkan No. Lelang otomatis dan nonaktif, informasi umum lelang read-only, jumlah/jenis kontainer, asuransi, biaya, serta rute POL–POD dan drop point/alamat. Multipickup/Multidrop ditampilkan sebagai link menuju pop-up Detail. |
| REQ-012 | Vendor wajib memilih tepat satu Jenis Jadwal: Direct atau Connecting. Pergantian jenis menampilkan/menyembunyikan Data Kapal Connecting tanpa reload dan mempertahankan data Detail Kapal Utama. |
| REQ-013 | Detail Kapal Utama memiliki Pelayaran aktif yang otomatis mengikuti harga dan nonaktif, Nama Kapal, Voyage, Open Stack opsional, Closing Time, ETD, dan ETA, dengan validasi wajib serta urutan waktu yang ditentukan. |
| REQ-014 | Jenis Connecting wajib memiliki minimal satu baris kapal connecting. Vendor dapat menambah baris; ikon hapus hanya tampil saat jumlah baris lebih dari satu. Pelabuhan harus unik dan bukan asal/tujuan, semua data baris wajib, urutan waktu harus kronologis, dan badge tabel merefleksikan jumlah baris transit. |
| REQ-015 | Saat Simpan/Kirim, field kosong atau nilai yang melanggar validasi menampilkan helper dan border error lalu halaman bergulir ke field error pertama. |
| REQ-016 | Tombol Batal menampilkan konfirmasi dan dapat kembali ke Detail Jadwal atau Daftar Penawaran tanpa menyimpan perubahan. |
| REQ-017 | Simpan yang valid mencatat Tanggal Buat, kembali ke Detail Jadwal, dan menampilkan toast sukses. Kombinasi Nama Kapal + Voyage + ETD + ETA yang identik tidak boleh diduplikasi pada harga yang sama dan harus menghasilkan alert. |
| REQ-018 | Edit melalui ikon pensil membuka pop-up `Edit Jadwal` berisi data existing dan field/validasi yang sama dengan Tambah Jadwal; Batal menutup tanpa perubahan dan Kirim menyimpan perubahan valid. |
| REQ-019 | Hapus melalui ikon hapus membutuhkan konfirmasi. Setelah berhasil, jadwal hilang dari tabel; jika tidak ada jadwal aktif tersisa, harga kembali berbadge `Belum Input Jadwal` dan status vendor kembali `Input Harga`. |
| REQ-020 | Seluruh aktivitas tambah, edit, dan hapus tercatat di Riwayat Perubahan, meliputi field, nilai lama, nilai baru, user, dan waktu. |
| REQ-021 | Perubahan jadwal setelah lelang tutup langsung tercermin pada Detail Harga Penawaran shipper, termasuk ETD/ETA, Closing Time, Detail Kapal/Info Connecting, dan status tombol Pesan. |
| REQ-022 | Vendor dapat mengimpor jadwal menggunakan template Excel `Template Jadwal Kapal Direct`; kolomnya mengikuti Jenis Jadwal, Pelayaran, Nama Kapal, Voyage, Open Stack, Closing Time, ETD, dan ETA, dan nilai dengan format tidak sesuai ditampilkan kosong pada field. |

### Aturan Validasi

| Area/Field | Aturan |
|---|---|
| Jenis Pengiriman | Jadwal hanya untuk FCL; tidak tersedia untuk FTL. |
| Periode Tambah | Mulai Tanggal Buka Lelang dan harus sebelum Rencana Akhir Kirim. |
| Periode Edit/Hapus | Harus sebelum Rencana Akhir Kirim. |
| Status Harga | Edit/hapus ditolak untuk N/A, Tidak Berlaku, atau Kadaluwarsa. |
| Status Jadwal | Edit/hapus ditolak jika jadwal sudah digunakan pada order. |
| Jenis Jadwal Kapal | Wajib; single select Direct atau Connecting. |
| Pelayaran | Wajib; berasal dari master aktif, otomatis sama dengan pelayaran harga, dan nonaktif. |
| Nama Kapal | Wajib; teks. |
| Voyage | Wajib; teks. |
| Open Stack | Opsional; datetime. |
| Closing Time | Wajib; datetime; tidak boleh lebih kecil dari waktu sekarang atau Tanggal Mulai Berlaku harga; bila Open Stack diisi, harus lebih besar dari Open Stack. |
| Berangkat (ETD) | Wajib; datetime; harus lebih besar dari Closing Time. |
| Tiba (ETA) | Wajib; datetime; harus lebih besar dari ETD. |
| Baris Connecting | Minimal satu untuk jenis Connecting. |
| Pelabuhan Connecting | Wajib; master aktif; berbeda dari asal, tujuan, dan semua transit lain. |
| Kapal Connecting | Wajib; teks. |
| Voyage Connecting | Wajib; teks. |
| ETD Connecting | Wajib; datetime; lebih besar dari ETD utama untuk baris pertama atau ETD transit sebelumnya untuk baris berikutnya; tidak melebihi ETA tujuan. |
| Duplikasi Jadwal | Kombinasi Nama Kapal + Voyage + ETD + ETA harus unik dalam harga yang sama. |

### Aktor dan Hak Akses

| Aktor | Hak akses/perilaku |
|---|---|
| Vendor | Melihat action jadwal pada harga FCL, membuka detail, menambah, mengimpor, mengedit, dan menghapus jadwal sesuai aturan bisnis. |
| Shipper | Melihat perubahan jadwal pada Detail Harga Penawaran dan hanya dapat memakai tombol Pesan jika harga FCL memiliki jadwal aktif. |
| Sistem | Memvalidasi waktu/status/duplikasi, menjaga keterikatan jadwal dengan harga, memperbarui status dan badge, mencatat riwayat, serta menyinkronkan tampilan shipper. |

### User Flow dan Acceptance Criteria

1. Vendor membuka Daftar Penawaran FCL lalu memilih Tambah Jadwal atau Lihat Jadwal pada harga terkait.
2. Pada tambah, sistem memuat informasi harga/lelang secara read-only; vendor memilih Direct/Connecting dan mengisi data kapal.
3. Sistem menolak isian wajib kosong, urutan waktu tidak valid, pelabuhan transit duplikat/terlarang, jadwal duplikat, atau penyimpanan setelah Rencana Akhir Kirim.
4. Penyimpanan valid membuat jadwal terikat pada harga, memperbarui tabel/status/badge, menulis riwayat, dan menyinkronkan Detail Harga shipper.
5. Pada detail, vendor dapat mengurutkan, memfilter, mereset filter, berpaginasi, dan melihat rincian rangkaian connecting.
6. Edit/hapus valid mengubah data/tabel dan riwayat; kondisi terlarang mempertahankan data dan menampilkan alert yang sesuai.
7. Hapus jadwal aktif terakhir mengembalikan harga dan status vendor ke kondisi belum memiliki jadwal serta menonaktifkan pemesanan shipper.
8. Import template Direct memetakan data valid ke form dan mengosongkan nilai yang formatnya tidak sesuai agar dapat dikoreksi.

## UI Inventory

Sumber visual: `074.png`, `075.png`, `075a.png`, `076.png`, `077.png`, `078.png`, `079.png`, dan `080.png`.

### Daftar Penawaran (`074.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Heading | `Daftar Penawaran` | `getByRole('heading', { name: 'Daftar Penawaran' })`; testid `heading-daftar-penawaran` |
| Tombol utama | `Input Harga`, `Filter` | `getByRole('button', { name: 'Input Harga' })`; `getByRole('button', { name: 'Filter' })` |
| Panel filter | No. Lelang (textbox); Jenis Pengiriman, Status Lelang, Kota Asal/Tujuan, Pelabuhan Asal/Tujuan, Tipe Pengiriman, Pelayaran, Jenis Kontainer, Jenis Armada (combobox); Total Harga (textbox); `Reset`, `Terapkan` | Gunakan `getByRole('textbox'/'combobox', { name: <label> })`; testid `filter-<nama-kebab>`; tombol via role/name |
| Tab status | `Semua Penawaran`, `Belum Input Jadwal`, `Penawaran Lengkap`, `Request Jadwal`, `Kadaluwarsa` | `getByRole('tab', { name: <nama> })`; testid `tab-<nama-kebab>` |
| Card harga FCL | No. Lelang, pelayaran, POL–POD, harga, badge FCL/status/kontainer/Tidak Berlaku atau Kadaluwarsa, `Detail Harga`, opsional `Info Connecting`, menu elipsis | Card: `getByTestId('offer-card-<id>')`; link via role/name; menu `getByRole('button', { name: /aksi/i })` dengan testid `offer-actions-<id>` |
| Card harga FTL | Kota asal–tujuan, SLA, harga, badge FTL/status/armada, `Detail Biaya`, `Detail Armada`, `Vendor`, menu elipsis; tidak terlihat link jadwal | Card testid `offer-card-<id>` lalu pastikan menu tidak memuat `Tambah Jadwal`/`Lihat Jadwal` |
| Badge connecting | Contoh `2x Connecting` | `getByRole('button', { name: '2x Connecting' })` atau testid `connecting-badge-<id>` |
| Pagination | Pilihan `Tampilkan 20 data`, ringkasan `Menampilkan 1 - 20 data dari 30 data`, tombol first/previous/page/next/last | `getByRole('combobox', { name: /Tampilkan/i })`; `getByRole('navigation', { name: /pagination/i })`; testid `offer-pagination` |
| State | Card normal, harga merah pada sebagian card, badge Sedang Buka/Tutup/Selesai, Tidak Berlaku/Kadaluwarsa, detail card expanded | Assert text/badge dalam card yang di-scope dengan testid |

### Tambah Jadwal — Direct (`075.png`, `075a.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Heading/breadcrumb | `Tambah Jadwal`; Beranda › Penawaran › Tambah Jadwal | Heading via role; testid `heading-tambah-jadwal`; nav `getByRole('navigation', { name: /breadcrumb/i })` |
| Informasi Umum | No. Lelang bertanda wajib; Jenis/Tipe/Skema Pengiriman, Pelayaran, Jenis Kontainer, Harga, Mulai Berlaku, PPN, PPh, POL–POD, Biaya Termasuk, asuransi, Deskripsi Harga | No. Lelang: `getByRole('combobox', { name: 'No. Lelang' })` menurut visual; blok read-only testid `auction-information` |
| Jenis Jadwal Kapal | Card radio `Direct` dan `Connecting`; Direct terpilih (border/latar biru) | `getByRole('radio', { name: /Direct/ })`; `getByRole('radio', { name: /Connecting/ })`; testid `schedule-type-*` |
| Import | Link `Download Template`, tombol `Import Jadwal` | `getByRole('link', { name: 'Download Template' })`; `getByRole('button', { name: 'Import Jadwal' })`; testid `schedule-import-input` untuk input file tersembunyi |
| Detail Kapal Utama | Pelayaran (combobox), Nama Kapal, Voyage, Open Stack, Closing Time, Berangkat (ETD), Tiba (ETA) | `getByRole('combobox', { name: 'Pelayaran' })`; field teks/tanggal via `getByRole('textbox', { name: <label> })`; testid `<field>-0` |
| Multiple input | `Tambah Baris Input`; `075a.png` memperlihatkan card `Jadwal 1` dan `Jadwal 2`, masing-masing dengan ikon hapus | Tombol `getByRole('button', { name: 'Tambah Baris Input' })`; card `schedule-row-<index>`; hapus `remove-schedule-row-<index>` |
| Aksi form | `Batal`, `Simpan` | `getByRole('button', { name: 'Batal' })`; `getByRole('button', { name: 'Simpan' })` |
| State | Informasi read-only, radio terpilih, satu dan multi-baris; belum ada error/success state visual | State/error disarankan melalui `aria-invalid`, helper terasosiasi `aria-describedby`, testid `error-<field>` |

### Tambah Jadwal — Connecting (`076.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Jenis jadwal | `Connecting` terpilih; card Direct tetap tersedia | Radio via role/name; testid `schedule-type-connecting` |
| Detail Kapal Utama | Field sama dengan Direct | Selector sama dengan layar Tambah Jadwal — Direct |
| Data Kapal Connecting | Pelabuhan Connecting (combobox), Kapal Connecting, Voyage, ETD Connecting; satu baris awal | Scope `getByTestId('connecting-row-0')`; field via role/name atau testid `<field>-0` |
| Tambah transit | `Tambah Kapal Connecting` | `getByRole('button', { name: 'Tambah Kapal Connecting' })`; testid `add-connecting-row` |
| Dynamic state | Section Data Kapal Connecting muncul saat Connecting dipilih dan tidak terlihat pada Direct | `expect(getByTestId('connecting-section')).toBeVisible()/toBeHidden()` |

### Detail Jadwal (`077.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Heading/info read-only | `Detail Jadwal`, No. Lelang dan waktu dibuat, info lelang/harga/rute/biaya/deskripsi | Heading via role; info testid `schedule-auction-information` |
| Tombol | `Tambah Jadwal`, `Filter` | Role/name; testid `add-schedule`, `toggle-schedule-filter` |
| Pagination size | `Tampilkan 20 data` | Combobox bernama `Tampilkan`; testid `schedule-page-size` |
| Filter | Tanggal Buat, Nama Kapal, Voyage, Jenis Jadwal, Open Stack, Closing Time, Berangkat (ETD), Tiba (ETA), tombol `Reset`/`Terapkan` | Textbox/combobox via label; testid `schedule-filter-<field>`; tombol via role/name |
| Tabel | Header Tanggal Buat, Nama Kapal/Voyage, Closing Time/Open Stack, Berangkat (ETD), Tiba (ETA); indikator sort terlihat pada beberapa header | `getByRole('table', { name: /Jadwal/i })`; header via `getByRole('columnheader', { name: <nama> })`; testid `schedule-table` |
| Baris/aksi | Nilai jadwal, badge `2x Connecting`, ikon edit dan hapus | Scope row testid `schedule-row-<id>`; tombol bernama `Edit Jadwal`/`Hapus Jadwal`, testid `edit-*`/`delete-*` |
| Pagination | Ringkasan 1–20 dari 30 dan kontrol halaman | Navigation bernama Pagination; testid `schedule-pagination` |

### Pop-up Detail Kapal Connecting (`078.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Dialog | Judul `Detail Kapal Connecting`, tombol tutup `X`, backdrop | `getByRole('dialog', { name: 'Detail Kapal Connecting' })`; tombol `getByRole('button', { name: /tutup/i })`; testid `connecting-detail-dialog` |
| Rangkaian | Tanjung Perak (asal), Benoa dan Ende (transit), Kupang (tujuan), dengan kapal/voyage dan label ETD Asal/ETD Connecting/ETA Tujuan | Dalam dialog, gunakan text/row testid `connecting-leg-<index>`; endpoint testid `connecting-origin`/`connecting-destination` |

### Pop-up Edit Jadwal (`079.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Dialog | Judul `Edit Jadwal`, tombol tutup | `getByRole('dialog', { name: 'Edit Jadwal' })`; testid `edit-schedule-dialog` |
| Jenis jadwal | Radio Direct terpilih dan Connecting tersedia | Radio via role/name |
| Data existing | Pelayaran `Meratus`, Nama Kapal `KM TIDAR`, Voyage `088`; field waktu tersedia | Field via label dalam scope dialog; testid konsisten dengan form tambah |
| Aksi | `Batal`, `Kirim` | Tombol via role/name; testid `cancel-edit-schedule`, `submit-edit-schedule` |

### Alert Aksi Terlarang (`080.png`)

| Elemen/state | Detail terlihat | Saran selector Playwright |
|---|---|---|
| Dialog alert | Judul visual `Tidak Dapat Edit Harga`; isi `Harga penawaran sudah melewati tanggal rencana akhir kirim`; backdrop | `getByRole('alertdialog')`; testid `schedule-action-alert`; assert heading dan isi |
| Aksi | Tombol `Mengerti` | `getByRole('button', { name: 'Mengerti' })`; testid `dismiss-schedule-alert` |

## Assumptions Log

- Tidak ada file `extras`; analisis hanya menggunakan `spec.txt` dan desain pada folder `designs/`.
- Spesifikasi memotong teks alert untuk jadwal duplikat. Scenario akan memverifikasi alert duplikasi secara semantik tanpa mengasumsikan salinan pesan yang tidak diberikan.
- Alert eksplisit tersedia untuk harga N/A dan Kadaluwarsa; status `Tidak Berlaku` diasumsikan menggunakan keluarga alert harga tidak berlaku/N/A tanpa menetapkan teks persis yang tidak dicantumkan.
- Template import yang dinyatakan hanya `Template Jadwal Kapal Direct`; import Connecting dianggap di luar cakupan sampai ada template atau aturan kolom transit.
- `lebih besar` ditafsirkan ketat: timestamp yang sama dengan batas pembanding tidak valid. `ETD Connecting` boleh sama dengan ETA karena spesifikasi menyatakan tidak boleh *melebihi* ETA.
- Hanya Vendor dan Shipper yang disebut sebagai aktor; konfigurasi master dan audit dilakukan sistem, tanpa mengasumsikan UI admin yang tidak dijelaskan.
- Desain `075.png`/`075a.png` memperlihatkan No. Lelang dan Pelayaran sebagai combobox, sedangkan spesifikasi menyatakan keduanya terisi otomatis/disable. Scenario mengikuti aturan disable dari spesifikasi dan menggunakan role combobox hanya sebagai selector hint visual.
- Desain Direct memperlihatkan `Tambah Baris Input` untuk membuat beberapa jadwal sekaligus. Karena spesifikasi tidak menjelaskan transaksi multi-baris, scenario hanya menguji penambahan/penghapusan baris UI secara dasar dan menerapkan validasi jadwal per baris.
- `079.png` menandai Open Stack wajib pada Edit, bertentangan dengan spesifikasi yang menyatakan opsional. Scenario mengikuti spesifikasi: Open Stack tetap opsional untuk tambah maupun edit.
- Teks alert pada `080.png` (`Tidak Dapat Edit Harga`) berbeda dari teks spesifikasi untuk edit/hapus jadwal. Assertion utama mengikuti pesan bisnis pada spesifikasi; variasi desain dicatat sebagai discrepancy di coverage.
- Mockup menampilkan akun berlabel `Administrator` pada konteks Vendor. Pengujian hak akses tetap memakai aktor Vendor sesuai spesifikasi, tanpa mengasumsikan role Administrator tambahan.
