---
title: "Arsitektur & Komponen"
description: Penjelasan teknis mendalam tentang struktur komponen dan pola desain.
sidebar:
  order: 2
---

Halaman ini menjelaskan arsitektur internal aplikasi desktop, pola desain yang digunakan, dan cara setiap komponen saling berinteraksi.

## Pola Arsitektur

Aplikasi ini menggunakan pola **Service-Based Architecture** dengan Blazor Dependency Injection:

```
[appsettings.json] → [IConfiguration] → [NewsService] → [Pages/Components]
```

### Dependency Injection (DI)
Semua service didaftarkan di `Program.cs`:
```csharp
appBuilder.Services.AddSingleton<IConfiguration>(config);
appBuilder.Services.AddHttpClient();
appBuilder.Services.AddSingleton<NewsService>();
```

Kemudian di-inject ke komponen Blazor menggunakan `@inject`:
```razor
@inject NewsService NewsService
@inject NavigationManager Navigation
```

## Komponen Utama

### 1. `MainLayout.razor` — Layout Utama
Ini adalah **komponen terbesar** (205 baris) yang mengatur seluruh tata letak aplikasi:

| Bagian | Fungsi |
|--------|--------|
| **Sidebar** | Logo, navigasi, kategori dinamis, banner PPDB |
| **Header** | Pencarian, notifikasi, tombol admin |
| **Main Content** | Area render halaman (`@Body`) |
| **Admin Modal** | Iframe ke Admin Panel Payload CMS |

**Fitur khusus di MainLayout:**
-   Kategori dinamis dihitung dari `NewsService.GetNewsAsync()` lalu di-`GroupBy` per kategori.
-   Notifikasi berita di-filter berdasarkan `CreatedAt` < 3 hari.
-   Admin modal menggunakan iframe yang mengarah ke `/admin/collections/news`.

### 2. `Index.razor` — Halaman Beranda
Layout halaman beranda terdiri dari:
-   **Hero Area** (2/3 lebar): Berita pertama/terbaru dengan gambar besar.
-   **Side List** (1/3 lebar): 4 berita berikutnya dalam format kompak.
-   **Bottom Grid**: 2 berita lainnya + kolom pengumuman.

### 3. `NewsList.razor` — Daftar Berita
Menampilkan semua berita dalam grid kartu dengan fitur:
-   Dukungan query string `?category=xxx` untuk filter kategori.
-   Dukungan query string `?q=xxx` untuk pencarian.

### 4. `NewsDetails.razor` — Detail Berita
Halaman pembaca artikel dengan:
-   Tombol "Kembali" untuk navigasi balik.
-   Parser konten **Lexical JSON** ke teks paragraf.
-   Gambar hero dan metadata penulis.

## Parsing Konten Lexical

Payload CMS menyimpan konten rich-text dalam format **Lexical** (JSON tree). Aplikasi desktop harus mem-parsing tree ini secara rekursif untuk mengekstrak teks:

```csharp
// Contoh struktur Lexical JSON dari API
{
  "root": {
    "children": [
      {
        "type": "paragraph",
        "children": [
          { "text": "Ini adalah konten berita..." }
        ]
      }
    ]
  }
}
```

Fungsi `ExtractTextFromLexical()` di `NewsDetails.razor`:
1.  Menerima `object` (JsonElement).
2.  Mencari node dengan `type: "paragraph"`.
3.  Mengumpulkan semua `text` dari children node tersebut.
4.  Mengembalikan `List<string>` untuk di-render sebagai paragraf HTML.

:::warning[Keterbatasan Parser Saat Ini]
Parser saat ini hanya mengekstrak **teks biasa** dari node paragraf. Elemen Lexical lainnya (heading, list, image embed, code block) belum didukung. Ini adalah area yang bisa ditingkatkan di versi mendatang.
:::

## Admin Panel Integration

Admin Panel Payload CMS ditanamkan menggunakan **iframe**:

```razor
<iframe src="@EndpointUrl" class="w-full h-full border-0"></iframe>

@code {
    private string EndpointUrl =>
        $"{Configuration["ApiSettings:BaseUrl"]}/admin/collections/news";
}
```

Modal ini muncul sebagai overlay di atas aplikasi, memungkinkan admin mengelola berita tanpa meninggalkan aplikasi desktop.

## Diagram Komponen

```
App.razor
└── MainLayout.razor
    ├── Sidebar
    │   ├── Logo + Brand
    │   ├── NavLink (Beranda)
    │   ├── NavLink (Berita)
    │   ├── Kategori Dinamis (loop)
    │   └── Banner PPDB
    ├── Header
    │   ├── Search Input
    │   ├── Notification Bell
    │   │   └── Dropdown Panel (conditional)
    │   └── Admin Button
    ├── @Body
    │   ├── Index.razor (route: /)
    │   ├── NewsList.razor (route: /news)
    │   └── NewsDetails.razor (route: /news/{id})
    └── Admin Modal (conditional iframe)
```
