# Analysis — ams007-request-jadwal

## Requirements

### Daftar requirement

| ID | Aktor | Requirement / acceptance criteria |
|---|---|---|
| REQ-001 | Sistem, Shipper | Fitur Request Jadwal hanya tersedia untuk pengiriman FCL; aksi tetap terlihat untuk FCL pada seluruh kondisi kelayakan, tetapi tidak tersedia pada FTL. |
| REQ-002 | Shipper | Shipper dapat membuka halaman Request Jadwal melalui aksi **Request Jadwal** pada menu Lelang Spot Rate atau melalui **Lihat Penawaran → Detail Harga Penawaran → Request Jadwal**; kedua jalur menuju halaman yang sama. |
| REQ-003 | Sistem, Shipper | Request hanya dapat diajukan bila lelang telah tutup, memiliki sedikitnya satu penawaran, belum melewati Rencana Akhir Kirim, dan tidak dibatalkan. Jika tidak layak, sistem menampilkan alert yang sesuai; pada lelang dibatalkan aksi nonaktif/disertai alert. |
| REQ-004 | Shipper | Halaman Request Jadwal menampilkan informasi lelang secara read-only dan daftar seluruh penawaran yang masih dapat dipilih, baik aktif maupun belum mempunyai jadwal; harga kadaluwarsa akibat lelang ulang tidak ditampilkan sebagai pilihan. |
| REQ-005 | Sistem, Shipper | Penawaran tanpa jadwal menampilkan badge merah **Belum Input Jadwal** dan nilai ETD, ETA, Open Stack, serta Closing Time sebagai `-`. |
| REQ-006 | Shipper | Shipper dapat memilih satu atau beberapa penawaran. **Pilih Semua** memilih seluruh penawaran pada halaman, counter `n Terpilih` diperbarui real-time dan mempertahankan hitungan lintas pagination; melepas satu pilihan membuat Pilih Semua tidak lagi tercentang penuh. |
| REQ-007 | Shipper | Sedikitnya satu penawaran wajib dipilih untuk menyimpan. Pada nol pilihan, tombol Simpan nonaktif atau sistem menampilkan error validasi. Tombol Batal kembali tanpa menyimpan. |
| REQ-008 | Shipper, Sistem | Tombol Simpan menampilkan konfirmasi. Setelah dikonfirmasi, request disimpan per harga terpilih, vendor terkait mendapat push notification, lelang masuk tab Request Jadwal, card mendapat penanda warna, dan penawaran menampilkan jumlah request. Pembatalan konfirmasi tidak menyimpan request. |
| REQ-009 | Shipper, Sistem | Request dapat diajukan berulang tanpa batas pada penawaran yang sama; setiap pengajuan menambah jumlah request dan tidak mengubah harga penawaran. |
| REQ-010 | Vendor | Pada menu Penawaran, harga yang memiliki request aktif menampilkan aksi **Update Jadwal**, badge/penanda Request Jadwal, dan masuk tab Request Jadwal. Aksi membuka pop-up Update Jadwal dan hanya tampil selama request belum direspons. |
| REQ-011 | Vendor | Pada menu Lelang Spot Rate, lelang dengan request aktif menampilkan aksi **Respon Request Jadwal**. Aksi membuka halaman Respon Request Jadwal dan hanya tampil selama masih ada request yang belum direspons. |
| REQ-012 | Vendor | Halaman Respon Request Jadwal menampilkan Informasi Umum read-only dan section Pilih Harga Penawaran. Dropdown No. Lelang hanya berisi lelang milik vendor dengan request aktif dan dapat memindahkan konteks tanpa kembali ke daftar. |
| REQ-013 | Vendor | Daftar respons hanya memuat harga penawaran milik vendor yang dipilih, telah di-request, dan belum direspons. Tombol Update pada tiap card membuka pop-up untuk harga tersebut; card hilang setelah jadwal tersimpan. |
| REQ-014 | Vendor, Sistem | Setelah seluruh request suatu lelang direspons, daftar menjadi kosong, lelang keluar dari tab Request Jadwal, dan penanda warna hilang. Tombol Batal kembali ke halaman sebelumnya; tombol Simpan menutup halaman setelah seluruh update selesai. |
| REQ-015 | Vendor | Pop-up Update Jadwal menampilkan informasi harga read-only dan form jadwal kosong untuk menambah jadwal baru, mencakup Jenis Jadwal Kapal (Direct/Connecting), Detail Kapal Utama, dan Data Kapal Connecting. Batal menutup tanpa menyimpan; Kirim menyimpan bila valid. |
| REQ-016 | Vendor, Sistem | Validasi jadwal: Open Stack opsional; Closing Time wajib, lebih besar dari waktu kini dan dari Open Stack bila diisi; ETD wajib dan lebih besar dari Closing Time; ETA wajib dan lebih besar dari ETD; tiap ETD Connecting lebih besar dari ETD sebelumnya dan tidak melebihi ETA. |
| REQ-017 | Sistem, Vendor | Setelah Kirim berhasil, jadwal ditambahkan; penawaran tanpa jadwal berubah ke status **Input Penawaran** dan badge Belum Input Jadwal hilang; request selesai sehingga aksi Update Jadwal dan badge Request Jadwal hilang. |
| REQ-018 | Sistem, Shipper | Jadwal baru langsung tercermin pada Detail Harga Penawaran shipper, termasuk ETD/ETA, Closing Time, Detail Kapal/Info Connecting, dan status tombol Pesan, tanpa mengubah harga penawaran. |
| REQ-019 | Sistem, Vendor | Update jadwal ditolak dengan alert bila melewati Rencana Akhir Kirim atau harga berstatus N/A/kadaluwarsa; update yang berhasil dicatat pada Riwayat Perubahan. |
| REQ-020 | Sistem | Semua tanggal dan waktu pada validasi, tampilan, serta pencatatan Request Jadwal menggunakan zona waktu WIB (UTC+7). |

