-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2024 pada 10.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pariwisata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_alunalun`
--

CREATE TABLE `tb_alunalun` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(50) NOT NULL,
  `no_telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_alunalun`
--

INSERT INTO `tb_alunalun` (`gambar`, `nama`, `lokasi`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('alun-alun.jpg', 'Alun-Alun Kota Bojonegoro', 'Kauman, Kec. Bojonegoro, Kabupaten Bojonegoro,Jawa Timur 62113', '-', 'Buka 24 Jam', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bendungangerak`
--

CREATE TABLE `tb_bendungangerak` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_bendungangerak`
--

INSERT INTO `tb_bendungangerak` (`gambar`, `nama`, `alamat`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('bendungan_gerak.jpg', 'Bendungan Gerak', 'Padang, Kec. Trucuk, Kabupaten Bojonegoro, Jawa Timur 62155', 'Rp. 11000/orang', 'Buka 24 Jam', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kayanganapi`
--

CREATE TABLE `tb_kayanganapi` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kayanganapi`
--

INSERT INTO `tb_kayanganapi` (`gambar`, `nama`, `alamat`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('kayangan_api.jpg', 'Kayangan Api', 'Ngembul, Sendangharjo, Kec. Ngasem, Kabupaten Bojonegoro, Jawa Timur 62171', 'Rp. 8.500/orang', 'Buka 24 Jam', '085891163576');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kebunbelimbing`
--

CREATE TABLE `tb_kebunbelimbing` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kebunbelimbing`
--

INSERT INTO `tb_kebunbelimbing` (`gambar`, `nama`, `alamat`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('kebun_belimbing.jpg', 'Kebun Belimbing', 'Ngringinrejo, Kec. Kalitidu, Kabupaten Bojonegoro 62152', 'Rp. 10000/orang', '07.00 - 17.00', '082139023555');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_list`
--

