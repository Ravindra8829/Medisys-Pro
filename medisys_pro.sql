-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 09:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `current_cart_medicine`
--

CREATE TABLE `current_cart_medicine` (
  `id` int(11) NOT NULL,
  `m_id` varchar(30) DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL,
  `final_amount` varchar(30) DEFAULT NULL,
  `emp_id` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'cart',
  `c_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `current_cart_medicine`
--

INSERT INTO `current_cart_medicine` (`id`, `m_id`, `quantity`, `final_amount`, `emp_id`, `status`, `c_date`) VALUES
(3, '13', '2.0', '13.98', '1', '2', '2023-12-08 18:29:33'),
(4, '17', '2.0', '17.0', '1', '2', '2023-12-08 18:29:43'),
(5, '18', '3.0', '41.97', '1', '2', '2023-12-08 18:29:52'),
(6, '16', '2.0', '18.5', '1', '3', '2023-12-08 21:00:04'),
(7, '16', '3.0', '27.75', '1', '4', '2023-12-08 21:25:31'),
(8, '16', '2.0', '18.5', '1', '5', '2024-03-03 16:12:02'),
(9, '18', '3.0', '41.97', '1', '5', '2024-03-03 16:12:22'),
(10, '17', '1.0', '8.5', '1', '6', '2024-04-03 01:52:04'),
(11, '17', '3.0', '25.5', '1', '7', '2024-04-03 13:03:50'),
(14, '17', '1.0', '8.5', '1', 'cart', '2024-04-04 01:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `acc_create_date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(30) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `emp_name`, `gender`, `mobile`, `address`, `email`, `password`, `acc_create_date`, `status`) VALUES
(1, 'Ritesh R Surange', 'female', '8900890089', 'Akurdi', 'ritesh@gmail.com', '123123', '2023-12-06', 'Active'),
(2, 'Sapna Jadhav', 'female', '9879877899', 'Akurdi Pune 411044', 'sapna@gmail.com', '123123', '2024-02-20', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `patient_mobile` varchar(100) DEFAULT NULL,
  `refer_dr_name` varchar(100) DEFAULT NULL,
  `refer_hospitalname` varchar(1000) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `emp_id` varchar(30) DEFAULT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_mode` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `patient_name`, `patient_mobile`, `refer_dr_name`, `refer_hospitalname`, `amount`, `emp_id`, `sale_date`, `payment_mode`) VALUES
(1, 'Ritesh R', '8900890009', 'DR Snehal', 'Ravet', '72.95', '1', '2023-12-08 19:35:09', 'CASH PAYMENT'),
(2, 'Ritesh R', '8900890089', 'DR Snehal', 'RAVET PCMC', '72.95', '1', '2023-12-08 19:38:14', 'CARD PAYMENT'),
(3, 'Ritesh R', '8900890009', 'DR Snehal D', 'Ravetttt', '18.5', '1', '2023-12-08 21:00:20', 'UPI PAYMENT'),
(4, 'RR', '9800098000', 'RR', 'AAA', '27.75', '1', '2023-12-08 21:25:54', 'CASH PAYMENT'),
(5, 'A', '8799879987', 'QWE', 'ASWER', '60.47', '1', '2024-03-03 16:13:10', 'UPI PAYMENT'),
(6, 'A', '8900890009', 'DR Snehal', 'Akurdi', '8.5', '1', '2024-04-03 01:52:57', 'UPI PAYMENT'),
(7, ' Ravindra Kumar Suthar', '8900089000', 'Dr Sashikant', 'Shashi Hospiral Ravet Pune 411044', '25.5', '1', '2024-04-03 13:05:33', 'CARD PAYMENT');

-- --------------------------------------------------------

--
-- Table structure for table `stock_details`
--

CREATE TABLE `stock_details` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `manufacturer` varchar(1000) DEFAULT NULL,
  `dosage_form` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `unitprice` varchar(100) DEFAULT NULL,
  `mfg_date` varchar(30) DEFAULT NULL,
  `expiry` varchar(30) DEFAULT NULL,
  `entry_by` varchar(30) DEFAULT 'Admin',
  `entry_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(30) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_details`
--

INSERT INTO `stock_details` (`id`, `name`, `manufacturer`, `dosage_form`, `category`, `quantity`, `unitprice`, `mfg_date`, `expiry`, `entry_by`, `entry_date`, `status`) VALUES
(1, 'Medicine A', 'Manufacturer X', 'Tablet', 'Painkiller', 100, '5.99', '2022-01-01', '2023-01-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(2, 'Medicine B', 'Manufacturer Y', 'Capsule', 'Antibiotic', 50, '10.50', '2022-02-01', '2023-02-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(3, 'Medicine C', 'Manufacturer Z', 'Liquid', 'Cough Syrup', 75, '8.75', '2022-03-01', '2023-03-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(4, 'Medicine D', 'Manufacturer X', 'Tablet', 'Allergy Relief', 120, '7.25', '2022-04-01', '2023-04-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(5, 'Medicine E', 'Manufacturer Y', 'Capsule', 'Painkiller', 90, '6.50', '2022-05-01', '2023-05-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(6, 'Medicine F', 'Manufacturer Z', 'Liquid', 'Antibiotic', 60, '12.99', '2022-06-01', '2023-06-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(7, 'Medicine G', 'Manufacturer X', 'Tablet', 'Cough Syrup', 110, '9.25', '2022-07-01', '2023-07-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(8, 'Medicine H', 'Manufacturer Y', 'Capsule', 'Allergy Relief', 80, '8.50', '2022-08-01', '2023-08-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(9, 'Medicine I', 'Manufacturer Z', 'Liquid', 'Painkiller', 70, '11.75', '2022-09-01', '2023-09-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(10, 'Medicine J', 'Manufacturer X', 'Tablet', 'Antibiotic', 130, '14.99', '2022-10-01', '2023-10-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(11, 'Medicine K', 'Manufacturer Y', 'Capsule', 'Cough Syrup', 95, '7.25', '2022-11-01', '2023-11-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(12, 'Medicine L', 'Manufacturer Z', 'Liquid', 'Allergy Relief', 55, '10.50', '2022-12-01', '2023-12-08', 'Admin', '2023-12-06 00:02:41', 'Available'),
(13, 'Medicine M', 'Manufacturer X', 'Tablet', 'Painkiller', 105, '6.99', '2023-01-01', '2024-01-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(14, 'Medicine N', 'Manufacturer Y', 'Capsule', 'Antibiotic', 45, '12.50', '2023-02-01', '2023-04-07', 'Admin', '2023-12-06 00:02:41', 'Available'),
(15, 'Medicine O', 'Manufacturer Z', 'Liquid', 'Cough Syrup', 85, '11.75', '2023-03-01', '2024-03-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(16, 'Medicine P', 'Manufacturer X', 'Tablet', 'Allergy Relief', 108, '9.25', '2023-04-01', '2024-04-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(17, 'Medicine Q', 'Manufacturer Y', 'Capsule', 'Painkiller', 71, '8.50', '2023-05-01', '2024-05-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(18, 'Medicine R', 'Manufacturer Z', 'Liquid', 'Antibiotic', 62, '13.99', '2023-06-01', '2024-06-01', 'Admin', '2023-12-06 00:02:41', 'Available'),
(19, 'Medicine S', 'Manufacturer X', 'Tablet', 'Cough Syrup', 125, '10.25', '2023-07-01', '2024-07-01', 'Admin', '2023-12-06 00:02:41', 'NotAvailable'),
(20, 'Medicine T', 'Manufacturer Y', 'Capsule', 'Allergy Relief', 100, '7.50', '2023-08-01', '2024-08-01', 'Admin', '2023-12-06 00:02:41', 'NotAvailable');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_cart_medicine`
--
ALTER TABLE `current_cart_medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_details`
--
ALTER TABLE `stock_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `current_cart_medicine`
--
ALTER TABLE `current_cart_medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stock_details`
--
ALTER TABLE `stock_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
