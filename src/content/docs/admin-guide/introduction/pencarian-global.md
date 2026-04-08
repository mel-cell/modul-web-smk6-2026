---
title: "Pencarian Global"
description: Memahami cara kerja fitur pencarian website.
sidebar:
  order: 4
---

Website SMK Negeri 6 Malang dilengkapi dengan fitur **Pencarian Global** yang memungkinkan pengunjung mencari informasi dari seluruh konten website hanya dengan mengetikkan kata kunci di kotak pencarian yang terletak di **Header** (bagian atas) setiap halaman.

## Bagaimana Pencarian Bekerja?

Sistem pencarian ini bekerja dalam 3 tahap:

### 1. Pengindeksan Otomatis
Setiap kali Anda **membuat atau mengubah** konten (Berita, Halaman, Prestasi, dll), sistem akan secara otomatis memperbarui **indeks pencarian** di koleksi **Search Results**.

### 2. Pencarian Cepat
Ketika pengunjung mengetikkan kata kunci dan menekan **Enter**, sistem akan:
-   Mencari di **judul** konten.
-   Mencari di **deskripsi meta** konten.
-   Mencari di **slug** (alamat URL) konten.

### 3. Hasil yang Relevan
Sistem akan menampilkan semua konten yang cocok dalam tampilan kartu (grid), lengkap dengan gambar, tanggal, dan link ke halaman terkait.

## Koleksi "Search Results" di Admin Panel

Di sidebar Admin Panel, Anda mungkin melihat menu **Search Results**. Ini adalah "mesin pencari" internal website.

:::warning[Jangan Edit Data di Sini!]
Data di koleksi **Search Results** dikelola **secara otomatis** oleh sistem. Anda **TIDAK PERLU** menambahkan, mengedit, atau menghapus data di sini secara manual. Semua akan ter-update otomatis saat Anda mengelola konten di koleksi aslinya (Berita, Halaman, dll).
:::

## Koleksi "Redirects"

Menu **Redirects** di Admin Panel berfungsi untuk membuat **pengalihan URL**. Ini berguna jika:
-   Anda mengubah alamat (slug) suatu halaman.
-   Anda menghapus halaman lama dan ingin mengarahkan pengunjung ke halaman baru.
-   Anda menemukan link lama yang beredar di media sosial atau Google.

### Cara Membuat Redirect:

1.  Buka menu **Redirects → Create New**.
2.  Isi **"From" (Dari)**: Alamat lama, contoh: `/pengumuman-ppdb`.
3.  Isi **"To" (Ke)**: Alamat baru, contoh: `/pendaftaran`.
4.  Pilih jenis redirect:
    -   **301 (Permanent)**: Untuk perubahan permanen. Google akan mengakui alamat baru.
    -   **302 (Temporary)**: Untuk pengalihan sementara.
5.  Klik **Save**.

:::tip[Pentingnya Redirects untuk SEO]
Redirect 301 membantu Google "memahami" bahwa konten sudah pindah, sehingga peringkat pencarian tidak turun. Ini sangat penting jika halaman tersebut sudah pernah muncul di hasil pencarian Google.
:::
