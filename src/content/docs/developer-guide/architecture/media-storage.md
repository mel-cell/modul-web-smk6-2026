---
title: "Media & Storage Management"
description: Mengelola aset gambar dan dokumen di lingkungan Docker.
sidebar:
 order: 4
---

Sistem ini menggunakan penyimpanan **lokal (Bind Mount)** untuk menyimpan file media yang diunggah. File akan disimpan langsung di folder server yang terhubung ke container Docker, sehingga file tetap **persisten** (tidak hilang) saat container di-restart.

:::note[Catatan Historis]
Dokumentasi versi sebelumnya merujuk pada penggunaan S3 (Simple Storage Service). Konfigurasi ini **tidak lagi aktif**. Saat ini semua file disimpan secara lokal di server.
:::

## 1. Arsitektur Penyimpanan

Sistem memiliki **dua direktori upload** yang terpisah:

| Direktori | Koleksi | Konten | Path di Server |
|-----------|---------|--------|----------------|
| `public/media/` | `Media` | Gambar berita, galeri, logo | `/app/public/media/` |
| `public/tour/` | `TourMedia` | Foto panorama 360° | `/app/public/tour/` |

### Konfigurasi di Docker Compose

```yaml
# docker-compose.yml
services:
 app:
 volumes:
 - ./public/media:/app/public/media # Bind Mount media
 - ./public/tour:/app/public/tour # Bind Mount tour 360
```

**Bind Mount** berarti folder di **host server** (`./public/media/`) langsung tersambung ke folder di **container Docker** (`/app/public/media/`). File yang diupload di Admin Panel akan langsung muncul di kedua lokasi.

## 2. Konfigurasi Static Directory

Saat mendefinisikan koleksi upload di Payload, gunakan **`process.cwd()`** untuk path absolut:

```typescript
// BENAR - Gunakan process.cwd()
upload: {
 staticDir: path.resolve(process.cwd(), 'public/media'),
}

// SALAH - Jangan gunakan dirname
upload: {
 staticDir: path.resolve(dirname, '../../public/media'),
}
```

:::danger[Mengapa dirname Berbahaya?]
Di mode Production, Next.js standalone build mengkompilasi file TypeScript ke folder `.next/server/`. Akibatnya, `dirname` akan menunjuk ke lokasi internal container yang **tidak bisa diakses publik**. File akan masuk ke database, tapi tidak ada file fisik yang bisa dilayani ke browser. Gunakan `process.cwd()` yang selalu menunjuk ke root `/app/`.
:::

## 3. Image Sizes (Auto-Generated)

### Koleksi Media (Gambar Umum)
Setiap gambar yang diupload akan otomatis dibuat dalam beberapa ukuran:

| Nama | Lebar | Tinggi | Format | Kualitas |
|------|-------|--------|--------|----------|
| thumbnail | 300px | auto | WebP | 80% |
| square | 500px | 500px | WebP | 80% |
| small | 600px | auto | WebP | 80% |
| medium | 900px | auto | WebP | 85% |
| large | 1400px | auto | WebP | 85% |
| xlarge | 1920px | auto | WebP | 85% |
| og | 1200px | 630px | WebP | 90% |

### Koleksi TourMedia (Gambar 360°)

| Nama | Lebar | Tinggi | Format | Kualitas |
|------|-------|--------|--------|----------|
| thumbnail | 400px | 200px | WebP | 60% |
| lowRes | 1024px | auto | WebP | 70% |
| highRes | 4096px | auto | WebP | 85% |

## 4. Menampilkan Gambar di Frontend

Karena file disimpan secara lokal di `public/`, Next.js dapat melayani file secara langsung:

```tsx
// Gambar bisa diakses langsung via URL
<img src="/media/nama-gambar.webp" alt="..." />
<img src="/tour/panorama-360.webp" alt="..." />

// Atau gunakan komponen Next.js Image
import Image from 'next/image'
<Image src={media.url} alt={media.alt} width={800} height={600} />
```

Jangan lupa daftarkan hostname di `next.config.js` jika menggunakan URL penuh:
```javascript
images: {
 remotePatterns: [
 {
 protocol: 'https',
 hostname: 'test.smkn6malang.sch.id',
 },
 ],
},
```

## 5. Tips Optimasi

- **Format**: Sistem otomatis mengkonversi ke **WebP**. Tidak perlu konversi manual sebelum upload.
- **Ukuran Maksimal**: Batas yang disarankan adalah **5 MB** per file untuk gambar biasa, dan **10 MB** untuk panorama 360°.
- **Kompresi Sebelum Upload**: Untuk foto dari kamera DSLR (biasanya 15-30 MB), kompres dulu menggunakan [Squoosh](https://squoosh.app/) atau [TinyPNG](https://tinypng.com/).
- **Memory Docker**: Pastikan memory limit container minimal **1536 MB** (`1.5 GB`) agar proses resize gambar beresolusi tinggi tidak gagal karena kehabisan memori (OOM).

:::warning[Masalah Upload 502]
Jika Anda mengalami error **502 Bad Gateway** saat mengupload gambar berukuran besar, kemungkinan besar container kehabisan memori. Periksa memory limit di `docker-compose.yml`:
```yaml
deploy:
 resources:
 limits:
 memory: 1536m # Minimal untuk proses resize gambar 360°
```
:::
