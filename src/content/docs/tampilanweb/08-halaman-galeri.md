---
title: Halaman Galeri
description: Tampilan halaman galeri foto dan video sekolah
---

# Halaman Galeri

Halaman galeri menampilkan koleksi foto dan video dokumentasi kegiatan sekolah dengan fitur filter dan lightbox.

## Tampilan Halaman

![Tampilan Halaman Galeri](/modul-web-smk6-2026/img/tampilan-web/galery.png)

## Fitur-Fitur Utama

### 1. Grid Galeri
- Tampilan grid responsive foto dan video
- Thumbnail dengan overlay informasi
- Icon play untuk video
- Hover effect

### 2. Filter Kategori
- Filter berdasarkan kategori kegiatan
- Filter berdasarkan periode/tahun
- Multiple selection filter
- Tag cloud untuk kategori

### 3. Search Functionality
- Pencarian berdasarkan deskripsi
- Pencarian berdasarkan tanggal
- Live search

### 4. Lightbox/Modal
- Tampilan full-screen untuk foto
- Navigation antar foto
- Informasi foto (judul, tanggal, deskripsi)
- Share button

### 5. Video Support
- Embedded video player
- Play button pada thumbnail
- Resolution options

### 6. Pagination
- Loading lebih banyak galeri
- Infinite scroll atau button "Load More"
- Total count galeri

## URL Search Params

Mendukung sharing filter:
- `?category=prestasi` - Filter kategori
- `?year=2024` - Filter tahun
- `?page=2` - Halaman tertentu

Contoh: `/galeri?category=prestasi&year=2024`

## Responsivitas

- Mobile: 1-2 kolom
- Tablet: 2-3 kolom
- Desktop: 3-4 kolom
