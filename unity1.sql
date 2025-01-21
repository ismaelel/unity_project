-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2025 at 09:34 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unity1`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `created_at`) VALUES
(39, 'Bonjour à tous', '2025-01-21 10:32:09'),
(40, 'Vous allez comment', '2025-01-21 10:32:17'),
(41, 'salut', '2025-01-21 20:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `game_stats`
--

CREATE TABLE `game_stats` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `game_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `score` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `time_played` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `game_stats`
--

INSERT INTO `game_stats` (`id`, `user_id`, `game_date`, `score`, `level`, `time_played`) VALUES
(2, 4, '2025-01-19 01:54:25', 3200, 8, 2400),
(9, 4, '2025-01-21 08:44:47', 6140, 26, 336),
(10, 4, '2025-01-21 08:51:52', 5106, 14, 6680),
(11, 4, '2025-01-21 08:51:54', 8799, 11, 3311),
(12, 4, '2025-01-21 08:51:56', 6187, 20, 4380),
(13, 4, '2025-01-21 08:51:58', 4676, 21, 3909),
(14, 4, '2025-01-21 08:51:59', 3305, 36, 3718),
(15, 4, '2025-01-21 08:52:05', 5379, 13, 5341),
(16, 5, '2025-01-21 08:55:45', 3406, 47, 1752),
(17, 5, '2025-01-21 08:55:55', 3270, 50, 5184),
(18, 5, '2025-01-21 08:55:56', 2447, 22, 1052),
(19, 5, '2025-01-21 08:55:57', 3743, 27, 6450),
(20, 5, '2025-01-21 08:55:57', 7170, 47, 2732),
(21, 5, '2025-01-21 08:55:58', 2467, 43, 3906),
(22, 5, '2025-01-21 08:56:02', 5364, 34, 4023),
(23, 6, '2025-01-21 10:13:01', 8984, 6, 1268),
(24, 7, '2025-01-21 10:14:07', 5973, 46, 3362),
(25, 6, '2025-01-21 20:50:40', 1086, 8, 4413),
(26, 6, '2025-01-21 20:50:43', 2148, 41, 516),
(27, 6, '2025-01-21 20:50:47', 2815, 4, 1664);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08'),
(4, 'wath', 'b86e99a84086b4b2acd2e3ca807da5845245825f9e43f4abf4705c36139c7c08'),
(5, 'sess', 'bd717b467075e051242456dd00511c90a39afc62b1da71a80714c0fb3986cb4d'),
(6, 'aaa', '9834876dcfb05cb167a5c24953eba58c4ac89b1adf57f28f2f9d09af107ee8f0'),
(7, 'zzz', '17f165d5a5ba695f27c023a83aa2b3463e23810e360b7517127e90161eebabda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_stats`
--
ALTER TABLE `game_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `game_stats`
--
ALTER TABLE `game_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game_stats`
--
ALTER TABLE `game_stats`
  ADD CONSTRAINT `game_stats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
