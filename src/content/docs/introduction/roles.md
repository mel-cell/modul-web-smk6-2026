---
title: Peran & Tanggung Jawab
description: Siapa yang mengelola apa dalam ekosistem website ini.
sidebar:
 order: 4
---

Agar sistem ini berjalan dengan lancar dalam jangka panjang, diperlukan pemisahan peran yang jelas antara tim teknis dan tim konten.

## 1. Developer (Technical Team)
**Tugas Utama**: Mengurus kode program, server, dan database.
* Mengatur cara data ditampilkan di website.
* Menambah fitur baru jika dibutuhkan (misal: formulir baru, halaman statis baru).
* Memastikan server dan database selalu sehat di dalam kontainer Docker.
* Melakukan pembaruan keamanan secara berkala.
* Mengelola deployment dan konfigurasi Caddy (SSL/Domain).

## 2. Administrator (Content Team)
**Tugas Utama**: Mengurus informasi dan pesan sekolah.
* **Humas**: Mengunggah berita harian, agenda sekolah, dan pengumuman.
* **Admin Jurusan**: Memperbarui informasi spesifik jurusan, visi-misi, dan galeri kegiatan produktif.
* **Admin BKK**: Mengelola data mitra industri, lowongan kerja, dan informasi karir alumni.
* **Admin Smart Tour**: Mengunggah foto 360° dan mengatur tur virtual sekolah.
* **Manajemen**: Memantau feedback dari formulir kontak atau pendaftaran.

## 3. Matriks Tanggung Jawab

| Tugas | Developer | Humas | Jurusan | BKK |
|-------|:---------:|:-----:|:-------:|:---:|
| Berita & Pengumuman | - | | - | - |
| Data Jurusan & Ekskul | - | - | | - |
| Prestasi Siswa | - | | | - |
| Mitra Industri & Loker | - | - | - | |
| Smart Tour (Tur Virtual) | | | - | - |
| Media (Foto & Dokumen) | - | | | |
| Halaman (Pages) | | - | - | - |
| Kalender Akademik | - | | - | - |
| Header & Footer | | - | - | - |
| Server & Database | | - | - | - |

## Alur Data
Data mengalir dari **Administrator** (Input via CMS) -> **Developer** (Setting via Code) -> **User** (Output via Website).

---

Dengan pembagian tugas yang jelas ini, website SMK Negeri 6 Malang akan selalu memiliki konten yang segar (oleh Admin) dengan sistem yang tangguh (oleh Developer).
