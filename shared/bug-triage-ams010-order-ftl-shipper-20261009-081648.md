# Triage AMS010 — retest Vendor B 20261009-081648

Cakupan SCN-0067, SCN-0129, SCN-0130: 2 passed, 1 failed, 0 blocked. Gabungan149:108passed/11failed/17blocked/13skipped.146verdict dibawa dari run020419 dengan sourceRun; tidak diuji ulang.

| SCN | Klasifikasi | Rujukan | Severity | Analisis | Rekomendasi |
|---|---|---|---|---|---|
| SCN-0067 | BUG (probable) | REQ-034 | major | Penggantian A→B berhasil: B pending, harga7M/total6.937M, PIC/barang tetap; A tetap Ditolak. Inbox Vendor B kosong sebelum dan setelah commit serta recheck, semua9preferensi aktif. Screenshot menunjukkan Tidak ada notifikasi. | Periksa pemicu notifikasi saat POST order/auction dengan replacedFromOrderId. Kelompokkan dengan notifikasi hilang SCN-0051/0131; akar penyebab belum dibuktikan. |

Bukti: artifacts/test-module/ams010-order-ftl-shipper/20261009-081648/{main-replacement-b-review,main-replacement-b-committed,vendor_b-b-inbox-recheck,vendor_b-notification-preferences-before-settled}.json; artifacts/screenshots/20261009-081648/SCN-0067.png.

SCN-0129 passed: tiga penawaran nyata; setelah A/B ditolak hanya C CDE8M dapat dipilih. SCN-0130 passed: B aktif Ditolak pada shipper dan vendorB; A tetap Ditolak pada riwayat tidak aktif shipper serta vendorA.

Fixture milik run: lelang862e3e7f-750c-4919-9b0d-b32c2e8b6aec / FTL-NRM-01/091026, A e2a7b5b6-b22c-4f75-9773-abacf5a84a2d / ORD1509245876, B c52f42cc-7b3e-4d60-be31-4a98bd40a1a0 / ORD1509331102, masterbarang prefix AUTOTEST-20261009-BV-081648-. Data tidak dibatalkan/dihapus. Tidak mengubah tenant setting. LoginB dari user hanya di memori; tidak masuk konfigurasi/laporan.

Binding waktu aktual dan fleet/rute/noinsurance dipakai untuk kontrak pergantian vendor; kasus fixedclock dan rate1% tetap blocked. Sisa17:7clock/deadline,2oracleNilaiBarang,3rate1%,1invalidtanggal,1pagination/dokumen,1pembulatan,1shipperkedua,1fullE2E. Ringkasan triage baru:1BUG probable;0design gap/test issue/need recheck.
