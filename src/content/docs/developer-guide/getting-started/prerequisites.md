---
title: Prasyarat Sistem
description: Daftar perangkat lunak yang wajib diinstal sebelum memulai pengembangan.
sidebar:
  order: 1
---

Sebelum Anda bisa menjalankan project SMK Negeri 6 Malang, pastikan komputer Anda sudah memiliki spesifikasi dan perangkat lunak berikut.

## 1. Perangkat Lunak Wajib

| Software | Versi Minimal | Kegunaan |
| :--- | :--- | :--- |
| **Node.js** | 20.x (LTS) | Runtime utama untuk Next.js dan Payload CMS. |
| **pnpm** | 8.x atau 9.x | Package manager (Wajib pakai pnpm, jangan npm/yarn). |
| **Docker Engine** | Terbaru | Menjalankan database dan environment aplikasi. |
| **Git** | Terbaru | Manajemen versi kode. |

## 2. Mengapa Harus PNPM?

Project ini menggunakan **pnpm** karena jauh lebih cepat dalam instalasi modul dan jauh lebih hemat ruang penyimpanan dibandingkan npm biasa.

:::danger[Peringatan Kritis]
Jangan pernah menghapus file `pnpm-lock.yaml`. File ini adalah kunci agar semua developer menggunakan versi library yang sama persis. Jika file ini berantakan, build aplikasi di Production bisa gagal.
:::

## 3. Instalasi Cepat

Jika Anda menggunakan Linux/macOS, Anda bisa menginstal pnpm melalui Corepack:

```bash
corepack enable
corepack prepare pnpm@latest --activate
```

Untuk pengguna Windows, silakan unduh installer di [pnpm.io](https://pnpm.io/installation).

## 4. Extension VS Code (Sangat Direkomendasikan)
Agar koding lebih nyaman, instal extension berikut:
*   **ESLint**: Menjaga standar kode.
*   **Prettier**: Merapikan format kode secara otomatis.
*   **Tailwind CSS IntelliSense**: Membantu penulisan utility class Tailwind.
*   **Console Ninja**: Memudahkan debugging log di terminal.
