# UI inventory aktual — AMS009 Order & Penugasan FCL

Eksplorasi baca 8 Oktober 2026. Sumber selector utama: shared/selector-map-order-tracking-muatan.md. Detail evidence: explore/ams009-order-penugasan-fcl-20261008.md. Sumber ini melengkapi selectorHints usulan pada JSON, tidak mengganti expected/requirement.

| Screen | Entry point aktual | Ketersediaan/batas |
|---|---|---|
| daftar-order-shipper | Sidebar Order → /order |4order existing; filter lengkap, sort header, ukuran halaman native; menu aksi perrow. |
| detail-order | Menu row → Detail | FCL sampel /order/ff0c13f4-8031-44a0-ad47-772579c3fee8; read-only data kirim,barang,harga,jadwal. |
| data-pengiriman | Buat Order → /order/buat; pilih FCL | Empat step, pelabuhan,kontainer,jumlah,metode,data pengirim/penerima. Jumlah type=text. Master terisi. |
| data-barang / vendor-harga / review-order | Step02/03/04 wizard | Judul step terlihat; isi dan transisi belum dieksplor karena Selanjutnya dapat menyimpan progress. |
| daftar-order-vendor | Sidebar Order → /vendor-portal/order | Akses tersedia; data akun Vendor0. Konfirmasi dan gating perstatus belum terjangkau. |
| riwayat-order-tidak-aktif | /order/riwayat-tidak-aktif | Terbuka; kosong. |
| penugasan | Sidebar Penugasan Tracking → /penugasan-tracking | Admin kosong; detail/form penugasan tidak terjangkau dari record pada eksplorasi ini. |
| batch-order | Batch Order → /order/batch | Empat jenis; FCL membuka file input, batas4MB,menu template; tidak import. |
| riwayat-pembatalan | Button Riwayat Pembatalan → /order/riwayat-pembatalan | Terbuka; kosong. |

Tidak ada FND/bug aplikasi terkonfirmasi pada pemeriksaan ini. Nomor order dan ID route di atas adalah sampel existing, bukan data milik run dan tidak boleh dimutasi. Fixture contoh pada JSON harus diikat ke data uji aktual; jangan menganggap ID contoh harus literal tersedia di staging. Baseline OMS diperlukan untuk assertion baseline terkait, bukan alasan memblokir semua pengujian UI. Clock tetap relevan pada assertion batas waktu; tidak memblokir pemeriksaan menu/list/detail/selector.
