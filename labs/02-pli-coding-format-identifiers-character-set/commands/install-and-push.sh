#!/usr/bin/env bash
set -euo pipefail

ZIP="$HOME/Downloads/PL-I-lab-02-complete.zip"
TMP="$HOME/Downloads/pli-lab-02-tmp"
REPO="/c/Carrera_Ciberseguridad/06_Portfolio_GitHub/PL_I"
REMOTE="https://github.com/P-dot/PL-I.git"

rm -rf "$TMP"
mkdir -p "$TMP"
unzip -o "$ZIP" -d "$TMP"

if [ ! -d "$REPO/.git" ]; then
  rm -rf "$REPO"
  git clone "$REMOTE" "$REPO"
fi

cd "$REPO"

git pull --ff-only origin main
cp -r "$TMP/PL-I-lab-02-complete/repo-content/." .
rm -rf "$TMP"

echo "===== SECURITY / SENSITIVE NETWORK QUICK CHECK ====="
grep -RInE --exclude-dir=.git --binary-files=without-match   '([0-9]{1,3}\.){3}[0-9]{1,3}|([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}'   labs/02-pli-coding-format-identifiers-character-set || true

echo "===== INSTALLED FILES ====="
find labs/02-pli-coding-format-identifiers-character-set -type f | sort

echo "===== GIT STATUS ====="
git status --short

git add README.md labs/02-pli-coding-format-identifiers-character-set
git commit -m "Add PL/I Lab 02 coding format and identifiers"
git push origin main

echo "===== FINAL STATUS ====="
git status
git log -1 --oneline
git remote -v
