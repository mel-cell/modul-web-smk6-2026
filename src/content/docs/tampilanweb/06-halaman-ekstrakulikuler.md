---
title: Halaman Ekstrakulikuler
description: Tampilan halaman daftar kegiatan ekstrakulikuler
---

# Halaman Ekstrakulikuler

Halaman ekstrakulikuler menampilkan daftar lengkap organisasi dan kegiatan ekstrakurikuler yang tersedia di sekolah.

## Tampilan Halaman

![Tampilan Halaman Ekstrakulikuler](/modul-web-smk6-2026/img/tampilan-web/ekstra.png)

## Fitur-Fitur Utama

### 1. Daftar Ekstrakulikuler
- Card untuk setiap organisasi/kegiatan
- Logo atau ikon ekstrakulikuler
- Nama dan deskripsi singkat
- Link ke halaman detail

### 2. Kategori Ekstrakulikuler
- Filter berdasarkan jenis (Olahraga, Seni, IPTEK, dll)
- Kategori dengan icon yang berbeda
- Multiple selection filter

### 3. Search Functionality
- Pencarian berdasarkan nama ekstra
- Live search dengan hasil real-time
- Saran pencarian

### 4. Informasi Card
- Nama ekstrakulikuler
- Pembina/pelatih
- Jadwal pertemuan
- Jumlah anggota
- Call-to-action button

### 5. Pagination
- Navigasi halaman ekstrakurikuler
- Pilihan jumlah item per halaman

## URL Search Params

Mendukung sharing filter melalui URL:
- `?category=olahraga` - Filter berdasarkan kategori
- `?search=basket` - Pencarian
- `?page=2` - Halaman tertentu

Contoh: `/ekstrakulikuler?category=olahraga&search=basket`
