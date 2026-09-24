# Analysis — ams001-buat-lelang-fcl-shipper

## Requirements

Sumber: `inputs/ams001-buat-lelang-fcl-shipper/spec.txt`. Aktor utama admin shipper pemilik lelang; vendor sebagai aktor fixture/integrasi; sistem mengatur waktu, nomor, audit dan notifikasi. Akses antar shipper ditolak (asumsi robustness).

Alur utama: List → Buat FCL → Informasi Umum → Peserta → Simpan → List/Detail → Harga → OMS. Alternatif: draf tiap step, batal form, edit, tambah peserta, pembatalan, lelang ulang dan riwayat.

| REQ | Acceptance criterion / aturan | Layar |
|---|---|---|
| REQ-001 | Nomor lelang otomatis sesuai PGR hanya saat submit. Valid: Nomor unik sesuai PGR dibuat dan tersimpan. Invalid/pengecualian: Draf tersimpan tanpa nomor lelang final. | peserta-lelang |
| REQ-002 | Order berulang selama rentang kirim. Valid: Buat Order menerima data P1; order O2 dapat dibuat dan lelang tetap Aktif. Invalid/pengecualian: Order baru ditolak dan penawaran N/A. | harga-penawaran |
| REQ-003 | Audit seluruh perubahan data. Valid: Audit mencatat PIC Budi menjadi Sari, user dan waktu. Invalid/pengecualian: Perubahan gagal tidak dicatat sebagai perubahan berhasil; data lama tetap. | edit-lelang |
| REQ-004 | Status otomatis berdasarkan waktu. Valid: Badge Sedang Buka; penawaran dapat diinput vendor. Invalid/pengecualian: Badge Belum Buka; harga tidak bocor dan pesan Lelang belum dibuka. | list-lelang |
| REQ-005 | Tab dan counter berdasarkan proses aktif. Valid: Counter 2/3/2; tiap tab hanya memuat kelompok yang sesuai. Invalid/pengecualian: Lelang historis tidak tampil dan counter 0. | list-lelang |
| REQ-006 | Legend warna dan badge tambahan. Valid: Border sesuai legend; Tidak Ada Penawaran dan Tidak Ada Order sesuai data. Invalid/pengecualian: Tidak ada badge Tidak Ada Penawaran atau Tidak Ada Order palsu. | list-lelang |
| REQ-007 | Rute normal dan popup multipoint. Valid: Popup Detail Multipickup/Detail Multidrop memuat kota, drop point, alamat sesuai urutan. Invalid/pengecualian: Rute Kota Asal ke Kota Tujuan; tidak ada link multipoint palsu. | list-lelang |
| REQ-008 | Kedaluwarsa draf berdasarkan konfigurasi. Valid: Draf masih tampil dengan indikator Hari ini. Invalid/pengecualian: Draf tidak tampil dan tidak dapat dilanjutkan. | list-lelang |
| REQ-009 | Menu aksi sesuai status dan riwayat. Valid: Detail, Edit Data, Tambah Peserta Lelang, Batalkan Lelang, Riwayat Lelang Ulang, Riwayat Perubahan tersedia. Invalid/pengecualian: Edit ditolak dengan alert; Riwayat Lelang Ulang tidak tampil. | list-lelang |
| REQ-010 | Draf hanya dapat dilanjutkan atau dihapus. Valid: Form dilanjutkan dengan data parsial; menu hanya Edit Data dan Hapus Draft. Invalid/pengecualian: Draf D1 hilang dan tidak dapat disubmit dari halaman lama. | list-lelang |
| REQ-011 | Pagination default 20 dan Tampilkan. Valid: Halaman awal 20 data, halaman kedua 1; tidak ada duplikasi. Invalid/pengecualian: Empty state dan navigasi halaman berikutnya tidak menghasilkan data palsu. | list-lelang |
| REQ-012 | Form dua tahap dan jenis FCL. Valid: Step 01 Informasi Umum aktif, step 02 Peserta Lelang berikutnya, field FCL tampil. Invalid/pengecualian: Tetap step 01; field wajib diberi helper, border error, scroll error pertama. | informasi-umum |
| REQ-013 | Batal dengan konfirmasi tanpa simpan. Valid: Kembali ke list tanpa lelang atau draf baru. Invalid/pengecualian: Tetap pada form dan input tidak hilang. | informasi-umum |
| REQ-014 | Draft step 1 tanpa required. Valid: Draf Isi Informasi Umum dapat dibuka kembali dengan deskripsi tersimpan. Invalid/pengecualian: Tidak lanjut ke step 2 dan tidak membuat lelang final. | informasi-umum |
| REQ-015 | Persistensi step 1 ketika kembali. Valid: Semua nilai step 1 termasuk baris, metode, biaya dan dokumen tetap. Invalid/pengecualian: Validasi kembali dijalankan dan step 2 tidak terbuka. | peserta-lelang |
| REQ-016 | Reuse daftar milik shipper FCL non-draf. Valid: Hanya lelang FCL non-draf milik A tersedia tanpa periode. Invalid/pengecualian: Data Lelang wajib ditandai error. | informasi-umum |
| REQ-017 | Periode reuse maksimal 90 hari. Valid: Pilihan terfilter tanggal dibuat, rentang 90 hari inklusif diterima. Invalid/pengecualian: Rentang 91 hari ditolak; tidak mengambil hasil di luar batas. | informasi-umum |
| REQ-018 | Reuse menyalin data selain lima field waktu. Valid: Informasi umum, syarat, semua baris tersalin; Durasi/Buka/Tutup/Awal/Akhir tidak disalin. Invalid/pengecualian: Tidak dapat lanjut sebelum jadwal baru valid; tanggal sumber tidak menjadi nilai form. | informasi-umum |
| REQ-019 | Hasil reuse dapat diubah dan tetap saat uncheck. Valid: Field periode dan sumber hilang; Barang revisi dan data lain tetap. Invalid/pengecualian: Tidak muncul error Data Lelang wajib; validasi hanya field form aktif. | informasi-umum |
| REQ-020 | Pelabuhan aktif, searchable, asal berbeda tujuan. Valid: Dua pelabuhan aktif berbeda diterima. Invalid/pengecualian: Asal sama tujuan ditolak; master nonaktif X tidak tersedia. | informasi-umum |
| REQ-021 | Durasi dari pengaturan dan tutup otomatis. Valid: Tutup 23/09/2026 12:00 read-only; pilihan sesuai pengaturan. Invalid/pengecualian: Durasi wajib error dan Tutup tidak dapat diisi manual. | informasi-umum |
| REQ-022 | Buka lelang tidak lebih kecil dari sekarang. Valid: Tanggal masa depan diterima. Invalid/pengecualian: Buka masa lalu ditolak tanpa submit. | informasi-umum |
| REQ-023 | Rencana awal tidak sebelum tutup. Valid: Awal sama dengan Tutup diterima. Invalid/pengecualian: Awal sebelum Tutup ditolak. | informasi-umum |
| REQ-024 | Rencana akhir tidak sebelum awal. Valid: Akhir sama dengan Awal diterima. Invalid/pengecualian: Akhir sebelum Awal ditolak. | informasi-umum |
| REQ-025 | Jumlah kontainer opsional minimal satu. Valid: Jumlah 1 diterima. Invalid/pengecualian: Jumlah 0 ditolak. | informasi-umum |
| REQ-026 | Jenis kontainer multi-select master aktif. Valid: Dua tag tersimpan, master X tidak tersedia. Invalid/pengecualian: Minimal satu jenis kontainer wajib. | informasi-umum |
| REQ-027 | Metode wajib dan card syarat bersyarat. Valid: Hanya satu metode terpilih dan card Syarat & Ketentuan muncul. Invalid/pengecualian: Metode wajib error; card syarat belum tampil. | informasi-umum |
| REQ-028 | Asuransi dan rentang nilai barang. Valid: Nilai wajib diterima dan diformat ribuan. Invalid/pengecualian: Maksimum kurang dari minimum ditolak. | informasi-umum |
| REQ-029 | Biaya terkunci mengikuti empat metode. Valid: THC dan LOLO kedua sisi serta Trucking kedua sisi tercentang disabled. Invalid/pengecualian: Trucking wajib tidak dapat di-uncheck dengan keyboard maupun pointer. | informasi-umum |
| REQ-030 | Biaya opsional dan reset saat ganti metode. Valid: Hanya THC/LOLO kedua sisi wajib; pilihan Buruh Muat dan Trucking direset. Invalid/pengecualian: Tidak menuntut Trucking Tujuan sebagai biaya wajib. | informasi-umum |
| REQ-031 | Lainnya minimal satu multi-tag. Valid: Dua tag biaya tersimpan. Invalid/pengecualian: Minimal satu tag biaya wajib error. | informasi-umum |
| REQ-032 | Biaya shipper diwariskan ke penawaran vendor. Valid: Biaya Termasuk sama dengan konfigurasi shipper. Invalid/pengecualian: Perubahan biaya vendor ditolak; biaya shipper tetap menjadi acuan. | harga-penawaran |
| REQ-033 | Upload multi-file maksimum 4 MB format terbatas. Valid: Keempat file terunggah dan tampil terpisah. Invalid/pengecualian: Format exe ditolak dan tidak menjadi lampiran tersimpan. | informasi-umum |
| REQ-034 | Hapus dan unduh lampiran. Valid: File dapat dilihat/diunduh dengan isi sama fixture. Invalid/pengecualian: b.pdf tidak tampil dan tidak dapat diunduh lewat lelang. | detail-lelang |
| REQ-035 | Baris default dan tipe otomatis. Valid: Satu pengirim dan satu penerima, tipe Normal otomatis, tanpa label nomor dan ikon hapus. Invalid/pengecualian: Baris terakhir tidak dapat dihapus dan tipe tidak dapat dipilih manual. | informasi-umum |
| REQ-036 | Tambah hapus baris dan renumber. Valid: Tersisa A C sebagai Pick Up 1/2; banner urutan tampil; tipe Multipickup. Invalid/pengecualian: Kembali satu pengirim tanpa label/ikon; tidak ada data B tersisa. | informasi-umum |
| REQ-037 | Drop point dan pihak saling terkait. Valid: Pengirim A dan alamat/PIC master auto terisi. Invalid/pengecualian: DP-A tidak tersedia; hanya drop point milik B pada shipper aktif. | informasi-umum |
| REQ-038 | Alamat master read-only PIC dapat diubah. Valid: PIC/WhatsApp dapat diedit; Provinsi/Kota/Kecamatan/Desa/Kode Pos/Alamat read-only. Invalid/pengecualian: Karakter selain angka ditolak; tidak tersimpan sebagai nomor valid. | informasi-umum |
| REQ-039 | Drop point unik di seluruh lelang. Valid: Dua drop point unik diterima. Invalid/pengecualian: Duplikasi lintas pengirim/penerima ditolak. | informasi-umum |
| REQ-040 | Vendor aktif FCL filter dan rating. Valid: V1 tampil dengan kota/jumlah menang; default rating menurun. Invalid/pengecualian: Empty state; tidak menampilkan vendor nonaktif/FTL/hasil stale. | peserta-lelang |
| REQ-041 | Multi-select counter lintas pagination. Valid: Counter 2; kembali halaman pertama V1 tetap terpilih. Invalid/pengecualian: Counter 1 dan V21 tidak ikut undangan. | peserta-lelang |
| REQ-042 | Pilih semua mencakup vendor baru eligible. Valid: V31 otomatis menjadi peserta tanpa tambah manual. Invalid/pengecualian: Vendor baru yang tidak eligible tidak otomatis diundang. | peserta-lelang |
| REQ-043 | Simpan wajib vendor dan efek sukses. Valid: Belum Buka, toast sukses, kembali list, email/push V1 dan jadwal live bidding aktif. Invalid/pengecualian: Error minimal satu vendor, tidak ada nomor/notifikasi/jadwal baru. | peserta-lelang |
| REQ-044 | Draf step 2 substatus peserta. Valid: Draf Isi Peserta Lelang menyimpan data step 1 dan pilihan vendor. Invalid/pengecualian: Tidak ada undangan atau live bidding untuk draf. | peserta-lelang |
| REQ-045 | Detail lengkap read-only collapsible. Valid: Section dapat collapse/expand; data sesuai simpan, tipe dan badge benar, kosong ditampilkan -. Invalid/pengecualian: Semua data read-only dan tombol Edit Data tidak tampil. | detail-lelang |
| REQ-046 | Status peserta dan total penawaran. Valid: Tabel No/Vendor/Tanggal Terkirim/Tanggal Penawaran/Status; total 1 dari 3 Vendor. Invalid/pengecualian: V2 tidak dihitung sebagai Input Penawaran; total tetap 1 dari 3. | detail-lelang |
| REQ-047 | Filter cari sorting tabel peserta. Valid: Filter dan pencarian beririsan; kolom mengurut sesuai arah indikator. Invalid/pengecualian: Tabel kosong tanpa mengubah total peserta lelang. | detail-lelang |
| REQ-048 | Edit hanya Belum Buka atau Sedang Buka. Valid: Revisi tersimpan, audit lengkap, semua vendor undangan menerima notifikasi perubahan. Invalid/pengecualian: Perubahan ditolak server dan tidak ada notifikasi perubahan sukses. | edit-lelang |
| REQ-049 | Edit jenis tipe metode read-only dan baris tetap. Valid: Isi baris berubah; jenis FCL, tipe Multipickup, metode tetap read-only. Invalid/pengecualian: Tidak dapat mengubah jumlah baris atau metode; tipe tidak berubah. | edit-lelang |
| REQ-050 | Tambah peserta penguncian vendor lama. Valid: V1 keluar, V4 masuk; counter benar; hanya V1/V4 menerima notifikasi. Invalid/pengecualian: Vendor yang sudah input harga/penawaran tidak dapat dikeluarkan. | tambah-peserta |
| REQ-051 | Tambah peserta dibatasi status. Valid: V4 ditambahkan dan menerima undangan; ringkasan read-only. Invalid/pengecualian: Simpan ditolak dan peserta tidak berubah. | tambah-peserta |
| REQ-052 | Pembatalan wajib alasan dan tanpa order. Valid: Status Dibatalkan tetap di list dan masuk Riwayat Pembatalan. Invalid/pengecualian: Error alasan wajib, status tidak berubah. | batalkan-lelang |
| REQ-053 | Pembatalan ditolak jika order sudah ada. Valid: Pembatalan berhasil dan tercatat. Invalid/pengecualian: Pembatalan ditolak dan order O1 tetap utuh. | batalkan-lelang |
| REQ-054 | Aksi lelang dibatalkan terkunci. Valid: Detail dan riwayat dapat diakses. Invalid/pengecualian: Semua aksi mutasi terkunci; lelang tidak berubah oleh waktu. | list-lelang |
| REQ-055 | Kerahasiaan harga sebelum tutup. Valid: Harga tampil setelah tutup. Invalid/pengecualian: Pesan Lelang sedang dibuka; nilai penawaran tidak terlihat. | harga-penawaran |
| REQ-056 | Ranking penawaran enam tingkat. Valid: Efektif terbaru, harga terendah, closing terdekat, rating tertinggi, menang terbanyak, nama kapal menaik. Invalid/pengecualian: Murah efektif lama tidak mengalahkan efektif terbaru. | harga-penawaran |
| REQ-057 | Kartu harga pajak dan detail biaya. Valid: Total sesuai kalkulasi konfigurasi; label Termasuk PPN & PPh; rincian pajak, efektif, biaya, deskripsi tampil. Invalid/pengecualian: Total tidak sekadar DPP dan pajak tidak dihitung dua kali. | harga-penawaran |
| REQ-058 | Jadwal kapal connecting dan vendor. Valid: Badge 2x Connecting dan urutan pelabuhan/kapal/voyage/ETD/ETA benar; profil vendor sesuai. Invalid/pengecualian: Open/Closing/ETD/ETA -; tab Detail Kapal tidak tampil; Pesan Belum Input Jadwal disabled. | harga-penawaran |
| REQ-059 | Pesan hanya harga dan jadwal masih valid. Valid: Buat Order menerima data lelang dan penawaran P1 otomatis. Invalid/pengecualian: N/A dan alert closing lewat; tidak ada order dibuat. | harga-penawaran |
| REQ-060 | Pesan bebas ranking dan notifikasi vendor lain. Valid: Buat Order untuk P2; setelah order, V1 menerima email penawaran belum terpilih, V3 tidak. Invalid/pengecualian: N/A; harga lama tidak dapat dipesan walaupun pernah berperingkat1. | harga-penawaran |
| REQ-061 | Nego dan request jadwal integrasi modul. Valid: Masuk modul terkait membawa ID lelang/penawaran; setelah proses aktif warna list sesuai. Invalid/pengecualian: Aksi tidak berjalan dan alert sesuai status; tidak membuat nego baru. | harga-penawaran |
| REQ-062 | Lelang ulang eligibility dan nomor tetap. Valid: Lelang ulang memakai FCL-A tanpa nomor baru. Invalid/pengecualian: Permintaan lelang ulang kedua ditolak. | lelang-ulang |
| REQ-063 | Lelang ulang data read-only dan jadwal wajib. Valid: Tutup 11:00 read-only; Nilai Barang tampil; pengirim/penerima default collapsed dan info statis tampil. Invalid/pengecualian: Buka masa lalu ditolak. | lelang-ulang |
| REQ-064 | Tutup lelang ulang tidak lewat akhir kirim. Valid: Tutup sama akhir kirim diterima. Invalid/pengecualian: Tutup lewat akhir kirim ditolak. | lelang-ulang |
| REQ-065 | Peserta lelang ulang lama terkunci baru opsional. Valid: V1/V2 tetap ikut; boleh tanpa vendor baru, counter vendor baru 0. Invalid/pengecualian: Tidak dapat menghapus vendor yang sudah menawar. | lelang-ulang |
| REQ-066 | Efek simpan lelang ulang dan riwayat. Valid: Belum Buka, tab/counter/warna lelang ulang aktif; email/push ke semua peserta; riwayat tanggal/vendor/user/waktu. Invalid/pengecualian: Tidak ada riwayat sukses, notifikasi, atau penanda proses palsu. | lelang-ulang |
| REQ-067 | Expired harga lama hanya ketika vendor update. Valid: Harga lama V1 Expired; harga baru V1 dan harga lama V2 masih aktif. Invalid/pengecualian: Order ditolak dengan label Expired; harga lama V2 tidak ikut expired. | harga-penawaran |
| REQ-068 | Lelang ulang berjalan menyembunyikan baru mengunci lama. Valid: State proses lelang ulang dan countdown; harga baru tersembunyi. Invalid/pengecualian: Order dan nego ditolak selama proses lelang ulang. | harga-penawaran |
| REQ-069 | Akhir lelang ulang menggabungkan harga aktif. Valid: Harga aktif baru V1 dan lama V2 tampil; Tutup/Aktif; keluar tab lelang ulang. Invalid/pengecualian: Harga expired tidak tampil sebagai harga aktif atau dapat dipesan. | harga-penawaran |
| REQ-070 | Filter list dari desain dan reset. Valid: Hanya FCL-A sesuai filter tampil. Invalid/pengecualian: Hasil awal kosong; setelah reset seluruh data kembali. | filter-lelang |
| REQ-071 | Otorisasi shipper dan isolasi klien. Valid: Data A terbaca sesuai hak akses. Invalid/pengecualian: Akses ditolak tanpa bocor detail, dokumen, peserta, atau harga. | detail-lelang |

