---
title: Prasyarat & Persiapan Awal
description: Panduan teknis mendalam mengenai instalasi lingkungan pengembangan.
sidebar:
  order: 2
---

Bagian ini bukan sekadar daftar software, tapi langkah-langkah teknis untuk memastikan lingkungan koding Anda sehat.

## 1. Detail Node.js & Tooling

Kita menggunakan **Node.js 20.x (LTS - Iron)**. Mengapa? Karena versi ini memiliki stabilitas terbaik untuk library yang kita gunakan.

### Cek Versi:
```bash
node -v
# Output harus v20.x.x
```
Jika versi Anda berbeda, sangat disarankan menggunakan **NVM (Node Version Manager)**:
```bash
nvm install 20
nvm use 20
```

## 2. Mengapa PNPM adalah Harga Mati?

Berbeda dengan npm yang mengunduh ribuan file redundan untuk setiap project, pnpm menggunakan *content-addressable storage*. 

### Manfaat nyata bagi project SMK6:
*   **Kecepatan Build**: Menghemat waktu hingga 50% saat `pnpm build`.
*   **Integritas Lockfile**: Menjamin bahwa library `payload` versi 3.0.0 tidak akan mendadak update ke versi yang merusak tanpa persetujuan kita.

## 3. Docker & Docker Desktop

Pastikan Docker Engine Anda memiliki alokasi RAM minimal **4GB**. PostgreSQL dan Node.js yang berjalan bersamaan cukup memakan memori.

### Pengecekan Docker:
```bash
docker compose version
# Pastikan v2.x.x ke atas
```

## 4. Konfigurasi Git Global

Pastikan Anda mengatur identitas Git Anda agar kontribusi Anda tercatat dengan benar:
```bash
git config --global user.name "Nama Lengkap Anda"
git config --global user.email "email@anda.com"
```

## 5. Checklist Sebelum Koding

:::caution[BACA INI]
Jika Anda baru pertama kali melakukan `git clone` project ini, lakukan urutan ini tanpa terlewat:
1. `pnpm install`
2. Buat file `.env`
3. `docker compose up -d`
4. `pnpm generate:types`
5. `pnpm seed` (Hanya jika butuh data demo)
:::
