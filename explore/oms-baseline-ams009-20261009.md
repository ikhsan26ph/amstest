# Eksplorasi paket OMS untuk baseline AMS009

Tanggal 2026-10-09T12:40:03.099869+07:00. Login Admin dan Vendor melalui konfigurasi; eksplorasi baca tanpa submit/save.

GET /api/system/status HTTP 200: products [OMS, AMS], addOns SERVICE_FCL/FTL/LTL/LCL. Tidak ada menu pindah produk OMS tersendiri pada navigasi yang terlihat; alur order langsung tersedia melalui menu Order.

| SCN | Bukti yang diamati |
|---|---|
| SCN-0001 | Wizard FCL empat langkah tersedia; No. Lelang tidak tampil pada langkah pertama. Bukti: `artifacts/explore-oms-20261009/main-direct-FCL.json` |
| SCN-0002 | Wizard FTL empat langkah tersedia; No. Lelang tidak tampil pada langkah pertama. Bukti: `artifacts/explore-oms-20261009/main-direct-FTL.json` |
| SCN-0003 | Wizard LTL empat langkah tersedia; No. Lelang tidak tampil pada langkah pertama. Bukti: `artifacts/explore-oms-20261009/main-direct-LTL.json` |
| SCN-0004 | Wizard LCL empat langkah tersedia; No. Lelang tidak tampil pada langkah pertama. Bukti: `artifacts/explore-oms-20261009/main-direct-LCL.json` |
| SCN-0026 | Lima aksi yang disebut expected tersedia pada order langsung ORD1513185451 berstatus Ditugaskan. Detail dan assertion ID belum diulang pada eksplorasi ini. Bukti: `artifacts/explore-oms-20261009/main-own-direct-action-menu.json` |
| SCN-0027 | Batch Order /order/batch dan Riwayat Pembatalan /order/riwayat-pembatalan tersedia. Bukti: `artifacts/explore-oms-20261009/main-batch-order.json` |
| SCN-0225 | Form penugasan order own ORD1515534161 menyediakan Isi Data Manual untuk armada dan sopir, No. Polisi, Nama Sopir, WhatsApp, serta jadwal efektif read-only. Tidak menyimpan penugasan atau menguji validasi baseline. Bukti: `artifacts/explore-oms-20261009/vendor-manual-fields-visible.json` |
| SCN-0273 | Pesan penawaran lelang FTL-NRM-01/091026 membuka /order/buat-dari-lelang dan menampilkan FTL (Full Truck Load), empat langkah wizard dan data rute. Tidak menyimpan order. Bukti: `artifacts/explore-oms-20261009/main-ftl-order-from-auction.json` |

## Batas pembandingan

Paket OMS aktif dan UI integrasi tersedia. Pembanding baseline pada oracle regresi masih belum ditentukan: expected baseline/versi/acuan wizard atau validasi belum cukup terdefinisi. Keberadaan produk bukan bukti kesamaan dengan versi OMS sebelum AMS.

A01 pada analisis menyebut prosedur/validasi OMS tidak disertakan dan baseline harus disediakan saat implementasi tes. Skenario memakai assertion helper baseline yang belum mendefinisikan snapshot/version pembanding; observasi aplikasi saat ini dicatat sebagai calon baseline, bukan pembuktian regresi dengan dirinya sendiri.

Terdapat satu abort /api/auth/refresh akibat guard awal terlalu ketat. Guard diperbaiki agar autentikasi berjalan; tidak disimpulkan sebagai bug aplikasi. Tidak ada mutation order/assignment/setting dilakukan.
