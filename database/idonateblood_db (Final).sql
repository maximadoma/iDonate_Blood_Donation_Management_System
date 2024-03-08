-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 04:07 AM
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
-- Database: `idonateblood_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_inventory`
--

CREATE TABLE `blood_inventory` (
  `id` int(30) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = in -stock,2=out',
  `donor_id` int(30) NOT NULL,
  `request_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_inventory`
--

INSERT INTO `blood_inventory` (`id`, `blood_type`, `quantity`, `status`, `donor_id`, `request_id`, `date_created`) VALUES
(1, 'AB-', 1, 1, 19, 0, '2024-03-02 00:00:00'),
(2, 'AB-', 1, 1, 4, 0, '2024-03-02 00:00:00'),
(3, 'AB-', 1, 1, 17, 0, '2024-03-02 00:00:00'),
(4, 'AB-', 1, 2, 0, 1, '2024-03-02 19:08:15'),
(5, 'O+', 1, 1, 16, 0, '2024-03-01 00:00:00'),
(6, 'AB+', 1, 1, 14, 0, '2024-03-01 00:00:00'),
(7, 'O-', 1, 1, 11, 0, '2024-03-02 00:00:00'),
(8, 'O+', 1, 1, 8, 0, '2024-03-01 00:00:00'),
(9, 'B+', 1, 1, 13, 0, '2024-02-29 00:00:00'),
(10, 'B+', 1, 1, 5, 0, '2024-03-02 00:00:00'),
(11, 'A+', 1, 1, 10, 0, '2024-03-02 00:00:00'),
(12, 'AB+', 1, 1, 2, 0, '2024-03-02 00:00:00'),
(13, 'B+', 1, 1, 12, 0, '2024-03-02 00:00:00'),
(14, 'B+', 1, 1, 9, 0, '2024-01-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `id` int(30) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `name` text NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birth_date` date NOT NULL DEFAULT current_timestamp(),
  `address` text NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`id`, `blood_type`, `name`, `gender`, `birth_date`, `address`, `contact`, `email`, `date_created`) VALUES
(1, 'A-', 'Cristian Jay Pesongco', 'Male', '0000-00-00', 'Hagonoy, Davao del Sur', '09345670987', 'cristianpesongco@email.com', '2024-03-02 14:12:44'),
(2, 'AB+', 'Mariano Ongkas III', 'Male', '2002-04-19', 'Rizal Avenue, Digos City', '78979654654', 'marianoongkas@email.com', '2024-03-02 17:19:49'),
(3, 'O+', 'Renz Ivan S. Polancos', 'Male', '2000-03-16', 'Digos City', '90761290865', 'ivanpolancos@email.com', '2024-03-02 18:10:52'),
(4, 'AB-', 'John Ghlen Dealdo', 'Male', '2002-04-27', 'Hagonoy, Davao del Sur', '09345679812', 'ghlenjohn@email.com', '2024-03-02 18:11:27'),
(5, 'B+', 'Juana Mae Bausing', 'Female', '2003-01-21', 'Digos City, Davao del Sur', '09881240989', 'juannabausing@email.com', '2024-03-02 18:11:53'),
(6, 'AB+', 'Rovic Constantino', 'Female', '2002-11-13', 'Davao City, Davao del Sur', '09122349867', 'rovicconstantino@email.com', '2024-03-02 18:12:27'),
(7, 'O-', 'Edsel Payan', 'Male', '2004-06-15', 'Digos City', '09674437781', 'edselpayan@email.com', '2024-03-02 18:13:02'),
(8, 'O+', 'Christine Agravante', 'Female', '2003-02-11', 'Padada, Davao del Sur', '09875641289', 'christine098@email.com', '2024-03-02 18:13:55'),
(9, 'B+', 'Francis John Jinayon', 'Male', '2002-08-09', 'Digos City', '09675421789', 'francisjohn@email.com', '2024-03-02 18:15:33'),
(10, 'A+', 'Fritzie Apple Leonida', 'Male', '2000-05-20', 'Davao City, Davao del Sur', '0934217866', 'appleleonida@email.com', '2024-03-02 18:16:01'),
(11, 'O-', 'Gene Ryan Depalubos', 'Male', '2003-09-19', 'Digos City', '09897675521', 'generyan@email.com', '2024-03-02 18:17:07'),
(12, 'B+', 'Vincent Ace Rivera', 'Male', '2004-09-09', 'Digos City', '09876542312', 'vincentace@email.com', '2024-03-02 18:17:41'),
(13, 'B+', 'Fernyl Jean Maningo', 'Female', '2003-08-21', 'Digos City', '09651234598', 'fernylmaningo@email.com', '2024-03-02 18:18:06'),
(14, 'AB+', 'Asnari Pacalna', 'Male', '2003-05-12', 'Digos City', '09871128736', 'asnaripacalna@email.com', '2024-03-02 18:18:50'),
(15, 'A-', 'Allan Corpuz Jr.', 'Male', '2002-11-20', 'Rizal Avenue, Digos City, Davao del Sur', '09468791646', 'allancorpuz@email.com', '2024-03-02 18:19:22'),
(16, 'O+', 'Arjay Escabas', 'Male', '2003-10-20', 'Digos City', '09871245672', 'arjayescabas@email.com', '2024-03-02 18:20:11'),
(17, 'AB-', 'Khiane Aquino', 'Male', '2002-09-13', 'Padada, Davao del Sur', '09876542312', 'khiane@email.com', '2024-03-02 18:20:38'),
(18, 'AB+', 'Roderick Tajos', 'Male', '2003-05-12', 'Digos City', '09865412345', 'tajosroderick@email.com', '2024-03-02 18:21:17'),
(19, 'AB-', 'Aliazer Solaiman', 'Male', '2003-01-24', 'Digos City', '09098712365', 'aliazer@email.com', '2024-03-02 18:26:49'),
(20, 'B+', 'Rogene Carl Rosalijos', 'Male', '2003-11-29', 'Digos City', '09786512387', 'bajigrosalijos@email.com', '2024-03-02 18:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `handedover_request`
--

CREATE TABLE `handedover_request` (
  `id` int(30) NOT NULL,
  `request_id` int(30) NOT NULL,
  `picked_up_by` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handedover_request`
--

INSERT INTO `handedover_request` (`id`, `request_id`, `picked_up_by`, `date_created`) VALUES
(1, 1, 'Lorriane Morales', '2024-03-02 19:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(20) NOT NULL,
  `requester_name` text NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `physician_name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= pending,1= approved',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `ref_code`, `requester_name`, `blood_type`, `quantity`, `physician_name`, `status`, `date_created`) VALUES
(1, '7snxylNb', 'Julia Morales', 'AB-', 1, 'Alonso Japana', 1, '2024-03-02 18:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'iDonate', 'idonateblood@email.com', '+6948 8542 623', '1603344720_1602738120_pngtree-purple-hd-business-banner-image_5493.jpg', '&lt;p style=&quot;text-align: left; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;&quot;&gt;iDonate Blood Donation Management System is a platform designed to optimize blood donation processes. With user-friendly registration features, it enables individuals to easily join as potential donors or request blood while ensuring the confidentiality of their information. The platform efficiently manages user data, facilitating seamless matching with recipient needs and enabling timely responses to donation requests from healthcare facilities. One of the key features of the system is its centralized stock management, which ensures the availability of blood reserves, minimizing wastage and maximizing utilization. Ultimately, iDonate&rsquo;s innovative approach fosters a responsive and efficient blood supply ecosystem, saving lives and improving healthcare outcomes.&lt;/span&gt;&lt;br style=&quot;text-align: left; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff, 3= subscriber'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_inventory`
--
ALTER TABLE `blood_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `handedover_request`
--
ALTER TABLE `handedover_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_inventory`
--
ALTER TABLE `blood_inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `handedover_request`
--
ALTER TABLE `handedover_request`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
