# Selector Negosiasi — Batch06, 8 Oktober 2026

Peta observasi read-only, bukan bukti submit/backend. Sumber rule: AMS008, Nego.docx dan keputusan7–8Oktober. Jangan memakai proposedtestid dari analysis tanpa inspeksi.

| Area | Route/locator nyata | Catatan |
|---|---|---|
| Admin daftar | `/negosiasi`; role tab /^Semua/, /^Perlu Aksi/, /^Menunggu Vendor/, /^Selesai/ | Counter dinamis; select ukuranpage native |
| Vendor daftar | `/vendor-portal/negosiasi`; role tab /^Menunggu Shipper/ | Sampel2record; tanpa linkTidakDirespons |
| TidakDirespons | role link Tidak Direspons → `/negosiasi/tidak-direspons` | Bukan button;2record |
| Filter | button /^Filter/; placeholder Masukkan ID Order, Masukkan Vendor, Masukkan Total Harga; Reset/Terapkan | IDOrder sebenarnya mencari nomorlelang; buka panel eksplisit, clippedDOM dapat tampakvisible |
| Jenis filter | button Pilih Jenis Order → role option FCL (Full Container Load)/FTL (Full Truck Load) | Kustombutton+listbox/option |
| Row aksi | role row filter hasText nomorlelang dan vendor → button Aksi negosiasi | Ada baris kosong sebelumrecord; jangan tbodytr.first; nomorlelang saja tidakunik untukmultiVendor |
| Menu | button Detail Nego/Riwayat Nego/Ajukan Nego Kembali/Terima Nego | Label aktual bukan Detail/Riwayat; scope jika duplikat |
| Detail | `/negosiasi/{id}` atau `/vendor-portal/negosiasi/{id}` | ID dariUI; RiwayatNego menu menuju detail |
| Shipper modal | button Ajukan Nego; placeholder0; button Batal/Kirim | Tanpa role=dialog pada sampel; pending menampilkanguard, bukanmodal |
| Guard | heading Aksi Tidak Dapat Dilakukan; button Mengerti | Pending: Nego sedang menunggu respon vendor. |
| Bulk | `/negosiasi/ajukan` dengan querydariUI; checkbox dalamcard; nominalplaceholder0 | FilterTargetJam juga placeholder0; scope Nominalatau elemenakhir hasilinventory, jangan globalstrictplaceholder |
| BulkBatal | role link Batal → routepenawaran asal | Bukanbutton |
| Vendor respons | button Terima Nego/Ajukan Balasan/Tolak Nego | Openingmodal read-only; jangan persetujuanYa/Kirim/Tolak final saat explore |
| Acceptmodal | teks Anda Yakin Terima Nego?; button Batal/Ya |0dialog |
| Countermodal | teks Ajukan Balasan; placeholder0; Batal/Kirim |0dialog; numericformatribuan |
| Rejectmodal | placeholder Tuliskan alasan penolakan; chipKapasitasperiode/Hargadibawahbiaya/Biayanaik; buttonariaTutup | Heading dan dua tombolTolakNego dapatduplikat; tutup tanpa submit |
| Sort list | role columnheader Rute | clicknative berfungsi; th tanpa tabindex/aria-sort pada sampel |

0testid pada list/detail/modalform, tabrole=tab, dropdownkustom/pageSelectnative. Tidak semua header dapat diurutkan. Guard/timer harus diperiksa dari API dan status aktual, jangan memakaideadlinefixturelama setelahputaranberubah. Tidak menunggu stream/respons tanpa batas. Aksi tulis tidak tersedia dalam eksplorasi ini.
