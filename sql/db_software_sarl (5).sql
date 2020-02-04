-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 27 déc. 2018 à 01:03
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
-- Structure de la table `attachements`
--

DROP TABLE IF EXISTS `attachements`;
CREATE TABLE IF NOT EXISTS `attachements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_projects` int(11) NOT NULL,
  `id_tasks` int(11) NOT NULL,
  `id_modules` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `file` blob NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_projects` (`id_projects`),
  KEY `id_tasks` (`id_tasks`),
  KEY `id_modules` (`id_modules`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `cms_apicustom`
--

DROP TABLE IF EXISTS `cms_apicustom`;
CREATE TABLE IF NOT EXISTS `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_apikey`
--

DROP TABLE IF EXISTS `cms_apikey`;
CREATE TABLE IF NOT EXISTS `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_dashboard`
--

DROP TABLE IF EXISTS `cms_dashboard`;
CREATE TABLE IF NOT EXISTS `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_email_queues`
--

DROP TABLE IF EXISTS `cms_email_queues`;
CREATE TABLE IF NOT EXISTS `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_email_templates`
--

DROP TABLE IF EXISTS `cms_email_templates`;
CREATE TABLE IF NOT EXISTS `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2018-12-14 09:00:47', NULL),
(2, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2018-12-14 09:20:03', NULL),
(3, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2018-12-14 21:45:30', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_logs`
--

DROP TABLE IF EXISTS `cms_logs`;
CREATE TABLE IF NOT EXISTS `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'admin@crudbooster.com login with IP Address ::1', '', 1, '2018-12-14 21:48:46', NULL),
(2, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/1', 'Update data Achraf Saloumi at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Super Admin</td><td>Achraf Saloumi</td></tr><tr><td>photo</td><td></td><td>uploads/1/2018-12/chrysanthemum.jpg</td></tr><tr><td>email</td><td>admin@crudbooster.com</td><td>achraf.saloumi@exo-it.com</td></tr><tr><td>password</td><td>$2y$10$ZJo3rsLQHivHufaznFfc0elsnqATwkY6YNXLnjsK2X1waz./0eSl.</td><td></td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2018-12-14 21:58:46', NULL),
(3, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Administratif at Menu Management', '', 1, '2018-12-15 08:57:22', NULL),
(4, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Projects at Menu Management', '', 1, '2018-12-15 08:58:16', NULL),
(5, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Parametres at Menu Management', '', 1, '2018-12-15 08:58:49', NULL),
(6, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/add-save', 'Add New Data Noura Bouchbaat at Users Management', '', 1, '2018-12-15 09:23:34', NULL),
(7, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/add-save', 'Add New Data Brahim barjali at Users Management', '', 1, '2018-12-15 09:24:16', NULL),
(8, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/add-save', 'Add New Data Oumaima Stitini at Users Management', '', 1, '2018-12-15 09:25:20', NULL),
(9, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/add-save', 'Add New Data Mohammed Lechiakh at Users Management', '', 1, '2018-12-15 09:26:14', NULL),
(10, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/add-save', 'Add New Data Abdelah Taha at Users Management', '', 1, '2018-12-15 09:26:55', NULL),
(11, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/4', 'Update data Oumaima Stitini at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$EEUbBwoJjeWjJRb3UyQ9Z.SaaojVp3wgAF6RZhnySI6xHD3D2qMTW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-15 09:27:09', NULL),
(12, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'achraf.saloumi@exo-it.com logout', '', 1, '2018-12-15 10:36:23', NULL),
(13, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'noura.bouchbaat@exo-it.com login with IP Address ::1', '', 2, '2018-12-15 10:38:10', NULL),
(14, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/1', 'Update data Achraf Saloumi at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$ZJo3rsLQHivHufaznFfc0elsnqATwkY6YNXLnjsK2X1waz./0eSl.</td><td>$2y$10$JWPs.xq1VebGO./hZhrEkuRON/B7E7oSr6tRHgE7zYfo8/ENGxdgy</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 2, '2018-12-15 10:38:47', NULL),
(15, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/clients/add-save', 'Add New Data  at Clients', '', 2, '2018-12-15 11:36:03', NULL),
(16, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/clients/add-save', 'Add New Data  at Clients', '', 2, '2018-12-15 11:36:08', NULL),
(17, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/add-save', 'Add New Data  at Projects', '', 2, '2018-12-15 11:38:01', NULL),
(18, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/edit-save/1', 'Update data  at Projects', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 2, '2018-12-15 11:47:48', NULL),
(19, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'noura.bouchbaat@exo-it.com logout', '', 2, '2018-12-15 11:56:52', NULL),
(20, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-15 11:57:17', NULL),
(21, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/edit-save/1', 'Update data  at Projects', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_clients</td><td>1</td><td>2</td></tr></tbody></table>', 1, '2018-12-15 12:03:06', NULL),
(22, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/edit-save/1', 'Update data  at Projects', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>id_clients</td><td>2</td><td>1</td></tr></tbody></table>', 1, '2018-12-15 12:03:15', NULL),
(23, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-15 12:22:33', NULL),
(24, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/tasks/add-save', 'Add New Data Create analysis at Tasks', '', 1, '2018-12-15 13:36:14', NULL),
(25, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-15 20:51:45', NULL),
(26, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/add-save', 'Add New Data  at Projects', '', 1, '2018-12-15 23:38:51', NULL),
(27, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-15 23:39:18', NULL),
(28, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'achraf.saloumi@exo-it.com logout', '', 1, '2018-12-15 23:48:25', NULL),
(29, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-15 23:49:02', NULL),
(30, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-17 08:23:33', NULL),
(31, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-17 08:26:58', NULL),
(32, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/professions/add-save', 'Add New Data  at Profession', '', 1, '2018-12-17 08:58:12', NULL),
(33, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-17 13:05:21', NULL),
(34, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/statistic_builder/add-save', 'Add New Data Projects at Statistic Builder', '', 1, '2018-12-17 13:05:49', NULL),
(35, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Personnels at Menu Management', '', 1, '2018-12-17 13:23:45', NULL),
(36, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'achraf.saloumi@exo-it.com logout', '', 1, '2018-12-17 14:25:04', NULL),
(37, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-17 14:25:07', NULL),
(38, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/tasks/edit-save/2', 'Update data Create analysis at Tasks', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>TODO</td><td>DONE</td></tr></tbody></table>', 1, '2018-12-17 14:27:10', NULL),
(39, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-17 18:08:53', NULL),
(40, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-18 08:05:23', NULL),
(41, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-18 10:23:54', NULL),
(42, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/professions/add-save', 'Add New Data  at Profession', '', 1, '2018-12-18 16:47:50', NULL),
(43, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/add-save', 'Add New Data  at Personnel', '', 1, '2018-12-18 17:15:41', NULL),
(44, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/add-save', 'Add New Data  at Personnel', '', 1, '2018-12-18 17:19:37', NULL),
(45, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointages/delete/1206', 'Delete data 1206 at Pointages', '', 1, '2018-12-18 18:40:07', NULL),
(46, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointages/delete/1208', 'Delete data 1208 at Pointages', '', 1, '2018-12-18 18:40:10', NULL),
(47, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointages/delete/1210', 'Delete data 1210 at Pointages', '', 1, '2018-12-18 18:40:14', NULL),
(48, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointages/delete/1207', 'Delete data 1207 at Pointages', '', 1, '2018-12-18 18:40:17', NULL),
(49, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointages/delete/1209', 'Delete data 1209 at Pointages', '', 1, '2018-12-18 18:40:20', NULL),
(50, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/10', 'Update data Pointages at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>Route</td><td>Module</td></tr><tr><td>path</td><td>AdminPointagesControllerGetIndex</td><td>pointages_journaliere</td></tr><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>15</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-18 19:27:02', NULL),
(51, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/projects/add-save', 'Add New Data  at Projects', '', 1, '2018-12-18 19:56:42', NULL),
(52, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-18 19:57:36', NULL),
(53, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-18 19:57:51', NULL),
(54, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-18 19:58:10', NULL),
(55, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/modules/add-save', 'Add New Data  at Modules', '', 1, '2018-12-18 19:58:46', NULL),
(56, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-18 20:01:47', NULL),
(57, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/spent_revenues/add-save', 'Add New Data  at Spent / Revenue', '', 1, '2018-12-18 20:10:00', NULL),
(58, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/spent_revenues/add-save', 'Add New Data  at Spent / Revenue', '', 1, '2018-12-18 20:24:16', NULL),
(59, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/19', 'Update data Personnels at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2018-12-18 21:27:54', NULL),
(60, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/delete/19', 'Delete data Personnels at Menu Management', '', 1, '2018-12-18 21:28:01', NULL),
(61, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Pointages at Menu Management', '', 1, '2018-12-18 21:28:39', NULL),
(62, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/10', 'Update data Pointages Journaliere at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Pointages</td><td>Pointages Journaliere</td></tr><tr><td>parent_id</td><td>21</td><td></td></tr></tbody></table>', 1, '2018-12-18 21:29:26', NULL),
(63, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/delete/18', 'Delete data Users at Menu Management', '', 1, '2018-12-18 21:29:55', NULL),
(64, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/edit-save/2', 'Update data  at Personnel', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cnss</td><td></td><td>140924898</td></tr></tbody></table>', 1, '2018-12-18 22:24:47', NULL),
(65, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/edit-save/3', 'Update data  at Personnel', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>mobile</td><td>+212628803044</td><td>+212 6 28 80 30 44</td></tr></tbody></table>', 1, '2018-12-18 22:25:03', NULL),
(66, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Achraf Saloumi at Users Management', '', 1, '2018-12-18 22:26:15', NULL),
(67, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/1', 'Update data Achraf Saloumi at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/achraf600_600.png</td></tr><tr><td>password</td><td>$2y$10$JWPs.xq1VebGO./hZhrEkuRON/B7E7oSr6tRHgE7zYfo8/ENGxdgy</td><td></td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2018-12-18 22:29:41', NULL),
(68, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'achraf.saloumi@exo-it.com logout', '', 1, '2018-12-18 22:29:59', NULL),
(69, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-18 22:30:02', NULL),
(70, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/69', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-18 22:33:45', NULL),
(71, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/68', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-18 22:34:27', NULL),
(72, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-19 08:24:30', NULL),
(73, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Pointages Report at Menu Management', '', 1, '2018-12-19 08:27:28', NULL),
(74, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-20 18:41:09', NULL),
(75, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/delete/22', 'Delete data Pointages Report at Menu Management', '', 1, '2018-12-20 20:53:29', NULL),
(76, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-21 13:36:47', NULL),
(77, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-21 20:46:12', NULL),
(78, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-21 22:21:44', NULL),
(79, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-22 11:42:56', NULL),
(80, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-22 12:11:31', NULL),
(81, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-23 14:17:59', NULL),
(82, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-23 16:53:43', NULL),
(83, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-23 17:06:58', NULL),
(84, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 20:30:50', NULL),
(85, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 20:32:26', NULL),
(86, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/68', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:39:04', NULL),
(87, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/64', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:39:22', NULL),
(88, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 20:41:30', NULL),
(89, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/24', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:42:21', NULL),
(90, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/70', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:42:40', NULL),
(91, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 20:47:41', NULL),
(92, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/69', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:56:22', NULL),
(93, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/67', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 20:56:35', NULL),
(94, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:06:33', NULL),
(95, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:09:28', NULL),
(96, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:17:45', NULL),
(97, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:23:14', NULL),
(98, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:24:43', NULL),
(99, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:25:59', NULL),
(100, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:27:47', NULL),
(101, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:32:10', NULL),
(102, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-23 21:53:38', NULL),
(103, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/66', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nbr_days</td><td>2</td><td>1.5</td></tr><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-23 21:55:54', NULL),
(104, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/66', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nbr_days</td><td>2</td><td>3</td></tr></tbody></table>', 1, '2018-12-23 21:56:37', NULL),
(105, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/66', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nbr_days</td><td>3</td><td>2</td></tr></tbody></table>', 1, '2018-12-23 21:56:48', NULL),
(106, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/21', 'Update data Pointages et Conges at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Pointages</td><td>Pointages et Conges</td></tr></tbody></table>', 1, '2018-12-23 21:59:12', NULL),
(107, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-23 22:50:41', NULL),
(108, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/6', 'Update data Abdelah Taha at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$zbasJVSdlkekmt/AvGVOr.2hXwryM5UTSc8Tr0Xlp3daRjB3l.zH.</td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-23 23:03:34', NULL),
(109, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/5', 'Update data Mohammed Lechiakh at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$nLruciKkSvgWRpe3Ql/jFuor842xhwEdhbg58DYNpkpqFLh8yCsc.</td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-23 23:03:46', NULL),
(110, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/3', 'Update data Brahim barjali at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$1VNoHoqdMcVqTyTmut1.buWEZS5s8c42xFoyy9ioYSnVr9ZYBqJ/y</td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-23 23:04:01', NULL),
(111, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/2', 'Update data Noura Bouchbaat at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$DRrv58s/MbKdPcRepj4uDOxZEIOpEKoGOVAZRFUec.3ji9/xmVnju</td><td></td></tr><tr><td>id_cms_privileges</td><td>1</td><td>2</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-23 23:04:16', NULL),
(112, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-24 08:25:59', NULL),
(113, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/6', 'Update data Abdelah Taha at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$zbasJVSdlkekmt/AvGVOr.2hXwryM5UTSc8Tr0Xlp3daRjB3l.zH.</td><td>$2y$10$yDBxto/n.VfWVdFyqVbq3uq6v88g3EqrhAuzgpwx1CQhKqgOoHWtW</td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-24 08:27:00', NULL),
(114, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'achraf.saloumi@exo-it.com logout', '', 1, '2018-12-24 08:27:11', NULL),
(115, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'abdellah.taha@exo-it.com login with IP Address ::1', '', 6, '2018-12-24 08:27:21', NULL),
(116, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/logout', 'abdellah.taha@exo-it.com logout', '', 6, '2018-12-24 08:27:33', NULL),
(117, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-24 08:27:53', NULL),
(118, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/21', 'Update data Pointages et Conges at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2018-12-24 08:29:34', NULL),
(119, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/10', 'Update data Pointages Journaliere at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>21</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:29:48', NULL),
(120, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/20', 'Update data Pointage details at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>21</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:29:59', NULL),
(121, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/23', 'Update data Pointages Report at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>21</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:30:12', NULL),
(122, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/3', 'Update data Conges at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>21</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:30:28', NULL),
(123, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/3', 'Update data Conges at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>21</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:31:35', NULL),
(124, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/15', 'Update data Administratif at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:32:08', NULL),
(125, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/9', 'Update data Personnel at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>15</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:32:21', NULL),
(126, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/8', 'Update data Notifications at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>15</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:32:36', NULL),
(127, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/16', 'Update data Projects at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:33:40', NULL),
(128, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/12', 'Update data Projects at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>16</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:33:47', NULL),
(129, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/7', 'Update data Modules at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>16</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:33:53', NULL),
(130, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/14', 'Update data Tasks at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>16</td><td></td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:33:59', NULL),
(131, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/2', 'Update data Commentaires at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>16</td><td></td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:34:07', NULL),
(132, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/17', 'Update data Parametres at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:34:13', NULL),
(133, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/edit-save/6', 'Update data Free days at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>17</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2018-12-24 08:34:20', NULL),
(134, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'abdellah.taha@exo-it.com login with IP Address ::1', '', 6, '2018-12-24 08:34:59', NULL),
(135, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-24 20:51:45', NULL),
(136, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointagesDetails/add-save', 'Add New Data  at Pointage details', '', 1, '2018-12-24 21:42:58', NULL),
(137, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointagesDetails/edit-save/1594', 'Update data  at Pointage details', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>date_pointage</td><td>2018-12-24</td><td>2018-12-25</td></tr><tr><td>time_in</td><td>22:30:15</td><td>00:00:15</td></tr><tr><td>time_out</td><td>22:30:15</td><td>00:00:15</td></tr></tbody></table>', 1, '2018-12-24 22:22:35', NULL),
(138, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/pointagesDetails/delete/1594', 'Delete data 1594 at Pointage details', '', 1, '2018-12-24 23:28:11', NULL),
(139, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-25 07:39:56', NULL),
(140, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-25 12:46:28', NULL),
(141, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-25 14:46:47', NULL),
(142, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-25 18:19:22', NULL),
(143, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-25 18:34:13', NULL),
(144, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-26 07:50:52', NULL),
(145, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/entreprises/add-save', 'Add New Data  at Entreprise', '', 1, '2018-12-26 14:20:57', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(146, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/entreprises/edit-save/1', 'Update data  at Entreprise', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>logo</td><td></td><td>uploads/1/2018-12/Logo.jpg</td></tr></tbody></table>', 1, '2018-12-26 14:25:14', NULL),
(147, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/87', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>libelle</td><td>4 jours Mariage + 1 jour fÃ©rier </td><td>12 Jours = 4 jours Mariage + 1 jour fÃ©rier  + 7 jour de conge</td></tr></tbody></table>', 1, '2018-12-26 14:31:01', NULL),
(148, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/75', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-26 14:34:39', NULL),
(149, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/101', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nbr_days</td><td>33</td><td>18</td></tr></tbody></table>', 1, '2018-12-26 14:36:44', NULL),
(150, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-26 14:37:43', NULL),
(151, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/add-save', 'Add New Data  at Conges', '', 1, '2018-12-26 14:44:36', NULL),
(152, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/10', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>libelle</td><td>Inconnue</td><td>Conge  (Remplacent du jour de mariage)</td></tr><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-26 14:56:23', NULL),
(153, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/9', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>libelle</td><td>Inconnue</td><td>Conge  (Remplacent du jour de mariage)</td></tr><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-26 14:57:08', NULL),
(154, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/conges/edit-save/36', 'Update data  at Conges', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>libelle</td><td>Conge </td><td>Conge   (Remplacent du jour de mariage)</td></tr><tr><td>isJustify</td><td>Non</td><td>Oui</td></tr></tbody></table>', 1, '2018-12-26 14:57:23', NULL),
(155, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/edit-save/6', 'Update data  at Personnel', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cin</td><td></td><td>EE471931</td></tr><tr><td>cnss</td><td></td><td>145169200</td></tr><tr><td>polite</td><td></td><td>Mr.</td></tr><tr><td>mobile</td><td></td><td>+212 6 98 18 01 57</td></tr><tr><td>adress</td><td></td><td>Assif B N 28 Marrakech</td></tr><tr><td>birth_date</td><td>2018-12-12</td><td>1992-05-12</td></tr></tbody></table>', 1, '2018-12-26 15:05:07', NULL),
(156, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/edit-save/5', 'Update data  at Personnel', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>cin</td><td>EE563836</td><td>JA152555</td></tr><tr><td>cnss</td><td></td><td>139893601</td></tr><tr><td>polite</td><td></td><td>Mr.</td></tr><tr><td>mobile</td><td></td><td>+212 6 96 78 43 70</td></tr><tr><td>adress</td><td></td><td>N 193 unite mohammed safou quartier youssef ben tachfine Marrakech</td></tr><tr><td>birth_date</td><td>2018-12-30</td><td>1993-05-15</td></tr><tr><td>family_situation</td><td></td><td>Marie</td></tr><tr><td>number_children</td><td>20</td><td>0</td></tr></tbody></table>', 1, '2018-12-26 15:07:25', NULL),
(157, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/personnels/edit-save/3', 'Update data  at Personnel', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>birth_date</td><td>2018-12-18</td><td>1987-06-24</td></tr><tr><td>gross_salary</td><td>8000</td><td>8092</td></tr><tr><td>number_children</td><td>10</td><td>0</td></tr></tbody></table>', 1, '2018-12-26 15:11:38', NULL),
(158, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Abdelah Taha at Users Management', '', 1, '2018-12-26 15:17:22', NULL),
(159, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/6', 'Update data Abdelah Taha at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/abdellah.jpg</td></tr><tr><td>password</td><td>$2y$10$yDBxto/n.VfWVdFyqVbq3uq6v88g3EqrhAuzgpwx1CQhKqgOoHWtW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:17:31', NULL),
(160, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Abdelah Taha at Users Management', '', 1, '2018-12-26 15:17:42', NULL),
(161, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/6', 'Update data Abdelah Taha at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/abdellah.jpg</td></tr><tr><td>password</td><td>$2y$10$yDBxto/n.VfWVdFyqVbq3uq6v88g3EqrhAuzgpwx1CQhKqgOoHWtW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:22:31', NULL),
(162, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Mohammed Lechiakh at Users Management', '', 1, '2018-12-26 15:22:38', NULL),
(163, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/5', 'Update data Mohammed Lechiakh at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/mohamed.jpg</td></tr><tr><td>password</td><td>$2y$10$nLruciKkSvgWRpe3Ql/jFuor842xhwEdhbg58DYNpkpqFLh8yCsc.</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:25:33', NULL),
(164, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Brahim barjali at Users Management', '', 1, '2018-12-26 15:25:43', NULL),
(165, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/3', 'Update data Brahim barjali at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/brahim.jpg</td></tr><tr><td>password</td><td>$2y$10$1VNoHoqdMcVqTyTmut1.buWEZS5s8c42xFoyy9ioYSnVr9ZYBqJ/y</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:25:55', NULL),
(166, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Oumaima Stitini at Users Management', '', 1, '2018-12-26 15:26:05', NULL),
(167, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/4', 'Update data Oumaima Stitini at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/oumaima.JPG</td></tr><tr><td>password</td><td>$2y$10$EEUbBwoJjeWjJRb3UyQ9Z.SaaojVp3wgAF6RZhnySI6xHD3D2qMTW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:27:55', NULL),
(168, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Noura Bouchbaat at Users Management', '', 1, '2018-12-26 15:28:02', NULL),
(169, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/2', 'Update data Noura Bouchbaat at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/nora.jpg</td></tr><tr><td>password</td><td>$2y$10$DRrv58s/MbKdPcRepj4uDOxZEIOpEKoGOVAZRFUec.3ji9/xmVnju</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 15:28:08', NULL),
(170, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/statistic_builder/add-save', 'Add New Data FirstDashboard at Statistic Builder', '', 1, '2018-12-26 15:29:14', NULL),
(171, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-26 21:49:42', NULL),
(172, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/menu_management/add-save', 'Add New Data Dashboard at Menu Management', '', 1, '2018-12-26 21:56:40', NULL),
(173, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Abdelah Taha at Users Management', '', 1, '2018-12-26 22:43:19', NULL),
(174, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/6', 'Update data Abdelah Taha at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/taha_200_200.png</td></tr><tr><td>password</td><td>$2y$10$yDBxto/n.VfWVdFyqVbq3uq6v88g3EqrhAuzgpwx1CQhKqgOoHWtW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 22:43:42', NULL),
(175, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Mohammed Lechiakh at Users Management', '', 1, '2018-12-26 22:43:50', NULL),
(176, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/5', 'Update data Mohammed Lechiakh at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/simo_200_200.png</td></tr><tr><td>password</td><td>$2y$10$nLruciKkSvgWRpe3Ql/jFuor842xhwEdhbg58DYNpkpqFLh8yCsc.</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 22:43:58', NULL),
(177, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Oumaima Stitini at Users Management', '', 1, '2018-12-26 22:44:05', NULL),
(178, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/4', 'Update data Oumaima Stitini at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/oumaima.png</td></tr><tr><td>password</td><td>$2y$10$EEUbBwoJjeWjJRb3UyQ9Z.SaaojVp3wgAF6RZhnySI6xHD3D2qMTW</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 22:44:16', NULL),
(179, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Brahim barjali at Users Management', '', 1, '2018-12-26 22:44:23', NULL),
(180, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/3', 'Update data Brahim barjali at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/bihi_200_200.png</td></tr><tr><td>password</td><td>$2y$10$1VNoHoqdMcVqTyTmut1.buWEZS5s8c42xFoyy9ioYSnVr9ZYBqJ/y</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 22:44:33', NULL),
(181, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Noura Bouchbaat at Users Management', '', 1, '2018-12-26 22:44:42', NULL),
(182, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/2', 'Update data Noura Bouchbaat at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/noura.png</td></tr><tr><td>password</td><td>$2y$10$DRrv58s/MbKdPcRepj4uDOxZEIOpEKoGOVAZRFUec.3ji9/xmVnju</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2018-12-26 22:45:13', NULL),
(183, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/delete-image', 'Delete the image of Achraf Saloumi at Users Management', '', 1, '2018-12-26 22:45:21', NULL),
(184, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/users/edit-save/1', 'Update data Achraf Saloumi at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/achraf600_600.png</td></tr><tr><td>password</td><td>$2y$10$JWPs.xq1VebGO./hZhrEkuRON/B7E7oSr6tRHgE7zYfo8/ENGxdgy</td><td></td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2018-12-26 22:45:37', NULL),
(185, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-26 22:45:54', NULL),
(186, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Avast/70.0.917.103', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-26 22:47:51', NULL),
(187, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-26 23:04:49', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_menus`
--

DROP TABLE IF EXISTS `cms_menus`;
CREATE TABLE IF NOT EXISTS `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Clients', 'Route', 'AdminClientsControllerGetIndex', NULL, 'fa fa-users', 16, 1, 0, 1, 5, '2018-12-14 21:59:26', NULL),
(2, 'Commentaires', 'Route', 'AdminCommentsControllerGetIndex', 'normal', 'fa fa-file-o', 16, 1, 0, 1, 4, '2018-12-14 22:04:01', '2018-12-24 08:34:07'),
(3, 'Conges', 'Route', 'AdminCongesControllerGetIndex', 'normal', 'fa fa-share-square-o', 21, 1, 0, 1, 4, '2018-12-14 22:06:56', '2018-12-24 08:31:35'),
(4, 'Document administratif', 'Route', 'AdminDocumentsControllerGetIndex', NULL, 'fa fa-file-pdf-o', 15, 1, 0, 1, 3, '2018-12-14 22:10:01', NULL),
(5, 'Entreprise', 'Route', 'AdminEntreprisesControllerGetIndex', NULL, 'fa fa-home', 17, 1, 0, 1, 3, '2018-12-14 22:12:10', NULL),
(6, 'Free days', 'Route', 'AdminFreedaysControllerGetIndex', 'normal', 'fa fa-birthday-cake', 17, 1, 0, 1, 2, '2018-12-15 08:01:20', '2018-12-24 08:34:20'),
(7, 'Modules', 'Route', 'AdminModulesControllerGetIndex', 'normal', 'fa fa-th', 16, 1, 0, 1, 2, '2018-12-15 08:03:18', '2018-12-24 08:33:53'),
(8, 'Notifications', 'Route', 'AdminNotifications19ControllerGetIndex', 'normal', 'fa fa-thumbs-o-up', 15, 1, 0, 1, 2, '2018-12-15 08:05:09', '2018-12-24 08:32:36'),
(9, 'Personnel', 'Route', 'AdminPersonnelsControllerGetIndex', 'normal', 'fa fa-user-md', 15, 1, 0, 1, 1, '2018-12-15 08:07:51', '2018-12-24 08:32:21'),
(10, 'Pointages Journaliere', 'Module', 'pointages_journaliere', 'normal', 'fa fa-user-times', 21, 1, 0, 1, 1, '2018-12-15 08:09:39', '2018-12-24 08:29:48'),
(11, 'Profession', 'Route', 'AdminProfessionsControllerGetIndex', NULL, 'fa fa-star', 17, 1, 0, 1, 1, '2018-12-15 08:12:17', NULL),
(12, 'Projects', 'Route', 'AdminProjectsControllerGetIndex', 'normal', 'fa fa-signal', 16, 1, 0, 1, 1, '2018-12-15 08:18:50', '2018-12-24 08:33:47'),
(13, 'Spent / Revenue', 'Route', 'AdminSpentRevenuesControllerGetIndex', NULL, 'fa fa-money', 15, 1, 0, 1, 4, '2018-12-15 08:23:11', NULL),
(14, 'Tasks', 'Route', 'AdminTasksControllerGetIndex', 'normal', 'fa fa-inbox', 16, 1, 0, 1, 3, '2018-12-15 08:25:31', '2018-12-24 08:33:59'),
(15, 'Administratif', 'URL', '#', 'normal', 'fa fa-user', 0, 1, 0, 1, 2, '2018-12-15 08:57:22', '2018-12-24 08:32:08'),
(16, 'Projects', 'URL', '#', 'normal', 'fa fa-th-list', 0, 1, 0, 1, 3, '2018-12-15 08:58:16', '2018-12-24 08:33:40'),
(17, 'Parametres', 'URL', '#', 'normal', 'fa fa-gears', 0, 1, 0, 1, 4, '2018-12-15 08:58:49', '2018-12-24 08:34:13'),
(20, 'Pointage details', 'Route', 'AdminPointagesDetailsControllerGetIndex', 'normal', 'fa fa-road', 21, 1, 0, 1, 2, '2018-12-18 21:22:00', '2018-12-24 08:29:59'),
(21, 'Pointages et Conges', 'URL', '#', 'normal', 'fa fa-users', 0, 1, 0, 1, 1, '2018-12-18 21:28:39', '2018-12-24 08:29:34'),
(23, 'Pointages Report', 'Route', 'AdminPointages1ControllerGetIndex', 'normal', 'fa fa-bar-chart', 21, 1, 0, 1, 3, '2018-12-20 20:52:09', '2018-12-24 08:30:12'),
(24, 'Dashboard', 'Controller & Method', 'HomeController@index', 'normal', 'fa fa-bars', 0, 1, 1, 1, NULL, '2018-12-26 21:56:40', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_menus_privileges`
--

DROP TABLE IF EXISTS `cms_menus_privileges`;
CREATE TABLE IF NOT EXISTS `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(1, 1, 1),
(4, 4, 1),
(5, 5, 1),
(11, 11, 1),
(13, 13, 1),
(18, 18, 1),
(22, 19, 1),
(25, 22, 1),
(28, 21, 1),
(29, 21, 2),
(30, 10, 1),
(31, 10, 2),
(32, 20, 1),
(33, 20, 2),
(34, 23, 1),
(35, 23, 2),
(38, 3, 1),
(39, 3, 2),
(40, 15, 1),
(41, 15, 2),
(42, 9, 1),
(43, 9, 2),
(44, 8, 1),
(45, 8, 2),
(46, 16, 1),
(47, 16, 2),
(48, 12, 1),
(49, 12, 2),
(50, 7, 1),
(51, 7, 2),
(52, 14, 1),
(53, 14, 2),
(54, 2, 1),
(55, 2, 2),
(56, 17, 1),
(57, 17, 2),
(58, 6, 1),
(59, 6, 2),
(60, 24, 1),
(61, 24, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cms_moduls`
--

DROP TABLE IF EXISTS `cms_moduls`;
CREATE TABLE IF NOT EXISTS `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2018-12-14 09:00:47', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2018-12-14 09:00:47', NULL, NULL),
(12, 'Clients', 'fa fa-users', 'clients', 'clients', 'AdminClientsController', 0, 0, '2018-12-14 21:59:26', NULL, NULL),
(13, 'Commentaires', 'fa fa-file-o', 'comments', 'comments', 'AdminCommentsController', 0, 0, '2018-12-14 22:04:00', NULL, NULL),
(14, 'Conges', 'fa fa-share-square-o', 'conges', 'conges', 'AdminCongesController', 0, 0, '2018-12-14 22:06:56', NULL, NULL),
(15, 'Document administratif', 'fa fa-file-pdf-o', 'documents', 'documents', 'AdminDocumentsController', 0, 0, '2018-12-14 22:10:01', NULL, NULL),
(16, 'Entreprise', 'fa fa-home', 'entreprises', 'entreprises', 'AdminEntreprisesController', 0, 0, '2018-12-14 22:12:10', NULL, NULL),
(17, 'Free days', 'fa fa-birthday-cake', 'freedays', 'freedays', 'AdminFreedaysController', 0, 0, '2018-12-15 08:01:20', NULL, NULL),
(18, 'Modules', 'fa fa-th', 'modules', 'modules', 'AdminModulesController', 0, 0, '2018-12-15 08:03:18', NULL, NULL),
(19, 'Notifications', 'fa fa-thumbs-o-up', 'notifications19', 'notifications', 'AdminNotifications19Controller', 0, 0, '2018-12-15 08:05:09', NULL, NULL),
(20, 'Personnel', 'fa fa-user-md', 'personnels', 'personnels', 'AdminPersonnelsController', 0, 0, '2018-12-15 08:07:51', NULL, NULL),
(21, 'Pointages', 'fa fa-user-times', 'pointages_journaliere', 'pointages_journaliere', 'AdminPointagesController', 0, 0, '2018-12-15 08:09:38', NULL, NULL),
(22, 'Profession', 'fa fa-star', 'professions', 'professions', 'AdminProfessionsController', 0, 0, '2018-12-15 08:12:17', NULL, NULL),
(23, 'Projects', 'fa fa-signal', 'projects', 'projects', 'AdminProjectsController', 0, 0, '2018-12-15 08:18:50', NULL, NULL),
(24, 'Spent / Revenue', 'fa fa-money', 'spent_revenues', 'spent_revenues', 'AdminSpentRevenuesController', 0, 0, '2018-12-15 08:23:11', NULL, NULL),
(25, 'Tasks', 'fa fa-inbox', 'tasks', 'tasks', 'AdminTasksController', 0, 0, '2018-12-15 08:25:31', NULL, NULL),
(26, 'Users', 'fa fa-user-secret', 'cms_users', 'cms_users', 'AdminCmsUsers1Controller', 0, 0, '2018-12-17 13:21:01', NULL, NULL),
(27, 'Pointage details', 'fa fa-road', 'pointagesDetails', 'pointages', 'AdminPointagesDetailsController', 0, 0, '2018-12-18 21:22:00', NULL, NULL),
(28, 'Pointages Report', 'fa fa-bar-chart', 'cms_users29', 'cms_users', 'AdminPointages1Controller', 0, 0, '2018-12-20 20:52:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_notifications`
--

DROP TABLE IF EXISTS `cms_notifications`;
CREATE TABLE IF NOT EXISTS `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cms_privileges`
--

DROP TABLE IF EXISTS `cms_privileges`;
CREATE TABLE IF NOT EXISTS `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-red', '2018-12-14 09:00:47', NULL),
(2, 'User', 0, 'skin-blue', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_privileges_roles`
--

DROP TABLE IF EXISTS `cms_privileges_roles`;
CREATE TABLE IF NOT EXISTS `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 1, 1, '2018-12-14 09:00:47', NULL),
(2, 1, 1, 1, 1, 1, 1, 2, '2018-12-14 09:00:47', NULL),
(3, 0, 1, 1, 1, 1, 1, 3, '2018-12-14 09:00:47', NULL),
(4, 1, 1, 1, 1, 1, 1, 4, '2018-12-14 09:00:47', NULL),
(5, 1, 1, 1, 1, 1, 1, 5, '2018-12-14 09:00:47', NULL),
(6, 1, 1, 1, 1, 1, 1, 6, '2018-12-14 09:00:47', NULL),
(7, 1, 1, 1, 1, 1, 1, 7, '2018-12-14 09:00:47', NULL),
(8, 1, 1, 1, 1, 1, 1, 8, '2018-12-14 09:00:47', NULL),
(9, 1, 1, 1, 1, 1, 1, 9, '2018-12-14 09:00:47', NULL),
(10, 1, 1, 1, 1, 1, 1, 10, '2018-12-14 09:00:47', NULL),
(11, 1, 0, 1, 0, 1, 1, 11, '2018-12-14 09:00:47', NULL),
(12, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(19, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(20, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(21, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(22, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(24, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(25, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(26, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(27, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(28, 1, 1, 1, 1, 1, 1, 28, NULL, NULL),
(29, 1, 1, 1, 1, 1, 2, 13, NULL, NULL),
(30, 1, 1, 1, 0, 0, 2, 14, NULL, NULL),
(31, 1, 0, 1, 0, 0, 2, 15, NULL, NULL),
(32, 1, 0, 1, 0, 0, 2, 17, NULL, NULL),
(33, 1, 1, 1, 1, 1, 2, 18, NULL, NULL),
(34, 1, 1, 1, 1, 1, 2, 19, NULL, NULL),
(35, 1, 0, 1, 0, 0, 2, 20, NULL, NULL),
(36, 1, 0, 0, 0, 0, 2, 27, NULL, NULL),
(37, 1, 0, 0, 0, 0, 2, 21, NULL, NULL),
(38, 1, 0, 0, 0, 0, 2, 28, NULL, NULL),
(39, 1, 0, 0, 0, 0, 2, 23, NULL, NULL),
(40, 1, 1, 1, 1, 1, 2, 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_settings`
--

DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2018-12-14 09:00:47', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2018-12-14 09:00:47', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2018-12/0c7916bfa90c2b5e29958c2616ad7fc0.jpg', 'upload_image', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'achraf.saloumi@exo-it.com', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', NULL, 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', NULL, 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', NULL, 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'Software', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2018-12-14 09:00:47', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2018-12/16c952a48fd5cc9872481da00395f126.jpg', 'upload_image', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', 'uploads/2018-12/b69f81914182c40bb616227fc882f722.png', 'upload_image', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Structure de la table `cms_statistics`
--

DROP TABLE IF EXISTS `cms_statistics`;
CREATE TABLE IF NOT EXISTS `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_statistics`
--

INSERT INTO `cms_statistics` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Projects', 'projects', '2018-12-17 13:05:49', NULL),
(2, 'FirstDashboard', 'firstdashboard', '2018-12-26 15:29:14', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_statistic_components`
--

DROP TABLE IF EXISTS `cms_statistic_components`;
CREATE TABLE IF NOT EXISTS `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_statistic_components`
--

INSERT INTO `cms_statistic_components` (`id`, `id_cms_statistics`, `componentID`, `component_name`, `area_name`, `sorting`, `name`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, '16a70ca6145101b89bb2895892c21532', 'smallbox', 'area1', 0, NULL, '{\"name\":\"Projects\",\"icon\":\"ion-users\",\"color\":\"bg-green\",\"link\":\"projects\",\"sql\":\"select count(id) from projects\"}', '2018-12-17 13:06:08', NULL),
(2, 2, 'e29b3672468e39677409f757a8188fc3', 'smallbox', 'area2', 0, 'Untitled', NULL, '2018-12-26 15:29:48', NULL),
(3, 2, 'dcfc3b990a43f1b62d5294f4e0b508a7', 'smallbox', 'area3', 0, 'Untitled', NULL, '2018-12-26 15:29:55', NULL),
(4, 2, '80f8f94d7976429a24612152f7d88bc0', 'smallbox', 'area1', 0, 'Untitled', NULL, '2018-12-26 15:30:00', NULL),
(5, 2, 'af1fdba080369896a468f4fb263dbced', 'smallbox', 'area4', 0, 'Untitled', NULL, '2018-12-26 15:30:11', NULL),
(6, 2, 'a416531892f19ad9cbfec49789939b44', 'smallbox', NULL, 0, 'Untitled', NULL, '2018-12-26 15:30:20', NULL),
(7, 1, 'b7b5f1dcd4d50e7be63201c3344239a5', 'panelcustom', 'area5', 0, 'Untitled', NULL, '2018-12-26 21:50:39', NULL),
(8, 1, 'db61469d63bb9962957193dbb5452fab', 'panelcustom', NULL, 0, 'Untitled', NULL, '2018-12-26 21:51:02', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Achraf Saloumi', 'uploads/1/2018-12/achraf600_600.png', 'achraf.saloumi@exo-it.com', '$2y$10$JWPs.xq1VebGO./hZhrEkuRON/B7E7oSr6tRHgE7zYfo8/ENGxdgy', 1, '2018-12-14 09:00:47', '2018-12-26 22:45:37', 'Active'),
(2, 'Noura Bouchbaat', 'uploads/1/2018-12/noura.png', 'noura.bouchbaat@exo-it.com', '$2y$10$DRrv58s/MbKdPcRepj4uDOxZEIOpEKoGOVAZRFUec.3ji9/xmVnju', 2, '2018-12-15 09:23:34', '2018-12-26 22:45:13', NULL),
(3, 'Brahim barjali', 'uploads/1/2018-12/bihi_200_200.png', 'brahim.barjali@exo-it.com', '$2y$10$1VNoHoqdMcVqTyTmut1.buWEZS5s8c42xFoyy9ioYSnVr9ZYBqJ/y', 2, '2018-12-15 09:24:16', '2018-12-26 22:44:33', NULL),
(4, 'Oumaima Stitini', 'uploads/1/2018-12/oumaima.png', 'oumaima.stitini@exo-it.com', '$2y$10$EEUbBwoJjeWjJRb3UyQ9Z.SaaojVp3wgAF6RZhnySI6xHD3D2qMTW', 1, '2018-12-15 09:25:20', '2018-12-26 22:44:16', NULL),
(5, 'Mohammed Lechiakh', 'uploads/1/2018-12/simo_200_200.png', 'mohammed.lechiakh@exo-it.com', '$2y$10$nLruciKkSvgWRpe3Ql/jFuor842xhwEdhbg58DYNpkpqFLh8yCsc.', 2, '2018-12-15 09:26:14', '2018-12-26 22:43:58', NULL),
(6, 'Abdelah Taha', 'uploads/1/2018-12/taha_200_200.png', 'abdellah.taha@exo-it.com', '$2y$10$yDBxto/n.VfWVdFyqVbq3uq6v88g3EqrhAuzgpwx1CQhKqgOoHWtW', 2, '2018-12-15 09:26:55', '2018-12-26 22:43:42', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `id_users` int(10) UNSIGNED NOT NULL,
  `id_tasks` int(11) NOT NULL,
  `date_comment` datetime NOT NULL,
  `description` text NOT NULL,
  `isNew` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_users`),
  KEY `id_task` (`id_tasks`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conges`
--

DROP TABLE IF EXISTS `conges`;
CREATE TABLE IF NOT EXISTS `conges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `libelle` text NOT NULL,
  `nbr_days` int(11) NOT NULL,
  `isValid` varchar(3) DEFAULT NULL,
  `isJustify` varchar(3) DEFAULT NULL,
  `date_request` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conges`
--

INSERT INTO `conges` (`id`, `id_users`, `start_date`, `end_date`, `libelle`, `nbr_days`, `isValid`, `isJustify`, `date_request`) VALUES
(8, 6, '2018-01-31', '2018-01-31', 'Retard', 1, 'Oui', 'Non', '2018-01-31'),
(9, 6, '2018-02-05', '2018-02-05', 'Conge  (Remplacent du jour de mariage)', 1, 'Oui', 'Oui', '2018-02-05'),
(10, 6, '2018-03-19', '2018-03-19', 'Conge  (Remplacent du jour de mariage)', 2, 'Oui', 'Oui', '2018-03-19'),
(12, 6, '2018-04-02', '2018-04-02', 'Retard', 1, 'Oui', 'Non', '2018-04-02'),
(13, 6, '2018-03-30', '2018-03-30', 'Retard', 1, 'Oui', 'Non', '2018-03-30'),
(14, 2, '2018-01-08', '2018-01-11', 'Conge', 4, 'Oui', 'Non', '2018-01-08'),
(15, 2, '2018-02-05', '2018-02-09', 'Conge', 5, 'Oui', 'Non', '2018-02-05'),
(16, 3, '2018-01-24', '2018-01-24', 'Conge', 1, 'Oui', 'Non', '2018-01-24'),
(17, 3, '2018-04-09', '2018-04-16', 'Conge', 6, 'Oui', 'Non', '2018-04-09'),
(21, 5, '2018-02-01', '2018-02-01', 'Conge', 1, 'Oui', 'Non', '2018-02-01'),
(22, 5, '2018-04-02', '2018-04-04', 'Conge', 3, 'Oui', 'Non', '2018-04-02'),
(23, 1, '2014-08-18', '2014-08-29', 'Conge', 10, 'Oui', 'Non', '2014-08-18'),
(24, 1, '2014-12-12', '2014-12-16', 'Weeding party', 2, 'Oui', 'Oui', '2014-12-12'),
(25, 1, '2016-05-05', '2016-05-06', 'Conge', 2, 'Oui', 'Non', '2016-05-05'),
(26, 1, '2015-09-28', '2015-10-14', 'Conge', 13, 'Oui', 'Non', '2015-09-28'),
(27, 1, '2016-09-15', '2016-09-16', 'Conge', 2, 'Oui', 'Non', '2016-09-15'),
(28, 1, '2017-03-17', '2017-03-17', 'Conge', 1, 'Oui', 'Non', '2017-03-17'),
(29, 1, '2017-05-15', '2017-05-21', 'Conge', 5, 'Oui', 'Non', '2017-05-15'),
(30, 1, '2017-06-06', '2017-06-06', 'Conge', 0, 'Oui', 'Non', '2017-06-06'),
(31, 1, '2017-06-09', '2017-06-09', 'Conge', 1, 'Oui', 'Non', '2017-06-09'),
(32, 1, '2017-08-04', '2017-08-04', 'Conge', 0, 'Oui', 'Non', '2017-08-04'),
(33, 1, '2017-09-04', '2017-09-10', 'Conge', 5, 'Oui', 'Non', '2017-09-04'),
(34, 1, '2016-12-05', '2016-12-16', 'Conge payé', 10, 'Oui', 'Non', '2016-12-05'),
(35, 2, '2018-06-06', '2018-06-06', 'Conge', 1, 'Oui', 'Non', '2018-06-06'),
(36, 6, '2018-07-05', '2018-07-05', 'Conge   (Remplacent du jour de mariage)', 1, 'Oui', 'Oui', '2018-07-05'),
(38, 1, '2014-11-24', '2014-11-25', 'Conge', 2, 'Oui', 'Non', '2014-11-24'),
(40, 1, '2017-11-10', '2017-11-10', 'Conge', 1, 'Oui', 'Non', '2017-11-10'),
(41, 1, '2017-12-11', '2017-12-12', 'Conge', 2, 'Oui', 'Non', '2017-12-11'),
(42, 2, '2014-08-04', '2014-08-15', 'Conge', 10, 'Oui', 'Non', '2014-08-04'),
(43, 2, '2014-12-12', '2014-12-16', 'Conge', 3, 'Oui', 'Non', '2014-12-12'),
(44, 2, '2015-03-24', '2015-03-24', 'Conge', 1, 'Oui', 'Non', '2015-03-24'),
(45, 2, '2015-09-28', '2015-10-15', 'Conge', 13, 'Oui', 'Non', '2015-09-28'),
(46, 2, '2016-09-15', '2016-09-16', 'Conge', 2, 'Oui', 'Non', '2016-09-15'),
(47, 2, '2017-02-03', '2017-02-03', 'Conge', 1, 'Oui', 'Non', '2017-02-03'),
(48, 2, '2017-03-21', '2017-03-22', 'Conge', 2, 'Oui', 'Non', '2017-03-21'),
(49, 2, '2017-05-15', '2017-05-21', 'Conge', 5, 'Oui', 'Non', '2017-05-15'),
(50, 2, '2017-06-06', '2017-06-07', 'Conge', 2, 'Oui', 'Non', '2017-06-06'),
(51, 2, '2017-07-04', '2017-07-04', 'Conge', 1, 'Oui', 'Non', '2017-07-04'),
(52, 2, '2017-08-04', '2017-08-04', 'Conge', 1, 'Oui', 'Non', '2017-08-04'),
(53, 2, '2017-09-04', '2017-10-09', 'Conge', 5, 'Oui', 'Non', '2017-09-04'),
(54, 2, '2017-12-04', '2017-12-04', 'Conge', 1, 'Oui', 'Non', '2017-12-04'),
(55, 2, '2018-01-03', '2018-01-24', 'Conge', 1, 'Oui', 'Non', '2018-01-03'),
(56, 2, '2018-01-05', '2018-01-05', 'Conge', 1, 'Oui', 'Non', '2018-01-05'),
(57, 2, '2018-01-08', '2018-01-08', 'Conge', 1, 'Oui', 'Non', '2018-01-08'),
(58, 2, '2018-02-12', '2018-02-15', 'Conge', 4, 'Oui', 'Non', '2018-02-12'),
(59, 2, '2018-03-02', '2018-03-02', 'Conge', 1, 'Oui', 'Non', '2018-03-02'),
(60, 2, '2018-05-14', '2018-05-14', 'Conge', 1, 'Oui', 'Non', '2018-05-14'),
(61, 2, '2018-06-11', '2018-06-11', 'Conge', 1, 'Oui', 'Non', '2018-06-11'),
(62, 2, '2018-06-18', '2018-06-18', 'Conge', 1, 'Oui', 'Non', '2018-06-18'),
(63, 2, '2018-06-06', '2018-06-06', 'Conge', 1, 'Oui', 'Non', '2018-06-06'),
(64, 2, '2018-07-18', '2018-07-24', 'Conge Maladie', 5, 'Oui', 'Oui', '2018-07-18'),
(65, 5, '2018-07-16', '2018-07-17', 'Conge relaxing', 2, 'Oui', 'Non', '2018-07-16'),
(66, 6, '2018-11-01', '2018-11-02', 'Malade certifier', 2, 'Oui', 'Oui', '2018-11-01'),
(67, 1, '2018-11-02', '2018-11-02', 'Conge certifie : nouvelle naissance', 1, 'Oui', 'Oui', '2018-11-02'),
(68, 2, '2018-11-01', '2019-01-31', 'Conge de maternite', 65, 'Oui', 'Oui', '2018-11-01'),
(69, 1, '2018-11-12', '2018-11-12', 'Conge maladie', 1, 'Oui', 'Oui', '2018-11-12'),
(70, 1, '2018-11-14', '2018-11-14', 'Conge justifier (parmi les 3 jouor du nouvelle naissance)', 1, 'Oui', 'Oui', '2018-11-14'),
(73, 6, '2018-12-04', '2018-12-04', 'Conge', 1, 'Oui', 'Non', '2018-12-04'),
(74, 3, '2018-12-06', '2018-12-07', 'Conge', 2, 'Oui', 'Non', '2018-12-06'),
(75, 6, '2018-12-17', '2018-12-18', 'Conge', 2, 'Oui', 'Oui', '2018-12-17'),
(76, 5, '2017-02-13', '2017-02-16', 'Preparation Doctora', 4, 'Oui', 'Non', '2017-02-13'),
(77, 5, '2017-06-12', '2017-06-14', 'Preparation Doctorat', 3, 'Oui', 'Non', '2017-06-12'),
(78, 5, '2017-07-17', '2017-07-17', 'fatigue', 1, 'Oui', 'Non', '2017-07-17'),
(79, 5, '2017-08-01', '2017-08-01', 'fatigue', 1, 'Oui', 'Non', '2017-08-01'),
(80, 5, '2017-09-25', '2017-09-25', 'fatigue', 1, 'Oui', 'Non', '2017-09-25'),
(81, 5, '2017-10-25', '2017-10-25', 'trop fatigue', 1, 'Oui', 'Non', '2017-10-25'),
(82, 5, '2017-11-23', '2017-11-24', 'Preparation Doctorat', 2, 'Oui', 'Non', '2017-11-23'),
(83, 5, '2018-01-17', '2018-01-17', 'relaxing', 1, 'Oui', 'Non', '2018-01-17'),
(84, 5, '2018-04-04', '2018-04-06', 'Preparation Doctorat', 3, 'Oui', 'Non', '2018-04-04'),
(85, 5, '2018-05-15', '2018-05-16', 'Preparation Doctora', 2, 'Oui', 'Non', '2018-05-15'),
(86, 5, '2018-05-31', '2018-05-31', 'Preparation Doctora', 1, 'Oui', 'Non', '2018-05-31'),
(87, 5, '2018-08-30', '2018-09-16', '12 Jours = 4 jours Mariage + 1 jour fÃ©rier  + 7 jour de conge', 7, 'Oui', 'Non', '2018-08-30'),
(88, 5, '2018-11-27', '2018-11-27', 'Preparation Doctorat', 1, 'Oui', 'Non', '2018-11-27'),
(89, 5, '2018-03-23', '2018-03-23', 'Preparation Doctora', 0, 'Oui', 'Non', '2018-03-23'),
(90, 2, '2017-04-07', '2017-04-08', 'Conge', 1, 'Oui', 'Non', '2018-12-23'),
(91, 2, '2017-05-23', '2017-05-24', 'Conge', 1, 'Oui', 'Non', '2018-12-23'),
(92, 2, '2015-12-07', '2016-06-06', 'Conge de maternite', 98, 'Oui', 'Oui', '2018-12-23'),
(93, 1, '2017-10-16', '2017-10-17', 'Conge', 1, 'Oui', 'Non', '2018-12-23'),
(94, 1, '2018-08-13', '2018-08-28', 'Conge + Free days + aid', 4, 'Oui', 'Non', '2018-12-23'),
(95, 3, '2018-09-17', '2018-09-30', 'Conge', 10, 'Oui', 'Non', '2018-12-23'),
(96, 3, '2018-01-03', '2018-01-03', 'Conge half day', 1, 'Oui', 'Non', '2018-12-23'),
(97, 3, '2017-01-02', '2017-01-25', 'Conge 2017', 17, 'Oui', 'Non', '2018-12-23'),
(98, 3, '2016-01-04', '2019-01-01', 'Conge 2016', 22, 'Oui', 'Non', '2018-12-23'),
(99, 3, '2015-01-05', '2015-01-21', 'Conge 2015', 12, 'Oui', 'Non', '2018-12-23'),
(101, 6, '2017-10-02', '2017-11-30', 'Conge 2017', 18, 'Oui', 'Non', '2018-12-23'),
(102, 6, '2018-09-03', '2018-09-24', 'Conge 2018 avant mois 11', 9, 'Oui', 'Non', '2018-12-23'),
(103, 6, '2017-11-20', '2017-12-10', 'Conge maladie', 15, 'Oui', 'Oui', '2017-11-20'),
(104, 3, '2016-02-01', '2016-03-02', 'Conge', 22, 'Oui', 'Non', '2016-02-01');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `document` blob NOT NULL,
  `date_impression` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `social_reason`, `mobile`, `phone`, `adress`, `zip_code`, `rc`, `patente`, `idfisc`, `logo`) VALUES
(1, 'Software S.A.R.L', '+212 5 24 4 93 52', '212653903659', 'App 6 2eme étage M\'HITA espace AL moustapha Semlalia Marrakech', '40000', '58467', '92110189', '0652837', 'uploads/1/2018-12/Logo.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `freedays`
--

DROP TABLE IF EXISTS `freedays`;
CREATE TABLE IF NOT EXISTS `freedays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` text,
  `isFixed` tinyint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `nbr_days` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `freedays`
--

INSERT INTO `freedays` (`id`, `pattern`, `isFixed`, `start_date`, `end_date`, `nbr_days`) VALUES
(1, 'La marche verte', 1, '2018-11-06', '2018-11-07', 1),
(2, 'Fete de l’indépendance ', 1, '2018-11-18', '2018-11-19', 1),
(3, 'Aid mawlid nabawi ', 1, '2018-11-20', '2018-11-21', 1),
(4, 'Jour de l\'an', 1, '2019-01-01', '2019-01-02', 1),
(5, 'Manifeste de l\'Indépendance', 1, '2019-01-11', '2019-01-12', 1),
(6, 'Fete Du Travail', 1, '2019-04-01', '2019-05-02', 31),
(7, 'Fete Du Trone', 1, '2019-07-30', '2019-07-31', 1),
(8, 'Allégeance Oued Eddahab', 1, '2019-08-14', '2019-08-15', 1),
(9, 'La Révolution Du Roi et du peuple', 1, '2019-08-20', '2019-08-21', 1),
(10, 'Fete de la jeunesse', 1, '2019-08-21', '2019-08-22', 1),
(11, 'Fete de l’indépendance ', 1, '2019-11-18', '2019-11-19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_08_07_145904_add_table_cms_apicustom', 1),
(2, '2016_08_07_150834_add_table_cms_dashboard', 1),
(3, '2016_08_07_151210_add_table_cms_logs', 1),
(4, '2016_08_07_151211_add_details_cms_logs', 1),
(5, '2016_08_07_152014_add_table_cms_privileges', 1),
(6, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(7, '2016_08_07_152320_add_table_cms_settings', 1),
(8, '2016_08_07_152421_add_table_cms_users', 1),
(9, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(10, '2016_08_07_154624_add_table_cms_moduls', 1),
(11, '2016_08_17_225409_add_status_cms_users', 1),
(12, '2016_08_20_125418_add_table_cms_notifications', 1),
(13, '2016_09_04_033706_add_table_cms_email_queues', 1),
(14, '2016_09_16_035347_add_group_setting', 1),
(15, '2016_09_16_045425_add_label_setting', 1),
(16, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(17, '2016_10_01_141740_add_method_type_apicustom', 1),
(18, '2016_10_01_141846_add_parameters_apicustom', 1),
(19, '2016_10_01_141934_add_responses_apicustom', 1),
(20, '2016_10_01_144826_add_table_apikey', 1),
(21, '2016_11_14_141657_create_cms_menus', 1),
(22, '2016_11_15_132350_create_cms_email_templates', 1),
(23, '2016_11_15_190410_create_cms_statistics', 1),
(24, '2016_11_17_102740_create_cms_statistic_components', 1),
(25, '2017_06_06_164501_add_deleted_at_cms_moduls', 1);

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
-- Structure de la table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `readed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

DROP TABLE IF EXISTS `personnels`;
CREATE TABLE IF NOT EXISTS `personnels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) UNSIGNED NOT NULL,
  `cin` varchar(50) NOT NULL,
  `cnss` varchar(50) NOT NULL,
  `polite` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `adress` text NOT NULL,
  `hiring_date` date NOT NULL,
  `exit_date` date DEFAULT NULL,
  `birth_date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  `id_professions` int(11) NOT NULL,
  `net_salary` float NOT NULL,
  `gross_salary` float NOT NULL,
  `family_situation` varchar(50) NOT NULL,
  `number_children` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`),
  KEY `id_professions` (`id_professions`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnels`
--

INSERT INTO `personnels` (`id`, `id_users`, `cin`, `cnss`, `polite`, `mobile`, `adress`, `hiring_date`, `exit_date`, `birth_date`, `order_number`, `id_professions`, `net_salary`, `gross_salary`, `family_situation`, `number_children`) VALUES
(1, 1, 'HA132209', '140924898', 'Mr.', '+212 6 53 90 36 59', 'Zaouia derb derraz N1 Marrakeche', '2014-02-03', '2014-02-03', '1985-09-07', 1, 2, 7400, 8511, 'Mariée', 2),
(2, 2, 'EE260962', '140925490', 'Mme', '+212 6 28 80 30 44', 'Zaouia Derb derraz N1', '2014-02-03', '2014-02-03', '1987-05-28', 2, 1, 7000, 8011, 'Mariee', 2),
(3, 3, 'P245848', '175781099', 'Mr.', '', '', '2015-01-01', '2015-01-01', '1987-06-24', 3, 1, 7000, 8092, 'Celibataire', 0),
(4, 4, 'EE563836', '126654117', 'Mlle', '0664282238', 'El Moukef Derb Toudgha n 125 bis Marrakech', '2018-09-02', '2021-01-06', '2018-12-12', 9, 1, 5600, 6210, 'Célibataire', 0),
(5, 5, 'JA152555', '139893601', 'Mr.', '+212 6 96 78 43 70', 'N 193 unite mohammed safou quartier youssef ben tachfine Marrakech', '2016-11-01', '2016-11-01', '1993-05-15', 7, 1, 6257, 7063, 'Marie', 0),
(6, 6, 'EE471931', '145169200', 'Mr.', '+212 6 98 18 01 57', 'Assif B N 28 Marrakech', '2017-01-01', '2017-01-01', '1992-05-12', 8, 1, 6800, 7727, 'Marie', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pointages`
--

DROP TABLE IF EXISTS `pointages`;
CREATE TABLE IF NOT EXISTS `pointages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) UNSIGNED NOT NULL,
  `date_pointage` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=1631 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pointages`
--

INSERT INTO `pointages` (`id`, `id_users`, `date_pointage`, `time_in`, `time_out`) VALUES
(1178, 1, '2018-11-01', '09:05:19', '12:47:04'),
(1179, 4, '2018-11-01', '09:05:24', '17:01:23'),
(1180, 6, '2018-11-01', '09:05:29', '12:24:16'),
(1181, 5, '2018-11-01', '09:11:03', '13:13:01'),
(1182, 3, '2018-11-01', '09:12:40', '09:14:55'),
(1183, 3, '2018-11-01', '09:15:02', '09:50:23'),
(1184, 3, '2018-11-01', '10:05:56', '12:47:06'),
(1185, 6, '2018-11-01', '13:14:55', '14:25:01'),
(1186, 3, '2018-11-01', '13:39:59', '17:05:13'),
(1187, 1, '2018-11-01', '13:40:00', '16:09:01'),
(1188, 5, '2018-11-01', '14:18:06', '18:20:38'),
(1189, 4, '2018-11-02', '09:03:32', '12:46:13'),
(1190, 3, '2018-11-02', '09:10:28', '13:00:35'),
(1191, 5, '2018-11-02', '09:15:47', '13:23:13'),
(1192, 3, '2018-11-02', '13:41:45', '17:26:11'),
(1193, 4, '2018-11-02', '13:56:14', '17:42:24'),
(1194, 5, '2018-11-02', '14:35:04', '18:32:28'),
(1195, 1, '2018-11-05', '09:33:42', '10:55:45'),
(1196, 4, '2018-11-06', '08:36:37', '17:33:41'),
(1197, 1, '2018-11-06', '08:59:17', '12:40:38'),
(1198, 6, '2018-11-06', '09:11:23', '13:02:07'),
(1199, 5, '2018-11-06', '09:20:24', '13:01:14'),
(1200, 3, '2018-11-06', '09:22:27', '12:45:43'),
(1201, 3, '2018-11-06', '13:03:14', '15:37:54'),
(1202, 1, '2018-11-06', '13:45:47', '18:11:56'),
(1203, 6, '2018-11-06', '13:47:05', '17:40:30'),
(1204, 5, '2018-11-06', '14:24:56', '18:38:30'),
(1205, 3, '2018-11-06', '15:39:19', '18:07:09'),
(1206, 1, '2018-11-07', '08:25:42', '12:44:53'),
(1207, 4, '2018-11-07', '08:40:41', '18:03:37'),
(1208, 6, '2018-11-07', '08:57:22', '12:50:43'),
(1209, 3, '2018-11-07', '09:18:53', '11:58:03'),
(1210, 5, '2018-11-07', '09:36:11', '12:20:24'),
(1211, 3, '2018-11-07', '12:06:02', '13:00:56'),
(1212, 1, '2018-11-07', '13:00:58', '17:34:09'),
(1213, 3, '2018-11-07', '13:02:35', '15:00:37'),
(1214, 5, '2018-11-07', '13:51:23', '18:07:24'),
(1215, 6, '2018-11-07', '13:58:43', '18:02:26'),
(1216, 3, '2018-11-07', '15:08:42', '17:17:05'),
(1217, 4, '2018-11-08', '08:26:40', '12:39:15'),
(1218, 1, '2018-11-08', '08:35:02', '17:34:09'),
(1219, 3, '2018-11-08', '09:19:32', '09:42:16'),
(1220, 5, '2018-11-08', '09:20:41', '13:36:42'),
(1221, 6, '2018-11-08', '09:57:29', '12:39:28'),
(1222, 3, '2018-11-08', '10:14:18', '12:51:06'),
(1223, 3, '2018-11-08', '13:06:14', '18:08:40'),
(1224, 6, '2018-11-08', '13:21:48', '18:24:09'),
(1225, 4, '2018-11-08', '14:02:52', '17:50:11'),
(1226, 5, '2018-11-08', '14:04:21', '18:48:20'),
(1227, 4, '2018-11-09', '08:43:10', '12:55:01'),
(1228, 1, '2018-11-09', '08:51:24', '17:55:30'),
(1229, 5, '2018-11-09', '09:13:55', '13:14:03'),
(1230, 3, '2018-11-09', '09:20:53', '09:33:13'),
(1231, 3, '2018-11-09', '09:57:00', '11:43:35'),
(1232, 6, '2018-11-09', '10:00:05', '11:34:54'),
(1233, 6, '2018-11-09', '11:40:17', '12:47:40'),
(1234, 3, '2018-11-09', '11:52:38', '13:48:04'),
(1235, 6, '2018-11-09', '13:47:30', '18:23:03'),
(1236, 3, '2018-11-09', '14:07:48', '17:53:20'),
(1237, 4, '2018-11-09', '14:19:17', '17:46:21'),
(1238, 5, '2018-11-09', '14:47:49', '18:33:37'),
(1239, 3, '2018-11-10', '10:25:14', '13:32:37'),
(1240, 5, '2018-11-10', '10:43:12', '13:32:39'),
(1241, 4, '2018-11-12', '08:10:28', '15:39:50'),
(1242, 6, '2018-11-12', '08:57:43', '12:42:57'),
(1244, 5, '2018-11-12', '09:24:39', '18:04:52'),
(1245, 3, '2018-11-12', '09:54:31', '10:10:27'),
(1246, 3, '2018-11-12', '10:20:04', '13:27:24'),
(1247, 6, '2018-11-12', '13:24:25', '18:03:15'),
(1248, 3, '2018-11-12', '13:42:20', '18:04:54'),
(1249, 4, '2018-11-13', '08:34:14', '12:58:33'),
(1250, 1, '2018-11-13', '09:16:48', '17:15:46'),
(1251, 3, '2018-11-13', '09:22:38', '10:21:35'),
(1252, 5, '2018-11-13', '09:27:03', '13:29:27'),
(1253, 6, '2018-11-13', '09:37:23', '12:32:55'),
(1254, 3, '2018-11-13', '10:27:51', '13:09:47'),
(1255, 6, '2018-11-13', '13:27:27', '18:14:37'),
(1256, 3, '2018-11-13', '13:38:17', '15:10:55'),
(1257, 4, '2018-11-13', '14:04:57', '17:57:34'),
(1258, 5, '2018-11-13', '14:32:03', '18:39:00'),
(1259, 3, '2018-11-13', '15:16:48', '17:25:34'),
(1261, 4, '2018-11-14', '08:46:33', '10:08:55'),
(1262, 3, '2018-11-14', '09:03:11', '10:42:29'),
(1263, 5, '2018-11-14', '09:50:36', '13:38:25'),
(1264, 4, '2018-11-14', '10:15:25', '12:57:49'),
(1265, 6, '2018-11-14', '10:38:03', '13:47:21'),
(1266, 3, '2018-11-14', '11:00:49', '13:59:31'),
(1267, 5, '2018-11-14', '13:46:25', '13:55:07'),
(1268, 6, '2018-11-14', '13:59:41', '18:04:16'),
(1269, 4, '2018-11-14', '14:09:00', '17:59:15'),
(1270, 3, '2018-11-14', '14:12:57', '15:48:17'),
(1271, 3, '2018-11-14', '15:50:22', '17:48:14'),
(1272, 5, '2018-11-14', '18:16:09', '18:41:24'),
(1273, 4, '2018-11-15', '08:51:01', '13:08:46'),
(1274, 1, '2018-11-15', '08:56:45', '13:08:56'),
(1275, 3, '2018-11-15', '09:17:22', '13:08:55'),
(1276, 5, '2018-11-15', '09:25:11', '10:43:27'),
(1277, 6, '2018-11-15', '09:39:18', '13:05:33'),
(1278, 5, '2018-11-15', '11:02:09', '13:38:27'),
(1279, 6, '2018-11-15', '13:31:50', '18:18:24'),
(1280, 3, '2018-11-15', '14:05:37', '16:46:49'),
(1281, 1, '2018-11-15', '14:05:38', '17:45:58'),
(1282, 5, '2018-11-15', '14:07:14', '16:25:42'),
(1283, 4, '2018-11-15', '14:12:59', '17:58:02'),
(1284, 5, '2018-11-15', '16:50:50', '18:20:48'),
(1285, 4, '2018-11-16', '08:48:53', '13:09:52'),
(1286, 1, '2018-11-16', '09:07:16', '13:09:14'),
(1287, 3, '2018-11-16', '09:11:47', '13:09:32'),
(1288, 5, '2018-11-16', '09:23:52', '13:17:49'),
(1289, 6, '2018-11-16', '09:29:29', '09:43:09'),
(1290, 6, '2018-11-16', '09:50:18', '13:37:18'),
(1291, 3, '2018-11-16', '13:09:50', '13:12:46'),
(1292, 1, '2018-11-16', '13:21:13', '18:17:32'),
(1293, 5, '2018-11-16', '14:09:25', '18:19:45'),
(1294, 4, '2018-11-16', '14:12:13', '17:55:00'),
(1295, 6, '2018-11-16', '14:21:25', '18:24:07'),
(1296, 3, '2018-11-16', '14:49:25', '17:00:05'),
(1297, 1, '2018-11-19', '07:36:43', '13:01:29'),
(1298, 1, '2018-11-19', '13:10:38', '14:36:09'),
(1299, 3, '2018-11-19', '14:12:05', '16:43:12'),
(1300, 5, '2018-11-20', '17:11:41', '19:28:38'),
(1301, 4, '2018-11-21', '08:49:40', '18:02:43'),
(1302, 5, '2018-11-21', '09:16:36', '12:31:49'),
(1303, 6, '2018-11-21', '09:34:25', '17:53:29'),
(1304, 3, '2018-11-21', '09:43:47', '11:43:11'),
(1305, 3, '2018-11-21', '11:55:19', '14:42:57'),
(1306, 5, '2018-11-21', '13:28:37', '19:54:10'),
(1307, 3, '2018-11-21', '15:04:30', '17:32:37'),
(1308, 4, '2018-11-22', '08:52:47', '13:29:44'),
(1309, 1, '2018-11-22', '09:04:40', '10:29:02'),
(1310, 6, '2018-11-22', '09:11:44', '09:16:29'),
(1311, 3, '2018-11-22', '09:20:24', '09:45:16'),
(1312, 5, '2018-11-22', '09:24:16', '12:25:36'),
(1313, 6, '2018-11-22', '09:34:26', '13:03:09'),
(1314, 3, '2018-11-22', '10:03:33', '13:25:22'),
(1315, 1, '2018-11-22', '10:37:39', '13:25:15'),
(1316, 3, '2018-11-22', '13:38:22', '14:18:52'),
(1317, 1, '2018-11-22', '13:38:24', '17:32:21'),
(1318, 6, '2018-11-22', '13:52:00', '17:57:16'),
(1319, 3, '2018-11-22', '14:54:31', '17:07:15'),
(1320, 4, '2018-11-23', '08:08:42', '13:14:48'),
(1321, 3, '2018-11-23', '09:09:47', '09:40:39'),
(1322, 5, '2018-11-23', '09:27:53', '13:02:15'),
(1323, 1, '2018-11-23', '09:28:22', '11:05:08'),
(1324, 6, '2018-11-23', '09:41:08', '09:47:45'),
(1325, 6, '2018-11-23', '09:54:56', '14:27:42'),
(1326, 3, '2018-11-23', '10:03:15', '11:49:00'),
(1327, 1, '2018-11-23', '11:08:42', '17:38:13'),
(1328, 3, '2018-11-23', '11:59:27', '14:33:01'),
(1329, 4, '2018-11-23', '14:10:28', '18:03:17'),
(1330, 6, '2018-11-23', '14:31:00', '18:03:16'),
(1331, 3, '2018-11-23', '14:43:22', '16:11:07'),
(1332, 5, '2018-11-23', '15:46:55', '18:13:50'),
(1333, 4, '2018-11-24', '08:40:22', '11:40:39'),
(1334, 3, '2018-11-24', '09:40:02', '12:46:02'),
(1335, 1, '2018-11-24', '10:31:04', '18:01:57'),
(1336, 4, '2018-11-26', '08:57:21', '11:17:18'),
(1337, 1, '2018-11-26', '09:13:23', '13:16:45'),
(1338, 6, '2018-11-26', '09:29:46', '17:54:11'),
(1339, 5, '2018-11-26', '09:38:11', '13:37:12'),
(1340, 3, '2018-11-26', '10:32:56', '12:55:34'),
(1341, 4, '2018-11-26', '11:23:36', '13:34:59'),
(1342, 3, '2018-11-26', '13:06:06', '14:14:59'),
(1343, 1, '2018-11-26', '13:29:26', '17:39:34'),
(1344, 5, '2018-11-26', '14:10:11', '15:16:06'),
(1345, 3, '2018-11-26', '14:22:35', '17:55:11'),
(1346, 4, '2018-11-26', '14:38:41', '15:32:17'),
(1347, 5, '2018-11-26', '15:36:54', '18:54:25'),
(1348, 4, '2018-11-26', '16:29:19', '18:41:06'),
(1349, 4, '2018-11-27', '08:55:53', '09:55:40'),
(1350, 6, '2018-11-27', '09:10:35', '10:55:41'),
(1351, 3, '2018-11-27', '09:16:23', '09:27:23'),
(1352, 1, '2018-11-27', '09:24:44', '12:18:20'),
(1353, 3, '2018-11-27', '09:27:38', '09:37:22'),
(1354, 3, '2018-11-27', '09:55:38', '10:49:39'),
(1355, 4, '2018-11-27', '10:40:45', '14:22:21'),
(1356, 3, '2018-11-27', '10:56:13', '12:33:04'),
(1357, 6, '2018-11-27', '11:00:03', '17:35:36'),
(1358, 3, '2018-11-27', '13:01:55', '17:26:39'),
(1359, 1, '2018-11-27', '13:47:23', '17:41:06'),
(1360, 4, '2018-11-27', '15:50:19', '17:58:07'),
(1361, 4, '2018-11-28', '08:53:35', '12:51:54'),
(1362, 5, '2018-11-28', '09:10:20', '09:53:58'),
(1363, 3, '2018-11-28', '09:22:08', '10:29:14'),
(1364, 1, '2018-11-28', '09:24:07', '12:31:33'),
(1365, 5, '2018-11-28', '10:09:12', '14:04:23'),
(1366, 3, '2018-11-28', '10:40:01', '13:21:28'),
(1367, 6, '2018-11-28', '10:57:04', '17:38:41'),
(1368, 3, '2018-11-28', '13:30:13', '15:08:26'),
(1369, 4, '2018-11-28', '14:09:55', '17:32:13'),
(1370, 1, '2018-11-28', '14:20:09', '17:31:31'),
(1371, 3, '2018-11-28', '15:27:17', '17:22:47'),
(1372, 6, '2018-11-28', '17:44:39', '18:00:08'),
(1373, 4, '2018-11-29', '08:52:10', '13:03:13'),
(1374, 1, '2018-11-29', '09:13:48', '13:13:27'),
(1375, 5, '2018-11-29', '09:28:52', '11:46:20'),
(1376, 3, '2018-11-29', '09:36:44', '09:55:44'),
(1377, 3, '2018-11-29', '10:18:43', '14:39:15'),
(1378, 6, '2018-11-29', '10:24:45', '10:29:27'),
(1379, 6, '2018-11-29', '10:34:50', '17:54:23'),
(1380, 5, '2018-11-29', '11:55:45', '14:36:04'),
(1381, 1, '2018-11-29', '13:31:38', '17:43:40'),
(1382, 4, '2018-11-29', '14:20:57', '18:09:20'),
(1383, 3, '2018-11-29', '15:14:23', '17:21:38'),
(1384, 5, '2018-11-29', '18:46:02', '18:54:04'),
(1385, 5, '2018-11-29', '19:10:51', '20:11:24'),
(1386, 5, '2018-11-29', '20:29:45', '22:15:04'),
(1387, 6, '2018-11-30', '08:31:43', '13:17:23'),
(1388, 4, '2018-11-30', '08:59:02', '13:05:32'),
(1389, 1, '2018-11-30', '09:14:56', '17:38:11'),
(1390, 3, '2018-11-30', '09:23:18', '10:02:58'),
(1391, 5, '2018-11-30', '09:31:08', '09:50:45'),
(1392, 3, '2018-11-30', '10:21:28', '11:35:24'),
(1393, 3, '2018-11-30', '11:41:11', '13:51:41'),
(1394, 5, '2018-11-30', '11:48:01', '13:11:18'),
(1395, 3, '2018-11-30', '13:59:40', '14:26:43'),
(1396, 6, '2018-11-30', '14:02:32', '17:17:49'),
(1397, 5, '2018-11-30', '14:12:57', '17:54:07'),
(1398, 4, '2018-11-30', '14:19:31', '18:04:57'),
(1399, 3, '2018-11-30', '15:00:01', '17:06:36'),
(1400, 3, '2018-12-01', '11:39:14', '15:25:41'),
(1401, 1, '2018-12-01', '13:04:37', '15:25:39'),
(1402, 5, '2018-12-01', '14:28:07', '16:28:10'),
(1403, 3, '2018-12-01', '16:12:18', '17:10:14'),
(1404, 1, '2018-12-01', '16:12:19', '18:51:50'),
(1405, 5, '2018-12-01', '17:03:56', '17:46:10'),
(1406, 3, '2018-12-03', '09:04:53', '09:39:39'),
(1407, 6, '2018-12-03', '09:11:07', '10:04:30'),
(1408, 1, '2018-12-03', '09:18:28', '12:50:35'),
(1409, 5, '2018-12-03', '09:31:15', '12:52:09'),
(1410, 3, '2018-12-03', '09:51:35', '13:19:36'),
(1411, 6, '2018-12-03', '10:08:44', '12:48:58'),
(1412, 4, '2018-12-03', '10:29:46', '13:34:23'),
(1413, 1, '2018-12-03', '13:00:47', '15:58:10'),
(1414, 6, '2018-12-03', '13:31:17', '18:04:31'),
(1415, 3, '2018-12-03', '13:32:40', '15:05:42'),
(1416, 5, '2018-12-03', '14:05:36', '21:23:50'),
(1417, 4, '2018-12-03', '14:27:13', '18:04:01'),
(1418, 3, '2018-12-03', '15:38:38', '17:15:53'),
(1419, 4, '2018-12-04', '08:11:43', '17:57:05'),
(1420, 1, '2018-12-04', '09:26:22', '17:45:59'),
(1421, 3, '2018-12-04', '09:31:52', '09:59:59'),
(1422, 5, '2018-12-04', '09:41:42', '13:39:20'),
(1423, 3, '2018-12-04', '10:16:40', '12:11:16'),
(1424, 3, '2018-12-04', '12:24:55', '13:39:38'),
(1425, 3, '2018-12-04', '13:45:30', '14:18:37'),
(1426, 3, '2018-12-04', '14:53:00', '16:34:49'),
(1427, 5, '2018-12-04', '18:07:35', '19:48:40'),
(1428, 4, '2018-12-05', '08:54:19', '13:03:43'),
(1429, 3, '2018-12-05', '09:14:44', '09:57:51'),
(1430, 1, '2018-12-05', '09:19:40', '17:35:45'),
(1431, 5, '2018-12-05', '09:39:52', '15:00:33'),
(1432, 6, '2018-12-05', '09:32:42', '12:43:44'),
(1433, 3, '2018-12-05', '10:20:30', '12:03:17'),
(1434, 3, '2018-12-05', '12:21:58', '14:21:14'),
(1435, 6, '2018-12-05', '13:00:48', '17:24:39'),
(1436, 4, '2018-12-05', '14:07:24', '17:38:55'),
(1437, 3, '2018-12-05', '15:04:25', '16:22:18'),
(1438, 5, '2018-12-05', '18:22:37', '18:47:49'),
(1439, 5, '2018-12-05', '19:20:30', '21:40:02'),
(1440, 4, '2018-12-06', '09:21:12', '12:34:55'),
(1441, 1, '2018-12-06', '09:21:18', '12:49:51'),
(1442, 6, '2018-12-06', '09:29:12', '09:49:23'),
(1443, 5, '2018-12-06', '09:41:15', '09:49:31'),
(1444, 6, '2018-12-06', '09:54:34', '12:50:25'),
(1445, 5, '2018-12-06', '09:54:35', '13:31:30'),
(1446, 6, '2018-12-06', '13:12:56', '17:28:22'),
(1447, 1, '2018-12-06', '13:26:22', '17:51:27'),
(1448, 4, '2018-12-06', '13:40:07', '17:51:25'),
(1449, 5, '2018-12-06', '15:30:16', '18:35:14'),
(1450, 4, '2018-12-07', '09:28:14', '13:14:19'),
(1451, 6, '2018-12-07', '09:33:01', '09:37:42'),
(1452, 6, '2018-12-07', '09:50:33', '13:14:30'),
(1453, 1, '2018-12-07', '09:50:35', '17:36:45'),
(1454, 5, '2018-12-07', '10:02:15', '13:26:51'),
(1455, 4, '2018-12-07', '14:33:20', '17:36:47'),
(1456, 6, '2018-12-07', '14:37:23', '14:41:56'),
(1457, 6, '2018-12-07', '14:50:10', '17:36:51'),
(1458, 5, '2018-12-07', '15:05:23', '17:36:49'),
(1459, 4, '2018-12-07', '17:36:47', '17:54:34'),
(1460, 5, '2018-12-07', '17:36:50', '18:12:13'),
(1461, 6, '2018-12-07', '17:36:52', '18:03:47'),
(1462, 5, '2018-12-08', '15:53:05', '16:24:52'),
(1463, 5, '2018-12-08', '17:35:05', '19:10:44'),
(1464, 4, '2018-12-10', '08:50:01', '13:49:59'),
(1465, 1, '2018-12-10', '09:16:31', '13:03:48'),
(1466, 6, '2018-12-10', '09:20:12', '17:29:13'),
(1467, 3, '2018-12-10', '09:22:14', '13:03:20'),
(1468, 5, '2018-12-10', '09:33:54', '17:44:41'),
(1469, 1, '2018-12-10', '13:19:38', '17:37:56'),
(1470, 3, '2018-12-10', '13:19:39', '14:42:45'),
(1471, 4, '2018-12-10', '13:57:07', '17:43:23'),
(1472, 3, '2018-12-10', '15:00:45', '17:06:12'),
(1473, 6, '2018-12-10', '17:35:59', '18:30:46'),
(1474, 1, '2018-12-11', '08:20:41', '12:27:32'),
(1475, 4, '2018-12-11', '08:47:17', '13:01:24'),
(1476, 3, '2018-12-11', '09:17:41', '10:44:02'),
(1477, 5, '2018-12-11', '09:29:10', '09:50:57'),
(1478, 6, '2018-12-11', '09:36:43', '10:51:44'),
(1479, 5, '2018-12-11', '10:33:56', '16:56:27'),
(1480, 3, '2018-12-11', '10:54:54', '12:26:35'),
(1481, 6, '2018-12-11', '10:55:18', '18:26:31'),
(1482, 1, '2018-12-11', '12:40:13', '18:26:39'),
(1483, 3, '2018-12-11', '12:40:15', '14:25:13'),
(1484, 4, '2018-12-11', '14:01:30', '18:26:35'),
(1485, 3, '2018-12-11', '14:54:16', '17:34:38'),
(1486, 5, '2018-12-11', '16:59:32', '18:23:38'),
(1487, 1, '2018-12-12', '08:47:04', '13:21:26'),
(1488, 4, '2018-12-12', '08:49:01', '12:54:11'),
(1489, 3, '2018-12-12', '09:17:33', '10:12:08'),
(1490, 5, '2018-12-12', '09:34:28', '13:52:20'),
(1491, 6, '2018-12-12', '09:34:33', '12:42:22'),
(1492, 3, '2018-12-12', '10:18:08', '11:54:59'),
(1493, 3, '2018-12-12', '12:01:07', '13:21:27'),
(1494, 6, '2018-12-12', '13:21:33', '18:17:16'),
(1495, 1, '2018-12-12', '13:35:14', '18:17:20'),
(1496, 3, '2018-12-12', '13:35:09', '14:25:45'),
(1497, 4, '2018-12-12', '14:25:29', '18:17:14'),
(1498, 5, '2018-12-12', '14:25:30', '16:27:58'),
(1499, 3, '2018-12-12', '14:58:01', '17:07:40'),
(1500, 5, '2018-12-12', '16:46:17', '18:17:17'),
(1501, 4, '2018-12-12', '18:17:15', '18:54:58'),
(1502, 6, '2018-12-12', '18:17:17', '18:22:48'),
(1503, 5, '2018-12-12', '18:17:18', '18:17:39'),
(1504, 1, '2018-12-12', '18:17:21', '18:21:33'),
(1505, 1, '2018-12-13', '08:47:43', '12:59:13'),
(1506, 4, '2018-12-13', '09:02:43', '13:04:39'),
(1507, 3, '2018-12-13', '09:27:11', '10:33:11'),
(1508, 5, '2018-12-13', '09:32:29', '13:48:46'),
(1509, 6, '2018-12-13', '09:40:40', '10:56:05'),
(1510, 3, '2018-12-13', '10:40:49', '11:36:34'),
(1511, 6, '2018-12-13', '11:00:59', '13:15:50'),
(1512, 3, '2018-12-13', '12:01:43', '14:29:41'),
(1513, 1, '2018-12-13', '13:16:54', '18:30:42'),
(1514, 6, '2018-12-13', '13:34:18', '14:03:47'),
(1515, 6, '2018-12-13', '14:04:24', '17:38:39'),
(1516, 5, '2018-12-13', '14:10:50', '16:25:30'),
(1517, 4, '2018-12-13', '14:19:45', '18:04:10'),
(1518, 3, '2018-12-13', '14:55:50', '17:40:20'),
(1519, 5, '2018-12-13', '16:46:18', '17:41:53'),
(1520, 1, '2018-12-14', '08:58:44', '13:53:38'),
(1521, 5, '2018-12-14', '09:00:09', '09:00:10'),
(1522, 4, '2018-12-14', '09:00:11', '13:53:37'),
(1523, 3, '2018-12-14', '09:30:58', '10:28:19'),
(1524, 6, '2018-12-14', '09:31:52', '10:16:22'),
(1525, 5, '2018-12-14', '09:32:00', '13:26:14'),
(1526, 6, '2018-12-14', '10:21:33', '12:30:09'),
(1527, 3, '2018-12-14', '10:45:20', '12:25:45'),
(1528, 3, '2018-12-14', '12:35:45', '14:33:16'),
(1529, 6, '2018-12-14', '13:45:31', '15:33:55'),
(1530, 1, '2018-12-14', '14:11:07', '17:38:59'),
(1531, 4, '2018-12-14', '14:11:10', '18:06:39'),
(1532, 5, '2018-12-14', '14:32:04', '18:06:41'),
(1533, 3, '2018-12-14', '14:40:20', '17:28:32'),
(1534, 6, '2018-12-14', '15:47:16', '17:30:47'),
(1535, 5, '2018-12-15', '18:30:13', '21:50:19'),
(1536, 5, '2018-12-16', '16:59:49', '19:25:10'),
(1537, 4, '2018-12-17', '08:50:44', '13:13:05'),
(1538, 1, '2018-12-17', '09:19:06', '12:53:01'),
(1539, 5, '2018-12-17', '09:25:46', '13:23:15'),
(1540, 3, '2018-12-17', '11:29:11', '12:03:39'),
(1541, 3, '2018-12-17', '12:18:01', '18:46:14'),
(1542, 1, '2018-12-17', '13:12:13', '14:14:40'),
(1543, 5, '2018-12-17', '14:12:55', '16:35:38'),
(1544, 4, '2018-12-17', '14:32:19', '14:55:56'),
(1545, 1, '2018-12-17', '14:37:24', '17:34:05'),
(1546, 4, '2018-12-17', '15:02:25', '18:03:37'),
(1547, 5, '2018-12-17', '16:55:12', '17:44:55'),
(1548, 4, '2018-12-18', '08:55:23', '12:59:06'),
(1549, 1, '2018-12-18', '09:21:20', '10:35:02'),
(1550, 3, '2018-12-18', '09:26:15', '09:45:04'),
(1551, 5, '2018-12-18', '09:32:24', '11:58:52'),
(1552, 3, '2018-12-18', '09:58:23', '12:42:38'),
(1553, 1, '2018-12-18', '11:24:15', '17:46:17'),
(1554, 3, '2018-12-18', '12:53:47', '16:56:02'),
(1555, 5, '2018-12-18', '12:56:43', '18:53:49'),
(1556, 6, '2018-12-18', '13:31:09', '17:26:24'),
(1557, 4, '2018-12-18', '14:14:53', '17:31:08'),
(1558, 4, '2018-12-19', '08:58:31', '10:56:07'),
(1559, 3, '2018-12-19', '09:01:27', '09:58:17'),
(1560, 1, '2018-12-19', '09:23:58', '12:56:12'),
(1561, 5, '2018-12-19', '09:30:26', '12:01:52'),
(1562, 6, '2018-12-19', '09:36:55', '12:18:54'),
(1563, 3, '2018-12-19', '10:12:02', '15:20:50'),
(1564, 4, '2018-12-19', '11:02:35', '13:00:12'),
(1565, 6, '2018-12-19', '12:40:53', '17:53:53'),
(1566, 1, '2018-12-19', '13:03:42', '17:36:29'),
(1567, 5, '2018-12-19', '13:13:53', '19:54:06'),
(1568, 4, '2018-12-19', '14:09:29', '17:57:10'),
(1569, 3, '2018-12-19', '15:26:55', '17:10:30'),
(1570, 3, '2018-12-20', '08:30:23', '10:00:50'),
(1571, 4, '2018-12-20', '09:01:25', '13:10:11'),
(1572, 1, '2018-12-20', '09:32:20', '17:27:20'),
(1573, 5, '2018-12-20', '09:32:22', '14:30:38'),
(1574, 6, '2018-12-20', '09:49:05', '09:52:48'),
(1575, 6, '2018-12-20', '09:57:24', '17:50:21'),
(1576, 3, '2018-12-20', '10:20:52', '18:04:57'),
(1577, 4, '2018-12-20', '14:14:00', '17:46:42'),
(1578, 5, '2018-12-20', '15:30:06', '18:20:30'),
(1579, 3, '2018-12-21', '08:31:07', '10:01:42'),
(1580, 4, '2018-12-21', '08:58:19', '13:24:29'),
(1581, 6, '2018-12-21', '09:28:34', '09:48:53'),
(1582, 1, '2018-12-21', '09:31:15', '13:46:14'),
(1583, 5, '2018-12-21', '09:33:04', '13:13:42'),
(1584, 6, '2018-12-21', '09:54:38', '12:41:35'),
(1585, 3, '2018-12-21', '10:17:14', '11:45:12'),
(1586, 3, '2018-12-21', '11:50:34', '16:08:03'),
(1587, 6, '2018-12-21', '14:02:34', '17:53:58'),
(1588, 4, '2018-12-21', '14:12:01', '17:53:57'),
(1589, 1, '2018-12-21', '14:17:16', '17:42:18'),
(1590, 5, '2018-12-21', '14:20:17', '18:55:34'),
(1591, 3, '2018-12-22', '10:38:50', '15:25:03'),
(1592, 1, '2018-12-22', '13:07:33', '16:04:02'),
(1593, 1, '2018-12-22', '16:04:02', '16:36:04'),
(1594, 6, '2018-12-24', '09:23:50', '09:43:55'),
(1595, 3, '2018-12-24', '09:26:08', '09:52:46'),
(1596, 1, '2018-12-24', '09:26:09', '13:03:37'),
(1597, 6, '2018-12-24', '09:49:04', '12:49:17'),
(1598, 3, '2018-12-24', '10:12:13', '15:18:13'),
(1599, 5, '2018-12-24', '10:57:33', '19:17:50'),
(1600, 4, '2018-12-24', '11:20:12', '13:01:03'),
(1601, 6, '2018-12-24', '13:10:45', '18:02:40'),
(1602, 1, '2018-12-24', '13:14:57', '17:41:34'),
(1603, 4, '2018-12-24', '13:45:03', '18:04:26'),
(1604, 3, '2018-12-24', '15:27:27', '17:13:52'),
(1605, 3, '2018-12-25', '08:30:19', '09:47:37'),
(1606, 4, '2018-12-25', '08:48:57', '13:11:14'),
(1607, 6, '2018-12-25', '09:02:54', '09:52:04'),
(1608, 1, '2018-12-25', '09:26:32', '13:16:57'),
(1609, 5, '2018-12-25', '09:30:16', '11:42:33'),
(1610, 3, '2018-12-25', '09:53:40', '13:18:10'),
(1611, 6, '2018-12-25', '09:56:28', '13:10:36'),
(1612, 5, '2018-12-25', '12:13:24', '17:52:49'),
(1613, 6, '2018-12-25', '13:22:45', '17:52:45'),
(1614, 1, '2018-12-25', '13:36:22', '19:01:26'),
(1615, 3, '2018-12-25', '13:49:25', '17:45:32'),
(1616, 5, '2018-12-25', '18:08:55', '18:24:06'),
(1617, 3, '2018-12-26', '08:44:55', '10:32:50'),
(1618, 6, '2018-12-26', '09:09:36', '11:34:14'),
(1619, 1, '2018-12-26', '09:26:52', '13:12:51'),
(1620, 5, '2018-12-26', '09:32:52', '13:12:47'),
(1621, 3, '2018-12-26', '10:44:09', '13:12:48'),
(1622, 4, '2018-12-26', '10:56:57', '13:19:39'),
(1623, 6, '2018-12-26', '11:40:32', '13:12:52'),
(1624, 3, '2018-12-26', '13:12:49', '14:17:28'),
(1625, 1, '2018-12-26', '13:28:26', '15:05:18'),
(1626, 6, '2018-12-26', '13:30:09', '17:34:45'),
(1627, 5, '2018-12-26', '13:30:16', '18:07:50'),
(1628, 4, '2018-12-26', '14:24:38', '18:00:13'),
(1629, 3, '2018-12-26', '14:50:43', '17:03:55'),
(1630, 1, '2018-12-26', '15:12:58', '17:45:11');

-- --------------------------------------------------------

--
-- Structure de la table `pointages_journaliere`
--

DROP TABLE IF EXISTS `pointages_journaliere`;
CREATE TABLE IF NOT EXISTS `pointages_journaliere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(10) UNSIGNED NOT NULL,
  `date_pointages` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pointages_journaliere`
--

INSERT INTO `pointages_journaliere` (`id`, `id_users`, `date_pointages`) VALUES
(178, 1, '2018-11-01'),
(179, 1, '2018-11-05'),
(180, 1, '2018-11-06'),
(181, 1, '2018-11-07'),
(182, 1, '2018-11-08'),
(183, 1, '2018-11-09'),
(184, 1, '2018-11-13'),
(185, 1, '2018-11-15'),
(186, 1, '2018-11-16'),
(187, 1, '2018-11-19'),
(188, 1, '2018-11-22'),
(189, 1, '2018-11-23'),
(190, 1, '2018-11-24'),
(191, 1, '2018-11-26'),
(192, 1, '2018-11-27'),
(193, 1, '2018-11-28'),
(194, 1, '2018-11-29'),
(195, 1, '2018-11-30'),
(196, 1, '2018-12-01'),
(197, 1, '2018-12-03'),
(198, 1, '2018-12-04'),
(199, 1, '2018-12-05'),
(200, 1, '2018-12-06'),
(201, 1, '2018-12-07'),
(202, 1, '2018-12-10'),
(203, 1, '2018-12-11'),
(204, 1, '2018-12-12'),
(205, 1, '2018-12-13'),
(206, 1, '2018-12-14'),
(207, 1, '2018-12-17'),
(208, 1, '2018-12-18'),
(209, 1, '2018-12-19'),
(210, 1, '2018-12-20'),
(211, 1, '2018-12-21'),
(212, 1, '2018-12-22'),
(213, 1, '2018-12-24'),
(214, 1, '2018-12-25'),
(215, 1, '2018-12-26'),
(216, 3, '2018-11-01'),
(217, 3, '2018-11-02'),
(218, 3, '2018-11-06'),
(219, 3, '2018-11-07'),
(220, 3, '2018-11-08'),
(221, 3, '2018-11-09'),
(222, 3, '2018-11-10'),
(223, 3, '2018-11-12'),
(224, 3, '2018-11-13'),
(225, 3, '2018-11-14'),
(226, 3, '2018-11-15'),
(227, 3, '2018-11-16'),
(228, 3, '2018-11-19'),
(229, 3, '2018-11-21'),
(230, 3, '2018-11-22'),
(231, 3, '2018-11-23'),
(232, 3, '2018-11-24'),
(233, 3, '2018-11-26'),
(234, 3, '2018-11-27'),
(235, 3, '2018-11-28'),
(236, 3, '2018-11-29'),
(237, 3, '2018-11-30'),
(238, 3, '2018-12-01'),
(239, 3, '2018-12-03'),
(240, 3, '2018-12-04'),
(241, 3, '2018-12-05'),
(242, 3, '2018-12-10'),
(243, 3, '2018-12-11'),
(244, 3, '2018-12-12'),
(245, 3, '2018-12-13'),
(246, 3, '2018-12-14'),
(247, 3, '2018-12-17'),
(248, 3, '2018-12-18'),
(249, 3, '2018-12-19'),
(250, 3, '2018-12-20'),
(251, 3, '2018-12-21'),
(252, 3, '2018-12-22'),
(253, 3, '2018-12-24'),
(254, 3, '2018-12-25'),
(255, 3, '2018-12-26'),
(256, 4, '2018-11-01'),
(257, 4, '2018-11-02'),
(258, 4, '2018-11-06'),
(259, 4, '2018-11-07'),
(260, 4, '2018-11-08'),
(261, 4, '2018-11-09'),
(262, 4, '2018-11-12'),
(263, 4, '2018-11-13'),
(264, 4, '2018-11-14'),
(265, 4, '2018-11-15'),
(266, 4, '2018-11-16'),
(267, 4, '2018-11-21'),
(268, 4, '2018-11-22'),
(269, 4, '2018-11-23'),
(270, 4, '2018-11-24'),
(271, 4, '2018-11-26'),
(272, 4, '2018-11-27'),
(273, 4, '2018-11-28'),
(274, 4, '2018-11-29'),
(275, 4, '2018-11-30'),
(276, 4, '2018-12-03'),
(277, 4, '2018-12-04'),
(278, 4, '2018-12-05'),
(279, 4, '2018-12-06'),
(280, 4, '2018-12-07'),
(281, 4, '2018-12-10'),
(282, 4, '2018-12-11'),
(283, 4, '2018-12-12'),
(284, 4, '2018-12-13'),
(285, 4, '2018-12-14'),
(286, 4, '2018-12-17'),
(287, 4, '2018-12-18'),
(288, 4, '2018-12-19'),
(289, 4, '2018-12-20'),
(290, 4, '2018-12-21'),
(291, 4, '2018-12-24'),
(292, 4, '2018-12-25'),
(293, 4, '2018-12-26'),
(294, 5, '2018-11-01'),
(295, 5, '2018-11-02'),
(296, 5, '2018-11-06'),
(297, 5, '2018-11-07'),
(298, 5, '2018-11-08'),
(299, 5, '2018-11-09'),
(300, 5, '2018-11-10'),
(301, 5, '2018-11-12'),
(302, 5, '2018-11-13'),
(303, 5, '2018-11-14'),
(304, 5, '2018-11-15'),
(305, 5, '2018-11-16'),
(306, 5, '2018-11-20'),
(307, 5, '2018-11-21'),
(308, 5, '2018-11-22'),
(309, 5, '2018-11-23'),
(310, 5, '2018-11-26'),
(311, 5, '2018-11-28'),
(312, 5, '2018-11-29'),
(313, 5, '2018-11-30'),
(314, 5, '2018-12-01'),
(315, 5, '2018-12-03'),
(316, 5, '2018-12-04'),
(317, 5, '2018-12-05'),
(318, 5, '2018-12-06'),
(319, 5, '2018-12-07'),
(320, 5, '2018-12-08'),
(321, 5, '2018-12-10'),
(322, 5, '2018-12-11'),
(323, 5, '2018-12-12'),
(324, 5, '2018-12-13'),
(325, 5, '2018-12-14'),
(326, 5, '2018-12-15'),
(327, 5, '2018-12-16'),
(328, 5, '2018-12-17'),
(329, 5, '2018-12-18'),
(330, 5, '2018-12-19'),
(331, 5, '2018-12-20'),
(332, 5, '2018-12-21'),
(333, 5, '2018-12-24'),
(334, 5, '2018-12-25'),
(335, 5, '2018-12-26'),
(336, 6, '2018-11-01'),
(337, 6, '2018-11-06'),
(338, 6, '2018-11-07'),
(339, 6, '2018-11-08'),
(340, 6, '2018-11-09'),
(341, 6, '2018-11-12'),
(342, 6, '2018-11-13'),
(343, 6, '2018-11-14'),
(344, 6, '2018-11-15'),
(345, 6, '2018-11-16'),
(346, 6, '2018-11-21'),
(347, 6, '2018-11-22'),
(348, 6, '2018-11-23'),
(349, 6, '2018-11-26'),
(350, 6, '2018-11-27'),
(351, 6, '2018-11-28'),
(352, 6, '2018-11-29'),
(353, 6, '2018-11-30'),
(354, 6, '2018-12-03'),
(355, 6, '2018-12-05'),
(356, 6, '2018-12-06'),
(357, 6, '2018-12-07'),
(358, 6, '2018-12-10'),
(359, 6, '2018-12-11'),
(360, 6, '2018-12-12'),
(361, 6, '2018-12-13'),
(362, 6, '2018-12-14'),
(363, 6, '2018-12-18'),
(364, 6, '2018-12-19'),
(365, 6, '2018-12-20'),
(366, 6, '2018-12-21'),
(367, 6, '2018-12-24'),
(368, 6, '2018-12-25'),
(369, 6, '2018-12-26');

-- --------------------------------------------------------

--
-- Structure de la table `professions`
--

DROP TABLE IF EXISTS `professions`;
CREATE TABLE IF NOT EXISTS `professions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professions`
--

INSERT INTO `professions` (`Id`, `Libelle`) VALUES
(1, 'Devloppeur'),
(2, 'Gerant');

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
-- Structure de la table `spent_revenues`
--

DROP TABLE IF EXISTS `spent_revenues`;
CREATE TABLE IF NOT EXISTS `spent_revenues` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `montant` int(11) NOT NULL,
  `date_operation` date NOT NULL,
  `type_paiment` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `spent_revenues`
--

INSERT INTO `spent_revenues` (`Id`, `type`, `libelle`, `montant`, `date_operation`, `type_paiment`) VALUES
(1, 'Dépenses', 'test', 100, '2018-12-25', 'Espèce'),
(2, 'Revenue', 'test', 1000, '2018-12-19', 'Virement');

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

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `role` int(11) NOT NULL,
  `nom` text NOT NULL,
  `date_contrat` date NOT NULL,
  `cin` text NOT NULL,
  `qualite` text NOT NULL,
  `classCss` text NOT NULL,
  `idLogs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role`, `nom`, `date_contrat`, `cin`, `qualite`, `classCss`, `idLogs`) VALUES
(2, 'achraf.saloumi', 'achtech@1985', 1, 'Achraf Saloumi', '2014-02-01', 'AA3256', 'Devloppeur de logiciel', 'success', 1206),
(3, 'noura.bouchbaat', 'software', 2, 'Noura Bouchbaat', '2014-02-01', 'AA3256', 'Devloppeur de logiciel', 'danger', 1177),
(4, 'brahim.barjali', 'software', 2, 'Brahim Barjali', '2015-01-01', 'AA3256', 'Devloppeur de logiciel', 'success', 1209),
(5, 'Oumaima.Stitini', 'software', 2, 'Oumaima Stitini', '2015-11-01', 'AA3256', 'Devloppeur de logiciel', 'success', 1207),
(7, 'mohammed.lechiakh', 'software', 2, 'Mohammed Lechiakh', '2016-11-01', 'AA3256', 'Devloppeur de logiciel', 'success', 1210),
(8, 'abdellah.taha', 'software', 2, 'Abdellah Taha', '2017-01-01', 'AA3256', 'Devloppeur de logiciel', 'success', 1208);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_pointages_journalieres`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_pointages_journalieres`;
CREATE TABLE IF NOT EXISTS `v_pointages_journalieres` (
`id_users` int(11) unsigned
,`date_pointage` date
,`total` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_pointages_journalieres`
--
DROP TABLE IF EXISTS `v_pointages_journalieres`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pointages_journalieres`  AS  select `pointages`.`id_users` AS `id_users`,`pointages`.`date_pointage` AS `date_pointage`,sum(timestampdiff(SECOND,`pointages`.`time_in`,`pointages`.`time_out`)) AS `total` from `pointages` group by `pointages`.`id_users`,`pointages`.`date_pointage` ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attachements`
--
ALTER TABLE `attachements`
  ADD CONSTRAINT `attachements_ibfk_1` FOREIGN KEY (`id_modules`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `attachements_ibfk_2` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `attachements_ibfk_3` FOREIGN KEY (`id_tasks`) REFERENCES `tasks` (`id`);

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_tasks`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);

--
-- Contraintes pour la table `conges`
--
ALTER TABLE `conges`
  ADD CONSTRAINT `conges_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`);

--
-- Contraintes pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`id_professions`) REFERENCES `professions` (`Id`),
  ADD CONSTRAINT `personnels_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);

--
-- Contraintes pour la table `pointages`
--
ALTER TABLE `pointages`
  ADD CONSTRAINT `pointages_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);

--
-- Contraintes pour la table `pointages_journaliere`
--
ALTER TABLE `pointages_journaliere`
  ADD CONSTRAINT `pointages_journaliere_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `cms_users` (`id`);

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
