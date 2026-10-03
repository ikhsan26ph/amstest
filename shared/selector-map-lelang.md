# Selector Map - area `/lelang`

Hasil `/harvest-selectors ams001 ams002` read-only, diverifikasi ulang 2026-09-25. Area ini dipakai bersama modul `ams001-buat-lelang-fcl-shipper` dan `ams002-buat-lelang-ftl`.

Pemetaan browser dilakukan pada `/lelang`, panel Filter, `/lelang/buat` mode FTL, `/lelang/buat` mode FCL, datepicker, dan dialog konfirmasi Batal. Tidak ada submit, simpan draft, upload file, hapus, pembatalan, atau perubahan data.

## Ringkasan Verifikasi

| Item | Hasil |
|---|---|
| Route area | `/lelang` |
| Layar dipetakan | list, filter, form informasi umum FTL, form informasi umum FCL, datepicker, konfirmasi batal |
| Layar di-skip | peserta, detail, edit, tambah peserta, harga, batal lelang, lelang ulang, riwayat perubahan/ulang |
| Alasan skip | butuh lolos step 01, data lelang existing tertentu, atau aksi tulis/mutasi |
| `data-testid` | 0 elemen ditemukan |
| `id` stabil | Tidak ada; hanya `_R_` dan `__next-route-announcer__`, tidak layak selector |
| Dialog | Konfirmasi Batal tampil tanpa `[role="dialog"]` |
| Datepicker | `/lelang/buat` memakai datepicker kustom berbasis `button`, bukan flatpickr |
| Select native | `/lelang` punya satu `<select>` native untuk ukuran halaman |

## Layar yang Dipetakan / Di-skip

| SCR | Route / cara akses | Status | Catatan |
|---|---|---|---|
| list-lelang | `/lelang` | Dipetakan | List, tab/counter, card, paging, tombol utama |
| filter-lelang | `/lelang` -> tombol `Filter` | Dipetakan | 2026-09-25 panel terbuka; berbeda dari catatan awal 2026-09-23 |
| informasi-umum | `/lelang/buat` | Dipetakan | Default FTL; FCL dipilih via card `FCL` |
| peserta-lelang | Step 02 setelah `Selanjutnya` | SKIPPED | Butuh data valid dan klik `Selanjutnya` dapat membuat draft/POST |
| detail-lelang | `/lelang/{id}` | SKIPPED | Butuh memilih data existing yang sesuai skenario |
| edit-lelang | `/lelang/{id}/edit` | SKIPPED | Butuh data existing dan berisiko mutasi bila salah interaksi |
| tambah-peserta | `/lelang/{id}/peserta` | SKIPPED | Butuh data existing dan state peserta |
| harga-penawaran | `/lelang/{id}/penawaran` | SKIPPED | Butuh data existing dan state harga |
| batalkan-lelang | menu aksi card | SKIPPED | Dialog batal lelang dapat dibuka dari data existing, tetapi mutasinya berisiko |
| lelang-ulang | `/lelang/{id}/ulang` | SKIPPED | Butuh lelang eligible |
| riwayat-perubahan | menu aksi card | SKIPPED | Butuh data existing; route eksplisit belum stabil |
| riwayat-lelang-ulang | `/lelang/{id}/riwayat-ulang` | SKIPPED | Butuh data existing |

