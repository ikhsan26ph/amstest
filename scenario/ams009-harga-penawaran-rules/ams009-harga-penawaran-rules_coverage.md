# Coverage — Harga Penawaran Rules

30 skenario non-stress. Ini regression scope perubahan user; bukan full run AMS004/AMS005/AMS006.

| Requirement | Skenario |
|---|---|
| REQ-001 | SCN-0001, SCN-0002, SCN-0003, SCN-0004, SCN-0005, SCN-0010 |
| REQ-002 | SCN-0006, SCN-0007, SCN-0008, SCN-0009 |
| REQ-003 | SCN-0011, SCN-0012, SCN-0013, SCN-0028 |
| REQ-004 | SCN-0014, SCN-0015, SCN-0030 |
| REQ-005 | SCN-0016, SCN-0017, SCN-0018, SCN-0019, SCN-0029 |
| REQ-006 | SCN-0020, SCN-0021, SCN-0022 |
| REQ-007 | SCN-0023, SCN-0024 |
| REQ-008 | SCN-0025, SCN-0026 |
| REQ-009 | SCN-0027 |

Closing Time diperiksa sebagai diagnosis dengan verdict blocked sampai rule dipastikan. Fixture waktu, master tambahan, dan akun vendor kedua menentukan coverage eksekusi; coverage dokumen tidak sama dengan passed.

## Hasil eksekusi 2026-10-05

30 verdict: 23 passed, 1 failed, 6 blocked, 0 skipped. Failed SCN-0025 adalah kandidat status/tampilan setelah Rencana Akhir Kirim; API sudah EXPIRED, badge Tidak Berlaku belum tampil. Blocked SCN-0020/0021/0022/0023/0024/0027 sesuai batas tanggal/rule/akun. Tanggal mulai hari ini diamati AKTIF, tetapi tidak dihitung sebagai bukti tanggal akhir masa berlaku. Triase: `../../shared/bug-triage-harga-penawaran-20261005.md`.
