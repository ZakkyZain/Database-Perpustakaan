INSERT INTO penerbit (id_penerbit, nama_penerbit, alamat_penerbit, no_telepon_penerbit)
SELECT

    i AS id_penerbit,
    
    CASE (i - 301) % 10
        WHEN 0 THEN 'Media Pustaka Utama'
        WHEN 1 THEN 'Gema Ilmu Publishing'
        WHEN 2 THEN 'Cahaya Aksara'
        WHEN 3 THEN 'PT. Gramedia Cipta'
        WHEN 4 THEN 'Bintang Fajar Mandiri'
        WHEN 5 THEN 'Penerbit Kompas Jaya'
        WHEN 6 THEN 'Erlangga Sakti'
        WHEN 7 THEN 'Deepublish Nusantara'
        WHEN 8 THEN 'Indie Book Corner'
        WHEN 9 THEN 'Penerbit Salemba'
        ELSE 'Penerbit Random'
    END || ' Group ' || ((i - 301) / 10 + 1) AS nama_penerbit,

    CASE (i - 301) % 5
        WHEN 0 THEN 'Jl. Anggrek No. ' || (i * 2) || ', Jakarta Pusat'
        WHEN 1 THEN 'Komp. Ruko Blok C' || (i * 3) || ', Bandung Utara'
        WHEN 2 THEN 'Jl. Pelangi Utama No. ' || (i * 4) || ', Surabaya Timur'
        WHEN 3 THEN 'Gd. Graha Fajar Lantai ' || ((i - 300) % 7 + 1) || ', Medan Kota'
        ELSE 'Jl. Mawar No. ' || (i * 5) || ', Yogyakarta Selatan'
    END AS alamat_penerbit,

    '021-' || LPAD(((300 + i) * 1000 + i)::TEXT, 7, '0') AS no_telepon_penerbit
FROM
    generate_series(301, 400) AS t(i);