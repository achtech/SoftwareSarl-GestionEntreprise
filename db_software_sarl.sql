-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 27 jan. 2019 à 11:56
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

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
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_reason` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `social_reason`) VALUES
(1, 'Exo-it'),
(2, 'Upwork');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
CREATE TABLE IF NOT EXISTS `entreprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_reason` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `adress` text NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `rc` varchar(20) NOT NULL,
  `patente` varchar(20) NOT NULL,
  `idfisc` varchar(40) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`),
  KEY `id_projects` (`id_projects`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `id_projects`, `libelle`, `start_date`, `end_date`, `status`, `progress`) VALUES
(1, 1, 'Analysis', '2018-12-16', '2018-12-24', 'TODO', 1),
(2, 2, 'tet', '2018-12-03', '2018-12-07', 'TODO', 0),
(3, 1, 'Master DAta', '2018-12-04', '2018-12-13', 'TODO', 0),
(4, 3, 'Project', '2018-12-19', '2018-12-24', 'TODO', 0),
(5, 3, 'Modules', '2018-12-19', '2018-12-07', 'TODO', 10),
(6, 3, 'Tasks', '2018-12-20', '2018-12-20', 'TODO', 10),
(7, 3, 'Clients', '2018-12-26', '2018-12-13', '', 10);

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
  `progress` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_clients` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clients` (`id_clients`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `start_date`, `end_date`, `technologies`, `progress`, `version`, `nom`, `status`, `id_clients`) VALUES
(1, '2018-12-16', '2019-01-04', 'J2EE , Angular JS, Oracle', 10, '0.510 Bugs', 'Abatech 0.5.10', 'Todo', 1),
(2, '2018-12-03', '2018-12-11', 'jaba', 2, '2', 'pr2', 'TODO', 2),
(3, '2018-12-19', '2018-12-31', 'LARAVEL', 0, '1.0', 'Software', 'TODO', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_users` int(11) UNSIGNED NOT NULL,
  `progress` int(11) NOT NULL,
  `complexity` int(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `id_modules` int(11) NOT NULL,
  `priorite` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_users`),
  KEY `id_module` (`id_modules`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `id_users`, `progress`, `complexity`, `start_date`, `end_date`, `id_modules`, `priorite`) VALUES
(1, 'Create analysis', 'Create analysis Create analysis Create analysis Create analysis Create analysis', 'DONE', 1, 10, 2, '2018-12-24', '2018-12-19', 1, 'Medium');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`);

--
-- Contraintes pour la table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`id_modules`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
