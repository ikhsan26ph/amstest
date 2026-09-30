# Coverage — ams003-live-bidding-shipper

## Ringkasan

| Kategori | Jumlah |
|---|---:|
| Positive | 15 |
| Negative | 15 |
| Edge | 5 |
| Stress | 5 |
| **Total** | **40** |

Seluruh 15 requirement memiliki minimal satu skenario positive dan satu skenario negative. Layar Live Bidding dicakup oleh 31 skenario dan Laporan Lelang oleh 9 skenario. Elemen penting dari desain—tab, filter, Reset, Terapkan, Export, dropdown Tampilkan, sub-tab FCL/FTL, card, rute multipoint, countdown, Top 3, total penawaran, Detail Lelang, Lihat Penawaran, dan pagination—tersentuh minimal sekali.

## Requirements Traceability Matrix

| REQ | Deskripsi | Scenario IDs |
|---|---|---|
| REQ-001 | Akses, kepemilikan data, jenis lelang, tab, dan WIB | AMS003-LIVE-BIDDING-SHIPPER-POS-001, AMS003-LIVE-BIDDING-SHIPPER-NEG-001 |
| REQ-002 | Filter pencarian, Terapkan, dan Reset | AMS003-LIVE-BIDDING-SHIPPER-POS-002, AMS003-LIVE-BIDDING-SHIPPER-NEG-002 |
| REQ-003 | Aturan filter kota/pelabuhan dan rute multipoint | AMS003-LIVE-BIDDING-SHIPPER-POS-003, AMS003-LIVE-BIDDING-SHIPPER-NEG-003 |
| REQ-004 | Sub-tab jenis, page size, dan pagination | AMS003-LIVE-BIDDING-SHIPPER-POS-004, AMS003-LIVE-BIDDING-SHIPPER-NEG-004, AMS003-LIVE-BIDDING-SHIPPER-STR-001 |
| REQ-005 | Siklus hidup card aktif, tutup, ulang, dan batal | AMS003-LIVE-BIDDING-SHIPPER-POS-005, AMS003-LIVE-BIDDING-SHIPPER-NEG-005, AMS003-LIVE-BIDDING-SHIPPER-STR-005 |
| REQ-006 | Isi card dan pemecahan per armada/kontainer | AMS003-LIVE-BIDDING-SHIPPER-POS-006, AMS003-LIVE-BIDDING-SHIPPER-NEG-006 |
| REQ-007 | Tampilan dan dialog detail rute | AMS003-LIVE-BIDDING-SHIPPER-POS-007, AMS003-LIVE-BIDDING-SHIPPER-NEG-007 |
| REQ-008 | Countdown realtime, warna, WIB, dan cutoff nol | AMS003-LIVE-BIDDING-SHIPPER-POS-008, AMS003-LIVE-BIDDING-SHIPPER-NEG-008, AMS003-LIVE-BIDDING-SHIPPER-EDG-001, AMS003-LIVE-BIDDING-SHIPPER-STR-003 |
| REQ-009 | Ranking Top 3 dan tie-break | AMS003-LIVE-BIDDING-SHIPPER-POS-009, AMS003-LIVE-BIDDING-SHIPPER-NEG-009, AMS003-LIVE-BIDDING-SHIPPER-EDG-002 |
| REQ-010 | Privasi, masking, dan pembaruan realtime Top 3 | AMS003-LIVE-BIDDING-SHIPPER-POS-010, AMS003-LIVE-BIDDING-SHIPPER-NEG-010, AMS003-LIVE-BIDDING-SHIPPER-EDG-003, AMS003-LIVE-BIDDING-SHIPPER-STR-002 |
| REQ-011 | Total penawaran dan periode lelang ulang | AMS003-LIVE-BIDDING-SHIPPER-POS-011, AMS003-LIVE-BIDDING-SHIPPER-NEG-011 |
| REQ-012 | Navigasi detail dan larangan aksi bid | AMS003-LIVE-BIDDING-SHIPPER-POS-012, AMS003-LIVE-BIDDING-SHIPPER-NEG-012 |
| REQ-013 | Isi, retensi H+3, status, dan urutan laporan | AMS003-LIVE-BIDDING-SHIPPER-POS-013, AMS003-LIVE-BIDDING-SHIPPER-NEG-013, AMS003-LIVE-BIDDING-SHIPPER-EDG-004 |
| REQ-014 | Top 3 terkunci dan aksi pada laporan | AMS003-LIVE-BIDDING-SHIPPER-POS-014, AMS003-LIVE-BIDDING-SHIPPER-NEG-014 |
| REQ-015 | Export Excel sesuai filter dan seluruh halaman | AMS003-LIVE-BIDDING-SHIPPER-POS-015, AMS003-LIVE-BIDDING-SHIPPER-NEG-015, AMS003-LIVE-BIDDING-SHIPPER-EDG-005, AMS003-LIVE-BIDDING-SHIPPER-STR-004 |

## Gap dan rekomendasi

Tidak ada gap terhadap requirement tertulis atau elemen penting yang terlihat pada dua desain. Pengujian implementasi nantinya tetap memerlukan fixture waktu terkontrol, kanal event realtime, data lintas shipper, data lelang ulang, dan pembaca `.xlsx` agar expected result dapat diverifikasi secara deterministik.

## Hasil validasi

- JSON valid dan `summary` sama dengan hitungan aktual: 40 total (15 positive, 15 negative, 5 edge, 5 stress).
- File feature memuat 40 Scenario dan seluruhnya memiliki ID padanan unik di JSON.
- Tag kategori, prioritas, REQ, dan screen cocok dengan metadata JSON untuk seluruh skenario.
- Semua langkah JSON memakai action yang diizinkan: `navigate`, `fill`, `click`, `select`, dan `expect`.
- Pola Gherkin diawali `Given`; aksi pengguna memakai `When`/`And`; hasil menggunakan `Then`. Skenario event otomatis dapat langsung bergerak dari kondisi `Given` ke verifikasi `Then`.
- Tidak ditemukan judul atau ID duplikat. Tidak ada skenario yang dibuang.
- Distribusi edge mencakup batas countdown, tie-break, kapasitas Top 3, H+3, dan ekspor tanpa bid. Distribusi stress mencakup volume card, bid paralel, banyak countdown, ekspor besar, dan race saat cutoff.
