---
title: "Scripts & Data Seeding"
description: Mengelola tipe data otomatis dan pengisian data simulasi.
sidebar:
  order: 1
---

Project SMK6 memiliki beberapa script otomatis yang mempermudah hidup developer. Semua script ini dijalankan melalui `pnpm`.

## 1. Type Generation (`pnpm generate:types`)

Setiap kali Anda mengubah struktur koleksi di Payload (menambah field baru atau mengubah relasi), Anda **WAJIB** menjalankan perintah ini.

```bash
pnpm generate:types
```

**Kenapa ini penting?** 
Script ini akan memperbarui file `payload-types.ts`. Tanpa ini, Frontend Anda tidak akan mengenali field baru tersebut dan TypeScript akan memberikan pesan error merah di kode Anda.

## 2. Sistem Seeder (`pnpm seed`)

Memasukkan data sekolah secara manual satu per satu sangat melelahkan. Kami menyediakan sistem seeder untuk mengisi data awal (dummy data) dalam hitungan detik.

*   **Lokasi Script**: `src/seeders/`
*   **Cara Pakai**: `pnpm seed`

:::caution[Peringatan]
Jangan menjalankan seeder di server **Production** kecuali Anda yakin ingin menghapus atau menimpa data yang sudah ada dengan data simulasi.
:::

## 3. Pengecekan Kualitas Kode

Sebelum melakukan push ke GitHub, sangat disarankan menjalankan:
*   **`pnpm lint`**: Mengecek apakah ada kesalahan penulisan kode.
*   **`pnpm build`**: Memastikan aplikasi benar-benar bisa dikompilasi (paling sering gagal karena error *Circular Dependency*).
