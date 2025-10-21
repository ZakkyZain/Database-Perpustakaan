INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, no_telepon_pelanggan, alamat_pelanggan, id_karyawan)
SELECT
    -- 1. Kolom Utama
    t1.id_pelanggan,
    t1.nama_depan || ' ' || t1.nama_belakang AS nama_pelanggan,
    
    -- 2. Email (Pola: nama.depan.ID_PELANGGAN@mailstoreku.com, dijamin unik)
    LOWER(REPLACE(t1.nama_depan, ' ', '.')) || '.' ||
    t1.id_pelanggan::TEXT || '@gmail.com' AS email,
    
    -- 3. Kolom Lain
    '085' || LPAD(((t1.id_pelanggan * 543) % 1000000000)::TEXT, 10, '0') AS no_telepon_pelanggan,

    CASE (t1.id_pelanggan - 10001) % 5
        WHEN 0 THEN 'Jl. Cempaka No. ' || (t1.id_pelanggan % 200) || ', Kota Jakarta'
        WHEN 1 THEN 'Perum. Pelita Blok ' || (t1.id_pelanggan % 500) || ', Kota Bandung'
        WHEN 2 THEN 'Gg. Dahlia RT ' || (t1.id_pelanggan % 100) || ', Kota Surabaya'
        WHEN 3 THEN 'Komp. Ruko Utama No. ' || (t1.id_pelanggan % 75) || ', Kota Medan'
        ELSE 'Jl. Mangga No. ' || (t1.id_pelanggan % 150) || ', Kota Yogyakarta'
    END AS alamat_pelanggan,

    -- FK: id_karyawan (Merujuk ke 1000 Karyawan: ID 501 - 1500)
    501 + ((t1.id_pelanggan - 10001) % 1000) AS id_karyawan
FROM
    (
        SELECT
            i AS id_pelanggan,
            (i - 10001) AS idx,

            -- Nama Depan (20 Variasi) - Berulang setiap 20 baris
            CASE (i - 10001) % 20
                WHEN 0 THEN 'Muhammad' WHEN 1 THEN 'Ayu' WHEN 2 THEN 'Rizki' WHEN 3 THEN 'Sarah'
                WHEN 4 THEN 'Faisal' WHEN 5 THEN 'Indah' WHEN 6 THEN 'Tegar' WHEN 7 THEN 'Lia'
                WHEN 8 THEN 'Dani' WHEN 9 THEN 'Santi' WHEN 10 THEN 'Kevin' WHEN 11 THEN 'Maria'
                WHEN 12 THEN 'Aditya' WHEN 13 THEN 'Dewi' WHEN 14 THEN 'Jaka' WHEN 15 THEN 'Rina'
                WHEN 16 THEN 'Yoga' WHEN 17 THEN 'Puspa' WHEN 18 THEN 'Hendra' WHEN 19 THEN 'Ratna'
            END AS nama_depan,

            -- Nama Belakang (20 Variasi) - Berulang setiap 5 baris
            CASE (i - 10001) % 5
                WHEN 0 THEN 'Hidayat' WHEN 1 THEN 'Puspita' WHEN 2 THEN 'Ramadhan' WHEN 3 THEN 'Utami'
                WHEN 4 THEN 'Siregar'
            END || ' ' ||
            CASE ((i - 10001) / 5) % 4
                WHEN 0 THEN 'Wijaya' WHEN 1 THEN 'Nurani' WHEN 2 THEN 'Santoso' WHEN 3 THEN 'Simanjuntak'
            END || ' ' ||
            CASE ((i - 10001) / 20) % 5
                WHEN 0 THEN 'Putra' WHEN 1 THEN 'Mulyani' WHEN 2 THEN 'Kusumo' WHEN 3 THEN 'Sari' WHEN 4 THEN 'Pratama'
            END AS nama_belakang
        FROM
            generate_series(10001, 20000) AS t2(i)
    ) AS t1;