-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 16 déc. 2018 à 00:50
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(29, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36', 'http://localhost/laravel/GE/public/admin/login', 'achraf.saloumi@exo-it.com login with IP Address ::1', '', 1, '2018-12-15 23:49:02', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Clients', 'Route', 'AdminClientsControllerGetIndex', NULL, 'fa fa-users', 16, 1, 0, 1, 5, '2018-12-14 21:59:26', NULL),
(2, 'Commentaires', 'Route', 'AdminCommentsControllerGetIndex', NULL, 'fa fa-file-o', 16, 1, 0, 1, 4, '2018-12-14 22:04:01', NULL),
(3, 'Conges', 'Route', 'AdminCongesControllerGetIndex', NULL, 'fa fa-share-square-o', 15, 1, 0, 1, 3, '2018-12-14 22:06:56', NULL),
(4, 'Document administratif', 'Route', 'AdminDocumentsControllerGetIndex', NULL, 'fa fa-file-pdf-o', 15, 1, 0, 1, 5, '2018-12-14 22:10:01', NULL),
(5, 'Entreprise', 'Route', 'AdminEntreprisesControllerGetIndex', NULL, 'fa fa-home', 17, 1, 0, 1, 3, '2018-12-14 22:12:10', NULL),
(6, 'Free days', 'Route', 'AdminFreedaysControllerGetIndex', NULL, 'fa fa-birthday-cake', 17, 1, 0, 1, 2, '2018-12-15 08:01:20', NULL),
(7, 'Modules', 'Route', 'AdminModulesControllerGetIndex', NULL, 'fa fa-th', 16, 1, 0, 1, 2, '2018-12-15 08:03:18', NULL),
(8, 'Notifications', 'Route', 'AdminNotifications19ControllerGetIndex', NULL, 'fa fa-thumbs-o-up', 15, 1, 0, 1, 4, '2018-12-15 08:05:09', NULL),
(9, 'Personnel', 'Route', 'AdminPersonnelsControllerGetIndex', NULL, 'fa fa-user-md', 15, 1, 0, 1, 1, '2018-12-15 08:07:51', NULL),
(10, 'Pointages', 'Route', 'AdminPointagesControllerGetIndex', NULL, 'fa fa-user-times', 15, 1, 0, 1, 2, '2018-12-15 08:09:39', NULL),
(11, 'Profession', 'Route', 'AdminProfessionsControllerGetIndex', NULL, 'fa fa-star', 17, 1, 0, 1, 1, '2018-12-15 08:12:17', NULL),
(12, 'Projects', 'Route', 'AdminProjectsControllerGetIndex', NULL, 'fa fa-signal', 16, 1, 0, 1, 1, '2018-12-15 08:18:50', NULL),
(13, 'Spent / Revenue', 'Route', 'AdminSpentRevenuesControllerGetIndex', NULL, 'fa fa-money', 15, 1, 0, 1, 6, '2018-12-15 08:23:11', NULL),
(14, 'Tasks', 'Route', 'AdminTasksControllerGetIndex', NULL, 'fa fa-inbox', 16, 1, 0, 1, 3, '2018-12-15 08:25:31', NULL),
(15, 'Administratif', 'URL', '#', 'normal', 'fa fa-user', 0, 1, 0, 1, 1, '2018-12-15 08:57:22', NULL),
(16, 'Projects', 'URL', '#', 'normal', 'fa fa-th-list', 0, 1, 0, 1, 2, '2018-12-15 08:58:16', NULL),
(17, 'Parametres', 'URL', '#', 'normal', 'fa fa-gears', 0, 1, 0, 1, 3, '2018-12-15 08:58:49', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21, 'Pointages', 'fa fa-user-times', 'pointages', 'pointages', 'AdminPointagesController', 0, 0, '2018-12-15 08:09:38', NULL, NULL),
(22, 'Profession', 'fa fa-star', 'professions', 'professions', 'AdminProfessionsController', 0, 0, '2018-12-15 08:12:17', NULL, NULL),
(23, 'Projects', 'fa fa-signal', 'projects', 'projects', 'AdminProjectsController', 0, 0, '2018-12-15 08:18:50', NULL, NULL),
(24, 'Spent / Revenue', 'fa fa-money', 'spent_revenues', 'spent_revenues', 'AdminSpentRevenuesController', 0, 0, '2018-12-15 08:23:11', NULL, NULL),
(25, 'Tasks', 'fa fa-inbox', 'tasks', 'tasks', 'AdminTasksController', 0, 0, '2018-12-15 08:25:31', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-red', '2018-12-14 09:00:47', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(25, 1, 1, 1, 1, 1, 1, 25, NULL, NULL);

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
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2018-12-14 09:00:47', NULL, 'Email Setting', 'SMTP Password'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Achraf Saloumi', 'uploads/1/2018-12/chrysanthemum.jpg', 'achraf.saloumi@exo-it.com', '$2y$10$JWPs.xq1VebGO./hZhrEkuRON/B7E7oSr6tRHgE7zYfo8/ENGxdgy', 1, '2018-12-14 09:00:47', '2018-12-15 10:38:47', 'Active'),
(2, 'Noura Bouchbaat', 'uploads/1/2018-12/desert.jpg', 'noura.bouchbaat@exo-it.com', '$2y$10$DRrv58s/MbKdPcRepj4uDOxZEIOpEKoGOVAZRFUec.3ji9/xmVnju', 1, '2018-12-15 09:23:34', NULL, NULL),
(3, 'Brahim barjali', 'uploads/1/2018-12/hydrangeas.jpg', 'brahim.barjali@exo-it.com', '$2y$10$1VNoHoqdMcVqTyTmut1.buWEZS5s8c42xFoyy9ioYSnVr9ZYBqJ/y', 1, '2018-12-15 09:24:16', NULL, NULL),
(4, 'Oumaima Stitini', 'uploads/1/2018-12/jellyfish.jpg', 'oumaima.stitini@exo-it.com', '$2y$10$EEUbBwoJjeWjJRb3UyQ9Z.SaaojVp3wgAF6RZhnySI6xHD3D2qMTW', 1, '2018-12-15 09:25:20', '2018-12-15 09:27:09', NULL),
(5, 'Mohammed Lechiakh', 'uploads/1/2018-12/penguins.jpg', 'mohammed.lechiakh@exo-it.com', '$2y$10$nLruciKkSvgWRpe3Ql/jFuor842xhwEdhbg58DYNpkpqFLh8yCsc.', 1, '2018-12-15 09:26:14', NULL, NULL),
(6, 'Abdelah Taha', 'uploads/1/2018-12/tulips.jpg', 'abdellah.taha@exo-it.com', '$2y$10$zbasJVSdlkekmt/AvGVOr.2hXwryM5UTSc8Tr0Xlp3daRjB3l.zH.', 1, '2018-12-15 09:26:55', NULL, NULL);

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
  `nbr_days` float NOT NULL,
  `isValid` tinyint(1) DEFAULT NULL,
  `isJustify` tinyint(1) DEFAULT NULL,
  `date_request` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conges`
--

INSERT INTO `conges` (`id`, `id_users`, `start_date`, `end_date`, `libelle`, `nbr_days`, `isValid`, `isJustify`, `date_request`) VALUES
(6, 6, '2018-01-31', '2018-01-31', 'Retard', 1, NULL, NULL, NULL),
(9, 6, '2018-02-05', '2018-02-05', 'Inconnue', 1, NULL, NULL, NULL),
(10, 6, '2018-03-19', '2018-03-19', 'Inconnue', 2, NULL, NULL, NULL),
(12, 6, '2018-04-02', '2018-04-02', 'Retard', 1, NULL, NULL, NULL),
(13, 6, '2018-03-30', '2018-03-30', 'Retard', 1, NULL, NULL, NULL),
(14, 2, '2018-01-08', '2018-01-11', 'Conge', 4, NULL, NULL, NULL),
(15, 2, '2018-02-05', '2018-02-09', 'Conge', 5, NULL, NULL, NULL),
(16, 3, '2018-01-24', '2018-01-24', 'Conge', 1, NULL, NULL, NULL),
(17, 3, '2018-04-09', '2018-04-16', 'Conge', 6, NULL, NULL, NULL),
(18, 4, '2018-01-22', '2018-01-23', 'Conge', 2, NULL, NULL, NULL),
(19, 4, '2018-02-12', '2018-02-16', 'Conge', 5, NULL, NULL, NULL),
(21, 5, '2018-02-01', '2018-02-01', 'Conge', 1, NULL, NULL, NULL),
(22, 5, '2018-04-02', '2018-04-04', 'Conge', 3, NULL, NULL, NULL),
(23, 1, '2014-08-18', '2014-08-29', 'Conge', 10, NULL, NULL, NULL),
(24, 1, '2014-12-12', '2014-12-16', 'Weeding party', 2, NULL, NULL, NULL),
(25, 1, '2016-05-05', '2016-05-06', 'Conge', 2, NULL, NULL, NULL),
(26, 1, '2015-09-28', '2015-10-14', 'Conge', 13, NULL, NULL, NULL),
(27, 1, '2016-09-15', '2016-09-16', 'Conge', 2, NULL, NULL, NULL),
(28, 1, '2017-03-17', '2017-03-17', 'Conge', 1, NULL, NULL, NULL),
(29, 1, '2017-05-15', '2017-05-21', 'Conge', 5, NULL, NULL, NULL),
(30, 1, '2017-06-06', '2017-06-06', 'Conge', 0, NULL, NULL, NULL),
(31, 1, '2017-06-09', '2017-06-09', 'Conge', 1, NULL, NULL, NULL),
(32, 1, '2017-08-04', '2017-08-04', 'Conge', 0, NULL, NULL, NULL),
(33, 1, '2017-09-04', '2017-09-10', 'Conge', 5, NULL, NULL, NULL),
(34, 1, '2016-12-05', '2016-12-16', 'Conge pay', 10, NULL, NULL, NULL),
(35, 2, '2018-06-06', '2018-06-06', 'Conge', 1, NULL, NULL, NULL),
(36, 6, '2018-07-05', '2018-07-05', 'Conge ', 1, NULL, NULL, NULL),
(38, 1, '2014-11-24', '2014-11-25', 'Conge', 2, NULL, NULL, NULL),
(40, 1, '2017-11-10', '2017-11-10', 'Conge', 1, NULL, NULL, NULL),
(41, 1, '2017-12-11', '2017-12-12', 'Conge', 2, NULL, NULL, NULL),
(42, 2, '2014-08-04', '2014-08-15', 'Conge', 10, NULL, NULL, NULL),
(43, 2, '2014-12-12', '2014-12-16', 'Conge', 3, NULL, NULL, NULL),
(44, 2, '2015-03-24', '2015-03-24', 'Conge', 1, NULL, NULL, NULL),
(45, 2, '2015-09-28', '2015-10-15', 'Conge', 13, NULL, NULL, NULL),
(46, 2, '2016-09-15', '2016-09-16', 'Conge', 2, NULL, NULL, NULL),
(47, 2, '2017-02-03', '2017-02-03', 'Conge', 1, NULL, NULL, NULL),
(48, 2, '2017-03-21', '2017-03-22', 'Conge', 2, NULL, NULL, NULL),
(49, 2, '2017-05-15', '2017-05-21', 'Conge', 5, NULL, NULL, NULL),
(50, 2, '2017-06-06', '2017-06-07', 'Conge', 2, NULL, NULL, NULL),
(51, 2, '2017-07-04', '2017-07-04', 'Conge', 1, NULL, NULL, NULL),
(52, 2, '2017-08-04', '2017-08-04', 'Conge', 1, NULL, NULL, NULL),
(53, 2, '2017-09-04', '2017-10-09', 'Conge', 5, NULL, NULL, NULL),
(54, 2, '2017-12-04', '2017-12-04', 'Conge', 1, NULL, NULL, NULL),
(55, 2, '2018-01-03', '2018-01-24', 'Conge', 1, NULL, NULL, NULL),
(56, 2, '2018-01-05', '2018-01-05', 'Conge', 1, NULL, NULL, NULL),
(57, 2, '2018-01-08', '2018-01-08', 'Conge', 1, NULL, NULL, NULL),
(58, 2, '2018-02-12', '2018-02-15', 'Conge', 4, NULL, NULL, NULL),
(59, 2, '2018-03-02', '2018-03-02', 'Conge', 1, NULL, NULL, NULL),
(60, 2, '2018-05-14', '2018-05-14', 'Conge', 1, NULL, NULL, NULL),
(61, 2, '2018-06-11', '2018-06-11', 'Conge', 1, NULL, NULL, NULL),
(62, 2, '2018-06-18', '2018-06-18', 'Conge', 1, NULL, NULL, NULL),
(63, 2, '2018-06-06', '2018-06-06', 'Conge', 1, NULL, NULL, NULL),
(64, 2, '2018-07-18', '2018-07-24', 'Conge Maladie', 5, NULL, NULL, NULL),
(65, 5, '2018-07-16', '2018-07-17', 'Conge relaxing', 2, NULL, NULL, NULL),
(66, 6, '2018-11-01', '2018-11-02', 'Malade certifier', 1.5, NULL, NULL, NULL),
(67, 1, '2018-11-02', '2018-11-02', 'CongÃ© certifier : nouvelle naissance', 1, NULL, NULL, NULL),
(68, 2, '2018-11-01', '2019-01-31', 'Conge de maternite', 65, NULL, NULL, NULL),
(69, 2, '2018-11-01', '2019-01-31', 'Conge de maternite', 65, NULL, NULL, NULL);

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
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `freedays`
--

INSERT INTO `freedays` (`id`, `pattern`, `isFixed`, `start_date`, `end_date`) VALUES
(1, 'La marche verte', 1, '2018-11-06', '2018-11-07');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `id_projects`, `libelle`, `start_date`, `end_date`, `status`, `progress`) VALUES
(1, 1, 'Analysis', '2018-12-16', '2018-12-24', 'TODO', 1),
(2, 2, 'tet', '2018-12-03', '2018-12-07', 'TODO', 0);

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
  `id_users` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `cin` varchar(50) NOT NULL,
  `cnss` varchar(50) NOT NULL,
  `polite` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `adress` text NOT NULL,
  `hiring_date` date NOT NULL,
  `exit_date` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pointages`
--

DROP TABLE IF EXISTS `pointages`;
CREATE TABLE IF NOT EXISTS `pointages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `date_pointage` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=1211 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pointages`
--

INSERT INTO `pointages` (`id`, `id_users`, `date_pointage`, `time_in`, `time_out`) VALUES
(1178, 2, '2018-11-01', '09:05:19', '12:47:04'),
(1179, 5, '2018-11-01', '09:05:24', '17:01:23'),
(1180, 8, '2018-11-01', '09:05:29', '12:24:16'),
(1181, 7, '2018-11-01', '09:11:03', '13:13:01'),
(1182, 4, '2018-11-01', '09:12:40', '09:14:55'),
(1183, 4, '2018-11-01', '09:15:02', '09:50:23'),
(1184, 4, '2018-11-01', '10:05:56', '12:47:06'),
(1185, 8, '2018-11-01', '13:14:55', '14:25:01'),
(1186, 4, '2018-11-01', '13:39:59', '17:05:13'),
(1187, 2, '2018-11-01', '13:40:00', '16:09:01'),
(1188, 7, '2018-11-01', '14:18:06', '18:20:38'),
(1189, 5, '2018-11-02', '09:03:32', '12:46:13'),
(1190, 4, '2018-11-02', '09:10:28', '13:00:35'),
(1191, 7, '2018-11-02', '09:15:47', '13:23:13'),
(1192, 4, '2018-11-02', '13:41:45', '17:26:11'),
(1193, 5, '2018-11-02', '13:56:14', '17:42:24'),
(1194, 7, '2018-11-02', '14:35:04', '18:32:28'),
(1195, 2, '2018-11-05', '09:33:42', '10:55:45'),
(1196, 5, '2018-11-06', '08:36:37', '17:33:41'),
(1197, 2, '2018-11-06', '08:59:17', '12:40:38'),
(1198, 8, '2018-11-06', '09:11:23', '13:02:07'),
(1199, 7, '2018-11-06', '09:20:24', '13:01:14'),
(1200, 4, '2018-11-06', '09:22:27', '12:45:43'),
(1201, 4, '2018-11-06', '13:03:14', '15:37:54'),
(1202, 2, '2018-11-06', '13:45:47', '18:11:56'),
(1203, 8, '2018-11-06', '13:47:05', '17:40:30'),
(1204, 7, '2018-11-06', '14:24:56', '18:38:30'),
(1205, 4, '2018-11-06', '15:39:19', '18:07:09'),
(1206, 2, '2018-11-07', '08:25:42', '08:25:42'),
(1207, 5, '2018-11-07', '08:40:41', '08:40:41'),
(1208, 8, '2018-11-07', '08:57:22', '08:57:22'),
(1209, 4, '2018-11-07', '09:18:53', '09:18:53'),
(1210, 7, '2018-11-07', '09:36:11', '09:36:11');

-- --------------------------------------------------------

--
-- Structure de la table `professions`
--

DROP TABLE IF EXISTS `professions`;
CREATE TABLE IF NOT EXISTS `professions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `start_date`, `end_date`, `technologies`, `progress`, `version`, `nom`, `status`, `id_clients`) VALUES
(1, '2018-12-16', '2019-01-04', 'J2EE , Angular JS, Oracle', 10, '0.510 Bugs', 'Abatech 0.5.10', 'Todo', 1),
(2, '2018-12-03', '2018-12-11', 'jaba', 2, '2', 'pr2', 'TODO', 2);

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
  `id_users` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `id_users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `id_users`, `progress`, `complexity`, `start_date`, `end_date`, `id_modules`, `priorite`) VALUES
(2, 'Create analysis', 'Create analysis Create analysis Create analysis Create analysis Create analysis', 'TODO', 1, 10, 2, '2018-12-24', '2018-12-19', 1, 'Medium');

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
  ADD CONSTRAINT `personnels_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `pointages`
--
ALTER TABLE `pointages`
  ADD CONSTRAINT `pointages_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `spent_revenues`
--
ALTER TABLE `spent_revenues`
  ADD CONSTRAINT `spent_revenues_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

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
