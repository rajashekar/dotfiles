#!/bin/bash
#
# This script installs patched Meslo Powerline font family on Windows.
# The fonts are installed for the current user only. The script must be
# run from WSL.
#
#   bash -c "$(curl -fsSL https://gist.githubusercontent.com/romkatv/aa7a70fe656d8b655e3c324eb10f6a8b/raw/install_meslo_wsl.sh)"
#
# If you just want the font files, they are in
# https://github.com/romkatv/dotfiles-public/tree/master/.local/share/fonts/NerdFonts.

set -ueEo pipefail

function install_fonts() {
  local dst_dir
  dst_dir=$(wslpath $(cmd.exe /c "echo %LOCALAPPDATA%\Microsoft\\Windows\\Fonts" 2>/dev/null | sed 's/\r$//'))
  mkdir -p "$dst_dir"
  local src
  for src in "$@"; do
    local file=$(basename "$src")
    test -f "$dst_dir/$file" || cp -f "$src" "$dst_dir/"
    local win_path
    win_path=$(wslpath -w "$dst_dir/$file")
    # Install font for the current user. It'll appear in "Font settings".
    reg.exe add                                                      \
      "HKCU\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts" \
      /v "${file%.*} (TrueType)"  /t REG_SZ /d "$win_path" /f 2>/dev/null
  done
}

function main() {
  local repo
  repo="$(mktemp -d)"
  trap "rm -rf ${repo@Q}" INT TERM EXIT
  git clone https://github.com/romkatv/dotfiles-public.git "$repo"
  install_fonts "$repo"/.local/share/fonts/NerdFonts/*.ttf
}

main

echo -e '\033[0;32m'
echo 'Fonts successfully installed.'
echo ''
echo 'To change font in Windows Console Host (the old thing):'
echo '  Right click on the window title -> Properties -> Font and set Font'
echo '  to "MesloLGS NF".'
echo ''
echo 'To change font in Windows Terminal (the new thing):'
echo '  Open Settings (Ctrl+,), search for "fontFace" and set value'
echo '  to "MesloLGS NF" for every profile.'
echo -e '\033[0m'