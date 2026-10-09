# Coverage — ams009-order-penugasan-fcl

Validasi dilakukan atas artefak final yang dibaca ulang dari disk. Ini validasi rancangan scenario dan sintaks, bukan hasil menjalankan aplikasi TMS/Playwright. Semua asumsi berada pada analysis.md (A01–A24).

## Distribusi

| Kategori | Jumlah |
|---|---:|
| positive | 105 |
| negative | 117 |
| edge | 40 |
| stress | 20 |
| **Total** | **282** |

40/40 requirement memiliki ≥1 positive dan ≥1 negative. 23 layar kanonis ter-cover; 44/44 desain digunakan; extras kosong. Distribusi priority: high=237, low=1, medium=44.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | FCL/FTL dapat dibuat melalui Pesan pada Detail Harga Penawaran atau Buat Order langsung; LTL/LCL dan semua order tanpa lelang mempertahankan alur eksisting. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-001, AMS009-ORDER-PENUGASAN-FCL-POS-002, AMS009-ORDER-PENUGASAN-FCL-POS-003, AMS009-ORDER-PENUGASAN-FCL-POS-004, AMS009-ORDER-PENUGASAN-FCL-POS-005, AMS009-ORDER-PENUGASAN-FCL-POS-098<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-001, AMS009-ORDER-PENUGASAN-FCL-NEG-002, AMS009-ORDER-PENUGASAN-FCL-NEG-003 |
| REQ-002 | Satu klik Pesan pada penawaran membuat satu order; satu lelang dapat menghasilkan banyak order sebelum batas Rencana Akhir Kirim. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-006, AMS009-ORDER-PENUGASAN-FCL-POS-007<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-004<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-001, AMS009-ORDER-PENUGASAN-FCL-EDG-035<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-001 |
| REQ-003 | Order lelang menggunakan data lelang/penawaran terpilih secara otomatis dan read-only, dengan pengecualian eksplisit field PIC serta input barang/order pada aturan step. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-008, AMS009-ORDER-PENUGASAN-FCL-POS-099<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-005 |
| REQ-004 | Daftar Order shipper/vendor menampilkan No. Lelang di bawah ID Order hanya untuk order lelang. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-009, AMS009-ORDER-PENUGASAN-FCL-POS-010<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-006, AMS009-ORDER-PENUGASAN-FCL-NEG-007 |
| REQ-005 | Filter Daftar Order mengikuti desain dan action eksisting tetap tersedia sesuai status/aktor. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-011, AMS009-ORDER-PENUGASAN-FCL-POS-012, AMS009-ORDER-PENUGASAN-FCL-POS-013, AMS009-ORDER-PENUGASAN-FCL-POS-014, AMS009-ORDER-PENUGASAN-FCL-POS-015, AMS009-ORDER-PENUGASAN-FCL-POS-016, AMS009-ORDER-PENUGASAN-FCL-POS-017<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-008<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-002<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-002 |
| REQ-006 | Order tersimpan berstatus Menunggu Konfirmasi; diterima menjadi Menunggu Penugasan; ditolak menjadi Ditolak. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-018, AMS009-ORDER-PENUGASAN-FCL-POS-019, AMS009-ORDER-PENUGASAN-FCL-POS-020<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-009 |
| REQ-007 | Wizard empat step; Draft menyimpan step terakhir apabila minimal satu field terisi. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-021, AMS009-ORDER-PENUGASAN-FCL-POS-022, AMS009-ORDER-PENUGASAN-FCL-POS-023, AMS009-ORDER-PENUGASAN-FCL-POS-024<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-010<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-003<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-003 |
| REQ-008 | Selanjutnya memvalidasi required per step; Sebelumnya menjaga data dan step terakhir yang sudah diisi. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-025, AMS009-ORDER-PENUGASAN-FCL-POS-026, AMS009-ORDER-PENUGASAN-FCL-POS-027<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-011 |
| REQ-009 | Batal menampilkan konfirmasi lalu kembali ke Daftar Order setelah dikonfirmasi. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-028<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-012 |
| REQ-010 | PIC Pengirim/Penerima dan WhatsApp wajib, catatan dapat diubah; setiap titik multipickup/multidrop/multipoint memiliki card Muat(n)/Bongkar(n). | positive: AMS009-ORDER-PENUGASAN-FCL-POS-029, AMS009-ORDER-PENUGASAN-FCL-POS-030, AMS009-ORDER-PENUGASAN-FCL-POS-031, AMS009-ORDER-PENUGASAN-FCL-POS-032<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-013, AMS009-ORDER-PENUGASAN-FCL-NEG-014, AMS009-ORDER-PENUGASAN-FCL-NEG-015, AMS009-ORDER-PENUGASAN-FCL-NEG-016, AMS009-ORDER-PENUGASAN-FCL-NEG-017<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-036<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-004 |
| REQ-011 | Jenis Kontainer dari lelang read-only; Jumlah Kontainer bilangan bulat minimal 1; jumlah card mengikuti input. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-033<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-018, AMS009-ORDER-PENUGASAN-FCL-NEG-019, AMS009-ORDER-PENUGASAN-FCL-NEG-020, AMS009-ORDER-PENUGASAN-FCL-NEG-021, AMS009-ORDER-PENUGASAN-FCL-NEG-022<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-004, AMS009-ORDER-PENUGASAN-FCL-EDG-005<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-005 |
| REQ-012 | Nomor DO berupa multi tag opsional; Pilih Barang mengambil barang dari master. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-034, AMS009-ORDER-PENUGASAN-FCL-POS-035<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-023<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-006<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-006 |
| REQ-013 | Jumlah barang tiap baris wajib; Nilai Barang wajib jika asuransi digunakan; kontainer tanpa barang/jumlah tidak bisa dilanjutkan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-036<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-024, AMS009-ORDER-PENUGASAN-FCL-NEG-025, AMS009-ORDER-PENUGASAN-FCL-NEG-026, AMS009-ORDER-PENUGASAN-FCL-NEG-027, AMS009-ORDER-PENUGASAN-FCL-NEG-028, AMS009-ORDER-PENUGASAN-FCL-NEG-029, AMS009-ORDER-PENUGASAN-FCL-NEG-030, AMS009-ORDER-PENUGASAN-FCL-NEG-117<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-007 |
| REQ-014 | Total Berat dan Total Kubikasi dihitung dari barang dan menampilkan alert batas kapasitas sesuai aturan eksisting. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-037<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-031, AMS009-ORDER-PENUGASAN-FCL-NEG-032<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-008, AMS009-ORDER-PENUGASAN-FCL-EDG-009<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-007 |
| REQ-015 | Tanggal Permintaan Muat wajib datetime, tidak lebih awal dari sekarang dan tidak melewati Rencana Akhir Kirim. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-038<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-033, AMS009-ORDER-PENUGASAN-FCL-NEG-034, AMS009-ORDER-PENUGASAN-FCL-NEG-035, AMS009-ORDER-PENUGASAN-FCL-NEG-036<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-010, AMS009-ORDER-PENUGASAN-FCL-EDG-011 |
| REQ-016 | Vendor, drop point, jenis/jumlah kontainer dan harga satuan read-only; link multipoint membuka detail; ringkasan berat/kubikasi/nilai berasal dari Step 02. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-039, AMS009-ORDER-PENUGASAN-FCL-POS-040<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-037 |
| REQ-017 | DPP = harga satuan × jumlah kontainer; Total = DPP + PPN − PPh + Asuransi. Pajak mengikuti penawaran dan read-only; asuransi dari total nilai barang kontainer yang diasuransikan dengan tarif lelang/master. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-041<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-038<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-012, AMS009-ORDER-PENUGASAN-FCL-EDG-013, AMS009-ORDER-PENUGASAN-FCL-EDG-014<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-008 |
| REQ-018 | Tanpa jadwal: toggle Gunakan Batas Toleransi Jadwal Kapal menampilkan acuan Closing Time/ETD/ETA dan batas datetime wajib ≤ Rencana Akhir Kirim; nilai menjadi batas konfirmasi vendor. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-042, AMS009-ORDER-PENUGASAN-FCL-POS-043, AMS009-ORDER-PENUGASAN-FCL-POS-044<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-039, AMS009-ORDER-PENUGASAN-FCL-NEG-040, AMS009-ORDER-PENUGASAN-FCL-NEG-041, AMS009-ORDER-PENUGASAN-FCL-NEG-116<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-015, AMS009-ORDER-PENUGASAN-FCL-EDG-016 |
| REQ-019 | Dengan jadwal: toggle toleransi tidak muncul, jadwal direct/connecting dari penawaran read-only. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-045, AMS009-ORDER-PENUGASAN-FCL-POS-046<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-042 |
| REQ-020 | Tanpa jadwal: banner Jadwal kapal saat ini belum tersedia muncul pada keempat step dan tidak memblokir simpan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-047, AMS009-ORDER-PENUGASAN-FCL-POS-048, AMS009-ORDER-PENUGASAN-FCL-POS-049, AMS009-ORDER-PENUGASAN-FCL-POS-050<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-043 |
| REQ-021 | Review seluruh data read-only; Simpan membuat order Menunggu Konfirmasi dan notifikasi order baru ke vendor terpilih. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-051, AMS009-ORDER-PENUGASAN-FCL-POS-052, AMS009-ORDER-PENUGASAN-FCL-POS-100, AMS009-ORDER-PENUGASAN-FCL-POS-102, AMS009-ORDER-PENUGASAN-FCL-POS-103, AMS009-ORDER-PENUGASAN-FCL-POS-104<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-044<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-017<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-009 |
| REQ-022 | Konfirmasi Order hanya vendor pemilik order dengan status Menunggu Konfirmasi. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-053<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-045, AMS009-ORDER-PENUGASAN-FCL-NEG-046, AMS009-ORDER-PENUGASAN-FCL-NEG-047, AMS009-ORDER-PENUGASAN-FCL-NEG-048, AMS009-ORDER-PENUGASAN-FCL-NEG-049, AMS009-ORDER-PENUGASAN-FCL-NEG-050, AMS009-ORDER-PENUGASAN-FCL-NEG-051, AMS009-ORDER-PENUGASAN-FCL-NEG-052, AMS009-ORDER-PENUGASAN-FCL-NEG-053<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-010 |
| REQ-023 | Modal konfirmasi berisi ringkasan read-only, radio Terima/Tolak; Simpan disabled sebelum pilihan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-054<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-054<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-018 |
| REQ-024 | Terima order dengan jadwal tidak menampilkan form jadwal; mempertahankan jadwal penawaran dan status menjadi Menunggu Penugasan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-055, AMS009-ORDER-PENUGASAN-FCL-POS-056<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-055 |
| REQ-025 | Terima order tanpa jadwal mewajibkan form jadwal direct/connecting valid; tersimpan sebagai sumber penugasan/tracking. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-057, AMS009-ORDER-PENUGASAN-FCL-POS-058<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-056, AMS009-ORDER-PENUGASAN-FCL-NEG-057, AMS009-ORDER-PENUGASAN-FCL-NEG-058, AMS009-ORDER-PENUGASAN-FCL-NEG-059, AMS009-ORDER-PENUGASAN-FCL-NEG-060, AMS009-ORDER-PENUGASAN-FCL-NEG-061, AMS009-ORDER-PENUGASAN-FCL-NEG-062, AMS009-ORDER-PENUGASAN-FCL-NEG-063, AMS009-ORDER-PENUGASAN-FCL-NEG-064, AMS009-ORDER-PENUGASAN-FCL-NEG-065, AMS009-ORDER-PENUGASAN-FCL-NEG-066, AMS009-ORDER-PENUGASAN-FCL-NEG-067, AMS009-ORDER-PENUGASAN-FCL-NEG-068, AMS009-ORDER-PENUGASAN-FCL-NEG-069<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-019, AMS009-ORDER-PENUGASAN-FCL-EDG-020<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-011 |
| REQ-026 | Dengan toleransi: banner acuan/batas WIB; field acuan melebihi batas menampilkan Melewati batas toleransi waktu dan tidak tersimpan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-059, AMS009-ORDER-PENUGASAN-FCL-POS-060, AMS009-ORDER-PENUGASAN-FCL-POS-061<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-070, AMS009-ORDER-PENUGASAN-FCL-NEG-071, AMS009-ORDER-PENUGASAN-FCL-NEG-072, AMS009-ORDER-PENUGASAN-FCL-NEG-073<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-021, AMS009-ORDER-PENUGASAN-FCL-EDG-037<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-012 |
| REQ-027 | Tanpa toleransi: pengisian jadwal konfirmasi tetap dibatasi Rencana Akhir Kirim. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-062<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-074, AMS009-ORDER-PENUGASAN-FCL-NEG-075, AMS009-ORDER-PENUGASAN-FCL-NEG-076, AMS009-ORDER-PENUGASAN-FCL-NEG-077<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-022 |
| REQ-028 | Tolak wajib alasan; status Ditolak dan order tetap di daftar vendor; shipper mempertahankan order sampai penawaran lain disimpan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-063, AMS009-ORDER-PENUGASAN-FCL-POS-105<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-078, AMS009-ORDER-PENUGASAN-FCL-NEG-079<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-023<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-013 |
| REQ-029 | Pilih Penawaran Lain hanya shipper pada order Ditolak; wizard Memilih Penawaran/Review, mengecualikan penawaran sebelumnya, tombol Pilih. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-064, AMS009-ORDER-PENUGASAN-FCL-POS-065, AMS009-ORDER-PENUGASAN-FCL-POS-066<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-080, AMS009-ORDER-PENUGASAN-FCL-NEG-081, AMS009-ORDER-PENUGASAN-FCL-NEG-082, AMS009-ORDER-PENUGASAN-FCL-NEG-083<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-024, AMS009-ORDER-PENUGASAN-FCL-EDG-040 |
| REQ-030 | Review penggantian menampilkan perubahan vendor/harga/jadwal; Simpan menyimpan perubahan dan order ditolak sebelumnya masuk Riwayat Order Tidak Aktif shipper; tetap di vendor lama. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-067, AMS009-ORDER-PENUGASAN-FCL-POS-068, AMS009-ORDER-PENUGASAN-FCL-POS-101<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-084, AMS009-ORDER-PENUGASAN-FCL-NEG-085<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-025, AMS009-ORDER-PENUGASAN-FCL-EDG-026<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-014 |
| REQ-031 | Shipper hanya dapat Edit Jadwal untuk vendor yang pengelolanya admin, tanpa approval; vendor dapat mengedit jadwal order miliknya. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-069, AMS009-ORDER-PENUGASAN-FCL-POS-070<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-086, AMS009-ORDER-PENUGASAN-FCL-NEG-087 |
| REQ-032 | Edit Jadwal memvalidasi toleransi jika aktif dan Rencana Akhir Kirim, serta mendukung direct ↔ connecting. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-071, AMS009-ORDER-PENUGASAN-FCL-POS-072, AMS009-ORDER-PENUGASAN-FCL-POS-073, AMS009-ORDER-PENUGASAN-FCL-POS-074<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-088, AMS009-ORDER-PENUGASAN-FCL-NEG-089, AMS009-ORDER-PENUGASAN-FCL-NEG-090, AMS009-ORDER-PENUGASAN-FCL-NEG-091, AMS009-ORDER-PENUGASAN-FCL-NEG-092, AMS009-ORDER-PENUGASAN-FCL-NEG-093, AMS009-ORDER-PENUGASAN-FCL-NEG-094, AMS009-ORDER-PENUGASAN-FCL-NEG-095<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-027, AMS009-ORDER-PENUGASAN-FCL-EDG-028, AMS009-ORDER-PENUGASAN-FCL-EDG-038 |
| REQ-033 | Edit vendor dengan approval aktif mengajukan jadwal dan status Konfirmasi Jadwal; shipper mendapat action Konfirmasi Jadwal. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-075<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-096<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-029<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-015 |
| REQ-034 | Setting approval nonaktif membuat perubahan vendor berlaku langsung tanpa menunggu respons shipper. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-076, AMS009-ORDER-PENUGASAN-FCL-POS-077<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-097, AMS009-ORDER-PENUGASAN-FCL-NEG-098 |
| REQ-035 | Shipper menerima pengajuan: jadwal baru efektif; menolak: jadwal lama tetap; kedua hasil menjadi Menunggu Penugasan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-078, AMS009-ORDER-PENUGASAN-FCL-POS-079<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-099, AMS009-ORDER-PENUGASAN-FCL-NEG-100<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-030, AMS009-ORDER-PENUGASAN-FCL-EDG-031<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-016 |
| REQ-036 | Perubahan jadwal tercatat di Riwayat Perubahan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-080, AMS009-ORDER-PENUGASAN-FCL-POS-081, AMS009-ORDER-PENUGASAN-FCL-POS-082<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-101<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-032<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-017 |
| REQ-037 | Penugasan vendor mengikuti proses pilih order, data kontainer, armada, sopir dan mode penugasan dengan validasi eksisting. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-083, AMS009-ORDER-PENUGASAN-FCL-POS-084, AMS009-ORDER-PENUGASAN-FCL-POS-085, AMS009-ORDER-PENUGASAN-FCL-POS-086<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-102, AMS009-ORDER-PENUGASAN-FCL-NEG-103, AMS009-ORDER-PENUGASAN-FCL-NEG-104, AMS009-ORDER-PENUGASAN-FCL-NEG-105, AMS009-ORDER-PENUGASAN-FCL-NEG-106, AMS009-ORDER-PENUGASAN-FCL-NEG-107, AMS009-ORDER-PENUGASAN-FCL-NEG-108, AMS009-ORDER-PENUGASAN-FCL-NEG-109<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-033<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-018 |
| REQ-038 | Tambah/Edit Penugasan menghilangkan input jadwal; Jadwal Kapal read-only berisi jenis, pelayaran, kapal, voyage, Open Stack, Closing Time, ETD, ETA; connecting menampilkan rangkaian. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-087, AMS009-ORDER-PENUGASAN-FCL-POS-088, AMS009-ORDER-PENUGASAN-FCL-POS-089, AMS009-ORDER-PENUGASAN-FCL-POS-090, AMS009-ORDER-PENUGASAN-FCL-POS-091<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-110, AMS009-ORDER-PENUGASAN-FCL-NEG-111<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-039<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-019 |
| REQ-039 | Sumber jadwal penugasan: penawaran jika lelang memiliki jadwal; konfirmasi vendor jika lelang tanpa jadwal; konfirmasi vendor untuk order tanpa lelang sesuai aturan khusus penugasan. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-092, AMS009-ORDER-PENUGASAN-FCL-POS-093, AMS009-ORDER-PENUGASAN-FCL-POS-094<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-112<br>edge: AMS009-ORDER-PENUGASAN-FCL-EDG-034 |
| REQ-040 | Detail Penugasan menampilkan No. Lelang dalam Detail Data Order khusus order lelang. | positive: AMS009-ORDER-PENUGASAN-FCL-POS-095, AMS009-ORDER-PENUGASAN-FCL-POS-096, AMS009-ORDER-PENUGASAN-FCL-POS-097<br>negative: AMS009-ORDER-PENUGASAN-FCL-NEG-113, AMS009-ORDER-PENUGASAN-FCL-NEG-114, AMS009-ORDER-PENUGASAN-FCL-NEG-115<br>stress: AMS009-ORDER-PENUGASAN-FCL-STR-020 |

