---
title: "Deployment & Infrastruktur"
description: Panduan deployment ke production server menggunakan Docker dan Caddy.
sidebar:
 order: 5
---

Sistem SMK6 Engine berjalan di atas **Docker** dengan **Caddy** sebagai reverse proxy. Halaman ini menjelaskan arsitektur deployment, langkah-langkah deploy, dan troubleshooting yang sering muncul.

## Arsitektur Deployment

```
┌─────────────────────────────────────────────────┐
│ SERVER │
│ │
│ ┌─────────┐ ┌──────────────────────────┐ │
│ │ Caddy │────│ Docker: smk6-app │ │
│ │ (SSL/TLS)│ │ Port: 9098 │ │
│ │ Port 443 │ │ Next.js + Payload CMS │ │
│ └─────────┘ └──────────┬───────────────┘ │
│ │ │
│ ┌─────────▼──────────┐ │
│ │ Docker: postgres_db │ │
│ │ Port: 5432 │ │
│ │ PostgreSQL 15 │ │
│ └────────────────────┘ │
│ │
│ Bind Mounts: │
│ ./public/media ◄── /app/public/media │
│ ./public/tour ◄── /app/public/tour │
└─────────────────────────────────────────────────┘
```

## Docker Compose

File `docker-compose.yml` mendefinisikan layanan utama:

```yaml
services:
 app:
 container_name: smk6-app
 build: .
 ports:
 - "9098:9098"
 environment:
 - DATABASE_URI=postgresql://...
 - PAYLOAD_SECRET=...
 - NEXT_PUBLIC_SERVER_URL=https://test.smkn6malang.sch.id
 deploy:
 resources:
 limits:
 memory: 1536m # Wajib untuk proses resize gambar 360°
 volumes:
 - ./public/media:/app/public/media
 - ./public/tour:/app/public/tour
```

### Kenapa Memory 1536 MB?
Proses **Sharp** (library resize gambar) membutuhkan RAM besar saat memproses foto panorama 360° beresolusi tinggi (4096×2048). Jika memory limit terlalu kecil, container akan crash dengan **OOM (Out of Memory)** dan menghasilkan error **502 Bad Gateway**.

## Caddy (Reverse Proxy + SSL)

Caddy berjalan di level sistem operasi (bukan di Docker) dan secara otomatis menangani:
- **SSL/TLS Certificate**: Sertifikat HTTPS gratis via Let's Encrypt.
- **Reverse Proxy**: Meneruskan request dari domain ke port 9098.

### Lokasi Konfigurasi

```
/etc/caddy/Caddyfile ← File utama, mengimpor file lain
/home/mel/Caddy/Caddyfile ← Konfigurasi domain pribadi
```

### Contoh Konfigurasi

```
# /home/mel/Caddy/Caddyfile
test.smkn6malang.sch.id {
 reverse_proxy localhost:9098
}
```

:::danger[Aturan Kritis: Jangan Duplikasi Domain!]
Jika domain yang sama (misalnya `test.smkn6malang.sch.id`) muncul di **dua file Caddyfile** berbeda, Caddy akan gagal total dan menghasilkan error `SSL_ERROR_INTERNAL_ERROR_ALERT`. Pastikan setiap domain hanya didefinisikan di **SATU** file Caddyfile.
:::

## Langkah Deploy / Update

### Deploy Perubahan Kode

```bash
# 1. Build ulang container
docker compose up -d --build

# 2. Cek apakah container sudah berjalan
docker ps

# 3. Cek log jika ada masalah
docker logs --tail 50 smk6-app
```

### Deploy Pertama Kali

```bash
# 1. Clone repository
git clone <repo-url>
cd SMKNegeri6Malang

# 2. Buat file .env
cp .env.example .env
# Edit .env sesuai konfigurasi server

# 3. Buat folder untuk Bind Mount
mkdir -p public/media public/tour
chmod -R 777 public/media public/tour

# 4. Build dan jalankan
docker compose up -d --build

# 5. Jalankan seeder (opsional, untuk data demo)
docker exec smk6-app npx tsx src/seeders/collection/categories.ts
```

## Troubleshooting

### Error 502 Bad Gateway
| Penyebab | Solusi |
|----------|--------|
| Container crash (OOM) | Naikkan memory limit ke `1536m` |
| Aplikasi belum ready | Tunggu 10-30 detik setelah restart |
| Port salah | Pastikan `PORT=9098` di environment |

### SSL Internal Error
| Penyebab | Solusi |
|----------|--------|
| Domain duplikat di Caddyfile | Hapus duplikat, tetap di satu file saja |
| Caddy perlu reload | Jalankan `sudo systemctl reload caddy` |
| Sertifikat expired | Caddy otomatis renewal, tunggu 5 menit |

### File Upload Hilang Setelah Rebuild
| Penyebab | Solusi |
|----------|--------|
| Menggunakan Named Volume | Ganti ke Bind Mount (`./public/media:/app/public/media`) |
| Folder belum dibuat | Jalankan `mkdir -p public/media public/tour` |
| Permission denied | Jalankan `chmod -R 777 public/media public/tour` |
