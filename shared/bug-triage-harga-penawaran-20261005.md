# Triase Harga Penawaran — 5 Oktober 2026

Run `ams009-harga-penawaran-rules__20261005-051211`: **23 passed, 1 failed, 6 blocked, 0 skipped** (30 skenario).

Cakupan: revisi rule user, bukan full run AMS004/AMS005/AMS006. User mengizinkan pembaruan skenario dan pengecekan staging; Closing Time dijalankan sebagai diagnosis dan ketidakpastian masuk laporan. Login Admin/Vendor sekali dalam context terpisah yang tetap hidup; browser Asia/Jakarta; mutasi hanya fixture run. Tiga batch berisi 10 skenario masing-masing.

| SCN | Klasifikasi | Rujukan | Severity | Analisis singkat | Rekomendasi |
|---|---|---|---|---|---|
| SCN-0025 | BUG (probable), status/tampilan | REQ-008 | minor | FTL-NRM-25/290926, penawaran `77f182be-2586-4b97-ad7a-4832bc8abafa`: Rencana Akhir Kirim 3 Oktober 2026 15:00 WIB sudah lewat. API: `berlakuState=EXPIRED`, `badge=null`, `tidakBerlakuAt=null`. Daftar dan Detail tidak menampilkan Tidak Berlaku; card memuat badge lelang Selesai. Recheck reload + daftar 100 data konsisten. | Selaraskan status/badge dengan rule Tidak Berlaku. Konfirmasikan apakah lelang Selesai punya pengecualian yang belum tertulis; uji enforcement backend dengan fixture batas waktu yang diisolasi. |
| SCN-0020, SCN-0021 | NEED RECHECK — pemetaan tanggal | REQ-006 | — | UI hanya Mulai Berlaku, API `berlakuMulaiAt`; tanggal akhir masa berlaku tidak terverifikasi. Tanggal hari ini pada fixture run diamati AKTIF; contoh tanggal lampau EXPIRED dengan badge null, tetapi observasi ini tidak otomatis membuktikan semantik tanggal akhir. SCN-0021 akhirnya blocked, bukan passed atas asumsi pemetaan. | Tentukan field tanggal akhir masa berlaku dan semantik label/UI sebelum verdict rule < dan = hari ini. |
| SCN-0022 | NEED RECHECK — fixture waktu | REQ-006 | — | Pergantian hari server/bisnis D→D+1 tidak terjadi selama run. Jam browser tidak dimajukan untuk menyimulasikan tanggal backend. | Jalankan observasi lintas tengah malam atau sediakan clock/fixture terkontrol yang sah di environment uji. |
| SCN-0023, SCN-0024 | NEED RECHECK — rule ambigu | REQ-007 | — | Closing masa depan pada fixture FCL-NRM-13/051026 TANTO/20 ft: 7 Oktober 2026 19:28 WIB, API AKTIF dan badge null. Closing masa lalu pada FCL-NRM-15/011026 SPILL: 4 Oktober 2026 07:00 WIB, EXPIRED dan badge null; Mulai Berlaku juga lampau, Rencana Akhir Kirim 7 Oktober 2026 17:00 WIB. Rule menyebut lewat (<) dan jadwal melebihi sekarang (>) sekaligus. | Pastikan pembanding < atau > serta field Closing Time vs ETD; ulang fixture masa lalu dengan tanggal berlaku yang dapat diisolasi. Jangan deklarasikan BUG berdasarkan arah yang diasumsikan. |
| SCN-0027 | TEST ISSUE — akun/prasyarat | REQ-009 | — | Hanya satu akun Vendor tersedia, sehingga kombinasi sama oleh vendor kedua pada lelang yang sama belum bisa diuji. | Sediakan akun vendor kedua yang diundang ke fixture uji. |

Ringkasan klasifikasi: 1 BUG probable, 5 skenario NEED RECHECK, 1 TEST ISSUE/prasyarat. Enam skenario tersebut blocked, bukan enam bug aplikasi.

## Yang lulus

- FCL: input pertama, duplikasi di satu submit dan terhadap data tersimpan (harga/tanggal berbeda tetap ditolak), pelayaran berbeda, kontainer berbeda, dan kombinasi sama di lelang berbeda.
- FTL: input pertama, duplikasi di satu submit dan terhadap data tersimpan ditolak, armada berbeda diizinkan.
- Edit FCL dan FTL naik/turun mempertahankan ID dan jumlah penawaran; tidak membentuk versi Tidak Berlaku.
- Bid FTL sama/naik ditolak; bid turun berulang tetap pada ID awal. Bid FCL berulang mempertahankan jadwal dan atribut selain harga.
- Lelang Ulang: harga lama belum Kadaluwarsa sebelum harga baru tersimpan; simpan invalid tidak mengubah status; simpan berhasil membuat harga lama Kadaluwarsa. Kombinasi sama di putaran baru dapat diinput pertama kali, duplikasi berikutnya dalam putaran yang sama ditolak. Cakupan unik per putaran merupakan interpretasi gabungan rule ulang + input unik, bukan perubahan yang ditebak tanpa pencatatan.
- Rencana Akhir Kirim masa depan pada fixture aktif tidak membuat penawaran Tidak Berlaku.

## Batas temuan SCN-0025

Sampel existing bersifat read-only dan berstatus lelang Selesai; tanggal Mulai Berlaku juga lampau. Bukti mengonfirmasi **ketiadaan status/badge Tidak Berlaku pada UI**, bukan bahwa backend sama sekali mengabaikan expiry (API justru EXPIRED), dan bukan bukti penawaran expired masih bisa dibid/dipakai order. Rule user tidak memberi pengecualian Selesai, tetapi enforcement khusus Rencana Akhir Kirim belum diisolasi. Severity minor usulan karena dampak yang terbukti pada tampilan/status.

Bukti: `results/ams009-harga-penawaran-rules__20261005-051211.json`, `artifacts/screenshots/20261005-051211/SCN-0025.png`, `artifacts/screenshots/20261005-051211/SCN-0025-recheck.png`, dan `artifacts/harga-rules/20261005-051211/dates-detail.json`. Screenshot recheck memuat card penuh: FTL, Selesai, Trailer 20 FT; tidak ada Tidak Berlaku.

## Data uji dan handoff

Fixture run masih tersedia, tidak dibersihkan agar bukti dapat ditinjau:

| Kode | No. Lelang | ID | Deskripsi |
|---|---|---|---|
| FTL | FTL-NRM-12/051026 | a05dcef7-5770-4a6a-9d8e-b0c5bf4addc5 | AUTOTEST-20261005-RULES-FTL |
| FCL | FCL-NRM-13/051026 | f6a435dc-6f85-461a-9e6e-ac2545bf2e25 | AUTOTEST-20261005-RULES-FCL |
| ULANG | FCL-NRM-14/051026 | 67a21b6c-724a-4648-9fab-c93777c11d24 | AUTOTEST-20261005-RULES-ULANG, putaran 1 |

Harga, ID record, dan jadwal final ada di `artifacts/harga-rules/20261005-051211/fixtures-final.json`. Tidak mengubah setting/master, data existing, atau akun vendor. Hasil run lama tidak ditimpa atau direklasifikasi otomatis berdasarkan requirement baru.

Selesai: dokumen requirement dan skenario AMS004/AMS005 diperbarui, skenario terstruktur dinormalisasi, 30 verdict regresi AMS009 dicatat, laporan batch dan final dibuat. Tersisa: enam skenario blocked beserta prasyarat/keputusan di tabel di atas. Belum ada perbaikan kode aplikasi karena repository ini hanya mesin testing AMS.
