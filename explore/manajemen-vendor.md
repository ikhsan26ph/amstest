# Eksplorasi Manajemen Vendor (AMS)
Eksplorasi manajemen-vendor — 2026-09-23, read-only, dijalankan via harness Playwright lokal headless
(`artifacts/probe/probe.js` + probe `artifacts/probe/vendor/v1…v5-*.js`). Login Admin Utama sukses
pada percobaan pertama (sesi dipakai ulang dari `artifacts/.auth`).

**Eksplorasi layar read-only murni**: tidak ada klik Simpan/Terapkan, tidak ada upload. Form Tambah/Edit hanya dibuka,
kartu pilihan diklik untuk melihat field yang muncul, lalu ditinggalkan (dialog Batal → "Tidak").
Semua request API yang tercatat adalah `GET` (plus `POST /api/auth/refresh` bawaan sesi). Pengecualian: section "Verifikasi Riwayat (V-3)"
adalah run tulis terpisah yang disetujui user (1 vendor AUTOTEST dibuat + 2x edit).

## Peta Layar

| # | Layar | Route | Jenis | Aksi Utama | Catatan |
|---|---|---|---|---|---|
| MV-1 | Daftar Vendor | `/manajemen-vendor` | List/tabel | `Tambah Vendor` (link → `/manajemen-vendor/tambah`), `Filter` (toggle panel), `Riwayat` (→ `/manajemen-vendor/riwayat`), `Tampilkan` (`<select>` native 10/20/50/100, default **20**) | 3 data live. Menu aksi baris (ikon ⋮, `title="Aksi"`) = **Detail, Edit saja** — tidak ada Hapus/Nonaktifkan dari list |
| MV-2 | Panel Filter | dalam `/manajemen-vendor` | Panel filter (tersembunyi default) | `Reset`, `Terapkan` | 7 field, lihat di bawah |
| MV-3 | Riwayat Manajemen Vendor | `/manajemen-vendor/riwayat` | List/tabel | `← Kembali`, `Filter` (Nama Vendor, Tanggal Perubahan `dd/mm/yyyy`, Diubah Oleh "Nama atau email user"), `Reset`, `Terapkan` | Kolom: No, Nama Vendor, Tanggal Perubahan, Diubah Oleh, Total Perubahan. Saat eksplorasi awal: **"Belum ada riwayat perubahan vendor."** Hanya mencatat **edit** (create tidak masuk Riwayat, sesuai desain — konfirmasi user 2026-09-23). |
| MV-4 | Tambah Vendor | `/manajemen-vendor/tambah` | Form (field dinamis) | `Batal` (→ dialog konfirmasi), `Simpan` | Field berubah sesuai kartu Metode Registrasi × Pengelola, lihat di bawah |
| MV-5 | Detail Vendor | `/manajemen-vendor/{uuid}` | Detail (read-only) | `← Kembali`, `Edit Vendor` (link → `/{uuid}/edit`) | Section "Informasi Umum" (badge status) + "Informasi Perusahaan" |
| MV-6 | Edit Vendor | `/manajemen-vendor/{uuid}/edit` | Form | `← Kembali`, `Batal` (→ dialog konfirmasi), `Simpan` | Kartu Metode Registrasi **tidak tampil** (hanya Pengelola); ada dropdown Status |

### MV-1 Daftar Vendor — kolom tabel
Header 2 baris per kolom: **Nama Vendor** / Alias (bisa diurutkan) · **Email** / No. WhatsApp · **Pengelola**
(badge `Vendor` biru / `Admin` oranye) · **CS Penanggung Jawab** / No. WhatsApp CS · **Status** (badge) · ⋮ Aksi.

Data live (API `GET /api/vendors?page=1&limit=20`, `totalData: 3`):

| Nama (Alias) | Pengelola | Metode Registrasi (API) | Status | CS di list | Akun vendor (API `vendorUser`) |
|---|---|---|---|---|---|
| spf (spf) | Vendor | DIBANTU_ADMIN | Aktif | "CS Vendor" / - | ada, ACTIVE |
| Verstappen (VER) | Admin | DIBANTU_ADMIN | Aktif | - / - | null |
| PT. Hamilton (HAM) | Vendor | MANDIRI | Aktif | "CS Vendor" / - | (tidak diperiksa) |

