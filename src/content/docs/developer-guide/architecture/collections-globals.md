---
title: Collections & Globals
description: Memahami struktur penyimpanan data di Payload CMS.
sidebar:
  order: 1
---

Di Payload CMS, kita tidak menggunakan tabel database tradisional. Kita menggunakan **Collections** dan **Globals**.

## 1. Collections (Data Berulang)
Collection digunakan untuk data yang memiliki banyak entri. 
Contoh di project SMK6: 
*   **News**: Untuk menyimpan ratusan berita.
*   **Students**: Untuk menyimpan ribuan data siswa.
*   **Majors**: Untuk daftar jurusan yang ada.

Setiap Collection didefinisikan dalam satu file konfigurasi di folder `src/collections`.

## 2. Globals (Data Tunggal)
Global digunakan untuk data yang hanya ada satu di seluruh website.
Contoh:
*   **Header**: Menu navigasi atas.
*   **Footer**: Informasi di bagian bawah web.
*   **Site Settings**: Judul website dan logo.

## 3. Menambahkan Field Baru
Untuk menambah data (misalnya menambah "Tanggal Lulus" di Koleksi Siswa), Anda cukup menambah objek field di konfigurasi:

```typescript
{
  name: 'graduationDate',
  type: 'date',
  label: 'Tanggal Kelulusan',
}
```

:::tip[Tips Pro]
Selalu gunakan `admin.description` pada setiap field agar Admin (orang non-teknis) paham apa yang harus mereka isi di kotak tersebut.
:::

## 4. Relationship (Relasi Data)
Kita bisa menghubungkan antar data. Misalnya, menghubungkan **Siswa** dengan **Jurusan**. Gunakan type `relationship` untuk ini. Ini akan membuat database kita tetap rapi dan tidak ada data yang redundan.
