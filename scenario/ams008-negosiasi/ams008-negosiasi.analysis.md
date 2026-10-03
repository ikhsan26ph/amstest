# Analysis — ams008-negosiasi

## Requirements

### Aktor dan hak akses

| Aktor | Hak akses utama |
|---|---|
| Shipper | Memulai negosiasi, memilih penawaran, mengirim nominal negosiasi, menanggapi balasan vendor, mengakhiri negosiasi, melihat daftar/detail/riwayat, dan tetap memesan penawaran selama negosiasi berjalan. |
| Vendor | Melihat negosiasi yang ditujukan kepadanya, menerima, menolak, atau mengajukan harga balasan, serta melihat detail dan riwayat negosiasi. |

### Daftar requirement

| ID | Requirement | Acceptance criteria utama |
|---|---|---|
| REQ-001 | Shipper hanya dapat memulai negosiasi dari Detail Harga Penawaran untuk lelang FTL/FCL yang sudah Tutup/Aktif, memiliki penawaran, dan belum melewati Rencana Akhir Kirim. | Aksi selalu terlihat; kondisi valid membuka halaman Ajukan Nego. Kondisi Belum Buka, Sedang Buka, Selesai, Dibatalkan, Lelang Ulang, tanpa penawaran, atau lewat Rencana Akhir Kirim menampilkan alert dan tidak berpindah halaman. Untuk kondisi tanggal lewat, pesan adalah `Nomor lelang sudah melewati tgl. rencana akhir kirim`. |
| REQ-002 | Hanya penawaran aktif yang memenuhi syarat yang dapat dinegosiasikan. | Penawaran Tidak Berlaku/Kadaluwarsa tidak dapat dinego. Untuk FCL, jadwal yang melewati Closing Time tidak dapat dinego. Penawaran tak memenuhi syarat tidak tampil sebagai opsi di halaman Ajukan Nego. |
| REQ-003 | Satu penawaran dapat menerima maksimal lima putaran negosiasi dari shipper. | Pengajuan awal dan setiap Ajukan Nego Kembali masing-masing menambah satu putaran; balasan vendor tidak menambah putaran; pengajuan keenam ditolak dengan alert. Card penawaran yang pernah dinego menampilkan penanda, misalnya `Nego 2x`. |
| REQ-004 | Batas waktu respons mengikuti pengaturan shipper dan diterapkan kepada pihak yang sedang ditunggu. | Timer vendor dimulai saat status Menunggu Vendor/Perlu Aksi vendor; timer shipper dimulai setelah balasan vendor. Keterlambatan respons vendor menghasilkan status Tidak Direspons pada sisi shipper. Seluruh waktu menggunakan WIB. |
| REQ-005 | Sistem memetakan status sesuai sudut pandang dan mengakhiri putaran pada status final. | Menunggu Vendor (shipper) berpasangan dengan Perlu Aksi (vendor); Perlu Aksi (shipper) dengan Menunggu Shipper (vendor). Diterima, Ditolak, Nego Berakhir, Tidak Direspons, dan Harga Tidak Berlaku bersifat final untuk putaran tersebut. |
| REQ-006 | Negosiasi otomatis berhenti ketika penawaran menjadi tidak berlaku di luar proses negosiasi. | Bid baru vendor, lelang ulang, lewat Closing Time FCL, atau lewat Rencana Akhir Kirim mengubah status negosiasi menjadi Harga Tidak Berlaku dan mencegah aksi lanjutan. |
| REQ-007 | Halaman Ajukan Nego menampilkan informasi lelang read-only dan mendukung pemilihan satu atau banyak penawaran yang valid. | Filter dan Urutkan mengikuti Detail Harga Penawaran. Pilih Semua dan counter `n Terpilih` berlaku lintas halaman. Batal kembali tanpa menyimpan. Kirim tanpa pilihan menampilkan error. |
| REQ-008 | Nominal Negosiasi wajib berupa nilai rupiah numerik lebih dari nol dan satu nominal berlaku pada semua penawaran terpilih. | Field menampilkan format ribuan; kosong, nonnumerik, nol, dan negatif ditolak; nilai valid diterapkan ke seluruh pilihan. Nominal yang dibandingkan dan disimpan adalah harga sesudah PPN dan PPh sesuai card penawaran. |
| REQ-009 | Pengajuan tunggal harus lebih rendah dari harga aktif dan tidak boleh lebih tinggi dari nominal negosiasi putaran pertama. | Nilai sama/lebih tinggi dari harga aktif menampilkan `Nominal nego tidak dapat lebih tinggi dari harga sebelumnya`; pada putaran berikutnya, nilai di atas nego pertama menampilkan `Nominal nego tidak dapat lebih tinggi dari nominal nego sebelumnya`. |
| REQ-010 | Pengajuan bulk menyaring penawaran dengan harga aktif yang lebih rendah atau sama dengan nominal negosiasi. | Pop-up `Nominal Nego Belum Sesuai` menampilkan nominal dan daftar terkait. `Cek Kembali` menutup pop-up tanpa mengubah pilihan; `Proses Harga yang Sesuai` mengeluarkan penawaran tak sesuai dan melanjutkan validasi/konfirmasi. |
| REQ-011 | Pengajuan bulk menyaring penawaran yang nominal barunya melebihi nominal nego putaran pertama. | Pop-up `Nominal Melebihi Nego Sebelumnya` menampilkan vendor, pelayaran/armada, dan nego pertama. `Cek Kembali` mempertahankan pilihan; `Proses Sisanya` mengeluarkan item terkait. Tombol disable dan keterangan `Tidak ada penawaran yang dapat diproses` tampil jika tidak ada sisa. |
| REQ-012 | Pengajuan valid harus dikonfirmasi sebelum diproses. | Konfirmasi menampilkan pertanyaan dan jumlah penawaran, dengan Batal/Ajukan. Ajukan membuat satu proses per penawaran, menaikkan putaran, memasangkan status Menunggu Vendor/Perlu Aksi, memulai timer, memberi penanda `Proses Nego`, kembali ke Detail Harga Penawaran, dan menampilkan toast sukses. |
| REQ-013 | Daftar Negosiasi shipper menampilkan proses lintas lelang dan memisahkan Tidak Direspons. | Satu baris mewakili satu penawaran dan status putaran terakhir. Tab Semua, Perlu Aksi, Menunggu Vendor, dan Selesai beserta counter bekerja; Selesai mencakup Diterima, Ditolak, Nego Berakhir, Harga Tidak Berlaku. Tidak Direspons hanya muncul melalui tombol/halaman khusus. Urutan default berdasarkan update terbaru. Filter dan sort mengikuti desain. |
| REQ-014 | Menu aksi shipper mengikuti status negosiasi. | Perlu Aksi: Detail, Terima, Riwayat; Menunggu Vendor: Detail, Riwayat; Ditolak/Diterima: Detail, Ajukan Kembali, Riwayat; Tidak Direspons: Detail, Ajukan Kembali; Nego Berakhir: Detail, Riwayat; Harga Tidak Berlaku: Detail. Ajukan Kembali tetap tunduk pada REQ-002, REQ-003, REQ-008, dan REQ-009. |
| REQ-015 | Detail Negosiasi shipper menampilkan data terbaru dan riwayat serta menyediakan aksi sesuai status. | Informasi lelang/penawaran read-only; data terbaru memuat harga awal, nego terakhir, harga saat ini, putaran, tanggal pengajuan/respons, dan catatan vendor. Ajukan Nego dan Akhiri Nego hanya tampil saat berjalan; Ajukan aktif hanya pada Perlu Aksi. Akhiri terkonfirmasi menjadi Nego Berakhir. Riwayat memuat kolom yang ditentukan dan Harga Baru `-` untuk status yang tidak menghasilkan harga baru. |
| REQ-016 | Ajukan Nego dari Detail shipper memvalidasi nominal dan batas putaran. | Pop-up memuat No. Lelang, Harga Penawaran Awal, Harga Saat Ini, dan Nominal Negosiasi wajib. Nilai harus lebih rendah dari harga saat ini, tidak di atas nego pertama, dan putaran belum lima; Kirim memunculkan konfirmasi lalu menaikkan putaran dan mengubah status ke Menunggu Vendor. |
| REQ-017 | Daftar dan Detail Negosiasi vendor menampilkan data serta aksi berdasarkan status vendor. | Tab Semua, Perlu Aksi, Menunggu Shipper, Selesai dan counternya bekerja; Tidak Direspons tidak tersedia. Perlu Aksi menampilkan sisa waktu serta menu Detail, Terima, Tolak, Ajukan Balasan, Riwayat. Menunggu Shipper: Detail/Riwayat; Ditolak/Diterima: Detail/Riwayat; Nego Berakhir/Harga Tidak Berlaku: Detail. Detail Perlu Aksi menampilkan tombol aksi dan tooltip sisa respons. |
| REQ-018 | Vendor dapat menerima nominal negosiasi yang masih valid. | Konfirmasi `Anda yakin terima nego?` menampilkan nominal. Persetujuan mengubah status menjadi Diterima dan nominal shipper menjadi harga aktif penawaran. Aksi setelah timer habis atau penawaran tidak aktif ditolak dengan alert. |
| REQ-019 | Vendor dapat menolak negosiasi dengan alasan wajib. | Pop-up menyediakan textarea dan chip alasan cepat; chip mengisi teks yang tetap dapat diedit. Tanpa alasan tidak dapat diproses. Tolak mengubah status menjadi Ditolak, mempertahankan harga aktif, dan menampilkan alasan sebagai Catatan Vendor. Aksi kedaluwarsa/tidak aktif ditolak. |
| REQ-020 | Vendor dapat mengajukan harga balasan di antara nominal nego terbaru dan harga aktif. | Pop-up menampilkan data read-only dan field wajib. Nominal harus lebih besar dari nominal nego terbaru serta lebih kecil dari harga saat ini. Kirim mengubah status menjadi Perlu Aksi bagi shipper/Menunggu Shipper bagi vendor dan memulai timer shipper; batas bawah/atas dan kondisi kedaluwarsa/tidak aktif ditolak. |
| REQ-021 | Semua aktivitas negosiasi tercatat dan dampak harga mengikuti status akhir. | Riwayat dapat dilihat kedua aktor. Diterima mengganti harga aktif, tampil di Detail Harga Penawaran, digunakan saat Pesan, dan dihitung dalam PPN/PPh, sementara harga lama tetap di riwayat. Ditolak/Nego Berakhir tidak mengubah harga. Pemesanan saat nego berjalan memakai harga aktif saat itu. |

