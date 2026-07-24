#!/usr/bin/env bash
# Build MkDocs secara lokal, lalu push HASIL BUILD-nya (bukan source) ke
# branch terpisah "dist" di GitHub. Di VPS, cukup `git pull` branch itu
# untuk mendapatkan file HTML/CSS/JS jadi -- tidak perlu build apa pun di
# server, cocok untuk hosting yang tidak menyediakan Python/mkdocs.

set -euo pipefail

REPO_URL="https://github.com/mosquecyber/handbook-tim26.git"
BRANCH="dist"
DIST_DIR=".dist-clone"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "==> Membuat virtualenv sementara & install mkdocs-material..."
python3 -m venv .venv-build
.venv-build/bin/pip install -q -r requirements.txt

echo "==> Build situs statis..."
.venv-build/bin/mkdocs build --clean -d site
rm -rf .venv-build

echo "==> Tambahkan .htaccess (blokir akses publik ke folder .git)..."
cp deploy/htaccess-handbook site/.htaccess

echo "==> Menyiapkan clone branch '${BRANCH}' (khusus hasil build)..."
if [ ! -d "$DIST_DIR/.git" ]; then
    if git ls-remote --exit-code --heads "$REPO_URL" "$BRANCH" >/dev/null 2>&1; then
        git clone --branch "$BRANCH" --single-branch "$REPO_URL" "$DIST_DIR"
    else
        git clone "$REPO_URL" "$DIST_DIR"
        (cd "$DIST_DIR" && git checkout --orphan "$BRANCH" && git rm -rf . >/dev/null)
    fi
fi

echo "==> Menyalin hasil build ke clone '${BRANCH}'..."
rsync -a --delete --exclude .git site/ "$DIST_DIR/"

cd "$DIST_DIR"
git add -A
if git diff --cached --quiet; then
    echo "==> Tidak ada perubahan, tidak perlu commit."
else
    git commit -q -m "Build handbook dari commit $(cd "$SCRIPT_DIR" && git rev-parse --short HEAD)"
    git push origin "$BRANCH"
    echo "==> Terpush ke branch ${BRANCH}."
fi