## Coverage Layar

| Layar | Positive | Negative | Edge | Stress | Total |
|---|---:|---:|---:|---:|---:|
| daftar-order-shipper | 14 | 6 | 0 | 0 | 20 |
| daftar-order-vendor | 3 | 10 | 1 | 1 | 15 |
| data-barang | 8 | 17 | 6 | 3 | 34 |
| data-pengiriman | 11 | 9 | 2 | 1 | 23 |
| detail-droppoint | 1 | 0 | 0 | 0 | 1 |
| detail-harga-penawaran | 4 | 4 | 1 | 1 | 10 |
| detail-order | 1 | 0 | 0 | 0 | 1 |
| detail-penugasan-shipper | 1 | 1 | 0 | 0 | 2 |
| detail-penugasan-vendor | 2 | 2 | 0 | 1 | 5 |
| edit-jadwal-shipper | 4 | 4 | 2 | 0 | 10 |
| edit-jadwal-vendor | 5 | 7 | 2 | 1 | 15 |
| edit-penugasan | 3 | 1 | 0 | 0 | 4 |
| konfirmasi-jadwal | 2 | 2 | 2 | 1 | 7 |
| konfirmasi-order | 11 | 27 | 7 | 4 | 49 |
| pengaturan-approval | 2 | 1 | 0 | 0 | 3 |
| penugasan-sopir-bongkar | 1 | 1 | 0 | 0 | 2 |
| pilih-penawaran-lain | 2 | 1 | 3 | 0 | 6 |
| review-order | 6 | 1 | 2 | 1 | 10 |
| review-penawaran-lain | 2 | 2 | 1 | 1 | 6 |
| riwayat-order-tidak-aktif | 1 | 0 | 0 | 0 | 1 |
| riwayat-perubahan | 1 | 1 | 1 | 1 | 4 |
| tambah-penugasan | 8 | 9 | 3 | 2 | 22 |
| vendor-harga | 12 | 11 | 7 | 2 | 32 |