### Aturan validasi dan status

| Area | Aturan |
|---|---|
| Kelayakan pengajuan | Jenis FCL; lelang Tutup; minimal satu penawaran; waktu belum melewati Rencana Akhir Kirim; lelang tidak Dibatalkan. |
| Alert: belum tutup | `Nomor lelang belum melewati batas tutup lelang` |
| Alert: tanpa penawaran | `Belum ada peserta lelang yang mengajukan penawaran` |
| Alert: lewat batas kirim | `Nomor lelang sudah melewati tgl. rencana akhir kirim. Silahkan hubungi CS` |
| Alert: dibatalkan | Aksi dinonaktifkan dan sistem menampilkan alert pembatalan; naskah pesan tidak ditentukan. |
| Pemilihan penawaran | Minimal satu pilihan; multi-select dan penghitungan lintas halaman didukung. |
| Open Stack | Opsional. |
| Closing Time | Wajib; `Closing Time > waktu sekarang`; jika Open Stack diisi, `Closing Time > Open Stack`. |
| ETD utama | Wajib; `ETD > Closing Time`. |
| ETA | Wajib; `ETA > ETD`. |
| ETD Connecting | `ETD Connecting > ETD sebelumnya` dan `ETD Connecting ≤ ETA`. |
| Zona waktu | Seluruh perbandingan dan tampilan waktu memakai WIB (UTC+7). |

### Aktor dan hak akses

| Aktor | Hak akses utama |
|---|---|
| Shipper | Melihat kelayakan aksi, membuka halaman Request Jadwal, memilih penawaran, membatalkan atau mengonfirmasi request, melihat jumlah request dan jadwal hasil respons. |
| Vendor | Menerima notifikasi, melihat penanda/request aktif miliknya, berpindah lelang aktif, membuka form Update Jadwal, membatalkan atau mengirim jadwal, melihat riwayat perubahan. |
| Sistem | Memvalidasi kondisi lelang/harga/waktu, menyimpan request per penawaran, menjaga status dan counter, mengirim push notification, menyinkronkan tampilan shipper-vendor, dan mencatat riwayat. |

