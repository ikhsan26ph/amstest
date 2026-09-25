# Analysis — ams002-buat-lelang-ftl

## Requirements

Sumber: `inputs/ams002-buat-lelang-ftl/spec.txt`. Aktor utama: admin shipper; vendor aktif FTL mengirim penawaran; sistem mengatur waktu, audit, notifikasi. Admin hanya memakai master dan lelang tenant sendiri.

| REQ | Requirement / acceptance criteria | Sumber spesifikasi |
|---|---|---|
| REQ-001 | Nomor lelang otomatis sesuai konfigurasi PGR hanya saat submit; draft tanpa nomor | General 1 |
| REQ-002 | FTL tanpa pelabuhan, metode/skema pengiriman dan tahap jadwal | General 2–3 |
| REQ-003 | Satu lelang mendukung order berulang sampai Rencana Akhir Kirim | General 4 |
| REQ-004 | Semua mutasi lelang tercatat pada Riwayat Perubahan | General 5; Edit 5 |
| REQ-005 | Aksi tidak relevan tetap terlihat dan memberi alert; pengecualian eksplisit mengikuti layar | General 6 |
| REQ-006 | Status Belum Buka, Sedang Buka, Tutup/Aktif, Selesai mengikuti waktu; Dibatalkan manual | Status 1,3–8 |
| REQ-007 | Draft menampilkan substatus sesuai step | Status 2; Step 1.6; Step 2.7 |
| REQ-008 | Badge Tidak Ada Penawaran dan Tidak Ada Order sesuai kondisi setelah tutup | Status 9 |
| REQ-009 | Tab Semua Lelang, Lelang Ulang, Request Jadwal, Draf dan counter akurat; FTL tidak masuk Request Jadwal | List 1 |
| REQ-010 | Penanda warna Proses Nego dan Lelang Ulang serta legenda | List 2; Penawaran 12 |
| REQ-011 | Rute kota dari drop point; popup Multipickup/Multidrop memuat titik berurutan | List 3–4 |
| REQ-012 | Card daftar menampilkan data lelang sesuai desain | List 5 |
| REQ-013 | Draft kedaluwarsa mengikuti setting, hilang hari berikutnya, warna H-3 dan H | List 6–7 |
| REQ-014 | Menu aksi draft dan nondraft serta riwayat lelang ulang kondisional | List 8–9 |
| REQ-015 | Pagination dan ukuran halaman default 20 | List 10 |
| REQ-016 | Dua step pembuatan; pemilihan FTL langsung memunculkan seluruh card | Step 1 Buat 1–3 |
| REQ-017 | Required menampilkan helper, border error dan scroll ke kesalahan pertama | Step 1 Buat 4 |
| REQ-018 | Batal meminta konfirmasi dan kembali tanpa menyimpan | Step 1 Buat 5 |
| REQ-019 | Simpan ke Draft step 1 melewati validasi required | Step 1 Buat 6 |
| REQ-020 | Selanjutnya validasi dan Kembali mempertahankan data step 1 | Step 1 Buat 7 |
| REQ-021 | Checkbox salin membuka periode/data lelang; uncheck mempertahankan hasil salinan | Gunakan Data 1,6 |
| REQ-022 | Periode salinan opsional dengan batas 90 hari dan filter tanggal dibuat | Gunakan Data 2–3 |
| REQ-023 | Sumber salinan wajib jika dicentang, milik shipper, FTL, bukan draft | Gunakan Data 3 |
| REQ-024 | Salinan seluruh field dan baris dapat diedit kecuali lima field waktu tidak disalin | Gunakan Data 4–5 |
| REQ-025 | Durasi wajib bersumber Pengaturan Sistem | Informasi Umum 1 |
| REQ-026 | Buka Lelang wajib format DD/MM/YYYY hh:mm dan tidak di masa lalu | Informasi Umum 2 |
| REQ-027 | Tutup Lelang read-only sama dengan Buka ditambah Durasi dan dihitung ulang | Informasi Umum 3 |
| REQ-028 | Rencana Awal Kirim wajib tidak sebelum Tutup | Informasi Umum 4 |
| REQ-029 | Rencana Akhir Kirim wajib tidak sebelum Rencana Awal dan membatasi order | Informasi Umum 5 |
| REQ-030 | Jumlah Armada opsional numeric minimal 1 | Informasi Umum 6 |
| REQ-031 | Jenis Armada wajib multiselect searchable minimal satu dari master aktif | Informasi Umum 7 |
| REQ-032 | Deskripsi Barang dan Catatan Tambahan opsional | Informasi Umum 8; Syarat 4 |
| REQ-033 | FTL hanya komponen Asuransi; Nilai Barang bersyarat wajib numeric max >= min dan format ribuan | Syarat 1–2 |
| REQ-034 | Dokumen multiple JPG/JPEG/PNG/PDF maksimal 4MB per file, hapus serta lihat/unduh detail | Syarat 3; Detail 7 |
| REQ-035 | Default satu pengirim/penerima; tambah baris tanpa batas; tipe otomatis dari jumlah baris | Data Pengirim/Penerima 1–2,7 |
| REQ-036 | Label Muat/Bongkar, ikon hapus, urutan dan renumber mengikuti jumlah baris | Data Pengirim/Penerima 3–4 |
| REQ-037 | Drop Point dan Pengirim/Penerima wajib searchable milik shipper dan saling mengisi/filter | Data Pengirim/Penerima 5 |
| REQ-038 | Alamat administratif otomatis read-only dari master; PIC dan WhatsApp wajib editable, WhatsApp angka | Data Pengirim/Penerima 5 |
| REQ-039 | Drop point unik lintas seluruh baris pengirim dan penerima | Data Pengirim/Penerima 6 |
| REQ-040 | Daftar vendor hanya aktif eligible FTL dikelola vendor; card kota, menang, rating baru 3.0 | Peserta 1–2 |
| REQ-041 | Filter kota/rating, cari vendor, urutan rating tertinggi | Peserta 3 |
| REQ-042 | Multiselect vendor dan counter lintas pagination | Peserta 4 |
| REQ-043 | Pilih Semua otomatis mengikutkan vendor baru eligible dikelola vendor | Peserta 5 |
| REQ-044 | Submit minimal satu vendor; draft step 2 tanpa submit | Peserta 6–7 |
| REQ-045 | Submit menghasilkan nomor/status, email/push, jadwal bidding dan toast serta redirect | Peserta 8–10 |
| REQ-046 | Detail read-only lengkap, tipe otomatis, Pick Up/Drop Off kondisional, kosong tanda '-' | Detail 1–4 |
| REQ-047 | Section detail collapsible dan Edit Data hanya saat Belum/Sedang Buka | Detail 5–6 |
| REQ-048 | Tabel peserta memuat waktu, dua status FTL, total x/y serta filter/cari/sort | Peserta pada Detail 1–4 |
| REQ-049 | Edit hanya Belum/Sedang Buka dengan jenis/tipe read-only dan jumlah baris tetap | Edit 1–3 |
| REQ-050 | Edit memvalidasi seperti buat, rekalkulasi tutup, audit field/nilai/user/waktu dan notifikasi | Edit 4–5 |
| REQ-051 | Tambah peserta hanya Belum/Sedang Buka, ringkasan read-only dan aturan vendor step 2 | Tambah Peserta 1–2 |
| REQ-052 | Peserta belum menawar dapat dihapus; sudah menawar terkunci; counter lama+baru | Tambah Peserta 3–4 |
| REQ-053 | Perubahan peserta hanya memberi notifikasi vendor masuk/keluar | Tambah Peserta 5 |
| REQ-054 | Pembatalan Belum/Sedang Buka/Tutup tanpa order; alasan wajib dan identitas read-only | Batalkan 1–2 |
| REQ-055 | Batalkan Order mengubah status, list dan riwayat; hanya detail/riwayat tersedia setelah batal | Batalkan 3–4 |
| REQ-056 | Akses harga setelah tutup; sebelum buka/saat buka tampil alert; tanpa Request Jadwal | Penawaran 1–3 |
| REQ-057 | Filter Vendor/Jenis Armada/Target Waktu numeric, Urutkan, Reset dan Terapkan | Penawaran 4 |
| REQ-058 | Ranking tanggal efektif terbaru, harga naik, rating turun, menang turun, jenis armada | Penawaran 5 |
| REQ-059 | Card harga dan tab biaya/armada/vendor sesuai master, pajak dari DPP dan profil vendor | Penawaran 6–7 |
| REQ-060 | Pesan hanya harga berlaku sebelum batas kirim; N/A dan Expired memberi alert | Penawaran 8 |
| REQ-061 | Pesan mengisi Buat Order OMS, status tetap Aktif, email vendor penawar lain | Penawaran 9–10 |
| REQ-062 | Bebas memilih penawaran; Ajukan Nego sesuai status dan masuk modul terpisah | Penawaran 3,11–12 |
| REQ-063 | Lelang ulang hanya Tutup/Aktif sebelum batas kirim, tidak rangkap dan nomor tetap | Lelang Ulang 1–2 |
| REQ-064 | Form lelang ulang read-only, pengirim/penerima collapsed, info statis, asuransi kondisional | Lelang Ulang 3–4 |
| REQ-065 | Waktu lelang ulang wajib dari setting, buka >= sekarang, tutup <= akhir kirim | Lelang Ulang 4 |
| REQ-066 | Peserta ulang lama menawar terkunci, belum input removable, counter vendor baru; tanpa vendor baru valid | Lelang Ulang 5 |
| REQ-067 | Simpan ulang mengubah status/tab/warna, audit ulang dan email/push seluruh peserta | Lelang Ulang 6,10 |
| REQ-068 | Harga lama Expired per vendor setelah harga baru masuk; tanpa update tetap aktif | Lelang Ulang 7 |
| REQ-069 | Selama ulang harga baru tersembunyi, countdown tampil dan harga lama tidak dapat dipesan/nego | Lelang Ulang 8 |
| REQ-070 | Setelah ulang tutup tampil harga baru+lama aktif, status Tutup/Aktif dan keluar tab ulang | Lelang Ulang 9 |

