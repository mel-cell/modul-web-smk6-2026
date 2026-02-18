---
title: "Master Guide: Kurikulum & Data Jurusan"
description: Panduan definitif untuk pemeliharaan data kompetensi keahlian, fasilitas praktik, dan sinkronisasi struktur akademik di website.
sidebar:
  order: 2
---

Halaman ini berfungsi sebagai acuan bagi Kepala Program Keahlian (Kaprogli) dalam menyusun representasi digital dari jurusan masing-masing. Data yang akurat sangat krusial sebagai media informasi calon siswa baru dan publikasi kemitraan industri.

## 1. Navigasi & Hirarki Data

Data Jurusan dikelola dalam kelompok **Data Sekolah**. Penataan ini memastikan integrasi data antara kurikulum, fasilitas, dan tenaga pengajar tetap sinkron.

*   **Akses**: Sidebar Kiri > Group **"Data Sekolah"** > Collection **"Jurusan"**.
*   **Identitas**: Setiap jurusan diidentifikasi melalui **Slug** yang unik untuk membentuk URL seperti `/jurusan/teknik-komputer-jaringan`.

## 2. Bedah Tab Konfigurasi (Field-by-Field Breakdown)

Formulir Jurusan dibagi menjadi beberapa Tab untuk memudahkan manajemen data yang kompleks.

### **A. Tab: Informasi Umum (Core Info)**
:::tip[Visual Tab Profil]
![Screenshot Tab Profil Jurusan](../../../../../../assets/admin-guide/content-management/informasi_umum_jurusan.png)
:::

*   **Nama Jurusan**: Nama resmi sesuai SK pendirian.
*   **Visi & Misi Jurusan**: Harus bersifat spesifik. Misi jurusan harus mendukung visi besar sekolah.
*   **Deskripsi Panjang**: Penjelasan naratif mengenai apa yang dipelajari siswa di jurusan ini. Muncul di bagian atas halaman profil jurusan.
*   **Logo/Icon**: Gunakan format `.svg` atau `.png` transparan untuk tampilan yang bersih pada list navigasi.

### **B. Tab: Akademik & Kompetensi**
*   **Mata Pelajaran (Array)**: Masukkan daftar mata pelajaran produktif (kejuruan). Ini memberikan gambaran bagi calon siswa mengenai materi teknis yang akan mereka pelajari.
*   **Capaian Pembelajaran**: Deskripsikan keahlian apa yang akan dikuasai siswa setelah lulus (Output lulusan).

### **C. Tab: Fasilitas & Bengkel**
:::tip[Visual Layout]
![Screenshot Tab Layout Jurusan](../../../../../../assets/admin-guide/content-management/layout_jurusan.png)
:::

*   **Gallery Fasilitas (Blocks)**: Gunakan komponen *Media Grid* untuk menampilkan foto-foto Laboratorium, Bengkel, atau Studio. 
*   **Spesifikasi Alat**: Anda bisa menambahkan daftar alat-alat canggih yang dimiliki untuk meningkatkan nilai tawar jurusan.

## 3. Integrasi Relasi (Hubungan Antar Data)

Salah satu kelebihan sistem kita adalah keterhubungan data (Data Linkage).

1.  **Kepala Jurusan (Relation)**: Pilih nama guru dari koleksi `Siswa/Guru`. Sistem akan menarik foto dan bio guru tersebut secara otomatis untuk ditampilkan sebagai "Kaprogli".
2.  **Mitra Industri (Relation)**: Hubungkan perusahaan yang sering menjadi tempat PKL/Prakerin untuk jurusan ini. Logo perusahaan akan muncul di section "Mitra Industri Kami" pada halaman jurusan.

## 4. Validasi & Standar Publikasi

*   **Kualitas Visual**: Foto fasilitas **HARUS** dalam keadaan rapi dan bersih. Hindari foto yang terlalu gelap atau goyang.
*   **Update Berkala**: Informasikan jika ada kerjasama industri baru agar halaman jurusan tetap terlihat aktif dan profesional.

:::danger[Sinkronisasi Kelas]
Jika Anda mengubah nama jurusan, pastikan untuk memeriksa koleksi **Kelas**. Nama jurusan yang berubah mungkin perlu disesuaikan kembali pada data kelas agar laporan absensi atau data siswa tidak mengalami disorientasi data.
:::