### Aturan validasi

| Area | Aturan |
|---|---|
| Nominal negosiasi shipper | Wajib, numerik, `> 0`, format rupiah ribuan, `< harga aktif`, dan pada putaran berikutnya `<= nominal nego putaran pertama`. |
| Pilihan penawaran | Minimal satu penawaran valid saat Kirim; pilihan dan counter dipertahankan lintas pagination. |
| Putaran | Maksimal lima pengajuan nominal oleh shipper per penawaran. |
| Nominal balasan vendor | Wajib, `> nominal nego terbaru` dan `< harga aktif`. |
| Alasan penolakan vendor | Wajib; dapat dimulai dari chip dan kemudian diedit. |
| Jendela aksi | Penawaran harus aktif dan aksi dilakukan sebelum batas respons berakhir. |
| Waktu | Semua tanggal, waktu, timer, dan pengurutan waktu mengacu pada WIB. |

### Alur utama dan alternatif

1. Shipper membuka Detail Harga Penawaran, memilih Ajukan Nego, memilih penawaran valid, mengisi nominal, melewati validasi berurutan, mengonfirmasi, lalu sistem membuat satu proses nego untuk setiap penawaran.
2. Vendor merespons sebelum timer habis dengan menerima, menolak, atau mengajukan balasan.
3. Jika vendor mengajukan balasan, shipper dapat mengajukan nominal berikutnya, menerima melalui aksi yang tersedia, atau mengakhiri proses.
4. Kedua pihak dapat memantau status dan riwayat; status final menutup putaran.
5. Alur alternatif mencakup timeout, penawaran menjadi tidak berlaku, penyaringan sebagian/seluruh item bulk, batas lima putaran, dan pemesanan ketika negosiasi masih berjalan.