### Validasi field

Wajib: Pelabuhan Asal/Tujuan (aktif dan berbeda), Durasi (konfigurasi), Buka ≥ sekarang, Awal ≥ Tutup, Akhir ≥ Awal, Jenis Kontainer ≥1 aktif, Metode tepat satu; tiap baris Drop Point, Pengirim/Penerima, PIC, WhatsApp angka. Bersyarat: Data Lelang saat reuse, min/max saat asuransi (max ≥ min), tag saat Lainnya, ≥1 vendor saat submit, alasan saat batal. Opsional: periode reuse ≤90 hari, jumlah kontainer integer ≥1 bila diisi, deskripsi, catatan per baris/tambahan, dokumen format jpg/jpeg/png/pdf ≤4MB per file. Draft tidak memvalidasi required. Tidak ada maksimum baris; tutup dan alamat master read-only.

## UI Inventory

Seluruh 31 PNG dibuka melalui contact sheet; 024 dibuka tersendiri dan form/ulang diperbesar untuk detail. 001,020,024,028: list; 002: filter; 003-pop-up: multipickup; 004-form-default,005,006,007: form empat metode/reuse; 008: peserta; 009,010: detail/status peserta; 011: edit; 012,013,014: empty/state harga; 015,016: harga/filter/sort/detail tab; 017: edit peserta; 018: batal; 019: ulang; 021,022,023: multipickup buat/edit/detail; 025,026,027: multidrop buat/edit/detail; 029,030,031: multipoint buat/edit/detail.

