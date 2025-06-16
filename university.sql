-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 09:43 AM
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
(135, 'Biology for Engineers', 'BIO 3105', '2024-07-22', 'Monday', '02:00:00', 'E'),
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

--
-- Dumping data for table `student_enrollments`
--

INSERT INTO `student_enrollments` (`id`, `student_id`, `course_id`, `section`) VALUES
(26, 11, 17, 'AA'),
(29, 11, 151, 'H'),
(31, 11, 695, 'E');

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
(13, 'ACT 2111', 'Financial and Managerial Accounting', 'A', '08:30:AM-09:50:AM', 'Sat'),
(14, 'ACT 2111', 'Financial and Managerial Accounting', 'A', '08:30:AM-09:50:AM', 'Tue'),
(15, 'ACT 2111', 'Financial and Managerial Accounting', 'B', '12:31:PM-01:50:PM', 'Sat'),
(16, 'ACT 2111', 'Financial and Managerial Accounting', 'B', '12:31:PM-01:50:PM', 'Tue'),
(17, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AA', '09:51:AM-11:10:AM', 'Sat'),
(18, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AA', '09:51:AM-11:10:AM', 'Tue'),
(19, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AB', '09:51:AM-11:10:AM', 'Sun'),
(20, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AB', '09:51:AM-11:10:AM', 'Wed'),
(21, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AC', '08:30:AM-09:50:AM', 'Sat'),
(22, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AC', '08:30:AM-09:50:AM', 'Tue'),
(23, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AD', '08:30:AM-09:50:AM', 'Sun'),
(24, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AD', '08:30:AM-09:50:AM', 'Wed'),
(25, 'BDS 1201', 'History of the Emergence of Bangladesh', 'ΑΕ', '12:31:PM-01:50:PM', 'Sat'),
(26, 'BDS 1201', 'History of the Emergence of Bangladesh', 'ΑΕ', '12:31:PM-01:50:PM', 'Tue'),
(27, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AF', '12:31:PM-01:50:PM', 'Sun'),
(28, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AF', '12:31:PM-01:50:PM', 'Wed'),
(29, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AG', '11:11:AM-12:30:PM', 'Sat'),
(30, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AG', '11:11:AM-12:30:PM', 'Tue'),
(31, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AH', '11:11:AM-12:30:PM', 'Sun'),
(32, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AH', '11:11:AM-12:30:PM', 'Wed'),
(33, 'BDS 1201', 'History of the Emergence of Bangladesh', 'Al', '12:31:PM-01:50:PM', 'Sat'),
(34, 'BDS 1201', 'History of the Emergence of Bangladesh', 'Al', '12:31:PM-01:50:PM', 'Tue'),
(35, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AJ', '12:31:PM-01:50:PM', 'Sun'),
(36, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AJ', '12:31:PM-01:50:PM', 'Wed'),
(37, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AK', '01:51:PM-03:10:PM', 'Sun'),
(38, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AK', '01:51:PM-03:10:PM', 'Wed'),
(39, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AL', '01:51:PM-03:10:PM', 'Sun'),
(40, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AL', '01:51:PM-03:10:PM', 'Wed'),
(41, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AM', '09:51:AM-11:10:AM', 'Sat'),
(42, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AM', '09:51:AM-11:10:AM', 'Tue'),
(43, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AN', '09:51:AM-11:10:AM', 'Sun'),
(44, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AN', '09:51:AM-11:10:AM', 'Wed'),
(45, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AO', '11:11:AM-12:30:PM', 'Sat'),
(46, 'BDS 1201', 'History of the Emergence of Bangladesh', 'AO', '11:11:AM-12:30:PM', 'Tue'),
(47, 'BIO 3105', 'Biology for Engineers', 'B', '11:11:AM-12:30:PM', 'Sun'),
(48, 'BIO 3105', 'Biology for Engineers', 'B', '11:11:AM-12:30:PM', 'Wed'),
(49, 'BIO 3105', 'Biology for Engineers', 'C', '09:51:AM-11:10:AM', 'Sat'),
(50, 'BIO 3105', 'Biology for Engineers', 'C', '09:51:AM-11:10:AM', 'Tue'),
(51, 'BIO 3105', 'Biology for Engineers', 'D', '09:51:AM-11:10:AM', 'Sun'),
(52, 'BIO 3105', 'Biology for Engineers', 'D', '09:51:AM-11:10:AM', 'Wed'),
(53, 'BIO 3105', 'Biology for Engineers', 'E', '01:51:PM-03:10:PM', 'Sun'),
(54, 'BIO 3105', 'Biology for Engineers', 'E', '01:51:PM-03:10:PM', 'Wed'),
(55, 'BIO 3105', 'Biology for Engineers', 'G', '03:11:PM-04:30:PM', 'Sun'),
(56, 'BIO 3105', 'Biology for Engineers', 'G', '03:11:PM-04:30:PM', 'Wed'),
(57, 'BIO 3105', 'Biology for Engineers', 'H', '01:51:PM-03:10:PM', 'Sat'),
(58, 'BIO 3105', 'Biology for Engineers', 'H', '01:51:PM-03:10:PM', 'Tue'),
(59, 'BIO 3105', 'Biology for Engineers', 'A', '11:11:AM-12:30:PM', 'Sat'),
(60, 'BIO 3105', 'Biology for Engineers', 'A', '11:11:AM-12:30:PM', 'Tue'),
(61, 'CSE 1110', 'Introduction to Computer Systems', 'B', '08:30:AM-11:00:AM', 'Sat'),
(62, 'CSE 1110', 'Introduction to Computer Systems', 'C', '08:30:AM-11:00:AM', 'Wed'),
(63, 'CSE 1110', 'Introduction to Computer Systems', 'Q', '08:30:AM-11:00:AM', 'Tue'),
(64, 'CSE 1110', 'Introduction to Computer Systems', 'R', '08:30:AM-11:00:AM', 'Sun'),
(65, 'CSE 1110', 'Introduction to Computer Systems', 'S', '11:11:AM-01:40:PM', 'Wed'),
(66, 'CSE 1110', 'Introduction to Computer Systems', 'T', '02:00:PM-04:30:PM', 'Wed'),
(67, 'CSE 1110', 'Introduction to Computer Systems', 'G', '02:00:PM-04:30:PM', 'Sun'),
(68, 'CSE 1110', 'Introduction to Computer Systems', 'H', '02:00:PM-04:30:PM', 'Tue'),
(69, 'CSE 1110', 'Introduction to Computer Systems', 'I', '02:00:PM-04:30:PM', 'Wed'),
(70, 'CSE 1110', 'Introduction to Computer Systems', 'J', '02:00:PM-04:30:PM', 'Tue'),
(71, 'CSE 1110', 'Introduction to Computer Systems', 'K', '11:11:AM-01:40:PM', 'Sun'),
(72, 'CSE 1110', 'Introduction to Computer Systems', 'L', '08:30:AM-11:00:AM', 'Sat'),
(73, 'CSE 1110', 'Introduction to Computer Systems', 'M', '11:11:AM-01:40:PM', 'Tue'),
(74, 'CSE 1110', 'Introduction to Computer Systems', 'N', '11:11:AM-01:40:PM', 'Sat'),
(75, 'CSE 1110', 'Introduction to Computer Systems', 'O', '08:30:AM-11:00:AM', 'Wed'),
(76, 'CSE 1110', 'Introduction to Computer Systems', 'P', '08:30:AM-11:00:AM', 'Sat'),
(77, 'CSE 1110', 'Introduction to Computer Systems', 'A', '08:30:AM-11:00:AM', 'Sun'),
(78, 'CSE 1110', 'Introduction to Computer Systems', 'D', '08:30:AM-11:00:AM', 'Tue'),
(79, 'CSE 1110', 'Introduction to Computer Systems', 'E', '11:11:AM-01:40:PM', 'Sun'),
(80, 'CSE 1110', 'Introduction to Computer Systems', 'F', '11:11:AM-01:40:PM', 'Sat'),
(81, 'CSE 1111', 'Structured Programming Language', 'Q', '09:51:AM-11:10:AM', 'Sat'),
(82, 'CSE 1111', 'Structured Programming Language', 'Q', '09:51:AM-11:10:AM', 'Tue'),
(83, 'CSE 1111', 'Structured Programming Language', 'R', '01:51:PM-03:10:PM', 'Sun'),
(84, 'CSE 1111', 'Structured Programming Language', 'R', '01:51:PM-03:10:PM', 'Wed'),
(85, 'CSE 1111', 'Structured Programming Language', 'S', '03:11:PM-04:30:PM', 'Sun'),
(86, 'CSE 1111', 'Structured Programming Language', 'S', '03:11:PM-04:30:PM', 'Wed'),
(87, 'CSE 1111', 'Structured Programming Language', 'T', '12:31:PM-01:50:PM', 'Sat'),
(88, 'CSE 1111', 'Structured Programming Language', 'T', '12:31:PM-01:50:PM', 'Tue'),
(89, 'CSE 1111', 'Structured Programming Language', 'J', '12:31:PM-01:50:PM', 'Sun'),
(90, 'CSE 1111', 'Structured Programming Language', 'J', '12:31:PM-01:50:PM', 'Wed'),
(91, 'CSE 1111', 'Structured Programming Language', 'K', '09:51:AM-11:10:AM', 'Sat'),
(92, 'CSE 1111', 'Structured Programming Language', 'K', '09:51:AM-11:10:AM', 'Tue'),
(93, 'CSE 1111', 'Structured Programming Language', 'P', '12:31:PM-01:50:PM', 'Sat'),
(94, 'CSE 1111', 'Structured Programming Language', 'P', '12:31:PM-01:50:PM', 'Tue'),
(95, 'CSE 1111', 'Structured Programming Language', 'A', '08:30:AM-09:50:AM', 'Sun'),
(96, 'CSE 1111', 'Structured Programming Language', 'A', '08:30:AM-09:50:AM', 'Wed'),
(97, 'CSE 1111', 'Structured Programming Language', 'B', '08:30:AM-09:50:AM', 'Sat'),
(98, 'CSE 1111', 'Structured Programming Language', 'B', '08:30:AM-09:50:AM', 'Tue'),
(99, 'CSE 1111', 'Structured Programming Language', 'C', '09:51:AM-11:10:AM', 'Sun'),
(100, 'CSE 1111', 'Structured Programming Language', 'C', '09:51:AM-11:10:AM', 'Wed'),
(101, 'CSE 1111', 'Structured Programming Language', 'D', '09:51:AM-11:10:AM', 'Sat'),
(102, 'CSE 1111', 'Structured Programming Language', 'D', '09:51:AM-11:10:AM', 'Tue'),
(103, 'CSE 1111', 'Structured Programming Language', 'E', '12:31:PM-01:50:PM', 'Sat'),
(104, 'CSE 1111', 'Structured Programming Language', 'E', '12:31:PM-01:50:PM', 'Tue'),
(105, 'CSE 1111', 'Structured Programming Language', 'F', '11:11:AM-12:30:PM', 'Sun'),
(106, 'CSE 1111', 'Structured Programming Language', 'F', '11:11:AM-12:30:PM', 'Wed'),
(107, 'CSE 1111', 'Structured Programming Language', 'G', '12:31:PM-01:50:PM', 'Sun'),
(108, 'CSE 1111', 'Structured Programming Language', 'G', '12:31:PM-01:50:PM', 'Wed'),
(109, 'CSE 1111', 'Structured Programming Language', 'H', '11:11:AM-12:30:PM', 'Sat'),
(110, 'CSE 1111', 'Structured Programming Language', 'H', '11:11:AM-12:30:PM', 'Tue'),
(111, 'CSE 1111', 'Structured Programming Language', 'L', '08:30:AM-09:50:AM', 'Sat'),
(112, 'CSE 1111', 'Structured Programming Language', 'L', '08:30:AM-09:50:AM', 'Tue'),
(113, 'CSE 1111', 'Structured Programming Language', 'M', '08:30:AM-09:50:AM', 'Sun'),
(114, 'CSE 1111', 'Structured Programming Language', 'M', '08:30:AM-09:50:AM', 'Wed'),
(115, 'CSE 1111', 'Structured Programming Language', 'O', '12:31:PM-01:50:PM', 'Sun'),
(116, 'CSE 1111', 'Structured Programming Language', 'O', '12:31:PM-01:50:PM', 'Wed'),
(117, 'CSE 1111', 'Structured Programming Language', 'N', '08:30:AM-09:50:AM', 'Sun'),
(118, 'CSE 1111', 'Structured Programming Language', 'N', '08:30:AM-09:50:AM', 'Wed'),
(139, 'CSE 1115', 'Object Oriented Programming', 'B', '08:30:AM-09:50:AM', 'Sat'),
(140, 'CSE 1115', 'Object Oriented Programming', 'B', '08:30:AM-09:50:AM', 'Tue'),
(141, 'CSE 1115', 'Object Oriented Programming', 'C', '09:51:AM-11:10:AM', 'Sat'),
(142, 'CSE 1115', 'Object Oriented Programming', 'C', '09:51:AM-11:10:AM', 'Tue'),
(143, 'CSE 1115', 'Object Oriented Programming', 'A', '08:30:AM-09:50:AM', 'Sun'),
(144, 'CSE 1115', 'Object Oriented Programming', 'A', '08:30:AM-09:50:AM', 'Wed'),
(145, 'CSE 1115', 'Object Oriented Programming', 'E', '11:11:AM-12:30:PM', 'Sat'),
(146, 'CSE 1115', 'Object Oriented Programming', 'E', '11:11:AM-12:30:PM', 'Tue'),
(147, 'CSE 1115', 'Object Oriented Programming', 'F', '12:31:PM-01:50:PM', 'Sat'),
(148, 'CSE 1115', 'Object Oriented Programming', 'F', '12:31:PM-01:50:PM', 'Tue'),
(149, 'CSE 1115', 'Object Oriented Programming', 'G', '01:51:PM-03:10:PM', 'Sat'),
(150, 'CSE 1115', 'Object Oriented Programming', 'G', '01:51:PM-03:10:PM', 'Tue'),
(151, 'CSE 1115', 'Object Oriented Programming', 'H', '11:11:AM-12:30:PM', 'Sun'),
(152, 'CSE 1115', 'Object Oriented Programming', 'H', '11:11:AM-12:30:PM', 'Wed'),
(153, 'CSE 1115', 'Object Oriented Programming', 'D', '09:51:AM-11:10:AM', 'Sun'),
(154, 'CSE 1115', 'Object Oriented Programming', 'D', '09:51:AM-11:10:AM', 'Wed'),
(155, 'CSE 1115', 'Object Oriented Programming', 'I', '12:31:PM-01:50:PM', 'Sat'),
(156, 'CSE 1115', 'Object Oriented Programming', 'I', '12:31:PM-01:50:PM', 'Tue'),
(157, 'CSE 1115', 'Object Oriented Programming', 'J', '12:31:PM-01:50:PM', 'Sun'),
(158, 'CSE 1115', 'Object Oriented Programming', 'J', '12:31:PM-01:50:PM', 'Wed'),
(159, 'CSE 1115', 'Object Oriented Programming', 'K', '01:51:PM-03:10:PM', 'Sat'),
(160, 'CSE 1115', 'Object Oriented Programming', 'K', '01:51:PM-03:10:PM', 'Tue'),
(161, 'CSE 1115', 'Object Oriented Programming', 'M', '12:31:PM-01:50:PM', 'Sat'),
(162, 'CSE 1115', 'Object Oriented Programming', 'M', '12:31:PM-01:50:PM', 'Tue'),
(163, 'CSE 1115', 'Object Oriented Programming', 'N', '12:31:PM-01:50:PM', 'Sat'),
(164, 'CSE 1115', 'Object Oriented Programming', 'N', '12:31:PM-01:50:PM', 'Tue'),
(165, 'CSE 1115', 'Object Oriented Programming', 'O', '12:31:PM-01:50:PM', 'Sun'),
(166, 'CSE 1115', 'Object Oriented Programming', 'O', '12:31:PM-01:50:PM', 'Wed'),
(167, 'CSE 1115', 'Object Oriented Programming', 'Q', '01:51:PM-03:10:PM', 'Sun'),
(168, 'CSE 1115', 'Object Oriented Programming', 'Q', '01:51:PM-03:10:PM', 'Wed'),
(169, 'CSE 1115', 'Object Oriented Programming', 'R', '03:11:PM-04:30:PM', 'Sun'),
(170, 'CSE 1115', 'Object Oriented Programming', 'R', '03:11:PM-04:30:PM', 'Wed'),
(189, 'CSE 1325', 'Digital Logic Design', 'A', '09:51:AM-11:10:AM', 'Sat'),
(190, 'CSE 1325', 'Digital Logic Design', 'A', '09:51:AM-11:10:AM', 'Tue'),
(191, 'CSE 1325', 'Digital Logic Design', 'B', '09:51:AM-11:10:AM', 'Sun'),
(192, 'CSE 1325', 'Digital Logic Design', 'B', '09:51:AM-11:10:AM', 'Wed'),
(193, 'CSE 1325', 'Digital Logic Design', 'C', '08:30:AM-09:50:AM', 'Sun'),
(194, 'CSE 1325', 'Digital Logic Design', 'C', '08:30:AM-09:50:AM', 'Wed'),
(195, 'CSE 1325', 'Digital Logic Design', 'D', '08:30:AM-09:50:AM', 'Sat'),
(196, 'CSE 1325', 'Digital Logic Design', 'D', '08:30:AM-09:50:AM', 'Tue'),
(197, 'CSE 1325', 'Digital Logic Design', 'F', '11:11:AM-12:30:PM', 'Sun'),
(198, 'CSE 1325', 'Digital Logic Design', 'F', '11:11:AM-12:30:PM', 'Wed'),
(199, 'CSE 1325', 'Digital Logic Design', 'G', '12:31:PM-01:50:PM', 'Sun'),
(200, 'CSE 1325', 'Digital Logic Design', 'G', '12:31:PM-01:50:PM', 'Wed'),
(201, 'CSE 1325', 'Digital Logic Design', 'E', '09:51:AM-11:10:AM', 'Sun'),
(202, 'CSE 1325', 'Digital Logic Design', 'E', '09:51:AM-11:10:AM', 'Wed'),
(203, 'CSE 1325', 'Digital Logic Design', 'H', '11:11:AM-12:30:PM', 'Sat'),
(204, 'CSE 1325', 'Digital Logic Design', 'H', '11:11:AM-12:30:PM', 'Tue'),
(205, 'CSE 1325', 'Digital Logic Design', 'I', '12:31:PM-01:50:PM', 'Sun'),
(206, 'CSE 1325', 'Digital Logic Design', 'I', '12:31:PM-01:50:PM', 'Wed'),
(207, 'CSE 1325', 'Digital Logic Design', 'J', '11:11:AM-12:30:PM', 'Sun'),
(208, 'CSE 1325', 'Digital Logic Design', 'J', '11:11:AM-12:30:PM', 'Wed'),
(209, 'CSE 1325', 'Digital Logic Design', 'K', '12:31:PM-01:50:PM', 'Sun'),
(210, 'CSE 1325', 'Digital Logic Design', 'K', '12:31:PM-01:50:PM', 'Wed'),
(211, 'CSE 1325', 'Digital Logic Design', 'L', '09:51:AM-11:10:AM', 'Sun'),
(212, 'CSE 1325', 'Digital Logic Design', 'L', '09:51:AM-11:10:AM', 'Wed'),
(213, 'CSE 1325', 'Digital Logic Design', 'M', '11:11:AM-12:30:PM', 'Sat'),
(214, 'CSE 1325', 'Digital Logic Design', 'M', '11:11:AM-12:30:PM', 'Tue'),
(215, 'CSE 1325', 'Digital Logic Design', 'N', '01:51:PM-03:10:PM', 'Sun'),
(216, 'CSE 1325', 'Digital Logic Design', 'N', '01:51:PM-03:10:PM', 'Wed'),
(217, 'CSE 1325', 'Digital Logic Design', 'Q', '03:11:PM-04:30:PM', 'Sun'),
(218, 'CSE 1325', 'Digital Logic Design', 'Q', '03:11:PM-04:30:PM', 'Wed'),
(219, 'CSE 1325', 'Digital Logic Design', 'R', '12:31:PM-01:50:PM', 'Sat'),
(220, 'CSE 1325', 'Digital Logic Design', 'R', '12:31:PM-01:50:PM', 'Tue'),
(221, 'CSE 1325', 'Digital Logic Design', 'P', '01:51:PM-03:10:PM', 'Sun'),
(222, 'CSE 1325', 'Digital Logic Design', 'P', '01:51:PM-03:10:PM', 'Wed'),
(254, 'CSE 2213', 'Discrete Mathematics', 'A', '11:11:AM-12:30:PM', 'Sun'),
(255, 'CSE 2213', 'Discrete Mathematics', 'A', '11:11:AM-12:30:PM', 'Wed'),
(256, 'CSE 2213', 'Discrete Mathematics', 'B', '11:11:AM-12:30:PM', 'Sat'),
(257, 'CSE 2213', 'Discrete Mathematics', 'B', '11:11:AM-12:30:PM', 'Tue'),
(258, 'CSE 2213', 'Discrete Mathematics', 'C', '11:11:AM-12:30:PM', 'Sun'),
(259, 'CSE 2213', 'Discrete Mathematics', 'C', '11:11:AM-12:30:PM', 'Wed'),
(260, 'CSE 2213', 'Discrete Mathematics', 'D', '11:11:AM-12:30:PM', 'Sat'),
(261, 'CSE 2213', 'Discrete Mathematics', 'D', '11:11:AM-12:30:PM', 'Tue'),
(262, 'CSE 2213', 'Discrete Mathematics', 'E', '01:51:PM-03:10:PM', 'Sun'),
(263, 'CSE 2213', 'Discrete Mathematics', 'E', '01:51:PM-03:10:PM', 'Wed'),
(264, 'CSE 2213', 'Discrete Mathematics', 'F', '01:51:PM-03:10:PM', 'Sat'),
(265, 'CSE 2213', 'Discrete Mathematics', 'F', '01:51:PM-03:10:PM', 'Tue'),
(266, 'CSE 2213', 'Discrete Mathematics', 'G', '12:31:PM-01:50:PM', 'Sun'),
(267, 'CSE 2213', 'Discrete Mathematics', 'G', '12:31:PM-01:50:PM', 'Wed'),
(268, 'CSE 2213', 'Discrete Mathematics', 'H', '08:30:AM-09:50:AM', 'Sat'),
(269, 'CSE 2213', 'Discrete Mathematics', 'H', '08:30:AM-09:50:AM', 'Tue'),
(270, 'CSE 2213', 'Discrete Mathematics', 'I', '12:31:PM-01:50:PM', 'Sun'),
(271, 'CSE 2213', 'Discrete Mathematics', 'I', '12:31:PM-01:50:PM', 'Wed'),
(272, 'CSE 2213', 'Discrete Mathematics', 'J', '12:31:PM-01:50:PM', 'Sat'),
(273, 'CSE 2213', 'Discrete Mathematics', 'J', '12:31:PM-01:50:PM', 'Tue'),
(274, 'CSE 2213', 'Discrete Mathematics', 'K', '12:31:PM-01:50:PM', 'Sat'),
(275, 'CSE 2213', 'Discrete Mathematics', 'K', '12:31:PM-01:50:PM', 'Tue'),
(276, 'CSE 2213', 'Discrete Mathematics', 'L', '12:31:PM-01:50:PM', 'Sat'),
(277, 'CSE 2213', 'Discrete Mathematics', 'L', '12:31:PM-01:50:PM', 'Tue'),
(278, 'CSE 2213', 'Discrete Mathematics', 'M', '08:30:AM-09:50:AM', 'Sun'),
(279, 'CSE 2213', 'Discrete Mathematics', 'M', '08:30:AM-09:50:AM', 'Wed'),
(280, 'CSE 2213', 'Discrete Mathematics', 'N', '08:30:AM-09:50:AM', 'Sat'),
(281, 'CSE 2213', 'Discrete Mathematics', 'N', '08:30:AM-09:50:AM', 'Tue'),
(282, 'CSE 2213', 'Discrete Mathematics', 'O', '12:31:PM-01:50:PM', 'Sun'),
(283, 'CSE 2213', 'Discrete Mathematics', 'O', '12:31:PM-01:50:PM', 'Wed'),
(284, 'CSE 2215', 'Data Structure and Algorithms I', 'A', '11:11:AM-12:30:PM', 'Sun'),
(285, 'CSE 2215', 'Data Structure and Algorithms I', 'A', '11:11:AM-12:30:PM', 'Wed'),
(286, 'CSE 2215', 'Data Structure and Algorithms I', 'B', '11:11:AM-12:30:PM', 'Sat'),
(287, 'CSE 2215', 'Data Structure and Algorithms I', 'B', '11:11:AM-12:30:PM', 'Tue'),
(288, 'CSE 2215', 'Data Structure and Algorithms I', 'C', '12:31:PM-01:50:PM', 'Sun'),
(289, 'CSE 2215', 'Data Structure and Algorithms I', 'C', '12:31:PM-01:50:PM', 'Wed'),
(290, 'CSE 2215', 'Data Structure and Algorithms I', 'D', '08:30:AM-09:50:AM', 'Sat'),
(291, 'CSE 2215', 'Data Structure and Algorithms I', 'D', '08:30:AM-09:50:AM', 'Tue'),
(292, 'CSE 2215', 'Data Structure and Algorithms I', 'E', '09:51:AM-11:10:AM', 'Sat'),
(293, 'CSE 2215', 'Data Structure and Algorithms I', 'E', '09:51:AM-11:10:AM', 'Tue'),
(294, 'CSE 2215', 'Data Structure and Algorithms I', 'F', '12:31:PM-01:50:PM', 'Sun'),
(295, 'CSE 2215', 'Data Structure and Algorithms I', 'F', '12:31:PM-01:50:PM', 'Wed'),
(296, 'CSE 2215', 'Data Structure and Algorithms I', 'G', '11:11:AM-12:30:PM', 'Sun'),
(297, 'CSE 2215', 'Data Structure and Algorithms I', 'G', '11:11:AM-12:30:PM', 'Wed'),
(298, 'CSE 2215', 'Data Structure and Algorithms I', 'H', '12:31:PM-01:50:PM', 'Sat'),
(299, 'CSE 2215', 'Data Structure and Algorithms I', 'H', '12:31:PM-01:50:PM', 'Tue'),
(300, 'CSE 2215', 'Data Structure and Algorithms I', 'I', '01:51:PM-03:10:PM', 'Sat'),
(301, 'CSE 2215', 'Data Structure and Algorithms I', 'I', '01:51:PM-03:10:PM', 'Tue'),
(302, 'CSE 2215', 'Data Structure and Algorithms I', 'J', '01:51:PM-03:10:PM', 'Sun'),
(303, 'CSE 2215', 'Data Structure and Algorithms I', 'J', '01:51:PM-03:10:PM', 'Wed'),
(304, 'CSE 2215', 'Data Structure and Algorithms I', 'K', '09:51:AM-11:10:AM', 'Sun'),
(305, 'CSE 2215', 'Data Structure and Algorithms I', 'K', '09:51:AM-11:10:AM', 'Wed'),
(306, 'CSE 2215', 'Data Structure and Algorithms I', 'L', '11:11:AM-12:30:PM', 'Sat'),
(307, 'CSE 2215', 'Data Structure and Algorithms I', 'L', '11:11:AM-12:30:PM', 'Tue'),
(326, 'CSE 2217', 'Data Structure and Algorithms II', 'A', '08:30:AM-09:50:AM', 'Sat'),
(327, 'CSE 2217', 'Data Structure and Algorithms II', 'A', '08:30:AM-09:50:AM', 'Tue'),
(328, 'CSE 2217', 'Data Structure and Algorithms II', 'F', '03:11:PM-04:30:PM', 'Sun'),
(329, 'CSE 2217', 'Data Structure and Algorithms II', 'F', '03:11:PM-04:30:PM', 'Wed'),
(330, 'CSE 2217', 'Data Structure and Algorithms II', 'D', '09:51:AM-11:10:AM', 'Sun'),
(331, 'CSE 2217', 'Data Structure and Algorithms II', 'D', '09:51:AM-11:10:AM', 'Wed'),
(332, 'CSE 2217', 'Data Structure and Algorithms II', 'E', '11:11:AM-12:30:PM', 'Sat'),
(333, 'CSE 2217', 'Data Structure and Algorithms II', 'E', '11:11:AM-12:30:PM', 'Tue'),
(334, 'CSE 2217', 'Data Structure and Algorithms II', 'C', '08:30:AM-09:50:AM', 'Sun'),
(335, 'CSE 2217', 'Data Structure and Algorithms II', 'C', '08:30:AM-09:50:AM', 'Wed'),
(336, 'CSE 2217', 'Data Structure and Algorithms II', 'B', '08:30:AM-09:50:AM', 'Sat'),
(337, 'CSE 2217', 'Data Structure and Algorithms II', 'B', '08:30:AM-09:50:AM', 'Tue'),
(338, 'CSE 2217', 'Data Structure and Algorithms II', 'G', '01:51:PM-03:10:PM', 'Sun'),
(339, 'CSE 2217', 'Data Structure and Algorithms II', 'G', '01:51:PM-03:10:PM', 'Wed'),
(340, 'CSE 2217', 'Data Structure and Algorithms II', 'H', '01:51:PM-03:10:PM', 'Sat'),
(341, 'CSE 2217', 'Data Structure and Algorithms II', 'H', '01:51:PM-03:10:PM', 'Tue'),
(342, 'CSE 2217', 'Data Structure and Algorithms II', 'I', '09:51:AM-11:10:AM', 'Sat'),
(343, 'CSE 2217', 'Data Structure and Algorithms II', 'I', '09:51:AM-11:10:AM', 'Tue'),
(344, 'CSE 2217', 'Data Structure and Algorithms II', 'J', '09:51:AM-11:10:AM', 'Sun'),
(345, 'CSE 2217', 'Data Structure and Algorithms II', 'J', '09:51:AM-11:10:AM', 'Wed'),
(358, 'CSE 2233', 'Theory of Computation', 'B', '09:51:AM-11:10:AM', 'Sat'),
(359, 'CSE 2233', 'Theory of Computation', 'B', '09:51:AM-11:10:AM', 'Tue'),
(360, 'CSE 2233', 'Theory of Computation', 'C', '11:11:AM-12:30:PM', 'Sun'),
(361, 'CSE 2233', 'Theory of Computation', 'C', '11:11:AM-12:30:PM', 'Wed'),
(362, 'CSE 2233', 'Theory of Computation', 'D', '09:51:AM-11:10:AM', 'Sat'),
(363, 'CSE 2233', 'Theory of Computation', 'D', '09:51:AM-11:10:AM', 'Tue'),
(364, 'CSE 2233', 'Theory of Computation', 'E', '12:31:PM-01:50:PM', 'Sun'),
(365, 'CSE 2233', 'Theory of Computation', 'E', '12:31:PM-01:50:PM', 'Wed'),
(366, 'CSE 2233', 'Theory of Computation', 'F', '12:31:PM-01:50:PM', 'Sat'),
(367, 'CSE 2233', 'Theory of Computation', 'F', '12:31:PM-01:50:PM', 'Tue'),
(368, 'CSE 2233', 'Theory of Computation', 'G', '01:51:PM-03:10:PM', 'Sun'),
(369, 'CSE 2233', 'Theory of Computation', 'G', '01:51:PM-03:10:PM', 'Wed'),
(370, 'CSE 2233', 'Theory of Computation', 'H', '01:51:PM-03:10:PM', 'Sat'),
(371, 'CSE 2233', 'Theory of Computation', 'H', '01:51:PM-03:10:PM', 'Tue'),
(372, 'CSE 2233', 'Theory of Computation', 'J', '01:51:PM-03:10:PM', 'Sun'),
(373, 'CSE 2233', 'Theory of Computation', 'J', '01:51:PM-03:10:PM', 'Wed'),
(374, 'CSE 2233', 'Theory of Computation', 'A', '09:51:AM-11:10:AM', 'Sun'),
(375, 'CSE 2233', 'Theory of Computation', 'A', '09:51:AM-11:10:AM', 'Wed'),
(376, 'CSE 2233', 'Theory of Computation', 'K', '09:51:AM-11:10:AM', 'Sun'),
(377, 'CSE 2233', 'Theory of Computation', 'K', '09:51:AM-11:10:AM', 'Wed'),
(378, 'CSE 2233', 'Theory of Computation', 'L', '03:11:PM-04:30:PM', 'Sun'),
(379, 'CSE 2233', 'Theory of Computation', 'L', '03:11:PM-04:30:PM', 'Wed'),
(380, 'CSE 2233', 'Theory of Computation', 'M', '11:11:AM-12:30:PM', 'Sun'),
(381, 'CSE 2233', 'Theory of Computation', 'M', '11:11:AM-12:30:PM', 'Wed'),
(382, 'CSE 2233', 'Theory of Computation', 'N', '03:11:PM-04:30:PM', 'Sun'),
(383, 'CSE 2233', 'Theory of Computation', 'N', '03:11:PM-04:30:PM', 'Wed'),
(384, 'CSE 2233', 'Theory of Computation', 'O', '12:31:PM-01:50:PM', 'Sun'),
(385, 'CSE 2233', 'Theory of Computation', 'O', '12:31:PM-01:50:PM', 'Wed'),
(386, 'CSE 2233', 'Theory of Computation', 'P', '12:31:PM-01:50:PM', 'Sat'),
(387, 'CSE 2233', 'Theory of Computation', 'P', '12:31:PM-01:50:PM', 'Tue'),
(388, 'CSE 2233', 'Theory of Computation', 'Q', '01:51:PM-03:10:PM', 'Sun'),
(389, 'CSE 2233', 'Theory of Computation', 'Q', '01:51:PM-03:10:PM', 'Wed'),
(390, 'CSE 2233', 'Theory of Computation', 'R', '01:51:PM-03:10:PM', 'Sat'),
(391, 'CSE 2233', 'Theory of Computation', 'R', '01:51:PM-03:10:PM', 'Tue'),
(392, 'CSE 3313', 'Computer Architecture', 'A', '11:11:AM-12:30:PM', 'Sun'),
(393, 'CSE 3313', 'Computer Architecture', 'A', '11:11:AM-12:30:PM', 'Wed'),
(394, 'CSE 3313', 'Computer Architecture', 'B', '12:31:PM-01:50:PM', 'Sat'),
(395, 'CSE 3313', 'Computer Architecture', 'B', '12:31:PM-01:50:PM', 'Tue'),
(396, 'CSE 3313', 'Computer Architecture', 'C', '12:31:PM-01:50:PM', 'Sun'),
(397, 'CSE 3313', 'Computer Architecture', 'C', '12:31:PM-01:50:PM', 'Wed'),
(398, 'CSE 3313', 'Computer Architecture', 'D', '01:51:PM-03:10:PM', 'Sat'),
(399, 'CSE 3313', 'Computer Architecture', 'D', '01:51:PM-03:10:PM', 'Tue'),
(400, 'CSE 3313', 'Computer Architecture', 'E', '01:51:PM-03:10:PM', 'Sun'),
(401, 'CSE 3313', 'Computer Architecture', 'E', '01:51:PM-03:10:PM', 'Wed'),
(402, 'CSE 3313', 'Computer Architecture', 'F', '03:11:PM-04:30:PM', 'Sun'),
(403, 'CSE 3313', 'Computer Architecture', 'F', '03:11:PM-04:30:PM', 'Wed'),
(404, 'CSE 3313', 'Computer Architecture', 'G', '08:30:AM-09:50:AM', 'Sat'),
(405, 'CSE 3313', 'Computer Architecture', 'G', '08:30:AM-09:50:AM', 'Tue'),
(406, 'CSE 3313', 'Computer Architecture', 'H', '08:30:AM-09:50:AM', 'Sun'),
(407, 'CSE 3313', 'Computer Architecture', 'H', '08:30:AM-09:50:AM', 'Wed'),
(408, 'CSE 3313', 'Computer Architecture', 'I', '09:51:AM-11:10:AM', 'Sun'),
(409, 'CSE 3313', 'Computer Architecture', 'I', '09:51:AM-11:10:AM', 'Wed'),
(410, 'CSE 3313', 'Computer Architecture', 'J', '03:11:PM-04:30:PM', 'Sun'),
(411, 'CSE 3313', 'Computer Architecture', 'J', '03:11:PM-04:30:PM', 'Wed'),
(412, 'CSE 3411', 'System Analysis and Design', 'A', '08:30:AM-09:50:AM', 'Sat'),
(413, 'CSE 3411', 'System Analysis and Design', 'A', '08:30:AM-09:50:AM', 'Tue'),
(414, 'CSE 3411', 'System Analysis and Design', 'B', '08:30:AM-09:50:AM', 'Sun'),
(415, 'CSE 3411', 'System Analysis and Design', 'B', '08:30:AM-09:50:AM', 'Wed'),
(420, 'CSE 3411', 'System Analysis and Design', 'C', '03:11:PM-04:30:PM', 'Sat'),
(421, 'CSE 3411', 'System Analysis and Design', 'C', '03:11:PM-04:30:PM', 'Tue'),
(422, 'CSE 3411', 'System Analysis and Design', 'D', '09:51:AM-11:10:AM', 'Sun'),
(423, 'CSE 3411', 'System Analysis and Design', 'D', '09:51:AM-11:10:AM', 'Wed'),
(424, 'CSE 3411', 'System Analysis and Design', 'E', '11:11:AM-12:30:PM', 'Sat'),
(425, 'CSE 3411', 'System Analysis and Design', 'E', '11:11:AM-12:30:PM', 'Tue'),
(426, 'CSE 3411', 'System Analysis and Design', 'F', '11:11:AM-12:30:PM', 'Sun'),
(427, 'CSE 3411', 'System Analysis and Design', 'F', '11:11:AM-12:30:PM', 'Wed'),
(428, 'CSE 3411', 'System Analysis and Design', 'G', '12:31:PM-01:50:PM', 'Sat'),
(429, 'CSE 3411', 'System Analysis and Design', 'G', '12:31:PM-01:50:PM', 'Tue'),
(430, 'CSE 3411', 'System Analysis and Design', 'H', '12:31:PM-01:50:PM', 'Sun'),
(431, 'CSE 3411', 'System Analysis and Design', 'H', '12:31:PM-01:50:PM', 'Wed'),
(432, 'CSE 3411', 'System Analysis and Design', 'I', '01:51:PM-03:10:PM', 'Sat'),
(433, 'CSE 3411', 'System Analysis and Design', 'I', '01:51:PM-03:10:PM', 'Tue'),
(434, 'CSE 3411', 'System Analysis and Design', 'J', '12:31:PM-01:50:PM', 'Sun'),
(435, 'CSE 3411', 'System Analysis and Design', 'J', '12:31:PM-01:50:PM', 'Wed'),
(446, 'CSE 3421', 'Software Engineering', 'A', '12:31:PM-01:50:PM', 'Sun'),
(447, 'CSE 3421', 'Software Engineering', 'A', '12:31:PM-01:50:PM', 'Wed'),
(448, 'CSE 3421', 'Software Engineering', 'B', '12:31:PM-01:50:PM', 'Sat'),
(449, 'CSE 3421', 'Software Engineering', 'B', '12:31:PM-01:50:PM', 'Tue'),
(450, 'CSE 3421', 'Software Engineering', 'C', '08:30:AM-09:50:AM', 'Sat'),
(451, 'CSE 3421', 'Software Engineering', 'C', '08:30:AM-09:50:AM', 'Tue'),
(452, 'CSE 3421', 'Software Engineering', 'D', '11:11:AM-12:30:PM', 'Sat'),
(453, 'CSE 3421', 'Software Engineering', 'D', '11:11:AM-12:30:PM', 'Tue'),
(464, 'CSE 3521', 'Database Management Systems', 'A', '09:51:AM-11:10:AM', 'Sat'),
(465, 'CSE 3521', 'Database Management Systems', 'A', '09:51:AM-11:10:AM', 'Tue'),
(466, 'CSE 3521', 'Database Management Systems', 'B', '09:51:AM-11:10:AM', 'Sun'),
(467, 'CSE 3521', 'Database Management Systems', 'B', '09:51:AM-11:10:AM', 'Wed'),
(468, 'CSE 3521', 'Database Management Systems', 'C', '08:30:AM-09:50:AM', 'Sat'),
(469, 'CSE 3521', 'Database Management Systems', 'C', '08:30:AM-09:50:AM', 'Tue'),
(470, 'CSE 3521', 'Database Management Systems', 'D', '08:30:AM-09:50:AM', 'Sun'),
(471, 'CSE 3521', 'Database Management Systems', 'D', '08:30:AM-09:50:AM', 'Wed'),
(472, 'CSE 3521', 'Database Management Systems', 'E', '09:51:AM-11:10:AM', 'Sat'),
(473, 'CSE 3521', 'Database Management Systems', 'E', '09:51:AM-11:10:AM', 'Tue'),
(474, 'CSE 3521', 'Database Management Systems', 'F', '09:51:AM-11:10:AM', 'Sun'),
(475, 'CSE 3521', 'Database Management Systems', 'F', '09:51:AM-11:10:AM', 'Wed'),
(476, 'CSE 3521', 'Database Management Systems', 'G', '01:51:PM-03:10:PM', 'Sat'),
(477, 'CSE 3521', 'Database Management Systems', 'G', '01:51:PM-03:10:PM', 'Tue'),
(478, 'CSE 3521', 'Database Management Systems', 'H', '01:51:PM-03:10:PM', 'Sun'),
(479, 'CSE 3521', 'Database Management Systems', 'H', '01:51:PM-03:10:PM', 'Wed'),
(480, 'CSE 3521', 'Database Management Systems', 'I', '12:31:PM-01:50:PM', 'Sat'),
(481, 'CSE 3521', 'Database Management Systems', 'I', '12:31:PM-01:50:PM', 'Tue'),
(495, 'CSE 3711', 'Computer Networks', 'H', '12:31:PM-01:50:PM', 'Sat'),
(496, 'CSE 3711', 'Computer Networks', 'H', '12:31:PM-01:50:PM', 'Tue'),
(497, 'CSE 3711', 'Computer Networks', 'I', '09:51:AM-11:10:AM', 'Sun'),
(498, 'CSE 3711', 'Computer Networks', 'I', '09:51:AM-11:10:AM', 'Wed'),
(499, 'CSE 3711', 'Computer Networks', 'A', '08:30:AM-09:50:AM', 'Sat'),
(500, 'CSE 3711', 'Computer Networks', 'A', '08:30:AM-09:50:AM', 'Tue'),
(501, 'CSE 3711', 'Computer Networks', 'B', '11:11:AM-12:30:PM', 'Sun'),
(502, 'CSE 3711', 'Computer Networks', 'B', '11:11:AM-12:30:PM', 'Wed'),
(503, 'CSE 3711', 'Computer Networks', 'C', '11:11:AM-12:30:PM', 'Sat'),
(504, 'CSE 3711', 'Computer Networks', 'C', '11:11:AM-12:30:PM', 'Tue'),
(505, 'CSE 3711', 'Computer Networks', 'D', '08:30:AM-09:50:AM', 'Sat'),
(506, 'CSE 3711', 'Computer Networks', 'D', '08:30:AM-09:50:AM', 'Tue'),
(507, 'CSE 3711', 'Computer Networks', 'E', '12:31:PM-01:50:PM', 'Sat'),
(508, 'CSE 3711', 'Computer Networks', 'E', '12:31:PM-01:50:PM', 'Tue'),
(509, 'CSE 3711', 'Computer Networks', 'F', '12:31:PM-01:50:PM', 'Sun'),
(510, 'CSE 3711', 'Computer Networks', 'F', '12:31:PM-01:50:PM', 'Wed'),
(511, 'CSE 3711', 'Computer Networks', 'G', '09:51:AM-11:10:AM', 'Sat'),
(512, 'CSE 3711', 'Computer Networks', 'G', '09:51:AM-11:10:AM', 'Tue'),
(524, 'CSE 3715', 'Data Communication', 'A', '11:11:AM-12:30:PM', 'Sun'),
(525, 'CSE 3715', 'Data Communication', 'A', '11:11:AM-12:30:PM', 'Wed'),
(526, 'CSE 3811', 'Artificial Intelligence', 'H', '12:31:PM-01:50:PM', 'Sat'),
(527, 'CSE 3811', 'Artificial Intelligence', 'H', '12:31:PM-01:50:PM', 'Tue'),
(528, 'CSE 3811', 'Artificial Intelligence', 'I', '03:11:PM-04:30:PM', 'Sun'),
(529, 'CSE 3811', 'Artificial Intelligence', 'I', '03:11:PM-04:30:PM', 'Wed'),
(530, 'CSE 3811', 'Artificial Intelligence', 'E', '11:11:AM-12:30:PM', 'Sun'),
(531, 'CSE 3811', 'Artificial Intelligence', 'E', '11:11:AM-12:30:PM', 'Wed'),
(532, 'CSE 3811', 'Artificial Intelligence', 'G', '12:31:PM-01:50:PM', 'Sun'),
(533, 'CSE 3811', 'Artificial Intelligence', 'G', '12:31:PM-01:50:PM', 'Wed'),
(534, 'CSE 3811', 'Artificial Intelligence', 'C', '09:51:AM-11:10:AM', 'Sun'),
(535, 'CSE 3811', 'Artificial Intelligence', 'C', '09:51:AM-11:10:AM', 'Wed'),
(536, 'CSE 3811', 'Artificial Intelligence', 'D', '09:51:AM-11:10:AM', 'Sat'),
(537, 'CSE 3811', 'Artificial Intelligence', 'D', '09:51:AM-11:10:AM', 'Tue'),
(538, 'CSE 3811', 'Artificial Intelligence', 'A', '08:30:AM-09:50:AM', 'Sun'),
(539, 'CSE 3811', 'Artificial Intelligence', 'A', '08:30:AM-09:50:AM', 'Wed'),
(540, 'CSE 3811', 'Artificial Intelligence', 'B', '08:30:AM-09:50:AM', 'Sat'),
(541, 'CSE 3811', 'Artificial Intelligence', 'B', '08:30:AM-09:50:AM', 'Tue'),
(552, 'CSE 4000A', 'Final Year Design Project - 1', 'A', '11:11:AM-01:40:PM', 'Sat'),
(553, 'CSE 4000A', 'Final Year Design Project - 1', 'B', '11:11:AM-01:40:PM', 'Tue'),
(554, 'CSE 4000A', 'Final Year Design Project - 1', 'C', '11:11:AM-01:40:PM', 'Sat'),
(555, 'CSE 4000A', 'Final Year Design Project - 1', 'F', '08:30:AM-11:00:AM', 'Sun'),
(556, 'CSE 4000A', 'Final Year Design Project - 1', 'D', '11:11:AM-01:40:PM', 'Tue'),
(557, 'CSE 4000A', 'Final Year Design Project - 1', 'E', '11:11:AM-01:40:PM', 'Sun'),
(558, 'CSE 4000A', 'Final Year Design Project - I', 'G', '02:00:PM-04:30:PM', 'Sun'),
(559, 'CSE 4165', 'Web Programming', 'A', '02:00:PM-04:30:PM', 'Sun'),
(560, 'CSE 4165', 'Web Programming', 'C', '02:00:PM-04:30:PM', 'Wed'),
(561, 'CSE 4165', 'Web Programming', 'D', '11:11:AM-01:40:PM', 'Sun'),
(562, 'CSE 4165', 'Web Programming', 'E', '11:11:AM-01:40:PM', 'Wed'),
(563, 'CSE 4165', 'Web Programming', 'B', '02:00:PM-04:30:PM', 'Tue'),
(564, 'CSE 4181', 'Mobile Application Development', 'A', '08:30:AM-11:00:AM', 'Sat'),
(565, 'CSE 4325', 'Microprocessors and Microcontrollers', 'G', '08:30:AM-09:50:AM', 'Sun'),
(566, 'CSE 4325', 'Microprocessors and Microcontrollers', 'G', '12:31:PM-01:50:PM', 'Wed'),
(567, 'CSE 4325', 'Microprocessors and Microcontrollers', 'A', '11:11:AM-12:30:PM', 'Sat'),
(568, 'CSE 4325', 'Microprocessors and Microcontrollers', 'A', '11:11:AM-12:30:PM', 'Tue'),
(569, 'CSE 4325', 'Microprocessors and Microcontrollers', 'B', '08:30:AM-09:50:AM', 'Sun'),
(570, 'CSE 4325', 'Microprocessors and Microcontrollers', 'B', '08:30:AM-09:50:AM', 'Wed'),
(571, 'CSE 4325', 'Microprocessors and Microcontrollers', 'C', '12:31:PM-01:50:PM', 'Sat'),
(572, 'CSE 4325', 'Microprocessors and Microcontrollers', 'C', '12:31:PM-01:50:PM', 'Tue'),
(573, 'CSE 4325', 'Microprocessors and Microcontrollers', 'D', '09:51:AM-11:10:AM', 'Sat'),
(574, 'CSE 4325', 'Microprocessors and Microcontrollers', 'D', '09:51:AM-11:10:AM', 'Tue'),
(575, 'CSE 4325', 'Microprocessors and Microcontrollers', 'E', '01:51:PM-03:10:PM', 'Sat'),
(576, 'CSE 4325', 'Microprocessors and Microcontrollers', 'E', '01:51:PM-03:10:PM', 'Tue'),
(585, 'CSE 4435', 'Software Architecture', 'A', '08:30:AM-09:50:AM', 'Sun'),
(586, 'CSE 4435', 'Software Architecture', 'A', '08:30:AM-09:50:AM', 'Wed'),
(587, 'CSE 4435', 'Software Architecture', 'B', '09:51:AM-11:10:AM', 'Sun'),
(588, 'CSE 4435', 'Software Architecture', 'B', '09:51:AM-11:10:AM', 'Wed'),
(589, 'CSE 4451', 'Human Computer Interaction', 'A', '11:11:AM-12:30:PM', 'Sat'),
(590, 'CSE 4451', 'Human Computer Interaction', 'A', '11:11:AM-12:30:PM', 'Tue'),
(591, 'CSE 4451', 'Human Computer Interaction', 'B', '09:51:AM-11:10:AM', 'Sat'),
(592, 'CSE 4451', 'Human Computer Interaction', 'B', '09:51:AM-11:10:AM', 'Tue'),
(593, 'CSE 4485', 'Game Design and Development', 'A', '02:00:PM-04:30:PM', 'Sat'),
(594, 'CSE 4495', 'Software Testing and Quality Assurance', 'A', '11:11:AM-12:30:PM', 'Sun'),
(595, 'CSE 4495', 'Software Testing and Quality Assurance', 'A', '11:11:AM-12:30:PM', 'Wed'),
(596, 'CSE 4495', 'Software Testing and Quality Assurance', 'B', '11:11:AM-12:30:PM', 'Sat'),
(597, 'CSE 4495', 'Software Testing and Quality Assurance', 'B', '11:11:AM-12:30:PM', 'Tue'),
(598, 'CSE 4509', 'Operating Systems', 'A', '09:51:AM-11:10:AM', 'Sat'),
(599, 'CSE 4509', 'Operating Systems', 'A', '09:51:AM-11:10:AM', 'Tue'),
(600, 'CSE 4509', 'Operating Systems', 'B', '11:11:AM-12:30:PM', 'Sun'),
(601, 'CSE 4509', 'Operating Systems', 'B', '11:11:AM-12:30:PM', 'Wed'),
(602, 'CSE 4509', 'Operating Systems', 'C', '08:30:AM-09:50:AM', 'Sat'),
(603, 'CSE 4509', 'Operating Systems', 'C', '08:30:AM-09:50:AM', 'Tue'),
(604, 'CSE 4509', 'Operating Systems', 'D', '09:51:AM-11:10:AM', 'Sun'),
(605, 'CSE 4509', 'Operating Systems', 'D', '09:51:AM-11:10:AM', 'Wed'),
(606, 'CSE 4509', 'Operating Systems', 'E', '11:11:AM-12:30:PM', 'Sat'),
(607, 'CSE 4509', 'Operating Systems', 'E', '11:11:AM-12:30:PM', 'Tue'),
(608, 'CSE 4509', 'Operating Systems', 'F', '01:51:PM-03:10:PM', 'Sun'),
(609, 'CSE 4509', 'Operating Systems', 'F', '01:51:PM-03:10:PM', 'Wed'),
(610, 'CSE 4509', 'Operating Systems', 'G', '03:11:PM-04:30:PM', 'Sun'),
(611, 'CSE 4509', 'Operating Systems', 'G', '03:11:PM-04:30:PM', 'Wed'),
(619, 'CSE 4531', 'Computer Security', 'A', '09:51:AM-11:10:AM', 'Sun'),
(620, 'CSE 4531', 'Computer Security', 'A', '09:51:AM-11:10:AM', 'Wed'),
(621, 'CSE 4531', 'Computer Security', 'B', '08:30:AM-09:50:AM', 'Sun'),
(622, 'CSE 4531', 'Computer Security', 'B', '08:30:AM-09:50:AM', 'Wed'),
(623, 'CSE 4531', 'Computer Security', 'C', '09:51:AM-11:10:AM', 'Sun'),
(624, 'CSE 4531', 'Computer Security', 'C', '09:51:AM-11:10:AM', 'Wed'),
(625, 'CSE 4587', 'Cloud Computing', 'A', '02:00:PM-04:30:PM', 'Sun'),
(626, 'CSE 4611', 'Compiler Design', 'A', '08:30:AM-09:50:AM', 'Sat'),
(627, 'CSE 4611', 'Compiler Design', 'A', '08:30:AM-09:50:AM', 'Tue'),
(628, 'CSE 4777', 'Networks Security', 'A', '03:11:PM-04:30:PM', 'Sat'),
(629, 'CSE 4777', 'Networks Security', 'A', '03:11:PM-04:30:PM', 'Tue'),
(630, 'CSE 4783', 'Cryptography', 'A', '03:11:PM-04:30:PM', 'Sat'),
(631, 'CSE 4783', 'Cryptography', 'A', '03:11:PM-04:30:PM', 'Tue'),
(632, 'CSE 4883', 'Digital Image Processing', 'A', '11:11:AM-12:30:PM', 'Sat'),
(633, 'CSE 4883', 'Digital Image Processing', 'A', '11:11:AM-12:30:PM', 'Tue'),
(634, 'CSE 4883', 'Digital Image Processing', 'B', '11:11:AM-12:30:PM', 'Sun'),
(635, 'CSE 4883', 'Digital Image Processing', 'B', '11:11:AM-12:30:PM', 'Wed'),
(636, 'CSE 4883', 'Digital Image Processing', 'C', '11:11:AM-12:30:PM', 'Sat'),
(637, 'CSE 4883', 'Digital Image Processing', 'C', '11:11:AM-12:30:PM', 'Tue'),
(638, 'CSE 4889', 'Machine Learning', 'A', '09:51:AM-11:10:AM', 'Sat'),
(639, 'CSE 4889', 'Machine Learning', 'A', '09:51:AM-11:10:AM', 'Tue'),
(640, 'CSE 4889', 'Machine Learning', 'B', '09:51:AM-11:10:AM', 'Sun'),
(641, 'CSE 4889', 'Machine Learning', 'B', '09:51:AM-11:10:AM', 'Wed'),
(642, 'CSE 4889', 'Machine Learning', 'C', '09:51:AM-11:10:AM', 'Sun'),
(643, 'CSE 4889', 'Machine Learning', 'C', '09:51:AM-11:10:AM', 'Wed'),
(644, 'CSE 4891', 'Data Mining', 'A', '08:30:AM-09:50:AM', 'Sat'),
(645, 'CSE 4891', 'Data Mining', 'A', '08:30:AM-09:50:AM', 'Tue'),
(646, 'CSE 4893', 'Introduction to Bioinformatics', 'A', '11:11:AM-12:30:PM', 'Sat'),
(647, 'CSE 4893', 'Introduction to Bioinformatics', 'A', '11:11:AM-12:30:PM', 'Tue'),
(648, 'CSE 4945', 'UI: Concepts and Design', 'A', '02:00:PM-04:30:PM', 'Sun'),
(649, 'ECO 4101', 'Economics', 'A', '12:31:PM-01:50:PM', 'Sun'),
(650, 'ECO 4101', 'Economics', 'A', '12:31:PM-01:50:PM', 'Wed'),
(651, 'ECO 4101', 'Economics', 'B', '08:30:AM-09:50:AM', 'Sun'),
(652, 'ECO 4101', 'Economics', 'B', '08:30:AM-09:50:AM', 'Wed'),
(653, 'ECO 4101', 'Economics', 'C', '12:31:PM-01:50:PM', 'Sat'),
(654, 'ECO 4101', 'Economics', 'C', '12:31:PM-01:50:PM', 'Tue'),
(655, 'ECO 4101', 'Economics', 'D', '08:30:AM-09:50:AM', 'Sat'),
(656, 'ECO 4101', 'Economics', 'D', '08:30:AM-09:50:AM', 'Tue'),
(657, 'ECO 4101', 'Economics', 'E', '11:11:AM-12:30:PM', 'Sat'),
(658, 'ECO 4101', 'Economics', 'E', '11:11:AM-12:30:PM', 'Tue'),
(659, 'ECO 4101', 'Economics', 'F', '11:11:AM-12:30:PM', 'Sun'),
(660, 'ECO 4101', 'Economics', 'F', '11:11:AM-12:30:PM', 'Wed'),
(661, 'EEE 2113', 'Electrical Circuits', 'A', '08:30:AM-09:50:AM', 'Sun'),
(662, 'EEE 2113', 'Electrical Circuits', 'A', '08:30:AM-09:50:AM', 'Wed'),
(663, 'EEE 2113', 'Electrical Circuits', 'E', '11:11:AM-12:30:PM', 'Sat'),
(664, 'EEE 2113', 'Electrical Circuits', 'E', '11:11:AM-12:30:PM', 'Tue'),
(665, 'EEE 2113', 'Electrical Circuits', 'F', '12:31:PM-01:50:PM', 'Sat'),
(666, 'EEE 2113', 'Electrical Circuits', 'F', '12:31:PM-01:50:PM', 'Tue'),
(667, 'EEE 2113', 'Electrical Circuits', 'G', '01:51:PM-03:10:PM', 'Sat'),
(668, 'EEE 2113', 'Electrical Circuits', 'G', '01:51:PM-03:10:PM', 'Tue'),
(669, 'EEE 2113', 'Electrical Circuits', 'H', '11:11:AM-12:30:PM', 'Sun'),
(670, 'EEE 2113', 'Electrical Circuits', 'H', '11:11:AM-12:30:PM', 'Wed'),
(671, 'EEE 2113', 'Electrical Circuits', 'I', '12:31:PM-01:50:PM', 'Sat'),
(672, 'EEE 2113', 'Electrical Circuits', 'I', '12:31:PM-01:50:PM', 'Tue'),
(673, 'EEE 2113', 'Electrical Circuits', 'J', '12:31:PM-01:50:PM', 'Sun'),
(674, 'EEE 2113', 'Electrical Circuits', 'J', '12:31:PM-01:50:PM', 'Wed'),
(675, 'EEE 2113', 'Electrical Circuits', 'B', '08:30:AM-09:50:AM', 'Sat'),
(676, 'EEE 2113', 'Electrical Circuits', 'B', '08:30:AM-09:50:AM', 'Tue'),
(677, 'EEE 2113', 'Electrical Circuits', 'C', '09:51:AM-11:10:AM', 'Sat'),
(678, 'EEE 2113', 'Electrical Circuits', 'C', '09:51:AM-11:10:AM', 'Tue'),
(679, 'EEE 2113', 'Electrical Circuits', 'D', '09:51:AM-11:10:AM', 'Sun'),
(680, 'EEE 2113', 'Electrical Circuits', 'D', '09:51:AM-11:10:AM', 'Wed'),
(681, 'EEE 2113', 'Electrical Circuits', 'K', '01:51:PM-03:10:PM', 'Sat'),
(682, 'EEE 2113', 'Electrical Circuits', 'K', '01:51:PM-03:10:PM', 'Tue'),
(683, 'EEE 2113', 'Electrical Circuits', 'M', '01:51:PM-03:10:PM', 'Sun'),
(684, 'EEE 2113', 'Electrical Circuits', 'M', '01:51:PM-03:10:PM', 'Wed'),
(685, 'EEE 2113', 'Electrical Circuits', 'N', '03:11:PM-04:30:PM', 'Sun'),
(686, 'EEE 2113', 'Electrical Circuits', 'N', '03:11:PM-04:30:PM', 'Wed'),
(687, 'EEE 2123', 'Electronics', 'A', '09:51:AM-11:10:AM', 'Sat'),
(688, 'EEE 2123', 'Electronics', 'A', '09:51:AM-11:10:AM', 'Tue'),
(689, 'EEE 2123', 'Electronics', 'B', '08:30:AM-09:50:AM', 'Sun'),
(690, 'EEE 2123', 'Electronics', 'B', '08:30:AM-09:50:AM', 'Wed'),
(691, 'EEE 2123', 'Electronics', 'C', '09:51:AM-11:10:AM', 'Sat'),
(692, 'EEE 2123', 'Electronics', 'C', '09:51:AM-11:10:AM', 'Tue'),
(693, 'EEE 2123', 'Electronics', 'D', '11:11:AM-12:30:PM', 'Sun'),
(694, 'EEE 2123', 'Electronics', 'D', '11:11:AM-12:30:PM', 'Wed'),
(695, 'EEE 2123', 'Electronics', 'E', '12:31:PM-01:50:PM', 'Sat'),
(696, 'EEE 2123', 'Electronics', 'E', '12:31:PM-01:50:PM', 'Tue'),
(697, 'EEE 2123', 'Electronics', 'F', '03:11:PM-04:30:PM', 'Sun'),
(698, 'EEE 2123', 'Electronics', 'F', '03:11:PM-04:30:PM', 'Wed'),
(699, 'EEE 2123', 'Electronics', 'G', '01:51:PM-03:10:PM', 'Sun'),
(700, 'EEE 2123', 'Electronics', 'G', '01:51:PM-03:10:PM', 'Wed'),
(701, 'EEE 2123', 'Electronics', 'H', '01:51:PM-03:10:PM', 'Sat'),
(702, 'EEE 2123', 'Electronics', 'H', '01:51:PM-03:10:PM', 'Tue'),
(703, 'EEE 2123', 'Electronics', 'I', '08:30:AM-09:50:AM', 'Sat'),
(704, 'EEE 2123', 'Electronics', 'I', '08:30:AM-09:50:AM', 'Tue'),
(705, 'EEE 2123', 'Electronics', 'J', '08:30:AM-09:50:AM', 'Sun'),
(706, 'EEE 2123', 'Electronics', 'J', '08:30:AM-09:50:AM', 'Wed'),
(719, 'EEE 4261', 'Green Computing', 'D', '11:11:AM-12:30:PM', 'Sun'),
(720, 'EEE 4261', 'Green Computing', 'D', '11:11:AM-12:30:PM', 'Wed'),
(721, 'EEE 4261', 'Green Computing', 'A', '08:30:AM-09:50:AM', 'Sun'),
(722, 'EEE 4261', 'Green Computing', 'A', '08:30:AM-09:50:AM', 'Wed'),
(723, 'EEE 4261', 'Green Computing', 'B', '08:30:AM-09:50:AM', 'Sat'),
(724, 'EEE 4261', 'Green Computing', 'B', '08:30:AM-09:50:AM', 'Tue'),
(725, 'EEE 4261', 'Green Computing', 'C', '11:11:AM-12:30:PM', 'Sat'),
(726, 'EEE 4261', 'Green Computing', 'C', '11:11:AM-12:30:PM', 'Tue'),
(727, 'ENG 1011', 'English I', 'AA', '08:30:AM-09:50:AM', 'Sat'),
(728, 'ENG 1011', 'English I', 'AA', '08:30:AM-09:50:AM', 'Tue'),
(729, 'ENG 1011', 'English I', 'AB', '08:30:AM-09:50:AM', 'Sun'),
(730, 'ENG 1011', 'English I', 'AB', '08:30:AM-09:50:AM', 'Wed'),
(731, 'ENG 1011', 'English I', 'AC', '09:51:AM-11:10:AM', 'Sat'),
(732, 'ENG 1011', 'English I', 'AC', '09:51:AM-11:10:AM', 'Tue'),
(733, 'ENG 1011', 'English I', 'AD', '09:51:AM-11:10:AM', 'Sun'),
(734, 'ENG 1011', 'English I', 'AD', '09:51:AM-11:10:AM', 'Wed'),
(735, 'ENG 1011', 'English I', 'ΑΕ', '11:11:AM-12:30:PM', 'Sat'),
(736, 'ENG 1011', 'English I', 'ΑΕ', '11:11:AM-12:30:PM', 'Tue'),
(737, 'ENG 1011', 'English I', 'AF', '11:11:AM-12:30:PM', 'Sun'),
(738, 'ENG 1011', 'English I', 'AF', '11:11:AM-12:30:PM', 'Wed'),
(739, 'ENG 1011', 'English I', 'AG', '12:31:PM-01:50:PM', 'Sat'),
(740, 'ENG 1011', 'English I', 'AG', '12:31:PM-01:50:PM', 'Tue'),
(741, 'ENG 1011', 'English I', 'Al', '01:51:PM-03:10:PM', 'Sat'),
(742, 'ENG 1011', 'English I', 'Al', '01:51:PM-03:10:PM', 'Tue'),
(743, 'ENG 1011', 'English I', 'AJ', '01:51:PM-03:10:PM', 'Sun'),
(744, 'ENG 1011', 'English I', 'AJ', '01:51:PM-03:10:PM', 'Wed'),
(745, 'ENG 1011', 'English I', 'AK', '01:51:PM-03:10:PM', 'Sat'),
(746, 'ENG 1011', 'English I', 'AK', '01:51:PM-03:10:PM', 'Tue'),
(747, 'ENG 1011', 'English I', 'AL', '03:11:PM-04:30:PM', 'Sun'),
(748, 'ENG 1011', 'English I', 'AL', '03:11:PM-04:30:PM', 'Wed'),
(749, 'ENG 1011', 'English I', 'AH', '12:31:PM-01:50:PM', 'Sun'),
(750, 'ENG 1011', 'English I', 'AH', '12:31:PM-01:50:PM', 'Wed'),
(751, 'ENG 1011', 'English I', 'AO', '09:51:AM-11:10:AM', 'Sat'),
(752, 'ENG 1011', 'English I', 'AO', '09:51:AM-11:10:AM', 'Tue'),
(753, 'ENG 1011', 'English I', 'AN', '08:30:AM-09:50:AM', 'Sun'),
(754, 'ENG 1011', 'English I', 'AN', '08:30:AM-09:50:AM', 'Wed'),
(755, 'ENG 1011', 'English I', 'AM', '08:30:AM-09:50:AM', 'Sat'),
(756, 'ENG 1011', 'English I', 'AM', '08:30:AM-09:50:AM', 'Tue'),
(757, 'ENG 1013', 'English II', 'AA', '12:31:PM-01:50:PM', 'Sat'),
(758, 'ENG 1013', 'English II', 'AA', '12:31:PM-01:50:PM', 'Tue'),
(759, 'ENG 1013', 'English II', 'AB', '12:31:PM-01:50:PM', 'Sun'),
(760, 'ENG 1013', 'English II', 'AB', '12:31:PM-01:50:PM', 'Wed'),
(761, 'ENG 1013', 'English II', 'AO', '01:51:PM-03:10:PM', 'Sun'),
(762, 'ENG 1013', 'English II', 'AO', '01:51:PM-03:10:PM', 'Wed'),
(763, 'ENG 1013', 'English II', 'AL', '12:31:PM-01:50:PM', 'Sat'),
(764, 'ENG 1013', 'English II', 'AL', '12:31:PM-01:50:PM', 'Tue'),
(765, 'ENG 1013', 'English II', 'AM', '12:31:PM-01:50:PM', 'Sun'),
(766, 'ENG 1013', 'English II', 'AM', '12:31:PM-01:50:PM', 'Wed'),
(767, 'ENG 1013', 'English II', 'AN', '01:51:PM-03:10:PM', 'Sat'),
(768, 'ENG 1013', 'English II', 'AN', '01:51:PM-03:10:PM', 'Tue'),
(769, 'ENG 1013', 'English II', 'AH', '09:51:AM-11:10:AM', 'Sat'),
(770, 'ENG 1013', 'English II', 'AH', '09:51:AM-11:10:AM', 'Tue'),
(771, 'ENG 1013', 'English II', 'AI', '09:51:AM-11:10:AM', 'Sun'),
(772, 'ENG 1013', 'English II', 'AI', '09:51:AM-11:10:AM', 'Wed'),
(773, 'ENG 1013', 'English II', 'AJ', '11:11:AM-12:30:PM', 'Sat'),
(774, 'ENG 1013', 'English II', 'AJ', '11:11:AM-12:30:PM', 'Tue'),
(775, 'ENG 1013', 'English II', 'AK', '11:11:AM-12:30:PM', 'Sun'),
(776, 'ENG 1013', 'English II', 'AK', '11:11:AM-12:30:PM', 'Wed'),
(777, 'ENG 1013', 'English II', 'ΑΕ', '03:11:PM-04:30:PM', 'Sun'),
(778, 'ENG 1013', 'English II', 'ΑΕ', '03:11:PM-04:30:PM', 'Wed'),
(779, 'ENG 1013', 'English II', 'AF', '08:30:AM-09:50:AM', 'Sat'),
(780, 'ENG 1013', 'English II', 'AF', '08:30:AM-09:50:AM', 'Tue'),
(781, 'ENG 1013', 'English II', 'AG', '08:30:AM-09:50:AM', 'Sun'),
(782, 'ENG 1013', 'English II', 'AG', '08:30:AM-09:50:AM', 'Wed'),
(783, 'ENG 1013', 'English II', 'AC', '01:51:PM-03:10:PM', 'Sat'),
(784, 'ENG 1013', 'English II', 'AC', '01:51:PM-03:10:PM', 'Tue'),
(785, 'ENG 1013', 'English II', 'AD', '01:51:PM-03:10:PM', 'Sun'),
(786, 'ENG 1013', 'English II', 'AD', '01:51:PM-03:10:PM', 'Wed'),
(787, 'IPE 3401', 'Industrial and Operational Management', 'C', '11:11:AM-12:30:PM', 'Sun'),
(788, 'IPE 3401', 'Industrial and Operational Management', 'C', '11:11:AM-12:30:PM', 'Wed'),
(789, 'IPE 3401', 'Industrial and Operational Management', 'D', '09:51:AM-11:10:AM', 'Sat'),
(790, 'IPE 3401', 'Industrial and Operational Management', 'D', '09:51:AM-11:10:AM', 'Tue'),
(791, 'IPE 3401', 'Industrial and Operational Management', 'B', '12:31:PM-01:50:PM', 'Sun'),
(792, 'IPE 3401', 'Industrial and Operational Management', 'B', '12:31:PM-01:50:PM', 'Wed'),
(793, 'IPE 3401', 'Industrial and Operational Management', 'A', '01:51:PM-03:10:PM', 'Sat'),
(794, 'IPE 3401', 'Industrial and Operational Management', 'A', '01:51:PM-03:10:PM', 'Tue'),
(795, 'IPE 3401', 'Industrial and Operational Management', 'E', '08:30:AM-09:50:AM', 'Sun'),
(796, 'IPE 3401', 'Industrial and Operational Management', 'E', '08:30:AM-09:50:AM', 'Wed'),
(797, 'IPE 3401', 'Industrial and Operational Management', 'G', '08:30:AM-09:50:AM', 'Sat'),
(798, 'IPE 3401', 'Industrial and Operational Management', 'G', '08:30:AM-09:50:AM', 'Tue'),
(799, 'IPE 3401', 'Industrial and Operational Management', 'H', '11:11:AM-12:30:PM', 'Sat'),
(800, 'IPE 3401', 'Industrial and Operational Management', 'H', '11:11:AM-12:30:PM', 'Tue'),
(801, 'IPE 3401', 'Industrial and Operational Management', 'F', '03:11:PM-04:30:PM', 'Sun'),
(802, 'IPE 3401', 'Industrial and Operational Management', 'F', '03:11:PM-04:30:PM', 'Wed'),
(803, 'IPE 3401', 'Industrial and Operational Management', 'I', '09:51:AM-11:10:AM', 'Sun'),
(804, 'IPE 3401', 'Industrial and Operational Management', 'I', '09:51:AM-11:10:AM', 'Wed'),
(805, 'IPE 3401', 'Industrial and Operational Management', 'J', '01:51:PM-03:10:PM', 'Sun'),
(806, 'IPE 3401', 'Industrial and Operational Management', 'J', '01:51:PM-03:10:PM', 'Wed'),
(807, 'MATH 1151', 'Fundamental Calculus', 'A', '08:30:AM-09:50:AM', 'Sat'),
(808, 'MATH 1151', 'Fundamental Calculus', 'A', '08:30:AM-09:50:AM', 'Tue'),
(809, 'MATH 1151', 'Fundamental Calculus', 'B', '09:51:AM-11:10:AM', 'Sun'),
(810, 'MATH 1151', 'Fundamental Calculus', 'B', '09:51:AM-11:10:AM', 'Wed'),
(811, 'MATH 1151', 'Fundamental Calculus', 'C', '09:51:AM-11:10:AM', 'Sat'),
(812, 'MATH 1151', 'Fundamental Calculus', 'C', '09:51:AM-11:10:AM', 'Tue'),
(813, 'MATH 1151', 'Fundamental Calculus', 'D', '08:30:AM-09:50:AM', 'Sat'),
(814, 'MATH 1151', 'Fundamental Calculus', 'D', '08:30:AM-09:50:AM', 'Tue'),
(815, 'MATH 1151', 'Fundamental Calculus', 'E', '11:11:AM-12:30:PM', 'Sat'),
(816, 'MATH 1151', 'Fundamental Calculus', 'E', '11:11:AM-12:30:PM', 'Tue'),
(817, 'MATH 1151', 'Fundamental Calculus', 'F', '12:31:PM-01:50:PM', 'Sat'),
(818, 'MATH 1151', 'Fundamental Calculus', 'F', '12:31:PM-01:50:PM', 'Tue'),
(819, 'MATH 1151', 'Fundamental Calculus', 'G', '01:51:PM-03:10:PM', 'Sat'),
(820, 'MATH 1151', 'Fundamental Calculus', 'G', '01:51:PM-03:10:PM', 'Tue'),
(821, 'MATH 1151', 'Fundamental Calculus', 'H', '11:11:AM-12:30:PM', 'Sun'),
(822, 'MATH 1151', 'Fundamental Calculus', 'H', '11:11:AM-12:30:PM', 'Wed'),
(823, 'MATH 1151', 'Fundamental Calculus', 'I', '12:31:PM-01:50:PM', 'Sun'),
(824, 'MATH 1151', 'Fundamental Calculus', 'I', '12:31:PM-01:50:PM', 'Wed'),
(825, 'MATH 1151', 'Fundamental Calculus', 'J', '01:51:PM-03:10:PM', 'Sun'),
(826, 'MATH 1151', 'Fundamental Calculus', 'J', '01:51:PM-03:10:PM', 'Wed'),
(827, 'MATH 1151', 'Fundamental Calculus', 'K', '03:11:PM-04:30:PM', 'Sun'),
(828, 'MATH 1151', 'Fundamental Calculus', 'K', '03:11:PM-04:30:PM', 'Wed'),
(829, 'MATH 1151', 'Fundamental Calculus', 'L', '08:30:AM-09:50:AM', 'Sun'),
(830, 'MATH 1151', 'Fundamental Calculus', 'L', '08:30:AM-09:50:AM', 'Wed'),
(831, 'MATH 1151', 'Fundamental Calculus', 'N', '03:11:PM-04:30:PM', 'Sun'),
(832, 'MATH 1151', 'Fundamental Calculus', 'N', '03:11:PM-04:30:PM', 'Wed'),
(833, 'MATH 1151', 'Fundamental Calculus', 'O', '01:51:PM-03:10:PM', 'Sat'),
(834, 'MATH 1151', 'Fundamental Calculus', 'O', '01:51:PM-03:10:PM', 'Tue'),
(835, 'MATH 1151', 'Fundamental Calculus', 'P', '11:11:AM-12:30:PM', 'Sat'),
(836, 'MATH 1151', 'Fundamental Calculus', 'P', '11:11:AM-12:30:PM', 'Tue'),
(837, 'MATH 1151', 'Fundamental Calculus', 'Q', '08:30:AM-09:50:AM', 'Sun'),
(838, 'MATH 1151', 'Fundamental Calculus', 'Q', '08:30:AM-09:50:AM', 'Wed'),
(839, 'MATH 1151', 'Fundamental Calculus', 'R', '01:51:PM-03:10:PM', 'Sat'),
(840, 'MATH 1151', 'Fundamental Calculus', 'R', '01:51:PM-03:10:PM', 'Tue'),
(841, 'MATH 1151', 'Fundamental Calculus', 'S', '03:11:PM-04:30:PM', 'Sun'),
(842, 'MATH 1151', 'Fundamental Calculus', 'S', '03:11:PM-04:30:PM', 'Wed'),
(843, 'MATH 1151', 'Fundamental Calculus', 'T', '01:51:PM-03:10:PM', 'Sun'),
(844, 'MATH 1151', 'Fundamental Calculus', 'T', '01:51:PM-03:10:PM', 'Wed');
INSERT INTO `upcoming_courses` (`id`, `course_code`, `course_title`, `section`, `time`, `day`) VALUES
(845, 'MATH 2183', 'Calculus and Linear Algebra', 'A', '08:30:AM-09:50:AM', 'Sat'),
(846, 'MATH 2183', 'Calculus and Linear Algebra', 'A', '08:30:AM-09:50:AM', 'Tue'),
(847, 'MATH 2183', 'Calculus and Linear Algebra', 'B', '08:30:AM-09:50:AM', 'Sun'),
(848, 'MATH 2183', 'Calculus and Linear Algebra', 'B', '08:30:AM-09:50:AM', 'Wed'),
(849, 'MATH 2183', 'Calculus and Linear Algebra', 'C', '09:51:AM-11:10:AM', 'Sun'),
(850, 'MATH 2183', 'Calculus and Linear Algebra', 'C', '09:51:AM-11:10:AM', 'Wed'),
(851, 'MATH 2183', 'Calculus and Linear Algebra', 'D', '09:51:AM-11:10:AM', 'Sat'),
(852, 'MATH 2183', 'Calculus and Linear Algebra', 'D', '09:51:AM-11:10:AM', 'Tue'),
(853, 'MATH 2183', 'Calculus and Linear Algebra', 'E', '11:11:AM-12:30:PM', 'Sun'),
(854, 'MATH 2183', 'Calculus and Linear Algebra', 'E', '11:11:AM-12:30:PM', 'Wed'),
(855, 'MATH 2183', 'Calculus and Linear Algebra', 'F', '12:31:PM-01:50:PM', 'Sun'),
(856, 'MATH 2183', 'Calculus and Linear Algebra', 'F', '12:31:PM-01:50:PM', 'Wed'),
(857, 'MATH 2183', 'Calculus and Linear Algebra', 'G', '11:11:AM-12:30:PM', 'Sat'),
(858, 'MATH 2183', 'Calculus and Linear Algebra', 'G', '11:11:AM-12:30:PM', 'Tue'),
(859, 'MATH 2183', 'Calculus and Linear Algebra', 'H', '03:11:PM-04:30:PM', 'Sun'),
(860, 'MATH 2183', 'Calculus and Linear Algebra', 'H', '03:11:PM-04:30:PM', 'Wed'),
(861, 'MATH 2183', 'Calculus and Linear Algebra', 'I', '12:31:PM-01:50:PM', 'Sat'),
(862, 'MATH 2183', 'Calculus and Linear Algebra', 'I', '12:31:PM-01:50:PM', 'Tue'),
(863, 'MATH 2183', 'Calculus and Linear Algebra', 'J', '03:11:PM-04:30:PM', 'Sun'),
(864, 'MATH 2183', 'Calculus and Linear Algebra', 'J', '03:11:PM-04:30:PM', 'Wed'),
(865, 'MATH 2183', 'Calculus and Linear Algebra', 'K', '08:30:AM-09:50:AM', 'Sat'),
(866, 'MATH 2183', 'Calculus and Linear Algebra', 'K', '08:30:AM-09:50:AM', 'Tue'),
(867, 'MATH 2183', 'Calculus and Linear Algebra', 'L', '08:30:AM-09:50:AM', 'Sun'),
(868, 'MATH 2183', 'Calculus and Linear Algebra', 'L', '08:30:AM-09:50:AM', 'Wed'),
(869, 'MATH 2183', 'Calculus and Linear Algebra', 'M', '08:30:AM-09:50:AM', 'Sun'),
(870, 'MATH 2183', 'Calculus and Linear Algebra', 'M', '08:30:AM-09:50:AM', 'Wed'),
(871, 'MATH 2183', 'Calculus and Linear Algebra', 'N', '01:51:PM-03:10:PM', 'Sat'),
(872, 'MATH 2183', 'Calculus and Linear Algebra', 'N', '01:51:PM-03:10:PM', 'Tue'),
(873, 'MATH 2183', 'Calculus and Linear Algebra', 'O', '09:51:AM-11:10:AM', 'Sun'),
(874, 'MATH 2183', 'Calculus and Linear Algebra', 'O', '09:51:AM-11:10:AM', 'Wed'),
(875, 'MATH 2183', 'Calculus and Linear Algebra', 'P', '01:51:PM-03:10:PM', 'Sun'),
(876, 'MATH 2183', 'Calculus and Linear Algebra', 'P', '01:51:PM-03:10:PM', 'Wed'),
(877, 'MATH 2183', 'Calculus and Linear Algebra', 'Q', '01:51:PM-03:10:PM', 'Sun'),
(878, 'MATH 2183', 'Calculus and Linear Algebra', 'Q', '01:51:PM-03:10:PM', 'Wed'),
(879, 'MATH 2183', 'Calculus and Linear Algebra', 'R', '03:11:PM-04:30:PM', 'Sun'),
(880, 'MATH 2183', 'Calculus and Linear Algebra', 'R', '03:11:PM-04:30:PM', 'Wed'),
(881, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'A', '08:30:AM-09:50:AM', 'Sat'),
(882, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'A', '08:30:AM-09:50:AM', 'Tue'),
(883, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'B', '08:30:AM-09:50:AM', 'Sun'),
(884, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'B', '08:30:AM-09:50:AM', 'Wed'),
(885, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'C', '09:51:AM-11:10:AM', 'Sun'),
(886, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'C', '09:51:AM-11:10:AM', 'Wed'),
(887, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'D', '09:51:AM-11:10:AM', 'Sat'),
(888, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'D', '09:51:AM-11:10:AM', 'Tue'),
(889, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'E', '11:11:AM-12:30:PM', 'Sun'),
(890, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'E', '11:11:AM-12:30:PM', 'Wed'),
(891, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'F', '12:31:PM-01:50:PM', 'Sun'),
(892, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'F', '12:31:PM-01:50:PM', 'Wed'),
(893, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'G', '11:11:AM-12:30:PM', 'Sun'),
(894, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'G', '11:11:AM-12:30:PM', 'Wed'),
(895, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'H', '03:11:PM-04:30:PM', 'Sun'),
(896, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'H', '03:11:PM-04:30:PM', 'Wed'),
(897, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'I', '12:31:PM-01:50:PM', 'Sun'),
(898, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'I', '12:31:PM-01:50:PM', 'Wed'),
(899, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'J', '03:11:PM-04:30:PM', 'Sun'),
(900, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'J', '03:11:PM-04:30:PM', 'Wed'),
(901, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'K', '01:51:PM-03:10:PM', 'Sun'),
(902, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'K', '01:51:PM-03:10:PM', 'Wed'),
(903, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'L', '03:11:PM-04:30:PM', 'Sun'),
(904, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'L', '03:11:PM-04:30:PM', 'Wed'),
(905, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'M', '01:51:PM-03:10:PM', 'Sat'),
(906, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'M', '01:51:PM-03:10:PM', 'Tue'),
(907, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'N', '12:31:PM-01:50:PM', 'Sat'),
(908, 'MATH 2201', 'Coordinate Geometry and Vector Analysis', 'N', '12:31:PM-01:50:PM', 'Tue'),
(909, 'MATH 2205', 'Probability and Statistics', 'A', '08:30:AM-09:50:AM', 'Sat'),
(910, 'MATH 2205', 'Probability and Statistics', 'A', '08:30:AM-09:50:AM', 'Tue'),
(911, 'MATH 2205', 'Probability and Statistics', 'B', '08:30:AM-09:50:AM', 'Sun'),
(912, 'MATH 2205', 'Probability and Statistics', 'B', '08:30:AM-09:50:AM', 'Wed'),
(913, 'MATH 2205', 'Probability and Statistics', 'C', '09:51:AM-11:10:AM', 'Sat'),
(914, 'MATH 2205', 'Probability and Statistics', 'C', '09:51:AM-11:10:AM', 'Tue'),
(915, 'MATH 2205', 'Probability and Statistics', 'D', '01:51:PM-03:10:PM', 'Sat'),
(916, 'MATH 2205', 'Probability and Statistics', 'D', '01:51:PM-03:10:PM', 'Tue'),
(917, 'MATH 2205', 'Probability and Statistics', 'E', '09:51:AM-11:10:AM', 'Sat'),
(918, 'MATH 2205', 'Probability and Statistics', 'E', '09:51:AM-11:10:AM', 'Tue'),
(919, 'MATH 2205', 'Probability and Statistics', 'F', '01:51:PM-03:10:PM', 'Sat'),
(920, 'MATH 2205', 'Probability and Statistics', 'F', '01:51:PM-03:10:PM', 'Tue'),
(921, 'MATH 2205', 'Probability and Statistics', 'G', '01:51:PM-03:10:PM', 'Sun'),
(922, 'MATH 2205', 'Probability and Statistics', 'G', '01:51:PM-03:10:PM', 'Wed'),
(923, 'MATH 2205', 'Probability and Statistics', 'H', '03:11:PM-04:30:PM', 'Sun'),
(924, 'MATH 2205', 'Probability and Statistics', 'H', '03:11:PM-04:30:PM', 'Wed'),
(925, 'MATH 2205', 'Probability and Statistics', 'I', '08:30:AM-09:50:AM', 'Sun'),
(926, 'MATH 2205', 'Probability and Statistics', 'I', '08:30:AM-09:50:AM', 'Wed'),
(927, 'MATH 2205', 'Probability and Statistics', 'J', '01:51:PM-03:10:PM', 'Sat'),
(928, 'MATH 2205', 'Probability and Statistics', 'J', '01:51:PM-03:10:PM', 'Tue'),
(929, 'MATH 2205', 'Probability and Statistics', 'L', '09:51:AM-11:10:AM', 'Sun'),
(930, 'MATH 2205', 'Probability and Statistics', 'L', '09:51:AM-11:10:AM', 'Wed'),
(931, 'MATH 2205', 'Probability and Statistics', 'M', '09:51:AM-11:10:AM', 'Sun'),
(932, 'MATH 2205', 'Probability and Statistics', 'M', '09:51:AM-11:10:AM', 'Wed'),
(933, 'MATH 2205', 'Probability and Statistics', 'N', '01:51:PM-03:10:PM', 'Sat'),
(934, 'MATH 2205', 'Probability and Statistics', 'N', '01:51:PM-03:10:PM', 'Tue'),
(935, 'MATH 2205', 'Probability and Statistics', 'O', '03:11:PM-04:30:PM', 'Sun'),
(936, 'MATH 2205', 'Probability and Statistics', 'O', '03:11:PM-04:30:PM', 'Wed'),
(937, 'MATH 2205', 'Probability and Statistics', 'Q', '01:51:PM-03:10:PM', 'Sun'),
(938, 'MATH 2205', 'Probability and Statistics', 'Q', '01:51:PM-03:10:PM', 'Wed'),
(939, 'PHY 2105', 'Physics', 'A', '09:51:AM-11:10:AM', 'Sat'),
(940, 'PHY 2105', 'Physics', 'A', '09:51:AM-11:10:AM', 'Tue'),
(941, 'PHY 2105', 'Physics', 'B', '09:51:AM-11:10:AM', 'Sun'),
(942, 'PHY 2105', 'Physics', 'B', '09:51:AM-11:10:AM', 'Wed'),
(943, 'PHY 2105', 'Physics', 'C', '09:51:AM-11:10:AM', 'Sun'),
(944, 'PHY 2105', 'Physics', 'C', '09:51:AM-11:10:AM', 'Wed'),
(945, 'PHY 2105', 'Physics', 'D', '08:30:AM-09:50:AM', 'Sat'),
(946, 'PHY 2105', 'Physics', 'D', '08:30:AM-09:50:AM', 'Tue'),
(947, 'PHY 2105', 'Physics', 'E', '08:30:AM-09:50:AM', 'Sun'),
(948, 'PHY 2105', 'Physics', 'E', '08:30:AM-09:50:AM', 'Wed'),
(949, 'PHY 2105', 'Physics', 'F', '11:11:AM-12:30:PM', 'Sun'),
(950, 'PHY 2105', 'Physics', 'F', '11:11:AM-12:30:PM', 'Wed'),
(951, 'PHY 2105', 'Physics', 'G', '12:31:PM-01:50:PM', 'Sun'),
(952, 'PHY 2105', 'Physics', 'G', '12:31:PM-01:50:PM', 'Wed'),
(953, 'PHY 2105', 'Physics', 'H', '11:11:AM-12:30:PM', 'Sat'),
(954, 'PHY 2105', 'Physics', 'H', '11:11:AM-12:30:PM', 'Tue'),
(955, 'PHY 2105', 'Physics', 'I', '12:31:PM-01:50:PM', 'Sun'),
(956, 'PHY 2105', 'Physics', 'I', '12:31:PM-01:50:PM', 'Wed'),
(957, 'PHY 2105', 'Physics', 'J', '12:31:PM-01:50:PM', 'Sun'),
(958, 'PHY 2105', 'Physics', 'J', '12:31:PM-01:50:PM', 'Wed'),
(959, 'PHY 2105', 'Physics', 'K', '12:31:PM-01:50:PM', 'Sun'),
(960, 'PHY 2105', 'Physics', 'K', '12:31:PM-01:50:PM', 'Wed'),
(961, 'PHY 2105', 'Physics', 'L', '09:51:AM-11:10:AM', 'Sun'),
(962, 'PHY 2105', 'Physics', 'L', '09:51:AM-11:10:AM', 'Wed'),
(963, 'PHY 2105', 'Physics', 'M', '12:31:PM-01:50:PM', 'Sat'),
(964, 'PHY 2105', 'Physics', 'M', '12:31:PM-01:50:PM', 'Tue'),
(965, 'PHY 2105', 'Physics', 'N', '12:31:PM-01:50:PM', 'Sat'),
(966, 'PHY 2105', 'Physics', 'N', '12:31:PM-01:50:PM', 'Tue'),
(967, 'PHY 2105', 'Physics', 'O', '01:51:PM-03:10:PM', 'Sun'),
(968, 'PHY 2105', 'Physics', 'O', '01:51:PM-03:10:PM', 'Wed'),
(969, 'PHY 2105', 'Physics', 'P', '03:11:PM-04:30:PM', 'Sun'),
(970, 'PHY 2105', 'Physics', 'P', '03:11:PM-04:30:PM', 'Wed'),
(971, 'PHY 2105', 'Physics', 'Q', '01:51:PM-03:10:PM', 'Sat'),
(972, 'PHY 2105', 'Physics', 'Q', '01:51:PM-03:10:PM', 'Tue'),
(973, 'PHY 2105', 'Physics', 'R', '09:51:AM-11:10:AM', 'Sat'),
(974, 'PHY 2105', 'Physics', 'R', '09:51:AM-11:10:AM', 'Tue'),
(975, 'PHY 2105', 'Physics', 'S', '01:51:PM-03:10:PM', 'Sat'),
(976, 'PHY 2105', 'Physics', 'S', '01:51:PM-03:10:PM', 'Tue'),
(977, 'PHY 2105', 'Physics', 'T', '03:11:PM-04:30:PM', 'Sun'),
(978, 'PHY 2105', 'Physics', 'T', '03:11:PM-04:30:PM', 'Wed'),
(998, 'PMG 4101', 'Project Management', 'A', '11:11:AM-12:30:PM', 'Sat'),
(999, 'PMG 4101', 'Project Management', 'A', '11:11:AM-12:30:PM', 'Tue'),
(1000, 'PMG 4101', 'Project Management', 'B', '08:30:AM-09:50:AM', 'Sat'),
(1001, 'PMG 4101', 'Project Management', 'B', '08:30:AM-09:50:AM', 'Tue'),
(1002, 'PMG 4101', 'Project Management', 'C', '12:31:PM-01:50:PM', 'Sun'),
(1003, 'PMG 4101', 'Project Management', 'C', '12:31:PM-01:50:PM', 'Wed'),
(1004, 'PMG 4101', 'Project Management', 'D', '12:31:PM-01:50:PM', 'Sat'),
(1005, 'PMG 4101', 'Project Management', 'D', '12:31:PM-01:50:PM', 'Tue'),
(1006, 'PSY 2101', 'Psychology', 'A', '03:11:PM-04:30:PM', 'Sun'),
(1007, 'PSY 2101', 'Psychology', 'A', '03:11:PM-04:30:PM', 'Wed'),
(1008, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'A', '08:30:AM-09:50:AM', 'Sat'),
(1009, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'A', '08:30:AM-09:50:AM', 'Tue'),
(1010, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'B', '08:30:AM-09:50:AM', 'Sun'),
(1011, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'B', '08:30:AM-09:50:AM', 'Wed'),
(1012, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'C', '09:51:AM-11:10:AM', 'Sat'),
(1013, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'C', '09:51:AM-11:10:AM', 'Tue'),
(1014, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'D', '09:51:AM-11:10:AM', 'Sun'),
(1015, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'D', '09:51:AM-11:10:AM', 'Wed'),
(1016, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'G', '12:31:PM-01:50:PM', 'Sat'),
(1017, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'G', '12:31:PM-01:50:PM', 'Tue'),
(1018, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'H', '12:31:PM-01:50:PM', 'Sun'),
(1019, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'H', '12:31:PM-01:50:PM', 'Wed'),
(1020, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'I', '01:51:PM-03:10:PM', 'Sat'),
(1021, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'I', '01:51:PM-03:10:PM', 'Tue'),
(1022, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'J', '01:51:PM-03:10:PM', 'Sun'),
(1023, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'J', '01:51:PM-03:10:PM', 'Wed'),
(1024, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'K', '03:11:PM-04:30:PM', 'Sun'),
(1025, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'K', '03:11:PM-04:30:PM', 'Wed'),
(1026, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'E', '11:11:AM-12:30:PM', 'Sat'),
(1027, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'E', '11:11:AM-12:30:PM', 'Tue'),
(1028, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'F', '11:11:AM-12:30:PM', 'Sun'),
(1029, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'F', '11:11:AM-12:30:PM', 'Wed'),
(1030, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'L', '09:51:AM-11:10:AM', 'Sun'),
(1031, 'SOC 2101', 'Society, Environment and Engineering Ethics', 'L', '09:51:AM-11:10:AM', 'Wed'),
(1032, 'BIO 3107', 'Biology', 'BA', '11:11:AM-12:30:PM', 'Sun'),
(1033, 'BIO 3107', 'Biology', 'BA', '11:11:AM-12:30:PM', 'Wed'),
(1034, 'CSE 2213', 'Discrete Mathematics', 'BA (New)', '08:30:AM-09:50:AM', 'Sun'),
(1035, 'CSE 2213', 'Discrete Mathematics', 'BA (New)', '08:30:AM-09:50:AM', 'Wed'),
(1036, 'CSE 2215', 'Data Structure and Algorithms I', 'BA', '11:11:AM-12:30:PM', 'Sun'),
(1037, 'CSE 2215', 'Data Structure and Algorithms I', 'BA', '11:11:AM-12:30:PM', 'Wed'),
(1038, 'CSE 2215', 'Data Structure and Algorithms I', 'BB', '11:11:AM-12:30:PM', 'Sat'),
(1039, 'CSE 2215', 'Data Structure and Algorithms I', 'BB', '11:11:AM-12:30:PM', 'Tue'),
(1042, 'CSE 2217', 'Data Structure and Algorithms II', 'BA', '11:11:AM-12:30:PM', 'Sat'),
(1043, 'CSE 2217', 'Data Structure and Algorithms II', 'BA', '11:11:AM-12:30:PM', 'Tue'),
(1044, 'CSE 2217', 'Data Structure and Algorithms II', 'BB', '11:11:AM-12:30:PM', 'Sun'),
(1045, 'CSE 2217', 'Data Structure and Algorithms II', 'BB', '11:11:AM-12:30:PM', 'Wed'),
(1049, 'DS 1101', 'Fundamentals of Data Science', 'BA', '11:11:AM-12:30:PM', 'Sat'),
(1050, 'DS 1101', 'Fundamentals of Data Science', 'BA', '11:11:AM-12:30:PM', 'Tue'),
(1051, 'DS 1115', 'Object Oriented Programming for Data Science', 'BA', '11:11:AM-12:30:PM', 'Sat'),
(1052, 'DS 1115', 'Object Oriented Programming for Data Science', 'BA', '11:11:AM-12:30:PM', 'Tue'),
(1053, 'DS 1115', 'Object Oriented Programming for Data Science', 'BB', '11:11:AM-12:30:PM', 'Sun'),
(1054, 'DS 1115', 'Object Oriented Programming for Data Science', 'BB', '11:11:AM-12:30:PM', 'Wed'),
(1055, 'DS 1115', 'Object Oriented Programming for Data Science', 'BC', '11:11:AM-12:30:PM', 'Sat'),
(1056, 'DS 1115', 'Object Oriented Programming for Data Science', 'BC', '11:11:AM-12:30:PM', 'Tue'),
(1057, 'DS 1115', 'Object Oriented Programming for Data Science', 'BD', '11:11:AM-12:30:PM', 'Sun'),
(1058, 'DS 1115', 'Object Oriented Programming for Data Science', 'BD', '11:11:AM-12:30:PM', 'Wed'),
(1059, 'DS 1116', 'Object Oriented Programming for Data Science La', 'BA', '08:30:AM-11:10:AM', 'Sat'),
(1060, 'DS 1116', 'Object Oriented Programming for Data Science La', 'BB', '08:30:AM-11:00:AM', 'Sun'),
(1061, 'DS 1116', 'Object Oriented Programming for Data Science La', 'BC', '08:30:AM-11:00:AM', 'Sun'),
(1062, 'DS 1116', 'Object Oriented Programming for Data Science La', 'BD', '08:30:AM-11:00:AM', 'Mon'),
(1063, 'DS 1116', 'Object Oriented Programming for Data Science La', 'BE', '08:30:AM-11:00:AM', 'Tue'),
(1064, 'DS 1501', 'Programming for Data Science', 'BA', '11:11:AM-12:30:PM', 'Sun'),
(1065, 'DS 1501', 'Programming for Data Science', 'BA', '11:11:AM-12:30:PM', 'Wed'),
(1066, 'DS 1501', 'Programming for Data Science', 'BB', '11:11:AM-12:30:PM', 'Sat'),
(1067, 'DS 1501', 'Programming for Data Science', 'BB', '11:11:AM-12:30:PM', 'Tue'),
(1071, 'DS 3885', 'Data Wrangling', 'BA', '08:30:AM-09:50:AM', 'Sun'),
(1072, 'DS 3885', 'Data Wrangling', 'BA', '08:30:AM-09:50:AM', 'Wed'),
(1073, 'DS 3885', 'Data Wrangling', 'BB', '08:30:AM-09:50:AM', 'Sat'),
(1074, 'DS 3885', 'Data Wrangling', 'BB', '08:30:AM-09:50:AM', 'Tue'),
(1075, 'MATH 1153', 'Advanced Calculus', 'BA', '11:11:AM-12:30:PM', 'Sun'),
(1076, 'MATH 1153', 'Advanced Calculus', 'BA', '11:11:AM-12:30:PM', 'Wed'),
(1077, 'MATH 1153', 'Advanced Calculus', 'BB', '09:51:AM-11:10:AM', 'Sat'),
(1078, 'MATH 1153', 'Advanced Calculus', 'BB', '09:51:AM-11:10:AM', 'Tue'),
(1079, 'MATH 2107', 'Linear Algebra', 'BA', '12:31:PM-01:50:PM', 'Sun'),
(1080, 'MATH 2107', 'Linear Algebra', 'BA', '12:31:PM-01:50:PM', 'Wed'),
(1081, 'MATH 2209', 'Probability and Statistics', 'BA', '08:30:AM-09:50:AM', 'Sat'),
(1082, 'MATH 2209', 'Probability and Statistics', 'BA', '08:30:AM-09:50:AM', 'Tue'),
(1083, 'MATH 2205', 'Probability and Statistics', 'BB', '01:51:PM-03:10:PM', 'Sat'),
(1084, 'MATH 2205', 'Probability and Statistics', 'BB', '01:51:PM-03:10:PM', 'Tue');

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
(11, 'autumnsimp', 'emad200105@gmail.com', 'a8fa0b55df1ff8ba3c086dbcfc305d4a', 'student', 'Hasnat Emad'),
(12, 'KK', 'a@gmail.com', 'a8fa0b55df1ff8ba3c086dbcfc305d4a', 'student', 'Md. Abu Hasnat');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `study_materials`
--
ALTER TABLE `study_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upcoming_courses`
--
ALTER TABLE `upcoming_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1085;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
