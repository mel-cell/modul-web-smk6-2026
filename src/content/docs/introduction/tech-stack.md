---
title: "Fondasi Teknologi (Core Stack)"
description: Mengenal alat-alat yang digunakan dalam membangun ekosistem digital SMKN 6 Malang.
sidebar:
  order: 2
---

Kesuksesan sistem ini didukung oleh pemilihan teknologi modern yang biasanya digunakan di perusahaan teknologi skala besar. Kita memilih teknologi ini karena kehandalan dan skalabilitasnya.

## 1. Next.js (Frontend)
Next.js bertindak sebagai wajah atau "etalase" website. 
*   **Referensi**: [Dokumentasi Resmi Next.js](https://nextjs.org/docs)
*   **Keunggulan**: Menggunakan teknologi *Server-Side Rendering* (SSR) yang artinya halaman web sudah "jadi" sebelum dikirim ke browser. Ini sangat krusial agar website SMKN 6 Malang mudah ditemukan di Google (SEO) dan terasa sangat cepat.

## 2. Payload CMS (Data Engine)
Ini adalah "Jantung" dari sistem kita. Payload adalah Headless CMS berbasis Node.js yang sangat fleksibel.
*   **Referensi**: [Dokumentasi Resmi Payload CMS](https://payloadcms.com/docs)
*   **Filosofi Code-First**: Kita mendesain database bukan melalui klik-klik di UI, melainkan melalui kode TypeScript. Ini memastikan struktur data kita punya versi (version-controlled) dan sangat presisi.
*   **Keunggulan**: Berbeda dengan CMS lama, Payload memungkinkan kita sebagai developer untuk mendesain struktur data yang unik tanpa batasan, namun tetap memberikan tampilan Admin yang sangat bersih bagi pengelola konten.

## 3. Docker (Containerization)
Untuk memastikan kestabilan, aplikasi ini dibungkus di dalam "Kontainer" Docker.
*   **Referensi**: [Apa itu Docker? (Panduan Pemula)](https://docs.docker.com/get-started/)
*   **Keunggulan**: "Satu paket" aplikasi beserta semua pengaturannya (database, server, library) tersimpan rapi. Ini memastikan aplikasi akan berjalan dengan perilaku yang sama persis, baik di komputer developer maupun di server asli sekolah.

## 4. PostgreSQL (Database)
Database relasional yang sangat kuat dan aman untuk menyimpan ribuan data siswa, alumni, berita, dan informasi sekolah lainnya.
*   **Referensi**: [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 5. Git & GitHub (Collaboration)
Seluruh riwayat perubahan kode tercatat di Git. Ini merupakan standar industri agar pengembangan bisa dilakukan secara kolaboratif oleh tim tanpa takut merusak kode yang sudah ada.
*   **Referensi**: [GitHub Guides](https://docs.github.com/en/get-started/start-your-journey/hello-world)
