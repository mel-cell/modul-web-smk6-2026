---
title: "Master Guide: Manajemen Konten Berita"
description: Dokumentasi definitif untuk pengelolaan informasi, pengunggahan media, dan optimasi SEO pada modul Berita SMKN 6 Malang.
sidebar:
  order: 2
---

Halaman ini adalah standar operasional prosedur (SOP) bagi tim Humas SMKN 6 Malang dalam mengelola arus informasi digital. Pastikan setiap langkah diikuti untuk menjaga kualitas data dan performa website.

## 1. Arsitektur Akses & Navigasi

Sebelum melakukan penginputan, admin harus memahami struktur navigasi pada CMS Payload:

1.  **Otentikasi**: Pastikan Anda login dengan akun yang memiliki role `Editor` atau `Admin`.
2.  **Entry Point**: Sidebar Kiri > Group **"Profil Sekolah"** > Collection **"Berita"**.
3.  **Action**: Klik tombol **"Create New"**. Sistem akan membuka formulir kosong dengan ID unik yang tersimpan sementara sebagai draf.

:::tip[Navigasi Visual]
![Dashboard Utama](../../../../assets/admin-guide/introduction/dashboard-utama.png)
*Gunakan Sidebar sebagai kontrol navigasi utama Anda.*
:::

## 2. Bedah Teknis Kolom Input (Field Analysis)

Setiap kolom (field) di bawah ini memiliki dampak langsung pada tampilan *Frontend* dan indeks pencarian *Google (SEO)*.

### **A. Judul Berita (Title)**
*   **Tipe Data**: String/Teks Pendek.
*   **Ketentuan**: Maksimal 70 karakter untuk optimasi *Google Search Result*.
*   **Strategi**: Gunakan formula *Click-worthy* namun tetap informatif. Contoh: *"Siswa TKJ SMKN 6 Malang Borong Juara LKS Tingkat Nasional 2026"*.

### **B. Slug (Identitas URL)**
*   **Fungsi**: Penentu link permanen (Permalink).
*   **Teknis**: Tergenerasi otomatis dari Judul. Gunakan tanda hubung `-` sebagai pemisah (Kebab-case).
*   **Larangan**: Jangan pernah mengubah Slug setelah berita di-publish dan dibagikan ke media sosial, karena akan menyebabkan link rusak (Error 404).

### **C. Hero Image (Gambar Utama)**
*   **Resolusi Ideal**: 1200 x 675 pixel (Rasio 16:9).
*   **Ukuran File**: Maksimal 500 KB. Gunakan format `.webp` untuk kecepatan akses optimal.
*   **Alt Text**: **WAJIB DIISI**. Deskripsikan isi gambar untuk aksesibilitas netra dan SEO Gambar. Contoh: *"Penyerahan piala juara 1 LKS Nasional kepada siswa SMKN 6 Malang"*.

### **D. Editor Lexical (Rich Text)**
Ini adalah mesin pengolah kata utama Anda.
1.  **Struktur Tulisan**: Gunakan Heading 2 (`H2`) untuk membagi sub-topik. Jangan gunakan `H1` di dalam editor karena `H1` sudah otomatis digunakan oleh Judul.
2.  **Media Embedding**: Anda bisa memasukkan gambar tambahan (Media) atau link internal/eksternal di sela-sela paragraf.
3.  **Auto-Save**: Sistem melakukan penyimpanan setiap 30 detik secara otomatis ke database lokal.

### **E. Relasi Kategori & Penulis**
*   **Kategori (Relation)**: Menghubungkan berita ke koleksi "Kategori". Berita tanpa kategori tidak akan muncul di filter halaman index berita.
*   **Penulis (Relation)**: Menghubungkan ke koleksi "Pengguna". Ini akan menampilkan profil penulis di akhir artikel untuk meningkatkan kredibilitas tulisan.

## 3. Manajemen Status & Validasi Data

Sebelum menekan tombol akhir, perhatikan status draf Anda:

1.  **State Management**:
    *   **Draft**: Data tersimpan di database, tetapi API tidak akan mengirimkan data ini ke sistem Next.js (Frontend).
    *   **Published**: Data langsung dikirim ke `Global Cache` dan memicu fungsi `Revalidation` pada Next.js agar berita muncul dalam milidetik di website.
2.  **Validasi**: Sistem akan menolak penyimpanan jika kolom bertanda bintang merah (`*`) kosong.

:::warning[Peringatan Publish]
Sistem menggunakan **On-Demand Revalidation**. Begitu Anda menekan **Publish**, konten di website publik akan berubah secara permanen. Pastikan tidak ada kesalahan ejaan pada nama pejabat sekolah atau nama instansi industri.
:::

## 4. Troubleshooting Umum
*   **Gambar Tidak Muncul**: Cek folder Media, pastikan file tidak terhapus di S3/Storage.
*   **Slug Bentrok**: Jika ada judul yang sama persis, sistem akan menambahkan angka di belakang slug secara otomatis (misal: `berita-hari-ini-1`).
