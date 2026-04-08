---
title: "Apa itu News Desktop?"
description: Pengenalan aplikasi News SMKN 6 Malang versi Desktop.
sidebar:
 order: 1
---

**News SMKN 6 Malang Desktop** adalah aplikasi berita desktop native yang menampilkan berita dan informasi sekolah langsung dari komputer pengguna, tanpa memerlukan browser. Aplikasi ini terhubung langsung dengan website utama SMKN 6 Malang melalui API.

## Mengapa Versi Desktop?

| Aspek | Website | Desktop App |
|-------|---------|-------------|
| **Akses** | Buka browser → ketik URL | Klik ikon di desktop |
| **Kecepatan** | Bergantung pada tab browser | Jendela khusus, lebih ringan |
| **Notifikasi** | Harus buka website | Indikator lonceng di header |
| **Admin Panel** | Buka tab baru | Terintegrasi (popup modal) |
| **Offline** | Tidak bisa | Cache data terakhir |

## Fitur Utama

### Real-time News Feed
Menampilkan daftar berita terbaru secara dinamis yang diambil langsung dari **Payload CMS** (backend website utama).

### Integrated Admin Panel
Kelola berita (CRUD) secara instan melalui Admin Panel Payload CMS yang tertanam dalam aplikasi menggunakan **Iframe Modal**. Cukup klik tombol profil di header.

### Pencarian Cerdas
Temukan berita dengan cepat melalui kolom pencarian di header. Tekan **Enter** untuk melihat hasil.

### Kategori Dinamis
Menu samping (sidebar) menampilkan kategori berita secara otomatis beserta **jumlah artikel** di setiap kategorinya.

### Sistem Notifikasi
Indikator lonceng cerdas yang memberitahu pengguna jika ada berita baru yang dirilis dalam **3 hari terakhir**. Titik merah akan berkedip sebagai notifikasi.

### UI/UX Modern
Desain antarmuka yang bersih dan modern menggunakan **Tailwind CSS** dengan layout sidebar, header, dan area konten.

## Hubungan dengan Website Utama

Aplikasi desktop ini **bukan aplikasi mandiri** — ia adalah **klien** (pengguna) dari website utama SMKN 6 Malang. Semua data berita berasal dari API yang sama (`/api/news`).

```
┌──────────────────┐ REST API ┌──────────────────┐
│ Native App │ ◄──────────────────────── │ Website SMKN 6 │
│ (.NET Blazor) │ GET /api/news │ (Payload CMS) │
│ │ GET /api/news/{id} │ │
└──────────────────┘ └──────────────────┘
```

:::note[Data Tunggal]
Berita yang muncul di Desktop App adalah **berita yang sama** dengan yang ada di website. Admin cukup mengelola berita di satu tempat (Admin Panel), dan kedua platform akan langsung menampilkan data yang sama.
:::
