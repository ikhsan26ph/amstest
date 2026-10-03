# Triase ams006-tambah-jadwal-vendor — run 20261001-093252

| SCN | Klasifikasi | Rujukan (REQ/FND) | Severity | Analisis singkat | Rekomendasi |
|---|---|---|---|---|---|
| POS-013 | BUG (probable) | REQ-013 | major | Penyimpanan valid lulus, tetapi waktu yang dimasukkan sebagai WIB tampil bergeser +7 jam pada browser UTC. | Format dan parse waktu jadwal secara eksplisit dengan zona `Asia/Jakarta`; uji tambah/detail pada browser WIB dan UTC. |
| POS-018 | BUG (probable) | REQ-018 | major | Edit yang hanya mengubah Voyage menggeser Closing/ETD/ETA +7 jam pada payload tersimpan. | Jangan parse ulang nilai prefill sebagai UTC/lokal secara ganda; tambahkan regression test edit tanpa menyentuh waktu. |
| POS-022 | BUG (probable) | REQ-022 | major | `Download Template`, `Import Jadwal`, dan input file tidak tersedia, meski fitur ada di requirement dan desain 075.png. | Implementasikan import Direct dan validasi format sesuai REQ-022. |
| NEG-006 | BUG (probable, UX) | REQ-006 | minor | UUID tak dikenal menampilkan pesan benar, tetapi ID malformed dan ID harga FTL menampilkan tabel kosong tanpa pesan konteks/error meski API 400/409. Tidak ada data jadwal bocor. | Tangani semua respons konteks gagal dengan pesan yang konsisten dan hentikan render tabel. |
| NEG-009 | DESIGN GAP | REQ-009 | minor | Filter tanpa hasil memakai empty state umum `Belum ada jadwal pada harga penawaran ini.`, bukan copy khusus hasil filter `Data jadwal tidak ditemukan`. Fungsi filter/reset tetap berjalan. | Konfirmasi copy produk; bedakan empty state awal dan hasil filter bila desain dipertahankan. |
| EDG-006 | BUG (probable) | REQ-008 | minor | Hanya lima header gabungan yang sortable; Voyage dan Open Stack tidak dapat diurutkan sebagai kolom/nilai tersendiri. | Sediakan sort untuk semua field yang diwajibkan atau revisi REQ-008 agar mengikuti header gabungan. |

Ringkasan: **5 BUG (probable)** dan **1 DESIGN GAP**. Tidak ada failure yang diklasifikasikan sebagai test issue setelah rerun dan koreksi harness.
