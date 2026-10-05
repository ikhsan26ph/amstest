# UI Inventory — Harga Penawaran Rules

Prioritas: shared/selector-map-lelang.md untuk form lelang. Selector vendor berasal dari observasi/harness AMS004/AMS005; validasi kembali ketika run. Tidak ada data-testid terverifikasi.

| Layar | Area | Selector/route referensi |
|---|---|---|
| SCR-01 | Input Harga Vendor | /vendor-portal/penawaran/input-harga?lelangId={id}; button Simpan, Ya, Tambah Baris Input; button[aria-haspopup=listbox] dengan teks opsi yang diamati |
| SCR-02 | Daftar/Detail Penawaran | /vendor-portal/penawaran; button Filter, Terapkan; select Tampilkan; card di-scope No. Lelang dan kombinasi |
| SCR-03 | Edit Harga | Menu Edit Harga pada card fixture; route dari href/navigasi aktual, jangan menebak ID |
| SCR-04 | Live Bidding Vendor | /vendor-portal/live-bidding; scope card fixture, tombol Bid Harga dan konfirmasi Ya |
| SCR-05 | Jadwal Kapal | Action Lihat Jadwal pada harga FCL; baca Closing Time, ETD, ETA dan ID jadwal aktual |

Tanggal vendor pada harness lama: input[placeholder="DD/MM/YYYY"] memakai flatpickr. Periksa label, minDate, dan nilai sebelum menggunakan. Jika label berubah, rekam diagnosis dan refresh selector.
