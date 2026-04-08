---
title: "Cara Upload Gambar 360°"
description: Panduan langkah demi langkah untuk mengunggah foto panorama 360 derajat.
sidebar:
  order: 2
---

Sebelum bisa membuat tur virtual, Anda harus terlebih dahulu mengunggah foto panorama 360° ke dalam sistem. Foto-foto ini akan disimpan di koleksi **Koleksi Media 360**.

## Persyaratan Foto 360°

Agar hasilnya optimal, perhatikan spesifikasi berikut:

| Parameter | Rekomendasi | Minimum |
|-----------|-------------|---------|
| **Resolusi** | 8192 × 4096 px | 4096 × 2048 px |
| **Aspek Rasio** | 2:1 (equirectangular) | 2:1 |
| **Format** | `.jpg` atau `.webp` | `.jpg` |
| **Ukuran File** | < 5 MB (sudah dikompresi) | < 10 MB |

:::caution[Format AVIF Tidak Didukung]
Sistem akan otomatis mengkonversi gambar ke format **WebP** untuk efisiensi. Hindari mengunggah file `.avif` karena tidak kompatibel dengan semua browser.
:::

## Langkah-Langkah Upload

### 1. Buka Menu Koleksi Media 360
Dari sidebar Admin Panel, navigasikan ke:
**Smart Tour → Koleksi Media 360**

### 2. Klik "Create New"
Tombol biru di pojok kanan atas halaman daftar.

### 3. Upload File Gambar
-   Klik area upload atau **drag & drop** file dari komputer Anda.
-   Tunggu hingga proses upload selesai (progress bar akan muncul).
-   Untuk foto beresolusi tinggi (>5 MB), proses ini mungkin memakan waktu **30-60 detik**.

### 4. Isi Informasi
-   **Alt Text** (Wajib): Deskripsi singkat gambar. Contoh: `Panorama Laboratorium RPL dari pintu masuk`.
    > Alt text penting untuk aksesibilitas dan SEO.

### 5. Klik "Save"
Setelah disimpan, sistem akan secara otomatis membuat beberapa versi gambar:

| Versi | Resolusi | Kegunaan |
|-------|----------|----------|
| **Original** | Ukuran asli | Cadangan/arsip |
| **highRes** | 4096 px lebar | Tampilan utama viewer |
| **lowRes** | 1024 px lebar | Loading cepat (placeholder) |
| **Thumbnail** | 400 × 200 px | Preview di Admin Panel |

:::note[Progressive Loading]
Sistem kami menggunakan teknik **Progressive Loading**: viewer akan menampilkan versi `lowRes` terlebih dahulu agar pengunjung bisa langsung berinteraksi, lalu secara diam-diam mengganti ke versi `highRes` di latar belakang. Ini membuat pengalaman terasa instan meskipun di jaringan lambat.
:::

## Penyimpanan File

File yang diunggah akan disimpan di server pada lokasi:
```
/app/public/tour/
```

Lokasi ini menggunakan **Persistent Volume** (penyimpanan permanen), sehingga file **tidak akan hilang** meskipun server di-restart atau sistem di-update.

:::warning[Jangan Hapus dari Server Langsung]
Jika Anda ingin menghapus gambar, **selalu lakukan dari Admin Panel** (bukan langsung dari file manager server). Menghapus langsung dari server akan menyebabkan database masih menyimpan referensi ke file yang sudah tidak ada, mengakibatkan error "Gambar tidak ditemukan".
:::

## Troubleshooting

### Upload Gagal atau Timeout (Error 502)
-   **Penyebab**: File terlalu besar atau server kehabisan memori.
-   **Solusi**: Kompres gambar terlebih dahulu menggunakan tool online seperti [Squoosh](https://squoosh.app/) hingga ukurannya di bawah 5 MB.

### Gambar Tidak Muncul Setelah Upload
-   **Penyebab**: Cache browser.
-   **Solusi**: Lakukan hard refresh (`Ctrl + Shift + R`) pada browser Anda.