### Alur utama dan alternatif

1. Shipper membuka Request Jadwal melalui salah satu dari dua jalur akses.
2. Sistem memvalidasi kelayakan lelang dan menampilkan informasi serta penawaran eligible.
3. Shipper memilih satu atau lebih penawaran, menekan Simpan, lalu mengonfirmasi.
4. Sistem menyimpan request per penawaran, memberi penanda status, memperbarui counter, dan mengirim notifikasi ke vendor terkait.
5. Vendor membuka request melalui menu Penawaran atau Lelang Spot Rate.
6. Vendor membuka Update Jadwal, mengisi form Direct/Connecting, lalu mengirim jadwal yang valid.
7. Sistem menutup request harga tersebut, memperbarui status dan tampilan shipper, serta mencatat riwayat.
8. Setelah seluruh request terjawab, sistem menghapus lelang/card dari tab Request Jadwal dan penandanya.

Alur alternatif meliputi penolakan pengajuan karena lelang belum tutup, belum ada penawaran, melewati batas kirim, atau dibatalkan; pembatalan pengajuan/konfirmasi/update; validasi pilihan kosong; validasi urutan tanggal; perpindahan No. Lelang; request berulang; serta penolakan update untuk harga N/A/kadaluwarsa.

## UI Inventory

### Lelang Spot Rate — Daftar Lelang Shipper

Sumber desain: `081-list-lelang-spot-rate-shipper.png`. State terlihat mencakup card FCL/FTL dengan status Sedang Buka, Belum Buka, Tutup, Aktif, Dibatalkan, Selesai, Isi Informasi Umum, dan Isi Peserta Lelang; penanda warna pada sisi kiri card; pagination; serta menu aksi card dalam keadaan terbuka.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| Tab Semua Lelang | tab, aktif | `getByRole('tab', { name: 'Semua Lelang' })` | `auction-tab-all` |
| Tab Lelang Ulang | tab + counter | `getByRole('tab', { name: /Lelang Ulang/ })` | `auction-tab-reauction` |
| Tab Request Jadwal | tab + counter `4` | `getByRole('tab', { name: /Request Jadwal/ })` | `auction-tab-schedule-request` |
| Tab Draf | tab + counter | `getByRole('tab', { name: /Draf/ })` | `auction-tab-draft` |
| Filter | button | `getByRole('button', { name: 'Filter' })` | `auction-filter-button` |
| Card lelang | region/listitem; berisi No. Lelang, rute, FCL/FTL, periode, status | `getByRole('listitem').filter({ hasText: '<No. Lelang>' })` | `auction-card-<id>` |
| Menu aksi card | button tanpa label terlihat (ikon tiga titik); perlu `aria-label` | `card.getByRole('button', { name: 'Buka menu aksi' })` | `auction-actions-<id>` |
| Request Jadwal | menuitem, terlihat pada card FCL | `getByRole('menuitem', { name: 'Request Jadwal' })` | `request-schedule-action` |
| Lihat penawaran | menuitem | `getByRole('menuitem', { name: 'Lihat penawaran' })` | `view-offers-action` |
| Pagination | navigation, halaman 1 aktif | `getByRole('navigation', { name: 'Pagination' })` | `auction-pagination` |

### Request Jadwal — Shipper

