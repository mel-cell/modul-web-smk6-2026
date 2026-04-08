---
title: "Arsitektur Smart Tour (360° Virtual Tour)"
description: Panduan teknis arsitektur dan implementasi fitur Smart Tour.
sidebar:
  order: 5
---

Smart Tour adalah modul tur virtual 360° yang dibangun menggunakan **Photo Sphere Viewer** dan terintegrasi sepenuhnya dengan Payload CMS. Halaman ini menjelaskan arsitektur teknis, keputusan desain, dan gotchas yang perlu diketahui developer.

## Stack Teknologi

| Komponen | Teknologi | File Utama |
|----------|-----------|------------|
| **Viewer** | [@photo-sphere-viewer/core](https://photo-sphere-viewer.js.org/) v5 | `src/components/SmartTour/TourViewer.tsx` |
| **Markers** | @photo-sphere-viewer/markers-plugin | `TourViewer.tsx` (inline) |
| **CMS Schema** | Payload CMS Collection | `src/collections/SmartTour/SmartTour.ts` |
| **Media Upload** | Payload Upload Collection | `src/collections/SmartTour/TourMedia.ts` |
| **Route** | Next.js App Router | `src/app/(tour)/smart-tour/[tourSlug]/page.tsx` |

## 1. Arsitektur Data (Schema)

### Koleksi `SmartTour`
Koleksi utama yang menyimpan seluruh data tur.

```
SmartTour
├── title (text)
├── slug (text, unique, auto-generated)
├── hero
│   ├── heroImage (upload → media)
│   └── description (richText)
├── rooms[] (array)
│   ├── roomName (text)
│   ├── roomSlug (text, auto-generated)
│   ├── description (richText)
│   ├── panoramaImage (relationship → tour-media)
│   └── hotspots[] (array)
│       ├── label (text)
│       ├── yaw (number, 0-360)
│       ├── pitch (number, -90 to 90)
│       └── iconScale (number, 0.5-2)
├── settings
│   ├── defaultRoom (select from rooms)
│   └── autoRotate (checkbox)
└── seo (meta fields)
```

### Koleksi `TourMedia`
Upload collection khusus untuk gambar 360°.

```
TourMedia
├── file (upload)
├── alt (text)
└── imageSizes
    ├── thumbnail (400×200, webp)
    ├── lowRes (1024px lebar, webp)
    └── highRes (4096px lebar, webp)
```

:::warning[Penting: staticDir Path]
Gunakan `path.resolve(process.cwd(), 'public/tour')` untuk `staticDir`, **BUKAN** `path.resolve(dirname, '../../public/tour')`.

Path relatif dari `dirname` akan mengarah ke lokasi salah di production (folder internal `.next/server/`) karena Next.js standalone build mengubah struktur folder saat bundling.
:::

## 2. Route Groups & Layout Terpisah

Smart Tour menggunakan **Route Group terpisah** dari frontend utama:

```
src/app/
├── (frontend)/     ← Website utama (dengan Header & Footer)
│   ├── layout.tsx
│   └── ...
└── (tour)/         ← Smart Tour (tanpa Header & Footer)
    ├── layout.tsx  ← Layout minimal, hanya body
    └── smart-tour/
        └── [tourSlug]/
            └── page.tsx
```

**Mengapa terpisah?** Karena viewer 360° membutuhkan **layar penuh** (full viewport). Jika menggunakan layout utama, Header dan Footer akan mengganggu tampilan panorama.

## 3. Progressive Loading Strategy

Viewer menggunakan strategi **dua tahap** untuk optimasi performa:

```
Tahap 1: Load lowRes (1024px, ~200KB)
    → Tampilkan langsung, user bisa scroll/zoom
    
Tahap 2: Load highRes (4096px, ~2MB)
    → Background fetch, replace saat ready
    → User tidak perlu menunggu
```

Implementasi di `TourViewer.tsx`:
```typescript
// Stage 1: Load lowRes immediately
const viewer = new Viewer({
  panorama: room.panoramaImage.lowRes.url,
  // ...
})

// Stage 2: Upgrade to highRes silently
const highResUrl = room.panoramaImage.highRes?.url
if (highResUrl) {
  viewer.setPanorama(highResUrl, { showLoader: false })
}
```

## 4. Markers Plugin (Hotspot Navigation)

Markers menggunakan plugin resmi dari Photo Sphere Viewer:

```typescript
const markersPlugin = viewer.getPlugin(MarkersPlugin)

rooms.forEach(room => {
  room.hotspots?.forEach(hotspot => {
    markersPlugin.addMarker({
      id: `hotspot-${hotspot.id}`,
      position: { yaw: `${hotspot.yaw}deg`, pitch: `${hotspot.pitch}deg` },
      html: `<div class="hotspot-label">${hotspot.label}</div>`,
      scale: [hotspot.iconScale, hotspot.iconScale],
    })
  })
})
```

:::danger[Scoping Bug - Wajib Dibaca!]
Variable `markersPlugin` **HARUS** didefinisikan di dalam scope yang sama dengan event listener-nya. Jangan pindahkan deklarasi `markersPlugin` ke luar blok `useEffect` atau ke state React, karena akan menyebabkan `ReferenceError: markersPlugin is not defined` di production (minified code).
:::

## 5. Error Handling

```typescript
// Event name untuk PSV v5 adalah 'panorama-error', BUKAN 'panorama-load-error'
viewer.addEventListener('panorama-error', (event) => {
  console.error('Gagal memuat panorama:', event)
  setErrorMessage('Panorama tidak dapat dimuat')
})
```

## 6. Docker & Persistence

File 360° disimpan menggunakan **Bind Mount** di Docker:

```yaml
# docker-compose.yml
volumes:
  - ./public/media:/app/public/media   # Media biasa
  - ./public/tour:/app/public/tour     # Foto 360°
```

Ini memastikan:
-   File tetap ada setelah container restart.
-   File muncul di filesystem host untuk backup.
-   Developer bisa melihat file langsung di IDE.

## 7. Gotchas & Known Issues

| Issue | Penyebab | Solusi |
|-------|----------|--------|
| `ReferenceError: markersPlugin` | Deklarasi di luar scope | Pindahkan ke dalam blok inisialisasi viewer |
| Foto upload masuk DB tapi file tidak ada | `staticDir` pakai `dirname` | Ganti ke `process.cwd()` |
| Event `panorama-load-error` tidak pernah terpicu | Nama event salah di PSV v5 | Gunakan `panorama-error` |
| Upload 502 Bad Gateway | Container OOM saat resize | Naikkan memory limit ke 1536MB |
| File hilang setelah rebuild | Named Volume tertimpa | Gunakan Bind Mount |
