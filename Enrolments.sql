-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2023 at 04:00 AM
-- Server version: 8.0.33
-- PHP Version: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enrolment`
--

-- --------------------------------------------------------

--
-- Table structure for table `Enrolments`
--

CREATE TABLE `Enrolments` (
  `EnrolmentID` int NOT NULL,
  `UserID` int NOT NULL,
  `CourseID` int NOT NULL,
  `CompletionStatus` enum('not started','in progress','completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Enrolments`
--

INSERT INTO `Enrolments` (`EnrolmentID`, `UserID`, `CourseID`, `CompletionStatus`) VALUES
(1, 4, 3, 'not started'),
(2, 39, 12, 'not started'),
(3, 25, 15, 'in progress'),
(4, 4, 4, 'not started'),
(5, 50, 12, 'completed'),
(6, 8, 12, 'completed'),
(7, 3, 19, 'in progress'),
(8, 23, 17, 'completed'),
(9, 30, 2, 'completed'),
(10, 48, 20, 'in progress'),
(11, 4, 8, 'not started'),
(12, 45, 6, 'not started'),
(13, 24, 14, 'completed'),
(14, 15, 17, 'completed'),
(15, 39, 5, 'not started'),
(16, 18, 19, 'in progress'),
(17, 7, 13, 'completed'),
(18, 23, 1, 'not started'),
(19, 47, 19, 'in progress'),
(20, 45, 12, 'not started'),
(21, 22, 8, 'not started'),
(22, 43, 2, 'in progress'),
(23, 12, 8, 'not started'),
(24, 9, 8, 'in progress'),
(25, 8, 19, 'in progress'),
(26, 11, 11, 'not started'),
(27, 4, 20, 'completed'),
(28, 1, 1, 'not started'),
(29, 24, 1, 'completed'),
(30, 49, 3, 'completed'),
(31, 36, 16, 'in progress'),
(32, 23, 4, 'in progress'),
(33, 49, 16, 'completed'),
(34, 4, 16, 'in progress'),
(35, 18, 3, 'not started'),
(36, 8, 2, 'in progress'),
(37, 46, 18, 'not started'),
(38, 1, 6, 'not started'),
(39, 34, 5, 'not started'),
(40, 27, 16, 'not started'),
(41, 47, 9, 'not started'),
(42, 22, 15, 'in progress'),
(43, 2, 20, 'completed'),
(44, 36, 14, 'not started'),
(45, 15, 11, 'completed'),
(46, 1, 9, 'completed'),
(47, 8, 6, 'in progress'),
(48, 35, 19, 'not started'),
(49, 26, 6, 'not started'),
(50, 36, 7, 'in progress'),
(51, 46, 12, 'in progress'),
(52, 13, 16, 'not started'),
(53, 43, 7, 'in progress'),
(54, 17, 13, 'completed'),
(55, 48, 8, 'in progress'),
(56, 15, 1, 'not started'),
(57, 27, 8, 'in progress'),
(58, 45, 8, 'completed'),
(59, 16, 2, 'not started'),
(60, 36, 17, 'not started'),
(61, 20, 17, 'not started'),
(62, 22, 14, 'completed'),
(63, 6, 7, 'in progress'),
(64, 10, 12, 'not started'),
(65, 17, 19, 'completed'),
(66, 11, 9, 'not started'),
(67, 46, 20, 'completed'),
(68, 30, 14, 'in progress'),
(69, 18, 19, 'not started'),
(70, 21, 15, 'not started'),
(71, 29, 1, 'completed'),
(72, 37, 14, 'in progress'),
(73, 47, 9, 'not started'),
(74, 3, 5, 'completed'),
(75, 24, 8, 'not started'),
(76, 35, 3, 'not started'),
(77, 28, 10, 'in progress'),
(78, 34, 1, 'in progress'),
(79, 38, 10, 'completed'),
(80, 16, 2, 'in progress'),
(81, 1, 11, 'not started'),
(82, 2, 3, 'in progress'),
(83, 40, 17, 'in progress'),
(84, 50, 13, 'in progress'),
(85, 6, 3, 'completed'),
(86, 16, 11, 'in progress'),
(87, 5, 16, 'not started'),
(88, 5, 7, 'in progress'),
(89, 41, 10, 'not started'),
(90, 28, 14, 'not started'),
(91, 48, 4, 'in progress'),
(92, 26, 3, 'in progress'),
(93, 22, 19, 'completed'),
(94, 34, 10, 'in progress'),
(95, 13, 10, 'completed'),
(96, 13, 9, 'completed'),
(97, 38, 14, 'completed'),
(98, 30, 1, 'in progress'),
(99, 21, 4, 'not started'),
(100, 2, 8, 'completed'),
(101, 41, 16, 'completed'),
(102, 35, 8, 'completed'),
(103, 28, 1, 'completed'),
(104, 29, 3, 'not started'),
(105, 45, 2, 'completed'),
(106, 20, 17, 'in progress'),
(107, 27, 20, 'not started'),
(108, 45, 5, 'in progress'),
(109, 24, 10, 'not started'),
(110, 16, 17, 'not started'),
(111, 4, 2, 'completed'),
(112, 48, 13, 'completed'),
(113, 31, 3, 'completed'),
(114, 19, 15, 'not started'),
(115, 50, 4, 'in progress'),
(116, 32, 3, 'not started'),
(117, 17, 6, 'completed'),
(118, 48, 19, 'in progress'),
(119, 40, 13, 'not started'),
(120, 18, 12, 'in progress'),
(121, 9, 4, 'completed'),
(122, 25, 17, 'completed'),
(123, 49, 10, 'in progress'),
(124, 35, 8, 'not started'),
(125, 48, 10, 'not started'),
(126, 32, 4, 'not started'),
(127, 44, 11, 'in progress'),
(128, 8, 13, 'in progress'),
(129, 8, 15, 'in progress'),
(130, 24, 2, 'completed'),
(131, 6, 19, 'not started'),
(132, 27, 20, 'completed'),
(133, 44, 13, 'completed'),
(134, 11, 14, 'in progress'),
(135, 28, 13, 'completed'),
(136, 38, 3, 'completed'),
(137, 29, 1, 'completed'),
(138, 43, 9, 'completed'),
(139, 36, 6, 'not started'),
(140, 15, 15, 'not started'),
(141, 20, 9, 'not started'),
(142, 32, 4, 'in progress'),
(143, 30, 6, 'not started'),
(144, 42, 17, 'in progress'),
(145, 37, 12, 'completed'),
(146, 6, 1, 'completed'),
(147, 22, 11, 'not started'),
(148, 23, 1, 'in progress'),
(149, 37, 14, 'not started'),
(150, 48, 5, 'in progress'),
(151, 14, 3, 'not started'),
(152, 41, 6, 'in progress'),
(153, 33, 18, 'not started'),
(154, 10, 19, 'in progress'),
(155, 48, 14, 'not started'),
(156, 21, 8, 'completed'),
(157, 25, 6, 'in progress'),
(158, 50, 5, 'in progress'),
(159, 42, 3, 'completed'),
(160, 14, 12, 'not started'),
(161, 39, 4, 'completed'),
(162, 48, 6, 'in progress'),
(163, 11, 10, 'completed'),
(164, 9, 11, 'completed'),
(165, 35, 13, 'not started'),
(166, 24, 16, 'not started'),
(167, 37, 17, 'in progress'),
(168, 8, 6, 'in progress'),
(169, 2, 19, 'not started'),
(170, 23, 3, 'completed'),
(171, 42, 17, 'in progress'),
(172, 3, 9, 'completed'),
(173, 27, 10, 'completed'),
(174, 49, 2, 'not started'),
(175, 1, 4, 'completed'),
(176, 17, 12, 'completed'),
(177, 8, 18, 'completed'),
(178, 44, 4, 'completed'),
(179, 21, 8, 'completed'),
(180, 4, 6, 'completed'),
(181, 34, 11, 'completed'),
(182, 7, 8, 'in progress'),
(183, 47, 4, 'completed'),
(184, 13, 13, 'completed'),
(185, 32, 9, 'not started'),
(186, 32, 15, 'completed'),
(187, 10, 9, 'in progress'),
(188, 37, 3, 'in progress'),
(189, 38, 12, 'in progress'),
(190, 40, 14, 'completed'),
(191, 45, 10, 'in progress'),
(192, 50, 1, 'not started'),
(193, 9, 2, 'in progress'),
(194, 16, 8, 'not started'),
(195, 46, 12, 'in progress'),
(196, 29, 16, 'completed'),
(197, 32, 20, 'not started'),
(198, 43, 6, 'in progress'),
(199, 34, 13, 'not started'),
(200, 18, 3, 'not started');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Enrolments`
--
ALTER TABLE `Enrolments`
  ADD PRIMARY KEY (`EnrolmentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Enrolments`
--
ALTER TABLE `Enrolments`
  MODIFY `EnrolmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Enrolments`
--
ALTER TABLE `Enrolments`
  ADD CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