Sumber desain: `082.png` (nol pilihan) dan `083.png` (empat pilihan). Informasi lelang ditampilkan read-only. State kosong menunjukkan Kirim disabled; state terpilih menyorot card biru, counter `4 Terpilih`, Pilih Semua indeterminate, dan Kirim aktif.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| Informasi No. Lelang dan pengiriman | region read-only: No. Lelang, dibuat, jenis/tipe/skema, pelabuhan, durasi, periode rencana | `getByRole('region', { name: 'Informasi Lelang' })` | `auction-info` |
| Filter | button toggle panel | `getByRole('button', { name: 'Filter' })` | `offer-filter-button` |
| Urutkan | button | `getByRole('button', { name: 'Urutkan' })` | `offer-sort-button` |
| Pelayaran | combobox, placeholder `Pilih Pelayaran` | `getByRole('combobox', { name: 'Pelayaran' })` | `filter-carrier` |
| Vendor | combobox, placeholder `Pilih Vendor` | `getByRole('combobox', { name: 'Vendor' })` | `filter-vendor` |
| Jenis Kontainer | combobox | `getByRole('combobox', { name: 'Jenis Kontainer' })` | `filter-container-type` |
| ETD | textbox/date-time, placeholder `DD/MM/YYYY hh:mm` | `getByRole('textbox', { name: 'ETD' })` | `filter-etd` |
| ETA | textbox/date-time, placeholder `DD/MM/YYYY hh:mm` | `getByRole('textbox', { name: 'ETA' })` | `filter-eta` |
| Jenis Jadwal | combobox | `getByRole('combobox', { name: 'Jenis Jadwal' })` | `filter-schedule-type` |
| Reset / Terapkan | buttons | `getByRole('button', { name: 'Reset' })`, `getByRole('button', { name: 'Terapkan' })` | `filter-reset`, `filter-apply` |
| Pilih Semua | checkbox; unchecked/indeterminate | `getByRole('checkbox', { name: 'Pilih Semua' })` | `select-all-offers` |
| Counter pilihan | status, `n Terpilih` | `getByRole('status').filter({ hasText: /Terpilih/ })` | `selected-offer-count` |
| Checkbox harga | checkbox per card | `card.getByRole('checkbox', { name: /Pilih penawaran/ })` | `offer-select-<id>` |
| Card harga | listitem; pelayaran, Open Stack, Closing, ETD/ETA, vendor, kontainer, harga | `getByRole('listitem').filter({ hasText: '<harga/vendor>' })` | `offer-card-<id>` |
| Badge Belum Input Jadwal | status merah; jadwal kosong tampil `-` | `card.getByText('Belum Input Jadwal', { exact: true })` | `missing-schedule-badge` |
| Detail Biaya / Detail Kapal / Vendor / Info Connecting | link/button pada card | `card.getByRole('button', { name: '<label>' })` | `offer-detail-<jenis>` |
| Batal | button outline | `getByRole('button', { name: 'Batal' })` | `request-cancel` |
| Kirim | button; disabled saat nol pilihan, aktif saat ada pilihan | `getByRole('button', { name: 'Kirim' })` | `request-submit` |
| Pagination harga | navigation | `getByRole('navigation', { name: 'Pagination' })` | `offer-pagination` |

### Daftar Penawaran — Vendor

Sumber desain: `084-list-daftar-penawaran-vendor.png`. State terlihat mencakup filter luas, tab Request Jadwal, badge Request Jadwal pada card, badge Belum Input Jadwal, harga/status aktif maupun kadaluwarsa, detail card expanded, pagination, dan menu aksi terbuka.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| Tab Request Jadwal | tab | `getByRole('tab', { name: 'Request Jadwal' })` | `offer-tab-schedule-request` |
| Filter penawaran | region berisi No. Lelang, Jenis Pengiriman, Status Lelang, kota/pelabuhan, harga, tipe, pelayaran, kontainer, armada | `getByRole('region', { name: 'Filter Penawaran' })` | `offer-filter-panel` |
| Card penawaran | listitem; No. Lelang, rute, jadwal, harga, status dan badge | `getByRole('listitem').filter({ hasText: '<No. Lelang>' })` | `vendor-offer-card-<id>` |
| Badge Request Jadwal | status | `card.getByText('Request Jadwal', { exact: true })` | `schedule-request-badge` |
| Menu aksi | button ikon tiga titik | `card.getByRole('button', { name: 'Buka menu aksi' })` | `vendor-offer-actions-<id>` |
| Lihat Jadwal | menuitem | `getByRole('menuitem', { name: 'Lihat Jadwal' })` | `view-schedule-action` |
| Update Jadwal | menuitem, disorot dalam desain | `getByRole('menuitem', { name: 'Update Jadwal' })` | `update-schedule-action` |
| Riwayat Perubahan | menuitem | `getByRole('menuitem', { name: 'Riwayat Perubahan' })` | `change-history-action` |

