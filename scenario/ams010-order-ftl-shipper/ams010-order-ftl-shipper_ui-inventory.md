# Inventaris UI AMS010

Disalin dari bagian UI Inventory analysis sumber; locator usulan belum terverifikasi. Selector aktual diprioritaskan dari shared/.

## UI Inventory

Seluruh 11 PNG dibuka dan dianalisis. Role/name/testid berikut adalah saran; DOM, ARIA, URL dan custom widget belum tersedia. `generic` menandai teks/container yang memerlukan locator teks/testid, bukan `getByRole` dengan nama. Field berulang wajib di-scope ke card titik/unit/SKU/order/offer; jangan memakai `.first()` untuk mengatasi ambiguitas. Field numeric `spinbutton` memakai locator.fill(), bukan selalu textbox. Dropdown custom perlu adapter click-option apabila bukan native select.

### daftar-order

Sumber: 146.png, 167.png (desain identik; shipper); vendor diturunkan dari spec.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| order-menu | link | Order | Menu Order |
| buat-order | button | Buat Order | Tombol |
| batch-order | button | Batch Order | Tombol eksisting |
| riwayat-pembatalan | button | Riwayat Pembatalan | Label desain; riwayat penolakan mengikuti spec |
| filter | button | Filter | Panel terlihat terbuka |
| filter-lelang | textbox | No. Lelang | Masukkan No. Lelang |
| filter-order | textbox | ID Order | Masukkan ID Order |
| filter-jenis | combobox | Jenis Pengiriman | Pilih Jenis Pengiriman |
| filter-vendor | textbox | Vendor | Masukkan Vendor |
| filter-asal | combobox | Kota Asal | Pilih Kota Asal |
| filter-tujuan | combobox | Kota Tujuan | Pilih Kota Tujuan |
| filter-tipe | combobox | Tipe Pengiriman | Pilih Tipe Pengiriman; tampak pudar |
| filter-metode | combobox | Metode Pengiriman | Pilih Metode Pengiriman; tampak pudar |
| filter-buat | textbox | Tanggal Buat | Pilih Tanggal |
| filter-muat | textbox | Tanggal Permintaan Muat | Pilih Tanggal |
| filter-pengirim | combobox | Pengirim | Pilih Pengirim |
| filter-penerima | combobox | Penerima | Pilih Penerima |
| filter-drop-asal | combobox | Drop Point Asal | Pilih Drop Point Asal |
| filter-drop-tujuan | combobox | Drop Point Tujuan | Pilih Drop Point Tujuan |
| filter-status | combobox | Status | Pilih Status |
| reset | button | Reset | Reset filter |
| terapkan | button | Terapkan | Terapkan filter |
| tabel-order | table | Daftar Order | Header ID Order/No. Lelang, Vendor, Rute, Total Harga/Status; role usulan |
| id-order | generic | ID Order | Teks pada baris scoped orderId |
| no-lelang | generic | No. Lelang | Teks di bawah ID pada baris scoped orderId |
| copy-order | button | Salin ID Order | Ikon salin tanpa teks; accessible name usulan |
| copy-lelang | button | Salin No. Lelang | Ikon salin tanpa teks; accessible name usulan |
| sort-vendor | button | Vendor | Ikon sort pada header; role usulan |
| sort-harga | button | Total Harga | Ikon sort pada header; role usulan |
| status-order | generic | Status Order | Isi Data Dasar/Muatan/Vendor, Review Order, Menunggu Konfirmasi, Ditolak, Menunggu Penugasan, Ditugaskan, Proses Pengiriman, Terkirim, Dibatalkan |
| rute-order | link | Rute | Kota atau Multipickup → Multidrop; accessible name usulan |
| action-order | button | Action Order | Ikon tiga titik; accessible name usulan |
| page-size | combobox | Tampilkan data | Nilai terlihat 20 |
| page-next | button | Halaman berikutnya | Ikon pagination; accessible name usulan |
| page-prev | button | Halaman sebelumnya | Ikon pagination; accessible name usulan |
| page-first | button | Halaman pertama | Ikon pagination; accessible name usulan |
| page-last | button | Halaman terakhir | Ikon pagination; accessible name usulan |
| detail-order-action | menuitem | Detail Order | Aksi eksisting: spec/baseline |
| konfirmasi-action | menuitem | Konfirmasi Order | Tambahan vendor: spec |
| ganti-action | menuitem | Pilih Penawaran Lain | Tambahan shipper Ditolak: spec |
| lanjut-draft | menuitem | Lanjutkan Draf | Aksi melanjutkan draft; label usulan mengikuti baseline OMS |

