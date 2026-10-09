# Analysis — ams010-order-ftl-shipper

## Requirements

Sumber utama: `inputs/ams010-order-ftl-shipper/spec.txt`. Cakupan mencakup shipper dan vendor karena keduanya dijelaskan eksplisit dalam spesifikasi, meskipun nama folder berakhiran shipper. Semua waktu bisnis WIB (UTC+07:00).

| ID | Requirement dan acceptance criteria |
|---|---|
| REQ-001 | FTL memiliki dua jalur: Pesan dari Detail Harga Penawaran memakai wizard berbasis lelang; Buat Order dari menu Order memakai alur eksisting. |
| REQ-002 | LTL/LCL dan seluruh order tanpa lelang tetap mengikuti tampilan, validasi, dan alur eksisting. |
| REQ-003 | Setiap transaksi Pesan pada penawaran menghasilkan satu order; lelang boleh menghasilkan banyak order selama belum melewati Rencana Akhir Kirim. |
| REQ-004 | Daftar Order shipper/vendor menampilkan No. Lelang di bawah ID Order hanya untuk order dari lelang. |
| REQ-005 | Filter mengikuti desain; action eksisting tetap tersedia sesuai status/role; status tambahan Menunggu Konfirmasi dan Ditolak, sedangkan terima menghasilkan Menunggu Penugasan. |
| REQ-006 | Wizard Buat Order memiliki Data Pengiriman, Data Barang, Vendor dan Harga, Review; Selanjutnya memvalidasi required pada step aktif. |
| REQ-007 | Simpan ke Draf memerlukan minimal satu field terisi; draft menyimpan data dan step terakhir untuk dilanjutkan. |
| REQ-008 | Sebelumnya kembali satu step tanpa menghilangkan data maupun progres step terakhir yang telah diisi. |
| REQ-009 | Batal membuka konfirmasi; konfirmasi pembatalan menuju Daftar Order; membatalkan dialog tetap pada wizard. |
| REQ-010 | PIC Pengirim, No. WhatsApp PIC Pengirim, PIC Penerima, No. WhatsApp PIC Penerima wajib dan editable; Catatan Pengirim/Penerima opsional dan editable, berlaku di setiap titik. |
| REQ-011 | Multipickup/Multidrop/Multipoint menampilkan setiap titik dalam card pengirim/penerima dengan Muat (n)/Bongkar (n) sesuai rute. |
| REQ-012 | No. Lelang, Jenis Pengiriman, Jenis Armada, Tipe Pengiriman dan data rute/pengirim/penerima dari lelang ditampilkan read-only, kecuali data PIC dan catatan. |
| REQ-013 | Jenis Armada pada Step 02 read-only; Jumlah Armada default 1, editable minimal 1; jumlah card unit mengikuti nilai tersebut. |
| REQ-014 | Nomor DO tidak wajib, mendukung multi tag; Pilih Barang mengambil barang dari master ke tabel unit terkait. |
| REQ-015 | Tiap baris barang memerlukan Jumlah; setiap unit harus memiliki barang dengan jumlah terisi sebelum Selanjutnya. |
| REQ-016 | Nilai Barang wajib hanya ketika lelang menggunakan asuransi; tanpa asuransi nilai barang boleh kosong. |
| REQ-017 | Total Kubikasi/Berat dihitung dari barang dan jumlah; batas kapasitas armada memicu alert sesuai kondisi eksisting. |
| REQ-018 | Tanggal Permintaan Muat wajib datetime, tidak sebelum waktu saat ini, tidak setelah Rencana Akhir Kirim; perbandingan dilakukan dalam WIB. |
| REQ-019 | Vendor, drop point, jenis/jumlah armada, Harga Satuan mengikuti penawaran terpilih dan data Step 02, serta read-only pada Step 03. |
| REQ-020 | Untuk Multipickup/Multidrop/Multipoint tersedia textlink yang membuka popup detail seluruh drop point. |
| REQ-021 | Ringkasan tiap unit berupa Total Berat, Total Kubikasi, Total Nilai Barang dihitung dari Step 02 dan diperbarui setelah perubahan. |
| REQ-022 | Harga DPP = Harga Satuan × Jumlah Armada; Total Harga = DPP + PPN − PPh + Asuransi; PPN/PPh mengikuti vendor dan tidak dapat diubah. |
| REQ-023 | Asuransi dihitung dari Total Nilai Barang pada order dengan tarif lelang/master; mengikuti perubahan nilai barang. |
| REQ-024 | FTL tidak memiliki input jadwal, data jadwal maupun checkbox Batas Toleransi Jadwal pada harga, konfirmasi, pilih penawaran lain, dan penugasan. Tanggal Permintaan Muat tetap wajib. |
| REQ-025 | Review menampilkan seluruh data order read-only dan konsisten dengan data wizard. |
| REQ-026 | Simpan dari Review membentuk order Menunggu Konfirmasi dan memberikan notifikasi order baru kepada vendor terpilih. |
| REQ-027 | Konfirmasi Order hanya tersedia bagi vendor terkait dan order Menunggu Konfirmasi melalui action Daftar Order. |
| REQ-028 | Popup konfirmasi menampilkan ringkasan read-only, radio Terima Order/Tolak Order; Simpan disabled sebelum ada pilihan. |
| REQ-029 | Terima Order tanpa form tambahan/jadwal; Simpan memindahkan status ke Menunggu Penugasan. |
| REQ-030 | Tolak Order menampilkan textarea Alasan Penolakan wajib; Simpan yang valid memindahkan status ke Ditolak. |
| REQ-031 | Order Ditolak tetap terlihat pada list vendor; shipper tetap melihatnya sampai memilih dan menyimpan penawaran lain, kemudian rekaman penolakan tampil di Riwayat Order Tidak Aktif. |
| REQ-032 | Shipper dapat membuka Pilih Penawaran Lain dari order Ditolak; hanya penawaran lelang terkait selain yang sudah dipilih sebelumnya, dengan tombol Pilih. |
| REQ-033 | Pilih Penawaran Lain mempunyai Memilih Penawaran dan Review; review menunjukkan perubahan vendor/harga, tanpa jadwal FTL. |
| REQ-034 | Simpan penggantian penawaran memperbarui order menjadi Menunggu Konfirmasi dan mengirim notifikasi kepada vendor baru. |
| REQ-035 | Penugasan vendor setelah penerimaan tetap mengikuti pemilihan order, armada, sopir, mode dan validasi eksisting FTL tanpa section/input jadwal. |
| REQ-036 | Detail Penugasan menampilkan No. Lelang di Detail Data Order untuk order dari lelang; order tanpa lelang tetap eksisting. |