## list-lelang (`/lelang`)

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| list-lelang | Buat Lelang | `page.getByRole('button', { name: 'Buat Lelang' })` | role | Navigasi ke `/lelang/buat`; tidak ada modal pilih jenis |
| list-lelang | Riwayat Pembatalan | `page.getByRole('button', { name: 'Riwayat Pembatalan' })` | role | Navigasi ke riwayat pembatalan |
| list-lelang | Filter | `page.getByRole('button', { name: 'Filter', exact: true })` | role | 2026-09-25 membuka panel Filter Lelang |
| list-lelang | Tampilkan | `page.locator('select')` | TIDAK STABIL | Satu-satunya `<select>` native; opsi 10/20/50/100 |
| list-lelang | Semua Lelang | `page.getByRole('button', { name: /^Semua Lelang/ })` | role | Elemen berupa button, bukan `role=tab` |
| list-lelang | Lelang Ulang | `page.getByRole('button', { name: /^Lelang Ulang/ })` | role | Nama berisi counter, mis. `Lelang Ulang 1` |
| list-lelang | Request Jadwal | `page.getByRole('button', { name: /^Request Jadwal/ })` | role | Nama berisi counter |
| list-lelang | Draf | `page.getByRole('button', { name: /^Draf/ })` | role | 2026-09-25 counter terlihat `Draf 52`; data staging berubah-ubah |
| list-lelang | Legend warna | `page.getByText('Proses Nego')` | text | Legend lain: `Request Jadwal`, `Lelang Ulang` |
| list-lelang | Card lelang | `page.locator('div').filter({ hasText: 'No. Lelang:' })` | TIDAK STABIL | Perlu scope lebih ketat per nomor/rute/status saat test |
| list-lelang | Menu aksi | tombol ikon tanpa teks di kanan card | TIDAK STABIL | Tidak ada `aria-label`; rekomendasikan `data-testid` |
| list-lelang | Multipickup | `page.getByRole('button', { name: 'Multipickup' })` | role | Muncul pada card tertentu; gunakan scope card |
| list-lelang | Multidrop | `page.getByRole('button', { name: 'Multidrop' })` | role | Muncul pada card tertentu; gunakan scope card |
| list-lelang | Halaman pertama / nomor halaman | `page.getByRole('button', { name: '1', exact: true })` | TIDAK STABIL | Nomor halaman dinamis |
| list-lelang | Halaman berikutnya/sebelumnya | tombol ikon paging tanpa teks | TIDAK STABIL | Gunakan posisi dekat teks jumlah data bila terpaksa |
| list-lelang | Detail | `page.getByRole('button', { name: 'Detail' })` | role | Setelah menu aksi dibuka; scope menu/card |
| list-lelang | Edit Data | `page.getByRole('button', { name: 'Edit Data' })` | role | Item tidak relevan bisa tetap terlihat abu-abu |
| list-lelang | Tambah Peserta Lelang | `page.getByRole('button', { name: 'Tambah Peserta Lelang' })` | role | Scope menu/card |
| list-lelang | Lihat Penawaran | `page.getByRole('button', { name: 'Lihat Penawaran' })` | role | Scope menu/card |
| list-lelang | Lelang Ulang | `page.getByRole('button', { name: 'Lelang Ulang' })` | role | Scope menu/card |
| list-lelang | Batalkan Lelang | `page.getByRole('button', { name: 'Batalkan Lelang' })` | role | Jangan submit pembatalan pada data orang lain |
| list-lelang | Riwayat Perubahan | `page.getByRole('button', { name: 'Riwayat Perubahan' })` | role | Scope menu/card |
| list-lelang | Riwayat Lelang Ulang | `page.getByRole('button', { name: 'Riwayat Lelang Ulang' })` | role | Scope menu/card |
| list-lelang | Hapus Draft | `page.getByRole('button', { name: 'Hapus Draft' })` | role | Jangan konfirmasi hapus kecuali data dibuat run sendiri |

