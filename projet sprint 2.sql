-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 27 jan. 2019 à 15:17
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.3.0

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

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `social_reason` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `social_reason`, `email`, `contact`, `mobile`, `adress`) VALUES
(1, 'EXO IT Solutions GmbH', NULL, NULL, NULL, 'Westendstraße 277 80686 Munich Allemagne'),
(2, 'Upwork', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `id_projects` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `progress` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `id_projects`, `libelle`, `start_date`, `end_date`, `status`, `progress`) VALUES
(9, 5, 'All tasks of 19.2-2', '2019-01-08', '2019-01-29', 'In progress', 71);

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `version` varchar(50) NOT NULL,
  `technologies` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_clients` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `start_date`, `end_date`, `version`, `technologies`, `nom`, `status`, `id_clients`, `prix_unitaire`) VALUES
(5, '2019-01-08', '2019-01-29', 'ABA Sprint 19.2-2', 'Java8, J2EE 6, Oracle, Angular JS', 'Abatech 20', 'In progress', 1, 20);

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `id_modules` int(11) DEFAULT NULL,
  `Ref_client` varchar(50) DEFAULT NULL,
  `Ref_interne` varchar(50) DEFAULT NULL,
  `id_users` int(11) UNSIGNED DEFAULT NULL,
  `complexity` int(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `status` varchar(50) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `priorite` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `id_modules`, `Ref_client`, `Ref_interne`, `id_users`, `complexity`, `title`, `description`, `status`, `progress`, `start_date`, `end_date`, `priorite`) VALUES
(4, 9, 'ALM', 'ABA-934', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(5, 9, 'ALM', 'ABA-1319', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(6, 9, 'ALM', 'ABA-1216', 4, 2, NULL, NULL, 'IN PROGRESS', 0, NULL, NULL, NULL),
(7, 9, 'ALM', 'ABA-1149', 4, 2, NULL, NULL, 'IN PROGRESS', 0, NULL, NULL, NULL),
(8, 9, 'ALM', 'ABA-1009', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(9, 9, 'ALM', 'ABA-566', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(10, 9, 'ALM', 'ABA-1059', 4, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(11, 9, 'ALM', 'ABA-260', 4, 6, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(12, 9, 'ALM', 'ABA-803', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(13, 9, 'ALM', 'ABA-1034', 4, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(14, 9, 'ALM', 'ABA-1223', 4, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(15, 9, 'ALM', 'ABA-953', 4, 6, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(16, 9, 'ALM', 'ABA-1106', 4, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(17, 9, 'ALM', 'ABA-1299', 4, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(18, 9, 'ALM', 'ABA-1363', 1, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(19, 9, 'ALM', 'ABA-215', 1, 6, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(20, 9, 'ALM', 'ABA-1379', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(21, 9, 'ALM', 'ABA-448', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(22, 9, 'ALM', 'ABA-565', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(23, 9, 'ALM', 'ABA-868', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(24, 9, 'ALM', 'ABA-922', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(25, 9, 'ALM', 'ABA-690', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(26, 9, 'ALM', 'ABA-1095', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(27, 9, 'ALM', 'ABA-1110', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(28, 9, 'ALM', 'ABA-1022', 1, 6, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(29, 9, 'ALM', 'ABA-1024', 1, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(30, 9, 'ALM', 'ABA-1052', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(31, 9, 'ALM', 'ABA-1092', 1, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(32, 9, 'ALM', 'ABA-627', 1, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(33, 9, 'ALM', 'ABA-1010', 1, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(34, 9, 'ALM', 'ABA-1286', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(35, 9, 'ALM', 'ABA-1355', 1, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(36, 9, 'ALM', 'ABA-1356', 1, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(37, 9, 'ALM', 'ABA-299', 1, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(38, 9, 'ALM', 'ABA-1171', 1, 4, NULL, NULL, 'IN PROGRESS', 0, NULL, NULL, NULL),
(39, 9, 'ALM', 'ABA-1349', 6, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(40, 9, 'ALM', 'ABA-1060', 6, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(41, 9, 'ALM', 'ABA-1307', 6, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(42, 9, 'ALM', 'ABA-674', 6, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(43, 9, 'ALM', 'ABA-717', 6, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(44, 9, 'ALM', 'ABA-719', 6, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(45, 9, 'ALM', 'ABA-1315', 6, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(46, 9, 'ALM', 'ABA-554', 6, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(47, 9, 'ALM', 'ABA-1194', 6, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(48, 9, 'ALM', 'ABA-1241', 6, 2, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(49, 9, 'ALM', 'ABA-1250', 6, 2, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(50, 9, 'ALM', 'ABA-706', 6, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(51, 9, 'ALM', 'ABA-1094', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(52, 9, 'ALM', 'ABA-1046', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(53, 9, 'ALM', 'ABA-1109', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(54, 9, 'ALM', 'ABA-952', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(55, 9, 'ALM', 'ABA-84', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(56, 9, 'ALM', 'ABA-1019', 3, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(57, 9, 'ALM', 'ABA-1134', 3, 2, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(58, 9, 'ALM', 'ABA-1036', 5, 3, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(59, 9, 'ALM', 'ABA-1037', 5, 3, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(60, 9, 'ALM', 'ABA-551', 5, 2, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(61, 9, 'ALM', 'ABA-1112', 5, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(62, 9, 'ALM', 'ABA-718', 5, 4, NULL, NULL, 'DONE', 100, NULL, NULL, NULL),
(63, 9, 'ALM', 'ABA-1023', 5, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(64, 9, 'ALM', 'ABA-1021', 5, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(65, 9, 'ALM', 'ABA-552', 5, 4, NULL, NULL, 'IN REVIEW', 75, NULL, NULL, NULL),
(66, 9, 'ALM', 'ABA-1132', 1, 2, NULL, NULL, 'TODO', 0, NULL, NULL, NULL),
(67, 9, 'ALM', 'ABA-677', 1, 2, NULL, NULL, 'TODO', 0, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_projects` (`id_projects`);

--
-- Index pour la table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients` (`id_clients`) USING BTREE;

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_users`),
  ADD KEY `id_module` (`id_modules`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`id_modules`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
