---
title: "Smart Tour (Tur Virtual 360°)"
description: Panduan menyeluruh untuk mengelola fitur Tur Virtual Sekolah.
sidebar:
 order: 1
---

Smart Tour adalah fitur unggulan website SMK Negeri 6 Malang yang memungkinkan pengunjung menjelajahi lingkungan sekolah secara **virtual 360 derajat**, layaknya Google Street View.

:::note[Untuk Siapa?]
Fitur ini sangat berguna untuk calon siswa dari luar kota yang ingin melihat fasilitas sekolah sebelum mendaftar, atau untuk mitra industri yang ingin mengetahui kondisi lingkungan sekolah.
:::

## Konsep Dasar

Sistem Smart Tour terdiri dari **dua koleksi** yang saling terhubung:

1. **Koleksi Media 360**: Tempat mengunggah (upload) foto panorama 360°.
2. **Koleksi Smart Tour**: Tempat merangkai foto-foto tersebut menjadi sebuah tur interaktif yang bisa dijelajahi pengunjung.

### Alur Kerja Pembuatan Tur

```
 Upload Foto 360° ──► Buat Ruangan ──► Hubungkan Hotspot ──► Publish
 (Koleksi Media 360) (Koleksi Smart Tour) (Antar Ruangan) (Terbitkan)
```

## Bagian-Bagian Smart Tour

### Tab di Koleksi Smart Tour
Saat membuat tur baru, Anda akan menemukan beberapa tab:

| Tab | Fungsi |
|-----|--------|
| **Hero** | Gambar sampul dan judul utama tur |
| **Materi (Rooms)** | Daftar ruangan/lokasi yang bisa dijelajahi |
| **Pengaturan** | Konfigurasi teknis tur |
| **Arsitektur (Map)** | Peta denah sekolah (opsional) |
| **SEO** | Pengaturan tampilan di Google |

### Komponen Ruangan
Setiap **ruangan** di dalam tur terdiri dari:
- **Nama Ruangan**: Label yang ditampilkan ke pengunjung (contoh: "Laboratorium RPL").
- **Slug Ruangan**: Identifikasi unik otomatis (contoh: `laboratorium-rpl`).
- **Deskripsi**: Narasi singkat mengenai ruangan.
- **Foto 360° Panorama**: Gambar utama yang akan ditampilkan dalam viewer.
- **Penghubung / Hotspot**: Titik-titik klik yang menghubungkan ke ruangan lain.

## Langkah Selanjutnya

Silakan lanjut ke panduan berikut:
1. [Cara Upload Gambar 360°](/admin-guide/content-management/smart-tour/upload-360)
2. [Mengelola Hotspot & Navigasi](/admin-guide/content-management/smart-tour/hotspot-management)

:::tip[Best Practice]
Siapkan foto 360° yang berkualitas tinggi (minimal 4096x2048 piksel) agar pengalaman tur virtual terasa mulus dan profesional.
:::
