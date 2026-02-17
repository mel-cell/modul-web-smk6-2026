---
title: Next.js Patterns
description: Server Components, Client Components, dan Optimization.
sidebar:
  order: 3
---

Project SMK6 menggunakan **App Router** Next.js yang membagi komponen menjadi dua dunia: **Server** dan **Client**.

## 1. Server Components (Default)
Hampir semua blok di project ini adalah Server Components.
*   **Kapan dipakai?** Untuk mengambil data dari database, render HTML statis, dan menjaga keamanan kunci API.
*   **Kenapa?** Karena jauh lebih cepat karena tidak mengirim kode JavaScript ke browser user.

## 2. Client Components (`'use client'`)
Gunakan instruksi `'use client'` di baris paling atas file hanya jika:
*   Anda butuh interactivity (`useState`, `useEffect`).
*   Anda butuh *event listeners* (Klik tombol yang memicu animasi).
*   Anda menggunakan library animasi seperti Framer Motion atau GSAP.

## 3. Optimasi Gambar
Selalu gunakan komponen `<Image />` dari `next/image`. 
*   **Penting**: Pastikan Anda sudah mendaftarkan domain gambar di `next.config.js` (remotePatterns) agar gambar dari CMS bisa muncul.

## 4. Penanganan Error (Circular Safety)

:::caution[Solusi Fatal Error]
Jika aplikasi macet saat dijalankan di mode Production dengan pesan `ReferenceError`, periksa apakah ada komponen yang mengimpor komponen induknya. 

**Gunakan Dynamic Import:**
```tsx
const ComplexComponent = dynamic(() => 
  import('./ComplexComponent').then(m => m.ComplexComponent)
)
```
Ini akan memutus mata rantai impor yang tak berujung dan menyelamatkan build Production Anda.
:::
