---
title: "The RenderBlocks Engine (Mapping Guide)"
description: Bedah mendalam alur data dari JSON Payload ke React Component.
sidebar:
  order: 1
---

`RenderBlocks.tsx` bukan sekadar penampil komponen, melainkan **Data Transformer**.

## 1. Alur Data (The Data Journey)

Bayangkan Anda memiliki halaman "Beranda". Di CMS, Anda memasukkan blok "Card Grid".
1.  **Request**: Next.js memanggil API Payload: `/api/pages?where[slug][equals]=home`.
2.  **Response**: Payload membalas dengan array JSON berisi properti blok (misal: `cards: [{ title: '...', icon: '...' }]`).
3.  **Mapping**: `RenderBlocks` menerima array ini dan mencari komponen yang cocok di objek `blockComponents`.
4.  **Rendering**: Komponen `CardGridBlockComponent` dipanggil, dan semua data JSON tadi dilempar sebagai `props`.

## 2. Kenapa Kita Menggunakan Objek Mapping?

Daripada menggunakan `switch-case` yang panjang, kita menggunakan objek mapping untuk kecepatan:

```tsx
const blockComponents = {
  content: ContentBlock,
  cardGrid: CardGridBlockComponent,
  //...
}
```
Metode ini memungkinkan kita menambahkan ribuan blok tanpa memperlambat performa rendering.

## 3. Penanganan Prop Khusus

Terkadang sebuah blok butuh data tambahan yang tidak ada di CMS, misalnya `customData` untuk halaman dinamis.
`RenderBlocks` mendukung penerusan props tambahan ini secara otomatis (`...block`).

## 4. Keuntungan Modularitas

Dengan sistem ini:
*   Komponen UI bisa dites secara terisolasi (Unit Testing).
*   Satu komponen bisa dipakai di banyak halaman dengan konfigurasi berbeda.
*   Pemisahan tanggung jawab: Developer UI fokus di `Component.tsx`, Developer Data fokus di `config.ts`.

:::warning[Hati-hati dengan Prop Drilling]
Jangan mengirimkan `props` terlalu dalam ke anak komponen di dalam blok. Jika butuh data global, pertimbangkan menggunakan React Context atau ambil langsung di tingkat komponen server.
:::
