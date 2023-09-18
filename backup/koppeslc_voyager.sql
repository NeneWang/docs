-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2023 at 03:39 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koppeslc_voyager`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-09-30 07:37:45', '2021-09-30 07:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `link` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`id`, `title`, `link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Accounting Women\'s Initiative Network', 'https://www.facebook.com/AWINWomen/', 'clubs/February2022/m4wEwDyhVdcjRHXLI1yq.png', '2022-02-25 14:17:24', '2022-02-25 14:17:24'),
(2, 'Alpha', '#', 'clubs/February2022/wEC4iwsecJ7zw3ZBYLcB.png', '2022-02-25 14:17:47', '2022-02-25 14:17:47'),
(3, 'Actuarial Society', 'https://cunybrooklyn.campuslabs.com/engage/organization/actuarial-society', 'clubs/February2022/M8oX4j23KTUZEy0lwNzp.png', '2022-02-25 14:18:25', '2022-02-25 14:18:25'),
(4, 'Accounting Society', 'https://accounting.brooklyn.cuny.club/', 'clubs/February2022/unhL5J0G7kdXeeqYWRmA.png', '2022-02-25 14:18:45', '2022-02-25 14:18:45'),
(5, 'Marketing Society', 'https://bcmarketingsociety.wixsite.com/main', 'clubs/February2022/Hekra5k5KLDLKM2jIbnJ.png', '2022-02-25 14:32:07', '2022-02-25 14:32:07'),
(6, 'NABA', 'https://www.instagram.com/bc_naba/?hl=en', 'clubs/February2022/9T1Urh36XL1HJ0Deau1d.png', '2022-02-25 14:32:39', '2022-02-25 14:32:39'),
(7, 'Smooth Talkers', 'https://www.instagram.com/bcsmoothtalkers/', 'clubs/February2022/F5QzO0O1hP3RiHTh5c4t.png', '2022-02-25 14:50:50', '2022-02-25 14:50:50'),
(8, 'Toastmasters', 'https://www.toastmasters.org/Find-a-Club/06558323-koppelman-toastmasters', 'clubs/February2022/ilYcr2RE9OYGOmR2xDNW.png', '2022-02-25 14:51:14', '2022-02-25 14:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(72, 16, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 16, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(75, 16, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(76, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(77, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(78, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(80, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(82, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(83, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(84, 22, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 5),
(85, 22, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(86, 22, 'linkedin', 'text', 'Linkedin', 0, 1, 1, 1, 1, 1, '{}', 7),
(87, 22, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 8),
(88, 22, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\",\"GRADUATED\":\"GRADUATED\"}}', 9),
(89, 22, 'department', 'select_dropdown', 'Department', 0, 1, 1, 1, 1, 1, '{\"default\":\"UNASIGNED\",\"options\":{\"Executive Team\":\"Executive Team\",\"Alumni Relations\":\"Alumni Relations\",\"Business Relations\":\"Business Relations\",\"Club & Faculty Relations\":\"Club & Faculty Relations\",\"Operations\":\"Operations\",\"Marketing\":\"Marketing\",\"Technology\":\"Technology\",\"new-department\":\"new-department\"}}', 10),
(90, 22, 'expected_graduation', 'date', 'Expected Graduation', 0, 1, 1, 1, 1, 1, '{}', 11),
(91, 16, 'event_date_starts', 'timestamp', 'Event Date Starts', 0, 1, 1, 1, 1, 1, '{}', 8),
(92, 16, 'event_date_ends', 'timestamp', 'Event Date Ends', 0, 1, 1, 1, 1, 1, '{}', 9),
(94, 16, 'item_link', 'text', 'Item Link', 0, 1, 1, 1, 1, 1, '{}', 9),
(95, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(96, 27, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(97, 27, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 3),
(99, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(100, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(101, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(102, 28, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(103, 28, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 3),
(104, 28, 'image_link', 'image', 'Image Link', 0, 1, 1, 1, 1, 1, '{}', 4),
(105, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(106, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(107, 27, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(16, 'events', 'events', 'Event', 'Events', 'voyager-calendar', 'App\\Models\\Events', NULL, '\\App\\Http\\Controllers\\Voyager\\EventsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-30 08:54:58', '2021-11-06 20:55:38'),
(22, 'teams', 'teams', 'Team', 'Teams', NULL, 'App\\Models\\team', NULL, NULL, NULL, 0, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-30 10:31:37', '2022-02-15 10:21:27'),
(26, 'team_department', 'team-department', 'Team Department', 'Team Departments', NULL, 'App\\TeamDepartment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(27, 'clubs', 'clubs', 'Club', 'Clubs', NULL, 'App\\Club', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-02-25 14:12:13', '2022-02-25 14:31:45'),
(28, 'clubs', 'clubs', 'Club', 'Clubs', NULL, 'App\\Club', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-02-25 14:16:19', '2022-02-25 14:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_date_starts` timestamp NULL DEFAULT NULL,
  `event_date_ends` timestamp NULL DEFAULT NULL,
  `item_link` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`, `event_date_starts`, `event_date_ends`, `item_link`) VALUES
(44, 'KSB Club Fair', '<p><span style=\"color: rgba(0, 0, 0, 0.9); font-family: -apple-system, system-ui, \'system-ui\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Fira Sans\', Ubuntu, Oxygen, \'Oxygen Sans\', Cantarell, \'Droid Sans\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Lucida Grande\', Helvetica, Arial, sans-serif;\">We&rsquo;re so excited to announce that the Spring Semester Business Club Fair is coming up in just 3 weeks. This is a great opportunity to make your mark on campus and meet some amazing individuals. Some of the clubs you&rsquo;ll see there are&nbsp;@brooklynwib&nbsp;@ksbtoastmasters,&nbsp;@bc_investmentclub, and&nbsp;@alpfabrooklyn</span><br style=\"box-sizing: inherit; color: rgba(0, 0, 0, 0.9); font-family: -apple-system, system-ui, \'system-ui\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Fira Sans\', Ubuntu, Oxygen, \'Oxygen Sans\', Cantarell, \'Droid Sans\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Lucida Grande\', Helvetica, Arial, sans-serif; line-height: inherit !important;\" /><br style=\"box-sizing: inherit; color: rgba(0, 0, 0, 0.9); font-family: -apple-system, system-ui, \'system-ui\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Fira Sans\', Ubuntu, Oxygen, \'Oxygen Sans\', Cantarell, \'Droid Sans\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Lucida Grande\', Helvetica, Arial, sans-serif; line-height: inherit !important;\" /><span style=\"color: rgba(0, 0, 0, 0.9); font-family: -apple-system, system-ui, \'system-ui\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Fira Sans\', Ubuntu, Oxygen, \'Oxygen Sans\', Cantarell, \'Droid Sans\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Lucida Grande\', Helvetica, Arial, sans-serif;\">The Club Fair will be taking place in Whitehead Hall, Room 208. Remember to RSVP now!</span></p>', 'events/February2022/QmlefRJfSxXj5zNY74Kh.jpeg', '2022-02-16 00:50:52', '2022-02-16 00:54:08', '2022-02-24 18:30:00', '2022-02-24 20:00:00', 'https://docs.google.com/forms/d/e/1FAIpQLSf9HtoTCJGq1HLgnuhKbF-U3iysHoCt_j0cywskVkcHXaB8pQ/viewform'),
(45, 'Snacks and Chats', '<p>Join us to learn how to automatically produce a spreadsheet with the finacial information aboout your favorite stocks.</p>\r\n<p>There will be FREE food!</p>\r\n<p>It is completely free of cost, feel free to bring your computer device if you like to learn about the code behind it.</p>\r\n<p>Location: WH 208</p>', 'events/March2022/WlKkdAdA0dmq0yxvT2t2.png', '2022-02-22 01:54:00', '2022-03-14 20:25:58', '2022-03-15 17:30:00', '2022-03-15 19:15:00', 'https://docs.google.com/forms/d/e/1FAIpQLSeoLx0Olz43PXMuB29AiDS3-pir6P0kfmcR4CWWFvo7qSM2Gw/viewform'),
(46, 'Virtual Resume Workshop', '<p><span style=\"caret-color: #555555; color: #555555; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; font-size: 12px;\">Learn how to put together a strong College-Level Resume</span></p>\r\n<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">To Register,<br /><br />Please visit the WebCentral portal under the \"Career\" tab</div>\r\n<div class=\"eventContact\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><span class=\"infoTitle\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Contact:&nbsp;</span>Magner Center for Career Development and Internships;&nbsp;<strong>Email:</strong>careernews@brooklyn.cuny.edu</div>', NULL, '2022-02-22 02:00:22', '2022-02-22 02:00:22', '2022-02-24 18:30:00', '2022-02-24 20:00:00', 'http://portal.brooklyn.cuny.edu'),
(47, 'Streetwise Partners & Brooklyn College Info Session-Virtual', '<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">Streetwise Partners Info Session at Brooklyn College<br /><br />To register,</div>\r\n<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">Please visit the WebCentral portal under the \"Career\" tab&nbsp;</div>\r\n<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><span class=\"infoTitle\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Contact:&nbsp;</span>Magner Center for Career Development and Internships</div>\r\n<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><strong>Email:</strong>careernews@brooklyn.cuny.edu</div>\r\n<div class=\"eventCategories\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">&nbsp;</div>', NULL, '2022-02-22 02:02:55', '2022-02-22 02:05:58', '2022-02-24 18:30:00', '2022-02-24 19:30:00', 'http://portal.brooklyn.cuny.edu'),
(48, 'Intern/Job Fair - What to Expect Q&A- Virtual', '<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">Come get advice on what to expect on the day of the Job/Internship Fair<br /><br />To Register,<br /><br />Please visit the WebCentral portal under the \"Career\" tab</div>\r\n<div class=\"eventContact\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><span class=\"infoTitle\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Contact:&nbsp;</span>Magner Center for Career Development and Internships;&nbsp;<strong>Email:</strong>careernews@brooklyn.cuny.edu</div>', 'events/March2022/WJNAe2mwQwRricNHfNFT.png', '2022-02-22 02:12:32', '2022-03-02 06:07:28', '2022-03-11 17:00:00', '2022-03-11 21:00:00', 'http://portal.brooklyn.cuny.edu'),
(49, 'Career 101 for Seniors/Recent Graduates', '<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">Learn about the services of the Center; get your questions answered<br /><br />To register,<br /><br />Please visit the WebCentral portal under the \"Career\" tab</div>\r\n<div class=\"eventContact\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><span class=\"infoTitle\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Contact:&nbsp;</span>Magner Center for Career Development and Internships;&nbsp;<strong>Email:</strong>careernews@brooklyn.cuny.edu</div>', NULL, '2022-03-02 06:11:49', '2022-03-02 06:12:08', '2022-04-05 17:30:00', '2022-04-05 18:30:00', 'http://portal.brooklyn.cuny.edu'),
(50, 'Recruiter\'s Inside Tips on Resumes, Interviews and the Job Search', '<div class=\"eventDescription\" style=\"margin: 1em 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\">Virtual Q&amp;A with recruiter at a staffing agency<br /><br />To register,<br /><br />Please visit the WebCentral portal under the \"Career\" tab</div>\r\n<div class=\"eventContact\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: \'Lucida Sans Unicode\', \'Lucida Grande\', sans-serif; vertical-align: baseline; caret-color: #555555; color: #555555;\"><span class=\"infoTitle\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Contact:&nbsp;</span>Magner Center for Career Development and Internships;&nbsp;<strong>Email:</strong>careernews@brooklyn.cuny.edu</div>', NULL, '2022-03-02 06:13:41', '2022-03-02 06:13:41', '2022-04-07 17:30:00', '2022-04-07 19:00:00', 'http://portal.brooklyn.cuny.edu'),
(51, '2022 Faculty Luncheon', '<p class=\"MsoNormal\" style=\"margin: 0in; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\">Opportunity for the KSB students and faculty members to connect outside of the traditional class setting and bring together the entire KSB community.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin: 0in; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; font-weight: normal;\"><span style=\"font-family: Arial, sans-serif;\">We hope the Faculty Luncheon will generate the ability to build new working relationships with KSB professors or strengthen pre-existing ones without the barrier of being behind a computer screen.</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 10pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">When: Thursday, March 29th, 2022</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 10pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Time: 12:30 - 2:00 PM</span></p>\r\n<p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 10pt; font-family: Arial; color: #000000; background-color: transparent; font-weight: bold; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Where: Room TBD</span></p>\r\n<p>&nbsp;</p>', 'events/March2022/99g7IIGKJfhLTThea9gA.png', '2022-03-12 03:52:15', '2022-03-12 03:52:15', '2022-03-29 05:30:00', '2022-03-29 19:00:00', 'https://docs.google.com/forms/d/e/1FAIpQLSdG487kUojv9Yba4l2-I0oUXClEEsGXAAC8rCputAG9-751CQ/viewform'),
(52, 'Ignore this event', '<p>Just Tech team testing stuff.</p>', NULL, '2022-05-03 17:18:10', '2022-05-03 17:18:10', '2022-05-04 13:17:00', '2022-05-04 14:18:00', NULL),
(53, 'KSB Summit', '<p>Prepare the students demonstrating an interest in business on how to become well rounded candidates in an increasingly competetive job market with speakers providing invaluable knowledge and skills.</p>', 'events/September2022/WvuN2FoSBr55YJLsBgmq.jpeg', '2022-09-13 15:30:49', '2022-09-13 15:36:36', '2022-10-13 15:00:00', '2022-10-13 20:00:00', NULL),
(54, 'Business Matters (Day 2) [Student Center - James William]', '<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Each Fall semester, the SLC hosts Business Matters, a four-day symposium designed to help build strong ties between business students, business faculty, and the business community by providing a forum that facilitates an exchange of ideas leading to professional growth. Business Matters is attended by approximately 800 students every Fall semester and has hosted BC alumni from premier firms such as Goldman Sachs, J.P. Morgan, Deloitte, Accenture, and the NYC Department of Finance. Over eight years, Business Matters has grown into one of the most significant student-organized events on campus.</span></span></p>\r\n<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Location: [Student Center -&nbsp;</span></span><span style=\"color: #212529; font-family: system-ui, -apple-system, \'Segoe UI\', Roboto, \'Helvetica Neue\', Arial, \'Noto Sans\', \'Liberation Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px;\">James William</span><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">]</span></span></p>', NULL, '2022-09-13 22:19:25', '2022-09-13 22:39:56', '2022-11-03 17:30:00', '2022-11-03 19:05:00', NULL),
(55, 'Business Matters (Day 3) [Student Center - Gold Room]', '<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Each Fall semester, the SLC hosts Business Matters, a four-day symposium designed to help build strong ties between business students, business faculty, and the business community by providing a forum that facilitates an exchange of ideas leading to professional growth. Business Matters is attended by approximately 800 students every Fall semester and has hosted BC alumni from premier firms such as Goldman Sachs, J.P. Morgan, Deloitte, Accenture, and the NYC Department of Finance. Over eight years, Business Matters has grown into one of the most significant student-organized events on campus.</span></span></p>\r\n<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Location: [Student Center - Gold Room]</span></span></p>', NULL, '2022-09-13 22:20:30', '2022-09-13 22:41:31', '2022-11-08 18:30:00', '2022-11-08 20:05:00', NULL),
(56, 'Business Matters (Day 4) [Student Center - James William]', '<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Each Fall semester, the SLC hosts Business Matters, a four-day symposium designed to help build strong ties between business students, business faculty, and the business community by providing a forum that facilitates an exchange of ideas leading to professional growth. Business Matters is attended by approximately 800 students every Fall semester and has hosted BC alumnus from premier firms such as Goldman Sachs, J.P. Morgan, Deloitte, Accenture, and the NYC Department of Finance. Over eight years, Business Matters has grown into one of the largest, student-organized events on campus.</span></span></p>\r\n<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Location: [Student Center - James William]</span></span></p>', NULL, '2022-09-13 22:20:30', '2022-09-13 22:40:52', '2022-11-10 18:30:00', '2022-11-10 20:05:00', NULL),
(57, 'Business Matters (Day 1) [Student Center - Gold Room]', '<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Each Fall semester, the SLC hosts Business Matters, a four-day symposium designed to help build strong ties between business students, business faculty, and the business community by providing a forum that facilitates an exchange of ideas leading to professional growth. Business Matters is attended by approximately 800 students every Fall semester and has hosted BC alumni from premier firms such as Goldman Sachs, J.P. Morgan, Deloitte, Accenture, and the NYC Department of Finance. Over eight years, Business Matters has grown into one of the most significant student-organized events on campus.</span></span></p>\r\n<p><span style=\"color: #212529; font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, Liberation Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 18px;\">Location: [Student Center - Gold Room]</span></span></p>', NULL, '2022-09-13 22:20:35', '2022-09-13 22:41:16', '2022-11-01 17:30:00', '2022-11-01 19:05:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-10-01 00:51:36', '2021-10-01 00:51:36'),
(3, 'Main', '2021-10-01 00:43:44', '2021-10-01 00:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-10-01 00:51:36', '2021-10-01 00:51:36', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 4, '2021-10-01 00:51:36', '2021-10-01 01:08:10', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 5, 2, '2021-10-01 00:51:36', '2021-10-01 01:08:10', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 5, 3, '2021-10-01 00:51:36', '2021-10-01 01:08:10', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2021-10-01 00:51:36', '2022-03-08 22:51:52', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-10-01 00:51:36', '2021-10-01 01:04:56', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, NULL, 5, '2021-10-01 00:51:36', '2022-03-08 22:51:52', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 5, '2021-10-01 00:51:36', '2021-10-01 01:08:10', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 6, '2021-10-01 00:51:36', '2021-10-01 01:08:10', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2021-10-01 00:51:36', '2022-03-08 22:51:52', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 28, 3, '2021-10-01 00:51:36', '2021-10-01 01:07:56', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 28, 1, '2021-10-01 00:51:36', '2021-10-01 01:07:53', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 28, 2, '2021-10-01 00:51:36', '2021-10-01 01:07:54', 'voyager.pages.index', NULL),
(26, 1, 'Events', '/admin/events', '_self', 'voyager-calendar', '#000000', NULL, 3, '2021-10-01 01:04:50', '2021-10-01 01:06:14', NULL, ''),
(27, 1, 'Teams', 'admin/teams', '_self', 'voyager-people', '#000000', NULL, 2, '2021-10-01 01:05:45', '2021-10-01 01:05:51', NULL, ''),
(28, 1, 'Misc', '', '_self', 'voyager-anchor', '#000000', NULL, 8, '2021-10-01 01:06:43', '2022-03-08 22:51:52', NULL, ''),
(30, 1, 'Clubs', '', '_self', 'voyager-chat', '#000000', NULL, 4, '2022-02-25 14:12:13', '2022-03-08 22:53:23', 'voyager.clubs.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2021_09_30_041025_create_students_table', 3),
(30, '2021_09_30_043636_create_events_table', 4),
(31, '2021_09_30_063009_create_teams_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-09-30 07:37:45', '2021-09-30 07:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(2, 'browse_bread', NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(3, 'browse_database', NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(4, 'browse_media', NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(5, 'browse_compass', NULL, '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(6, 'browse_menus', 'menus', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(7, 'read_menus', 'menus', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(8, 'edit_menus', 'menus', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(9, 'add_menus', 'menus', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(10, 'delete_menus', 'menus', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(11, 'browse_roles', 'roles', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(12, 'read_roles', 'roles', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(13, 'edit_roles', 'roles', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(14, 'add_roles', 'roles', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(15, 'delete_roles', 'roles', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(16, 'browse_users', 'users', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(17, 'read_users', 'users', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(18, 'edit_users', 'users', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(19, 'add_users', 'users', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(20, 'delete_users', 'users', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(21, 'browse_settings', 'settings', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(22, 'read_settings', 'settings', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(23, 'edit_settings', 'settings', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(24, 'add_settings', 'settings', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(25, 'delete_settings', 'settings', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(26, 'browse_categories', 'categories', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(27, 'read_categories', 'categories', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(28, 'edit_categories', 'categories', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(29, 'add_categories', 'categories', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(30, 'delete_categories', 'categories', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(31, 'browse_posts', 'posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(32, 'read_posts', 'posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(33, 'edit_posts', 'posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(34, 'add_posts', 'posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(35, 'delete_posts', 'posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(36, 'browse_pages', 'pages', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(37, 'read_pages', 'pages', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(38, 'edit_pages', 'pages', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(39, 'add_pages', 'pages', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(40, 'delete_pages', 'pages', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(51, 'browse_events', 'events', '2021-09-30 08:54:58', '2021-09-30 08:54:58'),
(52, 'read_events', 'events', '2021-09-30 08:54:58', '2021-09-30 08:54:58'),
(53, 'edit_events', 'events', '2021-09-30 08:54:58', '2021-09-30 08:54:58'),
(54, 'add_events', 'events', '2021-09-30 08:54:58', '2021-09-30 08:54:58'),
(55, 'delete_events', 'events', '2021-09-30 08:54:58', '2021-09-30 08:54:58'),
(76, 'browse_teams', 'teams', '2021-09-30 10:31:38', '2021-09-30 10:31:38'),
(77, 'read_teams', 'teams', '2021-09-30 10:31:38', '2021-09-30 10:31:38'),
(78, 'edit_teams', 'teams', '2021-09-30 10:31:38', '2021-09-30 10:31:38'),
(79, 'add_teams', 'teams', '2021-09-30 10:31:38', '2021-09-30 10:31:38'),
(80, 'delete_teams', 'teams', '2021-09-30 10:31:38', '2021-09-30 10:31:38'),
(81, 'browse_team_department', 'team_department', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(82, 'read_team_department', 'team_department', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(83, 'edit_team_department', 'team_department', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(84, 'add_team_department', 'team_department', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(85, 'delete_team_department', 'team_department', '2021-10-30 04:07:33', '2021-10-30 04:07:33'),
(86, 'browse_clubs', 'clubs', '2022-02-25 14:12:13', '2022-02-25 14:12:13'),
(87, 'read_clubs', 'clubs', '2022-02-25 14:12:13', '2022-02-25 14:12:13'),
(88, 'edit_clubs', 'clubs', '2022-02-25 14:12:13', '2022-02-25 14:12:13'),
(89, 'add_clubs', 'clubs', '2022-02-25 14:12:13', '2022-02-25 14:12:13'),
(90, 'delete_clubs', 'clubs', '2022-02-25 14:12:13', '2022-02-25 14:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-30 07:37:45', '2021-09-30 07:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-09-30 07:37:44', '2021-09-30 07:37:44'),
(2, 'user', 'Normal User', '2021-09-30 07:37:44', '2021-09-30 07:37:44');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'SLC Admin', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Student Leadership Council Admin Page.', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\September2021\\idwZBanoXdK1VjQ6q2ED.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'SLC Admin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Update SLC\'s events, images, descriptions and members here.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/October2021/SEvBW14iIqesCl492f1c.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_graduation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `created_at`, `updated_at`, `name`, `title`, `description`, `linkedin`, `image`, `status`, `department`, `expected_graduation`) VALUES
(1, '2021-09-30 10:40:00', '2022-09-26 04:42:02', 'Elena Ivanov', 'President', 'Elena is a senior pursuing a B.S. in Information Systems. Upon graduting Elena is looking to apply her technology background and leadership skills to further her in her career. Her experince in interships, over 5 years of customer service jobs, and mulitple leadership positions including two years at SLC, has taught her how to work with a diverse team. She is passionately driven to better the community and to help others through teamwork and peer to peer mentorship.', 'https://www.linkedin.com/in/elena-ivanov-782206158/', 'teams/March2022/DSC47w0pXbSVnM9CpZ3J.png', 'GRADUATED', 'Executive Team', NULL),
(3, '2021-09-30 10:43:00', '2022-02-16 00:56:08', 'Maryam Zulqarnain', 'Director', 'Maryam is currently a junior majoring in Public Accounting and Business Management. She\'s on the 150 credit CPA track and will graduate during Spring 2023. Maryam joined the Koppelman SLC in Fall 2020 as an alumni relations strategist and has been the director of alumni relations since July 2021. She joined SLC to work on her public speaking skills and to expand her network while helping fellow students with their career journeys.', NULL, 'teams/February2022/K5CIA6wtV9tELm6Vjb2T.png', 'INACTIVE', 'Alumni Relations', '2023-05-15'),
(4, '2021-09-30 10:44:00', '2022-09-26 04:42:19', 'Sayem Uddin', 'Director', 'Sayem is currently a junior majoring in Business Management and Finance with a minor in Economics and is slated to graduate in the Spring 2022 semester. He joined the SLC in early 2021 to hone his leadership skills by taking a stronger role in advancing the development of the Koppelman School of Business community. He is most interested in pursuing a career in back-end financial management using predictive models built through AI, as well as investment research.', 'https://www.linkedin.com/in/sayemuddin/', 'teams/March2022/V23TmEHuk4tP3tXsbxVd.png', 'GRADUATED', 'Alumni Relations', NULL),
(8, '2021-10-09 02:44:00', '2022-02-15 10:34:36', 'Tareq Manawer', 'Strategist', '<p><span style=\"color: #212529; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 16px; text-align: center; background-color: rgba(255, 255, 255, 0.6);\">Tareq is a Brooklyn College senior, majoring in Finance and Business Administration, expected to graduate in spring 2021. Upon his graduation, he plans to pursue a career in any financial institution or attend graduate school to advance his career in finance. Currently, he is working as a Teller at TD Bank in the Financial District branch. He is excited to be part of the SLC family and contribute to the team.</span></p>', 'https://www.linkedin.com/in/tareq-manawer/', 'teams/October2021/r3mR6yzdy7pnpb5WArFF.png', 'GRADUATED', 'Business Relations', '2021-05-01'),
(9, '2021-10-09 02:46:00', '2022-09-26 04:42:36', 'Frances Sanzone', 'Co President', 'Frances is a senior majoring in Public Accounting, Business Management and Finance. She aspires to become a CPA after graduation. She focuses on building her personal and professional skills by participating in various internships and being a part of the team. She has been apart of them team for 2.5yrs and started off as a Faculty Relations Strategist before becoming Co President. SLC has helped her grow while preparing for the professional world.', 'https://www.linkedin.com/in/frances-sanzone-70ba71157/', 'teams/March2022/YMTRGRPmTHPiXOlEFZaN.png', 'GRADUATED', 'Executive Team', '2022-01-01'),
(11, '2021-10-09 02:48:00', '2022-02-15 10:27:16', 'Stebjola Shurdhi', 'Director | Vice President', 'Stebjola Shurdhi is a senior at Koppelman School of Business, majoring in Finance, and will be graduating in December 2021.Upon graduating she plans to work in the financial industry. She refines her skills and engages on campus by representing Koppelman School of Business in the 2020 CME Group University Trading Challenge, being the Vice President of the Investment Club, and the Vice President and Director of Operations at SLC. Stebjola joined SLC to get more involved on campus and meet high-achieving students who would help her improve their professional and communicative skills. In her free time, she likes to read, travel, and dance.', 'https://www.linkedin.com/in/stebjolashurdhi/', 'teams/October2021/waxn0qsYVagMa6gwsxkc.png', 'GRADUATED', 'Operations', '2021-12-01'),
(12, '2021-10-09 02:50:00', '2022-02-15 10:25:20', 'Wadelande Dutelien', 'Director', 'Wade is a senior majoring in Business Administration of Health Professions with a minor in Marketing and Consumer Behavior. She joined SLC Fall 2020 because she wanted to be more involved in student activities and connect with future leaders just like hersself. She will be graduating in Fall 2021, with the hopes of starting her own business, or a career in advertising &amp; marketing, with all the leadership and teamwork skills that she has learned from SLC and the KSB School of Businesses. She is very optimistic about what the future holds!', 'https://www.linkedin.com/in/wadelande-dutelien/', 'teams/October2021/dPyearqROySg3CD3J9Ni.png', 'GRADUATED', 'Marketing', '2021-12-01'),
(14, '2021-10-09 02:52:00', '2022-09-26 04:42:58', 'Wendy Guallpa', 'Director', 'Wendy is a senior majoring in Business Administration with a concentration in marketing. She joined SLC Spring 2021, as she wanted to get more involved with the Koppelman School of Business while expanding her network on campus. She\'s an ambitious student who has learned many valuable skills here at SLC. With what she has learned so far, she is excited about the opportunities that await her in the future.', 'https://www.linkedin.com/in/wendy-g/', 'teams/March2022/Kj7QVkrQgpRdcJgMVaw3.png', 'GRADUATED', 'Marketing', '2021-05-01'),
(15, '2021-10-09 02:54:00', '2022-02-15 10:23:32', 'Mohammad Hossain', 'Director', '<p>Mohammad is an aspiring software engineer. He is a Computer Science major and expects to graduate on December 2021. He and his teammates worked hard to build our website from scratch. He is a tech-enthusiast and wants to open his own tech startup in the future.</p>', 'https://www.linkedin.com/in/mohammadh1/', 'teams/October2021/XuARh7CQszWQJ4fd0oOn.png', 'GRADUATED', 'Technology', '2021-12-01'),
(25, '2021-10-15 10:10:00', '2022-09-26 04:41:12', 'Sydney Gately', 'Director', 'Sydney is currently working towards her BBA concentrating in Marketing and minoring in Business Law. She\'s excited to be a part of SLC and looking forward to developing her networking skills.', 'https://www.linkedin.com/in/sydney-gately-576408139/', 'teams/March2022/xRsiP9TGXgRvmicw76g1.png', 'INACTIVE', 'Club & Faculty Relations', '2023-12-15'),
(26, '2021-10-15 10:19:00', '2022-09-26 04:40:45', 'Skylar Lawrence', 'Director', 'Skylar is a senior majoring in Business Administration with a concentration in marketing a minor in Digital Design &amp; Production. She joined the SLC in Spring 2021 with hopes to make new friends, expand her marketing experience and learn how to network in a professional setting. When shes not focused on school or marketing, she&rsquo;s involved in all things beauty and currently works at Sephora; she plans to start her own cosmetic line within 8 years.', 'https://www.linkedin.com/in/skylar-lawrence-615348189/', 'teams/March2022/E7wOx0oE0DVNai8CKQny.png', 'GRADUATED', 'Marketing', '2022-05-15'),
(27, '2021-10-15 10:32:00', '2022-09-12 10:11:56', 'Nelson Wang', 'Director', 'Nelson is a junior majoring in Computer Science with a minor in Marketing and will be graduating in the Spring 2023 semester. He joined SLC during Fall 2021 to be more engaged with college activities and to enhance his programming skills. Upon his graduation, he plans to pursue a career as a software engineer. His dream is to develop and publish 100 apps before retiring.', 'https://www.linkedin.com/in/nelson-wang-590a7a16b/', 'teams/March2022/HR0ryw1AqYwtvclekEvI.png', 'GRADUATED', 'Technology', '2023-05-05'),
(28, '2021-10-15 10:35:00', '2022-02-15 10:35:31', 'Dylan Harden-Sandhu', 'Tentative Strategist', 'Dylan Harden-Sandhu is a Junior at the Koppelman School of Business, majoring in Business Administration with a concentration in Business Management, and will be graduating in May of 2023. Upon graduation, he plans to work in the financial industry. He has refined his leadership skills through several internships and by becoming an Eagle Scout for the Boy Scouts of America. He also engages on campus by representing Koppelman School of Business, being an active member of the Investment Club, and an Operations Strategist at SLC. Dylan joined SLC to meet like-minded, high-achieving students who would help him improve upon his professional skills.', NULL, 'teams/October2021/x62Q3HZeRnAj5jnc7J25.png', 'INACTIVE', 'Operations', '2023-05-05'),
(29, '2022-03-30 11:51:00', '2022-08-29 05:40:28', 'Christos Vavasis', 'Strategist', 'Christos is an incoming freshman at Brooklyn college pursuing a major in Business Law and Real Estate. As I come into my own, I realize leadership and business management go hand in hand. To succeed, you must constantly improve and refine your skills for the job you want. Leadership is everywhere, and understanding how that works, I must start', 'https://www.linkedin.com/in/christos-vavasis-a0292a220/', 'teams/March2022/d2jdcUWri84dqqkHEvVs.png', 'INACTIVE', 'Club & Faculty Relations', NULL),
(30, '2022-09-23 23:38:00', '2022-09-24 23:41:08', 'Esha Abbasi', 'President', 'Esha Abbasi is a senior pursuing a B.S. in Public Accounting and Business Management. She is an aspiring CPA and wants to further her career in that field. Esha is the President of the Koppelman Student Leadership Council however, she initially started as the Director of the Operations Department. She is passionate about giving back to the community with help of her leadership skills and her goal for SLC is to make it the most reputable council of Brooklyn College.', 'https://www.linkedin.com/in/esha-abbasi/', 'teams/September2022/j3HjruymS23EF3UeLiid.jpg', 'ACTIVE', 'Executive Team', '2023-05-26'),
(31, '2022-09-23 23:41:00', '2022-10-11 21:38:31', 'Qasim Nadeem', 'Co-President and Director of Operations', 'Qasim is a senior pursuing a B.B.A in Finance and a B.S in Public Accounting and Business Management. After graduating, Qasim is looking forward to getting his licensure as a CPA and using the financial knowledge and skills to advance himself in his career. Prior experience studying financial markets with a team, over 3 years of customer service and having a leadership position here at the SLC has taught him how to work with a very diverse group of people and the patience needed for it.', 'https://www.linkedin.com/in/qasim-nadeem-0606561a9/', 'teams/October2022/5e8Lm3B5s0LNOwJ1qs7F.jpg', 'ACTIVE', 'Executive Team', '2024-05-26'),
(32, '2022-09-23 23:44:00', '2022-09-26 05:45:41', 'James Ma', 'Director', 'James is a super senior pursuing a B.S. in Public Accounting & Business Management. Upon graduation, James will be working full time at PwC in the State and Local Tax team. His experience includes a completion of 135+ hours of the Volunteer Income Tax Assistant program and internship from PwC where he further developed his business acumen and technological skills and received a return offer right after. He also had leadership positions roles from being the president of the Smooth Talkers club and as a Peer Mentor.', 'https://www.linkedin.com/in/ma-james/', 'teams/September2022/rv3nlzMaAGbnQfowImfU.JPEG', 'ACTIVE', 'Marketing', '2023-05-26'),
(33, '2022-09-23 23:47:00', '2022-09-24 23:43:12', 'Eric Ma', 'Director', 'Eric is a senior pursuing a B.S. in Computer Science. He wants to do software development or engineering after graduation. Eric has experience in web development. He joined SLC back in March 2022 as a technology strategist and is now the technology director of SLC.', 'https://www.linkedin.com/in/eric-ma-8868241b6/', 'teams/September2022/XegZeYnPnpPFZiBv6ZFa.jpg', 'ACTIVE', 'Technology', '2023-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `team_department`
--

CREATE TABLE `team_department` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-09-30 07:37:45', '2021-09-30 07:37:45'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-09-30 07:37:45', '2021-09-30 07:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'brooklynslcouncil@gmail.com', 'users\\September2021\\HEEh0VyexGYQy0XZ61cb.png', NULL, '$2y$10$SmpusRLd42lfW/mbcJLBQ.4yiUUe0rqzbxbBabmM15JuAmczRiZSa', 'b8izHWi9STPmo89QgJ0kyuzM1dVnEjy2uYbG5nQLR3kBN1gfjs4Fu4zh7f4W', '{\"locale\":\"en\"}', '2021-09-30 07:37:45', '2021-10-01 00:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_department`
--
ALTER TABLE `team_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `permission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `team_department`
--
ALTER TABLE `team_department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
