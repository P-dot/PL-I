#!/usr/bin/env bash
set -e

REPO="/c/Carrera_Ciberseguridad/06_Portfolio_GitHub/PL_I"
ZIP="$HOME/Downloads/PL-I-Lab-03-Part-1.zip"
TMP="$HOME/Downloads/pli-lab03-part1-tmp"
BRANCH="lab/03-pli-procedures-list-io-assignment-part-1"
LAB="labs/03-pli-procedures-list-directed-io-assignment-part-1"

rm -rf "$TMP"
mkdir -p "$TMP"
unzip -o "$ZIP" -d "$TMP"

cd "$REPO"
git switch main
git pull --ff-only origin main
git switch -c "$BRANCH"

cp -r "$TMP/PL-I-Lab-03-Part-1/repo-content/." "$REPO/"

echo "===== LAB FILES ====="
find "$LAB" -type f | sort

echo "===== SECURITY SCAN (TEXT) ====="
grep -RInE --exclude-dir=.git --binary-files=without-match '([0-9]{1,3}\.){3}[0-9]{1,3}|([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}' "$LAB" || true

echo "===== GIT VALIDATION ====="
git status --short
git add "$LAB"
git diff --cached --check
git status --short

git commit -m "Add PL/I Lab 03 Part 1 procedures I/O and assignment"
git push -u origin "$BRANCH"

gh pr create \
  --base main \
  --head "$BRANCH" \
  --title "Add PL/I Lab 03 Part 1 - procedures, I/O and assignment" \
  --body "## Objective
Document and publish the validated first part of PL/I Lab 03.

## Scope
- PROCEDURE and OPTIONS(MAIN)
- List-directed GET/PUT
- Assignment statements
- Compile, bind and run validation
- PROC03 RC=0008 troubleshooting and correction

## Validation
- PROC03 final PLI/BIND/GO: RC=0000
- LISTIO3 PLI/BIND/GO: RC=0000
- ASSIGN3 PLI/BIND/GO: RC=0000
- Functional SDSF output captured

## Environment
ADCD z/OS 1.11 / zPDT, Enterprise PL/I V3.9.

## Security
Text scan for IPv4/MAC patterns performed before commit. Screenshots retained as supplied evidence and should receive final visual publication review."

rm -rf "$TMP"
