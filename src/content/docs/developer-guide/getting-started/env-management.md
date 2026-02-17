---
title: Manajemen Environment (.env)
description: Penjelasan konfigurasi file .env untuk koneksi aplikasi.
sidebar:
  order: 2
---

File `.env` adalah file paling rahasia dan paling penting di dalam project ini. File ini berisi kunci-kunci rahasia untuk koneksi database, CMS, dan API eksternal.

## 1. Lokasi & Struktur

Buat file bernama `.env` di root direktori project. Gunakan file `.env.example` sebagai referensi.

### Kunci-Kunci Penting:

*   **`PAYLOAD_SECRET`**: String acak panjang untuk mengamankan sesi login admin.
*   **`DATABASE_URI`**: Alamat koneksi ke database PostgreSQL.
*   **`NEXT_PUBLIC_SERVER_URL`**: URL utama aplikasi (misal: `http://localhost:3000` di lokal).

## 2. Perbedaan Lokal vs Produksi

:::caution[Catatan Penting]
Ada perbedaan besar antara pengaturan di komputer Anda (Local) dan di server (Production):
*   **Lokal**: Biasanya menggunakan `localhost` dan port default.
*   **Produksi**: Harus menggunakan alamat domain asli (SSL/HTTPS) dan kredensial database yang jauh lebih kuat.
:::

## 3. Keamanan

:::danger[Dilarang Keras]
**JANGAN PERNAH** melakukan `git add .env` atau mempublikasikan isi file `.env` ke grup chat publik atau GitHub. Jika kunci bocor, penyerang bisa menghapus seluruh database sekolah.
:::

## 4. Cara Mengetahui Jika .env Bermasalah
Jika Anda mendapatkan error seperti:
*   `Error: Missing DATABASE_URI`
*   `Unauthorized: Payload Secret not matched`

Itu tandanya ada yang salah atau kurang di file `.env` Anda.