Role/name adalah kandidat ARIA, bukan hasil inspeksi DOM. Field berulang wajib scope card/indeks atau ID vendor; selector testid seluruhnya usulan. Error/loading tidak tampak lengkap pada mockup sehingga state tersebut diturunkan dari spec.

### list-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Buat Lelang | button | `list-lelang--buat-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Riwayat Pembatalan | button | `list-lelang--riwayat-pembatalan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Filter | button | `list-lelang--filter` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Menu aksi | button | `list-lelang--menu-aksi` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman berikutnya | button | `list-lelang--halaman-berikutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman sebelumnya | button | `list-lelang--halaman-sebelumnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman pertama | button | `list-lelang--halaman-pertama` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman terakhir | button | `list-lelang--halaman-terakhir` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Lelang | tab | `list-lelang--semua-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Lelang Ulang | tab | `list-lelang--lelang-ulang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Request Jadwal | tab | `list-lelang--request-jadwal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Draf | tab | `list-lelang--draf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tampilkan | combobox | `list-lelang--tampilkan` | Default 20 data |
| Detail | menuitem | `list-lelang--detail` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Edit Data | menuitem | `list-lelang--edit-data` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Tambah Peserta Lelang | menuitem | `list-lelang--tambah-peserta-lelang` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Batalkan Lelang | menuitem | `list-lelang--batalkan-lelang` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Riwayat Lelang Ulang | menuitem | `list-lelang--riwayat-lelang-ulang` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Riwayat Perubahan | menuitem | `list-lelang--riwayat-perubahan` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Hapus Draft | menuitem | `list-lelang--hapus-draft` | Tersedia/terlarang sesuai status; draf hanya edit/hapus |
| Multipickup | link | `list-lelang--multipickup` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Multidrop | link | `list-lelang--multidrop` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tutup popup | button | `list-lelang--tutup-popup` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Card lelang | region | `list-lelang--card-lelang` | Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data |
| Legend warna | region | `list-lelang--legend-warna` | Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data |
| Badge status | region | `list-lelang--badge-status` | Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data |
| Detail Multipickup | region | `list-lelang--detail-multipickup` | Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data |
| Detail Multidrop | region | `list-lelang--detail-multidrop` | Nomor, rute, jenis, periode, pengirim/penerima, total penawaran; draf tanggal simpan, kedaluwarsa, kelengkapan data |
| Lihat Penawaran | button | `list-lelang--lihat-penawaran` | Turunan spesifikasi; label/state perlu pemetaan DOM |

