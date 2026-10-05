# Harga Penawaran — revisi rule 2026-10-05

Sumber normatif: permintaan user pada sesi ini. Modul regresi ini memeriksa perubahan terkait AMS004 (Input/Edit Harga), AMS005 (Bid Harga), dan AMS006 (Jadwal). Tidak mengklaim perubahan kode aplikasi.

| ID | Rule / acceptance criteria |
|---|---|
| REQ-001 | FCL: satu input per vendor dan lelang untuk kombinasi Pelayaran + Jenis Kontainer. Harga, tanggal, dan deskripsi berbeda tidak membuat kombinasi berbeda. Pelayaran berbeda atau kontainer berbeda boleh menjadi harga terpisah. Validasi mencakup satu submit dan data yang sudah tersimpan. |
| REQ-002 | FTL: satu harga per vendor dan lelang untuk tiap Jenis Armada. Armada berbeda boleh harga terpisah; harga/tanggal berbeda tidak membebaskan duplikasi. |
| REQ-003 | Pada Lelang Ulang Sedang Buka, setelah harga baru vendor berhasil disimpan, harga lama vendor menjadi Kadaluwarsa. Pembukaan ulang atau simpan gagal tidak memicu perubahan ini. Input pertama putaran baru harus tetap dapat dilakukan walau ada harga putaran lama; input kedua kombinasi sama dalam putaran baru ditolak. Batas ini diperlukan untuk menggabungkan rule input unik dan Lelang Ulang, dan dicatat sebagai interpretasi pada run. |
| REQ-004 | Edit memperbarui record penawaran yang sama; harga boleh lebih tinggi/rendah selama tetap valid. ID dan jumlah record tetap; tidak membentuk harga lama Tidak Berlaku. Audit perubahan diperbolehkan. |
| REQ-005 | Bid memperbarui record penawaran yang sama dan hanya menerima harga lebih rendah. Harga sama/lebih tinggi ditolak tanpa perubahan. ID dan jumlah record tetap; tidak memicu Tidak Berlaku. |
| REQ-006 | Masa berlaku < tanggal hari ini: Tidak Berlaku. Masa berlaku = hari ini: tetap aktif sepanjang hari jika tidak ada pemicu status lain. Pada hari berikutnya: Tidak Berlaku. Jangan menyamakan tanggal kedaluwarsa harga dengan label UI Mulai Berlaku tanpa bukti pemetaan field. |
| REQ-007 | Closing Time: judul user menyebut sudah lewat, isi menyebut jadwal kapal melebihi tanggal sekarang. Arah < atau > dan field jadwal yang dimaksud belum dikonfirmasi. Jalankan diagnosis keduanya dan laporkan sebagai NEED RECHECK, bukan BUG berdasarkan asumsi. |
| REQ-008 | Penawaran pada lelang yang telah melewati Rencana Akhir Kirim menjadi Tidak Berlaku. Batas tepat sama dan granularitas tanggal/jam belum ditentukan; jangan menetapkan perilaku batas tersebut tanpa konfirmasi. |
| REQ-009 | Keunikan harga dibatasi vendor dan lelang; vendor lain/lelang lain tidak ikut terblokir. |

## Prasyarat dan batas interpretasi

- Mutasi hanya pada fixture buatan run dengan prefix AUTOTEST-YYYYMMDD-RULES-. Data existing hanya dibaca untuk pemeriksaan batas tanggal.
- Zona browser pengujian Asia/Jakarta; zona bisnis/backend harus dicatat berdasarkan bukti. Jam browser yang dimajukan tidak dianggap mengubah waktu backend.
- UI saat eksplorasi masih berlabel Mulai Berlaku; belum otomatis berarti tanggal akhir masa berlaku. Jika tidak ada field tanggal akhir terverifikasi, pemeriksaan expiry dicatat blocked/NEED RECHECK.
- Prioritas Kadaluwarsa versus Tidak Berlaku jika beberapa pemicu bersamaan belum ditentukan. Isolasi fixture diperlukan agar verdict tidak bergantung asumsi.
- Skenario tanpa master kontainer/armada tambahan, akun vendor kedua, atau fixture waktu yang memenuhi prasyarat harus blocked dan dijelaskan.