### Aturan validasi dan batas

| Area | Aturan eksplisit | Batas belum ditentukan |
|---|---|---|
| PIC per titik | Empat field bertanda * wajib; dua catatan opsional | Format WhatsApp, panjang nama/catatan/nomor tidak diberikan |
| Draft | Minimal satu field terisi, simpan step terakhir | Apakah data auto-draft dihitung sebagai field terisi |
| Armada | Default 1, minimum 1, jumlah card mengikuti | Maksimum dan perilaku pengurangan unit berisi data |
| Barang | Barang dan Jumlah wajib di setiap unit; Nilai Barang wajib jika diasuransikan | Minimum Jumlah/Nilai Barang dan satuan belum dijelaskan |
| Kapasitas | Total Berat/Kubikasi dibandingkan kapasitas armada | Alert bersifat blokir atau peringatan mengikuti eksisting |
| Muat | now ≤ waktu muat ≤ Rencana Akhir Kirim, WIB | Presisi kontrol datetime dan interval lelang saat now > akhir |
| Penolakan | Alasan Penolakan wajib | Panjang maksimum dan perlakuan whitespace |
| Harga | DPP + PPN − PPh + Asuransi | Basis/persentase pajak, pembulatan, format angka rupiah |

### Aktor dan alur

- Shipper: memilih penawaran, membuat/draft/membatalkan order, mengedit PIC/barang, melihat order, memilih penawaran pengganti setelah ditolak, melihat riwayat penolakan.
- Vendor terpilih: melihat ordernya, menerima/menolak dan melihat riwayat order ditolak di list, menugaskan order diterima, melihat Detail Penugasan.
- Vendor lain/shipper tidak dapat mengonfirmasi order untuk vendor yang bukan miliknya (pengujian isolasi akses).
- Alur utama: Detail Harga Penawaran → Pesan → empat step → Simpan → Menunggu Konfirmasi → vendor Terima → Menunggu Penugasan → Penugasan → Detail Penugasan.
- Cabang: draft/lanjutkan; batal; vendor Tolak → Ditolak → shipper Pilih Penawaran Lain → Review → Simpan → Menunggu Konfirmasi vendor baru; order lama yang ditolak menjadi riwayat shipper, tetap terlihat vendor lama.
- Regresi: Buat Order langsung FTL serta LTL/LCL mengacu baseline eksisting, bukan menambahkan kewajiban lelang.

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

## Assumptions Log

