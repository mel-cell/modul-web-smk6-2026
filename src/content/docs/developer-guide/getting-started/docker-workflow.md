---
title: Docker Workflow
description: Cara menjalankan project menggunakan Docker Compose.
sidebar:
  order: 3
---

Kita menggunakan Docker untuk memastikan bahwa environment database dan aplikasi tetap stabil dan "terbungkus" rapi.

## 1. Menjalankan Sistem

Setelah file `.env` siap, jalankan perintah berikut di terminal:

```bash
docker compose up -d
```

Flag `-d` (detached) artinya Docker akan berjalan di latar belakang sehingga terminal Anda tidak macet.

## 2. Layanan (Services) yang Berjalan

Docker akan otomatis menyiapkan:
1.  **App Service**: Aplikasi Next.js & Payload (Port 3000).
2.  **Database Service**: PostgreSQL (Port 5432).

## 3. Perintah Berguna

*   **Melihat Log**: `docker compose logs -f` (Gunakan ini untuk melihat error yang terjadi di server).
*   **Mematikan Sistem**: `docker compose down`.
*   **Build Ulang**: `docker compose build --no-cache` (Gunakan ini jika Anda mengubah Dockerfile).

## 4. Masalah Umum (Troubleshooting)

:::note[Catatan Debugging]
Jika Docker gagal dijalankan dengan pesan **"Port is already allocated"**:
1. Cek apakah ada Postgres atau aplikasi lain yang sudah jalan di komputer Anda.
2. Matikan aplikasi tersebut, atau ubah nomor port di file `docker-compose.yml`.
:::

:::tip[Tips Pro]
Untuk pengembangan sehari-hari (Development), Anda biasanya hanya butuh Docker untuk menjalankan **Database** saja, sedangkan aplikasinya dijalankan melalui `pnpm dev`. Ini akan membuat proses koding jauh lebih ringan dan cepat (Hot Reload).
:::
