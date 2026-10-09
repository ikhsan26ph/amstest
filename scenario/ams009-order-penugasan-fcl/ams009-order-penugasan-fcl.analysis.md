# Analysis — ams009-order-penugasan-fcl

## Requirements

Sumber utama: `inputs/ams009-order-penugasan-fcl/spec.txt`. Aktor: shipper, vendor, serta vendor yang pengelolanya admin. Modul utama FCL; regresi FTL/LTL/LCL dibatasi aturan jalur pembuatan yang disebut spesifikasi. Semua waktu WIB.

| ID | Deskripsi dan acceptance criteria | Sumber bagian spec |
|---|---|---|
| REQ-001 | FCL/FTL dapat dibuat melalui Pesan pada Detail Harga Penawaran atau Buat Order langsung; LTL/LCL dan semua order tanpa lelang mempertahankan alur eksisting. | General Rule 1–3 |
| REQ-002 | Satu klik Pesan pada penawaran membuat satu order; satu lelang dapat menghasilkan banyak order sebelum batas Rencana Akhir Kirim. | General Rule 4 |
| REQ-003 | Order lelang menggunakan data lelang/penawaran terpilih secara otomatis dan read-only, dengan pengecualian eksplisit field PIC serta input barang/order pada aturan step. | General Rule 5; Step 01–03 |
| REQ-004 | Daftar Order shipper/vendor menampilkan No. Lelang di bawah ID Order hanya untuk order lelang. | Daftar Order 1–4 |
| REQ-005 | Filter Daftar Order mengikuti desain dan action eksisting tetap tersedia sesuai status/aktor. | Daftar Order 3,5 |
| REQ-006 | Order tersimpan berstatus Menunggu Konfirmasi; diterima menjadi Menunggu Penugasan; ditolak menjadi Ditolak. | Daftar Order 6 |
| REQ-007 | Wizard empat step; Draft menyimpan step terakhir apabila minimal satu field terisi. | Akses 2–3 |
| REQ-008 | Selanjutnya memvalidasi required per step; Sebelumnya menjaga data dan step terakhir yang sudah diisi. | Akses 3 |
| REQ-009 | Batal menampilkan konfirmasi lalu kembali ke Daftar Order setelah dikonfirmasi. | Akses 3 |
| REQ-010 | PIC Pengirim/Penerima dan WhatsApp wajib, catatan dapat diubah; setiap titik multipickup/multidrop/multipoint memiliki card Muat(n)/Bongkar(n). | Step 01 |
| REQ-011 | Jenis Kontainer dari lelang read-only; Jumlah Kontainer bilangan bulat minimal 1; jumlah card mengikuti input. | Step 02 1–2 |
| REQ-012 | Nomor DO berupa multi tag opsional; Pilih Barang mengambil barang dari master. | Step 02 3 |
| REQ-013 | Jumlah barang tiap baris wajib; Nilai Barang wajib jika asuransi digunakan; kontainer tanpa barang/jumlah tidak bisa dilanjutkan. | Step 02 4,6 |
| REQ-014 | Total Berat dan Total Kubikasi dihitung dari barang dan menampilkan alert batas kapasitas sesuai aturan eksisting. | Step 02 5 |
| REQ-015 | Tanggal Permintaan Muat wajib datetime, tidak lebih awal dari sekarang dan tidak melewati Rencana Akhir Kirim. | Step 03 1 |
| REQ-016 | Vendor, drop point, jenis/jumlah kontainer dan harga satuan read-only; link multipoint membuka detail; ringkasan berat/kubikasi/nilai berasal dari Step 02. | Step 03 2–4 |
| REQ-017 | DPP = harga satuan × jumlah kontainer; Total = DPP + PPN − PPh + Asuransi. Pajak mengikuti penawaran dan read-only; asuransi dari total nilai barang kontainer yang diasuransikan dengan tarif lelang/master. | General Rule 6–7; Step 03 5 |
| REQ-018 | Tanpa jadwal: toggle Gunakan Batas Toleransi Jadwal Kapal menampilkan acuan Closing Time/ETD/ETA dan batas datetime wajib ≤ Rencana Akhir Kirim; nilai menjadi batas konfirmasi vendor. | Step 03 6,8–9 |
| REQ-019 | Dengan jadwal: toggle toleransi tidak muncul, jadwal direct/connecting dari penawaran read-only. | Step 03 10 |
| REQ-020 | Tanpa jadwal: banner Jadwal kapal saat ini belum tersedia muncul pada keempat step dan tidak memblokir simpan. | Banner Informasi |
| REQ-021 | Review seluruh data read-only; Simpan membuat order Menunggu Konfirmasi dan notifikasi order baru ke vendor terpilih. | Step 04 |
| REQ-022 | Konfirmasi Order hanya vendor pemilik order dengan status Menunggu Konfirmasi. | Konfirmasi Order 1 |
| REQ-023 | Modal konfirmasi berisi ringkasan read-only, radio Terima/Tolak; Simpan disabled sebelum pilihan. | Konfirmasi Order 2 |
| REQ-024 | Terima order dengan jadwal tidak menampilkan form jadwal; mempertahankan jadwal penawaran dan status menjadi Menunggu Penugasan. | Konfirmasi Order 4 |
| REQ-025 | Terima order tanpa jadwal mewajibkan form jadwal direct/connecting valid; tersimpan sebagai sumber penugasan/tracking. | Konfirmasi Order 5,8 |
| REQ-026 | Dengan toleransi: banner acuan/batas WIB; field acuan melebihi batas menampilkan Melewati batas toleransi waktu dan tidak tersimpan. | Konfirmasi Order 6 |
| REQ-027 | Tanpa toleransi: pengisian jadwal konfirmasi tetap dibatasi Rencana Akhir Kirim. | Konfirmasi Order 7 |
| REQ-028 | Tolak wajib alasan; status Ditolak dan order tetap di daftar vendor; shipper mempertahankan order sampai penawaran lain disimpan. | Konfirmasi Order 9–12; Penolakan 1 |
| REQ-029 | Pilih Penawaran Lain hanya shipper pada order Ditolak; wizard Memilih Penawaran/Review, mengecualikan penawaran sebelumnya, tombol Pilih. | Penolakan 2–3 |
| REQ-030 | Review penggantian menampilkan perubahan vendor/harga/jadwal; Simpan menyimpan perubahan dan order ditolak sebelumnya masuk Riwayat Order Tidak Aktif shipper; tetap di vendor lama. | Penolakan 3–4; Konfirmasi 11–12 |
| REQ-031 | Shipper hanya dapat Edit Jadwal untuk vendor yang pengelolanya admin, tanpa approval; vendor dapat mengedit jadwal order miliknya. | Perubahan Jadwal General 1–2 |
| REQ-032 | Edit Jadwal memvalidasi toleransi jika aktif dan Rencana Akhir Kirim, serta mendukung direct ↔ connecting. | Perubahan Jadwal shipper/vendor 1–3 |
| REQ-033 | Edit vendor dengan approval aktif mengajukan jadwal dan status Konfirmasi Jadwal; shipper mendapat action Konfirmasi Jadwal. | Perubahan Jadwal vendor 5–6 |
| REQ-034 | Setting approval nonaktif membuat perubahan vendor berlaku langsung tanpa menunggu respons shipper. | Perubahan Jadwal General 3 |
| REQ-035 | Shipper menerima pengajuan: jadwal baru efektif; menolak: jadwal lama tetap; kedua hasil menjadi Menunggu Penugasan. | Perubahan Jadwal vendor 7 |
| REQ-036 | Perubahan jadwal tercatat di Riwayat Perubahan. | Perubahan Jadwal shipper/vendor 4 |
| REQ-037 | Penugasan vendor mengikuti proses pilih order, data kontainer, armada, sopir dan mode penugasan dengan validasi eksisting. | Penugasan 1,5 |
| REQ-038 | Tambah/Edit Penugasan menghilangkan input jadwal; Jadwal Kapal read-only berisi jenis, pelayaran, kapal, voyage, Open Stack, Closing Time, ETD, ETA; connecting menampilkan rangkaian. | Penugasan 1–2 |
| REQ-039 | Sumber jadwal penugasan: penawaran jika lelang memiliki jadwal; konfirmasi vendor jika lelang tanpa jadwal; konfirmasi vendor untuk order tanpa lelang sesuai aturan khusus penugasan. | Penugasan 3 |
| REQ-040 | Detail Penugasan menampilkan No. Lelang dalam Detail Data Order khusus order lelang. | Penugasan 4 |

