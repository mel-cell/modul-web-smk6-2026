---
title: Hooks & Revalidation
description: Bagaimana data berubah secara otomatis dan terupdate di website.
sidebar:
  order: 2
---

**Hooks** adalah fungsi otomatis yang berjalan saat terjadi aksi tertentu pada data (seperti Simpan, Hapus, atau Baca).

## 1. Jenis Hooks yang Sering Digunakan

*   **`beforeChange`**: Digunakan untuk memanipulasi data *sebelum* disimpan ke database (misal: otomatis membuat slug dari judul).
*   **`afterChange`**: Digunakan untuk aksi *setelah* data berhasil disimpan. Kita paling banyak menggunakannya untuk **Revalidation**.

## 2. Sistem Revalidation (Next.js Cache)

Karena website kita sangat cepat, Next.js menyimpan "foto" (cache) dari halaman web. Masalahnya, saat Admin mengubah berita di CMS, website tidak akan berubah jika cache-nya tidak dihapus.

Di situlah gunanya Hook `revalidatePost`:

```typescript
// Contoh logika sederhana
export const revalidatePost = ({ doc }) => {
  revalidatePath(`/berita/${doc.slug}`)
  return doc
}
```

:::caution[Catatan Kritis]
Pastikan fungsi revalidate selalu dibungkus dalam blok `try...catch` agar jika terjadi error saat membersihkan cache, CMS tidak ikut macet (data tetap tersimpan di database).
:::

## 3. Otomatisasi Relasi
Kita juga menggunakan hooks untuk menghapus data terkait. Misalnya, saat data **Siswa** dihapus, kita punya hook untuk otomatis menghapus akun **User** yang terhubung dengannya agar tidak ada "sampah" data di database.
