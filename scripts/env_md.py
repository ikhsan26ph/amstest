#!/usr/bin/env python3
"""Parser config/env.md (format `key: value`) untuk script Python.

Padanan tests/helpers/env.js — jaga keduanya konsisten.
JANGAN pernah mencetak password ke stdout/log/report; fungsi ini sengaja
tidak mengembalikan password sama sekali.
"""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ENV_FILE = ROOT / "config" / "env.md"
KEY_RE = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)\s*:\s*(.*)$")
PLACEHOLDER_RE = re.compile(r"ISI_DISINI|ISI SAAT|ISI MANUAL", re.I)


def read_raw(file=ENV_FILE):
    raw = {}
    file = Path(file)
    if not file.exists():
        return raw
    for line in file.read_text(encoding="utf-8").splitlines():
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        m = KEY_RE.match(s)
        if not m:
            continue
        key, value = m.group(1), m.group(2)
        if not re.fullmatch(r"(\w*P|p)assword", key):
            value = re.sub(r"(^|\s+)#\s.*$", "", value)  # komentar = "# " (pagar+spasi); "#password" aman
        raw[key] = value.strip()
    return raw


def _clean(v):
    return None if not v or PLACEHOLDER_RE.search(v) else v


def parse_env_md(file=ENV_FILE):
    """Kembalikan {"baseUrl", "user", "role"} untuk field `environment` di results/."""
    raw = read_raw(file)
    base_url = _clean(raw.get("baseUrl"))
    if base_url and not base_url.startswith("http"):
        base_url = "https://" + base_url
    return {
        "baseUrl": base_url,
        "user": _clean(raw.get("email")),
        "role": _clean(raw.get("role")),
    }
