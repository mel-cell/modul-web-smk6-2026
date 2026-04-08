---
title: Struktur Direktori (Master Blueprint)
description: Penjelasan komprehensif mengenai setiap sudut folder dan file project.
sidebar:
  order: 1
---

Project SMK6 Engine bukan sekadar kumpulan file, melainkan ekosistem yang terbagi menjadi dua dunia utama: **Data Management (Payload)** dan **Visual Delivery (Next.js)**.

## 1. Root Configuration (Konfigurasi Akar)

Setiap file di akar (root) memiliki peran vital dalam siklus hidup aplikasi:

*   **`next.config.js`**: Pusat kendali Next.js. Di sini kita mengatur whitelist domain gambar (agar gambar dari CMS muncul), optimasi webpack, dan redirect.
*   **`payload.config.ts`**: Dokumentasi paling penting untuk Backend. Di sini kita mendaftarkan semua Collections, Globals, Database adapter, dan Storage.
*   **`docker-compose.yml`**: BluePrint infrastruktur. Menjelaskan container App, PostgreSQL, dan Bind Mount volume untuk persistensi file.
*   **`Dockerfile`**: Resep pembuatan image Docker termasuk instalasi dependencies, build, dan konfigurasi user.

## 2. Bedah `src/app`: Routing System

Kita menggunakan Next.js App Router dengan pola **Route Groups** (folder yang diawali tanda kurung):

*   **`(frontend)/`**: Folder utama untuk tampilan publik.
    *   `[slug]/page.tsx`: Halaman dinamis CMS. Jika user mengetik `/visi-misi`, file ini akan mencari data dengan slug tersebut di CMS.
    *   `berita/`: Arsip dan detail berita.
    *   `jurusan/`: Halaman jurusan/kompetensi keahlian.
    *   `ekstrakurikuler/`: Daftar kegiatan ekskul.
    *   `lowongan/`: Portal lowongan kerja.
    *   `search/`: Halaman hasil pencarian global.
*   **`(tour)/`**: Route group terpisah untuk Smart Tour 360° (tanpa Header & Footer).
    *   `smart-tour/[tourSlug]/page.tsx`: Viewer tur virtual full-screen.
*   **`(payload)/`**: "Pintu masuk" ke Admin Panel. Konfigurasi agar Payload CMS berjalan di dalam Next.js.

:::tip[Mengapa Tour Terpisah?]
Smart Tour membutuhkan **layar penuh** (full viewport) untuk pengalaman imersif. Jika menggunakan layout `(frontend)`, Header dan Footer akan mengganggu tampilan panorama 360°.
:::

## 3. Bedah `src/collections`: Pusat Logika Data

### Daftar Koleksi (19 Total)

| Grup | Koleksi | Deskripsi |
|------|---------|-----------|
| **Profil** | `About`, `Competencies` | Data identitas sekolah |
| **Akademik** | `Majors`, `Classes`, `Students`, `AcademicCalendars` | Data akademik |
| **Konten** | `News`, `Achievements`, `Pages` | Konten website |
| **Media** | `Media`, `Documents`, `MediaStatic` | File upload |
| **SDM** | `Users`, `CurriculumVitae` | Manajemen pengguna & CV |
| **BKK** | `IndustryPartners`, `JobVacancies` | Mitra industri & lowongan |
| **Ekskul** | `Extracurriculars` | Kegiatan siswa |
| **Kategori** | `Categories` | Pengkategorian konten |
| **Smart Tour** | `SmartTour`, `TourMedia` | Tur virtual 360° |

### Anatomi Folder Koleksi
Setiap folder koleksi (misal `News/`) memiliki anatomi standar:
*   **`index.ts`**: Mendefinisikan kolom (fields), hak akses (access), dan nama tabel.
*   **`hooks/`**: Tempat logika otomatis (auto-populate, revalidation).
*   **`access/`**: File terpisah untuk keamanan (RBAC).
*   **`components/`**: Komponen custom khusus Admin Panel (contoh: `RoomSelector` di SmartTour).

## 4. Bedah `src/blocks`: Sistem Modular (35 Blok)

Blok adalah potongan UI yang bisa dipindah-pindah dan disusun oleh Admin.

### Kategori Blok

| Kategori | Contoh Blok |
|----------|-------------|
| **Konten** | `Banner`, `Brief`, `ContentIntro`, `Quote`, `Faq`, `Timeline` |
| **Media** | `Galery`, `GalleryArchive`, `ImageCards`, `SwipeCards` |
| **Koleksi Data** | `NewsCollectionList`, `AchievementsCollectionList`, `MajorCollectionList`, `PartnersCollectionList`, `AcademicCalendarArchive`, `JobArchive` |
| **Layout** | `CardGrid`, `CustomGrid`, `Spacer`, `StatsColumn` |
| **Interaksi** | `CallToAction`, `Form`, `Map`, `Testimonies` |

### Struktur Blok yang Benar
```
NamaBlok/
├── config.ts       # Skema data (fields untuk Admin Panel)
└── Component.tsx   # Tampilan React-nya
```

## 5. Bedah `src/globals`: Konfigurasi Global

| Global | Fungsi |
|--------|--------|
| `Header` | Navigasi utama website (logo, menu, search) |
| `Footer` | Footer website (links, info kontak) |
| `NewsTemplate` | Template halaman detail berita |
| `NewsIndexTemplate` | Template halaman arsip/indeks berita |
| `JobTemplate` | Template halaman lowongan kerja |

## 6. Bedah `src/seeders`: Data Awal

Folder ini berisi script untuk mengisi database dengan data demo:

| File Seeder | Koleksi | Keterangan |
|-------------|---------|------------|
| `users.json` | Users | Akun admin default |
| `categories.ts` | Categories | Kategori berita & galeri |
| `news.ts` | News | Berita contoh |
| `majors.ts` | Majors | Data jurusan |
| `achievements.ts` | Achievements | Data prestasi |
| `media.ts` | Media | Gambar demo |
| `partners.json` | IndustryPartners | Data mitra |
| `extracurriculars.ts` | Extracurriculars | Data ekskul |
| `pages.ts` | Pages | Halaman CMS |
| `headers.json` / `footers.json` | Header/Footer | Layout default |

## 7. Folder Utility & Library

*   **`src/utilities/`**: Fungsi-fungsi kecil yang sering dipakai (format tanggal, slug-generator, URL resolver).
*   **`src/components/`**: Komponen React yang bisa dipakai lintas halaman (Logo, NewsCard, CollectionArchive, SmartTour).
*   **`src/fields/`**: Field kustom yang bisa dipakai di banyak koleksi (defaultLexical, slug field).
*   **`src/access/`**: Fungsi akses kontrol (authenticated, anyone, adminOnly).
*   **`src/plugins/`**: Plugin Payload (search, seo, redirects, form-builder).

## 8. Folder Penyimpanan (Persisten)

```
public/
├── media/    ← File gambar umum (berita, galeri, logo)
├── tour/     ← File gambar panorama 360°
└── ...       ← Asset statis lainnya (favicon, logo, dll)
```

:::danger[Aturan Emas]
Jangan pernah membuat file logika bisnis langsung di dalam folder `src/app`. Selalu pisahkan logika ke `utilities` atau `hooks` agar kode bisa dites dan digunakan ulang (*reusable*).
:::
