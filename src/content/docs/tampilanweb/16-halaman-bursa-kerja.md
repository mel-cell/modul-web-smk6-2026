---
title: Halaman Bursa Kerja
description: Tampilan halaman lowongan kerja dan penempatan lulusan
---

# Halaman Bursa Kerja

Halaman bursa kerja menampilkan lowongan pekerjaan, info perusahaan, dan data penempatan lulusan sekolah.

## Tampilan Halaman

![Tampilan Halaman Bursa Kerja](/modul-web-smk6-2026/img/tampilan-web/bursakerja.png)

## Fitur-Fitur Utama

### 1. Daftar Lowongan Kerja
- Card untuk setiap lowongan
- Nama posisi
- Nama perusahaan
- Lokasi kerja
- Tipe kontrak (Tetap, Kontrak, Magang)
- Tanggal posting

### 2. Detail Lowongan
- Deskripsi pekerjaan
- Kualifikasi dan requirement
- Benefit dan gaji
- Batas waktu lamaran
- Contact recruiter

### 3. Filter Lowongan
- Filter by perusahaan
- Filter by lokasi
- Filter by tipe kontrak
- Filter by posisi
- Filter by tanggal posting

### 4. Search Function
- Search by keyword posisi
- Search by nama perusahaan
- Search by lokasi
- Suggestions

### 5. Sorting Options
- Terbaru
- Paling Sesuai
- Lokasi Terdekat

### 6. Apply Mechanism
- Apply button
- Upload CV
- Cover letter form
- Direct link ke aplikasi perusahaan

### 7. Statistik Penempatan
- Total alumni terumpluh
- Persentase penempatan
- Top employer
- Gaji rata-rata

### 8. Profil Perusahaan
- Daftar perusahaan mitra
- Logo perusahaan
- Bidang usaha
- Contact information
- Lowongan aktif

### 9. Testimoni Lulusan
- Nama dan tahun lulus
- Posisi saat ini
- Perusahaan
- Quote pengalaman kerja

## URL Search Params

- `?search=developer` - Pencarian posisi
- `?company=PT.ABC` - Filter perusahaan
- `?location=jakarta` - Filter lokasi
- `?type=tetap` - Filter tipe kontrak

Contoh: `/bursa-kerja?search=developer&location=jakarta&type=tetap`

## Mobile Responsive

- Simplified filter view
- Stack layout untuk lowongan
- Bottom sheet untuk detail
