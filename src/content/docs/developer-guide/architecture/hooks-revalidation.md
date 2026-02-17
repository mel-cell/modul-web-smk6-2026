---
title: "Hooks & Revalidation (Sistem Otomatis)"
description: Memahami siklus hidup data dan sinkronisasi cache.
sidebar:
  order: 3
---

Hooks adalah "pemicu" (triggers) yang membuat sistem kita terlihat pintar dan otomatis.
*   **Referensi**: [Payload Hooks Documentation](https://payloadcms.com/docs/hooks/overview)

## 1. Alur Kerja (Lifecycle) Data

Developer harus paham urutan eksekusi berikut saat data disimpan:
1.  **`beforeValidate`**: Bersihkan data (hapus spasi berlebih, format huruf besar).
2.  **`beforeChange`**: Manipulasi logika (hitung nilai rata-rata, buat password hash).
3.  **`afterChange`**: Efek samping (Kirim email notifikasi, hapus cache website).

## 2. Implementasi Revalidation mendalam

Kita menggunakan sistem **On-Demand Revalidation**. Website tidak akan di-update setiap menit, TAPI hanya saat admin menekan tombol "Save" di CMS.

### Contoh Kasus di SMK6:
Saat berita berjudul "Lomba Voli" diubah:
1.  Hook `afterChange` menangkap aksi tersebut.
2.  Menjalankan fungsi `revalidatePath('/berita/lomba-voli')`.
3.  Menjalankan fungsi `revalidateTag('news-list')`.
4.  User yang mengakses detik berikutnya akan melihat versi terbaru, sedangkan user lama tetap melihat cache lama (Hemat bandwidth!).

## 3. Populate Hooks (Manajemen Relasi)

Terkadang kita tidak ingin menyimpan seluruh objek data di database (berat). Kita hanya simpan ID-nya saja.
Saat data dibaca (`afterRead`), kita gunakan hook untuk "menarik" data aslinya.
*   **Contoh**: Di koleksi Berita kita hanya simpan `author: "ID_USER"`. Saat dibaca, hook `populateAuthors` akan mengubahnya jadi `{ name: "Pak Jono", role: "Editor" }`.

:::danger[Hati-Hati dengan Loop]
Jangan pernah memanggil fungsi `update` koleksi A di dalam hook `afterChange` koleksi A sendiri tanpa pengecekan. Hasilnya? **Infinite Loop** yang akan membuat RAM server Anda meledak dalam hitungan detik.
:::
