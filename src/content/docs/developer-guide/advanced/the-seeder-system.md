---
title: The Seeder System
description: Otomatisasi pengisian data masif untuk testing dan staging.
sidebar:
  order: 4
---

Salah satu fitur tercanggih di SMK6 Engine adalah **Atomic Seeder**. Kita bisa membangun website sekolah yang lengkap isinya hanya dalam satu baris perintah.

## 1. Mengapa Kita Butuh Seeder?

Membangun website sekolah butuh ribuan data dummy (Siswa, Kelas, Jurusan, Berita) agar kita bisa mengetes performa dan desain. Memasukkannya manual adalah pemborosan waktu.

## 2. Cara Kerja Script Seeder

Buka folder `src/seeders/`. Setiap file di sana bertanggung jawab atas satu fungsionalitas:
*   `categories.ts`: Membuat kategori berita default (Humas, Kurikulum, Kesiswaan).
*   `majors.ts`: Membuat daftar profil jurusan lengkap dengan visi-misinya.
*   `pages.ts`: Membuat struktur halaman utama (Home, About, Contact).

## 3. Logika "Upsert" (Update or Insert)

Kita tidak menggunakan perintah `insert` biasa. Kita menggunakan logika **ID-Tracking**.
*   Jika data dengan slug "otomotif" belum ada, buat baru.
*   Jika sudah ada, update isinya tanpa menggandakan data.
*   Ini memastikan Anda bisa menjalankan `pnpm seed` berkali-kali tanpa merusak database.

## 4. Cara Menambah Seeder Baru

Jika Anda membuat koleksi baru (misal: Koleksi Alumni) dan ingin membuat seeder-nya:
1.  Buat file `alumni.ts` di folder `src/seeders/collection/`.
2.  Buat array objek data alumni.
3.  Gunakan `payload.create` dalam perulangan `for...of`.
4.  Daftarkan file tersebut di file utama `src/seeders/index.ts`.

:::tip[Tips Pro]
Selalu gunakan library seperti `faker.js` (jika terinstall) untuk meng-generate nama, alamat, dan nomor hp secara acak agar data terlihat lebih manusiawi.
:::
