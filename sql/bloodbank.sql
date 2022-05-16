-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 08 mai 2022 à 01:12
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bloodbank`
--

-- --------------------------------------------------------

--
-- Structure de la table `blooddinfo`
--

DROP TABLE IF EXISTS `blooddinfo`;
CREATE TABLE IF NOT EXISTS `blooddinfo` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `bg` varchar(10) NOT NULL,
  PRIMARY KEY (`bdid`),
  KEY `blooddinfo_ibfk_2` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blooddinfo`
--

INSERT INTO `blooddinfo` (`bdid`, `rid`, `bg`) VALUES
(10, 8, 'A+'),
(27, 1, 'A-');

-- --------------------------------------------------------

--
-- Structure de la table `blooddonate`
--

DROP TABLE IF EXISTS `blooddonate`;
CREATE TABLE IF NOT EXISTS `blooddonate` (
  `donoid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `bg` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`donoid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blooddonate`
--

INSERT INTO `blooddonate` (`donoid`, `rid`, `hid`, `bg`, `status`) VALUES
(6, 1, 8, 'A-', 'Pending');

-- --------------------------------------------------------

--
-- Structure de la table `bloodinfo`
--

DROP TABLE IF EXISTS `bloodinfo`;
CREATE TABLE IF NOT EXISTS `bloodinfo` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) NOT NULL,
  `bg` varchar(10) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `hid` (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bloodinfo`
--

INSERT INTO `bloodinfo` (`bid`, `hid`, `bg`) VALUES
(8, 9, 'O+'),
(24, 8, 'A-'),
(31, 9, 'B-');

-- --------------------------------------------------------

--
-- Structure de la table `bloodrequest`
--

DROP TABLE IF EXISTS `bloodrequest`;
CREATE TABLE IF NOT EXISTS `bloodrequest` (
  `reqid` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `bg` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`reqid`),
  KEY `hid` (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hname` varchar(100) NOT NULL,
  `hemail` varchar(100) NOT NULL,
  `hpassword` varchar(100) NOT NULL,
  `hphone` varchar(100) NOT NULL,
  `hcity` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hospitals`
--

INSERT INTO `hospitals` (`id`, `hname`, `hemail`, `hpassword`, `hphone`, `hcity`) VALUES
(8, 'Houcine Bouzayen', 'testtest@gmail.com', 'testest', '8875643456', 'Houcine'),
(9, 'charles nicolle', 'charles@gmail.com', 'test123', '8234567981', 'Tunis');

-- --------------------------------------------------------

--
-- Structure de la table `receivers`
--

DROP TABLE IF EXISTS `receivers`;
CREATE TABLE IF NOT EXISTS `receivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(100) NOT NULL,
  `remail` varchar(100) NOT NULL,
  `rpassword` varchar(100) NOT NULL,
  `rphone` varchar(100) NOT NULL,
  `rbg` varchar(10) NOT NULL,
  `rcity` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `receivers`
--

INSERT INTO `receivers` (`id`, `rname`, `remail`, `rpassword`, `rphone`, `rbg`, `rcity`) VALUES
(1, 'test', 'test@gmail.com', 'test', '8875643456', 'A+', 'lucknow'),
(8, 'Aziz', 'aziz@gmail.com', 'test123', '9525232624', 'A-', 'Tunis');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blooddinfo`
--
ALTER TABLE `blooddinfo`
  ADD CONSTRAINT `blooddinfo_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `receivers` (`id`);

--
-- Contraintes pour la table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  ADD CONSTRAINT `bloodinfo_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `hospitals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
