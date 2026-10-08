# Eksplorasi Batch 03 — Lelang Kontrak, 8 Oktober 2026

Batch 03 memeriksa daftar, periode, form FTL/FCL, edit baca, detail, penawaran dan riwayat pada Admin serta daftar/detail/riwayat Vendor IK. Eksplorasi read-only; tidak menjalankan Batch 04 atau suite formal. Tidak ada suite khusus Lelang Kontrak dalam `scenario/`; hasil dibandingkan peta 4 Oktober, keputusan terbaru dan perilaku Spot Rate Batch 02 sebagai pembanding, bukan otomatis requirement Kontrak.

## Menu dan route yang benar-benar diperiksa

| Role | Menu/route | Jenis dan aksi baca | Hasil |
|---|---|---|---|
| Admin | `/lelang-kontrak` | Semua, Request Jadwal, Draf, Filter, Buat Lelang, Atur Periode Kontrak, Riwayat Pembatalan | Snapshot 9 record termasuk 1 draf; request0 |
| Admin | `/lelang-kontrak/periode` | Tabel, Filter, Buat Periode, Lihat Detail, Edit Periode, Jumlah Lelang | 7 periode; modal detail/edit/create dan daftar lelang terkait dibuka |
| Admin | `/lelang-kontrak/buat` | Informasi Umum FTL/FCL, buat/pilih periode, metode, biaya dan lokasi | Input/pilihan lokal tanpa Selanjutnya/Simpan |
| Admin | `/lelang-kontrak/buat?id={draftId}` | Resume Edit Data draf | Draf expired masih membuka step Informasi Umum |
| Admin | `/lelang-kontrak/{id}` | Detail FCL/FTL, syarat, pengirim/penerima dan peserta | FCL04/021026 Sedang Buka; FTL10/021026 Tutup |
| Admin | `/lelang-kontrak/{id}/edit` | Form edit FCL dari tombol detail | Dibuka tanpa menyimpan |
| Admin | `/lelang-kontrak/{id}/penawaran` | Detail Harga Penawaran FTL10 | Dua harga existing, Filter dibaca; tidak Ajukan Nego/Pesan |
| Admin | `/lelang-kontrak/riwayat` | Riwayat Pembatalan | Empty state; berbeda dari label Riwayat Perubahan pada peta lama |
| Vendor | `/vendor-portal/lelang-kontrak` | Semua, Request Jadwal, search Enter, menu card | IK menerima 1 record FTL; tidak ada Buat/Draf/Atur Periode |
| Vendor | `/vendor-portal/lelang-kontrak/{id}` | Detail FTL04/081026 dan harga milik sendiri | Belum Input; belum memiliki harga |
| Vendor | `/vendor-portal/penawaran` | Tujuan setelah klik Riwayat Perubahan | Salah tujuan kandidat B03-C02; tidak melanjutkan aksi modul harga |

Akses UI tidak membuktikan otorisasi backend semua role. Tidak memaksakan akses Vendor ke kontrak FCL milik vendor lain. FCL Vendor dan penawaran Kontrak milik IK belum memiliki sampel pada daftar saat sesi ini.

## Kandidat temuan

### B03-C01 — Draf Kontrak expired berlabel Hari ini dan masih dapat dibuka

- Draf `f1aa9129-cb3f-4407-a243-3424d3d2c70b` menunjukkan Kedaluwarsa **06/10/2026 • Hari ini**, padahal serverNow GET tab DRAF **2026-10-08T05:14:01.528Z**.
- API: `kedaluwarsaAt=2026-10-06T10:43:34.967Z`, `sisaHariKedaluwarsa=0`, `actions.EDIT.allowed=true`. Edit Data dari menu membuka `/lelang-kontrak/buat?id=...` dengan periode 16–17 Oktober dan form informasi umum.
- Pola sama dengan B02-C01 Spot Rate. Label Hari ini bertentangan dengan tanggal; expected hilang/tidak dapat dilanjutkan untuk Kontrak perlu dikonfirmasi tersendiri karena suite Kontrak belum ada. Tidak mencoba menyimpan dan tidak menyatakan backend menerima draf expired.
- Bukti: `main-draft-list.json`, `main-draft-resume.json`, `main-draft-expiry-evidence.json`, `main-api-responses.json`.
- Improve: status expired eksplisit; filtering, guard deep link dan cleanup berdasarkan rule Kontrak. Skenario stale draf beberapa hari dan pergantian hari WIB diperlukan.

### B03-C02 — Riwayat Perubahan Vendor menuju Penawaran umum

