-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 31, 2024 at 09:42 AM
-- Server version: 10.5.20-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `provkcix_boltapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigns`
--

CREATE TABLE `assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kitchen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bolts`
--

CREATE TABLE `bolts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `bolt_earning` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_number` varchar(255) DEFAULT NULL,
  `company_document` varchar(255) DEFAULT NULL,
  `vehicle_id` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `owner_name`, `owner_number`, `company_document`, `vehicle_id`, `category`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'True Porter', 'TruePorter', '8501020559', 'CompanyImage/4cdcf18ba72a7b28dc405b992f8cddcd.jpeg', NULL, 'Fleet', NULL, '2024-01-26 20:36:59', '2024-01-26 20:36:59'),
(2, 'Driveloop AB', 'Driveloop', '5592838048', 'CompanyImage/c8dfece5cc68249206e4690fc4737a8d.jpeg', NULL, 'Fleet', NULL, '2024-01-26 21:02:13', '2024-01-26 21:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `configrations`
--

CREATE TABLE `configrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `animal_length` varchar(255) DEFAULT NULL,
  `hitpoints` varchar(250) DEFAULT NULL,
  `max_timer` varchar(250) DEFAULT NULL,
  `animal_visibility` varchar(250) DEFAULT NULL,
  `animal_shown` varchar(250) DEFAULT NULL,
  `tba1` varchar(250) DEFAULT NULL,
  `ap1` varchar(250) DEFAULT NULL,
  `ap2` varchar(250) DEFAULT NULL,
  `rlc1` varchar(250) DEFAULT NULL,
  `rlc2` varchar(250) DEFAULT NULL,
  `xs1` varchar(250) DEFAULT NULL,
  `xs2` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `tba2` varchar(250) DEFAULT NULL,
  `g1` varchar(250) DEFAULT NULL,
  `g2` varchar(250) DEFAULT NULL,
  `e1` varchar(250) DEFAULT NULL,
  `e2` varchar(250) DEFAULT NULL,
  `d1` varchar(250) DEFAULT NULL,
  `d2` varchar(250) DEFAULT NULL,
  `total_animal` varchar(250) DEFAULT NULL,
  `level_no` varchar(250) DEFAULT NULL,
  `level_configation` varchar(255) DEFAULT NULL,
  `probability` varchar(255) DEFAULT NULL,
  `mouse` varchar(500) DEFAULT NULL,
  `bat` varchar(500) DEFAULT NULL,
  `rooster` varchar(500) DEFAULT NULL,
  `dog` varchar(500) DEFAULT NULL,
  `crab` varchar(500) DEFAULT NULL,
  `snake` varchar(500) DEFAULT NULL,
  `wolf` varchar(500) DEFAULT NULL,
  `rhino` varchar(500) NOT NULL,
  `crocodile` varchar(500) DEFAULT NULL,
  `bear` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configrations`
--

INSERT INTO `configrations` (`id`, `animal_length`, `hitpoints`, `max_timer`, `animal_visibility`, `animal_shown`, `tba1`, `ap1`, `ap2`, `rlc1`, `rlc2`, `xs1`, `xs2`, `note`, `tba2`, `g1`, `g2`, `e1`, `e2`, `d1`, `d2`, `total_animal`, `level_no`, `level_configation`, `probability`, `mouse`, `bat`, `rooster`, `dog`, `crab`, `snake`, `wolf`, `rhino`, `crocodile`, `bear`, `created_at`, `updated_at`) VALUES
(9, '1', '100', '60', '2', '1', '2', '5', '1', NULL, NULL, '100', '3', NULL, '3', '500', '10', '2', '0', '8', '0', '1', '0', 'Wood 1', '{\"data\":[\"100\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:16:32', '2023-03-02 13:43:19'),
(10, '1,2', '500', '55', '1.8', '1', '1.5', '6', '2', NULL, NULL, '110', '5', NULL, '2.4', '150', '15', '0', '0', '4', '0', '2', '1', 'Wood 1', '{\"data\":[\"50\",\"50\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:29:14', '2023-03-02 15:10:21'),
(11, '1,2', '2000', '100', '1.7', '1', '1.6', '8', '3', NULL, NULL, '180', '7', NULL, '2.2', '250', '20', '0', '0', '6', '0', '2', '2', 'Wood 1', '{\"data\":[\"30\",\"70\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:33:31', '2023-03-02 15:10:58'),
(12, '1,2,3', '6000', '130', '1.65', '1', '1.4', '10', '4', NULL, NULL, '210', '10', NULL, '2.3', '450', '40', '0', '0', '8', '0', '3', '3', 'Wood 1', '{\"data\":[\"20\",\"40\",\"40\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:38:06', '2023-03-02 15:11:33'),
(13, '1,2,3', '12000', '240', '1.2', '2', '1.2', '25', '10', NULL, NULL, '1000', '25', NULL, '1.7', '1000', '130', '5', '0', '20', '0', '3', '4', 'Wood 1', '{\"data\":[\"10\",\"50\",\"40\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:40:42', '2023-03-02 15:12:39'),
(14, '1,2,3,4', '7000', '60', '1.2', '2', '1.2', '10', '4', NULL, NULL, '120', '6', NULL, '1.9', '100', '12', '0', '0', '1', '0', '4', '5', 'Wood 2', '{\"data\":[\"5\",\"35\",\"35\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:45:18', '2023-03-02 15:13:57'),
(15, '1,2,3,4', '25000', '180', '1.5', '2', '1.1', '15', '6', NULL, NULL, '300', '13', NULL, '1.6', '400', '30', '0', '0', '3', '0', '4', '6', 'Wood 2', '{\"data\":[\"5\",\"35\",\"35\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:48:15', '2023-03-02 15:15:12'),
(16, '1,2,3,4,5', '35000', '240', '1.15', '2', '1', '17', '8', NULL, NULL, '375', '16', NULL, '1.6', '600', '130', '0', '0', '6', '0', '5', '7', 'Wood 2', '{\"data\":[\"5\",\"25\",\"30\",\"35\",\"5\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:52:22', '2023-03-02 15:15:37'),
(17, '1,2,3,4,6', '60000', '360', '1.1', '2', '1', '20', '9', NULL, NULL, '480', '20', NULL, '1.5', '1000', '130', '2', '0', '10', '2', '5', '8', 'Wood 2', '{\"data\":[\"5\",\"35\",\"35\",\"15\",\"10\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:55:29', '2023-03-02 15:16:13'),
(18, '1,2,3,4,5', '120000', '500', '1.1', '2', '0.9', '30', '10', NULL, NULL, '1200', '25', NULL, '1.3', '5000', '130', '8', '0', '40', '2', '5', '9', 'Wood 3', '{\"data\":[\"15\",\"30\",\"15\",\"22\",\"18\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:57:15', '2023-03-02 15:16:43'),
(19, '3,4,5,6', '110000', '180', '1.05', '2', '1', '15', '6', NULL, NULL, '290', '25', NULL, '1.5', '800', '120', '0', '0', '5', '0', '4', '10', 'Wood 2', '{\"data\":[\"10\",\"30\",\"30\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 12:59:22', '2023-03-02 15:18:13'),
(20, '2,4,5,6', '140000', '170', '1.05', '2', '1', '18', '8', NULL, NULL, '360', '29', NULL, '1.5', '950', '120', '1', '0', '2', '1', '4', '11', 'Wood 3', '{\"data\":[\"15\",\"25\",\"30\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:01:30', '2023-03-02 15:18:37'),
(21, '2,3,5,6', '190000', '200', '1.05', '2', '1', '21', '10', NULL, NULL, '440', '32', NULL, '1.5', '1030', '130', '0', '0', '5', '1', '4', '12', 'Wood 3', '{\"data\":[\"20\",\"30\",\"30\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:11:47', '2023-03-02 15:18:59'),
(22, '1,2,3,4,6', '280000', '280', '1.05', '2', '1', '23', '12', NULL, NULL, '510', '36', NULL, '1.5', '1090', '100', '1', '0', '3', '2', '5', '13', 'Wood 3', '{\"data\":[\"15\",\"15\",\"15\",\"25\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:13:29', '2023-03-02 15:19:50'),
(23, '1,2,3,4,5,6', '700000', '620', '1', '3', '0.5', '35', '14', NULL, NULL, '1800', '70', NULL, '0.9', '7000', '190', '4', '1', '10', '1', '6', '14', 'Wood 3', '{\"data\":[\"18\",\"18\",\"18\",\"17\",\"15\",\"14\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:15:24', '2023-03-02 15:20:15'),
(24, '4,5,6', '250000', '220', '1', '3', '0.4', '15', '6', NULL, NULL, '530', '40', NULL, '0.9', '1100', '140', '0', '0', '6', '0', '3', '15', 'Iron 1', '{\"data\":[\"33\",\"33\",\"34\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:19:28', '2023-03-02 15:21:08'),
(25, '4,5,6', '340000', '210', '0.95', '3', '0.5', '17', '7', NULL, NULL, '580', '41', NULL, '1.1', '1200', '145', '0', '0', '7', '0', '3', '16', 'Iron 1', '{\"data\":[\"45\",\"30\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:24:17', '2023-03-02 15:21:56'),
(26, '4,5,6,7', '400000', '230', '0.95', '3', '0.6', '19', '8', NULL, NULL, '610', '42', NULL, '1.1', '1300', '150', '1', '0', '3', '0', '4', '17', 'Iron 1', '{\"data\":[\"25\",\"25\",\"25\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:27:13', '2023-03-02 15:22:21'),
(27, '4,5,6,7', '360000', '160', '0.95', '3', '0.4', '21', '9', NULL, NULL, '630', '43', NULL, '0.9', '1400', '160', '1', '0', '4', '1', '4', '18', 'Iron 1', '{\"data\":[\"35\",\"30\",\"20\",\"15\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:31:59', '2023-03-02 15:22:43'),
(28, '3,4,5,6,7', '500000', '220', '0.95', '3', '0.3', '23', '10', NULL, NULL, '675', '44', NULL, '0.6', '1500', '170', '2', '0', '6', '1', '5', '19', 'Iron 1', '{\"data\":[\"20\",\"20\",\"20\",\"20\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:35:41', '2023-03-02 15:23:03'),
(29, '2,3,5,6,7', '375000', '180', '0.95', '3', '0.3', '25', '11', NULL, NULL, '710', '45', NULL, '0.7', '1600', '80', '1', '1', '9', '2', '5', '20', 'Iron 1', '{\"data\":[\"20\",\"20\",\"20\",\"20\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:40:19', '2023-03-02 15:24:24'),
(30, '1,2,3,4,5,6', '250000', '180', '0.9', '3', '0.6', '27', '12', NULL, NULL, '735', '46', NULL, '0.9', '1000', '100', '1', '1', '6', '2', '6', '21', 'Iron 1', '{\"data\":[\"5\",\"10\",\"15\",\"15\",\"25\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:43:45', '2023-03-02 15:24:51'),
(31, '1,2,3,4,5,6', '1250000', '600', '0.9', '5', '0.2', '40', '15', NULL, NULL, '2200', '75', NULL, '0.5', '8000', '190', '8', '3', '25', '5', '6', '22', 'Iron 1', '{\"data\":[\"10\",\"10\",\"15\",\"20\",\"20\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:49:42', '2023-03-02 15:25:15'),
(32, '1,2,3,4,5,6', '215000', '90', '0.9', '4', '0.6', '12', '3', NULL, NULL, '650', '30', NULL, '0.9', '400', '75', '0', '0', '1', '0', '6', '23', 'Iron 2', '{\"data\":[\"10\",\"15\",\"15\",\"15\",\"20\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 13:53:43', '2023-03-02 15:26:52'),
(33, '1,2,3,4,5,6', '150000', '60', '0.9', '4', '0.6', '13', '4', NULL, NULL, '700', '35', NULL, '0.9', '450', '85', '1', '0', '2', '0', '6', '24', 'Iron 2', '{\"data\":[\"15\",\"15\",\"20\",\"20\",\"15\",\"15\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 14:59:50', '2023-03-02 15:27:48'),
(34, '5,6,7,8', '300000', '90', '0.9', '4', '0.5', '15', '7', NULL, NULL, '700', '35', NULL, '1.1', '1500', '150', '1', '0', '3', '0', '4', '25', 'Iron 2', '{\"data\":[\"25\",\"25\",\"25\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:01:25', '2023-03-02 15:30:00'),
(35, '5,6,7,8', '525000', '150', '0.9', '4', '0.5', '17', '8', NULL, NULL, '700', '35', NULL, '1', '1800', '160', '0', '0', '6', '0', '4', '26', 'Iron 2', '{\"data\":[\"35\",\"30\",\"20\",\"15\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:02:54', '2023-03-02 15:30:33'),
(36, '4,5,6,7,8', '900000', '250', '0.85', '0.85', '0.45', '19', '9', NULL, NULL, '700', '35', NULL, '0.95', '1700', '175', '0', '0', '2', '0', '5', '27', 'Iron 2', '{\"data\":[\"15\",\"15\",\"15\",\"25\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:04:33', '2023-03-02 15:31:08'),
(37, '3,4,6,7,8', '1300000', '350', '0.85', '5', '0.45', '21', '10', NULL, NULL, '700', '35', NULL, '0.85', '1800', '180', '1', '0', '4', '1', '5', '28', 'Iron 2', '{\"data\":[\"20\",\"20\",\"20\",\"20\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:06:03', '2023-03-02 15:32:17'),
(38, '3,4,7,8,9', '2750000', '450', '0.85', '5', '0.5', '23', '11', NULL, NULL, '700', '35', NULL, '0.7', '1800', '200', '2', '0', '3', '2', '5', '29', 'Iron 2', '{\"data\":[\"20\",\"20\",\"20\",\"20\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:07:28', '2023-03-02 15:32:44'),
(39, '3,4,5,6,7,8', '3000000', '750', '0.8', '6', '0.3', '45', '17', NULL, NULL, '2800', '85', NULL, '0.4', '10000', '250', '10', '2', '35', '6', '6', '30', 'Iron 2', '{\"data\":[\"10\",\"15\",\"15\",\"15\",\"20\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:09:09', '2023-03-02 15:38:23'),
(40, '7,8,9,10', '900000', '120', '0.8', '5', '0.4', '24', '12', NULL, NULL, '700', '37', NULL, '0.8', '2000', '200', '2', '0', '3', '1', '4', '31', 'Iron 3', '{\"data\":[\"35\",\"30\",\"20\",\"15\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:10:36', '2023-03-02 15:38:49'),
(41, '5,6,7,8', '800000', '150', '0.8', '5', '0.4', '25', '12', NULL, NULL, '750', '39', NULL, '0.7', '2100', '210', '2', '0', '3', '1', '4', '32', 'Iron 3', '{\"data\":[\"25\",\"25\",\"25\",\"25\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:12:16', '2023-03-02 15:39:11'),
(42, '4,5,6,7,8,9', '1300000', '180', '0.8', '6', '0.4', '26', '12', NULL, NULL, '800', '41', NULL, '0.7', '2200', '220', '2', '0', '3', '1', '6', '33', 'Iron 3', '{\"data\":[\"5\",\"10\",\"15\",\"15\",\"25\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:13:41', '2023-03-02 15:39:37'),
(43, '1,2,7,8,9', '1300000', '210', '0.7', '6', '0.4', '27', '13', NULL, NULL, '850', '43', NULL, '0.7', '1500', '150', '3', '0', '6', '3', '5', '34', 'Iron 3', '{\"data\":[\"20\",\"20\",\"20\",\"20\",\"20\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:15:12', '2023-03-02 15:40:19'),
(44, '2,3,4,6,7,8,9', '1750000', '260', '0.7', '6', '0.3', '28', '13', NULL, NULL, '800', '45', NULL, '0.6', '1600', '160', '3', '0', '5', '4', '7', '35', 'Iron 3', '{\"data\":[\"15\",\"15\",\"15\",\"15\",\"15\",\"15\",\"10\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:16:49', '2023-03-02 15:45:06'),
(45, '6,7,8,9,10', '2750000', '290', '0.7', '6', '0.3', '29', '13', NULL, NULL, '1000', '50', NULL, '0.6', '1700', '170', '4', '0', '3', '1', '5', '36', 'Iron 3', '{\"data\":[\"15\",\"15\",\"15\",\"25\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:18:10', '2023-03-02 15:45:30'),
(46, '4,5,7,9.10', '3400000', '340', '0.7', '6', '0.3', '30', '14', NULL, NULL, '1200', '55', NULL, '0.6', '2500', '250', '0', '0', '2', '1', '5', '37', 'Iron 3', '{\"data\":[\"15\",\"30\",\"15\",\"22\",\"18\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:19:49', '2023-03-02 15:45:51'),
(47, '3,4,5,6,7,8', '3400000', '400', '0.7', '6', '0.2', '31', '14', NULL, NULL, '1500', '65', NULL, '0.5', '1800', '200', '4', '0', '10', '6', '6', '38', 'Iron 3', '{\"data\":[\"18\",\"22\",\"10\",\"9\",\"11\",\"30\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:21:13', '2023-03-02 15:46:41'),
(48, '1,2,3,4,5,6,7,8,9,10', '9999999', '800', '0.5', '7', '0.1', '55', '19', NULL, NULL, '5000', '200', NULL, '0.3', '15000', '450', '10', '3', '50', '7', '10', '39', 'Iron 3', '{\"data\":[\"10\",\"10\",\"10\",\"10\",\"10\",\"10\",\"10\",\"10\",\"10\",\"10\"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-02-28 15:22:55', '2023-03-02 15:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Pending',
  `card` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meter_reading` varchar(255) DEFAULT NULL,
  `total_life_kilometer` varchar(255) DEFAULT NULL,
  `remaining_reciveable` varchar(255) DEFAULT NULL,
  `deduct_from_salary` varchar(255) DEFAULT NULL,
  `total_payable_exclusive_tex` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `amount_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `amount`, `category`, `image`, `status`, `card`, `user_id`, `meter_reading`, `total_life_kilometer`, `remaining_reciveable`, `deduct_from_salary`, `total_payable_exclusive_tex`, `comment`, `amount_type`, `created_at`, `updated_at`) VALUES
(1, '1200', 'Petrol', NULL, 'Approved', 'Payable', 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-08 13:18:12', '2024-01-09 14:33:05'),
(2, '2200', 'Petrol', NULL, 'Approved', 'Payable', 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 14:53:55', '2024-01-24 14:54:43'),
(3, '1000', 'Petrol', NULL, 'Approved', 'Payable', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 14:59:29', '2024-01-24 14:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_files`
--

CREATE TABLE `import_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_files`
--

INSERT INTO `import_files` (`id`, `file`, `created_at`, `updated_at`) VALUES
(1, 'ImportFile/e8dfff4676a47048d6f0c4ef899593dd.csv', '2024-01-08 13:09:51', '2024-01-08 13:09:51'),
(2, 'ImportFile/f3067d687ee39c3cbfa75573457e479d.csv', '2024-01-08 13:11:26', '2024-01-08 13:11:26'),
(3, 'ImportFile/1e69276e3d5650de297e980aa4f59671.csv', '2024-01-08 13:14:55', '2024-01-08 13:14:55'),
(4, 'ImportFile/486fbd761bfa5400722324fdc9822adc.csv', '2024-01-08 13:16:05', '2024-01-08 13:16:05'),
(5, 'ImportFile/0e57098d0318a954d1443e2974a38fac.csv', '2024-01-08 15:27:54', '2024-01-08 15:27:54'),
(6, 'ImportFile/0fd600c953cde8121262e322ef09f70e.csv', '2024-01-08 15:41:22', '2024-01-08 15:41:22'),
(7, 'ImportFile/ae0e08163d22befd4635f47bef1b6e3f.csv', '2024-01-08 15:42:46', '2024-01-08 15:42:46'),
(8, 'ImportFile/f86890095c957e9b949d11d15f0d0cd5.csv', '2024-01-08 15:44:54', '2024-01-08 15:44:54'),
(9, 'ImportFile/d17e6bcbcef8de3f7a00195cfa5706f1.csv', '2024-01-10 18:22:14', '2024-01-10 18:22:14'),
(10, 'ImportFile/eb1848290d5a7de9c9ccabc67fefa211.csv', '2024-01-17 12:29:37', '2024-01-17 12:29:37'),
(11, 'ImportFile/986648642d1a68a3178f6869689cc260.csv', '2024-01-17 12:34:37', '2024-01-17 12:34:37'),
(12, 'ImportFile/11338326597d14a1f7c745853f4d50a8.csv', '2024-01-24 14:52:36', '2024-01-24 14:52:36'),
(13, 'ImportFile/98afdcc1ebd85daa0f1749c5e56b9d8c.csv', '2024-01-26 21:08:04', '2024-01-26 21:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_payable` varchar(255) DEFAULT NULL,
  `total_receivable` varchar(255) DEFAULT NULL,
  `deduct_from_salary` varchar(255) DEFAULT NULL,
  `total_payable_exclusive_tex` varchar(255) DEFAULT NULL,
  `remaining_reciveable` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total_inclusive_tex` varchar(255) DEFAULT NULL,
  `commission_salaryComputed` varchar(255) DEFAULT NULL,
  `hourly_salaryComputed` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leader_boards`
--

CREATE TABLE `leader_boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `total_level` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2021_10_22_072707_create_invitations_table', 1),
(11, '2023_03_15_084232_create_locations_table', 2),
(12, '2023_06_06_095909_create_assigns_table', 3),
(44, '2014_10_12_000000_create_users_table', 4),
(56, '2023_07_31_085140_create_drivers_table', 4),
(97, '2014_10_12_100000_create_password_resets_table', 5),
(98, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(99, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(100, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(101, '2016_06_01_000004_create_oauth_clients_table', 5),
(102, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5),
(103, '2019_08_19_000000_create_failed_jobs_table', 5),
(104, '2019_12_14_000001_create_personal_access_tokens_table', 5),
(105, '2023_02_07_073922_create_roles_table', 5),
(106, '2023_02_07_125444_create_admin_users_table', 5),
(107, '2023_02_09_134955_create_contacts_table', 5),
(108, '2023_07_31_085140_create_users_table', 5),
(109, '2023_08_01_071922_create_vehicles_table', 5),
(110, '2023_08_17_074106_create_expenses_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00300de76c0c53f342112b1c5746ca51f99ea8a79f5980f57021f8b3077790fe101d2719adccd46e', 1, 1, 'Token', '[]', 0, '2023-10-03 15:49:46', '2023-10-03 15:49:46', '2024-10-03 11:49:46'),
('006142ed86d76faa0817e3e2664434d2c32d7808b04955826c6239d4b3c35d12354fb18f1d729bdc', 1, 1, 'Token', '[]', 0, '2023-12-26 08:37:30', '2023-12-26 08:37:30', '2024-12-26 08:37:30'),
('006df462e64cd7554a477cece651a962c08d8dbdb2de01e9dbef80fb19a7f8457fb36afe20fd259e', 1, 1, 'Token', '[]', 0, '2023-11-23 14:07:49', '2023-11-23 14:07:49', '2024-11-23 09:07:49'),
('0104f6be3f68ceeceb0177841d7b36b669615aa159284139fe6a4c24d0beb4a794deb785a840bfd3', 1, 1, 'Token', '[]', 0, '2023-11-28 13:39:29', '2023-11-28 13:39:29', '2024-11-28 08:39:29'),
('011c05cc9ac3bfe2757415f1b6fc08f1d864d25ce032dad05a59cb5abb7335238b55d2939b6ff7cd', 1, 1, 'Token', '[]', 0, '2023-08-31 11:07:31', '2023-08-31 11:07:31', '2024-08-31 07:07:31'),
('0149c32c3592ad758276bcd544766e8a66d96730134ff05fac4c069fa086b7c2c76582b7d5739121', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:38', '2023-08-24 15:32:38', '2024-08-24 11:32:38'),
('02e75f7c8a3bae1345eb4d731b8fb7c7292e486fa7c851a5e83b2724d783261fd188237027bfeaa8', 1, 1, 'Token', '[]', 0, '2023-09-25 17:07:57', '2023-09-25 17:07:57', '2024-09-25 13:07:57'),
('03fc37fea7d27ded37f4651a8af36cef216346b47c405d56301920979a937f2f2dcf2f4dc80c4d15', 1, 1, 'Token', '[]', 0, '2023-11-28 13:48:51', '2023-11-28 13:48:51', '2024-11-28 08:48:51'),
('040d0efc7bd90b7531854ac81c72c4e3055b28bfbd969bd29d40bd28aabeb6443cadce60bb5b8a68', 1, 1, 'Token', '[]', 0, '2023-12-04 11:02:54', '2023-12-04 11:02:54', '2024-12-04 11:02:54'),
('055c1f16681d844af276a9f397f8c61eac63296e51b58a9daa2b598ab4dedd6777f6fcf4d77a9085', 1, 1, 'Token', '[]', 0, '2023-12-04 11:02:52', '2023-12-04 11:02:52', '2024-12-04 11:02:52'),
('05d2893533f84c86aebb720d8e9ea803cc5fbb421a5885adaaaf1205a1aa0577a2289f127cff4d9e', 1, 1, 'Token', '[]', 0, '2023-12-03 12:09:32', '2023-12-03 12:09:32', '2024-12-03 12:09:32'),
('06a16d6699cee01a428f2b1fb95b5f43299000b1b4020ce6149138cd5f218d54a9581478475a1996', 1, 1, 'Token', '[]', 0, '2023-08-21 10:15:48', '2023-08-21 10:15:48', '2024-08-21 06:15:48'),
('08895f3f9161c33dd3696a8e9baf71e5c9efd1f1739fb345a5a0f2c93170d2526562578b75cdba3c', 1, 1, 'Token', '[]', 0, '2023-11-27 19:45:29', '2023-11-27 19:45:29', '2024-11-27 14:45:29'),
('09005fbe81347be804036f3155a4e6bd39e2706a18cf61e70418bcb97218bf275437e029c86ad75d', 1, 1, 'Token', '[]', 0, '2023-11-28 13:39:29', '2023-11-28 13:39:29', '2024-11-28 08:39:29'),
('093a4735c6741e24f46aaf86cb120db46900ef042521d96f3ffe298fbd61c1414256094670e6f0d8', 1, 1, 'Token', '[]', 0, '2023-10-18 10:21:15', '2023-10-18 10:21:15', '2024-10-18 06:21:15'),
('0a302b3d3b00e3c5677396cfa35e45b7aa2530494f96e8411f9d75afd6e6d8d8a9d5868d8e59b828', 1, 1, 'Token', '[]', 0, '2023-10-11 12:15:27', '2023-10-11 12:15:28', '2024-10-11 08:15:27'),
('0a3a126378d7d5784a6fa259044192fb12776e5a01e5740fa640ee3a4936d26bb16715ac4826adcd', 1, 1, 'Token', '[]', 0, '2024-01-06 11:54:44', '2024-01-06 11:54:44', '2025-01-06 06:54:44'),
('0d1666b5312da81c49e3b808bf682e59139a0b8f0b9a61ea5abe8695c3f5aeff3bc8b897ce2f7ab0', 1, 1, 'Token', '[]', 0, '2023-09-26 15:06:33', '2023-09-26 15:06:33', '2024-09-26 11:06:33'),
('0d22a1baaff98cbbf310ff81b4aed635b7c4409159dcf8d051c6e66b12ef3fd90f02c102e30001b3', 1, 1, 'Token', '[]', 0, '2023-09-22 18:05:09', '2023-09-22 18:05:09', '2024-09-22 14:05:09'),
('0d44aab63da8b6ba7b20159e98f44a58a5607bb880a74845d09ab3fb8c0b475ab20f6cb8488ea7ba', 1, 1, 'Token', '[]', 0, '2023-09-27 14:27:49', '2023-09-27 14:27:49', '2024-09-27 10:27:49'),
('0da9654262ba9edbd0b2b5b14f449bcdb48151827c4eff9fead3aec55a51d23469eaf8bf7c88a592', 1, 1, 'Token', '[]', 0, '2023-10-19 14:16:40', '2023-10-19 14:16:41', '2024-10-19 10:16:40'),
('0e8ab6364cc013c078b427eb0c404c5a98fe33b5f2d9d04668a1e8090ca607353c7c4d9ffdc9a943', 1, 1, 'Token', '[]', 0, '2024-01-26 20:10:06', '2024-01-26 20:10:06', '2025-01-26 15:10:06'),
('0eb15adcbb7c7e9ea2f74acc251d1689bb0013dcd040ff78f2dff0b5b0b5360d5e39a1fc3ed2c7f2', 1, 1, 'Token', '[]', 0, '2023-11-30 14:31:43', '2023-11-30 14:31:43', '2024-11-30 14:31:43'),
('0f8c34139a4663078340c6f393f5ee4dfbe3e05f5e0ab27a6246302b660e44edac8820ac35be0ff7', 1, 1, 'Token', '[]', 0, '2024-01-18 17:08:09', '2024-01-18 17:08:09', '2025-01-18 12:08:09'),
('0f97e8edf2d461926de084ea992973ce3f133361cca559178000363fd8330bdb69654d57c9857b99', 1, 1, 'Token', '[]', 0, '2024-01-17 13:32:57', '2024-01-17 13:32:57', '2025-01-17 08:32:57'),
('101ce9188ea44b453eec669f0a04770b5523c426a479c247d0dd7ab2623d616ef2fbea2099337fcf', 1, 1, 'Token', '[]', 0, '2023-11-23 14:07:49', '2023-11-23 14:07:49', '2024-11-23 09:07:49'),
('1074b8d13ffc87120a76e1a16544de4407bbd0028a4d0480f856d3081aa298553572ba15d012f433', 1, 1, 'Token', '[]', 0, '2023-09-08 17:29:53', '2023-09-08 17:29:53', '2024-09-08 13:29:53'),
('12ddff76fcec6121d46f8c69a306844acb5a65a35e21fd9929f53f7dc4f2e4dc1222b13e08e4a6a2', 1, 1, 'Token', '[]', 0, '2024-01-30 13:40:56', '2024-01-30 13:40:56', '2025-01-30 08:40:56'),
('12fad37a94aa9255f13ead41a1dcbe6447e5f12e8f15f2c89ce06d2c724de9511d0070da9d890596', 1, 1, 'Token', '[]', 0, '2023-09-08 15:03:03', '2023-09-08 15:03:03', '2024-09-08 11:03:03'),
('14297d7061402fb17b678e35a8a65dce3212fc7629b56cc0fcae16b18b60e09084a140d42a1846a2', 1, 1, 'Token', '[]', 0, '2023-09-07 17:53:24', '2023-09-07 17:53:24', '2024-09-07 13:53:24'),
('1441659b68e232aca8f47cf1cb210b221e24d432eba97f14f07ae8649645131148febed1c83b8c82', 1, 1, 'Token', '[]', 0, '2023-10-16 16:22:42', '2023-10-16 16:22:42', '2024-10-16 12:22:42'),
('14831714a20c903fba407c6c935fb1f939c2c86176c51f5bbd306bed031eaeaef05f404b1cc36065', 1, 1, 'Token', '[]', 0, '2023-11-29 21:08:45', '2023-11-29 21:08:45', '2024-11-29 16:08:45'),
('150a7d07317b0f147f06e6919caca7a782a2e0aad319aa6863bc949f8c91088ab2e20399c8a858c5', 1, 1, 'Token', '[]', 0, '2023-08-30 11:47:39', '2023-08-30 11:47:39', '2024-08-30 07:47:39'),
('15ab161fc8f8e2cdc0ba5e675fa1f5373d43091c68ef04b1b2fa92f58a9682bb84143d442fd7f90f', 1, 1, 'Token', '[]', 0, '2023-11-30 14:37:23', '2023-11-30 14:37:23', '2024-11-30 14:37:23'),
('15f4c523f291d82ed9dfd4356c6359d1b78638da456ea479ffd76e821e561f25c10f2387ff76eb1c', 1, 1, 'Token', '[]', 0, '2023-08-18 14:55:50', '2023-08-18 14:55:50', '2024-08-18 10:55:50'),
('1700063cba31d7df9613d0634bd8e9d26883f9a4f63ab47c79efc22b0e3f6cf70086c97906adf585', 1, 1, 'Token', '[]', 0, '2023-10-18 13:10:05', '2023-10-18 13:10:06', '2024-10-18 09:10:05'),
('17bf4df0110863ce63def97996b276f939ff8f57b04e8172276641f10596ad40aad65681dd578334', 1, 1, 'Token', '[]', 0, '2023-11-15 21:22:11', '2023-11-15 21:22:11', '2024-11-15 16:22:11'),
('1912e2797aac4b54ce94c5ad104f228695f516c8df2a61348ef6a1eef4c29ffdf57bd996c35d10eb', 1, 1, 'Token', '[]', 0, '2023-09-07 17:13:15', '2023-09-07 17:13:15', '2024-09-07 13:13:15'),
('1a23810ac8037c462078064d4e168f67f444578fe98a3f95ce7d933b57cac90af464cd89f9815118', 1, 1, 'Token', '[]', 0, '2024-01-03 17:04:23', '2024-01-03 17:04:23', '2025-01-03 12:04:23'),
('1bc045f15019ff0958d2fb84191a4222b5c43d622d77044e8f27e9a6705f8f09818bdc1284b20e00', 1, 1, 'Token', '[]', 0, '2023-09-08 13:52:40', '2023-09-08 13:52:40', '2024-09-08 09:52:40'),
('1c09f7a3c2790fb11ba17dfbaefe09d15917c5616491e39031b3d816031fbb94b90ac096f65c5f64', 1, 1, 'Token', '[]', 0, '2023-08-18 17:54:05', '2023-08-18 17:54:05', '2024-08-18 13:54:05'),
('1ca695abbbca2d5a8dcfe849b9863c30fc9bc758ce7d589888b6f02c4ebd44f76db158c2a4442f37', 1, 1, 'Token', '[]', 0, '2023-11-21 19:12:30', '2023-11-21 19:12:30', '2024-11-21 14:12:30'),
('1d1500654f0fca0b67b3049601dc70982f43d9c458dc61e32e5c99b91a07b306be050ba431d1a04b', 1, 1, 'Token', '[]', 0, '2023-10-06 15:14:02', '2023-10-06 15:14:02', '2024-10-06 11:14:02'),
('1d1e9c6abcd394221b17399e41ff19a62cbbf478bb9117d652623faabf8411dcc77bdd69907d35bb', 1, 1, 'Token', '[]', 0, '2024-01-17 12:13:03', '2024-01-17 12:13:03', '2025-01-17 07:13:03'),
('1d34d29c35e4e3acfb312f4752e927be81e03f1900009f2acfa7f35e78f9395a0de0ae0cb4c81484', 1, 1, 'Token', '[]', 0, '2023-08-30 12:08:20', '2023-08-30 12:08:20', '2024-08-30 08:08:20'),
('1d732e766c04a8853493a840129f9933eb7796e1dba86e1c4437a44406f415fad2d77ee8db4fcd53', 1, 1, 'Token', '[]', 0, '2023-08-31 11:18:08', '2023-08-31 11:18:08', '2024-08-31 07:18:08'),
('1d92f4918dac1a63c8da308b70747f48439ad8b179cfa2d10b182269e3b0e9824bf680c4dd300ee2', 1, 1, 'Token', '[]', 0, '2024-01-29 19:28:31', '2024-01-29 19:28:31', '2025-01-29 14:28:31'),
('1dc0e58d8b6992ff60245851ed1288dd9ae43bf6e74cd225cdd719d45b0c5d7a9ec955af35ba968d', 1, 1, 'Token', '[]', 0, '2023-10-27 11:50:48', '2023-10-27 11:50:48', '2024-10-27 07:50:48'),
('1e7d1ff7e27796be3f828d98095a4b4090ccce72f11169ff186abbc3b9a492957195dfa26f05da4f', 1, 1, 'Token', '[]', 0, '2023-11-15 20:06:45', '2023-11-15 20:06:45', '2024-11-15 15:06:45'),
('1ed84ed39e260573bf9db6d1cf67fbbab9e26373259596b98796952995b4dded0f4d60bf216780f8', 1, 1, 'Token', '[]', 0, '2023-08-30 12:00:22', '2023-08-30 12:00:22', '2024-08-30 08:00:22'),
('1edb38261997f0f824a593a569ede49ae793ae2a8bb3b79f6d661b35b0d24ff3638292bafe232e36', 1, 1, 'Token', '[]', 0, '2023-08-18 17:53:26', '2023-08-18 17:53:26', '2024-08-18 13:53:26'),
('1f2b25017480b7d2be7491c3e8c9a8206807b989fc795046ac575d69fe492acec52580ae2205d355', 1, 1, 'Token', '[]', 0, '2023-09-21 18:10:04', '2023-09-21 18:10:04', '2024-09-21 14:10:04'),
('1f907cf16de7bdf5a15c54c1394b76c768281040801d44f54e7248435002726cf0be5571351eedad', 1, 1, 'Token', '[]', 0, '2023-08-31 15:11:56', '2023-08-31 15:11:56', '2024-08-31 11:11:56'),
('1fe89a9fca2d592270b430ada03ee54b2dbe3479b7a8a757b2e92ec696779b7034959b944f08ed13', 1, 1, 'Token', '[]', 0, '2023-08-17 18:00:53', '2023-08-17 18:00:53', '2024-08-17 14:00:53'),
('2046469fa5b4614c7d95f7be540340d16ef782c03396704b84a3ebbd4500830df61b17f25da6a47e', 1, 1, 'Token', '[]', 0, '2023-11-21 20:46:04', '2023-11-21 20:46:04', '2024-11-21 15:46:04'),
('2212901ce0ace282d956b6b24955d7b9711b81b5fc93abdb7e9e399daf72eed62fde591a106a623b', 1, 1, 'Token', '[]', 0, '2023-08-17 16:51:50', '2023-08-17 16:51:50', '2024-08-17 12:51:50'),
('23025d490c30a9ed02926c8ca073c02b663c5e2c318216a1d2a8570224634d75f8cc99f585160a96', 1, 1, 'Token', '[]', 0, '2023-12-26 13:15:30', '2023-12-26 13:15:30', '2024-12-26 13:15:30'),
('242bf26e3a8aed957854803c849e4fd68ae73913138696da9b3a041a22da09c739e529a5addb9404', 1, 1, 'Token', '[]', 0, '2023-08-31 14:33:13', '2023-08-31 14:33:13', '2024-08-31 10:33:13'),
('24432c1881c588c7cfcac4a13942672f524aacaecf31619aaf474a493fc06150ef18a33ffca5ef56', 1, 1, 'Token', '[]', 0, '2023-12-07 05:41:11', '2023-12-07 05:41:11', '2024-12-07 05:41:11'),
('247053c8e54b2b3969bb88b66a465107ff09896107d866edb120274860db8cd99a36a41971e0686b', 1, 1, 'Token', '[]', 0, '2023-09-13 14:31:27', '2023-09-13 14:31:27', '2024-09-13 10:31:27'),
('254090ca43331adc99e7160da00cc1c605c1057d9b7a8497b47e2d3793942a27bff9bc414a93cf8f', 1, 1, 'Token', '[]', 0, '2023-12-20 11:30:49', '2023-12-20 11:30:49', '2024-12-20 11:30:49'),
('25486abc17261a0d02a37e8d238954111fbfc08ab9281481610a9a1bf76fb3ca2e2eaa9fe8630d74', 1, 1, 'Token', '[]', 0, '2023-09-15 18:51:04', '2023-09-15 18:51:04', '2024-09-15 14:51:04'),
('267180f61476f7a2c3bdeb81cf6e57981ffe42e9dd513c24e11d6d71572ecf3fe872cfbb93183e78', 1, 1, 'Token', '[]', 0, '2023-12-29 08:02:56', '2023-12-29 08:02:56', '2024-12-29 08:02:56'),
('26d2a500c6469e7f509c67e7030acfee4ce0e0d1593fec050175b5f357c0360bc6e0179617eaac28', 1, 1, 'Token', '[]', 0, '2023-09-21 18:03:48', '2023-09-21 18:03:48', '2024-09-21 14:03:48'),
('27d87d530739af99168649b7d529e65e6cda78c81321fd09c4b99cd55a2e307e4c68403cebc412c0', 1, 1, 'Token', '[]', 0, '2023-09-28 12:22:13', '2023-09-28 12:22:13', '2024-09-28 08:22:13'),
('29b4c81511fac36be31c1b54c7e2e529e1c9d158a3b2db3dd2c60d87adda11ef14e8abf72b955e12', 1, 1, 'Token', '[]', 0, '2024-01-10 18:15:15', '2024-01-10 18:15:15', '2025-01-10 13:15:15'),
('29d6e69ba66ca1e7ec24f013b835ab60b29202d60316f48e316b588f5ff832e016aa065872d72553', 1, 1, 'Token', '[]', 0, '2023-08-29 11:49:02', '2023-08-29 11:49:02', '2024-08-29 07:49:02'),
('2a3954af5ca917e9ab91bfa7ad2ab0336cd4c48d2bcd2877ed35bfbcb2e9d0a5735edb85a8c7dc42', 1, 1, 'Token', '[]', 0, '2023-09-21 10:16:56', '2023-09-21 10:16:56', '2024-09-21 06:16:56'),
('2a4a68492a78376720bfb0570000007ff73cd0aee4b0abb3e94138e0c40999c3c31d5f0fecc5fbf8', 1, 1, 'Token', '[]', 0, '2023-11-16 11:17:21', '2023-11-16 11:17:21', '2024-11-16 06:17:21'),
('2b07ab537452e0b978246121f680c781020cc40fad5586a604e2f1164bf26ca296960e678ede3a88', 1, 1, 'Token', '[]', 0, '2023-12-04 11:02:55', '2023-12-04 11:02:55', '2024-12-04 11:02:55'),
('2b28439972ba6d0e46601ee1964ea073a0d63f236da855d6c7007d327d8bfe5a946fb4bdaba9100a', 1, 1, 'Token', '[]', 0, '2023-10-03 10:13:28', '2023-10-03 10:13:28', '2024-10-03 06:13:28'),
('2c0828192d101f6303b9483424ce38d72206031a1044f9f0740d5c12d473acfc839a816087027028', 1, 1, 'Token', '[]', 0, '2023-11-20 12:54:38', '2023-11-20 12:54:38', '2024-11-20 07:54:38'),
('2c9211edd14c535df407187bc0735edeab34e780789e0ad00bc5f08c8e5f8ee64217813e4f05204d', 1, 1, 'Token', '[]', 0, '2023-08-23 12:06:22', '2023-08-23 12:06:22', '2024-08-23 08:06:22'),
('2d8def180bbf66dd3ce27bd296823fa07bf67a87d02ff74395f7d1463c854c9216697ad7c7ebccf5', 1, 1, 'Token', '[]', 0, '2023-09-28 14:21:07', '2023-09-28 14:21:07', '2024-09-28 10:21:07'),
('2d96ebc9b1826a3b2a161ddfe7f8082a840607e0f59da71d3dd2d7d42e1adbc0472e6b5ba57412d1', 1, 1, 'Token', '[]', 0, '2023-09-03 18:24:13', '2023-09-03 18:24:13', '2024-09-03 14:24:13'),
('2e5b112840bcbdfe8eb537738f3738cca80ffd199871f1ae83b251fc601eec1e86e1002625c8dd58', 1, 1, 'Token', '[]', 0, '2023-11-16 13:35:31', '2023-11-16 13:35:31', '2024-11-16 08:35:31'),
('2fb1217628710e36154c638c764201f358a06df5577ce4681b157e7f69b5f03124efbe8012b3ee48', 1, 1, 'Token', '[]', 0, '2023-12-26 11:43:36', '2023-12-26 11:43:36', '2024-12-26 11:43:36'),
('2fbb8e957966a33948bf0d11ff55b7a48d4d931fdeac51ba8f4e2dd0ce237b27c6f5484676c3d5e2', 1, 1, 'Token', '[]', 0, '2023-09-12 20:32:16', '2023-09-12 20:32:16', '2024-09-12 16:32:16'),
('3144273b80893f54531130d794878e59f30c2fc3fe6eb7ead3c8978adab3143fabd1a5d6a96f5e31', 1, 1, 'Token', '[]', 0, '2023-09-27 10:40:19', '2023-09-27 10:40:19', '2024-09-27 06:40:19'),
('325ba33d95dc64e4945e7da0412d57afeff6afadb31c3bf99dd0058c2eb9167944eeeb5fe20f5473', 1, 1, 'Token', '[]', 0, '2023-09-20 13:54:15', '2023-09-20 13:54:15', '2024-09-20 09:54:15'),
('3275e40f0b6b268ec084a5cc0b10f8ce1a36213b22a2f438f00ac1c27214446c105900462a88b06c', 1, 1, 'Token', '[]', 0, '2023-10-12 11:30:38', '2023-10-12 11:30:38', '2024-10-12 07:30:38'),
('32ff4e97c90c7f9172f9ca90269e21592d398954830663c679d70c672ac4d984657f90fc716e1440', 1, 1, 'Token', '[]', 0, '2023-11-16 16:01:13', '2023-11-16 16:01:13', '2024-11-16 11:01:13'),
('339474e15818cad503a10f8296d6f62b0fcb8e786fd38e076a545d68d0c16c14a45c7e0151712017', 1, 1, 'Token', '[]', 0, '2023-12-03 12:09:32', '2023-12-03 12:09:32', '2024-12-03 12:09:32'),
('356a26e193c96c83164560ca2a087cc523979d6c60c83068268a9e52aac4b6c6c11f0df51e865be6', 26, 1, 'Token', '[]', 0, '2023-09-14 14:35:40', '2023-09-14 14:35:40', '2024-09-14 10:35:40'),
('358332c7f10ac35b4470118cf8636be70547e2d05d4fdd044d5124f2ce9cc9ac42f233e0576cab4f', 1, 1, 'Token', '[]', 0, '2023-10-09 12:10:19', '2023-10-09 12:10:19', '2024-10-09 08:10:19'),
('3617345f65141e124b8af514735c88d7f775923a9d89462e471ef16622c40246535ea511d3643400', 1, 1, 'Token', '[]', 0, '2023-11-30 12:45:36', '2023-11-30 12:45:36', '2024-11-30 12:45:36'),
('365f1c8034f07e429f27318b1dfa72becbda4aa89301853f5364e5f137bc40f926182568b904b2b2', 1, 1, 'Token', '[]', 0, '2023-10-13 13:50:21', '2023-10-13 13:50:21', '2024-10-13 09:50:21'),
('36a89363103eae0787d57457b26cfb4c9a459ff56922878eced5bd7be1c02286733f4cedaddcec99', 1, 1, 'Token', '[]', 0, '2023-12-26 14:15:33', '2023-12-26 14:15:33', '2024-12-26 14:15:33'),
('3a4d98bcb86572ab6040a8a9d8f938a8ecd88da289b6c6057d88883cb79b5864d0cb97ae38807191', 1, 1, 'Token', '[]', 0, '2023-09-01 17:00:42', '2023-09-01 17:00:42', '2024-09-01 13:00:42'),
('3a7d80f74f7d38b69d0dea0141e2a11e17435d023da35e2cbd5803bed92b2e9623c948716b99c060', 1, 1, 'Token', '[]', 0, '2023-11-15 21:40:27', '2023-11-15 21:40:27', '2024-11-15 16:40:27'),
('3ad17b7d0275f12e30965b99a1b1d45527e5703f506887f0567cb2e5153b1fea4eb991c76739d563', 1, 1, 'Token', '[]', 0, '2023-10-09 10:33:49', '2023-10-09 10:33:49', '2024-10-09 06:33:49'),
('3b859a1058097479b6f347702b357ae87589902a5b4a54b1da306e47104a602486f1486018076baa', 1, 1, 'Token', '[]', 0, '2023-08-31 17:03:13', '2023-08-31 17:03:13', '2024-08-31 13:03:13'),
('3b8ecf7d646193afc3b44aef8727bedc36e400af6cd4ca0a661ca8fa8038603104320024165ae0db', 1, 1, 'Token', '[]', 0, '2023-08-21 11:33:28', '2023-08-21 11:33:28', '2024-08-21 07:33:28'),
('3bc4a6f518c9b60da8aa1a5883273e56f08513eaff5f7d2afe83a63bebf71a3109fea22a8ff18750', 1, 1, 'Token', '[]', 0, '2023-12-27 13:28:04', '2023-12-27 13:28:04', '2024-12-27 13:28:04'),
('3be50e2985bf4a34b3aea399ff767d6391192835d67f6eaef74f92996bfd37f89e0ce2decbab9efa', 1, 1, 'Token', '[]', 0, '2023-10-20 10:04:27', '2023-10-20 10:04:27', '2024-10-20 06:04:27'),
('3c4f2dc1938554753771bba6845732fb00657cdff136f7ab5e27e82f34d1afcdc1ef2c35900717b1', 1, 1, 'Token', '[]', 0, '2023-10-17 13:54:38', '2023-10-17 13:54:38', '2024-10-17 09:54:38'),
('3d852b6e052c6d8d87bc62088ac7ad84f36b4d5b19bca526bf7bc9fcb83e45876bc43e531cf88d9c', 1, 1, 'Token', '[]', 0, '2024-01-17 12:05:15', '2024-01-17 12:05:15', '2025-01-17 07:05:15'),
('3e3cc4d35fdcf35dd93633b61b0d81b5b4bc075e8978cf03f584e6d8da83c66a32a433cc85c08b8e', 1, 1, 'Token', '[]', 0, '2023-08-19 10:18:36', '2023-08-19 10:18:36', '2024-08-19 06:18:36'),
('3f2f2f829412b8b96fdd22b7b9cd514ff861e4add17adbd630130125de6e37c249c06bfde44e54bf', 1, 1, 'Token', '[]', 0, '2023-09-26 12:11:19', '2023-09-26 12:11:19', '2024-09-26 08:11:19'),
('4100a9f42917e403c6abb10cda023e3ce97f3d6ec4773468df43baa6efd67d519cafb771be920648', 1, 1, 'Token', '[]', 0, '2023-11-28 13:27:31', '2023-11-28 13:27:31', '2024-11-28 08:27:31'),
('41d88ca0b12dfd3901364e3ba82eca6af5f74e48a6cda0577945f3fe40e8fb3e8615a415a520eaf5', 1, 1, 'Token', '[]', 0, '2023-08-18 17:57:17', '2023-08-18 17:57:17', '2024-08-18 13:57:17'),
('42371fc79b826c9b4bb80e6641ae851417cda4895a4f457dfb9f8319a5054507664b7c373b87c6aa', 1, 1, 'Token', '[]', 0, '2023-09-20 16:39:55', '2023-09-20 16:39:55', '2024-09-20 12:39:55'),
('42a468306e6d5c822c64742e8c74688ba8bc56dc5f4c0d3be1907c02ccafa90aff79a14c19d103c4', 1, 1, 'Token', '[]', 0, '2023-10-19 16:23:38', '2023-10-19 16:23:38', '2024-10-19 12:23:38'),
('43ceca3d349befdc1298103dc9ac06a661e4fcda630e13d69c9137db261d84199a15d33a1ec43c4f', 1, 1, 'Token', '[]', 0, '2023-08-21 12:12:42', '2023-08-21 12:12:42', '2024-08-21 08:12:42'),
('448ac7710738115edd99262c3e5d90baf986e9eed83f1c8889ceb8f6ddc775fe09dbd4853c961cb1', 1, 1, 'Token', '[]', 0, '2023-09-20 16:40:01', '2023-09-20 16:40:01', '2024-09-20 12:40:01'),
('451b4ac175b9aad748f1e9f51a7fea1391d7b4f92b6f06331bca7d5dba181fde7ac1ec879b859d4a', 1, 1, 'Token', '[]', 0, '2024-01-03 18:52:26', '2024-01-03 18:52:26', '2025-01-03 13:52:26'),
('46cd831244a28ca550ce4ed369ff1beaf9e298728d4f07c5668febbf09e03a1c368dbaec3af791fc', 1, 1, 'Token', '[]', 0, '2023-11-17 11:25:04', '2023-11-17 11:25:04', '2024-11-17 06:25:04'),
('46fbc725e23c5e955bbd2398891cee8fbd4596b18e43db235b4adabd8b98024f2c02351bfa5cd10e', 1, 1, 'Token', '[]', 0, '2023-09-03 11:32:01', '2023-09-03 11:32:01', '2024-09-03 07:32:01'),
('47af380160e14742b95a451fdbf0b92047c6b62009d47d50766639cf68a8fa4688b41e6b1d014c0e', 1, 1, 'Token', '[]', 0, '2023-08-30 11:08:08', '2023-08-30 11:08:08', '2024-08-30 07:08:08'),
('47d80b4b7bb8b854226d25cfc1c9d6e9524304d985535e5ee5f2d29b7221a4fa686ccfe535bbc596', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('47e288be6321bd1425651d214fcda2960799297f11a1b4fe8f79c34017b02f9bca03d93ba75219a1', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('4826e1ef2ec7215192e169a45ba425a7529b5f7c4ed8934b8528d5dd0b6211286d3d4338e3f228dc', 1, 1, 'Token', '[]', 0, '2023-09-22 11:56:57', '2023-09-22 11:56:57', '2024-09-22 07:56:57'),
('487c791b5e40ac8bbae06ff659f1651a35b7277739bff582210a2cdaa5db3a6d7581e15c78625c11', 1, 1, 'Token', '[]', 0, '2023-08-18 17:59:15', '2023-08-18 17:59:15', '2024-08-18 13:59:15'),
('490f374c92e2fc58580b182935a26009ef51d0855eb9d17b38f6cd7e0a861b27104bf06029a25f18', 1, 1, 'Token', '[]', 0, '2023-11-30 14:31:43', '2023-11-30 14:31:43', '2024-11-30 14:31:43'),
('4942ce994eb931a35a3bddf4bbb39227703f239026e3a1bc341162ce54aef48db4d1431e1b8599d9', 1, 1, 'Token', '[]', 0, '2023-09-21 14:48:23', '2023-09-21 14:48:23', '2024-09-21 10:48:23'),
('4a57648b7055610cc581f9b09722d68b75c15d4ac903a8cf12c3330b2c4cd71e7be1ee6765dae7e6', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:38', '2023-08-24 15:32:38', '2024-08-24 11:32:38'),
('4ab465e2e487dfa73a59f81b3f463bfb9de4920cc033df17d64ec32cb8a009446cf292adc9961819', 1, 1, 'Token', '[]', 0, '2023-12-27 13:29:07', '2023-12-27 13:29:07', '2024-12-27 13:29:07'),
('4b5e232886b5e5b57f3630a61036c7ccbc432bf153ccd3b22d2a2c6ec5ce3ebd9b0ead011cb3e6fa', 1, 1, 'Token', '[]', 0, '2023-12-29 05:45:39', '2023-12-29 05:45:39', '2024-12-29 05:45:39'),
('4c3239c160d4bb8cb4a1e1e7f4d340ddbe1997687078f3f6f7002e154176b8c9012aa161fc809ca8', 1, 1, 'Token', '[]', 0, '2023-11-17 19:14:18', '2023-11-17 19:14:18', '2024-11-17 14:14:18'),
('4cd9745e4c945cdb292317ea5c0fd21a80b8fef9f2f6d341c368b0d98945b79e6a4b89cbbdd17b3a', 1, 1, 'Token', '[]', 0, '2023-12-27 08:07:36', '2023-12-27 08:07:36', '2024-12-27 08:07:36'),
('4d566c39954e5e732e6944091e0da86aaa319c768f443fb0ced60e0a86b230279dc8df5d6131adda', 1, 1, 'Token', '[]', 0, '2023-11-19 15:22:29', '2023-11-19 15:22:29', '2024-11-19 10:22:29'),
('4e88f8f9813f58210d96e8e9a390975db62b0c2ddd242a8e6018811cc1f9733f253461eb8d6b8864', 1, 1, 'Token', '[]', 0, '2023-11-20 12:46:05', '2023-11-20 12:46:05', '2024-11-20 07:46:05'),
('4f4b611d577258c2422bbfcb26f2dececb172179599b45eb46a0ce849ebb83668e9c6b7d94da03f7', 1, 1, 'Token', '[]', 0, '2023-12-28 07:52:11', '2023-12-28 07:52:11', '2024-12-28 07:52:11'),
('500522333dae962e14c48657bf0c81ebda3edcb5b8afb0898b8e2fe256e43ef8c67e524b8c5dbda5', 1, 1, 'Token', '[]', 0, '2023-12-26 15:47:13', '2023-12-26 15:47:13', '2024-12-26 15:47:13'),
('5007041c7c20d217430784cc5ac4a5ca82de7beb21fe8e32e06a378788cc4d81d64f74ca27ab577a', 1, 1, 'Token', '[]', 0, '2023-08-24 16:47:13', '2023-08-24 16:47:13', '2024-08-24 12:47:13'),
('51090b25fbcecc5ae57124731a382cbe951e9440c972db7ba7c6fe184eb06f96914d207a169a0624', 1, 1, 'Token', '[]', 0, '2023-09-20 15:12:40', '2023-09-20 15:12:40', '2024-09-20 11:12:40'),
('51aeca8a1d783310fee2378baf42482d205c277b0650c06f559e908cf6b3a55847d252ee9df1c32a', 1, 1, 'Token', '[]', 0, '2023-11-15 13:43:17', '2023-11-15 13:43:17', '2024-11-15 08:43:17'),
('526c0af78f4a966d3f18b706cdb38cf6d281cc889dd4e5f4a270452820bf9a68fb0e81c46123d6a6', 1, 1, 'Token', '[]', 0, '2023-11-29 14:27:20', '2023-11-29 14:27:20', '2024-11-29 09:27:20'),
('527b2bde94607730a0cf67e09a951c33c8f9a15dcedfa968766bf3a56549d77e5096d3944a56f74d', 1, 1, 'Token', '[]', 0, '2024-01-03 19:05:22', '2024-01-03 19:05:22', '2025-01-03 14:05:22'),
('531849b9acefcb58665dcd748e9820d12a15103dfa7bb4bee9060f649b63f657ebf430a140e71223', 1, 1, 'Token', '[]', 0, '2023-08-23 18:07:14', '2023-08-23 18:07:14', '2024-08-23 14:07:14'),
('535c857ebf3c37c03b53dc79048a76bd0d35406325bbcbc572a365941cfa16185e0897b241d41f2e', 1, 1, 'Token', '[]', 0, '2023-09-28 17:20:20', '2023-09-28 17:20:20', '2024-09-28 13:20:20'),
('54049fceb582556c46e80b5a6224297fcf07222720d28bb291efbec44f77a4e515420d396d0da3c9', 1, 1, 'Token', '[]', 0, '2023-10-17 17:27:48', '2023-10-17 17:27:48', '2024-10-17 13:27:48'),
('5459dccbcff7b616c886a779c578ce314abe59d5f8350d8c3fcbfeac578cb04c9be5ca24e6037dff', 1, 1, 'Token', '[]', 0, '2023-08-22 17:36:46', '2023-08-22 17:36:46', '2024-08-22 13:36:46'),
('56448fae3da0d7a898c17f20c4704524d382e599f87c08011f515e4d1729c805d41b969f47ca945c', 1, 1, 'Token', '[]', 0, '2023-08-25 11:40:44', '2023-08-25 11:40:44', '2024-08-25 07:40:44'),
('5832eba5a8b0ce267c5a840980140e35c2ace25420eef51bb0c4be1ce5ac04795698840e0828702f', 1, 1, 'Token', '[]', 0, '2023-09-03 18:11:16', '2023-09-03 18:11:16', '2024-09-03 14:11:16'),
('5834afc7511bfa3bb67fbf2f0f230f82be72513da4d015ff153a8595ef85515565dac03361dbb3cc', 1, 1, 'Token', '[]', 0, '2023-11-20 15:59:54', '2023-11-20 15:59:54', '2024-11-20 10:59:54'),
('5865cea7ed0bd6f9de7a5621141dd8fe748b39dd91edde601d88190dbb4428b68c826e7dbdd328a0', 1, 1, 'Token', '[]', 0, '2023-09-27 16:22:52', '2023-09-27 16:22:52', '2024-09-27 12:22:52'),
('590af56552c762d4649e9315dd0f49620bf5e54b4efef2ee2af7ad3c1cd3dadb171a09985be45e02', 1, 1, 'Token', '[]', 0, '2023-11-25 13:27:06', '2023-11-25 13:27:06', '2024-11-25 08:27:06'),
('597efe4f866de24094de002c1b1fc31efd584017906714a5db7d17e7d2407d1b137da833d9a4f95a', 1, 1, 'Token', '[]', 0, '2023-10-04 15:25:16', '2023-10-04 15:25:17', '2024-10-04 11:25:16'),
('59f50e9e23095408e7526644162bde3afcfff73e15f40f468f19c5d3d4f8c34170a2f2e17aa4797e', 1, 1, 'Token', '[]', 0, '2023-09-03 18:18:46', '2023-09-03 18:18:46', '2024-09-03 14:18:46'),
('5aa0192f992bbbc02f2072078b59de888f765add8d524cf289411d77c497c192c34dfb75f541acf3', 1, 1, 'Token', '[]', 0, '2023-11-30 15:07:58', '2023-11-30 15:07:58', '2024-11-30 10:07:58'),
('5c1ee449dcfe66fde5fa8898446455d4b5002b2b30d132e68920751195038e5e5688dd1f66c1d39a', 1, 1, 'Token', '[]', 0, '2023-10-06 10:50:46', '2023-10-06 10:50:46', '2024-10-06 06:50:46'),
('5c8f0faaf4ee5ead16f496f614d6f2f16435df92cd38c7ebb6ecf825735707acf24de07527f72913', 1, 1, 'Token', '[]', 0, '2023-12-27 16:01:48', '2023-12-27 16:01:48', '2024-12-27 16:01:48'),
('5d210e358b59e582c318f37bbc649a6ab34dea88e9853539eb1a5fb276bc7e7f860faf61fa43d2e3', 1, 1, 'Token', '[]', 0, '2024-01-18 17:38:28', '2024-01-18 17:38:28', '2025-01-18 12:38:28'),
('5d653575639b9386b4102bb6cea8195b9a8f24a2154b9a3966857955f49c4883f3448a5604acdbdd', 1, 1, 'Token', '[]', 0, '2023-08-31 14:39:52', '2023-08-31 14:39:52', '2024-08-31 10:39:52'),
('5e7fc43d5e6119815286fb6c6a0055e3e5bd3a6e574ae912d02891a34fd28968e058a247e60adc01', 1, 1, 'Token', '[]', 0, '2023-12-27 10:17:33', '2023-12-27 10:17:33', '2024-12-27 10:17:33'),
('5f1cded37767ebde483b8a796858391b29f849dc3c2dd2d9590dd1d4fb87dc402d95e6031935fcbf', 1, 1, 'Token', '[]', 0, '2023-09-28 17:13:18', '2023-09-28 17:13:18', '2024-09-28 13:13:18'),
('6090d9f25704fc0d76b6beef1b08fc053afac4e39f6eeb5279ea8dc6cd013beea7a8c65a35657357', 1, 1, 'Token', '[]', 0, '2023-09-15 14:54:42', '2023-09-15 14:54:42', '2024-09-15 10:54:42'),
('627d69a63a96eaed236db4bbbc7018c0825c9d9a275005b9a5621bfdf0503230e65d44ba096a5c60', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('631521960475c0ecbd3eb64a8589fb442088603168b424c7d44d77d91628af7d2c4d8c5bd7445058', 1, 1, 'Token', '[]', 0, '2023-11-21 13:52:05', '2023-11-21 13:52:05', '2024-11-21 08:52:05'),
('64b0dd7f130019c34baa442ab6abbca8dd5da21317deff3958d558cd987c2a1b23f53221046f8c03', 1, 1, 'Token', '[]', 0, '2023-12-27 07:04:05', '2023-12-27 07:04:06', '2024-12-27 07:04:05'),
('65113c092a3111b42e2c3c37257ad2e532b76b54b3362c3b6cbc3375e9269bb0bd41f32f3ca2863f', 1, 1, 'Token', '[]', 0, '2024-01-06 11:54:45', '2024-01-06 11:54:45', '2025-01-06 06:54:45'),
('669bfc832af2787c4ed44521f4a5583089d2dfa19994becd8756df9baa45b6b59955ebb05422c0ae', 1, 1, 'Token', '[]', 0, '2023-08-28 10:47:57', '2023-08-28 10:47:57', '2024-08-28 06:47:57'),
('6709b1e489560a12586f642ad0849f75097b5f046cdffa457afcbffe9a9376dcb7aa372a031627e6', 1, 1, 'Token', '[]', 0, '2023-09-15 13:17:57', '2023-09-15 13:17:57', '2024-09-15 09:17:57'),
('672137d397390607c8b81414fe6d34728d4fcf7843b2bbb37070427faa56e5922e7c316f33dfde85', 1, 1, 'Token', '[]', 0, '2023-08-25 10:56:57', '2023-08-25 10:56:57', '2024-08-25 06:56:57'),
('679520e825162455d19887361d549912c740e8044bf5c50f250df3da82c1c97d6feb8f09fe71e318', 1, 1, 'Token', '[]', 0, '2023-12-29 12:27:28', '2023-12-29 12:27:28', '2024-12-29 12:27:28'),
('67be53426b8e115cc9195208789aff80971a219625a761497c5a0f96cec78d3b5aae684ab3e5823f', 1, 1, 'Token', '[]', 0, '2023-10-19 12:13:36', '2023-10-19 12:13:36', '2024-10-19 08:13:36'),
('685d3a49e517e42edc36898dbf8b28e00d837b6a72349630e79634367d035e67b016dc3c11e5567a', 1, 1, 'Token', '[]', 0, '2023-09-22 11:34:57', '2023-09-22 11:34:57', '2024-09-22 07:34:57'),
('68d1ebd8133ce017c13ce8bc1b6cc23a99901d9f1c96e4c1407b6c71bae9ef84c5e30f1e4d3dc56a', 1, 1, 'Token', '[]', 0, '2023-10-11 12:27:02', '2023-10-11 12:27:02', '2024-10-11 08:27:02'),
('69eb1dd2a23c3027f20ff464bdf221bdc5f56a9172cebabb358fa7f15c586210f8dad37e0777e4cc', 1, 1, 'Token', '[]', 0, '2023-09-20 15:12:09', '2023-09-20 15:12:09', '2024-09-20 11:12:09'),
('6a4740447fd6d5bf7dca10b4a8b314bd2b7692b48b2f7cbfe91eabfda6c61b043b33623c87aee366', 1, 1, 'Token', '[]', 0, '2023-12-12 14:03:03', '2023-12-12 14:03:03', '2024-12-12 14:03:03'),
('6a6e326c62893ebaefb3184aa9f1b3889a300457cbcaf5d1ebc04e1f229e4e1b164214299e75a022', 1, 1, 'Token', '[]', 0, '2023-12-30 12:26:52', '2023-12-30 12:26:52', '2024-12-30 12:26:52'),
('6b14e87335d60b8c844495ff4328d215f51070e9849f183e22901d27d9155d3f1ef6d23e80e07633', 1, 1, 'Token', '[]', 0, '2023-08-29 19:54:42', '2023-08-29 19:54:42', '2024-08-29 15:54:42'),
('6b8480f167c5271a5641e33282f47a36b937d7c0f7b72ba1dcca155f661b8e7c9cb3a8a2089d702b', 1, 1, 'Token', '[]', 0, '2023-08-31 11:45:25', '2023-08-31 11:45:25', '2024-08-31 07:45:25'),
('6bf60ad72ff35396adb2d6f6e422667905201792127f30a9afffe84e04a55ad99d63357eb193d525', 1, 1, 'Token', '[]', 0, '2023-12-29 12:09:17', '2023-12-29 12:09:17', '2024-12-29 12:09:17'),
('6c491a18c001ae3e2f424ae97e637b889436fbca5c028803970419ba30b267017ece385d4b519244', 1, 1, 'Token', '[]', 0, '2023-11-15 22:33:11', '2023-11-15 22:33:12', '2024-11-15 17:33:11'),
('6c858e2bb05df929cecec1da1f12a10f990973ab7d98190798be67cba1ad5e36137a16ab256d687e', 1, 1, 'Token', '[]', 0, '2023-11-29 13:31:07', '2023-11-29 13:31:07', '2024-11-29 08:31:07'),
('6ca1b92ce630ddd6cf6ee970a45f98fdc1c6b0bd201cb6d21898b379fbf6b427eed69338c45f88b8', 1, 1, 'Token', '[]', 0, '2023-11-27 19:44:49', '2023-11-27 19:44:49', '2024-11-27 14:44:49'),
('6cb7e358d860b79ee7d31f94efbd1d5401da6fc1038913a241ad7d56a42c513af3d36bd54fb0ed6e', 1, 1, 'Token', '[]', 0, '2023-08-23 18:35:35', '2023-08-23 18:35:35', '2024-08-23 14:35:35'),
('6d8e7e1524921d5f0d49e717409ac6ccb05fdd0ba91a6d044c0d81b239a1f549c0544de8b7c43467', 1, 1, 'Token', '[]', 0, '2023-12-27 13:01:01', '2023-12-27 13:01:01', '2024-12-27 13:01:01'),
('6f1a688c073871742bc792e89944cf9859b380d9abfd85b7f011c09ef49d0114744491a754b822f4', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:38', '2023-08-24 15:32:38', '2024-08-24 11:32:38'),
('6f8b92668a7ecf9b89792c9f86848f33c4aa19ff75aab9980e8bc7b66ead22f202bb642adac9823c', 1, 1, 'Token', '[]', 0, '2023-08-30 11:05:09', '2023-08-30 11:05:09', '2024-08-30 07:05:09'),
('706556304e9113a1aac3590bbb1dafcfce00721179a4fb660c66933d7ae4c3dafa073e0e4258496f', 1, 1, 'Token', '[]', 0, '2023-09-07 17:50:41', '2023-09-07 17:50:41', '2024-09-07 13:50:41'),
('71002debba1602f2071ecfe78bea0c617bd3969cd748faf6573e792bccdfa67daefe34b20e7fa286', 1, 1, 'Token', '[]', 0, '2023-09-06 15:01:14', '2023-09-06 15:01:14', '2024-09-06 11:01:14'),
('7129d14dfb1f72c16ee1902344996487185bc28b5a1b1f6a3c87d80e2a21fc4cbd4b0d4e7bbea4ce', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:37', '2023-08-24 15:32:37', '2024-08-24 11:32:37'),
('72ee915076108b36c08cdf1884d70478e69d81b85cf876867b44e97eee9df9985e0cc98c5c189d0e', 1, 1, 'Token', '[]', 0, '2023-12-11 13:11:42', '2023-12-11 13:11:42', '2024-12-11 13:11:42'),
('73779a7404f571eb81db83b1e466bd21deca6fc195ca36147d977de8cacfae192231d6d2682d5cfe', 1, 1, 'Token', '[]', 0, '2023-10-30 11:03:50', '2023-10-30 11:03:50', '2024-10-30 07:03:50'),
('7431b2b208d41ef6502adda56d09626ccc97ea9e00dfaf505b6e1718193b8bb7dcf98a392cb7f141', 1, 1, 'Token', '[]', 0, '2023-08-17 17:55:18', '2023-08-17 17:55:18', '2024-08-17 13:55:18'),
('7437d4c096ccfaf18de39e02ca85229c01fc0725ca1f908da6008f85688d6c3155405e2f06c1fbb8', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:37', '2023-08-24 15:32:37', '2024-08-24 11:32:37'),
('748b4cefed5a8603b8e8a6000968ee3f5d9a08b966fa32fa861420a561c5332266b7bb747e1d83d3', 1, 1, 'Token', '[]', 0, '2023-09-03 18:18:47', '2023-09-03 18:18:47', '2024-09-03 14:18:47'),
('752c7df6bea0943870ae226ebca724c4202ca360a1be4bdf7bc45beeb5400652133372dc9e0b3fce', 1, 1, 'Token', '[]', 0, '2023-08-31 14:47:43', '2023-08-31 14:47:43', '2024-08-31 10:47:43'),
('75b6d6405db00f011999a8974f18e60d3fcf68b8fbd5a8001b6b4a96bdf429191101b3cedb5349d6', 1, 1, 'Token', '[]', 0, '2023-11-12 17:27:28', '2023-11-12 17:27:29', '2024-11-12 12:27:28'),
('768a55099c218e33830d331b73cd2922a5be7dcd24ce306405f64b5be99416b098adc89ee2ea6fe4', 1, 1, 'Token', '[]', 0, '2023-08-31 14:56:42', '2023-08-31 14:56:42', '2024-08-31 10:56:42'),
('76f801647f3d76adb9413a3d100921974ebfeeb200f1899b5172386bdef045cddaa31754fa7249fb', 1, 1, 'Token', '[]', 0, '2024-01-29 18:32:37', '2024-01-29 18:32:37', '2025-01-29 13:32:37'),
('7730c387bae2a1ba7ad50070127bcd0948aa4a0bc2977f441f420df53d201c2ea77a5fa0d10334e9', 1, 1, 'Token', '[]', 0, '2024-01-10 18:15:15', '2024-01-10 18:15:15', '2025-01-10 13:15:15'),
('77408bd4dbcded52a78fb5a7d2df17108bc31b0386f40c02c461db9559685b8cfa244d592d176057', 1, 1, 'Token', '[]', 0, '2023-08-31 12:54:53', '2023-08-31 12:54:53', '2024-08-31 08:54:53'),
('77bcb250328160f6e9d7c777a1c4d9528d18263e3d41b4bdf6b42cda2eaa2428d79f1f00c0c0112f', 1, 1, 'Token', '[]', 0, '2023-09-26 12:29:09', '2023-09-26 12:29:09', '2024-09-26 08:29:09'),
('78337e8f2eba2d6dbf541fb3ed86344657c60b217f875041442abf7255ac8c14c8790a972295df7a', 1, 1, 'Token', '[]', 0, '2023-08-30 11:16:58', '2023-08-30 11:16:59', '2024-08-30 07:16:58'),
('791338ac93f2031ce31717ef2d1f771961a48f297c5440e7ad495aaf4d1997320e7ac2940b7e9633', 1, 1, 'Token', '[]', 0, '2023-10-26 10:36:26', '2023-10-26 10:36:26', '2024-10-26 06:36:26'),
('791b412eadadd4ad766e099e875413165adfc99daa73ffd35c6a05febe008b1ed9801acc5fcc6d39', 1, 1, 'Token', '[]', 0, '2023-10-02 12:38:28', '2023-10-02 12:38:28', '2024-10-02 08:38:28'),
('79a3af67185b88792eadb7cf59a6cdd6d63a3f09cb2d1b493b41b73a611089838c55b720b3a4409e', 1, 1, 'Token', '[]', 0, '2023-08-29 11:47:25', '2023-08-29 11:47:25', '2024-08-29 07:47:25'),
('7b01b2b6a862377e1101dad30c2971da4aa3792bb40c789b16036c46a46a0d0d6625d9f2b96a505a', 1, 1, 'Token', '[]', 0, '2023-09-04 10:18:30', '2023-09-04 10:18:30', '2024-09-04 06:18:30'),
('7bc7323f2d3acb90d876d08351966e5a613bc41ed7080cc94d0335d2e691b9c78c2ff0ddd4392648', 1, 1, 'Token', '[]', 0, '2023-09-08 15:12:10', '2023-09-08 15:12:10', '2024-09-08 11:12:10'),
('7bdf01872930e44afdc5368320a762a2a25389b012dd01950d7151a52368711ce15eb66cb98ea683', 1, 1, 'Token', '[]', 0, '2023-08-31 14:38:17', '2023-08-31 14:38:17', '2024-08-31 10:38:17'),
('7cc7ae7c42f203f072d0746dfd9d914cbb67ada9879b5302b2a4f9c281f73725da6ac54b64425c13', 1, 1, 'Token', '[]', 0, '2023-09-06 12:54:34', '2023-09-06 12:54:35', '2024-09-06 08:54:34'),
('7d26949255cf7f7a638779737fb1270f49053b3ce361706cc1c7519a5892b0065e933c92133b236a', 1, 1, 'Token', '[]', 0, '2023-09-20 15:19:16', '2023-09-20 15:19:16', '2024-09-20 11:19:16'),
('7de7fea76691e5f944e816b85dcdadb49f8409fb94aa52a0074271807374459701f0a90a10d418a3', 1, 1, 'Token', '[]', 0, '2024-01-17 13:55:28', '2024-01-17 13:55:28', '2025-01-17 08:55:28'),
('7e2c7e1ad8a5efdd810d279bb13d0e3c3a4430bcb1e04fa3cfff79f7bcc1e7e384549c8f725c405b', 1, 1, 'Token', '[]', 0, '2023-11-29 14:17:29', '2023-11-29 14:17:29', '2024-11-29 09:17:29'),
('7fda83bb61b0311e36bc772ff71a3b5ce4f64a0d4e2049d4f49e5361f70b06344395abb81b25de90', 1, 1, 'Token', '[]', 0, '2023-08-23 14:34:52', '2023-08-23 14:34:52', '2024-08-23 10:34:52'),
('8051f1d4ff7ba8b74912d2090e0120a2181ba74f5ee70ab6fe88a8829e000e066a1e422113457372', 1, 1, 'Token', '[]', 0, '2023-10-03 15:04:31', '2023-10-03 15:04:31', '2024-10-03 11:04:31'),
('81054d558f219d45939e3b63e293154d4aa6b4052d311bb8fc191e04d41c849d1eff784165c7f0b7', 1, 1, 'Token', '[]', 0, '2023-09-20 15:19:18', '2023-09-20 15:19:18', '2024-09-20 11:19:18'),
('811b820d6229320612ad229ae8a2903a1271a2e829a560252840ba132f582700fabc747991bf2aa7', 1, 1, 'Token', '[]', 0, '2023-08-31 15:10:20', '2023-08-31 15:10:20', '2024-08-31 11:10:20'),
('81966c0c0cf967d1ab55e796b13d92a7af969bacde9ff073c19c30da6c8454cdcaa19fb4a4de2a33', 1, 1, 'Token', '[]', 0, '2023-09-04 11:19:42', '2023-09-04 11:19:42', '2024-09-04 07:19:42'),
('83373c5456f720dbc6821aff498205575db831599d53e3d8ac81538d89c3fcfd3b2e5e8b4561002a', 1, 1, 'Token', '[]', 0, '2023-09-30 14:11:07', '2023-09-30 14:11:07', '2024-09-30 10:11:07'),
('8354cd49fe2eee17f5000e9eca4c0159aaf2ebb726d7ad80fd5aa2c5fbd56038d3d2bb197c7d6ef3', 1, 1, 'Token', '[]', 0, '2023-09-21 18:04:33', '2023-09-21 18:04:33', '2024-09-21 14:04:33'),
('836dc2e7146bf1e0a8858e262c434bac017b67da470ab65b8c3bcce656100269a9398b270d89ff70', 1, 1, 'Token', '[]', 0, '2023-09-01 11:30:30', '2023-09-01 11:30:30', '2024-09-01 07:30:30'),
('838a630bb0b53a76d31d45c119db66be27419581032e052e7f455b04c86524e73f7f343e0b72d114', 1, 1, 'Token', '[]', 0, '2023-09-22 16:08:32', '2023-09-22 16:08:32', '2024-09-22 12:08:32'),
('84c12de3dc3b36a9e7a3904b9eb059930a574da7e4abd19dd1746a18cfd5d74805a9ab844eecd195', 1, 1, 'Token', '[]', 0, '2023-09-08 13:54:32', '2023-09-08 13:54:32', '2024-09-08 09:54:32'),
('84c78033b6de5edcfd2eedeebdf2e69a495619d4806b9fd9f413b36010f660b2d2df2f04e51c9dba', 1, 1, 'Token', '[]', 0, '2023-09-08 14:15:33', '2023-09-08 14:15:33', '2024-09-08 10:15:33'),
('85ef2c64f8597044e71eb657fc707ae5b56d96d9eca341b1084a8355a3caf1d9beaa6570a6e4721d', 1, 1, 'Token', '[]', 0, '2023-10-02 15:11:01', '2023-10-02 15:11:01', '2024-10-02 11:11:01'),
('86a3ebe81d4627a48df9b98b4ce9fc476be880043ec9d12c13dc08c6a2d3220ec07f98db458119e4', 1, 1, 'Token', '[]', 0, '2023-08-23 14:34:52', '2023-08-23 14:34:52', '2024-08-23 10:34:52'),
('891c4c199859642f5425206b02d33f9ec9077fc29a47561e6d9b32072e351cb944b2f06944fd9a81', 1, 1, 'Token', '[]', 0, '2023-11-28 13:48:23', '2023-11-28 13:48:23', '2024-11-28 08:48:23'),
('891f07c9ad9dfa0be9e27fd39501bd88ba226a76d7a6c1e18b618e7b03354873be70ec5d6b2d5893', 1, 1, 'Token', '[]', 0, '2023-09-22 16:19:15', '2023-09-22 16:19:15', '2024-09-22 12:19:15'),
('892853b1dc9c9830619ce2354d9366169638f170c86880e45a866cd60343e473686e6bc4b7206322', 1, 1, 'Token', '[]', 0, '2023-11-28 12:39:19', '2023-11-28 12:39:19', '2024-11-28 07:39:19'),
('8bc0a2854b06ecc35c5b6f9f0876961ee419a524a28183bf6ea102ff45f2a8e05f7642c4d39cd585', 1, 1, 'Token', '[]', 0, '2023-10-24 10:12:57', '2023-10-24 10:12:57', '2024-10-24 06:12:57'),
('8c244c620b47c4614a7823dd0562e83461b694f66b645d4b2d6dd7272a3915f6df3e0e04ff20ced7', 1, 1, 'Token', '[]', 0, '2024-01-01 06:29:17', '2024-01-01 06:29:17', '2025-01-01 06:29:17'),
('8c79c854d89f92e8de1fc6abdfab8d5b63bcb62689671e8e308d5df28c90c47013cc6e84de4fef9b', 1, 1, 'Token', '[]', 0, '2023-09-12 20:33:06', '2023-09-12 20:33:06', '2024-09-12 16:33:06'),
('8d9467c61b5b63fafc353b8a221dcb4d4beafbf4ed1e2806367fdc6f50ef1a5d56f48745e58875a0', 1, 1, 'Token', '[]', 0, '2023-08-17 05:25:05', '2023-08-17 05:25:06', '2024-08-17 10:25:05'),
('8e88b0157e31675d6f902ad311a84b64fb1ef8bb80c1e2ab3f209c5cbbe83f7465d14ca2d25ec327', 1, 1, 'Token', '[]', 0, '2023-09-01 18:10:54', '2023-09-01 18:10:54', '2024-09-01 14:10:54'),
('8e92d5b8a7a0d19f8c82d24e5cc5714456074ff62616614e32ff91977181852329da84cf4bbf51fb', 1, 1, 'Token', '[]', 0, '2023-09-08 17:25:19', '2023-09-08 17:25:19', '2024-09-08 13:25:19'),
('8f1995755a4e570f96b3d8204dfcd1768ae246ef27166548946a82d60a09c3ec25da0e9d5e6398fc', 1, 1, 'Token', '[]', 0, '2023-09-22 16:04:40', '2023-09-22 16:04:40', '2024-09-22 12:04:40'),
('91c537e048f271e7ae682035400b038abf4d60ac277c00d6e3054fac40c4b82b7c2f2cef6e67db1c', 1, 1, 'Token', '[]', 0, '2024-01-08 12:58:51', '2024-01-08 12:58:51', '2025-01-08 07:58:51'),
('920b413f6b4b7e64c8017b811abea20b6906c8add9152ec1f41a794caa226b08776c45205408eaa4', 1, 1, 'Token', '[]', 0, '2023-09-27 12:20:10', '2023-09-27 12:20:10', '2024-09-27 08:20:10'),
('9282d23b24c9e16f02ef714a7207bad94575bd7646ce9f624b4441765d75369162eb2d756f3d0aa8', 1, 1, 'Token', '[]', 0, '2023-10-02 16:15:08', '2023-10-02 16:15:08', '2024-10-02 12:15:08'),
('93b5c308b162a2605b1a941a95e89cfb9a8ffcdd74afc31bca3fd249eeda1cb47788e024c17e31cd', 1, 1, 'Token', '[]', 0, '2023-08-18 10:22:48', '2023-08-18 10:22:48', '2024-08-18 06:22:48'),
('95c154f31722010e7f08a8bf1d859d47a5ab2fb2ceadeeda567200d0eedc405febcc56d541774058', 1, 1, 'Token', '[]', 0, '2023-12-27 09:47:21', '2023-12-27 09:47:21', '2024-12-27 09:47:21'),
('9607b44bfd6b094ab6071eb250b9acaec0e4893dbd54c84cf7dd3c7d87720a218f3636f9abc000f3', 1, 1, 'Token', '[]', 0, '2023-09-25 14:41:42', '2023-09-25 14:41:42', '2024-09-25 10:41:42'),
('9630a7a150414d8415137c178c4ae6f7320f6b8861fd9c4765778f5005669a03fdd84bf9cd8a344d', 1, 1, 'Token', '[]', 0, '2023-11-27 18:56:37', '2023-11-27 18:56:37', '2024-11-27 13:56:37'),
('9632ba7f6a35133b46e525bc8273249c8163f3b99fe760d71dd974dbde74aee23f19f2d4b01dc96c', 1, 1, 'Token', '[]', 0, '2023-12-12 15:52:43', '2023-12-12 15:52:43', '2024-12-12 15:52:43'),
('96701b468618542a210e3991a5ae3e4ee2f542eb20e21e3a98febda4ab6f1dcb4787610924cd8d42', 1, 1, 'Token', '[]', 0, '2023-09-01 18:11:39', '2023-09-01 18:11:39', '2024-09-01 14:11:39'),
('9804c85198de6072a6a4f636c737ebd661dd4a567d95f27af34ae8d5944015c3990607d812288d33', 1, 1, 'Token', '[]', 0, '2023-09-20 14:33:29', '2023-09-20 14:33:29', '2024-09-20 10:33:29'),
('9818c6b38918c48efb56c8f06927d6a97b3ab18e3dd0161512ec3ddf4d18c610e49179a1a86fc417', 1, 1, 'Token', '[]', 0, '2023-08-25 11:38:27', '2023-08-25 11:38:27', '2024-08-25 07:38:27'),
('99ab620aa835a1d81472284da81f2deab9a38b65ee44d759e271aef24f67c522e4844f7e3c681b85', 1, 1, 'Token', '[]', 0, '2023-09-22 10:36:01', '2023-09-22 10:36:01', '2024-09-22 06:36:01'),
('9b9dfff151d5f46f3089bcc5e941ba020d5eab9c84d81cfe1e37e1914206e41ea61490719f5d6d39', 1, 1, 'Token', '[]', 0, '2023-10-19 16:23:14', '2023-10-19 16:23:14', '2024-10-19 12:23:14'),
('9c2ae4fe7d1a78497a6bb1ac1541f6ad9121a3aa74afe07c8a2fa287c18356545fa876ec2c467098', 1, 1, 'Token', '[]', 0, '2023-09-08 12:00:14', '2023-09-08 12:00:15', '2024-09-08 08:00:14'),
('9e12956d1f702f31cb33f98f35e40298d666c44748fab28edabb561be805356e48b45e7d12fafae6', 1, 1, 'Token', '[]', 0, '2023-12-26 15:47:13', '2023-12-26 15:47:13', '2024-12-26 15:47:13'),
('9ed7ba1034f404b3503b902fec5172dd93b7f205d3f7e452136fe3258a46dd0217e340db820bc9a5', 1, 1, 'Token', '[]', 0, '2023-08-22 17:36:46', '2023-08-22 17:36:46', '2024-08-22 13:36:46'),
('9f842fdaac92133674e292426ee51d7489b3264e2f8988cda9c8c9bd30f4e76044c5b4847cfec78d', 1, 1, 'Token', '[]', 0, '2023-09-06 15:44:58', '2023-09-06 15:44:58', '2024-09-06 11:44:58'),
('9fba2bb4b10cb224b50b9f182b97af6bc0a6a0826f97da83926a0dd2ef2fa6e7faca65f3d51e8b21', 1, 1, 'Token', '[]', 0, '2023-11-16 18:00:56', '2023-11-16 18:00:57', '2024-11-16 13:00:56'),
('a08f74d613bd8b006b0f89f0a566fffc3754d43f9b96cd8a3e2cd91c33d56ae6633afb3755816fed', 1, 1, 'Token', '[]', 0, '2023-11-09 18:52:52', '2023-11-09 18:52:52', '2024-11-09 13:52:52'),
('a16c5032259a541eb2f3e200190fec34cbabb9d1fbe879d1ab389ab69344fad3073fa2945510cffb', 1, 1, 'Token', '[]', 0, '2023-08-24 16:30:30', '2023-08-24 16:30:30', '2024-08-24 12:30:30'),
('a413187bad321d41bbfbb37513f23ccbab627c43a15f88776b6db8c58ec4fadfb7638c2786e58cba', 1, 1, 'Token', '[]', 0, '2023-09-29 15:25:41', '2023-09-29 15:25:41', '2024-09-29 11:25:41'),
('a46f947ccf46f7115d3f954e019e3a367b5bcf1185909cef913019755f7953c3bbd7e7669bdee39f', 1, 1, 'Token', '[]', 0, '2023-11-14 20:25:45', '2023-11-14 20:25:45', '2024-11-14 15:25:45'),
('a54a92ea14a1d20a0dfaacff29a6df230b814f41db806c11c00fc6c57c095c7bf98c5e7d48af9f48', 1, 1, 'Token', '[]', 0, '2023-09-13 14:48:34', '2023-09-13 14:48:34', '2024-09-13 10:48:34'),
('a59a4e9e9afb4ad3b47689298a7151b3db827f8a27b6196388b8b696fd6736a6821333155d627a11', 1, 1, 'Token', '[]', 0, '2023-08-24 10:45:00', '2023-08-24 10:45:00', '2024-08-24 06:45:00'),
('a5bdfa7edc1827748068f3e1772f032546518ff55ab366435fe5f6dd7d4e404d795d3f810617494e', 1, 1, 'Token', '[]', 0, '2023-08-28 10:56:06', '2023-08-28 10:56:06', '2024-08-28 06:56:06'),
('a62d537bac1d07aca7c704044b679c2c7662e5883377e3df26c1d156393142508d0e00cbd0494818', 1, 1, 'Token', '[]', 0, '2023-11-30 14:29:16', '2023-11-30 14:29:16', '2024-11-30 14:29:16'),
('a690ca81c4c214c2660054d002c749f9499b1ca0f84df1cfa0c9cc97bf063ac8a6753f9f3d2c853c', 1, 1, 'Token', '[]', 0, '2023-09-22 18:28:16', '2023-09-22 18:28:16', '2024-09-22 14:28:16'),
('a7211d75dc8a9518cb31a637fc0b596caa8d2dc780f0aad8b487057dabe10b33c9237379afdb7cb0', 1, 1, 'Token', '[]', 0, '2023-11-14 21:38:22', '2023-11-14 21:38:22', '2024-11-14 16:38:22'),
('a76ac04092a6352ae8c26a654e5b29553c5d432e9350dca6a7029759d1daf46424a673ec9ccfe0a1', 1, 1, 'Token', '[]', 0, '2023-12-26 07:52:07', '2023-12-26 07:52:07', '2024-12-26 07:52:07'),
('a8255e9cd6156c2046b632b68640f073124398ef47b5c2f6380dabbc6296372b27f2a0fc6c65cbaa', 1, 1, 'Token', '[]', 0, '2023-11-30 14:22:54', '2023-11-30 14:22:54', '2024-11-30 14:22:54'),
('a88eda0fc8125866b07127bf2a5897b56598fe4fcba7a98b61a6599d03aa411da7f54ac0d374db22', 1, 1, 'Token', '[]', 0, '2024-01-01 06:15:04', '2024-01-01 06:15:04', '2025-01-01 06:15:04'),
('a8a3014047116142fbe0a67c8cd2a04a722d1f1f782a2399e636f68c9d5cf05bbb4f451c7c1037ae', 1, 1, 'Token', '[]', 0, '2023-08-23 18:15:16', '2023-08-23 18:15:16', '2024-08-23 14:15:16'),
('a959709b79ccf68d528782fdec6eb3d77b0cc67261e7edc533749e93ecf02588112be478c1f00646', 1, 1, 'Token', '[]', 0, '2023-11-30 14:28:15', '2023-11-30 14:28:15', '2024-11-30 14:28:15'),
('a977edb03bdfde70d0e263af01f1f42fb60aca6369a26a8a1b1cad086f201d0305ef34f5a69f2217', 1, 1, 'Token', '[]', 0, '2023-12-29 07:38:51', '2023-12-29 07:38:51', '2024-12-29 07:38:51'),
('aa5358de3f9ade368a8f4aff33431ae161752abd61a4bd33862d8e51eee981da9f1cfc937971d5a6', 1, 1, 'Token', '[]', 0, '2023-12-19 07:34:04', '2023-12-19 07:34:04', '2024-12-19 07:34:04'),
('aafa55db0044c1866f93adfba92499bd075d68baefc4c9a62535438d1a57b70361c35c773150ceea', 1, 1, 'Token', '[]', 0, '2023-10-09 15:06:05', '2023-10-09 15:06:05', '2024-10-09 11:06:05'),
('ab91d0f07d8ba33eb543cea1a1c8e278d493d3604c2751d549a25c91e0e655e7b2bc38a79b450cdb', 1, 1, 'Token', '[]', 0, '2023-11-27 19:45:02', '2023-11-27 19:45:02', '2024-11-27 14:45:02'),
('ac3a180dade169d32e4e984125583c4dfdba4859c46d8136d476353af278bcbe6deb3f1a461066d3', 1, 1, 'Token', '[]', 0, '2023-09-13 19:43:12', '2023-09-13 19:43:12', '2024-09-13 15:43:12'),
('acd5ff24a0f2b5431dbee706ca5aa391e88b3d2af72df10a20f1e53aeaecef34e5aad4067fc36c90', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('ad0bc4670ecaad69fe35001ca1affff13f73304a5aadeddb5463a3512b0c350aac9b728ba29962ca', 1, 1, 'Token', '[]', 0, '2023-10-19 16:31:27', '2023-10-19 16:31:27', '2024-10-19 12:31:27'),
('ada8ed2ccd73fce15d9612b926e8f97f27dfa5b6af2f7b9fd25e79381648bcb0f475d09c97bcfdbf', 1, 1, 'Token', '[]', 0, '2023-09-27 10:40:19', '2023-09-27 10:40:19', '2024-09-27 06:40:19'),
('ae85c9ecff770d02cad065eebb1a3d25c4d85d242e5de24809e5cc103681f7e2c68b9f6f56da4dbb', 1, 1, 'Token', '[]', 0, '2023-11-14 17:03:18', '2023-11-14 17:03:18', '2024-11-14 12:03:18'),
('aedd4d3b628eedcc35f8a2d6205da3e8f8637a1bb447dc0467f80a42681822ec908be20b3e979d9a', 1, 1, 'Token', '[]', 0, '2023-08-31 12:13:05', '2023-08-31 12:13:05', '2024-08-31 08:13:05'),
('af0021012a233af8132f99bb8a950245c3015a734568ea09b20593d2df6a05168f9909c66693c4e7', 1, 1, 'Token', '[]', 0, '2023-09-22 14:56:41', '2023-09-22 14:56:42', '2024-09-22 10:56:41'),
('b15c17c25094ac94ad744f3efd190040a0440712f6a5ef1b819baeab2ea3acacc0627317db02d9c5', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('b204d759b3764ac2931f2bee1dc82f7ef5cf6a6c67cdea68a41526318da537b33e600dec7db43b75', 1, 1, 'Token', '[]', 0, '2023-10-20 17:09:48', '2023-10-20 17:09:48', '2024-10-20 13:09:48'),
('b227e8ba9cadfa907764ad07e309addfd27fe129756d20b9d748e51a9c33ceb65dbc1da6099c3493', 1, 1, 'Token', '[]', 0, '2023-09-25 15:17:01', '2023-09-25 15:17:01', '2024-09-25 11:17:01'),
('b23b57ad8c8b8873f849bc40803bb94854f7a32da0865bc97aae175f7c9b34d19a03d08a380b7b22', 1, 1, 'Token', '[]', 0, '2023-08-31 10:49:04', '2023-08-31 10:49:05', '2024-08-31 06:49:04'),
('b2c3b6d504d5f3fa26ecbb8ac3a4db926d3f07480cb6b25d8bf429a5e63754f877ce6f39b86163e2', 1, 1, 'Token', '[]', 0, '2023-09-15 13:23:47', '2023-09-15 13:23:47', '2024-09-15 09:23:47'),
('b38b03937ea5057bd9b2b33035e77baeab0f068f9e78d434480031b6a618c736a70d1ed9b57fb11f', 1, 1, 'Token', '[]', 0, '2023-08-21 11:57:53', '2023-08-21 11:57:53', '2024-08-21 07:57:53'),
('b3c1b1d333bc0f5072fd9ba9fdd1a1c21042a4ce2721b3d1737cb8c9f4ae928cd5abb14f3d0058ce', 1, 1, 'Token', '[]', 0, '2023-08-29 12:57:44', '2023-08-29 12:57:44', '2024-08-29 08:57:44'),
('b465a536aae6b1eaaebb214ca452008a987627a20b3d50ba2aeb92a5adf72db80ee5154722664983', 1, 1, 'Token', '[]', 0, '2023-09-20 16:39:26', '2023-09-20 16:39:26', '2024-09-20 12:39:26'),
('b5e1e7d4409b345f998ff97575f58e7f7f3365d63a1efca9a2f863b586654f36a8b1cb39eed4c76d', 1, 1, 'Token', '[]', 0, '2023-09-05 17:29:42', '2023-09-05 17:29:42', '2024-09-05 13:29:42'),
('b67c5572e36ec5a1ad8b39f3539e504a6fc706e6b592be47a4098c02dacf2d68ac8ee3132daf789e', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('b87128fb491fb5d8b869a429016c0fa0855a1c0f79e3e4d64705255d941bbbb7773ecb9436258084', 1, 1, 'Token', '[]', 0, '2023-08-18 17:38:24', '2023-08-18 17:38:24', '2024-08-18 13:38:24'),
('b960cdf7368ec11d482269869c7352874c12d88a9621826564b3ca5ec72a1e07753827687c024885', 1, 1, 'Token', '[]', 0, '2023-09-22 16:29:16', '2023-09-22 16:29:16', '2024-09-22 12:29:16'),
('b96cd86d45f2093ac21a3834c76289c730434b93212617ce3a4418967c212bee7d9491154adb08ed', 1, 1, 'Token', '[]', 0, '2023-11-17 23:41:20', '2023-11-17 23:41:20', '2024-11-17 18:41:20'),
('b9e2cc0dec33c8cda2cd3e7649af5132bf7cdad6779ee6ed2b743648a357df0a1e310151eea4755d', 1, 1, 'Token', '[]', 0, '2023-10-18 12:47:09', '2023-10-18 12:47:09', '2024-10-18 08:47:09'),
('ba1b1ff05241f92795547bb045bb4ce34e2d4238b6005079e1270bb3b9e7b503966d02086e7f8a0e', 1, 1, 'Token', '[]', 0, '2023-08-28 12:52:37', '2023-08-28 12:52:37', '2024-08-28 08:52:37'),
('bb17dda7e4298c5838144572bc7230f5510534a126fe8449fc5d6f4ea87f74bbd7cc2ee3fdf23dcb', 1, 1, 'Token', '[]', 0, '2023-11-11 14:05:25', '2023-11-11 14:05:25', '2024-11-11 09:05:25');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('bc15c3aee9d97b194375c712a7820147f6d2d2030c1e2dbdeb5cfee228918dd574c8e6fb35623f17', 1, 1, 'Token', '[]', 0, '2023-09-25 17:52:09', '2023-09-25 17:52:09', '2024-09-25 13:52:09'),
('bc1647afb8116b0a958c6a25b6b42c386c9ba051e41f467df440c30d8d38c910a9d378e2bfa379c1', 1, 1, 'Token', '[]', 0, '2023-11-24 12:51:57', '2023-11-24 12:51:57', '2024-11-24 07:51:57'),
('bcbfe411c259407f5a21fdb6bf71dd227308fe310f24d3b75d58760449337cfe0acd177f9c4f5f04', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('bd2a8c61987c9a182dd8cbddfa41c89a01ac4d26c527aea152fa20e7c8e8f02d34ab5567a435c048', 1, 1, 'Token', '[]', 0, '2023-12-28 07:44:28', '2023-12-28 07:44:28', '2024-12-28 07:44:28'),
('bd3e91885a68ce2a82cb3087b383b32530c2fb227fa82672f9d70c90e644eb49a90dec766f364450', 1, 1, 'Token', '[]', 0, '2023-12-29 11:33:11', '2023-12-29 11:33:11', '2024-12-29 11:33:11'),
('be107a64eb6176c0e82de42e183c30810efe1ba2125c83257264523b6ab35082881268a0bb91007f', 1, 1, 'Token', '[]', 0, '2023-09-27 11:45:20', '2023-09-27 11:45:20', '2024-09-27 07:45:20'),
('be49dbd8beee4c3f14d57d0c886f7a6fb8374882360e31d0dd53312f7cad1489f35d91521e75b4d5', 1, 1, 'Token', '[]', 0, '2023-10-16 11:24:58', '2023-10-16 11:24:58', '2024-10-16 07:24:58'),
('beee0e5f78e7dd047df91251bb8546cb70f31c8574cb78e063b495accd3cc02dc524c44854098ef9', 1, 1, 'Token', '[]', 0, '2023-11-27 13:35:25', '2023-11-27 13:35:25', '2024-11-27 08:35:25'),
('bef6dc2d2670a1170c0a082e11bcbbed54160dc3f3ba9834c228dda436caef175b282415846590bc', 1, 1, 'Token', '[]', 0, '2023-08-23 14:34:34', '2023-08-23 14:34:34', '2024-08-23 10:34:34'),
('bff96066eac456d2210b33561e7a2a3386734cfbac30950c3f5bfba653832897a01c933452c8c572', 1, 1, 'Token', '[]', 0, '2023-10-30 12:23:19', '2023-10-30 12:23:19', '2024-10-30 08:23:19'),
('c205006e01342e122cf0d08c43af13bc092ad78f4277b9cb0942cd4050423c4d3da7e8d5c4146c99', 1, 1, 'Token', '[]', 0, '2023-08-18 14:13:31', '2023-08-18 14:13:31', '2024-08-18 10:13:31'),
('c27527b306d0dfb36c60e57a91c91af707477e8105965e377ab7549ca7e76323055b5c51d0fdc625', 1, 1, 'Token', '[]', 0, '2023-08-30 14:20:28', '2023-08-30 14:20:28', '2024-08-30 10:20:28'),
('c2806b1edc8d39da4d9cc692291da3dff84e7b4f53c5b8b3563a413a47bef873af1e5e435ec037ca', 1, 1, 'Token', '[]', 0, '2023-12-04 14:24:08', '2023-12-04 14:24:08', '2024-12-04 14:24:08'),
('c2cdd7e4bb6fd68694da7bcdeff04c0169fceee5d5763135c9d759a8d74732b75728650fff167ad9', 1, 1, 'Token', '[]', 0, '2023-11-15 13:43:17', '2023-11-15 13:43:17', '2024-11-15 08:43:17'),
('c39f76ee052b9e634f828a17e758241f743be231780d531d6fa6708657e408a6511e88455c6d0de3', 1, 1, 'Token', '[]', 0, '2023-10-10 10:12:38', '2023-10-10 10:12:38', '2024-10-10 06:12:38'),
('c4bffeb11682600e1d5d6a42ef46a8987d3016aff429c9f95671698b2fabffea6a3e968a55a80eea', 1, 1, 'Token', '[]', 0, '2023-09-07 16:52:52', '2023-09-07 16:52:52', '2024-09-07 12:52:52'),
('c5b20f71ddd1f39e3fe537506612e2b27283012212f667e2dd09abdf6e83240c3f7db18fb085eb69', 1, 1, 'Token', '[]', 0, '2023-10-27 11:29:31', '2023-10-27 11:29:31', '2024-10-27 07:29:31'),
('c5c608a5dc3c1b042d04a1fca69e6fe4c6df9b7fc996c78e27099f5bf9a1c68a91c96a7617437451', 1, 1, 'Token', '[]', 0, '2023-10-25 10:26:38', '2023-10-25 10:26:38', '2024-10-25 06:26:38'),
('c76b8bbcf346b49131c550ae4f1ef2e5d3bee5d8f076b4784a076d905778e080da03426ea990f296', 1, 1, 'Token', '[]', 0, '2023-09-22 18:28:15', '2023-09-22 18:28:15', '2024-09-22 14:28:15'),
('c79f973c8f2d006eb9f7ea044958d57648fbc9958f58f1f33b61634afd184430dc401b0aa1104c20', 1, 1, 'Token', '[]', 0, '2023-11-16 13:02:47', '2023-11-16 13:02:47', '2024-11-16 08:02:47'),
('c7b5ca70637186f7763a5733f997fb046119370471df605b8847c6cb54e20e09fb67ef10acd34dd2', 1, 1, 'Token', '[]', 0, '2023-10-06 13:40:05', '2023-10-06 13:40:05', '2024-10-06 09:40:05'),
('c80e8313645a834f9ebe08eb533f2d3248501c8daf40d8912a1574b39af7a7beb7ad77a984949a30', 1, 1, 'Token', '[]', 0, '2023-09-20 13:56:50', '2023-09-20 13:56:50', '2024-09-20 09:56:50'),
('c8eb09b2c58e892dc2d2d32e5bac5b70d7b5f9039cb37058076f5e65afc6444282cc674ff5a0a4f2', 1, 1, 'Token', '[]', 0, '2023-09-20 16:39:23', '2023-09-20 16:39:23', '2024-09-20 12:39:23'),
('c921469474d04f58375c707a0fdbf2187a127dbf85cc5f2e7adf741de055dc921e5d8e560e22adc2', 1, 1, 'Token', '[]', 0, '2023-11-29 13:34:25', '2023-11-29 13:34:25', '2024-11-29 08:34:25'),
('ca6dcb0bbf8f0ed1440a607ce71d93fe8026b0bd0be3f89d0e632bc98d9b2aa72ce645e2bbf33997', 1, 1, 'Token', '[]', 0, '2023-09-08 14:34:29', '2023-09-08 14:34:29', '2024-09-08 10:34:29'),
('cbf6909c61aa0311bba3d8cd837aee8a1eff64c64b06dd15dab7e5c9143fd02bdb8dc362d23be547', 1, 1, 'Token', '[]', 0, '2023-08-19 10:18:36', '2023-08-19 10:18:36', '2024-08-19 06:18:36'),
('cc7c84b08641735e82e26831e94aad41d74eeba6fba9d46e222882f26055c10213da49c4090bce44', 1, 1, 'Token', '[]', 0, '2023-09-22 11:07:17', '2023-09-22 11:07:17', '2024-09-22 07:07:17'),
('cd295f00027664310012e2dbbad777e26d7a92285e66f4d733b84e38cdcb40b01651b3e2b504a120', 1, 1, 'Token', '[]', 0, '2024-01-30 13:41:39', '2024-01-30 13:41:39', '2025-01-30 08:41:39'),
('d06e87ea513fd1408b2aa5efe8e3c1b3a5e082543530a75ddbd0ee768c07623baf3f9f87a800b7fd', 1, 1, 'Token', '[]', 0, '2023-08-31 15:17:06', '2023-08-31 15:17:06', '2024-08-31 11:17:06'),
('d0dab0806e7c91b0e046541698de5d43a837b775cab1625fc8241dfccd0f07905acf55581d3ce46e', 1, 1, 'Token', '[]', 0, '2023-09-06 16:23:30', '2023-09-06 16:23:30', '2024-09-06 12:23:30'),
('d2448e93d33e233fcd2006b6dc4f5e61ab1598fb83219e0cea7d3db14e50e54b6170b01e47fccd0f', 1, 1, 'Token', '[]', 0, '2023-10-02 10:43:47', '2023-10-02 10:43:47', '2024-10-02 06:43:47'),
('d440afcd8a2ad4b4b8a79f58afab62ac23de0fb35260e89a496f5a219a4c791975232162e49a031a', 1, 1, 'Token', '[]', 0, '2023-08-30 14:55:54', '2023-08-30 14:55:54', '2024-08-30 10:55:54'),
('d6c2c22d7fefcb5e083472ee80788416f97b02c50e0df3cb6cc982ae9a5fd4f3b3b882bcab134ee1', 1, 1, 'Token', '[]', 0, '2023-09-22 18:09:55', '2023-09-22 18:09:55', '2024-09-22 14:09:55'),
('d71a010ca039d8f837f4cc98891d96206d29450e3e9231aa42403c1ff589c85feda715d86d9be2e1', 1, 1, 'Token', '[]', 0, '2023-09-06 15:07:36', '2023-09-06 15:07:36', '2024-09-06 11:07:36'),
('d7e7d41878ec1d485917868d72eeec324847726b9d1524af302c419ea60fe5ea5ec9d3b7b96a610d', 1, 1, 'Token', '[]', 0, '2023-09-14 11:07:36', '2023-09-14 11:07:36', '2024-09-14 07:07:36'),
('d837e60445f2fc5cc7ea3f3cad3198a91c59650d7e1513e4037e4f8dd219f58f8161d6e7669b0c14', 1, 1, 'Token', '[]', 0, '2023-09-13 19:51:02', '2023-09-13 19:51:02', '2024-09-13 15:51:02'),
('d8f5d00c84125b8a057abc4684f20cf754818ee9742167d8ca34bb888aff9bce434f8cc76dabe3d6', 1, 1, 'Token', '[]', 0, '2023-10-13 15:14:26', '2023-10-13 15:14:26', '2024-10-13 11:14:26'),
('d968b44e2bfa4887f0f9a31f8010457317b0c0b47c38d08411a22fd5cf3cd97fb7a145f568071eec', 1, 1, 'Token', '[]', 0, '2023-09-21 12:42:44', '2023-09-21 12:42:44', '2024-09-21 08:42:44'),
('daec8b0f04aee909112f1c2627467bb9876013da7062d427a4cb992cd0f9ab5329f7f1caea52ae9a', 1, 1, 'Token', '[]', 0, '2023-11-08 13:40:33', '2023-11-08 13:40:33', '2024-11-08 08:40:33'),
('db00468637a209a6a43f32a35e84c7f22f088786c555cd928fad4f4ca2edfd68d061facd9661099d', 1, 1, 'Token', '[]', 0, '2023-09-08 14:30:50', '2023-09-08 14:30:50', '2024-09-08 10:30:50'),
('dbc2f1b139d0fb6779129b2a84585c292bdd778eff1e2158c3a9acc80acca89cac48d600e2df7524', 1, 1, 'Token', '[]', 0, '2023-11-30 15:59:17', '2023-11-30 15:59:17', '2024-11-30 15:59:17'),
('dbc63e966fefd4d0d7ca9f23a36469cc18c7930e3a809ff5672e90b573354ffe6fe14259efd3a945', 1, 1, 'Token', '[]', 0, '2023-10-23 11:00:41', '2023-10-23 11:00:41', '2024-10-23 07:00:41'),
('dbe73e4e83e700716516b2b1ef979eca8ae4d6ec6999c52c5f22089837ece97b91d3cd3eec524deb', 1, 1, 'Token', '[]', 0, '2023-09-08 11:20:08', '2023-09-08 11:20:08', '2024-09-08 07:20:08'),
('dc00477f3e2efad3bcfdd92117812184a70c62d13aea5fc0329305ee8bdedf9913966c526d5c9640', 1, 1, 'Token', '[]', 0, '2023-11-13 18:42:23', '2023-11-13 18:42:23', '2024-11-13 13:42:23'),
('dc1e220ada00dce7b2251ebefa49e0208ab4b69baa44d91aa6c810da2212e90a03446d6255edeca2', 1, 1, 'Token', '[]', 0, '2023-10-04 10:39:41', '2023-10-04 10:39:41', '2024-10-04 06:39:41'),
('dd522db9c34511dddb59468de16a0e08bfddc88b719b7e4855e0a6b298f1977d3a997323b0b00f07', 1, 1, 'Token', '[]', 0, '2023-09-18 10:47:25', '2023-09-18 10:47:25', '2024-09-18 06:47:25'),
('ddde7716413c68667f738c0670a058fce0ec399dfebe271dbee3d53db2809bee2763a1ba3347d7a6', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('de1f5be7a82ca379642641d74ba0b4e5fc008f3b81ce2d4e8a0b97c26de5d3e3e0725bd39d1e85f7', 1, 1, 'Token', '[]', 0, '2023-09-25 10:41:57', '2023-09-25 10:41:57', '2024-09-25 06:41:57'),
('dedb22d396c5a8e6cc3e25ea7a8e329163e344e97c506bcefb1cc1fbee44a77ef797eea7daf20ee1', 1, 1, 'Token', '[]', 0, '2023-11-24 17:41:32', '2023-11-24 17:41:32', '2024-11-24 12:41:32'),
('dfba044a820699dcb99d1a0065b9db5598c20edd23eeec28ebc222f5e65f2c41e7e4622b328b7c6c', 1, 1, 'Token', '[]', 0, '2023-08-29 15:48:49', '2023-08-29 15:48:49', '2024-08-29 11:48:49'),
('e177de28170b43ac7de38dfbbffcf5fde8762f742013a371dc855224543dc8eb6e4fca254cac1235', 1, 1, 'Token', '[]', 0, '2023-09-03 18:11:16', '2023-09-03 18:11:16', '2024-09-03 14:11:16'),
('e1a649cfc4cd5f0a4d0c0edf5f066c4e50dc7626985501c8bc3b9707f0a7cf6ebf6e04e569344d6e', 1, 1, 'Token', '[]', 0, '2023-09-08 14:28:30', '2023-09-08 14:28:30', '2024-09-08 10:28:30'),
('e23703ce8278b8465fee6af89687ff168e5f5abf0d22d90f1c9d66b74881d5eb0d57169c1efa4021', 1, 1, 'Token', '[]', 0, '2023-11-29 11:55:09', '2023-11-29 11:55:09', '2024-11-29 06:55:09'),
('e345a020d83458db88589e1d4a4e8327af4e19ea22241aaa1285253b72fbf0eab4fa7d85ce5c433a', 1, 1, 'Token', '[]', 0, '2023-12-12 15:54:44', '2023-12-12 15:54:44', '2024-12-12 15:54:44'),
('e3bebf3c5862922542704ceee2152ea41ecf8d36d426aa895839b2a328136ebdcaf7b22df861de64', 1, 1, 'Token', '[]', 0, '2023-09-29 17:34:11', '2023-09-29 17:34:11', '2024-09-29 13:34:11'),
('e40ceadf05ab2ad385c12ec44f4db44393fc415328bf31050193804636329888b9403fb3b46d7385', 1, 1, 'Token', '[]', 0, '2023-08-31 14:40:59', '2023-08-31 14:40:59', '2024-08-31 10:40:59'),
('e557f554a6f4097e03c601094820eeeda123fc1a9401db544ea15b8a3ce26194e5cf6fffc605b147', 1, 1, 'Token', '[]', 0, '2023-08-25 11:07:41', '2023-08-25 11:07:41', '2024-08-25 07:07:41'),
('e8e602d106542a1f2819975101cf4ca8ce50a7d1f8c444bb49819df474f01bde7192020866d4cdb3', 1, 1, 'Token', '[]', 0, '2023-11-20 17:38:21', '2023-11-20 17:38:21', '2024-11-20 12:38:21'),
('e9a18d13c3d9e1e055bbee54fd5c9c0fc3da108c828c04ef33f8e737008f4ff4c2a91153da22084d', 1, 1, 'Token', '[]', 0, '2023-10-04 16:24:37', '2023-10-04 16:24:37', '2024-10-04 12:24:37'),
('e9bcac96ed3ba6fa66f772926fe8a1a746f020eb1901e7c19517f6595327ad305787a11b12fec983', 1, 1, 'Token', '[]', 0, '2023-08-23 11:10:00', '2023-08-23 11:10:00', '2024-08-23 07:10:00'),
('eb0307a2e7ecc9ce0ee9dea221fa7649a00f769f8d7de6cfa5dfe9396747586cd77320c9ce06b306', 1, 1, 'Token', '[]', 0, '2023-08-25 18:29:04', '2023-08-25 18:29:04', '2024-08-25 14:29:04'),
('eb092a2aeba70a76017e70c6c6ac5d8f1cac71d449559acdab5e2e6c9ea190f8033faa5a21230159', 1, 1, 'Token', '[]', 0, '2024-01-03 18:44:29', '2024-01-03 18:44:29', '2025-01-03 13:44:29'),
('eb7c1370cf2bd308505b7710c88ba9c3adf4ebfd812ec1c522078644f937bc1f28fe63569a37aec1', 1, 1, 'Token', '[]', 0, '2023-11-29 14:09:35', '2023-11-29 14:09:35', '2024-11-29 09:09:35'),
('ec2a5b8e4495a2a7fc642760b4d52973c8783f0e6c205655d153f114f47ab92203a4acf008c33f7e', 1, 1, 'Token', '[]', 0, '2023-10-04 15:25:16', '2023-10-04 15:25:17', '2024-10-04 11:25:16'),
('eda2bb6784b8876bcf33bf6e6831f9dd0bd6115d6182080bcc466a68357b0a73d25268cb5c0ab043', 1, 1, 'Token', '[]', 0, '2023-12-20 08:54:41', '2023-12-20 08:54:41', '2024-12-20 08:54:41'),
('ee64da015ee5b5baee4cffc253a05e32170a0bc247d3e1962a7553f581f9182204fdf1199c572810', 1, 1, 'Token', '[]', 0, '2023-08-29 11:48:39', '2023-08-29 11:48:39', '2024-08-29 07:48:39'),
('ef39673b4325b8c48f6ff4afbd40ba8b396ae31988e8609554896a29681353915654a00980b3f3ec', 1, 1, 'Token', '[]', 0, '2023-10-19 10:35:42', '2023-10-19 10:35:43', '2024-10-19 06:35:42'),
('ef5faf6a44b07eccd49fd0aead0a1142640a55bdbe34eba82a920fb3363b0a7830f78f4fcabbbf8e', 1, 1, 'Token', '[]', 0, '2023-08-25 17:57:46', '2023-08-25 17:57:47', '2024-08-25 13:57:46'),
('ef7a772c4cbd00ea1de376af26c47c5f9a75c5d1cd8bd5e94fcd2c1b800f5eededf49b7c20466527', 1, 1, 'Token', '[]', 0, '2023-09-18 10:52:48', '2023-09-18 10:52:48', '2024-09-18 06:52:48'),
('ef9854bfc35e5ef1b388abc9e0e7b0c655c3ac0d10e566583ed92d90897e13a39f728bfca91283d5', 1, 1, 'Token', '[]', 0, '2023-08-24 16:47:13', '2023-08-24 16:47:13', '2024-08-24 12:47:13'),
('efd453181d57d0b1ec7514b0393b0dda1a349690c0a81fc1bf29ca24be3e8f32c4019ffe9ee2c5a5', 1, 1, 'Token', '[]', 0, '2023-12-02 09:12:34', '2023-12-02 09:12:34', '2024-12-02 09:12:34'),
('f019df6bb7167e050259e86c89cc7b2e107b68051192947471637d654bbf9babd99967757e48cac8', 1, 1, 'Token', '[]', 0, '2023-11-20 15:11:36', '2023-11-20 15:11:36', '2024-11-20 10:11:36'),
('f1d5189850fec76495ec963bb71a017d7549623c83afa3de4f6aa01f5e3d6cdc46f162a18fe42ae7', 1, 1, 'Token', '[]', 0, '2023-11-17 15:13:27', '2023-11-17 15:13:27', '2024-11-17 10:13:27'),
('f4cfb8e1ff1226a81ae257a2fd972ce038cc76a7ec8989d745343cc62d1f24c5828c1f25b8c9507d', 1, 1, 'Token', '[]', 0, '2023-09-26 10:25:53', '2023-09-26 10:25:54', '2024-09-26 06:25:53'),
('f5b80891e9dc0ec88586d2e1c0cd37d566e1f35f2645f658007e15a183dd90be26ad0a90ad1b9f39', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('f5b9eb32f7bf289f13857dcca3b9c1f2f755f184d1ecf1d8ea949d6f7323e49e7789f1f7e62a9e21', 1, 1, 'Token', '[]', 0, '2023-08-24 10:05:13', '2023-08-24 10:05:13', '2024-08-24 06:05:13'),
('f70fc7387263965401d98b92daf60c2bc5f158028e4b80acb82adcc79f8a08fd90b3a8cd3e7c2f23', 1, 1, 'Token', '[]', 0, '2023-09-26 12:19:09', '2023-09-26 12:19:09', '2024-09-26 08:19:09'),
('f79d6cd6a21d17bb27843c50f96a894fa77c076f1a633f698285a50834bea81f1ba406f884f112b8', 1, 1, 'Token', '[]', 0, '2023-10-02 12:45:21', '2023-10-02 12:45:21', '2024-10-02 08:45:21'),
('f7e063bae397fb5aa59ee898d73383ff118a340090f2731b53e8736438931a4d8e2dbafef8651df9', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:23', '2023-08-24 15:32:23', '2024-08-24 11:32:23'),
('f8e824ef54f9040c4d3d752918ae2d6c437fda81de6521e4ef75a227f3bfb94957a8c85466450a31', 1, 1, 'Token', '[]', 0, '2023-10-05 10:46:32', '2023-10-05 10:46:32', '2024-10-05 06:46:32'),
('fa0c90cfd2eb4f2dc2d4edb2f3440973a1d1138f8825240b09159dee6b5edb31fa4df221a44b2229', 1, 1, 'Token', '[]', 0, '2023-09-06 15:15:48', '2023-09-06 15:15:48', '2024-09-06 11:15:48'),
('fa885c6ed0eb77298c4465841348387ec28c5df5f4e294b405ce20801e49a4668c0eb9b4daad1bb9', 1, 1, 'Token', '[]', 0, '2023-08-24 15:32:37', '2023-08-24 15:32:37', '2024-08-24 11:32:37'),
('fad7169dd920281c2a932d7e3970cb47df81ef066cc37f8a2229aee32b62796bde8b91c5bdfd45a8', 1, 1, 'Token', '[]', 0, '2023-10-19 12:28:00', '2023-10-19 12:28:00', '2024-10-19 08:28:00'),
('fb0357d0146de3601eaf141a2ccaf0c0e0e748d091017f63a49b6c0399ef5255f81b1e98307b04ea', 1, 1, 'Token', '[]', 0, '2023-09-20 15:12:14', '2023-09-20 15:12:14', '2024-09-20 11:12:14'),
('fe072e643d6e4fa6755975a886fa6211b1895ef9dfb8b56d32e18860992fbd338fd60840b46cdcf6', 1, 1, 'Token', '[]', 0, '2023-10-17 10:31:07', '2023-10-17 10:31:07', '2024-10-17 06:31:07'),
('fef48cfdbd5781b35b88a73c79198a42be629f7baaabfd7a8e588c709933adb68403f401eb03722a', 1, 1, 'Token', '[]', 0, '2023-08-24 10:36:10', '2023-08-24 10:36:10', '2024-08-24 06:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'kjb877v6mL3DA6BTbVzzuxLfJnJFVefAUxZ5rBWf', NULL, 'http://localhost', 1, 0, 0, '2023-08-17 05:25:00', '2023-08-17 05:25:00'),
(2, NULL, 'Laravel Password Grant Client', '18cOuBKce0byEiaby2v8f2kvEsN2rrAu478Op68t', 'users', 'http://localhost', 0, 1, 0, '2023-08-17 05:25:00', '2023-08-17 05:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-17 05:25:00', '2023-08-17 05:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_meter_reading` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `total_life_kilometer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_meter_reading`, `image`, `vehicle_id`, `category`, `total_life_kilometer`, `created_at`, `updated_at`) VALUES
(1, '34678', 'serviceImage/883e881bb4d22a7add958f2d6b052c9f.jpg', 2, 'Petrol', '34799', '2024-01-29 19:34:45', '2024-01-29 19:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `ubers`
--

CREATE TABLE `ubers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `uber_earning` varchar(255) DEFAULT NULL,
  `bolt_earning` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `moms_6_tax` varchar(255) DEFAULT NULL,
  `net` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `moms_25_tax` varchar(255) DEFAULT NULL,
  `net_payable` varchar(255) DEFAULT NULL,
  `net_total` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ubers`
--

INSERT INTO `ubers` (`id`, `name`, `last_name`, `uber_earning`, `bolt_earning`, `total`, `moms_6_tax`, `net`, `admin`, `moms_25_tax`, `net_payable`, `net_total`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Sohail', 'Danish', NULL, '123456', '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-08 08:11:26', '2024-01-08 08:11:26'),
(2, 'Muhammad Sohail', 'Danish', NULL, '123456', '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-08 08:14:55', '2024-01-08 08:14:55'),
(3, 'Muhammad Sohail', 'Danish', '123456', NULL, '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-08 08:16:05', '2024-01-08 08:16:05'),
(4, 'Muhammad Sohail', 'Danish', '123456', NULL, '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-08 10:27:54', '2024-01-08 10:27:54'),
(5, 'Test', 'Haseeb', NULL, '3000', '3000', '180', '2820', '141', '669.75', '2679', '3348.75', '2024-01-01', '2024-01-07', '2024-01-08 10:41:22', '2024-01-08 10:41:22'),
(6, 'Aqeel', 'Ahmad', NULL, '10480.23', '10480.23', '628.8138', '9851.4162', '492.57081', '2339.7113475', '9358.84539', '11698.5567375', '2024-01-01', '2024-01-07', '2024-01-08 10:41:22', '2024-01-08 10:41:22'),
(7, 'Test', 'Haseeb', NULL, '3000', '3000', '180', '2820', '141', '669.75', '2679', '3348.75', '2024-01-01', '2024-01-07', '2024-01-08 10:42:46', '2024-01-08 10:42:46'),
(8, 'Aqeel', 'Ahmad', NULL, '10480.23', '10480.23', '628.8138', '9851.4162', '492.57081', '2339.7113475', '9358.84539', '11698.5567375', '2024-01-01', '2024-01-07', '2024-01-08 10:42:46', '2024-01-08 10:42:46'),
(9, 'fazal', 'abbas', NULL, '3268', '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-01', '2024-01-07', '2024-01-08 10:42:46', '2024-01-08 10:42:46'),
(10, 'Muhammad Sohail', 'Danish', '123456', NULL, '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-08 10:44:54', '2024-01-08 10:44:54'),
(11, 'fazal', 'abbas', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-01', '2024-01-07', '2024-01-08 10:44:54', '2024-01-08 10:44:54'),
(12, 'Muhammad Sohail', 'Danish', '123456', NULL, '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-01', '2024-01-07', '2024-01-10 13:22:14', '2024-01-10 13:22:14'),
(13, 'fazal', 'abbas', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-01', '2024-01-07', '2024-01-10 13:22:14', '2024-01-10 13:22:14'),
(14, 'Awais', 'Ali', '4545', NULL, '4545', '272.7', '4272.3', '213.615', '1014.67125', '4058.685', '5073.35625', '2024-01-01', '2024-01-07', '2024-01-10 13:22:14', '2024-01-10 13:22:14'),
(15, 'Muhammad Sohail', 'Danish', '4321', NULL, '4321', '259.26', '4061.74', '203.087', '964.66325', '3858.653', '4823.31625', '2024-01-10', '2024-01-17', '2024-01-17 07:29:37', '2024-01-17 07:29:37'),
(16, 'fazal', 'abbas', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-10', '2024-01-17', '2024-01-17 07:29:37', '2024-01-17 07:29:37'),
(17, 'Awais', 'Ali', '4545', NULL, '4545', '272.7', '4272.3', '213.615', '1014.67125', '4058.685', '5073.35625', '2024-01-10', '2024-01-17', '2024-01-17 07:29:37', '2024-01-17 07:29:37'),
(18, 'Muhammad Sohail', 'Danish', '4321', NULL, '4321', '259.26', '4061.74', '203.087', '964.66325', '3858.653', '4823.31625', '2024-01-03', '2024-01-08', '2024-01-17 07:34:37', '2024-01-17 07:34:37'),
(19, 'fazal', 'abbas', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-03', '2024-01-08', '2024-01-17 07:34:37', '2024-01-17 07:34:37'),
(20, 'Awais', 'Ali', '4545', NULL, '4545', '272.7', '4272.3', '213.615', '1014.67125', '4058.685', '5073.35625', '2024-01-03', '2024-01-08', '2024-01-17 07:34:37', '2024-01-17 07:34:37'),
(21, 'Muhammad Sohail', 'Danish', '123456', NULL, '123456', '7407.36', '116048.64', '5802.432', '27561.552', '110246.208', '137807.76', '2024-01-14', '2024-01-20', '2024-01-24 09:52:36', '2024-01-24 09:52:36'),
(22, 'fazal', 'abbas', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-14', '2024-01-20', '2024-01-24 09:52:36', '2024-01-24 09:52:36'),
(23, 'Awais', 'Ali', '4545', NULL, '4545', '272.7', '4272.3', '213.615', '1014.67125', '4058.685', '5073.35625', '2024-01-14', '2024-01-20', '2024-01-24 09:52:36', '2024-01-24 09:52:36'),
(24, 'Sohail', 'akbar', '3268', NULL, '3268', '196.08', '3071.92', '153.596', '729.581', '2918.324', '3647.905', '2024-01-14', '2024-01-20', '2024-01-24 09:52:36', '2024-01-24 09:52:36'),
(25, 'Test', 'Haseeb', NULL, '3000', '3000', '180', '2820', '141', '669.75', '2679', '3348.75', '2024-01-01', '2024-01-07', '2024-01-26 16:08:04', '2024-01-26 16:08:04'),
(26, 'Aqeel', 'Ahmad', NULL, '10480.23', '10480.23', '628.8138', '9851.4162', '492.57081', '2339.7113475', '9358.84539', '11698.5567375', '2024-01-01', '2024-01-07', '2024-01-26 16:08:04', '2024-01-26 16:08:04'),
(27, 'Naveed', 'Akbar', NULL, '4545', '4545', '272.7', '4272.3', '213.615', '1014.67125', '4058.685', '5073.35625', '2024-01-01', '2024-01-07', '2024-01-26 16:08:04', '2024-01-26 16:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Pending',
  `mobile` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `salary_fix` varchar(255) DEFAULT NULL,
  `salary_commission` varchar(255) DEFAULT NULL,
  `hourly_enter_amount` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_title` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `company_name_own` varchar(255) DEFAULT NULL,
  `bank_upload_document` varchar(255) DEFAULT NULL,
  `taxi_driving_liscence` varchar(255) DEFAULT NULL,
  `bank_emergency_contact_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_number` varchar(255) DEFAULT NULL,
  `company_document` varchar(255) DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_name` varchar(255) DEFAULT NULL,
  `vehicle_company` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `car_make` varchar(255) DEFAULT NULL,
  `car_model` varchar(255) DEFAULT NULL,
  `car_color` varchar(255) DEFAULT NULL,
  `car_number` varchar(255) DEFAULT NULL,
  `vehicle_image` varchar(255) DEFAULT NULL,
  `total_number_hour` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `selectedCarType` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `joining_date` varchar(255) DEFAULT NULL,
  `salary_commission_exclusive` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `uber_earning` varchar(255) DEFAULT NULL,
  `bolt_earning` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `driver_hourly_rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `security_code`, `status`, `mobile`, `gender`, `emergency_contact_name`, `emergency_contact_number`, `address`, `date_of_birth`, `profile_picture`, `salary`, `salary_fix`, `salary_commission`, `hourly_enter_amount`, `bank_name`, `bank_title`, `bank_account_number`, `company_name_own`, `bank_upload_document`, `taxi_driving_liscence`, `bank_emergency_contact_name`, `company_name`, `owner_name`, `owner_number`, `company_document`, `vehicle_id`, `vehicle_name`, `vehicle_company`, `description`, `car_make`, `car_model`, `car_color`, `car_number`, `vehicle_image`, `total_number_hour`, `password`, `selectedCarType`, `type`, `joining_date`, `salary_commission_exclusive`, `postal_code`, `city`, `card`, `uber_earning`, `bolt_earning`, `company_id`, `driver_hourly_rate`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'main', 'admin@gmail.com', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5tY.Qx7RV82a8SHZM88okOQtSBnIiRqcw3ERlwucZ1AotkTa5Pvwy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 05:25:05', '2023-08-17 05:25:05'),
(63, 'Awais Hxn', 'Techno', 'hy@gmail.com', '000000-0000', 'Pending', '876543567', 'Male', 'Safdar', '09876545678', 'Gulberg Lahpre', '2023-12-30', 'driverImage/74e1ed8b55ea44fd7dbb685c412568a4.png', NULL, '786', NULL, NULL, 'HBL', NULL, '8989389039980008', 'Own name', 'bankImage/fc528592c3858f90196fbfacc814f235.png', 'Taxi License', 'ijisudhducihd 7393', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$09kw4FfZbq1xXlRc0pg2i.fT3jkvVnsmdezXkK2UFFZEm96rYbwnm', NULL, 'uber', '2023-12-31', NULL, '887899', 'Lahore', NULL, NULL, NULL, NULL, NULL, '2023-12-29 12:45:25', '2024-01-30 13:45:28'),
(64, 'Aqeel', 'Test', 'Test@gmail.com', '000000-0000', 'Pending', '111111111', 'Male', 'Test', 'Test', 'Test', '2023-12-30', 'driverImage/459a4ddcb586f24efd9395aa7662bc7c.png', NULL, '10', NULL, NULL, 'Test', NULL, 'null', 'Test', 'bankImage/a368b0de8b91cfb3f91892fbf1ebd4b2.png', 'Driving License/Swedish ID', 'Test', NULL, NULL, NULL, NULL, NULL, 'Test', 'test', 'Test', 'Test', 'Test', 'Test', 'Test', '[\"vehicleImage\\/483101a6bc4e6c46a86222eb65fbcb6a.png\"]', 'null', '12345678', 'Own', 'bolt', '2023-12-23', 'null', '9090', 'Test', NULL, NULL, NULL, NULL, NULL, '2023-12-29 12:50:18', '2024-01-08 12:59:33'),
(65, 'Test', 'Haseeb', 'admin@gmail.com', '000000-0000', 'Approved', '111111111', 'Male', 'Test', 'Test', 'Test', '2023-12-30', 'driverImage/b9141aff1412dc76340b3822d9ea6c72.png', NULL, NULL, '10', NULL, 'Test', NULL, 'Test', 'Test', 'bankImage/67606d48e361ce176ca71fd54fcf4286.png', 'Taxi License', 'Test', NULL, NULL, NULL, NULL, 1, 'null', 'null', NULL, 'null', 'null', 'null', 'null', NULL, 'null', '12345678', 'Company', 'bolt', '2023-12-30', '10', 'Test', 'Test', NULL, NULL, '9000', NULL, NULL, '2023-12-29 12:54:55', '2023-12-29 13:21:05'),
(66, 'aqeel', 'ahmad', 'admin@gmail.com', '000000-0000', 'Approved', '216858688', 'Male', 'asdf', '+923216858688', 'new gulistan colony house no 135/2', '2024-01-06', 'driverImage/e804a3e088d734b12a3a2acffb77f37a.jpg', NULL, NULL, '12', NULL, 'sdf', NULL, '23424233', 'artvirsa', 'bankImage/79121bb953a3bd47c076f20234bafd2e.png', 'Driving License/Swedish ID', 'asfsfsfdf', NULL, NULL, NULL, NULL, NULL, 'aqeel car', 'null', 'testing', '19992', '121231`', 'red', '12abc', '[\"vehicleImage\\/4d6da0c32dd563fea116da78ca1ffd39.png\"]', NULL, '12345678', 'Own', 'bolt', '2024-01-06', '12', '4000', 'wah cant', NULL, NULL, '31440.69', NULL, NULL, '2024-01-06 12:00:51', '2024-01-26 21:50:53'),
(67, 'Muhammad Sohail', 'Danish', 'admin@gmail.com', '123456-0000', 'Approved', '143082440', 'Male', NULL, NULL, '5900 BALCONES DR STE 4266', '1999-01-12', 'driverImage/b0bef4c9a6e50d43880191492d4fc827.png', NULL, NULL, '50', NULL, NULL, NULL, NULL, NULL, 'bankImage/8ccfb1140664a5fa63177fb6e07352f0.png', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, NULL, 'Audi', 'null', NULL, 'null', 'E-tron', 'Red', 'MRF365', NULL, 'null', '12345678', 'Own', 'uber', '1998-09-12', NULL, '78731', 'AUSTIN', NULL, '625922', '246912', NULL, NULL, '2024-01-08 13:04:28', '2024-01-08 13:15:33'),
(68, 'Fazal', 'Abbas', 'admin@gmail.com', '234578-0000', 'Approved', '143082440', 'Male', NULL, '03143082440', 'Kamman', '1998-02-12', 'driverImage/3bf07985bf8a5a37fcf65989269e8edc.png', NULL, NULL, '45', NULL, NULL, NULL, NULL, NULL, 'bankImage/703957b6dd9e3a7980e040bee50ded65.png', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, NULL, 'Audi', 'null', NULL, 'Audi', 'e-tron', 'Black', 'RDF234', NULL, 'null', '12345678', 'Own', 'uber', '2023-02-12', NULL, '56120', 'Renala Khurd', NULL, '16340', '3268', NULL, NULL, '2024-01-08 15:38:16', '2024-01-09 13:09:07'),
(69, 'Muhammad Sohail', 'Danish', 'admin@gmail.com', '234578-0000', 'Approved', '143082440', 'Male', NULL, '03143082440', 'Kamman', '2024-01-08', 'driverImage/5ec829debe54b19a5f78d9a65b900a39.webp', NULL, NULL, '50', NULL, NULL, NULL, NULL, NULL, 'bankImage/8e1ad7941398486f8cede7799b886b58.webp', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$qEt4yPgvQ3LOPtIOUnmMH.2iUnfEYRlRBbs1TXuLYZ7L1SWJMNO7e', NULL, 'uber', '2024-01-08', NULL, '56120', 'Renala Khurd', NULL, '625922', NULL, NULL, NULL, '2024-01-09 14:30:34', '2024-01-09 14:31:00'),
(70, 'Awais', 'Ali', 'admin@gmail.com', '234578-0000', 'Approved', '143082440', 'Male', NULL, NULL, 'lahore', '1999-09-12', 'driverImage/3091d86c09a002e144f4ec506eada3d7.webp', NULL, NULL, '50', NULL, NULL, NULL, NULL, NULL, 'bankImage/a6640ad0aca7033809ffa7165c3040f9.webp', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, NULL, 'Audi', 'null', NULL, 'Audi', '2024', 'red', 'ref234', NULL, 'null', '12345678', 'Own', 'uber', '2019-02-12', NULL, '56233', 'renala', NULL, '18180', NULL, NULL, NULL, '2024-01-10 18:21:12', '2024-01-26 21:31:00'),
(71, 'Sohail', 'akbar', 'admin@gmail.com', '234578-0000', 'Approved', '123456789', 'Male', NULL, NULL, 'Kamman', '1997-12-12', 'driverImage/14db62200d8bf46551aa214accafe1df.png', NULL, NULL, '45', NULL, NULL, NULL, NULL, NULL, 'bankImage/bf40f0ab4e5e63171dd16036913ae828.png', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, NULL, 'Audi', NULL, NULL, 'Audi', 'E-tron', 'red', 'MRF365', '[\"vehicleImage\\/60131a2a3f223dc8f4753bcc5771660c.png\"]', NULL, '$2y$10$eFmSYSaR7MAd9oVuayTt6.Q56BMLi/4e8fOMEC4kDyJ1ZZv3X4MfC', NULL, 'uber', '1997-12-12', NULL, '56120', 'Renala Khurd', NULL, '3268', NULL, NULL, NULL, '2024-01-24 14:50:37', '2024-01-24 14:51:38'),
(72, 'Naveed', 'Akbar555', 'rana.167@gmail.com', '850102-0559', 'Approved', '739457360', 'Male', 'Sohail', '0763921633', 'Skarprättarvägen 20', '1985-01-02', 'driverImage/4a3fd911279cd8bc597fa13222ef83be.jpeg', NULL, NULL, '50', NULL, 'Naveed Akbar', NULL, '56900528058', 'Driveloop AB', 'bankImage/03b264c595403666634ac75d828439bc.jpeg', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, 4, 'null', 'null', NULL, 'null', 'null', 'null', 'null', NULL, 'null', '$2y$10$8vq3N3r8m8qb/UJqdYDqQOXJSWGKATKOxuR7YBl13o5mRk1odQFRG', 'Company', 'bolt', '2024-01-01', NULL, '19462', 'Stockholm', NULL, NULL, '4545', NULL, NULL, '2024-01-26 20:29:28', '2024-01-26 21:32:04'),
(73, 'Naveed', 'Akbar', 'rana.167@gmail.com', '850102-0559', 'Approved', '739457360', 'Male', 'Sohail', '0763921633', 'Skarprättarvägen 20', '1985-01-02', 'driverImage/4c9d1fbce4890fc2731b6a61262313b1.jpeg', NULL, NULL, '50', NULL, 'Naveed Akbar', NULL, '56900528058', 'Driveloop AB', 'bankImage/118bd558033a1016fcc82560c65cca5f.jpeg', 'Driving License/Swedish ID', NULL, NULL, NULL, NULL, NULL, 4, 'null', 'null', NULL, 'null', 'null', 'null', 'null', NULL, 'null', '$2y$10$A4j9xetnQdbvhrJyAx05XO3131g0.tBft9C7FxQJj/fAn6EvsKK.W', 'Company', 'bolt', '2024-01-01', NULL, '19462', 'Stockholm', NULL, NULL, '4545', NULL, NULL, '2024-01-26 20:30:11', '2024-01-26 21:31:45'),
(74, 'Sohail', 'Akbar', 'rana.167@gmail.com', '850102-0559', 'Approved', '739457360', 'Male', 'so', '216', 'Skarprättarvägen 20', '198501-01-02', 'null', NULL, '50000', NULL, NULL, 'Naveed Akbar', NULL, '56900528058', 'TruePorter', 'null', 'Taxi License', 'null', 'undefined', 'undefined', 'undefined', 'undefined', NULL, 'null', 'null', NULL, 'null', 'null', 'null', 'null', NULL, 'null', '$2y$10$et9aWaJGZaT0mC3cjNxe4.CCxzIZgVXR0cy8HIWF5JX96z.u68eIW', NULL, 'b2b', '2024-01-01', 'null', '17677', 'JÄRFÄLLA', NULL, NULL, NULL, 1, NULL, '2024-01-26 20:46:09', '2024-01-26 21:00:53'),
(75, 'Danish', 'Sohail', 'admin@gmail.com', '850102-0559', 'Approved', '455647512', 'Male', 'Naveed', '0739457360', 'Skarprättarvägen 20', '2024-01-01', 'driverImage/b426b30042abbc15e363cb679bbc937d.jpeg', NULL, NULL, NULL, '150', NULL, NULL, NULL, 'Driveloop AB', 'null', 'Taxi License', NULL, 'undefined', 'undefined', 'undefined', 'undefined', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MUzc66aPXfA1Kb0t9QGTGeTKVdfQlf0RBtYMvT9eXsJcArT68x4cW', NULL, 'b2b', '2024-01-01', NULL, '17677', 'JÄRFÄLLA', NULL, NULL, NULL, 2, NULL, '2024-01-26 21:06:30', '2024-01-26 21:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vehicle_company` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `car_make` varchar(255) DEFAULT NULL,
  `car_model` varchar(255) DEFAULT NULL,
  `car_color` varchar(255) DEFAULT NULL,
  `car_number` varchar(255) DEFAULT NULL,
  `model_year` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `equipment` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `last_inspection` varchar(255) DEFAULT NULL,
  `insurance` varchar(255) DEFAULT NULL,
  `texameter_inspection_date` varchar(255) DEFAULT NULL,
  `next_inspection` varchar(255) DEFAULT NULL,
  `category_of_vehicle` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `insurance_company_name` varchar(255) DEFAULT NULL,
  `car_maintenance_feature` varchar(255) DEFAULT NULL,
  `select_equipment` varchar(255) DEFAULT NULL,
  `running` varchar(255) DEFAULT NULL,
  `oil_change` varchar(255) DEFAULT NULL,
  `mileage` varchar(255) DEFAULT NULL,
  `accidental_claim` varchar(255) DEFAULT NULL,
  `other_expense` varchar(255) DEFAULT NULL,
  `service_meter_reading` varchar(255) DEFAULT NULL,
  `total_life_kilometer` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `vehicle_company`, `description`, `car_make`, `car_model`, `car_color`, `car_number`, `model_year`, `registration_number`, `equipment`, `image`, `vehicle_type`, `last_inspection`, `insurance`, `texameter_inspection_date`, `next_inspection`, `category_of_vehicle`, `vendor_name`, `insurance_company_name`, `car_maintenance_feature`, `select_equipment`, `running`, `oil_change`, `mileage`, `accidental_claim`, `other_expense`, `service_meter_reading`, `total_life_kilometer`, `type`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', NULL, 'Test', NULL, 'Test', 'Test', NULL, 'Test', 'Test', NULL, '[\"vehicleImage\\/866c7ee013c58f01fa153a8d32c9ed57.png\"]', 'Office Use', '2023-12-30', '1234', NULL, '2024-01-05', 'Taxi', 'Taxijakt', 'Test', NULL, 'Air Pump', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-29 12:53:29', '2023-12-29 12:53:29'),
(2, 'Audi', NULL, NULL, NULL, 'e-tron', 'red', NULL, '2023', 'MRF567', NULL, '[\"vehicleImage\\/c2839bed26321da8b466c80a032e4714.webp\"]', 'Taxi', '2024-01-01', '1', '2024-01-08', '2025-01-09', 'Taxi', 'Uber', '1', NULL, 'Other', NULL, NULL, NULL, NULL, NULL, '34678', NULL, NULL, NULL, '2024-01-09 14:28:40', '2024-01-29 19:34:45'),
(4, 'Audi', NULL, NULL, NULL, 'Q7', 'White', NULL, '2017', 'RPR933', NULL, '[\"vehicleImage\\/8c1b6fa97c4288a4514365198566c6fa.jpeg\"]', 'Office Use', '2023-05-28', '261616', NULL, '2024-05-25', 'Transport', 'Uber', 'Water circle', NULL, 'Tire Repair Kit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-26 20:21:16', '2024-01-26 20:21:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`);

--
-- Indexes for table `assigns`
--
ALTER TABLE `assigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bolts`
--
ALTER TABLE `bolts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configrations`
--
ALTER TABLE `configrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `import_files`
--
ALTER TABLE `import_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leader_boards`
--
ALTER TABLE `leader_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ubers`
--
ALTER TABLE `ubers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assigns`
--
ALTER TABLE `assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bolts`
--
ALTER TABLE `bolts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `configrations`
--
ALTER TABLE `configrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_files`
--
ALTER TABLE `import_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leader_boards`
--
ALTER TABLE `leader_boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ubers`
--
ALTER TABLE `ubers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
