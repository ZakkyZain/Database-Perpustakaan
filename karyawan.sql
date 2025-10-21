INSERT INTO karyawan (id_karyawan, nama_karyawan, password, email_karyawan, alamat_karyawan, no_telepon_karyawan, id_gudang)
SELECT

    i AS id_karyawan,

  
    CASE (i - 501) % 10
        WHEN 0 THEN 'Siti'
        WHEN 1 THEN 'Rudi'
        WHEN 2 THEN 'Diana'
        WHEN 3 THEN 'Herman'
        WHEN 4 THEN 'Laras'
        WHEN 5 THEN 'Wahyu'
        WHEN 6 THEN 'Fira'
        WHEN 7 THEN 'Andre'
        WHEN 8 THEN 'Nisa'
        WHEN 9 THEN 'Bambang'
    END || ' ' ||

    CASE ((i - 501) / 2) % 10
        WHEN 0 THEN 'Wijaya'
        WHEN 1 THEN 'Susanto'
        WHEN 2 THEN 'Hadi'
        WHEN 3 THEN 'Nugroho'
        WHEN 4 THEN 'Lestari'
        WHEN 5 THEN 'Utama'
        WHEN 6 THEN 'Saputra'
        WHEN 7 THEN 'Dewi'
        WHEN 8 THEN 'Kusumo'
        WHEN 9 THEN 'Sihombing'
    END AS nama_karyawan,

    'karyawan' || RIGHT(i::TEXT, 4) AS password,

    (i)::TEXT || '@bukustore.com' AS email_karyawan,

 
    CASE (i - 501) % 5
        WHEN 0 THEN 'Jl. Merdeka No. ' || (i % 50) || ', Jakarta Pusat'
        WHEN 1 THEN 'Perumahan Sentosa Blok ' || (i % 100) || ', Bandung'
        WHEN 2 THEN 'Gg. Kemangi No. ' || (i % 25) || ', Surabaya'
        WHEN 3 THEN 'Apartemen Seroja Lt. ' || (i % 30) || ', Medan'
        ELSE 'Jl. Rajawali Kav. ' || (i % 75) || ', Yogyakarta'
    END AS alamat_karyawan,

    '081' || LPAD(((i * 765) % 1000000000)::TEXT, 10, '0') AS no_telepon_karyawan,

    101 + ((i - 501) % 10) AS id_gudang
FROM
    generate_series(501, 1500) AS t(i);