### detail-harga-penawaran

Sumber: 147.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| lelang-heading | heading | Detail Harga Penawaran | Judul |
| pesan | button | Pesan | Scope offerId; beberapa tombol sama |
| tidak-berlaku | button | Tidak Berlaku | Tombol pudar disabled pada satu card |
| syarat | button | Syarat & Ketentuan | Accordion; role usulan |
| detail-biaya | tab | Detail Biaya | PPN 1,1%, PPh 2%, tanggal berlaku; role tab usulan |
| detail-armada | tab | Detail Armada | Length/Width/Height; role tab usulan |
| detail-vendor | tab | Vendor | Profil/rating; role tab usulan |
| profil-vendor | link | Lihat Profil | Link |
| offer-filter | button | Filter | Filter penawaran |
| urutkan | button | Urutkan | Tombol |
| ajukan-nego | button | Ajukan Nego | Eksisting di desain |
| lelang-ulang | button | Lelang Ulang | Eksisting di desain |
| offer-vendor | combobox | Vendor | Pilih Vendor |
| offer-armada | combobox | Jenis Armada | Pilih Jenis Armada |
| offer-waktu | textbox | Target Waktu Perjalanan | 0 Jam |
| offer-reset | button | Reset | Reset filter penawaran |
| offer-terapkan | button | Terapkan | Filter penawaran |
| dokumen | link | Dokumen_Lelang_1.pdf | Dokumen lelang, role link usulan |
| offer-page-size | combobox | Tampilkan data | 20 |
| offer-page-next | button | Halaman berikutnya | Pagination penawaran; nama usulan |

### data-pengiriman

Sumber: 148.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| wizard | generic | Tahapan Buat Order | 01 Data Pengiriman, 02 Data Barang, 03 Vendor dan Harga, 04 Review |
| shipping-section | button | Jenis Pengiriman dan Rute | Accordion; role usulan |
| shipping-readonly | generic | Data Lelang dan Rute | No. Lelang, Jenis Pengiriman, Jenis Armada, Tipe Pengiriman berupa teks |
| sender-section | button | Data Pengirim | Accordion, drop point dan alamat berupa teks |
| receiver-section | button | Data Penerima | Accordion, drop point dan alamat berupa teks |
| pic-pengirim | textbox | PIC Pengirim | Nama PIC Pengirim; nilai contoh Widyawati |
| wa-pengirim | textbox | No. WhatsApp PIC | Dalam Data Pengirim; Contoh: 081234567898 |
| catatan-pengirim | textbox | Catatan | Dalam Data Pengirim; textarea Masukkan Catatan |
| pic-penerima | textbox | PIC Penerima | Nama PIC Penerima; nilai contoh Marwanto |
| wa-penerima | textbox | No. WhatsApp PIC | Dalam Data Penerima; Contoh: 081234567898 |
| catatan-penerima | textbox | Catatan | Dalam Data Penerima; textarea Masukkan Catatan |
| route-cards | generic | Muat dan Bongkar | Card multipoint diturunkan dari spec; tiap indeks di scope |
| batal | button | Batal | Footer wizard |
| draft | button | Simpan ke Draf | Footer wizard |
| next | button | Selanjutnya | Footer wizard |

### data-barang

Sumber: 149.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| jenis-armada | generic | Jenis Armada | Tronton Wing Box berupa teks |
| jumlah-armada | spinbutton | Jumlah Armada | Required; input numeric, role perlu verifikasi DOM |
| unit-cards | generic | Unit Armada | Desain menyebut Kontainer 1/2/3; spec unit armada |
| nomor-do | textbox | Nomor DO | Masukkan Nomor DO; pisahkan koma untuk beberapa nomor |
| hapus-do | button | Hapus Nomor DO | Ikon x pada tag; scope nilai DO, accessible name usulan |
| pilih-barang | button | Pilih Barang | Scope unit; ikon + |
| tabel-barang | table | Barang Unit | Kode SKU/Nama Barang, Kemasan, Kubikasi/Dimensi, Berat, Jumlah, Nilai Barang |
| jumlah-barang | spinbutton | Jumlah | Scope unit + SKU; role/name usulan untuk input dalam tabel |
| nilai-barang | textbox | Nilai Barang | Scope unit + SKU; Rp 0, contoh Rp 1.320.000 |
| hapus-barang | button | Hapus Barang | Ikon trash per baris; accessible name usulan |
| total-kubikasi | generic | Total Kubikasi | Total / kapasitas m³ |
| total-berat | generic | Total Berat | Total / kapasitas kg |
| error-nilai | alert | Nilai Barang harus diisi | Teks merah terlihat; role alert usulan |
| alert-kubikasi | alert | Kubikasi melebihi kapasitas armada | Badge merah terlihat; role alert usulan |
| alert-berat | alert | Berat melebihi kapasitas armada | Spec/baseline; teks usulan, tidak tampak di PNG |
| empty-barang | generic | Belum ada barang. Klik “Pilih Barang.” | Empty state terlihat |
| previous | button | Sebelumnya | Footer wizard |

