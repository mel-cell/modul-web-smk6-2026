---
title: Arsitektur & Fitur Utama
description: Penjelasan mengenai sistem Headless dan fitur fungsional website.
sidebar:
  order: 3
---

:::note[Belajar Konsep]
Informasi lebih lanjut mengenai konsep Headless: [What is a Headless CMS? (by Contentful)](https://www.contentful.com/knowledge-center/what-is-headless-cms/)
:::

## Konsep "Headless"

Sistem ini menggunakan arsitektur **Decoupled (Headless)**. Artinya, kita memisahkan antara bagian yang menyimpan data (Backend/CMS) dan bagian yang menampilkan data (Frontend).

### Mengapa ini Bagus?
1.  **Omnichannel**: Konten yang sama bisa disajikan ke website, aplikasi mobile, atau layar informasi di lobi sekolah tanpa perlu input ulang.
2.  **Future-Proof**: Kita bisa mengganti teknologi tampilan (misal pindah dari Next.js ke Astro) di masa depan tanpa pernah kehilangan atau harus memigrasi data inti kita.
3.  **Keamanan**: Panel admin terpisah sepenuhnya dari situs publik, sehingga memperkecil celah serangan siber.
4.  **Efisiesi Update**: Admin sekolah bisa mengubah berita atau data jurusan di CMS, dan perubahan tersebut akan langsung muncul di berbagai platform.

## Fitur Unggulan

Beberapa fitur yang menjadi pembeda utama sistem ini:

### Fitur Informasi & Konten
*   **Dynamic News Archive**: Pengelolaan berita per kategori yang secara otomatis mengatur penempatan gambarnya sendiri.
*   **Automatic Major Management**: Data jurusan (visi-misi, guru, galeri) yang terintegrasi secara modular.
*   **Achievement Showcase**: Dokumentasi prestasi siswa dan guru dengan integrasi gambar & kategori.
*   **Academic Calendar**: Kalender akademik yang bisa dikelola per tahun ajaran.
*   **Job Vacancy Portal**: Informasi lowongan kerja dari mitra industri yang dikelola oleh BKK.

### Fitur Interaktif
*   **Smart Tour 360°**: Tur virtual sekolah yang menggunakan foto panorama 360° dengan navigasi hotspot antar ruangan, dilengkapi progressive loading untuk performa optimal.
*   **Global Search**: Pencarian pintar yang bisa memfilter seluruh konten website (berita, halaman, prestasi, jurusan) melalui kotak pencarian di Header.
*   **Gallery Archive**: Arsip galeri foto dengan filter per kategori dan pagination otomatis.
*   **Interactive Forms**: Formulir kontak dan feedback yang bisa dibuat langsung dari Admin Panel.

### Fitur Teknis
*   **One-Click Seeder**: Fitur untuk mengisi data demo secara instan, sangat berguna saat melakukan *deployment* ulang atau testing.
*   **Progressive Image Loading**: Gambar 360° ditampilkan dalam dua tahap (lowRes → highRes) untuk pengalaman instan di jaringan lambat.
*   **Bind Mount Persistence**: File upload (media & tour) tersimpan permanen di server meskipun container di-restart.
*   **Production Stability**: Sistem dilengkapi proteksi *circular dependency* dan *dynamic import* untuk mencegah error runtime di mode produksi.
*   **SEO Optimization**: Setiap halaman dilengkapi meta tags, sitemap otomatis, dan Open Graph images.