### Alur dan validasi

Buat → Informasi Umum → Peserta → Simpan → Belum/Sedang Buka → Tutup/Aktif → order berulang → Selesai. Cabang: draft per step, batal form, salin, edit, perubahan peserta, pembatalan, nego dan lelang ulang. Validasi wajib dan batas tertulis pada REQ-017, REQ-022–039, REQ-044, REQ-054 dan REQ-065; setiap baris divalidasi tersendiri. Hak aksi mengikuti status pada requirement masing-masing.

## UI Inventory

Semua **22 PNG** dibuka dan diperiksa. Inventaris berikut membedakan observasi desain dan aturan dari spec. Label scope Pengirim/Penerima serta nama ikon adalah usulan aksesibilitas, bukan bukti DOM. Gunakan scope baris/card berdasarkan ID stabil, bukan nama vendor saja.

### list-lelang — Lelang Spot Rate

Sumber: 032.png, 042.png, 046.png, 050.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Buat Lelang | `button` / Buat Lelang | `list-lelang-buat-lelang` | Sesuai state/status pada REQ terkait |
| Riwayat Pembatalan | `button` / Riwayat Pembatalan | `list-lelang-riwayat-pembatalan` | Sesuai state/status pada REQ terkait |
| Filter | `button` / Filter | `list-lelang-filter` | Sesuai state/status pada REQ terkait |
| Semua Lelang | `tab` / Semua Lelang | `list-lelang-semua-lelang` | Sesuai state/status pada REQ terkait |
| Lelang Ulang | `tab` / Lelang Ulang | `list-lelang-lelang-ulang` | Sesuai state/status pada REQ terkait |
| Request Jadwal | `tab` / Request Jadwal | `list-lelang-request-jadwal` | Sesuai state/status pada REQ terkait |
| Draf | `tab` / Draf | `list-lelang-draf` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `list-lelang-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `list-lelang-halaman-berikutnya` | Sesuai state/status pada REQ terkait |
| Halaman Sebelumnya | `button` / Halaman Sebelumnya | `list-lelang-halaman-sebelumnya` | Sesuai state/status pada REQ terkait |
| Halaman Pertama | `button` / Halaman Pertama | `list-lelang-halaman-pertama` | Sesuai state/status pada REQ terkait |
| Halaman Terakhir | `button` / Halaman Terakhir | `list-lelang-halaman-terakhir` | Sesuai state/status pada REQ terkait |
| Menu Aksi | `button` / Menu Aksi | `list-lelang-menu-aksi` | Sesuai state/status pada REQ terkait |
| Detail | `menuitem` / Detail | `list-lelang-detail` | Sesuai state/status pada REQ terkait |
| Edit Data | `menuitem` / Edit Data | `list-lelang-edit-data` | Sesuai state/status pada REQ terkait |
| Tambah Peserta Lelang | `menuitem` / Tambah Peserta Lelang | `list-lelang-tambah-peserta-lelang` | Sesuai state/status pada REQ terkait |
| Batalkan Lelang | `menuitem` / Batalkan Lelang | `list-lelang-batalkan-lelang` | Sesuai state/status pada REQ terkait |
| Riwayat Lelang Ulang | `menuitem` / Riwayat Lelang Ulang | `list-lelang-riwayat-lelang-ulang` | Sesuai state/status pada REQ terkait |
| Riwayat Perubahan | `menuitem` / Riwayat Perubahan | `list-lelang-riwayat-perubahan` | Sesuai state/status pada REQ terkait |
| Hapus Draft | `menuitem` / Hapus Draft | `list-lelang-hapus-draft` | Sesuai state/status pada REQ terkait |
| Multipickup | `link` / Multipickup | `list-lelang-multipickup` | Sesuai state/status pada REQ terkait |
| Multidrop | `link` / Multidrop | `list-lelang-multidrop` | Sesuai state/status pada REQ terkait |
| Card Lelang | `article` / Card Lelang | `list-lelang-card-lelang` | Sesuai state/status pada REQ terkait |
| Legenda | `region` / Legenda | `list-lelang-legenda` | Sesuai state/status pada REQ terkait |

### informasi-umum — Buat Lelang Spot Rate — Informasi Umum

Sumber: 033.png, 034.png, 043.png, 047.png, 051.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| FTL | `radio` / FTL | `informasi-umum-ftl` | Sesuai state/status pada REQ terkait |
| FCL | `radio` / FCL | `informasi-umum-fcl` | Sesuai state/status pada REQ terkait |
| Gunakan data lelang yang pernah dibuat | `checkbox` / Gunakan data lelang yang pernah dibuat | `informasi-umum-gunakan-data-lelang-yang-pernah-dibuat` | Sesuai state/status pada REQ terkait |
| Periode Lelang Dibuat | `textbox` / Periode Lelang Dibuat | `informasi-umum-periode-lelang-dibuat` | Dari spec; state ini tidak terlihat pada PNG |
| Data Lelang | `combobox` / Data Lelang | `informasi-umum-data-lelang` | Dari spec; state ini tidak terlihat pada PNG |
| Durasi Lelang | `combobox` / Durasi Lelang | `informasi-umum-durasi-lelang` | Required; dropdown searchable atau textbox; PIC editable |
| Buka Lelang | `textbox` / Buka Lelang | `informasi-umum-buka-lelang` | datetime; DD/MM/YYYY hh:mm; required |
| Tutup Lelang | `textbox` / Tutup Lelang | `informasi-umum-tutup-lelang` | datetime; DD/MM/YYYY hh:mm; read-only |
| Rencana Awal Kirim | `textbox` / Rencana Awal Kirim | `informasi-umum-rencana-awal-kirim` | datetime; DD/MM/YYYY hh:mm; required |
| Rencana Akhir Kirim | `textbox` / Rencana Akhir Kirim | `informasi-umum-rencana-akhir-kirim` | datetime; DD/MM/YYYY hh:mm; required |
| Jumlah Armada | `spinbutton` / Jumlah Armada | `informasi-umum-jumlah-armada` | Sesuai state/status pada REQ terkait |
| Jenis Armada | `combobox` / Jenis Armada | `informasi-umum-jenis-armada` | Required; dropdown searchable atau textbox; PIC editable |
| Cari Jenis Armada | `textbox` / Cari Jenis Armada | `informasi-umum-cari-jenis-armada` | Placeholder Cari Jenis Armada (034.png) |
| Pilih Semua Armada | `checkbox` / Pilih Semua Armada | `informasi-umum-pilih-semua-armada` | Sesuai state/status pada REQ terkait |
| Deskripsi Barang | `textbox` / Deskripsi Barang | `informasi-umum-deskripsi-barang` | Sesuai state/status pada REQ terkait |
| Gunakan Asuransi | `checkbox` / Gunakan Asuransi | `informasi-umum-gunakan-asuransi` | Sesuai state/status pada REQ terkait |
| Nilai Barang Min | `textbox` / Nilai Barang Min | `informasi-umum-nilai-barang-min` | Sesuai state/status pada REQ terkait |
| Nilai Barang Max | `textbox` / Nilai Barang Max | `informasi-umum-nilai-barang-max` | Sesuai state/status pada REQ terkait |
| Dokumen Tambahan | `group` / Dokumen Tambahan | `informasi-umum-dokumen-tambahan` | Sesuai state/status pada REQ terkait |
| Pilih File | `button` / Pilih File | `informasi-umum-pilih-file` | File chooser; Maksimal 4MB dengan format .jpg, .jpeg, .png, atau .pdf |
| Hapus Dokumen | `button` / Hapus Dokumen | `informasi-umum-hapus-dokumen` | Sesuai state/status pada REQ terkait |
| Catatan Tambahan | `textbox` / Catatan Tambahan | `informasi-umum-catatan-tambahan` | Sesuai state/status pada REQ terkait |
| Tambah Baris Input Pengirim | `button` / Tambah Baris Input Pengirim | `informasi-umum-tambah-baris-input-pengirim` | Sesuai state/status pada REQ terkait |
| Tambah Baris Input Penerima | `button` / Tambah Baris Input Penerima | `informasi-umum-tambah-baris-input-penerima` | Sesuai state/status pada REQ terkait |
| Hapus Muat | `button` / Hapus Muat | `informasi-umum-hapus-muat` | Sesuai state/status pada REQ terkait |
| Hapus Bongkar | `button` / Hapus Bongkar | `informasi-umum-hapus-bongkar` | Sesuai state/status pada REQ terkait |
| Batal | `button` / Batal | `informasi-umum-batal` | Sesuai state/status pada REQ terkait |
| Simpan ke Draft | `button` / Simpan ke Draft | `informasi-umum-simpan-ke-draft` | Sesuai state/status pada REQ terkait |
| Selanjutnya | `button` / Selanjutnya | `informasi-umum-selanjutnya` | Sesuai state/status pada REQ terkait |
| Drop Point Asal | `combobox` / Drop Point Asal | `informasi-umum-drop-point-asal` | Required; dropdown searchable atau textbox; PIC editable |
| Pengirim | `combobox` / Pengirim | `informasi-umum-pengirim` | Sesuai state/status pada REQ terkait |
| PIC Pengirim | `textbox` / PIC Pengirim | `informasi-umum-pic-pengirim` | Required; dropdown searchable atau textbox; PIC editable |
| No. WhatsApp PIC Pengirim | `textbox` / No. WhatsApp PIC Pengirim | `informasi-umum-no-whatsapp-pic-pengirim` | Required; dropdown searchable atau textbox; PIC editable |
| Catatan Pengirim | `textbox` / Catatan Pengirim | `informasi-umum-catatan-pengirim` | Sesuai state/status pada REQ terkait |
| Provinsi Asal | `textbox` / Provinsi Asal | `informasi-umum-provinsi-asal` | Auto dari master; disabled |
| Kota/Kab Asal | `textbox` / Kota/Kab Asal | `informasi-umum-kota-kab-asal` | Auto dari master; disabled |
| Kecamatan Asal | `textbox` / Kecamatan Asal | `informasi-umum-kecamatan-asal` | Auto dari master; disabled |
| Desa/Kelurahan Asal | `textbox` / Desa/Kelurahan Asal | `informasi-umum-desa-kelurahan-asal` | Auto dari master; disabled |
| Kode Pos Asal | `textbox` / Kode Pos Asal | `informasi-umum-kode-pos-asal` | Auto dari master; disabled |
| Alamat Asal | `textbox` / Alamat Asal | `informasi-umum-alamat-asal` | Auto dari master; disabled |
| Drop Point Tujuan | `combobox` / Drop Point Tujuan | `informasi-umum-drop-point-tujuan` | Required; dropdown searchable atau textbox; PIC editable |
| Penerima | `combobox` / Penerima | `informasi-umum-penerima` | Sesuai state/status pada REQ terkait |
| PIC Penerima | `textbox` / PIC Penerima | `informasi-umum-pic-penerima` | Required; dropdown searchable atau textbox; PIC editable |
| No. WhatsApp PIC Penerima | `textbox` / No. WhatsApp PIC Penerima | `informasi-umum-no-whatsapp-pic-penerima` | Required; dropdown searchable atau textbox; PIC editable |
| Catatan Penerima | `textbox` / Catatan Penerima | `informasi-umum-catatan-penerima` | Sesuai state/status pada REQ terkait |
| Provinsi Tujuan | `textbox` / Provinsi Tujuan | `informasi-umum-provinsi-tujuan` | Auto dari master; disabled |
| Kota/Kab Tujuan | `textbox` / Kota/Kab Tujuan | `informasi-umum-kota-kab-tujuan` | Auto dari master; disabled |
| Kecamatan Tujuan | `textbox` / Kecamatan Tujuan | `informasi-umum-kecamatan-tujuan` | Auto dari master; disabled |
| Desa/Kelurahan Tujuan | `textbox` / Desa/Kelurahan Tujuan | `informasi-umum-desa-kelurahan-tujuan` | Auto dari master; disabled |
| Kode Pos Tujuan | `textbox` / Kode Pos Tujuan | `informasi-umum-kode-pos-tujuan` | Auto dari master; disabled |
| Alamat Tujuan | `textbox` / Alamat Tujuan | `informasi-umum-alamat-tujuan` | Auto dari master; disabled |

### peserta-lelang — Buat Lelang Spot Rate — Peserta Lelang

Sumber: 035.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Pilih Semua | `button` / Pilih Semua | `peserta-lelang-pilih-semua` | Sesuai state/status pada REQ terkait |
| Cari nama vendor | `textbox` / Cari nama vendor | `peserta-lelang-cari-nama-vendor` | Placeholder Cari nama vendor |
| Semua Kota | `combobox` / Semua Kota | `peserta-lelang-semua-kota` | Sesuai state/status pada REQ terkait |
| Semua Rating | `combobox` / Semua Rating | `peserta-lelang-semua-rating` | Dari spec; state ini tidak terlihat pada PNG |
| Vendor | `checkbox` / Vendor | `peserta-lelang-vendor` | Sesuai state/status pada REQ terkait |
| Counter Vendor | `status` / Counter Vendor | `peserta-lelang-counter-vendor` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `peserta-lelang-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `peserta-lelang-halaman-berikutnya` | Sesuai state/status pada REQ terkait |
| Halaman Sebelumnya | `button` / Halaman Sebelumnya | `peserta-lelang-halaman-sebelumnya` | Sesuai state/status pada REQ terkait |
| Kembali | `button` / Kembali | `peserta-lelang-kembali` | Dari spec; state ini tidak terlihat pada PNG |
| Batal | `button` / Batal | `peserta-lelang-batal` | Sesuai state/status pada REQ terkait |
| Simpan ke Draft | `button` / Simpan ke Draft | `peserta-lelang-simpan-ke-draft` | Sesuai state/status pada REQ terkait |
| Simpan | `button` / Simpan | `peserta-lelang-simpan` | Sesuai state/status pada REQ terkait |

