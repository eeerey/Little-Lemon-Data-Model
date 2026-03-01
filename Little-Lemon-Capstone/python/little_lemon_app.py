import mysql.connector as connector

# Konfigurasi Koneksi (XAMPP Default biasanya password kosong)
config = {
    "user": "root",
    "password": "", 
    "host": "127.0.0.1",
    "database": "LittleLemonDB"
}

def run_project():
    try:
        # Hubungkan ke database
        db = connector.connect(**config)
        cursor = db.cursor()
        print("✅ Berhasil Terhubung ke Database Little Lemon!")

        # 1. Panggil Prosedur GetMaxQuantity
        print("\n--- Menjalankan GetMaxQuantity ---")
        cursor.callproc('GetMaxQuantity')
        for result in cursor.stored_results():
            print(f"Jumlah Maksimum dalam Pesanan: {result.fetchone()[0]}")

        # 2. Tambahkan Data Booking Baru
        print("\n--- Menambahkan Booking Baru ---")
        # Parameter: (BookingID, CustomerID, Date, TableNumber)
        # cursor.callproc('AddBooking', (5, 1, '2024-12-01', 3))
        # db.commit()
        # print("✅ Data berhasil disimpan.")

        cursor.close()
        db.close()
    except connector.Error as err:
        print(f"❌ Error: {err}")

if __name__ == "__main__":
    run_project()