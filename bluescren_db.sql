-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 05 Feb 2021 pada 23.49
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `bluescren_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosa_pkr`
--

CREATE TABLE IF NOT EXISTS `diagnosa_pkr` (
  `kode_pkr` varchar(55) NOT NULL,
  `kode_gejala` varchar(55) DEFAULT NULL,
  `kode_kerusakan` varchar(55) DEFAULT NULL,
  `nilai_pkr` float NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`kode_pkr`),
  KEY `RELATION_FK2` (`kode_gejala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `diagnosa_pkr`
--

INSERT INTO `diagnosa_pkr` (`kode_pkr`, `kode_gejala`, `kode_kerusakan`, `nilai_pkr`, `id`) VALUES
('np001', 'g001', 'k001', 0.6, 1),
('np002', 'g002', 'k001', 0.8, 2),
('np003', 'g003', 'k001', 0.4, 3),
('np004', 'g004', 'k001', 0.9, 4),
('np005', 'g001', 'k002', 0.999, 5),
('np006', 'g002', 'k002', 0.999, 6),
('np007', 'g003', 'k002', 0.999, 7),
('np008', 'g004', 'k002', 0.999, 8),
('np009', 'g001', 'k003', 0.4, 9),
('np010', 'g002', 'k003', 0.7, 10),
('np011', 'g003', 'k003', 0.7, 11),
('np012', 'g004', 'k003', 0.6, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE IF NOT EXISTS `gejala` (
  `kode_gejala` varchar(55) NOT NULL,
  `kode_kerusakan` varchar(55) NOT NULL,
  `nm_gejala` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`kode_gejala`),
  KEY `RELATION_FK` (`kode_kerusakan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`kode_gejala`, `kode_kerusakan`, `nm_gejala`, `keterangan`) VALUES
('g001', 'k001', 'faktor keluarga', 'kurangnya perhatian'),
('g002', 'k001', 'pergaulan', 'pergaulan bebas'),
('g003', 'k001', 'faktor kenyamanan di sekolah', 'karna belum bayar uang sekolah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE IF NOT EXISTS `hasil` (
  `nilai_user` float NOT NULL,
  `nilai_pkr` float NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_hasil` varchar(55) NOT NULL,
  `kode_pkr` varchar(55) NOT NULL,
  `kode_user` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rule` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`nilai_user`, `nilai_pkr`, `id`, `kode_hasil`, `kode_pkr`, `kode_user`) VALUES
(0.8, 0.6, 1, 'g001', 'np001', 'nu001'),
(0.6, 0.8, 2, 'g002', 'np002', 'nu002'),
(0.8, 0.4, 3, 'g003', 'np003', 'nu003'),
(0.4, 0.9, 4, 'g004', 'np004', 'nu004'),
(0.999, 0.999, 5, 'g001', 'np005', 'nu005'),
(0.99, 0.999, 6, 'g002', 'np006', 'nu006'),
(0.999, 0.999, 7, 'g003', 'np007', 'nu007'),
(0.999, 0.999, 8, 'g004', 'np008', 'nu008'),
(0.6, 0.4, 9, 'g001', 'np009', 'nu009'),
(0.2, 0.7, 10, 'g002', 'np010', 'nu010'),
(0.8, 0.7, 11, 'g003', 'np011', 'nu011'),
(0.3, 0.6, 12, 'g004', 'np012', 'nu012');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kerusakan`
--

CREATE TABLE IF NOT EXISTS `kerusakan` (
  `kode_kerusakan` varchar(50) NOT NULL,
  `nama_kerusakan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`kode_kerusakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kerusakan`
--

INSERT INTO `kerusakan` (`kode_kerusakan`, `nama_kerusakan`, `keterangan`) VALUES
('k001', 'siswa bermasalah', 'anak bangsat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_user`
--

CREATE TABLE IF NOT EXISTS `kode_user` (
  `kode_user` varchar(55) NOT NULL,
  `kode_gejala` varchar(55) NOT NULL,
  `kode_kerusakan` varchar(55) NOT NULL,
  `nilai_user` float NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`kode_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kode_user`
--

INSERT INTO `kode_user` (`kode_user`, `kode_gejala`, `kode_kerusakan`, `nilai_user`, `id`) VALUES
('nu001', 'g001', 'k001', 0.8, 1),
('nu002', 'g002', 'k001', 0.6, 2),
('nu003', 'g003', 'k001', 0.8, 3),
('nu004', 'g004', 'k001', 0.4, 4),
('nu005', 'g001', 'k002', 0.999, 5),
('nu006', 'g002', 'k002', 0.99, 6),
('nu007', 'g003', 'k002', 0.999, 7),
('nu008', 'g004', 'k002', 0.999, 8),
('nu009', 'g001', 'k003', 0.6, 9),
('nu010', 'g002', 'k003', 0.2, 10),
('nu011', 'g003', 'k003', 0.8, 11),
('nu012', 'g004', 'k003', 0.4, 12);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD CONSTRAINT `FK_GEJALA_RELATION_KERUSAKAN` FOREIGN KEY (`kode_kerusakan`) REFERENCES `kerusakan` (`kode_kerusakan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
