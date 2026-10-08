# Eksplorasi Batch 01 — Navigasi dan Dashboard

**Pembaruan:** backlog interaksi dashboard dilanjutkan pada giliran berikutnya dan hasilnya ada di [Batch 01 lanjutan](explore-batch01-lanjutan-20261008.md). Bagian di bawah mempertahankan bukti inventaris awal; batas “belum” di sini bukan status akhir lanjutan.

Tanggal 8 Oktober 2026. Login Admin dan Vendor berhasil memakai konfigurasi yang sudah terkalibrasi; tidak perlu mengganti selector. Playwright lokal, role dikerjakan berurutan pada context terpisah tanpa storageState. Browser ditutup. Tidak submit/simpan/hapus atau mengubah setting. Halaman awal Vendor hanya dipakai membaca navigasi, bukan menguji modul Order.

## Menu dan halaman

| Modul | Route | Jenis | Aksi terlihat | Dokumen skenario | Hasil |
|---|---|---|---|---|---|
| Monitoring | /monitoring | Dashboard | Semua Tahapan, Selesai Muat/Bongkar, Melewati SLA, Belum Ada Pencatatan | Belum | Total Armada 0; empty state eksplisit |
| Operasional | /dashboard-operasional | Dashboard | Harian/Mingguan/Bulanan, Pilih Tanggal, tipe order, Export | Belum | Total Order 2; satu vendor digunakan; tabel keterlambatan kosong |
| Distribusi & Muatan | /dashboard-distribusi | Dashboard | Periode, Export, kontrol peta | Belum | Dua kota, satu provinsi, 2 armada; volume dan tonase tampil |
| Dashboard Lelang | /dashboard-lelang | Dashboard | Periode, Filter lelang, Pengaturan jumlah order, Refresh, Export | Belum; AMS003 berfokus Live Bidding/Laporan | Halaman berhasil dibuka; 137 lelang, 2 lelang dengan order |
| Lelang Kontrak Vendor | /vendor-portal/lelang-kontrak | Link navigasi | Daftar Lelang | Belum | Link ditemukan; isi halaman belum diperiksa, masuk Batch 03 |
| Live Bidding Kontrak Vendor | /vendor-portal/lelang-kontrak/live-bidding | Link navigasi | Live Bidding | Belum | Link ditemukan; isi halaman belum diperiksa, masuk Batch 04 |

Dua link Kontrak Vendor dan Dashboard Lelang belum tercatat pada peta 4 Oktober. Ini tambahan terhadap dokumentasi lama; tanggal implementasi fitur tidak diketahui. Sidebar Admin memperlihatkan 32 route menu utama, Vendor 12 route menu utama (tidak menghitung logo/breadcrumb). Hanya keberadaan navigasi yang terbukti, bukan otorisasi backend.

## Rule dan gap cakupan

| ID | Bukti langsung pada UI | Implikasi cakupan / usulan improve |
|---|---|---|
| B01-R01 | Monitoring: Total Armada = sedang dalam proses pengiriman; Melewati SLA = lewat estimasi waktu tiba | Tambahkan skenario tahapan dan batas SLA; belum ada sampel armada berjalan untuk memverifikasi formula |
| B01-R02 | Operasional memakai Periode Permintaan Muat; Total Order mengecualikan Dibatalkan | Skenario harus membedakan tanggal buat vs permintaan muat dan pembatalan |
| B01-R03 | Dashboard Lelang memakai Periode Lelang Dibuka | Perlu uji batas periode, zona waktu, dan hubungan lelang ulang; bukan otomatis tanggal dibuat |
| B01-R04 | Partisipasi Vendor = rata-rata persentase vendor memberi penawaran pada tiap lelang | Perlu fixture denominator undangan/respons; jangan menyamakan dengan jumlah vendor unik |
| B01-R05 | Total Nilai Transaksi = total biaya pengiriman tercatat pada daftar order | Belum diketahui dampak batal/tidak aktif/pajak; perlu expected eksplisit dan rekonsiliasi Order |
| B01-R06 | Lelang dengan Order = persentase lelang menjadi order; tampilan 2/137 = 1,46% | Angka tampilan konsisten secara aritmetika; belum direkonsiliasi dengan seluruh data sumber |
| B01-R07 | Pola pemakaian: 0 order, 1 order, 2–5 order, >5 order per lelang | Tambahkan boundary 0/1/2/5/6; pengaturan jumlah order terlihat tetapi belum dibuka/diubah |
| B01-R08 | Distribusi membedakan keterisian volume dan tonase; pengiriman <50% kapasitas dan Overload | Perlu keputusan definisi agregasi, boundary 50%/100%, dan data kapasitas kosong |
| B01-R09 | Distribusi memakai kelas jumlah order ≤1.000, 1.001–10.000, 10.001–50.000, 50.001–100.000, >100.000 | Boundary kelas dan kecocokan legenda/peta belum diuji |
| B01-I01 | Dashboard belum memiliki suite khusus | Usulan prioritas: skenario rekonsiliasi metrik, periode, denominator nol, empty state dan ekspor; bukan verdict bug |
| B01-I02 | Rentang Harga dashboard berlabel harga final; pada FCL-NRM-17/011026 rentang Rp111.111–Rp16.350.000 | Perlu definisi apakah harga aktif/expired/nego dan pajak ikut agregasi, agar konsisten dengan rule harga terbaru |

## Bukti dan batas

- DOM tersamarkan: artifacts/explore-batches/20261008/batch01-observations.json (4 observasi) dan batch01-dashboard-lelang.json (1 observasi).
- Lima screenshot: artifacts/screenshots/explore/20261008/. Akun email disamarkan; data bisnis masih bersifat private mengikuti aturan repo.
- Dibandingkan dengan explore/module-map.md, inventaris 4 Oktober, skenario repo dan shared/decisions.md. Tidak ditemukan suite khusus dashboard dari pencarian tersebut.
- Hipotesis #1: native login berhasil kedua role; #6: nol data-testid pada lima observasi. #2 tidak diuji; #3–#5 serta sampel form/list interaktif dilanjutkan di batch berikutnya. Status historis CLAUDE.md tetap dipertahankan karena belum ada bukti perubahan.
- Belum mengeklik filter/tab periode/datepicker/ekspor, memverifikasi kalkulasi API, membuka modal rincian, menguji form atau seluruh role. Batch selesai untuk inventaris awal navigasi/dashboard; rule tabel adalah observasi label, bukan bukti enforcement backend.
- Tidak ada kandidat bug terkonfirmasi dan tidak ada verdict skenario formal/Excel. Expected lama tidak diubah.

Kelanjutan Batch 01: filter, periode, datepicker, rincian, pengaturan jumlah order (baca lalu Batal), dan tiga ekspor sudah diperiksa; lihat laporan lanjutan. B01-R07 menggunakan batas konfigurasi B (saat ini 5), bukan konstanta. Tersisa rekonsiliasi sumber/fixture presisi dan kandidat ketidakkonsistenan diagram. Batch 02 belum dijalankan.
