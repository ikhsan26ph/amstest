# Selector Master Wilayah / Drop Point — 8 Oktober 2026

Sumber: explore/explore-batch08-20261008.md. Parameter login/baseURL dibaca dari config/env.md; klik native berhasil.0testid/0role=dialog pada inventaris yang diperiksa; jangan mengasumsikan semua modal seluruh aplikasi sama.

| Area | Pola | Batas |
|---|---|---|
| Daftar wilayah |/master/provinsi, /kota, /kecamatan, /kelurahan |Filter harus dibuka lewat button Filter eksplisit; Reset/Terapkan di panel terklip bisa tetap dianggap visible. |
| Filter nama |Placeholder Masukkan Provinsi / Masukkan nama kota / Masukkan kecamatan / Masukkan Kelurahan/Desa |Nama placeholder case berbeda. Setelah Terapkan/Reset tunggu settled dan counter. |
| Ukuran halaman |select native,10/20/50/100 |selectOption hanya pada select. Provinsi page2 button name2 native. |
| Dropdown wilayah |button nama placeholder/nilai → role option nama aktual |Scope perbaris pada multirow; setelah ganti induk periksa reset pilihan turunannya. |
| Tambah wilayah |/master/{area}/tambah; Tambah Baris Input; Batal |Simpan tidak diklik. Tambah Baris hanya lokal. |
| Edit wilayah |button Edit Data (Provinsi/Kelurahan), Edit (Kota/Kecamatan) |Panel di list; scope row dengan nama/induk, jangan indeks tetap. Batal lalu tunggu panel tertutup. |
| Perusahaan |/master/customer; row namaPerusahaan→button Detail/Edit Informasi Perusahaan |Hapus data tidak diklik. Detail lokasi adalah tingkat kedua, bukan daftarperusahaan. |
| Form perusahaan |Nama Perusahaan; getByText('Tambah Detail Lainnya',{exact:true}) |Toggle bukan button pada sampel; checkbox/input terkait teramati. Edit Perusahaan berpindah halaman async; tunggu field nama terisi. |
| Detail perusahaan |row lokasi→button Detail/Edit; Tambah Drop Point |Estate89 memakai panel tanpa role=dialog; Tutup detail dan Batal edit. |
| Form lokasi |Pilih Provinsi/KotaKab/Kecamatan/DesaKelurahan; placeholderKodePos disabled |Kandangan60199, Sambikerep60217 pada sampel. Edit data bergantung lookup async, jangan assert placeholder kosong sebelum settled. |
| Template lokasi |Download Template; listener page.waitForEvent('download') sebelum klik |Template_droppoint-kelola.xlsx diunduh; Import Data tidak dijalankan. |
| Peta |button aria Perbesar/Perkecil; OpenStreetMap |Tidak dragmarker/geocoding; baca koordinat existing saja. |
| Riwayat |/master/riwayat/{area}; teks Riwayat Perubahan/Penghapusan |Expand button berisi namaPerusahaan+timestamp; nama SUB muncul dua kali, scope catatan. |
| Batal halaman tambah |Batal → konfirmasi Ya/Tidak |Ya hanya membuang input lokal sesi; bukan pembatalan data bisnis. Panel Tambah DropPoint langsung tutup pada sampel; tunggu transisi. |

Tidak membuka URL Master Admin pada Vendor sebagai uji izin; sidebar Vendor tidak memiliki menu terkait. Guard jaringan hanya GET/HEAD/OPTIONS dan auth, semua businesswrites tetap diblokir. Native datepicker dan storageState tidak diuji ulang pada batch ini.
