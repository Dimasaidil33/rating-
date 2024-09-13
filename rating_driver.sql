-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Sep 2024 pada 06.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rating_driver`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$ysEuR0rf/VrrN4KsMNfASe9obnKRAIMtorOM.pU6H6nlAUnZArJ4K'),
(2, 'admin', '$2y$10$xSKI3Mdpw5FsaI0XoNq3z.rBTcbIh0.li7M2WKXOMvv1yxawW0fwu'),
(3, 'admin', '$2y$10$yE5X4VdZsRSk6oKee2dW5ujZ0/02sNN/XzOQp.U.070nSr9V9.l1S'),
(4, 'admin', '$2y$10$nF8BawoufSTy/2TrMshUwO0h/uf6EYYEAXigEDgP6OBFCg1OrFbPm'),
(5, 'dimas', '$2y$10$AXQkJaj25dQHmXA4wcb8juXO.X3ym7Ej7/4gyyOYwC6fMilHn.LMC');

-- --------------------------------------------------------

--
-- Struktur dari tabel `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `plate_number`, `profile_picture`) VALUES
(4, 'HAYKAL SUTANTO', 'B 1234 DDD', NULL),
(5, 'Andre Pamungkas', 'D 1643 ZFD', NULL),
(6, 'Dimas Aidil Wibisono', 'B 9999 ACD', NULL),
(21, 'Budi budiman', 'D 6969 IED', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `comfort_rating` int(11) DEFAULT NULL,
  `cleanliness_rating` int(11) DEFAULT NULL,
  `service_rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ratings`
--

INSERT INTO `ratings` (`id`, `driver_id`, `rating`, `review`, `created_at`, `comfort_rating`, `cleanliness_rating`, `service_rating`, `comment`) VALUES
(20, 4, 5, NULL, '2024-09-11 06:33:47', 5, 5, 5, 'sangat nyaman'),
(21, 5, 4, NULL, '2024-09-11 06:34:17', 4, 3, 2, 'sangat tidak ramah '),
(22, 6, 5, NULL, '2024-09-11 06:34:30', 5, 5, 5, 'mantap'),
(23, 5, 5, NULL, '2024-09-11 08:49:46', 4, 5, 5, 'Mantap sekalii!!'),
(24, 4, 1, NULL, '2024-09-12 01:12:40', 1, 1, 1, 'sangat buruk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$v6sHT3UKTBOxd.w2.ZN1COhgA0yrtvjAcFPiGTudu9z9sVxb5YN62');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