### filter-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| No. Lelang | textbox | `filter-lelang--no-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Buka Lelang | textbox | `filter-lelang--buka-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tutup Lelang | textbox | `filter-lelang--tutup-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Rencana Awal Kirim | textbox | `filter-lelang--rencana-awal-kirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Rencana Akhir Kirim | textbox | `filter-lelang--rencana-akhir-kirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Jenis Pengiriman | combobox | `filter-lelang--jenis-pengiriman` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tipe Pengiriman | combobox | `filter-lelang--tipe-pengiriman` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Status | combobox | `filter-lelang--status` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Kota Asal | combobox | `filter-lelang--kota-asal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Kota Tujuan | combobox | `filter-lelang--kota-tujuan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pelabuhan Asal | combobox | `filter-lelang--pelabuhan-asal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pelabuhan Tujuan | combobox | `filter-lelang--pelabuhan-tujuan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tidak Ada Order | checkbox | `filter-lelang--tidak-ada-order` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tidak Ada Penawaran | checkbox | `filter-lelang--tidak-ada-penawaran` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Lelang Ulang | checkbox | `filter-lelang--lelang-ulang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Filter | button | `filter-lelang--filter` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Reset | button | `filter-lelang--reset` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Terapkan | button | `filter-lelang--terapkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tutup filter | button | `filter-lelang--tutup-filter` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |

