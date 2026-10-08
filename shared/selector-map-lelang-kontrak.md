# Selector Map — Lelang Kontrak, 8 Oktober 2026

Pemetaan dari eksplorasi Batch03 read-only; bukan eksekusi suite formal. [Laporan/batas](../explore/explore-batch03-20261008.md). Jangan memakai selector Spot Rate untuk volume/periode/lokasi tanpa memeriksa DOM.

| Area | Elemen | Selector/route diamati | Catatan |
|---|---|---|---|
| List Admin | Filter | `page.getByRole('button', {name:/^Filter/})` | Aktif dapat menambah teks nama aksesibel |
| List Admin | Atur Periode | `page.getByRole('link', {name:'Atur Periode Kontrak'})` | `/lelang-kontrak/periode` |
| List Admin | Buat Lelang | `page.getByRole('button', {name:'Buat Lelang',exact:true})` | `/lelang-kontrak/buat` |
| List Admin | Riwayat Pembatalan | `page.getByRole('button', {name:'Riwayat Pembatalan',exact:true})` | `/lelang-kontrak/riwayat`; label historis berbeda |
| Card | Aksi | `page.getByText(noLelang,{exact:true}).locator('../..').locator('button[title=Aksi]')` | DOM fallback; title tanpa aria-label. Tunggu daftar stabil; menu dapat tertutup saat render |
| Card | Menu | `page.getByRole('button',{name:action,exact:true})` | Detail/Edit Data/Edit Peserta Lelang/Lihat Penawaran/Batalkan Lelang/Riwayat Perubahan/Hapus Draf; jangan aksi tulis |
| Draf | Edit Data | `/lelang-kontrak/buat?id={draftId}` | Dibuka melalui menu; bukan route edit submitted |
| Periode | Detail | `page.getByRole('button',{name:'Lihat Detail',exact:true})` | Scope baris tabel; modal tanpa navigasi |
| Periode | Edit | `page.getByRole('button',{name:'Edit Periode',exact:true})` | Scope baris; sebagian disabled |
| Periode | Jumlah lelang | `page.getByRole('button',{name:'1 Lelang',exact:true})` | Scope baris; modal daftar, angka dinamis |
| Form | Pilih mode periode | `page.getByText('Pilih Periode Kontrak',{exact:true})` | Awalnya teks/radio, bukan button. Setelah mode dipilih muncul button dropdown dengan nama sama |
| Form | Dropdown periode | `page.getByRole('button',{name:'Pilih Periode Kontrak',exact:true})` | Pilih via role option; label berubah sesudah memilih |
| Form | FCL/FTL | `page.getByRole('button',{name:/FCL/})`, `{name:/FTL/}` | Accessible name mengandung spasi; regex tanpa mengasumsikan concat |
| Form | Volume Armada | `page.getByPlaceholder('Masukkan Volume Armada')` | Kontrak; bukan Jumlah Armada Spot Rate |
| Form | Tambah lokasi | `page.getByRole('button',{name:'Tambah Baris Input',exact:true})` | Dua tombol, scope pengirim/penerima; disabled mengikuti metode FCL |
| Modal kalender | Hari | `page.locator('button.h-9.w-9')` | 43tombol termasuk navigasi/overflow; jangan hitung semua sebagai tanggal aktif |
| Form Batal | Tidak/Ya | `page.getByRole('button',{name:'Tidak',exact:true})` | Konfirmasi0roleDialog; Tidak mempertahankan form |
| Vendor | Search | `page.getByPlaceholder('Cari No. Lelang / pelabuhan')` | Isi/clear + Enter; tidak ada tombol Reset pada list |
| Vendor | Detail | `/vendor-portal/lelang-kontrak/{id}` | Dari menu; sampel FTL04/081026 |
| Vendor | Riwayat Perubahan | `page.getByRole('button',{name:'Riwayat Perubahan',exact:true})` | Tujuan salah `/vendor-portal/penawaran`, B03-C02; bukan route riwayat yang terverifikasi |

Tampilkan `<select>` native; form dropdown kustom. Testid0 pada inventaris list/form. Simpan/Selanjutnya/Simpan ke Draft/hapus/batalkan tidak diklik. Harga/form peserta/semua modal rincian belum dipetakan lengkap. Selector role untuk Reset bisa cocok kontrol terklip dalam DOM; periksa keadaan panel aktual dan pointer sebelum mengasumsikan filter terbuka.
