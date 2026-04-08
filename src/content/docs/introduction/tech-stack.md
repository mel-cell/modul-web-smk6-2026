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

## 6. Caddy (Reverse Proxy & SSL)
Caddy bertindak sebagai "penjaga gerbang" server. Setiap permintaan dari browser pengunjung akan melewati Caddy terlebih dahulu.
*   **Referensi**: [Caddy Documentation](https://caddyserver.com/docs/)
*   **Keunggulan**: Otomatis mengelola sertifikat SSL (HTTPS) tanpa konfigurasi manual. Cukup tulis nama domain, Caddy akan mengurus sisanya.

## 7. Tailwind CSS (Styling)
Framework CSS utility-first yang memungkinkan kita membangun tampilan modern tanpa menulis file CSS terpisah.
*   **Referensi**: [Tailwind CSS Documentation](https://tailwindcss.com/docs)
*   **Keunggulan**: Kecepatan development sangat tinggi karena styling langsung ditulis di komponen React.

## 8. Sharp (Image Processing)
Library server-side untuk memproses gambar (resize, convert, compress). Setiap gambar yang diunggah akan otomatis dibuatkan dalam berbagai ukuran oleh Sharp.
*   **Referensi**: [Sharp Documentation](https://sharp.pixelplumbing.com/)

## 9. Photo Sphere Viewer (Smart Tour)
Library JavaScript untuk menampilkan foto panorama 360° secara interaktif di browser. Digunakan khusus untuk fitur **Smart Tour** (Tur Virtual Sekolah).
*   **Referensi**: [Photo Sphere Viewer v5](https://photo-sphere-viewer.js.org/)

