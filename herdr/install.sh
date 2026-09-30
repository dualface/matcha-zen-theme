#!/bin/sh
# Appends the Matcha Zen [theme.custom] overrides to herdr's config.toml.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
cfg="${HERDR_CONFIG_PATH:-${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config.toml}"
mkdir -p "$(dirname "$cfg")"
[ -f "$cfg" ] || : > "$cfg"
if grep -q '^[[:space:]]*\[theme\.custom' "$cfg"; then
  echo "error: $cfg already has a [theme.custom] table. Replace it by hand with matcha-zen.toml." >&2
  exit 1
fi
cp -p "$cfg" "$cfg.bak.$(date +%Y%m%d%H%M%S)"
{ printf '\n'; cat "$here/matcha-zen.toml"; } >> "$cfg"
echo "Appended Matcha Zen to $cfg"
if command -v herdr >/dev/null 2>&1; then
  herdr config check
  herdr server reload-config >/dev/null 2>&1 && echo "Reloaded running herdr server." || echo "No running herdr server to reload."
fi
