---
title: "Mengelola Hotspot & Navigasi"
description: Cara mengatur titik-titik navigasi antar ruangan dalam tur virtual.
sidebar:
 order: 3
---

Hotspot (Penghubung) adalah **titik-titik klik** yang muncul di dalam viewer 360° dan berfungsi sebagai "pintu" untuk berpindah dari satu ruangan ke ruangan lainnya. Tanpa hotspot, pengunjung hanya bisa melihat satu ruangan saja tanpa bisa menjelajah.

## Konsep Hotspot

Setiap hotspot memiliki 4 parameter utama:

| Parameter | Deskripsi | Contoh |
|-----------|-----------|--------|
| **Label** | Teks yang muncul saat di-hover | `Menuju Laboratorium RPL` |
| **Yaw (Horizontal)** | Posisi horizontal hotspot (0° - 360°) | `180` (menghadap belakang) |
| **Pitch (Vertikal)** | Posisi vertikal hotspot (-90° hingga 90°) | `-15` (sedikit menunduk) |
| **Skala Ikon** | Ukuran ikon hotspot | `1` (default) |

### Memahami Yaw dan Pitch

```
 [ 90° Pitch ]
 ↑
 │
[ 270° Yaw ] ← ● → [ 90° Yaw ]
 │
 ↓
 [ -90° Pitch ]
 
 Yaw 0° = Menghadap ke depan (arah default kamera)
 Yaw 180° = Menghadap ke belakang
 Pitch 0° = Sejajar mata
 Pitch -30° = Menunduk ke lantai
```

## Langkah-Langkah Membuat Hotspot

### 1. Buka Koleksi Smart Tour
Navigasikan ke **Smart Tour → Koleksi Smart Tour** lalu buka tur yang ingin diedit.

### 2. Pilih Tab "Materi (Rooms)"
Di sini Anda akan melihat daftar ruangan yang sudah dibuat.

### 3. Buka Ruangan yang Ingin Ditambahkan Hotspot
Klik pada ruangan tertentu untuk membuka pengaturannya.

### 4. Scroll ke Bagian "Penghubung / Hotspots"
Klik tombol **"Add Link"** untuk menambahkan hotspot baru.

### 5. Isi Parameter Hotspot

1. **Label Hotspot**: Berikan nama yang jelas dan deskriptif.
 - Baik: `Menuju Ruang Kepala Sekolah`
 - Buruk: `Link 01`

### 6. Alat Bantu Posisi Interaktif (Paling Mudah)

Sekarang Anda tidak perlu lagi menebak-nebak angka Yaw dan Pitch secara manual. Gunakan fitur **"Camera Positioning"** yang baru:

1. **Buka Preview 360°** di dalam tab ruangan.
2. Geser pandangan kamera hingga tepat mengenai titik yang Anda inginkan (misal: tepat di depan pintu).
3. **Klik Kanan** pada mouse atau tekan tombol **Enter** di keyboard Anda.
4. Sistem akan otomatis menyalin koordinat tersebut ke data Yaw dan Pitch hotspot Anda.
5. Anda akan melihat icon **Foto/Kamera** pada tombol simpan yang menandakan posisi berhasil "dipotret".

### 7. Save Tur
Setelah posisi terkunci (ikon kamera muncul), klik **Save** untuk menyimpan perubahan secara permanen ke database sekolah.

## Tips Penempatan Hotspot

:::tip[Tips untuk Hasil Terbaik]
1. **Letakkan di posisi logis**: Pastikan hotspot berada di dekat pintu, lorong, atau tangga yang sebenarnya terlihat di foto.
2. **Jangan terlalu banyak**: Maksimal 3-4 hotspot per ruangan agar tampilan tidak sesak.
3. **Gunakan label yang konsisten**: Jika satu ruangan menamakan "Lab RPL", pastikan semua hotspot yang mengarah ke sana juga menggunakan nama yang sama.
4. **Tes di perangkat mobile**: Hotspot yang terlalu kecil (`skala < 0.5`) akan sulit diklik di layar HP.
:::

## Membuat Tur yang Terhubung (Connected Tour)

Agar pengunjung bisa menjelajahi seluruh sekolah secara mulus, pastikan:

1. **Setiap ruangan punya minimal 1 hotspot** yang mengarah ke ruangan lain.
2. **Hubungan dua arah**: Jika Ruangan A punya hotspot ke Ruangan B, maka Ruangan B juga harus punya hotspot balik ke Ruangan A.
3. **Tentukan ruangan awal**: Di pengaturan tur (Tab Hero), pilih ruangan mana yang pertama kali dilihat pengunjung saat membuka tur.

```
 [Lobby] ←──→ [Lab RPL]
 
 [Kantin] ←──→ [Perpustakaan]
```

:::warning[Hotspot Tanpa Tujuan]
Jika Anda membuat hotspot tapi belum menentukan ruangan tujuannya, hotspot tersebut akan tetap muncul di viewer namun **tidak bisa diklik**. Pastikan semua hotspot sudah dihubungkan ke ruangan tujuan.
:::
