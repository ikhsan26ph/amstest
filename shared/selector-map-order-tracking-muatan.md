# Selector eksplorasi Order / Tracking / Simulasi Muatan — 8 Oktober 2026

Bukti dan batas: explore/explore-batch07-20261008.md. Login memakai parameter config/env.md, klik native; jangan hardcode akun/URL dasar. Tidak ada data-testid pada inventaris list/form yang diperiksa.

| Area | Locator/pola teramati | Catatan |
|---|---|---|
| List Order |getByRole('button', {name:/^Filter/}), Reset; select ukuran halaman |Dropdown filter kustom button/option; selectOption hanya untuk select native. |
| Baris Order |Scope row berisi ID, lalu tombol menu/Detail |getByText ID global strict dapat cocok dua kali dengan tombol Salin; jangan pilih nomor pertama tanpa memeriksa row. |
| Detail |Visualisasi Muatan; Edit Order; Batalkan Order |Dua terakhir berpotensi write, tidak dieksekusi. Visualisasi membuka modal;3D belum terverifikasi. |
| Create/Batch |Buat Order, Batch Order; FTL/FCL/LTL/LCL; Batal |Selanjutnya dapat menyimpan progress, bukan navigasi baca yang aman. Batal membuka konfirmasi tanpa role=dialog; Ya hanya untuk membuang input lokal pada form yang dibuka sesi. |
| Template |Download Template Excel → Normal/Multipickup/Multidrop/Multipoint |Pasang listener download sebelum memilih submenu yang benar. File input teramati; jangan import. |
| Riwayat perubahan |Menu Riwayat Perubahan → /order/{id}/riwayat |Halaman, bukan modal. Filter tanggal/pelaku dan Terapkan/Reset. |
| Kalender filter Vendor |.flatpickr-day |70sel termasuk tanggal overflow; button.h-9.w-9 bukan selector sel hari. Periksa bulan/disabled sebelum memilih. |
| Tracking |/penugasan-tracking; Filter, Reset |Kedua role kosong; Admin memiliki filter Vendor. Belum locator detail/penugasan. |
| Simulator |radio Armada/Kontainer; Pilih Barang; Cek Visualisasi; Lanjutkan Order |Radio check native berhasil. Lanjutkan Order tidak dijalankan. |
| Picker barang |Checkbox barang; button /^Tambahkan/; Tutup |Nama dinamis Tambahkan(1), tidak exact Tambahkan. Picker tanpa role=dialog pada sampel. |

Perhitungan baca memakai POST: /api/order/stuffing/visualisasi, /api/simulasi-muatan/rekomendasi, /api/simulasi-muatan/hitung. Allowlist harus spesifik setelah memastikan fungsi tidak menyimpan data. Simpan/Submit/Import/konfirmasi/penugasan tetap diblokir. Toast akibat abort harness tidak menjadi temuan aplikasi. Jangan menunggu seluruh pending response tanpa batas; response stream dapat menggantung.
