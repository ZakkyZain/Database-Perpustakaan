INSERT INTO ditulis (id_pengarang, id_buku)
SELECT
   
    401 + ((i - 1) % 1000) AS id_pengarang,

    (1000000000 + i)::BIGINT AS id_buku
FROM
    generate_series(1, 10000) AS t(i)
ORDER BY
    RANDOM(); 