-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 08, 2019 at 11:20 AM
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
-- Database: `gestion_rh_r`
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
  `cv` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidats`
--

INSERT INTO `candidats` (`idC`, `nom`, `prenom`, `cin`, `tel`, `mail`, `msg`, `dateC`, `cv`) VALUES
(29, 'Chorfan', 'Wael', '09801610', '+21652236988', 'chorfanwael@gmail.com', 'zerzaer', '2019-09-08 11:36:11', '2019-09-08-12-36-11-cv-wael-chorfan.pdf');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`idE`, `nom`, `prenom`, `cin`, `date`, `fonction`, `salaire`) VALUES
(15, 'Chorfan', 'Wael', '09801610', '2019-09-08 11:35:37', 'ingénieur', 10000);

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
  PRIMARY KEY (`idET`),
  KEY `idR` (`idR`),
  KEY `idC` (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entretiens`
--

INSERT INTO `entretiens` (`idET`, `date`, `commentaire`, `idR`, `idC`, `cv`) VALUES
(11, '2019-09-11 00:00:00', 'bjeh rabi manwwassikech', 5, 29, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `responsables`
--

INSERT INTO `responsables` (`idR`, `nom`, `cin`, `tel`) VALUES
(5, 'M.Davis', '09801610', '51435090');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entretiens`
--
ALTER TABLE `entretiens`
  ADD CONSTRAINT `entretiens_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `responsables` (`idR`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entretiens_ibfk_2` FOREIGN KEY (`idC`) REFERENCES `candidats` (`idC`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
