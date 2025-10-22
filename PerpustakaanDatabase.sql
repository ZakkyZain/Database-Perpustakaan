CREATE TABLE gudang (
    id_gudang INTEGER PRIMARY KEY,
    alamat_gudang TEXT,
    no_telepon_gudang CHARACTER VARYING
);

CREATE TABLE kategori (
    id_kategori INTEGER PRIMARY KEY,
    jenis CHARACTER VARYING(50) NOT NULL
);

CREATE TABLE pengarang (
    id_pengarang INTEGER PRIMARY KEY,
    nama_pengarang CHARACTER VARYING(100) NOT NULL,
    no_telepon_pengarang CHARACTER VARYING,
    alamat_pengarang TEXT
);

CREATE TABLE penerbit (
    id_penerbit INTEGER PRIMARY KEY,
    nama_penerbit CHARACTER VARYING(100) NOT NULL UNIQUE, 
    alamat_penerbit TEXT,
    no_telepon_penerbit CHARACTER VARYING
);

CREATE TABLE karyawan (
    id_karyawan INTEGER PRIMARY KEY,
    nama_karyawan CHARACTER VARYING(100) NOT NULL,
    password CHARACTER VARYING(100) NOT NULL,
    email_karyawan CHARACTER VARYING(100) NOT NULL UNIQUE,
    alamat_karyawan TEXT,
    no_telepon_karyawan CHARACTER VARYING,
    id_gudang INTEGER,
    CONSTRAINT fk_karyawan_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

CREATE TABLE pelanggan (
    id_pelanggan INTEGER PRIMARY KEY,
    nama_pelanggan CHARACTER VARYING(100) NOT NULL,
    email CHARACTER VARYING(100) NOT NULL UNIQUE,
    no_telepon_pelanggan CHARACTER VARYING,
    alamat_pelanggan TEXT,
    id_karyawan INTEGER, 
    CONSTRAINT fk_pelanggan_karyawan FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE buku (
    id_buku BIGINT PRIMARY KEY, 
    judul_buku CHARACTER VARYING(200) NOT NULL,
    tahun INTEGER,
    harga NUMERIC(12, 2) NOT NULL,
    stok INTEGER NOT NULL,
    id_penerbit INTEGER,
    id_kategori INTEGER,
    id_gudang INTEGER,
    CONSTRAINT fk_buku_penerbit FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit),
    CONSTRAINT fk_buku_kategori FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori),
    CONSTRAINT fk_buku_gudang FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

CREATE TABLE "Order" (
    id_order INTEGER PRIMARY KEY,
    id_pelanggan INTEGER,
    id_karyawan INTEGER,
    tanggal_order DATE NOT NULL,
    metode_pembayaran CHARACTER VARYING(50),
    CONSTRAINT fk_order_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    CONSTRAINT fk_order_karyawan FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE ditulis (
    id_buku BIGINT,
    id_pengarang INTEGER,
    PRIMARY KEY (id_buku, id_pengarang),
    CONSTRAINT fk_ditulis_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku),
    CONSTRAINT fk_ditulis_pengarang FOREIGN KEY (id_pengarang) REFERENCES pengarang(id_pengarang)
);

CREATE TABLE detail_order (
    id_order INTEGER, 
    id_buku BIGINT,
    jumlah_item INTEGER NOT NULL,
    total_harga NUMERIC(12, 2), 
    PRIMARY KEY (id_order, id_buku), 
    CONSTRAINT fk_detail_order_order FOREIGN KEY (id_order) REFERENCES "Order"(id_order),
    CONSTRAINT fk_detail_order_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);