- Klik menu **Riwayat Perubahan** pada FTL-NRM-04/081026 membawa ke `/vendor-portal/penawaran`, daftar harga Spot Rate dan nomor lelang lain, bukan riwayat kontrak terpilih. Recheck dari card sama disimpan terpisah.
- Tujuan menu tidak sesuai label dan kehilangan konteks kontrak. Pola serupa B02-C03; ini perlu triage navigasi lintas Spot/Kontrak. Tidak menyimpulkan entitlement/isi riwayat Vendor dari spec yang belum tersedia.
- Bukti Vendor: `vendor-menu.json`, `vendor-history-destination.json`, `vendor-history-menu-recheck.json`, `vendor-history-destination-recheck.json`, `vendor-api-responses.json`.
- Improve: arahkan ke riwayat kontrak terpilih atau sesuaikan nama menu dengan tujuan sebenarnya; tambah skenario navigasi, konteks tipe kontrak, nomor lelang dan akses role.

## Rule dan fitur yang diamati

| Area | Bukti observasi | Implikasi/batas |
|---|---|---|
| Filter daftar | Nomor fiktif →0; Reset mengembalikan9 | Panel Kontrak tetap menampilkan Reset/Terapkan sesudah reset; tidak menyamakan dengan Spot Rate |
| Tanggal daftar | Admin menampilkan periode lelang/kontrak hanya tanggal; detail dan Vendor menampilkan jam | Kontrak lelang10menit terlihat sebagai tanggal sama; improve tampilkan jam/tooltip untuk menjaga konteks |
| Periode bersama | 7 periode, jumlah lelang per periode berjumlah9, cocok snapshot daftar | Rekonsiliasi internal termasuk draf, bukan bukti semua assignment/status benar |
| Detail periode | Durasi, Buka/Tutup, Awal/Akhir, jumlah lelang, ketentuan | Tombol jumlah lelang membuka modal daftar terkait; sampel satu lelang cocok nomor pada daftar |
| Edit periode | API tiga `editable=true`, empat false; `bukaLocked` dua false dan lima true | Periode Sedang Buka bisa editable tetapi bukaLocked. Yang dibuka untuk edit adalah periode belum buka; tidak menguji guard save/propagasi ke semua lelang |
| Filter periode | Periode Kontrak dan Periode Lelang dengan **Reset/Terapkan** | Reset kini terlihat, berbeda dari catatan 3 Oktober “tidak menampilkan Reset”; hanya kontrol dibaca, efektivitas filter periode belum diuji |
| Buat/pilih periode | Form default Buat Periode; pindah ke Pilih menampilkan dropdown6periode available | Periode kontrak berakhir7Oktober tidak tercantum; belum membuktikan semua batas filtering |
| Periode dengan lelang lampau | 03/10/2026–01/05/2027 dapat dipilih; ringkasan Buka03/10 08:31/Tutup08:41 | Buka/Tutup sumber lampau tidak otomatis jadi error UI. Kelayakan penambahan lelang baru pada kontrak aktif perlu expected produk dan pengujian save fixture sendiri |
| Form FTL | **Volume Armada***, multi jenis armada, deskripsi, asuransi, dokumen dan lokasi | Jangan menyamakan field Volume Kontrak dengan Jumlah Armada Spot Rate yang ditiadakan user |
| Form FCL | Volume Kontainer, unit, pelabuhan, empat metode | Volume Kontainer tidak bertanda wajib pada label; validasi server belum diuji. Tidak menganggap volume ekuivalen jumlah kontainer Spot Rate |
| Empat metode FCL | Tambah Baris Input: DoorDoor kedua sisi; DoorCY hanya asal; CYDoor hanya tujuan; CYCY keduanya disabled | Checkbox THC/LOLO/trucking dicatat per metode; pilihan hanya lokal |
| Reuse | Help “Berlaku untuk semua data kecuali data tanggal dan data opsional” | Berbeda dari help Spot Rate; tidak memilih sumber pada batch ini. Arti data opsional perlu daftar field eksplisit dan skenario tersendiri |
| Upload | Maks4MB jpg/jpeg/png/pdf | Tidak upload; validasi tipe/ukuran/content belum dibuktikan |
| Detail FCL | Sedang Buka, volume690900, unit20Feet, periode7hari, peserta1 BelumInput | Nilai volume besar bukan otomatis bug tanpa aturan batas/satuan |
| Detail FTL | Tutup, volume1, dua jenis trailer, total1/1 InputPenawaran | Caption FTL harga saja; FCL harga+jadwal. Counter FCL lengkap belum diuji karena peserta belum input |
| Penawaran FTL | Trailer40FT60.000 dan20FT100.000, ±1/2jam, keduanya TidakBerlaku | Tidak membuat Order/nego atau menyimpulkan penyebab status hanya dari tanggal. Filter/urut/modal harga hanya backlog baca sebagian |
| Kontrak tanpa ulang | API actions.LELANG_ULANG / RIWAYAT_ULANG false dengan alasan “Lelang Kontrak tidak dapat dilelang ulang” | Alasan eksplisit API baca; tidak memicu aksi ulang |
| Batal | Konfirmasi Tidak/Ya; Tidak mempertahankan form | Modal0roleDialog, tanpa save |
| Vendor | Hanya FTL04/081026: aktif, volume22, CDE/CDD/CDDLong, ketentuan kontrak, BelumInput | Search fiktif→0, clear+Enter→1; RequestJadwal0 empty. Harga sendiri kosong bukan bug |