Tidak ada data berstatus **Menunggu** atau **Tidak Aktif**. Tidak ada data berprefix `AUTOTEST-` (kondisi sebelum run tulis V-3).

### MV-2 Panel Filter
| Field | Tipe | Opsi live |
|---|---|---|
| Nama Vendor | input teks, ph "Masukkan Nama Vendor" | — |
| Alias | input teks, ph "Masukkan Alias" | — |
| Status | dropdown button (`aria-haspopup="listbox"`), "Pilih Status" | Menunggu, Aktif, Tidak Aktif |
| Email | input teks, ph "Masukkan Email" | — |
| No. WhatsApp | input teks, ph "Masukkan No. WhatsApp" | — |
| Pengelola | dropdown button, "Pilih Pengelola" | Vendor, Admin |
| CS Penanggung Jawab | dropdown button, "Pilih CS Penanggung Jawab" | **"Tidak ada pilihan"** — `GET /api/customer-services/options` → `data: []` |
| No. WhatsApp CS | input teks, ph "Masukkan No. WhatsApp CS" | — |

### MV-4 Tambah Vendor — matriks kartu × field
Kartu pilihan berupa `<button>` (tanpa `aria-pressed`/`role=radio`; status aktif hanya terlihat dari class border).
Default saat halaman dibuka: **Registrasi Mandiri + Vendor**.

| Metode Registrasi | Pengelola | Kartu Admin | Section | Field yang tampil |
|---|---|---|---|---|
| Registrasi Mandiri | Vendor (terkunci) | **disabled** + hint "Registrasi Mandiri hanya berlaku untuk Pengelola Vendor." | Informasi Dasar | Nama Perusahaan*, Email* (hint "Email perusahaan/PIC perusahaan") |
| Registrasi Dibantu Admin | Vendor | enabled | Informasi Perusahaan | Nama Perusahaan*, Alias Perusahaan, No. WhatsApp* (ph "Contoh: 081234567899", maxlength 15), Email*, Nama PIC Perusahaan*, Provinsi*, Kota/Kab.*, Kecamatan*, Desa/Kelurahan* (dropdown berjenjang), Kode Pos (disabled, auto), Alamat* (textarea), Catatan Tambahan (textarea), Dokumen Tambahan (upload, "Maksimal 4MB dengan format .pdf, .jpg atau .jpeg") |
| Registrasi Dibantu Admin | Admin | enabled | Informasi Perusahaan | Sama persis dengan baris di atas |

Deskripsi kartu: *Registrasi Mandiri* — "Vendor menerima email undangan dan melengkapi data registrasi secara
mandiri." · *Registrasi Dibantu Admin* — "Admin shipper mengisi data vendor dan sistem mengirimkan informasi
login." · *Vendor* — "Vendor mengelola armada, sopir, dan penugasan tracking secara mandiri." · *Admin* — "Admin
mengelola armada, sopir, dan penugasan tracking atas nama vendor."

