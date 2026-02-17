---
title: Membuat Blok Baru
description: Panduan langkah demi langkah menambahkan fitur UI baru.
sidebar:
  order: 2
---

Menambah fitur baru di website SMK6 (seperti Banner Promo atau List FAQ) mengikuti alur kerja 3 langkah yang ketat.

## Langkah 1: Tentukan Skema (CMS)
Buat file `config.ts` di dalam folder blok baru Anda di `src/blocks`.
*   Tentukan `slug` (misal: `faqBlock`).
*   Tentukan field apa saja yang dibutuhkan (Judul, Deskripsi, Array Pertanyaan).

## Langkah 2: Buat Komponen UI (React)
Buat file `Component.tsx` di folder yang sama.
*   Gunakan Tailwind CSS untuk styling.
*   Pastikan komponen menerima `props` sesuai dengan field yang Anda buat di Langkah 1.

## Langkah 3: Registrasi di RenderBlocks
Buka `src/blocks/RenderBlocks.tsx` dan tambahkan blok baru Anda ke dalam objek `blockComponents`.

```tsx
import { MyNewBlock } from '@/blocks/MyNewBlock/Component'

const blockComponents = {
  // ...
  myNewBlock: MyNewBlock,
}
```

:::danger[Catatan Kritis]
Jika blok baru Anda mengandung list yang di dalamnya bisa memasukkan blok lain lagi (seperti `CustomGrid`), Anda **WAJIB** menggunakan `next/dynamic` untuk mengimpornya guna mencegah error *Circular Dependency*.
:::

## Standar Styling
*   Gunakan library `cn()` untuk penggabungan class Tailwind.
*   Prioritaskan penggunaan komponen dari `src/components/ui` (Shadcn UI) untuk menjaga konsistensi desain.
