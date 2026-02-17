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

*   **Dynamic News Archive**: Pengelolaan berita per kategori yang secara otomatis mengatur penempatan gambarnya sendiri.
*   **Automatic Major Management**: Data jurusan (visi-misi, guru, galeri) yang terintegrasi secara modular.
*   **One-Click Seeder**: Fitur untuk mengisi data demo secara instan, sangat berguna saat melakukan *deployment* ulang atau testing.
*   **Smart Search System**: Fitur pencarian pintar yang bisa memfilter berita, jurusan, maupun dokumen lainnya melalui URL yang bersih.
*   **Production Stability**: Sistem sudah dilengkapi proteksi *circular dependency*, memastikan website tidak error saat diakses oleh ribuan orang sekaligus di mode produksi.
