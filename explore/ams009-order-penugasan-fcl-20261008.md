# Eksplorasi fokus AMS009 — Order & Penugasan FCL

8 Oktober 2026 malam. Eksplorasi baca aplikasi langsung melalui akun Admin lalu Vendor, login memakai config/env.md. Tidak simpan/draft/submit/import/konfirmasi/penugasan, tidak mengubah setting atau data existing. Form lokal dibatalkan.

## Hasil utama

Menu **Order tersedia dan aktif di sidebar**. Admin menuju /order, Vendor menuju /vendor-portal/order. AMS009 sudah memiliki daftar Order, detail FCL, form empat step, Batch Order, riwayat dan entrypoint Penugasan Tracking. Ketersediaan UI ini berbeda dari kesiapan seluruh fixture skenario.

| Area | Route dari UI | Observasi langsung |
|---|---|---|
| Order Admin | /order |4order:1FCL lelang dan1FTL lelang Menunggu Konfirmasi;2FTL manual Menunggu Penugasan. No. Lelang di bawah identitas order/vendor pada row terkait. |
| Detail FCL | /order/ff0c13f4-8031-44a0-ad47-772579c3fee8 | ORD1427559140, No. Lelang FCL-NRM-14/071026, kontainer40ft×1, TanjungPerak→Semayang, Normal/Door to Door. Data pengiriman/barang,harga,pajak,jadwal Direct dan No.Perjalanan tampil. |
| Harga detail | Di detail FCL |20Beras×5kg=100kg;20×0,016m³=0,32m³. DPP100.000+PPN2.000−PPh3.000=99.000. Ini observasi fixture existing, bukan pengujian tarif JSON. |
| Jadwal detail | Di detail FCL | Direct; Meratus,KM Kartika,voyage14/14/14; OpenStack07/10/2026 07:00,Closing01/11 07:00,ETD02/11 07:00,ETA01/12 07:00. Tidak menyimpulkan validasi periode karena lelang sumber dan batasnya belum diuji. |
| Aksi row FCL | Menu titik tiga row |Detail tersedia. Ada Lihat No.Perjalanan/Resi,Lanjutkan Pengisian,Edit,Batalkan,Order Kembali,Riwayat Perubahan dengan penjelasan gating. Edit data lelang terkunci setelah disimpan; batal Menunggu Konfirmasi tidak tersedia. Tidak klik mutasi. |
| Filter | /order |ID Order,jenis,vendor,kota asal/tujuan,tanggalbuat/muat,tipe,drop point,pengirim,penerima,status. ID fiktif menghasilkan0data; Reset mengembalikan4data. |
| Buat Order FCL | /order/buat |Empat step:Data Pengiriman,Data Barang,Vendor dan Harga,Review. FCL memiliki Pelabuhan Asal/Tujuan,Jenis Kontainer,Jumlah Kontainer,empat metode pengiriman dan PIC/WA/catatan tiap sisi. Wilayah/alamat disabled pada form awal. |
| Master kontainer | Dropdown form FCL |11opsi, termasuk20ft,40ft,HighCube,Reefer,OpenTop,FlatRack. Nama20DRY pada JSON memerlukan mapping aktual, bukan selector literal. |
| Master pelabuhan | Dropdown form FCL |Makassar(MKS),Semayang(BPN),TanjungPerak(TJP). Panjang(PNJ) pada contoh fixture belum tersedia di dropdown sampel; jangan mengubah master bersama saat explore. |
| Batch Order | /order/batch |FTL/FCL/LTL/LCL. FCL menampilkan fileinput,batas4MB,Import Batch Order dan menu Download Template Excel:Normal/Multipickup/Multidrop/Multipoint. Tidak download/import pada sesi ini. |
| Riwayat Pembatalan | /order/riwayat-pembatalan |Terbuka,0data. |
| Riwayat Order Tidak Aktif | /order/riwayat-tidak-aktif |Terbuka,0data; menjelaskan order ditolak yang sudah memiliki order pengganti. |
| Tracking Admin | /penugasan-tracking |Terbuka,0data; filter order/jenis/rute/unit/sopir/status/tahapan/tanggal/vendor. |

