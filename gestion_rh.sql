-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 07, 2019 at 11:49 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_rh`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidats`
--

DROP TABLE IF EXISTS `candidats`;
CREATE TABLE IF NOT EXISTS `candidats` (
  `idC` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `cin` varchar(8) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `msg` longtext NOT NULL,
  `dateC` datetime NOT NULL,
  `idCV` int(10) DEFAULT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidats`
--

INSERT INTO `candidats` (`idC`, `nom`, `prenom`, `cin`, `tel`, `mail`, `msg`, `dateC`, `idCV`) VALUES
(1, 'wiem', 'benghozzi', '9883058', '27992106', 'wiembenghozzi@gmail.com', 'bonsoir,\r\nje cherche une poste de travail', '2019-08-01 00:00:00', 1),
(2, 'Chorfan', 'Wael', '01827853', '+21652236988', 'chorfanwael@gmail.com', 'aaaaa', '2019-09-01 00:00:00', NULL),
(4, 'mtar', 'safa', '08888888', '55554455', 'safamtat@gmail.com', 'n7eb ne5dem', '2019-09-07 10:53:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cvs`
--

DROP TABLE IF EXISTS `cvs`;
CREATE TABLE IF NOT EXISTS `cvs` (
  `idCV` int(11) NOT NULL,
  `cv` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `idE` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `cin` varchar(8) NOT NULL,
  `date` datetime DEFAULT NULL,
  `fonction` varchar(60) NOT NULL,
  `salaire` int(10) NOT NULL,
  PRIMARY KEY (`idE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`idE`, `nom`, `prenom`, `cin`, `date`, `fonction`, `salaire`) VALUES
(1, 'wael', 'chorfan', '44', '2019-08-31 12:51:51', 'aaa', 777),
(6, 'ben ghozzi', 'wiem', '09988888', '2019-09-07 10:52:24', 'fedar', 10000),
(7, 'mtar', 'safa', '01827853', '2019-09-07 12:44:49', 'fedar', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `entretiens`
--

DROP TABLE IF EXISTS `entretiens`;
CREATE TABLE IF NOT EXISTS `entretiens` (
  `idET` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `commentaire` varchar(100) NOT NULL,
  `idR` int(10) NOT NULL,
  `idC` int(10) NOT NULL,
  `cv` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idET`)
) ENGINE=InnoDB AUTO_INCREMENT=2349 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entretiens`
--

INSERT INTO `entretiens` (`idET`, `date`, `commentaire`, `idR`, `idC`, `cv`) VALUES
(2, '2019-10-10 00:00:00', 'bjeh rabi manwwassikech', 2, 4, NULL),
(3, '2019-09-01 00:00:00', 'aaa', 1, 2, NULL),
(4, '2019-09-02 00:00:00', 'uuuuu', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
CREATE TABLE IF NOT EXISTS `responsables` (
  `idR` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `cin` varchar(8) NOT NULL,
  `tel` varchar(30) NOT NULL,
  PRIMARY KEY (`idR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `responsables`
--

INSERT INTO `responsables` (`idR`, `nom`, `cin`, `tel`) VALUES
(1, 'salah', '09896309', '52255888'),
(2, 'dhia lakti', '09888888', '22222222');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
