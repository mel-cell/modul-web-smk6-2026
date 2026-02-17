---
title: Production Debugging (The War Room)
description: Strategi menghadapi bug misterius di lingkungan Live server.
sidebar:
  order: 2
---

Berbeda dengan lokal yang ramah developer, server Production seringkali memberikan pesan error yang singkat dan tidak jelas. Halaman ini adalah panduan "P3K" Anda.

## 1. Menghadapi "ReferenceError: i is not defined"

Ini adalah error yang paling sering muncul di project SMK6 yang dikompilasi dengan Next.js.
*   **Penyebab**: Hampir 100% karena **Circular Dependency**.
*   **Analisis**: Webpack mencoba membungkus komponen A, tapi A butuh B, dan B butuh A. Salah satu komponen akhirnya "mati" karena tidak tahu siapa yang harus lahir duluan.

### Langkah Penanganan (Fixing Loop):
1.  Buka `next.config.js`.
2.  Set `optimization.minimize = false`.
3.  Deploy ulang atau `pnpm build && pnpm start`.
4.  Lihat log: Error bukan lagi `i is not defined`, melainkan nama asli komponen (misal: `SwipeCardsComponent is not defined`).
5.  Gunakan `next/dynamic` untuk mengimpor komponen tersebut di `RenderBlocks`.

## 2. Memantau Log Docker secara Realtime

Jangan menebak-nebak apa yang terjadi di server. Gunakan perintah ini:
```bash
docker logs -f smk6-app --tail 50
```
Pantau setiap request yang masuk. Jika ada error 500, detailnya biasanya akan muncul di sini (misal: Database connection timeout).

## 3. Investigasi Database (PostgreSQL)

Jika data di CMS ada tapi di Web tidak muncul:
1.  Masuk ke terminal kontainer DB: `docker exec -it smk6-db psql -U postgres`.
2.  Cek apakah tabel benar-benar ada dan berisi data: `SELECT * FROM news LIMIT 5;`.
3.  Jika data tidak ada, jalankan ulang `pnpm seed`.

## 4. Cache & Revalidation Problems

Jika Admin komplain "Saya sudah simpan tapi web tidak berubah":
*   **Cek Network**: Gunakan Inspect Element -> Network tab. Lihat header `X-Nextjs-Cache`. Jika nilainya `HIT`, artinya user masih melihat cache lama.
*   **Pemicu Paksa**: Buatlah endpoint rahasia untuk memicu revalidasi total jika sistem otomatis hooks sedang mengalami masalah.

:::tip[Penting]
Gunakan tool monitoring seperti **Sentry** atau **Logtail** jika project ini mulai diakses oleh puluhan ribu user agar Anda mendapatkan notifikasi email saat server sedang error.
:::
