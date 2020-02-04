-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 28 jan. 2019 à 00:29
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_software_sarl`
--

-- --------------------------------------------------------

--
-- Structure de la table `details_factures`
--

DROP TABLE IF EXISTS `details_factures`;
CREATE TABLE IF NOT EXISTS `details_factures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_factures` int(11) NOT NULL,
  `id_tasks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details_factures`
--

INSERT INTO `details_factures` (`id`, `id_factures`, `id_tasks`) VALUES
(35, 25, 3),
(36, 26, 3),
(37, 26, 1),
(38, 26, 2),
(39, 27, 3),
(40, 27, 1),
(41, 27, 2),
(42, 28, 3),
(43, 28, 1),
(44, 28, 2),
(45, 29, 3),
(46, 30, 1),
(47, 30, 2),
(48, 31, 6),
(49, 32, 6),
(50, 33, 6),
(51, 34, 6),
(52, 34, 22),
(53, 34, 19),
(54, 34, 35),
(55, 34, 16),
(56, 34, 32),
(57, 34, 13),
(58, 34, 29),
(59, 34, 10),
(60, 34, 26),
(61, 34, 7),
(62, 34, 23),
(63, 34, 4),
(64, 34, 20),
(65, 34, 17),
(66, 34, 33),
(67, 34, 14),
(68, 34, 30),
(69, 34, 11),
(70, 34, 27),
(71, 34, 8),
(72, 34, 24),
(73, 34, 5),
(74, 34, 21),
(75, 34, 18),
(76, 34, 34),
(77, 34, 15),
(78, 34, 31),
(79, 34, 12),
(80, 34, 28),
(81, 34, 9),
(82, 34, 25),
(83, 35, 6),
(84, 35, 22),
(85, 35, 19),
(86, 35, 35),
(87, 35, 16),
(88, 35, 32),
(89, 35, 13),
(90, 35, 29),
(91, 35, 10),
(92, 35, 26),
(93, 35, 7),
(94, 35, 23),
(95, 35, 4),
(96, 35, 20),
(97, 35, 17),
(98, 35, 33),
(99, 35, 14),
(100, 35, 30),
(101, 35, 11),
(102, 35, 27),
(103, 35, 8),
(104, 35, 24),
(105, 35, 5),
(106, 35, 21),
(107, 35, 18),
(108, 35, 34),
(109, 35, 15),
(110, 35, 31),
(111, 35, 12),
(112, 35, 28),
(113, 35, 9),
(114, 35, 25),
(115, 36, 6),
(116, 36, 22),
(117, 36, 19),
(118, 36, 35),
(119, 36, 16),
(120, 36, 32),
(121, 36, 13),
(122, 36, 29),
(123, 36, 10),
(124, 36, 26),
(125, 36, 7),
(126, 36, 23),
(127, 36, 4),
(128, 36, 20),
(129, 36, 17),
(130, 36, 33),
(131, 36, 14),
(132, 36, 30),
(133, 36, 11),
(134, 36, 27),
(135, 36, 8),
(136, 36, 24),
(137, 36, 5),
(138, 36, 21),
(139, 36, 18),
(140, 36, 34),
(141, 36, 15),
(142, 36, 31),
(143, 36, 12),
(144, 36, 28),
(145, 36, 9),
(146, 36, 25),
(147, 37, 40),
(148, 37, 57),
(149, 37, 76),
(150, 37, 54),
(151, 37, 73),
(152, 37, 93),
(153, 37, 51),
(154, 37, 67),
(155, 37, 90),
(156, 37, 47),
(157, 37, 64),
(158, 37, 86),
(159, 37, 44),
(160, 37, 61),
(161, 37, 83),
(162, 37, 41),
(163, 37, 58),
(164, 37, 77),
(165, 37, 36),
(166, 37, 55),
(167, 37, 74),
(168, 37, 94),
(169, 37, 52),
(170, 37, 71),
(171, 37, 91),
(172, 37, 48),
(173, 37, 65),
(174, 37, 87),
(175, 37, 45),
(176, 37, 62),
(177, 37, 84),
(178, 37, 42),
(179, 37, 59),
(180, 37, 78),
(181, 37, 37),
(182, 37, 56),
(183, 37, 75),
(184, 37, 53),
(185, 37, 72),
(186, 37, 92),
(187, 37, 50),
(188, 37, 66),
(189, 37, 88),
(190, 37, 46),
(191, 37, 63),
(192, 37, 85),
(193, 37, 43),
(194, 37, 60),
(195, 37, 79);

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE IF NOT EXISTS `factures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_facture` date NOT NULL,
  `ref_clients` varchar(30) NOT NULL,
  `num_facture` int(11) NOT NULL,
  `total_hors_taxe` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id`, `date_facture`, `ref_clients`, `num_facture`, `total_hors_taxe`, `total`) VALUES