## UI Inventory

Desain yang dianalisis: `089.png`–`114.png`, termasuk `091a-alert.png`.

### Detail Harga Penawaran — Shipper (FCL/FTL)

Sumber: `089.png`, `109.png`. State yang tampak meliputi status lelang Tutup/Sedang Buka; card aktif, Belum Input Jadwal, Tidak Berlaku, Kadaluwarsa; tombol Pesan aktif/disabled.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Ajukan Nego | Tombol selalu terlihat | `getByRole('button', { name: 'Ajukan Nego' })`; `data-testid=offer-negotiate` |
| Filter, Urutkan, Request Jadwal | Tombol | role `button` + nama terlihat; `data-testid=offer-filter`, `offer-sort`, `request-schedule` |
| Filter FCL | Combobox Pelayaran, Vendor, Jenis Kontainer, Jenis Jadwal; textbox ETD/ETA | `getByRole('combobox', { name: ... })`, `getByLabel('ETD')`; `data-testid=filter-*` |
| Filter FTL | Combobox Vendor/Jenis Armada; input Target Waktu Perjalanan | `getByRole('combobox', { name: ... })`, `getByLabel('Target Waktu Perjalanan')` |
| Reset, Terapkan | Tombol filter | role `button` + nama; `data-testid=filter-reset`, `filter-apply` |
| Card penawaran | Card/list item berisi vendor/armada/pelayaran, jadwal, harga sesudah pajak | `getByTestId('offer-card-<id>')`; teks vendor/harga sebagai pemeriksaan |
| Detail Biaya/Kapal/Armada/Vendor/Info Connecting | Link/aksi card | role `link` atau `button` + nama; `data-testid=offer-<detail>` |
| Pesan | Tombol aktif/disabled | `getByRole('button', { name: /Pesan|Tidak Berlaku|Kadaluwarsa/ })`; `data-testid=offer-order` |

