---
title: "Tech Stack Desktop"
description: Teknologi yang digunakan dalam membangun aplikasi desktop.
sidebar:
  order: 2
---

Aplikasi desktop ini menggunakan pendekatan modern: **menulis UI menggunakan web technology** (HTML/CSS/C#) lalu membungkusnya dalam jendela native. Ini mirip konsep Electron, tapi jauh lebih ringan.

## 1. Photino (Desktop Wrapper)

**Photino** adalah framework ringan untuk membuat aplikasi desktop menggunakan teknologi web. Berbeda dengan **Electron** yang membawa seluruh browser Chromium (~200 MB), Photino menggunakan **webview bawaan OS** (WebKitGTK di Linux, WebView2 di Windows).

*   **Referensi**: [Photino Official](https://www.tryphotino.io/)
*   **Keunggulan**: Ukuran aplikasi sangat kecil (~10 MB vs ~200 MB Electron).
*   **Versi**: Photino.Blazor `4.0.13`, Photino.Native `4.0.22`

## 2. Blazor (UI Framework)

**Blazor** adalah framework UI dari Microsoft yang memungkinkan kita menulis logika frontend menggunakan **C#** (bukan JavaScript). Komponen UI ditulis dalam file `.razor` yang menggabungkan HTML dan C#.

*   **Referensi**: [Blazor Documentation](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor)
*   **Keunggulan**: Type-safe, hot reload, komponen reusable.
*   **Pattern**: MVVM (Model-View-ViewModel) via Dependency Injection.

## 3. .NET 10 (Runtime)

Aplikasi ini berjalan di atas **.NET 10** (versi terbaru) yang memberikan performa tinggi dan kompatibilitas lintas platform (Windows, Linux, macOS).

*   **Referensi**: [.NET Download](https://dotnet.microsoft.com/download)

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

## Perbandingan dengan Alternatif

| Fitur | Photino.Blazor | Electron | Tauri |
|-------|:-----------:|:--------:|:-----:|
| **Ukuran App** | ~10 MB | ~200 MB | ~5 MB |
| **Bahasa UI** | C# + HTML | JS + HTML | Rust + HTML |
| **Memory Usage** | Rendah | Tinggi | Sangat Rendah |
| **Learning Curve** | Mudah (jika sudah kenal .NET) | Mudah | Sedang |
| **Cross-Platform** | ✅ | ✅ | ✅ |