(33, '2019-01-08', '12', 89, NULL, NULL),
(34, '2019-01-08', '12', 89, 9280, 9280),
(35, '2019-01-24', 'refClient', 55, 9280, 9280),
(36, '2018-12-31', 'refClient2', 100, 9280, 9280),
(37, '2019-01-15', 'proj 2', 140, 11680, 11680);

-- --------------------------------------------------------

--
-- Structure de la table `factures_projects`
--

DROP TABLE IF EXISTS `factures_projects`;
CREATE TABLE IF NOT EXISTS `factures_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_factures` int(11) NOT NULL,
  `id_projects` int(11) NOT NULL,
  `nombre_heurs` int(11) DEFAULT NULL,
  `prix_unitaire` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `factures_projects`
--

INSERT INTO `factures_projects` (`id`, `id_factures`, `id_projects`, `nombre_heurs`, `prix_unitaire`, `total`) VALUES
(46, 25, 4, NULL, NULL, NULL),
(47, 26, 4, NULL, NULL, NULL),
(48, 26, 1, 280, 20, 5600),
(49, 27, 4, 0, 20, 0),
(50, 27, 1, 480, 20, 9600),
(51, 28, 4, 280, 20, 5600),
(52, 28, 1, 880, 20, 17600),
(53, 29, 4, 280, 20, 5600),
(54, 30, 1, 880, 20, 17600),
(55, 31, 5, NULL, NULL, NULL),
(56, 32, 5, NULL, NULL, NULL),
(57, 33, 5, NULL, NULL, NULL),
(58, 34, 5, 464, 20, 9280),
(59, 35, 5, 464, 20, 9280),
(60, 36, 5, 464, 20, 9280),
(61, 37, 6, 584, 20, 11680);

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_projects` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `progress` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `id_projects`, `libelle`, `start_date`, `end_date`, `status`, `progress`) VALUES
(9, 5, 'All tasks of ABA version 19.1', '2018-12-05', '2019-01-03', 'DONE', 100),
(10, 6, 'All tasks of ABA version 19.2', '2019-01-08', '2019-01-29', 'IN PROGRESS', 76);

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `technologies` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_clients` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `clients` (`id_clients`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `start_date`, `end_date`, `technologies`, `version`, `nom`, `status`, `id_clients`, `prix_unitaire`) VALUES
(5, '2018-12-05', '2019-01-04', 'Java 7 , Angular JS, Oracle', 'ABA Sprint 19.2-1', 'Abatech 20', 'DONE', 1, 20),
(6, '2019-01-08', '2019-01-29', 'Java8, J2EE 6, Oracle, Angular JS', 'ABA Sprint 19.2-2', 'Abatech 20', 'IN PROGRESS', 1, 20);

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modules` int(11) DEFAULT NULL,
  `id_users` int(11) UNSIGNED DEFAULT NULL,
  `Ref_client` varchar(50) DEFAULT NULL,
  `Ref_interne` varchar(50) DEFAULT NULL,
  `complexity` int(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `progress` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `priorite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `id_modules`, `id_users`, `Ref_client`, `Ref_interne`, `complexity`, `status`, `title`, `description`, `progress`, `start_date`, `end_date`, `priorite`) VALUES
