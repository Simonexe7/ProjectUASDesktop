-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2025 pada 08.42
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
-- Database: `db5520123098`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tconfig`
--

CREATE TABLE `tconfig` (
  `NoPo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tconfig`
--

INSERT INTO `tconfig` (`NoPo`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tdetailproduk`
--

CREATE TABLE `tdetailproduk` (
  `ItemID` int(11) NOT NULL,
  `kodesupplier` int(11) NOT NULL,
  `kodeproduk` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Disc` double NOT NULL,
  `CostPrice` int(11) NOT NULL,
  `instock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tdetailproduk`
--

INSERT INTO `tdetailproduk` (`ItemID`, `kodesupplier`, `kodeproduk`, `Price`, `Disc`, `CostPrice`, `instock`) VALUES
(6, 1, 10, 125000, 15, 106250, 100),
(8, 3, 12, 25000, 15, 21250, 85);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmasterid`
--

CREATE TABLE `tmasterid` (
  `ItemID` int(11) NOT NULL,
  `NamaProduk` varchar(45) NOT NULL,
  `Price` int(11) NOT NULL,
  `TotalStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tmasterid`
--

INSERT INTO `tmasterid` (`ItemID`, `NamaProduk`, `Price`, `TotalStock`) VALUES
(10, 'Mouser', 125000, 150),
(12, 'Spidol', 25000, 120);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpurchasingorder`
--

CREATE TABLE `tpurchasingorder` (
  `NoPo` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `kodesupplier` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Disc` double NOT NULL,
  `CostPrice` int(11) NOT NULL,
  `QtyPo` int(11) NOT NULL,
  `QtyTrm` int(11) NOT NULL,
  `flag` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tpurchasingorder`
--

INSERT INTO `tpurchasingorder` (`NoPo`, `itemID`, `kodesupplier`, `Price`, `Disc`, `CostPrice`, `QtyPo`, `QtyTrm`, `flag`) VALUES
(1, 10, 1, 125000, 15, 106250, 2748, 2748, '$'),
(7, 10, 1, 125000, 15, 106250, 22, 22, '$'),
(8, 12, 3, 25000, 15, 21250, 30, 30, '$');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tsupplier`
--

CREATE TABLE `tsupplier` (
  `kodesupplier` int(11) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `PIC` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `NamaSupplier` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tsupplier`
--

INSERT INTO `tsupplier` (`kodesupplier`, `Alamat`, `PIC`, `NamaSupplier`) VALUES
(1, 'Jln. Sindangasih No. 251', 'Madun', 'PT. Adikarta'),
(3, 'Jln. Soekarno-Hatta No. 523', 'Hamudin', 'PT Mekar Jaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tuser`
--

CREATE TABLE `tuser` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `namauser` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tuser`
--

INSERT INTO `tuser` (`id`, `username`, `password`, `namauser`) VALUES
(1, 'admin', '12345', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tconfig`
--
ALTER TABLE `tconfig`
  ADD PRIMARY KEY (`NoPo`);

--
-- Indeks untuk tabel `tdetailproduk`
--
ALTER TABLE `tdetailproduk`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `kodesupplier` (`kodesupplier`),
  ADD KEY `kodeproduk` (`kodeproduk`);

--
-- Indeks untuk tabel `tmasterid`
--
ALTER TABLE `tmasterid`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indeks untuk tabel `tpurchasingorder`
--
ALTER TABLE `tpurchasingorder`
  ADD PRIMARY KEY (`NoPo`),
  ADD KEY `itemID` (`itemID`);

--
-- Indeks untuk tabel `tsupplier`
--
ALTER TABLE `tsupplier`
  ADD PRIMARY KEY (`kodesupplier`);

--
-- Indeks untuk tabel `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tdetailproduk`
--
ALTER TABLE `tdetailproduk`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tmasterid`
--
ALTER TABLE `tmasterid`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tpurchasingorder`
--
ALTER TABLE `tpurchasingorder`
  MODIFY `NoPo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tsupplier`
--
ALTER TABLE `tsupplier`
  MODIFY `kodesupplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tuser`
--
ALTER TABLE `tuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tdetailproduk`
--
ALTER TABLE `tdetailproduk`
  ADD CONSTRAINT `tdetailproduk_ibfk_1` FOREIGN KEY (`kodesupplier`) REFERENCES `tsupplier` (`kodesupplier`),
  ADD CONSTRAINT `tdetailproduk_ibfk_2` FOREIGN KEY (`kodeproduk`) REFERENCES `tmasterid` (`ItemID`);

--
-- Ketidakleluasaan untuk tabel `tpurchasingorder`
--
ALTER TABLE `tpurchasingorder`
  ADD CONSTRAINT `tpurchasingorder_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `tdetailproduk` (`kodeproduk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
