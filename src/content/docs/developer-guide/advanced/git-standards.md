---
title: Standar Git & Kolaborasi
description: Aturan main dalam mengelola kode secara tim.
sidebar:
  order: 3
---

Konsistensi adalah kunci agar project SMK6 tidak berantakan saat dikerjakan oleh banyak developer.

## 1. Naming Convention

*   **File Komponen**: `PascalCase` (Contoh: `BigBanner.tsx`)
*   **Folder Blok/Fitur**: `kebab-case` (Contoh: `news-archive/`)
*   **Variable & Fungsi**: `camelCase` (Contoh: `handleButtonClick`)

## 2. Alur Branching

Jangan pernah melakukan push langsung ke branch `main`. Gunakan alur berikut:

1.  Buat branch baru: `feat/nama-fitur` atau `fix/nama-bug`.
2.  Lakukan koding dan test di lokal.
3.  Pastikan `pnpm build` sukses.
4.  Lakukan commit dengan pesan yang jelas: `feat: add achievement collection`.
5.  Push ke GitHub dan buat **Pull Request**.

## 3. Pesan Commit (Git Commit Messages)

Gunakan standar [Conventional Commits](https://www.conventionalcommits.org/):
*   `feat`: Menambah fitur baru.
*   `fix`: Memperbaiki bug.
*   `docs`: Mengubah dokumentasi.
*   `refactor`: Mengubah kode tanpa mengubah fitur (bersih-bersih).

:::tip[Tips]
Pesan commit yang rapi membantu kita mencari sejarah perubahan jika suatu saat terjadi error misterius di masa depan.
:::