## filter-lelang (`/lelang` -> Filter)

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| filter-lelang | Panel Filter Lelang | `page.getByText('Filter Lelang')` | text | Panel terbuka setelah klik tombol Filter |
| filter-lelang | No. Lelang | `page.getByPlaceholder(/No\\. Lelang|Masukkan No/i)` | placeholder | Fallback: label `No. Lelang` lalu input terdekat |
| filter-lelang | Buka Lelang | locator trigger datepicker dengan label `Buka Lelang` | TIDAK STABIL | Date field memakai trigger kustom; perlu scope label |
| filter-lelang | Tutup Lelang | locator trigger datepicker dengan label `Tutup Lelang` | TIDAK STABIL | Sama seperti field tanggal lain |
| filter-lelang | Rencana Awal Kirim | locator trigger datepicker dengan label `Rencana Awal Kirim` | TIDAK STABIL | Sama seperti field tanggal lain |
| filter-lelang | Rencana Akhir Kirim | locator trigger datepicker dengan label `Rencana Akhir Kirim` | TIDAK STABIL | Sama seperti field tanggal lain |
| filter-lelang | Jenis Pengiriman | `page.locator('button').filter({ hasText: /Jenis Pengiriman|Pilih Jenis/ })` | TIDAK STABIL | Dropdown kustom, bukan `<select>` |
| filter-lelang | Tipe Pengiriman | `page.locator('button').filter({ hasText: /Tipe Pengiriman|Pilih Tipe/ })` | TIDAK STABIL | Dropdown kustom |
| filter-lelang | Status | `page.locator('button').filter({ hasText: /Status|Pilih Status/ })` | TIDAK STABIL | Dropdown kustom |
| filter-lelang | Kota Asal | `page.locator('button').filter({ hasText: /Kota Asal|Pilih Kota Asal/ })` | TIDAK STABIL | Dropdown kustom |
| filter-lelang | Kota Tujuan | `page.locator('button').filter({ hasText: /Kota Tujuan|Pilih Kota Tujuan/ })` | TIDAK STABIL | Dropdown kustom |
| filter-lelang | Pelabuhan Asal | `page.locator('button').filter({ hasText: /Pelabuhan Asal|Pilih Pelabuhan Asal/ })` | TIDAK STABIL | Relevan untuk FCL |
| filter-lelang | Pelabuhan Tujuan | `page.locator('button').filter({ hasText: /Pelabuhan Tujuan|Pilih Pelabuhan Tujuan/ })` | TIDAK STABIL | Relevan untuk FCL |
| filter-lelang | Tidak Ada Order | `page.getByRole('checkbox', { name: /Tidak Ada Order/ })` | role | Bila accessible name hilang, scope teks label |
| filter-lelang | Tidak Ada Penawaran | `page.getByRole('checkbox', { name: /Tidak Ada Penawaran/ })` | role | Bila accessible name hilang, scope teks label |
| filter-lelang | Lelang Ulang | `page.getByRole('checkbox', { name: /Lelang Ulang/ })` | role | Checkbox filter; jangan tertukar tombol tab |
| filter-lelang | Reset | `page.getByRole('button', { name: 'Reset' })` | role | Diverifikasi 2026-10-03: mengosongkan field; saat filter aktif langsung mengembalikan daftar tanpa klik Terapkan; panel Spot Rate ikut tertutup |
| filter-lelang | Terapkan | `page.getByRole('button', { name: 'Terapkan' })` | role | Menjalankan pencarian; tidak mengubah data |
| filter-lelang | Tutup filter | tombol ikon close panel | TIDAK STABIL | Tidak ada label stabil; gunakan `Escape` bila perlu |