### Validasi dan data uji

| Field/aturan | Validasi eksplisit | Hal yang belum ditetapkan |
|---|---|---|
| PIC dan WhatsApp setiap titik | Wajib, dapat diubah | Format WA, panjang nama/catatan tidak disebutkan |
| Jumlah Kontainer | Minimal 1, card sesuai jumlah | Maksimum tidak disebutkan; diasumsikan bilangan bulat |
| Jumlah barang | Wajib per baris, barang wajib di kontainer | Rentang maksimum dan satuan bergantung master; nilai positif diasumsikan |
| Nilai Barang | Wajib ketika diasuransikan | Pembulatan dan batas nilai belum ditetapkan |
| Tanggal Permintaan Muat | Sekarang ≤ waktu ≤ Rencana Akhir Kirim | Inklusivitas batas diasumsikan dari kata tidak boleh lebih kecil/melebihi |
| Batas Toleransi | Datetime wajib jika toggle aktif; ≤ Rencana Akhir Kirim | Hubungan minimum dengan sekarang tidak disebutkan |
| Jadwal Kapal | Wajib bila menerima order tanpa jadwal; validasi eksisting | Urutan/kewajiban per leg tidak dirinci |
| Alasan Penolakan | Wajib | Maksimum panjang tidak disebutkan |

### Alur dan otorisasi

Shipper: Detail Harga Penawaran → Pesan → Data Pengiriman → Data Barang → Vendor dan Harga → Review → Menunggu Konfirmasi. Vendor: Daftar Order → Konfirmasi Order → Terima (jadwal bila diperlukan) → Menunggu Penugasan → Tambah/Edit Penugasan → Detail Penugasan. Penolakan membuka alur shipper memilih penawaran pengganti. Perubahan vendor menunggu persetujuan sesuai setting; perubahan shipper hanya untuk vendor dikelola admin. Semua akses juga harus memeriksa kepemilikan order, bukan sekadar visibilitas action.

## UI Inventory

