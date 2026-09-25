# Coverage — ams002-buat-lelang-ftl

Status: **lulus validasi artefak**; belum dieksekusi terhadap aplikasi TMS. Tahap spec-analyzer → design-analyzer → scenario-generator → scenario-reviewer dilakukan berurutan dalam agent utama, dengan membaca artefak disk antar tahap.

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| total | 303 |
| positive | 120 |
| negative | 116 |
| edge | 51 |
| stress | 16 |

70/70 requirement memiliki minimal satu positive dan satu negative; 11 layar tercakup; 207/207 entri UI berscope layar ditarget eksplisit. Ada 51 edge dan 16 stress dengan boundary/volume/race spesifik. 22/22 PNG diperiksa; extras kosong.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Nomor lelang otomatis sesuai konfigurasi PGR hanya saat submit; draft tanpa nomor | AMS002-BUAT-LELANG-FTL-POS-001, AMS002-BUAT-LELANG-FTL-NEG-001 |
| REQ-002 | FTL tanpa pelabuhan, metode/skema pengiriman dan tahap jadwal | AMS002-BUAT-LELANG-FTL-POS-002, AMS002-BUAT-LELANG-FTL-NEG-002, AMS002-BUAT-LELANG-FTL-EDG-051 |
| REQ-003 | Satu lelang mendukung order berulang sampai Rencana Akhir Kirim | AMS002-BUAT-LELANG-FTL-POS-003, AMS002-BUAT-LELANG-FTL-NEG-003 |
| REQ-004 | Semua mutasi lelang tercatat pada Riwayat Perubahan | AMS002-BUAT-LELANG-FTL-POS-004, AMS002-BUAT-LELANG-FTL-NEG-004 |
| REQ-005 | Aksi tidak relevan tetap terlihat dan memberi alert; pengecualian eksplisit mengikuti layar | AMS002-BUAT-LELANG-FTL-POS-005, AMS002-BUAT-LELANG-FTL-NEG-005 |
| REQ-006 | Status Belum Buka, Sedang Buka, Tutup/Aktif, Selesai mengikuti waktu; Dibatalkan manual | AMS002-BUAT-LELANG-FTL-POS-006, AMS002-BUAT-LELANG-FTL-NEG-006, AMS002-BUAT-LELANG-FTL-EDG-005, AMS002-BUAT-LELANG-FTL-EDG-006, AMS002-BUAT-LELANG-FTL-EDG-007, AMS002-BUAT-LELANG-FTL-EDG-008, AMS002-BUAT-LELANG-FTL-EDG-009 |
| REQ-007 | Draft menampilkan substatus sesuai step | AMS002-BUAT-LELANG-FTL-POS-007, AMS002-BUAT-LELANG-FTL-NEG-007 |
| REQ-008 | Badge Tidak Ada Penawaran dan Tidak Ada Order sesuai kondisi setelah tutup | AMS002-BUAT-LELANG-FTL-POS-008, AMS002-BUAT-LELANG-FTL-NEG-008 |
| REQ-009 | Tab Semua Lelang, Lelang Ulang, Request Jadwal, Draf dan counter akurat; FTL tidak masuk Request Jadwal | AMS002-BUAT-LELANG-FTL-POS-009, AMS002-BUAT-LELANG-FTL-NEG-009 |
| REQ-010 | Penanda warna Proses Nego dan Lelang Ulang serta legenda | AMS002-BUAT-LELANG-FTL-POS-010, AMS002-BUAT-LELANG-FTL-NEG-010 |
| REQ-011 | Rute kota dari drop point; popup Multipickup/Multidrop memuat titik berurutan | AMS002-BUAT-LELANG-FTL-POS-011, AMS002-BUAT-LELANG-FTL-NEG-011 |
| REQ-012 | Card daftar menampilkan data lelang sesuai desain | AMS002-BUAT-LELANG-FTL-POS-012, AMS002-BUAT-LELANG-FTL-NEG-012, AMS002-BUAT-LELANG-FTL-POS-090 |
| REQ-013 | Draft kedaluwarsa mengikuti setting, hilang hari berikutnya, warna H-3 dan H | AMS002-BUAT-LELANG-FTL-POS-013, AMS002-BUAT-LELANG-FTL-NEG-013, AMS002-BUAT-LELANG-FTL-EDG-011, AMS002-BUAT-LELANG-FTL-EDG-012, AMS002-BUAT-LELANG-FTL-POS-071, AMS002-BUAT-LELANG-FTL-STR-015 |
| REQ-014 | Menu aksi draft dan nondraft serta riwayat lelang ulang kondisional | AMS002-BUAT-LELANG-FTL-POS-014, AMS002-BUAT-LELANG-FTL-NEG-014, AMS002-BUAT-LELANG-FTL-POS-088, AMS002-BUAT-LELANG-FTL-POS-089, AMS002-BUAT-LELANG-FTL-POS-096 |
| REQ-015 | Pagination dan ukuran halaman default 20 | AMS002-BUAT-LELANG-FTL-POS-015, AMS002-BUAT-LELANG-FTL-NEG-015, AMS002-BUAT-LELANG-FTL-EDG-038, AMS002-BUAT-LELANG-FTL-STR-006 |
| REQ-016 | Dua step pembuatan; pemilihan FTL langsung memunculkan seluruh card | AMS002-BUAT-LELANG-FTL-POS-016, AMS002-BUAT-LELANG-FTL-NEG-016, AMS002-BUAT-LELANG-FTL-POS-095 |
| REQ-017 | Required menampilkan helper, border error dan scroll ke kesalahan pertama | AMS002-BUAT-LELANG-FTL-POS-017, AMS002-BUAT-LELANG-FTL-NEG-017 |
| REQ-018 | Batal meminta konfirmasi dan kembali tanpa menyimpan | AMS002-BUAT-LELANG-FTL-POS-018, AMS002-BUAT-LELANG-FTL-NEG-018, AMS002-BUAT-LELANG-FTL-NEG-113 |
| REQ-019 | Simpan ke Draft step 1 melewati validasi required | AMS002-BUAT-LELANG-FTL-POS-019, AMS002-BUAT-LELANG-FTL-NEG-019 |
| REQ-020 | Selanjutnya validasi dan Kembali mempertahankan data step 1 | AMS002-BUAT-LELANG-FTL-POS-020, AMS002-BUAT-LELANG-FTL-NEG-020 |
| REQ-021 | Checkbox salin membuka periode/data lelang; uncheck mempertahankan hasil salinan | AMS002-BUAT-LELANG-FTL-POS-021, AMS002-BUAT-LELANG-FTL-NEG-021 |
| REQ-022 | Periode salinan opsional dengan batas 90 hari dan filter tanggal dibuat | AMS002-BUAT-LELANG-FTL-POS-022, AMS002-BUAT-LELANG-FTL-NEG-022, AMS002-BUAT-LELANG-FTL-EDG-013, AMS002-BUAT-LELANG-FTL-NEG-071 |
| REQ-023 | Sumber salinan wajib jika dicentang, milik shipper, FTL, bukan draft | AMS002-BUAT-LELANG-FTL-POS-023, AMS002-BUAT-LELANG-FTL-NEG-023 |
| REQ-024 | Salinan seluruh field dan baris dapat diedit kecuali lima field waktu tidak disalin | AMS002-BUAT-LELANG-FTL-POS-024, AMS002-BUAT-LELANG-FTL-NEG-024 |
| REQ-025 | Durasi wajib bersumber Pengaturan Sistem | AMS002-BUAT-LELANG-FTL-POS-025, AMS002-BUAT-LELANG-FTL-NEG-025 |
| REQ-026 | Buka Lelang wajib format DD/MM/YYYY hh:mm dan tidak di masa lalu | AMS002-BUAT-LELANG-FTL-POS-026, AMS002-BUAT-LELANG-FTL-NEG-026, AMS002-BUAT-LELANG-FTL-EDG-001, AMS002-BUAT-LELANG-FTL-EDG-002, AMS002-BUAT-LELANG-FTL-NEG-072, AMS002-BUAT-LELANG-FTL-NEG-073 |
| REQ-027 | Tutup Lelang read-only sama dengan Buka ditambah Durasi dan dihitung ulang | AMS002-BUAT-LELANG-FTL-POS-027, AMS002-BUAT-LELANG-FTL-NEG-027 |
| REQ-028 | Rencana Awal Kirim wajib tidak sebelum Tutup | AMS002-BUAT-LELANG-FTL-POS-028, AMS002-BUAT-LELANG-FTL-NEG-028, AMS002-BUAT-LELANG-FTL-EDG-003, AMS002-BUAT-LELANG-FTL-NEG-074, AMS002-BUAT-LELANG-FTL-NEG-075 |
| REQ-029 | Rencana Akhir Kirim wajib tidak sebelum Rencana Awal dan membatasi order | AMS002-BUAT-LELANG-FTL-POS-029, AMS002-BUAT-LELANG-FTL-NEG-029, AMS002-BUAT-LELANG-FTL-EDG-004, AMS002-BUAT-LELANG-FTL-NEG-076, AMS002-BUAT-LELANG-FTL-NEG-077 |
| REQ-030 | Jumlah Armada opsional numeric minimal 1 | AMS002-BUAT-LELANG-FTL-POS-030, AMS002-BUAT-LELANG-FTL-NEG-030, AMS002-BUAT-LELANG-FTL-EDG-014, AMS002-BUAT-LELANG-FTL-NEG-078, AMS002-BUAT-LELANG-FTL-NEG-079, AMS002-BUAT-LELANG-FTL-NEG-080 |
| REQ-031 | Jenis Armada wajib multiselect searchable minimal satu dari master aktif | AMS002-BUAT-LELANG-FTL-POS-031, AMS002-BUAT-LELANG-FTL-NEG-031, AMS002-BUAT-LELANG-FTL-POS-079, AMS002-BUAT-LELANG-FTL-NEG-099 |
| REQ-032 | Deskripsi Barang dan Catatan Tambahan opsional | AMS002-BUAT-LELANG-FTL-POS-032, AMS002-BUAT-LELANG-FTL-NEG-032, AMS002-BUAT-LELANG-FTL-STR-012 |
| REQ-033 | FTL hanya komponen Asuransi; Nilai Barang bersyarat wajib numeric max >= min dan format ribuan | AMS002-BUAT-LELANG-FTL-POS-033, AMS002-BUAT-LELANG-FTL-NEG-033, AMS002-BUAT-LELANG-FTL-EDG-015, AMS002-BUAT-LELANG-FTL-NEG-081, AMS002-BUAT-LELANG-FTL-NEG-082, AMS002-BUAT-LELANG-FTL-NEG-083, AMS002-BUAT-LELANG-FTL-NEG-084, AMS002-BUAT-LELANG-FTL-EDG-016 |
| REQ-034 | Dokumen multiple JPG/JPEG/PNG/PDF maksimal 4MB per file, hapus serta lihat/unduh detail | AMS002-BUAT-LELANG-FTL-POS-034, AMS002-BUAT-LELANG-FTL-NEG-034, AMS002-BUAT-LELANG-FTL-EDG-017, AMS002-BUAT-LELANG-FTL-EDG-018, AMS002-BUAT-LELANG-FTL-NEG-085, AMS002-BUAT-LELANG-FTL-NEG-086, AMS002-BUAT-LELANG-FTL-NEG-087, AMS002-BUAT-LELANG-FTL-POS-072, AMS002-BUAT-LELANG-FTL-NEG-088, AMS002-BUAT-LELANG-FTL-STR-011 |
| REQ-035 | Default satu pengirim/penerima; tambah baris tanpa batas; tipe otomatis dari jumlah baris | AMS002-BUAT-LELANG-FTL-POS-035, AMS002-BUAT-LELANG-FTL-NEG-035, AMS002-BUAT-LELANG-FTL-EDG-019, AMS002-BUAT-LELANG-FTL-EDG-020, AMS002-BUAT-LELANG-FTL-EDG-021, AMS002-BUAT-LELANG-FTL-EDG-022, AMS002-BUAT-LELANG-FTL-STR-001 |
| REQ-036 | Label Muat/Bongkar, ikon hapus, urutan dan renumber mengikuti jumlah baris | AMS002-BUAT-LELANG-FTL-POS-036, AMS002-BUAT-LELANG-FTL-NEG-036, AMS002-BUAT-LELANG-FTL-EDG-023, AMS002-BUAT-LELANG-FTL-STR-002 |
| REQ-037 | Drop Point dan Pengirim/Penerima wajib searchable milik shipper dan saling mengisi/filter | AMS002-BUAT-LELANG-FTL-POS-037, AMS002-BUAT-LELANG-FTL-NEG-037, AMS002-BUAT-LELANG-FTL-NEG-089, AMS002-BUAT-LELANG-FTL-NEG-090, AMS002-BUAT-LELANG-FTL-NEG-093, AMS002-BUAT-LELANG-FTL-NEG-094, AMS002-BUAT-LELANG-FTL-EDG-025 |
| REQ-038 | Alamat administratif otomatis read-only dari master; PIC dan WhatsApp wajib editable, WhatsApp angka | AMS002-BUAT-LELANG-FTL-POS-038, AMS002-BUAT-LELANG-FTL-NEG-038, AMS002-BUAT-LELANG-FTL-NEG-091, AMS002-BUAT-LELANG-FTL-NEG-092, AMS002-BUAT-LELANG-FTL-POS-077, AMS002-BUAT-LELANG-FTL-NEG-095, AMS002-BUAT-LELANG-FTL-NEG-096, AMS002-BUAT-LELANG-FTL-POS-078, AMS002-BUAT-LELANG-FTL-EDG-024, AMS002-BUAT-LELANG-FTL-STR-003, AMS002-BUAT-LELANG-FTL-POS-099, AMS002-BUAT-LELANG-FTL-POS-118 |
| REQ-039 | Drop point unik lintas seluruh baris pengirim dan penerima | AMS002-BUAT-LELANG-FTL-POS-039, AMS002-BUAT-LELANG-FTL-NEG-039, AMS002-BUAT-LELANG-FTL-NEG-097, AMS002-BUAT-LELANG-FTL-NEG-098 |
| REQ-040 | Daftar vendor hanya aktif eligible FTL dikelola vendor; card kota, menang, rating baru 3.0 | AMS002-BUAT-LELANG-FTL-POS-040, AMS002-BUAT-LELANG-FTL-NEG-040, AMS002-BUAT-LELANG-FTL-EDG-028 |
| REQ-041 | Filter kota/rating, cari vendor, urutan rating tertinggi | AMS002-BUAT-LELANG-FTL-POS-041, AMS002-BUAT-LELANG-FTL-NEG-041 |
| REQ-042 | Multiselect vendor dan counter lintas pagination | AMS002-BUAT-LELANG-FTL-POS-042, AMS002-BUAT-LELANG-FTL-NEG-042, AMS002-BUAT-LELANG-FTL-EDG-039, AMS002-BUAT-LELANG-FTL-STR-004 |
| REQ-043 | Pilih Semua otomatis mengikutkan vendor baru eligible dikelola vendor | AMS002-BUAT-LELANG-FTL-POS-043, AMS002-BUAT-LELANG-FTL-NEG-043, AMS002-BUAT-LELANG-FTL-EDG-027, AMS002-BUAT-LELANG-FTL-STR-005 |
| REQ-044 | Submit minimal satu vendor; draft step 2 tanpa submit | AMS002-BUAT-LELANG-FTL-POS-044, AMS002-BUAT-LELANG-FTL-NEG-044, AMS002-BUAT-LELANG-FTL-POS-080 |
| REQ-045 | Submit menghasilkan nomor/status, email/push, jadwal bidding dan toast serta redirect | AMS002-BUAT-LELANG-FTL-POS-045, AMS002-BUAT-LELANG-FTL-NEG-045, AMS002-BUAT-LELANG-FTL-EDG-026, AMS002-BUAT-LELANG-FTL-EDG-044, AMS002-BUAT-LELANG-FTL-STR-008, AMS002-BUAT-LELANG-FTL-STR-013 |
| REQ-046 | Detail read-only lengkap, tipe otomatis, Pick Up/Drop Off kondisional, kosong tanda '-' | AMS002-BUAT-LELANG-FTL-POS-046, AMS002-BUAT-LELANG-FTL-NEG-046, AMS002-BUAT-LELANG-FTL-POS-073, AMS002-BUAT-LELANG-FTL-POS-074, AMS002-BUAT-LELANG-FTL-POS-075, AMS002-BUAT-LELANG-FTL-POS-076 |
| REQ-047 | Section detail collapsible dan Edit Data hanya saat Belum/Sedang Buka | AMS002-BUAT-LELANG-FTL-POS-047, AMS002-BUAT-LELANG-FTL-NEG-047, AMS002-BUAT-LELANG-FTL-POS-098 |
| REQ-048 | Tabel peserta memuat waktu, dua status FTL, total x/y serta filter/cari/sort | AMS002-BUAT-LELANG-FTL-POS-048, AMS002-BUAT-LELANG-FTL-NEG-048, AMS002-BUAT-LELANG-FTL-POS-087, AMS002-BUAT-LELANG-FTL-EDG-036, AMS002-BUAT-LELANG-FTL-EDG-042, AMS002-BUAT-LELANG-FTL-STR-016 |
| REQ-049 | Edit hanya Belum/Sedang Buka dengan jenis/tipe read-only dan jumlah baris tetap | AMS002-BUAT-LELANG-FTL-POS-049, AMS002-BUAT-LELANG-FTL-NEG-049, AMS002-BUAT-LELANG-FTL-NEG-112, AMS002-BUAT-LELANG-FTL-POS-120 |
| REQ-050 | Edit memvalidasi seperti buat, rekalkulasi tutup, audit field/nilai/user/waktu dan notifikasi | AMS002-BUAT-LELANG-FTL-POS-050, AMS002-BUAT-LELANG-FTL-NEG-050, AMS002-BUAT-LELANG-FTL-EDG-037, AMS002-BUAT-LELANG-FTL-NEG-114, AMS002-BUAT-LELANG-FTL-EDG-045, AMS002-BUAT-LELANG-FTL-STR-009, AMS002-BUAT-LELANG-FTL-POS-100, AMS002-BUAT-LELANG-FTL-POS-101, AMS002-BUAT-LELANG-FTL-POS-102, AMS002-BUAT-LELANG-FTL-POS-103, AMS002-BUAT-LELANG-FTL-POS-104, AMS002-BUAT-LELANG-FTL-POS-105, AMS002-BUAT-LELANG-FTL-POS-106, AMS002-BUAT-LELANG-FTL-POS-107, AMS002-BUAT-LELANG-FTL-POS-108, AMS002-BUAT-LELANG-FTL-POS-109, AMS002-BUAT-LELANG-FTL-POS-110, AMS002-BUAT-LELANG-FTL-POS-111, AMS002-BUAT-LELANG-FTL-POS-112, AMS002-BUAT-LELANG-FTL-POS-113, AMS002-BUAT-LELANG-FTL-POS-114, AMS002-BUAT-LELANG-FTL-POS-115, AMS002-BUAT-LELANG-FTL-POS-116, AMS002-BUAT-LELANG-FTL-POS-117, AMS002-BUAT-LELANG-FTL-POS-119 |
| REQ-051 | Tambah peserta hanya Belum/Sedang Buka, ringkasan read-only dan aturan vendor step 2 | AMS002-BUAT-LELANG-FTL-POS-051, AMS002-BUAT-LELANG-FTL-NEG-051, AMS002-BUAT-LELANG-FTL-EDG-040, AMS002-BUAT-LELANG-FTL-POS-091, AMS002-BUAT-LELANG-FTL-POS-094, AMS002-BUAT-LELANG-FTL-POS-097 |
| REQ-052 | Peserta belum menawar dapat dihapus; sudah menawar terkunci; counter lama+baru | AMS002-BUAT-LELANG-FTL-POS-052, AMS002-BUAT-LELANG-FTL-NEG-052, AMS002-BUAT-LELANG-FTL-EDG-046 |
| REQ-053 | Perubahan peserta hanya memberi notifikasi vendor masuk/keluar | AMS002-BUAT-LELANG-FTL-POS-053, AMS002-BUAT-LELANG-FTL-NEG-053, AMS002-BUAT-LELANG-FTL-NEG-115 |
| REQ-054 | Pembatalan Belum/Sedang Buka/Tutup tanpa order; alasan wajib dan identitas read-only | AMS002-BUAT-LELANG-FTL-POS-054, AMS002-BUAT-LELANG-FTL-NEG-054, AMS002-BUAT-LELANG-FTL-POS-081, AMS002-BUAT-LELANG-FTL-POS-082, AMS002-BUAT-LELANG-FTL-NEG-100, AMS002-BUAT-LELANG-FTL-NEG-101, AMS002-BUAT-LELANG-FTL-NEG-102, AMS002-BUAT-LELANG-FTL-NEG-103, AMS002-BUAT-LELANG-FTL-NEG-104, AMS002-BUAT-LELANG-FTL-NEG-105, AMS002-BUAT-LELANG-FTL-EDG-047 |
| REQ-055 | Batalkan Order mengubah status, list dan riwayat; hanya detail/riwayat tersedia setelah batal | AMS002-BUAT-LELANG-FTL-POS-055, AMS002-BUAT-LELANG-FTL-NEG-055 |
| REQ-056 | Akses harga setelah tutup; sebelum buka/saat buka tampil alert; tanpa Request Jadwal | AMS002-BUAT-LELANG-FTL-POS-056, AMS002-BUAT-LELANG-FTL-NEG-056, AMS002-BUAT-LELANG-FTL-NEG-106 |
| REQ-057 | Filter Vendor/Jenis Armada/Target Waktu numeric, Urutkan, Reset dan Terapkan | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-NEG-057, AMS002-BUAT-LELANG-FTL-EDG-035, AMS002-BUAT-LELANG-FTL-EDG-043 |
| REQ-058 | Ranking tanggal efektif terbaru, harga naik, rating turun, menang turun, jenis armada | AMS002-BUAT-LELANG-FTL-POS-058, AMS002-BUAT-LELANG-FTL-NEG-058, AMS002-BUAT-LELANG-FTL-EDG-031, AMS002-BUAT-LELANG-FTL-EDG-032, AMS002-BUAT-LELANG-FTL-EDG-033, AMS002-BUAT-LELANG-FTL-EDG-034, AMS002-BUAT-LELANG-FTL-STR-007 |
| REQ-059 | Card harga dan tab biaya/armada/vendor sesuai master, pajak dari DPP dan profil vendor | AMS002-BUAT-LELANG-FTL-POS-059, AMS002-BUAT-LELANG-FTL-NEG-059 |
| REQ-060 | Pesan hanya harga berlaku sebelum batas kirim; N/A dan Expired memberi alert | AMS002-BUAT-LELANG-FTL-POS-060, AMS002-BUAT-LELANG-FTL-NEG-060, AMS002-BUAT-LELANG-FTL-EDG-010, AMS002-BUAT-LELANG-FTL-EDG-048 |
| REQ-061 | Pesan mengisi Buat Order OMS, status tetap Aktif, email vendor penawar lain | AMS002-BUAT-LELANG-FTL-POS-061, AMS002-BUAT-LELANG-FTL-NEG-061 |
| REQ-062 | Bebas memilih penawaran; Ajukan Nego sesuai status dan masuk modul terpisah | AMS002-BUAT-LELANG-FTL-POS-062, AMS002-BUAT-LELANG-FTL-NEG-062, AMS002-BUAT-LELANG-FTL-POS-083, AMS002-BUAT-LELANG-FTL-POS-084 |
| REQ-063 | Lelang ulang hanya Tutup/Aktif sebelum batas kirim, tidak rangkap dan nomor tetap | AMS002-BUAT-LELANG-FTL-POS-063, AMS002-BUAT-LELANG-FTL-NEG-063, AMS002-BUAT-LELANG-FTL-NEG-107, AMS002-BUAT-LELANG-FTL-NEG-108, AMS002-BUAT-LELANG-FTL-EDG-049 |
| REQ-064 | Form lelang ulang read-only, pengirim/penerima collapsed, info statis, asuransi kondisional | AMS002-BUAT-LELANG-FTL-POS-064, AMS002-BUAT-LELANG-FTL-NEG-064, AMS002-BUAT-LELANG-FTL-POS-093 |
| REQ-065 | Waktu lelang ulang wajib dari setting, buka >= sekarang, tutup <= akhir kirim | AMS002-BUAT-LELANG-FTL-POS-065, AMS002-BUAT-LELANG-FTL-NEG-065, AMS002-BUAT-LELANG-FTL-EDG-029, AMS002-BUAT-LELANG-FTL-NEG-109, AMS002-BUAT-LELANG-FTL-NEG-110, AMS002-BUAT-LELANG-FTL-NEG-111 |
| REQ-066 | Peserta ulang lama menawar terkunci, belum input removable, counter vendor baru; tanpa vendor baru valid | AMS002-BUAT-LELANG-FTL-POS-066, AMS002-BUAT-LELANG-FTL-NEG-066, AMS002-BUAT-LELANG-FTL-POS-085, AMS002-BUAT-LELANG-FTL-EDG-041, AMS002-BUAT-LELANG-FTL-POS-092 |
| REQ-067 | Simpan ulang mengubah status/tab/warna, audit ulang dan email/push seluruh peserta | AMS002-BUAT-LELANG-FTL-POS-067, AMS002-BUAT-LELANG-FTL-NEG-067, AMS002-BUAT-LELANG-FTL-EDG-030, AMS002-BUAT-LELANG-FTL-POS-086, AMS002-BUAT-LELANG-FTL-NEG-116, AMS002-BUAT-LELANG-FTL-STR-010 |
| REQ-068 | Harga lama Expired per vendor setelah harga baru masuk; tanpa update tetap aktif | AMS002-BUAT-LELANG-FTL-POS-068, AMS002-BUAT-LELANG-FTL-NEG-068 |
| REQ-069 | Selama ulang harga baru tersembunyi, countdown tampil dan harga lama tidak dapat dipesan/nego | AMS002-BUAT-LELANG-FTL-POS-069, AMS002-BUAT-LELANG-FTL-NEG-069, AMS002-BUAT-LELANG-FTL-EDG-050, AMS002-BUAT-LELANG-FTL-STR-014 |
| REQ-070 | Setelah ulang tutup tampil harga baru+lama aktif, status Tutup/Aktif dan keluar tab ulang | AMS002-BUAT-LELANG-FTL-POS-070, AMS002-BUAT-LELANG-FTL-NEG-070 |

