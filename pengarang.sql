INSERT INTO pengarang (id_pengarang, nama_pengarang, no_telepon_pengarang, alamat_pengarang)
SELECT

    i AS id_pengarang,

    CASE (i - 401) % 20
        WHEN 0 THEN 'Ahmad'
        WHEN 1 THEN 'Budi'
        WHEN 2 THEN 'Citra'
        WHEN 3 THEN 'Dewi'
        WHEN 4 THEN 'Eko'
        WHEN 5 THEN 'Fajri'
        WHEN 6 THEN 'Gilang'
        WHEN 7 THEN 'Hana'
        WHEN 8 THEN 'Irfan'
        WHEN 9 THEN 'Joko'
        WHEN 10 THEN 'Kartika'
        WHEN 11 THEN 'Lina'
        WHEN 12 THEN 'Maya'
        WHEN 13 THEN 'Nugroho'
        WHEN 14 THEN 'Putri'
        WHEN 15 THEN 'Rizky'
        WHEN 16 THEN 'Sari'
        WHEN 17 THEN 'Taufik'
        WHEN 18 THEN 'Uswatun'
        WHEN 19 THEN 'Vino'
    END || ' ' ||
    CASE ((i - 401) / 5) % 20 
        WHEN 0 THEN 'Setiawan'
        WHEN 1 THEN 'Wijaya'
        WHEN 2 THEN 'Pramono'
        WHEN 3 THEN 'Kusuma'
        WHEN 4 THEN 'Hartono'
        WHEN 5 THEN 'Santoso'
        WHEN 6 THEN 'Rahman'
        WHEN 7 THEN 'Fitri'
        WHEN 8 THEN 'Gunawan'
        WHEN 9 THEN 'Lestari'
        WHEN 10 THEN 'Anwar'
        WHEN 11 THEN 'Suharto'
        WHEN 12 THEN 'Maulana'
        WHEN 13 THEN 'Aditya'
        WHEN 14 THEN 'Pratama'
        WHEN 15 THEN 'Jaya'
        WHEN 16 THEN 'Sutrisno'
        WHEN 17 THEN 'Ningsih'
        WHEN 18 THEN 'Hakim'
        WHEN 19 THEN 'Purnomo'
    END AS nama_pengarang,

    '08' || LPAD(((i * 987) % 1000000000)::TEXT, 10, '0') AS no_telepon_pengarang,

    CASE (i - 401) % 4
        WHEN 0 THEN 'Jl. Melati Blok ' || (i % 100) || ', Kota Jakarta'
        WHEN 1 THEN 'Komp. Perumahan Indah Kav. ' || (i % 150) || ', Kota Bandung'
        WHEN 2 THEN 'Dusun Sejahtera No. ' || (i % 200) || ', Kota Yogyakarta'
        ELSE 'Apartemen Emerald Tower Lt.' || (i % 30) || ', Kota Surabaya'
    END AS alamat_pengarang
FROM
    generate_series(401, 1400) AS t(i);