Seluruh 44 PNG dibuka dan dibaca. Nama layar/tag di bawah adalah nama kanonis untuk codegen. Role/name ARIA dan testid disarankan dari tampilan, belum diverifikasi terhadap DOM. Elemen read-only umumnya teks, **bukan textbox**. Pada UI berulang gunakan scope card/titik/baris/leg/dialog. Nama field semantik `No. WhatsApp PIC Pengirim`/`Penerima` dipetakan ke label visual sama `No. WhatsApp PIC` dalam card yang berbeda. Radio dioperasikan dengan `click` ber-role radio; checkbox dengan `check/uncheck`; dropdown custom mungkin membutuhkan click option, bukan native selectOption.

### Daftar Order — `daftar-order-shipper` / `daftar-order-vendor`

Desain: `115-daftar-order.png`, `123.png`, `137.png`, `141a.png`, `145a-shipper.png`, `145c-vendor.png`, `145e-shipper.png`.

| Elemen / label visual | Tipe, placeholder, state | Selector role + name / usulan testid |
|---|---|---|
| Buat Order; Batch Order; Riwayat Pembatalan; Filter | Button | button + masing-masing label / `create-order`, `batch-order`, `cancel-history`, `order-filter` |
| No. Lelang; ID Order | Text input; Masukkan No. Lelang / Masukkan ID Order | textbox + label / `filter-auction`, `filter-order-id` |
| Vendor | Text input pada shipper; tidak muncul di desain vendor 123/137 tetapi muncul 145c | textbox + Vendor / `filter-vendor` (kondisional) |
| Jenis Pengiriman; Kota Asal; Kota Tujuan; Tipe Pengiriman; Metode Pengiriman | Dropdown, placeholder Pilih … | combobox + label / `filter-shipping`, `filter-origin`, `filter-destination`, `filter-type`, `filter-method` |
| Tanggal Buat; Tanggal Permintaan Muat | Date picker Pilih Tanggal | textbox + label / `filter-created-date`, `filter-load-date` |
| Pengirim; Penerima; Drop Point Asal; Drop Point Tujuan; Status | Dropdown Pilih … | combobox + label / `filter-sender`, `filter-recipient`, `filter-pickup`, `filter-dropoff`, `filter-status` |
| Reset; Terapkan | Button | button + label / `filter-reset`, `filter-apply` |
| ID Order/No. Lelang; Vendor; Rute; Total Harga/Status | Header dan baris list; ID/No. Lelang memiliki ikon salin; Vendor/Total Harga memiliki ikon sort | row scoped ID Order, cell/text + label / `order-row-{id}`, `order-auction-{id}`, `sort-vendor`, `sort-price`, `copy-order-id`, `copy-auction-id` |
| Rute kota / Multipickup / Multidrop | Textlink membuka Detail Pickup/Drop Off | link + teks rute dalam baris / `route-pickup`, `route-dropoff` |
| Action … / ikon mata/pensil | Menu atau icon button pada 145c | button + Aksi Order; menuitem + Detail, Konfirmasi Order, Pilih Penawaran Lain, Edit Jadwal, Konfirmasi Jadwal, Riwayat Perubahan, Lihat No. Resi, Batalkan Order, Order Kembali / `order-actions-{id}` |
| Tampilkan 20 data; 1/2/3; pertama/sebelumnya/berikutnya/terakhir | Dropdown dan pagination | combobox + Tampilkan; button + Halaman … / `page-size`, `page-next`, `page-last` |

State terlihat: isi draft Data Dasar/Muatan/Vendor/Review, Menunggu Konfirmasi, Ditolak, Menunggu Penugasan, Konfirmasi Jadwal, Ditugaskan, Proses Pengiriman, Terkirim, Dibatalkan. Empty/loading list tidak diperlihatkan, scenario menggunakan oracle semantik.

### Detail Pickup / Detail Drop Off — `detail-droppoint`

Desain `115a.png`, `115b.png`: modal heading Detail Pickup/Detail Drop Off, kota, nama gudang, alamat read-only; ikon X. Selector `dialog` + heading, `button` + Tutup (name usulan), testid `droppoint-dialog`, `dialog-close`. Data drop-off di mockup identik pickup; ekspektasi berdasarkan fixture titik tujuan yang sebenarnya.

### Detail Harga Penawaran — `detail-harga-penawaran`

Desain `116.png`: No. Lelang, status Tutup, jenis/tipe/metode, deskripsi barang, jenis/jumlah kontainer, pelabuhan, durasi dan Periode Rencana Pengiriman; Syarat & Ketentuan (Asuransi, biaya termasuk, nilai barang, catatan, TOP, PDF) read-only. Card Harga Penawaran menampilkan pelayaran, vendor, jadwal, kontainer, harga, badge Belum Input Jadwal/Nego ke-2. Pesan enabled, Tidak Berlaku/Kadaluarsa disabled.