## informasi-umum (`/lelang/buat`)

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| informasi-umum | Kembali | `page.getByRole('link', { name: /Kembali/ })` | role | Link kembali ke list |
| informasi-umum | Stepper Informasi Umum | `page.getByText('Informasi Umum')` | text | Step 01 |
| informasi-umum | Stepper Peserta Lelang | `page.getByText('Peserta Lelang')` | text | Step 02 |
| informasi-umum | FTL | `page.getByRole('button', { name: /FTL/ })` | role | Card button; default terpilih saat buka `/lelang/buat` |
| informasi-umum | FCL | `page.getByRole('button', { name: /FCL/ })` | role | Klik card mengubah field menjadi FCL |
| informasi-umum | Gunakan data lelang yang pernah dibuat | `page.locator('input[type="checkbox"]').first()` | TIDAK STABIL | Checkbox tanpa label accessible stabil pada harvest |
| informasi-umum | Periode Lelang Dibuat | locator trigger datepicker pada field `Periode Lelang Dibuat` | TIDAK STABIL | Muncul setelah salin data dicentang |
| informasi-umum | Data Lelang | `page.locator('button').filter({ hasText: /Pilih No\\. Lelang|Data Lelang/ })` | TIDAK STABIL | Muncul setelah salin data dicentang |
| informasi-umum | Pelabuhan Asal | `page.locator('button').filter({ hasText: 'Pilih Pelabuhan Asal' })` | text | FCL |
| informasi-umum | Pelabuhan Tujuan | `page.locator('button').filter({ hasText: 'Pilih Pelabuhan Tujuan' })` | text | FCL |
| informasi-umum | Durasi Lelang | `page.locator('button').filter({ hasText: 'Pilih Durasi Lelang' })` | text | Dropdown kustom |
| informasi-umum | Buka Lelang | `page.locator('div[role="button"]').filter({ hasText: 'DD/MM/YYYY hh:mm' }).nth(0)` | TIDAK STABIL | Datepicker kustom; gunakan scope label bila memungkinkan |
| informasi-umum | Tutup Lelang | `page.getByPlaceholder('DD/MM/YYYY hh:mm')` | placeholder | Input disabled/read-only |
| informasi-umum | Rencana Awal Kirim | `page.locator('div[role="button"]').filter({ hasText: 'DD/MM/YYYY hh:mm' }).nth(1)` | TIDAK STABIL | Index berubah jika field periode salin aktif |
| informasi-umum | Rencana Akhir Kirim | `page.locator('div[role="button"]').filter({ hasText: 'DD/MM/YYYY hh:mm' }).nth(2)` | TIDAK STABIL | Index berubah jika field periode salin aktif |
| informasi-umum | Jumlah Armada | locator input di bawah label `Jumlah Armada` | TIDAK STABIL | FTL |
| informasi-umum | Jumlah Kontainer | locator input di bawah label `Jumlah Kontainer` | TIDAK STABIL | FCL |
| informasi-umum | Jenis Armada | `page.locator('button').filter({ hasText: 'Pilih Jenis Armada' })` | text | FTL |
| informasi-umum | Jenis Kontainer | `page.locator('button').filter({ hasText: 'Pilih Jenis Kontainer' })` | text | FCL |
| informasi-umum | Deskripsi Barang | `page.getByPlaceholder('Masukkan Deskripsi Barang')` | placeholder | Textarea |
| informasi-umum | Door to Door | `page.getByRole('button', { name: /Door to Door/ })` | role | FCL metode pengiriman |
| informasi-umum | Door to CY | `page.getByRole('button', { name: /Door to CY/ })` | role | FCL metode pengiriman |
| informasi-umum | CY to CY | `page.getByRole('button', { name: /CY to CY/ })` | role | FCL metode pengiriman |
| informasi-umum | CY to Door | `page.getByRole('button', { name: /CY to Door/ })` | role | FCL metode pengiriman |
| informasi-umum | Gunakan Asuransi | `page.getByRole('checkbox', { name: /Gunakan Asuransi/ })` | role | Bila nama tidak terbaca, scope label |
| informasi-umum | Nilai Barang Min | `page.getByPlaceholder('Rp 0').nth(0)` | placeholder | Muncul setelah asuransi dicentang |
| informasi-umum | Nilai Barang Max | `page.getByPlaceholder('Rp 0').nth(1)` | placeholder | Muncul setelah asuransi dicentang |
| informasi-umum | Dokumen Tambahan / Pilih File | `page.getByRole('button', { name: 'Pilih File' })` | role | Jangan upload saat harvest |
| informasi-umum | Catatan Tambahan | `page.getByPlaceholder(/Tulis Catatan Tambahan|Masukkan Catatan Tambahan/i)` | placeholder | Jika tidak terlihat, cari textarea setelah heading Catatan Tambahan |
| informasi-umum | Drop Point Asal | `page.locator('button').filter({ hasText: 'Pilih Drop Point Asal' })` | text | FTL/FCL |
| informasi-umum | Pengirim | `page.locator('button').filter({ hasText: 'Semua Pengirim' })` | text | Dropdown kustom |
| informasi-umum | PIC Pengirim | `page.getByPlaceholder('Masukkan PIC Pengirim')` | placeholder | Stabil pada harvest 2026-09-25 |
| informasi-umum | No. WhatsApp PIC Pengirim | `page.getByPlaceholder('Masukkan No. WhatsApp PIC').nth(0)` | placeholder | Ada dua field WhatsApp; scope Pengirim bila bisa |
| informasi-umum | Provinsi Asal | `page.getByPlaceholder('Provinsi Asal')` | placeholder | Disabled |
| informasi-umum | Kota/Kab Asal | `page.getByPlaceholder('Kota/Kab. Asal')` | placeholder | Disabled |
| informasi-umum | Kecamatan Asal | `page.getByPlaceholder('Kecamatan Asal')` | placeholder | Disabled |
| informasi-umum | Desa/Kelurahan Asal | `page.getByPlaceholder('Desa/Kelurahan Asal')` | placeholder | Disabled |
| informasi-umum | Kode Pos Asal | `page.getByPlaceholder('Kode Pos').nth(0)` | placeholder | Disabled; ada asal/tujuan |
| informasi-umum | Alamat Asal | `page.getByPlaceholder('Alamat Asal')` | placeholder | Disabled textarea |
| informasi-umum | Catatan Pengirim | `page.getByPlaceholder('Masukkan Catatan').nth(0)` | placeholder | Textarea |
| informasi-umum | Tambah Baris Input Pengirim | `page.getByRole('button', { name: 'Tambah Lokasi Muat' })` | role | 2026-09-28: label berubah dari `Tambah Baris Input` (FTL & FCL). Enabled: FTL, FCL Door to Door/Door to CY; `disabled` (cursor not-allowed, abu-abu): FCL CY to Door/CY to CY |
| informasi-umum | Drop Point Tujuan | `page.locator('button').filter({ hasText: 'Pilih Drop Point Tujuan' })` | text | FTL/FCL |
| informasi-umum | Penerima | `page.locator('button').filter({ hasText: 'Semua Penerima' })` | text | Dropdown kustom |
| informasi-umum | PIC Penerima | `page.getByPlaceholder('Masukkan PIC Penerima')` | placeholder | Stabil pada harvest 2026-09-25 |
| informasi-umum | No. WhatsApp PIC Penerima | `page.getByPlaceholder('Masukkan No. WhatsApp PIC').nth(1)` | placeholder | Scope Penerima bila bisa |
| informasi-umum | Provinsi Tujuan | `page.getByPlaceholder('Provinsi Tujuan')` | placeholder | Disabled |
| informasi-umum | Kota/Kab Tujuan | `page.getByPlaceholder('Kota/Kab. Tujuan')` | placeholder | Disabled |
| informasi-umum | Kecamatan Tujuan | `page.getByPlaceholder('Kecamatan Tujuan')` | placeholder | Disabled |
| informasi-umum | Desa/Kelurahan Tujuan | `page.getByPlaceholder('Desa/Kelurahan Tujuan')` | placeholder | Disabled |
| informasi-umum | Kode Pos Tujuan | `page.getByPlaceholder('Kode Pos').nth(1)` | placeholder | Disabled; ada asal/tujuan |
| informasi-umum | Alamat Tujuan | `page.getByPlaceholder('Alamat Tujuan')` | placeholder | Disabled textarea |
| informasi-umum | Catatan Penerima | `page.getByPlaceholder('Masukkan Catatan').nth(1)` | placeholder | Textarea |
| informasi-umum | Tambah Baris Input Penerima | `page.getByRole('button', { name: 'Tambah Lokasi Bongkar' })` | role | 2026-09-28: label berubah dari `Tambah Baris Input`. Enabled: FTL, FCL Door to Door/CY to Door; `disabled`: FCL Door to CY/CY to CY. Ganti metode ke sisi disabled memangkas baris ekstra jadi 1 |
| informasi-umum | Batal | `page.getByRole('button', { name: 'Batal', exact: true })` | role | Membuka konfirmasi; aman bila ditutup dengan `Tidak` |
| informasi-umum | Simpan ke Draft | `page.getByRole('button', { name: 'Simpan ke Draft' })` | role | Aksi tulis; jangan klik saat harvest |
| informasi-umum | Selanjutnya | `page.getByRole('button', { name: 'Selanjutnya' })` | role | Dapat validasi/POST; jangan dipakai harvest kecuali skenario test |
| informasi-umum | Konfirmasi batal - Tidak | `page.getByRole('button', { name: 'Tidak' })` | role | Dialog tanpa `role="dialog"` |
| informasi-umum | Konfirmasi batal - Ya | `page.getByRole('button', { name: 'Ya' })` | role | Aksi keluar tanpa simpan; jangan dipakai jika ada input belum jelas |