### detail-lelang — Detail Lelang Spot Rate

Sumber: 036.png, 044.png, 048.png, 052.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Ringkasan Lelang | `region` / Ringkasan Lelang | `detail-lelang-ringkasan-lelang` | Sesuai state/status pada REQ terkait |
| Edit Data | `button` / Edit Data | `detail-lelang-edit-data` | Sesuai state/status pada REQ terkait |
| Syarat & Ketentuan | `button` / Syarat & Ketentuan | `detail-lelang-syarat-ketentuan` | Sesuai state/status pada REQ terkait |
| Data Pengirim | `button` / Data Pengirim | `detail-lelang-data-pengirim` | Sesuai state/status pada REQ terkait |
| Data Penerima | `button` / Data Penerima | `detail-lelang-data-penerima` | Sesuai state/status pada REQ terkait |
| Peserta Lelang | `button` / Peserta Lelang | `detail-lelang-peserta-lelang` | Sesuai state/status pada REQ terkait |
| Dokumen Tambahan | `link` / Dokumen Tambahan | `detail-lelang-dokumen-tambahan` | Sesuai state/status pada REQ terkait |
| Semua Status | `combobox` / Semua Status | `detail-lelang-semua-status` | Sesuai state/status pada REQ terkait |
| Cari nama vendor | `textbox` / Cari nama vendor | `detail-lelang-cari-nama-vendor` | Placeholder Cari nama vendor |
| Vendor | `columnheader` / Vendor | `detail-lelang-vendor` | Sesuai state/status pada REQ terkait |
| Tanggal Terkirim | `columnheader` / Tanggal Terkirim | `detail-lelang-tanggal-terkirim` | Sesuai state/status pada REQ terkait |
| Tanggal Penawaran | `columnheader` / Tanggal Penawaran | `detail-lelang-tanggal-penawaran` | Sesuai state/status pada REQ terkait |
| Tabel Peserta | `table` / Tabel Peserta | `detail-lelang-tabel-peserta` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `detail-lelang-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `detail-lelang-halaman-berikutnya` | Sesuai state/status pada REQ terkait |

### edit-lelang — Edit Lelang Spot Rate

Sumber: 038.png, 045.png, 049.png, 053.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Jenis Pengiriman | `region` / Jenis Pengiriman | `edit-lelang-jenis-pengiriman` | Sesuai state/status pada REQ terkait |
| Tipe Pengiriman | `region` / Tipe Pengiriman | `edit-lelang-tipe-pengiriman` | Sesuai state/status pada REQ terkait |
| Durasi Lelang | `combobox` / Durasi Lelang | `edit-lelang-durasi-lelang` | Required; dropdown searchable atau textbox; PIC editable |
| Buka Lelang | `textbox` / Buka Lelang | `edit-lelang-buka-lelang` | datetime; DD/MM/YYYY hh:mm; required |
| Tutup Lelang | `textbox` / Tutup Lelang | `edit-lelang-tutup-lelang` | datetime; DD/MM/YYYY hh:mm; read-only |
| Rencana Awal Kirim | `textbox` / Rencana Awal Kirim | `edit-lelang-rencana-awal-kirim` | datetime; DD/MM/YYYY hh:mm; required |
| Rencana Akhir Kirim | `textbox` / Rencana Akhir Kirim | `edit-lelang-rencana-akhir-kirim` | datetime; DD/MM/YYYY hh:mm; required |
| Jumlah Armada | `spinbutton` / Jumlah Armada | `edit-lelang-jumlah-armada` | Sesuai state/status pada REQ terkait |
| Jenis Armada | `combobox` / Jenis Armada | `edit-lelang-jenis-armada` | Required; dropdown searchable atau textbox; PIC editable |
| Deskripsi Barang | `textbox` / Deskripsi Barang | `edit-lelang-deskripsi-barang` | Sesuai state/status pada REQ terkait |
| Gunakan Asuransi | `checkbox` / Gunakan Asuransi | `edit-lelang-gunakan-asuransi` | Sesuai state/status pada REQ terkait |
| Nilai Barang Min | `textbox` / Nilai Barang Min | `edit-lelang-nilai-barang-min` | Sesuai state/status pada REQ terkait |
| Nilai Barang Max | `textbox` / Nilai Barang Max | `edit-lelang-nilai-barang-max` | Sesuai state/status pada REQ terkait |
| Pilih File | `button` / Pilih File | `edit-lelang-pilih-file` | File chooser; Maksimal 4MB dengan format .jpg, .jpeg, .png, atau .pdf |
| Catatan Tambahan | `textbox` / Catatan Tambahan | `edit-lelang-catatan-tambahan` | Sesuai state/status pada REQ terkait |
| Tambah Baris Input Pengirim | `button` / Tambah Baris Input Pengirim | `edit-lelang-tambah-baris-input-pengirim` | Sesuai state/status pada REQ terkait |
| Tambah Baris Input Penerima | `button` / Tambah Baris Input Penerima | `edit-lelang-tambah-baris-input-penerima` | Sesuai state/status pada REQ terkait |
| Hapus Muat | `button` / Hapus Muat | `edit-lelang-hapus-muat` | Sesuai state/status pada REQ terkait |
| Hapus Bongkar | `button` / Hapus Bongkar | `edit-lelang-hapus-bongkar` | Sesuai state/status pada REQ terkait |
| Batal | `button` / Batal | `edit-lelang-batal` | Sesuai state/status pada REQ terkait |
| Simpan | `button` / Simpan | `edit-lelang-simpan` | Sesuai state/status pada REQ terkait |
| Drop Point Asal | `combobox` / Drop Point Asal | `edit-lelang-drop-point-asal` | Required; dropdown searchable atau textbox; PIC editable |
| Pengirim | `combobox` / Pengirim | `edit-lelang-pengirim` | Sesuai state/status pada REQ terkait |
| PIC Pengirim | `textbox` / PIC Pengirim | `edit-lelang-pic-pengirim` | Required; dropdown searchable atau textbox; PIC editable |
| No. WhatsApp PIC Pengirim | `textbox` / No. WhatsApp PIC Pengirim | `edit-lelang-no-whatsapp-pic-pengirim` | Required; dropdown searchable atau textbox; PIC editable |
| Catatan Pengirim | `textbox` / Catatan Pengirim | `edit-lelang-catatan-pengirim` | Sesuai state/status pada REQ terkait |
| Provinsi Asal | `textbox` / Provinsi Asal | `edit-lelang-provinsi-asal` | Auto dari master; disabled |
| Kota/Kab Asal | `textbox` / Kota/Kab Asal | `edit-lelang-kota-kab-asal` | Auto dari master; disabled |
| Kecamatan Asal | `textbox` / Kecamatan Asal | `edit-lelang-kecamatan-asal` | Auto dari master; disabled |
| Desa/Kelurahan Asal | `textbox` / Desa/Kelurahan Asal | `edit-lelang-desa-kelurahan-asal` | Auto dari master; disabled |
| Kode Pos Asal | `textbox` / Kode Pos Asal | `edit-lelang-kode-pos-asal` | Auto dari master; disabled |
| Alamat Asal | `textbox` / Alamat Asal | `edit-lelang-alamat-asal` | Auto dari master; disabled |
| Drop Point Tujuan | `combobox` / Drop Point Tujuan | `edit-lelang-drop-point-tujuan` | Required; dropdown searchable atau textbox; PIC editable |
| Penerima | `combobox` / Penerima | `edit-lelang-penerima` | Sesuai state/status pada REQ terkait |
| PIC Penerima | `textbox` / PIC Penerima | `edit-lelang-pic-penerima` | Required; dropdown searchable atau textbox; PIC editable |
| No. WhatsApp PIC Penerima | `textbox` / No. WhatsApp PIC Penerima | `edit-lelang-no-whatsapp-pic-penerima` | Required; dropdown searchable atau textbox; PIC editable |
| Catatan Penerima | `textbox` / Catatan Penerima | `edit-lelang-catatan-penerima` | Sesuai state/status pada REQ terkait |
| Provinsi Tujuan | `textbox` / Provinsi Tujuan | `edit-lelang-provinsi-tujuan` | Auto dari master; disabled |
| Kota/Kab Tujuan | `textbox` / Kota/Kab Tujuan | `edit-lelang-kota-kab-tujuan` | Auto dari master; disabled |
| Kecamatan Tujuan | `textbox` / Kecamatan Tujuan | `edit-lelang-kecamatan-tujuan` | Auto dari master; disabled |
| Desa/Kelurahan Tujuan | `textbox` / Desa/Kelurahan Tujuan | `edit-lelang-desa-kelurahan-tujuan` | Auto dari master; disabled |
| Kode Pos Tujuan | `textbox` / Kode Pos Tujuan | `edit-lelang-kode-pos-tujuan` | Auto dari master; disabled |
| Alamat Tujuan | `textbox` / Alamat Tujuan | `edit-lelang-alamat-tujuan` | Auto dari master; disabled |

### tambah-peserta — Edit Peserta Lelang

Sumber: 040.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Ringkasan Lelang | `region` / Ringkasan Lelang | `tambah-peserta-ringkasan-lelang` | Sesuai state/status pada REQ terkait |
| Syarat & Ketentuan | `button` / Syarat & Ketentuan | `tambah-peserta-syarat-ketentuan` | Sesuai state/status pada REQ terkait |
| Dokumen Tambahan | `link` / Dokumen Tambahan | `tambah-peserta-dokumen-tambahan` | Sesuai state/status pada REQ terkait |
| Pilih Semua | `button` / Pilih Semua | `tambah-peserta-pilih-semua` | Sesuai state/status pada REQ terkait |
| Cari nama vendor | `textbox` / Cari nama vendor | `tambah-peserta-cari-nama-vendor` | Placeholder Cari nama vendor |
| Semua Kota | `combobox` / Semua Kota | `tambah-peserta-semua-kota` | Sesuai state/status pada REQ terkait |
| Semua Rating | `combobox` / Semua Rating | `tambah-peserta-semua-rating` | Dari spec; state ini tidak terlihat pada PNG |
| Vendor | `checkbox` / Vendor | `tambah-peserta-vendor` | Sesuai state/status pada REQ terkait |
| Counter Vendor | `status` / Counter Vendor | `tambah-peserta-counter-vendor` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `tambah-peserta-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `tambah-peserta-halaman-berikutnya` | Sesuai state/status pada REQ terkait |
| Batal | `button` / Batal | `tambah-peserta-batal` | Sesuai state/status pada REQ terkait |
| Simpan | `button` / Simpan | `tambah-peserta-simpan` | Sesuai state/status pada REQ terkait |