| Elemen | Selector role + name / testid |
|---|---|
| Pesan dalam card offer terpilih | button + Pesan scoped `offer-{offerId}` / `offer-order` |
| Filter; Urutkan; Request Jadwal; Ajukan Nego; Lelang Ulang | button + label / `offer-filter`, `offer-sort`, `request-schedule`, `offer-negotiate`, `auction-repeat` |
| Pelayaran; Vendor; Jenis Kontainer; Jenis Jadwal | combobox + label / `offer-filter-shipping-line`, `offer-filter-vendor`, `offer-filter-container`, `offer-filter-schedule` |
| ETD; ETA | textbox + label; DD/MM/YYYY hh:mm / `offer-filter-etd`, `offer-filter-eta` |
| Reset; Terapkan; Tampilkan; pagination | button/combobox scoped offer panel / `offer-reset`, `offer-apply`, `offer-page-size`, `offer-page-next` |
| Detail Biaya; Detail Kapal; Vendor; Dokumen_Lelang_1.pdf | link + label scoped card / `offer-cost-detail`, `offer-ship-detail`, `offer-vendor-detail`, `auction-document` |

Kontrol lelang Request Jadwal/Ajukan Nego/Lelang Ulang merupakan konteks modul hulu; hanya pemeriksaan keberadaan/read-only sumber yang relevan, alur negosiasi tidak diperluas.

### Buat Order — Data Pengiriman — `data-pengiriman`

Desain `117.png`, `132-buat-order-step-1-sudah-ada-jadwal-direct.png` (isi sebenarnya **tanpa jadwal**, banner terlihat).

| Elemen | Tipe/placeholder/state | Selector role + name / testid |
|---|---|---|
| Step 01/02/03/04 dan heading | Data Pengiriman, Data Barang, Vendor dan Harga, Review; aktif/done/inactive | heading + label / `order-stepper`, `step-01` … `step-04` |
| Jenis Pengiriman dan Rute; Data Pengirim; Data Penerima | Accordion; data No. Lelang, jenis kontainer/pelabuhan/tipe/metode/drop point/perusahaan/wilayah/alamat/kode pos read-only | region + section / `shipping-route`, `sender-card-{n}`, `recipient-card-{n}` |
| PIC Pengirim; PIC Penerima | Textbox wajib; Nama PIC … | textbox + label / `sender-pic-{n}`, `recipient-pic-{n}` |
| No. WhatsApp PIC pada tiap card | Textbox wajib; Contoh: 081234567898 | textbox + No. WhatsApp PIC scoped card / `sender-wa-{n}`, `recipient-wa-{n}` |
| Catatan pada tiap card | Textarea opsional; Masukkan Catatan | textbox + Catatan scoped card / `sender-note-{n}`, `recipient-note-{n}` |
| Batal; Simpan ke Draf; Selanjutnya | Button | button + label / `order-cancel`, `order-draft`, `order-next` |
| Banner tanpa jadwal | Jadwal kapal saat ini belum tersedia | status + teks (role usulan) / `schedule-unavailable` |

Konfirmasi Batal tidak memiliki PNG; tombol konfirmasi/dismiss diusulkan. Multipoint Muat(n)/Bongkar(n) dari spec, tidak diperlihatkan pada step ini.

### Buat Order — Data Barang — `data-barang`

Desain `118.png`, `133.png`.

| Elemen | Tipe/placeholder/state | Selector role + name / testid |
|---|---|---|
| Jenis Kontainer; Jumlah Kontainer | Jenis read-only; jumlah numeric wajib | text + Jenis Kontainer / `container-type`; spinbutton + Jumlah Kontainer / `container-count` |
| Kontainer n; tabel barang | Card dan tabel Kode SKU/Nama Barang, Kemasan, Kubikasi/Dimensi, Berat, Jumlah; Nilai Barang saat diasuransikan | region + Kontainer n / `container-{n}`; row scoped SKU |
| Tambahkan Asuransi | Checkbox per kontainer; berlaku untuk seluruh barang card | checkbox + Tambahkan Asuransi scoped card / `container-insurance-{n}` |
| Nomor DO | Multi tag; Masukkan Nomor DO; pisahkan dengan koma; ikon X tiap tag | textbox + Nomor DO / `container-do-{n}`; button + Hapus DO (usulan) |
| Pilih Barang; hapus barang (ikon sampah) | Button scoped card/baris; picker master tidak disertakan | button + Pilih Barang / `choose-goods-{n}`; button + Hapus Barang / `delete-goods-{n}-{sku}` |
| Jumlah; Nilai Barang | Numeric/currency per baris; 0 / Rp 0 | spinbutton/textbox + label scoped row / `goods-quantity-{n}-{sku}`, `goods-value-{n}-{sku}` |
| Total Kubikasi; Total Berat | Nilai / kapasitas read-only | status/text + label / `container-volume-{n}`, `container-weight-{n}` |
| Sebelumnya; Simpan ke Draf; Selanjutnya; Batal; banner | Button dan banner seperti wizard | button + label / `order-back`, `order-draft`, `order-next`, `order-cancel` |

Error terlihat: `Jumlah harus diisi`, `Nilai Barang harus diisi`, `Berat melebihi kapasitas armada`, `Kubikasi melebihi kapasitas armada`. Empty: `Belum ada barang. Klik “Pilih Barang”`. Mockup menunjukkan input jumlah 2 dengan 3 card; oracle card mengikuti input sesuai spec.

### Buat Order — Vendor dan Harga — `vendor-harga`

Desain `119-buat-order-step-3-sudah-ada-jadwal-direct.png`, `120-buat-order-step-3-sudah-ada-jadwal-connecting.png`, `134.png`, `134a-jika-ada-batas-toleransi-hari.png`.

