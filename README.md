-Final-Task-Designing-A-Data-Warehouse-And-Implementing-Stored-Procedures-

Salah satu client dari perusahaan ID/X Partners yang bergerak di industri perbankan, memiliki kebutuhan untuk membuat sebuah Data Warehouse dari beberapa sumber data yang berbeda yang tersimpan di dalam sistem mereka. Beberapa sumber data tersebut antara lain :

transaction_excel (file excel)
transaction_csv (file csv)
transaction_db (Database SQL Server)
account (Database SQL Server)
customer (Database SQL Server)
branch (Database SQL Server)
city (Database SQL Server)
state (Database SQL Server) Permasalahan yang mereka hadapi saat ini adalah mereka kesulitan untuk mengekstrak data dari berbagai sumber (excel, csv, database) secara bersamaan sehingga pelaporan dan analisis data mereka selalu mengalami keterlambatan. sumber data bisa didownload disini https://drive.google.com/drive/u/0/folders/11C5AOiTP_I0k4Mps9vpFq3HJSZ_pHJLa?q=sharedwith:public%20parent:11C5AOiTP_I0k4Mps9vpFq3HJSZ_pHJLa
Sebagai seorang Data Engineer, ada beberapa tugas yang perlu anda lakukan untuk optimalisasi proses ETL di perusahaan tersebut yaitu :

Membuat sebuah database baru yang akan kita anggap sebagai Data Warehouse baru bernama DWH. Setelah itu buat tiga tabel dimension yaitu DimAccount,DimCustomer,DimBranch dan satu tabel fact yaitu FactTransaction. (**jangan lupa untuk memberikan primary key dan foreign key di setiap tabel)
Membuat job ETL di aplikasi talend untuk memindahkan data dari source( ke seluruh tabel Dimension. Khusus untuk tabel DimCustomer, format kolom yang disimpan adalah CustomerID, CustomerName,Address,CityName,StateName,Age,G ender,Email. Semua data dari kolom tersebut diubah menjadi huruf kapital kecuali untuk kolom CustomerID, Age dan Email. (**Untuk penamaan kolom-kolom diharapkan mengikuti kaidah PascalCase, contoh account_id = AccountID).
Membuat job ETL untuk menggabungkan data transaksi (transaksi_excel, transaksi_csv, transaksi_db) menjadi satu di tabel FactTransaction. Perlu diperhatikan karena ketiga file tersebut berasal dari source yang berbeda-beda, maka pastikan tidak ada row yang duplikat di dalam tabel FactTransaction.
Membuat dua Stored Procedure (SP) dengan parameter, untuk membantu mereka mendapatkan ringkasan data dengan cepat. Stored Procedure yang diminta yaitu :

DailyTransaction (untuk menghitung banyaknya transaksi beserta total nominalnya setiap harinya). Kolom yang ditampilkan yaitu Date, TotalTransactions, TotalAmount. Kolom TotalAmount didapat dengan menjumlahkan Amount setiap harinya. Lalu buatlah dua parameter yaitu start_date dan end_date jadi ketika menjalankan SP ini dengan memasukkan parameter tersebut, maka akan menampilkan data sesuai rentang tanggal yang kita masukkan. Berikut contoh output yang diharapkan

BalancePerCustomer (untuk mengetahui sisa balance per customer). Kolom yang ditampilkan yaitu CustomerName, AccountType, Balance, CurrentBalance. Kolom CurrentBalance didapat dari kolom Balance di tabel account dikurang total amount yang ditransaksikan di tabel transaction untuk setiap account_id. Untuk setiap transaction_type = Deposit, maka balance akan bertambah, selain itu maka Balance akan berkurang. Buatlah parameter bernama name sehingga ketika menjalankan SP ini dengan memasukkan nama salah satu customer tersebut, maka akan menampilkan data sesuai dengan yang kita input. Lalu pastikan untuk filter yang accountnya berstatus active. Berikut adalah contoh transaksi salah satu customer bernama Shelly dan hasil output yang diharapkan