(4, 9, 4, 'ALM-2624', 'ABA-1242', 6, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(5, 9, 4, 'ALM-2439', 'ABA-859', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(6, 9, 4, 'ALM-2302', 'ABA-542', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(7, 9, 4, 'ALM-2633', 'ABA-1297', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(8, 9, 4, 'ALM-2475', 'ABA-940', 8, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(9, 9, 4, 'ALM-2316', 'ABA-556', 8, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(10, 9, 4, 'ALM-2238', 'ABA-407', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(11, 9, 4, '', 'ABA-1289', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(12, 9, 4, 'ALM-2472', 'ABA-935', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(13, 9, 4, 'ALM-2502', 'ABA-975', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(14, 9, 6, 'ALM-2424', 'ABA-817', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(15, 9, 6, 'ALM-2577', 'ABA-1170', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(16, 9, 6, 'ALM-2309', 'ABA-549', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(17, 9, 6, 'ABA-1103', 'ABA-1103', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(18, 9, 6, 'ALM-2496', 'ABA-968', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(19, 9, 6, 'ALM-2614', 'ABA-1234', 6, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(20, 9, 6, 'ABA-1067', 'ABA-1067', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(21, 9, 6, 'ALM-2456', 'ABA-946', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(22, 9, 6, 'ALM-2162', 'ABA-466', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(23, 9, 6, 'ALM-2632', 'ABA-1280', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(24, 9, 6, 'ALM-2656', 'ABA-1349', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(25, 9, 1, 'ALM-2607', 'ABA-1219', 6, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(26, 9, 1, 'ALM-2050', 'ABA-712', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(27, 9, 1, 'ALM-2466', 'ABA-932', 6, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(28, 9, 1, 'ABA-2619', 'ABA-1235', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(29, 9, 1, 'ALM-2487', 'ABA-949', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(30, 9, 1, 'ALM-2533', 'ABA-1044', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(31, 9, 1, 'ABA-2610', 'ABA-1221', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(32, 9, 1, 'ALM-2142', 'ABA-115', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(33, 9, 1, 'ALM-2296', 'ABA-540', 4, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(34, 9, 1, 'ALM-2656', 'ABA-892', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(35, 9, 5, 'ALM-2411', 'ABA-756', 2, 'DONE', '', '', 100, '2018-12-03', '2019-01-03', 'Hight'),
(36, 10, 4, 'ALM', 'ABA-934', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(37, 10, 4, 'ALM', 'ABA-1319', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(38, 10, 4, 'ALM', 'ABA-1216', 2, 'IN PROGRESS', NULL, NULL, 0, NULL, NULL, NULL),
(39, 10, 4, 'ALM', 'ABA-1149', 2, 'IN PROGRESS', NULL, NULL, 0, NULL, NULL, NULL),
(40, 10, 4, 'ALM', 'ABA-1009', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(41, 10, 4, 'ALM', 'ABA-566', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(42, 10, 4, 'ALM', 'ABA-1059', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(43, 10, 4, 'ALM', 'ABA-260', 6, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(44, 10, 4, 'ALM', 'ABA-803', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(45, 10, 4, 'ALM', 'ABA-1034', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(46, 10, 4, 'ALM', 'ABA-1223', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(47, 10, 4, 'ALM', 'ABA-953', 6, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(48, 10, 4, 'ALM', 'ABA-1106', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(49, 10, 4, 'ALM', 'ABA-1299', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(50, 10, 1, 'ALM', 'ABA-1363', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(51, 10, 1, 'ALM', 'ABA-215', 6, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(52, 10, 1, 'ALM', 'ABA-1379', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(53, 10, 1, 'ALM', 'ABA-448', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(54, 10, 1, 'ALM', 'ABA-565', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(55, 10, 1, 'ALM', 'ABA-868', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(56, 10, 1, 'ALM', 'ABA-922', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(57, 10, 1, 'ALM', 'ABA-690', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(58, 10, 1, 'ALM', 'ABA-1095', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(59, 10, 1, 'ALM', 'ABA-1110', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(60, 10, 1, 'ALM', 'ABA-1022', 6, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(61, 10, 1, 'ALM', 'ABA-1024', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(62, 10, 1, 'ALM', 'ABA-1052', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(63, 10, 1, 'ALM', 'ABA-1092', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(64, 10, 1, 'ALM', 'ABA-627', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(65, 10, 1, 'ALM', 'ABA-1010', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(66, 10, 1, 'ALM', 'ABA-1286', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(67, 10, 1, 'ALM', 'ABA-1355', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(68, 10, 1, 'ALM', 'ABA-1356', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(69, 10, 1, 'ALM', 'ABA-299', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(70, 10, 1, 'ALM', 'ABA-1171', 4, 'IN PROGRESS', NULL, NULL, 0, NULL, NULL, NULL),
(71, 10, 6, 'ALM', 'ABA-1349', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(72, 10, 6, 'ALM', 'ABA-1060', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(73, 10, 6, 'ALM', 'ABA-1307', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(74, 10, 6, 'ALM', 'ABA-674', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(75, 10, 6, 'ALM', 'ABA-717', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(76, 10, 6, 'ALM', 'ABA-719', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(77, 10, 6, 'ALM', 'ABA-1315', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(78, 10, 6, 'ALM', 'ABA-554', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(79, 10, 6, 'ALM', 'ABA-1194', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(80, 10, 6, 'ALM', 'ABA-1241', 2, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(81, 10, 6, 'ALM', 'ABA-1250', 2, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(82, 10, 6, 'ALM', 'ABA-706', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(83, 10, 3, 'ALM', 'ABA-1094', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(84, 10, 3, 'ALM', 'ABA-1046', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(85, 10, 3, 'ALM', 'ABA-1109', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(86, 10, 3, 'ALM', 'ABA-952', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(87, 10, 3, 'ALM', 'ABA-84', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(88, 10, 3, 'ALM', 'ABA-1019', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(89, 10, 3, 'ALM', 'ABA-1134', 2, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(90, 10, 5, 'ALM', 'ABA-1036', 3, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(91, 10, 5, 'ALM', 'ABA-1037', 3, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(92, 10, 5, 'ALM', 'ABA-551', 2, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(93, 10, 5, 'ALM', 'ABA-1112', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(94, 10, 5, 'ALM', 'ABA-718', 4, 'DONE', NULL, NULL, 100, NULL, NULL, NULL),
(95, 10, 5, 'ALM', 'ABA-1023', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(96, 10, 5, 'ALM', 'ABA-1021', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(97, 10, 5, 'ALM', 'ABA-552', 4, 'IN REVIEW', NULL, NULL, 75, NULL, NULL, NULL),
(98, 10, 1, 'ALM', 'ABA-1132', 2, 'TODO', NULL, NULL, 0, NULL, NULL, NULL),
(99, 10, 1, 'ALM', 'ABA-677', 2, 'TODO', NULL, NULL, 0, NULL, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