| Elemen | Tipe/state | Selector role + name / testid |
|---|---|---|
| Tanggal Permintaan Muat | Required datetime DD/MM/YYYY hh:mm | textbox + label / `requested-load-at` |
| Vendor; Drop Point Asal/Tujuan; Jenis/Jumlah Kontainer; Harga Satuan | Read-only; nama harga pada 134 Harga Penawaran | text + label / `order-vendor`, `order-pickup`, `order-dropoff`, `container-type`, `container-count-summary`, `unit-price` |
| Link multipoint | Pop up detail dari spec | link + Multipickup/Multidrop / `order-pickup-detail`, `order-dropoff-detail` |
| Ringkasan kontainer; Harga DPP; PPN; PPh; Asuransi; Total Harga | Tabel/status read-only | table + Ringkasan Kontainer; text + label / `container-summary`, `price-dpp`, `price-vat`, `price-withholding`, `price-insurance`, `price-total` |
| Gunakan Batas Toleransi Jadwal Kapal | Checkbox hanya tanpa jadwal | checkbox + label / `schedule-tolerance-enabled` |
| Closing Time; Berangkat (ETD); Tiba (ETA) | Radio acuan toleransi | radio + label scoped toleransi / `tolerance-closing`, `tolerance-etd`, `tolerance-eta` |
| Batas Toleransi | Datetime; mockup DD/MM/YYYY 23:59 | textbox + label / `schedule-tolerance-at` |
| Jadwal Kapal; Detail Jadwal; Kapal Connecting | Read-only direct/connecting; nama, voyage, Open Stack/Closing/ETD/ETA; connecting tabel Pelabuhan Connecting/Nama Kapal/Voyage/ETD Connecting | region + Jadwal Kapal / `effective-schedule`; table + Kapal Connecting / `connecting-schedule` |
| Navigasi/footer/banner | Batal, Sebelumnya, Simpan ke Draf, Selanjutnya | seperti wizard |

### Buat Order — Review / Detail Order — `review-order` / `detail-order`

Desain `121.png`, `135.png` (review); `122.png`, `136.png` (detail). Seluruh section data rute/PIC/DO/barang/harga/jadwal read-only, accordion dapat dibuka/tutup. Selector `region` + nama section; `review-order-data` / `order-detail-data`. Review: button Simpan (`order-save`), Sebelumnya/Draft/Batal. Detail: button Edit Order/Batalkan Order (`order-edit`, `order-cancel-existing`). Banner tanpa jadwal pada review/detail; detail 136 menampilkan Menunggu Jadwal (konflik spec, lihat A16).

### Konfirmasi Order vendor — `konfirmasi-order`

Desain `124.png`, `125.png`, `126.png`, `138.png`, `139.png`, `140.png`, `141.png`, `141a-jika-ada-batas-toleransi.png`.

| Elemen | Tipe/state | Selector role + name / testid |
|---|---|---|
| Konfirmasi Order; ringkasan muat/akhir kirim/jenis/jumlah/pelabuhan | Dialog; ringkasan read-only | dialog + Konfirmasi Order / `confirm-order-dialog`; `confirm-order-summary` |
| Terima Order; Tolak Order | Radio, awal belum terpilih | radio + label / `accept-order`, `reject-order` |
| Alasan Penolakan | Textarea required saat Tolak; Tuliskan Alasan Penolakan | textbox + label / `rejection-reason` |
| Direct; Connecting | Radio Jenis Jadwal Kapal wajib saat terima tanpa jadwal | radio + label / `schedule-direct`, `schedule-connecting` |
| Pelayaran | Dropdown wajib; Pilih Pelayaran | combobox + Pelayaran / `schedule-shipping-line` |
| Nama Kapal; Voyage | Textbox wajib; Masukkan Nama Kapal / Masukkan Voyage | textbox + label / `schedule-ship`, `schedule-voyage` |
| Closing Time; Berangkat (ETD); Tiba (ETA) | Date/datetime wajib; placeholder desain DD/MM/YYYY | textbox + label scoped kapal utama / `schedule-closing`, `schedule-etd`, `schedule-eta` |
| Pelabuhan Connecting; Kapal Connecting; Voyage; ETD Connecting | Dropdown/text/datetime wajib tiap leg | combobox/textbox + label scoped leg / `leg-port-{n}`, `leg-ship-{n}`, `leg-voyage-{n}`, `leg-etd-{n}` |
| Tambah Kapal Connecting | Button/link tambah leg | button + label / `add-connecting-ship` |
| Banner batas toleransi; error field | Batas toleransi waktu … hingga …; Melewati batas toleransi waktu | status/alert + teks / `schedule-tolerance-banner`, `schedule-tolerance-error` |
| Simpan; Batal; X | Simpan disabled awal; Batal/X menutup | button + label / `confirm-order-save`, `confirm-order-cancel`, `dialog-close` |

Open Stack tidak tampak sebagai input di form konfirmasi/edit; tetap data jadwal read-only pada penugasan. Pengisian/penurunan Open Stack mengikuti baseline OMS, tidak dibuat textbox baru. Desain 138–141 berlatar Penugasan Tracking, tetapi entry point resmi mengikuti spec dari Daftar Order.

### Pilih Penawaran Lain / Review Penggantian — `pilih-penawaran-lain` / `review-penawaran-lain`