## Datepicker `/lelang/buat`

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| informasi-umum | Trigger tanggal | `page.locator('div[role="button"]').filter({ hasText: 'DD/MM/YYYY hh:mm' })` | TIDAK STABIL | Ada beberapa field; gunakan `.nth()` atau scope label |
| informasi-umum | Hari tanggal aktif | `page.locator('button').filter({ hasText: /^25$/ })` | TIDAK STABIL | Datepicker kustom memakai button angka tanggal; harvest menemukan `button.h-9.w-9` |
| informasi-umum | Hari disabled/overflow | `page.locator('button[disabled]')` dalam popover | TIDAK STABIL | Banyak tanggal disabled terlihat; perlu filter status saat test |
| informasi-umum | Input jam/menit | locator input di popover waktu | TIDAK STABIL | Gunakan scope popover dan label waktu bila tersedia |

## peserta-lelang (SKIPPED)

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| peserta-lelang | Cari nama vendor | `page.getByPlaceholder('Cari nama vendor')` | placeholder | Belum diverifikasi ulang 2026-09-25 karena step 02 butuh data valid |
| peserta-lelang | Semua Kota | `page.locator('button').filter({ hasText: 'Semua Kota' })` | text | Dari catatan sebelumnya |
| peserta-lelang | Semua Rating | `page.locator('button').filter({ hasText: 'Semua Rating' })` | text | Dari catatan sebelumnya |
| peserta-lelang | Pilih Semua | `page.getByText(/Pilih semua vendor|Pilih Semua/)` | text | Dari catatan sebelumnya |
| peserta-lelang | Tampilkan | `page.locator('select')` atau combobox vendor | TIDAK STABIL | Perlu verifikasi saat step 02 bisa dibuka aman |
| peserta-lelang | Batal | `page.getByRole('button', { name: 'Batal' })` | role | |
| peserta-lelang | Simpan ke Draft | `page.getByRole('button', { name: 'Simpan ke Draft' })` | role | Aksi tulis |
| peserta-lelang | Simpan | `page.getByRole('button', { name: 'Simpan' })` | role | Aksi submit |

