-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 07. nov 2022 ob 16.03
-- Različica strežnika: 10.4.25-MariaDB
-- Različica PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `spletna_stran`
--

-- --------------------------------------------------------

--
-- Struktura tabele `gradivo`
--

CREATE TABLE `gradivo` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `file` blob NOT NULL,
  `Predmet` int(11) NOT NULL,
  `Navodila` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `gradivo`
--

INSERT INTO `gradivo` (`id`, `date`, `file`, `Predmet`, `Navodila`) VALUES
(1, '0000-00-00', 0x53706c65746e61737472616e2e726172, 0, 0x77696e6578702e7a6970),
(2, '0000-00-00', 0x77696e7261722d7836342d3631312e657865, 0, 0x53706c65746e61737472616e2e726172),
(3, '0000-00-00', 0x77696e7261722d7836342d3631312e657865, 0, 0x53706c65746e61737472616e2e726172),
(4, '2022-11-09', 0x53706c65746e61737472616e2e726172, 0, 0x77696e6578702e7a6970);

-- --------------------------------------------------------

--
-- Struktura tabele `izostanki`
--

CREATE TABLE `izostanki` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `datum` date NOT NULL,
  `letnik` int(8) NOT NULL,
  `Razred` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `izostanki`
--

INSERT INTO `izostanki` (`id`, `name`, `datum`, `letnik`, `Razred`) VALUES
(4, 'Črni cerak', '2022-11-08', 2, 'R4A');

-- --------------------------------------------------------

--
-- Struktura tabele `ocene`
--

CREATE TABLE `ocene` (
  `id` int(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `Razred` varchar(3) DEFAULT NULL,
  `predmet` varchar(3) DEFAULT NULL,
  `ocena` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `ocene`
--

INSERT INTO `ocene` (`id`, `name`, `datum`, `Razred`, `predmet`, `ocena`) VALUES
(1, 'Aleks Maršnak', '2022-11-05', 'R4A', 'SLO', 2),
(2, 'Aleks Maršnak', '2022-11-05', 'R4A', 'SLO', 2);

-- --------------------------------------------------------

--
-- Struktura tabele `razredi`
--

CREATE TABLE `razredi` (
  `Id_Razreda` int(100) NOT NULL,
  `Razred` varchar(3) NOT NULL,
  `Razrednik` varchar(25) NOT NULL,
  `Letnik` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `razredi`
--

INSERT INTO `razredi` (`Id_Razreda`, `Razred`, `Razrednik`, `Letnik`) VALUES
(1, 'R1A', 'Boštjan Lubej', '2022-09-01'),
(2, 'R2A', 'Boštjan Resinović', '2021-09-01'),
(5, 'R3A', 'Tkalec DZareja', '2020-09-01'),
(6, 'R4A', 'Matic Holobar', '2019-09-01');

-- --------------------------------------------------------

--
-- Struktura tabele `testi`
--

CREATE TABLE `testi` (
  `Id_Razreda` int(255) NOT NULL,
  `Ucitelj` varchar(30) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `Razred` varchar(3) DEFAULT NULL,
  `Predmet` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `testi`
--

INSERT INTO `testi` (`Id_Razreda`, `Ucitelj`, `datum`, `Razred`, `Predmet`) VALUES
(1, 'Čni Cerak', '2022-11-07', 'R3A', 'NIG'),
(14, 'Aleks M', '2022-11-12', 'R4A', 'NUP'),
(16, 'Aleks M', '2022-11-11', 'R4A', 'NUP');

-- --------------------------------------------------------

--
-- Struktura tabele `user_db`
--

CREATE TABLE `user_db` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `user_type` varchar(30) NOT NULL DEFAULT 'User',
  `id` int(255) NOT NULL,
  `Class` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `user_db`
--

INSERT INTO `user_db` (`name`, `email`, `password`, `user_type`, `id`, `Class`) VALUES
('NIGGA', 'NIGGA@GMAIL.COM', '12345678', 'user', 1, 'R1A'),
('Boštjan Lubej', '123@gmail.com', '12345678', 'admin', 2, ''),
('Črni cerak', 'crnicerak@gmail.com', '12345678', 'user', 3, 'R3A'),
('Boštjan Lubej', 'bl@gmail.com', '12345', 'Prof', 4, ''),
('Urban Levičar', 'urban@gmail.com', '12345', 'user', 5, 'R4A');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `gradivo`
--
ALTER TABLE `gradivo`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `izostanki`
--
ALTER TABLE `izostanki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `ocene`
--
ALTER TABLE `ocene`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `razredi`
--
ALTER TABLE `razredi`
  ADD PRIMARY KEY (`Id_Razreda`);

--
-- Indeksi tabele `testi`
--
ALTER TABLE `testi`
  ADD PRIMARY KEY (`Id_Razreda`);

--
-- Indeksi tabele `user_db`
--
ALTER TABLE `user_db`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `gradivo`
--
ALTER TABLE `gradivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `izostanki`
--
ALTER TABLE `izostanki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `ocene`
--
ALTER TABLE `ocene`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabele `razredi`
--
ALTER TABLE `razredi`
  MODIFY `Id_Razreda` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabele `testi`
--
ALTER TABLE `testi`
  MODIFY `Id_Razreda` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT tabele `user_db`
--
ALTER TABLE `user_db`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