### informasi-umum

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| FTL | radio | `informasi-umum--ftl` | Single-select card; empat metode berbeda lock biaya |
| FCL | radio | `informasi-umum--fcl` | Single-select card; empat metode berbeda lock biaya |
| Door to Door | radio | `informasi-umum--door-to-door` | Single-select card; empat metode berbeda lock biaya |
| Door to CY | radio | `informasi-umum--door-to-cy` | Single-select card; empat metode berbeda lock biaya |
| CY to CY | radio | `informasi-umum--cy-to-cy` | Single-select card; empat metode berbeda lock biaya |
| CY to Door | radio | `informasi-umum--cy-to-door` | Single-select card; empat metode berbeda lock biaya |
| Gunakan data lelang yang pernah dibuat | checkbox | `informasi-umum--gunakan-data-lelang-yang-pernah-dibuat` | Biaya wajib checked disabled; lainnya opsional |
| Gunakan Asuransi | checkbox | `informasi-umum--gunakan-asuransi` | Biaya wajib checked disabled; lainnya opsional |
| THC Asal | checkbox | `informasi-umum--thc-asal` | Biaya wajib checked disabled; lainnya opsional |
| THC Tujuan | checkbox | `informasi-umum--thc-tujuan` | Biaya wajib checked disabled; lainnya opsional |
| LOLO Asal | checkbox | `informasi-umum--lolo-asal` | Biaya wajib checked disabled; lainnya opsional |
| LOLO Tujuan | checkbox | `informasi-umum--lolo-tujuan` | Biaya wajib checked disabled; lainnya opsional |
| Trucking Asal | checkbox | `informasi-umum--trucking-asal` | Biaya wajib checked disabled; lainnya opsional |
| Trucking Tujuan | checkbox | `informasi-umum--trucking-tujuan` | Biaya wajib checked disabled; lainnya opsional |
| Buruh Muat | checkbox | `informasi-umum--buruh-muat` | Biaya wajib checked disabled; lainnya opsional |
| Buruh Bongkar | checkbox | `informasi-umum--buruh-bongkar` | Biaya wajib checked disabled; lainnya opsional |
| Kawalan Muat | checkbox | `informasi-umum--kawalan-muat` | Biaya wajib checked disabled; lainnya opsional |
| Kawalan Bongkar | checkbox | `informasi-umum--kawalan-bongkar` | Biaya wajib checked disabled; lainnya opsional |
| Lainnya | checkbox | `informasi-umum--lainnya` | Biaya wajib checked disabled; lainnya opsional |
| Data Lelang | combobox | `informasi-umum--data-lelang` | Master searchable; kontainer multi tag; sumber hanya saat reuse |
| Pelabuhan Asal | combobox | `informasi-umum--pelabuhan-asal` | Master searchable; kontainer multi tag; sumber hanya saat reuse |
| Pelabuhan Tujuan | combobox | `informasi-umum--pelabuhan-tujuan` | Master searchable; kontainer multi tag; sumber hanya saat reuse |
| Durasi Lelang | combobox | `informasi-umum--durasi-lelang` | Master searchable; kontainer multi tag; sumber hanya saat reuse |
| Jenis Kontainer | combobox | `informasi-umum--jenis-kontainer` | Master searchable; kontainer multi tag; sumber hanya saat reuse |
| Periode Lelang Dibuat | textbox | `informasi-umum--periode-lelang-dibuat` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Buka Lelang | textbox | `informasi-umum--buka-lelang` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Rencana Awal Kirim | textbox | `informasi-umum--rencana-awal-kirim` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Rencana Akhir Kirim | textbox | `informasi-umum--rencana-akhir-kirim` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Deskripsi Barang | textbox | `informasi-umum--deskripsi-barang` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Catatan Tambahan | textbox | `informasi-umum--catatan-tambahan` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Tag biaya lainnya | textbox | `informasi-umum--tag-biaya-lainnya` | Tanggal placeholder DD/MM/YYYY hh:mm; textarea opsional; tag butuh Enter adapter |
| Tutup Lelang | textbox | `informasi-umum--tutup-lelang` | Read-only, auto Buka + Durasi |
| Jumlah Kontainer | spinbutton | `informasi-umum--jumlah-kontainer` | Jumlah opsional ≥1; nilai barang conditional dengan format rupiah, actual role perlu verifikasi |
| Nilai Barang minimum | spinbutton | `informasi-umum--nilai-barang-minimum` | Jumlah opsional ≥1; nilai barang conditional dengan format rupiah, actual role perlu verifikasi |
| Nilai Barang maksimum | spinbutton | `informasi-umum--nilai-barang-maksimum` | Jumlah opsional ≥1; nilai barang conditional dengan format rupiah, actual role perlu verifikasi |
| Batal | button | `informasi-umum--batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Konfirmasi batal | button | `informasi-umum--konfirmasi-batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Lanjut mengisi | button | `informasi-umum--lanjut-mengisi` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan ke Draft | button | `informasi-umum--simpan-ke-draft` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Selanjutnya | button | `informasi-umum--selanjutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pilih File | button | `informasi-umum--pilih-file` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Hapus dokumen a.pdf | button | `informasi-umum--hapus-dokumen-a-pdf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tambah Baris Input Pengirim | button | `informasi-umum--tambah-baris-input-pengirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tambah Baris Input Penerima | button | `informasi-umum--tambah-baris-input-penerima` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Hapus Pengirim 2 | button | `informasi-umum--hapus-pengirim-2` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Hapus Penerima 2 | button | `informasi-umum--hapus-penerima-2` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Syarat & Ketentuan | region | `informasi-umum--syarat-ketentuan` | Banner: Pastikan urutan pengiriman sudah sesuai |
| Banner urutan pengiriman | region | `informasi-umum--banner-urutan-pengiriman` | Banner: Pastikan urutan pengiriman sudah sesuai |
| Dokumen Tambahan | button | `informasi-umum--dokumen-tambahan` | Input file memakai label Dokumen Tambahan atau testid; setInputFiles hook, tombol terlihat Pilih File |
| Drop Point Asal 1 | combobox | `informasi-umum--drop-point-asal-1` | Scope card Pengirim dan indeks 1; searching master |
| Pengirim 1 | combobox | `informasi-umum--pengirim-1` | Scope card Pengirim dan indeks 1; searching master |
| PIC Pengirim 1 | textbox | `informasi-umum--pic-pengirim-1` | Auto draft PIC/WA editable; catatan opsional |
| No. WhatsApp PIC Pengirim 1 | textbox | `informasi-umum--no-whatsapp-pic-pengirim-1` | Auto draft PIC/WA editable; catatan opsional |
| Catatan Pengirim 1 | textbox | `informasi-umum--catatan-pengirim-1` | Auto draft PIC/WA editable; catatan opsional |
| Provinsi Pengirim 1 | textbox | `informasi-umum--provinsi-pengirim-1` | Auto master disabled; scope card/baris |
| Kota/Kab Pengirim 1 | textbox | `informasi-umum--kota-kab-pengirim-1` | Auto master disabled; scope card/baris |
| Kecamatan Pengirim 1 | textbox | `informasi-umum--kecamatan-pengirim-1` | Auto master disabled; scope card/baris |
| Desa/Kelurahan Pengirim 1 | textbox | `informasi-umum--desa-kelurahan-pengirim-1` | Auto master disabled; scope card/baris |
| Kode Pos Pengirim 1 | textbox | `informasi-umum--kode-pos-pengirim-1` | Auto master disabled; scope card/baris |
| Alamat Pengirim 1 | textbox | `informasi-umum--alamat-pengirim-1` | Auto master disabled; scope card/baris |
| Drop Point Tujuan 1 | combobox | `informasi-umum--drop-point-tujuan-1` | Scope card Penerima dan indeks 1; searching master |
| Penerima 1 | combobox | `informasi-umum--penerima-1` | Scope card Penerima dan indeks 1; searching master |
| PIC Penerima 1 | textbox | `informasi-umum--pic-penerima-1` | Auto draft PIC/WA editable; catatan opsional |
| No. WhatsApp PIC Penerima 1 | textbox | `informasi-umum--no-whatsapp-pic-penerima-1` | Auto draft PIC/WA editable; catatan opsional |
| Catatan Penerima 1 | textbox | `informasi-umum--catatan-penerima-1` | Auto draft PIC/WA editable; catatan opsional |
| Provinsi Penerima 1 | textbox | `informasi-umum--provinsi-penerima-1` | Auto master disabled; scope card/baris |
| Kota/Kab Penerima 1 | textbox | `informasi-umum--kota-kab-penerima-1` | Auto master disabled; scope card/baris |
| Kecamatan Penerima 1 | textbox | `informasi-umum--kecamatan-penerima-1` | Auto master disabled; scope card/baris |
| Desa/Kelurahan Penerima 1 | textbox | `informasi-umum--desa-kelurahan-penerima-1` | Auto master disabled; scope card/baris |
| Kode Pos Penerima 1 | textbox | `informasi-umum--kode-pos-penerima-1` | Auto master disabled; scope card/baris |
| Alamat Penerima 1 | textbox | `informasi-umum--alamat-penerima-1` | Auto master disabled; scope card/baris |
| Hapus Pengirim 1 | region | `informasi-umum--hapus-pengirim-1` | Turunan spesifikasi; label/state perlu pemetaan DOM |

### peserta-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Cari nama vendor | textbox | `peserta-lelang--cari-nama-vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Kota | combobox | `peserta-lelang--semua-kota` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Rating | combobox | `peserta-lelang--semua-rating` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tampilkan | combobox | `peserta-lelang--tampilkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pilih Semua | button | `peserta-lelang--pilih-semua` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman berikutnya | button | `peserta-lelang--halaman-berikutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman sebelumnya | button | `peserta-lelang--halaman-sebelumnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Batal | button | `peserta-lelang--batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan | button | `peserta-lelang--simpan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor V1 | checkbox | `peserta-lelang--vendor-v1` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V2 | checkbox | `peserta-lelang--vendor-v2` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V3 | checkbox | `peserta-lelang--vendor-v3` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V4 | checkbox | `peserta-lelang--vendor-v4` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V21 | checkbox | `peserta-lelang--vendor-v21` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Counter vendor | region | `peserta-lelang--counter-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Card vendor | region | `peserta-lelang--card-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Kembali | button | `peserta-lelang--kembali` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan ke Draft | button | `peserta-lelang--simpan-ke-draft` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pelabuhan Asal | combobox | `peserta-lelang--pelabuhan-asal` | Turunan spesifikasi; label/state perlu pemetaan DOM |
| Selanjutnya | button | `peserta-lelang--selanjutnya` | Turunan spesifikasi; label/state perlu pemetaan DOM |

### tambah-peserta

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Cari nama vendor | textbox | `tambah-peserta--cari-nama-vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Kota | combobox | `tambah-peserta--semua-kota` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Rating | combobox | `tambah-peserta--semua-rating` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tampilkan | combobox | `tambah-peserta--tampilkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pilih Semua | button | `tambah-peserta--pilih-semua` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman berikutnya | button | `tambah-peserta--halaman-berikutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman sebelumnya | button | `tambah-peserta--halaman-sebelumnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Batal | button | `tambah-peserta--batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan | button | `tambah-peserta--simpan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor V1 | checkbox | `tambah-peserta--vendor-v1` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V2 | checkbox | `tambah-peserta--vendor-v2` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V3 | checkbox | `tambah-peserta--vendor-v3` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V4 | checkbox | `tambah-peserta--vendor-v4` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V21 | checkbox | `tambah-peserta--vendor-v21` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Counter vendor | region | `tambah-peserta--counter-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Card vendor | region | `tambah-peserta--card-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Syarat & Ketentuan | button | `tambah-peserta--syarat-ketentuan` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Pengirim | button | `tambah-peserta--data-pengirim` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Penerima | button | `tambah-peserta--data-penerima` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Dokumen Tambahan a.pdf | link | `tambah-peserta--dokumen-tambahan-a-pdf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ringkasan lelang | region | `tambah-peserta--ringkasan-lelang` | Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber |

