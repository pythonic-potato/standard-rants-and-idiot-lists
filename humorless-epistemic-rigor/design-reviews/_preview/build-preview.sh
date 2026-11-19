#!/bin/bash
# Regenerate GitHub-style HTML previews of ../*.md, for checking how the docs
# will render on GitHub (Obsidian renders some things differently).
# Output (*.html, assets link) is gitignored: regenerable, never ships.
# Requires: pandoc  (brew install pandoc)
# Usage: ./build-preview.sh [name-without-.md ...]   (no args = all files)
set -e
cd "$(dirname "$0")"
SRC=..
[ -e assets ] || ln -s ../assets assets
files=("$@"); [ ${#files[@]} -eq 0 ] && files=($(cd $SRC && ls *.md | sed 's/\.md$//'))
for f in "${files[@]}"; do
  body=$(pandoc -f gfm -t html "$SRC/$f.md" | sed -E 's/href="([0-9A-Za-z_-]+)\.md(#[^"]*)?"/href="\1.html\2"/g')
  { sed "s|<title>[^<]*</title>|<title>$f</title>|" _shell-head.html; printf '%s\n\n\n' "$body"; cat _shell-tail.html; } > "$f.html"
  echo "built $f.html"
done