### Lelang Spot Rate — Daftar Lelang Vendor

Sumber desain: `086.png`. Struktur daftar, status, penanda warna, tab Request Jadwal, dan pagination sama dengan daftar shipper, tetapi header aktor menunjukkan Vendor. Desain tidak memperlihatkan menu tiga titik dalam keadaan terbuka.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| Tab Request Jadwal | tab + counter `4` | `getByRole('tab', { name: /Request Jadwal/ })` | `vendor-auction-tab-schedule-request` |
| Card lelang vendor | listitem, penanda warna pada sisi kiri | `getByRole('listitem').filter({ hasText: '<No. Lelang>' })` | `vendor-auction-card-<id>` |
| Menu aksi card | button ikon tiga titik | `card.getByRole('button', { name: 'Buka menu aksi' })` | `vendor-auction-actions-<id>` |
| Respon Request Jadwal | menuitem (diturunkan dari spec karena menu tidak terbuka pada PNG) | `getByRole('menuitem', { name: 'Respon Request Jadwal' })` | `respond-schedule-request-action` |

### Respon Request Jadwal — Vendor

Sumber desain: `087.png`. State terlihat berisi empat card penawaran dan tombol Simpan aktif. Informasi umum/harga bersifat read-only; tiga card memiliki badge Belum Input Jadwal.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| No. Lelang | combobox wajib | `getByRole('combobox', { name: 'No. Lelang' })` | `active-request-auction` |
| Informasi Umum | region read-only: jenis/tipe/skema, pelayaran, kontainer, harga, pajak, pelabuhan, biaya, deskripsi | `getByRole('region', { name: 'Informasi Umum' })` | `general-information` |
| Pilih Harga Penawaran | region/list + badge jumlah vendor | `getByRole('region', { name: 'Pilih Harga Penawaran' })` | `requested-offers` |
| Card request | listitem; jadwal, harga, detail dan badge | `getByRole('listitem').filter({ hasText: '<harga/pelayaran>' })` | `requested-offer-card-<id>` |
| Update | button per card | `card.getByRole('button', { name: 'Update' })` | `requested-offer-update-<id>` |
| Batal | button | `getByRole('button', { name: 'Batal' })` | `response-cancel` |
| Simpan | button | `getByRole('button', { name: 'Simpan' })` | `response-save` |

### Pop-up Update Jadwal — Vendor

Sumber desain: `085.png` dan `088.png` (tampilan identik). Modal memperlihatkan pilihan Direct aktif dan field berisi contoh pada Pelayaran/Nama Kapal/Voyage, sedangkan tanggal kosong. Tidak ada pesan error atau state Connecting yang terbuka pada desain.

