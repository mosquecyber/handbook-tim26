# Handbook Tim 26

Sumber konten untuk situs handbook Tim 26, ditulis dalam Markdown dan di-build menggunakan [MkDocs](https://www.mkdocs.org/) dengan tema [Material](https://squidfunk.github.io/mkdocs-material/).

## Struktur Folder

```
handbook-tim26/
├── docs/               # seluruh konten handbook (.md)
│   └── index.md
├── deploy/             # file pendukung deployment
│   └── htaccess-handbook
├── build-and-push.sh   # build & push hasil static site ke branch dist
├── deploy.sh           # deploy via rsync + SSH
├── mkdocs.yml          # konfigurasi situs & navigasi
└── README.md
```

## Menjalankan Secara Lokal

Perlu Python terpasang, lalu:

```bash
pip install -r requirements.txt
mkdocs serve
```

Situs bisa diakses di `http://127.0.0.1:8000` dan otomatis reload saat file `.md` diedit.

## Build untuk Publish

```bash
mkdocs build -d site
```

Hasil build statis akan ada di folder `site/`, siap di-serve oleh web server (Nginx, Apache, dsb).

## Menambahkan Halaman Baru

1. Buat file `.md` baru di dalam folder `docs/`
2. Tambahkan entri untuk file tersebut di `nav:` pada `mkdocs.yml`
3. Commit & push perubahan

## Alur Update Konten

```bash
git add .
git commit -m "Update: <deskripsi perubahan>"
git push origin main
```

## Deploy ke VPS (subfolder domain)

Situs di-publish ke `https://mosqueranger.org/handbook-tim26/`, sebagai subfolder di dalam document root `mosqueranger.org` yang sudah ada:

```
/home/mosquecyber/web/mosqueranger.org/public_html/mosqueranger-web/public/handbook-tim26/
```

### Cara A — Build lokal, VPS tinggal `git pull` (Recommended)

Setiap kali ingin publish perubahan dari komputer lokal:

```bash
./build-and-push.sh
```

### Cara B — rsync langsung via SSH

```bash
VPS_USER=<user-ssh> VPS_HOST=<ip-atau-host-vps> ./deploy.sh
```
