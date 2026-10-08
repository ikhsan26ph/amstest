# Eksplorasi Batch07 — Order, Batch Order, Tracking dan Simulasi Muatan

8 Oktober 2026. Admin dan Vendor IK diperiksa berurutan. Eksplorasi baca UI/API, download template dan perhitungan muatan; tidak menyimpan order/draft, mengimpor data, mengonfirmasi/menolak order, membatalkan order, menugaskan perjalanan atau mengubah pengaturan. Input lokal dibatalkan. Browser ditutup. Batch08 belum dijalankan.

## Pembanding dan rekonsiliasi rule

Spec asli dibaca dari `/home/icun/Produk/AMS/`: AMS009 - Order & Penugasan - FCL, AMS010 - Order - FTL [Shipper], serta AMS017 - Order & Penugasan [FTL FCL] (Improve) [Kontrak], masing-masing file TXT dalam folder bernama sama. Analysis eksternal Order juga diperiksa sebagian. Tidak ada suite Order/Tracking/Simulasi khusus dalam scenario repository saat pemeriksaan. AMS009 **Order eksternal berbeda dari AMS009 harga di repository**; ID REQ/SCN tidak boleh dicampur. Suite eksternal tidak diimpor atau diubah.

**B07-R01 / rekonsiliasi B05-R01:** spec Order FCL secara eksplisit mengizinkan order tanpa jadwal, dengan banner dan pengisian jadwal oleh Vendor ketika konfirmasi. Toleransi jadwal mengacu Closing/ETD/ETA dan Rencana Akhir Kirim; ini menjelaskan form Order tanpa jadwal yang terbuka pada Batch05. Larangan AMS006 REQ003 lama perlu direkonsiliasi lintas dokumen, bukan langsung dijadikan bug UI. Belum membuktikan banner semua step, validasi tanggal atau konfirmasi backend. Spec Kontrak memakai batas periode kontrak, bukan periode pengiriman.

Spec juga membedakan order manual/hasil lelang, empat step, data lelang read-only dengan pengecualian tertentu, draft dan validasi saat Selanjutnya, pajak penawaran, radio Terima/Tolak Vendor, serta order ditolak menjadi tidak aktif setelah memilih penawaran pengganti. Referensi **eksternal AMS009-order**: REQ004/009/017/018/020/022–029; **eksternal AMS010-order**: REQ004/005/009/013. Rule jumlah unit Order berdiri sendiri; keputusan user bahwa qty Spot auction tidak berlaku tetap dipertahankan.

## Peta dan hasil pemeriksaan

| Area | Interaksi aman | Observasi |
|---|---|---|
| Admin `/order` | List, menu aksi, filter ID fiktif/Reset, kalender, popover Multipickup/Multidrop |4 order:2 hasil lelang Menunggu Konfirmasi,2 manual Menunggu Penugasan. No. Lelang hanya pada hasil lelang. Filter4→0→4. |
| Detail FCL hasil lelang |ORD1427559140; route `/order/ff0c13f4-8031-44a0-ad47-772579c3fee8` |Astra,1 kontainer40ft;20 barang×5kg=100kg,20×0,016m³=0,32m³. DPP100.000+PPN2.000−PPh3.000=99.000. Jadwal Direct dan No. Perjalanan belum ada. Edit dikunci setelah order lelang disimpan; pembatalan Menunggu Konfirmasi diberi alasan pembatasan. |
| Detail FTL manual |ORD0662578386; route `/order/e0aff7e5-0c81-4da7-952c-278b8e49fe42` |VERSY,Trailer20FT, Multipoint dengan2 muat/2 bongkar.32 barang=160kg/0,512m³ ditampilkan0,51m³; total300.000. Edit/Batalkan/Order Kembali tersedia pada sampel Menunggu Penugasan, tidak dieksekusi. |
| `/order/buat` |Pilihan FTL/FCL/LTL/LCL, step pertama; tambah muat/bongkar lokal, pilih Pickup dan drop point, Batal |Empat step terlihat.2muat/2bongkar mengubah tipe menjadi Multipoint. Pilihan drop point mengisi PIC/WA/wilayah, sebagian field disabled. Tidak klik Selanjutnya karena dapat menyimpan progress/draft. Batal meminta konfirmasi lalu kembali list. |
| `/order/batch` |Empat jenis, menu template Normal/Multipickup/Multidrop/Multipoint; download2XLSXNormal FTL/FCL; Batal |Batas file4MB; Import disabled tanpa file. XLSX dibuka sebagai ZIP/XML dan header/panduan diperiksa; tidak upload/import. Download Template Excel membuka submenu, bukan unduhan langsung. |
| Riwayat |`/order/riwayat-pembatalan`, `/order/riwayat-tidak-aktif`, `/order/{id}/riwayat` manual |Dua daftar kosong; tidak aktif menjelaskan order ditolak yang sudah memiliki pengganti. Riwayat perubahan manual kosong dengan filter tanggal/pelaku. Belum memeriksa audit setelah mutasi. |
| Vendor `/vendor-portal/order` |List/filter/status/kalender |0order IK; tidak ada create/batch/history Admin. Kalender flatpickr70sel hari. Tidak dapat memeriksa modal konfirmasi/scope kepemilikan dengan record nyata. |
| `/penugasan-tracking` kedua role |Filter status/tahapan/jenis, ID fiktif/Reset Vendor |Kedua daftar0. Status Belum Berangkat/Dalam Perjalanan/Selesai; tahapan Selesai Muat/Selesai Bongkar. Admin mempunyai filter Vendor, Vendor tidak. Nol→nol tidak membuktikan filter benar dengan data. Penugasan/perjalanan/driver belum terjangkau. |
| `/simulasi-muatan` |Armada dan Kontainer, guard tanpa barang, picker master, qty lokal, perhitungan |Tanpa barang meminta minimal1 barang dan Lanjutkan Order disabled. Picker Beras menghasilkan Tambahkan(1), lalu Tutup. Qty20→100kg/0,32m³. Kontainer memperlihatkan Jenis Kontainer/Jumlah Kontainer; belum dihitung. Tidak Lanjutkan Order. |

