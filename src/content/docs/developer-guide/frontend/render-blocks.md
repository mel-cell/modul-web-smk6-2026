---
title: The RenderBlocks Engine
description: Memahami jembatan antara Payload CMS dan UI Component.
sidebar:
  order: 1
---

`RenderBlocks.tsx` adalah file paling krusial di sisi Frontend. File ini bertindak sebagai "Traffic Controller" yang menentukan komponen mana yang harus muncul berdasarkan data dari CMS.

## 1. Bagaimana Cara Kerjanya?

Saat Anda menarik data halaman dari API Payload, Anda akan mendapatkan array objek bernama `layout`. Setiap objek punya `blockType`.

`RenderBlocks` akan melakukan looping pada array tersebut:
*   Jika `blockType` adalah `content`, maka panggil `ContentBlock.tsx`.
*   Jika `blockType` adalah `mediaBlock`, maka panggil `MediaBlock.tsx`.

## 2. Struktur Kode Utama

```tsx
const blockComponents = {
  content: ContentBlock,
  mediaBlock: MediaBlock,
  // ... daftar semua blok lainnya
}

export const RenderBlocks: React.FC<Props> = ({ blocks }) => {
  return (
    <Fragment>
      {blocks.map((block, index) => {
        const Block = blockComponents[block.blockType]
        if (Block) return <Block key={index} {...block} />
        return null
      })}
    </Fragment>
  )
}
```

## 3. Dinamis vs Statis

Beberapa blok besar seperti `CustomGrid` atau `Layout` dimuat secara dinamis menggunakan `next/dynamic`.

:::tip[Penting]
Pemuatan dinamis ini memastikan bahwa komponen berat hanya diunduh oleh browser saat dibutuhkan, dan juga mencegah tabrakan inisialisasi modul (Circular Dependency).
:::