### harga-penawaran — Detail Harga Penawaran

Sumber: 039.png, 58.png, 044.png, 048.png, 052.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Lelang Ulang | `button` / Lelang Ulang | `harga-penawaran-lelang-ulang` | Sesuai state/status pada REQ terkait |
| Ajukan Nego | `button` / Ajukan Nego | `harga-penawaran-ajukan-nego` | Sesuai state/status pada REQ terkait |
| Filter | `button` / Filter | `harga-penawaran-filter` | Sesuai state/status pada REQ terkait |
| Vendor | `combobox` / Vendor | `harga-penawaran-vendor` | Sesuai state/status pada REQ terkait |
| Jenis Armada | `combobox` / Jenis Armada | `harga-penawaran-jenis-armada` | Required; dropdown searchable atau textbox; PIC editable |
| Target Waktu Perjalanan | `spinbutton` / Target Waktu Perjalanan | `harga-penawaran-target-waktu-perjalanan` | Sesuai state/status pada REQ terkait |
| Urutkan | `button` / Urutkan | `harga-penawaran-urutkan` | Sesuai state/status pada REQ terkait |
| Reset | `button` / Reset | `harga-penawaran-reset` | Sesuai state/status pada REQ terkait |
| Terapkan | `button` / Terapkan | `harga-penawaran-terapkan` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `harga-penawaran-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `harga-penawaran-halaman-berikutnya` | Sesuai state/status pada REQ terkait |
| Detail Biaya | `tab` / Detail Biaya | `harga-penawaran-detail-biaya` | Sesuai state/status pada REQ terkait |
| Detail Armada | `tab` / Detail Armada | `harga-penawaran-detail-armada` | Sesuai state/status pada REQ terkait |
| Tab Vendor | `tab` / Tab Vendor | `harga-penawaran-tab-vendor` | Sesuai state/status pada REQ terkait |
| Lihat Profil | `link` / Lihat Profil | `harga-penawaran-lihat-profil` | Sesuai state/status pada REQ terkait |
| Pesan | `button` / Pesan | `harga-penawaran-pesan` | Sesuai state/status pada REQ terkait |
| N/A | `button` / N/A | `harga-penawaran-n-a` | Tidak dapat memesan; N/A terlihat, Expired dari spec |
| Expired | `button` / Expired | `harga-penawaran-expired` | Tidak dapat memesan; N/A terlihat, Expired dari spec |
| Card Penawaran | `article` / Card Penawaran | `harga-penawaran-card-penawaran` | Sesuai state/status pada REQ terkait |
| Countdown | `timer` / Countdown | `harga-penawaran-countdown` | Sesuai state/status pada REQ terkait |

### lelang-ulang — Lelang Ulang

Sumber: 041.png.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Ringkasan Lelang | `region` / Ringkasan Lelang | `lelang-ulang-ringkasan-lelang` | Sesuai state/status pada REQ terkait |
| Syarat & Ketentuan | `button` / Syarat & Ketentuan | `lelang-ulang-syarat-ketentuan` | Sesuai state/status pada REQ terkait |
| Data Pengirim | `button` / Data Pengirim | `lelang-ulang-data-pengirim` | Sesuai state/status pada REQ terkait |
| Data Penerima | `button` / Data Penerima | `lelang-ulang-data-penerima` | Sesuai state/status pada REQ terkait |
| Tanggal Tutup Lelang | `button` / Tanggal Tutup Lelang | `lelang-ulang-tanggal-tutup-lelang` | Sesuai state/status pada REQ terkait |
| Perlu Diketahui | `region` / Perlu Diketahui | `lelang-ulang-perlu-diketahui` | Sesuai state/status pada REQ terkait |
| Nilai Barang | `region` / Nilai Barang | `lelang-ulang-nilai-barang` | Sesuai state/status pada REQ terkait |
| Durasi Lelang | `combobox` / Durasi Lelang | `lelang-ulang-durasi-lelang` | Required; dropdown searchable atau textbox; PIC editable |
| Buka Lelang | `textbox` / Buka Lelang | `lelang-ulang-buka-lelang` | datetime; DD/MM/YYYY hh:mm; required |
| Tutup Lelang | `textbox` / Tutup Lelang | `lelang-ulang-tutup-lelang` | datetime; DD/MM/YYYY hh:mm; read-only |
| Pilih Semua | `button` / Pilih Semua | `lelang-ulang-pilih-semua` | Sesuai state/status pada REQ terkait |
| Cari nama vendor | `textbox` / Cari nama vendor | `lelang-ulang-cari-nama-vendor` | Placeholder Cari nama vendor |
| Semua Kota | `combobox` / Semua Kota | `lelang-ulang-semua-kota` | Sesuai state/status pada REQ terkait |
| Semua Rating | `combobox` / Semua Rating | `lelang-ulang-semua-rating` | Dari spec; state ini tidak terlihat pada PNG |
| Vendor | `checkbox` / Vendor | `lelang-ulang-vendor` | Sesuai state/status pada REQ terkait |
| Counter Vendor Baru | `status` / Counter Vendor Baru | `lelang-ulang-counter-vendor-baru` | Sesuai state/status pada REQ terkait |
| Tampilkan | `combobox` / Tampilkan | `lelang-ulang-tampilkan` | Sesuai state/status pada REQ terkait |
| Halaman Berikutnya | `button` / Halaman Berikutnya | `lelang-ulang-halaman-berikutnya` | Sesuai state/status pada REQ terkait |
| Batal | `button` / Batal | `lelang-ulang-batal` | Sesuai state/status pada REQ terkait |
| Simpan | `button` / Simpan | `lelang-ulang-simpan` | Sesuai state/status pada REQ terkait |

### batalkan-lelang — Batalkan Lelang

Sumber: spec.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Batalkan Lelang | `dialog` / Batalkan Lelang | `batalkan-lelang-batalkan-lelang` | Sesuai state/status pada REQ terkait |
| No. Lelang | `region` / No. Lelang | `batalkan-lelang-no-lelang` | Sesuai state/status pada REQ terkait |
| Pengirim | `region` / Pengirim | `batalkan-lelang-pengirim` | Sesuai state/status pada REQ terkait |
| Penerima | `region` / Penerima | `batalkan-lelang-penerima` | Sesuai state/status pada REQ terkait |
| Alasan Pembatalan | `textbox` / Alasan Pembatalan | `batalkan-lelang-alasan-pembatalan` | Sesuai state/status pada REQ terkait |
| Batalkan Order | `button` / Batalkan Order | `batalkan-lelang-batalkan-order` | Sesuai state/status pada REQ terkait |

### riwayat-perubahan — Riwayat Perubahan

Sumber: spec.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Riwayat Perubahan | `table` / Riwayat Perubahan | `riwayat-perubahan-riwayat-perubahan` | Sesuai state/status pada REQ terkait |

### riwayat-lelang-ulang — Riwayat Lelang Ulang

Sumber: spec.

| Elemen / label text | Role + name yang diusulkan | data-testid usulan | Tipe/state/placeholder |
|---|---|---|---|
| Riwayat Lelang Ulang | `table` / Riwayat Lelang Ulang | `riwayat-lelang-ulang-riwayat-lelang-ulang` | Sesuai state/status pada REQ terkait |

### State dan temuan visual

- 032: daftar campuran FCL/FTL, status, legend biru Proses Nego dan ungu Lelang Ulang, draft abu/oranye/merah; card memuat nomor, rute, jenis, periode, penawaran, pengirim/penerima; draft menambah terakhir disimpan, data terisi, kedaluwarsa.
- 033/034: asuransi checked, jenis armada tags dan dropdown dengan checkbox/Pilih Semua, alamat disabled. 043/047/051 masing-masing Multipickup/Multidrop/Multipoint, label Muat/Bongkar, ikon hapus dan banner urutan.
- 035/040/041: vendor dipilih dan belum dipilih, vendor Input Penawaran abu/disabled, counter vendor; label tombol Pilih semua 30 peserta bergantung jumlah. Rating/filter rating tidak terlihat meskipun diwajibkan spec.
- 036: detail normal, tabel peserta dengan status Belum Input/Input Penawaran dan tanggal kosong tanda dash; section expanded. 044/048/052: detail multipoint dengan label Muat/Bongkar dan harga.
- 038/045/049/053: form edit dengan tambah/hapus yang bertentangan aturan isi-baris/read-only tipe. 041: pengirim/penerima collapsed, informasi penguncian harga dan tanggal ulang.
- 039/58: filter Vendor, Jenis Armada, Target Waktu Perjalanan, tab biaya/armada/vendor dan Pesan/N/A. Nilai pajak gambar adalah contoh tampilan, bukan tarif yang dihardcode.
- Tidak ada screenshot error required, toast sukses, dialog batal, loading, countdown, Expired, popup rute atau riwayat. State tersebut diturunkan dari spec, teks persisnya perlu binding implementasi. Sidebar global di luar cakupan alur modul ini.

### Kontrak codegen

Steps hanya memakai enum resmi. `expect` menyimpan assertion semantik di value (termasuk absence, read-only, nilai, urutan, network), sehingga codegen harus memilih matcher yang sesuai; tidak cukup selalu toBeVisible. Upload disiapkan melalui fixture file chooser/setInputFiles sesudah klik Pilih File dan sebelum assertion; enum tidak memiliki upload. `select` untuk custom combobox/multiselect perlu adapter klik opsi, bukan selectOption native. Scope baris/penawaran dinyatakan di testData dan target. Jam, backend race, email/push memakai fixture uji. Belum ada URL/DOM aplikasi yang diuji dalam run ini.

## Assumptions Log

- A01: Konflik sumber salinan menyebut FCL di modul FTL: gunakan FTL mengikuti jenis pengiriman terpilih; sumber FCL dikecualikan.
- A02: Konflik Edit memperbolehkan tambah/hapus tetapi menyatakan hanya isi baris boleh berubah dan tipe read-only: jumlah baris dibekukan saat edit; tambah/hapus hanya pada pembuatan.
- A03: Konflik pembatalan semua status versus daftar status eksplisit: gunakan Belum Buka, Sedang Buka, Tutup tanpa order; Aktif/Selesai ditolak sampai klarifikasi produk.
- A04: Tutup dan Aktif bertumpang tindih: tutup merupakan fase bidding berakhir; Aktif merupakan kondisi dapat order hingga akhir kirim. Fixture memisahkan status untuk matriks aksi; aturan transisi persis perlu konfirmasi.
- A05: FTL tidak memiliki tahap jadwal: status Input Penawaran ditentukan input harga yang valid; frasa harga & jadwal dianggap sisa spesifikasi jenis lain.
- A06: Aksi tidak relevan tetap terlihat dengan alert; tombol Edit di detail dan Riwayat Lelang Ulang mengikuti pengecualian tampil eksplisit. Disabled ber-alert diasumsikan aria-disabled, bukan native disabled yang tidak menerima klik.
- A07: Waktu uji dibekukan pada 22/09/2026 10:00 Asia/Jakarta. Batas tutup dianggap now >= tutup; akhir kirim masih valid pada kesetaraan karena larangan berlaku setelah melewati. Rentang 90 hari memakai selisih tanggal.
- A08: Batas 4MB sementara 4 × 1024 × 1024 byte; Jumlah Armada diasumsikan bilangan bulat, Nilai Barang nonnegatif. Tidak mengarang batas panjang teks, WhatsApp, jumlah baris atau SLA.
- A09: Pilih Semua diasumsikan seluruh vendor eligible lintas halaman, dengan langganan vendor baru selama Belum/Sedang Buka; vendor inaktif/non-FTL/dikelola shipper tetap dikecualikan.
- A10: Ranking jenis armada tie-break diasumsikan nama A–Z. Label urutan 1 termurah bertentangan dengan tanggal efektif utama: urutan mengikuti ranking eksplisit; badge termurah memerlukan konfirmasi.
- A11: Tarif, pembulatan dan tanda PPN/PPh mengikuti konfigurasi sistem; fixture pajak harus memasok oracle independen, tanpa mengasumsikan tarif hukum.
- A12: Notifikasi, jam sistem, scheduler draft, bidding vendor, audit dan OMS membutuhkan fixture/integrasi uji; tidak mengirim notifikasi sungguhan. Autentikasi admin shipper dan isolasi tenant disiapkan sebagai precondition.
- A13: Tidak ada extras. Selector/testid, teks error yang tidak terlihat desain, URL, batas performa dan perilaku gangguan jaringan merupakan usulan; diperlukan binding implementasi sebelum eksekusi Playwright.
- A14: Negosiasi, pembuatan order, profil vendor dan Riwayat Pembatalan diuji sampai titik integrasi; alur internal modul terpisah di luar cakupan.
- A15: Desain berkonflik dengan spec: draft menampilkan nomor; harga terlihat ketika Sedang Buka; label detail Muat/Bongkar versus Pick Up/Drop Off; breadcrumb ulang Request Jadwal; helper salinan mengecualikan data opsional; filter generik OMS/skema pada 044/048/052; edit punya tambah/hapus. Gunakan aturan spec dan interpretasi A02, bukan menyalin contoh yang bertentangan.
- A16: TOP muncul read-only pada detail tetapi tidak ada rule input: tampilkan nilai fixture bila tersedia, kosong menjadi tanda dash; jangan menambah field wajib TOP. Filter list terlihat tetapi isi panel tidak tersedia: uji buka/tutup saja.
- A17: Buka Lelang lama saat edit Sedang Buka dibiarkan bila tidak diubah; aturan tidak di masa lalu berlaku untuk nilai baru. Ini mencegah edit valid tertolak seluruhnya dan perlu konfirmasi produk.
- A18: Proteksi tenant, whitespace required, input markup sebagai teks, penanganan konflik/timeout, idempotensi retry, dan integritas di bawah beban adalah ekspektasi QA tambahan. Fixture menentukan kejadian; tidak mengklaim protokol retry/locking tertentu sudah ada. Ambang SLA dan batas total upload/teks belum ditentukan.
- A19: Warna sebelum H-3 diasumsikan netral mengikuti contoh draft; nilai H-2/H-1 belum ditegaskan spec. Jam dan tanggal kedaluwarsa memakai timezone tenant; job pembersihan ditunggu lewat fixture.
