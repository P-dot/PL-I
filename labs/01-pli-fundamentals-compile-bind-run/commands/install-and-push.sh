#!/usr/bin/env bash
set -euo pipefail

BASE="/c/Carrera_Ciberseguridad/06_Portfolio_GitHub"
REPO="$BASE/PL_I"
REMOTE="https://github.com/P-dot/PL-I.git"
ZIP="$HOME/Downloads/PL-I-lab-01-complete.zip"
TMP="$HOME/Downloads/pli-lab-01-tmp"

mkdir -p "$BASE"

# Clone only when the local repository does not already exist as a Git repo.
if [ ! -d "$REPO/.git" ]; then
  rm -rf "$REPO"
  git clone "$REMOTE" "$REPO"
fi

rm -rf "$TMP"
mkdir -p "$TMP"
unzip -o "$ZIP" -d "$TMP"

cd "$REPO"
cp -r "$TMP/repo-content/." .
rm -rf "$TMP"

# Empty GitHub repositories may not have a local branch yet.
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git checkout -B main
else
  git branch -M main
fi

git remote set-url origin "$REMOTE"

echo "===== FILES INSTALLED ====="
find . -maxdepth 5 -type f | sort

echo "===== GIT STATUS ====="
git status --short

git add README.md labs/01-pli-fundamentals-compile-bind-run
git commit -m "Add PL/I Lab 01 compile bind run fundamentals"
git push -u origin main

echo "===== FINAL STATUS ====="
git status
git log -1 --oneline
