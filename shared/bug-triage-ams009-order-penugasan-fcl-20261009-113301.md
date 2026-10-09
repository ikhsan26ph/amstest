# Koreksi scope AMS009

Koreksi dari run 20261009-105614; tidak ada pengujian browser baru. Total: 185 passed, 38 failed, 28 blocked, 31 skipped. Sepuluh skipped tambahan adalah skenario tidak berlaku, bukan lulus.

## Sepuluh kasus tidak berlaku

Tidak berlaku untuk scope AMS: pengguna mengonfirmasi vendor dikelola Admin tidak dapat diundang lelang. Fixture lelang/penawaran dengan vendorManagedByAdmin=true pada skenario bertentangan dengan aturan bisnis AMS.

| SCN | Judul | Status |
|---|---|---|
| SCN-0180 | Shipper vendor dikelola admin mengedit jadwal tanpa approval | skipped / TEST ISSUE |
| SCN-0184 | edit-jadwal-shipper mengganti Direct menjadi Connecting dengan jadwal valid | skipped / TEST ISSUE |
| SCN-0185 | edit-jadwal-shipper mengganti Connecting menjadi Direct dengan jadwal valid | skipped / TEST ISSUE |
| SCN-0186 | edit-jadwal-shipper melampaui toleransi Closing Time tidak disimpan | skipped / TEST ISSUE |
| SCN-0187 | edit-jadwal-shipper melampaui toleransi Berangkat (ETD) tidak disimpan | skipped / TEST ISSUE |
| SCN-0188 | edit-jadwal-shipper melampaui toleransi Tiba (ETA) tidak disimpan | skipped / TEST ISSUE |
| SCN-0189 | edit-jadwal-shipper tanpa toleransi tetap menolak ETA setelah akhir kirim | skipped / TEST ISSUE |
| SCN-0190 | edit-jadwal-shipper Batal dan X tidak menyimpan perubahan | skipped / TEST ISSUE |
| SCN-0211 | Perubahan jadwal shipper tercatat lengkap di Riwayat Perubahan | skipped / TEST ISSUE |
| SCN-0251 | Edit ETA tepat akhir kirim diterima dan dicatat | skipped / TEST ISSUE |

38 failed tidak berubah; lihat [triage sebelumnya](bug-triage-ams009-order-penugasan-fcl-20261009-105614.md).

[Ledger terbaru](../results/_blocked-review__ams009-order-penugasan-fcl__20261009-113301.md)
