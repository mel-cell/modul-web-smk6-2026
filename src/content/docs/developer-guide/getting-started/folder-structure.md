---
title: Struktur Direktori (Master Blueprint)
description: Penjelasan komprehensif mengenai setiap sudut folder dan file project.
sidebar:
  order: 1
---

Project SMK6 Engine bukan sekadar kumpulan file, melainkan ekosistem yang terbagi menjadi dua dunia utama: **Data Management (Payload)** dan **Visual Delivery (Next.js)**.

## 1. Root Configuration (Konfigurasi Akar)

Setiap file di akar (root) memiliki peran vital dalam siklus hidup aplikasi:

*   **`next.config.js`**: Pusat kendali Next.js. Di sini kita mengatur whitelist domain gambar (agar gambar dari CMS muncul), optimasi webpack, dan redirect.
*   **`payload.config.ts`**: Dokumentasi paling penting untuk Backend. Di sini kita mendaftarkan semua Collections, Globals, Database adapter, dan S3 Storage.
*   **`docker-compose.yml`**: BluePrint infrastruktur. Menjelaskan bagaimana container PostgreSQL dan App saling bicara lewat jaringan internal Docker.

## 2. Bedahsrc/app: Routing System

Kita menggunakan Next.js App Router dengan pola **Route Groups** (folder yang diawali tanda kurung):

*   **`(frontend)/`**: Folder ini murni untuk tampilan yang dilihat publik.
    *   `[slug]/page.tsx`: Halaman dinamis. Jika user mengetik `/visi-misi`, file ini akan mencari data dengan slug tersebut di CMS.
*   **`(payload)/`**: Folder ini adalah "pintu masuk" ke Admin Panel. Isinya adalah konfigurasi agar Payload CMS bisa berjalan di dalam Next.js.

## 3. Bedah src/collections: Pusat Logika Data

Setiap folder koleksi (misal `News/`) memiliki anatomi standar:
*   **`index.ts`**: Mendefinisikan kolom (fields), hak akses (access), dan nama tabel.
*   **`hooks/`**: Tempat logika otomatis. Jika Anda ingin berita otomatis terbit di tanggal tertentu, logikanya ada di sini.
*   **`access/`**: File terpisah untuk keamanan. Memastikan hanya "Admin News" yang bisa mengedit berita, bukan "Admin Siswa".

## 4. Bedah src/blocks: Sistem Modular

Blok adalah potongan UI yang bisa dipindah-pindah. Struktur blok yang benar adalah:
*   `ArchiveBlock/`:
    *   `config.ts`: Skema data (Judul, Limit data, Kategori).
    *   `Component.tsx`: Tampilan React-nya.
    *   `index.ts`: Export utama agar rapi.

## 5. Folder Utility & Library

*   **`src/utilities/`**: Berisi fungsi-fungsi kecil yang sering dipakai (format tanggal, pembersih teks, slug-generator).
*   **`src/lib/`**: Inisialisasi library pihak ketiga seperti Prisma, AWS SDK, atau Shadcn primitives.

:::danger[Aturan Emas]
Jangan pernah membuat file logika bisnis langsung di dalam folder `src/app`. Selalu pisahkan logika ke `utilities` atau `hooks` agar kode bisa dites dan digunakan ulang (*reusable*).
:::