Layar dapat muncul sebagai navigate/observasi lanjutan dalam scenario bertag layar asal; tabel di atas menghitung tag screen utama agar tidak menggandakan total.

## Coverage UI Penting

| Kelompok elemen | Contoh Scenario IDs | Hasil |
|---|---|---|
| Daftar shipper/vendor, ID/No. Lelang/status | AMS009-ORDER-PENUGASAN-FCL-POS-009, AMS009-ORDER-PENUGASAN-FCL-NEG-006, AMS009-ORDER-PENUGASAN-FCL-POS-010 (8 scenario terkait) | Ter-cover |
| Seluruh filter, Terapkan/Reset, pagination, sort, salin | AMS009-ORDER-PENUGASAN-FCL-POS-011, AMS009-ORDER-PENUGASAN-FCL-POS-012, AMS009-ORDER-PENUGASAN-FCL-NEG-008 (10 scenario terkait) | Ter-cover |
| Pesan dan informasi/detail penawaran | AMS009-ORDER-PENUGASAN-FCL-POS-001, AMS009-ORDER-PENUGASAN-FCL-POS-002, AMS009-ORDER-PENUGASAN-FCL-POS-003 (18 scenario terkait) | Ter-cover |
| Popup Detail Pickup/Drop Off dan link multipoint | AMS009-ORDER-PENUGASAN-FCL-POS-013, AMS009-ORDER-PENUGASAN-FCL-POS-014, AMS009-ORDER-PENUGASAN-FCL-POS-040 (3 scenario terkait) | Ter-cover |
| Wizard empat step, Draft, Selanjutnya/Sebelumnya, Batal | AMS009-ORDER-PENUGASAN-FCL-POS-021, AMS009-ORDER-PENUGASAN-FCL-POS-022, AMS009-ORDER-PENUGASAN-FCL-POS-023 (13 scenario terkait) | Ter-cover |
| PIC/WhatsApp/catatan/card Muat/Bongkar | AMS009-ORDER-PENUGASAN-FCL-POS-029, AMS009-ORDER-PENUGASAN-FCL-NEG-013, AMS009-ORDER-PENUGASAN-FCL-NEG-014 (11 scenario terkait) | Ter-cover |
| Jenis/jumlah kontainer dan card dinamis | AMS009-ORDER-PENUGASAN-FCL-POS-033, AMS009-ORDER-PENUGASAN-FCL-NEG-018, AMS009-ORDER-PENUGASAN-FCL-NEG-019 (9 scenario terkait) | Ter-cover |
| Multi tag DO/master Pilih Barang/hapus/tag kosong | AMS009-ORDER-PENUGASAN-FCL-POS-034, AMS009-ORDER-PENUGASAN-FCL-NEG-023, AMS009-ORDER-PENUGASAN-FCL-EDG-006 (5 scenario terkait) | Ter-cover |
| Checkbox asuransi/Jumlah/Nilai Barang per baris | AMS009-ORDER-PENUGASAN-FCL-POS-036, AMS009-ORDER-PENUGASAN-FCL-NEG-024, AMS009-ORDER-PENUGASAN-FCL-NEG-025 (10 scenario terkait) | Ter-cover |
| Total Berat/Kubikasi dan alert kapasitas | AMS009-ORDER-PENUGASAN-FCL-POS-037, AMS009-ORDER-PENUGASAN-FCL-NEG-031, AMS009-ORDER-PENUGASAN-FCL-NEG-032 (6 scenario terkait) | Ter-cover |
| Tanggal muat/ringkasan harga/pajak/asuransi | AMS009-ORDER-PENUGASAN-FCL-POS-038, AMS009-ORDER-PENUGASAN-FCL-NEG-033, AMS009-ORDER-PENUGASAN-FCL-NEG-034 (16 scenario terkait) | Ter-cover |
| Toleransi checkbox/tiga radio/datetime/banner | AMS009-ORDER-PENUGASAN-FCL-POS-042, AMS009-ORDER-PENUGASAN-FCL-POS-043, AMS009-ORDER-PENUGASAN-FCL-POS-044 (19 scenario terkait) | Ter-cover |
| Jadwal direct/connecting read-only dan banner tanpa jadwal | AMS009-ORDER-PENUGASAN-FCL-POS-045, AMS009-ORDER-PENUGASAN-FCL-POS-046, AMS009-ORDER-PENUGASAN-FCL-NEG-042 (8 scenario terkait) | Ter-cover |
| Review/accordion/Simpan/detail/notifikasi | AMS009-ORDER-PENUGASAN-FCL-POS-051, AMS009-ORDER-PENUGASAN-FCL-NEG-044, AMS009-ORDER-PENUGASAN-FCL-EDG-017 (9 scenario terkait) | Ter-cover |
| Action dan modal Konfirmasi Order/ringkasan/radio/disabled/Batal/X | AMS009-ORDER-PENUGASAN-FCL-POS-053, AMS009-ORDER-PENUGASAN-FCL-NEG-045, AMS009-ORDER-PENUGASAN-FCL-NEG-046 (17 scenario terkait) | Ter-cover |
| Form jadwal utama/leg connecting/Tambah Kapal/validasi | AMS009-ORDER-PENUGASAN-FCL-POS-057, AMS009-ORDER-PENUGASAN-FCL-POS-058, AMS009-ORDER-PENUGASAN-FCL-NEG-056 (25 scenario terkait) | Ter-cover |
| Tolak Order/textarea alasan | AMS009-ORDER-PENUGASAN-FCL-POS-063, AMS009-ORDER-PENUGASAN-FCL-NEG-078, AMS009-ORDER-PENUGASAN-FCL-NEG-079 (6 scenario terkait) | Ter-cover |
| Pilih Penawaran Lain/filter/Pilih/Review/Simpan/riwayat tidak aktif | AMS009-ORDER-PENUGASAN-FCL-POS-064, AMS009-ORDER-PENUGASAN-FCL-POS-065, AMS009-ORDER-PENUGASAN-FCL-NEG-080 (17 scenario terkait) | Ter-cover |
| Edit Jadwal role/Direct/Connecting/batas/Simpan/Batal | AMS009-ORDER-PENUGASAN-FCL-POS-069, AMS009-ORDER-PENUGASAN-FCL-POS-070, AMS009-ORDER-PENUGASAN-FCL-NEG-086 (23 scenario terkait) | Ter-cover |
| Setting approval checkbox/Simpan | AMS009-ORDER-PENUGASAN-FCL-POS-076, AMS009-ORDER-PENUGASAN-FCL-POS-077, AMS009-ORDER-PENUGASAN-FCL-NEG-097 (4 scenario terkait) | Ter-cover |
| Konfirmasi Jadwal/readonly/Terima/Tolak/X | AMS009-ORDER-PENUGASAN-FCL-POS-078, AMS009-ORDER-PENUGASAN-FCL-POS-079, AMS009-ORDER-PENUGASAN-FCL-NEG-099 (7 scenario terkait) | Ter-cover |
| Riwayat Perubahan actor/waktu/nilai lama-baru | AMS009-ORDER-PENUGASAN-FCL-POS-080, AMS009-ORDER-PENUGASAN-FCL-POS-081, AMS009-ORDER-PENUGASAN-FCL-POS-082 (6 scenario terkait) | Ter-cover |
| Cari/Pilih Order/kontainer/segel/master/manual/armada/sopir/mode | AMS009-ORDER-PENUGASAN-FCL-POS-083, AMS009-ORDER-PENUGASAN-FCL-POS-084, AMS009-ORDER-PENUGASAN-FCL-NEG-102 (14 scenario terkait) | Ter-cover |
| Penugasan Sopir Bongkar/tanggal/armada/sopir/mode | AMS009-ORDER-PENUGASAN-FCL-POS-086, AMS009-ORDER-PENUGASAN-FCL-NEG-109 (2 scenario terkait) | Ter-cover |
| Jadwal Penugasan read-only, seluruh field, connecting, sumber | AMS009-ORDER-PENUGASAN-FCL-POS-087, AMS009-ORDER-PENUGASAN-FCL-POS-088, AMS009-ORDER-PENUGASAN-FCL-NEG-110 (14 scenario terkait) | Ter-cover |
| Detail Penugasan No. Lelang/Edit/Riwayat/Per Tahapan/Timeline | AMS009-ORDER-PENUGASAN-FCL-POS-095, AMS009-ORDER-PENUGASAN-FCL-NEG-113, AMS009-ORDER-PENUGASAN-FCL-POS-096 (7 scenario terkait) | Ter-cover |

