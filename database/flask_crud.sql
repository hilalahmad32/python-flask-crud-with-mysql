-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 08:29 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `title` varchar(255) DEFAULT NULL COMMENT 'content',
  `content` varchar(255) DEFAULT NULL COMMENT 'content',
  `price` varchar(255) DEFAULT NULL COMMENT 'content'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='newTable';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `content`, `price`) VALUES
(18, 'Accusamus qui eius e', 'Dolores dolor explic', '49'),
(19, 'Consectetur voluptat', 'Quis deleniti offici', '527'),
(20, 'Minus laudantium ex', 'Nisi ratione officia', '971'),
(21, 'Ut et molestiae ex m', 'Vitae natus consecte', '264'),
(22, 'Sint et praesentium', 'Aliquid sunt ut exc', '539');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
