# 🍝 Warmindo Sales Analysis

## 🌍 Background 
Warmindo adalah sebuah warung makan sederhana yang menjual berbagai macam mie instan, terutama dari produk Indomie sebagai menu utama. Sehingga dikatakan Warung Makan Indomie (Warmindo). Tidak hanya produk Indomie, biasanya warmindo juga menjual menu lain seperti bubur kacang hijau, nasi goreng, nasi ayam, dan gorengan.

Proyek ini akan menganalisis performa penjualan dari sebuah Warmindo untuk menemukan sebuah insight yang menarik dan bermanfaat untuk evaluasi dan pengembangan Warmindo. Dataset ini dibuat oleh sebuah Content Creator Youtube Bima Ngulik Data dengan sedikit penyesuaian.

Dataset Source: https://www.youtube.com/@bima-ngulikdata

## 🗂️ Struktur Proyek
```
├───README.md
├───Warmindo Analysis using SQL's Notebook.pdf (analysis process)
├───dashboard_visualization.png
├───Warmindo.csv (dataset)
├───warmindo.sql (query)
└───warmindo_db.db (database)
```

## 🔍 Analysis & Insight
### Mendefinisikan Pertanyaan
1. Bagaimana tren penjualan dari waktu ke Waktu?
2. Bagaimana revenue penjualan dari Waktu ke waktu?
3. Produk apa yang sering dibeli dan jarang dibeli?
4. Produk apa yang memiliki total revenue tertinggi dan terendah?
5. Metode pembayaran apa yang paling sering digunakan dan menghasilkan penjualan terbanyak?
6. Jenis dan Kategori produk apa yang paling sering dibeli dan jarang dibeli?
7. Jenis pesanan apa yang mendominasi?
8. Apakah ada pelanggan yang melakukan pembelian lebih dari satu kali (repeat customer rate)?
9. Berapa rata-rata jumlah kunjungan pelanggan?
10. Berapa rata-rata jumlah uang yang dikeluarkan pelanggan?

### Insight yang Didapat
1. Pada periode penjualan antara bulan Januari-Agustus 2022 memiliki tren penjualan yang mengalami kenaikan dan penurunan. Terlihat `kenaikan penjualan tertinggi` terjadi pada bulan `Juli dengan total order sebanyak 80` dan `penurunan penjualan terendah` terjadi pada bulan `April dengan total order sebanyak 50`.
2. Pada periode Januari-Agustus 2022, tren revenue penjualan juga mengalami kenaikan dan penurunan. Terlihat kenaikan revenue tertinggi terjadi pada bulan `Juli dengan total pendapatan Rp 1.446.000` dan penurunan revenue terendah terjadi pada bulan `April dengan total pendapatan Rp 899.000`. Pola ini selaras dengan tren penjualan di mana kenaikan dan penurunan terjadi di bulan yang sama.
3. Untuk produk dengan `penjualan tertinggi` dan sering dibeli oleh pelanggan, yaitu `Indomie Rasa Soto Banjar Limau Kulit dengan total order 41` sedangkan untuk produk dengan `penjualan terendah` dan jarang dibeli oleh pelanggan, yaitu `Indomie Goreng Rendang dengan total order 20`.
4. Untuk produk dengan `revenue tertinggi`, yaitu `Indomie Rasa Soto Betawi dengan total revenue Rp 800.000` sedangkan untuk produk dengan `revenue terendah`, yaitu `Indomie Goreng Rendang dengan total revenue Rp 360.000`.
5. Metode pembayaran `CASH paling banyak digunakan` untuk bertransaksi di Warmindo dengan total transaksi sebesar `100` transaksi sedangkan untuk metode pembayaran `QRIS-SHOPEEPAY paling sedikit digunakan` untuk bertransaksi dengan total transaksi sebesar `66 transaksi`.
6. Jenis produk dan kategori produk yang paling sering dibeli adalah `jenis produk mie kuah` dan `kategori produk makanan` dengan total order sebesar 349 dan total revenue sebesar `Rp 6.565.000`
7. Jenis pesanan yang terdapat di Warmindo ada dua, yaitu `Dine-In dan Delivery`. Jika dilihat jenis `pesanan apa yang mendominasi, jenis pesanan Dine-In dengan total order 258` adalah yang paling mendominasi diikuti dengan `jenis pesanan Delivery dengan total order 241`.
8. Jumlah pelanggan yang melakukan `kunjungan lebih dari satu kali sebanyak 95 pelanggan` dengan `minimal kunjungan 2 kali` dan `maksimal kunjungan 11 kali`.
9. Rata-rata kunjungan pelanggan yang melakukan kunjungan kembali sebesar `5 kali kunjungan`
10. Rata-rata jumlah uang yang dikeluarkan oleh pelanggan sebanyak `Rp 92.949`


📌 Detail proses analisis data terdokumentasi dalam notebook python berikut
[notebook summary.pdf](https://github.com/mhmmdridlo/warmindo-sql/blob/3a2a2b5e91c88742e0ccd61f9774bd755e83bff0/Warmindo%20Analysis%20using%20SQL's%20Notebook.pdf)

## 📊 Dashboard
<p align='center'>
  <img src='/dashboard_visualization.png'/>
  🖼️ Tampilan Dashboard


Hasil analisis ini di deployment ke dashboard dengan menggunakan Tableau melalui link berikut

🔗 https://public.tableau.com/app/profile/muhammad.ridlo6510/viz/Dashboard_17542277400740/Dashboard1

References
- Dataset from https://www.youtube.com/@bima-ngulikdata
- Dashboard Artwork from https://www.behance.net/fanuelleva