## Hasil Validasi

- JSON valid; semua field wajib/enum action/kategori/priority/ID unik/target selector lengkap; summary cocok hitungan aktual.
- Parser resmi `gherkin-official` berhasil mem-parse semua Scenario. Keywords Gherkin berbahasa Inggris dengan isi langkah berbahasa Indonesia.
- Setiap Scenario dipasangkan ke ID JSON dengan title, category, requirement, priority, dan screen yang sama; seluruh teks langkah serta preconditions dibandingkan dengan metadata, bukan hanya hitungan.
- Semua Scenario memiliki Given dan Then; langkah observasi setelah aksi menggunakan Then/And; navigasi atau aksi lanjutan menggunakan When. Given–Then tanpa aksi tambahan sah untuk pemeriksaan state/read-only/akses.
- Semua path source ada; daftar source.designs sama dengan 44 PNG input.
- Pemeriksaan duplikat title dan fingerprint screen+preconditions+steps+testData: 0 duplikat identik. Daftar duplikat dibuang: tidak ada.
- Review semantik mempertahankan pasangan yang berbeda aktor/status/field/leg/acuan/batas. Read-only/visibility pada satu requirement dan transisi/persistensi pada requirement lain berbeda oracle. Happy path banner dan save order terpisah agar tidak menghilangkan REQ-020/021.
- Review menambahkan jalur FTL lelang, alternatif ID berbeda dari vendor lama, perhitungan ulang harga pengganti, accordion, nilai barang negatif, serta 3 alur terpadu dari Pesan hingga penugasan. Tidak ada gap requirement final.