Desain `141b.png`, `141c.png`: step 01 Pilih Penawaran dan step 02 Review; panel/filter/card seperti harga penawaran; button **Pilih** scoped offer (`replacement-offer-select`). Review menampilkan section lengkap termasuk vendor/harga/jadwal, read-only (`replacement-review`). Footer Batal/Simpan ke Draf/Selanjutnya di desain; penyimpanan final mengikuti **Simpan** di spec (name/testid usulan `replacement-save`). Draft/negosiasi tambahan pada wizard pengganti belum memiliki aturan eksplisit.

### Edit Jadwal shipper/vendor — `edit-jadwal-shipper` / `edit-jadwal-vendor`

Desain `145a-shipper.png`, `145b-shipper.png`, `145c-vendor.png`, `145d-vendor.png`. Action Edit Jadwal; dialog Edit Jadwal (`edit-schedule-dialog`), ringkasan read-only; radio Direct/Connecting dan field jadwal sama konfirmasi; Simpan/Batal/X (`edit-schedule-save`, `edit-schedule-cancel`, `dialog-close`). Contoh direct terisi. Connecting/toleransi edit dari spec dan komponen konfirmasi. Setting approval tidak memiliki PNG: `pengaturan-approval`, checkbox nama usulan Persetujuan Shipper untuk Edit Jadwal, button Simpan.

### Konfirmasi Jadwal shipper / Riwayat — `konfirmasi-jadwal` / `riwayat-perubahan` / `riwayat-order-tidak-aktif`

Desain `145e-shipper.png`, `145f-shipper.png`: action Konfirmasi Jadwal; modal berjudul **Konfirmasi Order** pada mockup, ringkasan dan jadwal pengajuan connecting read-only; button Tolak/Terima (`reject-schedule`, `accept-schedule`), X. Gunakan testid `confirm-schedule-dialog` untuk membedakannya dari konfirmasi vendor. Riwayat Perubahan terlihat sebagai menuitem pada 141a/145a/145e, isi layar belum ada: tabel actor/waktu/nilai lama-baru merupakan usulan fixture audit. Riwayat Order Tidak Aktif dari spec, **berbeda** dari button Riwayat Pembatalan yang terlihat.

### Tambah/Edit Penugasan — `tambah-penugasan` / `edit-penugasan`

Desain `127.png`, `128.png`, `142.png`, `143.png` (Tambah); Edit dari spec/button detail.

| Elemen | Tipe/state | Selector role + name / testid |
|---|---|---|
| Cari Order; Pilih Order | Search dan radio card order | textbox + Cari Order / `assignment-order-search`; radio + ID order / `assignment-order-{id}` |
| Ringkasan No. Lelang, kota/pelabuhan, jenis/jumlah kontainer, metode, permintaan muat | Read-only | region + Detail Data Order / `assignment-order-summary` |
| No. Kontainer; No. Segel | Textbox wajib per kontainer; Masukkan … | textbox + label scoped Kontainer n / `assignment-container-{n}`, `assignment-seal-{n}` |
| Pilih Dari Master; Isi Data Manual | Radio terpisah untuk Armada Muat dan Sopir Muat | radio + label scoped group / `fleet-master-{n}`, `fleet-manual-{n}`, `driver-master-{n}`, `driver-manual-{n}` |
| No. Polisi/Jenis Armada; Sopir/No. WhatsApp | Dropdown Cari … | combobox + label scoped Kontainer n / `assignment-fleet-{n}`, `assignment-driver-{n}` |
| Tugaskan ke Sopir; Tugaskan ke Pengurus | Radio Mode Penugasan; banner informasi peran | radio + label / `assign-driver`, `assign-manager`; status / `assignment-mode-info` |
| Jadwal Kapal direct/connecting | Seluruh data read-only; **tidak ada input jadwal** | region + Jadwal Kapal / `assignment-schedule`; table + Kapal Connecting |
| Simpan; Batal | Button | button + label / `assignment-save`, `assignment-cancel` |

Field manual tidak ditampilkan; label No. Polisi/Jenis Armada/Nama Sopir/No. WhatsApp diusulkan berdasarkan baseline. Tidak ada desain loading/error/success penugasan.

### Penugasan Sopir Bongkar — `penugasan-sopir-bongkar`

Desain `128a-penugasan-sopir-bongkar.png`: ringkasan order/lelang/kontainer/segel read-only; Tanggal Permintaan Bongkar datetime wajib (`requested-unload-at`); Armada Bongkar/Sopir Bongkar masing-masing radio Pilih Dari Master/Isi Data Manual; dropdown No. Polisi/Jenis Armada dan Sopir/No. WhatsApp; mode Tugaskan ke Sopir/Pengurus, banner, Batal/Simpan. Selector role sesuai tabel penugasan, scope section Bongkar. Regresi terbatas pada field wajib/master/mode dan keutuhan jadwal dari order.

### Detail Penugasan shipper/vendor — `detail-penugasan-shipper` / `detail-penugasan-vendor`