CREATE TABLE `tb_list` (
  `id` int(10) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_list`
--

INSERT INTO `tb_list` (`id`, `gambar`, `nama`, `alamat`) VALUES
(1, 'kayangan_api.jpg', 'Kayangan Api', 'Ngembul, Sendangharjo, Kec. Ngasem, Kabupaten Bojonegoro, Jawa Timur 62171'),
(2, 'alun-alun.jpg', 'Alun-alun', 'Kauman, Kec. Bojonegoro, Kabupaten Bojonegoro,Jawa Timur 62113'),
(3, 'taman_rajekwesi.jpg', 'Taman Rajekwesi', 'Jl. Rajekwesi, Jetak, Kec. Bojonegoro, Kabupaten Bojonegoro, Jawa Timur 62115\r\n'),
(4, 'negri_atasangin.jpg', 'Negeri Atas Angin', 'Deling, Kec. Sekar, Kabupaten Bojonegoro, Jawa Timur 62167'),
(5, 'bendungan_gerak.jpg', 'Bendungan Gerak', 'Padang, Kec. Trucuk, Kabupaten Bojonegoro, Jawa Timur 62155\r\n'),
(6, 'kebun_belimbing.jpg', 'Kebun Belimbing', 'Ngringinrejo, Kec. Kalitidu, Kabupaten Bojonegoro 62152');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login`
--

CREATE TABLE `tb_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_login`
--

INSERT INTO `tb_login` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_negriatasangin`
--

CREATE TABLE `tb_negriatasangin` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_negriatasangin`
--

INSERT INTO `tb_negriatasangin` (`gambar`, `nama`, `alamat`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('negri_atasangin.jpg', 'Negeri Atas Angin', 'Deling, Kec. Sekar, Kabupaten Bojonegoro, Jawa Timur 62167', 'Rp. 6000/orang', '07.30 - 23.00', '085850431308');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tamanrajekwesi`
--

CREATE TABLE `tb_tamanrajekwesi` (
  `gambar` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `harga_tiket` varchar(100) NOT NULL,
  `jam_buka` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_tamanrajekwesi`
--

INSERT INTO `tb_tamanrajekwesi` (`gambar`, `nama`, `alamat`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
('taman_rajekwesi.jpg', 'Taman Rajekwesi', 'Jl. Rajekwesi, Jetak, Kec. Bojonegoro, Kabupaten Bojonegoro, Jawa Timur 62115', 'Rp. 20000/orang', '08.00 - 22.00', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasanalunalun`
--

CREATE TABLE `tb_ulasanalunalun` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasanalunalun`
--

INSERT INTO `tb_ulasanalunalun` (`id`, `nama`, `komentar`) VALUES
(1, 'Lalapi', 'Tempatnya adem, banyak jajanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasanatasangin`
--

CREATE TABLE `tb_ulasanatasangin` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasanatasangin`
--

INSERT INTO `tb_ulasanatasangin` (`id`, `nama`, `komentar`) VALUES
(1, 'Lili', 'Tempatnya asri dan indah ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasanbendungan`
--

CREATE TABLE `tb_ulasanbendungan` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasanbendungan`
--

INSERT INTO `tb_ulasanbendungan` (`id`, `nama`, `komentar`) VALUES
(1, 'Lola', 'Tempatnya indah dan menakjubkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasankayanganapi`
--

CREATE TABLE `tb_ulasankayanganapi` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasankayanganapi`
--

INSERT INTO `tb_ulasankayanganapi` (`id`, `nama`, `komentar`) VALUES
(1, 'Lalapo', 'Tempatnya asri, bersih dan nyaman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasankebunbelimbing`
--

CREATE TABLE `tb_ulasankebunbelimbing` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasankebunbelimbing`
--

INSERT INTO `tb_ulasankebunbelimbing` (`id`, `nama`, `komentar`) VALUES
(1, 'Loli', 'Tempatnya asri serta menyenangkan karena dapat menikmati keindahan alam dan menikmati buah belimbing');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ulasanrajekwesi`
--

CREATE TABLE `tb_ulasanrajekwesi` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `komentar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ulasanrajekwesi`
--

INSERT INTO `tb_ulasanrajekwesi` (`id`, `nama`, `komentar`) VALUES
(1, 'Miya', 'Tempatnya seru banyak jajanan dan permainan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(11) NOT NULL,
  `wisata_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulasan`
--

INSERT INTO `ulasan` (`id`, `wisata_id`, `username`, `rating`, `review`, `created_at`) VALUES
(1, 1, 'testuser', 5, 'Great place to visit!', '2024-06-13 04:12:42'),
(5, 2, 'admin', 6, 'jhfkf', '2024-06-13 04:43:44'),
(9, 1, 'admin', 3, 'ndbdndb', '2024-06-13 05:04:17'),
(11, 6, 'admin', 4, 'tthg', '2024-06-13 05:14:09'),
(12, 5, 'admin', 5, 'bbbb', '2024-06-13 05:16:02'),
(13, 2, 'admin', 3, 'ghjj', '2024-06-13 05:26:25'),
(14, 1, 'admin', 3, 'heh', '2024-06-13 05:27:12'),
(15, 2, 'admin', 5, 'cantik', '2024-06-13 06:37:18'),
(16, 5, 'admin', 4, 'cantik', '2024-06-13 06:40:01'),
(17, 3, 'admin', 4, 'bersih', '2024-06-13 07:47:02'),
(18, 4, 'admin', 5, 'keren', '2024-06-13 07:47:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `page` varchar(255) NOT NULL,
  `harga_tiket` varchar(255) DEFAULT NULL,
  `jam_buka` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `wisata`
--

INSERT INTO `wisata` (`id`, `image`, `name`, `location`, `page`, `harga_tiket`, `jam_buka`, `no_telepon`) VALUES
(1, 'images/kayangan_api.jpg', 'Kayangan Api', 'Sendangharjo, Kec. Ngasem', 'KayanganApi', 'Gratis', 'Buka 24 Jam', '-'),
(2, 'images/alun-alun.jpg', 'Alun-alun', 'Kauman, Kec. Bojonegoro', 'AlunAlun', 'Gratis', 'Buka 24 Jam', '-'),
(3, 'images/taman_rajekwesi.jpg', 'Taman Rajekwesi', 'Jetak, Kec. Bojonegoro', 'TamanRajekwesi', 'Rp 5.000', '08:00 - 21:00', '-'),
(4, 'images/negri_atasangin.jpg', 'Negeri Atas Angin', 'Deling, Kec. Sekar', 'NegriAtasangin', 'Rp 10.000', '06:00 - 18:00', '-'),
(5, 'images/bendungan_gerak.jpg', 'Bendungan Gerak', 'Padang, Kec. Trucuk', 'BendunganGerak', 'Gratis', 'Buka 24 Jam', '-'),
(6, 'images/kebun_belimbing.jpg', 'Kebun Belimbing', 'Kedungsari, Kec. Temayang', 'KebunBelimbing', 'Rp 5.000', '08:00 - 17:00', '-');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_alunalun`
--
ALTER TABLE `tb_alunalun`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_bendungangerak`
--
ALTER TABLE `tb_bendungangerak`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_kayanganapi`
--
ALTER TABLE `tb_kayanganapi`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_kebunbelimbing`
--
ALTER TABLE `tb_kebunbelimbing`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_list`
--
ALTER TABLE `tb_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tb_negriatasangin`
--
ALTER TABLE `tb_negriatasangin`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_tamanrajekwesi`
--
ALTER TABLE `tb_tamanrajekwesi`
  ADD PRIMARY KEY (`gambar`);

--
-- Indeks untuk tabel `tb_ulasanalunalun`
--
ALTER TABLE `tb_ulasanalunalun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ulasanatasangin`
--
ALTER TABLE `tb_ulasanatasangin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ulasanbendungan`
--
ALTER TABLE `tb_ulasanbendungan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ulasankayanganapi`
--
ALTER TABLE `tb_ulasankayanganapi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ulasankebunbelimbing`
--
ALTER TABLE `tb_ulasankebunbelimbing`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ulasanrajekwesi`
--
ALTER TABLE `tb_ulasanrajekwesi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wisata_id` (`wisata_id`);

--
-- Indeks untuk tabel `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`wisata_id`) REFERENCES `wisata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
