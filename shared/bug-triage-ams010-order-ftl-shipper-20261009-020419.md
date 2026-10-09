# AMS010 — retest 41 blocked, 9 Oktober 2026

Run `20261009-020419`: 18 passed, 3 failed, 20 blocked. Sebanyak21 kasus keluar dari blocked. Hasil gabungan149 kasus:106 passed,10 failed,20 blocked,13 skipped. Sebanyak108 verdict dibawa dari run `20261009-002826` dengan `sourceRun`, bukan diuji ulang.

| SCN | Klasifikasi | Rujukan | Severity | Analisis | Rekomendasi |
|---|---|---|---|---|---|
| SCN-0039 | BUG (probable) | REQ-020 | minor | Fixture1asal/3tujuan tersedia. Step03 menampilkan semua nama tujuan sebagai teks, tanpa textlink/popup detail. | Implementasikan tautan dan detail seluruh titik menurut spec. |
| SCN-0089 | BUG (probable), duplikat0039 | REQ-020 | minor | Fixture2asal/1tujuan tersedia. Tidak ada kontrol membuka/menutup popup Multipickup. | Satukan dengan0039; verifikasi urutan asal/tujuan dan penutupan dialog setelah diperbaiki. |
| SCN-0090 | BUG (probable), duplikat0039 | REQ-020 | minor | Fixture2asal/2tujuan tersedia. Tidak ada textlink/popup Multipoint. | Satukan dengan0039; periksa pemisahan Muat/Bongkar. |

Tiga skenario gagal mewakili satu kandidat bug baru. Konten titik tidak hilang dari Step03, tetapi akses popup yang diwajibkan spec tidak ada. Inventaris desain tidak menyediakan gambar popup; kontrak ini berasal dari spec REQ-020, bukan nama selector/testid usulan. Diagnosis dilakukan dengan body dan seluruh kontrol DOM pada tiga geometri yang tepat. Screenshot: `artifacts/screenshots/20261009-020419/SCN-0039.png`, `SCN-0089.png`, `SCN-0090.png`; inventaris `main-multidrop13-popup-missing.json`, `main-multipickup21-popup-missing.json`, `main-multipoint22-popup-missing.json` di folder artifact run.

Kegagalan awal locator/format pada0034,0100,0108,0072,0021,0122 diperbaiki dan diuji kembali; tidak dibawa sebagai bug. Nama akses heading Detail Penugasan mencakup link Kembali; alert double-over memakai satu pesan gabungan; subtotal volume0,901 ditampilkan0,9. Tanda kurung Muat/Bongkar pada kontrak assertion bukan label literal UI. Semua oracle angka dan kardinalitas tetap diperiksa.

## Blocker yang masih membutuhkan data/keputusan

| Kelompok | SCN | Hambatan terkini |
|---|---|---|
| Clock/deadline | 0006,0011,0035,0036,0109,0111,0112 | Fixed browser DAN server07Okt10WIB tidak tersedia. Tanggal valid literal08Okt sudah lewat; deadline09Okt22 belum lewat saat audit02:33. Rebinding relatif belum dijawab. |
| Basis Nilai Barang | 0041,0042 | A18 menyebut harga satuan, runtime mempertahankan nominal per baris. Oracle belum dikonfirmasi; kapasitas/dua unit kini tersedia. |
| Tarif asuransi | 0043,0045,0046 | Sumber1%, tenant0,2%. Offer6M4jam/PPN1,1/PPh2 sudah tersedia. Setting tenant tidak diubah. |
| Akun tambahan | 0067,0129,0130,0147 | VendorB/IndahKarya dan shipper tenant kedua belum dikonfigurasi. Dua akun yang ada adalah main dan VendorA. |
| Input format tanggal | 0088 | Picker tanggal tidak menyediakan input string bebas `tanggal-tidak-valid`. Tidak mengubah DOM untuk memalsukan langkah. |
| Dokumen/paging offer | 0102 | Fixture satu offer, tanpa dokumen. Syarat/detailbiaya/armada/filter/page20 diperiksa; Next setelah20 tidak dapat dijalankan. |
| Baseline pembulatan | 0124 | Fixture100.005 berhasil dibuat.200,01 mentah tampil200 dan total5.946.200 konsisten Step03/Review/list/detail; aturan pembulatan OMS formal tidak ditemukan. |
| Gabungan dependency | 0148 | Clock literal, A18, tarif1%, dan ekspektasi notifikasi membuat fullflow literal belum dapat divonis. |

20 blocked adalah precondition/oracle yang belum terpenuhi, bukan20 bug aplikasi. Tidak mengubah expected sumber atau menyatakan partial checks sebagai passed. Pertanyaan clock, A18 dan akun tambahan telah diajukan saat persiapan; belum ada jawaban saat penutupan laporan.

## Bukti dan fixture

Baseline OMS014/015/017 dan shared selector-map-order/tracking dibaca dari `/home/icun/Project/omstest` sebagai referensi yang diwajibkan A11. Tidak menjalankan OMS, menggunakan kredensial OMS, menyalin implementasinya, atau mengubah proyek OMS. Perilaku yang dinilai selalu diverifikasi ulang di AMS.

Fixture CURRENT: satu jenis armada18.000kg/54,72m³, limaSKU untuk kapasitas/boundary, enamlelang dengan offerVendorA6M4jam, satuarmada/sopirVendor, duaorder dan dua penugasan. Daftar lengkapID/nomor ada di `artifacts/test-module/ams010-order-ftl-shipper/20261009-020419/main-bindings.json` dan file `vendor-current-direct-assignment-route.json`. Order lelangORD1487389887 mempunyai duaeventMuat/Bongkar denganfoto fixtureAUTOTEST; orderdirectORD1487704375 tanpa hubunganlelang. Tidak ada penghapusan/pembatalan data existing atau setting tenant write.

Laporan final: `reports/ams010-order-ftl-shipper__20261009-020419.xlsx`. Laporan tiga batch memuat14/14/13 kasus retest; focused JSON ada pada `artifacts/test-module/ams010-order-ftl-shipper/20261009-020419/focused-results.json`. Hasil lama dipertahankan. Tujuh failed lama tetap merujuk triage `bug-triage-ams010-order-ftl-shipper-20261009-002826.md`.
