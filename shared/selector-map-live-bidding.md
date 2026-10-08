# Selector Map — Live Bidding/Laporan, 8 Oktober 2026

Dari [eksplorasi Batch04](../explore/explore-batch04-20261008.md), read-only. AMS003/005 untuk Spot; Kontrak belum suite khusus.

| Area | Elemen | Selector/route | Catatan |
|---|---|---|---|
| Admin Spot | Live/Laporan | `/lelang/live-bidding` | Tab berganti pada route sama |
| Admin Kontrak | Live/Laporan | `/lelang-kontrak/live-bidding` | Periode Kontrak, bukan Pengiriman |
| Vendor Spot | Live | `/vendor-portal/live-bidding` | Tanpa Laporan pada sampel |
| Vendor Kontrak | Live | `/vendor-portal/lelang-kontrak/live-bidding` | Tanpa Laporan; cardIK kosong |
| Admin | Laporan Lelang | `page.getByText('Laporan Lelang',{exact:true})` | Berhasil; scope tab jika ada teks lain |
| Semua role | Sub-tab jenis | `page.getByRole('tab',{name:'FCL (Full Container Load)',exact:true})` | FTL/ Semua Jenis Pengiriman juga role=tab |
| Filter | Pembuka | `page.getByRole('button',{name:/^Filter/})` | Klik eksplisit, tunggu animasi; kontrol terklip bisa tetap dianggap visible |
| Filter | No | `page.getByPlaceholder('Masukkan No. Lelang')` | Terapkan/Reset baca |
| Filter Admin | Tanggal | `page.getByRole('button',{name:'DD/MM/YYYY',exact:true})` | Dua trigger; scope Buka/Tutup |
| Filter Vendor | Tanggal | `page.getByRole('button',{name:'DD/MM/YYYY hh:mm',exact:true})` | Dua trigger; kalender dapat tetap terbuka setelahEscape, klik luar dahulu |
| Kalender | Hari | `page.locator('button.h-9.w-9')` | Admin Spot50tombol, bukan konstanta43; filter overflow/navigation |
| Ukuran halaman | Tampilkan | `page.locator('select')` | Native10/20/50/100; Admin menghitung lelang, bukan card |
| Export | Unduh | `page.getByRole('button',{name:'Export',exact:true})` | Admin Laporan saja; tunggu download dan verifikasi workbook |
| Card | Detail | `page.getByRole('link',{name:'Detail Lelang',exact:true})` | Scope card; Kontrakreport navigasi diverifikasi |
| Card | Lihat Penawaran | `page.getByRole('button',{name:'Lihat Penawaran',exact:true})` | Report saja, route/action tidak dipetakan ulang seluruhnya |
| Card rute | Multipickup | `page.getByRole('button',{name:'Multipickup',exact:true})` | Scope card; popover Pickup1/2 terisi pada sampel |

Testid0 pada inventory. Form Bid/riwayat Vendor belum bisa dipetakan karena tidak ada card aktif. Jangan menunggu networkidle atau response.json untuk koneksi stream/event tanpa batas; gunakan elemen siap dan pengecualian event-stream. Snapshot awal Memuat bukan hasil final.