### lelang-ulang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Cari nama vendor | textbox | `lelang-ulang--cari-nama-vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Kota | combobox | `lelang-ulang--semua-kota` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Semua Rating | combobox | `lelang-ulang--semua-rating` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tampilkan | combobox | `lelang-ulang--tampilkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pilih Semua | button | `lelang-ulang--pilih-semua` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman berikutnya | button | `lelang-ulang--halaman-berikutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman sebelumnya | button | `lelang-ulang--halaman-sebelumnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Batal | button | `lelang-ulang--batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan | button | `lelang-ulang--simpan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor V1 | checkbox | `lelang-ulang--vendor-v1` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V2 | checkbox | `lelang-ulang--vendor-v2` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V3 | checkbox | `lelang-ulang--vendor-v3` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V4 | checkbox | `lelang-ulang--vendor-v4` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Vendor V21 | checkbox | `lelang-ulang--vendor-v21` | Scope vendor ID unik; nama pada mockup berulang. Locked bila sudah menawar pada edit peserta/ulang |
| Counter vendor | region | `lelang-ulang--counter-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Card vendor | region | `lelang-ulang--card-vendor` | Nama, kota, jumlah menang; counter total atau vendor baru pada ulang |
| Syarat & Ketentuan | button | `lelang-ulang--syarat-ketentuan` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Pengirim | button | `lelang-ulang--data-pengirim` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Penerima | button | `lelang-ulang--data-penerima` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Dokumen Tambahan a.pdf | link | `lelang-ulang--dokumen-tambahan-a-pdf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ringkasan lelang | region | `lelang-ulang--ringkasan-lelang` | Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber |
| Durasi Lelang | combobox | `lelang-ulang--durasi-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Buka Lelang | textbox | `lelang-ulang--buka-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tutup Lelang | textbox | `lelang-ulang--tutup-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Nilai Barang minimum | textbox | `lelang-ulang--nilai-barang-minimum` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Nilai Barang maksimum | textbox | `lelang-ulang--nilai-barang-maksimum` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Perlu Diketahui | region | `lelang-ulang--perlu-diketahui` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Riwayat Lelang Ulang | button | `lelang-ulang--riwayat-lelang-ulang` | Turunan spesifikasi; label/state perlu pemetaan DOM |

### detail-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Syarat & Ketentuan | button | `detail-lelang--syarat-ketentuan` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Pengirim | button | `detail-lelang--data-pengirim` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Penerima | button | `detail-lelang--data-penerima` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Dokumen Tambahan a.pdf | link | `detail-lelang--dokumen-tambahan-a-pdf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ringkasan lelang | region | `detail-lelang--ringkasan-lelang` | Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber |
| Peserta Lelang | button | `detail-lelang--peserta-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Edit Data | button | `detail-lelang--edit-data` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor | button | `detail-lelang--vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tanggal Terkirim | button | `detail-lelang--tanggal-terkirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tanggal Penawaran | button | `detail-lelang--tanggal-penawaran` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Status peserta | combobox | `detail-lelang--status-peserta` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tampilkan | combobox | `detail-lelang--tampilkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Cari nama vendor | textbox | `detail-lelang--cari-nama-vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tabel peserta | table | `detail-lelang--tabel-peserta` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |

### harga-penawaran

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Syarat & Ketentuan | button | `harga-penawaran--syarat-ketentuan` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Pengirim | button | `harga-penawaran--data-pengirim` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Data Penerima | button | `harga-penawaran--data-penerima` | Collapsible; pengirim/penerima default collapsed pada ulang |
| Dokumen Tambahan a.pdf | link | `harga-penawaran--dokumen-tambahan-a-pdf` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ringkasan lelang | region | `harga-penawaran--ringkasan-lelang` | Read-only termasuk jenis, tipe, metode, jadwal, status, TOP jika ada dari data sumber |
| Pesan | button | `harga-penawaran--pesan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pesan P2 | button | `harga-penawaran--pesan-p2` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pesan harga lama V1 | button | `harga-penawaran--pesan-harga-lama-v1` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ajukan Nego | button | `harga-penawaran--ajukan-nego` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Request Jadwal | button | `harga-penawaran--request-jadwal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Lelang Ulang | button | `harga-penawaran--lelang-ulang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Filter | button | `harga-penawaran--filter` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Urutan | button | `harga-penawaran--urutan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Reset | button | `harga-penawaran--reset` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Terapkan | button | `harga-penawaran--terapkan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Halaman berikutnya | button | `harga-penawaran--halaman-berikutnya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Detail Biaya | tab | `harga-penawaran--detail-biaya` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Detail Kapal | tab | `harga-penawaran--detail-kapal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor | tab | `harga-penawaran--vendor` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Info Connecting | tab | `harga-penawaran--info-connecting` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Lihat Profil | link | `harga-penawaran--lihat-profil` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Pelayaran | combobox | `harga-penawaran--pelayaran` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Vendor filter | combobox | `harga-penawaran--vendor-filter` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Jenis Kontainer | combobox | `harga-penawaran--jenis-kontainer` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Jenis Jadwal | combobox | `harga-penawaran--jenis-jadwal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Urutan penawaran | combobox | `harga-penawaran--urutan-penawaran` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| ETD | textbox | `harga-penawaran--etd` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| ETA | textbox | `harga-penawaran--eta` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Card penawaran | region | `harga-penawaran--card-penawaran` | State belum buka/sedang buka/belum ada penawaran/ulang countdown; N/A, Expired, Belum Input Jadwal; logo/pelayaran/open/closing/ETD/ETA/vendor/container/total |
| Harga Penawaran | region | `harga-penawaran--harga-penawaran` | State belum buka/sedang buka/belum ada penawaran/ulang countdown; N/A, Expired, Belum Input Jadwal; logo/pelayaran/open/closing/ETD/ETA/vendor/container/total |

### edit-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Deskripsi Barang | textbox | `edit-lelang--deskripsi-barang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| PIC Pengirim 1 | textbox | `edit-lelang--pic-pengirim-1` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Buka Lelang | textbox | `edit-lelang--buka-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Rencana Awal Kirim | textbox | `edit-lelang--rencana-awal-kirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Rencana Akhir Kirim | textbox | `edit-lelang--rencana-akhir-kirim` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Simpan | button | `edit-lelang--simpan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Batal | button | `edit-lelang--batal` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Riwayat Perubahan | button | `edit-lelang--riwayat-perubahan` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Jenis Pengiriman | region | `edit-lelang--jenis-pengiriman` | Read-only; baris tetap menurut A02; field editable lain mengikuti create |
| Tipe Pengiriman | region | `edit-lelang--tipe-pengiriman` | Read-only; baris tetap menurut A02; field editable lain mengikuti create |
| Skema Pengiriman | region | `edit-lelang--skema-pengiriman` | Read-only; baris tetap menurut A02; field editable lain mengikuti create |
| Tambah Baris Input | region | `edit-lelang--tambah-baris-input` | Turunan spesifikasi; label/state perlu pemetaan DOM |

### batalkan-lelang

| Elemen / label | Role | Usulan testid | State / catatan |
|---|---|---|---|
| Batalkan Lelang | dialog | `batalkan-lelang--batalkan-lelang` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Alasan Pembatalan | textbox | `batalkan-lelang--alasan-pembatalan` | Wajib; placeholder Tuliskan alasan pembatalan lelang |
| Batalkan Order | button | `batalkan-lelang--batalkan-order` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Tutup popup | button | `batalkan-lelang--tutup-popup` | Normal; nama ARIA/testid usulan, perlu cocokkan DOM |
| Ringkasan pembatalan | region | `batalkan-lelang--ringkasan-pembatalan` | No. Lelang, Pengirim, Penerima read-only |

## Assumptions Log

A01 — Konflik status Tutup/Aktif belum memiliki pemicu terpisah. Tutup berarti bidding berakhir; Aktif berarti masih dapat dipesan dalam rentang kirim. Pengujian memisahkan fixture kedua status dan tidak mengarang jeda transisi. Tepat Tutup dianggap bidding berhenti; tepat Akhir Kirim masih berlaku sesuai kata melewati.

A02 — Edit butir 3 bertentangan (boleh tambah/hapus vs hanya isi baris), sementara tipe read-only. Dipilih hanya mengubah isi baris tanpa tambah/hapus untuk menjaga tipe; desain memperlihatkan tombol tambah pada beberapa edit, sehingga keputusan ini perlu validasi produk.

A03 — General rule membolehkan batal semua status tanpa order, tetapi bagian Batalkan dan menu membatasi Belum Buka/Sedang Buka/Tutup. Dipakai aturan khusus tersebut; Aktif/Selesai ditolak sementara.

A04 — Aturan teks mengungguli mockup: draf belum punya nomor final meskipun card desain menampilkan nomor; harga sebelum tutup memakai pesan spesifikasi, dapat berupa banner seperti desain. Ajukan Nego/Lelang Ulang tidak aktif sebelum tutup.

A05 — Vendor Input Harga maupun Input Penawaran dianggap sudah menawar dan terkunci pada tambah peserta/lelang ulang; Belum Input boleh dikeluarkan. Pilih Semua berlaku pada seluruh vendor FCL eligible lintas halaman, bukan hanya filter, termasuk vendor baru eligible.

A06 — Zona waktu fixture Asia/Jakarta, jam server dibekukan; range reuse 90 hari dihitung inklusif. Boundary 4MB sementara 4×1024×1024 byte; panjang maksimum teks, banyak file, SLA dan angka beban tidak ditentukan spesifikasi.

A07 — Jumlah kontainer diperlakukan bilangan bulat. Drop point unik lintas kedua sisi. Nilai Barang min/max menerima nilai sama; batas bawah nominal tidak ditentukan sehingga tidak ditambahkan aturan positif wajib.

A08 — Tarif/formula PPN/PPh, pembulatan dan pola nomor PGR diambil dari konfigurasi klien/fixture, bukan di-hardcode. Nama kapal tie-break terakhir diasumsikan alfabet menaik; label peringkat1 termurah tidak boleh mengubah urutan efektif-terbaru.

A09 — Teks validasi yang tidak diberikan diuji secara semantik. Label dialog konfirmasi, label tombol Kembali, ARIA dan testid adalah usulan; perlu dipetakan ke DOM aktual, termasuk scope card/baris.

A10 — Skema action belum mendukung upload, clock, HTTP, multi-user, download/hash atau load generation. Kasus terkait memakai fixture/hook Playwright setInputFiles/download/request/clock dan runner beban; click file hanya pembuka dialog, bukan pengganti upload.

A11 — Tidak ada extras. 31 PNG diperiksa secara visual; mockup hanya membuktikan tampilan statis, bukan implementasi. Filter Semua Rating berasal dari teks walau tidak jelas tampil di desain; TOP terlihat pada detail tetapi tidak ada aturan input, diuji hanya read-only.

A12 — Pembatalan history, OMS, nego, request jadwal, pengelolaan master dan input vendor adalah integrasi: verifikasi handoff/efek, bukan detail alur modul terpisah. Email/push memakai sink uji; tidak mengirim pesan nyata.

A13 — Pengujian negatif otorisasi, retry, data stale, duplikasi submit dan stress adalah asumsi robustness; oracle integritas wajib, tanpa klaim SLA yang belum disepakati. Tidak ada aplikasi TMS target di repo ini sehingga suite belum dieksekusi.

A14 — Untuk lelang Sedang Buka yang diedit, Buka yang tidak diubah boleh tetap di masa lalu; bila diubah wajib tidak sebelum sekarang. Ini menghindari edit sah terblokir oleh validasi create.

A15 — Asumsi tambahan review: tepat closing diterima sementara mengikuti frasa belum lewat; lock ulang mulai sejak simpan termasuk fase Belum Buka; opsi Tampilkan50 dan urutan manual mengikuti opsi aktual; operator filter tanggal, posisi null sorting, dan lifecycle Pilih Semua setelah perubahan pilihan belum dirinci. Kasus terkait menandai asumsi di testData dan tidak menjadi keputusan produk final.