## Perhitungan dan batas render

Rekomendasi untuk20 Beras dengan pertimbangan berat mengembalikan Pickup/CDE/CDD masing-masing1unit. Pickup ditandai Paling Efisien; persentase UI dibulatkan dari API. Packing CDE berstatus200: kapasitas2.200kg, dimensi320×170×170cm, volume9,248m³,20 koli/100kg/0,32m³,1unit, tidak over-capacity. Pemeriksaan offline posisi20koli menemukan tidak ada overlap atau posisi keluar dimensi pada sampel ini. Ini bukan pembuktian optimalitas algoritma atau seluruh boundary.

Visualisasi Order dan render packing Simulator mengalami timeout pembacaan body8detik di browser headless setelah respons200. **B07-L01: render3D belum terverifikasi**, belum bug aplikasi yang terkonfirmasi. Perlu pemeriksaan browser dengan rendering sesuai, console/WebGL, dan fallback; jangan menyatakan API perhitungan gagal.

Guard harness awal memblokir3POST perhitungan dan3POST telemetry client-error; toast error pada bukti awal berasal dari abort harness. Setelah fungsi perhitungan tanpa simpan dikonfirmasi dari konteks UI, hanya endpoint `/api/order/stuffing/visualisasi`, `/api/simulasi-muatan/rekomendasi`, `/api/simulasi-muatan/hitung` diizinkan.4POST perhitungan berhasil200,0write bisnis,0responsAPI>=400. Vendor dan sesi Admin lanjutan masing-masing0blocked/0writebisnis/0APIerror. Jangan menganggap seluruh POST adalah mutasi atau mencatat abort guard sebagai bug aplikasi.

## Improve di luar skenario yang tersedia

- **B07-I01 — konteks template FCL:** header wajib `Jenis Armada*` dan panduan antar-armada masih memakai istilah FTL; usulkan `Jenis Kontainer` untuk FCL dan panduan sesuai jenis. Master pelabuhan/kontainer sudah ada. Ini usulan konsistensi label, bukan kegagalan import terbukti.
- **B07-I02 — contoh tanggal template:** contoh15Juli2026 sudah lewat pada sesi8Oktober. Gunakan contoh tanggal yang relevan atau tandai jelas sebagai contoh yang wajib diganti; belum diuji apakah import menolak tanggal lampau.
- **B07-I03 — empty state operasional:** Order Vendor/Tracking kosong belum menjelaskan langkah berikutnya secara cukup operasional. Tambahkan penjelasan menunggu konfirmasi/penugasan dan tautan sesuai hak akses. Tidak otomatis membuat data untuk mengisi layar.
- **B07-I04 — ketahanan visualisasi:** pertimbangkan ringkasan muatan yang tetap terbaca, loading terbatas dan pesan pemulihan bila3D gagal. Dasarnya keterbatasan render pada sesi ini; perlu reproduksi sebelum menjadi tiket bug.
- **B07-G01 — coverage:** petakan suite Order eksternal terpisah dari harga, tambahkan coverage Batch Order/template, Tracking dan Simulator dengan fixture yang disetujui. Prioritas: konfirmasi FCL tanpa jadwal/toleransi, pajak/qty Order, inactive setelah pengganti, validasi file, penugasan dan berat/dimensi boundary.

## Bukti dan locator

JSON, PNG dan2XLSX tersimpan di `artifacts/explore-batches/20261008/` pada folder `batch07-2026-10-08T07-04-19-562Z` (Admin), `batch07-2026-10-08T07-14-55-166Z` (Vendor), `batch07-2026-10-08T07-16-15-271Z` (Admin lanjutan). Screenshot disalin ke `artifacts/screenshots/explore/20261008/batch07-main/`, `batch07-vendor/`, `batch07-main-continuation/`; screenshot detail FCL diperiksa visual. Akun disamarkan; tanpa storageState. Peta selector: [Order/Tracking/Muatan](../shared/selector-map-order-tracking-muatan.md).

Klik native berhasil; dropdown kustom berdampingan dengan select ukuran halaman native. Batal Order/Batch dan picker barang yang diperiksa tidak memakai role=dialog; inventaris list/form0testid. StorageState tidak diuji ulang. Strict locator ID Order yang cocok dengan tombol Salin dan sel nomor, timeout menunggu download sebelum memilih submenu, snapshot Memuat dan klik rekomendasi yang sudah dipilih adalah masalah harness/locator, bukan bug aplikasi.

Belum submit/import/draft/Next, seluruh4step, semua template16kombinasi, seluruh detail/status Order, konfirmasi Vendor, tracking berisi data, scope backend lintasvendor, pengaturan approval, boundary jadwal/berat/dimensi, kalkulasi Kontainer dan render3D. Tidak ada verdict formal atau laporan Excel. Batch07 selesai untuk cakupan eksplorasi baca ini; Batch08 hanya saat diminta.
