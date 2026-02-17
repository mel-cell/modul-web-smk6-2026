---
title: Type-Safe Development
description: Bagaimana memanfaatkan hasil generate types untuk koding yang lebih cepat dan aman.
sidebar:
  order: 4
---

Salah satu kekuatan utama SMK6 Engine adalah integrasi tipe data antara Backend dan Frontend. Anda tidak perlu menebak-nebak nama kolom database.

## 1. Import Tipe Data

Setelah Anda menjalankan `pnpm generate:types`, file `@/payload-types` akan berisi semua interface yang Anda butuhkan.

```tsx
import type { News, Student } from '@/payload-types'

const NewsCard = ({ data }: { data: News }) => {
  return (
    <div>
      <h3>{data.title}</h3> {/* VS Code akan memberi auto-complete di sini */}
      <p>{data.excerpt}</p>
    </div>
  )
}
```

## 2. Manfaat untuk Developer

*   **Auto-complete**: Mengetik `data.` akan langsung memunculkan daftar field yang ada di CMS.
*   **Early Error Detection**: Jika Anda salah mengetik nama field (misal `titles` padahal di CMS namanya `title`), TypeScript akan memberikan garis merah sebelum Anda sempat menjalankan web-nya.
*   **Refactor Aman**: Jika Anda mengubah nama field di CMS dan melakukan generate ulang, TypeScript akan memberitahu Anda di mana saja file yang perlu diperbaiki.

## 3. Menangani Relasi di TypeScript

Jika field adalah relasi (misal: Berita punya Pengarang/Author), tipenya bisa berbentuk ID (string) atau Objek Lengkap.

```tsx
if (typeof data.author !== 'string') {
  console.log(data.author.name) // Aman karena kita sudah cek tipe data bukan string
}
```

:::tip[Tips Pro]
Selalu gunakan `import type` (dengan kata kunci `type`) agar file JavaScript hasil build nanti tetap kecil dan ringan.
:::