| ID | Asumsi dan dampak pengujian |
|---|---|
| A01 | Scope meliputi shipper dan vendor sesuai isi spec. Tidak ada file extras; konteks tambahan tidak tersedia. |
| A02 | Spesifikasi umum menyebut hanya PIC editable, tetapi aturan step eksplisit mengizinkan Jumlah Armada, DO, barang, jumlah, nilai dan waktu muat. Aturan step yang lebih spesifik dipakai. |
| A03 | Jumlah Armada adalah integer positif. Nilai maksimum, jumlah barang minimum selain required, dan format WhatsApp mengikuti baseline eksisting; tidak dibuat batas arbitrer sebagai requirement. |
| A04 | Data auto-draft dihitung memenuhi minimal satu field untuk Simpan ke Draf; kondisi draft benar-benar kosong diuji lewat jalur Buat Order eksisting. |
| A05 | Batas waktu inklusif: sama dengan now/akhir diterima. Gunakan clock terkendali agar oracle deterministik, WIB. Pesan/simpan setelah akhir ditolak; validasi ulang deadline saat submit adalah asumsi penguatan konsistensi. |
| A06 | Kapasitas mengikuti alert eksisting; tanpa baseline tidak menyatakan kelebihan kapasitas pasti memblokir order. |
| A07 | Tarif/basis pajak tidak diberikan. Fixture memakai nominal pajak penawaran yang telah dihitung; fixture asuransi memakai 1% sebagai data uji, bukan tarif bisnis universal. Pembulatan mengikuti baseline. |
| A08 | Pemindahan penolakan ke riwayat shipper berlaku setelah penawaran pengganti berhasil disimpan. Order bisnis diperbarui sesuai frasa menyimpan perubahan; rekaman penolakan vendor lama tetap tersedia. Identitas teknis record/history belum ditetapkan. |
| A09 | Setiap klik Pesan yang disengaja adalah transaksi order tersendiri. Replay submit transaksi yang sama tidak menggandakan order/notifikasi; perlindungan race, rollback dan isolasi role menjadi ekspektasi robustness yang perlu dikonfirmasi dengan implementasi. |
| A10 | Required yang hanya berisi whitespace dianggap kosong. Format pesan validasi, URL, selector dan testid belum diketahui; oracle memakai kondisi bisnis, bukan mengarang teks error pasti. |
| A11 | Penugasan dan alur tanpa lelang membutuhkan fixture/baseline OMS eksisting; detail validasi yang tidak ada pada spec tidak direkayasa. |
| A12 | PNG adalah mockup: 149 menunjukkan Jumlah Armada 2 tetapi tiga card; 150/151/152 menampilkan subtotal/data contoh tidak konsisten. Jumlah card dan hasil hitung harus mengikuti spec/fixture, bukan angka mockup. |
| A13 | Desain 150 menampilkan Waktu Perjalanan seperti input required; spec membatasi sumber penawaran read-only dan tidak menyebut validasi field ini. Dipakai sebagai informasi read-only dari penawaran; tidak ditambah validasi required. Waktu perjalanan berbeda dari jadwal FTL. |
| A14 | Popup konfirmasi/batal/drop point/pilih barang, halaman penggantian dan riwayat penolakan diturunkan dari spec. Label tombol yang tidak terlihat merupakan usulan; 146/167 bertuliskan Riwayat Pembatalan, sedangkan spec Riwayat Order Tidak Aktif, dipetakan ke tujuan riwayat sesuai implementasi. |
| A15 | 154 memakai contoh Jenis Pengiriman LTL meski No. Lelang FTL; test FTL memakai fixture FTL. 151 menampilkan insurance campuran per unit tetapi spec mengacu asuransi lelang; tidak mengasumsikan toggle asuransi tiap unit tanpa rule tambahan. |
| A16 | Selector testid/ARIA, URL, field mode/manual eksisting dan teks error selain yang terlihat adalah usulan. Oracle non-visual (nilai, read-only, disabled, absence, count, notification, state) harus diterjemahkan ke assertion Playwright sesuai implementasi. |
| A17 | Beban stress (50 sesi, 100 unit, 500 barang, 200 tag, 10.000 order/penawaran, 10.000 karakter) adalah profil uji; jika batas resmi lebih kecil, validasi batas dengan rapi. Tidak menetapkan SLA waktu arbitrer. |
| A18 | Nilai Barang pada tabel diasumsikan harga per satuan; total nilai = jumlah × nilai per baris, mengikuti pola ringkasan desain. Konfirmasi basis nilai dengan master/implementasi; fixture memakai data eksplisit agar oracle dapat diperiksa. |
