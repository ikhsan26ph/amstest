# report

Semua path relatif terhadap root repository. Baca `docs/agent-guide.md` terlebih dahulu.

Parameter: `$1` adalah nama modul; `$ARGUMENTS` adalah argumen pengguna untuk workflow ini. Adapter meneruskannya dari slash command atau instruksi biasa. Baca dokumen `docs/roles/<peran>.md` untuk setiap peran yang disebut.

Generate report Excel dari file hasil di `results/`.

- Jika $ARGUMENTS kosong → pakai file hasil PALING BARU di `results/` (abaikan file `_plan__*`).
- Jika $ARGUMENTS berisi nama modul → pakai run terbaru modul tersebut.
- Jika $ARGUMENTS berisi path file JSON → pakai file itu.
- Jika $ARGUMENTS = `all` → gabungkan seluruh run terbaru per modul menjadi satu workbook rekap lintas modul (`python scripts/generate_report.py --all`).

Jalankan `python scripts/generate_report.py <file...>`, lalu beri tahu user lokasi file Excel di `reports/` beserta ringkasan angka Summary-nya.

## Laporan eksplorasi

Untuk laporan eksplorasi, gunakan sumber Markdown konsolidasi, bukan JSON verdict sintetis:

```bash
python scripts/generate_report.py --explore explore/explore-consolidated-20261008.md
```

Output berupa workbook Excel dengan ringkasan, cakupan batch, temuan, rule/keputusan, improve, tindak lanjut dan batas bukti. Pertahankan laporan per batch sebagai sumber rinci dan Markdown konsolidasi untuk regenerasi. Format laporan yang dibagikan mengikuti permintaan user; pada konsolidasi 8 Oktober 2026 digunakan Excel saja.
