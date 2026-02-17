---
title: Access Control & Circular Safety
description: Keamanan data dan pencegahan error fatal di Production.
sidebar:
  order: 3
---

Bagian ini membahas bagaimana kita mengamankan data dan menghindari kesalahan teknis paling fatal dalam project ini.

## 1. Access Control (Siapa yang Boleh Lewat?)

Kita menggunakan fungsi `checkRole` untuk membatasi akses.
*   **Admin & Developer**: Punya akses penuh (Create, Read, Update, Delete).
*   **Siswa**: Hanya bisa melihat data dirinya sendiri dan membaca berita publik.
*   **Publik**: Hanya bisa membaca data yang statusnya `published`.

## 2. Praktik Terbaik Penulisan Akses

Gunakan fungsi pembantu di folder `src/access` agar kode tetap bersih dan mudah dibaca (D.R.Y - Don't Repeat Yourself).

## 3. PENCEGAHAN CIRCULAR DEPENDENCY (PENTING!)

Ini adalah pelajaran terpenting selama pengembangan project SMK6. Project ini sangat sensitif terhadap **Circular Dependency** (A butuh B, B butuh A), terutama saat di-build untuk Production.

:::danger[Wajib Dipatuhi]
Dalam file konfigurasi CMS (`index.ts` koleksi atau file `hooks`), **DILARANG KERAS** mengimpor tipe data langsung dari `@/payload-types` seperti ini:

```typescript
// SALAH / BERBAHAYA
import { User } from '@/payload-types' 
```

**MENGAPA?** Karena file `@/payload-types` baru akan tercipta setelah konfigurasi selesai dibaca. Jika konfigurasi sudah minta tipe data tersebut duluan, aplikasi akan mengalami **ReferenceError: Cannot access before initialization** di Production.
:::

### Solusi Aman:
1.  Gunakan tipe data `any` jika hanya untuk pengecekan sederhana.
2.  Gunakan `import type` (hanya untuk TypeScript) jika benar-benar butuh, tapi hindari di file hooks yang dijalankan di runtime.
3.  Uji selalu hasil kodingan Anda dengan perintah `pnpm build` di lokal sebelum melakukan push ke GitHub.