### Ajukan Nego — Shipper (FCL/FTL)

Sumber: `090.png`, `091.png`, `110.png`. State: awal tanpa pilihan (tombol Nego disabled), multi-terpilih dengan card biru, sticky footer Nominal Negosiasi, dan tombol Kirim.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Informasi lelang | Panel read-only | `getByTestId('auction-summary')` |
| Filter dan Urutkan | Tombol; panel berisi filter yang sama dengan detail penawaran | role `button` + nama; `data-testid=negotiate-filter`, `negotiate-sort` |
| Pilih Semua | Checkbox | `getByRole('checkbox', { name: 'Pilih Semua' })`; `data-testid=select-all-offers` |
| Checkbox penawaran | Checkbox per card | `getByTestId('select-offer-<id>')`; beri accessible name nama vendor/armada |
| Counter terpilih | Status teks, contoh `4 Terpilih` | `getByTestId('selected-offer-count')` |
| Nominal Negosiasi | Textbox wajib, prefix `Rp`, default `0` | `getByRole('textbox', { name: 'Nominal Negosiasi' })`; `data-testid=negotiation-amount` |
| Batal | Tombol sekunder | `getByRole('button', { name: 'Batal' })`; `data-testid=cancel-negotiation` |
| Nego/Kirim | Tombol primer disabled/enabled | `getByRole('button', { name: /Nego|Kirim/ })`; `data-testid=submit-negotiation` |
| Pagination/jumlah data | Combobox 20 data dan navigasi halaman | `getByTestId('page-size')`, `getByLabel('Halaman berikutnya')` |

### Dialog validasi dan konfirmasi pengajuan shipper