## Improve di luar coverage yang tersedia

Belum ada suite Kontrak khusus; jangan mengklaim AMS001/002 otomatis mencakupnya. Prioritas backlog skenario:

| ID | Usulan improve / skenario | Alasan |
|---|---|---|
| B03-I01 | Suite periode bersama: edit sebelum buka/sedang buka/tutup; bukaLocked; propagasi dan audit perubahan ke banyak lelang | Periode sumber dipakai beberapa lelang, dampak tidak cukup diuji per form |
| B03-I02 | Jelaskan periode eligible dan izin menambah kontrak ketika waktu lelang periode sudah lampau | Dropdown tersedia6 termasuk periode lelang lampau; belum ada expected kelayakan save |
| B03-I03 | Label Volume: satuan, rentang, wajib/opsional per FTL/FCL, total dan per jenis unit | Form/detail punya Volume, berbeda dari Spot Rate. Tidak menambah requirement jumlah yang telah ditiadakan |
| B03-I04 | Tampilkan waktu lelang pada card Admin atau tooltip; jelaskan kapan harga Kontrak menjadi berlaku | Card tanggal saja menghilangkan durasi10menit; harga dua sampel TidakBerlaku tanpa pengujian penyebab |
| B03-I05 | Enumerasi field reuse yang tidak ikut disalin; konfirmasi sebelum mengganti tipe/metode/periode | Help data opsional terlalu umum, perlu mencegah kehilangan input lokal |
| B03-I06 | Guard expired dan konteks navigasi riwayat, kedua role | B03-C01/C02; sediakan fixture Kontrak FCL/FTL yang mengundang akun Vendor uji |
| B03-I07 | Label aksesibel Aksi; selector khusus Kontrak; counter peserta lintas halaman | Menu title=Aksi tanpa aria-label; label Tambah Baris Input berbeda dari Spot Rate |

## Hipotesis dan batas hasil

Login Admin/Vendor berhasil dari konfigurasi existing, tanpa kalibrasi atau retry. Klik native bekerja; storageState lintas context tidak diuji ulang. Dropdown form kustom, Tampilkan select native. Kalender modal periode kustom43 `button.h-9.w-9`, tanpa input date/datetime-local. Modal create/detail/edit periode dan konfirmasi Batal tidak diasumsikan role=dialog; inventaris create/Batal0. Data-testid tetap0 pada list/form yang dibaca.

Error locator menu setelah navigasi/render, regex FCL yang mengabaikan spasi accessible name, dan Batal setelah Escape sudah menutup modal adalah error harness. Filter penawaran sempat mempunyai kontrol dalam DOM tetapi pointer terhalang card, lalu screenshot menunjukkan panel sudah tidak terbuka; belum dapat mereproduksi masalah filter stabil, tidak dijadikan bug. Tidak memaksa klik/dispatch atau menyatakan Reset berhasil pada kondisi tersebut.

Belum diuji: semua negative/boundary tanggal, lintas tengah malam/timezone, konflik periode overlap, propagasi edit/audit, semua source reuse, persistensi/submit draf, step peserta melalui Selanjutnya, edit peserta, riwayat perubahan Admin setelah edit, penawaran FCL Kontrak dan Vendor dengan harga, status/expiry lintas waktu, guard backend role, upload dan semua popup rincian harga. Rule mutasi memakai fixture sendiri dan workflow test-module setelah expected Kontrak tersedia.

## Artefak dan kelanjutan

- Admin: `artifacts/explore-batches/20261008/batch03-2026-10-08T05-08-24-959Z/`.
- Vendor: `artifacts/explore-batches/20261008/batch03-2026-10-08T05-15-20-009Z/`.
- Screenshot salinan: `artifacts/screenshots/explore/20261008/batch03-main/` dan `batch03-vendor/`. Header akun disembunyikan lokal saat capture; bukti DOM/JSON tetap disanitasi. Screenshot utama list/periode/form/detail diambil ulang setelah render stabil.
- API GET, inventory, kandidat dan summary masing-masing role disimpan; request tulis bisnis diblokir harness setelah login. Tidak submit/simpan/hapus/batalkan atau mengubah setting/fixture nego9Oktober; tidak menyimpan storageState. Tidak menghasilkan verdict formal/Excel.
- Batch03 selesai untuk cakupan baca yang diperiksa, dengan backlog di atas. **Batch04 Live Bidding/Laporan belum dijalankan.**

Verifikasi akhir: 75 JSON valid dan 7 screenshot tersalin; tidak ditemukan kredensial akun pada JSON/dokumen yang diperiksa. Summary kedua role: 0 API status >=400, 0 request tulis bisnis dan 0 blockedWrites; POST hanya auth/refresh otomatis. Kedua browser ditutup dan `git diff --check` bersih.
