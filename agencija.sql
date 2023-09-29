-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2023 at 01:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agencija`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinacija`
--

CREATE TABLE `destinacija` (
  `id_destinacije` int(11) NOT NULL,
  `NazivDestinacije` varchar(30) NOT NULL,
  `id_drzave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinacija`
--

INSERT INTO `destinacija` (`id_destinacije`, `NazivDestinacije`, `id_drzave`) VALUES
(2, 'Kopaonik', 1),
(3, 'Budva', 2),
(4, 'Bec', 3);

-- --------------------------------------------------------

--
-- Table structure for table `drzava`
--

CREATE TABLE `drzava` (
  `id_drzave` int(11) NOT NULL,
  `NazivDrzave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drzava`
--

INSERT INTO `drzava` (`id_drzave`, `NazivDrzave`) VALUES
(1, 'Srbija'),
(2, 'Crna Gora'),
(3, 'Austrija'),
(4, 'Hrvatska'),
(5, 'Holandija');

-- --------------------------------------------------------

--
-- Table structure for table `klijent`
--

CREATE TABLE `klijent` (
  `ID_Klijenta` int(11) NOT NULL,
  `Ime` varchar(50) NOT NULL,
  `Prezime` varchar(50) NOT NULL,
  `Kontakt` varchar(50) NOT NULL,
  `DatumRodjenja` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Sifra` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `Uloga` set('admin','Klijent','Urednik','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klijent`
--

INSERT INTO `klijent` (`ID_Klijenta`, `Ime`, `Prezime`, `Kontakt`, `DatumRodjenja`, `Email`, `Sifra`, `UserName`, `Uloga`) VALUES
(1, 'Vukasin', 'Petrovic', '069770799', '01/08/2000', 'vukisha.business@gmail.com', 'admin', 'admin', 'admin'),
(2, 'Klijent', 'klijent', '11111', '01012000', 'klijent@gmail.com', '123', '123', 'Klijent'),
(7, 'petar', 'petrovic', '11111111', '111', 'petar@gmail.coms', '1234', 'Perica', 'Urednik'),
(10, 'Petar', 'Petrovic', '11111', '01012000', 'vukisha.business@gmail.com', '12345', '111', 'Klijent');

-- --------------------------------------------------------

--
-- Table structure for table `mesto`
--

CREATE TABLE `mesto` (
  `id_mesta` int(11) NOT NULL,
  `Adresa` varchar(30) NOT NULL,
  `NazivMesta` varchar(50) NOT NULL,
  `Cena` int(11) NOT NULL,
  `Datum` varchar(60) NOT NULL,
  `id_destinacije` int(11) NOT NULL,
  `Slika1` blob DEFAULT NULL,
  `Slika2` blob DEFAULT NULL,
  `Slika3` blob DEFAULT NULL,
  `Slika4` blob DEFAULT NULL,
  `Slika5` blob DEFAULT NULL,
  `Slika6` blob DEFAULT NULL,
  `Slika7` blob DEFAULT NULL,
  `Slika8` blob DEFAULT NULL,
  `Slika9` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mesto`
--

INSERT INTO `mesto` (`id_mesta`, `Adresa`, `NazivMesta`, `Cena`, `Datum`, `id_destinacije`, `Slika1`, `Slika2`, `Slika3`, `Slika4`, `Slika5`, `Slika6`, `Slika7`, `Slika8`, `Slika9`) VALUES
(6, 'Milos Milanovic22', 'Hotelcic', 1111, '10/20/2000', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Milos Milanovic2222', 'Hotelcic123', 1111, '10/20/2000', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `id_rezervacije` int(12) NOT NULL,
  `id_klijenta` int(12) NOT NULL,
  `id_mesta` int(12) NOT NULL,
  `id_destinacije` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`id_rezervacije`, `id_klijenta`, `id_mesta`, `id_destinacije`) VALUES
(1, 10, 6, 2),
(2, 10, 6, 2),
(3, 10, 6, 2),
(4, 10, 6, 2),
(5, 10, 6, 2),
(6, 10, 6, 2),
(7, 10, 6, 2),
(8, 10, 6, 2),
(9, 10, 6, 2),
(10, 10, 6, 2),
(11, 10, 6, 2),
(12, 10, 6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinacija`
--
ALTER TABLE `destinacija`
  ADD PRIMARY KEY (`id_destinacije`),
  ADD KEY `id_drzave` (`id_drzave`);

--
-- Indexes for table `drzava`
--
ALTER TABLE `drzava`
  ADD PRIMARY KEY (`id_drzave`),
  ADD UNIQUE KEY `id_drzave` (`id_drzave`);

--
-- Indexes for table `klijent`
--
ALTER TABLE `klijent`
  ADD PRIMARY KEY (`ID_Klijenta`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesta`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`id_rezervacije`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinacija`
--
ALTER TABLE `destinacija`
  MODIFY `id_destinacije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drzava`
--
ALTER TABLE `drzava`
  MODIFY `id_drzave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `klijent`
--
ALTER TABLE `klijent`
  MODIFY `ID_Klijenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `id_rezervacije` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