## Cakupan layar

| Layar | Positive | Negative | Edge | Stress |
|---|---:|---:|---:|---:|
| list-lelang | 18 | 16 | 8 | 2 |
| informasi-umum | 29 | 52 | 18 | 5 |
| peserta-lelang | 9 | 9 | 5 | 4 |
| detail-lelang | 10 | 4 | 2 | 1 |
| edit-lelang | 22 | 4 | 2 | 1 |
| tambah-peserta | 5 | 4 | 2 | 0 |
| harga-penawaran | 13 | 14 | 9 | 2 |
| lelang-ulang | 8 | 9 | 4 | 1 |
| batalkan-lelang | 4 | 3 | 1 | 0 |
| riwayat-perubahan | 1 | 1 | 0 | 0 |
| riwayat-lelang-ulang | 1 | 0 | 0 | 0 |

## Cakupan elemen UI

ID berikut membuktikan adanya aksi atau assertion eksplisit pada elemen; ini bukan hasil eksekusi UI. Untuk ringkas, ditampilkan maksimal tiga contoh ID per elemen.

| Layar | Elemen | Contoh Scenario IDs |
|---|---|---|
| list-lelang | Buat Lelang | AMS002-BUAT-LELANG-FTL-POS-095 |
| list-lelang | Riwayat Pembatalan | AMS002-BUAT-LELANG-FTL-POS-089 |
| list-lelang | Filter | AMS002-BUAT-LELANG-FTL-POS-090 |
| list-lelang | Semua Lelang | AMS002-BUAT-LELANG-FTL-POS-096 |
| list-lelang | Lelang Ulang | AMS002-BUAT-LELANG-FTL-POS-009 |
| list-lelang | Request Jadwal | AMS002-BUAT-LELANG-FTL-NEG-009 |
| list-lelang | Draf | AMS002-BUAT-LELANG-FTL-POS-007, AMS002-BUAT-LELANG-FTL-NEG-007, AMS002-BUAT-LELANG-FTL-POS-009 |
| list-lelang | Tampilkan | AMS002-BUAT-LELANG-FTL-POS-015, AMS002-BUAT-LELANG-FTL-EDG-038 |
| list-lelang | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-POS-015, AMS002-BUAT-LELANG-FTL-EDG-038, AMS002-BUAT-LELANG-FTL-STR-006 |
| list-lelang | Halaman Sebelumnya | AMS002-BUAT-LELANG-FTL-EDG-038 |
| list-lelang | Halaman Pertama | AMS002-BUAT-LELANG-FTL-EDG-038 |
| list-lelang | Halaman Terakhir | AMS002-BUAT-LELANG-FTL-NEG-015, AMS002-BUAT-LELANG-FTL-EDG-038 |
| list-lelang | Menu Aksi | AMS002-BUAT-LELANG-FTL-POS-005, AMS002-BUAT-LELANG-FTL-NEG-005, AMS002-BUAT-LELANG-FTL-POS-014 |
| list-lelang | Detail | AMS002-BUAT-LELANG-FTL-POS-096 |
| list-lelang | Edit Data | AMS002-BUAT-LELANG-FTL-POS-005, AMS002-BUAT-LELANG-FTL-NEG-005, AMS002-BUAT-LELANG-FTL-POS-014 |
| list-lelang | Tambah Peserta Lelang | AMS002-BUAT-LELANG-FTL-POS-097 |
| list-lelang | Batalkan Lelang | AMS002-BUAT-LELANG-FTL-NEG-100, AMS002-BUAT-LELANG-FTL-NEG-101, AMS002-BUAT-LELANG-FTL-NEG-102 |
| list-lelang | Riwayat Lelang Ulang | AMS002-BUAT-LELANG-FTL-POS-096 |
| list-lelang | Riwayat Perubahan | AMS002-BUAT-LELANG-FTL-POS-096 |
| list-lelang | Hapus Draft | AMS002-BUAT-LELANG-FTL-POS-088 |
| list-lelang | Multipickup | AMS002-BUAT-LELANG-FTL-POS-011 |
| list-lelang | Multidrop | AMS002-BUAT-LELANG-FTL-POS-011 |
| list-lelang | Card Lelang | AMS002-BUAT-LELANG-FTL-POS-009, AMS002-BUAT-LELANG-FTL-EDG-038 |
| list-lelang | Legenda | AMS002-BUAT-LELANG-FTL-POS-010 |
| informasi-umum | FTL | AMS002-BUAT-LELANG-FTL-POS-002, AMS002-BUAT-LELANG-FTL-NEG-002, AMS002-BUAT-LELANG-FTL-POS-016 |
| informasi-umum | FCL | AMS002-BUAT-LELANG-FTL-EDG-051 |
| informasi-umum | Gunakan data lelang yang pernah dibuat | AMS002-BUAT-LELANG-FTL-POS-021, AMS002-BUAT-LELANG-FTL-NEG-021, AMS002-BUAT-LELANG-FTL-POS-024 |
| informasi-umum | Periode Lelang Dibuat | AMS002-BUAT-LELANG-FTL-POS-022, AMS002-BUAT-LELANG-FTL-NEG-022, AMS002-BUAT-LELANG-FTL-EDG-013 |
| informasi-umum | Data Lelang | AMS002-BUAT-LELANG-FTL-POS-021, AMS002-BUAT-LELANG-FTL-POS-022, AMS002-BUAT-LELANG-FTL-POS-023 |
| informasi-umum | Durasi Lelang | AMS002-BUAT-LELANG-FTL-POS-017, AMS002-BUAT-LELANG-FTL-POS-025, AMS002-BUAT-LELANG-FTL-POS-027 |
| informasi-umum | Buka Lelang | AMS002-BUAT-LELANG-FTL-POS-026, AMS002-BUAT-LELANG-FTL-NEG-026, AMS002-BUAT-LELANG-FTL-EDG-001 |
| informasi-umum | Tutup Lelang | AMS002-BUAT-LELANG-FTL-NEG-027 |
| informasi-umum | Rencana Awal Kirim | AMS002-BUAT-LELANG-FTL-POS-028, AMS002-BUAT-LELANG-FTL-NEG-028, AMS002-BUAT-LELANG-FTL-EDG-003 |
| informasi-umum | Rencana Akhir Kirim | AMS002-BUAT-LELANG-FTL-POS-029, AMS002-BUAT-LELANG-FTL-NEG-029, AMS002-BUAT-LELANG-FTL-EDG-004 |
| informasi-umum | Jumlah Armada | AMS002-BUAT-LELANG-FTL-POS-030, AMS002-BUAT-LELANG-FTL-NEG-030, AMS002-BUAT-LELANG-FTL-EDG-014 |
| informasi-umum | Jenis Armada | AMS002-BUAT-LELANG-FTL-POS-031, AMS002-BUAT-LELANG-FTL-POS-079 |
| informasi-umum | Cari Jenis Armada | AMS002-BUAT-LELANG-FTL-POS-031 |
| informasi-umum | Pilih Semua Armada | AMS002-BUAT-LELANG-FTL-POS-079 |
| informasi-umum | Deskripsi Barang | AMS002-BUAT-LELANG-FTL-POS-024, AMS002-BUAT-LELANG-FTL-POS-032, AMS002-BUAT-LELANG-FTL-NEG-032 |
| informasi-umum | Gunakan Asuransi | AMS002-BUAT-LELANG-FTL-POS-033, AMS002-BUAT-LELANG-FTL-NEG-033, AMS002-BUAT-LELANG-FTL-EDG-016 |
| informasi-umum | Nilai Barang Min | AMS002-BUAT-LELANG-FTL-POS-033, AMS002-BUAT-LELANG-FTL-NEG-033, AMS002-BUAT-LELANG-FTL-EDG-015 |
| informasi-umum | Nilai Barang Max | AMS002-BUAT-LELANG-FTL-POS-033, AMS002-BUAT-LELANG-FTL-NEG-033, AMS002-BUAT-LELANG-FTL-EDG-015 |
| informasi-umum | Dokumen Tambahan | AMS002-BUAT-LELANG-FTL-POS-034 |
| informasi-umum | Pilih File | AMS002-BUAT-LELANG-FTL-POS-034, AMS002-BUAT-LELANG-FTL-NEG-034, AMS002-BUAT-LELANG-FTL-EDG-017 |
| informasi-umum | Hapus Dokumen | AMS002-BUAT-LELANG-FTL-POS-034 |
| informasi-umum | Catatan Tambahan | AMS002-BUAT-LELANG-FTL-POS-032, AMS002-BUAT-LELANG-FTL-NEG-032, AMS002-BUAT-LELANG-FTL-STR-012 |
| informasi-umum | Tambah Baris Input Pengirim | AMS002-BUAT-LELANG-FTL-POS-035 |
| informasi-umum | Tambah Baris Input Penerima | AMS002-BUAT-LELANG-FTL-POS-035, AMS002-BUAT-LELANG-FTL-NEG-035 |
| informasi-umum | Hapus Muat | AMS002-BUAT-LELANG-FTL-POS-036, AMS002-BUAT-LELANG-FTL-NEG-036, AMS002-BUAT-LELANG-FTL-STR-002 |
| informasi-umum | Hapus Bongkar | AMS002-BUAT-LELANG-FTL-NEG-036, AMS002-BUAT-LELANG-FTL-EDG-023 |
| informasi-umum | Batal | AMS002-BUAT-LELANG-FTL-POS-018, AMS002-BUAT-LELANG-FTL-NEG-018 |
| informasi-umum | Simpan ke Draft | AMS002-BUAT-LELANG-FTL-POS-019, AMS002-BUAT-LELANG-FTL-NEG-019, AMS002-BUAT-LELANG-FTL-STR-012 |
| informasi-umum | Selanjutnya | AMS002-BUAT-LELANG-FTL-NEG-002, AMS002-BUAT-LELANG-FTL-NEG-016, AMS002-BUAT-LELANG-FTL-POS-017 |
| informasi-umum | Drop Point Asal | AMS002-BUAT-LELANG-FTL-POS-037, AMS002-BUAT-LELANG-FTL-NEG-037, AMS002-BUAT-LELANG-FTL-POS-038 |
| informasi-umum | Pengirim | AMS002-BUAT-LELANG-FTL-EDG-025 |
| informasi-umum | PIC Pengirim | AMS002-BUAT-LELANG-FTL-POS-038 |
| informasi-umum | No. WhatsApp PIC Pengirim | AMS002-BUAT-LELANG-FTL-POS-038, AMS002-BUAT-LELANG-FTL-EDG-024 |
| informasi-umum | Catatan Pengirim | AMS002-BUAT-LELANG-FTL-POS-077 |
| informasi-umum | Provinsi Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kota/Kab Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kecamatan Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Desa/Kelurahan Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kode Pos Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Alamat Asal | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Drop Point Tujuan | AMS002-BUAT-LELANG-FTL-POS-037, AMS002-BUAT-LELANG-FTL-NEG-039, AMS002-BUAT-LELANG-FTL-POS-078 |
| informasi-umum | Penerima | AMS002-BUAT-LELANG-FTL-POS-037 |
| informasi-umum | PIC Penerima | AMS002-BUAT-LELANG-FTL-POS-099 |
| informasi-umum | No. WhatsApp PIC Penerima | AMS002-BUAT-LELANG-FTL-NEG-038 |
| informasi-umum | Catatan Penerima | AMS002-BUAT-LELANG-FTL-POS-078 |
| informasi-umum | Provinsi Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kota/Kab Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kecamatan Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Desa/Kelurahan Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Kode Pos Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| informasi-umum | Alamat Tujuan | AMS002-BUAT-LELANG-FTL-POS-118 |
| peserta-lelang | Pilih Semua | AMS002-BUAT-LELANG-FTL-POS-043, AMS002-BUAT-LELANG-FTL-EDG-027, AMS002-BUAT-LELANG-FTL-STR-004 |
| peserta-lelang | Cari nama vendor | AMS002-BUAT-LELANG-FTL-NEG-040, AMS002-BUAT-LELANG-FTL-POS-041, AMS002-BUAT-LELANG-FTL-NEG-041 |
| peserta-lelang | Semua Kota | AMS002-BUAT-LELANG-FTL-POS-041 |
| peserta-lelang | Semua Rating | AMS002-BUAT-LELANG-FTL-POS-041 |
| peserta-lelang | Vendor | AMS002-BUAT-LELANG-FTL-NEG-040, AMS002-BUAT-LELANG-FTL-POS-042, AMS002-BUAT-LELANG-FTL-NEG-042 |
| peserta-lelang | Counter Vendor | AMS002-BUAT-LELANG-FTL-POS-042 |
| peserta-lelang | Tampilkan | AMS002-BUAT-LELANG-FTL-EDG-039 |
| peserta-lelang | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-POS-042, AMS002-BUAT-LELANG-FTL-NEG-042, AMS002-BUAT-LELANG-FTL-EDG-027 |
| peserta-lelang | Halaman Sebelumnya | AMS002-BUAT-LELANG-FTL-POS-042, AMS002-BUAT-LELANG-FTL-NEG-042 |
| peserta-lelang | Kembali | AMS002-BUAT-LELANG-FTL-POS-020 |
| peserta-lelang | Batal | AMS002-BUAT-LELANG-FTL-NEG-113 |
| peserta-lelang | Simpan ke Draft | AMS002-BUAT-LELANG-FTL-NEG-001, AMS002-BUAT-LELANG-FTL-POS-080 |
| peserta-lelang | Simpan | AMS002-BUAT-LELANG-FTL-POS-001, AMS002-BUAT-LELANG-FTL-POS-043, AMS002-BUAT-LELANG-FTL-POS-044 |
| detail-lelang | Ringkasan Lelang | AMS002-BUAT-LELANG-FTL-POS-046 |
| detail-lelang | Edit Data | AMS002-BUAT-LELANG-FTL-POS-098 |
| detail-lelang | Syarat & Ketentuan | AMS002-BUAT-LELANG-FTL-POS-047 |
| detail-lelang | Data Pengirim | AMS002-BUAT-LELANG-FTL-POS-047 |
| detail-lelang | Data Penerima | AMS002-BUAT-LELANG-FTL-POS-047 |
| detail-lelang | Peserta Lelang | AMS002-BUAT-LELANG-FTL-POS-047, AMS002-BUAT-LELANG-FTL-STR-016 |
| detail-lelang | Dokumen Tambahan | AMS002-BUAT-LELANG-FTL-POS-072 |
| detail-lelang | Semua Status | AMS002-BUAT-LELANG-FTL-POS-048, AMS002-BUAT-LELANG-FTL-NEG-048, AMS002-BUAT-LELANG-FTL-EDG-036 |
| detail-lelang | Cari nama vendor | AMS002-BUAT-LELANG-FTL-POS-048 |
| detail-lelang | Vendor | AMS002-BUAT-LELANG-FTL-POS-048, AMS002-BUAT-LELANG-FTL-POS-087 |
| detail-lelang | Tanggal Terkirim | AMS002-BUAT-LELANG-FTL-POS-048, AMS002-BUAT-LELANG-FTL-POS-087 |
| detail-lelang | Tanggal Penawaran | AMS002-BUAT-LELANG-FTL-POS-048, AMS002-BUAT-LELANG-FTL-POS-087 |
| detail-lelang | Tabel Peserta | AMS002-BUAT-LELANG-FTL-POS-048 |
| detail-lelang | Tampilkan | AMS002-BUAT-LELANG-FTL-EDG-042 |
| detail-lelang | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-EDG-042 |
| edit-lelang | Jenis Pengiriman | AMS002-BUAT-LELANG-FTL-POS-120 |
| edit-lelang | Tipe Pengiriman | AMS002-BUAT-LELANG-FTL-POS-120 |
| edit-lelang | Durasi Lelang | AMS002-BUAT-LELANG-FTL-POS-050 |
| edit-lelang | Buka Lelang | AMS002-BUAT-LELANG-FTL-POS-100 |
| edit-lelang | Tutup Lelang | AMS002-BUAT-LELANG-FTL-POS-120 |
| edit-lelang | Rencana Awal Kirim | AMS002-BUAT-LELANG-FTL-POS-101 |
| edit-lelang | Rencana Akhir Kirim | AMS002-BUAT-LELANG-FTL-NEG-050 |
| edit-lelang | Jumlah Armada | AMS002-BUAT-LELANG-FTL-POS-102 |
| edit-lelang | Jenis Armada | AMS002-BUAT-LELANG-FTL-POS-103 |
| edit-lelang | Deskripsi Barang | AMS002-BUAT-LELANG-FTL-POS-104 |
| edit-lelang | Gunakan Asuransi | AMS002-BUAT-LELANG-FTL-POS-105 |
| edit-lelang | Nilai Barang Min | AMS002-BUAT-LELANG-FTL-POS-106 |
| edit-lelang | Nilai Barang Max | AMS002-BUAT-LELANG-FTL-POS-107 |
| edit-lelang | Pilih File | AMS002-BUAT-LELANG-FTL-POS-117 |
| edit-lelang | Catatan Tambahan | AMS002-BUAT-LELANG-FTL-POS-108 |
| edit-lelang | Tambah Baris Input Pengirim | AMS002-BUAT-LELANG-FTL-NEG-112 |
| edit-lelang | Tambah Baris Input Penerima | AMS002-BUAT-LELANG-FTL-NEG-112 |
| edit-lelang | Hapus Muat | AMS002-BUAT-LELANG-FTL-NEG-112 |
| edit-lelang | Hapus Bongkar | AMS002-BUAT-LELANG-FTL-NEG-112 |
| edit-lelang | Batal | AMS002-BUAT-LELANG-FTL-NEG-114 |
| edit-lelang | Simpan | AMS002-BUAT-LELANG-FTL-POS-049, AMS002-BUAT-LELANG-FTL-POS-050, AMS002-BUAT-LELANG-FTL-NEG-050 |
| edit-lelang | Drop Point Asal | AMS002-BUAT-LELANG-FTL-POS-109 |
| edit-lelang | Pengirim | AMS002-BUAT-LELANG-FTL-POS-111 |
| edit-lelang | PIC Pengirim | AMS002-BUAT-LELANG-FTL-POS-049, AMS002-BUAT-LELANG-FTL-EDG-045, AMS002-BUAT-LELANG-FTL-STR-009 |
| edit-lelang | No. WhatsApp PIC Pengirim | AMS002-BUAT-LELANG-FTL-POS-113 |
| edit-lelang | Catatan Pengirim | AMS002-BUAT-LELANG-FTL-POS-115 |
| edit-lelang | Provinsi Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kota/Kab Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kecamatan Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Desa/Kelurahan Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kode Pos Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Alamat Asal | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Drop Point Tujuan | AMS002-BUAT-LELANG-FTL-POS-110 |
| edit-lelang | Penerima | AMS002-BUAT-LELANG-FTL-POS-112 |
| edit-lelang | PIC Penerima | AMS002-BUAT-LELANG-FTL-EDG-037 |
| edit-lelang | No. WhatsApp PIC Penerima | AMS002-BUAT-LELANG-FTL-POS-114 |
| edit-lelang | Catatan Penerima | AMS002-BUAT-LELANG-FTL-POS-116 |
| edit-lelang | Provinsi Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kota/Kab Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kecamatan Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Desa/Kelurahan Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Kode Pos Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| edit-lelang | Alamat Tujuan | AMS002-BUAT-LELANG-FTL-POS-119 |
| tambah-peserta | Ringkasan Lelang | AMS002-BUAT-LELANG-FTL-POS-051 |
| tambah-peserta | Syarat & Ketentuan | AMS002-BUAT-LELANG-FTL-POS-094 |
| tambah-peserta | Dokumen Tambahan | AMS002-BUAT-LELANG-FTL-POS-094 |
| tambah-peserta | Pilih Semua | AMS002-BUAT-LELANG-FTL-POS-091 |
| tambah-peserta | Cari nama vendor | AMS002-BUAT-LELANG-FTL-POS-091 |
| tambah-peserta | Semua Kota | AMS002-BUAT-LELANG-FTL-POS-091 |
| tambah-peserta | Semua Rating | AMS002-BUAT-LELANG-FTL-POS-091 |
| tambah-peserta | Vendor | AMS002-BUAT-LELANG-FTL-POS-051, AMS002-BUAT-LELANG-FTL-POS-052, AMS002-BUAT-LELANG-FTL-NEG-052 |
| tambah-peserta | Counter Vendor | AMS002-BUAT-LELANG-FTL-POS-052 |
| tambah-peserta | Tampilkan | AMS002-BUAT-LELANG-FTL-EDG-040 |
| tambah-peserta | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-EDG-040 |
| tambah-peserta | Batal | AMS002-BUAT-LELANG-FTL-NEG-115 |
| tambah-peserta | Simpan | AMS002-BUAT-LELANG-FTL-POS-051, AMS002-BUAT-LELANG-FTL-NEG-052, AMS002-BUAT-LELANG-FTL-POS-053 |
| harga-penawaran | Lelang Ulang | AMS002-BUAT-LELANG-FTL-POS-070, AMS002-BUAT-LELANG-FTL-NEG-107, AMS002-BUAT-LELANG-FTL-NEG-108 |
| harga-penawaran | Ajukan Nego | AMS002-BUAT-LELANG-FTL-NEG-062, AMS002-BUAT-LELANG-FTL-NEG-069, AMS002-BUAT-LELANG-FTL-POS-083 |
| harga-penawaran | Filter | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-NEG-057, AMS002-BUAT-LELANG-FTL-EDG-035 |
| harga-penawaran | Vendor | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-EDG-035 |
| harga-penawaran | Jenis Armada | AMS002-BUAT-LELANG-FTL-POS-057 |
| harga-penawaran | Target Waktu Perjalanan | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-NEG-057 |
| harga-penawaran | Urutkan | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-STR-007 |
| harga-penawaran | Reset | AMS002-BUAT-LELANG-FTL-POS-057 |
| harga-penawaran | Terapkan | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-NEG-057, AMS002-BUAT-LELANG-FTL-EDG-035 |
| harga-penawaran | Tampilkan | AMS002-BUAT-LELANG-FTL-EDG-043 |
| harga-penawaran | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-EDG-043 |
| harga-penawaran | Detail Biaya | AMS002-BUAT-LELANG-FTL-POS-059, AMS002-BUAT-LELANG-FTL-NEG-059 |
| harga-penawaran | Detail Armada | AMS002-BUAT-LELANG-FTL-POS-059 |
| harga-penawaran | Tab Vendor | AMS002-BUAT-LELANG-FTL-POS-059 |
| harga-penawaran | Lihat Profil | AMS002-BUAT-LELANG-FTL-POS-059 |
| harga-penawaran | Pesan | AMS002-BUAT-LELANG-FTL-POS-003, AMS002-BUAT-LELANG-FTL-POS-060, AMS002-BUAT-LELANG-FTL-POS-061 |
| harga-penawaran | N/A | AMS002-BUAT-LELANG-FTL-NEG-003, AMS002-BUAT-LELANG-FTL-NEG-060 |
| harga-penawaran | Expired | AMS002-BUAT-LELANG-FTL-NEG-070 |
| harga-penawaran | Card Penawaran | AMS002-BUAT-LELANG-FTL-POS-057, AMS002-BUAT-LELANG-FTL-POS-059, AMS002-BUAT-LELANG-FTL-NEG-069 |
| harga-penawaran | Countdown | AMS002-BUAT-LELANG-FTL-POS-069 |
| lelang-ulang | Ringkasan Lelang | AMS002-BUAT-LELANG-FTL-POS-064 |
| lelang-ulang | Syarat & Ketentuan | AMS002-BUAT-LELANG-FTL-POS-093 |
| lelang-ulang | Data Pengirim | AMS002-BUAT-LELANG-FTL-POS-064 |
| lelang-ulang | Data Penerima | AMS002-BUAT-LELANG-FTL-POS-064 |
| lelang-ulang | Tanggal Tutup Lelang | AMS002-BUAT-LELANG-FTL-POS-093 |
| lelang-ulang | Perlu Diketahui | AMS002-BUAT-LELANG-FTL-POS-064 |
| lelang-ulang | Nilai Barang | AMS002-BUAT-LELANG-FTL-POS-064 |
| lelang-ulang | Durasi Lelang | AMS002-BUAT-LELANG-FTL-POS-065, AMS002-BUAT-LELANG-FTL-NEG-065, AMS002-BUAT-LELANG-FTL-EDG-029 |
| lelang-ulang | Buka Lelang | AMS002-BUAT-LELANG-FTL-POS-065, AMS002-BUAT-LELANG-FTL-NEG-065, AMS002-BUAT-LELANG-FTL-EDG-029 |
| lelang-ulang | Tutup Lelang | AMS002-BUAT-LELANG-FTL-POS-065 |
| lelang-ulang | Pilih Semua | AMS002-BUAT-LELANG-FTL-POS-092 |
| lelang-ulang | Cari nama vendor | AMS002-BUAT-LELANG-FTL-POS-092 |
| lelang-ulang | Semua Kota | AMS002-BUAT-LELANG-FTL-POS-092 |
| lelang-ulang | Semua Rating | AMS002-BUAT-LELANG-FTL-POS-092 |
| lelang-ulang | Vendor | AMS002-BUAT-LELANG-FTL-POS-066, AMS002-BUAT-LELANG-FTL-NEG-066, AMS002-BUAT-LELANG-FTL-POS-085 |
| lelang-ulang | Counter Vendor Baru | AMS002-BUAT-LELANG-FTL-POS-085 |
| lelang-ulang | Tampilkan | AMS002-BUAT-LELANG-FTL-EDG-041 |
| lelang-ulang | Halaman Berikutnya | AMS002-BUAT-LELANG-FTL-EDG-041 |
| lelang-ulang | Batal | AMS002-BUAT-LELANG-FTL-NEG-116 |
| lelang-ulang | Simpan | AMS002-BUAT-LELANG-FTL-POS-063, AMS002-BUAT-LELANG-FTL-NEG-065, AMS002-BUAT-LELANG-FTL-POS-066 |
| batalkan-lelang | Batalkan Lelang | AMS002-BUAT-LELANG-FTL-POS-054 |
| batalkan-lelang | No. Lelang | AMS002-BUAT-LELANG-FTL-POS-054 |
| batalkan-lelang | Pengirim | AMS002-BUAT-LELANG-FTL-POS-054 |
| batalkan-lelang | Penerima | AMS002-BUAT-LELANG-FTL-POS-054 |
| batalkan-lelang | Alasan Pembatalan | AMS002-BUAT-LELANG-FTL-POS-054, AMS002-BUAT-LELANG-FTL-NEG-054, AMS002-BUAT-LELANG-FTL-POS-055 |
| batalkan-lelang | Batalkan Order | AMS002-BUAT-LELANG-FTL-POS-054, AMS002-BUAT-LELANG-FTL-NEG-054, AMS002-BUAT-LELANG-FTL-POS-055 |
| riwayat-perubahan | Riwayat Perubahan | AMS002-BUAT-LELANG-FTL-POS-004 |
| riwayat-lelang-ulang | Riwayat Lelang Ulang | AMS002-BUAT-LELANG-FTL-POS-086 |

