---
title: "Tech Stack Desktop"
description: Teknologi yang digunakan dalam membangun aplikasi desktop.
sidebar:
 order: 2
---

Aplikasi desktop ini menggunakan pendekatan pengembangan native dengan **.NET 10** dan **Blazor**. Ini memastikan performa tinggi, ukuran aplikasi yang kecil, dan penggunaan memori yang sangat efisien dibandingkan teknologi lawas berbasis browser.

## 1. Native Desktop Engine

Engine desktop menggunakan pustaka native .NET yang memanfaatkan rendering OS bawaan langsung dari sistem host, sehingga aplikasi berjalan sangat ringan. Pendekatan ini memungkinkan interaksi langsung (native) tanpa overhead memori besar.

* **Keunggulan**: Ukuran aplikasi sangat kecil (~10 MB).
* **Performa**: Eksekusi cepat, native OS rendering.

## 2. Blazor (UI Framework)

**Blazor** adalah framework UI dari Microsoft yang memungkinkan kita menulis logika frontend menggunakan **C#** (bukan JavaScript). Komponen UI ditulis dalam file `.razor` yang menggabungkan HTML dan C#.

* **Referensi**: [Blazor Documentation](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor)
* **Keunggulan**: Type-safe, hot reload, komponen reusable.
* **Pattern**: MVVM (Model-View-ViewModel) via Dependency Injection.

## 3. .NET 10 (Runtime)

Aplikasi ini berjalan di atas **.NET 10** (versi terbaru) yang memberikan performa tinggi dan kompatibilitas lintas platform (Windows, Linux, macOS).

* **Referensi**: [.NET Download](https://dotnet.microsoft.com/download)

## 4. Tailwind CSS (Styling)

Styling aplikasi menggunakan framework CSS yang sama dengan website utama: **Tailwind CSS**. Ini memastikan konsistensi visual antara versi web dan desktop.

Tailwind dimuat melalui CDN di file `wwwroot/index.html`:
```html
<script src="https://cdn.tailwindcss.com"></script>
```

## 5. REST API (Koneksi ke Backend)

Aplikasi mengambil data berita menggunakan **HttpClient** (.NET) yang mengirim request ke REST API Payload CMS:

| Endpoint | Method | Fungsi |
|----------|--------|--------|
| `/api/news` | GET | Mengambil daftar berita |
| `/api/news/{id}` | GET | Mengambil detail berita |

Konfigurasi URL API ada di file `appsettings.json`:
```json
{
 "ApiSettings": {
 "BaseUrl": "https://test.smkn6malang.sch.id"
 }
}
```

## Perbandingan Arsitektur

| Fitur | Native .NET Blazor | Aplikasi Web Biasa |
|-------|:-----------:|:--------:|
| **Akses File Sistem** | Ya (Full Access) | Terbatas (Sandbox) |
| **Ukuran Memory** | Rendah (~30MB RAM) | Sedang - Tinggi |
| **Integrasi OS** | Sangat Baik (Native Win/Linux) | Sedang |
| **Penyimpanan Lokal**| Tidak Terbatas | Terbatas (Max ~50MB) |
| **Eksekusi Background**| Diizinkan Penuh | Dibatasi Browser |
