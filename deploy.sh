#!/usr/bin/env bash
# Build MkDocs lalu upload hasil build langsung ke subfolder /handbook-tim26 di
# document root mosqueranger.org via rsync+SSH. Tidak perlu config web
# server tambahan — subfolder di bawah document root otomatis ter-serve.
#
# Pemakaian:
#   VPS_USER=deploy VPS_HOST=1.2.3.4 ./deploy.sh
#
# Variabel bisa juga diekspor lebih dulu (export VPS_USER=... dst).

set -euo pipefail

VPS_USER="${VPS_USER:?Isi VPS_USER, contoh: deploy}"
VPS_HOST="${VPS_HOST:?Isi VPS_HOST, contoh: 1.2.3.4 atau vps.mosqueranger.org}"
VPS_PATH="${VPS_PATH:-/home/mosquecyber/web/mosqueranger.org/public_html/mosqueranger-web/public/handbook-tim26}"
SSH_PORT="${SSH_PORT:-22}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "==> Membuat virtualenv sementara & install mkdocs-material..."
python3 -m venv .venv-deploy
.venv-deploy/bin/pip install -q -r requirements.txt

echo "==> Build situs statis..."
.venv-deploy/bin/mkdocs build --clean -d site

echo "==> Upload ke ${VPS_USER}@${VPS_HOST}:${VPS_PATH} ..."
rsync -avz --delete -e "ssh -p ${SSH_PORT}" site/ "${VPS_USER}@${VPS_HOST}:${VPS_PATH}/"

echo "==> Selesai. Cek https://mosqueranger.org/handbook-tim26/"

rm -rf .venv-deploy
