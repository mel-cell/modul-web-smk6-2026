---
title: "Kalender Akademik"
description: Panduan mengelola data kalender akademik sekolah.
sidebar:
  order: 6
---

Koleksi **Kalender Akademik** memungkinkan Anda mengelola jadwal kegiatan tahunan sekolah secara digital. Data ini akan ditampilkan di halaman publik website sehingga siswa, orang tua, dan guru dapat mengakses informasi jadwal kapan saja.

## Cara Mengakses

Dari sidebar Admin Panel, navigasikan ke:
**Data Sekolah → Kalender Akademik**

## Membuat Kalender Baru

### Langkah-Langkah:

1.  **Klik "Create New"** di pojok kanan atas.
2.  **Isi Tahun Ajaran**: Tentukan periode tahun ajaran (contoh: `2025/2026`).
3.  **Upload Kalender (Penting)**: Unggah file gambar kalender akademik asli (format `.webp`, `.jpg`, atau `.png`) pada field **"Dokumen Gambar Kalender"**.
4.  **Klik Save Draft**: Sebelum melakukan ekstraksi AI, simpan data sebagai draft terlebih dahulu.
5.  **Ekstrasi Data Otomatis**: Gunakan tombol **"Ekstrak Data AI"** untuk mengisi daftar kegiatan secara otomatis dari gambar.

## Fitur Ekstraksi AI (Canggih)

Sistem ini dilengkapi dengan Kecerdasan Buatan (AI) yang mampu membaca teks langsung dari gambar kalender Anda secara otomatis.

### Cara Penggunaan:
1.  Pastikan gambar kalender sudah terunggah dan dokumen sudah di-save.
2.  Klik tombol **"Ekstrak Data AI"** di area sidebar/pengaturan.
3.  Pilih **Mode Ekstraksi**:
    *   **Satu Halaman Penuh**: Untuk memproses seluruh bulan yang ada di gambar.
    *   **Surat Edaran**: Untuk mengambil kegiatan spesifik dari surat resmi sekolah.
4.  Tunggu proses selesai. AI akan mendeteksi nama bulan, tanggal kegiatan, dan deskripsinya.

### Teknologi Smart Upsert (Data Tak Pernah Hilang)
Anda tidak perlu khawatir data lama akan tertimpa. Sistem menggunakan logika **Smart Upsert**:
- Jika bulan yang baru di-scan sudah ada di database, sistem hanya akan meng-update atau menambahkan kegiatan baru di bulan tersebut.
- Data di bulan lain (misal semester depan) **tidak akan dihapus** meskipun gambar yang baru di-scan hanya berisi satu bulan saja.

:::tip[Tips Akurasi AI]
- Gunakan gambar dengan resolusi tinggi dan pencahayaan yang jelas.
- Sistem secara cerdas mendukung berbagai variasi ejaan bulan (seperti **Nopember** vs **November** atau **Pebruari** vs **Februari**).
- Jika ada kesalahan pembacaan, Anda tetap bisa mengedit hasil ekstraksi secara manual di bagian **Data Bulan**.
:::

## Menampilkan di Halaman Publik

Kalender Akademik akan otomatis muncul di halaman website melalui blok **AcademicCalendarArchive**. Admin Halaman dapat menambahkan blok ini ke halaman mana pun melalui pengaturan **Pages**.

:::tip[Kapan Harus Update?]
Lakukan pembaruan data kalender **setiap awal semester** atau ketika ada perubahan jadwal mendadak dari pihak sekolah. Selalu arsipkan kalender tahun sebelumnya (jangan dihapus) untuk keperluan audit.
:::

## Tips Pengelolaan

-   **Pemisahan Tahun Ajaran**: Buat dokumen terpisah untuk setiap tahun ajaran baru (misal `2026/2027`). Website akan otomatis membuatkan folder arsipnya.
-   **Kategori Kegiatan**: Saat mengedit kegiatan, pastikan memilih kategori yang tepat (Libur, Ujian, Kegiatan, dll) karena akan berpengaruh pada warna tampilan di website publik.
-   **Verifikasi Manual**: Selalu lakukan cek ulang singkat pada hasil ekstraksi AI sebelum mengubah status dokumen menjadi **Published**.
