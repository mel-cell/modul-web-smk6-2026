---
title: Production Debugging
description: Cara menangani error sulit di lingkungan produksi.
sidebar:
  order: 2
---

Error di mode Production seringkali sulit dibaca karena kode sudah dikompresi (minified). Misalnya, Anda mungkin melihat error seperti `ReferenceError: i is not defined`.

## 1. Membongkar Kode Minified

Untuk mengetahui siapa sebenarnya `i` tersebut, Anda bisa mematikan fitur minifikasi sementara di `next.config.js`:

```javascript
// next.config.js
webpack: (config, { dev }) => {
  if (!dev) {
    config.optimization.minimize = false; // Matikan minifikasi
  }
  return config;
}
```

Setelah build ulang, error akan menunjukkan nama komponen yang asli (misal: `CustomGridComponent`), memudahkan Anda menemukan lokasi *Circular Dependency*.

## 2. Mengaktifkan Source Maps

Gunakan pengaturan berikut di Node.js (via Dockerfile) untuk mendapatkan stack trace yang lebih detail:

```dockerfile
# Dockerfile
CMD ["node", "--enable-source-maps", "server.js"]
```

Dan di `next.config.js`:
```javascript
productionBrowserSourceMaps: true
```

## 3. Checklist Perbaikan Cepat (Quick Fix)

Jika website mendadak 500 Error di Production setelah dideploy:
1.  **Cek Logs**: Gunakan `docker compose logs --tail 100`.
2.  **Cek Circular**: Cari import sirkular di `RenderBlocks` atau Hooks.
3.  **Cek .env**: Pastikan `PAYLOAD_SECRET` dan `DATABASE_URI` di server sudah benar.
