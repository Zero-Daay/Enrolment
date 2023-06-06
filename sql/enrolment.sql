-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2023 at 12:56 AM
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
-- Table structure for table `Courses`
--

CREATE TABLE `Courses` (
  `CourseID` int NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`CourseID`, `Description`) VALUES
(1, 'Introduction to Computer Science'),
(2, 'Web Development Fundamentals'),
(3, 'Data Analysis and Visualization'),
(4, 'Machine Learning Basics'),
(5, 'Database Management Systems'),
(6, 'Software Engineering Principles'),
(7, 'Artificial Intelligence Fundamentals'),
(8, 'Mobile App Development'),
(9, 'Cybersecurity Fundamentals'),
(10, 'User Experience Design'),
(11, 'Cloud Computing Essentials'),
(12, 'Digital Marketing Strategies'),
(13, 'Project Management Fundamentals'),
(14, 'Network Administration Basics'),
(15, 'Ethical Hacking and Penetration Testing'),
(16, 'Game Development Principles'),
(17, 'Internet of Things (IoT) Applications'),
(18, 'Blockchain Technology Explained'),
(19, 'Data Science and Big Data Analytics'),
(20, 'Robotics and Automation Technologies'),
(21, 'Introduction to Computer Science'),
(22, 'Web Development Fundamentals'),
(23, 'Data Analysis and Visualization'),
(24, 'Machine Learning Basics'),
(25, 'Database Management Systems'),
(26, 'Software Engineering Principles'),
(27, 'Artificial Intelligence Fundamentals'),
(28, 'Mobile App Development'),
(29, 'Cybersecurity Fundamentals'),
(30, 'User Experience Design'),
(31, 'Cloud Computing Essentials'),
(32, 'Digital Marketing Strategies'),
(33, 'Project Management Fundamentals'),
(34, 'Network Administration Basics'),
(35, 'Ethical Hacking and Penetration Testing'),
(36, 'Game Development Principles'),
(37, 'Internet of Things (IoT) Applications'),
(38, 'Blockchain Technology Explained'),
(39, 'Data Science and Big Data Analytics'),
(40, 'Robotics and Automation Technologies');

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

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `FirstName`, `Surname`) VALUES
(1, 'Jane', 'Adams'),
(2, 'John', 'Young'),
(3, 'Amelia', 'Wilson'),
(4, 'Christopher', 'Lewis'),
(5, 'Harper', 'Lewis'),
(6, 'Ava', 'Jones'),
(7, 'Matthew', 'Johnson'),
(8, 'Jane', 'Adams'),
(9, 'Isabella', 'Harris'),
(10, 'Joseph', 'White'),
(11, 'Sarah', 'Scott'),
(12, 'Evelyn', 'Allen'),
(13, 'Charlotte', 'Wilson'),
(14, 'Isabella', 'Hall'),
(15, 'Ava', 'Smith'),
(16, 'Sophia', 'Wilson'),
(17, 'Sarah', 'King'),
(18, 'Matthew', 'Jones'),
(19, 'Mia', 'Smith'),
(20, 'John', 'Green'),
(21, 'Andrew', 'King'),
(22, 'Matthew', 'Allen'),
(23, 'Mia', 'Hill'),
(24, 'Emily', 'Hill'),
(25, 'Ethan', 'Green'),
(26, 'Emma', 'Lewis'),
(27, 'Ethan', 'Taylor'),
(28, 'Sophia', 'Wright'),
(29, 'James', 'Davis'),
(30, 'Harper', 'Clark'),
(31, 'Harper', 'Jones'),
(32, 'Emily', 'Smith'),
(33, 'Sarah', 'Davis'),
(34, 'Isabella', 'Williams'),
(35, 'James', 'Harris'),
(36, 'John', 'Jones'),
(37, 'Sophia', 'Baker'),
(38, 'Amelia', 'Johnson'),
(39, 'Sophia', 'White'),
(40, 'Andrew', 'Williams'),
(41, 'William', 'Scott'),
(42, 'Olivia', 'Green'),
(43, 'Christopher', 'Williams'),
(44, 'Amelia', 'White'),
(45, 'Christopher', 'Adams'),
(46, 'Jane', 'Wright'),
(47, 'David', 'Harris'),
(48, 'Ethan', 'Miller'),
(49, 'Benjamin', 'Turner'),
(50, 'Alexander', 'Brown'),
(51, 'Benjamin', 'Taylor'),
(52, 'Benjamin', 'Brown'),
(53, 'William', 'Hill'),
(54, 'Evelyn', 'Miller'),
(55, 'Mia', 'Allen'),
(56, 'Isabella', 'Davis'),
(57, 'John', 'Scott'),
(58, 'Sarah', 'Walker'),
(59, 'Olivia', 'Williams'),
(60, 'Harper', 'Hill'),
(61, 'Olivia', 'King'),
(62, 'Andrew', 'Hill'),
(63, 'Andrew', 'Jones'),
(64, 'Alexander', 'Taylor'),
(65, 'Olivia', 'Miller'),
(66, 'Amelia', 'Hill'),
(67, 'Daniel', 'White'),
(68, 'Amelia', 'White'),
(69, 'Ava', 'Walker'),
(70, 'Charlotte', 'Williams'),
(71, 'Ethan', 'Harris'),
(72, 'William', 'Hill'),
(73, 'Andrew', 'Wright'),
(74, 'Emily', 'Scott'),
(75, 'James', 'Allen'),
(76, 'James', 'Allen'),
(77, 'Evelyn', 'Scott'),
(78, 'Sarah', 'Lewis'),
(79, 'Emily', 'Williams'),
(80, 'Ethan', 'Baker'),
(81, 'Alexander', 'Davis'),
(82, 'Joseph', 'Clark'),
(83, 'Ethan', 'Jones'),
(84, 'Mia', 'Hall'),
(85, 'Christopher', 'Allen'),
(86, 'Sarah', 'Lewis'),
(87, 'James', 'Davis'),
(88, 'Ava', 'White'),
(89, 'Christopher', 'Baker'),
(90, 'David', 'Scott'),
(91, 'Olivia', 'Lewis'),
(92, 'Ethan', 'King'),
(93, 'Andrew', 'Green'),
(94, 'Michael', 'Lewis'),
(95, 'William', 'Walker'),
(96, 'Emily', 'Miller'),
(97, 'Benjamin', 'King'),
(98, 'Sophia', 'Green'),
(99, 'Michael', 'Johnson'),
(100, 'Joseph', 'Lewis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `Enrolments`
--
ALTER TABLE `Enrolments`
  ADD PRIMARY KEY (`EnrolmentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Courses`
--
ALTER TABLE `Courses`
  MODIFY `CourseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `Enrolments`
--
ALTER TABLE `Enrolments`
  MODIFY `EnrolmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