### pilih-barang

Sumber: Spec REQ-014; popup tidak disertakan dalam PNG.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| master-barang | dialog | Pilih Barang | Dialog usulan berdasarkan tombol |
| sku | checkbox | SKU-PPR-001 | Pemilihan barang master; role/label mengikuti implementasi |
| gunakan-barang | button | Pilih | Konfirmasi pemilihan; label usulan |
| close-master | button | Tutup | Tutup popup; label usulan |

### vendor-dan-harga

Sumber: 150.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| tanggal-muat | textbox | Tanggal Permintaan Muat | Required; placeholder DD/MM/YYYY hh:mm |
| vendor-readonly | generic | Vendor dan Penawaran | Vendor/drop point/jenis dan jumlah armada/harga satuan berupa teks |
| waktu-perjalanan | generic | Waktu Perjalanan | Desain tampak input * 0 Jam; spec tidak menetapkan input, diasumsikan tampil read-only dari penawaran |
| detail-drop | link | Detail Drop Point | Textlink multipoint berdasarkan spec, tidak terlihat di PNG Normal |
| ringkasan-unit | table | Ringkasan Armada | No/Nama Item/Total Berat/Total Kubikasi/Total Nilai Barang |
| harga-dpp | generic | Harga DPP | Read-only |
| ppn | generic | PPN | Read-only |
| pph | generic | PPh | Read-only nilai dikurangkan |
| asuransi | generic | Asuransi | Read-only tarif dan total nilai |
| total-harga | generic | Total Harga | Read-only bold |
| batas-toleransi | checkbox | Batas Toleransi Jadwal | Harus tidak ada pada FTL, berdasarkan spec |
| jadwal | generic | Jadwal | Section/input harus tidak ada pada FTL; bukan Tanggal Permintaan Muat |

### detail-drop-point

Sumber: Spec REQ-020; popup tidak disertakan.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| drop-dialog | dialog | Detail Drop Point | Scope lelang + jenis titik |
| drop-content | generic | Daftar Drop Point | Seluruh titik/order rute |
| drop-close | button | Tutup | Label usulan |

### review

Sumber: 151.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| review-shipping | button | Jenis Pengiriman dan Rute | Accordion read-only |
| review-sender | button | Data Pengirim | Accordion read-only |
| review-receiver | button | Data Penerima | Accordion read-only |
| review-goods | button | Data Barang | Accordion read-only; badge Diasuransikan |
| review-price | button | Vendor dan Harga | Accordion read-only; ringkasan harga |
| review-data | generic | Review Order | Seluruh data termasuk PIC/DO/barang/pajak/waktu muat |
| simpan | button | Simpan | Footer final |

### detail-order

Sumber: 152.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| detail-order | heading | Detail Order | Judul |
| detail-order-data | generic | Detail Data Order | No. Lelang, ID Order, status, route/PIC/barang/harga |
| batalkan-order | button | Batalkan Order | Eksisting; perilaku/otorisasi baseline |
| edit-order | button | Edit Order | Eksisting; tidak mengasumsikan semua field lelang editable |

### konfirmasi-batal

Sumber: Spec REQ-009; dialog tidak disertakan.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| cancel-dialog | dialog | Konfirmasi Pembatalan | Nama usulan |
| cancel-yes | button | Ya, Batalkan | Label usulan |
| cancel-no | button | Kembali | Label usulan |

### konfirmasi-order

Sumber: Spec REQ-027..030; dialog vendor tidak disertakan.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| confirmation-dialog | dialog | Konfirmasi Order | Ringkasan read-only |
| confirmation-data | generic | Ringkasan Order | Muat/akhir/jenis/armada/kota |
| terima | radio | Terima Order | Radio |
| tolak | radio | Tolak Order | Radio |
| alasan | textbox | Alasan Penolakan | Required textarea saat Tolak |
| confirmation-save | button | Simpan | Disabled jika belum pilih radio |
| confirmation-close | button | Tutup | Label usulan |

### pilih-penawaran-lain

