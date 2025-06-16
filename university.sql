-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 06:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `civil_exams`
--

CREATE TABLE `civil_exams` (
  `id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `time` time NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counselling_requests`
--

CREATE TABLE `counselling_requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `requested_time` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counselling_requests`
--

INSERT INTO `counselling_requests` (`id`, `student_id`, `faculty_id`, `requested_time`, `status`) VALUES
(1, 1, 1, 'Saturday 09:00:00-11:00:00', 'pending'),
(2, 1, 2, 'Saturday 02:30:00-03:00:00', 'pending'),
(3, 2, 2, 'Sunday 11:30:00-12:00:00', 'pending'),
(4, 1, 2, 'Saturday 02:30:00-03:00:00', 'pending'),
(5, 8, 2, 'Saturday 02:30:00-03:00:00', 'pending'),
(6, 8, 2, 'Saturday 02:30:00-03:00:00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `counselling_times`
--

CREATE TABLE `counselling_times` (
  `id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `counselling_times`
--

INSERT INTO `counselling_times` (`id`, `faculty_id`, `day_of_week`, `start_time`, `end_time`) VALUES
(1, 1, 'Saturday', '09:00:00', '11:00:00'),
(2, 1, 'Sunday', '12:00:00', '01:00:00'),
(3, 1, 'Tuesday', '09:00:00', '11:00:00'),
(4, 1, 'Wednesday', '12:00:00', '02:00:00'),
(5, 2, 'Saturday', '02:30:00', '03:00:00'),
(6, 2, 'Sunday', '11:30:00', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cse_exams`
--

CREATE TABLE `cse_exams` (
  `id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `time` time NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cse_exams`
--

INSERT INTO `cse_exams` (`id`, `course_title`, `course_code`, `date`, `day`, `time`, `section`) VALUES
(3, 'Operating Systems', 'CSE 4509', '2024-07-20', 'Saturday', '09:00:00', 'A'),
(4, 'Operating System Concepts/Operating Systems', 'CSE 4509/CSI 309', '2024-07-20', 'Saturday', '09:00:00', 'B'),
(5, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AA'),
(6, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AB'),
(7, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AC'),
(8, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AD'),
(9, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AE'),
(10, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AF'),
(11, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AG'),
(12, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AH'),
(13, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AI'),
(14, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AJ'),
(15, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AK'),
(16, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AL'),
(17, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AM'),
(18, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AN'),
(19, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AO'),
(20, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AP'),
(21, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'AQ'),
(22, 'Industrial and Operational Management/Industrial Management', 'IPE 3401/IPE 401', '2024-07-20', 'Saturday', '09:00:00', 'A'),
(23, 'Industrial and Operational Management/Industrial Management', 'IPE 3401/IPE 401', '2024-07-20', 'Saturday', '09:00:00', 'B'),
(24, 'Industrial and Operational Management/Industrial Management', 'IPE 3401/IPE 401', '2024-07-20', 'Saturday', '09:00:00', 'D'),
(25, 'Industrial and Operational Management/Industrial Management', 'IPE 3401/IPE 401', '2024-07-20', 'Saturday', '09:00:00', 'E'),
(26, 'Industrial and Operational Management/Industrial Management/Industrial Production Engineering', 'IPE 3401/IPE 401/IPE 4101', '2024-07-20', 'Saturday', '09:00:00', 'C'),
(27, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AA'),
(28, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AB'),
(29, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AC'),
(30, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AE'),
(31, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AF'),
(32, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AH'),
(33, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'AI'),
(34, 'English II', 'ENG 1013/ENG 103', '2024-07-20', 'Saturday', '11:30:00', 'AG'),
(35, 'English II/Intensive English II', 'ENG 1013/ENG 1207', '2024-07-20', 'Saturday', '11:30:00', 'AJ'),
(36, 'Computer Architecture', 'CSE 313/CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(37, 'Computer Architecture', 'CSE 313/CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'B'),
(38, 'Computer Architecture', 'CSE 313/CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'C'),
(39, 'Computer Architecture', 'CSE 313/CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'F'),
(40, 'Computer Architecture', 'CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'D'),
(41, 'Computer Architecture', 'CSE 3313', '2024-07-20', 'Saturday', '02:00:00', 'E'),
(42, 'Machine Learning', 'CSE 4889/CSE 489', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(43, 'Calculus and Linear Algebra/Linear Algebra, Ordinary & Partial Differential Equations', 'MATH 183/MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(44, 'Calculus and Linear Algebra/Linear Algebra, Ordinary & Partial Differential Equations', 'MATH 183/MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'B'),
(45, 'Calculus and Linear Algebra/Linear Algebra, Ordinary & Partial Differential Equations', 'MATH 183/MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'C'),
(46, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'AA'),
(47, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'D'),
(48, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'E'),
(49, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'F'),
(50, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'G'),
(51, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'H'),
(52, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'I'),
(53, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'K'),
(54, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'L'),
(55, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'M'),
(56, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'N'),
(57, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'O'),
(58, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'P'),
(59, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'Q'),
(60, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'R'),
(61, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'S'),
(62, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'T'),
(63, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'U'),
(64, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'Y'),
(65, 'Calculus and Linear Algebra', 'MATH 2183', '2024-07-20', 'Saturday', '02:00:00', 'Z'),
(66, 'Society, Environment and Engineering Ethics/Society, Technology and Engineering Ethics', 'SOC 101/SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(67, 'Society, Environment and Engineering Ethics/Society, Technology and Engineering Ethics', 'SOC 101/SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'B'),
(68, 'Society, Environment and Engineering Ethics/Society, Technology and Engineering Ethics', 'SOC 101/SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'C'),
(69, 'Society, Environment and Engineering Ethics/Society, Technology and Engineering Ethics', 'SOC 101/SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'F'),
(70, 'Society, Environment and Engineering Ethics/Society, Technology and Engineering Ethics', 'SOC 101/SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'J'),
(71, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'D'),
(72, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'E'),
(73, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'G'),
(74, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'H'),
(75, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'I'),
(76, 'Society, Environment and Engineering Ethics', 'SOC 2101', '2024-07-20', 'Saturday', '02:00:00', 'L'),
(77, 'Compiler/Compiler Design', 'CSE 4611/CSI 411', '2024-07-21', 'Sunday', '09:00:00', 'A'),
(78, 'Compiler/Compiler Design', 'CSE 4611/CSI 411', '2024-07-21', 'Sunday', '09:00:00', 'B'),
(79, 'Computer Graphics', 'CSE 4621/CSI 421', '2024-07-21', 'Sunday', '09:00:00', 'A'),
(80, 'Microprocessor, Microcontroller and Interfacing/Microprocessors and Microcontrollers', 'CSE 425/CSE 4325', '2024-07-21', 'Sunday', '11:30:00', 'A'),
(81, 'Microprocessor, Microcontroller and Interfacing/Microprocessors and Microcontrollers', 'CSE 425/CSE 4325', '2024-07-21', 'Sunday', '11:30:00', 'B'),
(82, 'Microprocessor, Microcontroller and Interfacing/Microprocessors and Microcontrollers', 'CSE 425/CSE 4325', '2024-07-21', 'Sunday', '11:30:00', 'C'),
(83, 'Microprocessor, Microcontroller and Interfacing/Microprocessors and Microcontrollers', 'CSE 425/CSE 4325', '2024-07-21', 'Sunday', '11:30:00', 'D'),
(84, 'Financial and Managerial Accounting', 'ACT 111/ACT 2111', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(85, 'Financial and Managerial Accounting', 'ACT 111/ACT 2111', '2024-07-21', 'Sunday', '02:00:00', 'B'),
(86, 'Cloud Computing', 'CSE 4587/CSE 487', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(87, 'Introduction to Bioinformatics', 'CSE 4893', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(88, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'C'),
(89, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'D'),
(90, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'E'),
(91, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'H'),
(92, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'I'),
(93, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'K'),
(94, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'L'),
(95, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'M'),
(96, 'Probability and Statistics', 'MATH 2205', '2024-07-21', 'Sunday', '02:00:00', 'N'),
(97, 'Probability and Statistics', 'MATH 2205/STAT 205', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(98, 'Probability and Statistics', 'MATH 2205/STAT 205', '2024-07-21', 'Sunday', '02:00:00', 'B'),
(99, 'Probability and Statistics', 'MATH 2205/STAT 205', '2024-07-21', 'Sunday', '02:00:00', 'F'),
(100, 'Probability and Statistics', 'MATH 2205/STAT 205', '2024-07-21', 'Sunday', '02:00:00', 'J'),
(101, 'Artificial Intelligence', 'CSE 3811/CSI 341', '2024-07-22', 'Monday', '09:00:00', 'A'),
(102, 'Artificial Intelligence', 'CSE 3811/CSI 341', '2024-07-22', 'Monday', '09:00:00', 'B'),
(103, 'Artificial Intelligence', 'CSE 3811/CSI 341', '2024-07-22', 'Monday', '09:00:00', 'C'),
(104, 'Artificial Intelligence', 'CSE 3811/CSI 341', '2024-07-22', 'Monday', '09:00:00', 'D'),
(105, 'Artificial Intelligence', 'CSE 3811/CSI 341', '2024-07-22', 'Monday', '09:00:00', 'E'),
(106, 'Human Computer Interaction', 'CSE 4451', '2024-07-22', 'Monday', '09:00:00', 'A'),
(107, 'Human Computer Interaction', 'CSE 4451', '2024-07-22', 'Monday', '09:00:00', 'B'),
(108, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'A'),
(109, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'B'),
(110, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'C'),
(111, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'D'),
(112, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'E'),
(113, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'F'),
(114, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'G'),
(115, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'H'),
(116, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'I'),
(117, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'J'),
(118, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'K'),
(119, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'L'),
(120, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'M'),
(121, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'N'),
(122, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'O'),
(123, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'Q'),
(124, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'R'),
(125, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'S'),
(126, 'Discrete Mathematics', 'CSE 2213', '2024-07-22', 'Monday', '11:30:00', 'U'),
(127, 'Discrete Mathematics', 'CSE 2213/CSI 219', '2024-07-22', 'Monday', '11:30:00', 'T'),
(128, 'Project Management', 'CSE 469/PMG 4101', '2024-07-22', 'Monday', '11:30:00', 'A'),
(129, 'Project Management', 'CSE 469/PMG 4101', '2024-07-22', 'Monday', '11:30:00', 'B'),
(130, 'Project Management', 'CSE 469/PMG 4101', '2024-07-22', 'Monday', '11:30:00', 'C'),
(131, 'Biology for Engineers', 'BIO 3105', '2024-07-22', 'Monday', '02:00:00', 'A'),
(132, 'Biology for Engineers', 'BIO 3105', '2024-07-22', 'Monday', '02:00:00', 'B'),
(133, 'Biology for Engineers', 'BIO 3105', '2024-07-22', 'Monday', '02:00:00', 'C'),
(134, 'Biology for Engineers', 'BIO 3105', '2024-07-22', 'Monday', '02:00:00', 'D'),
(135, 'Biology/Biology for Engineers', 'BIO 3105/BIO 3107', '2024-07-22', 'Monday', '02:00:00', 'E'),
(136, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'A'),
(137, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'B'),
(138, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'C'),
(139, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'D'),
(140, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'E'),
(141, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'F'),
(142, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'G'),
(143, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'H'),
(144, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'I'),
(145, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'J'),
(146, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'K'),
(147, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'L'),
(148, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'M'),
(149, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'N'),
(150, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'O'),
(151, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'P'),
(152, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'Q'),
(153, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'R'),
(154, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'U'),
(155, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'V'),
(156, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'W'),
(157, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'X'),
(158, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'Y'),
(159, 'Digital Logic Design', 'CSE 1325', '2024-07-22', 'Monday', '02:00:00', 'Z'),
(160, 'Digital Logic Design', 'CSE 1325/CSE 225', '2024-07-22', 'Monday', '02:00:00', 'S'),
(161, 'Theory of Computation', 'CSE 2233', '2024-07-23', 'Tuesday', '09:00:00', 'E'),
(162, 'Theory of Computation', 'CSE 2233', '2024-07-23', 'Tuesday', '09:00:00', 'G'),
(163, 'Theory of Computation', 'CSE 2233', '2024-07-23', 'Tuesday', '09:00:00', 'H'),
(164, 'Theory of Computation', 'CSE 2233', '2024-07-23', 'Tuesday', '09:00:00', 'J'),
(165, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'A'),
(166, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'B'),
(167, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'C'),
(168, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'D'),
(169, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'F'),
(170, 'Theory of Computation/Theory of Computing', 'CSE 2233/CSI 233', '2024-07-23', 'Tuesday', '09:00:00', 'I'),
(171, 'Web Programming', 'CSE 4165/CSE 465', '2024-07-23', 'Tuesday', '09:00:00', 'A'),
(172, 'Web Programming', 'CSE 4165/CSE 465', '2024-07-23', 'Tuesday', '09:00:00', 'B'),
(173, 'Web Programming', 'CSE 4165/CSE 465', '2024-07-23', 'Tuesday', '09:00:00', 'C'),
(174, 'Web Programming', 'CSE 4165/CSE 465', '2024-07-23', 'Tuesday', '09:00:00', 'D'),
(175, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'A'),
(176, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'B'),
(177, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'C'),
(178, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'D'),
(179, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'E'),
(180, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'F'),
(181, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'G'),
(182, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'H'),
(183, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'I'),
(184, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'J'),
(185, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'K'),
(186, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'L'),
(187, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'M'),
(188, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'N'),
(189, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'O'),
(190, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'P'),
(191, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'Q'),
(192, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'R'),
(193, 'Structured Programming Language', 'CSE 1111', '2024-07-23', 'Tuesday', '11:30:00', 'S'),
(194, 'Software Architecture', 'CSE 4435', '2024-07-23', 'Tuesday', '11:30:00', 'A'),
(195, 'Software Architecture', 'CSE 4435', '2024-07-23', 'Tuesday', '11:30:00', 'B'),
(196, 'Computer Networks', 'CSE 323/CSE 3711', '2024-07-23', 'Tuesday', '02:00:00', 'A'),
(197, 'Computer Networks', 'CSE 323/CSE 3711', '2024-07-23', 'Tuesday', '02:00:00', 'B'),
(198, 'Computer Networks', 'CSE 323/CSE 3711', '2024-07-23', 'Tuesday', '02:00:00', 'C'),
(199, 'Computer Networks', 'CSE 323/CSE 3711', '2024-07-23', 'Tuesday', '02:00:00', 'D'),
(200, 'Computer Networks', 'CSE 3711', '2024-07-23', 'Tuesday', '02:00:00', 'E'),
(201, 'System Analysis and Design', 'CSE 3411', '2024-07-24', 'Wednesday', '09:00:00', 'D'),
(202, 'System Analysis and Design', 'CSE 3411', '2024-07-24', 'Wednesday', '09:00:00', 'E'),
(203, 'System Analysis and Design', 'CSE 3411/CSI 311', '2024-07-24', 'Wednesday', '09:00:00', 'A'),
(204, 'System Analysis and Design', 'CSE 3411/CSI 311', '2024-07-24', 'Wednesday', '09:00:00', 'B'),
(205, 'System Analysis and Design', 'CSE 3411/CSI 311', '2024-07-24', 'Wednesday', '09:00:00', 'C'),
(206, 'Database Management Systems', 'CSE 3521', '2024-07-24', 'Wednesday', '09:00:00', 'C'),
(207, 'Database Management Systems', 'CSE 3521', '2024-07-24', 'Wednesday', '09:00:00', 'D'),
(208, 'Database Management Systems', 'CSE 3521', '2024-07-24', 'Wednesday', '09:00:00', 'E'),
(209, 'Database Management Systems', 'CSE 3521', '2024-07-24', 'Wednesday', '09:00:00', 'F'),
(210, 'Database Management Systems', 'CSE 3521/CSI 221', '2024-07-24', 'Wednesday', '09:00:00', 'A'),
(211, 'Database Management Systems', 'CSE 3521/CSI 221', '2024-07-24', 'Wednesday', '09:00:00', 'B'),
(212, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'A'),
(213, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'C'),
(214, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'D'),
(215, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'F'),
(216, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'I'),
(217, 'Coordinate Geometry and Vector Analysis', 'MATH 201/MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'J'),
(218, 'Coordinate Geometry and Vector Analysis', 'MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'B'),
(219, 'Coordinate Geometry and Vector Analysis', 'MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'E'),
(220, 'Coordinate Geometry and Vector Analysis', 'MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'G'),
(221, 'Coordinate Geometry and Vector Analysis', 'MATH 2201', '2024-07-24', 'Wednesday', '09:00:00', 'H'),
(222, 'Data Structure and Algorithms II', 'CSE 2217', '2024-07-24', 'Wednesday', '11:30:00', 'B'),
(223, 'Data Structure and Algorithms II', 'CSE 2217', '2024-07-24', 'Wednesday', '11:30:00', 'D'),
(224, 'Data Structure and Algorithms II', 'CSE 2217', '2024-07-24', 'Wednesday', '11:30:00', 'F'),
(225, 'Data Structure and Algorithms II', 'CSE 2217', '2024-07-24', 'Wednesday', '11:30:00', 'I'),
(226, 'Algorithms/Data Structure and Algorithms II', 'CSE 2217/CSI 227', '2024-07-24', 'Wednesday', '11:30:00', 'A'),
(227, 'Algorithms/Data Structure and Algorithms II', 'CSE 2217/CSI 227', '2024-07-24', 'Wednesday', '11:30:00', 'C'),
(228, 'Algorithms/Data Structure and Algorithms II', 'CSE 2217/CSI 227', '2024-07-24', 'Wednesday', '11:30:00', 'E'),
(229, 'Algorithms/Data Structure and Algorithms II', 'CSE 2217/CSI 227', '2024-07-24', 'Wednesday', '11:30:00', 'G'),
(230, 'Algorithms/Data Structure and Algorithms II', 'CSE 2217/CSI 227', '2024-07-24', 'Wednesday', '11:30:00', 'H'),
(231, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'AA'),
(232, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'AB'),
(233, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'AC'),
(234, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'B'),
(235, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'D'),
(236, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'F'),
(237, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'H'),
(238, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'I'),
(239, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'J'),
(240, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'K'),
(241, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'L'),
(242, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'M'),
(243, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'N'),
(244, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'O'),
(245, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'P'),
(246, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'Q'),
(247, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'R'),
(248, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'S'),
(249, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'T'),
(250, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'U'),
(251, 'Object Oriented Programming', 'CSE 1115', '2024-07-24', 'Wednesday', '02:00:00', 'V'),
(252, 'Object Oriented Programming/Object-Oriented Programming', 'CSE 1115/CSI 211', '2024-07-24', 'Wednesday', '02:00:00', 'A'),
(253, 'Object Oriented Programming/Object-Oriented Programming', 'CSE 1115/CSI 211', '2024-07-24', 'Wednesday', '02:00:00', 'C'),
(254, 'Object Oriented Programming/Object-Oriented Programming', 'CSE 1115/CSI 211', '2024-07-24', 'Wednesday', '02:00:00', 'E'),
(255, 'Object Oriented Programming/Object-Oriented Programming', 'CSE 1115/CSI 211', '2024-07-24', 'Wednesday', '02:00:00', 'G'),
(256, 'Software Engineering', 'CSE 3421', '2024-07-24', 'Wednesday', '02:00:00', 'C'),
(257, 'Software Engineering', 'CSE 3421/CSI 321', '2024-07-24', 'Wednesday', '02:00:00', 'A'),
(258, 'Software Engineering', 'CSE 3421/CSI 321', '2024-07-24', 'Wednesday', '02:00:00', 'B'),
(259, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AA'),
(260, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AB'),
(261, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AC'),
(262, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AD'),
(263, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AE'),
(264, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AF'),
(265, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AG'),
(266, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AH'),
(267, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AI'),
(268, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AJ'),
(269, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AK'),
(270, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AL'),
(271, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AM'),
(272, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AN'),
(273, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AO'),
(274, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AP'),
(275, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'AS'),
(276, 'Economics', 'ECO 213/ECO 4101', '2024-07-25', 'Thursday', '09:00:00', 'A'),
(277, 'Economics', 'ECO 213/ECO 4101', '2024-07-25', 'Thursday', '09:00:00', 'B'),
(278, 'Economics', 'ECO 213/ECO 4101', '2024-07-25', 'Thursday', '09:00:00', 'C'),
(279, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'A'),
(280, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'B'),
(281, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'C'),
(282, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'D'),
(283, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'E'),
(284, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'F'),
(285, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'G'),
(286, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'H'),
(287, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'I'),
(288, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'J'),
(289, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'K'),
(290, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'L'),
(291, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'M'),
(292, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'N'),
(293, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'O'),
(294, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'P'),
(295, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'Q'),
(296, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'R'),
(297, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'S'),
(298, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'T'),
(299, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'U'),
(300, 'Fundamental Calculus', 'MATH 1151', '2024-07-25', 'Thursday', '11:30:00', 'W'),
(301, 'Electrical Circuits', 'CSE 113/EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(302, 'Electrical Circuits', 'CSE 113/EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'B'),
(303, 'Electrical Circuits', 'CSE 113/EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'C'),
(304, 'Electrical Circuits', 'CSE 113/EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'D'),
(305, 'Electrical Circuits', 'CSE 113/EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'E'),
(306, 'Electronics', 'CSE 123/EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(307, 'Electronics', 'CSE 123/EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'B'),
(308, 'Electronics', 'CSE 123/EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'C'),
(309, 'Electronics', 'CSE 123/EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'D'),
(310, 'Electronics', 'CSE 123/EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'G'),
(311, 'Data Communication', 'CSE 315/CSE 3715', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(312, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'G'),
(313, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'H'),
(314, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'I'),
(315, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'J'),
(316, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'K'),
(317, 'Electrical Circuits', 'EEE 2113', '2024-07-25', 'Thursday', '02:00:00', 'L'),
(318, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'E'),
(319, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'F'),
(320, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'H'),
(321, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'I'),
(322, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'J'),
(323, 'Electronics', 'EEE 2123', '2024-07-25', 'Thursday', '02:00:00', 'K'),
(324, 'Data Mining', 'CSE 4891', '2024-07-26', 'Friday', '08:30:00', 'B'),
(325, 'Data Mining', 'CSE 4891/CSE 491', '2024-07-26', 'Friday', '08:30:00', 'A'),
(326, 'Psychology', 'PSY 101/PSY 2101', '2024-07-26', 'Friday', '08:30:00', 'A'),
(327, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'E'),
(328, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'F'),
(329, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'G'),
(330, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'H'),
(331, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'I'),
(332, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'K'),
(333, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'L'),
(334, 'Data Structure and Algorithms I', 'CSE 2215', '2024-07-26', 'Friday', '11:00:00', 'M'),
(335, 'Data Structure/Data Structure and Algorithms I', 'CSE 2215/CSI 217', '2024-07-26', 'Friday', '11:00:00', 'A'),
(336, 'Data Structure/Data Structure and Algorithms I', 'CSE 2215/CSI 217', '2024-07-26', 'Friday', '11:00:00', 'B'),
(337, 'Data Structure/Data Structure and Algorithms I', 'CSE 2215/CSI 217', '2024-07-26', 'Friday', '11:00:00', 'C'),
(338, 'Data Structure/Data Structure and Algorithms I', 'CSE 2215/CSI 217', '2024-07-26', 'Friday', '11:00:00', 'D'),
(339, 'Digital Image Processing', 'CSE 483/CSE 4883', '2024-07-26', 'Friday', '02:30:00', 'A'),
(340, 'Digital Image Processing', 'CSE 4883', '2024-07-26', 'Friday', '02:30:00', 'C'),
(341, 'Physics', 'PHY 105/PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'F'),
(342, 'Physics', 'PHY 105/PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'J'),
(343, 'Physics', 'PHY 105/PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'L'),
(344, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'A'),
(345, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'B'),
(346, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'C'),
(347, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'D'),
(348, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'G'),
(349, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'I'),
(350, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'K'),
(351, 'Physics', 'PHY 2105', '2024-07-26', 'Friday', '02:30:00', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `eee_exams`
--

CREATE TABLE `eee_exams` (
  `id` int(11) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `time` time NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eee_exams`
--

INSERT INTO `eee_exams` (`id`, `course_title`, `course_code`, `date`, `day`, `time`, `section`) VALUES
(1, 'Probability and Random Signal Analysis/Probability, Statistics and Random Variables', 'EEE 255/EEE 3303', '2024-07-20', 'Saturday', '09:00:00', 'A'),
(2, 'Satellite Communication', 'EEE 4323/EEE 463', '2024-07-20', 'Saturday', '09:00:00', 'A'),
(3, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'P'),
(4, 'English I', 'ENG 1011', '2024-07-20', 'Saturday', '09:00:00', 'Q'),
(5, 'Power System', 'EEE 305/EEE 3205', '2024-07-20', 'Saturday', '11:30:00', 'A'),
(6, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'P'),
(7, 'English II', 'ENG 1013', '2024-07-20', 'Saturday', '11:30:00', 'Q'),
(8, 'Electronics I', 'EEE 2101', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(9, 'Electronics I', 'EEE 2101', '2024-07-20', 'Saturday', '02:00:00', 'B'),
(10, 'Electronics I', 'EEE 2101', '2024-07-20', 'Saturday', '02:00:00', 'C'),
(11, 'Control System', 'EEE 401/EEE 4109', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(12, 'Coordinate Geometry and Vector Analysis', 'MAT 2109', '2024-07-20', 'Saturday', '02:00:00', 'B'),
(13, 'Coordinate Geometry and Vector Analysis', 'MAT 2109/MATH 201', '2024-07-20', 'Saturday', '02:00:00', 'A'),
(14, 'Calculus II', 'MAT 1103', '2024-07-21', 'Sunday', '09:00:00', 'A'),
(15, 'Calculus II', 'MAT 1103', '2024-07-21', 'Sunday', '09:00:00', 'B'),
(16, 'Calculus II', 'MAT 1103', '2024-07-21', 'Sunday', '09:00:00', 'C'),
(17, 'Society, Environment and Engineering Ethics', 'SOC 3101', '2024-07-21', 'Sunday', '09:00:00', 'I'),
(18, 'Electronics II', 'EEE 207/EEE 2103', '2024-07-21', 'Sunday', '11:30:00', 'B'),
(19, 'Electronics II', 'EEE 2103', '2024-07-21', 'Sunday', '11:30:00', 'A'),
(20, 'Energy Conversion I', 'EEE 203/EEE 2201', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(21, 'VLSI Design', 'EEE 4121/EEE 441', '2024-07-21', 'Sunday', '02:00:00', 'A'),
(22, 'Energy Conversion II', 'EEE 205/EEE 2203', '2024-07-22', 'Monday', '09:00:00', 'A'),
(23, 'Calculus I', 'MAT 1101', '2024-07-22', 'Monday', '09:00:00', 'A'),
(24, 'Calculus I', 'MAT 1101', '2024-07-22', 'Monday', '09:00:00', 'B'),
(25, 'Calculus I', 'MAT 1101', '2024-07-22', 'Monday', '09:00:00', 'C'),
(26, 'Microprocessor and Interfacing', 'EEE 3403/EEE 423', '2024-07-22', 'Monday', '11:30:00', 'A'),
(27, 'Physics II', 'PHY 1103', '2024-07-22', 'Monday', '11:30:00', 'A'),
(28, 'Physics II', 'PHY 1103', '2024-07-22', 'Monday', '11:30:00', 'B'),
(29, 'Physics II', 'PHY 1103', '2024-07-22', 'Monday', '11:30:00', 'C'),
(30, 'Structured Programming Language', 'EEE 121/EEE 2401', '2024-07-22', 'Monday', '02:00:00', 'A'),
(31, 'Structured Programming Language', 'EEE 121/EEE 2401', '2024-07-22', 'Monday', '02:00:00', 'B'),
(32, 'Power System Protection', 'EEE 4217/EEE 477', '2024-07-22', 'Monday', '02:00:00', 'A'),
(33, 'Electrical Circuits II', 'EEE 1003', '2024-07-23', 'Tuesday', '09:00:00', 'D'),
(34, 'Electrical Circuits II', 'EEE 1003/EEE 103', '2024-07-23', 'Tuesday', '09:00:00', 'C'),
(35, 'Engineering Electromagnetics', 'EEE 303/EEE 3305', '2024-07-23', 'Tuesday', '09:00:00', 'A'),
(36, 'Chemistry', 'CHE 2101', '2024-07-23', 'Tuesday', '11:30:00', 'A'),
(37, 'Chemistry', 'CHE 2101', '2024-07-23', 'Tuesday', '11:30:00', 'B'),
(38, 'Power Electronics', 'EEE 307/EEE 3207', '2024-07-23', 'Tuesday', '11:30:00', 'A'),
(39, 'Digital Electronics', 'EEE 2105/EEE 223', '2024-07-23', 'Tuesday', '02:00:00', 'A'),
(40, 'Digital Electronics', 'EEE 2105/EEE 223', '2024-07-23', 'Tuesday', '02:00:00', 'B'),
(41, 'Solid State Devices', 'EEE 313/EEE 4111', '2024-07-23', 'Tuesday', '02:00:00', 'A'),
(42, 'Electrical Circuits I', 'EEE 1001', '2024-07-24', 'Wednesday', '09:00:00', 'A'),
(43, 'Electrical Circuits I', 'EEE 1001', '2024-07-24', 'Wednesday', '09:00:00', 'B'),
(44, 'Electrical Circuits I', 'EEE 1001', '2024-07-24', 'Wednesday', '09:00:00', 'C'),
(45, 'Electrical Properties of Materials', 'EEE 301/EEE 3107', '2024-07-24', 'Wednesday', '09:00:00', 'A'),
(46, 'Communication Theory', 'EEE 309/EEE 3307', '2024-07-24', 'Wednesday', '11:30:00', 'A'),
(47, 'Linear Algebra and Differential Equations', 'MAT 2105', '2024-07-24', 'Wednesday', '11:30:00', 'B'),
(48, 'Linear Algebra and Differential Equations', 'MAT 2105', '2024-07-24', 'Wednesday', '11:30:00', 'C'),
(49, 'Economics', 'ECO 2101/ECO 213', '2024-07-24', 'Wednesday', '02:00:00', 'C'),
(50, 'Economics', 'ECO 2101/ECO 213', '2024-07-24', 'Wednesday', '02:00:00', 'D'),
(51, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'P'),
(52, 'History of the Emergence of Bangladesh', 'BDS 1201', '2024-07-25', 'Thursday', '09:00:00', 'Q'),
(53, 'Digital Signal Processing', 'EEE 311/EEE 3309', '2024-07-25', 'Thursday', '09:00:00', 'A'),
(54, 'Financial and Managerial Accounting', 'ACT 3101', '2024-07-25', 'Thursday', '11:30:00', 'D'),
(55, 'Complex Variables, Fourier and Laplace Transforms/Fourier & Laplace Transformations & Complex Variable', 'MAT 2107/MATH 187', '2024-07-25', 'Thursday', '11:30:00', 'A'),
(56, 'Complex Variables, Fourier and Laplace Transforms/Fourier & Laplace Transformations & Complex Variable', 'MAT 2107/MATH 187', '2024-07-25', 'Thursday', '11:30:00', 'B'),
(57, 'Computer Networks', 'CSE 323/CSE 3711/EEE 4413', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(58, 'Signals and Linear System/Signals and Linear Systems', 'EEE 211/EEE 2301', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(59, 'Signals and Linear System/Signals and Linear Systems', 'EEE 211/EEE 2301', '2024-07-25', 'Thursday', '02:00:00', 'B'),
(60, 'Physics I', 'PHY 1101', '2024-07-25', 'Thursday', '02:00:00', 'A'),
(61, 'Physics I', 'PHY 1101', '2024-07-25', 'Thursday', '02:00:00', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`) VALUES
(1, 'Leave of absence', 'prayer for leave of absence ', 'Dear,\r\n<br>\r\nI hope you are well. I could not attend the class today.<br>\r\nhoping that you would be kind enough to grant me leave of absence.<br>\r\nThank you<br>\r\nName: {{name}}<br>\r\nID:{{id}}<br>\r\nCourse: {{course}}<br>\r\nSection: {{section}}<br>'),
(2, 'Add courses', 'For adding courses for the upcoming trimester', 'Dear,<br>\r\nI hope that you are doing well. I am willing to Add the courses mentioned below.<br><br>\r\nCourses: {{courses}}\r\n<br>\r\nName: {{name}}<br>\r\nID: {{id}}<br><br>\r\nThank you,'),
(3, 'Drop courses', 'For dropping some courses for the upcoming trimester', 'Dear,<br>\r\nI hope that you are doing well. I am willing to drop the courses mentioned below.<br><br>\r\nCourses: {{courses}}\r\n<br>\r\nName: {{name}}<br>\r\nID: {{id}}<br><br>\r\nThank you,');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `date`) VALUES
(1, 'JS flashstart', 'Javascript motivation', '2025-02-20');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `email`, `department`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'Computer Science'),
(2, 'Mahatab Uddin', 'mahatab@gmail.com', 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_routines`
--

CREATE TABLE `favourite_routines` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `routine` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_materials`
--

CREATE TABLE `study_materials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_courses`
--

CREATE TABLE `upcoming_courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `section` varchar(10) NOT NULL,
  `time` varchar(20) NOT NULL,
  `day` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upcoming_courses`
--

INSERT INTO `upcoming_courses` (`id`, `course_code`, `course_title`, `section`, `time`, `day`) VALUES
(1, 'CS101', 'Introduction to Computer Science', 'A', '10:00-11:30', 'Monday'),
(2, 'CS101', 'Introduction to Computer Science', 'B', '14:00-15:30', 'Wednesday'),
(3, 'MATH201', 'Calculus II', 'A', '09:00-10:30', 'Tuesday'),
(4, 'MATH201', 'Calculus II', 'B', '11:00-12:30', 'Thursday'),
(5, 'PHYS301', 'Physics III', 'A', '13:00-14:30', 'Monday'),
(6, 'PHYS301', 'Physics III', 'B', '15:00-16:30', 'Wednesday'),
(7, 'CS101', 'Introduction to Computer Science', 'A', '10:00-11:30', 'Monday'),
(8, 'CS101', 'Introduction to Computer Science', 'B', '14:00-15:30', 'Wednesday'),
(9, 'MATH201', 'Calculus II', 'A', '09:00-10:30', 'Tuesday'),
(10, 'MATH201', 'Calculus II', 'B', '11:00-12:30', 'Thursday'),
(11, 'PHYS301', 'Physics III', 'A', '13:00-14:30', 'Monday'),
(12, 'PHYS301', 'Physics III', 'B', '15:00-16:30', 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','faculty','admin') NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `name`) VALUES
(1, 'sakib-niloy', 'sakibhassan147@gmail.com', '$2b$10$05BiL9LDiHlihbsJUmZOj.dJlBEnEo94GiU7fSSLMSFsb3duFOwjS', 'student', 'sakib uddin niloy'),
(2, 'ibrahim', 'ibrahim@gmail.com', '$2b$10$lDC3I5E4AzqYsVpj2aEN7OwEi7uB8jfZI9sgfN2iCQHgtnqNgwnEe', 'student', 'sayed ibrahim'),
(3, 'mahatab', 'mahatab@gmail.com', '$2b$10$8FRcX.AcMXZjLBDSL1jxbOk.iN6Q5At.qVJS7W/jjIjfyIsNFO9uO', 'faculty', 'mahatab uddin'),
(8, 'atq444', 'atq@gmail.com', '$2b$10$RdZbH.AU7gjsmG0INJGr5.iReDPfzfCW45w6U2h8LRmlH8lGxhja2', 'student', 'Atique'),
(9, '011221521', 'ilham@gmail.com', '690819f29b27d635bc6ff0d562afbf75', 'student', 'ilham'),
(10, 'emad@gmail.com', 'emad@gmail.com', '432ea5027f47027281a2e5f373e5edf6', 'student', 'emad'),
(11, 'autumnsimp', 'emad200105@gmail.com', 'a8fa0b55df1ff8ba3c086dbcfc305d4a', 'student', 'Hasnat Emad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `civil_exams`
--
ALTER TABLE `civil_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counselling_requests`
--
ALTER TABLE `counselling_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counselling_times`
--
ALTER TABLE `counselling_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_counselling_times_faculty` (`faculty_id`);

--
-- Indexes for table `cse_exams`
--
ALTER TABLE `cse_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eee_exams`
--
ALTER TABLE `eee_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_routines`
--
ALTER TABLE `favourite_routines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `study_materials`
--
ALTER TABLE `study_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `upcoming_courses`
--
ALTER TABLE `upcoming_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `civil_exams`
--
ALTER TABLE `civil_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `counselling_requests`
--
ALTER TABLE `counselling_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `counselling_times`
--
ALTER TABLE `counselling_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cse_exams`
--
ALTER TABLE `cse_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `eee_exams`
--
ALTER TABLE `eee_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favourite_routines`
--
ALTER TABLE `favourite_routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_materials`
--
ALTER TABLE `study_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upcoming_courses`
--
ALTER TABLE `upcoming_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `counselling_times`
--
ALTER TABLE `counselling_times`
  ADD CONSTRAINT `fk_counselling_times_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourite_routines`
--
ALTER TABLE `favourite_routines`
  ADD CONSTRAINT `favourite_routines_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `student_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `study_materials`
--
ALTER TABLE `study_materials`
  ADD CONSTRAINT `study_materials_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