## Checklist hipotesis dan diagnosis harness

- Klik native membuka menu/sidebar/filter/dropdown/form; tidak perlu dispatchEvent. Sidebar SPA berpindah async: capture segera setelah click sempat masih /monitoring; waitForURL menghasilkan /order settled. Ini masalah timing harness, bukan menu tidak berfungsi.
- Dropdown jenis/pelabuhan/kontainer kustom button+option; ukuran halaman select native.
- Kalender filter Admin memakai flatpickr70sel; ada1button.h-9.w-9 lain, bukan seluruh grid hari.
- Batal form lokal membuka konfirmasi tanpa role=dialog; Ya membuang input lokal dan kembali /order.
- List/form sampel0data-testid. Jumlah Kontainer input type=text, bukan spinbutton pada selector usulan.
- StorageState tidak diperiksa ulang; login dilakukan berurutan pada context masing-masing.

## Koreksi blocker dan kesiapan pengujian

Run sebelumnya 20261008-191943 adalah pemeriksaan prasyarat, bukan262uji bisnis yang selesai. Penetapan seluruh skenario blocked terlalu luas. Menu/list/detail/filter/form dapat dieksplor dan sebagian dapat diuji dengan data aktual tanpa clock backend khusus. Contoh ID JSON adalah placeholder yang harus diikat ke fixture aktual sesuai analysis, bukan syarat nomor literal harus ada di staging.

Baseline OMS hanya diperlukan oleh oracle baseline terkait. Clock perlu diselaraskan pada pengujian batas tanggal/waktu, bukan semua interaksi UI. Data uji milik current-run perlu dibuat untuk mutasi konfirmasi/penolakan/penggantian/penugasan; existing milik pihak lain tidak dimutasi. Perubahan setting tenant tetap mengikuti larangan panduan. Detail status Vendor dan penugasan belum terbukti hanya karena entrypoint tersedia.

Selector aktual disimpan di shared/selector-map-order-tracking-muatan.md dan scenario/ams009-order-penugasan-fcl/ams009-order-penugasan-fcl_ui-inventory.md. Expected JSON tidak diubah. Hasil formal lama tetap disimpan sebagai audit; eksplorasi ini tidak menggantinya dengan verdict passed.

## Bukti

- Admin: artifacts/explore-batches/20261008/batch07-2026-10-08T13-19-46-391Z, file main-ams009-*.json. Respons API yang tercatat tidak ada>=400;0write bisnis diblokir/diupayakan.
- Screenshot Admin settled: artifacts/screenshots/explore/ams009-order-penugasan-fcl-20261008/admin-order-list.png. Screenshot awal sebelum route settled tidak digunakan sebagai bukti daftar Order.
- Vendor: artifacts/explore-batches/20261008/batch07-2026-10-08T13-24-11-353Z; hasil lanjutan dicatat di bawah.

## Pemeriksaan Vendor

Menu Order tampil di sidebar dan membuka /vendor-portal/order. Login berhasil; Daftar Order akun Vendor0data. Tidak tersedia Buat Order pada role ini. UI filter/ukuranhalaman tersedia. Karena akun Vendor berbeda dari vendor pada FCL existing Admin, tidak menyimpulkan order Admin hilang atau konfirmasi belum diimplementasi. Konfirmasi/penolakan membutuhkan order untuk akun Vendor uji. Screenshot settled: artifacts/screenshots/explore/ams009-order-penugasan-fcl-20261008/vendor-order-list.png.

Heading Vendor sempat timeout saat render belum settled, tetapi setelah menunggu tampil Daftar Order. Ini timing harness, bukan halaman kosong/error aplikasi.

Penugasan Tracking Vendor juga terbuka dengan0data. Kedua role:0write bisnis,0request write yang diblokir,0respons API>=400 tercatat. Kedua browser ditutup setelah eksplorasi. Dataexisting tidak diubah.