Sumber: Spec REQ-032..034; halaman tidak disertakan.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| replacement-wizard | generic | Memilih Penawaran dan Review | Dua step |
| replacement-offers | generic | Harga Penawaran Lain | Lelang terkait, exclude penawaran terdahulu |
| pilih-penawaran | button | Pilih | Scope offerId, menggantikan Pesan |
| replacement-review | generic | Review Perubahan | Vendor/harga berubah; tanpa jadwal |
| replacement-save | button | Simpan | Simpan perubahan |
| replacement-back | button | Sebelumnya | Label mengikuti wizard; usulan |
| replacement-cancel | button | Batal | Label usulan |

### riwayat-order-tidak-aktif

Sumber: Spec REQ-031; label desain list berbeda.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| inactive-history | heading | Riwayat Order Tidak Aktif | Rekaman penolakan shipper setelah penggantian sukses |
| inactive-record | generic | Order Ditolak | Scope ID order + vendor lama |

### tambah-penugasan

Sumber: 153.png.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| assignment-menu | link | Penugasan Tracking | Menu |
| assignment-heading | heading | Tambah Penugasan | Judul |
| cari-order | textbox | Cari Order | Search |
| pilih-order | radio | ORD-AMS-001 | Card order; nama dari fixture |
| assignment-order | generic | Data Order Terpilih | Kota/jenis/jumlah armada/Tanggal Permintaan Muat, read-only |
| armada-master | radio | Pilih Dari Master | Scope Armada 1 → Armada |
| armada-manual | radio | Isi Data Manual | Scope Armada 1 → Armada |
| sopir-master | radio | Pilih Dari Master | Scope Armada 1 → Sopir |
| sopir-manual | radio | Isi Data Manual | Scope Armada 1 → Sopir |
| no-polisi | combobox | No. Polisi | Cari No. Polisi/Jenis Armada |
| sopir | combobox | Sopir | Cari Sopir/No. WhatsApp |
| assignment-mode | generic | Mode Penugasan | Proses eksisting sesuai spec; tidak tampak pada PNG |
| assignment-save | button | Simpan | Footer |
| assignment-cancel | button | Batal | Footer |

### detail-penugasan

Sumber: 154.png vendor, 155.png shipper.

| Key / testid usulan | role | name / label | Pengamatan, placeholder dan scope |
|---|---|---|---|
| assignment-detail-heading | heading | Detail Penugasan | Status Dalam Perjalanan |
| assignment-detail-order | button | Detail Data Order | Accordion, No. Lelang tepat di bawah heading |
| assignment-lelang | generic | No. Lelang | FTL-NRM-01/200526 pada desain |
| assignment-info | button | Informasi Penugasan | Accordion kendaraan/sopir/WA |
| riwayat-penugasan | link | Lihat Detail | Riwayat Penugasan |
| tracking-history | button | History Tracking | Accordion |
| tracking-lokasi | tab | Per Lokasi | Role tab usulan |
| tracking-timeline | tab | Timeline | Role tab usulan |

### State dan pesan terlihat

- 146/167: daftar terisi, panel filter terbuka, status beragam, pagination; tidak ada loading/error list.
- 147: penawaran aktif memiliki Pesan; satu card Tidak Berlaku disabled; detail biaya/armada/vendor terbuka bergantian; Asuransi Digunakan.
- 148: step 01 aktif, field PIC berisi contoh; required ditandai *; catatan kosong.
- 149: step 02 aktif, multi-tag DO, error “Nilai Barang harus diisi”, badge “Kubikasi melebihi kapasitas armada”, card ketiga empty. Angka/card bukan oracle bisnis karena mockup tidak konsisten.
- 150: step 03 aktif, datetime kosong, ringkasan per armada dan harga; tidak tampak checkbox toleransi jadwal.
- 151: step 04 aktif, seluruh data berupa tampilan review, badge Diasuransikan dan tombol Simpan.
- 152: Detail Order, status Menunggu Penugasan, Batalkan Order/Edit Order; bukan bukti status langsung setelah simpan.
- 153: vendor, order FTL terpilih, dua pasangan radio master/manual, kendaraan/sopir belum dipilih; tidak ada jadwal.
- 154/155: detail penugasan Dalam Perjalanan, No. Lelang pada Detail Data Order, tracking Per Lokasi; data contoh label LTL pada 154 tidak dipakai untuk oracle FTL.
- Popup konfirmasi order/batal/drop point/pilih barang, penggantian penawaran dan riwayat penolakan tidak tersedia; inventory area tersebut diturunkan dari spec dan ditandai usulan.