| Elemen | Jenis/state terlihat | Saran selector Playwright | Saran `data-testid` |
|---|---|---|---|
| Modal Update Jadwal | dialog | `getByRole('dialog', { name: 'Update Jadwal' })` | `update-schedule-dialog` |
| Info harga | region read-only: No. Lelang, Jenis Kontainer, Harga, Mulai Berlaku, PPN, PPh | `dialog.getByRole('region', { name: 'Informasi Harga' })` | `offer-price-information` |
| Direct | radio/card, terpilih | `dialog.getByRole('radio', { name: /Direct/ })` | `schedule-type-direct` |
| Connecting | radio/card | `dialog.getByRole('radio', { name: /Connecting/ })` | `schedule-type-connecting` |
| Pelayaran | combobox wajib, contoh `Meratus` | `dialog.getByRole('combobox', { name: 'Pelayaran' })` | `schedule-carrier` |
| Nama Kapal | textbox wajib, contoh `KM TIDAR` | `dialog.getByRole('textbox', { name: 'Nama Kapal' })` | `schedule-vessel-name` |
| Voyage | textbox wajib, contoh `088` | `dialog.getByRole('textbox', { name: 'Voyage' })` | `schedule-voyage` |
| Open Stack | input tanggal, placeholder `DD/MM/YYYY`; desain memberi tanda `*` | `dialog.getByRole('textbox', { name: 'Open Stack' })` | `schedule-open-stack` |
| Closing Time | input tanggal wajib | `dialog.getByRole('textbox', { name: 'Closing Time' })` | `schedule-closing-time` |
| Berangkat (ETD) | input tanggal wajib | `dialog.getByRole('textbox', { name: 'Berangkat (ETD)' })` | `schedule-etd` |
| Tiba (ETA) | input tanggal wajib | `dialog.getByRole('textbox', { name: 'Tiba (ETA)' })` | `schedule-eta` |
| Tutup modal | button ikon X | `dialog.getByRole('button', { name: 'Tutup' })` | `update-schedule-close` |
| Batal | button | `dialog.getByRole('button', { name: 'Batal' })` | `update-schedule-cancel` |
| Kirim | button utama | `dialog.getByRole('button', { name: 'Kirim' })` | `update-schedule-submit` |

## Assumptions Log

- Kalimat pembuka menyebut FTL dan FCL, tetapi General Rule secara eksplisit menyatakan Request Jadwal hanya berlaku untuk FCL. Aturan eksplisit dipakai: fitur tidak tersedia untuk FTL.
- Tidak ada folder/file `extras`; seluruh analisis requirement hanya bersumber dari `spec.txt` dan desain PNG.
- Pesan alert untuk lelang Dibatalkan serta harga N/A/kadaluwarsa tidak ditentukan; scenario akan memverifikasi makna pesannya, bukan teks persis.
- “Pilih Semua” ditafsirkan memilih seluruh penawaran pada halaman aktif, sedangkan counter tetap mengakumulasi pilihan lintas pagination, sesuai bunyi spesifikasi.
- Batas jumlah item per halaman, format tanggal/jam, jumlah maksimum kapal connecting, nilai/label field detail kapal, dan teks konfirmasi tidak ditentukan; data uji representatif akan digunakan.
- Karena seluruh waktu memakai WIB, “waktu saat ini” ditafsirkan sebagai waktu sistem dalam UTC+7, termasuk pada batas pergantian tanggal.
- Aksi pada kondisi tidak layak disebut tetap ditampilkan, sementara kasus lelang Dibatalkan disebut disable. Ditafsirkan bahwa aksi FCL tetap tampak; khusus Dibatalkan kontrol nonaktif dan alert dapat muncul melalui interaksi/indikator yang disediakan UI.
- Desain `082.png`/`083.png` memberi label tombol akhir pengajuan **Kirim**, sedangkan spec menyebut **Simpan**. Scenario memakai label yang terlihat pada desain, yaitu Kirim, dan tetap memverifikasi perilaku simpan/konfirmasi dari spec.
- Desain modal `085.png`/`088.png` menandai Open Stack dengan `*`, bertentangan dengan spec yang menyatakannya tidak wajib. Aturan bisnis spec diprioritaskan: Open Stack boleh kosong; tanda wajib pada desain dicatat sebagai inkonsistensi UI.
- Desain modal memperlihatkan Pelayaran, Nama Kapal, dan Voyage bertanda wajib walau validasinya tidak dijabarkan dalam spec. Scenario menganggap ketiganya wajib berdasarkan affordance desain.
- `085.png` dan `088.png` identik; keduanya diperlakukan sebagai referensi modal Update Jadwal dari dua jalur masuk yang berbeda.
- Menu aksi pada `086.png` tidak sedang terbuka; label **Respon Request Jadwal** dan selector-nya diturunkan dari spec, bukan teks yang terlihat di gambar.
