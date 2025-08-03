---- GATHERING DATA

-- CREATE TABLE WARMINDO
	CREATE TABLE warmindo (
	id int,
	invoice_id int,
	tanggal_transaksi DATE,
	customer_id int,
	nama_produk varchar (50),
	jenis_produk varchar (50),
	kategori_produk varchar (50),
	quantity int,
	harga_jual int,
	jenis_pembayaran varchar (20),
	jenis_pesanan varchar (20),
	nilai_penjualan int
	)

	
--- ASSESSING DATA

-- CEK INFORMASI TABLE
	PRAGMA TABLE_INFO(warmindo)

-- CEK DUPLIKAT
	SELECT id, invoice_id, tanggal_transaksi, customer_id, nama_produk, jenis_produk, kategori_produk, quantity, harga_jual, jenis_pembayaran, jenis_pesanan, nilai_penjualan, count(*) as "Jumlah Duplikat"
	FROM warmindo
	GROUP BY id, invoice_id, tanggal_transaksi, customer_id, nama_produk, jenis_produk, kategori_produk, quantity, harga_jual, jenis_pembayaran, jenis_pesanan, nilai_penjualan
	HAVING count(*) > 1

-- CEK JUMLAH DATA
	SELECT COUNT(*) as "Jumlah Data" FROM warmindo

-- CEK ISI SELURUH DATA
	SELECT * FROM warmindo
	
	
--- EXPLANATION

-- 1. Bagaimana tren penjualan dari waktu ke Waktu?
	SELECT strftime('%Y-%m', tanggal_transaksi) AS "Periode (Bulan)", count(invoice_id) AS "Total Order"
	FROM warmindo
	GROUP BY strftime('%m', tanggal_transaksi)
	ORDER BY "Total Order" ASC / DESC
	
-- 2. Bagaimana revenue penjualan dari Waktu ke waktu?
	-- Revenue Penjualan Tertinggi
	SELECT strftime('%Y-%m', tanggal_transaksi) as "Periode (Bulan)", sum(nilai_penjualan) as "Total Revenue"
	FROM warmindo
	GROUP BY strftime('%m', tanggal_transaksi)
	ORDER BY "Total Revenue" DESC
	-- Revenue Penjualan Terendah
	SELECT strftime('%Y-%m', tanggal_transaksi) as "Periode (Bulan)", sum(nilai_penjualan) as "Total Revenue"
	FROM warmindo
	GROUP BY strftime('%m', tanggal_transaksi)
	ORDER BY "Total Revenue" ASC
	
-- 3. Produk apa yang sering dibeli dan jarang dibeli?
	-- Produk Penjualan Tertinggi
	SELECT nama_produk as "Nama Produk", count(invoice_id) as "Total Order"
	FROM warmindo
	GROUP BY nama_produk
	HAVING count(invoice_id)
	ORDER BY "Total Order" DESC
	LIMIT 3
	-- Produk Penjualan Terendah
	SELECT nama_produk as "Nama Produk", count(invoice_id) as "Total Order"
	FROM warmindo
	GROUP BY nama_produk
	HAVING count(invoice_id)
	ORDER BY "Total Order" ASC
	LIMIT 3
	
-- 4. Produk apa yang memiliki total revenue tertinggi dan terendah?
	-- Produk Revenue Tertinggi
	SELECT nama_produk as "Nama Produk", sum(nilai_penjualan) as "Total Revenue"
	FROM warmindo
	GROUP BY nama_produk
	HAVING sum(nilai_penjualan)
	ORDER BY "Total Revenue" DESC
	LIMIT 3
	-- Produk Revenue Terendah
	SELECT nama_produk as "Nama Produk", sum(nilai_penjualan) as "Total Revenue"
	FROM warmindo
	GROUP BY nama_produk
	HAVING sum(nilai_penjualan)
	ORDER BY "Total Revenue" ASC
	LIMIT 3
	
-- 5. Jenis dan Kategori produk apa yang paling sering dibeli dan jarang dibeli?
	SELECT jenis_produk as "Jenis Produk", kategori_produk as "Kategori Produk", count(invoice_id) as "Total Order", sum(nilai_penjualan) as "Total Revenue"
	FROM warmindo
	GROUP BY jenis_produk, kategori_produk
	ORDER BY "Total Revenue" DESC
	
-- 6. Apakah ada pelanggan yang melakukan pembelian lebih dari satu kali (repeat customer rate)?
	-- Total Repeat Time (Pelanggan)
	SELECT count("Jumlah Kunjungan Pelanggan")
	FROM (SELECT customer_id as "Pelanggan", count(invoice_id) as "Jumlah Kunjungan Pelanggan" FROM warmindo GROUP BY customer_id HAVING count(invoice_id) > 1)
	-- Sampel Pelanggan yang Mengunjungi Lebih dari 1 Kali
	SELECT customer_id as "Pelanggan", count(invoice_id) as "Jumlah Kunjungan Pelanggan"
	FROM warmindo
	GROUP BY customer_id
	HAVING count(invoice_id) > 1
	ORDER BY "Jumlah Kunjungan Pelanggan" ASC
	
-- 7. Berapa rata-rata jumlah kunjungan pelanggan?
	SELECT round(avg("Jumlah Kunjungan"))  as "Rata-Rata Kunjungan"
	FROM (SELECT customer_id, count(invoice_id) as "Jumlah Kunjungan" FROM warmindo GROUP BY customer_id)
	
-- 8. Berapa rata-rata jumlah uang yang dikeluarkan pelanggan?
	SELECT round(avg("Total Penjualan")) as "Rata-Rata Pengeluaran"
	FROM (SELECT customer_id, SUM(nilai_penjualan) as "Total Penjualan" FROM warmindo GROUP BY customer_id)
	
-- 9. Metode pembayaran apa yang paling sering digunakan dan menghasilkan penjualan terbanyak?
	SELECT jenis_pembayaran as "Metode Pembayaran", count(invoice_id) as "Total"
	FROM warmindo
	GROUP BY jenis_pembayaran
	ORDER BY "Total" DESC
	
-- 10. Jenis pesanan apa yang mendominasi?
	SELECT jenis_pesanan as "Jenis Pesanan", count(invoice_id) as "Total"
	FROM warmindo
	GROUP BY jenis_pesanan
	ORDER BY "Total" DESC