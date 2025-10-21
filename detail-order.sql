INSERT INTO detail_order (id_order, id_buku, jumlah_item, total_harga)
SELECT
    i AS id_order,

    (1000000000 + (FLOOR(RANDOM() * 10000) + 1))::BIGINT AS id_buku,
    
    (i % 5) + 1 AS jumlah_item,
    
    0.00 AS total_harga
FROM
    generate_series(1, 10000) AS t(i);


Menjumlahkan total harga

UPDATE detail_order
SET total_harga = b.harga * detail_order.jumlah_ite
FROM buku b
WHERE detail_order.id_buku = b.id_buku;