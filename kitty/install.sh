#!/bin/sh
# Installs Matcha Zen into kitty's user theme directory and selects it.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
dir="${KITTY_CONFIG_DIRECTORY:-${XDG_CONFIG_HOME:-$HOME/.config}/kitty}"
mkdir -p "$dir/themes"
cp "$here/matcha-zen.conf" "$dir/themes/matcha-zen.conf"
echo "Installed $dir/themes/matcha-zen.conf"
if command -v kitten >/dev/null 2>&1; then
  kitten themes --reload-in=all "Matcha Zen"
  echo "Applied Matcha Zen."
else
  echo 'kitten not found on PATH. In kitty run: kitten themes "Matcha Zen"'
fi
