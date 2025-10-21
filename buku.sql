INSERT INTO buku (id_buku, judul_buku, tahun, harga, stok, id_penerbit, id_kategori, id_gudang)
SELECT
    -- ID Buku (BIGINT): Dimulai dari 1000000001 hingga 1000010000 (10.000 baris)
    (1000000000 + i)::BIGINT AS id_buku,

    -- Judul Buku (Kombinasi 30 tema, 20 deskriptor, dan 10 kata penghubung/subjek unik)
    CASE (i % 30)
        WHEN 0 THEN 'Rahasia' WHEN 1 THEN 'Kisah' WHEN 2 THEN 'Perjalanan' WHEN 3 THEN 'Misteri'
        WHEN 4 THEN 'Cinta' WHEN 5 THEN 'Teknologi' WHEN 6 THEN 'Dunia' WHEN 7 THEN 'Hantu'
        WHEN 8 THEN 'Bisnis' WHEN 9 THEN 'Seni' WHEN 10 THEN 'Mimpi' WHEN 11 THEN 'Keajaiban'
        WHEN 12 THEN 'Bumi' WHEN 13 THEN 'Strategi' WHEN 14 THEN 'Filsafat' WHEN 15 THEN 'Masa Depan'
        WHEN 16 THEN 'Sejarah' WHEN 17 THEN 'Jaringan' WHEN 18 THEN 'Petualangan' WHEN 19 THEN 'Resep'
        WHEN 20 THEN 'Sains' WHEN 21 THEN 'Pahlawan' WHEN 22 THEN 'Pelangi' WHEN 23 THEN 'Kopi'
        WHEN 24 THEN 'Sang' WHEN 25 THEN 'Seri' WHEN 26 THEN 'Bintang' WHEN 27 THEN 'Kehidupan'
        WHEN 28 THEN 'Kode' WHEN 29 THEN 'Laut'
    END || ' ' ||
    CASE ((i / 3) % 20)
        WHEN 0 THEN 'Terakhir' WHEN 1 THEN 'Yang Hilang' WHEN 2 THEN 'Abadi' WHEN 3 THEN 'Baru'
        WHEN 4 THEN 'Tersembunyi' WHEN 5 THEN 'Mati' WHEN 6 THEN 'Modern' WHEN 7 THEN 'Kuno'
        WHEN 8 THEN 'Digital' WHEN 9 THEN 'Indonesia' WHEN 10 THEN 'Cepat' WHEN 11 THEN 'Malam'
        WHEN 12 THEN 'Pagi' WHEN 13 THEN 'Cerdas' WHEN 14 THEN 'Emas' WHEN 15 THEN 'Terbaik'
        WHEN 16 THEN 'Merah' WHEN 17 THEN 'Biru' WHEN 18 THEN 'Ajaib' WHEN 19 THEN 'Gelap'
    END || ': Tentang ' ||
    CASE (i % 10)
        WHEN 0 THEN 'Algoritma' WHEN 1 THEN 'Hati yang Rapuh' WHEN 2 THEN 'Kota Mati' WHEN 3 THEN 'Uang dan Kekuasaan'
        WHEN 4 THEN 'Rahasia Langit' WHEN 5 THEN 'Peradaban Baru' WHEN 6 THEN 'Teknik Memasak' WHEN 7 THEN 'Hukum Abadi'
        WHEN 8 THEN 'Bisnis Properti' WHEN 9 THEN 'Kisah Nusantara'
    END AS judul_buku,

    -- Tahun Terbit (Acak antara 2000 dan 2024)
    2000 + (i % 25) AS tahun,

    -- Harga (Acak antara 50.000 dan 300.000)
    (50000 + (i * 13 % 250000) + (i % 100))::NUMERIC(12, 2) AS harga,

    -- Stok (Acak antara 10 dan 100)
    10 + (i % 91) AS stok,

    -- FK: id_penerbit (100 Penerbit: 301 - 400)
    301 + (i % 100) AS id_penerbit,

    -- FK: id_kategori (Hanya merujuk ke ID 201 - 210)
    201 + (i % 10) AS id_kategori,

    -- FK: id_gudang (10 Gudang: 101 - 110)
    101 + (i % 10) AS id_gudang
FROM
    generate_series(1, 10000) AS t(i);