Dialog `Batal`: **"Apakah Anda yakin ingin membatalkan ?"** / "Data yang telah Anda masukkan akan hilang." /
`Tidak` / `Ya` — `div.fixed` tanpa `role="dialog"` (identik dengan `/lelang/buat`; hipotesis #5 terkonfirmasi lagi).
URL tidak berubah sebelum konfirmasi.

### MV-5 Detail Vendor
Informasi Umum: badge Status, Nama Perusahaan, Alias Perusahaan, No. WhatsApp, Email, Nama PIC Perusahaan,
Pengelola, **Akses Sub User** ("Tidak Tersedia" di kedua vendor yang dicek). Informasi Perusahaan: Provinsi Asal,
Kota/Kab. Asal, Kecamatan Asal, Desa/Kelurahan Asal, Kode Pos, Alamat, Catatan Tambahan, Dokumen Tambahan.
Format label `Label : nilai`.

### MV-6 Edit Vendor
Field sama dengan Tambah (Dibantu Admin) + **Status*** (dropdown: **Aktif, Tidak Aktif** saja — tanpa
"Menunggu"). Kartu Pengelola Vendor/Admin tetap bisa dipilih. No. WhatsApp ditampilkan format lokal
(`62823…` di API/list → `0823…` di input). Kode Pos disabled. Dialog Batal sama dengan Tambah.

## Perbandingan dengan OMS
Catatan OMS (`omstest/explore/module-map.md` baris #21): route sama `/manajemen-vendor`, "Tambah Vendor"
(link → `/manajemen-vendor/tambah`), Filter, status "Menunggu"/"Aktif"/"Tidak Aktif", 13 data. Di AMS:
struktur list, route tambah, dan set status **sama**; bedanya AMS punya tombol **Riwayat** (OMS tidak mencatatnya)
dan datanya baru 3. OMS tidak punya catatan detail form Tambah/Edit, jadi perbandingan tingkat field belum
bisa dilakukan.

## Temuan / Hal yang Perlu Dikonfirmasi

| # | Observasi | Jenis | Rekomendasi |
|---|---|---|---|
| V-1 | Form Tambah/Edit **tidak punya field CS Penanggung Jawab / No. WhatsApp CS**, padahal list & filter punya kolom itu dan API menyimpan `customerServiceId`/`whatsappCs`. Master CS juga kosong (`options` = `[]`), jadi filter CS tidak bisa dipakai. | Gap desain / data | Tanya PO dari mana CS vendor diisi (Master CS → relasi vendor?). Skenario filter CS **blocked** sampai Master CS terisi. |
| V-2 | Baris Pengelola=Vendor menampilkan teks **"CS Vendor"** di kolom CS padahal API `customerService: null`; baris Pengelola=Admin menampilkan "-". Tampaknya label default, bukan data. | Perlu konfirmasi | Konfirmasi aturan tampilan; jangan dianggap bug dulu. |
| V-3 | ~~Riwayat kosong padahal `spf` punya `updatedAt` ≠ `createdAt`.~~ **Bukan bug — diverifikasi 2026-09-23 (run tulis disetujui user)**: edit via form tercatat benar (lihat "Verifikasi Riwayat" di bawah). Perubahan `spf` kemungkinan besar dari aktivasi akun vendor oleh sistem (`vendorUser` ACTIVE), bukan edit admin. | Selesai | — |
| V-4 | Menu aksi baris hanya **Detail, Edit** — tidak ada Hapus. Nonaktifkan hanya lewat Status di Edit. | Info | Skenario hapus vendor tidak relevan kecuali spec menyatakan lain. |
| V-5 | Edit Status hanya Aktif/Tidak Aktif; "Menunggu" hanya ada di filter (status sistem untuk Registrasi Mandiri yang belum selesai). | Info | Uji: vendor Menunggu (hasil Mandiri) → apa yang tampil di dropdown Status Edit. |
| V-6 | API detail vendor punya `aksesFCL`/`aksesFTL` (true) dan `aksesSubUser`, tapi hanya "Akses Sub User" yang tampil di Detail, dan tidak ada toggle-nya di form. | Info / gap | Konfirmasi apakah akses FCL/FTL memang tidak dikelola dari UI AMS. |
| V-7 | Sidebar sekarang punya menu top-level **Negosiasi** (`/negosiasi`), belum ada di `explore/module-map.md`. | Perubahan navigasi | Tambahkan ke module-map pada `/explore` berikutnya. |

## Verifikasi Riwayat (V-3) — run tulis 2026-09-23 ±14:34 WIB
Disetujui user. Hanya menyentuh data buatan run ini; probe: `artifacts/probe/vendor/w1-create.js`, `w2-edit.js`.

| Langkah | API | Hasil Riwayat (`GET /api/audit/vendor/changes`) |
|---|---|---|
| Tambah vendor `AUTOTEST-20260923-VENDOR-RIWAYAT` (Dibantu Admin + Pengelola Admin, alias ATV0923, email `autotest-20260923-vendor@yopmail.com`, wilayah opsi pertama: Sumatera Utara/Kota Tebing Tinggi/Bajenis/Bandar Sakti, Kode Pos auto 20613) | `POST /api/vendors` 201 "Vendor berhasil dibuat" → redirect ke `/manajemen-vendor`, tanpa dialog konfirmasi | **Tetap kosong**: pembuatan vendor tidak dicatat sebagai riwayat |
| Edit Catatan Tambahan "-" → "AUTOTEST edit 1 - cek riwayat" | `PATCH /api/vendors/{id}` 200 → redirect ke Detail | 1 baris: tanggal 23/09/2026 14:34, Diubah Oleh "Admin" + email, "1 Perubahan" (`fieldLabel` Catatan Tambahan, `action: ADDED`, before "-") |
| Edit Status Aktif → Tidak Aktif (pembersihan) | `PATCH` 200 | 2 baris, terbaru di atas (`action: CHANGED`, Aktif → Tidak Aktif) |

Kesimpulan: Riwayat **berfungsi** untuk edit, mencatat per-field before/after + aktor. Create **tidak** tercatat, dan itu **sesuai desain** (dikonfirmasi user 2026-09-23): Riwayat hanya
mencatat perubahan data vendor, bukan proses Tambah. Payload POST juga mengirim `aksesSubUser=false`,
`aksesFCL=true`, `aksesFTL=true` sebagai nilai default dari UI (terkait V-6).

**Data test tertinggal** (vendor tidak bisa dihapus): `AUTOTEST-20260923-VENDOR-RIWAYAT`
(id `1d4b5e2a-5dad-4a22-a831-06aa46b6647a`), status **Tidak Aktif**, Pengelola Admin, tanpa akun login
(`vendorUser: null`).

## Catatan untuk Automation (selector awal, belum harvest penuh)
- Tidak ada `<main>` dan tidak ada `data-testid`; scope via heading/teks.
- Tombol aksi baris: `page.locator('table tbody tr', { hasText: '<nama>' }).getByTitle('Aksi')`; menu = `div.fixed`
  tanpa `role="menu"` → `page.locator('div.fixed').getByText('Detail'|'Edit', { exact: true })`.
- Baris pertama `tbody` adalah spacer (`<td colspan=6>` kosong) — jangan pakai `.first()` tanpa filter teks.
- Panel filter tersembunyi default; klik `Filter` lalu **tunggu animasi** — klik dropdown langsung sempat
  terhalang `div.space-y-4` (intercepts pointer events).
- Dropdown = `button[aria-haspopup="listbox"]` → opsi di `[role="listbox"]` (kosong = `<p>Tidak ada pilihan</p>`).
- Kartu registrasi/pengelola: `page.locator('button', { hasText: 'Registrasi Dibantu Admin' })`, pengelola pakai teks
  deskripsinya (`'Vendor mengelola'` / `'Admin mengelola'`) agar tidak bentrok dengan kata "Admin" lain.
- Label field memakai `*` di teks label (mis. "Nama Perusahaan *"); `getByPlaceholder` paling stabil.

## Screenshot
`artifacts/screenshots/explore/`: `ams-vendor-list.png`, `ams-vendor-filter.png`, `ams-vendor-row-menu.png`,
`ams-vendor-riwayat.png`, `ams-vendor-tambah.png`, `ams-vendor-tambah-{mandiri,admin}-{vendor,admin}.png`,
`ams-vendor-tambah-batal.png`, `ams-vendor-detail-{verstappen,spf}.png`, `ams-vendor-edit-{verstappen,spf}.png`.

---

# Pengujian Menyeluruh Tambah / Edit / Detail — 2026-09-23 ±14:50–15:10 WIB
Run tulis disetujui user ("coba lakukan pengecekan … tambah, edit dan lihat detail vendor … usahakan menemukan bug").
Hanya data `AUTOTEST-20260923-*` yang dibuat/diubah. Probe: `artifacts/probe/vendor/t1…t8-*.js`, helper `vh.js`,
hasil mentah `t*.json`. Screenshot: `artifacts/screenshots/explore/ams-vendor-t*.png`.

## Bug Terkonfirmasi (dengan bukti)

| # | Bug | Langkah & Bukti | Severity (usulan) |
|---|---|---|---|
| BUG-V1 | **No. WhatsApp tanpa validasi panjang minimum/format** — nomor tidak valid tersimpan | Tambah (Dibantu Admin + Vendor): input `08abcdefghij` → huruf difilter jadi `08` → **201**, tersimpan `628`. `0812` → tersimpan `62812`. `981200923099` (tidak diawali 0) → tersimpan `62981200923099`. Form tidak menampilkan error apa pun; toast "Vendor berhasil ditambahkan" + akun login dikirim. | Medium |
| BUG-V2 | **Tautan Dokumen Tambahan di Detail/Edit rusak** | Detail vendor → klik `autotest-dok.pdf` → tab baru `https://apiauction-staging…/api/api/uploads/vendors/…pdf` → `{"success":false,"message":"Missing or malformed Authorization header"}` (401). Path yang disimpan API `/api/uploads/vendors/…` (tanpa `api` ganda) → 200 `application/pdf`. Frontend menambahkan prefix `/api` ke path yang sudah berisi `/api`. Dokumen tidak bisa dibuka dari UI. | High |
| BUG-V3 | **Ukuran file dokumen salah** ("0.07 KB" untuk semua file) | File asli 193 B (pdf) dan 645 B (jpg) keduanya tampil "0.07 KB". Frontend mengirim `HEAD` ke URL `/api/api/…` → 401, body error 71 byte → itulah yang ditampilkan. Akar sama dengan BUG-V2. | Low |
| BUG-V4 | **Vendor berstatus Menunggu (Registrasi Mandiri) tampak bisa diedit, tapi selalu ditolak backend; status di form salah** | Detail vendor Menunggu tetap menampilkan tombol `Edit Vendor`. Form Edit menampilkan **Status = "Aktif"** (API: `MENUNGGU`) dan mewajibkan semua field Dibantu Admin (WA, PIC, wilayah, alamat) walau vendor belum registrasi. Setelah semua diisi dan Simpan → `PATCH` **400** "Data ini belum dapat diubah selagi vendor menunggu registrasi mandiri" (toast). UI tidak konsisten dengan aturan backend. | Medium |

## Kandidat Bug (perlu konfirmasi spec)

| # | Observasi | Bukti |
|---|---|---|
| KB-V1 | Filter **No. WhatsApp** hanya cocok format `62…` | `081200923212` (format yang dipakai form Edit & placeholder "Contoh: 0812…") → 0 data (`?whatsapp=081200923212`); `6281200923212` → 1 data. List menampilkan format 62, jadi salin-tempel dari list tetap jalan. |
| KB-V2 | Upload hanya memeriksa **ekstensi** | File teks biasa bernama `autotest-palsu.pdf` diterima di area upload tanpa error (tidak disimpan; validasi server belum diuji). |
| KB-V3 | Vendor Menunggu tidak punya aksi **kirim ulang undangan** | Detail vendor Menunggu: tidak ada tombol Kirim Ulang (vendor Dibantu Admin + Pengelola Vendor punya "Kirim Ulang Tautan Atur Kata Sandi"). Mungkin memang di luar desain. |

## Matriks Hasil — Tambah

| Kasus | Hasil | Status |
|---|---|---|
| Simpan kosong — Mandiri+Vendor | Error "Nama Perusahaan harus diisi", "Email harus diisi"; tidak ada request | ✅ |
| Simpan kosong — Dibantu+Vendor / Dibantu+Admin | 10 error wajib (Nama, WA, Email, PIC, Provinsi, Kota/Kab., Kecamatan, Desa/Kelurahan, Alamat); tidak ada request | ✅ |
| Mandiri + Admin | Kartu Admin **disabled** + hint; pindah Dibantu+Admin → Mandiri otomatis reset ke Vendor | ✅ |
| Isi form Dibantu lalu pindah ke Mandiri → Simpan | Payload POST hanya `registrationMethod, pengelola, namaPerusahaan, email, akses*` (field sisa tidak ikut) | ✅ |
| Email `abc`, `abc@`, `a b@yopmail.com`, `abc@yopmail` | "Format email tidak valid", tidak ada request | ✅ |
| Spasi saja di Nama / PIC / Alamat | Error "… harus diisi" | ✅ |
| Nama/email dengan spasi di depan/belakang | Tersimpan ter-trim | ✅ |
| WA `+6281200923099` | Input jadi `6281200923099`, tersimpan `6281200923099` | ✅ |
| WA > 15 digit | Terpotong di 15 (maxlength) | ✅ |
| WA `08…huruf`, `0812`, `9812…` | **Tersimpan** (BUG-V1) | ❌ |
| Duplikat Nama (`Verstappen`) | 400 "Nama Perusahaan ini sudah terdaftar sebagai vendor lain." | ✅ |
| Duplikat Alias beda huruf (`ver` vs `VER`) | 400 "Alias Perusahaan ini sudah digunakan vendor lain." | ✅ |
| Duplikat Email beda huruf (`VERSTAPPEN@…`) | 400 "Email ini sudah terdaftar sebagai vendor Anda." | ✅ |
| Duplikat WA (`0823…` vs tersimpan `62823…`) | 400 "Nomor WhatsApp ini sudah digunakan vendor lain." | ✅ |
| Upload `.png` | "Hanya Boleh Menggunakan Ekstensi pdf, jpg, jpeg" | ✅ |
| Upload > 4MB | Toast "autotest-besar.pdf: Ukuran file melebihi 4.00 MB" | ✅ |
| Upload 2 file (pdf+jpg) | Tersimpan 2 dokumen | ✅ (tapi tautan rusak, BUG-V2) |
| Sukses Mandiri+Vendor | Toast "Vendor berhasil ditambahkan / Undangan registrasi telah dikirim ke email vendor."; status **Menunggu**; `vendorUser: null` | ✅ |
| Sukses Dibantu+Vendor | Toast "… Informasi akun login telah dikirim ke email vendor."; status Aktif; `vendorUser` ACTIVE, `mustChangePassword: true` | ✅ |
| Sukses Dibantu+Admin | Toast "… Vendor telah tersimpan."; status Aktif; `vendorUser: null` | ✅ |

## Matriks Hasil — Detail

| Kasus | Hasil | Status |
|---|---|---|
| Detail Mandiri (Menunggu) | Badge Menunggu, field kosong "-", catatan "Sebagian data mungkin belum tersedia — vendor belum menyelesaikan registrasi (Menunggu)." | ✅ (tapi Edit tetap ditawarkan, BUG-V4) |
| Detail Dibantu+Vendor | Semua field sesuai input; tombol "Kirim Ulang Tautan Atur Kata Sandi" | ✅ |
| Detail Dibantu+Admin | Semua field sesuai; tanpa tombol Kirim Ulang | ✅ |
| Kirim Ulang Tautan | Dialog "Kirim ulang tautan atur kata sandi? … Tautan sebelumnya (bila ada) akan menjadi tidak berlaku." Batal/Kirim → `POST /vendors/{id}/resend-set-password` 200 + toast | ✅ |
| Dokumen di Detail | Tautan 401, ukuran salah | ❌ BUG-V2/V3 |
| List setelah tambah | Kolom sesuai; WA tampil format 62; Pengelola Vendor → "CS Vendor" | ✅ |

## Matriks Hasil — Edit

| Kasus | Hasil | Status |
|---|---|---|
| Edit vendor Menunggu | Status tampil "Aktif", field wajib, backend 400 | ❌ BUG-V4 |
| Kosongkan Nama & WA, email `salah` | 3 error, tidak ada request | ✅ |
| Nama duplikat (`Verstappen`) | 400 + error di field | ✅ |
| Ganti Provinsi saja | Kota/Kec/Kel direset ke "Pilih…", Kode Pos dikosongkan; Simpan → 3 error wajib | ✅ |
| Ubah 10 field + wilayah + tambah dokumen | 200, toast "Perubahan berhasil disimpan", redirect ke Detail; Detail sesuai; Kode Pos auto 46151 | ✅ |
| Kosongkan Catatan Tambahan | Detail "-" | ✅ |
| Upload file bernama sama | Disimpan sebagai `autotest-dok_v2.pdf` | ✅ |
| Hapus dokumen | Tersimpan (2 file tersisa), Riwayat mencatat | ✅ |
| Ubah Email (vendor punya akun login) | `vendorUser.email` ikut berubah | ✅ |
| Pengelola Vendor → Admin | Toast "Vendor telah diberi tahu bahwa akses kini menjadi read-only."; akun login tetap ACTIVE | ✅ |
| Pengelola Admin → Vendor | Toast "Akun login vendor telah dibuat, informasi akun dikirim ke email vendor."; `vendorUser` dibuat; tombol Kirim Ulang muncul | ✅ |
| Status Aktif → Tidak Aktif → Aktif | 200 dua kali; filter Status mengikuti | ✅ |
| Dialog Batal (Tambah & Edit) | "Apakah Anda yakin ingin membatalkan ?" Tidak/Ya | ✅ |

## Riwayat (setelah semua edit)
Semua edit tercatat per simpan (mis. 1 simpan = "12 Perubahan"). Detail baris menampilkan tabel No/Field/Data Sebelum/Data Sesudah,
label "Dihapus" untuk field dikosongkan, "Sistem" untuk Kode Pos otomatis, dokumen sebagai "2 file → 3 file". Tambah tidak tercatat
(sesuai desain). ✅

## Filter List (pada data AUTOTEST)
Status Menunggu / Tidak Aktif, Pengelola Admin, Nama parsial huruf kecil, Alias, Email parsial → semua sesuai. No. WhatsApp → KB-V1.

## Data Test yang Tertinggal (vendor tidak bisa dihapus)

| Vendor | Kombinasi akhir | Status | Akun login | Catatan |
|---|---|---|---|---|
| `AUTOTEST-20260923-VENDOR-RIWAYAT` | Dibantu + Admin | Tidak Aktif | tidak ada | dari verifikasi V-3 |
| `AUTOTEST-20260923-MANDIRI-VENDOR` | Mandiri + Vendor | Menunggu | tidak ada | undangan terkirim ke yopmail |
| `AUTOTEST-20260923-DIBANTU-VENDOR-ED` | Dibantu + **Admin** (awal Vendor) | Aktif | ACTIVE (read-only) | email `…-dibantu-vendor-ed@yopmail.com` |
| `AUTOTEST-20260923-DIBANTU-ADMIN` | Dibantu + **Vendor** (awal Admin) | Aktif | ACTIVE | tautan kata sandi dikirim ulang 1–2× |
| `AUTOTEST-20260923-NEG-WA-HURUF` | Dibantu + Vendor | Aktif | ACTIVE | WA `628` (bukti BUG-V1) |
| `AUTOTEST-20260923-NEG-WA-NON0` | Dibantu + Vendor | Aktif | ACTIVE | WA `62981200923099` |
| `AUTOTEST-20260923-NEG-WA-0812` | Dibantu + Vendor | Aktif | ACTIVE | WA `62812` |
| `AUTOTEST-20260923-NEG-WA-PLUS62` | Dibantu + Vendor | Aktif | ACTIVE | WA valid `6281200923099` |

⚠️ Inbox yopmail bersifat publik: email info akun/tautan atur kata sandi vendor AUTOTEST dapat dibaca siapa pun yang tahu alamatnya.

## Belum Diuji
- Alur penyelesaian Registrasi Mandiri oleh vendor (butuh membuka email undangan + login sebagai vendor).
- Validasi server untuk kombinasi Mandiri+Admin atau file palsu via API langsung (hanya diuji lewat UI).
- Login sebagai vendor untuk memastikan efek "read-only" setelah pengelola diubah ke Admin.
