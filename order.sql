INSERT INTO "Order" (id_order, id_pelanggan, id_karyawan, tanggal_order, metode_pembayaran)
SELECT

    i AS id_order,
    
    10000 + i AS id_pelanggan,

    501 + ((i - 1) % 1000) AS id_karyawan,

    ('2023-01-01'::DATE + (i % 700) * INTERVAL '1 day') AS tanggal_order,

    CASE i % 5
        WHEN 0 THEN 'Transfer Bank'
        WHEN 1 THEN 'E-Wallet'
        WHEN 2 THEN 'Kartu Kredit'
        WHEN 3 THEN 'COD'
        ELSE 'Virtual Account'
    END AS metode_pembayaran
FROM
    generate_series(1, 10000) AS t(i);