Sumber: `091a-alert.png`, `099.png`; dialog `Nominal Melebihi Nego Sebelumnya` berasal dari spesifikasi karena dinyatakan belum ada di desain.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Nominal Nego Belum Sesuai | Dialog dengan daftar harga invalid | `getByRole('dialog', { name: 'Nominal Nego Belum Sesuai' })`; `data-testid=amount-mismatch-dialog` |
| Cek Kembali | Tombol sekunder dialog | `getByRole('button', { name: 'Cek Kembali' })` |
| Proses Harga yang Sesuai | Tombol primer dialog | `getByRole('button', { name: 'Proses Harga yang Sesuai' })` |
| Nominal Melebihi Nego Sebelumnya | Dialog spesifikasi, daftar vendor dan nego pertama | `getByRole('dialog', { name: 'Nominal Melebihi Nego Sebelumnya' })`; `data-testid=previous-negotiation-dialog` |
| Proses Sisanya | Tombol primer/disabled | `getByRole('button', { name: 'Proses Sisanya' })`; `data-testid=process-remaining` |
| Ajukan Nego dari detail | Dialog berisi data read-only dan Nominal Negosiasi | `getByRole('dialog', { name: 'Ajukan Nego' })`; textbox berdasarkan label; `data-testid=renegotiate-dialog` |
| Konfirmasi Ajukan | Dialog konfirmasi dari spesifikasi | `getByRole('dialog', { name: /yakin.*mengajukan nego/i })`; tombol Batal/Ajukan |

### Daftar Negosiasi — Shipper

Sumber: `092.png`, `111.png`. State status yang tampak: Perlu Aksi, Menunggu Vendor, Ditolak, Tidak Direspons, Nego Berakhir, Harga Tidak Berlaku, Diterima.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Filter | Tombol pembuka/panel | `getByRole('button', { name: 'Filter' })`; `data-testid=negotiation-filter` |
| Nego Tidak Direspons | Tombol menuju daftar khusus (tampak di `092.png`) | `getByRole('button', { name: 'Nego Tidak Direspons' })`; `data-testid=unresponded-negotiations` |
| Filter daftar | ID Order, Jenis Order, Vendor, Kota Asal/Tujuan, Total Harga, Tipe/Skema Pengiriman, Drop Point Asal/Tujuan, Status | `getByLabel(<label>)`; `data-testid=filter-<nama>` |
| Reset/Terapkan | Tombol | role `button` + nama |
| Tab status | Semua, Perlu Aksi, Menunggu Vendor, Selesai + counter | `getByRole('tab', { name: /Perlu Aksi/ })`; `data-testid=tab-<status>` |
| Tabel negosiasi | Kolom No. Lelang/Vendor, Rute, Unit/Pelayaran, Harga Terbaru/Awal, Status/Putaran | `getByRole('table', { name: 'Daftar Negosiasi' })`; row berdasarkan nomor lelang/vendor |
| Menu aksi | Tombol elipsis per baris | `getByRole('button', { name: 'Aksi <nomor lelang>' })`; `data-testid=negotiation-actions-<id>` |
| Pagination | Navigasi halaman | accessible labels halaman/berikutnya/sebelumnya |

### Detail Negosiasi — Shipper (FCL/FTL)

Sumber: `093.png`–`099.png`, `112.png`. State: Menunggu Vendor, Perlu Aksi, Ditolak, Nego Berakhir, Diterima; tooltip sisa waktu; modal Ajukan Nego.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Status negosiasi | Badge | `getByTestId('negotiation-status')`; teks status |
| Informasi lelang/penawaran | Panel read-only | `getByTestId('auction-offer-summary')` |
| Data Nego Terbaru | Panel harga awal, nominal, harga saat ini, putaran, tanggal, catatan, sisa waktu | `getByTestId('latest-negotiation')`; setiap nilai memakai `data-testid=latest-<field>` |
| Tooltip Sisa Waktu Respons | Ikon info + tooltip | `getByLabel('Info sisa waktu respons')`; `getByRole('tooltip')` |
| Ajukan Nego | Tombol aktif hanya pada Perlu Aksi | `getByRole('button', { name: 'Ajukan Nego' })`; `data-testid=renegotiate` |
| Akhiri Nego | Tombol saat proses berjalan | `getByRole('button', { name: 'Akhiri Nego' })`; `data-testid=end-negotiation` |
| Riwayat | Tabel sortable: Putaran, Tanggal, Nominal, Konfirmasi Vendor, Harga Baru, Status Terakhir | `getByRole('table', { name: 'Riwayat' })`; `data-testid=negotiation-history` |

### Daftar Negosiasi — Vendor

