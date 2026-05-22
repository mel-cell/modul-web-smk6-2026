---
title: Halaman Berita
description: Tampilan halaman daftar berita sekolah
---

# Halaman Berita

Halaman berita menampilkan daftar lengkap berita dan informasi terkini dari sekolah dengan fitur pencarian dan filter.

## Tampilan Halaman

![Tampilan Halaman Berita](/modul-web-smk6-2026/img/tampilan-web/berita.png)

## Fitur-Fitur Utama

### 1. Daftar Berita
- Grid atau list view untuk tampilan berita
- Thumbnail gambar berita
- Judul, ringkasan, dan tanggal publikasi
- Link ke halaman detail berita

### 2. Search Bar
- Input pencarian berita berdasarkan keyword
- Fitur live search
- Dropdown saran pencarian

### 3. Filter Kategori
- Filter berdasarkan kategori berita
- Multiple selection filter
- Badge untuk kategori aktif

### 4. Pagination
- Navigasi halaman berita
- Tampilan jumlah berita per halaman
- Previous/Next button

### 5. Sorting
- Urutkan berdasarkan tanggal (Terbaru/Terlama)
- Urutkan berdasarkan populer

## URL Search Params

Halaman mendukung search parameters untuk membagikan filter:
- `?search=keyword` - Filter berdasarkan keyword
- `?category=nama-kategori` - Filter berdasarkan kategori
- `?page=2` - Halaman tertentu
- `?sort=newest` - Sorting

Contoh: `/berita?search=lomba&category=prestasi&sort=newest`
