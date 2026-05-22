---
title: Halaman Prestasi
description: Tampilan halaman daftar prestasi siswa dan sekolah
---

# Halaman Prestasi

Halaman prestasi menampilkan pencapaian dan prestasi yang telah diraih oleh siswa dan sekolah secara keseluruhan.

## Tampilan Halaman

![Tampilan Halaman Prestasi](/modul-web-smk6-2026/img/tampilan-web/prestasi.png)

## Fitur-Fitur Utama

### 1. Statistik Prestasi
- Total prestasi yang diraih
- Breakdown per kategori
- KPI atau key metrics

### 2. Daftar Prestasi
- Card untuk setiap prestasi
- Judul prestasi
- Nama siswa/guru/tim
- Tingkat (Kota, Provinsi, Nasional, Internasional)
- Tanggal dan tahun

### 3. Filter dan Search
- Filter berdasarkan kategori (Akademik, Olahraga, Seni, dll)
- Filter berdasarkan tahun/periode
- Filter berdasarkan tingkat pencapaian
- Search by nama atau prestasi

### 4. Sorting Options
- Urutkan berdasarkan tanggal (Terbaru)
- Urutkan berdasarkan tingkat (Tertinggi)
- Urutkan berdasarkan kategori

### 5. Prestasi Card Detail
- Icon/medal representatif
- Nama pemenang
- Nama prestasi
- Tingkat pencapaian dengan badge
- Tanggal
- Foto atau sertifikat (opsional)

### 6. Kategori Prestasi
- Akademik (Kompetisi sains, matematika, dll)
- Olahraga
- Seni
- Budaya
- Lainnya

## URL Search Params

- `?category=akademik` - Filter kategori
- `?year=2024` - Filter tahun
- `?level=nasional` - Filter tingkat
- `?search=robotika` - Pencarian

Contoh: `/prestasi?category=akademik&year=2024&level=nasional`
