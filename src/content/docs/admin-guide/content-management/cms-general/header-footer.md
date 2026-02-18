---
title: "Master Guide: Navigasi & Identitas Global"
description: Panduan konfigurasi Menu Utama (Header) dan Informasi Kaki Web (Footer) pada seluruh ekosistem website.
sidebar:
  order: 4
---

Berbeda dengan Berita atau Jurusan yang memiliki banyak data, **Header** dan **Footer** adalah data **Global**. Artinya, hanya ada satu pengaturan yang berlaku untuk seluruh website secara *Real-time*.

## 1. Arsitektur Menu Utama (Header)

Header dikelola melalui Sidebar > **Globals** > **Header**. Ini adalah kontrol pusat untuk semua elemen navigasi di bagian atas layar.

:::tip[Visual Struktur Header]
![Pengaturan Link Header](../../../../../assets/admin-guide/content-management/header.png)
:::

### **A. Pengaturan Logo & Branding**
*   **Logo Utama**: Unggah logo SMKN 6 Malang dalam format `.png` transparan atau `.svg`. Disarankan menggunakan file berukuran kecil (di bawah 100KB) untuk performa loading.
*   **Sticky Logo**: Logo versi lain yang muncul saat pengunjung melakukan scroll ke bawah (opsional).

### **B. Navigasi Hirarkis (Menu)**
Sistem mendukung menu bertingkat (Nested Navigation):
1.  **Top Level Menu**: Menu utama yang langsung terlihat (misal: "Profil").
2.  **Sub-Menu (Dropdown)**: Anda bisa menambahkan banyak link di dalam satu Menu Utama (misal: Di dalam Profil ada "Visi Misi", "Sejarah", dll).
3.  **Link Type**: 
    *   **Internal**: Link ke halaman yang sudah dibuat di CMS. Pilih dari daftar koleksi `Pages`.
    *   **Custom**: Link ke website luar (misal: link ke portal PPDB, E-Learning, atau Jurnal Sekolah). Gunakan URL lengkap (awali dengan `https://`).

## 2. Arsitektur Kaki Web (Footer)

Footer adalah bagian paling bawah website yang berfungsi sebagai pusat informasi kontak, media sosial, dan link legal/penting lainnya.

:::tip[Visual Info Footer]
![Pengaturan Isi Footer](../../../../../assets/admin-guide/content-management/footer.png)
:::

### **A. Kolom Informasi Sekolah**
*   **Alamat**: Masukkan alamat resmi sekolah secara lengkap. Pastikan pin point Google Maps sudah sesuai jika ada isian koordinat.
*   **Kontak**: Masukkan nomor telepon dan email resmi yang aktif dipantau oleh admin sekolah.
*   **Sosial Media**: Masukkan link lengkap ke akun Instagram, Facebook, dan YouTube sekolah. Masukkan URL profil, bukan hanya username.

### **B. Footer Links**
Mirip dengan Header, Anda bisa menentukan link cepat di bagian footer. Gunakan ini untuk link yang tidak praktis dimasukkan ke menu atas, seperti "Kebijakan Privasi" atau "Portal Alumni".

## 3. Mekanisme Sinkronisasi Data

Setiap kali Anda menekan **"Publish Changes"** pada data Global:
1.  **Cache Busting**: Sistem akan langsung mengirimkan sinyal ke server Next.js melalui webhook.
2.  **Inkremental Revalidation**: Header dan Footer di **seluruh halaman website** akan ter-update seketika (mungkin membutuhkan waktu 1-3 detik untuk proses perambatan cache).
3.  **Cross-Platform consistency**: Perubahan ini berlaku baik untuk tampilan Desktop maupun Mobile secara otomatis.

:::danger[Hati-Hati Menghapus Menu]
Jika Anda menghapus Menu Utama yang memiliki banyak Sub-menu, maka seluruh sub-menu di dalamnya akan ikut terhapus dari sistem. Selalau lakukan **Preview** navigasi sebelum melakukan penyimpanan permanen.
:::
