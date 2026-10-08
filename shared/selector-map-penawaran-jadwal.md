# Selector Penawaran/Jadwal — 8 Oktober 2026

Observasi Batch05, bukan generator test atau bukti enforcement backend. Utamakan nama aktual dan scope card; jangan memakai nth global untuk suite permanen.

| Area | Route/locator teramati | Catatan |
|---|---|---|
| Vendor daftar | `/vendor-portal/penawaran`; button Input Harga/Filter; select Tampilkan; button tab dengan regex nama+counter | Native select, tab button biasa; tunggu data settled |
| Aksi harga | `button[title="Aksi"]` dalam card; teks Edit Harga/Hapus Harga/Riwayat Perubahan | Jangan klik Hapus saat explore |
| FCL jadwal | teks Tambah Jadwal/Lihat Jadwal | FTL tidak mempunyai kedua menu; card Tambah guard berbeda dari halaman jadwal |
| Detail harga Vendor | button Detail Harga | Expand lokal, route tetap |
| Input harga | route ditangkap inventory vendor-input-price.json; button Pilih No. Lelang | Dropdown kustom; empty Tidak ada lelang yang sedang buka |
| Detail Jadwal | `/vendor-portal/penawaran/{offerId}/jadwal` | ID diperoleh UI; button Tambah Jadwal/Filter; select native |
| Form Jadwal | `/vendor-portal/penawaran/{offerId}/jadwal/tambah` | button /^Direct/ atau /^Connecting/; placeholder Masukkan Nama Kapal/Masukkan Voyage, scope setiap baris |
| Baris lokal | button Tambah Baris Input atau Tambah Kapal Connecting | Nama bergantung jenis jadwal |
| Kalender | teks DD/MM/YYYY hh:mm,43button.h-9.w-9; input HH:mm | Filter overflow/navigation; jangan menganggap semua43 adalah tanggal bulanaktif |
| Batal Jadwal | button Batal → heading Batalkan Pengisian Jadwal?, button Tidak/Ya, Batalkan | Tanpa role=dialog pada sampel |
| Guard card | teks Aksi Tidak Dapat Dilakukan; button Mengerti | Tanpa role=dialog |
| Admin harga | `/lelang/{lelangId}/penawaran`; button Detail Biaya/Pesan/Request Jadwal | FCL03 tanpa jadwal Pesan enabled dan membuka formOrder; belum submit |
| Request Admin | `/lelang/{lelangId}/request-jadwal`; input[type=checkbox], aria Pilih harga {vendor} {unit}; button Kirim/Batal | aria tidak unik antar pelayaran; scope card. Kirim disabled tanpa pilihan |
| Filter/sort Request | button Filter/Urutkan; Pilih Pelayaran/Vendor/Jenis Kontainer/Jenis Jadwal; Reset/Terapkan; datetime-local | Buka panel eksplisit; clippedDOM bisa tampakvisible. Efektivitas belum diperiksa |

0data-testid pada sampel. Nativeclick cukup. Riwayat harga panel berbeda dari Riwayat Perubahan lelang yang sebelumnya redirect umum. Jangan pakai getByRole(button,TANTO) bila opsi aktual bukan button. Jangan menunggu seluruh pending response tanpa batas karena stream/event.
