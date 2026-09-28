# Contoh config/env.md untuk AMS — salin menjadi `config/env.md` lalu isi.
# `config/env.md` masuk .gitignore — JANGAN PERNAH di-commit atau dicetak ke log.
#
# Format: satu `key: value` per baris. Baris diawali `#` diabaikan. Teks mulai "# "
# (pagar + spasi) dianggap komentar, KECUALI pada baris `password`. Selector CSS seperti
# "#password" (pagar tanpa spasi) tetap aman.
# Parser: tests/helpers/env.js (Playwright) dan scripts/env_md.py (Python) — jaga konsisten.
#
# Format selector (loginEmailSelector / loginPasswordSelector / loginButtonSelector):
#   placeholder=Masukkan Email     -> page.getByPlaceholder('Masukkan Email')
#   label=Email                    -> page.getByLabel('Email')
#   testid=login-email             -> page.getByTestId('login-email')
#   role=button:Login              -> page.getByRole('button', { name: 'Login' })
#   input[name="email"]            -> page.locator(...) (CSS / engine Playwright lain)
# loginSuccessUrlPattern: source regex JS tanpa garis miring pembungkus, mis. `/dashboard`.

baseUrl: https://auction-staging.prahu-hub.com/
loginPath: /login
loginSuccessUrlPattern: ISI_DISINI
loginEmailSelector: ISI_DISINI
loginPasswordSelector: ISI_DISINI
loginButtonSelector: ISI_DISINI
loginClickMode: native       # opsional: native | dispatch

# Kredensial — ISI MANUAL OLEH MANUSIA
email: ISI_DISINI
password: ISI_DISINI
role: ISI_DISINI             # opsional, label untuk laporan

# Akun kedua (opsional) — Vendor. Kosongkan/biarkan ISI_DISINI jika tidak ada.
vendorEmail: ISI_DISINI
vendorPassword: ISI_DISINI
vendorLoginSuccessUrlPattern: \/vendor-portal
vendorRole: Vendor