Sumber: `100.png`, `113.png`. State: Perlu Aksi dengan sisa `3 hari lagi`/`Hari ini`, Menunggu Shipper, Ditolak, Diterima, Harga Tidak Berlaku.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Filter dan seluruh field filter | Sama seperti daftar shipper | role/label sesuai teks; `data-testid=negotiation-filter-*` |
| Tab status | Semua, Perlu Aksi, Menunggu Shipper, Selesai + counter | `getByRole('tab', { name: /Menunggu Shipper/ })`; `data-testid=tab-<status>` |
| Tabel negosiasi | Baris dengan harga, status, putaran, dan sisa respons | `getByRole('table', { name: 'Daftar Negosiasi' })`; `data-testid=vendor-negotiation-row-<id>` |
| Menu aksi | Elipsis per baris | accessible name memuat nomor lelang; `data-testid=negotiation-actions-<id>` |

### Detail Negosiasi — Vendor (FCL/FTL)

Sumber: `101.png`–`108.png`, `114.png`. State: Menunggu Shipper dan Perlu Aksi; tombol respons aktif hanya pada Perlu Aksi.

| Elemen | Jenis/state | Saran selector Playwright |
|---|---|---|
| Informasi dan status | Panel read-only + badge | `getByTestId('auction-offer-summary')`, `getByTestId('negotiation-status')` |
| Data Nego Terbaru | Harga awal, nominal nego, harga saat ini, putaran, tanggal | `getByTestId('latest-negotiation')` |
| Respon Nego | Grup tombol Terima Nego, Ajukan Balasan, Tolak Nego | `getByRole('group', { name: 'Respon Nego' })`; tombol berdasarkan nama |
| Riwayat | Tabel sortable | `getByRole('table', { name: 'Riwayat' })` |
| Terima Nego | Dialog berisi nominal dan peringatan final, tombol Batal/Ya | `getByRole('dialog', { name: 'Anda Yakin Terima Nego?' })`; `data-testid=accept-negotiation-dialog` |
| Tolak Nego | Dialog textarea wajib, tiga chip alasan, tombol Tolak Nego | `getByRole('dialog', { name: 'Tolak Nego' })`; `getByLabel('Alasan penolakan')`; `data-testid=rejection-reason` |
| Ajukan Balasan | Dialog data read-only + Nominal Balasan wajib, Batal/Kirim | `getByRole('dialog', { name: 'Ajukan Balasan' })`; `getByLabel('Nominal Balasan')`; `data-testid=counter-offer-amount` |

## Assumptions Log

- Tidak ada file pendukung pada `inputs/ams008-negosiasi/extras/`; analisis requirement hanya menggunakan `spec.txt`.
- Istilah “harga saat ini” diperlakukan sebagai harga aktif sesudah PPN dan PPh yang tampil pada card penawaran.
- Counter tab diasumsikan diperbarui segera setelah perubahan status berhasil.
- Status Tidak Direspons diterapkan ketika vendor melewati batas respons, sesuai definisi eksplisit spesifikasi; keterlambatan shipper setelah balasan vendor tidak diberi label final baru karena spesifikasi tidak mendefinisikannya.
- Spesifikasi dijadikan sumber kebenaran ketika berbeda dengan desain: `092.png` dan `111.png` masih menampilkan baris Tidak Direspons di list utama, padahal status tersebut harus hanya berada di halaman khusus.
- Tombol `Tidak Direspons` pada desain vendor `100.png` dianggap artefak desain lama dan tidak dijadikan requirement, karena spesifikasi menyatakan vendor tidak memiliki status/halaman tersebut dan `113.png` juga tidak menampilkannya.
- Chrome aktor pada beberapa gambar modal respons tidak konsisten (contoh `104.png`/`106.png` bertuliskan Shipper); kepemilikan aksi mengikuti spesifikasi dan konteks status, bukan label akun pada mockup.
- `112.png`/`114.png` berlabel FTL tetapi nilai contoh `Jenis Armada` menggunakan istilah kontainer. Skenario memvalidasi struktur UI FTL dengan data armada, bukan nilai contoh yang tidak konsisten itu.
- Dialog `Nominal Melebihi Nego Sebelumnya` belum memiliki desain; struktur elemen dan selector diturunkan langsung dari spesifikasi.
