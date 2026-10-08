# Rencana eksplorasi menu dan rule — 8 Oktober 2026

Permintaan: eksplorasi seluruh menu dan rule, mencari improve di luar spec/skenario, dikerjakan per batch. Satu giliran mengerjakan satu batch; jangan otomatis menjalankan semua modul. Ini eksplorasi read-only sesuai docs/workflows/explore.md, bukan kelanjutan run test-module sebelumnya.

## Pembagian batch

| Batch | Area dan cakupan kedua role bila tersedia | Dokumen pembanding | Status |
|---|---|---|---|
| 01 | Navigasi Admin/Vendor; Monitoring, Operasional, Distribusi & Muatan, Dashboard Lelang | module-map dan inventaris 4 Oktober; belum ada skenario dashboard khusus | Inventaris + interaksi utama selesai; kandidat/backlog di laporan lanjutan |
| 02 | Spot Rate: daftar, FCL/FTL, reuse, form step yang dapat diakses tanpa submit, draft, peserta, detail, riwayat pembatalan/perubahan | AMS001/002, keputusan terbaru | Read-only Admin/Vendor selesai; lihat laporan Batch 02 |
| 03 | Lelang Kontrak kedua role: daftar, periode, form, detail, riwayat, penawaran | Belum ada suite khusus | Read-only Admin/Vendor selesai; kandidat dan backlog pada laporan Batch03 |
| 04 | Live Bidding Spot/Kontrak, Laporan Lelang kedua role | AMS003/005 | Read-only Admin/Vendor selesai; ekspor dan batas di laporan Batch04 |
| 05 | Penawaran, Input/Edit/Bid harga, Detail Harga, Jadwal, Request Jadwal dan expiry | AMS004/006/007/009, rule 5 Oktober | Read-only Admin/Vendor selesai; kandidat, perubahan rule dan batas pada laporan Batch05 |
| 06 | Negosiasi kedua role: daftar, detail, riwayat, status, harga, aksi tersedia dan timer | AMS008, Nego.docx, audit 8 Oktober | Read-only Admin/Vendor selesai; guard, harga pending, perubahan fixture dan improve pada laporan Batch06 |
| 07 | Order, Batch Order, detail/form, riwayat pembatalan/tidak aktif, Tracking dan Simulasi Muatan | Spec Order eksternal AMS009/010/017; belum suite khusus di repo | Read-only Admin/Vendor selesai; batas render3D/fixture di laporan Batch07 |
| 08 | Master Wilayah dan Drop Point: list, form, dependensi wilayah, detail, riwayat | Inventaris lama; belum ada suite khusus | Read-only Admin dan navigasi Vendor selesai; template/improve/batas di laporan Batch08 |
| 09 | Master Operasional lainnya: waktu perjalanan, pelabuhan, pelayaran, barang, kemasan, unit/jenis armada/kontainer, sopir, CS; master Vendor | Inventaris lama; belum ada suite khusus | Read-only Admin/Vendor selesai; kandidat CS, gap status dan batas di laporan Batch09 |
| 10 | Manajemen Vendor, sub-user/hak akses, Akun Saya, Pengaturan Sistem, pusat/preferensi notifikasi | Keputusan Vendor dan inventaris lama | Read-only Admin/Vendor selesai; kandidat filter, recheck Vendor Menunggu dan batas di laporan Batch10 |

## Cara mencatat setiap batch

- Peta menu, route yang benar-benar ditemukan, tab, form dan modal sampai dua tingkat; screenshot per modul utama.
- Rule diamati lewat label/help, disabled state, pilihan, validasi aman atau respons baca. Bedakan rule eksplisit dokumen, observasi UI, dan rule belum terverifikasi.
- Temuan diberi identitas: perubahan dibanding bukti lama, gap skenario, kandidat bug, atau usulan improve. Fitur tanpa dokumen bukan otomatis fitur baru aplikasi atau bug.
- Untuk rule yang memerlukan submit/transisi/status/fixture, catat pekerjaan tersisa; jangan menyatakan rule backend terbukti hanya dari UI.
- Tidak submit/simpan/hapus atau mengubah setting. Tidak merespons/mengakhiri fixture nego deadline 9 Oktober dari audit sebelumnya.
- Hipotesis CLAUDE.md diverifikasi bertahap: list/form/dropdown/date picker/modal pada batch relevan. Tidak mengubah status lama tanpa bukti baru.
- Tiap batch menyimpan laporan Markdown dan bukti tersamarkan. Tidak mengubah expected/skenario lama hanya dari observasi atau memberikan verdict formal/Excel sebelum menjalankan workflow yang sesuai.

## Kelanjutan

[Laporan gabungan Batch01–10](explore-consolidated-20261008.md) menjadi acuan utama untuk cakupan, register temuan, rekonsiliasi rule dan backlog prioritas. Laporan per batch dipertahankan sebagai bukti rinci.

Seluruh10batch rencana sudah mempunyai laporan eksplorasi. [Batch10](explore-batch10-20261008.md) selesai untuk cakupan baca. Tidak otomatis menjalankan batch tambahan atau workflow test-module. Rulebackend, mutasi dan fixture yang belum tersedia tetap backlog perlaporan. [Batch09](explore-batch09-20261008.md) selesai untuk cakupan baca, dengan kandidat templateCS dan gap jenisnonaktif. [Batch08](explore-batch08-20261008.md) selesai untuk cakupan baca wilayah/perusahaan/lokasi, dengan batas backend/mutasi eksplisit. [Batch07](explore-batch07-20261008.md) selesai untuk cakupan baca, dengan perhitungan tanpa simpan dan batas render3D/fixture. [Batch06](explore-batch06-20261008.md) selesai untuk cakupan baca dengan batas mutasi/fixture eksplisit. [Batch05](explore-batch05-20261008.md) selesai untuk cakupan baca dengan batas fixture/mutasi eksplisit. [Batch04 Live Bidding/Laporan](explore-batch04-20261008.md) selesai untuk cakupan baca yang diperiksa. [Batch03 Kontrak](explore-batch03-20261008.md) selesai untuk cakupan baca yang diperiksa. [Laporan Batch 02](explore-batch02-20261008.md) mencatat kandidat dan backlog verifikasi. Menu baru yang ditemukan dimasukkan ke batch area terkait. Batch 01 mencakup interaksi utama dan tiga ekspor PDF; lihat [laporan lanjutan](explore-batch01-lanjutan-20261008.md). Rekonsiliasi internal berhasil, tetapi otorisasi backend, seluruh record sumber, boundary fixture dan seluruh menu Vendor belum dibuktikan.