## Validasi Gherkin dan JSON

- Parser resmi `@cucumber/gherkin` berhasil membentuk AST untuk seluruh 303 Scenario; tidak ada kesalahan sintaks. Paket validator berada di direktori sementara, bukan dependency proyek.
- Setiap ID/judul unik; tepat satu Given pembuka, satu When dan satu Then per Scenario, dengan And untuk kelanjutan. Semua 303 padanan ID, tag kategori/prioritas/REQ/screen, preconditions, langkah operasi dan expected diperiksa terhadap JSON.
- Struktur JSON, enum action, selectorHints untuk setiap target non-navigate, references sumber dan hitungan summary sesuai data aktual. Target navigate menggunakan alias layar, bukan URL yang dikarang.
- Semua 70 REQ mempunyai positive/negative. Semua 207 entri inventaris UI ditarget minimal sekali. Pengulangan field lintas layar sengaja dipertahankan karena state dan konteks edit berbeda.
- Pemeriksaan signature screen + preconditions + steps + expected tidak menemukan duplikat identik setelah deduplikasi.

## Deduplikasi

- Dihapus kandidat `Pembatalan tanpa order status Tutup` (ID sementara POS-083 sebelum penomoran final): jalur tersebut sudah dicakup skenario `Pembatalan valid memuat identitas read-only`, yang juga menguji identitas dialog. Kandidat tidak dihitung pada 303 skenario final. ID final dinomori ulang per kategori.
- Skenario batas waktu, status yang berbeda, dan per-field required/edit dipertahankan: pemicu dan oracle berbeda, bukan duplikasi judul.

