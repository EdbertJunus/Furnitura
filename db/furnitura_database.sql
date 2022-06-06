-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 05:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furnitura_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `FurnitureId` int(11) NOT NULL,
  `TransactionId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CartQuantity` int(11) NOT NULL,
  `CartTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `FurnitureId` int(11) NOT NULL,
  `FurnitureName` varchar(255) NOT NULL,
  `FurnitureCategory` varchar(255) NOT NULL,
  `FurnitureDescription` varchar(255) NOT NULL,
  `FurnitureImage` varchar(255) NOT NULL,
  `FurniturePrice` int(11) NOT NULL,
  `FurnitureQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `furniture`
--

INSERT INTO `furniture` (`FurnitureId`, `FurnitureName`, `FurnitureCategory`, `FurnitureDescription`, `FurnitureImage`, `FurniturePrice`, `FurnitureQuantity`) VALUES
(1, 'Meja Makan', 'Meja', 'Ini adalah meja makan', '../assets/tablechair.jpg', 10000, 2),
(2, 'Gaming Chair', 'Chair', 'Ini adalah gaming chair', '../assets/kitchen.jpg', 20000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `TransactionDate` date NOT NULL,
  `TransactionStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `TransactionDate`, `TransactionStatus`) VALUES
(1, '2022-06-03', 'False'),
(2, '2022-06-05', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserEmail` varchar(255) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserRole` varchar(255) NOT NULL,
  `UserStatus` varchar(255) NOT NULL DEFAULT 'not_loggedin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `FurnitureId` (`FurnitureId`),
  ADD KEY `TransactionId` (`TransactionId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`FurnitureId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `FurnitureId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FurnitureId` FOREIGN KEY (`FurnitureId`) REFERENCES `furniture` (`FurnitureId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TransactionId` FOREIGN KEY (`TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
