# explore

Semua path relatif terhadap root repository. Baca `docs/agent-guide.md` terlebih dahulu.

Parameter: `$1` adalah nama modul; `$ARGUMENTS` adalah argumen pengguna untuk workflow ini. Adapter meneruskannya dari slash command atau instruksi biasa. Baca dokumen `docs/roles/<peran>.md` untuk setiap peran yang disebut.

Lakukan eksplorasi general aplikasi AMS. Gunakan peran **ams-explorer** (`docs/roles/ams-explorer.md`).

Langkah:
1. Baca `config/env.md`. Jika `baseUrl` / `email` / `password` kosong → berhenti, minta user mengisi (kredensial diisi manual oleh manusia, jangan diisi otomatis).
2. **Kalibrasi login** (hanya jika `loginSuccessUrlPattern` / selector login di `config/env.md` masih kosong):
   - Buka `baseUrl` + `loginPath` (default tentatif `/login`; jika ternyata redirect ke path lain, catat path yang benar).
   - Identifikasi selector field email, password, tombol submit, lalu coba login. Catat pola URL setelah login sukses.
   - Tulis `loginPath`, `loginSuccessUrlPattern`, `loginEmailSelector`, `loginPasswordSelector`, `loginButtonSelector` ke `config/env.md` (format selector: lihat `config/env.example.md`). Jangan menulis kredensial ke file lain mana pun.
   - Jika klik tombol login native tidak memicu submit, coba `dispatchEvent('click')` dan catat sebagai bukti hipotesis #1 (`CLAUDE.md`); set `loginClickMode: dispatch` hanya jika itu satu-satunya cara.
   - **Guard: login gagal 2x berturut-turut → berhenti**, laporkan (tanpa kredensial), jangan coba lagi tanpa arahan manusia.
3. Jalankan peran `ams-explorer` dengan instruksi:
   - Login ke aplikasi memakai parameter di `config/env.md`.
   - Petakan SELURUH struktur navigasi: sidebar, menu, submenu, tab, sampai 2 level dalam.
   - Untuk setiap modul catat: nama menu, URL/route, deskripsi singkat isi halaman (list? form? dashboard?), tombol aksi utama, dan apakah aksesnya dibatasi role.
   - JANGAN melakukan aksi tulis apa pun (tidak submit form, tidak klik hapus). Read-only.
   - Ambil screenshot 1x per modul utama ke `artifacts/screenshots/explore/`.
   - Kumpulkan bukti untuk checklist "Hipotesis Belum Terverifikasi" di `CLAUDE.md` pada minimal 1 halaman list dan 1 halaman form.
4. Simpan hasil ke `explore/module-map.md` dalam bentuk tabel:
   `| # | Modul | Route | Jenis Halaman | Aksi Utama | Ada Dokumen Skenario? | Catatan |`
   — kolom "Ada Dokumen Skenario?" diisi dengan mencocokkan nama modul ke folder yang ada di `scenario/`.
   Tambahkan section "Info Login & Environment" (path login, pola URL sukses, role yang tampil — TANPA kredensial).
5. Update kolom Status tiap item hipotesis di `CLAUDE.md` menjadi `TERVERIFIKASI SAMA (tanggal)`, `BERBEDA (tanggal; penjelasan)`, atau `BELUM DICEK (tanggal; alasan)`.
6. Tampilkan ringkasan ke user: status kalibrasi login, daftar modul yang ditemukan, mana yang sudah punya dokumen skenario (siap dites detail), mana yang belum (baru bisa smoke test), dan hasil checklist hipotesis.

Argumen opsional: $ARGUMENTS (jika user menyebut area tertentu, fokuskan eksplorasi ke sana).