## Gap dan batas verifikasi

Tidak ada gap pemetaan REQ positive/negative atau target elemen UI dalam cakupan yang diekstrak. Berikut gap kontrak produk/otomasi yang tetap terbuka:

1. Keputusan A01–A05, A10, A15, A17 tentang FCL/FTL, jumlah baris edit, pembatalan Aktif/Selesai, Tutup versus Aktif, jadwal, ranking dan waktu buka lama perlu validasi pemilik produk. Skenario terdampak memakai oracle sementara yang dinyatakan, bukan klaim kepastian.
2. Desain tidak memperlihatkan state error/loading/toast/dialog/riwayat/countdown dan beberapa kontrol wajib spec (filter rating, Kembali, salinan aktif). Inventaris terkait diturunkan dari spec; teks error semantik tidak dianggap copy final. TOP hanya dibaca dari fixture, filter generik OMS pada beberapa desain tidak dijadikan requirement FTL.
3. Selector ARIA/testid adalah usulan. Custom combobox perlu adapter klik opsi; upload memerlukan setInputFiles/file chooser; read-only/absence/value/sort/network memerlukan matcher khusus, bukan selalu toBeVisible. Upload, multi-session, race, jam dan scheduler didefinisikan lewat fixture/testData karena schema action terbatas.
4. URL, DOM, endpoint notifikasi/audit, aturan PGR klien, tarif/pembulatan pajak, dan oracle integrasi belum tersedia. Sebelum codegen runnable, bind kontrak ini ke aplikasi/stub uji. Tidak ada pengujian browser, load test, notifikasi sungguhan atau order produksi yang dijalankan.
5. Stress memiliki ukuran eksplisit dan invariant integritas, tetapi SLA latensi, batas total upload/teks dan kebijakan locking belum ditentukan. Hasil performa perlu dicatat saat eksekusi; tidak ada klaim lulus performa dari generasi ini.
6. Negosiasi, OMS, profil vendor dan Riwayat Pembatalan hanya diuji pada batas integrasi; detail modul tersebut membutuhkan spesifikasi tersendiri.

## Rekomendasi tindak lanjut

Konfirmasi asumsi produk, bind fixture/selector/URL, lalu jalankan positive dan negative prioritas high di lingkungan uji; lanjutkan edge terkontrol jam/race dan stress dengan observabilitas. Tidak perlu memperluas jumlah skenario sebelum kontrak yang ambigu diputuskan.