Desain `130-vendor.png`, `131-shipper.png`, `144-vendor.png`, `145-shipper.png`: heading Detail Penugasan + Belum Berangkat; button Edit Penugasan (`assignment-edit`); Detail Data Order dengan No. Lelang; informasi muat/bongkar, kapasitas, armada, sopir/WA, mode, tanggal bongkar; Lihat Detail Riwayat Penugasan (`assignment-history`); History Tracking tab Per Tahapan/Timeline (`tracking-by-stage`, `tracking-timeline`). Section jadwal tidak terlihat pada potongan detail; tidak diasumsikan screenshot memuatnya. Shipper melihat tombol Edit Penugasan di mockup tetapi hak mengubah penugasan tidak ditentukan; tidak memperluas otorisasi shipper berdasarkan gambar.

### Kontrak metadata untuk codegen

`steps` tetap memakai `{action, target, value}` dan tujuh action yang diizinkan. `expect.value` berupa `{assertion, expected}` agar assertion visible, text, count, checked, enabled, readonly, value, rows, snapshot dan audit tidak direduksi menjadi sekadar keberadaan elemen. Helper Playwright memetakan visible ke toBeVisible/negasi, text ke toHaveText setelah normalisasi Rupiah/satuan, count ke toHaveCount, checked/enabled/value ke assertion yang sesuai. `readonly` pada teks/region berarti tidak tersedia kontrol pengubah data, bukan atribut HTML readonly pada seluruh region. Snapshot/audit/baseline/aggregate membutuhkan helper fixture pembanding, bukan satu locator teks.

Target seperti `Jumlah [Kontainer 1/SKU-PPR-001]` memakai name `Jumlah` dalam scope card/baris yang disebut. Role null memakai testid/text locator; `proposed: true` menandai saran selector yang belum diverifikasi terhadap DOM. Target observasi agregat/non-UI memiliki testid null dan keterangan harness, tidak menyiratkan ada elemen bernama tersebut. Assertion error untuk field memakai helper/error container yang terkait input. `navigate` memakai registry layar-ke-URL; saat tujuan beraktor lain, harness menggunakan session actor yang sudah disiapkan, tanpa mengubah akun produk. Jalur/popup dapat dipetakan sebagai navigasi kontekstual, bukan selalu page.goto URL baru.

Preconditions dieksekusi oleh fixture/harness: menyiapkan state step/order, master, kapasitas, tarif, kegagalan jaringan sebelum/sesudah commit, dan versi stale. ID order yang baru dibuat diikat ke `orderId` pada langkah lanjutan; nilai contoh tidak dianggap ID produksi tetap. UI yang belum didesain memakai selector usulan A20. Input datetime ISO pada JSON dikonversi ke format kontrol dengan offset WIB tetap; angka harga/berat/kubikasi dibandingkan setelah parsing format Indonesia. Untuk numeric field native yang menolak karakter nonangka, helper intent `fill` memastikan penolakan browser/field kosong, bukan memaksa DOM menerima payload invalid.

`testData.execution` pada stress mengatur jumlah worker/iterasi, barrier dan isolasi ID; langkah menggambarkan pekerja, oracle aggregate diperiksa setelah semua pekerja selesai. `execution.matrix` memperluas placeholder `ETD_LOAD_CASE`/`DECISION_LOAD_CASE`; `generatedValues` memperluas teks/tag beban; populateAllCards/populateGoodsQuantities/populateAssignmentCards menyiapkan semua card melalui UI dengan fixture baseline. Stress audit/detail dapat memakai fixture besar yang sudah dibuat, lalu menguji pembacaan. Semua ini spesifikasi test, belum eksekusi Playwright/performance pada aplikasi TMS.

## Assumptions Log

