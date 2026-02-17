---
title: "Next.js Patterns & SEO"
description: Server Components, Client Components, dan Optimasi Mesin Pencari.
sidebar:
  order: 3
---

Project SMK6 bukan sekadar cepat, tapi juga harus "terlihat" oleh mesin pencari seperti Google.

## 1. Dynamic Metadata (SEO)

Setiap halaman dinamis (Berita, Jurusan) wajib memiliki metadata yang unik. Kita menggunakan fungsi `generateMetadata` milik Next.js.
*   **Referensi**: [Next.js Metadata API](https://nextjs.org/docs/app/building-your-application/optimizing/metadata)
*   **Belajar Konsep**: [Server vs Client Components](https://nextjs.org/docs/app/building-your-application/rendering/server-components)

```tsx
// src/app/(frontend)/[slug]/page.tsx
export async function generateMetadata({ params }) {
  const { slug } = params
  const post = await getNewsBySlug(slug)

  return {
    title: `${post.title} | SMK Negeri 6 Malang`,
    description: post.excerpt,
    openGraph: {
      images: [post.metaImage.url],
    },
  }
}
```

## 2. Server vs Client: Strategi Penggunaan

| Kasus Penggunaan | Jenis Komponen | Alasan |
| :--- | :--- | :--- |
| **Fetch Data Berita** | Server | Keamanan & Kecepatan. |
| **Formulir Kontak** | Client | Butuh interaksi user. |
| **Slider / Carousel** | Client | Butuh library JavaScript browser. |
| **Render Content** | Server | Ringkas & SEO Friendly. |

## 3. Optimization Teknik

*   **Caching**: Kita menggunakan `fetch` Next.js yang terintegrasi dengan Payload CMS. Gunakan `tags` untuk memudahkan revalidasi spesifik.
*   **Font Optimization**: Menggunakan `next/font/google` untuk memuat font sekolah (misal: Inter atau Roboto) tanpa memperlambat LCP (Largest Contentful Paint).

## 4. Penanganan Circular Dependency (Deep Fix)

:::danger[Kasus Nyata]
Jika muncul `ReferenceError: i is not defined` di Production, segera cek `RenderBlocks.tsx`. Pastikan komponen yang bersifat rekursif diimpor secara dinamis:

```tsx
const RecursiveComponent = dynamic(() => 
  import('@/blocks/Recursive/Component').then(m => m.RecursiveComponent)
)
```
Metode ini memutus rantai impor sirkular yang membingungkan Webpack.
:::
