-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2018 at 03:35 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_manovikas`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(15) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `domain_alias` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_name`, `address`, `city`, `state`, `country`, `zipcode`, `mobile_no`, `domain_alias`, `status`, `owner_id`, `created_by`, `modified_by`, `created_at`, `modified_at`) VALUES
(1, 'Novuscode', 'This is test', 'Ahmedabad', 'Gujarat', 'India', '65001', '9913704474', 'novusservice', 1, 0, 1, 1, '2017-10-06 21:32:36', '2018-03-20 11:13:16'),
(2, 'Vsquare Studio', NULL, NULL, NULL, NULL, NULL, '9913704744', 'studio', 1, 4, 1, NULL, '2017-10-30 14:45:34', '2017-10-30 14:45:35'),
(3, 'Milestone Pneumatics', 'Safal Pegasus', 'Ahmedabad', 'Gujrat', 'India', '380008', '9824839928', 'milestone', 1, 5, 1, NULL, '2017-10-31 06:35:25', '2017-10-31 06:35:25'),
(4, 'GST', 'This is test', 'Ahmedabad', 'Gujarat', 'India', '65001', '9913704474', 'gst', 1, 0, 1, 1, '2017-12-17 03:21:19', '2018-02-23 22:59:37'),
(9, 'Test', 'This is test', 'Ahmedabad', 'Gujarat', 'India', '65001', '9913714474', 'Vtest', 1, 0, 1, 1, '2018-03-15 11:52:45', '2018-03-16 20:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `account_standards`
--

CREATE TABLE `account_standards` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `standard_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_standards`
--

INSERT INTO `account_standards` (`id`, `account_id`, `standard_id`, `created_at`, `modified_at`, `created_by`) VALUES
(28, 9, 10, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(29, 9, 13, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(30, 9, 14, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_subjects`
--

CREATE TABLE `account_subjects` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `account_standard_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_subjects`
--

INSERT INTO `account_subjects` (`id`, `account_id`, `account_standard_id`, `subject_id`, `created_at`, `modified_at`, `created_by`) VALUES
(137, 9, 28, 2, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(138, 9, 28, 3, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(139, 9, 28, 4, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(140, 9, 28, 5, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(141, 9, 28, 6, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(142, 9, 28, 7, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(143, 9, 28, 8, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(144, 9, 28, 9, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(145, 9, 28, 10, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(146, 9, 29, 6, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(147, 9, 29, 7, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(148, 9, 29, 8, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(149, 9, 29, 9, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(150, 9, 30, 2, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(151, 9, 30, 3, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(152, 9, 30, 4, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(153, 9, 30, 8, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(154, 9, 30, 9, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(155, 9, 30, 10, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(156, 9, 30, 11, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(157, 9, 30, 12, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1),
(158, 9, 30, 13, '2018-03-19 19:54:56', '2018-03-19 19:54:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_super_admin` tinyint(1) DEFAULT '0',
  `remember_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fname`, `lname`, `email`, `password`, `status`, `is_super_admin`, `remember_token`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'Vijay', 'Vyas', 'vijayvyas365@gmail.com', '$2y$10$GQmEAbyx7UfYfa1wu6I3L.uZnV8RpdGt7WMnMy.Cz4cXrQNuCQq5G', 1, 1, 'E2dVXwfJl0LMfoi2oRVDeIeGm7wl2fnhUHuZIs2TsHLirUxuBcLpMAWMF3ES', '2017-10-05 16:24:40', '2017-10-05 16:24:40', 0, NULL),
(5, 'Gaurang', 'Bhai', 'gaurang@gmail.com', '$2y$10$VkTKBia8H4byhWuUZQzkpO1tsJKai5iSrevv/lBv7SygsAqNTF5RO', 1, 0, NULL, '2018-03-16 20:50:21', '2018-03-16 20:50:21', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_credentials`
--

CREATE TABLE `app_credentials` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `app_user` varchar(200) NOT NULL,
  `app_password` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_credentials`
--

INSERT INTO `app_credentials` (`id`, `account_id`, `app_user`, `app_password`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, NULL, 'test', 'test123', 1, '2017-10-23 12:43:09', '2017-10-23 12:43:09', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(15) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `config_title` varchar(200) NOT NULL,
  `config_key` varchar(100) NOT NULL,
  `config_desc` text,
  `config_label` varchar(200) DEFAULT NULL,
  `config_name` varchar(200) NOT NULL,
  `config_value` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `account_id`, `config_title`, `config_key`, `config_desc`, `config_label`, `config_name`, `config_value`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, 'Currency', 'currency', NULL, 'Currency', 'INR', '<i class=\'fa fa-inr\'></i>', '2017-10-15 11:01:24', '2017-10-14 15:27:44', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(15) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `remember_token` text,
  `role_id` bigint(15) DEFAULT '0',
  `status` tinyint(1) NOT NULL COMMENT '1=Active,0=Deactive,2=Blocked',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(15) NOT NULL,
  `modified_by` bigint(15) DEFAULT NULL,
  `source` enum('App','Portal') DEFAULT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `account_id`, `fname`, `lname`, `email`, `password`, `profile_pic`, `address`, `city`, `state`, `country`, `zipcode`, `phone_no`, `remember_token`, `role_id`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`, `source`, `is_owner`) VALUES
(1, 1, 'Satyam', 'Vakhariya', 'saty@novuscode.com', '$2y$10$tZyhM5SIE6sIwwcQkifc5OSgalIUacfCCOrig4xBbcYn1UpqptoQa', '1507862713.jpg', NULL, NULL, NULL, NULL, NULL, '9913704474', 'wnPo2jImGqv5lj7xVYWB9D6OsP7PI35jNS4vAB7UVKzSyFOS3q4FcBz9HuGs', 1, 1, '2017-10-06 21:32:36', '2017-10-12 21:15:15', 1, 1, NULL, 1),
(2, 1, 'Vijay', 'Vyas', 'vij@novuscode.com', '$2y$10$tRR.g6eyYf5h0OqqkdJrU.WXtl2FrJ.DO8b2bSSN711QGgeW75k46', '', 'Lane1', 'Ahmedabad', 'Gujarat', 'India', '65001', '123265890', 'nmwYNaftiuMCHdvvwNNWRjeE0KoUpLnnMhm1NlSKzgrtdlzVph42Zwc5KqtS', 1, 1, '2017-10-10 02:03:07', '2017-12-16 07:59:34', 1, 1, 'App', 0),
(3, 1, 'Test', 'Test1', 'rakesh@gmail.com', '$2y$10$T3PQoW4hPxwEzrLb1otj1.O9fDdzKR0Z5o5UO0Hp02GwZqe4iM9m6', '', 'A/6 Sankalp', 'Ahmedabad', 'Gujarat', 'India', '65001', '9913704474', NULL, 1, 1, '2017-10-26 11:14:22', '2017-10-26 11:14:22', 1, NULL, 'App', 0),
(4, 2, 'Vijay', 'Vyas', 'vikuvyas@gmail.com', '$2y$10$X54qIMgcTISAf5T8IJXspuoXPkgKvLH.0QCgMXTwEy8Mfgk2l5GG.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-10-30 14:45:35', '2017-10-30 14:45:35', 1, NULL, NULL, 1),
(5, 3, 'prahlad', 'vakharia', 'saty.novuscode@gmail.com', '$2y$10$FETZPal5OIaIQFDrqR98P.nudWHIoeAutj218HRrXZgFV4WyH7cpW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sidiTgNyH9iWh5fNrz0bFjLBRSUnCrlyKOivTDWNTLdX4it9em0NmEy5mFUn', 1, 1, '2017-10-31 06:35:25', '2017-10-31 06:35:25', 1, NULL, NULL, 1),
(6, 3, 'F Empl', 'L N', 'info@milestonepneumatics.com', '$2y$10$wZBvxq1cDh93rvQTMQUp..6F1GfJoyYcVtTy9uwSBmGAeW8OnUgG2', '1509431892.jpg', '4, Dalal Park', 'Vadodara', '383883', 'USA', '8838838', '9838383323', NULL, 0, 1, '2017-10-31 06:38:15', '2017-10-31 06:38:15', 5, NULL, NULL, 0),
(10, 1, 'Test', 'Test1', 'rakesh@gmail.com', '$2y$10$ABgAVsfR1lg5fV49bsl1.uCU0u4SzRWseCiR2Qz0DnPG0TDBOIKDu', '', 'A/6 Sankalp', 'Ahmedabad', 'Gujarat', 'India', '65001', '9913704474', NULL, 1, 1, '2017-11-12 15:01:21', '2017-11-12 15:01:21', 1, NULL, 'App', 0),
(11, 4, 'Rakesh', 'Patel', 'rkpatel@gmail.com', '$2y$10$8nH8LbI55Pw6otesznjXWulPuBeawpxC2FkXkKAPGvbl7ESHblc/i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-12-17 03:21:19', '2017-12-17 03:21:19', 1, NULL, NULL, 1),
(12, 9, 'Rakesh', 'Patel', 'rakeshpatel@gmail.com', '$2y$10$qC4EUNGqBH6PIdV5YHtqqu/qvM7./ozIz4Ql8WtziFpbnOqOPPLzK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2018-03-15 11:52:45', '2018-03-15 11:52:45', 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_device`
--

CREATE TABLE `employee_device` (
  `id` bigint(15) NOT NULL,
  `emp_id` bigint(15) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=Active,0=Disabled',
  `reg_date` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) NOT NULL,
  `parent_module_id` bigint(20) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `description` text,
  `module_url` varchar(255) NOT NULL,
  `route_name` varchar(200) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL,
  `is_email_notification_module` tinyint(1) NOT NULL,
  `display_order` int(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_owner` tinyint(1) DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `parent_module_id`, `module_name`, `display_name`, `description`, `module_url`, `route_name`, `icon`, `show_in_menu`, `is_email_notification_module`, `display_order`, `status`, `is_owner`, `created_by`, `modified_by`, `created_at`, `modified_at`) VALUES
(1, 0, 'Dashboard', 'Dashboard', NULL, '/', 'admin.dashboard', 'icon-display4', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:46:25', '2018-03-04 20:46:25'),
(2, 0, 'Customer', 'Customer', NULL, '/customer', 'customer.index', 'icon-user', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:46:59', '2018-03-04 20:46:59'),
(3, 0, 'Employee', 'Employee', NULL, '/employee', 'employee.index', 'icon-user-tie', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:50:58', '2018-03-04 20:50:58'),
(4, 0, 'Product', 'Products', NULL, '#', '#', 'icon-atom2', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:51:47', '2018-03-04 20:51:47'),
(5, 4, 'Category', 'Category', NULL, '/category', 'category.index', 'icon-puzzle3', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:52:24', '2018-03-04 20:52:24'),
(6, 4, 'Product Child', 'Products', NULL, '/product', 'product.index', 'icon-cube3', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:53:21', '2018-03-04 20:53:21'),
(7, 0, 'Service', 'Service', NULL, '#', '#', 'icon-make-group', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:53:54', '2018-03-04 20:53:54'),
(8, 7, 'Service Type', 'Service Type', NULL, '/service_type', 'service_type.index', 'icon-cog7', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 20:58:27', '2018-03-04 20:58:27'),
(9, 7, 'Service Status', 'Service Status', NULL, 'servicestatus', 'servicestatus.index', 'icon-hammer', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 21:00:14', '2018-03-04 21:00:14'),
(10, 7, 'Service', 'Service', NULL, '/service', 'service.index', 'icon-hammer-wrench', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 21:01:44', '2018-03-04 21:01:44'),
(11, 0, 'Wallet', 'Wallet', NULL, '/wallet', 'wallet.index', 'fa fa-google-wallet', 1, 0, 0, 1, 0, 1, NULL, '2018-03-04 21:03:40', '2018-03-04 21:03:40'),
(12, 11, 'Add Money', 'Add Money', NULL, '/wallet/addMoney', 'wallet.addMoney', 'icon-wallet', 1, 0, 0, 1, 0, 1, NULL, '2018-03-05 19:43:49', '2018-03-05 19:43:49'),
(13, 11, 'Transfer Money', 'Transfer Money', NULL, '/wallet', 'wallet.index', 'icon-bag', 1, 0, 0, 1, 1, 1, NULL, '2018-03-05 19:45:28', '2018-03-05 19:45:28'),
(14, 11, 'Expenses', 'Expenses', NULL, '/expenses', 'expenses.index', 'icon-coins', 1, 0, 0, 1, 1, 1, NULL, '2018-03-05 19:51:37', '2018-03-05 19:51:37'),
(15, 11, 'Transaction History', 'Transaction History', NULL, '/transaction', 'transaction.index', 'icon-history', 1, 0, 0, 1, 0, 1, NULL, '2018-03-05 19:52:33', '2018-03-05 19:52:33'),
(16, 0, 'GPS', 'GPS', NULL, '#', '#', 'icon-location4', 1, 0, 0, 1, 0, 1, NULL, '2018-03-05 19:54:54', '2018-03-05 19:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `standards`
--

CREATE TABLE `standards` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standards`
--

INSERT INTO `standards` (`id`, `name`, `description`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, '1', 'Testtt', 1, '2018-03-18 01:13:44', '2018-03-18 03:20:05', 1, 1),
(4, '2', NULL, 1, '2018-03-18 03:20:13', '2018-03-18 03:20:13', 1, NULL),
(5, '3', NULL, 1, '2018-03-18 03:20:20', '2018-03-18 03:20:20', 1, NULL),
(6, '4', NULL, 1, '2018-03-18 03:20:26', '2018-03-18 03:20:26', 1, NULL),
(7, '5', NULL, 1, '2018-03-18 03:20:34', '2018-03-18 03:20:34', 1, NULL),
(8, '6', NULL, 1, '2018-03-18 03:20:41', '2018-03-18 03:20:41', 1, NULL),
(9, '7', NULL, 1, '2018-03-18 03:20:46', '2018-03-18 03:20:46', 1, NULL),
(10, '8', NULL, 1, '2018-03-18 03:20:52', '2018-03-18 03:20:52', 1, NULL),
(11, '9', NULL, 1, '2018-03-18 03:20:59', '2018-03-18 03:20:59', 1, NULL),
(12, '10', NULL, 1, '2018-03-18 03:21:09', '2018-03-18 03:21:09', 1, NULL),
(13, '11', NULL, 1, '2018-03-18 03:21:19', '2018-03-18 03:21:19', 1, NULL),
(14, '12', NULL, 1, '2018-03-18 03:21:28', '2018-03-18 03:21:28', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `standard_subjects`
--

CREATE TABLE `standard_subjects` (
  `id` bigint(20) NOT NULL,
  `standard_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_subjects`
--

INSERT INTO `standard_subjects` (`id`, `standard_id`, `subject_id`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(13, 14, 2, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(14, 14, 3, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(15, 14, 4, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(16, 14, 8, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(17, 14, 9, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(18, 14, 10, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(19, 14, 11, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(20, 14, 12, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(21, 14, 13, '2018-03-19 09:01:58', '2018-03-19 09:01:58', 1, NULL),
(22, 13, 6, '2018-03-19 09:29:34', '2018-03-19 09:29:34', 1, NULL),
(23, 13, 7, '2018-03-19 09:29:34', '2018-03-19 09:29:34', 1, NULL),
(24, 13, 8, '2018-03-19 09:29:34', '2018-03-19 09:29:34', 1, NULL),
(25, 13, 9, '2018-03-19 09:29:34', '2018-03-19 09:29:34', 1, NULL),
(26, 10, 2, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(27, 10, 3, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(28, 10, 4, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(29, 10, 5, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(30, 10, 6, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(31, 10, 7, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(32, 10, 8, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(33, 10, 9, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL),
(34, 10, 10, '2018-03-19 09:29:59', '2018-03-19 09:29:59', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `description`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(2, 'ગુજરાતી', 'Maths', 1, '2018-03-18 03:50:35', '2018-03-18 03:55:30', 1, 1),
(3, 'હિન્દી', NULL, 1, '2018-03-18 04:24:04', '2018-03-18 04:24:04', 1, NULL),
(4, 'Physics', 'Physics', 1, '2018-03-18 20:27:54', '2018-03-18 20:27:54', 1, NULL),
(5, 'Chemistry', NULL, 1, '2018-03-18 20:28:12', '2018-03-18 20:28:12', 1, NULL),
(6, 'Biology', NULL, 1, '2018-03-18 20:28:22', '2018-03-18 20:28:22', 1, NULL),
(7, 'Mathematics', NULL, 1, '2018-03-18 20:28:39', '2018-03-18 20:28:39', 1, NULL),
(8, 'Computer Education', NULL, 1, '2018-03-18 20:28:55', '2018-03-18 20:28:55', 1, NULL),
(9, 'Social Studies', NULL, 1, '2018-03-18 20:29:25', '2018-03-18 20:29:25', 1, NULL),
(10, 'Science', NULL, 1, '2018-03-18 20:29:59', '2018-03-18 20:29:59', 1, NULL),
(11, 'PT', NULL, 1, '2018-03-18 20:30:08', '2018-03-18 20:30:08', 1, NULL),
(12, 'Music', NULL, 1, '2018-03-18 20:30:16', '2018-03-18 20:30:16', 1, NULL),
(13, 'Sanskrit', NULL, 1, '2018-03-18 20:30:24', '2018-03-18 20:30:24', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) NOT NULL,
  `standard_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `standard_id`, `subject_id`, `title`, `description`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 10, 4, 'Vtestt1', 'Testttt1111111111', 1, '2018-03-22 02:34:52', '2018-03-21 21:04:52', 1, 1),
(2, 13, 7, 'Vtestt', 'Testttt', 1, '2018-03-21 21:04:10', '2018-03-21 21:04:10', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_options`
--

CREATE TABLE `test_options` (
  `id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `option_title` varchar(255) NOT NULL,
  `option_type` enum('Image','Radio','Checkbox','Textbox') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `question_title` varchar(255) NOT NULL,
  `question_type` enum('Image','Radio','Checkbox','Textbox') NOT NULL,
  `question_tips` text,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`created_by`);

--
-- Indexes for table `account_standards`
--
ALTER TABLE `account_standards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_subjects`
--
ALTER TABLE `account_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_credentials`
--
ALTER TABLE `app_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_device`
--
ALTER TABLE `employee_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standards`
--
ALTER TABLE `standards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_subjects`
--
ALTER TABLE `standard_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_options`
--
ALTER TABLE `test_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_standards`
--
ALTER TABLE `account_standards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `account_subjects`
--
ALTER TABLE `account_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_credentials`
--
ALTER TABLE `app_credentials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_device`
--
ALTER TABLE `employee_device`
  MODIFY `id` bigint(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `standards`
--
ALTER TABLE `standards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `standard_subjects`
--
ALTER TABLE `standard_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_options`
--
ALTER TABLE `test_options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