- A01 — `extras/` kosong; konteks pendukung tidak tersedia. Prosedur/validasi OMS eksisting tidak disertakan, sehingga regresi menggunakan fixture baseline OMS yang harus disediakan saat implementasi tes.
- A02 — General Rule read-only ditafsirkan untuk data turunan lelang/penawaran; pengecualian rinci Step 02/03 (jumlah, barang, nilai, tanggal muat, toleransi) tetap dapat diisi sesuai aturan khususnya.
- A03 — Frasa vendor bebas tanpa toleransi tetap tunduk pada Rencana Akhir Kirim menurut aturan konfirmasi yang lebih spesifik; tidak diasumsikan tanpa batas tanggal.
- A04 — Order Ditolak tetap aktif di daftar shipper sebelum penggantian disimpan. Sesudah penggantian, catatan vendor lama diarsipkan di shipper dan tetap terlihat vendor lama. Identitas order pengganti/status tidak dijelaskan; diasumsikan order aktif baru Menunggu Konfirmasi dengan referensi order lama, tanpa menimpa catatan Ditolak.
- A05 — Aturan order tanpa lelang mempertahankan alur eksisting bertentangan dengan sumber jadwal penugasan dari konfirmasi vendor. Untuk REQ-039 mengikuti aturan khusus sumber jadwal; perubahan UI order langsung tidak ditebak.
- A06 — Clock tes dibekukan `2026-10-07T10:00:00+07:00`, Rencana Akhir Kirim `2026-10-10T18:00:00+07:00`. Batas datetime inklusif; precision pengujian satu menit menyesuaikan kontrol UI, semua representasi WIB.
- A07 — Jumlah kontainer/barang bilangan bulat positif; input kosong/0/negatif/pecahan/nonangka ditolak. Nilai Barang tidak negatif; batas panjang teks/volume maksimum belum ditentukan sehingga bukan oracle batas produk.
- A08 — Tarif pajak dan asuransi memakai fixture eksplisit, tanpa menetapkan tarif hukum. Contoh harga 1.000.000, 2 kontainer, PPN 10%, PPh 2%, asuransi 0,5% atas nilai 6.000.000 menghasilkan DPP 2.000.000, PPN 200.000, PPh 40.000, asuransi 30.000, total 2.190.000; pembulatan nominal menggunakan fixture master.
- A09 — Aturan tanggal OMS eksisting diasumsikan Open Stack ≤ Closing Time ≤ ETD ≤ ETA akhir; ETD connecting setelah ETD utama dan berurutan sebelum ETA akhir. ETA per leg tidak disediakan form, sehingga tidak dibuat input tambahan. Cakupan Rencana Akhir Kirim diasumsikan membatasi Closing Time/ETD/ETA semua leg; harus dikonfirmasi terhadap baseline OMS sebelum codegen final.
- A10 — Sebelum persetujuan shipper, jadwal efektif tetap jadwal lama; pengajuan vendor disimpan terpisah. Perubahan ditolak tidak dianggap jadwal efektif baru; keputusan/pengajuan tetap dapat diaudit.
- A11 — Kepemilikan order dan penolakan akses melalui tautan langsung/role berbeda merupakan asumsi keamanan untuk memenuhi negative tiap REQ; mekanisme role rinci belum disediakan.
- A12 — Stres memakai fixture 100 order, 50 kontainer, 200 barang, 20 sesi atau teks 10.000 karakter; angka adalah beban uji, bukan batas produk/SLA. Jika ada batas OMS konfigurasi, gunakan batas tersebut dan pastikan validasi terkendali, tidak korupsi data.
- A13 — Pembatalan/dismiss modal tidak menyimpan perubahan. Simpan ganda akibat retry harus idempoten untuk transaksi yang sama; klik Pesan terpisah yang disengaja tetap membuat order berbeda sesuai REQ-002.
- A14 — Pesan error selain banner/helper yang dikutip spec adalah oracle semantik, bukan teks UI final. `data-testid` serta nama aksesibilitas selector merupakan usulan; locator tabel/card wajib dibatasi konteks baris, kontainer, titik atau leg.
- A15 — Label beberapa desain read-only menukar Berangkat (ETA) dan Tiba (ETD). Oracle dan selector kanonis tetap Berangkat (ETD)/Tiba (ETA) sesuai spec; nama accessible DOM perlu disesuaikan saat implementasi.
- A16 — Desain 136 menampilkan Menunggu Jadwal dan 137 menampilkan action Konfirmasi Order pada Menunggu Penugasan. Status dan gating memakai spec: Menunggu Konfirmasi sebelum vendor merespons, action hanya pada status itu. Data contoh LTL/LCL dengan No. Lelang dalam list juga tidak memperluas jalur lelang di luar FCL/FTL.
- A17 — Jumlah card 118/133 (3) berbeda dari input jumlah (2); mengikuti spec card harus sama jumlah input. Contoh tarif/nominal/harga total desain tidak konsisten; oracle memakai rumus dan fixture A08, bukan menyalin nominal screenshot.
- A18 — Batas Toleransi pada desain 134a placeholder 23:59, beberapa jadwal konfirmasi date-only. Mengikuti spec datetime WIB; 23:59 tidak otomatis menggantikan jam pilihan user. Input Open Stack tidak tampak; sumber nilainya mengikuti baseline OMS/master dan diperiksa sebagai data read-only.
- A19 — Footer review pengganti 141c bertuliskan Selanjutnya dan modal Konfirmasi Jadwal 145f bertajuk Konfirmasi Order; action akhir tetap Simpan dan konteks modal tetap persetujuan jadwal sesuai spec. testid disarankan untuk membedakan modal.
- A20 — UI master barang, setting approval, Riwayat Perubahan, Riwayat Order Tidak Aktif, konfirmasi pembatalan, serta input armada/sopir manual tidak disertakan PNG. Inventaris dan selector di bagian tersebut diturunkan minimal dari spec/baseline, tidak diklaim terlihat.
- A21 — Nilai Barang diasumsikan nilai per unit barang yang dikalikan jumlah untuk total nilai kontainer; contoh desain tidak cukup konsisten untuk memastikan satuan. Fixture harga menyertakan nilai per unit dan total hasil perhitungan; sesuaikan jika baseline memakai nilai total per baris. Pemilihan asuransi per kontainer mengikuti checkbox desain dan aturan kontainer dicentang pada spec.
- A22 — Scope toleransi connecting belum eksplisit. Acuan Closing Time/ETD memakai kapal utama; ETA memakai kedatangan akhir. ETD connecting tetap diuji terhadap kronologi dan batas akhir kirim, bukan diasumsikan setiap leg tunduk toleransi ETD kapal utama.
- A23 — Empty draft untuk pengujian berarti tidak ada field input yang terisi, termasuk nilai PIC prefill yang dapat diedit; data turunan lelang read-only saja tidak dihitung sebagai field input. Whitespace-only tidak dianggap input bermakna.
- A24 — Penugasan baru diasumsikan hanya untuk order diterima Menunggu Penugasan, tanpa proposal pending dan dengan jadwal efektif lengkap. Perlindungan versi stale, transaksi atomik dan keputusan tunggal pada race merupakan oracle integritas; cara konflik ditampilkan mengikuti baseline implementasi.
