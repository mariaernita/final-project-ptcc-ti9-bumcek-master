-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2018 at 09:14 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `kodeanggota` varchar(5) NOT NULL,
  `namaanggota` varchar(50) DEFAULT NULL,
  `jeniskelamin` varchar(15) DEFAULT NULL,
  `alamatanggota` varchar(60) DEFAULT NULL,
  `telpanggota` varchar(15) DEFAULT NULL,
  `tempatlahir` varchar(20) DEFAULT NULL,
  `tanggallahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `kodebuku` varchar(5) NOT NULL,
  `judulbuku` varchar(70) DEFAULT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `kodepenulis` varchar(3) DEFAULT NULL,
  `kodepenerbit` varchar(3) DEFAULT NULL,
  `kodekategori` varchar(2) DEFAULT NULL,
  `tglterbit` date DEFAULT NULL,
  `jlhhalaman` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detiltransaksi`
--

CREATE TABLE `tb_detiltransaksi` (
  `kodetransaksi` varchar(5) DEFAULT NULL,
  `kodebuku` varchar(5) DEFAULT NULL,
  `tglpinjam` date DEFAULT NULL,
  `tglkembali` date DEFAULT NULL,
  `jumlahbuku` int(2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kodekategori` varchar(2) NOT NULL,
  `namakategori` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mastertransaksi`
--

CREATE TABLE `tb_mastertransaksi` (
  `kodetraksaksi` varchar(5) NOT NULL,
  `tgltransaksi` date DEFAULT NULL,
  `kodeanggota` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `kodepenerbit` varchar(3) NOT NULL,
  `namapenerbit` varchar(50) DEFAULT NULL,
  `alamatpenerbit` varchar(60) DEFAULT NULL,
  `telppenerbit` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penulis`
--

CREATE TABLE `tb_penulis` (
  `kodepenulis` varchar(3) NOT NULL,
  `namapenulis` varchar(50) DEFAULT NULL,
  `alamatpenulis` varchar(60) DEFAULT NULL,
  `telppenulis` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`kodeanggota`);

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`kodebuku`),
  ADD KEY `kodepenulis` (`kodepenulis`),
  ADD KEY `kodepenerbit` (`kodepenerbit`),
  ADD KEY `kodekategori` (`kodekategori`);

--
-- Indexes for table `tb_detiltransaksi`
--
ALTER TABLE `tb_detiltransaksi`
  ADD KEY `kodetransaksi` (`kodetransaksi`),
  ADD KEY `kodebuku` (`kodebuku`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kodekategori`);

--
-- Indexes for table `tb_mastertransaksi`
--
ALTER TABLE `tb_mastertransaksi`
  ADD PRIMARY KEY (`kodetraksaksi`),
  ADD KEY `kodeanggota` (`kodeanggota`);

--
-- Indexes for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`kodepenerbit`);

--
-- Indexes for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  ADD PRIMARY KEY (`kodepenulis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`kodepenulis`) REFERENCES `tb_penulis` (`kodepenulis`),
  ADD CONSTRAINT `tb_buku_ibfk_2` FOREIGN KEY (`kodepenerbit`) REFERENCES `tb_penerbit` (`kodepenerbit`),
  ADD CONSTRAINT `tb_buku_ibfk_3` FOREIGN KEY (`kodekategori`) REFERENCES `tb_kategori` (`kodekategori`);

--
-- Constraints for table `tb_detiltransaksi`
--
ALTER TABLE `tb_detiltransaksi`
  ADD CONSTRAINT `tb_detiltransaksi_ibfk_1` FOREIGN KEY (`kodetransaksi`) REFERENCES `tb_mastertransaksi` (`kodetraksaksi`),
  ADD CONSTRAINT `tb_detiltransaksi_ibfk_2` FOREIGN KEY (`kodebuku`) REFERENCES `tb_buku` (`kodebuku`);

--
-- Constraints for table `tb_mastertransaksi`
--
ALTER TABLE `tb_mastertransaksi`
  ADD CONSTRAINT `tb_mastertransaksi_ibfk_1` FOREIGN KEY (`kodeanggota`) REFERENCES `tb_anggota` (`kodeanggota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
