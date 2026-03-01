# Little Lemon Management System Capstone

Proyek ini adalah sistem manajemen database akhir untuk restoran Little Lemon, mencakup perancangan database, otomasi dengan Python, dan visualisasi data.

## 📂 Struktur File

- **Database/**: Berisi skrip SQL dan diagram ER (PNG).
- **Python/**: Berisi skrip untuk koneksi database dan menjalankan prosedur tersimpan.
- **Tableau/**: File dashboard visualisasi penjualan (.twbx).

## ⚙️ Cara Menjalankan

1. Jalankan **XAMPP** (Apache & MySQL).
2. Impor `LittleLemonDB.sql` melalui phpMyAdmin.
3. Jalankan `little_lemon_app.py` untuk menguji koneksi dan prosedur.
4. Buka file `.twbx` di Tableau Public untuk melihat laporan analitik.

## 🛠️ Fitur Prosedur SQL

- `GetMaxQuantity()`: Menampilkan kuantitas pesanan tertinggi.
- `AddBooking()`: Menambahkan reservasi baru secara otomatis.
- `CancelBooking()`: Menghapus data reservasi.
