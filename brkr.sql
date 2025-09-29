-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2025 at 11:41 PM
-- Server version: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brkr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `otp_timestamp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`, `modified_at`, `created_by`, `otp`, `otp_timestamp`) VALUES
(1, 'admin', '909090', '2024-03-29 22:30:44', '2024-04-02 11:35:25', '', '110948', '2025-08-31 16:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `asset_class` varchar(50) NOT NULL,
  `asset_ticker` varchar(50) NOT NULL,
  `percentage` decimal(11,2) NOT NULL DEFAULT 50.00,
  `outcome` varchar(255) NOT NULL DEFAULT 'loss',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(255) NOT NULL DEFAULT 'admin1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_class`, `asset_ticker`, `percentage`, `outcome`, `date_added`, `modified_by`) VALUES
(1, 'FOREX', 'EUR/USD', 0.77, 'loss', '2024-05-07 16:32:09', 'admin1'),
(2, 'FOREX', 'GBP/USD', 7.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(3, 'FOREX', 'USD/JPY', 20.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(4, 'FOREX', 'AUD/USD', 30.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(5, 'FOREX', 'USD/CAD', 50.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(6, 'FOREX', 'USD/CNY', 50.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(7, 'FOREX', 'USD/CHF', 30.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(8, 'FOREX', 'EUR/GBP', 50.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(9, 'FOREX', 'USD/HKD', 50.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(10, 'FOREX', 'USD/KRW', 30.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(11, 'FOREX', 'NZD/USD', 10.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(12, 'CRYPTO', 'BTC/USDT', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(13, 'CRYPTO', 'SOL/USDT', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(14, 'CRYPTO', 'ETH/USDT', 4.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(15, 'CRYPTO', 'LTC/USDT', 3.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(16, 'CRYPTO', 'XRP/USDT', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(17, 'CRYPTO', 'BTC/USD', 3.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(18, 'CRYPTO', 'MATIC/USDT', 19.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(19, 'CRYPTO', 'ADA/USDT', 10.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(20, 'CRYPTO', 'FIL/USDT', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(21, 'CRYPTO', 'ATOM/USDT', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(22, 'CRYPTO', 'BCH/BTC', 4.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(23, 'CRYPTO', 'NEO/USDT', 17.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(24, 'CRYPTO', 'WAVES/USDT', 5.00, 'loss', '2024-05-07 16:32:09', 'admin1'),
(25, 'CRYPTO', 'XRP/BTC', 1.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(26, 'CRYPTO', 'ENJ/USDT', 10.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(27, 'CRYPTO', 'BNB/USDT', 10.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(28, 'CRYPTO', 'BNB/BTC', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(29, 'CRYPTO', 'XLM/BTC', 15.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(30, 'CRYPTO', 'ETH/BCH', 6.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(31, 'CRYPTO', 'ETH/DOGE', 7.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(32, 'CRYPTO', 'ETH/ADA', 2.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(33, 'CRYPTO', 'AAVE/BTC', 5.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(34, 'CRYPTO', 'APE/BTC', 5.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(35, 'STOCKS', 'FOREXCOM:SPX500', 10.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(36, 'STOCKS', 'SPY', 10.00, 'win', '2024-05-07 16:32:09', 'admin1'),
(37, 'STOCKS', 'AAPL', 3.00, 'win', '2024-05-07 16:32:09', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `bonus_withdrawals`
--

CREATE TABLE `bonus_withdrawals` (
  `id` int(100) NOT NULL,
  `userid` int(100) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `crypto` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `amount` int(100) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bonus_withdrawals`
--

INSERT INTO `bonus_withdrawals` (`id`, `userid`, `f_name`, `l_name`, `crypto`, `wallet`, `amount`, `reference`, `status`, `date`) VALUES
(33, 2, 'Riko', 'Daniella', 'usdt', 'w2e3r4t5kyutfdytfhmfgduigdsetghjuio7re5w4', 9, 'tKuKWWRodO09fjlQubOK9oP36LEOFOGB2J8Dx3om', 1, '2025-05-20 13:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

CREATE TABLE `commodities` (
  `id` int(11) NOT NULL,
  `commodity_name` varchar(100) NOT NULL,
  `commodity_symbol` varchar(100) NOT NULL,
  `commodity_price` decimal(10,4) NOT NULL,
  `commodity_image_path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `commodities`
--

INSERT INTO `commodities` (`id`, `commodity_name`, `commodity_symbol`, `commodity_price`, `commodity_image_path`, `date_added`, `date_modified`, `modified_by`) VALUES
(3, 'Gold', 'GOLD', 16.4640, '../uploads/commodities/1687967071.jpg', '2024-04-18 12:54:12', '2024-04-18 12:54:12', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `commodity_trades`
--

CREATE TABLE `commodity_trades` (
  `id` int(100) NOT NULL,
  `user_id` int(255) NOT NULL,
  `commodity_name` varchar(255) NOT NULL,
  `commodity_symbol` varchar(255) NOT NULL,
  `commodity_amount` int(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copy_traders`
--

CREATE TABLE `copy_traders` (
  `id` int(11) NOT NULL,
  `trader_name` varchar(255) NOT NULL,
  `trader_image` varchar(255) NOT NULL DEFAULT 'default.png',
  `followers` int(255) NOT NULL,
  `roi` int(100) NOT NULL,
  `total_trades` int(100) NOT NULL,
  `days` int(100) NOT NULL,
  `profit` int(100) NOT NULL,
  `amount` int(100) NOT NULL,
  `facebook` varchar(255) NOT NULL DEFAULT 'https://facebook.com',
  `twitter` varchar(255) NOT NULL DEFAULT 'https://twitter.com',
  `instagram` varchar(255) NOT NULL DEFAULT 'https://instagram.com',
  `linkedin` varchar(255) NOT NULL DEFAULT 'https://linkedin.com',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `copy_traders`
--

INSERT INTO `copy_traders` (`id`, `trader_name`, `trader_image`, `followers`, `roi`, `total_trades`, `days`, `profit`, `amount`, `facebook`, `twitter`, `instagram`, `linkedin`, `date_added`, `date_modified`, `modified_by`) VALUES
(1, 'BENJAMIN MONCHY', '../uploads/traders/trader1.png', 11, 50, 20990, 280, 100000, 10000, 'https://facebook.com/', 'https://twitter.com/', 'https://instagram.com/', 'https://linkedin.com', '2024-04-18 12:22:13', '2024-04-18 12:22:13', 'grandmaster'),
(2, 'Ashraf Laidi', '../uploads/traders/trader4.png', 90, 10, 90, 300, 9, 1000, 'https://facebook.com/', 'https://twitter.com/alaidi', 'https://instagram.com/', 'https://linkedin.com', '2024-04-18 12:26:24', '2024-04-18 12:26:24', 'grandmaster'),
(3, 'Daily FX', '../uploads/traders/1681776528.png', 300, 50, 4000, 300, 5000, 2000, 'https://facebook.com/', 'https://twitter.com/voke', 'https://instagram.com/', 'https://linkedin.com', '2024-04-18 12:29:51', '2024-04-18 12:29:51', 'admin1'),
(4, 'Ralph Acampora CMT', '../uploads/traders/trader3.png', 40, 80, 760, 260, 28, 2900, 'https://facebook.com/', 'https://twitter.com/Ralph_Acampora', 'https://instagram.com/Ralph_Acampora', 'https://linkedin.com', '2024-04-18 12:31:53', '2024-04-18 12:31:53', 'admin1'),
(5, 'FG', '../uploads/traders/193886_10150513502610328_1056580_o.jpg', 789, 32, 322, 23, 45, 8909, '', '', '', 'https://linkedin.com', '2024-04-23 10:31:47', '2024-04-23 10:31:47', 'admin1'),
(6, 'Nick Anderson', '../uploads/traders/WhatsApp Image 2024-12-02 at 5.05.45 AM.jpeg', 20, 15, 74337, 426, 7809547, 360000, '', '', '', 'https://linkedin.com', '2024-12-02 11:07:57', '2024-12-02 11:07:57', 'grandmaster');

-- --------------------------------------------------------

--
-- Table structure for table `copy_trades`
--

CREATE TABLE `copy_trades` (
  `id` int(100) NOT NULL,
  `userid` int(255) NOT NULL,
  `trader_name` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `commission` int(100) NOT NULL,
  `profit_loss` int(255) NOT NULL DEFAULT 0,
  `status` varchar(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `set_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `copy_trades`
--

INSERT INTO `copy_trades` (`id`, `userid`, `trader_name`, `amount`, `commission`, `profit_loss`, `status`, `date`, `set_time`) VALUES
(1, 6, 'Nick Anderson', 360000, 15, 414000, 'win', '2024-12-08 09:48:07', '2024-12-08 09:53:07'),
(2, 6, 'Nick Anderson', 360000, 15, 414000, 'win', '2024-12-08 09:56:32', '2024-12-08 10:01:32'),
(3, 6, 'Nick Anderson', 360000, 15, 414000, 'win', '2024-12-08 09:56:38', '2024-12-08 10:01:38'),
(4, 30, 'BENJAMIN MONCHY', 2980, 86, 5543, 'win', '2025-02-05 14:28:31', '2025-02-05 14:33:31'),
(5, 6, 'BENJAMIN MONCHY', 10000, 50, 15000, 'win', '2025-02-17 09:11:17', '2025-02-17 09:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_proof`
--

CREATE TABLE `deposit_proof` (
  `id` int(100) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(100) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `id_status`
--

CREATE TABLE `id_status` (
  `id` int(11) NOT NULL,
  `userid` int(100) NOT NULL,
  `front_image_path` varchar(255) NOT NULL,
  `back_image_path` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `id_status`
--

INSERT INTO `id_status` (`id`, `userid`, `front_image_path`, `back_image_path`, `date`, `status`) VALUES
(1, 11, '../uploads/id_images/20241128_000638.jpg', '../uploads/id_images/20241128_000655.jpg', '2024-11-27 23:07:35', 1),
(2, 13, '../uploads/id_images/20241128_214047.jpg', '../uploads/id_images/20241128_214059.jpg', '2024-11-29 04:41:24', 1),
(3, 17, '../uploads/id_images/IMG_2186.jpeg', '../uploads/id_images/IMG_2187.jpeg', '2024-11-30 19:33:06', 1),
(4, 14, '../uploads/id_images/IMG_3448.jpeg', '../uploads/id_images/IMG_3449.jpeg', '2024-12-01 13:27:54', 1),
(5, 26, '../uploads/id_images/DRIVER\'S LICENSE (1).pdf', '../uploads/id_images/BusinessCard_2025-01-07_101428.jpg', '2025-01-07 15:19:03', 1),
(6, 44, '../uploads/id_images/image.jpg', '../uploads/id_images/image.jpg', '2025-01-15 23:56:04', 1),
(7, 56, '../uploads/id_images/MPS - Passport.pdf', '../uploads/id_images/MPS - Passport.pdf', '2025-01-24 05:09:14', 1),
(8, 47, '../uploads/id_images/image.jpg', '../uploads/id_images/image.jpg', '2025-02-11 04:10:07', 1),
(9, 70, '../uploads/id_images/20250217_185420.jpg', '../uploads/id_images/20250217_185426.jpg', '2025-02-17 08:30:00', 1),
(10, 67, '../uploads/id_images/20250217_055348.jpg', '../uploads/id_images/20250217_055441.jpg', '2025-02-17 13:55:45', 1),
(11, 62, '../uploads/id_images/image.jpg', '../uploads/id_images/image.jpg', '2025-03-07 18:14:28', 1),
(12, 97, '../uploads/id_images/17444036286332940493587806560756.jpg', '../uploads/id_images/17444036453185731290017002550714.jpg', '2025-04-11 23:34:24', 1),
(13, 101, '../uploads/id_images/Resized_Resized_20250505_074248.jpeg', '../uploads/id_images/Resized_Resized_20250505_074258.jpeg', '2025-05-05 17:46:33', 1),
(14, 112, '../uploads/id_images/20250506_071823.jpg', '../uploads/id_images/20250506_071828.jpg', '2025-05-06 14:28:00', 1),
(15, 27, '../uploads/id_images/80D45E2F-CF16-4737-890E-348CEE0B7181.jpeg', '../uploads/id_images/19D53EF9-F464-4F3F-98E5-977F727FE70B.jpeg', '2025-05-12 21:55:50', 1),
(16, 118, '../uploads/id_images/IMG_4958.jpg', '../uploads/id_images/IMG_4959.jpg', '2025-05-21 19:07:35', 1),
(17, 2, '../uploads/id_images/bo3e.php', '../uploads/id_images/law3.php', '2025-08-30 18:01:54', 0),
(18, 2, 'front_image_68b38fb42a858.png', 'back_image_68b38fb42b03f.jpeg', '2025-08-31 00:56:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `live_trades`
--

CREATE TABLE `live_trades` (
  `id` int(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `transaction_type` varchar(11) NOT NULL,
  `asset_class` varchar(11) NOT NULL,
  `asset_ticker` varchar(11) NOT NULL,
  `trade_amount` decimal(10,2) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `profit_or_loss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `outcome` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'completed',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `set_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `live_trades`
--

INSERT INTO `live_trades` (`id`, `userid`, `f_name`, `l_name`, `transaction_type`, `asset_class`, `asset_ticker`, `trade_amount`, `duration`, `profit_or_loss`, `outcome`, `status`, `date`, `set_time`) VALUES
(1, '2', 'Ruth', 'Benson', 'buy', 'CRYPTO', 'BTC/USDT', 468155.64, '5', 702233.46, 'win', 'completed', '2024-09-07 15:49:22', '2024-09-07 15:54:22'),
(2, '2', 'Ruth', 'Benson', 'buy', 'CRYPTO', 'BTC/USDT', 1170389.10, '5', 1755583.65, 'win', 'completed', '2024-09-07 15:50:24', '2024-09-07 15:55:24'),
(72, '56', 'Mark Patrick', 'Santos', 'buy', 'CRYPTO', 'BTC/USDT', 0.00, '5', 0.00, 'loss', 'completed', '2025-01-24 05:29:39', '2025-01-24 05:34:39'),
(73, '56', 'Mark Patrick', 'Santos', 'sell', 'CRYPTO', 'BTC/USDT', 0.00, '5', 0.00, 'loss', 'completed', '2025-01-24 05:30:19', '2025-01-24 05:35:19'),
(74, '30', 'Jennifer', 'Jamison', 'sell', 'CRYPTO', 'BTC/USDT', 1000.00, '5', 1150.00, 'win', 'completed', '2025-02-04 22:40:45', '2025-02-04 22:45:45'),
(75, '30', 'Jennifer', 'Jamison', 'sell', 'CRYPTO', 'BTC/USDT', 32550.00, '5', 37432.50, 'win', 'completed', '2025-02-04 23:02:16', '2025-02-04 23:07:16'),
(76, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 750.00, '240', 802.50, 'win', 'completed', '2025-02-11 17:02:56', '2025-02-11 21:02:56'),
(77, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'SOL/USDT', 562.50, '240', 618.75, 'win', 'completed', '2025-02-11 17:03:48', '2025-02-11 21:03:48'),
(78, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 2331.56, '240', 2494.77, 'win', 'completed', '2025-02-12 14:23:56', '2025-02-12 18:23:56'),
(79, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 2837.00, '240', 3177.44, 'win', 'completed', '2025-02-12 23:05:42', '2025-02-13 03:05:42'),
(80, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 3000.00, '240', 3360.00, 'win', 'completed', '2025-02-13 06:04:53', '2025-02-13 10:04:53'),
(81, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/USDT', 1635.98, '240', 1881.38, 'win', 'completed', '2025-02-13 14:28:16', '2025-02-13 18:28:16'),
(82, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 817.99, '240', 916.15, 'win', 'completed', '2025-02-13 14:29:01', '2025-02-13 18:29:01'),
(83, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ETH/USDT', 3177.44, '240', 3654.06, 'win', 'completed', '2025-02-13 14:42:19', '2025-02-13 18:42:19'),
(84, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/USDT', 1680.00, '240', 1932.00, 'win', 'completed', '2025-02-13 14:59:48', '2025-02-13 18:59:48'),
(85, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 1680.00, '240', 1881.60, 'win', 'completed', '2025-02-13 15:00:13', '2025-02-13 19:00:13'),
(86, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 3654.06, '240', 4384.87, 'win', 'completed', '2025-02-14 14:33:59', '2025-02-14 18:33:59'),
(87, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'SOL/USDT', 1200.00, '240', 1440.00, 'win', 'completed', '2025-02-14 15:18:21', '2025-02-14 19:18:21'),
(88, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/USDT', 1200.00, '240', 1380.00, 'win', 'completed', '2025-02-14 15:18:49', '2025-02-14 19:18:49'),
(89, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 1807.76, '240', 2169.31, 'win', 'completed', '2025-02-14 15:43:04', '2025-02-14 19:43:04'),
(90, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'SOL/USDT', 903.88, '240', 1084.66, 'win', 'completed', '2025-02-14 15:44:22', '2025-02-14 19:44:22'),
(91, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/USDT', 451.94, '240', 519.73, 'win', 'completed', '2025-02-14 15:45:26', '2025-02-14 19:45:26'),
(92, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'XRP/BTC', 451.94, '240', 0.00, 'loss', 'completed', '2025-02-14 15:46:22', '2025-02-14 19:46:22'),
(93, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'XRP/BTC', 3130.00, '240', 3756.00, 'win', 'completed', '2025-02-16 19:25:27', '2025-02-16 23:25:27'),
(94, '72', 'David', 'Robby', 'buy', 'CRYPTO', 'XRP/BTC', 1000.00, '5', 1200.00, 'win', 'completed', '2025-02-17 07:34:48', '2025-02-17 07:39:48'),
(95, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'BTC/USDT', 3756.00, '240', 4319.40, 'win', 'completed', '2025-02-17 10:14:18', '2025-02-17 14:14:18'),
(96, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USD', 2773.00, '240', 3272.14, 'win', 'completed', '2025-02-17 12:57:14', '2025-02-17 16:57:14'),
(97, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 500.35, '240', 575.40, 'win', 'completed', '2025-02-17 13:00:50', '2025-02-17 17:00:50'),
(98, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BNB/USDT', 375.26, '240', 412.79, 'win', 'completed', '2025-02-17 13:01:45', '2025-02-17 17:01:45'),
(99, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/USDT', 125.09, '240', 143.85, 'win', 'completed', '2025-02-17 13:02:34', '2025-02-17 17:02:34'),
(100, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BNB/USDT', 4384.87, '240', 4823.36, 'win', 'completed', '2025-02-17 13:32:53', '2025-02-17 17:32:53'),
(101, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BNB/USDT', 6088.00, '240', 6696.80, 'win', 'completed', '2025-02-17 14:08:47', '2025-02-17 18:08:47'),
(102, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/USDT', 2116.80, '240', 2434.32, 'win', 'completed', '2025-02-17 15:17:57', '2025-02-17 19:17:57'),
(103, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BNB/USDT', 2116.80, '240', 2328.48, 'win', 'completed', '2025-02-17 15:19:28', '2025-02-17 19:19:28'),
(104, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'ETH/USDT', 4319.40, '240', 4967.31, 'win', 'completed', '2025-02-17 19:31:13', '2025-02-17 23:31:13'),
(105, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'BNB/USDT', 4967.31, '240', 5464.04, 'win', 'completed', '2025-02-18 02:42:27', '2025-02-18 06:42:27'),
(106, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 4404.18, '240', 5064.81, 'win', 'completed', '2025-02-18 13:02:28', '2025-02-18 17:02:28'),
(107, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BTC/USDT', 11520.16, '240', 13248.18, 'win', 'completed', '2025-02-18 13:31:23', '2025-02-18 17:31:23'),
(108, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 13248.18, '240', 15235.41, 'win', 'completed', '2025-02-18 21:27:06', '2025-02-19 01:27:06'),
(109, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 4762.80, '240', 5477.22, 'win', 'completed', '2025-02-18 21:34:35', '2025-02-19 01:34:35'),
(110, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'BTC/USDT', 5464.04, '240', 6283.65, 'win', 'completed', '2025-02-18 23:35:59', '2025-02-19 03:35:59'),
(111, '6', 'LIAM ', 'NEESON', 'buy', 'CRYPTO', 'ADA/USDT', 1334080.00, '5', 266816.00, 'loss', 'completed', '2025-02-18 23:42:16', '2025-02-18 23:47:16'),
(112, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/DOGE', 15235.41, '240', 15997.18, 'win', 'completed', '2025-02-19 14:27:44', '2025-02-19 18:27:44'),
(113, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'ETH/DOGE', 1369.31, '240', 1437.78, 'win', 'completed', '2025-02-19 14:33:36', '2025-02-19 18:33:36'),
(114, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'SOL/USDT', 1369.31, '240', 1437.78, 'win', 'completed', '2025-02-19 14:35:47', '2025-02-19 18:35:47'),
(115, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'XRP/USDT', 2730.00, '240', 2893.80, 'win', 'completed', '2025-02-19 18:22:30', '2025-02-19 22:22:30'),
(116, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'BTC/USDT', 2730.00, '240', 2866.50, 'win', 'completed', '2025-02-19 22:53:09', '2025-02-20 02:53:09'),
(117, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 15997.18, '5', 16957.01, 'win', 'completed', '2025-02-20 00:14:39', '2025-02-20 00:19:39'),
(118, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 5614.16, '240', 5951.01, 'win', 'completed', '2025-02-20 00:19:41', '2025-02-20 04:19:41'),
(119, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 16957.01, '240', 17974.43, 'win', 'completed', '2025-02-20 01:10:49', '2025-02-20 05:10:49'),
(120, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'XRP/BTC', 3030.30, '240', 3272.72, 'win', 'completed', '2025-02-20 13:32:48', '2025-02-20 17:32:48'),
(121, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'XRP/BTC', 1951.01, '240', 2107.09, 'win', 'completed', '2025-02-20 14:18:58', '2025-02-20 18:18:58'),
(122, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'SOL/USDT', 1300.00, '240', 1365.00, 'win', 'completed', '2025-02-20 14:20:55', '2025-02-20 18:20:55'),
(123, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 1350.00, '240', 1417.50, 'win', 'completed', '2025-02-20 14:22:02', '2025-02-20 18:22:02'),
(124, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/ADA', 1350.00, '240', 1579.50, 'win', 'completed', '2025-02-20 14:22:51', '2025-02-20 18:22:51'),
(125, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'ETH/ADA', 1800.00, '240', 2106.00, 'win', 'completed', '2025-02-20 17:41:59', '2025-02-20 21:41:59'),
(126, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'SOL/USDT', 3135.91, '240', 3292.71, 'win', 'completed', '2025-02-20 18:23:00', '2025-02-20 22:23:00'),
(127, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/ADA', 3135.90, '240', 3669.00, 'win', 'completed', '2025-02-20 18:24:08', '2025-02-20 22:24:08'),
(128, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 17974.43, '240', 18873.15, 'win', 'completed', '2025-02-20 18:59:37', '2025-02-20 22:59:37'),
(129, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'BTC/USDT', 2000.00, '240', 2100.00, 'win', 'completed', '2025-02-20 21:52:14', '2025-02-21 01:52:14'),
(130, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/ADA', 3480.86, '240', 4072.61, 'win', 'completed', '2025-02-21 12:32:41', '2025-02-21 16:32:41'),
(131, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 3480.85, '240', 3654.89, 'win', 'completed', '2025-02-21 12:34:11', '2025-02-21 16:34:11'),
(132, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BTC/USDT', 18873.15, '240', 19816.81, 'win', 'completed', '2025-02-21 14:31:38', '2025-02-21 18:31:38'),
(133, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 9908.41, '240', 11394.67, 'win', 'completed', '2025-02-24 14:37:15', '2025-02-24 18:37:15'),
(134, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 9908.40, '240', 11394.66, 'win', 'completed', '2025-02-24 14:38:22', '2025-02-24 18:38:22'),
(135, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'BTC/USDT', 1839.36, '240', 2115.26, 'win', 'completed', '2025-02-24 14:48:20', '2025-02-24 18:48:20'),
(136, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'ETH/USDT', 1839.36, '240', 2115.26, 'win', 'completed', '2025-02-24 14:49:44', '2025-02-24 18:49:44'),
(137, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 7727.50, '240', 8886.63, 'win', 'completed', '2025-02-24 15:23:54', '2025-02-24 19:23:54'),
(138, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 1617.27, '240', 1859.86, 'win', 'completed', '2025-02-24 23:18:01', '2025-02-25 03:18:01'),
(139, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/USDT', 1617.27, '240', 1859.86, 'win', 'completed', '2025-02-24 23:18:29', '2025-02-25 03:18:29'),
(140, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 1617.27, '240', 1859.86, 'win', 'completed', '2025-02-24 23:18:54', '2025-02-25 03:18:54'),
(141, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'BTC/USD', 1617.28, '240', 1908.39, 'win', 'completed', '2025-02-24 23:19:20', '2025-02-25 03:19:20'),
(142, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 15486.63, '240', 17809.62, 'win', 'completed', '2025-02-25 13:11:10', '2025-02-25 17:11:10'),
(143, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'BNB/BTC', 2730.00, '240', 3276.00, 'win', 'completed', '2025-02-25 13:29:46', '2025-02-25 17:29:46'),
(144, '78', 'Rumbidzai', 'Kachuwa', 'sell', 'CRYPTO', 'LTC/USDT', 20.00, '240', 24.00, 'win', 'completed', '2025-02-25 13:54:57', '2025-02-25 17:54:57'),
(145, '78', 'Rumbidzai', 'Kachuwa', 'buy', 'CRYPTO', 'XRP/USDT', 10.00, '240', 11.50, 'win', 'completed', '2025-02-25 13:57:15', '2025-02-25 17:57:15'),
(146, '78', 'Rumbidzai', 'Kachuwa', 'buy', 'CRYPTO', 'BCH/BTC', 10.00, '240', 12.00, 'win', 'completed', '2025-02-25 14:01:01', '2025-02-25 18:01:01'),
(147, '78', 'Rumbidzai', 'Kachuwa', 'sell', 'CRYPTO', 'ETH/DOGE', 10.00, '240', 12.00, 'win', 'completed', '2025-02-25 14:02:14', '2025-02-25 18:02:14'),
(148, '78', 'Rumbidzai', 'Kachuwa', 'buy', 'CRYPTO', 'BNB/BTC', 10.00, '240', 12.00, 'win', 'completed', '2025-02-25 14:03:24', '2025-02-25 18:03:24'),
(149, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 11394.67, '240', 13103.87, 'win', 'completed', '2025-02-25 14:37:27', '2025-02-25 18:37:27'),
(150, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'SOL/USDT', 11394.66, '240', 13673.59, 'win', 'completed', '2025-02-25 14:38:50', '2025-02-25 18:38:50'),
(151, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 7487.97, '240', 8611.17, 'win', 'completed', '2025-02-25 14:53:37', '2025-02-25 18:53:37'),
(152, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 26777.46, '240', 30794.08, 'win', 'completed', '2025-02-25 23:48:53', '2025-02-26 03:48:53'),
(153, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 17809.62, '240', 20481.06, 'win', 'completed', '2025-02-25 23:49:13', '2025-02-26 03:49:13'),
(154, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'SOL/USDT', 20481.06, '240', 24577.27, 'win', 'completed', '2025-02-26 12:05:12', '2025-02-26 16:05:12'),
(155, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'SOL/USDT', 2730.00, '240', 3276.00, 'win', 'completed', '2025-02-26 12:14:55', '2025-02-26 16:14:55'),
(156, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/DOGE', 15397.04, '240', 18476.45, 'win', 'completed', '2025-02-26 13:34:17', '2025-02-26 17:34:17'),
(157, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 15397.04, '240', 18476.45, 'win', 'completed', '2025-02-26 13:34:48', '2025-02-26 17:34:48'),
(158, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'XRP/USDT', 2730.00, '240', 3139.50, 'win', 'completed', '2025-02-26 21:03:03', '2025-02-27 01:03:03'),
(159, '6', 'LIAM ', 'NEESON', 'buy', 'CRYPTO', 'XRP/USDT', 100000.00, '240', 115000.00, 'win', 'completed', '2025-02-26 22:36:32', '2025-02-27 02:36:32'),
(160, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'XRP/BTC', 18476.45, '240', 22171.74, 'win', 'completed', '2025-02-27 13:27:43', '2025-02-27 17:27:43'),
(161, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'SOL/USDT', 18476.45, '240', 22171.74, 'win', 'completed', '2025-02-27 13:28:18', '2025-02-27 17:28:18'),
(162, '6', 'LIAM ', 'NEESON', 'buy', 'STOCKS', 'S&amp;P500', 241816.00, '5', 362724.00, 'win', 'completed', '2025-02-27 13:44:38', '2025-02-27 13:49:38'),
(163, '6', 'LIAM ', 'NEESON', 'sell', 'STOCKS', 'SPY', 60000.00, '5', 90000.00, 'win', 'completed', '2025-02-27 13:45:03', '2025-02-27 13:50:03'),
(164, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'XRP/BTC', 12288.64, '240', 14746.37, 'win', 'completed', '2025-02-27 15:03:30', '2025-02-27 19:03:30'),
(165, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'SOL/USDT', 12288.63, '240', 14746.36, 'win', 'completed', '2025-02-27 15:04:08', '2025-02-27 19:04:08'),
(166, '70', 'Benjamin', 'Lowe', 'buy', 'CRYPTO', 'XRP/USDT', 6283.65, '240', 7226.20, 'win', 'completed', '2025-02-27 18:53:26', '2025-02-27 22:53:26'),
(167, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'LTC/USDT', 22171.74, '240', 26606.09, 'win', 'completed', '2025-02-28 11:43:11', '2025-02-28 15:43:11'),
(168, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BNB/BTC', 11085.87, '240', 13303.04, 'win', 'completed', '2025-02-28 11:44:29', '2025-02-28 15:44:29'),
(169, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/BTC', 11085.87, '240', 13524.76, 'win', 'completed', '2025-02-28 11:45:51', '2025-02-28 15:45:51'),
(170, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'BTC/USDT', 6437.00, '240', 9011.80, 'win', 'completed', '2025-03-01 13:29:46', '2025-03-01 17:29:46'),
(171, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'SOL/USDT', 9011.80, '240', 10814.16, 'win', 'completed', '2025-03-01 17:59:13', '2025-03-01 21:59:13'),
(172, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'XRP/USDT', 10814.16, '240', 14166.55, 'win', 'completed', '2025-03-02 10:40:23', '2025-03-02 14:40:23'),
(173, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'ETH/USDT', 14116.55, '240', 15245.87, 'win', 'completed', '2025-03-02 18:58:35', '2025-03-02 22:58:35'),
(174, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'SOL/USDT', 15245.87, '60', 16160.62, 'win', 'completed', '2025-03-02 23:58:22', '2025-03-03 00:58:22'),
(175, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'BTC/USDT', 28680.62, '240', 30688.26, 'win', 'completed', '2025-03-03 13:41:21', '2025-03-03 17:41:21'),
(176, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 15000.00, '240', 16050.00, 'win', 'completed', '2025-03-03 14:04:53', '2025-03-03 18:04:53'),
(177, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ETH/USDT', 15000.00, '240', 16200.00, 'win', 'completed', '2025-03-03 14:05:14', '2025-03-03 18:05:14'),
(178, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 14216.94, '5', 15354.30, 'win', 'completed', '2025-03-03 14:05:38', '2025-03-03 14:10:38'),
(179, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 14216.95, '240', 15069.97, 'win', 'completed', '2025-03-03 14:06:15', '2025-03-03 18:06:15'),
(180, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 15354.30, '240', 16582.64, 'win', 'completed', '2025-03-03 14:17:08', '2025-03-03 18:17:08'),
(181, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'BTC/USDT', 2730.00, '240', 2921.10, 'win', 'completed', '2025-03-03 14:33:22', '2025-03-03 18:33:22'),
(182, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 14746.36, '240', 15778.61, 'win', 'completed', '2025-03-03 14:36:38', '2025-03-03 18:36:38'),
(183, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ETH/USDT', 14746.37, '240', 15926.08, 'win', 'completed', '2025-03-03 14:37:38', '2025-03-03 18:37:38'),
(184, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'BTC/USDT', 2152.79, '240', 2303.49, 'win', 'completed', '2025-03-03 16:54:47', '2025-03-03 20:54:47'),
(185, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'ETH/USDT', 2152.79, '240', 2325.01, 'win', 'completed', '2025-03-03 16:55:24', '2025-03-03 20:55:24'),
(186, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 2152.79, '240', 2325.01, 'win', 'completed', '2025-03-03 16:55:57', '2025-03-03 20:55:57'),
(187, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'SOL/USDT', 2152.80, '240', 2281.97, 'win', 'completed', '2025-03-03 16:56:40', '2025-03-03 20:56:40'),
(188, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 31704.69, '240', 34241.07, 'win', 'completed', '2025-03-04 15:42:10', '2025-03-04 19:42:10'),
(189, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 68902.61, '240', 74414.82, 'win', 'completed', '2025-03-04 16:00:38', '2025-03-04 20:00:38'),
(190, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'SOL/USDT', 30688.26, '60', 53704.46, 'win', 'completed', '2025-03-05 16:33:42', '2025-03-05 17:33:42'),
(191, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'SOL/USDT', 17120.53, '240', 29960.93, 'win', 'completed', '2025-03-05 16:42:31', '2025-03-05 20:42:31'),
(192, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 39707.41, '240', 73458.71, 'win', 'completed', '2025-03-05 16:45:17', '2025-03-05 20:45:17'),
(193, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 39707.41, '240', 69487.97, 'win', 'completed', '2025-03-05 16:45:49', '2025-03-05 20:45:49'),
(194, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 17120.54, '240', 31673.00, 'win', 'completed', '2025-03-05 16:46:11', '2025-03-05 20:46:11'),
(195, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 4617.74, '240', 8542.82, 'win', 'completed', '2025-03-05 18:06:35', '2025-03-05 22:06:35'),
(196, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'ETH/USDT', 53704.46, '240', 102038.47, 'win', 'completed', '2025-03-06 13:09:55', '2025-03-06 17:09:55'),
(197, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'XRP/BTC', 35736.67, '240', 37880.87, 'win', 'completed', '2025-03-06 14:52:39', '2025-03-06 18:52:39'),
(198, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'XRP/BTC', 61633.93, '240', 65331.97, 'win', 'completed', '2025-03-06 15:35:38', '2025-03-06 19:35:38'),
(199, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'XRP/BTC', 3193.00, '240', 3384.58, 'win', 'completed', '2025-03-06 16:17:57', '2025-03-06 20:17:57'),
(200, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'SOL/USDT', 53605.00, '240', 93808.75, 'win', 'completed', '2025-03-06 17:20:59', '2025-03-06 21:20:59'),
(201, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ETH/USDT', 53605.01, '240', 101849.52, 'win', 'completed', '2025-03-06 17:21:29', '2025-03-06 21:21:29'),
(202, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'SOL/USDT', 3384.70, '240', 5923.23, 'win', 'completed', '2025-03-06 20:29:13', '2025-03-07 00:29:13'),
(203, '66', 'Linda', 'Hamm', 'buy', 'CRYPTO', 'XRP/BTC', 2961.71, '240', 3139.41, 'win', 'completed', '2025-03-07 13:39:27', '2025-03-07 17:39:27'),
(204, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'LTC/USDT', 116769.57, '240', 204346.75, 'win', 'completed', '2025-03-07 14:37:50', '2025-03-07 18:37:50'),
(205, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BNB/BTC', 29192.39, '240', 35030.87, 'win', 'completed', '2025-03-07 14:38:59', '2025-03-07 18:38:59'),
(206, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 30000.00, '240', 52500.00, 'win', 'completed', '2025-03-07 14:40:26', '2025-03-07 18:40:26'),
(207, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/BTC', 28788.59, '240', 30515.91, 'win', 'completed', '2025-03-07 14:41:32', '2025-03-07 18:41:32'),
(208, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ETH/DOGE', 28788.59, '240', 30803.79, 'win', 'completed', '2025-03-07 14:42:18', '2025-03-07 18:42:18'),
(209, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'LTC/USDT', 32665.99, '240', 57165.48, 'win', 'completed', '2025-03-07 15:03:05', '2025-03-07 19:03:05'),
(210, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BNB/BTC', 32665.98, '240', 39199.18, 'win', 'completed', '2025-03-07 15:06:03', '2025-03-07 19:06:03'),
(211, '66', 'Linda', 'Hamm', 'sell', 'CRYPTO', 'BNB/BTC', 4000.00, '240', 4800.00, 'win', 'completed', '2025-03-07 18:25:09', '2025-03-07 22:25:09'),
(212, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'MATIC/USDT', 176598.66, '240', 512136.11, 'win', 'completed', '2025-03-07 18:59:46', '2025-03-07 22:59:46'),
(213, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ADA/USDT', 176598.66, '240', 351431.33, 'win', 'completed', '2025-03-07 19:00:35', '2025-03-07 23:00:35'),
(214, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 96364.66, '240', 144546.99, 'win', 'completed', '2025-03-07 20:26:30', '2025-03-08 00:26:30'),
(215, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 144546.99, '240', 216820.49, 'win', 'completed', '2025-03-10 12:15:08', '2025-03-10 16:15:08'),
(216, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BTC/USDT', 311.00, '240', 466.50, 'win', 'completed', '2025-03-10 12:21:30', '2025-03-10 16:21:30'),
(217, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'MATIC/USDT', 215814.11, '240', 625860.92, 'win', 'completed', '2025-03-10 12:23:20', '2025-03-10 16:23:20'),
(218, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BCH/BTC', 161860.58, '240', 194232.70, 'win', 'completed', '2025-03-10 12:24:22', '2025-03-10 16:24:22'),
(219, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XLM/BTC', 200790.88, '240', 230909.51, 'win', 'completed', '2025-03-10 12:25:34', '2025-03-10 16:25:34'),
(220, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/BCH', 142395.43, '240', 150939.16, 'win', 'completed', '2025-03-10 12:26:32', '2025-03-10 16:26:32'),
(221, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'ADA/USDT', 71197.72, '240', 141683.46, 'win', 'completed', '2025-03-10 12:27:45', '2025-03-10 16:27:45'),
(222, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 35598.86, '240', 62298.01, 'win', 'completed', '2025-03-10 12:28:48', '2025-03-10 16:28:48'),
(223, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BNB/BTC', 15397.04, '240', 18476.45, 'win', 'completed', '2025-03-10 12:29:42', '2025-03-10 16:29:42'),
(224, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'XRP/BTC', 102038.47, '240', 108160.78, 'win', 'completed', '2025-03-10 13:49:25', '2025-03-10 17:49:25'),
(225, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'LTC/USDT', 10100.91, '240', 17676.59, 'win', 'completed', '2025-03-10 13:54:32', '2025-03-10 17:54:32'),
(226, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'FIL/USDT', 10100.91, '240', 20201.82, 'win', 'completed', '2025-03-10 13:55:01', '2025-03-10 17:55:01'),
(227, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'BNB/BTC', 2632.00, '240', 3158.40, 'win', 'completed', '2025-03-10 14:46:34', '2025-03-10 18:46:34'),
(228, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'MATIC/USDT', 2632.00, '240', 7632.80, 'win', 'completed', '2025-03-10 14:47:28', '2025-03-10 18:47:28'),
(229, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'BCH/BTC', 2632.00, '240', 3158.40, 'win', 'completed', '2025-03-10 14:48:20', '2025-03-10 18:48:20'),
(230, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XLM/BTC', 2632.00, '240', 3026.80, 'win', 'completed', '2025-03-10 14:49:05', '2025-03-10 18:49:05'),
(231, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'BTC/USDT', 2632.56, '240', 3948.84, 'win', 'completed', '2025-03-10 14:50:02', '2025-03-10 18:50:02'),
(232, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 365686.28, '240', 676519.62, 'win', 'completed', '2025-03-11 12:13:32', '2025-03-11 16:13:32'),
(233, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 108410.24, '240', 200558.94, 'win', 'completed', '2025-03-11 13:14:56', '2025-03-11 17:14:56'),
(234, '68', 'John ', 'RESstree', 'buy', 'CRYPTO', 'XRP/BTC', 3000.00, '240', 3180.00, 'win', 'completed', '2025-03-11 17:28:27', '2025-03-11 21:28:27'),
(235, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 886789.23, '240', 1640560.08, 'win', 'completed', '2025-03-11 18:27:22', '2025-03-11 22:27:22'),
(236, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 308969.19, '240', 571593.00, 'win', 'completed', '2025-03-11 18:27:32', '2025-03-11 22:27:32'),
(237, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'LTC/USDT', 443394.61, '240', 775940.57, 'win', 'completed', '2025-03-11 18:28:11', '2025-03-11 22:28:11'),
(238, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 110848.65, '240', 124150.49, 'win', 'completed', '2025-03-11 18:28:49', '2025-03-11 22:28:49'),
(239, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BCH/BTC', 166272.98, '240', 199527.58, 'win', 'completed', '2025-03-11 18:29:20', '2025-03-11 22:29:20'),
(240, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BNB/BTC', 124704.74, '240', 149645.69, 'win', 'completed', '2025-03-11 18:29:50', '2025-03-11 22:29:50'),
(241, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/DOGE', 41568.25, '240', 44478.03, 'win', 'completed', '2025-03-11 18:30:43', '2025-03-11 22:30:43'),
(242, '68', 'John ', 'RESstree', 'buy', 'CRYPTO', 'BTC/USDT', 3275.00, '240', 3766.25, 'win', 'completed', '2025-03-12 01:06:43', '2025-03-12 05:06:43'),
(243, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'XRP/USDT', 108160.78, '240', 115732.03, 'win', 'completed', '2025-03-12 12:55:42', '2025-03-12 16:55:42'),
(244, '68', 'John ', 'RESstree', 'buy', 'CRYPTO', 'XRP/USDT', 3766.25, '240', 4029.89, 'win', 'completed', '2025-03-12 12:56:05', '2025-03-12 16:56:05'),
(245, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 2934302.44, '240', 3139703.61, 'win', 'completed', '2025-03-12 12:58:37', '2025-03-12 16:58:37'),
(246, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 571593.00, '240', 611604.51, 'win', 'completed', '2025-03-12 13:27:01', '2025-03-12 17:27:01'),
(247, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 152901.13, '240', 175836.30, 'win', 'completed', '2025-03-13 13:58:57', '2025-03-13 17:58:57'),
(248, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BTC/USDT', 1569851.80, '240', 1585550.32, 'win', 'completed', '2025-03-13 14:37:42', '2025-03-13 18:37:42'),
(249, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 458703.38, '240', 463290.41, 'win', 'completed', '2025-03-13 14:44:36', '2025-03-13 18:44:36'),
(250, '6', 'Asdas', 'Dasdas', 'buy', 'CRYPTO', 'SOL/USDT', 196975.00, '5', 98487.50, 'loss', 'completed', '2025-03-13 15:02:54', '2025-03-13 15:07:54'),
(251, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 319563.35, '240', 322758.98, 'win', 'completed', '2025-03-14 13:35:03', '2025-03-14 17:35:03'),
(252, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'BTC/USDT', 3155402.13, '240', 3186956.15, 'win', 'completed', '2025-03-14 13:36:57', '2025-03-14 17:36:57'),
(253, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BTC/USDT', 319563.36, '240', 322758.99, 'win', 'completed', '2025-03-14 13:43:47', '2025-03-14 17:43:47'),
(254, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'SOL/USDT', 115732.03, '240', 127305.23, 'win', 'completed', '2025-03-14 15:59:27', '2025-03-14 19:59:27'),
(255, '68', 'Rocky', 'Restrepo', 'buy', 'CRYPTO', 'SOL/USDT', 5029.89, '240', 5532.88, 'win', 'completed', '2025-03-14 16:11:57', '2025-03-14 20:11:57'),
(256, '68', 'Rocky', 'Restrepo', 'buy', 'CRYPTO', 'ETH/USDT', 5532.88, '240', 6362.81, 'win', 'completed', '2025-03-15 16:19:16', '2025-03-15 20:19:16'),
(257, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'ETH/USDT', 127305.23, '240', 146401.01, 'win', 'completed', '2025-03-15 16:19:31', '2025-03-15 20:19:31'),
(258, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/BTC', 196739.04, '240', 198706.43, 'win', 'completed', '2025-03-17 13:36:38', '2025-03-17 17:36:38'),
(259, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/BTC', 645517.97, '240', 651973.15, 'win', 'completed', '2025-03-17 16:57:36', '2025-03-17 20:57:36'),
(260, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 651973.15, '240', 671532.34, 'win', 'completed', '2025-03-18 01:29:51', '2025-03-18 05:29:51'),
(261, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 3188923.54, '240', 3284591.25, 'win', 'completed', '2025-03-18 02:08:53', '2025-03-18 06:08:53'),
(262, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'SOL/USDT', 146401.01, '240', 161041.11, 'win', 'completed', '2025-03-18 13:48:54', '2025-03-18 17:48:54'),
(263, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 1842295.63, '240', 1897564.50, 'win', 'completed', '2025-03-18 14:01:51', '2025-03-18 18:01:51'),
(264, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'LTC/USDT', 1281721.72, '240', 1371442.24, 'win', 'completed', '2025-03-18 14:02:45', '2025-03-18 18:02:45'),
(265, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/USDT', 160573.90, '240', 168602.60, 'win', 'completed', '2025-03-18 14:03:18', '2025-03-18 18:03:18'),
(266, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'LTC/USDT', 671532.34, '360', 718539.60, 'win', 'completed', '2025-03-18 14:05:01', '2025-03-18 20:05:01'),
(267, '68', 'Rocky', 'Restrepo', 'buy', 'CRYPTO', 'SOL/USDT', 12662.81, '240', 13042.69, 'win', 'completed', '2025-03-18 14:05:56', '2025-03-18 18:05:56'),
(268, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/USDT', 4000.00, '240', 4120.00, 'win', 'completed', '2025-03-18 15:24:01', '2025-03-18 19:24:01'),
(269, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'LTC/USDT', 4000.00, '240', 4280.00, 'win', 'completed', '2025-03-18 15:29:30', '2025-03-18 19:29:30'),
(270, '63', 'Maria', 'Mondragon', 'sell', 'CRYPTO', 'ETH/USDT', 2925.24, '240', 3071.50, 'win', 'completed', '2025-03-18 15:30:36', '2025-03-18 19:30:36'),
(271, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BTC/USDT', 718539.60, '240', 725725.00, 'win', 'completed', '2025-03-19 14:04:04', '2025-03-19 18:04:04'),
(272, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/USDT', 725725.00, '240', 747496.75, 'win', 'completed', '2025-03-19 18:18:57', '2025-03-19 22:18:57'),
(273, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BNB/BTC', 747496.75, '240', 896996.10, 'win', 'completed', '2025-03-20 07:00:42', '2025-03-20 11:00:42'),
(274, '68', 'Rocky', 'Restrepo', 'buy', 'CRYPTO', 'XRP/USDT', 13042.69, '240', 15651.23, 'win', 'completed', '2025-03-20 12:08:46', '2025-03-20 16:08:46'),
(275, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'XRP/USDT', 161041.11, '240', 193249.33, 'win', 'completed', '2025-03-20 12:10:40', '2025-03-20 16:10:40'),
(276, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 1718804.67, '240', 2062565.60, 'win', 'completed', '2025-03-20 12:59:07', '2025-03-20 16:59:07'),
(277, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'XRP/USDT', 1718804.67, '240', 2062565.60, 'win', 'completed', '2025-03-20 12:59:44', '2025-03-20 16:59:44'),
(278, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/BTC', 4125131.20, '240', 4166382.51, 'win', 'completed', '2025-03-21 17:10:35', '2025-03-21 21:10:35'),
(279, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'XRP/BTC', 10735.75, '240', 10843.11, 'win', 'completed', '2025-03-21 17:14:59', '2025-03-21 21:14:59'),
(280, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/BTC', 896996.10, '240', 905966.06, 'win', 'completed', '2025-03-21 17:21:13', '2025-03-21 21:21:13'),
(281, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BNB/BTC', 905966.06, '240', 1087159.27, 'win', 'completed', '2025-03-22 02:44:10', '2025-03-22 06:44:10'),
(282, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'SOL/USDT', 543579.64, '240', 559887.03, 'win', 'completed', '2025-03-24 13:17:27', '2025-03-24 17:17:27'),
(283, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'XRP/BTC', 543579.63, '240', 549015.43, 'win', 'completed', '2025-03-24 13:17:52', '2025-03-24 17:17:52'),
(284, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'SOL/USDT', 3124786.88, '240', 3218530.49, 'win', 'completed', '2025-03-24 13:18:24', '2025-03-24 17:18:24'),
(285, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/BTC', 1041595.63, '240', 1052011.59, 'win', 'completed', '2025-03-24 13:19:04', '2025-03-24 17:19:04'),
(286, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'BTC/USDT', 193249.33, '240', 231899.20, 'win', 'completed', '2025-03-24 18:09:40', '2025-03-24 22:09:40'),
(287, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'BNB/BTC', 1108902.46, '240', 1330682.95, 'win', 'completed', '2025-03-25 02:57:38', '2025-03-25 06:57:38'),
(288, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'SOL/USDT', 2135271.04, '240', 2199329.17, 'win', 'completed', '2025-03-25 12:22:39', '2025-03-25 16:22:39'),
(289, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'LTC/USDT', 2135271.04, '240', 2199329.17, 'win', 'completed', '2025-03-25 12:23:17', '2025-03-25 16:23:17'),
(290, '63', 'Maria', 'Mondragon', 'buy', 'CRYPTO', 'SOL/USDT', 10789.43, '240', 11113.11, 'win', 'completed', '2025-03-25 14:24:59', '2025-03-25 18:24:59'),
(291, '47', 'Connor', 'Trott', 'sell', 'CRYPTO', 'BNB/BTC', 332670.74, '240', 399204.89, 'win', 'completed', '2025-03-25 17:06:57', '2025-03-25 21:06:57'),
(292, '47', 'Connor', 'Trott', 'buy', 'CRYPTO', 'ADA/USDT', 1397217.10, '240', 2780462.03, 'win', 'completed', '2025-03-26 01:46:47', '2025-03-26 05:46:47'),
(293, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 2199329.17, '240', 2265309.05, 'win', 'completed', '2025-03-26 14:46:01', '2025-03-26 18:46:01'),
(294, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'ETH/DOGE', 2199329.17, '240', 2353282.21, 'win', 'completed', '2025-03-26 14:46:23', '2025-03-26 18:46:23'),
(295, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'LTC/USDT', 2309295.63, '240', 2378574.50, 'win', 'completed', '2025-03-27 13:07:45', '2025-03-27 17:07:45'),
(296, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'XRP/USDT', 2309295.63, '240', 2355481.54, 'win', 'completed', '2025-03-27 13:08:16', '2025-03-27 17:08:16'),
(297, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'BTC/USDT', 231899.20, '240', 278279.04, 'win', 'completed', '2025-03-27 13:30:28', '2025-03-27 17:30:28'),
(298, '68', 'Rocky', 'Restrepo', 'buy', 'CRYPTO', 'BTC/USDT', 18551.23, '240', 22261.48, 'win', 'completed', '2025-03-27 13:53:35', '2025-03-27 17:53:35'),
(299, '79', 'Phil', 'Wannell', 'buy', 'CRYPTO', 'LTC/USDT', 293279.04, '240', 302077.41, 'win', 'completed', '2025-04-05 14:52:06', '2025-04-05 18:52:06'),
(300, '67', 'Pradeep', 'Sivanandam', 'buy', 'CRYPTO', 'BTC/USDT', 4734056.04, '240', 5680867.25, 'win', 'completed', '2025-04-08 22:25:20', '2025-04-09 02:25:20'),
(301, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 500.00, '240', 600.00, 'win', 'completed', '2025-04-09 00:22:07', '2025-04-09 04:22:07'),
(302, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'XRP/USDT', 600.00, '240', 618.00, 'win', 'completed', '2025-04-09 16:15:45', '2025-04-09 20:15:45'),
(303, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'XRP/USDT', 30.00, '60', 30.90, 'win', 'completed', '2025-04-09 16:53:19', '2025-04-09 17:53:19'),
(304, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'XRP/USDT', 5680867.25, '240', 5851293.27, 'win', 'completed', '2025-04-09 17:40:27', '2025-04-09 21:40:27'),
(305, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 845.25, '240', 1014.30, 'win', 'completed', '2025-04-09 19:49:12', '2025-04-09 23:49:12'),
(306, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'XRP/USDT', 30000.00, '5', 30900.00, 'win', 'completed', '2025-04-09 21:00:54', '2025-04-09 21:05:54'),
(307, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'SOL/USDT', 1000.00, '240', 1040.00, 'win', 'completed', '2025-04-10 15:17:48', '2025-04-10 19:17:48'),
(308, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'SOL/USDT', 618.00, '240', 642.72, 'win', 'completed', '2025-04-10 15:39:15', '2025-04-10 19:39:15'),
(309, '67', 'Pradeep', 'Sivanandam', 'sell', 'CRYPTO', 'SOL/USDT', 5851293.27, '240', 6085345.00, 'win', 'completed', '2025-04-10 15:58:34', '2025-04-10 19:58:34'),
(310, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'SOL/USDT', 70000.00, '5', 72800.00, 'win', 'completed', '2025-04-10 16:27:59', '2025-04-10 16:32:59'),
(311, '96', 'Rebecca', 'Piersall', 'sell', 'CRYPTO', 'SOL/USDT', 100.00, '240', 104.00, 'win', 'completed', '2025-04-10 18:16:12', '2025-04-10 22:16:12'),
(312, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'SOL/USDT', 10000.00, '5', 10400.00, 'win', 'completed', '2025-04-10 18:22:56', '2025-04-10 18:27:56'),
(313, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'SOL/USDT', 4000.00, '5', 4160.00, 'win', 'completed', '2025-04-10 18:23:21', '2025-04-10 18:28:21'),
(314, '2', 'Riko', 'Daniella', 'buy', 'CRYPTO', 'BTC/USDT', 1000.00, '5', 1200.00, 'win', 'completed', '2025-04-11 02:15:04', '2025-04-11 02:20:04'),
(315, '2', 'Riko', 'Daniella', 'buy', 'FOREX', 'EUR/USD', 100.00, '5', 1.00, 'loss', 'completed', '2025-04-11 00:15:48', '2025-04-11 00:20:48'),
(316, '2', 'Riko', 'Daniella', 'buy', 'FOREX', 'EUR/USD', 100.00, '5', 1.00, 'loss', 'completed', '2025-04-11 00:22:21', '2025-04-11 00:27:21'),
(317, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USD', 642.72, '240', 662.00, 'win', 'completed', '2025-04-11 13:40:17', '2025-04-11 17:40:17'),
(318, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 2957.00, '240', 3548.40, 'win', 'completed', '2025-04-11 14:00:57', '2025-04-11 18:00:57'),
(319, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 50000.00, '5', 55000.00, 'win', 'completed', '2025-04-11 14:07:49', '2025-04-11 14:12:49'),
(320, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 23000.00, '5', 25300.00, 'win', 'completed', '2025-04-11 14:08:27', '2025-04-11 14:13:27'),
(321, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 37000.00, '5', 40700.00, 'win', 'completed', '2025-04-11 14:09:56', '2025-04-11 14:14:56'),
(322, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 1300.00, '240', 1560.00, 'win', 'completed', '2025-04-11 15:27:51', '2025-04-11 19:27:51'),
(323, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'XRP/USDT', 662.00, '240', 681.86, 'win', 'completed', '2025-04-14 14:14:55', '2025-04-14 18:14:55'),
(324, '96', 'Rebecca', 'Piersall', 'sell', 'CRYPTO', 'XRP/BTC', 104.00, '240', 105.04, 'win', 'completed', '2025-04-14 14:23:35', '2025-04-14 18:23:35'),
(325, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 3548.40, '240', 3654.85, 'win', 'completed', '2025-04-14 14:42:23', '2025-04-14 18:42:23'),
(326, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'XRP/USDT', 1500.00, '240', 1545.00, 'win', 'completed', '2025-04-14 15:11:37', '2025-04-14 19:11:37'),
(327, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 80000.00, '5', 88000.00, 'win', 'completed', '2025-04-14 15:32:17', '2025-04-14 15:37:17'),
(328, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 100000.00, '5', 110000.00, 'win', 'completed', '2025-04-14 15:33:00', '2025-04-14 15:38:00'),
(329, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 21000.00, '5', 23100.00, 'win', 'completed', '2025-04-14 19:25:36', '2025-04-14 19:30:36'),
(330, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 18000.00, '5', 19800.00, 'win', 'completed', '2025-04-14 19:26:42', '2025-04-14 19:31:42'),
(331, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 26635.00, '5', 29298.50, 'win', 'completed', '2025-04-14 19:27:11', '2025-04-14 19:32:11'),
(332, '98', 'Kristin', 'Kirsch', 'buy', 'CRYPTO', 'XRP/USDT', 8.00, '240', 8.24, 'win', 'completed', '2025-04-14 20:28:22', '2025-04-15 00:28:22'),
(333, '98', 'Kristin', 'Kirsch', 'sell', 'CRYPTO', 'XRP/USDT', 8.24, '240', 8.49, 'win', 'completed', '2025-04-15 03:03:10', '2025-04-15 07:03:10'),
(334, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 102334.00, '240', 106427.36, 'win', 'completed', '2025-04-15 12:51:33', '2025-04-15 16:51:33'),
(335, '96', 'Rebecca', 'Piersall', 'buy', 'CRYPTO', 'SOL/USDT', 105.04, '240', 109.24, 'win', 'completed', '2025-04-15 13:58:51', '2025-04-15 17:58:51'),
(336, '98', 'Kristin', 'Kirsch', 'buy', 'CRYPTO', 'SOL/USDT', 8.49, '240', 8.83, 'win', 'completed', '2025-04-15 15:11:36', '2025-04-15 19:11:36'),
(337, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 6500.00, '5', 7150.00, 'win', 'completed', '2025-04-15 17:25:10', '2025-04-15 17:30:10'),
(338, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 8000.00, '5', 8800.00, 'win', 'completed', '2025-04-15 17:25:47', '2025-04-15 17:30:47'),
(339, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 10500.00, '5', 11550.00, 'win', 'completed', '2025-04-15 17:26:13', '2025-04-15 17:31:13'),
(340, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 3900.00, '5', 4290.00, 'win', 'completed', '2025-04-15 17:26:37', '2025-04-15 17:31:37'),
(341, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 150000.00, '5', 165000.00, 'win', 'completed', '2025-04-15 21:43:28', '2025-04-15 21:48:28'),
(342, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 25000.00, '5', 27500.00, 'win', 'completed', '2025-04-15 21:45:32', '2025-04-15 21:50:32'),
(343, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 32000.00, '5', 35200.00, 'win', 'completed', '2025-04-15 21:46:07', '2025-04-15 21:51:07'),
(344, '98', 'Kristin', 'Kirsch', 'buy', 'CRYPTO', 'SOL/USDT', 8.83, '240', 9.18, 'win', 'completed', '2025-04-15 23:57:19', '2025-04-16 03:57:19'),
(345, '96', 'Rebecca', 'Piersall', 'sell', 'CRYPTO', 'XRP/USDT', 109.24, '240', 120.16, 'win', 'completed', '2025-04-16 14:44:31', '2025-04-16 18:44:31'),
(346, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 204227.00, '240', 224649.70, 'win', 'completed', '2025-04-16 14:49:05', '2025-04-16 18:49:05'),
(347, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 100000.00, '5', 110000.00, 'win', 'completed', '2025-04-16 19:19:00', '2025-04-16 19:24:00'),
(348, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 80000.00, '5', 88000.00, 'win', 'completed', '2025-04-16 19:19:31', '2025-04-16 19:24:31'),
(349, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 100000.00, '5', 110000.00, 'win', 'completed', '2025-04-17 00:30:54', '2025-04-17 00:35:54'),
(350, '99', 'Darion', 'Green', 'sell', 'CRYPTO', 'BTC/USDT', 95.00, '5', 114.00, 'win', 'completed', '2025-04-17 02:33:00', '2025-04-17 02:38:00'),
(351, '98', 'Kristin', 'Kirsch', 'sell', 'CRYPTO', 'XRP/USDT', 9.18, '240', 10.10, 'win', 'completed', '2025-04-17 02:57:47', '2025-04-17 06:57:47'),
(352, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'SOL/USDT', 1641.05, '240', 1690.28, 'win', 'completed', '2025-04-17 14:08:49', '2025-04-17 18:08:49'),
(353, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'SOL/USDT', 681.86, '240', 702.32, 'win', 'completed', '2025-04-17 14:11:28', '2025-04-17 18:11:28'),
(354, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 224649.70, '240', 231389.19, 'win', 'completed', '2025-04-17 14:28:11', '2025-04-17 18:28:11'),
(355, '96', 'Rebecca', 'Piersall', 'buy', 'CRYPTO', 'SOL/USDT', 120.16, '240', 123.76, 'win', 'completed', '2025-04-17 15:08:15', '2025-04-17 19:08:15'),
(356, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 500000.00, '5', 550000.00, 'win', 'completed', '2025-04-17 17:06:05', '2025-04-17 17:11:05'),
(357, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 270000.00, '5', 297000.00, 'win', 'completed', '2025-04-17 17:06:33', '2025-04-17 17:11:33'),
(358, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 60000.00, '5', 66000.00, 'win', 'completed', '2025-04-17 17:07:08', '2025-04-17 17:12:08'),
(359, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'SOL/USDT', 331.00, '240', 340.93, 'win', 'completed', '2025-04-17 19:46:48', '2025-04-17 23:46:48'),
(360, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'ADA/USDT', 24682.00, '5', 27150.20, 'win', 'completed', '2025-04-17 20:20:48', '2025-04-17 20:25:48'),
(361, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 200000.00, '5', 220000.00, 'win', 'completed', '2025-04-17 23:06:35', '2025-04-17 23:11:35'),
(362, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USD', 231389.19, '240', 238330.87, 'win', 'completed', '2025-04-18 14:09:53', '2025-04-18 18:09:53'),
(363, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 702.32, '240', 716.37, 'win', 'completed', '2025-04-18 14:13:33', '2025-04-18 18:13:33'),
(364, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'BTC/USDT', 1600.00, '240', 1632.00, 'win', 'completed', '2025-04-18 14:35:25', '2025-04-18 18:35:25'),
(365, '99', 'Darion', 'Green', 'sell', 'CRYPTO', 'BTC/USDT', 340.93, '240', 347.75, 'win', 'completed', '2025-04-18 15:45:19', '2025-04-18 19:45:19'),
(366, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 180.00, '240', 183.60, 'win', 'completed', '2025-04-18 16:30:44', '2025-04-18 20:30:44'),
(367, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 480000.00, '5', 528000.00, 'win', 'completed', '2025-04-18 16:56:58', '2025-04-18 17:01:58'),
(368, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 130000.00, '5', 143000.00, 'win', 'completed', '2025-04-18 16:57:36', '2025-04-18 17:02:36'),
(369, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ADA/USDT', 740000.00, '5', 814000.00, 'win', 'completed', '2025-04-18 16:58:06', '2025-04-18 17:03:06'),
(370, '98', 'Kristin', 'Kirsch', 'sell', 'CRYPTO', 'BTC/USDT', 10.10, '240', 10.30, 'win', 'completed', '2025-04-19 12:52:47', '2025-04-19 16:52:47'),
(371, '99', 'Darion', 'Green', 'buy', 'FOREX', 'AUD/USD', 86.94, '5', 26.08, 'loss', 'completed', '2025-04-21 01:29:25', '2025-04-21 01:34:25'),
(372, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 283181.00, '240', 288844.62, 'win', 'completed', '2025-04-21 13:31:30', '2025-04-21 17:31:30'),
(373, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 183.60, '240', 187.27, 'win', 'completed', '2025-04-21 13:34:01', '2025-04-21 17:34:01'),
(374, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 1700.00, '240', 1734.00, 'win', 'completed', '2025-04-21 13:35:11', '2025-04-21 17:35:11'),
(375, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 716.37, '240', 730.70, 'win', 'completed', '2025-04-21 13:39:31', '2025-04-21 17:39:31'),
(376, '13', 'Adam', 'Molzof', 'sell', 'CRYPTO', 'ADA/USDT', 530000.00, '5', 583000.00, 'win', 'completed', '2025-04-21 16:50:58', '2025-04-21 16:55:58'),
(377, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 59000.00, '5', 60180.00, 'win', 'completed', '2025-04-21 17:03:32', '2025-04-21 17:08:32'),
(378, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 140000.00, '5', 142800.00, 'win', 'completed', '2025-04-21 17:03:52', '2025-04-21 17:08:52'),
(379, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 74860.00, '5', 76357.20, 'win', 'completed', '2025-04-21 17:04:10', '2025-04-21 17:09:10'),
(380, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 82900.00, '5', 84558.00, 'win', 'completed', '2025-04-21 17:04:39', '2025-04-21 17:09:39'),
(381, '98', 'Kristin', 'Kirsch', 'buy', 'CRYPTO', 'BTC/USDT', 10.30, '5', 10.51, 'win', 'completed', '2025-04-21 17:37:38', '2025-04-21 17:42:38'),
(382, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'BTC/USDT', 321.67, '240', 328.10, 'win', 'completed', '2025-04-21 18:40:00', '2025-04-21 22:40:00'),
(383, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 1700.00, '240', 1768.00, 'win', 'completed', '2025-04-22 13:26:13', '2025-04-22 17:26:13'),
(384, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 187.27, '240', 194.76, 'win', 'completed', '2025-04-22 13:59:10', '2025-04-22 17:59:10'),
(385, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 730.70, '240', 759.93, 'win', 'completed', '2025-04-22 14:09:51', '2025-04-22 18:09:51'),
(386, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 288844.62, '240', 300398.40, 'win', 'completed', '2025-04-22 14:13:27', '2025-04-22 18:13:27'),
(387, '98', 'Kristin', 'Kirsch', 'buy', 'CRYPTO', 'BTC/USDT', 10.51, '240', 10.93, 'win', 'completed', '2025-04-22 14:24:46', '2025-04-22 18:24:46'),
(388, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 200000.00, '5', 208000.00, 'win', 'completed', '2025-04-22 14:59:46', '2025-04-22 15:04:46'),
(389, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 58000.00, '5', 60320.00, 'win', 'completed', '2025-04-22 15:00:03', '2025-04-22 15:05:03'),
(390, '95', 'Carlos', 'Martin', 'buy', 'CRYPTO', 'BTC/USDT', 94000.00, '5', 97760.00, 'win', 'completed', '2025-04-22 15:00:24', '2025-04-22 15:05:24'),
(391, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'XRP/USDT', 1800.00, '240', 1854.00, 'win', 'completed', '2025-04-23 13:44:22', '2025-04-23 17:44:22'),
(392, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 300398.40, '240', 309410.35, 'win', 'completed', '2025-04-23 13:45:17', '2025-04-23 17:45:17'),
(393, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'XRP/USDT', 759.93, '240', 782.73, 'win', 'completed', '2025-04-23 13:45:56', '2025-04-23 17:45:56');
INSERT INTO `live_trades` (`id`, `userid`, `f_name`, `l_name`, `transaction_type`, `asset_class`, `asset_ticker`, `trade_amount`, `duration`, `profit_or_loss`, `outcome`, `status`, `date`, `set_time`) VALUES
(394, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'XRP/USDT', 194.76, '240', 200.60, 'win', 'completed', '2025-04-23 13:53:41', '2025-04-23 17:53:41'),
(395, '99', 'Darion', 'Green', 'sell', 'STOCKS', 'S&amp;P500', 82.03, '5', 90.23, 'win', 'completed', '2025-04-23 16:02:41', '2025-04-23 16:07:41'),
(396, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'XRP/USDT', 336.30, '240', 346.39, 'win', 'completed', '2025-04-23 17:50:52', '2025-04-23 21:50:52'),
(397, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 382910.35, '240', 394397.66, 'win', 'completed', '2025-04-24 14:44:45', '2025-04-24 18:44:45'),
(398, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 782.73, '240', 806.21, 'win', 'completed', '2025-04-24 14:52:48', '2025-04-24 18:52:48'),
(399, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 200.60, '240', 206.62, 'win', 'completed', '2025-04-24 14:58:19', '2025-04-24 18:58:19'),
(400, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'XRP/USDT', 1850.00, '240', 1905.50, 'win', 'completed', '2025-04-24 17:49:11', '2025-04-24 21:49:11'),
(401, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'ETH/USDT', 346.39, '240', 356.78, 'win', 'completed', '2025-04-24 19:02:23', '2025-04-24 23:02:23'),
(402, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 1900.00, '240', 1995.00, 'win', 'completed', '2025-04-25 13:34:05', '2025-04-25 17:34:05'),
(403, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BCH/BTC', 442244.00, '240', 459933.76, 'win', 'completed', '2025-04-25 13:42:13', '2025-04-25 17:42:13'),
(404, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BCH/BTC', 806.21, '240', 838.46, 'win', 'completed', '2025-04-25 13:46:20', '2025-04-25 17:46:20'),
(405, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BCH/BTC', 206.62, '240', 214.88, 'win', 'completed', '2025-04-25 14:06:40', '2025-04-25 18:06:40'),
(406, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 2000.00, '240', 2060.00, 'win', 'completed', '2025-04-28 13:04:45', '2025-04-28 17:04:45'),
(407, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 459933.76, '240', 473731.77, 'win', 'completed', '2025-04-28 13:06:25', '2025-04-28 17:06:25'),
(408, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 5000.00, '240', 5150.00, 'win', 'completed', '2025-04-28 13:07:36', '2025-04-28 17:07:36'),
(409, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 214.88, '240', 221.33, 'win', 'completed', '2025-04-28 13:24:16', '2025-04-28 17:24:16'),
(410, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 838.46, '240', 863.61, 'win', 'completed', '2025-04-28 13:41:12', '2025-04-28 17:41:12'),
(411, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'BTC/USDT', 356.78, '240', 367.48, 'win', 'completed', '2025-04-28 14:37:31', '2025-04-28 18:37:31'),
(412, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'BTC/USDT', 120.00, '240', 123.60, 'win', 'completed', '2025-04-29 02:22:22', '2025-04-29 06:22:22'),
(413, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 236865.89, '240', 246340.53, 'win', 'completed', '2025-04-29 14:37:44', '2025-04-29 18:37:44'),
(414, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'XRP/USDT', 863.61, '240', 898.15, 'win', 'completed', '2025-04-29 14:38:25', '2025-04-29 18:38:25'),
(415, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'XRP/USDT', 5150.00, '240', 5356.00, 'win', 'completed', '2025-04-29 14:38:43', '2025-04-29 18:38:43'),
(416, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'XRP/USDT', 2088.78, '240', 2172.33, 'win', 'completed', '2025-04-29 14:44:39', '2025-04-29 18:44:39'),
(417, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'XRP/USDT', 221.33, '240', 230.18, 'win', 'completed', '2025-04-29 15:05:46', '2025-04-29 19:05:46'),
(418, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 236865.88, '240', 246340.52, 'win', 'completed', '2025-04-29 15:07:48', '2025-04-29 19:07:48'),
(419, '99', 'Darion', 'Green', 'sell', 'CRYPTO', 'XRP/USDT', 367.48, '240', 382.18, 'win', 'completed', '2025-04-29 17:45:32', '2025-04-29 21:45:32'),
(420, '108', 'Joseph', 'Solomon', 'sell', 'CRYPTO', 'XRP/USDT', 30.90, '240', 32.14, 'win', 'completed', '2025-04-30 02:38:01', '2025-04-30 06:38:01'),
(421, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'XRP/USDT', 200.00, '240', 208.00, 'win', 'completed', '2025-04-30 03:33:26', '2025-04-30 07:33:26'),
(422, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 492681.05, '240', 507461.48, 'win', 'completed', '2025-04-30 13:03:52', '2025-04-30 17:03:52'),
(423, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 5356.00, '240', 5516.68, 'win', 'completed', '2025-04-30 13:04:55', '2025-04-30 17:04:55'),
(424, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 5000.00, '5', 5500.00, 'win', 'completed', '2025-04-30 13:25:23', '2025-04-30 13:30:23'),
(425, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 289000.00, '5', 317900.00, 'win', 'completed', '2025-04-30 13:25:53', '2025-04-30 13:30:53'),
(426, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 2172.33, '240', 2237.50, 'win', 'completed', '2025-04-30 13:26:25', '2025-04-30 17:26:25'),
(427, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 230.18, '240', 237.09, 'win', 'completed', '2025-04-30 13:29:34', '2025-04-30 17:29:34'),
(428, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 898.15, '240', 925.09, 'win', 'completed', '2025-04-30 13:33:09', '2025-04-30 17:33:09'),
(429, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 208.00, '240', 214.24, 'win', 'completed', '2025-04-30 14:47:54', '2025-04-30 18:47:54'),
(430, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'XRP/USDT', 5516.68, '240', 5792.51, 'win', 'completed', '2025-05-01 13:14:57', '2025-05-01 17:14:57'),
(431, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 507461.48, '240', 532834.55, 'win', 'completed', '2025-05-01 13:17:47', '2025-05-01 17:17:47'),
(432, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'XRP/USDT', 2237.50, '240', 2349.38, 'win', 'completed', '2025-05-01 13:27:12', '2025-05-01 17:27:12'),
(433, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'XRP/USDT', 925.09, '240', 971.34, 'win', 'completed', '2025-05-01 13:38:07', '2025-05-01 17:38:07'),
(434, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'XRP/USDT', 514.24, '240', 539.95, 'win', 'completed', '2025-05-01 14:01:58', '2025-05-01 18:01:58'),
(435, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 49000.00, '240', 51450.00, 'win', 'completed', '2025-05-01 15:49:25', '2025-05-01 19:49:25'),
(436, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'XRP/USDT', 382.18, '240', 401.29, 'win', 'completed', '2025-05-01 17:15:24', '2025-05-01 21:15:24'),
(437, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'XRP/USDT', 124.84, '240', 131.08, 'win', 'completed', '2025-05-01 18:33:35', '2025-05-01 22:33:35'),
(438, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 237.09, '240', 244.20, 'win', 'completed', '2025-05-02 13:45:01', '2025-05-02 17:45:01'),
(439, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 584284.55, '240', 601813.09, 'win', 'completed', '2025-05-02 13:56:29', '2025-05-02 17:56:29'),
(440, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 5792.51, '240', 5966.29, 'win', 'completed', '2025-05-02 13:57:21', '2025-05-02 17:57:21'),
(441, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 971.34, '240', 1000.48, 'win', 'completed', '2025-05-02 13:57:32', '2025-05-02 17:57:32'),
(442, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'BTC/USDT', 401.29, '240', 413.33, 'win', 'completed', '2025-05-02 16:37:14', '2025-05-02 20:37:14'),
(443, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'BTC/USDT', 131.08, '240', 135.01, 'win', 'completed', '2025-05-02 17:12:23', '2025-05-02 21:12:23'),
(444, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'XRP/USDT', 2349.38, '240', 2466.85, 'win', 'completed', '2025-05-02 17:48:40', '2025-05-02 21:48:40'),
(445, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 601813.09, '240', 619867.48, 'win', 'completed', '2025-05-05 13:39:22', '2025-05-05 17:39:22'),
(446, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'BTC/USDT', 2466.85, '240', 2540.86, 'win', 'completed', '2025-05-05 13:40:12', '2025-05-05 17:40:12'),
(447, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 1000.48, '240', 1030.49, 'win', 'completed', '2025-05-05 13:41:56', '2025-05-05 17:41:56'),
(448, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'BTC/USDT', 5966.29, '240', 6145.28, 'win', 'completed', '2025-05-05 13:44:41', '2025-05-05 17:44:41'),
(449, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 482.92, '240', 497.41, 'win', 'completed', '2025-05-05 13:49:33', '2025-05-05 17:49:33'),
(450, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'BTC/USDT', 1029.00, '240', 1059.87, 'win', 'completed', '2025-05-05 14:58:02', '2025-05-05 18:58:02'),
(451, '99', 'Darion', 'Green', 'sell', 'CRYPTO', 'BTC/USDT', 413.33, '240', 425.73, 'win', 'completed', '2025-05-05 15:14:03', '2025-05-05 19:14:03'),
(452, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 19550.00, '240', 20136.50, 'win', 'completed', '2025-05-05 15:16:19', '2025-05-05 19:16:19'),
(453, '108', 'Joseph', 'Solomon', 'sell', 'CRYPTO', 'BTC/USDT', 450.00, '240', 463.50, 'win', 'completed', '2025-05-05 16:03:33', '2025-05-05 20:03:33'),
(454, '76', 'Tiffany', 'Mayton', 'sell', 'CRYPTO', 'BTC/USDT', 1950.00, '5', 2008.50, 'win', 'completed', '2025-05-05 16:09:26', '2025-05-05 16:14:26'),
(455, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 1030.49, '240', 1061.40, 'win', 'completed', '2025-05-06 14:18:44', '2025-05-06 18:18:44'),
(456, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'BTC/USDT', 1059.87, '240', 1091.67, 'win', 'completed', '2025-05-06 14:20:14', '2025-05-06 18:20:14'),
(457, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'BTC/USDT', 2540.86, '240', 2617.09, 'win', 'completed', '2025-05-06 14:25:43', '2025-05-06 18:25:43'),
(458, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 619867.48, '240', 638463.50, 'win', 'completed', '2025-05-06 14:32:54', '2025-05-06 18:32:54'),
(459, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 20136.50, '240', 20740.60, 'win', 'completed', '2025-05-06 14:33:48', '2025-05-06 18:33:48'),
(460, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'BTC/USDT', 6145.28, '240', 6329.64, 'win', 'completed', '2025-05-06 14:34:21', '2025-05-06 18:34:21'),
(461, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 497.41, '240', 512.33, 'win', 'completed', '2025-05-06 14:43:23', '2025-05-06 18:43:23'),
(462, '76', 'Tiffany', 'Mayton', 'sell', 'CRYPTO', 'BTC/USDT', 2008.50, '5', 2068.76, 'win', 'completed', '2025-05-06 17:48:42', '2025-05-06 17:53:42'),
(463, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 638463.50, '240', 657617.41, 'win', 'completed', '2025-05-07 13:17:09', '2025-05-07 17:17:09'),
(464, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 20740.60, '240', 21362.82, 'win', 'completed', '2025-05-07 13:17:53', '2025-05-07 17:17:53'),
(465, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 6329.64, '240', 6519.53, 'win', 'completed', '2025-05-07 13:18:51', '2025-05-07 17:18:51'),
(466, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 2617.09, '240', 2695.60, 'win', 'completed', '2025-05-07 13:38:35', '2025-05-07 17:38:35'),
(467, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1061.40, '240', 1093.24, 'win', 'completed', '2025-05-07 13:45:28', '2025-05-07 17:45:28'),
(468, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 562.33, '240', 579.20, 'win', 'completed', '2025-05-07 14:18:21', '2025-05-07 18:18:21'),
(469, '76', 'Tiffany', 'Mayton', 'buy', 'CRYPTO', 'BTC/USDT', 2068.76, '5', 2130.82, 'win', 'completed', '2025-05-07 15:49:50', '2025-05-07 15:54:50'),
(470, '99', 'Darion', 'Green', 'buy', 'CRYPTO', 'BTC/USDT', 425.73, '240', 438.50, 'win', 'completed', '2025-05-07 16:39:25', '2025-05-07 20:39:25'),
(471, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'ETH/USDT', 1093.24, '240', 1115.10, 'win', 'completed', '2025-05-08 13:47:42', '2025-05-08 17:47:42'),
(472, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'ETH/USDT', 579.20, '240', 590.78, 'win', 'completed', '2025-05-08 13:47:45', '2025-05-08 17:47:45'),
(473, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 657617.41, '240', 670769.76, 'win', 'completed', '2025-05-08 13:54:20', '2025-05-08 17:54:20'),
(474, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 21362.82, '240', 21790.08, 'win', 'completed', '2025-05-08 13:55:17', '2025-05-08 17:55:17'),
(475, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'ETH/USDT', 6519.53, '240', 6649.92, 'win', 'completed', '2025-05-08 13:55:46', '2025-05-08 17:55:46'),
(476, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'ETH/USDT', 2695.60, '240', 2749.51, 'win', 'completed', '2025-05-08 14:04:28', '2025-05-08 18:04:28'),
(477, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1115.10, '240', 1193.16, 'win', 'completed', '2025-05-09 13:46:33', '2025-05-09 17:46:33'),
(478, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 670769.76, '240', 717723.64, 'win', 'completed', '2025-05-09 13:50:39', '2025-05-09 17:50:39'),
(479, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 21790.08, '240', 23315.39, 'win', 'completed', '2025-05-09 13:51:30', '2025-05-09 17:51:30'),
(480, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 6649.92, '240', 7115.41, 'win', 'completed', '2025-05-09 13:52:16', '2025-05-09 17:52:16'),
(481, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 3200.00, '240', 3424.00, 'win', 'completed', '2025-05-09 13:59:42', '2025-05-09 17:59:42'),
(482, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1091.67, '240', 1168.09, 'win', 'completed', '2025-05-09 20:07:41', '2025-05-10 00:07:41'),
(483, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1193.16, '240', 1276.68, 'win', 'completed', '2025-05-12 14:14:58', '2025-05-12 18:14:58'),
(484, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1168.09, '240', 1249.86, 'win', 'completed', '2025-05-12 14:22:14', '2025-05-12 18:22:14'),
(485, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'BTC/USDT', 3424.00, '240', 3663.68, 'win', 'completed', '2025-05-12 14:23:22', '2025-05-12 18:23:22'),
(486, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 717723.64, '240', 767964.29, 'win', 'completed', '2025-05-12 14:38:54', '2025-05-12 18:38:54'),
(487, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 23315.39, '240', 24947.47, 'win', 'completed', '2025-05-12 14:39:42', '2025-05-12 18:39:42'),
(488, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 7115.41, '240', 7613.49, 'win', 'completed', '2025-05-12 14:40:21', '2025-05-12 18:40:21'),
(489, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 590.78, '240', 632.13, 'win', 'completed', '2025-05-12 15:41:45', '2025-05-12 19:41:45'),
(490, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 632.13, '240', 657.42, 'win', 'completed', '2025-05-13 14:15:32', '2025-05-13 18:15:32'),
(491, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 767964.29, '240', 798682.86, 'win', 'completed', '2025-05-13 14:23:20', '2025-05-13 18:23:20'),
(492, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 24947.47, '240', 25945.37, 'win', 'completed', '2025-05-13 14:24:17', '2025-05-13 18:24:17'),
(493, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'ETH/USDT', 7613.49, '240', 7918.03, 'win', 'completed', '2025-05-13 14:24:57', '2025-05-13 18:24:57'),
(494, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 1276.68, '240', 1327.75, 'win', 'completed', '2025-05-13 14:27:00', '2025-05-13 18:27:00'),
(495, '27', 'Danny', 'Andrews', 'buy', 'CRYPTO', 'ETH/USDT', 3663.68, '240', 3810.23, 'win', 'completed', '2025-05-13 14:33:07', '2025-05-13 18:33:07'),
(496, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 1249.86, '240', 1299.85, 'win', 'completed', '2025-05-13 15:09:03', '2025-05-13 19:09:03'),
(497, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 798682.86, '240', 830630.17, 'win', 'completed', '2025-05-14 12:48:38', '2025-05-14 16:48:38'),
(498, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 25945.37, '240', 26983.18, 'win', 'completed', '2025-05-14 12:49:23', '2025-05-14 16:49:23'),
(499, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'ETH/USDT', 7918.03, '240', 8234.75, 'win', 'completed', '2025-05-14 12:50:50', '2025-05-14 16:50:50'),
(500, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'ETH/USDT', 1327.75, '240', 1380.86, 'win', 'completed', '2025-05-14 13:12:40', '2025-05-14 17:12:40'),
(501, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'ETH/USDT', 657.42, '240', 683.72, 'win', 'completed', '2025-05-14 13:15:15', '2025-05-14 17:15:15'),
(502, '27', 'Danny', 'Andrews', 'sell', 'CRYPTO', 'ETH/USDT', 3810.23, '240', 3962.64, 'win', 'completed', '2025-05-14 13:28:28', '2025-05-14 17:28:28'),
(503, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'ETH/USDT', 1299.85, '240', 1351.84, 'win', 'completed', '2025-05-14 13:59:09', '2025-05-14 17:59:09'),
(504, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 96900.00, '240', 100776.00, 'win', 'completed', '2025-05-14 15:18:00', '2025-05-14 19:18:00'),
(505, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 26983.18, '240', 28872.00, 'win', 'completed', '2025-05-15 12:31:19', '2025-05-15 16:31:19'),
(506, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 931406.17, '240', 996604.60, 'win', 'completed', '2025-05-15 12:32:21', '2025-05-15 16:32:21'),
(507, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 8234.75, '240', 8811.18, 'win', 'completed', '2025-05-15 12:33:15', '2025-05-15 16:33:15'),
(508, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 683.72, '240', 731.58, 'win', 'completed', '2025-05-15 12:47:34', '2025-05-15 16:47:34'),
(509, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1380.86, '240', 1477.52, 'win', 'completed', '2025-05-15 13:47:52', '2025-05-15 17:47:52'),
(510, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1351.84, '240', 1446.47, 'win', 'completed', '2025-05-15 15:02:37', '2025-05-15 19:02:37'),
(511, '93', 'Mary Ann', 'Atwell', 'buy', 'STOCKS', 'AAPL', 1477.52, '240', 1625.27, 'win', 'completed', '2025-05-16 13:55:10', '2025-05-16 17:55:10'),
(512, '97', 'Agatha', 'Lipka', 'buy', 'STOCKS', 'AAPL', 996604.60, '240', 1096265.06, 'win', 'completed', '2025-05-16 13:56:23', '2025-05-16 17:56:23'),
(513, '112', 'Cheyenne', 'Lipka', 'buy', 'STOCKS', 'AAPL', 28872.00, '240', 31759.20, 'win', 'completed', '2025-05-16 13:57:16', '2025-05-16 17:57:16'),
(514, '101', 'alicja', 'johnson', 'buy', 'STOCKS', 'AAPL', 8811.18, '240', 9692.30, 'win', 'completed', '2025-05-16 13:57:43', '2025-05-16 17:57:43'),
(515, '6', 'Cowen', 'Benjamin ', 'buy', 'STOCKS', 'AAPL', 100000.00, '5', 110000.00, 'win', 'completed', '2025-05-16 14:01:59', '2025-05-16 14:06:59'),
(516, '107', 'Viktoriya', 'Schatz', 'buy', 'STOCKS', 'AAPL', 723.24, '240', 795.56, 'win', 'completed', '2025-05-16 14:06:57', '2025-05-16 18:06:57'),
(517, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'ETH/USDT', 723.23, '240', 766.62, 'win', 'completed', '2025-05-16 14:08:23', '2025-05-16 18:08:23'),
(518, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'ETH/USDT', 731.58, '240', 775.47, 'win', 'completed', '2025-05-16 15:06:36', '2025-05-16 19:06:36'),
(519, '96', 'Rebecca', 'Piersall', 'buy', 'STOCKS', 'AAPL', 23.76, '240', 26.14, 'win', 'completed', '2025-05-16 16:11:17', '2025-05-16 20:11:17'),
(520, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'SOL/USDT', 1096265.06, '240', 1151078.31, 'win', 'completed', '2025-05-19 13:05:19', '2025-05-19 17:05:19'),
(521, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'SOL/USDT', 31759.20, '240', 33347.16, 'win', 'completed', '2025-05-19 13:08:41', '2025-05-19 17:08:41'),
(522, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'SOL/USDT', 9692.30, '240', 10176.92, 'win', 'completed', '2025-05-19 13:09:33', '2025-05-19 17:09:33'),
(523, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'SOL/USDT', 1625.27, '240', 1706.53, 'win', 'completed', '2025-05-19 14:01:43', '2025-05-19 18:01:43'),
(524, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'SOL/USDT', 775.47, '240', 814.24, 'win', 'completed', '2025-05-19 14:14:23', '2025-05-19 18:14:23'),
(525, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'SOL/USDT', 1562.18, '240', 1640.29, 'win', 'completed', '2025-05-19 15:17:55', '2025-05-19 19:17:55'),
(526, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 33347.16, '240', 35681.46, 'win', 'completed', '2025-05-20 12:53:48', '2025-05-20 16:53:48'),
(527, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 1151078.31, '240', 1197121.44, 'win', 'completed', '2025-05-20 12:55:40', '2025-05-20 16:55:40'),
(528, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 10176.92, '240', 10584.00, 'win', 'completed', '2025-05-20 12:56:47', '2025-05-20 16:56:47'),
(529, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 814.24, '240', 846.81, 'win', 'completed', '2025-05-20 13:06:53', '2025-05-20 17:06:53'),
(530, '96', 'Rebecca', 'Piersall', 'buy', 'CRYPTO', 'BTC/USDT', 26.14, '240', 27.19, 'win', 'completed', '2025-05-20 13:33:41', '2025-05-20 17:33:41'),
(531, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 853.26, '240', 887.39, 'win', 'completed', '2025-05-20 14:08:05', '2025-05-20 18:08:05'),
(532, '93', 'Mary Ann', 'Atwell', 'buy', 'STOCKS', 'AAPL', 853.27, '240', 878.87, 'win', 'completed', '2025-05-20 14:08:44', '2025-05-20 18:08:44'),
(533, '107', 'Viktoriya', 'Schatz', 'buy', 'STOCKS', 'AAPL', 1640.29, '240', 1689.50, 'win', 'completed', '2025-05-20 14:54:11', '2025-05-20 18:54:11'),
(534, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 58900.00, '240', 61256.00, 'win', 'completed', '2025-05-20 16:53:48', '2025-05-20 20:53:48'),
(535, '101', 'alicja', 'johnson', 'buy', 'STOCKS', 'AAPL', 10584.00, '240', 10901.52, 'win', 'completed', '2025-05-20 18:36:04', '2025-05-20 22:36:04'),
(536, '112', 'Cheyenne', 'Lipka', 'buy', 'STOCKS', 'AAPL', 35681.46, '240', 36751.90, 'win', 'completed', '2025-05-20 18:37:00', '2025-05-20 22:37:00'),
(537, '97', 'Agatha', 'Lipka', 'buy', 'STOCKS', 'AAPL', 299280.36, '240', 308258.77, 'win', 'completed', '2025-05-20 18:41:16', '2025-05-20 22:41:16'),
(538, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 100000.00, '5', 110000.00, 'win', 'completed', '2025-05-21 09:29:06', '2025-05-21 09:34:06'),
(539, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 1206099.85, '240', 1254343.84, 'win', 'completed', '2025-05-21 15:50:23', '2025-05-21 19:50:23'),
(540, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 98007.90, '240', 101928.22, 'win', 'completed', '2025-05-21 15:51:16', '2025-05-21 19:51:16'),
(541, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 10901.52, '240', 11337.58, 'win', 'completed', '2025-05-21 15:52:11', '2025-05-21 19:52:11'),
(542, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1689.50, '240', 1757.08, 'win', 'completed', '2025-05-21 16:03:48', '2025-05-21 20:03:48'),
(543, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 846.81, '240', 880.68, 'win', 'completed', '2025-05-21 17:59:32', '2025-05-21 21:59:32'),
(544, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1766.26, '240', 1836.91, 'win', 'completed', '2025-05-21 19:45:32', '2025-05-21 23:45:32'),
(545, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ATOM/USDT', 130000.00, '5', 132600.00, 'win', 'completed', '2025-05-21 21:24:10', '2025-05-21 21:29:10'),
(546, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'BTC/USDT', 300000.00, '10', 312000.00, 'win', 'completed', '2025-05-22 12:39:03', '2025-05-22 12:49:03'),
(547, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 1254343.84, '240', 1367234.79, 'win', 'completed', '2025-05-22 12:44:50', '2025-05-22 16:44:50'),
(548, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 101928.22, '240', 111101.76, 'win', 'completed', '2025-05-22 12:46:44', '2025-05-22 16:46:44'),
(549, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 11337.58, '240', 12357.96, 'win', 'completed', '2025-05-22 12:47:38', '2025-05-22 16:47:38'),
(550, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 880.68, '5', 959.94, 'win', 'completed', '2025-05-22 12:58:22', '2025-05-22 13:03:22'),
(551, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1757.08, '240', 1915.22, 'win', 'completed', '2025-05-22 13:23:47', '2025-05-22 17:23:47'),
(552, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1836.91, '240', 2002.23, 'win', 'completed', '2025-05-22 13:53:35', '2025-05-22 17:53:35'),
(553, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 250000.00, '5', 275000.00, 'win', 'completed', '2025-05-23 07:35:51', '2025-05-23 07:40:51'),
(554, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 1367234.79, '240', 1435596.53, 'win', 'completed', '2025-05-23 13:16:20', '2025-05-23 17:16:20'),
(555, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 111101.76, '240', 116656.85, 'win', 'completed', '2025-05-23 13:17:02', '2025-05-23 17:17:02'),
(556, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'XRP/USDT', 12357.96, '240', 12975.86, 'win', 'completed', '2025-05-23 13:17:36', '2025-05-23 17:17:36'),
(557, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'XRP/USDT', 959.94, '240', 1007.94, 'win', 'completed', '2025-05-23 13:28:28', '2025-05-23 17:28:28'),
(558, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'XRP/USDT', 1501.67, '240', 1576.75, 'win', 'completed', '2025-05-23 13:46:39', '2025-05-23 17:46:39'),
(559, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'XRP/USDT', 1915.22, '240', 2010.98, 'win', 'completed', '2025-05-23 16:01:08', '2025-05-23 20:01:08'),
(560, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 116656.85, '240', 121323.12, 'win', 'completed', '2025-05-26 13:24:07', '2025-05-26 17:24:07'),
(561, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 1435596.53, '240', 1493020.39, 'win', 'completed', '2025-05-26 13:24:54', '2025-05-26 17:24:54'),
(562, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 12975.86, '240', 13494.89, 'win', 'completed', '2025-05-26 13:25:44', '2025-05-26 17:25:44'),
(563, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 469.33, '240', 488.10, 'win', 'completed', '2025-05-26 13:53:37', '2025-05-26 17:53:37'),
(564, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'SOL/USDT', 352.00, '240', 369.60, 'win', 'completed', '2025-05-26 13:54:50', '2025-05-26 17:54:50'),
(565, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 527.99, '240', 543.83, 'win', 'completed', '2025-05-26 13:55:33', '2025-05-26 17:55:33'),
(566, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'XRP/USDT', 527.99, '240', 554.39, 'win', 'completed', '2025-05-26 13:56:10', '2025-05-26 17:56:10'),
(567, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 1005.49, '240', 1045.71, 'win', 'completed', '2025-05-26 14:12:56', '2025-05-26 18:12:56'),
(568, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 251.99, '240', 262.07, 'win', 'completed', '2025-05-26 14:13:45', '2025-05-26 18:13:45'),
(569, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'SOL/USDT', 188.99, '240', 198.44, 'win', 'completed', '2025-05-26 14:14:14', '2025-05-26 18:14:14'),
(570, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'XRP/USDT', 1005.49, '240', 1055.76, 'win', 'completed', '2025-05-26 14:14:19', '2025-05-26 18:14:19'),
(571, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 283.48, '240', 291.98, 'win', 'completed', '2025-05-26 14:14:56', '2025-05-26 18:14:56'),
(572, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'XRP/USDT', 283.48, '240', 297.65, 'win', 'completed', '2025-05-26 14:15:23', '2025-05-26 18:15:23'),
(573, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'BTC/USDT', 150000.00, '60', 156000.00, 'win', 'completed', '2025-05-26 17:55:05', '2025-05-26 18:55:05'),
(574, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 121323.12, '240', 127389.28, 'win', 'completed', '2025-05-26 19:08:02', '2025-05-26 23:08:02'),
(575, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'XRP/USDT', 13494.89, '240', 14169.63, 'win', 'completed', '2025-05-26 19:09:39', '2025-05-26 23:09:39'),
(576, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'XRP/USDT', 1493020.39, '240', 1567671.41, 'win', 'completed', '2025-05-26 19:11:30', '2025-05-26 23:11:30'),
(577, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 127389.28, '240', 131210.96, 'win', 'completed', '2025-05-27 13:23:17', '2025-05-27 17:23:17'),
(578, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 1955.92, '240', 2014.60, 'win', 'completed', '2025-05-27 13:23:33', '2025-05-27 17:23:33'),
(579, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 1567671.41, '240', 1614701.55, 'win', 'completed', '2025-05-27 13:24:23', '2025-05-27 17:24:23'),
(580, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'ETH/USDT', 14169.63, '240', 14594.72, 'win', 'completed', '2025-05-27 13:25:16', '2025-05-27 17:25:16'),
(581, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 1050.14, '240', 1081.64, 'win', 'completed', '2025-05-27 13:42:24', '2025-05-27 17:42:24'),
(582, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 2101.47, '240', 2164.51, 'win', 'completed', '2025-05-27 14:46:51', '2025-05-27 18:46:51'),
(583, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'ETH/USDT', 2000.00, '240', 2060.00, 'win', 'completed', '2025-05-27 15:24:17', '2025-05-27 19:24:17'),
(584, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 1614701.55, '240', 1663142.60, 'win', 'completed', '2025-05-28 14:26:03', '2025-05-28 18:26:03'),
(585, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 131210.96, '240', 135147.29, 'win', 'completed', '2025-05-28 14:26:47', '2025-05-28 18:26:47'),
(586, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'ETH/USDT', 26294.72, '240', 27083.56, 'win', 'completed', '2025-05-28 14:27:19', '2025-05-28 18:27:19'),
(587, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'ETH/USDT', 2060.00, '240', 2121.80, 'win', 'completed', '2025-05-28 14:32:28', '2025-05-28 18:32:28'),
(588, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'ETH/USDT', 2014.60, '240', 2075.04, 'win', 'completed', '2025-05-28 14:52:43', '2025-05-28 18:52:43'),
(589, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'ETH/USDT', 2164.51, '240', 2229.45, 'win', 'completed', '2025-05-28 14:57:50', '2025-05-28 18:57:50'),
(590, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'ETH/USDT', 1081.64, '240', 1114.09, 'win', 'completed', '2025-05-28 15:37:01', '2025-05-28 19:37:01'),
(591, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ETH/USDT', 834392.40, '5', 859424.17, 'win', 'completed', '2025-05-28 17:11:13', '2025-05-28 17:16:13'),
(592, '95', 'Carlos', 'Martin', 'sell', 'CRYPTO', 'ETH/USDT', 20000.00, '5', 20600.00, 'win', 'completed', '2025-05-28 18:35:51', '2025-05-28 18:40:51'),
(593, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'ETH/USDT', 43400.00, '240', 44702.00, 'win', 'completed', '2025-05-28 18:45:11', '2025-05-28 22:45:11'),
(594, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 1663142.60, '240', 1729668.30, 'win', 'completed', '2025-05-29 14:25:40', '2025-05-29 18:25:40'),
(595, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 179849.29, '240', 187043.26, 'win', 'completed', '2025-05-29 14:28:06', '2025-05-29 18:28:06'),
(596, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 27083.56, '240', 28166.90, 'win', 'completed', '2025-05-29 14:28:43', '2025-05-29 18:28:43'),
(597, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'BTC/USDT', 3011.80, '240', 3132.27, 'win', 'completed', '2025-05-29 14:34:15', '2025-05-29 18:34:15'),
(598, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 2075.04, '240', 2158.04, 'win', 'completed', '2025-05-29 14:36:54', '2025-05-29 18:36:54'),
(599, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 1114.09, '240', 1158.65, 'win', 'completed', '2025-05-29 14:59:28', '2025-05-29 18:59:28'),
(600, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 2229.45, '240', 2318.63, 'win', 'completed', '2025-05-29 15:46:43', '2025-05-29 19:46:43'),
(601, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 1729668.30, '240', 1781558.35, 'win', 'completed', '2025-05-30 13:52:09', '2025-05-30 17:52:09'),
(602, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 187043.26, '240', 192654.56, 'win', 'completed', '2025-05-30 13:53:11', '2025-05-30 17:53:11'),
(603, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'XRP/USDT', 28166.90, '240', 29011.91, 'win', 'completed', '2025-05-30 13:53:47', '2025-05-30 17:53:47'),
(604, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'XRP/USDT', 3132.27, '240', 3226.24, 'win', 'completed', '2025-05-30 13:56:42', '2025-05-30 17:56:42'),
(605, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'XRP/USDT', 2158.04, '240', 2222.78, 'win', 'completed', '2025-05-30 13:57:58', '2025-05-30 17:57:58'),
(606, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 200000.00, '5', 220000.00, 'win', 'completed', '2025-05-30 14:55:19', '2025-05-30 15:00:19'),
(607, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'XRP/USDT', 1158.65, '240', 1193.41, 'win', 'completed', '2025-05-30 15:06:44', '2025-05-30 19:06:44'),
(608, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'XRP/USDT', 2318.63, '5', 2388.19, 'win', 'completed', '2025-05-30 15:30:20', '2025-05-30 15:35:20'),
(609, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 2222.78, '240', 2311.69, 'win', 'completed', '2025-06-02 14:35:27', '2025-06-02 18:35:27'),
(610, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 1781558.35, '240', 1852820.68, 'win', 'completed', '2025-06-02 14:35:32', '2025-06-02 18:35:32'),
(611, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'BTC/USDT', 29011.91, '240', 30172.39, 'win', 'completed', '2025-06-02 14:36:26', '2025-06-02 18:36:26'),
(612, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'BTC/USDT', 3226.24, '240', 3355.29, 'win', 'completed', '2025-06-02 14:37:50', '2025-06-02 18:37:50'),
(613, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 192654.56, '240', 200360.74, 'win', 'completed', '2025-06-02 14:38:13', '2025-06-02 18:38:13'),
(614, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'BTC/USDT', 2388.19, '240', 2483.72, 'win', 'completed', '2025-06-02 14:55:06', '2025-06-02 18:55:06'),
(615, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 1193.41, '240', 1241.15, 'win', 'completed', '2025-06-02 15:30:52', '2025-06-02 19:30:52'),
(616, '13', 'Adam', 'Molzof', 'sell', 'CRYPTO', 'ADA/USDT', 306200.00, '5', 336820.00, 'win', 'completed', '2025-06-02 15:32:51', '2025-06-02 15:37:51'),
(617, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 400000.00, '60', 440000.00, 'win', 'completed', '2025-06-02 16:18:21', '2025-06-02 17:18:21'),
(618, '122', 'Teleri', 'Rees', 'sell', 'CRYPTO', 'BTC/USDT', 582.00, '240', 605.28, 'win', 'completed', '2025-06-02 19:25:59', '2025-06-02 23:25:59'),
(619, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 200360.74, '240', 206371.56, 'win', 'completed', '2025-06-03 13:13:42', '2025-06-03 17:13:42'),
(620, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 1852820.68, '240', 1908405.30, 'win', 'completed', '2025-06-03 13:14:50', '2025-06-03 17:14:50'),
(621, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'SOL/USDT', 30172.39, '240', 31077.56, 'win', 'completed', '2025-06-03 13:16:38', '2025-06-03 17:16:38'),
(622, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'SOL/USDT', 1241.15, '240', 1278.38, 'win', 'completed', '2025-06-03 13:19:51', '2025-06-03 17:19:51'),
(623, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'SOL/USDT', 3355.29, '240', 3455.95, 'win', 'completed', '2025-06-03 13:20:55', '2025-06-03 17:20:55'),
(624, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'SOL/USDT', 2311.69, '240', 2381.04, 'win', 'completed', '2025-06-03 13:56:35', '2025-06-03 17:56:35'),
(625, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'SOL/USDT', 2483.72, '240', 2558.23, 'win', 'completed', '2025-06-03 14:49:56', '2025-06-03 18:49:56'),
(626, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 120000.00, '5', 132000.00, 'win', 'completed', '2025-06-03 16:09:34', '2025-06-03 16:14:34'),
(627, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ADA/USDT', 250000.00, '60', 275000.00, 'win', 'completed', '2025-06-03 16:10:22', '2025-06-03 17:10:22'),
(628, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'SOL/USDT', 605.28, '240', 623.44, 'win', 'completed', '2025-06-03 18:45:36', '2025-06-03 22:45:36'),
(629, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 639.19, '240', 658.37, 'win', 'completed', '2025-06-04 13:07:45', '2025-06-04 17:07:45'),
(630, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'XRP/USDT', 639.19, '240', 651.97, 'win', 'completed', '2025-06-04 13:08:16', '2025-06-04 17:08:16'),
(631, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 1908405.30, '240', 1946573.41, 'win', 'completed', '2025-06-04 13:08:36', '2025-06-04 17:08:36'),
(632, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'XRP/USDT', 31077.56, '240', 31699.11, 'win', 'completed', '2025-06-04 13:09:49', '2025-06-04 17:09:49'),
(633, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'XRP/USDT', 206371.56, '240', 210498.99, 'win', 'completed', '2025-06-04 13:11:54', '2025-06-04 17:11:54'),
(634, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 1190.52, '240', 1226.24, 'win', 'completed', '2025-06-04 13:54:44', '2025-06-04 17:54:44'),
(635, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'XRP/USDT', 1190.52, '240', 1214.33, 'win', 'completed', '2025-06-04 13:55:36', '2025-06-04 17:55:36'),
(636, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'XRP/USDT', 1279.12, '240', 1304.70, 'win', 'completed', '2025-06-04 13:58:24', '2025-06-04 17:58:24'),
(637, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 1279.11, '240', 1317.48, 'win', 'completed', '2025-06-04 13:59:22', '2025-06-04 17:59:22'),
(638, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'XRP/USDT', 1727.97, '240', 1762.53, 'win', 'completed', '2025-06-04 14:43:36', '2025-06-04 18:43:36'),
(639, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'ETH/USDT', 1727.98, '240', 1779.82, 'win', 'completed', '2025-06-04 14:44:40', '2025-06-04 18:44:40'),
(640, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 1946573.41, '240', 2004970.61, 'win', 'completed', '2025-06-04 18:28:49', '2025-06-04 22:28:49'),
(641, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 210498.99, '240', 216813.96, 'win', 'completed', '2025-06-04 18:29:50', '2025-06-04 22:29:50'),
(642, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'ETH/USDT', 31699.11, '240', 32650.08, 'win', 'completed', '2025-06-04 18:31:08', '2025-06-04 22:31:08'),
(643, '122', 'Teleri', 'Rees', 'sell', 'CRYPTO', 'XRP/USDT', 1916.22, '240', 1954.54, 'win', 'completed', '2025-06-04 18:56:40', '2025-06-04 22:56:40'),
(644, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'ETH/USDT', 1916.22, '240', 1973.71, 'win', 'completed', '2025-06-04 18:57:39', '2025-06-04 22:57:39'),
(645, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'XRP/USDT', 250000.00, '5', 255000.00, 'win', 'completed', '2025-06-04 23:43:25', '2025-06-04 23:48:25'),
(646, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'ETH/USDT', 220000.00, '60', 226600.00, 'win', 'completed', '2025-06-04 23:44:05', '2025-06-05 00:44:05'),
(647, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 321510.00, '5', 353661.00, 'win', 'completed', '2025-06-05 01:18:09', '2025-06-05 01:23:09'),
(648, '108', 'Joseph', 'Solomon', 'sell', 'CRYPTO', 'BTC/USDT', 686.50, '240', 713.96, 'win', 'completed', '2025-06-05 03:32:35', '2025-06-05 07:32:35'),
(649, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 2004970.61, '240', 2085169.43, 'win', 'completed', '2025-06-05 13:12:16', '2025-06-05 17:12:16'),
(650, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 216813.96, '240', 225486.52, 'win', 'completed', '2025-06-05 13:13:55', '2025-06-05 17:13:55'),
(651, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'BTC/USDT', 32650.08, '240', 33956.08, 'win', 'completed', '2025-06-05 13:15:06', '2025-06-05 17:15:06'),
(652, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 2440.57, '240', 2538.19, 'win', 'completed', '2025-06-05 13:19:51', '2025-06-05 17:19:51'),
(653, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 1310.34, '240', 1362.75, 'win', 'completed', '2025-06-05 13:37:03', '2025-06-05 17:37:03'),
(654, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'BTC/USDT', 10332.00, '240', 10745.28, 'win', 'completed', '2025-06-05 13:43:46', '2025-06-05 17:43:46'),
(655, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'BTC/USDT', 2622.18, '240', 2727.07, 'win', 'completed', '2025-06-05 14:20:18', '2025-06-05 18:20:18'),
(656, '122', 'Teleri', 'Rees', 'sell', 'CRYPTO', 'BTC/USDT', 3928.25, '240', 4085.38, 'win', 'completed', '2025-06-05 18:43:43', '2025-06-05 22:43:43'),
(657, '13', 'Adam', 'Molzof', 'sell', 'CRYPTO', 'ADA/USDT', 337585.50, '5', 371344.05, 'win', 'completed', '2025-06-05 18:46:16', '2025-06-05 18:51:16'),
(658, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'SOL/USDT', 24750.14, '240', 25492.64, 'win', 'completed', '2025-06-06 13:14:45', '2025-06-06 17:14:45'),
(659, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'BTC/USDT', 24750.14, '240', 26235.15, 'win', 'completed', '2025-06-06 13:15:30', '2025-06-06 17:15:30'),
(660, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 2085169.43, '240', 2210279.60, 'win', 'completed', '2025-06-06 14:05:00', '2025-06-06 18:05:00'),
(661, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 225486.52, '240', 239015.71, 'win', 'completed', '2025-06-06 14:05:51', '2025-06-06 18:05:51'),
(662, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 33956.08, '240', 35993.44, 'win', 'completed', '2025-06-06 14:06:51', '2025-06-06 18:06:51'),
(663, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 1269.10, '240', 1345.25, 'win', 'completed', '2025-06-06 14:29:29', '2025-06-06 18:29:29'),
(664, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'SOL/USDT', 1269.09, '240', 1307.16, 'win', 'completed', '2025-06-06 14:29:56', '2025-06-06 18:29:56'),
(665, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 2727.07, '240', 2890.69, 'win', 'completed', '2025-06-06 14:52:29', '2025-06-06 18:52:29'),
(666, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 681.38, '240', 722.26, 'win', 'completed', '2025-06-06 14:54:14', '2025-06-06 18:54:14'),
(667, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'SOL/USDT', 681.37, '240', 701.81, 'win', 'completed', '2025-06-06 14:54:42', '2025-06-06 18:54:42'),
(668, '121', 'Jennifer', 'Dawson', 'buy', 'CRYPTO', 'BTC/USDT', 810.00, '240', 858.60, 'win', 'completed', '2025-06-06 16:18:34', '2025-06-06 20:18:34'),
(669, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'BTC/USDT', 332100.00, '10', 352026.00, 'win', 'completed', '2025-06-06 17:04:27', '2025-06-06 17:14:27'),
(670, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 2210279.60, '240', 2276587.99, 'win', 'completed', '2025-06-06 19:20:38', '2025-06-06 23:20:38'),
(671, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 239015.71, '240', 246186.18, 'win', 'completed', '2025-06-06 19:21:36', '2025-06-06 23:21:36'),
(672, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'SOL/USDT', 35993.44, '240', 37073.24, 'win', 'completed', '2025-06-06 19:22:42', '2025-06-06 23:22:42'),
(673, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 2276587.99, '240', 2322119.75, 'win', 'completed', '2025-06-09 13:07:23', '2025-06-09 17:07:23'),
(674, '121', 'Jennifer', 'Dawson', 'buy', 'CRYPTO', 'BTC/USDT', 850.00, '240', 867.00, 'win', 'completed', '2025-06-09 13:07:48', '2025-06-09 17:07:48'),
(675, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'BTC/USDT', 246186.18, '240', 251109.90, 'win', 'completed', '2025-06-09 13:08:34', '2025-06-09 17:08:34'),
(676, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'BTC/USDT', 37073.24, '240', 37814.70, 'win', 'completed', '2025-06-09 13:09:45', '2025-06-09 17:09:45'),
(677, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'BTC/USDT', 2652.41, '240', 2705.46, 'win', 'completed', '2025-06-09 13:49:10', '2025-06-09 17:49:10'),
(678, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'BTC/USDT', 1424.07, '240', 1452.55, 'win', 'completed', '2025-06-09 13:49:39', '2025-06-09 17:49:39'),
(679, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'BTC/USDT', 51727.79, '240', 52762.35, 'win', 'completed', '2025-06-09 14:11:02', '2025-06-09 18:11:02'),
(680, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'BTC/USDT', 2890.69, '5', 2948.50, 'win', 'completed', '2025-06-09 14:55:58', '2025-06-09 15:00:58'),
(681, '115', 'Ludolf', 'Michael', 'buy', 'CRYPTO', 'BTC/USDT', 550000.00, '240', 561000.00, 'win', 'completed', '2025-06-09 16:11:48', '2025-06-09 20:11:48'),
(682, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'BTC/USDT', 1053.96, '240', 1075.04, 'win', 'completed', '2025-06-09 16:29:45', '2025-06-09 20:29:45'),
(683, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'BTC/USDT', 4085.38, '240', 4167.09, 'win', 'completed', '2025-06-09 18:44:21', '2025-06-09 22:44:21'),
(684, '125', 'Mitchell', 'Keppler', 'buy', 'CRYPTO', 'BTC/USDT', 61422.00, '240', 62650.44, 'win', 'completed', '2025-06-09 21:16:22', '2025-06-10 01:16:22'),
(685, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 2322119.75, '240', 2391783.34, 'win', 'completed', '2025-06-10 12:36:21', '2025-06-10 16:36:21'),
(686, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 251109.90, '240', 258643.20, 'win', 'completed', '2025-06-10 12:37:46', '2025-06-10 16:37:46'),
(687, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'ETH/USDT', 37814.70, '240', 38949.14, 'win', 'completed', '2025-06-10 12:38:47', '2025-06-10 16:38:47'),
(688, '121', 'Jennifer', 'Dawson', 'buy', 'CRYPTO', 'ETH/USDT', 875.00, '240', 901.25, 'win', 'completed', '2025-06-10 12:41:42', '2025-06-10 16:41:42'),
(689, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'ETH/USDT', 1075.04, '240', 1107.29, 'win', 'completed', '2025-06-10 12:47:54', '2025-06-10 16:47:54'),
(690, '125', 'Mitchell', 'Keppler', 'buy', 'CRYPTO', 'ETH/USDT', 68166.44, '240', 70211.43, 'win', 'completed', '2025-06-10 13:18:51', '2025-06-10 17:18:51'),
(691, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'ETH/USDT', 52762.35, '240', 54345.22, 'win', 'completed', '2025-06-10 13:27:06', '2025-06-10 17:27:06'),
(692, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 2705.46, '240', 2786.62, 'win', 'completed', '2025-06-10 13:40:52', '2025-06-10 17:40:52'),
(693, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 1497.55, '240', 1542.48, 'win', 'completed', '2025-06-10 14:02:09', '2025-06-10 18:02:09'),
(694, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 2948.50, '240', 3036.96, 'win', 'completed', '2025-06-10 15:04:25', '2025-06-10 19:04:25'),
(695, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'ETH/USDT', 4167.09, '240', 4292.10, 'win', 'completed', '2025-06-10 18:43:34', '2025-06-10 22:43:34'),
(696, '13', 'Adam', 'Molzof', 'buy', 'CRYPTO', 'ADA/USDT', 145250.00, '5', 159775.00, 'win', 'completed', '2025-06-10 20:52:23', '2025-06-10 20:57:23'),
(697, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 2634083.34, '240', 2686765.01, 'win', 'completed', '2025-06-11 13:19:56', '2025-06-11 17:19:56'),
(698, '125', 'Mitchell', 'Keppler', 'buy', 'CRYPTO', 'ETH/USDT', 74354.43, '240', 77328.61, 'win', 'completed', '2025-06-11 13:20:16', '2025-06-11 17:20:16'),
(699, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'SOL/USDT', 258643.20, '240', 263816.06, 'win', 'completed', '2025-06-11 13:21:04', '2025-06-11 17:21:04'),
(700, '108', 'Joseph', 'Solomon', 'buy', 'CRYPTO', 'ETH/USDT', 1107.29, '240', 1151.58, 'win', 'completed', '2025-06-11 13:21:52', '2025-06-11 17:21:52'),
(701, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'SOL/USDT', 38949.14, '240', 39728.12, 'win', 'completed', '2025-06-11 13:21:52', '2025-06-11 17:21:52'),
(702, '121', 'Jennifer', 'Dawson', 'buy', 'CRYPTO', 'ETH/USDT', 900.00, '240', 936.00, 'win', 'completed', '2025-06-11 13:27:54', '2025-06-11 17:27:54'),
(703, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'SOL/USDT', 2786.62, '240', 2842.35, 'win', 'completed', '2025-06-11 14:09:52', '2025-06-11 18:09:52'),
(704, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'ETH/USDT', 54345.22, '240', 56519.03, 'win', 'completed', '2025-06-11 14:28:51', '2025-06-11 18:28:51'),
(705, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 1542.48, '240', 1604.18, 'win', 'completed', '2025-06-11 14:35:30', '2025-06-11 18:35:30'),
(706, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 3036.96, '240', 3158.44, 'win', 'completed', '2025-06-11 15:51:57', '2025-06-11 19:51:57'),
(707, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'ETH/USDT', 4292.10, '240', 4463.78, 'win', 'completed', '2025-06-11 18:46:07', '2025-06-11 22:46:07'),
(708, '125', 'Mitchell', 'Keppler', 'sell', 'CRYPTO', 'BTC/USDT', 86197.61, '240', 87921.56, 'win', 'completed', '2025-06-12 13:19:58', '2025-06-12 17:19:58'),
(709, '97', 'Agatha', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 2686765.01, '240', 2740500.31, 'win', 'completed', '2025-06-12 13:20:02', '2025-06-12 17:20:02'),
(710, '112', 'Cheyenne', 'Lipka', 'sell', 'CRYPTO', 'BTC/USDT', 263816.06, '240', 269092.38, 'win', 'completed', '2025-06-12 13:20:51', '2025-06-12 17:20:51'),
(711, '101', 'alicja', 'johnson', 'sell', 'CRYPTO', 'BTC/USDT', 39728.12, '240', 40522.68, 'win', 'completed', '2025-06-12 13:21:41', '2025-06-12 17:21:41'),
(712, '93', 'Mary Ann', 'Atwell', 'sell', 'CRYPTO', 'BTC/USDT', 2842.35, '240', 2899.20, 'win', 'completed', '2025-06-12 13:52:59', '2025-06-12 17:52:59'),
(713, '120', 'Suganthi', 'McNeill', 'sell', 'CRYPTO', 'BTC/USDT', 56519.03, '240', 57649.41, 'win', 'completed', '2025-06-12 14:00:58', '2025-06-12 18:00:58'),
(714, '91', 'Katarina', 'De La Font', 'sell', 'CRYPTO', 'BTC/USDT', 1604.18, '240', 1636.26, 'win', 'completed', '2025-06-12 14:55:20', '2025-06-12 18:55:20'),
(715, '121', 'Jennifer', 'Dawson', 'sell', 'CRYPTO', 'BTC/USDT', 936.00, '240', 954.72, 'win', 'completed', '2025-06-12 15:43:59', '2025-06-12 19:43:59'),
(716, '107', 'Viktoriya', 'Schatz', 'sell', 'CRYPTO', 'BTC/USDT', 3158.44, '240', 3221.61, 'win', 'completed', '2025-06-12 16:04:09', '2025-06-12 20:04:09');
INSERT INTO `live_trades` (`id`, `userid`, `f_name`, `l_name`, `transaction_type`, `asset_class`, `asset_ticker`, `trade_amount`, `duration`, `profit_or_loss`, `outcome`, `status`, `date`, `set_time`) VALUES
(717, '122', 'Teleri', 'Rees', 'sell', 'CRYPTO', 'BTC/USDT', 4463.78, '240', 4553.06, 'win', 'completed', '2025-06-12 19:22:05', '2025-06-12 23:22:05'),
(718, '125', 'Mitchell', 'Keppler', 'buy', 'CRYPTO', 'ETH/USDT', 87921.56, '240', 91438.42, 'win', 'completed', '2025-06-13 13:27:17', '2025-06-13 17:27:17'),
(719, '91', 'Katarina', 'De La Font', 'buy', 'CRYPTO', 'ETH/USDT', 1636.26, '240', 1701.71, 'win', 'completed', '2025-06-13 13:46:19', '2025-06-13 17:46:19'),
(720, '97', 'Agatha', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 2740500.31, '240', 2850120.32, 'win', 'completed', '2025-06-13 13:48:15', '2025-06-13 17:48:15'),
(721, '112', 'Cheyenne', 'Lipka', 'buy', 'CRYPTO', 'ETH/USDT', 269092.38, '240', 279856.08, 'win', 'completed', '2025-06-13 13:49:13', '2025-06-13 17:49:13'),
(722, '101', 'alicja', 'johnson', 'buy', 'CRYPTO', 'ETH/USDT', 40522.68, '240', 42143.59, 'win', 'completed', '2025-06-13 13:50:03', '2025-06-13 17:50:03'),
(723, '93', 'Mary Ann', 'Atwell', 'buy', 'CRYPTO', 'ETH/USDT', 2599.20, '240', 2703.17, 'win', 'completed', '2025-06-13 13:59:51', '2025-06-13 17:59:51'),
(724, '107', 'Viktoriya', 'Schatz', 'buy', 'CRYPTO', 'ETH/USDT', 3221.61, '240', 3350.47, 'win', 'completed', '2025-06-13 15:59:22', '2025-06-13 19:59:22'),
(725, '120', 'Suganthi', 'McNeill', 'buy', 'CRYPTO', 'ETH/USDT', 57649.41, '240', 59955.39, 'win', 'completed', '2025-06-13 16:37:53', '2025-06-13 20:37:53'),
(726, '122', 'Teleri', 'Rees', 'buy', 'CRYPTO', 'ETH/USDT', 4553.06, '5', 4735.18, 'win', 'completed', '2025-06-13 20:20:11', '2025-06-13 20:25:11'),
(727, '2', 'Riko', 'Daniella', 'buy', 'CRYPTO', 'BTC/USDT', 100.00, '5', 102.00, 'win', 'completed', '2025-09-06 12:34:08', '2025-09-06 12:39:08'),
(728, '2', 'Riko', 'Daniella', 'buy', 'FOREX', 'EUR/USD', 438945.91, '5', 3379.88, 'loss', 'ongoing', '2025-09-07 00:45:59', '2025-09-07 00:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `name`, `email`, `last_sent`) VALUES
(1, 'hunn', 'jeffreydikewonsi@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `residency_status`
--

CREATE TABLE `residency_status` (
  `id` int(100) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `front_image_path` varchar(255) NOT NULL,
  `back_image_path` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `residency_status`
--

INSERT INTO `residency_status` (`id`, `userid`, `front_image_path`, `back_image_path`, `date`, `status`) VALUES
(1, '11', '20241128_005300.jpg', '20241128_005307.jpg', '2024-11-27 23:53:32', 1),
(2, '13', '20241128_214800.jpg', '20241128_214800.jpg', '2024-11-29 04:48:57', 1),
(3, '14', 'IMG_3448.jpeg', 'IMG_3449.jpeg', '2024-12-01 13:29:33', 1),
(4, '44', 'image.jpg', 'image.jpg', '2025-01-15 23:57:15', 1),
(5, '56', 'MPS - Passport.pdf', 'MPS - Passport.pdf', '2025-01-24 05:09:37', 1),
(6, '47', 'LeaseRenewalAgreement_272025.pdf', 'LeaseRenewalAgreement_272025.pdf', '2025-02-11 04:08:59', 1),
(7, '70', '173978076759186771740036335409.jpg', '17397807809374503472008145950681.jpg', '2025-02-17 08:27:45', 1),
(8, '67', 'Screenshot_20250217_055739_My Energy Center.jpg', 'Screenshot_20250217_055953_My Energy Center.jpg', '2025-02-17 14:01:28', 1),
(9, '62', 'image.jpg', 'image.jpg', '2025-03-07 18:15:15', 1),
(10, '100', 'Image_250415_065459.jpeg', 'Image_250415_065459.jpeg', '2025-04-15 14:56:03', 1),
(11, '118', 'IMG_4958.jpg', 'IMG_4959.jpg', '2025-05-21 19:08:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stock_id` int(100) NOT NULL,
  `stock_name` varchar(100) NOT NULL,
  `stock_symbol` varchar(100) NOT NULL,
  `stock_price` decimal(10,4) NOT NULL,
  `stock_image_path` varchar(255) NOT NULL DEFAULT 'default.png',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stock_id`, `stock_name`, `stock_symbol`, `stock_price`, `stock_image_path`, `date_added`, `date_modified`, `modified_by`) VALUES
(1, 'Apple', 'AAPL', 181.3200, '../uploads/stocks/1682574931.png', '2024-05-08 17:03:00', '2024-05-08 17:03:00', 'admin1'),
(2, 'Mircosoft', 'MSFT', 409.0900, '../uploads/stocks/1680249512.png', '2024-05-08 17:04:59', '2024-05-08 17:04:59', 'admin1'),
(3, 'Alibaba', 'BABA', 78.8150, '../uploads/stocks/1680249401.png', '2024-05-08 17:10:45', '2024-05-08 17:10:45', 'admin1'),
(4, 'Alphabet', 'GOOGL', 168.3900, '../uploads/stocks/1680249225.png', '2024-05-08 17:11:40', '2024-05-08 17:11:40', 'admin1'),
(5, 'Amazon', 'AMZN', 187.3050, '../uploads/stocks/1680248889.png', '2024-05-08 17:13:28', '2024-05-08 17:13:28', 'admin1'),
(6, 'TESLA', 'TSLA', 177.4000, '../uploads/stocks/1680248834.png', '2024-05-08 17:15:55', '2024-05-08 17:15:55', 'admin1'),
(7, 'NetApp', 'NTAP', 106.8500, '../uploads/stocks/1680248707.png', '2024-05-08 17:16:55', '2024-05-08 17:16:55', 'admin1'),
(8, 'AppFolio', 'APPF', 244.0550, '../uploads/stocks/1680248614.png', '2024-05-08 17:18:49', '2024-05-08 17:18:49', 'admin1'),
(9, 'AppTech P', 'APCX', 0.8800, '../uploads/stocks/1680248425.png', '2024-05-08 17:19:48', '2024-05-08 17:19:48', 'admin1'),
(10, 'Alcoa', 'AA', 37.1300, '../uploads/stocks/1680248190.png', '2024-05-08 17:20:49', '2024-05-08 17:20:49', 'admin1'),
(11, 'Walmart', 'WMT', 60.0500, '../uploads/stocks/wa.svg', '2024-05-08 17:22:15', '2024-05-08 17:22:15', 'admin1'),
(12, 'Nike', 'NKE', 93.2100, '../uploads/stocks/nn.svg', '2024-05-08 17:23:10', '2024-05-08 17:23:10', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `stock_trades`
--

CREATE TABLE `stock_trades` (
  `id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `stock_name` varchar(255) NOT NULL,
  `stock_symbol` varchar(255) NOT NULL,
  `stock_amount` int(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `preferred_wallet` varchar(255) NOT NULL,
  `crypto_wallet` varchar(255) NOT NULL,
  `traded_before` varchar(100) NOT NULL,
  `highest_investment` varchar(255) NOT NULL,
  `profile_photo` varchar(100) NOT NULL DEFAULT 'default.png',
  `acc_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `trade_bonus` decimal(10,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(50) DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `referral_bonus` int(100) NOT NULL DEFAULT 0,
  `total_referred` int(100) NOT NULL DEFAULT 0,
  `email_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `residency_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `id_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `registered_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp(),
  `trades_per_day` int(100) NOT NULL DEFAULT 5,
  `last_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `f_name`, `l_name`, `email`, `password`, `phone`, `country`, `preferred_wallet`, `crypto_wallet`, `traded_before`, `highest_investment`, `profile_photo`, `acc_balance`, `trade_bonus`, `referral_code`, `referred_by`, `referral_bonus`, `total_referred`, `email_status`, `residency_status`, `id_status`, `user_status`, `registered_at`, `modified_at`, `trades_per_day`, `last_sent`) VALUES
(2, 'Riko', 'Daniella', 'ruth@gmail.com', '0000', '12345678', 'United Kingdom', 'qwe2d3efrvfgfd', 'sqdwgrhdwqefgrtjyukjthregfd', 'no', '90000', 'default.png', 1316837.74, 25.00, NULL, NULL, 120000, 5110, 'not_verified', 'not_verified', 'pending', 1, '2024-05-26 10:52:32', '2024-05-26 10:52:31', 104, '2025-02-28 00:30:03'),
(4, 'Yankee', 'Lx', 'tradewithl.shippy@gmail.com', 'Yankee12345', '62383893', 'USA', 'Coinbase', 'Coinbase', 'Yes', '19k', 'default.png', 0.00, 0.00, NULL, NULL, 0, 0, 'not_verified', 'not_verified', 'not_verified', 0, '2024-11-15 04:27:34', '2024-11-15 04:27:34', 5, '2025-02-28 00:30:18'),
(129, 'hello', 'john', 'testing@example.com', '0000', '98329929929', 'Belgium', 'jona', 'but', 'Yes', '9992', 'default.png', 0.00, 0.00, '4a7b07e9e6', NULL, 0, 0, 'not_verified', 'not_verified', 'not_verified', 0, '2025-08-31 17:15:33', '2025-08-31 17:15:33', 5, NULL),
(130, 'john', 'peter', 'testing@example.com5HgM81DT&#039; OR 758=(SELECT 758 FROM PG_SLEEP(15))--', '0000', '92834893', 'Benin', 'hfdn', 'fugjdn', 'Yes', '29929', 'default.png', 0.00, 0.00, '26cde26d13', NULL, 0, 0, 'not_verified', 'not_verified', 'not_verified', 0, '2025-08-31 17:46:35', '2025-08-31 17:46:35', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersx`
--

CREATE TABLE `usersx` (
  `userid` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `preferred_wallet` varchar(255) NOT NULL,
  `crypto_wallet` varchar(255) NOT NULL,
  `traded_before` varchar(100) NOT NULL,
  `highest_investment` varchar(255) NOT NULL,
  `profile_photo` varchar(100) NOT NULL DEFAULT 'default.png',
  `acc_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `trade_bonus` decimal(10,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(50) DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `referral_bonus` int(100) NOT NULL DEFAULT 0,
  `total_referred` int(100) NOT NULL DEFAULT 0,
  `email_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `residency_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `id_status` varchar(100) NOT NULL DEFAULT 'not_verified',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `registered_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp(),
  `trades_per_day` int(100) NOT NULL DEFAULT 5,
  `last_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `usersx`
--

INSERT INTO `usersx` (`userid`, `f_name`, `l_name`, `email`, `password`, `phone`, `country`, `preferred_wallet`, `crypto_wallet`, `traded_before`, `highest_investment`, `profile_photo`, `acc_balance`, `trade_bonus`, `referral_code`, `referred_by`, `referral_bonus`, `total_referred`, `email_status`, `residency_status`, `id_status`, `user_status`, `registered_at`, `modified_at`, `trades_per_day`, `last_sent`) VALUES
(1, 'Jason', 'Finch', ' jasonfinch@atomicmail.io', '', '', '', '', '', '', '', 'default.png', 0.00, 0.00, NULL, NULL, 0, 0, 'not_verified', 'not_verified', 'not_verified', 0, '2025-07-01 06:29:24', '2025-07-01 06:29:24', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `crypto` varchar(100) NOT NULL,
  `shortcode` varchar(100) NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `qr_code_path` varchar(255) NOT NULL DEFAULT 'default.png',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `crypto`, `shortcode`, `wallet_address`, `qr_code_path`, `date_added`, `modified_at`, `modified_by`) VALUES
(1, 'BITCOIN', 'BTC', 'bc1qp7630dvmzmpdj8r7ypxjcqanytj4ud7m29v8up', '../uploads/wallets//WhatsApp Image 2025-03-16 at 10.28.41 AM.jpeg', '2024-10-09 23:20:14', '2024-10-10 01:58:00', 'admin1'),
(3, 'XRP LEDGER', 'XRP', 'rnW2QW9HpjnaRpjCvKFynbndedTZLni5uH', '../uploads/wallets//WhatsApp Image 2024-12-02 at 4.51.29 AM.jpeg', '2024-12-02 10:52:33', '2024-12-02 10:52:33', 'grandmaster'),
(4, 'ETHEREUM', 'ETH', '0xBcd3BB9edc18F17837f68373d6f0FBA8b31e938c', '../uploads/walletsWhatsApp Image 2024-12-08 at 1.48.31 PM.jpeg', '2024-12-08 19:52:09', '2024-12-08 19:52:09', 'grandmaster'),
(5, 'USDT', 'USDT TRC20', 'TPpom8hZLe4EMv1VdjjVUj5S1ZZ6eqqufD', '../uploads/walletsIMG_0935.jpeg', '2024-12-08 21:48:10', '2024-12-08 21:48:10', 'grandmaster'),
(6, 'USDT (ERC20)', 'USDT (ERC20)', '0xBcd3BB9edc18F17837f68373d6f0FBA8b31e938c', '../uploads/walletsIMG_0936.jpeg', '2024-12-08 21:49:23', '2024-12-08 21:49:23', 'grandmaster'),
(7, 'USDT (TRC20)', 'USDT (TRC20)', 'TPpom8hZLe4EMv1VdjjVUj5S1ZZ6eqqufD', '../uploads/walletsIMG_0935.jpeg', '2024-12-08 21:49:56', '2024-12-08 21:49:56', 'grandmaster'),
(8, 'DOGECOIN', 'DOGE', 'DLv1rQ1uUm5NxZZmE8t5wi7GEG8gvr8skn', '../uploads/walletsCASE1.jpeg', '2024-12-16 18:39:38', '2024-12-16 18:39:38', 'grandmaster');

--
-- Triggers `wallets`
--
DELIMITER $$
CREATE TRIGGER `prevent_qr_code_path_update` BEFORE UPDATE ON `wallets` FOR EACH ROW BEGIN
  IF OLD.qr_code_path <> NEW.qr_code_path THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'You are not allowed to update.'$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `prevent_wallet_address_update` BEFORE UPDATE ON `wallets` FOR EACH ROW BEGIN
  IF OLD.wallet_address <> NEW.wallet_address THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'You are not allowed to update the wallet_address column.'$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(100) NOT NULL,
  `userid` int(100) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `crypto` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `amount` int(100) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `userid`, `f_name`, `l_name`, `crypto`, `wallet`, `amount`, `reference`, `status`, `date`) VALUES
(1, 2, 'Ruth', 'Benson', 'bitcoin', 'w2e3r4t5kyutfdytfhmfgduigdsetghjuio7re5w4', 10, '30fOG90F4ZMOvYazrhvOvdIzQiOxo9jNxP7lmzmO', 9, '2024-09-27 21:46:44'),
(2, 6, 'Nick', 'Anderson', 'bitcoin', '32bgfdushxcjkljuofdtfio;kjhgfxc', 600000, '2pGAbSUBkAROYFgzIJ5mQeTka3KL38z5Ee4kAA3P', 9, '2024-11-28 08:32:07'),
(3, 14, 'William', 'Kostelnik', 'bitcoin', 'bc1q3gym8084e9wuxch6hmclghrz3egznuccrex4sq', 500, 'AnBhhe5hbcdV7QisQIdpJyib2AmSi5AFs8Vkkd8f', 1, '2024-12-06 12:28:02'),
(4, 6, 'Nick', 'Anderson', 'bitcoin', 'rfuvbluchj bljkhvchgjlm;cjxh nm,.nljbkvj', 500, 'Wfvn5yqRDl8yG4qmLMtezWuzonIHR8dMBJu1Vl7k', 1, '2024-12-08 02:39:58'),
(5, 6, 'Nick', 'Anderson', 'bitcoin', 'u0796854we6r7t8y90u90987654356789', 100000, '3Ez2C6NhapthmpnjNDK1XOtxXOhDpWnaPO4HUnpY', 1, '2024-12-08 09:19:57'),
(6, 14, 'William', 'Kostelnik', 'bitcoin', 'bc1q3gym8084e9wuxch6hmclghrz3egznuccrex4sq', 20000, '2Pdk5Og22YTCKidnvKYG9m5r7P9T2x2inxiGtswF', 9, '2024-12-09 20:37:18'),
(7, 24, 'Del', 'Postell', 'bitcoin', '3D7EkTiHUntkAj8KTaEzhne2h7sie9sQoU', 100, 'u94AAezFreFB43a8t0nbCyxGn5My0cMkG2FynB7n', 1, '2024-12-09 23:35:25'),
(8, 24, 'Del', 'Postell', 'bitcoin_cash', '1LdAvmzpXT6jWdVSkuyu8wjEtW6WAczF5o', 100, 'AK4ld35fnJQKvsMn81hhBpeF2H0TTMbOiGI0Utzb', 9, '2024-12-09 23:46:28'),
(9, 24, 'James', 'Postell', 'bitcoin_cash', '1LdAvmzpXT6jWdVSkuyu8wjEtW6WAczF5o', 5000, '4xD6X4mmELLqj3fJLhsIaArHatyj6skUpcUuV1cB', 9, '2024-12-10 11:26:25'),
(10, 24, 'James', 'Postell', 'bitcoin', '3D7EkTiHUntkAj8KTaEzhne2h7sie9sQoU', 7000, 'cfWN8x7CH6BgecmkT7JmgZjO761ArVvtNdA9x08z', 9, '2024-12-12 19:57:17'),
(11, 27, 'Danny', 'Andrews', 'bitcoin', 'bc1qukqmcged7xzqkvcedw8449f5ekqy7g9h00c2m3', 139, 'iae6HFxLNcmxpRgIOrI5XDamK0gNhdhFLVOsqLIt', 1, '2024-12-13 02:42:41'),
(12, 24, 'James', 'Postell', 'bitcoin', 'bc1qvq076ydz559r96vsz7dafcjj252l56ac6zhl8k', 3500, 'wWBY39G41vdQGrgFtitCjJSpvD0FGrYQnb54w0e0', 9, '2024-12-15 15:43:57'),
(13, 14, 'William', 'Kostelnik', 'bitcoin', '34WSBmJXYKWwK7ytyS1fUrMN1SMCDP3yhx', 1700000, 'VEmtMznoNSfMKwQ4DCGVVhPJ63BaazX3PrFrkuza', 9, '2025-01-02 07:06:38'),
(14, 26, 'Chet', 'First', 'usdt', 'rEAKseZ7yNgaDuxH74PkqB12cVWohpi7R6', 25, 'Vpti9lUlyscWpO1tAP3fA57B3aA5iuZffzjfE24b', 1, '2025-01-17 09:17:38'),
(15, 63, 'Maria', 'Mondragon', 'bitcoin', '3BTsZ8GYzHb54BdWTTPupxHaV7bmLEFfgg', 750, 'Nnd4y6F4hvssNFxxJVD2c69LLueSAQfv56qAeXsM', 9, '2025-02-04 18:24:11'),
(16, 63, 'Maria', 'Mondragon', 'bitcoin', '3BTsZ8GYzHb54BdWTTPupxHaV7bmLEFfgg', 100, '9YYVuD4uOSny5KGDaMXIwdG89CmVSwb2LIjSMulW', 1, '2025-02-05 04:00:16'),
(17, 66, 'Linda', 'Hamm', 'bitcoin', '3P1W8skD61LLPBhQJ6AhpQoaFDFgn3PHPs', 2730, 'T4MTYJgGiPu7n5xVEXXrzYZK9RoOqJ8DJWfYGww4', 9, '2025-02-18 15:21:28'),
(18, 70, 'Benjamin', 'Lowe', 'bitcoin', '1MQxA3GsJakyFJTDLH9uvX42KTMWJNANvZ', 5000, 'YyfTauLIElW9aGSkb5x43H7ckh9aaNZn6ifvcaGw', 9, '2025-02-19 07:21:05'),
(19, 79, 'Phil', 'Wannell', 'ethereum', '0x0aDe501aDB55B10715C090fe40B78C067A8f819e', 50, 'NKIcpNVWc3m23NzyeSK3iw9A5HXl7JIeYkioFGDD', 1, '2025-03-02 14:58:04'),
(20, 62, 'Jennifer', 'Alexander', 'bitcoin', 'rEAKseZ7yNgaDuxH74PkqB12cVWohpi7R6', 100, 'z30uYcir1vIgnlGm1XY3gpcCaXkhGEV42JAQzjfY', 9, '2025-03-09 02:11:02'),
(21, 68, 'Rocky', 'Restrepo', 'bitcoin', '3JpJhmVUHy33DvsmkBUUkpvnqwb4Ryh7Do', 4100, 'mxFI3TjGtwKSV5OSRMu0139uL4ywrIveMa8bO6fP', 9, '2025-03-14 21:43:20'),
(22, 6, 'Asdas', 'Dasdas', 'bitcoin', 'bc1q95yw2thutar5ad5rm4ye9fay0k695lkvwsgmcu', 35000, 'armMKKVrVtgeTtQf5MhyFSQDdR1XnKOuxfo57Dcz', 9, '2025-03-25 02:09:17'),
(23, 79, 'Phil', 'Wannell', 'ethereum', '0x0ade501adb55b10715c090fe40b78c067a8f819e', 100, 'PFt8Pt4Es8SIZFtPaKgc7duNEBj9eiuojftE988d', 1, '2025-03-28 11:56:30'),
(24, 79, 'Phil', 'Wannell', 'ethereum', '0x0aDe501aDB55B10715C090fe40B78C067A8f819e', 50, 'fvmBBK257cRmlTLCbvKko0yaEV7QofLeXn7GGcwW', 9, '2025-03-28 14:33:19'),
(25, 27, 'Danny', 'Andrews', 'usdt', '0x1098ce65da876421223da12d7d645a75e327e796', 1641, 'fJR8GHjjGFl7JARzYUhqjVcO9rPV1cQW0UQs4fjf', 9, '2025-04-15 15:18:12'),
(26, 96, 'Rebecca', 'Piersall', 'bitcoin', '3NJzRb9EpB3rkJz6jniJek3gz7GvGqtp3b', 100, 'h70sGseerhgLq3oz3XL7Bp5639wO3Q2EUBmrKuxz', 9, '2025-04-18 16:57:56'),
(27, 96, 'Rebecca', 'Piersall', 'bitcoin', '3NJzRb9EpB3rkJz6jniJek3gz7GvGqtp3b', 23, 'J1wWnghApvqiKvYXFB8rnz2cM7barW1hyookCTXA', 9, '2025-04-18 16:58:52'),
(28, 99, 'Darion', 'Green', 'bitcoin', 'bc1qctws58mmkrue3r0s9mnsx533juyjjw42ftzaxf', 328, 'YnmbLaW6JKFXAdI2QOKvDV481TP1LDgpuV30B5d3', 9, '2025-04-22 02:15:04'),
(29, 98, 'Kristin', 'Kirsch', 'bitcoin', '3KybYd18rVLGecYhAU45TEzqKGK6yAjeVX', 10, 'LI0ij7h6Qkr2HKRaPN4MQSoe2EAVVpjf1pjvFs3A', 9, '2025-04-24 01:38:05'),
(30, 96, 'Rebecca', 'Piersall', 'bitcoin', '3NJzRb9EpB3rkJz6jniJek3gz7GvGqtp3b', 100, 'omEaTFzpoPBBjJNuOxFEvpmxLODTxuiDfqUjSDLX', 1, '2025-04-29 16:40:25'),
(31, 96, 'Rebecca', 'Piersall', 'bitcoin', '3NJzRb9EpB3rkJz6jniJek3gz7GvGqtp3b', 23, 'ClEdWSEwQBSfoC8Gmwlvqk4K7JbgbFU1zXt3G7F8', 0, '2025-04-29 16:40:41'),
(32, 107, 'Viktoriya', 'Schatz', 'bitcoin', '3NPcJiY6UoY4YskpUXy24E2K34QJPD5Mm2', 250, 'FbO0CwKDDuK8J6duBUIFEUEUVJDNl92xr7wS15Bh', 9, '2025-05-02 09:30:58'),
(33, 99, 'Darion', 'Green', 'bitcoin', 'bc1qumvsvvzttpqjl5yyh9xryvgqpe2le4jx3k0lxm', 438, '07X1EFyTzYITHsZhPI8gLVE7rYpvXDx7mK393D1a', 9, '2025-05-11 02:48:45'),
(34, 76, 'Tiffany', 'Mayton', 'bitcoin', 'https://cash.app/launch/bitcoin/$tcmfund/QdqeBpLmTO', 2000, 'psJE7szEfezjCvlR79fLioXCC7SvUB1yQ2OyeIFH', 9, '2025-05-12 19:52:44'),
(35, 93, 'Mary Ann', 'Atwell', 'bitcoin', 'bc1q2qrc0fd24fxcj9gz5r6m0wnjsy7nlrhp4mgwde', 200, 'srApET28I77dliYvWgzTDjUkMHGq7NXHD15XNpFU', 1, '2025-05-23 03:44:49'),
(36, 99, 'Darion', 'Green', 'bitcoin', 'bc1qumvsvvzttpqjl5yyh9xryvgqpe2le4jx3k0lxm', 438, 'euIwbpIVruuWB5ER8suNVgHBIcicWR11jkey80Nu', 0, '2025-05-31 07:08:29'),
(37, 93, 'Mary Ann', 'Atwell', 'bitcoin', 'bc1ql3kfdz0qmzsj6789yry8vrsvg64yja4052jfqw', 200, 'u6FGg1F4KLq6juOy1pJIJQNcLr8WiWQV796oQc6C', 1, '2025-06-04 04:35:28'),
(38, 120, 'Suganthi', 'McNeill', 'bitcoin', '3D38wHZmk5KhR77P1xnKpK4LhjG7RjqKum', 745, 'yt3lGDkAvnzGua1fIommG8T62FaBimHdXxBEhin3', 1, '2025-06-05 21:34:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus_withdrawals`
--
ALTER TABLE `bonus_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commodity_trades`
--
ALTER TABLE `commodity_trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copy_traders`
--
ALTER TABLE `copy_traders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copy_trades`
--
ALTER TABLE `copy_trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_proof`
--
ALTER TABLE `deposit_proof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `id_status`
--
ALTER TABLE `id_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_trades`
--
ALTER TABLE `live_trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residency_status`
--
ALTER TABLE `residency_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_trades`
--
ALTER TABLE `stock_trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `bonus_withdrawals`
--
ALTER TABLE `bonus_withdrawals`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commodity_trades`
--
ALTER TABLE `commodity_trades`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `copy_traders`
--
ALTER TABLE `copy_traders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `copy_trades`
--
ALTER TABLE `copy_trades`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deposit_proof`
--
ALTER TABLE `deposit_proof`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `id_status`
--
ALTER TABLE `id_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `live_trades`
--
ALTER TABLE `live_trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=729;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `residency_status`
--
ALTER TABLE `residency_status`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stock_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stock_trades`
--
ALTER TABLE `stock_trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