## Gap dan Ketergantungan

Tidak ada REQ atau kelompok UI penting dalam scope spec yang belum tersentuh. Batas kualitas/implementasi yang belum disediakan input:

- Baseline OMS untuk order langsung FTL/LTL/LCL, format WA, batas kapasitas (apakah alert memblokir), urutan tanggal, batas panjang/jumlah, field manual, dan validasi penugasan harus disediakan sebagai fixture/helper sebelum eksekusi. Tidak mengarang angka sebagai aturan produk.
- URL aplikasi, DOM/ARIA/testid nyata, fixture sesi tenant, observer notifikasi/audit, dan driver kegagalan jaringan belum tersedia. Selector merupakan usulan dan beberapa target agregat bukan elemen UI.
- Identitas/status order pengganti, sumber jadwal order langsung, satuan Nilai Barang, batas tanggal connecting dan scope toleransi ETA/ETD adalah keputusan asumsi A04/A05/A09/A21/A22; sesuaikan oracle bila baseline berbeda.
- Desain bertentangan dengan spec: label ETD/ETA, Menunggu Jadwal, action konfirmasi pada status salah, 3 card untuk jumlah 2, contoh harga/asuransi, footer pengganti dan judul modal persetujuan. Scenario mengikuti spec dan mencatat A15–A19.
- Request Jadwal/Ajukan Nego/Lelang Ulang serta rincian proses batch/cancel/resi/order kembali adalah UI hulu/eksisting di luar perubahan AMS009. Keberadaan/detail/navigasi baseline disentuh; alur bisnis hulu tidak dibuat requirement baru.
- Setting approval, master barang, riwayat tidak aktif/audit, modal Batal dan input manual diturunkan dari spec karena tidak ada desain khusus (A20).
- Stress menyatakan profil worker/iterasi/fixture dan oracle integritas; tidak mengklaim SLA, hasil benchmark atau aplikasi sudah lulus. Numeric browser refusal dan snapshot non-UI membutuhkan helper sesuai kontrak metadata.

## Batas dan Stres yang Ditinjau

Edge mencakup minimum jumlah, kosong opsional, waktu sekarang/akhir kirim, batas toleransi inklusif, pergantian hari WIB, perubahan card/asuransi, Unicode/markup, switch form, timeout sesudah commit, proposal/keputusan stale dan pergantian sumber jadwal. Stress mencakup volume order/card/barang/tag, teks panjang, retry, penerimaan/penggantian/approval/penugasan bersamaan, audit besar dan isolasi No. Lelang antar order.

## Artefak

- ams009-order-penugasan-fcl.analysis.md
- ams009-order-penugasan-fcl.feature
- ams009-order-penugasan-fcl.scenarios.json
- ams009-order-penugasan-fcl.coverage.md
