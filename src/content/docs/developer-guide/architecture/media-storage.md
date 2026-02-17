---
title: Media & Storage Management (S3)
description: Mengelola aset gambar dan dokumen di lingkungan Docker.
sidebar:
  order: 4
---

Di lingkungan Docker, kita tidak bisa menyimpan file gambar secara permanen di dalam folder lokal karena file tersebut akan hilang setiap kali kontainer di-*restart*. Oleh karena itu, kita menggunakan penyimpanan eksternal berbasis **S3 (Simple Storage Service)**.

## 1. Konfigurasi S3 di Payload

Kita menggunakan Plugin S3 untuk Payload. Pastikan variabel berikut ada di `.env`:
*   **`S3_ENDPOINT`**: Alamat server storage (misal: AWS atau Minio).
*   **`S3_BUCKET`**: Nama wadah penyimpanan.
*   **`S3_ACCESS_KEY_ID` & `S3_SECRET_ACCESS_KEY`**: Kredensial untuk akses.

## 2. Koleksi Media

Semua file yang diunggah masuk ke koleksi `Media`.
*   **Upload Settings**: Kita mengatur `staticDir: 'media'` di konfigurasi koleksi, tapi di mode Production, data akan otomatis dipukul (upload) ke S3 oleh plugin.

## 3. Menampilkan Gambar di Frontend

Karena gambar berasal dari domain eksternal (Storage server), Anda **WAJIB** mendaftarkannya di `next.config.js` agar komponen `<Image />` Next.js mau memprosesnya.

```javascript
// next.config.js
images: {
  remotePatterns: [
    {
      protocol: 'https',
      hostname: 'alamat-s3-anda.com',
    },
  ],
},
```

## 4. Tips Optimasi Aset

*   **Format**: Selalu sarankan Admin mengunggah format `.webp` atau `.jpg` yang sudah dikompresi.
*   **Size**: Batas maksimal unggahan sebaiknya dibatasi (misal 2MB) agar website tidak lambat saat memuat gambar berukuran 4K.

:::warning[Masalah Link Broken]
Jika gambar di website tidak muncul (404), cek apakah URL S3 di database sudah sesuai dengan endpoint S3 yang aktif sekarang.
:::
