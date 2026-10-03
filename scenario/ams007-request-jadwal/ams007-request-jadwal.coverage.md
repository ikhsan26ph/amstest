# Coverage — ams007-request-jadwal

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 20 |
| Negative | 28 |
| Edge | 3 |
| Stress | 5 |
| **Total** | **56** |

Seluruh 20 requirement memiliki sedikitnya satu scenario positive dan satu scenario negative. Delapan konteks layar yang muncul pada artefak scenario tercakup: Lelang Spot Rate Shipper, Request Jadwal Shipper, Detail Harga Penawaran Shipper, Daftar Penawaran Vendor, Lelang Spot Rate Vendor, Respon Request Jadwal Vendor, Update Jadwal Vendor, dan Riwayat Perubahan Vendor.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Ketersediaan fitur khusus FCL | AMS007-POS-001, AMS007-NEG-001 |
| REQ-002 | Dua jalur akses shipper | AMS007-POS-002, AMS007-NEG-002 |
| REQ-003 | Kelayakan lelang dan alert | AMS007-POS-003, AMS007-NEG-003, AMS007-NEG-004, AMS007-NEG-005, AMS007-NEG-006 |
| REQ-004 | Info read-only dan daftar eligible | AMS007-POS-004, AMS007-NEG-007 |
| REQ-005 | Badge penawaran tanpa jadwal | AMS007-POS-005, AMS007-NEG-008 |
| REQ-006 | Multi-select, counter, dan pagination | AMS007-POS-006, AMS007-NEG-009, AMS007-EDG-001, AMS007-STR-003 |
| REQ-007 | Minimal pilihan dan pembatalan | AMS007-POS-007, AMS007-NEG-010 |
| REQ-008 | Konfirmasi, penyimpanan, notifikasi, penanda | AMS007-POS-008, AMS007-NEG-011, AMS007-STR-004 |
| REQ-009 | Request berulang dan integritas harga | AMS007-POS-009, AMS007-NEG-012, AMS007-STR-001 |
| REQ-010 | Update Jadwal dari menu Penawaran vendor | AMS007-POS-010, AMS007-NEG-013 |
| REQ-011 | Respon Request dari Lelang Spot Rate vendor | AMS007-POS-011, AMS007-NEG-014 |
| REQ-012 | Info umum dan dropdown lelang aktif | AMS007-POS-012, AMS007-NEG-015, AMS007-STR-002 |
| REQ-013 | Daftar request pending dan penghapusan card | AMS007-POS-013, AMS007-NEG-016, AMS007-STR-005 |
| REQ-014 | Penyelesaian seluruh request dan navigasi | AMS007-POS-014, AMS007-NEG-017 |
| REQ-015 | Modal form jadwal baru serta batal/kirim | AMS007-POS-015, AMS007-NEG-018 |
| REQ-016 | Validasi urutan waktu Direct/Connecting | AMS007-POS-016, AMS007-NEG-019, AMS007-NEG-020, AMS007-NEG-021, AMS007-NEG-022, AMS007-NEG-023, AMS007-EDG-002 |
| REQ-017 | Transisi status dan penghapusan badge | AMS007-POS-017, AMS007-NEG-024 |
| REQ-018 | Sinkronisasi detail ke shipper | AMS007-POS-018, AMS007-NEG-025 |
| REQ-019 | Penolakan update dan riwayat perubahan | AMS007-POS-019, AMS007-NEG-026, AMS007-NEG-027 |
| REQ-020 | Zona waktu WIB | AMS007-POS-020, AMS007-NEG-028, AMS007-EDG-003 |

## Gap

- Tidak ada gap coverage requirement: REQ-001 sampai REQ-020 semuanya memenuhi minimum positive dan negative.
- Tidak ada gap layar utama atau aksi inti Request Jadwal yang belum tercakup.
- Referensi desain tidak memperlihatkan state dialog konfirmasi pengajuan, pesan alert/error, form Connecting yang terbuka, empty state setelah seluruh respons selesai, push notification, atau Riwayat Perubahan. Scenario untuk perilaku tersebut diturunkan dari spesifikasi; teks/selector final perlu dikonfirmasi terhadap implementasi.
- Desain menandai Open Stack dengan tanda wajib, sedangkan spesifikasi menyatakannya opsional. Scenario mengikuti spesifikasi dan sengaja menguji Open Stack kosong.
- Filter/urutkan pada daftar harga dan filter daftar penawaran diperlakukan sebagai elemen pendukung, bukan requirement mandiri; selector telah diinventarisasi dalam analysis tetapi variasi kombinasinya tidak dieksplorasi sebagai scenario khusus modul ini.

## Validasi Gherkin dan JSON

- JSON berhasil diparse dan seluruh 56 ID unik.
- Hitungan aktual cocok dengan summary: 20 positive, 28 negative, 3 edge, 5 stress.
- Setiap scenario feature memiliki tepat satu padanan ID JSON.
- Tag kategori, prioritas, REQ, screen, dan ID konsisten dengan metadata JSON.
- Semua action JSON termasuk dalam enum yang diperbolehkan: navigate, fill, click, select, check, uncheck, atau expect.
- Struktur Gherkin memakai lokalisasi Indonesia (# language: id) dengan Given/When/Then/And dan pola langkah yang dapat dipetakan ke Playwright.
- Source JSON mencantumkan satu spec dan seluruh delapan desain; tidak ada extras.

## Pemeriksaan Duplikat

Tidak ditemukan judul identik maupun alur langkah terstruktur identik. Tidak ada scenario yang dibuang. Kasus-kasus yang berdekatan tetap dipertahankan karena memvalidasi rule berbeda, khususnya empat penyebab pengajuan tidak eligible pada REQ-003 dan lima cabang validasi waktu pada REQ-016.

## Rekomendasi

- Saat implementasi UI tersedia, verifikasi nama aksesibel dan ganti usulan data-testid hanya bila locator berbasis role/name tidak stabil.
- Tambahkan visual-regression atau component-level checks untuk state yang tidak tersedia pada PNG apabila desain finalnya diterbitkan.
- Untuk suite end-to-end produksi, jalankan stress scenario dengan data terisolasi dan batas waktu eksplisit agar tidak mencemari notifikasi vendor nyata.

