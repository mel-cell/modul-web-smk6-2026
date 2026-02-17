---
title: Collections & Globals (Arsitektur Database)
description: Panduan mendalam membangun skema data, validasi, dan relasi.
sidebar:
  order: 2
---

Membangun database di project ini dilakukan secara **declarative**. Artinya, Anda menulis apa yang Anda inginkan, dan sistem akan mengurus teknis tabelnya.

## 1. Field-Field Tingkat Lanjut (Advanced Fields)

Jangan hanya menggunakan teks biasa. Gunakan tipe data yang tepat untuk pengalaman Admin yang lebih baik.
*   **Referensi**: [Payload Fields Documentation](https://payloadcms.com/docs/fields/overview)

### **Array Fields**
Gunakan saat satu data punya banyak sub-data (Contoh: "Daftar Keahlian Siswa").
```typescript
{
  name: 'skills',
  type: 'array',
  fields: [
    { name: 'skillName', type: 'text' },
    { name: 'level', type: 'select', options: ['Beginner', 'Expert'] }
  ]
}
```

### **Tabs Fields**
Penting untuk merapikan tampilan Admin Panel jika field sudah terlalu banyak (Contoh: di `Students` kita pakai tab "Biodata", "Akademik", dan "Akun").

### **Blocks Fields**
Satu-satunya field yang memungkinkan admin menyusun layout halaman secara bebas.

## 2. Validasi & Integritas Data

Pastikan data yang masuk benar sebelum disimpan ke database.
*   **`required: true`**: Field tidak boleh kosong.
*   **`unique: true`**: Data tidak boleh sama dengan data lain (Penting untuk NIS atau Email).
*   **`validate`**: Fungsi custom untuk mengecek pola tertentu (Misal: NIS harus 10 digit angka).

```typescript
validate: (val) => {
  if (val.length < 10) return 'NIS harus 10 digit!'
  return true
}
```

## 3. Global vs Registry

Kapan pakai Global?
*   Jika datanya **statis secara kuantitas** (cuma ada 1 footer, cuma ada 1 logo sekolah).
*   Jika datanya sering diakses oleh semua halaman (Menu Navigasi).

## 4. Keamanan di Level Field (Field-Level Access)

Anda bisa membatasi field tertentu agar tidak bisa diedit orang sembarangan, meskipun mereka bisa mengedit koleksi tersebut.
*   **Contoh**: Admin Jurusan bisa mengedit data Siswa, tapi tidak bisa mengedit field "Status Pembayaran" (Hanya Admin Keuangan yang bisa).

:::tip[Tips Pro]
Selalu tentukan `admin.defaultColumns` pada setiap koleksi agar Admin Panel tidak penuh sesak saat melihat daftar data. Pilih 3-4 kolom paling penting saja.
:::