## detail/edit/tambah-peserta/harga/lelang-ulang/batal (SKIPPED)

| SCR | Elemen (nama sesuai ui-inventory) | Selector terbaik | Sumber | Catatan |
|---|---|---|---|---|
| detail-lelang | Route detail | `/lelang/{id}` | route | Butuh `id` data existing yang sesuai status |
| edit-lelang | Route edit | `/lelang/{id}/edit` | route | Jangan simpan pada data bukan milik run |
| tambah-peserta | Route tambah peserta | `/lelang/{id}/peserta` | route | Butuh status Belum/Sedang Buka |
| harga-penawaran | Route penawaran | `/lelang/{id}/penawaran` | route | Butuh lelang dengan penawaran |
| lelang-ulang | Route ulang | `/lelang/{id}/ulang` | route | Butuh lelang eligible |
| lelang-ulang | Route riwayat ulang | `/lelang/{id}/riwayat-ulang` | route | Butuh lelang dengan riwayat |
| batalkan-lelang | Dialog alasan pembatalan | `page.getByPlaceholder('Tuliskan alasan pembatalan')` | placeholder | Dari catatan sebelumnya; jangan klik `Batalkan Order` pada data orang lain |
| harga-penawaran | Filter | `page.getByRole('button', { name: 'Filter', exact: true })` | role | Dari catatan sebelumnya |
| harga-penawaran | Urutkan | `page.getByRole('button', { name: /Urutkan/ })` | role | Dari catatan sebelumnya |
| harga-penawaran | Ajukan Nego | `page.getByRole('button', { name: 'Ajukan Nego' })` | role | Dari catatan sebelumnya |
| harga-penawaran | Pesan | `page.getByRole('button', { name: 'Pesan' })` | role | Aksi lanjut order; jangan klik saat harvest |

## Rekomendasi data-testid untuk developer

- `lelang-list-buat`, `lelang-list-filter`, `lelang-list-riwayat-pembatalan`, `lelang-list-page-size`
- `lelang-tab-semua`, `lelang-tab-ulang`, `lelang-tab-request-jadwal`, `lelang-tab-draf`
- `lelang-card-{id}`, `lelang-card-menu-{id}`, `lelang-card-multipickup-{id}`, `lelang-card-multidrop-{id}`
- `lelang-filter-panel`, `lelang-filter-no`, `lelang-filter-jenis`, `lelang-filter-tipe`, `lelang-filter-status`
- `buat-lelang-jenis-ftl`, `buat-lelang-jenis-fcl`
- `buat-lelang-durasi`, `buat-lelang-buka`, `buat-lelang-tutup`, `buat-lelang-awal-kirim`, `buat-lelang-akhir-kirim`
- `buat-lelang-jenis-armada`, `buat-lelang-jenis-kontainer`, `buat-lelang-jumlah-armada`, `buat-lelang-jumlah-kontainer`
- `buat-lelang-drop-point-asal-{n}`, `buat-lelang-pengirim-{n}`, `buat-lelang-pic-pengirim-{n}`, `buat-lelang-wa-pengirim-{n}`
- `buat-lelang-drop-point-tujuan-{n}`, `buat-lelang-penerima-{n}`, `buat-lelang-pic-penerima-{n}`, `buat-lelang-wa-penerima-{n}`
- `buat-lelang-add-pengirim`, `buat-lelang-add-penerima`, `buat-lelang-submit-next`, `buat-lelang-save-draft`
- `confirm-dialog` dengan `role="dialog"` dan tombol bernama stabil untuk `Tidak`/`Ya`

## Catatan Hipotesis CLAUDE.md

Tidak ada perubahan status hipotesis pada 2026-09-25.

- #3 dropdown custom tetap berlaku untuk filter/form, dengan pengecualian `<select>` native ukuran halaman di `/lelang`.
- #4 datepicker `/lelang/buat` tetap kustom berbasis `button`, berbeda dari flatpickr dashboard.
- #5 modal konfirmasi Batal tetap tanpa `role="dialog"`.
- #6 `data-testid` tetap tidak ditemukan (`0` pada list, filter, form, datepicker, dialog).
