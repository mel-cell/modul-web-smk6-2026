---
title: "Setup & Development"
description: Cara menyiapkan lingkungan pengembangan dan menjalankan aplikasi desktop.
sidebar:
  order: 1
---

Panduan ini ditujukan untuk developer yang ingin melakukan pengembangan atau modifikasi pada aplikasi News Desktop.

## Prasyarat

Pastikan software berikut sudah terinstal:

| Software | Versi Minimum | Cara Cek |
|----------|--------------|----------|
| **.NET SDK** | 10.0 | `dotnet --version` |
| **Git** | 2.x | `git --version` |
| **WebKitGTK** (Linux) | 2.x | `dpkg -l libwebkit2gtk*` |

### Instalasi .NET SDK (Linux)
```bash
# Ubuntu/Debian
sudo apt install dotnet-sdk-10.0

# Atau gunakan script resmi Microsoft
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --channel 10.0
```

### Instalasi WebKitGTK (Linux)
Photino di Linux membutuhkan **WebKitGTK** sebagai webview engine:
```bash
sudo apt install libwebkit2gtk-4.1-dev
```

:::warning[Penting untuk Linux]
Tanpa WebKitGTK, aplikasi akan crash saat dijalankan dengan error `DllNotFoundException: Photino.Native`. Pastikan library ini terinstal sebelum memulai development.
:::

## Clone & Jalankan

```bash
# 1. Clone repositori
git clone https://github.com/mel-cell/NewsSMKN6Malang.git
cd NewsSMKN6Malang

# 2. Jalankan (mode development, dengan hot reload)
dotnet watch run

# Atau gunakan Makefile
make dev
```

Aplikasi akan terbuka dalam jendela desktop native.

## Struktur Proyek

```
NewsDekstopSMK6/
├── Program.cs                   # Entry point (konfigurasi Photino)
├── App.razor                    # Root Blazor component
├── _Imports.razor               # Global using statements
├── appsettings.json             # Konfigurasi API URL
├── NewsSMKN6Malang.csproj       # Project file (.NET)
├── Makefile                     # Shortcut commands
│
├── Data/                        # Service & Model layer
│   ├── NewsItem.cs              # Model berita + parser JSON
│   └── NewsService.cs           # HTTP client untuk API
│
├── Pages/                       # Halaman-halaman aplikasi
│   ├── Index.razor              # Beranda (hero + berita terbaru)
│   ├── NewsList.razor           # Daftar semua berita + filter
│   └── NewsDetails.razor        # Detail artikel (reader view)
│
├── Shared/                      # Komponen layout
│   ├── MainLayout.razor         # Layout utama (sidebar + header + modal admin)
│   └── NavMenu.razor            # Menu navigasi
│
└── wwwroot/                     # Aset statis
    ├── index.html               # HTML host (load Tailwind CDN)
    ├── logo.png                 # Logo SMKN 6
    └── css/                     # Custom CSS tambahan
```

## Alur Data (Architecture)

```
┌─────────────┐    HTTP GET     ┌──────────────────┐
│ NewsService │ ──────────────► │ Payload CMS API  │
│ (C# Client) │ ◄────────────── │ /api/news        │
└──────┬──────┘    JSON Response └──────────────────┘
       │
       │ Dependency Injection
       ▼
┌─────────────┐
│ Blazor Page │ ← Index.razor, NewsList.razor, NewsDetails.razor
│ (UI Layer)  │
└──────┬──────┘
       │
       │ HTML/CSS Rendering
       ▼
┌─────────────┐
│  Photino    │ ← Native window (WebView)
│  (Desktop)  │
└─────────────┘
```

## File-File Penting

### `Program.cs` — Entry Point
```csharp
// Inisialisasi Photino
var app = appBuilder.Build();
app.MainWindow
    .SetTitle("News SMKN 6 Malang")
    .SetSize(1000, 800)         // Ukuran jendela
    .SetIconFile("favicon.ico") // Ikon di taskbar
    .Load("index.html");        // Load HTML host
```

### `Data/NewsService.cs` — API Client
```csharp
// Mengambil berita dari REST API
public async Task<List<NewsItem>> GetNewsAsync()
{
    var response = await _httpClient
        .GetFromJsonAsync<PayloadResponse<NewsItem>>($"{_apiBaseUrl}/api/news");
    return response?.Docs ?? new List<NewsItem>();
}
```

### `Data/NewsItem.cs` — Model Data
Model ini memetakan respons JSON dari Payload CMS ke objek C#. Beberapa field penting:
-   `Title` — Judul berita
-   `HeroImage` — URL gambar utama (auto-resolve ke domain jika relative)
-   `CategoryElement` — Parsing dinamis karena API bisa mengembalikan string atau object
-   `DisplayDate` — Tanggal untuk ditampilkan

:::tip[Lexical Content Parsing]
Konten berita dari Payload CMS menggunakan format **Lexical (JSON tree)**. Di file `NewsDetails.razor`, ada fungsi `ExtractTextFromLexical()` yang secara rekursif membaca node-node paragraf dari tree JSON ini untuk ditampilkan sebagai teks.
:::

## Perintah Berguna

| Perintah | Fungsi |
|----------|--------|
| `dotnet watch run` | Jalankan + Hot Reload |
| `dotnet build` | Compile tanpa menjalankan |
| `dotnet run` | Compile + Jalankan |
| `dotnet clean` | Bersihkan build artifacts |
| `make dev` | Shortcut untuk `dotnet watch run` |
| `make clean` | Shortcut untuk `dotnet clean` + rm bin/obj |

## Mengubah API Endpoint

Untuk mengarahkan aplikasi ke server lain (misalnya server lokal), edit file `appsettings.json`:

```json
{
  "ApiSettings": {
    "BaseUrl": "http://localhost:3000"
  }
}
```

Setelah mengubah file ini, restart aplikasi agar perubahan berlaku.
