-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 20, 2024 at 01:18 AM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u876829492_smmvalerieco`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `level` enum('owner','admin') NOT NULL,
  `access` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `api_id` varchar(255) NOT NULL DEFAULT '-',
  `api_key` varchar(255) NOT NULL DEFAULT '-',
  `secret_key` varchar(255) NOT NULL DEFAULT '-',
  `is_manual` int(11) NOT NULL DEFAULT 0,
  `auto_add` int(11) NOT NULL DEFAULT 0,
  `auto_update` varchar(11) DEFAULT '0',
  `auto_status` int(11) NOT NULL DEFAULT 0,
  `auto_name_service` varchar(11) NOT NULL DEFAULT '0',
  `profit` int(11) NOT NULL,
  `profit_type` enum('persen','biasa') NOT NULL,
  `kurs` varchar(100) NOT NULL DEFAULT 'IDR',
  `rate` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_balance`
--

CREATE TABLE `api_balance` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL,
  `balance_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_order`
--

CREATE TABLE `api_order` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(255) NOT NULL,
  `order_id_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_refill`
--

CREATE TABLE `api_refill` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(255) NOT NULL,
  `refill_id_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_refill_status`
--

CREATE TABLE `api_refill_status` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(255) NOT NULL,
  `refill_id_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_request_param`
--

CREATE TABLE `api_request_param` (
  `id` int(11) NOT NULL,
  `param_key` mediumtext NOT NULL,
  `param_value` mediumtext NOT NULL,
  `param_type` enum('custom','table_column') NOT NULL,
  `api_type` enum('order','status','balance','service','refill','status_refill') NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_service`
--

CREATE TABLE `api_service` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL,
  `data_service_key` varchar(50) NOT NULL,
  `service_id_key` varchar(50) NOT NULL,
  `category_key` varchar(50) NOT NULL,
  `service_name_key` varchar(50) NOT NULL,
  `description_key` varchar(50) NOT NULL,
  `min_key` varchar(50) NOT NULL,
  `max_key` varchar(50) NOT NULL,
  `price_key` varchar(50) NOT NULL,
  `average_time_key` varchar(50) NOT NULL,
  `refill_key` varchar(11) NOT NULL,
  `type_key` varchar(50) NOT NULL,
  `status_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_status`
--

CREATE TABLE `api_status` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `success_response` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL,
  `status_key` varchar(50) NOT NULL,
  `start_count_key` varchar(50) NOT NULL,
  `remains_key` varchar(50) NOT NULL,
  `mass_status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `id` int(11) NOT NULL,
  `type` enum('bank','emoney') NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `token` mediumtext DEFAULT NULL,
  `access_token` mediumtext DEFAULT NULL,
  `payment_gateway` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_mutation`
--

CREATE TABLE `bank_mutation` (
  `id` int(11) NOT NULL,
  `type` enum('bank','emoney') NOT NULL,
  `name` varchar(50) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `amount` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `benefit`
--

CREATE TABLE `benefit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `benefit`
--

INSERT INTO `benefit` (`id`, `name`, `value`, `type`) VALUES
(1, 'min_payout', '500', 'Silver'),
(2, 'rate_payout', '500', 'Silver'),
(3, 'trx', '1000000', 'Gold'),
(4, 'min_payout', '500', 'Gold'),
(5, 'rate_payout', '1500', 'Gold'),
(6, 'trx', '5000000', 'Platinum'),
(7, 'min_payout', '500', 'Platinum'),
(8, 'rate_payout', '2000', 'Platinum'),
(9, 'trx', '10000000', 'Diamond'),
(10, 'min_payout', '500', 'Diamond'),
(11, 'rate_payout', '2500', 'Diamond');

-- --------------------------------------------------------

--
-- Table structure for table `benefit_payout`
--

CREATE TABLE `benefit_payout` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `childpanel`
--

CREATE TABLE `childpanel` (
  `user_id` int(11) NOT NULL,
  `status` enum('Pending','Expired','Active','') NOT NULL,
  `domain` int(200) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cookie`
--

CREATE TABLE `cookie` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `ua` text NOT NULL,
  `browser` text NOT NULL,
  `browser_version` text NOT NULL,
  `platform` text NOT NULL,
  `ud` enum('Desktop','Tablet','Mobile','unknown') NOT NULL DEFAULT 'unknown',
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `cookie`
--

INSERT INTO `cookie` (`id`, `user_id`, `cookie`, `ip_address`, `login`, `ua`, `browser`, `browser_version`, `platform`, `ud`, `created_at`, `expired_at`, `last_activity`) VALUES
(1, 1, 'P6uHbkSVXixocJ4ErgGmheUOMs6mj3oYavgHZlLKKdfcf8pUz1W5YCQLInI1qFQBl9tCRnSiRuq20e7dTp7v0EDOAwxDjT5M9sNB', '', 'admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'Chrome', '128.0.0.0', 'Android', 'Mobile', '2024-09-23 16:46:01', '2024-10-23 16:46:01', '2024-09-23 09:52:36'),
(3, 1, '7An9dlXb5Pw3m6mHYRwzNDWVOkGEMWneMXThLAZ1ytocZFCfbocSaxj9B10ts6NSuIgrvdfsieV48Jvxq3y7QlI8P2zOp4UQqjRg', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-09-28 22:36:17', '2024-10-28 22:36:17', '2024-09-28 16:29:58'),
(6, 1, 'EvCWFG6SNxyz7q4QfrqjTW6glUpYOte9HJM3aUMXioGmuiIkabZVJr3DKxnydvcs5h0pzNILjBsRO8ufYCXA4BeVTP8bk1wmPEQS', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-05 20:32:55', '2024-11-04 20:32:55', '2024-10-06 17:04:52'),
(10, 1, 'k6ZVUrjub4QADf98tSfxLJiFr7kMF1wBCYQwyK0P7qdaLMKC43mpi2gu2Z9PvoGcJvSgR5nTTe0RAGHNEnhxlzszjmEB56Xe3Xsl', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-07 00:23:47', '2024-11-06 00:23:47', '2024-10-14 01:17:28'),
(11, 3, 'zw1elyhsAdD7wLmLpuquc6R9dNKxP5M6MD0YghfPpqaNscS4BCatkrETeJAVjzrtFFH2von3GijGgZXY0xnoRIJ3ZKOW5bbO7SCl', '45.115.209.194', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-07 01:11:53', '2024-11-06 01:11:53', '2024-10-06 18:12:10'),
(18, 1, 'Q81GaK4rPkWXIf57BCV0KBpoiStxNYcMEr7JzbcAUOLgATqkvvjubfFlYFP52ZNaDimIj1DVRehQXnH9zgt3lCOuSy6LUdmRdwGo', '', 'admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-10 23:01:32', '2024-11-09 23:01:32', '2024-10-10 16:01:52'),
(23, 5, 'a0ri2wzEIJGB2mOFZbNjtKdlYPAuWX456Ww7LLX9nqxezfe4Vysf5IaykdubmnqHj1M73HZvcgCcSFTgOUpDVo8UQhTviltrJ3GQ', '2001:448a:404c:1e38:8c6d:59a6:43a7:3e0b', 'user', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-14 21:47:32', '2024-11-13 21:47:32', '2024-10-14 15:37:28'),
(24, 1, 'hyJDT5vCC14dPxeofrGLScwYjpAGxF2mglITnlm5ukNXD7bh8ZY0qK28zEQSkW41qKWfvE33OFRHMu6d9LaQIojJs6OwRNPX9cU0', '180.252.61.222', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-14 22:47:26', '2024-11-13 22:47:26', '2024-10-14 16:03:42'),
(26, 1, '4k6nWEFBazTfkLyvO1KG7ON0P6Drh82xwslgl1oZ9WIp73iwULDVIjsTJSUpGJEQnZoVB3cPK0xhN2My8XeQcAz4qqgatHYjmddf', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-15 03:18:51', '2024-11-14 03:18:51', '2024-10-17 04:27:04'),
(29, 4, '7t9bRLdMp2AiEopu8IfX4KoWrcYRPCtOUlHLZDmr15BgXseJ2jxaKdSzQ9nSu60N5bV6EyPwTqIYGD1HcBFQCMhkUi7m3Tsv8qhW', '2404:c0:2120::cd:1cf6', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:11:21', '2024-11-14 09:11:21', '2024-10-15 09:11:28'),
(30, 5, 'G6vMUroutQIsVtB4K10OFpqiDebm7cbSCkKXg2W89gDNlJWHQRLlk37uifBRnc4an5f5OFrJAwx9U82aYZhdVewx1ozICGvmZzdL', '120.188.76.214', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:12:52', '2024-11-14 09:12:52', '2024-10-15 10:24:16'),
(31, 6, 'V6i0ztVejW1xwMmkml9SsKWvoSh2doBAbMe6zqCRZ34wbPEp4JjXQICtrGQGLvqXHyd9fc3FKr5unkI5NJP1DYO8RaEfA0agpOHL', '182.2.145.59', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:13:55', '2024-11-14 09:13:55', '2024-10-16 14:14:10'),
(33, 8, 'DZ2tYVicRCBwN3v4nFEZTpSNFgC4vd7z21UuPos8jMImGA0h7JQQ5hlYW58kroKLOWS1n6beqcwMUagRsy3PzJlrk0LEe6Xt9xfq', '2001:448a:5102:2fcc:40e0:96d0:a093:3294', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:16:34', '2024-11-14 09:16:34', '2024-10-15 09:43:29'),
(34, 9, 'BnsImVY516HLLuHSI3PoCj7pDDYb4NmAFrh03uckcPfAXXCteRiMovNTV95kaSg9212ErwT8nBKJbJ0tze7F4vyUGQ6OfEQZdxyh', '2001:448a:40b0:ab50:41e4:f3af:e176:ef7d', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:20:01', '2024-11-14 09:20:01', '2024-10-15 11:52:31'),
(35, 10, '4qIQdxE2knalvcyK2v6cHVrSQwlgW7fhIfRHxp6Gi9W3UMuOLCAmD7mj5B9Oy1p8JbLYuBNPNCo0XRnDTzEZK4wzsMPt8ZYagrAo', '114.10.76.39', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:24:33', '2024-11-14 09:24:33', '2024-10-15 10:25:51'),
(36, 11, 'NlFWp2Cv5HOeDN43TCJdYh9tMr8V6bdPxwabIhE31TktspMoYaDGj9sHqKG1igULuyzc7E0mogzZ5AjZxBRSrenSRlF0uQfk4AJX', '125.164.13.176', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:25:28', '2024-11-14 09:25:28', '2024-10-16 15:22:19'),
(37, 1, 'zV7jGX4WMJqNTy5BHH6XatvCb1zEnhDY85KUkB2j0IuosFoeCPpFNqkZxwLrPZl3AYSJ0dLvgOIQAw64icrR9d9SuaKQ87smbfpV', '', 'admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:32:09', '2024-11-14 09:32:09', '2024-10-16 17:11:58'),
(38, 12, 'AwAriHCYc58ekxSX18v1E3xDk0927PMtUsgoVT4qdGNiWNJBz9ZLaVhyFD2UyE4qz5f7jHeK6crXaJuIILlpdFn0ZBgKRhYonWOv', '114.10.6.155', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 09:33:30', '2024-11-14 09:33:30', '2024-10-15 10:17:17'),
(39, 13, 'sLTj6XhpNWKE0UT5VSl2AU8eBCnCJa5nv09rvdIgsyPyQfFQZgYzLVqzAqGN3kBxibPOrc6FGl87YRSaZodHbuJjDo7MuXhi9H2w', '206.189.159.184', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 10:08:22', '2024-11-14 10:08:22', '2024-10-15 10:11:54'),
(40, 14, 'fMLrXDa0j4Kcuh9liOr9yZ4YiREORwhMl6m6LJGNCIPuy17zUTJXpodsYkQUAQctmBCHtonf8jpTb3eNGzD08qsSxgFbVdPk7v5Z', '2400:9800:251:4771:58ac:9e62:69a6:e280', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 10:11:53', '2024-11-14 10:11:53', '2024-10-15 10:17:42'),
(41, 15, 'BtpVVq8lz4P5CezL0ZGfWxMhdQYJH9Ticm1UyATxD1NoOF2aAY4P8JIXwEjag7kwnXiHr6BouGsvKFUSrSWZjfkCyqDbgvNe57cL', '114.10.46.167', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 10:27:21', '2024-11-14 10:27:21', '2024-10-15 16:16:48'),
(43, 1, 'rNlnaZnAMJoBOYLlymjz0adhZdbvrFVi2IRvBAobg3SFResL5uk9E0fPKH7K7VCeCQNm4yqpOHPgc1uqEGx8xYk1SszcD432wijw', '', 'admin', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-15 10:39:55', '2024-11-14 10:39:55', '2024-10-17 02:53:55'),
(44, 16, 'bjKg0SoUHckPUNujAylLICtNGesGzALBvphYuWDb43nfM72Xcnrd2x4oJIaTgf17KDSZMHmEwmB8viqPxZpdF63RQEV891eQYO6y', '114.5.250.127', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 10:44:14', '2024-11-14 10:44:14', '2024-10-15 10:51:06'),
(45, 17, 'hFifXAnxN23rKqSn8YWeVDMctaLzzplSI4mxVvQE0GaJeILds5yPfEjqDHBAcg6wt2rFTkColRh9omOsJUWiPgp051wUZ7N67CGH', '180.241.171.206', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 11:13:24', '2024-11-14 11:13:24', '2024-10-15 11:14:47'),
(46, 18, 'H5P1iwIbN9102fryW4tEoLaYn84f0W8qKiyMCpnddGD3GIslQMqOjol9QJFuux7BwscvxCSjk3tRhzkrmhpNcbBJV62TXAOKPUZg', '116.206.36.62', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'Chrome', '128.0.0.0', 'Android', 'Mobile', '2024-10-15 11:24:36', '2024-11-14 11:24:36', '2024-10-15 11:31:51'),
(47, 19, '0RrFYkDTIEcj9z6c8ELtV0jRwnX9uPUkyrS31qdn54s2lyQVMQAeJ6gb87OfSG4wov3hzuYMxZOWgbpBH5iqvUATiHmCCtKXZhJl', '103.179.248.174', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 14:39:53', '2024-11-14 14:39:53', '2024-10-15 16:59:29'),
(48, 20, 'jlsIOWbXfD9XDQuZPSz3gNA2g6TYNHpLMEYyo0CftyVI1uJ48qxF5n4dGHevFvE7Obrx91hJRwec25q6ZsCtATRkwnm7GojQcWBr', '182.2.5.226', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 14:44:47', '2024-11-14 14:44:47', '2024-10-16 09:32:42'),
(49, 21, 'wPIOnE5QBUXbfqy0tTH4zfIx77eJLRoukSs3copeQnbA96vjasGlm9UZkT2zDWgpBWix2K6F1jmrACha4J8NV5YZFgO3DMYMqr8V', '36.68.55.145', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-15 16:47:30', '2024-11-14 16:47:30', '2024-10-15 17:26:12'),
(56, 24, 'DvPWs0f8UVJRdMW4ieFtEsXOYcGaD2N6GJx1gSrw4hIxkVcZIBKmdvL3yAahFoKoQZXEClPMunAN1gTj57TjbUkm0zH57wi9bpqQ', '114.10.12.40', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-16 07:29:51', '2024-11-15 07:29:51', '2024-10-16 07:30:14'),
(58, 25, 'lKVRqZ9UwOEeSj8mSpGC7APviI3crMgGoxb5DoasdyvcuAOYNxw4fz53C8KfU2XDe1PpkE6bB0LRFsdh4tQHlZtLmTrgMj2hQVzI', '103.47.135.120', 'user', 'Mozilla/5.0 (Linux; Android 14; en; Infinix X6833B Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.129 HiBrowser/v2.23.1.4 UWS/ Mobile Safari/537.36', 'Chrome', '103.0.5060.129', 'Android', 'Mobile', '2024-10-16 12:32:52', '2024-11-15 12:32:52', '2024-10-16 12:33:00'),
(59, 11, 'QuFBC1pKCRxXLAGPiNTewfH3cyMBqsgZvvXs3cF2a05UZJLEaKI2Gko7A6zHiSOOIhDQdoNjmr0t94ytrndqpbWJmgD8MWjuEnV9', '125.164.13.176', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-16 13:29:26', '2024-11-15 13:29:26', '2024-10-17 00:19:46'),
(60, 3, 'yBlsSvYUIhLDj6Jx4Wm3ETap3STd5QieevgXcK45HLbztOVYkbfkCGXyhnwFA8HNn2FmKrVaMdAj9WQtlir0P19NPMZoqsRquJ8p', '36.73.52.80', 'user', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-16 14:34:49', '2024-11-15 14:34:49', '2024-10-17 05:12:39'),
(62, 27, 'NpGY2Szn3rgWgd4LxR5ysWtZBCykYbBeXPvFhJjhaepzQSAZsDdtroHqcn2M3VclM9uFlIJwVbE0A49IP0DXv1RfTG1Em6oOHTUx', '36.79.180.172', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-16 15:31:07', '2024-11-15 15:31:07', '2024-10-16 15:37:25'),
(63, 28, 'X1uVlaWx2biejXhAytTGvmFI46TRlJDC0Cd96PzoGtdqmNkNvQJZ1YpVcjuKSw9WbD3csOwfKZ3xrsqz7eoOiLYBgnUhF8EB2S7p', '103.42.242.26', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-16 18:40:39', '2024-11-15 18:40:39', '2024-10-16 20:46:37'),
(64, 29, 'ReNaEdDjfEb9qoi3NGBZzkPBx8bYFsjggTxMQiMLrOX7mpIChJqKst2luWe0cCwSHDwy6QY1V31nf98mXuZ2o75OJvtyT6VIH4AP', '2405:8180:803:aa33:ab61:e74c:22ee:598', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-16 18:51:02', '2024-11-15 18:51:02', '2024-10-16 18:52:29'),
(65, 28, 'T7rlEh3aMJtQG2N1hfB3A6eY1zmH0DfcoUDMwPX4ARF5CsgcNxW5rljz9JEpdIC9kjSyvqZOX8IiVsxubK2upKyWweFidTaBQt0U', '103.42.242.26', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-16 19:17:27', '2024-11-15 19:17:27', '2024-10-16 20:10:01'),
(66, 30, 'X69rK2fJg7SvlVuqnddpKjPx5HysXsNE4Y6OmOLGAwlE5bQNy8TqDt0R1t7iUao3JFF0wCnhHpIPZMgjZSzkovBhLi4M8VWB2UcW', '101.255.165.98', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-16 21:47:16', '2024-11-15 21:47:16', '2024-10-16 21:47:44'),
(68, 1, 'zDh07S3KmnsMpbLP9FM6rtkDJN6mscYWdIx8Cr17aflvQejwHGRwq32yeU1G8z4XHBVZBbOtRFjgENPTd5OhvcQJCSlYiLo4KAuy', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-16 21:50:08', '2024-11-15 21:50:08', '2024-10-17 01:29:18'),
(71, 1, 'ZvrIFWXiDCMA2lq6s9RBkUlewVm3vDgnNGLThu1yKPdaG2h7EePHaFjCYOY40SpyJ6SmMHQk1psEf8QWiX8x7BNIbbcdTozx9uLz', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-17 04:40:19', '2024-11-16 04:40:19', '2024-10-17 05:04:40'),
(72, 28, 'QU97564qWTI2AhF2QuL57bfYvga8qhkBG1MGldoaIBXfZUdjA4PjVYKVtHgitDuNC0nleK1eExO0zbysnDcOTvcCSJZppXHsRk63', '103.75.209.194', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-17 06:37:24', '2024-11-16 06:37:24', '2024-10-19 19:40:20'),
(73, 31, 'J86wxPi5BuVbKDKwNxq0hQUs4coH7A1bHfa8ckGt5jR0z6O3i4N3WIELu1sOXPLJeYFUvW7lBoSreCrVpYpTj9ZgmA2tGX9gMnnh', '182.3.141.150', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'Chrome', '127.0.0.0', 'Android', 'Mobile', '2024-10-17 06:44:50', '2024-11-16 06:44:50', '2024-10-17 08:30:57'),
(74, 11, 'SgtHmYMN6FJeGf7hUXciVMy28ZuZ81kDdYlB53SWKw3WTPzdawTkcAItv54oEJQRNrlyCnqO1pDKeIbhfgFLQViEjr6L2zHXUpO7', '125.164.13.176', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-17 06:45:04', '2024-11-16 06:45:04', '2024-10-17 23:55:50'),
(76, 32, 'wvIJYY97IXdBZLxKZyFxccylGjj3qU2KHh4TsJRtdApuQSOLDwGiMbWmUEE1f5sthzoTiCMp5e0Fgr37PVrBnDvSCfkQR66O2b0z', '114.79.1.26', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-17 08:39:58', '2024-11-16 08:39:58', '2024-10-17 10:18:50'),
(77, 1, 'ihkxMYiqzTpMnczCoNlI621radQfA4B9vGI3q8Yo9AFnkTODEfXEwUcu1J5ZgbSSmZOyQmg0HHXjGBl0tLuw7KpRxVVeF5a68Chj', '', 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-17 10:20:32', '2024-11-16 10:20:32', '2024-10-20 07:54:31'),
(81, 33, 'x70DWNm5QcbBQXMEtO6FZTzoeSc4Tiq9G34b3MvefOU1Sp0vqaIJFdNgahLKYwUx2G6dlyIJoPCfRt8zWDgL8C12AhYRumiknAPn', '114.10.47.72', 'user', 'Mozilla/5.0 (Linux; Android 14; en; Infinix X6853 Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.129 HiBrowser/v2.24.1.3 UWS/ Mobile Safari/537.36', 'Chrome', '103.0.5060.129', 'Android', 'Mobile', '2024-10-17 16:19:59', '2024-11-16 16:19:59', '2024-10-19 12:46:18'),
(82, 11, 'iqLgCXjf399YhOGUkhIDFeyH5GriRSuPbv8ZmoKNppuKMV7t2bQ4063Ez2BxQsNBlTn5vPSXZ1yWfgeca4xHMOYlFonEwtkqwmUA', '125.164.13.176', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Chrome', '130.0.0.0', 'Android', 'Mobile', '2024-10-17 16:40:01', '2024-11-16 16:40:01', '2024-10-19 16:00:14'),
(86, 1, 'VldrSPwcOKGNzt5pKj2tk4uS2B9meC6reqI7BnEd1pFJwWbofhPl7Avxi4W5Fo0HQzYigU83D1D9NnfsXTOMksUGu8VaREL0Rx3Z', '', 'admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-17 16:53:19', '2024-11-16 16:53:19', '2024-10-20 05:45:06'),
(87, 34, 'Wjnr8oZs4xciDA8gD9dtcsyrCvw1KBvFSTunXaLWElRJQP7IFRQy52JqubieONfSaEm4dY3X6oTHUMkOI0qzU2A6LY3Ghkxwg159', '114.10.152.65', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', 'Chrome', '125.0.0.0', 'Android', 'Mobile', '2024-10-17 17:04:58', '2024-11-16 17:04:58', '2024-10-17 21:24:24'),
(88, 35, '0Po6I8BM5uW764zx1YVectAydoLr21tQaEquwY3gR9WZjRv7MdDCZND0qSSpUgHHXkkX2nsmf3CApVwFBF5bTLGavzhbf9yslQTh', '36.85.38.114', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Desktop', '2024-10-17 17:06:39', '2024-11-16 17:06:39', '2024-10-17 20:00:05'),
(89, 36, 'cKlaUV2bQWMyySDxNoPAkHAkZreR37X8ZSunXdI9jsvRr4wiOpuBm0cBtDj05MTLPWvzETbaY2hEUz5L8ofIJ46NlhG1JHdVnCge', '140.213.34.201', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', 'Chrome', '125.0.0.0', 'Android', 'Mobile', '2024-10-17 21:10:44', '2024-11-16 21:10:44', '2024-10-17 21:14:54'),
(90, 37, 'YOObKcRG2DEIr3yMA1INiVykMghSE1sUTWqu92vw505wUJZC9f6F8tT6dcsZxVSjFLL4gk8lHm7YR0jAvXePfmppQnWBqtNbexzQ', '180.244.166.106', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-17 22:59:50', '2024-11-16 22:59:50', '2024-10-17 23:01:00'),
(91, 38, 'B4GRMxi7oBa9DH2mzzqNj7NJRZ1JtSCPkK9X4YLLVF3nTIFQancrkbtPud6fEZQpIulcegshhmr1vgfqjx3AlUAOwEXDw0yvT5Kp', '114.10.83.18', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-17 23:37:21', '2024-11-16 23:37:21', '2024-10-17 23:59:10'),
(93, 39, 'PA18olkuY2xaKPr2yteEHuWGNMBR3wFnFMR1DCf5EcsvSgTZjpfIKLxJq96I4lHm8vOt90hQa7dzON4dzbcDZbBJWiow7AYXUjCV', '180.251.87.39', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'Chrome', '127.0.0.0', 'Android', 'Mobile', '2024-10-18 04:08:21', '2024-11-17 04:08:21', '2024-10-18 04:10:54'),
(94, 40, '2BuPfW50YMYVbNOq1IBQwHETsSUamzyop7ovN3gxmnvnru218VCbehdRwlltMR7gFFUzW9TD96Gjk0Q4HCc5h6sP84ZOKtJAXqAp', '114.10.8.24', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 08:39:26', '2024-11-17 08:39:26', '2024-10-18 17:39:47'),
(96, 41, 'HSWggD2AZY0QqXvXlKdcqxP7MbsUrI5yd4jsYumEatP6jEzmzce3vGCVMw8L7eOkwn48IVR3NJoutBlQR9iakTpyFAp0JNBSHfDG', '114.4.213.35', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 09:44:46', '2024-11-17 09:44:46', '2024-10-18 11:54:11'),
(97, 42, '8vgIqSmRJYLu4mq1s4TNCtb5FDXvKoftwLOlcBsR7iVhyUdoOpPn60FeaclWZWhKCEJG23YDwi9uayzr1HQfN06g7QSXUkZBExGA', '36.37.152.146', 'user', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-18 09:55:14', '2024-11-17 09:55:14', '2024-10-20 07:00:38'),
(98, 18, 'TNs6DurcvHWzBq9yZwaXjuteTh5s8Op1jfbpieESMXYRNzFI3KgW01aPxk02nGL2UvPLV4qhYESn8K7mfCtJ3RAc7bUZQ95Q6Bro', '202.67.45.25', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'Chrome', '128.0.0.0', 'Android', 'Mobile', '2024-10-18 10:22:27', '2024-11-17 10:22:27', '2024-10-18 10:24:42'),
(100, 7, 'Wq142LkSfj5put9DFW2cJaVUYGI9TvGbHP433lnijVxM6KbRQrfslcX571MOnoCygzFA0OIPEZ87dmhkDxrYy6gvBBphKEsoeUiu', '178.128.93.60', 'user', 'Mozilla/5.0 (Linux; Android 11; vivo 2007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/87.0.4280.141 Mobile Safari/537.36 VivoBrowser/12.7.2.0', 'Chrome', '87.0.4280.141', 'Android', 'Mobile', '2024-10-18 10:57:55', '2024-11-17 10:57:55', '2024-10-18 11:00:16'),
(102, 7, 'n0Kay9xnFpyTMPUYj21b1kCA7KXBphkjGPe4X4xSNDIaWuZdZYLvQEweqloswGQvbSDzCgJ3MEl6V5sm5qzWRm673hiOBTR8fOA8', '178.128.93.60', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Chrome', '130.0.0.0', 'Android', 'Mobile', '2024-10-18 11:31:06', '2024-11-17 11:31:06', '2024-10-20 01:00:48'),
(103, 44, 'bCthC5nkVmgZ3ocHP6RqL86UYwuw9DtnAW2bjxX1Nc3IkJ2zPFaBHMioUEpMZvlSQQIs0vDB1yqgyO0ehWsJTNKa8A7jVlGf5YEe', '114.5.208.102', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 12:27:20', '2024-11-17 12:27:20', '2024-10-18 12:27:38'),
(104, 45, 'aCpc7PYxQ8TyGkO2qpL1reKnPE1Dda0XgSWqm0FwzjZu3M6OXSb5GyDsjxr3BEJVvVANi48c7dTU5AWQiB2vRt4wChIlubgsNUmR', '140.213.230.42', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', 'Chrome', '126.0.0.0', 'Android', 'Mobile', '2024-10-18 13:53:50', '2024-11-17 13:53:50', '2024-10-18 14:48:47'),
(105, 46, 'bXQ3L1AKSPUL7BtjiIx9P81dgxEQ4z5lN56AIBWF8qkzvoHCimXZ0uOHsae2cY7thMDjTMGpRcgv6qSswpRlNY9JuDn0ZKOWoGeT', '103.157.78.78', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 14:16:25', '2024-11-17 14:16:25', '2024-10-18 14:16:40'),
(106, 47, '24ZsLR9Pcn6VrROh3lgKM5JVHazk8oHzNWGi1SF0dAxqTBeMtcP9UeCvSj6IATxX0dZusNU4W1i7Iryf3bDypb7qwXGlkvYmgBpY', '2001:d08:1380:ae86:edc3:6245:a50c:6d1c', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 14:56:23', '2024-11-17 14:56:23', '2024-10-18 16:01:35'),
(107, 48, 'RtR6BapErx3S8upwX1n2AVhcnXd4gLJIHuYSlP0kZwsbCAfd1H7mygkTxGF5ie0z39PCe2lOUvFULDvQI5fWjaKKZMJBYtQGbsVN', '125.165.82.167', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 14:59:41', '2024-11-17 14:59:41', '2024-10-18 15:01:53'),
(108, 49, 'yMrUtdbsSppYFQdAzbsVRMSiaUKmZgya0cGLeqHF97kQNxTivr8JwmenEkw0u83golXlujOWH2Bx6EOPhCCXL1VI32fDfcWjhnq7', '120.188.7.175', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 15:06:33', '2024-11-17 15:06:33', '2024-10-18 15:08:55'),
(109, 50, 'nxUyo70FLET5pjARZDbuvATLI9YHBaPjRVmslbSeZMi3lMC6h8yJc0Hn3OztBGD4SNKUFvurt5g6pJWwdVXOzxPorQg9cqNefmfW', '140.213.34.104', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-18 15:07:08', '2024-11-17 15:07:08', '2024-10-18 15:07:24'),
(111, 4, 'OeAJN40isbQLYIRBVY7IKo1SBnzPj3RxOzqlGgfjN4vuLwUZgECs69PHu5qeZJFr7fr0WyXWim96F8C2tD2XT3awQ5dmhkvTMoca', '', 'admin', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 17:43:27', '2024-11-17 17:43:27', '2024-10-19 08:45:18'),
(113, 28, '9LkB3YpMozr3JEIatJmC7WxwigNEmNg0Cz0B5yDlPbGp1kUITdSr8YjlqZso2cTR1K2X7O5OHQ8WPAcLGifDwZebhdXRUAn9SeQt', '103.42.242.26', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 20:49:51', '2024-11-17 20:49:51', '2024-10-19 18:12:54'),
(114, 52, 'd1ICs2M7trezK1xPH7j6ACilgljJz4bm0tTEqvdYL06v8mrf28ZVbTUXG3unJ3wORURYSOfND5hQkLw4ScFWohI5pGBxqVyeEMkN', '114.124.206.34', 'user', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_8_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.8.3 Mobile/19H386 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-18 22:23:15', '2024-11-17 22:23:15', '2024-10-19 08:24:38'),
(117, 53, 'JhiRHpG89cu7SsO101IxlpES5k93l4wTk63TdNNzQ2bOzuDY8fvtKAneLnrZDw5mEFiofajXPrFohV02VdACWcvBqagetjPJXqy7', '2400:9800:141:dc4d:1:0:415b:b6d3', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.18.0-gn', 'Chrome', '123.0.6312.118', 'Android', 'Mobile', '2024-10-18 22:55:26', '2024-11-17 22:55:26', '2024-10-18 22:57:21'),
(118, 54, 'pHtVQMIyZXJKftBBv1ajIfPqJpYVxhnbk9OQr4d6wTv8zsUFKD7nSE9gA1yrl53oDC625icUwuGHLClkGXuaN83qdSmLZgMhOARP', '112.215.224.149', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-18 23:02:44', '2024-11-17 23:02:44', '2024-10-19 00:50:50'),
(119, 55, 'mI1BTrn4OT30RdkbcyBoM9ZiksQRqMwP3QVaS6pgWtLm2UlL0g7Xf2Fe6Nv58VIne4KsxCNHphcA5YtfGo7blhGwjXPaxZJDdyK9', '182.1.6.247', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 01:08:14', '2024-11-18 01:08:14', '2024-10-19 01:10:23'),
(120, 56, 'W09tc5dTUt3liphBMlyBR9iTs4VJD8QOhnjICCGF6EORUn1sW7KxqSwAfYHy5kaommGAexbr7Hz2dvcLN2Q8zbXDV1qXMKePuJpE', '114.79.3.141', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 01:54:21', '2024-11-18 01:54:21', '2024-10-19 13:15:20'),
(121, 2, 'GYJ4NldWgfEpOy08iBN80PGu3IQC9vHXQ2VdxPUHshMbMOeatzWFBL7cJS3tpxkYkow6ViT4jRf2qmCvrbLzlRyjcg5DXKSas6ew', '112.215.200.97', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 01:58:46', '2024-11-18 01:58:46', '2024-10-20 08:05:47'),
(122, 2, '20fUPfC8JTZyNLqElGM3dXFRd4YHrHspT8xOSiQnADJ2V7FGZh0vU3NKwzx5ejWmh1ncw7X61eD6KIa4vV9EaYtWgtLulmPRujkq', '2001:448a:404c:1e38:142b:7dde:9ef3:75d0', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Chrome', '129.0.0.0', 'Windows 10', 'Desktop', '2024-10-19 02:01:46', '2024-11-18 02:01:46', '2024-10-20 08:11:25'),
(123, 57, 'TR5rqfusXhZESc7qkpWFbizeupc5Y940FGTlbjVh8vHdJzdOL3aws6xgiyvXNgMwZlI01OQmEHnrknK1xoAN7QjtDBJ9RS26LtIe', '103.158.121.171', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 03:03:00', '2024-11-18 03:03:00', '2024-10-19 03:05:17'),
(124, 58, 'zuR5PU19hgpYrCyBvLnpTSXP7YLSF9f7xI6CWJgfwOz40KQk8D2iO3e1bQUoAseBoFnjc30DJA6HskvrNGGq5qwbZhIaHXlajWdu', '114.125.220.233', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 12:00:34', '2024-11-18 12:00:34', '2024-10-19 12:49:54'),
(126, 1, 'j46Npp9FLNLMimJ5agKVAJxnQqhWhWUa8FSqg7yOY2r5OzlfPXj8orIbBkv7w9UT4M36Kcbui3zRc0nmCHsPEwGloSekAsHGDD2V', '', 'admin', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-19 13:10:03', '2024-11-18 13:10:03', '2024-10-20 03:19:20'),
(127, 59, 'Z29nvkdesur34wYRR1eiJK1NFItQizaykBL6Pjc02SvK8bM4fXQcYt5H8qyHVEMgr5wEhgbnxl7GaUADVhC79o3TmAOJpfDFSuqG', '101.255.165.234', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-19 14:01:27', '2024-11-18 14:01:27', '2024-10-19 15:43:48'),
(128, 2, 'fSgSyyQPGcvOvZYtDc2ZNdNYeGlrAMbhuQLBgm7e6ERDkA07aoE9KBjX4sws4z3jJlh5KzF1mTCoWdw3HiWaRuq2bPIM1n6tn859', '2001:448a:404c:1e38:7575:1a31:a0c6:e2da', 'user', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Safari', '604.1', 'iOS', 'Mobile', '2024-10-19 17:11:04', '2024-11-18 17:11:04', '2024-10-20 04:46:50'),
(129, 7, 'rCAChS25VcWoGSkNd0ZirIsAu9j7lbnMK2Pkvig3jLmLpuWeXgKaUqfxBsQI7ZDFGolVOzx815QMhYvtn8NRyEEB6wRU0XOfeP3D', '178.128.93.60', 'user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0', 'Opera', '114.0.0.0', 'Windows 10', 'Desktop', '2024-10-19 19:38:21', '2024-11-18 19:38:21', '2024-10-19 22:47:33'),
(130, 60, 'RoDJbuYlCBi3bJsfmFHQNeT4UjBQNM0WzipFVyPRtIeXOzDSsKUZh3jYn5KT1g126GrLlCaV0MInkAq5t6SL7ur29pycaoWxxEAX', '140.213.127.224', 'user', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Chrome', '129.0.0.0', 'Android', 'Mobile', '2024-10-20 05:25:54', '2024-11-19 05:25:54', '2024-10-20 06:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `custom_price`
--

CREATE TABLE `custom_price` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `custom_price`
--

INSERT INTO `custom_price` (`id`, `user_id`, `service_id`, `price`, `profit`) VALUES
(1, 40, 30, 46000, 500);

-- --------------------------------------------------------

--
-- Table structure for table `custom_statistic`
--

CREATE TABLE `custom_statistic` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `custom_statistic`
--

INSERT INTO `custom_statistic` (`id`, `name`, `value`, `type`) VALUES
(1, 'total_user', '55', 'total'),
(2, 'total_deposit', '89000', 'total'),
(3, 'total_order', '17', 'total'),
(4, 'total_admin_online', '5', 'online'),
(5, 'total_user_online', '978', 'online'),
(6, 's_top_order_1', '1', 'top_order'),
(7, 'u_top_order_1', 'juli1234 ', 'top_order'),
(8, 'a_top_order_1', '350.000', 'top_order'),
(9, 'c_top_order_1', '365.000', 'top_order'),
(10, 's_top_order_2', '0', 'top_order'),
(11, 's_top_order_3', '0', 'top_order'),
(12, 's_top_order_4', '0', 'top_order'),
(13, 's_top_order_5', '0', 'top_order'),
(14, 's_top_order_6', '0', 'top_order'),
(15, 's_top_order_7', '0', 'top_order'),
(16, 's_top_order_8', '0', 'top_order'),
(17, 's_top_order_9', '0', 'top_order'),
(18, 's_top_order_10', '0', 'top_order'),
(19, 's_top_deposit_1', '1', 'top_deposit'),
(20, 'u_top_deposit_1', 'reyblek789', 'top_deposit'),
(21, 'a_top_deposit_1', '350000', 'top_deposit'),
(22, 'c_top_deposit_1', '365000', 'top_deposit'),
(23, 's_top_deposit_2', '1', 'top_deposit'),
(24, 's_top_deposit_3', '0', 'top_deposit'),
(25, 's_top_deposit_4', '0', 'top_deposit'),
(26, 's_top_deposit_5', '0', 'top_deposit'),
(27, 's_top_deposit_6', '0', 'top_deposit'),
(28, 's_top_deposit_7', '0', 'top_deposit'),
(29, 's_top_deposit_8', '0', 'top_deposit'),
(30, 's_top_deposit_9', '0', 'top_deposit'),
(31, 's_top_deposit_10', '0', 'top_deposit'),
(32, 'u_top_deposit_2', 'brwccdone', 'top_deposit'),
(33, 'a_top_deposit_2', '150000', 'top_deposit'),
(34, 'c_top_deposit_2', '300000', 'top_deposit');

-- --------------------------------------------------------

--
-- Table structure for table `database_instagram`
--

CREATE TABLE `database_instagram` (
  `id` int(11) NOT NULL,
  `username` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `user_id` varchar(111) NOT NULL,
  `session_id` varchar(111) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `result` text DEFAULT NULL,
  `reference` varchar(111) NOT NULL,
  `additional_data` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `user_id`, `deposit_method_id`, `type`, `amount`, `balance`, `status`, `phone_number`, `result`, `reference`, `additional_data`, `created_at`, `updated_at`) VALUES
(7, 1, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":2982895,\"unique_code\":\"R5FV6SK9PZ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-08 20:44:24\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114100813580805340609PD29828950703A010804POSP63046857\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=R5FV6SK9PZ&merchant=3853\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvRlU1czBVMllsUjFJbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvRlU1czBVMllsUjFJbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvRlU1czBVMllsUjFJbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvRlU1czBVMllsUjFJbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-08 17:44:24\"}', 'R5FV6SK9PZ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=R5FV6SK9PZ&merchant=3853', '2024-10-08 17:44:24', '2024-10-08 17:44:50'),
(8, 1, 1, '', 202, 200, 'Canceled', NULL, '{\"pay_id\":2982926,\"unique_code\":\"Y6WB4IL8OE\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":202,\"balance\":200,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-08 20:46:18\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054032025802ID5909Paydisini6006SERANG61051573062460114100813580902320609PD29829260703A010804POSP630407EC\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=Y6WB4IL8OE&merchant=3853\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlVMFQ0d1VTMEkwVjJrbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVMFQ0d1VTMEkwVjJrbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVMFQ0d1VTMEkwVjJrbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVMFQ0d1VTMEkwVjJrbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-08 17:46:18\"}', 'Y6WB4IL8OE', 'https://paydisini.co.id/payment/qrcode.php?unique_code=Y6WB4IL8OE&merchant=3853', '2024-10-08 17:46:18', '2024-10-08 17:47:14'),
(4549, 1, 1, '', 504, 500, 'Canceled', NULL, '{\"pay_id\":3014571,\"unique_code\":\"IVUF1OPN8G\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":504,\"balance\":500,\"fee\":4,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-10 02:57:49\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054035045802ID5909Paydisini6006SERANG61051573062460114100913660845080609PD30145710703A010804POSP630435B1\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=IVUF1OPN8G&merchant=3853\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmljRU9PQjFUeFlVVldsa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmljRU9PQjFUeFlVVldsa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmljRU9PQjFUeFlVVldsa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmljRU9PQjFUeFlVVldsa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-09 23:57:49\"}', 'IVUF1OPN8G', 'https://paydisini.co.id/payment/qrcode.php?unique_code=IVUF1OPN8G&merchant=3853', '2024-10-09 23:57:49', '2024-10-10 03:00:05'),
(4550, 1, 1, '', 5035, 5000, 'Canceled', NULL, '{\"pay_id\":3086096,\"unique_code\":\"KOAVNWLHS5\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-13 05:19:46\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101313850089830609PD30860960703A010804POSP6304FA71\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=KOAVNWLHS5&merchant=3853\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlVelVJeDBWT1pWUVB0a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVelVJeDBWT1pWUVB0a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVelVJeDBWT1pWUVB0a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVelVJeDBWT1pWUVB0a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlNVE40TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-13 02:19:46\"}', 'KOAVNWLHS5', 'https://paydisini.co.id/payment/qrcode.php?unique_code=KOAVNWLHS5&merchant=3853', '2024-10-13 02:19:46', '2024-10-13 05:20:07'),
(4551, 2, 1, '', 10070, 10000, 'Canceled', NULL, '{\"pay_id\":3128958,\"unique_code\":\"4ITR01QLC5\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":10070,\"balance\":10000,\"fee\":70,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 08:51:38\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME5204549953033605405100705802ID5909Paydisini6006SERANG61051573062460114101513969709140609PD31289580703A010804POSP6304DB82\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=4ITR01QLC5&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlVelFNRlZNd0lGVkpSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVelFNRlZNd0lGVkpSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVelFNRlZNd0lGVkpSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVelFNRlZNd0lGVkpSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 05:51:38\"}', '4ITR01QLC5', 'https://paydisini.co.id/payment/qrcode.php?unique_code=4ITR01QLC5&merchant=3995', '2024-10-15 05:51:38', '2024-10-15 05:52:28'),
(4552, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3128965,\"unique_code\":\"OPVSA7E5QG\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 08:52:45\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101513969722040609PD31289650703A010804POSP6304B4C3\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=OPVSA7E5QG&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmljVVUxVTBOQk5sVlE5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmljVVUxVTBOQk5sVlE5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmljVVUxVTBOQk5sVlE5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmljVVUxVTBOQk5sVlE5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 05:52:45\"}', 'OPVSA7E5QG', 'https://paydisini.co.id/payment/qrcode.php?unique_code=OPVSA7E5QG&merchant=3995', '2024-10-15 05:52:45', '2024-10-15 05:53:17'),
(4553, 3, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3129721,\"unique_code\":\"4C2VDHO7FQ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 10:44:24\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101513971331060609PD31297210703A010804POSP63045AB0\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=4C2VDHO7FQ&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlFbFIzOEVTRVpsTURSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlFbFIzOEVTRVpsTURSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlFbFIzOEVTRVpsTURSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlFbFIzOEVTRVpsTURSakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 07:44:24\"}', '4C2VDHO7FQ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=4C2VDHO7FQ&merchant=3998', '2024-10-15 07:44:24', '2024-10-15 07:45:02'),
(4554, 13, 1, '', 10070, 10000, 'Canceled', NULL, '{\"pay_id\":3131457,\"unique_code\":\"1ULZG68VPY\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":10070,\"balance\":10000,\"fee\":70,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 13:10:48\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME5204549953033605405100705802ID5909Paydisini6006SERANG61051573062460114101513975205460609PD31314570703A010804POSP6304B7E1\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=1ULZG68VPY&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlrRlVXaGpOSHBGVFZGakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlrRlVXaGpOSHBGVFZGakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlrRlVXaGpOSHBGVFZGakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlrRlVXaGpOSHBGVFZGakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 10:10:47\"}', '1ULZG68VPY', 'https://paydisini.co.id/payment/qrcode.php?unique_code=1ULZG68VPY&merchant=3998', '2024-10-15 10:10:47', '2024-10-15 10:11:12'),
(4555, 2, 1, '', 102, 100, 'Canceled', NULL, '{\"pay_id\":3131504,\"unique_code\":\"FA0ZQD5WE4\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 13:13:37\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101513975297730609PD31315040703A010804POSP6304948C\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=FA0ZQD5WE4&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlRVFJYVkRSUnBGTUJaa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlRVFJYVkRSUnBGTUJaa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlRVFJYVkRSUnBGTUJaa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlRVFJYVkRSUnBGTUJaa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 10:13:37\"}', 'FA0ZQD5WE4', 'https://paydisini.co.id/payment/qrcode.php?unique_code=FA0ZQD5WE4&merchant=3998', '2024-10-15 10:13:37', '2024-10-15 10:13:37'),
(4556, 14, 1, '', 50350, 50000, 'Canceled', NULL, '{\"pay_id\":3131542,\"unique_code\":\"OT0J2I5WPZ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":50350,\"balance\":50000,\"fee\":350,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 13:15:59\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME5204549953033605405503505802ID5909Paydisini6006SERANG61051573062460114101513975378200609PD31315420703A010804POSP630437F9\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=OT0J2I5WPZ&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvRlVYVlRTeW9FTVU5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvRlVYVlRTeW9FTVU5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvRlVYVlRTeW9FTVU5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvRlVYVlRTeW9FTVU5a0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 10:15:59\"}', 'OT0J2I5WPZ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=OT0J2I5WPZ&merchant=3998', '2024-10-15 10:15:59', '2024-10-15 10:16:12'),
(4557, 15, 1, '', 5035, 5000, 'Success', NULL, '{\"pay_id\":3131829,\"unique_code\":\"VCM3HBGX9Z\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-15 13:35:10\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101513976045530609PD31318290703A010804POSP63040F1E\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=VCM3HBGX9Z&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvVk9ZZGtRSU5UVERabEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvVk9ZZGtRSU5UVERabEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvVk9ZZGtRSU5UVERabEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvVk9ZZGtRSU5UVERabEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-15 10:35:10\"}', 'VCM3HBGX9Z', 'https://paydisini.co.id/payment/qrcode.php?unique_code=VCM3HBGX9Z&merchant=3998', '2024-10-15 10:35:10', '2024-10-15 10:36:02'),
(4558, 11, 1, '', 5035, 5000, 'Success', NULL, '{\"pay_id\":3154890,\"unique_code\":\"2IHM39G6SA\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-16 10:44:56\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101614021055550609PD31548900703A010804POSP63042D00\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=2IHM39G6SA&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlFMFUyY1VPejBFU0pKakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlFMFUyY1VPejBFU0pKakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlFMFUyY1VPejBFU0pKakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlFMFUyY1VPejBFU0pKakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-16 07:44:56\"}', '2IHM39G6SA', 'https://paydisini.co.id/payment/qrcode.php?unique_code=2IHM39G6SA&merchant=3998', '2024-10-16 07:44:56', '2024-10-16 13:18:21'),
(4559, 2, 1, '', 5035, 5000, 'Canceled', NULL, '{\"pay_id\":3163783,\"unique_code\":\"0J1PHB59AZ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-16 20:30:52\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101614041816710609PD31637830703A010804POSP6304ADFD\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=0J1PHB59AZ&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvVlE1VWpRSUJWTUtCakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvVlE1VWpRSUJWTUtCakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvVlE1VWpRSUJWTUtCakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvVlE1VWpRSUJWTUtCakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-16 17:30:52\"}', '0J1PHB59AZ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=0J1PHB59AZ&merchant=3995', '2024-10-16 17:30:52', '2024-10-16 17:31:24'),
(4560, 28, 3, '', 5150, 5000, 'Success', NULL, '{\"pay_id\":3165278,\"unique_code\":\"HT4QD1BPJ3\",\"service\":\"13\",\"service_name\":\"DANA\",\"amount\":5150,\"balance\":5000,\"fee\":150,\"note\":\"Deposit - DANA\",\"status\":\"Pending\",\"expired\":\"2024-10-16 21:43:36\",\"checkout_url_beta\":\"https:\\/\\/m.dana.id\\/n\\/cashier\\/new\\/checkout?bizNo=20241016111212800110166380219539062&timestamp=1729079018218&originSourcePlatform=IPG&mid=216620000395347211893&did=216650000740420918892&sign=XGzx6XKDCdwcffrgoZblxQOnzOB6eFlGf%2FPSJbnZNAkoYbiii31zKjIjuvLMPoeRC9aPbiEsu8CoNBlVlts6yjfF5642S%2BVEIlAr7rBPpzYqIqAdTAkLb%2FtdTEhVOhnRx7x6JBXb59Kz1QGnc1rlSooVgnYsinHy1UrA3TjAMwDAiJrIHrKcfoAMUk%2Fa4bQjak6XnIJ6S%2F7%2BDoBJPX3XUuXAqRcPbp%2B5C7hrSrMjQnGqlbwMYRlbL%2FYh88vy0B8f8xHZu%2FzcHdqRQLRqqVOh%2FzAyS7wIvD2MzxmU4tlJemqFcG0c1SNKWFbOulFMRqSJKhLyIlHhUI%2BLVBTVNVzPjQ%3D%3D&forceToH5=false\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlNalNRSlVNRUZGTlVoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlNalNRSlVNRUZGTlVoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlNalNRSlVNRUZGTlVoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-16 18:43:36\"}', 'HT4QD1BPJ3', NULL, '2024-10-16 18:43:36', '2024-10-16 18:46:42'),
(4561, 3, 1, '', 5035, 5000, 'Canceled', NULL, '{\"pay_id\":3171915,\"unique_code\":\"GQ1D9SKABX\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 02:56:42\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101614063291770609PD31719150703A010804POSP630408F3\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=GQ1D9SKABX&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlnbFFCdDBVNVFVTVJka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlnbFFCdDBVNVFVTVJka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlnbFFCdDBVNVFVTVJka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlnbFFCdDBVNVFVTVJka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-16 23:56:42\"}', 'GQ1D9SKABX', 'https://paydisini.co.id/payment/qrcode.php?unique_code=GQ1D9SKABX&merchant=3995', '2024-10-16 23:56:42', '2024-10-17 00:10:26'),
(4562, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3174013,\"unique_code\":\"ACR3T8EHIJ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 07:16:00\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714069640610609PD31740130703A010804POSP63044FEB\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=ACR3T8EHIJ&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvVVNJVkVPVU5qVURGa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvVVNJVkVPVU5qVURGa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvVVNJVkVPVU5qVURGa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvVVNJVkVPVU5qVURGa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 04:16:00\"}', 'ACR3T8EHIJ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=ACR3T8EHIJ&merchant=3995', '2024-10-17 04:16:00', '2024-10-17 04:20:23'),
(4563, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3174035,\"unique_code\":\"YV5J7LG18F\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 07:21:39\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714069710330609PD31740350703A010804POSP6304F6E8\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=YV5J7LG18F&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlZRU94Y0VUM29VTldsbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlZRU94Y0VUM29VTldsbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlZRU94Y0VUM29VTldsbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlZRU94Y0VUM29VTldsbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 04:21:39\"}', 'YV5J7LG18F', 'https://paydisini.co.id/payment/qrcode.php?unique_code=YV5J7LG18F&merchant=3995', '2024-10-17 04:21:38', '2024-10-17 04:24:53'),
(4564, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3174047,\"unique_code\":\"WC1FPR2E9K\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 07:25:17\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714069752400609PD31740470703A010804POSP63049DBD\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=WC1FPR2E9K&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlzVU9GSmpVUVpVTURkbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlzVU9GSmpVUVpVTURkbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlzVU9GSmpVUVpVTURkbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlzVU9GSmpVUVpVTURkbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 04:25:17\"}', 'WC1FPR2E9K', 'https://paydisini.co.id/payment/qrcode.php?unique_code=WC1FPR2E9K&merchant=3995', '2024-10-17 04:25:17', '2024-10-17 04:45:04'),
(4565, 2, 1, '', 100, 100, 'Canceled', NULL, '-', '', '-', '2024-10-17 04:46:07', '2024-10-17 04:46:30'),
(4566, 2, 1, '', 100, 100, 'Canceled', NULL, '-', '', '-', '2024-10-17 04:48:42', '2024-10-17 04:50:43'),
(4567, 2, 1, '', 100, 100, 'Canceled', NULL, '-', '', '-', '2024-10-17 04:50:56', '2024-10-17 04:54:25'),
(4568, 2, 1, '', 100, 100, 'Canceled', NULL, '-', '', '-', '2024-10-17 04:54:38', '2024-10-17 05:04:40'),
(4570, 3, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3180629,\"unique_code\":\"34GP0YNQSJ\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 17:19:26\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714084992400609PD31806290703A010804POSP63044058\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=34GP0YNQSJ&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlvMFVSNVVXd0ExUjBNakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlvMFVSNVVXd0ExUjBNakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlvMFVSNVVXd0ExUjBNakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlvMFVSNVVXd0ExUjBNakk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 14:19:26\"}', '34GP0YNQSJ', 'https://paydisini.co.id/payment/qrcode.php?unique_code=34GP0YNQSJ&merchant=3995', '2024-10-17 14:19:26', '2024-10-17 14:27:51'),
(4571, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3181059,\"unique_code\":\"HOC89L4TY2\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 17:48:09\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714086132950609PD31810590703A010804POSP6304A490\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=HOC89L4TY2&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlJVFdVUkRUNWd6UVBoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlJVFdVUkRUNWd6UVBoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlJVFdVUkRUNWd6UVBoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlJVFdVUkRUNWd6UVBoa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 14:48:09\"}', 'HOC89L4TY2', 'https://paydisini.co.id/payment/qrcode.php?unique_code=HOC89L4TY2&merchant=3995', '2024-10-17 14:48:09', '2024-10-17 16:14:28'),
(4572, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3182417,\"unique_code\":\"V7AOXU0R8D\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 19:14:49\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714089562800609PD31824170703A010804POSP63046B19\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=V7AOXU0R8D&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlRRU9TQlRWWTlVUTNZbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlRRU9TQlRWWTlVUTNZbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlRRU9TQlRWWTlVUTNZbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlRRU9TQlRWWTlVUTNZbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 16:14:49\"}', 'V7AOXU0R8D', 'https://paydisini.co.id/payment/qrcode.php?unique_code=V7AOXU0R8D&merchant=3995', '2024-10-17 16:14:49', '2024-10-17 16:15:37'),
(4573, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3182613,\"unique_code\":\"SEDRYWNH70\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 19:28:26\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714090151100609PD31826130703A010804POSP6304FE31\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=SEDRYWNH70&merchant=3995\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlBek5JNTBWWkpGUkZObEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlBek5JNTBWWkpGUkZObEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlBek5JNTBWWkpGUkZObEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlBek5JNTBWWkpGUkZObEk2SVNaazkyWWZWV2R4bG1iMUpDTGlVVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 16:28:26\"}', 'SEDRYWNH70', 'https://paydisini.co.id/payment/qrcode.php?unique_code=SEDRYWNH70&merchant=3995', '2024-10-17 16:28:25', '2024-10-17 16:29:04'),
(4574, 2, 1, '', 102, 100, 'Success', NULL, '{\"pay_id\":3183031,\"unique_code\":\"9OGQUA2MK3\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":102,\"balance\":100,\"fee\":2,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-17 19:54:47\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME52045499530336054031025802ID5909Paydisini6006SERANG61051573062460114101714091286120609PD31830310703A010804POSP63042758\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=9OGQUA2MK3&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlNelNOSlRRVkYxUlBsakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlNelNOSlRRVkYxUlBsakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlNelNOSlRRVkYxUlBsakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlNelNOSlRRVkYxUlBsakk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 16:54:47\"}', '9OGQUA2MK3', 'https://paydisini.co.id/payment/qrcode.php?unique_code=9OGQUA2MK3&merchant=3998', '2024-10-17 16:54:47', '2024-10-17 16:55:22'),
(4575, 35, 3, '', 51500, 50000, 'Success', NULL, '{\"pay_id\":3184445,\"unique_code\":\"RMCSQV45GE\",\"service\":\"13\",\"service_name\":\"DANA\",\"amount\":51500,\"balance\":50000,\"fee\":1500,\"note\":\"Deposit - DANA\",\"status\":\"Pending\",\"expired\":\"2024-10-17 21:12:22\",\"checkout_url_beta\":\"https:\\/\\/m.dana.id\\/n\\/cashier\\/new\\/checkout?bizNo=20241017111212800110166985419423787&timestamp=1729163552638&originSourcePlatform=IPG&mid=216620000395347211893&did=216650000740420918892&sign=xVwL7KyUaJNt%2Fv4SBQRucMoZn6dyzRHwFoeHTULIlet1M9sqF3BMHGlXZ6HqUt5ZaQeVUG6RAAwnw2lt%2FgqQHYEllcirKCZ7cXOBJ8jIJILXZb2KFki7iLchsk2poFQWeJ9G9EhE3FdGyVDstCm3v%2FqbsuS1X2QqDwtt%2FyyxfSVb5dLJ3WGAz4bv6Mz8o3HjYZ5r%2BkqgSv14zFMhGatgflEkZ0ka0KqgBkXm%2FyyinsU7V3Rp6UkM85ff6fEm7EeQqR%2FBXDLytt73NbWfhfR2rRNoCqigABdG7hEc6Ur6vglAOWKxLcU1ROC52eyyu9BzpEl5mChXmKyoHjsr4Ft9cQ%3D%3D&forceToH5=false\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVMFIxUWpWUk4xUU5KbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVMFIxUWpWUk4xUU5KbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVMFIxUWpWUk4xUU5KbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-17 18:12:22\"}', 'RMCSQV45GE', NULL, '2024-10-17 18:12:21', '2024-10-17 18:15:08'),
(4576, 2, 1, '', 1007, 1300, 'Canceled', NULL, '{\"pay_id\":3202558,\"unique_code\":\"B7LTDJ284U\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":1007,\"balance\":1000,\"fee\":7,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-18 17:17:49\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540410075802ID5909Paydisini6006SERANG61051573062460114101814140149110609PD32025580703A010804POSP6304DB57\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=B7LTDJ284U&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlVRk40SWpTRVJGVDNJa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVRk40SWpTRVJGVDNJa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVRk40SWpTRVJGVDNJa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVRk40SWpTRVJGVDNJa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 14:17:49\"}', 'B7LTDJ284U', 'https://paydisini.co.id/payment/qrcode.php?unique_code=B7LTDJ284U&merchant=3998', '2024-10-18 14:17:49', '2024-10-18 15:14:13'),
(4577, 2, 1, '', 1007, 1300, 'Canceled', NULL, '{\"pay_id\":3203943,\"unique_code\":\"DK71RWANGI\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":1007,\"balance\":1000,\"fee\":7,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-18 18:15:34\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540410075802ID5909Paydisini6006SERANG61051573062460114101814142015330609PD32039430703A010804POSP630476F1\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=DK71RWANGI&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlrMFJPRjBWU0Z6TkxSa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlrMFJPRjBWU0Z6TkxSa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlrMFJPRjBWU0Z6TkxSa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlrMFJPRjBWU0Z6TkxSa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 15:15:34\"}', 'DK71RWANGI', 'https://paydisini.co.id/payment/qrcode.php?unique_code=DK71RWANGI&merchant=3998', '2024-10-18 15:15:34', '2024-10-18 15:16:24'),
(4578, 3, 1, '', 1007, 1300, 'Canceled', NULL, '{\"pay_id\":3204016,\"unique_code\":\"ZKWBAIN56F\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":1007,\"balance\":1000,\"fee\":7,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-18 18:17:50\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540410075802ID5909Paydisini6006SERANG61051573062460114101814142081450609PD32040160703A010804POSP63043806\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=ZKWBAIN56F&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlZa04xNFVTQkowVkxwbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlZa04xNFVTQkowVkxwbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlZa04xNFVTQkowVkxwbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlZa04xNFVTQkowVkxwbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 15:17:50\"}', 'ZKWBAIN56F', 'https://paydisini.co.id/payment/qrcode.php?unique_code=ZKWBAIN56F&merchant=3998', '2024-10-18 15:17:50', '2024-10-18 15:18:11'),
(4579, 7, 1, '', 11077, 14300, 'Success', NULL, '{\"pay_id\":3204022,\"unique_code\":\"S9WYQF2MHE\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":11077,\"balance\":11000,\"fee\":77,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-18 18:18:05\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME5204549953033605405110775802ID5909Paydisini6006SERANG61051573062460114101814142089690609PD32040220703A010804POSP63042941\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=S9WYQF2MHE&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlVRVNOSmpSUmwxVjVNbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlVRVNOSmpSUmwxVjVNbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlVRVNOSmpSUmwxVjVNbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlVRVNOSmpSUmwxVjVNbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 15:18:05\"}', 'S9WYQF2MHE', 'https://paydisini.co.id/payment/qrcode.php?unique_code=S9WYQF2MHE&merchant=3998', '2024-10-18 15:18:05', '2024-10-18 15:19:40'),
(4580, 2, 1, '', 5035, 6500, 'Canceled', NULL, '{\"pay_id\":3212184,\"unique_code\":\"JSU31K7WGP\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-18 23:20:44\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101814152296840609PD32121840703A010804POSP6304269C\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=JSU31K7WGP&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlBMVJYZHpTeE1UVlRwa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlBMVJYZHpTeE1UVlRwa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlBMVJYZHpTeE1UVlRwa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlBMVJYZHpTeE1UVlRwa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 20:20:44\"}', 'JSU31K7WGP', 'https://paydisini.co.id/payment/qrcode.php?unique_code=JSU31K7WGP&merchant=3998', '2024-10-18 20:20:44', '2024-10-18 20:20:51'),
(4581, 28, 3, '', 10300, 13000, 'Success', NULL, '{\"pay_id\":3213328,\"unique_code\":\"XZKSHEICYT\",\"service\":\"13\",\"service_name\":\"DANA\",\"amount\":10300,\"balance\":10000,\"fee\":300,\"note\":\"Deposit - DANA\",\"status\":\"Pending\",\"expired\":\"2024-10-18 23:50:25\",\"checkout_url_beta\":\"https:\\/\\/m.dana.id\\/n\\/cashier\\/new\\/checkout?bizNo=20241018111212800110166311819888319&timestamp=1729259427282&originSourcePlatform=IPG&mid=216620000395347211893&did=216650000740420918892&sign=AD5ftTnSvulDoXNNUlV516XnI1AcJRBcHyLX%2F3aQER8a%2Fcpl9EIfizARnjUwyVVnpUPlGgUjGhua6aDBNy%2B4YFTtbmDUGYCsTjlQjbKQeCDAUkQ1Er7fgc1AvBGve0buXma6tkVrfJyQXMQ05kE36ZR0hAbOAwY9kHD42Vo95Uv4roEZdGSP5V6uRbYIOhKm%2BRGhEKQf6%2BB38Aq3k22Ox6eyLxDRkbCg5xSNo55sYGT%2FT%2FGpBradbP7Hp8Ot2mxEnNHW6DN8D231DSVRryo9RJFISxXt6qobooCzofAjYHtBrdt6XqR9zIxiAUem1jro3cM1nnuWHbATJfgMpyBvZQ%3D%3D&forceToH5=false\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlRVldEbFVSSU4xU2FobEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlRVldEbFVSSU4xU2FobEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlRVldEbFVSSU4xU2FobEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-18 20:50:25\"}', 'XZKSHEICYT', NULL, '2024-10-18 20:50:25', '2024-10-18 20:51:11'),
(4582, 2, 1, '', 10070, 12000, 'Canceled', NULL, '{\"pay_id\":3233582,\"unique_code\":\"PAVXU4Q51F\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":10070,\"balance\":10000,\"fee\":70,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-19 18:35:23\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME5204549953033605405100705802ID5909Paydisini6006SERANG61051573062460114101914182385000609PD32335820703A010804POSP63042832\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=PAVXU4Q51F&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlZVU0xRUZOVmhsVkJCbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlZVU0xRUZOVmhsVkJCbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlZVU0xRUZOVmhsVkJCbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlZVU0xRUZOVmhsVkJCbEk2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-19 15:35:23\"}', 'PAVXU4Q51F', 'https://paydisini.co.id/payment/qrcode.php?unique_code=PAVXU4Q51F&merchant=3998', '2024-10-19 15:35:23', '2024-10-19 15:35:30'),
(4583, 2, 1, '', 5035, 6000, 'Canceled', NULL, '{\"pay_id\":3233604,\"unique_code\":\"BLZS0OHFET\",\"service\":\"11\",\"service_name\":\"QRIS Merchant PayDisini\",\"amount\":5035,\"balance\":5000,\"fee\":35,\"type_fee\":\"1\",\"note\":\"Deposit - QRIS\",\"status\":\"Pending\",\"expired\":\"2024-10-19 18:35:48\",\"qr_content\":\"00020101021226670016COM.NOBUBANK.WWW01189360050300000898240214545313001686520303UME51440014ID.CO.QRIS.WWW0215ID20232997650570303UME520454995303360540450355802ID5909Paydisini6006SERANG61051573062460114101914182402800609PD32336040703A010804POSP6304F160\",\"qrcode_url\":\"https:\\/\\/paydisini.co.id\\/payment\\/qrcode.php?unique_code=BLZS0OHFET&merchant=3998\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlRVlJHaDBUd01sV01Ka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlRVlJHaDBUd01sV01Ka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlRVlJHaDBUd01sV01Ka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlRVlJHaDBUd01sV01Ka0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-19 15:35:48\"}', 'BLZS0OHFET', 'https://paydisini.co.id/payment/qrcode.php?unique_code=BLZS0OHFET&merchant=3998', '2024-10-19 15:35:48', '2024-10-19 15:36:42'),
(4584, 59, 7, '', 14900, 11000, 'Success', NULL, '{\"pay_id\":3233849,\"unique_code\":\"FMPKGARBN5\",\"service\":\"1\",\"service_name\":\"Virtual Account Bank BCA\",\"amount\":14900,\"balance\":10000,\"fee\":4900,\"note\":\"Deposit - Virtual Account Bank BCA\",\"status\":\"Pending\",\"expired\":\"2024-10-19 18:42:57\",\"virtual_account\":\"12173241195658002\",\"checkout_url_beta\":\"https:\\/\\/paydisini.co.id\\/payment\\/?info=PT1RZmlValRDSlZRSHRFVU5aa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url\":\"https:\\/\\/payment.paydisini.co.id\\/v1\\/?info=PT1RZmlValRDSlZRSHRFVU5aa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v2\":\"https:\\/\\/payment.paydisini.co.id\\/v2\\/?info=PT1RZmlValRDSlZRSHRFVU5aa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"checkout_url_v3\":\"https:\\/\\/payment.paydisini.co.id\\/v3\\/?info=PT1RZmlValRDSlZRSHRFVU5aa0k2SVNaazkyWWZWV2R4bG1iMUpDTGlnVE81TWpJNklDWnBKeWU=\",\"created_at\":\"2024-10-19 15:42:57\"}', 'FMPKGARBN5', '12173241195658002', '2024-10-19 15:42:57', '2024-10-19 15:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_method`
--

CREATE TABLE `deposit_method` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `rate` double NOT NULL,
  `name_account` varchar(111) NOT NULL,
  `number_account` varchar(111) NOT NULL,
  `description` text NOT NULL,
  `min_deposit` double NOT NULL,
  `status` int(11) NOT NULL,
  `is_gateway` enum('0','1') NOT NULL DEFAULT '0',
  `gateway_code` varchar(111) DEFAULT '-',
  `gateway_instruction` enum('0','1') DEFAULT '0',
  `payment_via` enum('Bank Transfer','Dompet Digital','Virtual Account','QRIS','Mini Market') NOT NULL,
  `thumbnail_payment` varchar(111) NOT NULL,
  `result` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `deposit_method`
--

INSERT INTO `deposit_method` (`id`, `name`, `type`, `category`, `rate`, `name_account`, `number_account`, `description`, `min_deposit`, `status`, `is_gateway`, `gateway_code`, `gateway_instruction`, `payment_via`, `thumbnail_payment`, `result`) VALUES
(1, 'QRIS', 'paydisini', 'ewallet', 1.2, 'QRIS', 'QRIS', 'Bonus 20%', 5000, 1, '1', '11', '1', 'Bank Transfer', 'qris.png', ''),
(2, 'OVO', 'paydisini', 'ewallet', 1.2, 'OVO', 'OVO', 'Bonus 20%', 10000, 1, '1', '12', '1', 'Bank Transfer', 'ovo.png', ''),
(3, 'DANA', 'paydisini', 'ewallet', 1.2, 'DANA', 'DANA', 'Bonus 20%', 5000, 1, '1', '13', '1', 'Bank Transfer', 'dana.png', ''),
(4, 'LINKAJA', 'paydisini', 'ewallet', 1.2, 'LINKAJA', 'LINKAJA', 'Bonus 20%', 10000, 1, '1', '14', '1', 'Bank Transfer', 'linkaja.png', ''),
(5, 'ALFAMART', 'paydisini', 'mini_market', 1.3, 'ALFAMART', 'ALFAMART', 'Bonus 30%', 10000, 1, '1', '18', '1', 'Bank Transfer', 'alfamart.png', ''),
(6, 'INDOMARET', 'paydisini', 'mini_market', 1.3, 'INDOMARET', 'INDOMARET', 'Bonus 30%', 10000, 1, '1', '19', '1', 'Bank Transfer', 'indomaret.png', ''),
(7, 'Virtual Account Bank BCA', 'paydisini', 'virtual_account', 1.1, 'Virtual Account Bank BCA', 'Virtual Account Bank BCA', 'Bonus 10%', 10000, 1, '1', '1', '1', 'Bank Transfer', 'bca.png', ''),
(8, 'Virtual Account Bank BRI', 'paydisini', 'virtual_account', 1.1, 'Virtual Account Bank BRI', 'Virtual Account Bank BRI', 'Bonus 10%', 10000, 1, '1', '2', '1', 'Bank Transfer', 'bri.png', ''),
(9, 'Virtual Account Bank BNI', 'paydisini', 'virtual_account', 1.1, 'Virtual Account Bank BNI', 'Virtual Account Bank BNI', 'Bonus 10%', 10000, 1, '1', '4', '1', 'Bank Transfer', 'bni.png', ''),
(10, 'Virtual Account BANK BSI', 'paydisini', 'virtual_account', 1.1, 'Virtual Account BANK BSI', 'Virtual Account BANK BSI', 'Bonus 10%', 10000, 1, '1', '9', '1', 'Bank Transfer', 'bsi.png', ''),
(11, 'Virtual Account Bank MANDIRI', 'paydisini', 'virtual_account', 1.1, 'Virtual Account Bank MANDIRI', 'Virtual Account Bank MANDIRI', 'Bonus 10%', 10000, 1, '1', '5', '1', 'Bank Transfer', 'mandiri.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_method_instruction`
--

CREATE TABLE `deposit_method_instruction` (
  `id` int(11) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `instruction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `deposit_method_instruction`
--

INSERT INTO `deposit_method_instruction` (`id`, `deposit_method_id`, `title`, `instruction`) VALUES
(15, 14, '[\"\"]', '[\"<h4>Langkah-langkah:<\\/h4><ul><li>Pilih jenis pembayaran yang Anda inginkan, tersedia 2 opsi:\\u00a0<strong>Transfer Bank<\\/strong>\\u00a0&\\u00a0<strong>Transfer Pulsa<\\/strong>.<\\/li><li>Pilih jenis permintaan yang Anda inginkan, tersedia 2 opsi:<\\/li><li><strong>Otomatis:<\\/strong>\\u00a0Pembayaran Anda akan dikonfirmasi secara otomatis oleh sistem dalam 5-10 menit setelah melakukan pembayaran.<\\/li><li><strong>Manual:<\\/strong>\\u00a0Anda harus melakukan konfirmasi pembayaran pada Admin, agar permintaan deposit Anda dapat diterima.<\\/li><li>Pilih metode pembayaran yang Anda inginkan.<\\/li><li>Masukkan jumlah deposit.<\\/li><li>Jika Anda memilih jenis pembayaran\\u00a0<strong>Transfer Bank<\\/strong>, Jumlah Deposit akan ditambahkan 3 digit angka verifikasi pembayaran (Contoh: Jumlah Deposit 10.000 akan menjadi 10.323 atau 3 digit acak lainnya), nominal yang harus dibayar akan ditampilkan setelah Anda Klik Submit.<\\/li><li>Jika Anda memilih jenis pembayaran\\u00a0<strong>Transfer Pulsa<\\/strong>, Anda diharuskan menginput nomor HP yang digunakan untuk transfer pulsa, gunakan awalan kode 62 bukan 0 (Contoh: 6282272883762).<\\/li><\\/ul><h4>Penting:<\\/h4><ul><li>Anda hanya dapat memiliki maksimal 3 permintaan deposit Pending, jadi jangan melakukan\\u00a0<i>spam<\\/i>\\u00a0dan segera lunasi pembayaran.<\\/li><li>Jika permintaan deposit tidak dibayar dalam waktu lebih dari 24 jam, maka permintaan deposit akan otomatis dibatalkan.<\\/li><\\/ul>\"]'),
(28, 7, '[\"Virtual Account Bank BCA\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(29, 8, '[\"\"]', '[\"\"]'),
(30, 9, '[\"\"]', '[\"\"]'),
(31, 10, '[\"\"]', '[\"\"]'),
(32, 11, '[\"\"]', '[\"\"]'),
(35, 1, '[\"QRIS\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(36, 2, '[\"OVO\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(37, 3, '[\"DANA\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(38, 4, '[\"LINKAJA\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(39, 5, '[\"ALFAMART\"]', '[\"<p>Dicek Otomatis<\\/p>\"]'),
(40, 6, '[\"\"]', '[\"\"]');

-- --------------------------------------------------------

--
-- Table structure for table `gojek_mutation`
--

CREATE TABLE `gojek_mutation` (
  `id` int(11) NOT NULL,
  `unix` varchar(100) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `category` enum('info','service','maintenance','update') NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_popup` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `category`, `content`, `created_at`, `updated_at`, `is_popup`) VALUES
(1, 'info', '<h3><strong>Valerie Connect - Open Reseller!</strong></h3>\r\n<p>Kami membuka kesempatan untuk menjadi <strong>reseller</strong> di <strong>Valerie Connect</strong>! Dapatkan akses ke layanan <strong>SMM Panel</strong>, API rental, pengembangan bot, dan panel pembelian dengan harga reseller khusus. Ini peluang terbaik untuk memperluas bisnis digital Anda dengan dukungan penuh dari kami.</p>\r\n<p><strong>Daftar Sekarang</strong> dan nikmati berbagai keuntungan eksklusif!</p>\r\n<p><strong>Hubungi Kami:</strong><br>WhatsApp: +62 851-7510-1443<br>Email: support<a rel=\"noopener\">@valerieconnect.com</a></p>', '2024-10-15 09:37:17', '2024-10-15 09:37:34', 1),
(2, 'info', '<p><strong>Jual Bot WhatsApp: Otomatisasi Komunikasi Anda!</strong></p>\r\n<p>Apakah Anda ingin meningkatkan interaksi dengan pelanggan melalui WhatsApp? Kami menawarkan Bot WhatsApp yang dirancang untuk mempermudah komunikasi dan meningkatkan efisiensi bisnis Anda.</p>\r\n<p><strong>Apa Itu Bot WhatsApp?</strong> Bot WhatsApp adalah aplikasi otomatis yang dapat mengelola pesan, menjawab pertanyaan, dan bahkan melakukan transaksi melalui platform WhatsApp. Dengan bot ini, Anda dapat memberikan layanan 24/7 kepada pelanggan Anda.</p>\r\n<p><strong>Keunggulan Bot WhatsApp:</strong></p>\r\n<ul>\r\n<li><strong>Respon Instan:</strong> Menjawab pertanyaan pelanggan secara otomatis dan cepat.</li>\r\n<li><strong>Pengelolaan Pesan yang Efisien:</strong> Mengatur pesan masuk dan keluar untuk mempermudah komunikasi.</li>\r\n<li><strong>Integrasi Mudah:</strong> Dapat terhubung dengan sistem CRM atau database Anda.</li>\r\n<li><strong>Analisis Data:</strong> Dapatkan laporan interaksi untuk memahami kebutuhan pelanggan.</li>\r\n</ul>\r\n<p><strong>Mengapa Memilih Kami?</strong></p>\r\n<ul>\r\n<li><strong>Kustomisasi:</strong> Bot dapat disesuaikan sesuai dengan kebutuhan spesifik bisnis Anda.</li>\r\n<li><strong>Dukungan Teknis:</strong> Tim kami siap membantu Anda dalam pengaturan dan pemeliharaan.</li>\r\n<li><strong>Keamanan Data:</strong> Kami memastikan bahwa semua data pelanggan Anda terjaga dengan baik.</li>\r\n</ul>\r\n<p><strong>Cara Memesan:</strong></p>\r\n<ol>\r\n<li>Kunjungi situs web kami di [link situs].</li>\r\n<li>Pilih paket Bot WhatsApp yang sesuai dengan kebutuhan bisnis Anda.</li>\r\n<li>Lakukan pembayaran dan dapatkan akses segera.</li>\r\n</ol>\r\n<p>Tingkatkan efisiensi bisnis Anda dengan Bot WhatsApp! Hubungi kami di <a href=\"wa.me/6285784828303\" target=\"_blank\" rel=\"noopener\"><strong>085784828303</strong></a> untuk informasi lebih lanjut atau konsultasi gratis.</p>', '2024-10-17 04:09:53', '2024-10-17 04:09:53', 1),
(3, 'info', '<h5 class=\"my-2\">Bonus deposit untuk Top 10 Pengguna Bulan Oktober (Per-Minggu) 2024Â </h5>\r\n<div class=\"\">\r\n<h6 class=\"fw-medium\">Valerie Connect SMM</h6>\r\n<p>Kami menyadari banyak yang memakai manipulasi pada top penggunanya<br>dengan di x2 total pesanan ataupun merekayasa top 1,2,3<br>tetapi kami murni dari pesanan user tanpa rekayasa<br>terimakasih sudah selalu bersama kami...</p>\r\n<p>Berikut ini detail bonus yang kami berikan untuk top pesanan Minggu Lalu 7 oktober 2024:</p>\r\n<p>TOP 1 : BONUS TOPUP 50%, 20% PULSA TSEL<br>TOP 2 : BONUS TOPUP 40%, 15% PULSA TSEL<br>TOP 3 : BONUS TOPUP 30%, 13% PULSA TSEL<br>TOP 4 : BONUS TOPUP 25%, 12% PULSA TSEL<br>TOP 5 : BONUS TOPUP 25%, 10% PULSA TSEL<br>TOP 6-10 : BONUS TOPUP 22%, 5% PULSA TSEL</p>\r\n<p><br>Syarat & Ketentuan :</p>\r\n<p>1. Berlaku untuk 1x pengambilan bonus.<br>2. Batas pengambilan bonus sampai tanggal 13 oktober 2024:<br>3. Bonus ini tidak dapat diuangkan.<br>4. Bonus ini dapat naik turun sesuai kebijakan tim.<br>5. Max bonus top 1 4Juta, Top 2 dan 3 2jt, Top 4-10 500Rb Buat Masing Masing.<br>6. Syarat dan ketentuan ini dapat berubah sewaktu waktu tanpa pemberitahuan terlebih dahulu</p>\r\n</div>', '2024-10-17 22:00:13', '2024-10-17 22:00:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type` enum('SosialMedia','Pulsa') NOT NULL,
  `amount` int(11) NOT NULL,
  `unique_code` int(11) NOT NULL,
  `status` varchar(111) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `payment_expired` datetime NOT NULL,
  `is_process` int(11) NOT NULL DEFAULT 0,
  `reference` varchar(111) DEFAULT NULL,
  `merchant_ref` varchar(111) DEFAULT NULL,
  `payment_gateway` int(11) NOT NULL DEFAULT 0,
  `additional_data` varchar(111) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_config`
--

CREATE TABLE `landing_config` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `landing_config`
--

INSERT INTO `landing_config` (`id`, `type`, `icon`, `name`, `title`, `content`) VALUES
(281, 'features', '', '', '1. Daftarkan Akun', 'Mulai dengan melakukan pendaftaran akun Anda di situs kami secara Gratis! Pastikan untuk tidak melupakan data akunmu.'),
(282, 'features', '', '', '2. Deposit Saldo', 'Setelah melakukan pendaftaran, kamu harus melakukan deposit saldo agar dapat menggunakan layanan kami.'),
(283, 'features', '', '', '3. Buat Pemesanan', 'Saldo kamu sudah siap? maka kamu bisa langsung memesan layanan yang kamu inginkan.'),
(284, 'features', '', '', '4. Pesanan Diproses', 'Pesanan kamu akan diproses secara otomatis oleh sistem, dan kamu bisa melihat data pesanan pada menu Riwayat Pesanan.'),
(285, 'testimonial_top', 'avatar-1.jpg', 'Dimas Andritany', 'Business Owner', 'â€œHarga sangat murah dan kualitas layanannya luar biasa!â€œ'),
(286, 'testimonial_top', 'avatar-6.jpg', 'Nayla', 'Member', 'â€œKeren banget, saya jadi bisa beli sendiri langsung di web tanpa melalui Reseller!â€œ'),
(287, 'testimonial_top', 'avatar-3.jpg', 'Sindy', 'Influencer', 'Aplikasi mudah di gunakan'),
(288, 'testimonial_top', 'avatar-4.jpg', 'Intan', 'Reseller', 'â€œWebnya serba otomatis, deposit gak perlu nunggu admin, kalo mau pesan juga bisa langsung di web ðŸ˜â€œ'),
(289, 'testimonial_top', 'avatar-1.jpg', 'Indra', 'Mahasiswa', 'â€œMenu support ticketnya sangat membantu pengguna untuk mengajukan komplain.â€œ'),
(290, 'testimonial_bottom', 'avatar-3.jpg', 'Sindy', 'Influencer', 'Aplikasi mudah di gunakan'),
(291, 'testimonial_bottom', 'avatar-4.jpg', 'Indra', 'Mahasiswa', 'â€œMenu support ticketnya sangat membantu pengguna untuk mengajukan komplain.â€œ'),
(292, 'testimonial_bottom', 'avatar-9.jpg', 'Intan', 'Reseller', 'â€œWebnya serba otomatis, deposit gak perlu nunggu admin, kalo mau pesan juga bisa langsung di web ðŸ˜â€œ'),
(293, 'testimonial_bottom', 'avatar-1.jpg', 'Intan', 'Reseller', 'â€œWebnya serba otomatis, deposit gak perlu nunggu admin, kalo mau pesan juga bisa langsung di web ðŸ˜â€œ'),
(294, 'testimonial_bottom', 'avatar-5.jpg', 'azzam a', 'reseller', '\"layanannya bagus dan adminnya baik banget jir, keren dah buat valerie connect smm\"');

-- --------------------------------------------------------

--
-- Table structure for table `log_balance_usage`
--

CREATE TABLE `log_balance_usage` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `description` text NOT NULL,
  `before` double NOT NULL,
  `after` double NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `log_balance_usage`
--

INSERT INTO `log_balance_usage` (`id`, `user_id`, `type`, `category`, `amount`, `description`, `before`, `after`, `created_at`) VALUES
(1, 1, 'plus', 'deposit', 100, 'Deposit #2.', 0, 100, '2024-10-07 00:28:24'),
(2, 1, 'plus', 'deposit', 100, 'Deposit #7.', 100, 200, '2024-10-08 17:44:50'),
(3, 2, 'plus', 'deposit', 100, 'Deposit #4552.', 0, 100, '2024-10-15 05:53:17'),
(4, 3, 'plus', 'deposit', 100, 'Deposit #4553.', 0, 100, '2024-10-15 07:45:02'),
(5, 3, 'minus', 'place order', 29.4875, 'Melakukan pemesanan #1.', 100, 70.5125, '2024-10-15 07:58:17'),
(6, 15, 'plus', 'deposit', 5000, 'Deposit #4557.', 0, 5000, '2024-10-15 10:36:02'),
(7, 15, 'minus', 'place order', 3.3, 'Melakukan pemesanan #2.', 5000, 4996.7, '2024-10-15 10:37:15'),
(8, 15, 'minus', 'place order', 17.6, 'Melakukan pemesanan #3.', 4996.7, 4979.1, '2024-10-15 16:15:38'),
(9, 11, 'plus', 'deposit', 5000, 'Deposit #4558.', 0, 5000, '2024-10-16 13:18:21'),
(10, 11, 'minus', 'place order', 4191.6, 'Melakukan pemesanan #4.', 5000, 808.4, '2024-10-16 13:33:11'),
(11, 11, 'plus', 'refund order', 4191.6, 'Pengembalian dana pesanan #4.', 808.4, 5000, '2024-10-16 13:55:01'),
(12, 11, 'minus', 'place order', 4901.316, 'Melakukan pemesanan #5.', 5000, 98.684, '2024-10-16 14:23:41'),
(13, 28, 'plus', 'deposit', 5000, 'Deposit #4560.', 0, 5000, '2024-10-16 18:46:42'),
(14, 28, 'minus', 'place order', 60, 'Melakukan pemesanan #6.', 5000, 4940, '2024-10-16 18:51:50'),
(15, 28, 'minus', 'place order', 305.28, 'Melakukan pemesanan #7.', 4940, 4634.72, '2024-10-16 19:19:03'),
(16, 28, 'minus', 'place order', 477.84, 'Melakukan pemesanan #8.', 4634.72, 4156.88, '2024-10-16 20:04:28'),
(17, 11, 'plus', 'refund order', 4901.316, 'Pengembalian dana pesanan #5.', 5000.684, 9902, '2024-10-16 20:15:01'),
(18, 28, 'minus', 'place order', 540, 'Melakukan pemesanan #9.', 4156.88, 3616.88, '2024-10-16 20:45:30'),
(19, 28, 'minus', 'place order', 203.52, 'Melakukan pemesanan #10.', 3616.88, 3413.36, '2024-10-16 20:46:37'),
(20, 2, 'plus', 'deposit', 100, 'Deposit #4562.', 100, 200, '2024-10-17 04:20:23'),
(21, 2, 'plus', 'deposit', 100, 'Deposit #4563.', 200, 300, '2024-10-17 04:24:53'),
(22, 2, 'plus', 'deposit', 100, 'Deposit #4564.', 300, 400, '2024-10-17 04:45:04'),
(23, 3, 'plus', 'deposit', 100, 'Deposit #4570.', 70.5125, 170.5125, '2024-10-17 14:27:51'),
(24, 2, 'plus', 'deposit', 100, 'Deposit #4571.', 400, 500, '2024-10-17 16:14:28'),
(25, 2, 'plus', 'deposit', 100, 'Deposit #4572.', 500, 600, '2024-10-17 16:15:37'),
(26, 2, 'plus', 'deposit', 100, 'Deposit #4573.', 600, 700, '2024-10-17 16:29:04'),
(27, 11, 'minus', 'place order', 9272.76, 'Melakukan pemesanan #11.', 10000, 727.24, '2024-10-17 16:42:52'),
(28, 2, 'plus', 'deposit', 100, 'Deposit #4574.', 700, 800, '2024-10-17 16:55:22'),
(29, 35, 'plus', 'deposit', 50000, 'Deposit #4575.', 0, 50000, '2024-10-17 18:15:08'),
(30, 2, 'minus', 'place order', 478.08, 'Melakukan pemesanan #12.', 800, 321.92, '2024-10-17 19:46:29'),
(31, 35, 'minus', 'place order', 23904, 'Melakukan pemesanan #13.', 50000, 26096, '2024-10-17 20:00:04'),
(32, 2, 'plus', 'refund order', 478.08, 'Pengembalian dana pesanan #12.', 321.92, 800, '2024-10-18 04:10:02'),
(33, 3, 'minus', 'place order', 167.244, 'Melakukan pemesanan #14.', 170.5125, 3.2685, '2024-10-18 04:43:41'),
(34, 7, 'plus', 'deposit', 14300, 'Deposit #4579.', 0, 14300, '2024-10-18 15:19:40'),
(35, 7, 'minus', 'place order', 4778.4, 'Melakukan pemesanan #15.', 14300, 9521.6, '2024-10-18 15:26:09'),
(36, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #16.', 3413.36, 2651.36, '2024-10-18 20:38:58'),
(37, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #17.', 2651.36, 1889.36, '2024-10-18 20:41:00'),
(38, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #18.', 1889.36, 1127.36, '2024-10-18 20:42:23'),
(39, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #19.', 1127.36, 365.36, '2024-10-18 20:45:06'),
(40, 28, 'plus', 'deposit', 13000, 'Deposit #4581.', 365.36, 13365.36, '2024-10-18 20:51:11'),
(41, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #20.', 13365.36, 12603.36, '2024-10-18 20:52:15'),
(42, 28, 'minus', 'place order', 762, 'Melakukan pemesanan #21.', 12603.36, 11841.36, '2024-10-18 20:52:39'),
(43, 28, 'minus', 'place order', 75.438, 'Melakukan pemesanan #22.', 11841.36, 11765.922, '2024-10-18 20:55:56'),
(44, 28, 'minus', 'place order', 377.19, 'Melakukan pemesanan #23.', 11765.922, 11388.732, '2024-10-18 21:00:05'),
(45, 28, 'minus', 'place order', 377.19, 'Melakukan pemesanan #24.', 11388.732, 11011.542, '2024-10-18 21:12:57'),
(46, 59, 'plus', 'deposit', 11000, 'Deposit #4584.', 0, 11000, '2024-10-19 15:43:52'),
(47, 28, 'minus', 'place order', 702, 'Melakukan pemesanan #25.', 11011.542, 10309.542, '2024-10-19 17:33:51'),
(48, 28, 'minus', 'place order', 150.1227, 'Melakukan pemesanan #26.', 10309.542, 10159.4193, '2024-10-19 17:41:28'),
(49, 28, 'minus', 'place order', 35.7435, 'Melakukan pemesanan #27.', 10159.4193, 10123.6758, '2024-10-19 18:12:42'),
(50, 7, 'minus', 'place order', 71.487, 'Melakukan pemesanan #28.', 9521.6, 9450.113, '2024-10-19 19:42:20'),
(51, 2, 'minus', 'place order', 713.592, 'Melakukan pemesanan #29.', 800, 86.408, '2024-10-20 05:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `log_deposit_bank`
--

CREATE TABLE `log_deposit_bank` (
  `id` int(11) NOT NULL,
  `log_code` varchar(255) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `note` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_login_admin`
--

CREATE TABLE `log_login_admin` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `log_login_admin`
--

INSERT INTO `log_login_admin` (`id`, `admin_id`, `ip_address`, `created_at`) VALUES
(1, 1, '2001:448a:2082:f0fb:91bd:d341:ade4:99c8', '2024-09-23 16:46:01'),
(2, 1, '180.252.48.173, 162.158.166.225', '2024-09-28 22:36:17'),
(3, 1, '180.252.57.231, 172.69.134.173', '2024-10-05 20:32:55'),
(4, 1, '180.252.57.231', '2024-10-07 00:23:47'),
(5, 1, '180.252.57.231', '2024-10-10 23:01:32'),
(6, 1, '2001:448a:404c:1e38:dd40:4fed:e6a5:634c', '2024-10-15 03:18:51'),
(7, 1, '112.215.200.188', '2024-10-15 09:32:09'),
(8, 1, '36.73.52.80', '2024-10-15 10:39:55'),
(9, 1, '2001:448a:404c:1e38:4c1a:b626:a:9ce4', '2024-10-16 21:50:08'),
(10, 1, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', '2024-10-17 04:40:19'),
(11, 1, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', '2024-10-17 10:20:32'),
(12, 1, '36.73.52.80', '2024-10-17 14:08:27'),
(13, 1, '114.125.5.101', '2024-10-17 16:53:19'),
(14, 3, '2001:448a:404c:1e38:2185:df43:3645:9b80', '2024-10-18 01:18:10'),
(15, 1, '36.73.52.80', '2024-10-18 17:15:17'),
(16, 4, '114.10.23.108', '2024-10-18 17:43:27'),
(17, 1, '2001:448a:404c:1e38:7575:1a31:a0c6:e2da', '2024-10-19 13:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `log_login_user`
--

CREATE TABLE `log_login_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `ua` text NOT NULL,
  `ud` enum('Desktop','Tablet','Mobile','unknown') NOT NULL DEFAULT 'unknown',
  `browser` text NOT NULL,
  `browser_version` text NOT NULL,
  `platform` text NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `log_login_user`
--

INSERT INTO `log_login_user` (`id`, `user_id`, `ip_address`, `ua`, `ud`, `browser`, `browser_version`, `platform`, `created_at`) VALUES
(1, 1, '180.252.48.173, 162.158.167.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-09-28 22:29:04'),
(2, 2, '180.252.48.173, 172.71.158.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-09-28 22:55:31'),
(3, 1, '180.252.57.231, 172.69.135.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-05 20:18:18'),
(4, 1, '180.252.57.231, 172.69.134.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-05 22:04:09'),
(5, 1, '180.252.57.231, 172.69.134.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-06 00:01:32'),
(6, 1, '180.252.57.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-07 00:18:40'),
(7, 3, '45.115.209.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-07 01:11:53'),
(8, 1, '180.252.57.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-07 01:26:59'),
(9, 1, '180.252.57.231', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-07 02:17:50'),
(10, 4, '180.241.45.178', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-08 09:25:09'),
(11, 1, '180.252.57.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-08 21:59:46'),
(12, 1, '180.252.57.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-08 22:28:17'),
(13, 1, '180.252.57.231', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15', 'Desktop', 'Safari', '605.1.15', 'Mac OS X', '2024-10-10 01:04:15'),
(14, 1, '180.252.55.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-13 02:17:22'),
(15, 1, '180.252.55.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-14 08:07:13'),
(16, 1, '180.252.55.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-14 08:10:37'),
(17, 1, '180.252.55.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-14 08:18:59'),
(18, 5, '2001:448a:404c:1e38:8c6d:59a6:43a7:3e0b', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-14 21:47:32'),
(19, 1, '180.252.61.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-14 22:47:26'),
(20, 2, '2001:448a:404c:1e38:dd40:4fed:e6a5:634c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-15 03:17:12'),
(21, 3, '36.73.52.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-15 06:30:21'),
(22, 2, '112.215.175.49', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 07:20:58'),
(23, 4, '2404:c0:2120::cd:1cf6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:11:21'),
(24, 5, '120.188.76.214', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:12:52'),
(25, 6, '182.2.145.59', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:13:55'),
(26, 7, '178.128.93.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '121.0.0.0', 'Android', '2024-10-15 09:14:04'),
(27, 8, '2001:448a:5102:2fcc:40e0:96d0:a093:3294', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:16:34'),
(28, 9, '2001:448a:40b0:ab50:41e4:f3af:e176:ef7d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:20:01'),
(29, 10, '114.10.76.39', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:24:33'),
(30, 11, '125.164.13.176', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:25:28'),
(31, 12, '114.10.6.155', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 09:33:30'),
(32, 13, '206.189.159.184', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 10:08:22'),
(33, 14, '2400:9800:251:4771:58ac:9e62:69a6:e280', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 10:11:53'),
(34, 15, '114.10.46.167', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 10:27:21'),
(35, 3, '36.73.52.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-15 10:39:23'),
(36, 16, '114.5.250.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 10:44:14'),
(37, 17, '180.241.171.206', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 11:13:24'),
(38, 18, '116.206.36.62', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '128.0.0.0', 'Android', '2024-10-15 11:24:36'),
(39, 19, '103.179.248.174', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 14:39:53'),
(40, 20, '182.2.5.226', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 14:44:47'),
(41, 21, '36.68.55.145', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 16:47:30'),
(42, 2, '2001:448a:404c:1e38:dc7:5a6d:f426:404f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-15 20:12:53'),
(43, 2, '2001:448a:404c:1e38:dc7:5a6d:f426:404f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-15 20:29:42'),
(44, 22, '103.121.138.4', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-15 22:51:08'),
(45, 3, '114.10.150.200', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-16 04:00:18'),
(46, 2, '2001:448a:404c:1e38:dc7:5a6d:f426:404f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-16 04:59:16'),
(47, 3, '114.10.150.200', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-16 06:10:06'),
(48, 24, '114.10.12.40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-16 07:29:51'),
(49, 2, '2001:448a:404c:1e38:dc7:5a6d:f426:404f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-16 12:22:04'),
(50, 25, '103.47.135.120', 'Mozilla/5.0 (Linux; Android 14; en; Infinix X6833B Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.129 HiBrowser/v2.23.1.4 UWS/ Mobile Safari/537.36', 'Mobile', 'Chrome', '103.0.5060.129', 'Android', '2024-10-16 12:32:52'),
(51, 11, '125.164.13.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-16 13:29:26'),
(52, 3, '36.73.52.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-16 14:34:49'),
(53, 26, '114.125.95.40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/26.0 Chrome/122.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '122.0.0.0', 'Android', '2024-10-16 14:45:16'),
(54, 27, '36.79.180.172', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-16 15:31:07'),
(55, 28, '103.42.242.26', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-16 18:40:39'),
(56, 29, '2405:8180:803:aa33:ab61:e74c:22ee:598', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-16 18:51:02'),
(57, 28, '103.42.242.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-16 19:17:27'),
(58, 30, '101.255.165.98', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-16 21:47:16'),
(59, 2, '2001:448a:404c:1e38:4c1a:b626:a:9ce4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-16 21:49:45'),
(60, 2, '2001:448a:404c:1e38:a5c0:f14:9b23:be29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 00:29:08'),
(61, 2, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 04:36:03'),
(62, 28, '103.75.209.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 06:37:24'),
(63, 31, '182.3.141.150', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '127.0.0.0', 'Android', '2024-10-17 06:44:50'),
(64, 11, '125.164.13.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 06:45:04'),
(65, 31, '182.3.141.150', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '127.0.0.0', 'Android', '2024-10-17 06:57:59'),
(66, 32, '114.79.1.26', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 08:39:58'),
(67, 3, '36.73.52.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-17 13:55:38'),
(68, 2, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 14:46:56'),
(69, 33, '114.10.47.72', 'Mozilla/5.0 (Linux; Android 14; en; Infinix X6853 Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.129 HiBrowser/v2.24.1.3 UWS/ Mobile Safari/537.36', 'Mobile', 'Chrome', '103.0.5060.129', 'Android', '2024-10-17 16:19:59'),
(70, 11, '125.164.13.176', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '130.0.0.0', 'Android', '2024-10-17 16:40:01'),
(71, 2, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 16:48:10'),
(72, 2, '2001:448a:404c:1e38:24df:9b76:c6f5:aae8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-17 16:49:26'),
(73, 2, '114.125.5.101', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 16:53:00'),
(74, 34, '114.10.152.65', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '125.0.0.0', 'Android', '2024-10-17 17:04:58'),
(75, 35, '36.85.38.114', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 17:06:39'),
(76, 36, '140.213.34.201', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '125.0.0.0', 'Android', '2024-10-17 21:10:44'),
(77, 37, '180.244.166.106', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 22:59:50'),
(78, 38, '114.10.83.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-17 23:37:21'),
(79, 39, '180.251.87.39', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '127.0.0.0', 'Android', '2024-10-18 04:08:21'),
(80, 40, '114.10.8.24', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 08:39:26'),
(81, 3, '2001:448a:404c:1e38:2185:df43:3645:9b80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-18 09:26:41'),
(82, 41, '114.4.213.35', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 09:44:46'),
(83, 42, '36.37.152.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-18 09:55:14'),
(84, 18, '202.67.45.25', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '128.0.0.0', 'Android', '2024-10-18 10:22:27'),
(85, 7, '178.128.93.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '130.0.0.0', 'Android', '2024-10-18 10:27:18'),
(86, 7, '178.128.93.60', 'Mozilla/5.0 (Linux; Android 11; vivo 2007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/87.0.4280.141 Mobile Safari/537.36 VivoBrowser/12.7.2.0', 'Mobile', 'Chrome', '87.0.4280.141', 'Android', '2024-10-18 10:57:55'),
(87, 43, '178.128.93.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '130.0.0.0', 'Android', '2024-10-18 11:01:57'),
(88, 7, '178.128.93.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '130.0.0.0', 'Android', '2024-10-18 11:31:06'),
(89, 44, '114.5.208.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 12:27:20'),
(90, 45, '140.213.230.42', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '126.0.0.0', 'Android', '2024-10-18 13:53:50'),
(91, 46, '103.157.78.78', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 14:16:25'),
(92, 47, '2001:d08:1380:ae86:edc3:6245:a50c:6d1c', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 14:56:23'),
(93, 48, '125.165.82.167', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 14:59:41'),
(94, 49, '120.188.7.175', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 15:06:33'),
(95, 50, '140.213.34.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-18 15:07:08'),
(96, 51, '2400:9800:1b0:891f:1:0:753a:e82d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.18.0-gn', 'Mobile', 'Chrome', '123.0.6312.118', 'Android', '2024-10-18 20:01:23'),
(97, 28, '103.42.242.26', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 20:49:51'),
(98, 52, '114.124.206.34', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_8_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.8.3 Mobile/19H386 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-18 22:23:15'),
(99, 51, '2001:448a:404c:1e38:e87d:4ff5:4301:94a7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-18 22:43:58'),
(100, 3, '2001:448a:404c:1e38:e87d:4ff5:4301:94a7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-18 22:44:54'),
(101, 53, '2400:9800:141:dc4d:1:0:415b:b6d3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.18.0-gn', 'Mobile', 'Chrome', '123.0.6312.118', 'Android', '2024-10-18 22:55:26'),
(102, 54, '112.215.224.149', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-18 23:02:44'),
(103, 55, '182.1.6.247', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 01:08:14'),
(104, 56, '114.79.3.141', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 01:54:21'),
(105, 2, '112.215.200.97', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 01:58:46'),
(106, 2, '2001:448a:404c:1e38:142b:7dde:9ef3:75d0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'Desktop', 'Chrome', '129.0.0.0', 'Windows 10', '2024-10-19 02:01:46'),
(107, 57, '103.158.121.171', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 03:03:00'),
(108, 58, '114.125.220.233', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 12:00:34'),
(109, 3, '2001:448a:404c:1e38:7575:1a31:a0c6:e2da', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-19 13:09:42'),
(110, 59, '101.255.165.234', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-19 14:01:27'),
(111, 2, '2001:448a:404c:1e38:7575:1a31:a0c6:e2da', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_10 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mobile', 'Safari', '604.1', 'iOS', '2024-10-19 17:11:04'),
(112, 7, '178.128.93.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0', 'Desktop', 'Opera', '114.0.0.0', 'Windows 10', '2024-10-19 19:38:21'),
(113, 60, '140.213.127.224', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'Mobile', 'Chrome', '129.0.0.0', 'Android', '2024-10-20 05:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `log_sms`
--

CREATE TABLE `log_sms` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `operator` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `sms_id` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service` text DEFAULT NULL,
  `target` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `is_api` int(11) NOT NULL DEFAULT 0,
  `is_refund` int(11) NOT NULL DEFAULT 0,
  `is_refill` int(11) NOT NULL DEFAULT 0,
  `is_paid` int(11) NOT NULL DEFAULT 0,
  `api_id` int(11) NOT NULL,
  `provider` text NOT NULL,
  `api_order_id` bigint(50) DEFAULT NULL,
  `api_log_order` text DEFAULT NULL,
  `api_log_status` text DEFAULT NULL,
  `api_log_refill` text DEFAULT NULL,
  `start_count` int(11) DEFAULT NULL,
  `remains` int(11) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `custom_comments` text DEFAULT NULL,
  `custom_link` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `next_refill` datetime NOT NULL,
  `uplink` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `order_pulsa_list`
--

CREATE TABLE `order_pulsa_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service` text DEFAULT NULL,
  `target` text NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `is_api` int(11) NOT NULL DEFAULT 0,
  `is_refund` int(11) NOT NULL DEFAULT 0,
  `api_id` int(11) NOT NULL,
  `provider` text NOT NULL,
  `api_order_id` varchar(100) DEFAULT NULL,
  `api_log_order` text DEFAULT NULL,
  `api_log_status` text DEFAULT NULL,
  `sn` text DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `custom_link` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `uplink` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ovo_mutation`
--

CREATE TABLE `ovo_mutation` (
  `id` int(11) NOT NULL,
  `unix` varchar(100) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(2, 'Ketentuan Layanan', 'ketentuan-layanan', '<p>Ketentuan Layanan yang disediakan oleh Valerie Connect telah ditetapkan kesepakatan-kesepakatan sebagai berikut.</p>\r\n<p>Â </p>\r\n<p>Â </p>\r\n<p>1. Umum</p>\r\n<p>Â </p>\r\n<p>Dengan mendaftar dan menggunakan layanan Valerie Connect, Anda secara otomatis menyetujui semua ketentuan layanan kami. Kami berhak mengubah ketentuan layanan ini tanpa pemberitahuan terlebih dahulu. Anda diharapkan membaca semua ketentuan layanan kami sebelum membuat pesanan.Syarat dan Ketentuan Penggunaan ini merupakan catatan elektronik dalam arti hukum yang berlaku. Catatan elektronik ini dibuat oleh sistem komputer dan tidak memerlukan tanda tangan fisik atau digital.Penolakan: EHSPEDIA tidak akan bertanggung jawab jika Anda mengalami kerugian dalam bisnis Anda.Kewajiban: EHSPEDIA tidak bertanggung jawab jika Anda mengalami suspensi atau penghapusan akun yang dilakukan oleh Instagram, Twitter, Facebook, Youtube, dan lain-lain.</p>\r\n<p>Â </p>\r\n<p>2. Layanan</p>\r\n<p>Â </p>\r\n<p>Valerie Connect dapat digunakan untuk media promosi sosial media dan membantu meningkatkan penampilan atau popularitas akun Anda.Valerie Connect tidak menjamin pengikut baru Anda dapat berinteraksi dengan Anda, kami hanya menjamin bahwa Anda mendapat pengikut yang Anda beli.Valerie Connect tidak menjamin bahwa 100% akun kami akan memiliki gambar profil, gambar bio dan unggahan penuh, meskipun kami berusaha keras mewujudkan realitas ini untuk semua akun.Valerie Connect tidak memiliki estimasi atau jendela waktu kapan pesanan Anda akan diselesaikan, namun kami menjamin seluruh pesanan tuntas tanpa terkecuali. Estimasi pada deskripsi layanan hanya perkiraan.Valerie Connect berusaha sebaik mungkin untuk memberikan apa yang Anda / Reseller harapkan kepada kami.Valerie Connecttidak menjamin bahwa pesanan Anda tidak mengalami drop atau penurunan, karena pada dasarnya seluruh layanan kami dapat mengalami drop dan drop pada pesanan itu murni atau pure dari sistem platform. Anda dapat menggunakan layanan refill untuk mendapat jaminan isi ulang jika sewaktu-waktu pesanan Anda mengalami drop.Valerie Connect hanya melakukan pengecekan berdasarkan satu data pesanan terakhir yang Anda pesan dan bukan total keseluruhan pesanan.Proses pesanan pada umumnya selesai dalam hitungan menit atau jam tergantung dari layanan yang Anda pilih.Data target seperti username dan url yang Anda input saat membuat pesanan hanyalah untuk keperluan proses pesanan dan kami tidak akan menyebarluaskannya karena kami menjaga dengan baik Privasi Anda.</p>\r\n<p>Â </p>\r\n<p>3. Refund</p>\r\n<p>Â </p>\r\n<p>Kami tidak menerima permintaan pengembalian saldo dalam bentuk apapun setelah deposit berhasil dilakukan, tidak ada cara untuk mengembalikannya. Anda harus menggunakan saldo Anda untuk memesan dari Valerie Connect.Deposit yang tidak di konfirmasi selama 24 jam akan kita anggap hangus, dikarenakan sangat sulit untuk melakukan pengecekan data ataupun mutasi. Karena kami menerima ratusan data deposit setiap hari.Kami tidak menerima permintaan pembatalan/pengembalian dana setelah pesanan masuk ke sistem kami. Kami memberikan pengembalian dana yang sesuai jika pesanan tidak dapat diselesaikan.Jika kami mendapat laporan adanya aktifitas penipuan atau kecurangan. Kami berhak nonaktifkan akun Anda.Jika Anda melakukan double pesan ke target yang sama, atau Anda membuat pesanan kedua sebelum pesanan pertama selesai, kami tidak bertanggung jawab dan tidak ada pengembalian saldo jika terjadi masalah pada salah satu pesanan Anda. Harap berhati-hati dan luangkan waktu Anda untuk menunggu proses pesanan yang telah dibuat.Jika pesanan Anda melebihi batas maksimal pertarget dan pesanan Anda bermasalah, maka tidak ada pengembalian dana dikarenakan itu kesalahan dari pengguna, (Maksimal order pertarget yang tertera di label layanan).Pesanan dengan target akun private atau salah target, tidak akan mendapat pengembalian dana dikarenakan itu kesalahan dari pengguna. Pastikan Anda selalu mengecek kembali pesanan sebelum pesanan dibuat.Untuk layanan No Refill atau tanpa garansi, tidak ada pengembalian dana atau refund saldo bahkan jika drop dalam 5 menit sejak pesanan selesai. Order dengan resiko Anda sendiri!</p>\r\n<p>Â </p>\r\n<p>4. Refill</p>\r\n<p>Â </p>\r\n<p>Layanan yang memiliki labelÂ â™»ï¸Â pada nama atau deskripsinya, layanan tersebut memiliki tombol refill atau kualitas refill otomatis.Anda diwajibkan untuk menggunakan tombol refill ini jika pesanan mengalami drop!Jika tombol refill tidak bekerja dalam 3 hari, Anda dapat membuat laporan refill secara manual melalui Tiket / WA Support kami.Untuk layanan yang tidak memiliki labelÂ â™»ï¸Â atau tombol refill, silahkan buat laporan dengan cara kirimkan ID Pesanan refill Anda melalui tiket atau kontak kami.Pesanan dengan status partial tidak dapat direfill.Pesanan akan dapat direfill jika drop dibawah jumlah pesan.Pesanan akan dapat direfill jika jaminan atau periode isi ulang masih berlaku dan belum expired.Pesanan yang turun dibawah jumlah awal pada pesanan tidak dapat direfill, karena sudah dipastikan drop dari pesanan lama sehingga Anda bisa naikan terlebih dahulu pesanan target sampai berada diatas jumlah awal.Jika Anda mengirim atau membuat laporan isi ulang pada saat periode jaminan isi ulang masih berlaku, dan pesanan Anda tidak terefill sampai periode jaminan isi ulang berakhir. Tidak ada pengembalian dana untuk kasus ini.Pesanan yang ada dalam daftar laporan refill, akan dikirimkan setiap hari kepenyedia layanan untuk permintaan isi ulang sehingga kami tidak memiliki estimasi / jendela waktu kapan pesanan akan selesai direfill, semua pesanan yang ada dalam daftar laporan akan di konfirmasi seperti biasa jika pesanan sudah selesai refill. Kami bekerja sebaik mungkin untuk menyelesaikan seluruh pesanan serta mengisi ulang pesanan yang memiliki jaminan refill.Apabila Anda memiliki banyak pesanan untuk target dan jenis layanan yang sama, maka refill hanya berlaku untuk pesanan terakhir yang ditempatkan.</p>\r\n<p>Â </p>\r\n<p>5. Privacy</p>\r\n<p>Â </p>\r\n<p>Kami menjaga privasi Anda dengan serius dan akan mengambil semua tindakan untuk melindungi informasi pribadi Anda.Informasi / data pribadi yang Anda berikan kepada kami selama penggunaan situs akan diperlakukan sebagai kerahasiaan ketat sesuai dengan hukum dan peraturan yang berlaku.Setiap informasi pribadi yang diterima hanya akan digunakan untuk mengisi pesanan Anda. Kami tidak akan menjual atau mendistribusikan ulang informasi Anda kepada siapa pun. Semua informasi dienkripsi dan disimpan di server yang aman.</p>', '2024-08-07 07:31:35', '2024-10-15 10:10:27'),
(3, 'Status Pesanan', 'status-pesanan', '<p>- Pending : Pesanan/deposit sedang dalam antian di server.</p>\r\n<p>- Processing : Pesanan sedang dalam proses.</p>\r\n<p>- Success : Pesanan telah berhasil.</p>\r\n<p>- Partial : Pesanan sudah terproses tapi tercancel. Dan anda hanya akan membayar jumlah layanan yang sudah masuk saja.</p>\r\n<p>- Error : Pesanan di batalkan, dan saldo akan otomatis kembali ke akun.</p>\r\n<p>Â </p>\r\n<p>MENGAPA BISA PARTIAL???</p>\r\n<p>Limit : Contoh jika satu layanan dengan maksimal 1.000 followers, kemudian anda membeli 1000 followers 2x di akun yang sama. kemungkinan besar akan terjadi partial.</p>\r\n<p>Karena akun (followers) yang ada di server tersebut hanya 1.000 followers.</p>\r\n<p>Jadi anda tidak bisa mengirim 2000 followers walaupun dengan cara 1000 2x pemesanan.</p>\r\n<p>Jika hal ini terjadi, silahkan gunakan server (Layanan) lainnya.</p>\r\n<p>Hal ini tidak berpengaruh jika berbeda akun.</p>\r\n<p>Â </p>\r\n<p>Server overload : Overload biasanya terjadi di layanan yang murah. Karena murah terlalu banyak pesanan yang masuk sehingga terjadi Overload dan Partial.</p>\r\n<p>Untuk pesanan Partial, sisa saldo layanan yang tidak masuk akan otomatis kembali ke akun.</p>\r\n<p>Â </p>\r\n<p>Garansi (Refill) â™»ï¸ : Refill adalah isi ulang. Jika anda membeli layanan refill dan ternyata dalam beberapa hari followers berkurang, maka jika pesanan anda drop/turun anda bisa lapor melalui tiket dengan menyertakan id order dan request refill, jika nama layanan auto refill anda tidak perlu lapor ke admin karna proses refill otomatis tapi jika dalam 2x24 jam belum refill maka anda bisa lapor ke admin.</p>', '2024-08-07 07:35:22', '2024-08-07 07:35:22'),
(4, 'Keuntungan', 'keuntungan', '<p>Berikut adalah beberapa cara mendapatkan penghasilan menggunakan Valerie Connect:</p>\r\n<p>Â </p>\r\n<p>1. Bisa Menjual Lagi Layanan Kami</p>\r\n<p>Contoh: Misal di layanan kami Instagram Like dengan harga Rp2.500 untuk 1000 like, lalu Anda Bisa menjual dengan harga Rp.10.000 untuk 1000 like, dari Modal Rp5.000 anda bisa mendapat untung 150%. Jika anda dalam 1 hari mendapat Pesanan 5000 Like saja Anda mendapat Penghasilan Rp37.500</p>\r\n<p>Â </p>\r\n<p>2. Mempromosikan Dagangan Anda</p>\r\n<p>Contoh: Jika anda Mempunyai Barang untuk jualan di media sosial Contohnya instagram dan followers anda sedikit dipastikan Pelanggan kurang percaya dengan produk anda, jadi anda membeli Followers atau Likes di kami untuk membuat bagus Instagram Anda sehingga calon pembeli akan lebih yakin dan tertarik.</p>\r\n<p>Â </p>\r\n<p>3. Menjadikan Anda Selebgram atau Membuka Endorse</p>\r\n<p>Banyak dari member kami yang dari 0 misal membeli subscribers dan hanya membeli 1000 subscribers lalu dalam beberapa bulan sudah mendatang mempunyai banyak subscribers Dan mendapat endorse dari beberapa produk, sama juga dengan instagram banyak selebgram yang membeli layanan kami untuk menarik penampilan agar dipercaya.</p>\r\n<p>Â </p>\r\n<p>4. Untuk membantu membangun Akun atau \"Branding\"</p>\r\n<p>Dalam membangun akun sosial media apalagi diperlukan waktu agar yang tentu tidak sedikit, dengan membeli berbagai layanan sosial media yang Anda perlukan, bisa lebih cepat membuat penampilan akun sosial media Anda menarik dan membuat orang tertarik untuk follow atau subscribe sosial media Anda.</p>\r\n<p>Â </p>\r\n<p>Itulah beberapa keuntungan yang didapatkan dari Valerie Connect</p>\r\n<p>Â </p>\r\n<p>SALAM SUKSES</p>\r\n<p>-Valerie Connect Team</p>\r\n<p>Â </p>', '2024-08-07 07:36:13', '2024-10-15 10:08:50'),
(5, 'Contoh Target Pesanan', 'contoh-target-pesanan', '<p>Berikut adalah beberapa contoh pengisian pada target pesanan.</p>\r\n<p>Pastikan untuk periksa kembali target pesanan Anda sebelum pesanan dibuat sehingga pesanan dapat diproses.</p>\r\n<p>Jika ada hal yang ingin anda tanyakan, bisa langsung tanyakan dengan cara masuk ke halaman Kontak pada website kami ya.</p>\r\n<p>InstagramInstagram Followers, Story, Live Video, Profile Visits : Username akun Instagram tanpa tanda @ // Contoh : my.usernameInstagram Likes, Views, Comments, Impressions, Saves, TV : Link postingan akun Instagram // Contoh : https://www.instagram.com/p/xxxxxx/</p>\r\n<p><em><strong>Youtube</strong></em></p>\r\n<p>Youtube Likes, Views, Shares, Komentar : Link video youtube // Contoh : https://www.youtube.com/watch?v=xxxxxxxYoutube Live Steam : Link video live youtube // Contoh : https://www.youtube.com/watch?v=xxxxxxYoutube Subscribers : Link channel youtube // Contoh : https://www.youtube.com/channel/xxxxxx</p>\r\n<p><em><strong>Facebook</strong></em></p>\r\n<p>Facebook Page Likes, Page Followers : Link halaman atau fanspage facebook // Contoh : https://www.facebook.com/xxxxxx/Facebook Post Likes, Post Video : Link postingan facebook // Contoh : https://www.facebook.com/xxxxxx/posts/123Facebook Followers, Friends : Link profile facebook // Contoh : https://www.facebook.com/xxxxxxFacebook Group Members : Link group facebook // Contoh : https://www.facebook.com/groups/xxxxxx/</p>\r\n<p><em><strong>Twitter</strong></em></p>\r\n<p>Twitter Followers : Username akun twitter tanpa tanda @ // Contoh : TelkomCareTwitter Retweet, Favorite : Link tweet atau postingan twitter // Contoh : https://twitter.com/xxxxxx/status/xxxxxx</p>\r\n<p><em><strong>TikTok</strong></em></p>\r\n<p>Tik Tok Followers : Link profile tik tok atau username tanpa tanda @ // Contoh : https://vt.tiktok.com/xxxxxx/Tik Tok Likes / Views : Link video tik tok // Contoh : https://vt.tiktok.com/xxxxxx/</p>\r\n<p><em><strong>Shopee</strong></em></p>\r\n<p>Shopee Followers : Username akun shopee // Contoh : my.usernameShopee Product Likes : Link produk shopee // Contoh : https://shopee.co.id/xxxxxx</p>\r\n<p><em><strong>Tokopedia</strong></em></p>\r\n<p>Tokopedia Followers : Username akun tokopedia atau link profile // Contoh : https://www.tokopedia.com/xxxxxxTokopedia Wishlist atau Favorite : Link produk tokopedia // Contoh : https://www.tokopedia.com/xxxxxx/xxxxxx</p>\r\n<p><em><strong>Website Traffic</strong></em></p>\r\n<p>Website Traffic : Link website // Contoh : https://smm.valerieconnect.shop/page/site/pertanyaan-umum</p>\r\n<p>==================================</p>\r\n<ol>\r\n<li>Silahkan membuat pesanan sesuai langkah-langkah diatas.</li>\r\n<li>Jika ingin membuat pesanan denganÂ Target yang sama dengan pesanan yang sudah pernah dipesan sebelumnya, mohon menunggu sampai pesanan sebelumnya selesai diproses.</li>\r\n<li>Jika terjadi kesalahan / mendapatkan pesan gagal yang kurang jelas, silahkan hubungi Admin untuk informasi lebih lanjut.</li>\r\n<li>Jangan memasukkan orderan yang sama jika orderan sebelumnya belum selesai.</li>\r\n<li>Jangan memasukkan orderan yang sama di panel lain jika orderan di Valerie Connect SMM belum selesai.</li>\r\n<li>Jangan mengganti username atau menghapus link target saat sudah order.</li>\r\n<li>Orderan yang sudah masuk tidak dapat di cancel / refund manual, seluruh proses orderan dikerjakan secara otomatis oleh server.</li>\r\n<li>Jika Anda memasukkan orderan di Valerie Connect SMM berarti Anda sudah mengerti aturan Valerie Connect SMM dan jangan lupa baca menu F.A.Q serta Terms</li>\r\n</ol>', '2024-08-07 07:37:24', '2024-10-15 10:08:03'),
(6, 'Sewa SMM Panel', 'sewa-smm', '<p>Ingin memiliki website SENDIRI?</p>\r\n<p>Penjelasan:</p>\r\n<p>Valerie Connect adalah portal di mana member dapat melakukan pembelian layanan.</p>\r\n<p>Dengan memiliki website seperti Valerie Connect, bukan berarti anda bisa melakukan pemesanan semau anda dan sepuasnya.</p>\r\n<p>Karena setiap pemesanan yang di lakukan oleh anda atau member anda, akan memotong saldo pusat di kitadigital.id.</p>\r\n<p>Â </p>\r\n<p>Syarat:</p>\r\n<p>- Anda diharapkan berusia minimal 18 tahun karena beberapa layanan yang membutuhkan perjanjian berdasar hukum.</p>\r\n<p>- Mempunyai rekening pribadi</p>\r\n<p>- Bertanggung jawab (Karena nanti akan mengurus member kalian sendiri)</p>\r\n<p>- Di harapkan mempunyai PC/Laptop (untuk mempermudah mengelola wabsite anda)</p>\r\n<p>Â </p>\r\n<p>Pertanyaan:</p>\r\n<p>A. Apakah saya bisa memiliki website smm? Sedangkan saya tidak bisa coding.</p>\r\n<p>B. Sangat bisa, semua urusan coding dan eror di website kami yang mengurus.</p>\r\n<p>Â </p>\r\n<p>A. Berapa harga pembuatan website smm?</p>\r\n<p>B. Harga akan kami cantumkan di bagian terahir halaman ini.</p>\r\n<p>Â </p>\r\n<p>A. Apakah penghasilan akan langsung masuk ke rekening saya?</p>\r\n<p>B. Tentu saja, Semua deposit akan langsung masuk ke rekening anda.</p>\r\n<p>Â </p>\r\n<p>A. Berapa lama proses pembuatan website yang saya pesan?</p>\r\n<p>B. Setelah anda membayar sewa, saat itu juga kami online kan web kamu (estimasi 6 jam).</p>\r\n<p>Â </p>\r\n<p>A. Apa bisa nanti nama website dan domain saya yang menentukan?</p>\r\n<p>B. Tentu saja, Nama website dan domain anda yang menentukan sendiri</p>\r\n<p>Â </p>\r\n<p>A. Apakah saya bisa mengatur harga layanan sesuai keinginan saya?</p>\r\n<p>B. Bisa, anda bisa mengatur semua harga layanan di website anda untuk menyesuaikan keuntungan</p>\r\n<p>Â </p>\r\n<p>A. Apakah saya bisa mendapatkan akses Cpanel?</p>\r\n<p>B. Tidak, anda hanya mendapatkan akses penuh admin panel</p>\r\n<p>Â </p>\r\n<p>Ada pertanyaan lain?</p>\r\n<p>Silahkan hubungi admin via Whatsapp:</p>\r\n<p>085175101443</p>\r\n<p>Â </p>\r\n<p>Â© 2023 Valerie Connect</p>\r\n<p>Â </p>', '2024-08-07 07:38:05', '2024-10-15 10:06:35'),
(7, 'Kontak kami', 'kontak-kami', '<p>Silahkan hubungi kontak dibawah ini untuk mendaftar atau mengajukan pertanyaan.<br><br><strong>Ticket:</strong>Â <a href=\"../../../ticket/new\" target=\"\">Ticket</a> (khusus Komplain)(maksimal dibalas dalam 24 jam)<br><br>Jika ada yang mau tanya sesuatu atau masalah<br>bisa Hubungi kami di:Â </p>\r\n<p>Whatsapp: <a href=\"wa.me/6285175101443\" target=\"_blank\" rel=\"noopener\">Admin 1 - 085175101443</a>Â  Â  Â  Â  Â  Â  Â  Â </p>\r\n<p>Telegram : <a href=\"https://t.me/valerieconnect\" target=\"_blank\" rel=\"noopener\">@valerieconnect</a></p>\r\n<p>Instagram: <a href=\"https://www.instagram.com/valerie_connect/\" target=\"_blank\" rel=\"noopener\">@valerie_connect</a></p>\r\n<p>Our Community :</p>\r\n<ul>\r\n<li><a href=\"https://chat.whatsapp.com/Dm4vM3jXN9mFg9cR4pkYNa\" target=\"_blank\" rel=\"noopener\">Whatsapp Group</a></li>\r\n<li><a href=\"https://t.me/VLShop3\" target=\"_blank\" rel=\"noopener\">Telegram Group</a></li>\r\n</ul>', '2024-10-14 08:14:22', '2024-10-19 11:02:17'),
(8, 'Faq', 'faq', '<section class=\"position-relative py-5\">\r\n<div class=\"container-fluid\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa Itu Valerie Connect SMM ?</h5>\r\n<p class=\"text-muted mb-0\">Valerie Connect adalah SMM Reseller Panel, di mana Orang Beli kebutuhan Social Media Marketing Seperti Facebook, Twitter, Instagram, YouTube, Website Traffic dan masih banyak layanan lainnya.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Mengapa Valerie Connect adalah yang Terbaik?</h5>\r\n<p class=\"text-muted mb-0\">Valerie Connect adalah Panel Reseller SMM Terbaik di Dunia<br><br>- dipercaya oleh 20.000 lebih user, dan hampir 70% user menjual nya kembali dan kami sebagai distributor terbesar diindonesia<br>- Dukungan API untuk pemilik panel dan Individu untuk Pesanan Otomatis.<br>- Panel menunjukkan berapa jam dan menit untuk menyelesaikan Pesanan.<br>- Setiap Layanan harus memiliki deskripsi yang baik untuk pelanggan. Semua Pelanggan harus Memahami Layanan, Cara kerjanya.<br>- Panel terbaik selalu mengaktifkan gateway pembayaran populer untuk Layanan Belanja, Seperti Virtual Account semua bank, QRIS, Pulsa, dan pembayran Lainnya.<br>- Panel yang baik selalu memiliki Ketentuan Layanan dan kebijakan Pengembalian Dana yang singkat dengan jaminan Uang kembali.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Bagaimana cara mendaftarnya? Apakah ada biaya pendaftaran?</h5>\r\n<p class=\"text-muted mb-0\">Pendaftaran cukup klik Register, dan isi data sesuai yang dibutuhkan, kamu sudah terdaftar di Medan Pedia. Untuk pendaftaran GRATIS tidak dipungut biaya seperserpun.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Bagaimana cara membuat pesanan?</h5>\r\n<p class=\"text-muted mb-0\">Untuk membuat pesanan sangatlah mudah, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman pemesanan dengan mengklik menu yang sudah tersedia. Selain itu Anda juga dapat melakukan pemesanan melalui request API.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa Itu Partial?</h5>\r\n<p class=\"text-muted mb-0\">Status Partial adalah ketika kami mengembalikan sebagian sisa-sisa pesanan. Terkadang karena beberapa alasan kami tidak dapat mengirimkan pesanan penuh, jadi kami mengembalikan Saldo sesuai jumlah yang belum terkirim kepada Anda. Contoh: Anda membeli pesanan dengan jumlah 1000 dan membebankan biaya 10.000, katakanlah kami mengirimkan 900 dan Kurang 100 tidak dapat kami kirim, maka kami akan \"Kembalikan saldo\" pesanan dan mengembalikan kurang 100 kepada Anda Kami mengembalikan saldo anda 1.000).</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Bagaimana cara melakukan deposit/isi saldo?</h5>\r\n<p class=\"text-muted mb-0\">Untuk melakukan deposit/isi saldo, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman deposit dengan mengklik menu yang sudah tersedia. Kami menyediakan deposit melalui bank dan pulsa.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa perbedaan semua server di setiap layanan?</h5>\r\n<p class=\"text-muted mb-0\">Disetiap layanan kami memberikan perbedaan harga, kualitas dan kecepatan proses, rata-rata server kami optimal, apabila tidak mengalami gangguan. Dan kami selalu memberikan informasi/update layanan di info panel.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa Itu Instagram Mention?</h5>\r\n<p class=\"text-muted mb-0\">Instagram Mention adalah ketika Anda menyebut seseorang di Instagram (contoh @mustakinnur ini berarti Anda telah menyebutkan mustakinnur di bawah postingan ini dan mustakinnur akan menerima pemberitahuan untuk memeriksa postingan).<br>Pada dasarnya Instagram Mentions [Pengikut Pengguna], Anda meletakkan tautan posting Anda, dan nama pengguna dari orang yang Anda ingin kami sebutkan sebagai Pengikut.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa Itu Instagram impressions?</h5>\r\n<p class=\"text-muted mb-0\">Tayangan berarti menjangkau (juga berapa banyak pengguna telah melihat posting Anda) itu kebanyakan digunakan dengan merek, mereka akan meminta Anda untuk menunjukkan statistik tayangan yang Anda miliki.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-6\">\r\n<div class=\"card overflow-hidden\">\r\n<div class=\"card-body\">\r\n<div class=\"faq-icon\">Â </div>\r\n<h5>Apa itu \"Instagram Saves\", dan apa fungsinya?</h5>\r\n<p class=\"text-muted mb-0\">Instagram Saves adalah ketika pengguna menyimpan postingan ke riwayatnya di Instagram (dengan menekan tombol simpan di dekat tombol suka). Banyaknya simpanan untuk sebuah postingan meningkatkan kesannya.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', '2024-10-14 08:15:46', '2024-10-16 06:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `api_key` varchar(191) NOT NULL,
  `api_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_komisi`
--

CREATE TABLE `referral_komisi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_log`
--

CREATE TABLE `referral_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refill`
--

CREATE TABLE `refill` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `service` varchar(111) NOT NULL,
  `target` varchar(111) NOT NULL,
  `status` varchar(111) NOT NULL,
  `api_refill_id` varchar(111) NOT NULL,
  `api_log_refill` varchar(111) NOT NULL,
  `api_log_status_refill` varchar(111) NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `custom_link` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replace_keyword`
--

CREATE TABLE `replace_keyword` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `api_id` int(20) NOT NULL,
  `api_service_id` int(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `api` int(11) NOT NULL,
  `type` enum('primary','custom_comments','custom_link') NOT NULL DEFAULT 'primary',
  `average_time` text DEFAULT NULL,
  `refill` enum('0','1') NOT NULL DEFAULT '0',
  `cancel` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE `service_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_provider` varchar(100) NOT NULL,
  `type` enum('SM','PPOB','GAME') NOT NULL DEFAULT 'SM',
  `type_category` varchar(100) NOT NULL,
  `slug` varchar(111) NOT NULL,
  `favorit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_favorit`
--

CREATE TABLE `service_favorit` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_logs`
--

CREATE TABLE `service_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_name` varchar(111) NOT NULL,
  `before_update` int(11) NOT NULL,
  `after_update` int(11) NOT NULL,
  `type` varchar(111) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_rating`
--

CREATE TABLE `service_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_recommended`
--

CREATE TABLE `service_recommended` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type` enum('order','deposit','service','other') NOT NULL DEFAULT 'other',
  `status` varchar(100) NOT NULL,
  `is_read_admin` int(11) NOT NULL DEFAULT 0,
  `is_read_user` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `sender` enum('user','admin') NOT NULL,
  `msg` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `deposit_method_id` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `merchant_ref` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('Deposit','Payment') NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_category`
--

CREATE TABLE `type_category` (
  `id` int(11) NOT NULL,
  `type` varchar(111) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `whatsapp` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telegram` varchar(100) NOT NULL,
  `balance` double NOT NULL,
  `level` enum('Member','Agen','Reseller','Owner') NOT NULL,
  `benefit` enum('Silver','Gold','Platinum','Diamond') NOT NULL DEFAULT 'Silver',
  `benefit_point` int(11) NOT NULL DEFAULT 0,
  `benefit_progress` int(11) NOT NULL DEFAULT 0,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `status` int(11) NOT NULL DEFAULT 0,
  `api_key` varchar(255) NOT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `is_verif` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_read_popup` int(11) NOT NULL DEFAULT 0,
  `referral_status` int(11) NOT NULL DEFAULT 0,
  `referral_saldo` varchar(111) DEFAULT '0',
  `referral_code` varchar(111) DEFAULT NULL,
  `refferal_code` varchar(111) NOT NULL,
  `referral_view` varchar(111) DEFAULT '0',
  `uplink` int(11) NOT NULL,
  `mode` enum('default','dark','light') NOT NULL DEFAULT 'light',
  `contrast` enum('true','false') NOT NULL DEFAULT 'false',
  `layout` enum('preset-1','preset-2','preset-3','preset-4','preset-5','preset-6','preset-7','preset-8','preset-9','preset-10') NOT NULL DEFAULT 'preset-1',
  `caption_sidebar` enum('true','false') NOT NULL DEFAULT 'true',
  `theme_sidebar` enum('dark','light') NOT NULL DEFAULT 'light',
  `rtl` enum('true','false') NOT NULL DEFAULT 'false',
  `foto` varchar(111) NOT NULL DEFAULT 'male.jpg',
  `crop_foto` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `whatsapp`, `email`, `telegram`, `balance`, `level`, `benefit`, `benefit_point`, `benefit_progress`, `gender`, `status`, `api_key`, `verification_key`, `token`, `is_verif`, `created_at`, `updated_at`, `is_read_popup`, `referral_status`, `referral_saldo`, `referral_code`, `refferal_code`, `referral_view`, `uplink`, `mode`, `contrast`, `layout`, `caption_sidebar`, `theme_sidebar`, `rtl`, `foto`, `crop_foto`) VALUES
(2, 'valerie', '$2y$10$ozhFOwb0YJCS6khukTk6JuU110nr/B6TZq0ty.mmNO20u3Zt7FPiS', 'Rafa Arfiansyah Raif', '6285784828303', 'support@valerieconnect.shop', 'valerie', 86.408, 'Member', 'Silver', 0, 713, 'male', 1, 'fbb2d8-41bf6e-dfd481-d4c487-8942fa', '770zG8LSRCLwZsklbNAcTgOu9G33LvtreBkuiTdtAwwqpEP91zVcj5Ja85EDB5kFwu4mzWHgpxVKBQNEmxlPM8I02FPYH3O2XD7Tc4IMHqhXCmDPo7HILiqSoK63ejUjdg4sMpmJh2FiQavgkUbnrXZnlWefaFvU0QZKyT6ACAsbYfSG6ynzOYpsraXEx5tCU809RW1f', NULL, 1, '2024-10-15 03:16:38', NULL, 1, 0, '0', '1728936998', '', '0', 1, 'light', '', 'preset-1', 'true', 'dark', 'false', 'male.jpg', 1),
(3, 'rapaaaaa', '$2y$10$nu08cBQGa0nI3Lvo27YH6u3aAINJ0zWhiCrAtSfdVB9yh5vX7qYde', 'rapa', '6285784828303', 'rap.astore73@gmail.com', '', 3.2685, 'Reseller', 'Silver', 0, 196, 'male', 1, '628d96-d79d5d-5114fb-25e415-61f135', 'FJFudrTLU4j1rUJGnce2ryX7vPJKBMl8xgLI1ZhvE0vQc3GaMD9iX99mTEZsfue2D5xgnKXVfH7p2NDKcDaaO0htNRJAt0lw4A8lBwWITkoux6ZQjw6emWeszWj93GCdfmgkRbg1H6Qk7dtOBMCHzx1Ul5X2EWPMazpi84i6cHSOnVS3dq7osTtS5y30yYAQKEikNPqF', NULL, 1, '2024-10-15 06:30:13', NULL, 1, 1, '0', '1728948613', '', '1', 1, 'light', '', 'preset-3', 'true', 'light', 'false', 'rapaaaaa_1728953022.png', 1),
(4, 'bintang11', '$2y$10$bgNPeoUqyKbaCsXZq4G62.QW.vu.WjB6ojC2wfeHdhKgMcW2gF4me', 'Bintang', '6282111119665', 'bintangbulan5086@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '65072b-e1f07a-a78033-3ae85a-baffea', 'HapeN8mduYlUb72CpnBGE7Z7VkdARsSe5XgZ4q5jrzDJhMSE1WN1s9lDUmlnBWb96DgRy26bsI0xSBq02HIzBkcJlCK4TKjA7rihQaeHvOEQqMePRGfHY3uoIKJZf8F9dXVOVGyLF3MD5fwmh52rqYn41tPPaEPiU8CuQJGzbtnTfm4TvpxAvgktxN9a6WkOhtUFiSQO', NULL, 1, '2024-10-15 09:11:12', NULL, 0, 0, '0', '1728958272', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(5, 'anjay', '$2y$10$P/REu8bm2NRdZyQa5ARPzOLhJxbXI3mNbi22cDMXtMQNFCpy.YO82', 'Anjay', '628155177925', 'arbaktigift@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'a1e759-9e3408-f3a656-ce7d0a-90f7ee', 'eyEj2AkqwwvEj7ta9mG16WLaWVXhwceqp8BcQ0FxlfFu3DrSozAAOdR85rNxXqliFW7HTsfmN1KDYRbJatJd8yvrhnPZIKjUXiuP6OQMY7og0vbJC3IANSUgZZLnnPBMcuCf2QW4GbkouvxyplJHG73Tp6MZSseml1RPxUOsdI2thLVeYrGpi2K4gFHkzV95XDy5ahSI', NULL, 1, '2024-10-15 09:12:44', NULL, 0, 0, '0', '1728958364', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(6, 'digistore', '$2y$10$q31Vz2uBE56igblbQVw7WOypskQXFqf8BG825rtFbFZSQPUfsI9FO', 'Aditya Pratama', '6281282692009', 'aadit9345@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'adf409-070538-12011c-744b84-e5cea8', '2q9LPk1m7ag7ChXiwq8ddydkPx1xLlVhsb7DuNdVNfAI0uPzSw6YyUBlIJqZ2kJ9XU2nBjH29AcKE4RGGCbV4cE5tiwmaReoJWteOsl0yNQCTMixrXvltvBOarg3SBnQHfRp9HeVJMNQSYUfLFto8DWv4G5zj60nrTyZ8TIOk1zrbTA5cEhMX0LQsSEDpZejGqoiK34m', NULL, 1, '2024-10-15 09:13:36', NULL, 0, 0, '0', '1728958416', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(7, 'rannzxyyy', '$2y$10$d9CRhGENg/UOkpMtYfFqbu4i22vtNrJvMtNgLZV2pP6Id0gGkbVCC', 'Muhamad Ramdan', '6281214300828', 'ramdangani7905@gmail.com', 'cangcuthideung', 9450.113, 'Member', 'Silver', 3, 278, 'male', 1, 'ff83c4-ee26cd-2d8380-f7f01c-e85398', 'Mh0IPEvb0XVqorT3RAw8OUb0IcyCUovismpmCE9TZQDhWqGP61nxz4XteNCt3Hl8GQgD9TPBVSkGpiQYZgcBWO4Ktjk3qazLiv7cUcD016IxeyYdnnfASFpqnhdhaSkU6Yj7wy99XLEOYJmKWTOKLpj1l2AAaEudzfVNjM5gSrtMusgHXBmRK3RZB2D5faN47FZQGHHu', NULL, 1, '2024-10-15 09:13:50', NULL, 1, 1, '0', '1728958430', '', '0', 1, 'dark', '', 'preset-2', 'true', 'light', 'false', 'rannzxyyy_1729222261.png', 1),
(8, 'shiro', '$2y$10$nD3KrQxP0ZtmGQvw5JqVge4XaUwxvGk8DL7C3Qcv/vEpLws2fMab.', 'Shallow vernal', '6288901990896', 'patekjeh017@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'b69d08-94113f-db20b8-5d0545-98fc1e', '4022JljD8b5UXvCek8bsOcprOIXrlgfLE30nHRBnAYx5ndTMtZFMZtqGvWN57z4El01fRuZVo2EweDIN9yJPrY7xMIU4KAuCvDzaygptChbw01F7cehbBKtksjerf9v18ajRfQA2mWHMSJGwWq6m9i9oyiOxLlmsgH43ABd3JTRY7VCBhxgZS686UXaOzsYpmoLdVQ5i', NULL, 1, '2024-10-15 09:16:22', NULL, 0, 1, '0', '1728958582', '', '0', 1, 'dark', '', 'preset-2', 'true', 'dark', 'false', 'male.jpg', 1),
(9, 'rafky20', '$2y$10$hnEPz6zP.v1BPALWX/n2eusp00YGcu0H2XEwKu0EQSIOf1d4Sp6sK', 'Rafky Afriyan', '6282136811218', 'rafkyafriyan20@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '1698fb-c59c1e-7677fe-6fd1d5-9977d4', 'UsXNn8pNdBI27TYsS0cNPRsYKbhB7cEpV5aE72nJy6wxqav5hp6ho3JoMDfOM9K4AHasiqLQFzt19T2ubveUbZzWQlI14V3OYmjwcRAfd1tridV8MrXPBRwclOJokeCkB8gyHGgAvqoxVNuyHym4DItSGkLzQAv0MGk9W2DH5CS3Eae306rlOxCXYjGIrQnwKFKtUdTg', NULL, 1, '2024-10-15 09:19:42', NULL, 0, 0, '0', '1728958782', '', '0', 1, 'light', '', 'preset-3', 'true', 'light', 'false', 'rafky20_1728959007.png', 1),
(10, 'kenzdev', '$2y$10$qJgRq4WzLg9uOhlr/qpQY.x/I3zUoWi9AMdC5Q3fXxfhkWeekMqO2', 'DexzzYor', '62895324070395', 'anakjagoan999@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '218588-9d8767-2d9afb-02989a-c6b672', 'Ezj1LRkDUcJiGhvtF7K9dOXKk4bIaYcdxMv0QIufShcejYtSWxgyxwCQU2NAAvNSQE1ZlSqGs0eRCdf6sDnMMZUiQEptz3jHJ38LUPZovdVT5lNBCBD3wAg6nqZypmYnzBXfAN2VKHkXgkpWFOhBe4WPoVigD82oqxcK68CL8rbmy3T05lrPuE9uwsrjT1bf7MOyn7Ts', NULL, 1, '2024-10-15 09:24:23', NULL, 0, 0, '0', '1728959063', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(11, 'valsh', '$2y$10$AzDLD403JFimA7UgS6.xZuYYUnIQ5jMsjcx.sSS/IJcfukwcJuGBy', 'Valsh', '6282141525747', 'richvalshing@gmail.com', '', 727.24, 'Reseller', 'Silver', 0, 0, 'male', 1, '4f1a72-ed6996-b94f76-3faabf-11b51c', 'LWOvlMA9sRQVW6l1GHmyBQAJabZwOn8YgrNA637ZXFI2t02pFX0YekdoxEtZPkRrtUljIbeJb3yTRdHiVkEgDw6cKN3qpdkvmfXxB0LCHAL4dphUgcClJ4j2E9iqfJnGvxeF3FCBzGfq18gsmjuuqPKnwvtBP55uITaTaT4MieOMR5rYs86P42VoQcVQOISiSDXsChmy', NULL, 1, '2024-10-15 09:24:36', NULL, 1, 0, '0', '1728959076', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'valsh_1728959882.png', 1),
(12, 'keyya', '$2y$10$Bebp0wrVSvENAT1e6gWe5u/MkyaVEYaG2giirx6q4CwPNWIvRCIca', 'Shareen Laika Keyla', '62882008078024', 'shren0na.key@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'ac9ac1-0ce827-ca74ae-288e68-bbd489', 'SZo3EyCc8gQiC3VpQexZ8Yk4PLtLj26RaniiH5CwJR4As2rjqhrrtnpTNATkBZus5HbtJy5YyFNh4maXnMv2Pvul6TfPoShDDeUXADIlMT7H8rYG8SuLfXO71g0VsdxzIzyK1qLCOSWEM1wRpjgK9Ee9andsH0JKFUvgzQWuI4elbcGccZUFopiJxM7qf5bkX9lD7A6w', NULL, 1, '2024-10-15 09:33:17', NULL, 0, 0, '0', '1728959597', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(13, 'luak09', '$2y$10$aLG1hR7.2R0aQkyE9gOIBOi8MENL6DhzYL/PZ7OhcHrble.6gzn/K', 'luak', '626815133268469', 'elonm4251@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '22b02c-5b2c6e-efa7dc-497aa5-f20ca3', 'mqo0XTIgFAr3uAjYNj6IUaiRGgoOcsdlq4Jk2pxviMdSvBUcIzU8HqMZ49jwHCceDP4DQfs8EwFYXvTG7tc5ZkKKsyM9hpzCFx2uDwObCxoVPAV08yI7hL6LNFP7fXleEBUeJBxemNubafrDC4t0RbX5ndWhK2wJzmdHML8u1qQRhQLizyZO1NZYv2irgolaTpE3f0kr', NULL, 1, '2024-10-15 10:08:13', NULL, 0, 0, '0', '1728961693', '', '0', 1, 'light', '', 'preset-1', 'false', 'light', 'false', 'male.jpg', 1),
(14, 'velox', '$2y$10$3HcZOUevfCG4.ClfuGvm.uQlmtQZi.edtS5Aq..50ehhc0t27JqRC', 'Muhammad Arif Rahman', '6282351108031', 'xboxm1300@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'bf2d5b-af240b-ebc824-d603a4-ed02b2', 'bvfvK3coFY0dVjEnzaLZftvRfCBc18SoN44d5HdJ7tPQbqGcxaF8GPEQZwm0mWkD2pVg6tRnkturoOpMwZ9HUKW215A9FNINeYVDOAVMuyzqj7vLXMSFrdDZhCKQB0IWnMAsiUXjT2qx09u1NgTICnSU3eG6j6EhBOrKa7h1fWAHEse3zimJbshg6X2JT87Jcq8ixYu5', NULL, 1, '2024-10-15 10:11:45', NULL, 0, 1, '0', '1728961905', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(15, 'firman395', '$2y$10$lOCZlPjLFrHDTUo3g9n1duW/25aovgbbn9K6IAjC7dJBzj/HP1QWG', 'Firman', '6285234735596', 'mannn.0339@gmail.com', '', 4979.1, 'Reseller', 'Silver', 0, 40, 'male', 1, '9a9558-9d1aaa-6c9a9e-521539-d50325', 'Q0TOSD0Gd1BTivaMUGCKwtMIxSONpFvItBsIyP3V1o4MWVX7gXhXZJ48RD3bKpwgoJLi84EG2enJmqhh6dXPLzwRRPRBYa85lefJhZnzcoFHEjlrPcDN55p6izTYNAHS7qasH2YkuKmu7jmgybkue9lHxQqiUWnKQ1cNECja3jVrDfMk0tCL96brf9tGdoACOdxI4qzw', NULL, 1, '2024-10-15 10:26:48', NULL, 0, 1, '0', '1728962808', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(16, 'ryudika', '$2y$10$wAnQM04yy1xssRkF52l6OOcykvNWTTOJVZZgbjjtOtiPiPUL8EVTS', 'Ryudika', '628981920277', 'andikarustiwa79@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'e5fdfa-775b2b-7c2e81-06bc39-c89cfe', 'sUapMu9BL6XGqrstllZWxtGh1JBu4sYD4Hc5UV5Jh3eHHS5pzUdgnfHcTFGm2dWOZnarzPeknVc73QkdYm3DC7COmcv90L9Pwz261KajpbEPRbKbD4jLTlpdKqtO6JorgfILMwiXyRQSEOxhIN1XzRToFkqM2F84g08vvFuSYBGhNQ8oZ7iIue1CsAtwJD8lyyAroR9q', NULL, 1, '2024-10-15 10:40:06', NULL, 0, 0, '0', '1728963606', '', '0', 1, 'light', '', 'preset-2', 'true', 'dark', 'false', 'ryudika_1728964049.png', 1),
(17, 'maikadev', '$2y$10$KxtM4y70szFYw/m5.8.fr.sQjF3BFky.SaZFaekN6ENl5o/A8ocNe', 'maika', '6285761413369', 'maikabotdev@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '6823f2-07519c-5e4f56-8ccc6e-ee0ec6', 'jNNOYllVqXEoL4n7U3iDSgyYFRQ2ECYkOpFEgkfK8uHAq9TMyRGaxaAx4Vd30cPqDj05umzWrX8R9VbAUwVwf1mIve5h6loqbYTxj4tJJWtbF8C31TjMc4Xo6dByL6UuPsw73BvR1Isr7i0p9exToAtpJz75ZdGSUvSzG98enZtWO5hhCunDGDNIHaEQyFZkrKwKNhQ0', NULL, 1, '2024-10-15 11:13:15', NULL, 0, 0, '0', '1728965595', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(18, 'aldishot', '$2y$10$sP8eq1qsi7ivlvTxnon8vuR6dyz.ECIbEXw6HJv0kMyDxJdMMH4yC', 'Aldishot', '6281268004189', 'aldistore897@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'f21164-22802d-798f6f-d6900b-6c7eba', 'FEznH9OJMayLQpdz3PLkcmPEfyRo55oLxq47lMt7SNjXfIMmfZJTpXAGV7x7l2B9b0UeDMqhv0sn9x4u4t8WAuiryG8B3g1w1BJmDSrqipeXtWHlR6vCNwPR0dAIGlsckSeCQXW5N3gTKv3HOajrzIzy8i9dTbcA1UnQYtEeULZDVcOKBokmWgHFDh2S6wnaKYEVZsbV', NULL, 1, '2024-10-15 11:24:27', NULL, 1, 0, '0', '1728966267', '', '0', 1, 'light', '', 'preset-2', 'false', 'light', 'false', 'male.jpg', 1),
(19, 'nakiel', '$2y$10$5xkcRko29Gm4frJbxneHTuFviLCodcacePqCw5dguvH6fq7oRItVS', 'jona yehezkiel ', '6283175953910', 'yehezkieljona@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'fe7fff-6dc4db-4f827e-fe0bb1-c9be0d', 'ETrumCUhyaHusfNUvIVQZMx2inydH7Qh8AKH4m6Q4jLA1s5IBf4rgd7GxbK5U2xgSzSNICbRvR91zWpBreTZXklCveIRJzC5UwmvjktFLMcGVpnteO5LXua3EQgpA7cFxJScaFg0OSoyqJkhOnqwTWlKoPDBrD6w0O3nE8qMpGKuYPW9a26PzDYHsdeWloiifM0cDEtG', NULL, 1, '2024-10-15 14:39:33', NULL, 0, 0, '0', '1728977973', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(20, 'reyzhn', '$2y$10$DQxry4ONoi8Z./7JAr1iJ.vGd5./UuC/w8EaB52PKOLGnvaOVbaJa', 'Rey', '6285668273112', 'akunrey15@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '7ffd5e-c2ed1f-84944c-9e9a95-e3cf40', 'QLbefngMX9EF5nxaUbqi45ClZhkSefZgpFZLdyEdKbVWJHjAve05y1k4Nuv6HQJHiBc1fOB8NsaZktKSlqocM6wdt9pTU8G70EO3orIzGWWJDX8IMIwiTraBNtYuv1IzhRV3cOyChT6Ar7esD2TCExfDl2cn7Ozp9U47Y6YPFFbPQNW2PoKGyJjSXAjim9VxamMorA2R', NULL, 1, '2024-10-15 14:44:36', NULL, 0, 0, '0', '1728978276', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(21, 'andrr', '$2y$10$78OrPMvZpR9e2XJHOHVXau1FXqln0GW8ECWHMRv4lOID6iGs38pQO', 'Andre', '6282313080479', 'storevanzz734@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'c8cf23-3c1353-ad8894-a39c4c-76f149', 'CxY6aODuGDBPWKgM2o7cK0TvDE1XxMM7dfSbOgsgo5ux2jCWXe3ia3Jq9ew4VpLHBLwiuAHaahpJFY4yLbNlt2Cz9gFA1z1lrzno5ZdORfnXJm8RlKyQ0tIvDtIGUSTQ9UXSwsR2qePZjbQdHlHcnnm5dSc7IzcVh6pGvOP0G6N5TE1kEUqmKriyk4NFN7JEMw8yrmWF', NULL, 1, '2024-10-15 16:47:20', NULL, 0, 0, '0', '1728985640', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(22, 'bambang', '$2y$10$4rG7240CTLhzCYZtbr6r7OWTLHkJDSOjJDdyLgXTDpUy2sioRczae', 'Bambang prasetyo', '6285142070885', 'ownerfastbot@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'ea7797-b454ca-2dfcb8-052c9c-f329fb', 'sChV6cjbRpUNLO8ow525kqiPBs49QJEjQ95VUrmBihroX1u1DnvAbqpxzDjSJZnMgC6yAw8GaEafW6VpNf0zX4rUxTHVJ3IYIxLThPuggZ6HczmFmJODXaefElyGI7do91ARFnBYEK1YqwdRHQGA4RvOiCU03y4XqYltQtKi22SsTWD9eKZBKMx0kI5cozhjM3Pk8grS', NULL, 1, '2024-10-15 22:50:42', NULL, 0, 0, '0', '1729007442', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(24, 'ppdb9tkpgsp', '$2y$10$ikzCyhZqnncoeM6w6OiX8eR8HtGiNNvT.IRhIYIkuvl8ZNPskxHi.', 'Pandu ahmad sumawinata', '6285861446668', 'pahmadsumawinata@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '498b2b-bf9eb3-12f95d-841c83-e2cb21', 'kCVl8MIKuEeY62J9rXWmfm7yr7hHWOTD7Q9oTjl1GFoIDc9MGzUegsh5FA2I86vTQDrH4qfkKxEhczjMfxtrWCjbYyJwsQjRYO5vfiHvDC1V4dNX5pen3BZ3OUEAam5R8eSsLXLlb3C0iI0BLPoOPSZNhFNRpbaGcVtmSBpoVundx2wqx9wJblST3XZZd8RuA42Pnyd1', NULL, 1, '2024-10-16 07:27:33', NULL, 0, 0, '0', '1729038453', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(25, 'rehanstore', '$2y$10$C68QN.TjdtVHzD/u2Lxr5eBw0x0hZ/yf0w29V7hK4Xx0oF5e4JDxy', 'Raihan Eka Nugroho', '6281344845604', 'raihanekanugroho@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'e9938f-b96378-4b1ec7-b14456-391457', 'ijuE5Uyjipav3VHBmFnj3CVD1rtl2WH48o6rJfIcgO85KeQx7zLJUfTDLNZaJBplz6bf2phQrCb5AONNImu7xf8YPY9kG1Jv82ZHTsRZn0aXMIgYKdNiyQSq6FlM0SEVWsKYtxAFZoiLclRMG0km0wXBoSgPM4wqUQLbucnDEU7W3sdOtBcbegIEDqoGPPpdweTsWk3x', NULL, 1, '2024-10-16 12:32:37', NULL, 0, 0, '0', '1729056757', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(26, 'edym123', '$2y$10$AL2ykVl3wf6q3ybD7hAmrOi9ASpFLGf8uVLIbSDvk1UUOGYVqpDAO', 'Edy mu', '6282152084448', 'edym243@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'a84057-ad93a5-fc76b1-c7f936-19c107', 'tUkmY6mvqKldHQQeYaIznfyHENkbonx0Q5B0lmSg8SZCcqLL1VRAZ4uzPpP3tV8lvU7RkxUosqwR4vgBJ5rsNbd2KYhIFaFPrDpDU2PcsEp3TaEdwXAiKjeyFfuwOrMMqx7ItzGgZyW6rNCOnfM8B0JubLR2YX1mTj4yAS93Ll0g6SD2eCcVV3J9B5jFp79JGh8xZ6ta', NULL, 1, '2024-10-16 14:44:43', NULL, 0, 0, '0', '1729064683', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(27, 'kamil', '$2y$10$fnJYLgKOLKa5hzVKe6Xm/esffRSi58ST0DwX8922HvcU1WPpESiYO', 'Abdi', '6283126390134', 'ganjeahhenji@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '1d6ee3-1e909b-02b09f-4e1b62-8ede3d', 'lATPCb4jGtKxtL4ywm11cuKPvIg9cYi6OYd7fQmlviLLROOnU8pOI6jHxBRuCk6JRGaXN07vFyaKrzbFSEnSCyYCbUFBIkPrLkdoq1p2200e5zW9RkehpnqSe25jWuwJfpBXcbNNVVKwiUQEZDochMmzfM6TEPwxG1gTrT0l2DE7AJ3riu7mgnt9gq4A9AY3vs48aNsy', NULL, 1, '2024-10-16 15:30:04', NULL, 0, 0, '0', '1729067404', '', '0', 1, 'dark', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(28, 'alafzik', '$2y$10$ZYowHC1UgYVrwgdTP913webeBVDmwVuFjRREDFL1HXK5KMmOiArpG', 'AlafZik', '6282125901581', 'alafzik@gmail.com', '', 10123.6758, 'Reseller', 'Silver', 13, 1461, 'male', 1, 'fb6d74-ceabb2-b468ea-7566bb-9ddb8e', 'tf4liGjKOKgcsD0dRULRJZRbA0ekYMBZmkWchSDszJTwE72IzyBWFCMOKx7braqw9uuxRdiWZCwtnxLzpdBp0Gu8ZEE0oNpYve2n8hIsF85DMkGmaVYlX2n549oPXP6qEO9lQyM3rFIvegyFOPTAa1WJnSLLjmjqXVPygQAmosiHSg1vH62t45bvbrhuoNexjJU3Yc4h', NULL, 1, '2024-10-16 18:40:33', NULL, 1, 0, '0', '1729078833', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'alafzik_1729121988.png', 1),
(29, 'dimas', '$2y$10$SvB27nmt7yy.mmGqa1zlvOA4Xv6NnigM86sgRLaU.wvPXkHkkWYLa', 'dim', '6289528881304', 'dimaa2008112@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'ee13e5-2a1ceb-953990-6eed8a-da95a5', 'U75s2TSWLfrKAvCRF1x2F2KhoBNAMTv3bI1lbyIYSfowfmy1evVdj4L5WNsDxD9Hj8XlEVCPVOEZUg4JAWHiBuxcJC7AGHk5O0YDxcN4JPqwsdQ2bunqeoLijr3zjIz3GMuZ3nf6kgqluTyeoQnSYWycHtBzRCXKIaTSkhpc65RQtnOw06qV1XLbZmtMRQm48BF0XKar', NULL, 1, '2024-10-16 18:50:51', NULL, 0, 0, '0', '1729079451', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(30, 'fadil27', '$2y$10$gOzH89/KfvrXpLiJecKthuFOw.NA/3Y1ES3vgzE4/DIZCAmV/ewFu', 'Ahmad Fadil', '6289506368777', 'dilgood27@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '0dcd7f-1c0bd3-f2f3c0-9d7879-d3ba37', '2JhPVYd0oyBlRqhSj4bzzDE2qsqQnWsmvOUiZm1jFAHLZm6opc52uE044HOGtAi1xCpfxObeg8l637WskaIUwQzqgoBivUnfNPjaem5QYw3Lgw72QkNyBKy5dPjrTTc3MGAunaFFZMSSr9Rdg6SKtsLENK9VTKvJxcheX9nVBVtkFdXZHuhXUCxO5Nc81kfWIfJwz7Dr', NULL, 1, '2024-10-16 21:47:09', NULL, 0, 0, '0', '1729090029', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(31, 'admin', '$2y$10$fgVuJODo.i0YHKq7bz5HgOzbAc.KQ1x/FHm83GZ5XahlhAg7DZIqW', 'adm', '6281276400345', 'pa424013@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '6f6bb8-f731fb-5712b8-02c525-745ba5', 'lxRX8aOLumBeCjDWDutmW9Qcai6TJJZT7yhjELVv0ZghFpeuU5gEK2PM73GoBNdRixQkpD0nOq8CSbKxhgTVR5oz9kiYFKObWlPT6QHpfdb24BLUNMvncypZYgmw9BaEoYlJERhNXGuSCaLX1QF2A5bCYHWj3V71rfzS1ctrwz6Zv3U8UySfIHqIXAsdrsc8w0lvVesq', NULL, 1, '2024-10-17 06:44:39', NULL, 0, 0, '0', '1729122279', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(32, 'zannmods', '$2y$10$8GYMS80M6CCxExk2KaoA8.AoioBC.x9TbrCm6vcRxzFnJyF5CCHSC', 'zannmods', '6288298793719', 'fauzan.official950@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'ed9708-3a20d5-b54718-6463d0-d9b14f', '4AjVMb1NcgNAVBZyy9oiUqC22sErPmFXjdejbISHRVm0X4JlsAonlVaKO6w9SrJzelnPC3bHux7c9OoxZvQ11WEyfLzF5gPsNsrKLpuTrHuXRG3lpOptecaAQbfqdyMtgvIOI5KKn5h0v6YZ6z8MxFYYaGizwGDwBZJCmDH8txU1N8uL0inIBjBSPWeovTQQh7C2kG9f', NULL, 1, '2024-10-17 08:39:48', NULL, 0, 0, '0', '1729129188', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(33, 'borara', '$2y$10$KZV6h53NBzwB5RcVURLJiu7DB69DatZ7yOx7Qbqto.DV7p0C2LUrO', 'Borara', '62857311528577', 'xrrexzz@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'e6e832-ffb13d-669620-893e9c-43c34c', 'w1OSaSzQZt0oEGPIrdx54aTlihexwkLFuWXwzXYaPHLz75ypoh3md1wKIb9l4qD6XK92N5GPysjAl0Tt30nUIfgQxBgStcJ2JnQ3Fk4BVsSPZqCp2AVLuRbK1UDmvH86vbYkRnBC0e1GNv9OcpmuHBUToUsjO7CM53Jd8ydFT8oefERY2rR6xaAy4zcjfr9DvhpgiMf7', NULL, 1, '2024-10-17 16:19:43', NULL, 0, 0, '0', '1729156783', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(34, 'praditya', '$2y$10$fWqaUElxDdAcfamApjiCF.DPa/Z5f00pcHVWP4fss7.RWudQZvoOm', 'Praditya ramadhani', '62895609250207', 'aditjr405@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'ab2afb-713a3f-18fd9e-72dfdb-215a2c', 'geSX03J2C2FRn14r9YmPycdttXjYEicxjagRmNR8ckQhRwJUBriS6uCAf3epsmEV4bxnAyfYezvAgLvVWPVjzusMyL1UHfSawGZ0gpKk4EqiyOOhVh6XCHEtbioOzIT5NtZTCoNGemd3dZrzb77MBqDsoA8QjvH00LU9lbPDSxXls98I7llaWkWFDwPJfJ6DMTwYn2xM', NULL, 1, '2024-10-17 17:03:09', NULL, 0, 0, '0', '1729159389', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(35, 'monok', '$2y$10$jPfswxVTNFABX3/XRxxVeuI1SzswwDDhK9p293vex.velEdXApJri', 'Alfian Saputra', '6281521563892', 'Bakhrisaipul489@gmail.com', '', 26096, 'Reseller', 'Silver', 15, 1404, 'male', 1, '7dd43c-ff0978-9fc61a-eab209-5dafc2', '46MNfwDiOpkC7YNCshAeJPHUqEugyX5V7Ef1F0W9MnQGeidlZACzVqQ3KGIcVs3c9zrBHmu4tpGhNTS0jQn6tMb5m9PWKc3ZtLHB7nXYWpyDGkjRF1Vb8LdmnAx1w2yf80lea5txSj1RwSUYWQ6RmOvudUhfg9Oax4UEaoY2l2psaFLJZEqKKZk2xrL3sko4hi0BrXHS', NULL, 1, '2024-10-17 17:06:25', NULL, 0, 0, '0', '1729159585', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(36, 'madd1st', '$2y$10$UBOgCuxOiudu4WEVcoLeROv9lt66IljtTj8zmsc1MOZsTc4uydAWi', 'Maddd 1st', '6281263843003', 'gejet1677@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'bda4d2-5f5edc-c9d44b-771e9e-dca77e', '63PVkT6BlJvsyyVFLUXVp5Qtu4cmzCEiWbCi2N1gS8jiwSTUsY47ArNKlQWzoa87fYUMpdnaqOeY3REg0RqKSe4uAn6BIo0G1r27RA9fvTfb9Vwk9JbLhHcD5tkjmtpFiNE9qPfMDBw2lphQeJPo7SZlXCW8yEkhejxrQsZGqCxMW8cnLtxOIZ0sh6FFBwznXRZOY3Hr', NULL, 1, '2024-10-17 21:10:29', NULL, 0, 0, '0', '1729174229', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(37, 'alicha', '$2y$10$0Xy5yb3sGsL6c2XAlimKLu7sO.NF.w1wg8JAT/UICHvkdteAw2Jpy', 'Alicha', '6281400346604', 'dheriap248@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '108c68-e56f34-31932c-5a2b36-335b71', 'rFjEITlgNEOJSgpXfdyQB5CivlPkbe36Iq9cgKVfwxhK6VmLaVwF3uOnYYIFMAYe5iS104canGBdoWycqcbr0hUsebHAB87rCES1PJdsUMmDjkTYRjMnhsD3i9tys2ZK0LWp7NutWkHC7npm9X8JAzvWKVqGIw5zOo6zDx4QvxNuogZ4yr3fHD2kbphQPaORLfPXtXtm', NULL, 1, '2024-10-17 22:59:39', NULL, 1, 0, '0', '1729180779', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(38, 'situmorang', '$2y$10$fp8weqFrpKYEuBtRDVJ1jOCqfhYzknSARCJKTJcxKZlEJW8LqzZwi', 'Situmorang', '6287852632203', 'Bremasitumorang16@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '47e89c-972a07-ecd8c5-56c4c7-c9c00f', 'J4yqPyxSWrwXhOJ1w5G97t2HLI0Yk5fHwCgxTxNnMpKqEUiytfK87LUlNd8rm1a01GxzVHgoR2Dqj56bWGM6OdroFhAXAKE39ERvoKLgeUcVMflaQlDkAVRutZR3JBj4uaCBFBbJeqOupmvitQi5EXlZiQ1suXn3jWdL4cPQsZvMpW7kAYVTZdGC802Tb2wF09hBsvjF', NULL, 1, '2024-10-17 23:37:12', NULL, 0, 0, '0', '1729183032', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(39, 'hekeichi', '$2y$10$igBrP7D7hs9HP/P9qVXWVOnbyc7481EQEhKFQbLnMh8je6Y3IIA3C', 'Hekeichi', '6285735150426', 'hekeichi@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '6dd810-9b687e-a11eed-064bf4-d3d0eb', 'XBrnJIWJQhhqlAFaYiTGustzK1YP8wmRYj3uoqu0BKdSrxsicl60KJUM47cGtA4U1iGzObjU4gNfZyhiBDWNSfNJxmsfejLe3b30wo2xI5k8aLksfaSdF6oI9en2V7GECHNwXr0XCZbxMOS9MqkvvpKDW8TpF5djgIUErnlmbCRtTpkLyAVcAEw6QcWo7gTD1qPaHH2O', NULL, 1, '2024-10-18 04:08:15', NULL, 1, 0, '0', '1729199295', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(40, 'fannstore', '$2y$10$ZTPzAX2n7qe/yWSz5o63XeZVr7gnga626SmQBBd8MgcLuRyqSLIX6', 'FannStore', '6289526844278', 'ngto69499@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '7f5763-92a48e-d89550-bc16ee-94ba83', '8rSXBpNIyLqCYoYjJyGsufFkN5kQpQmPry0YYo4X2ZnVAx3u0nUBMe7T9ZjnMBFeCRmtvhvwbE1Sc9uCIkolr5BMK6udPHT3wD3MXUet1a7OEgPf26LHsJpOg8gsqARtNeb8cPzULWVOhQdHz69EVpr0AwjdoizT2hLckNDQ8iFOT4VGzldIZCiI1f4b6xRGAHmbxWll', NULL, 1, '2024-10-18 08:39:07', NULL, 1, 0, '0', '1729215547', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(41, 'fallzx', '$2y$10$BcXW/GZmQUTW6HuiyIt7O.YjEkSP5F6iQUlQObzi/O.gGZDsBfKn.', 'Fall', '6285813708397', 'fallzxcoderid@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '9a930c-e128cf-abe2b5-e43986-679fcb', 'BX9eO3WIhvMEomz7PS7oEFIJG8ZZDN7Czyzi1DWTX1R5f9GRyPsJu6wWjT9dkabu4nlthcHqjl04pgNIVKs0OHdq0dlg9nXIFPiJfUWdMHN2mYqLVipaYrpx2ubAtObUi1FCj6cEytKSkBx35URxFfvzcCS5HshDrtwjZBAV4UNsPlwGeLBOMQ2QekJAG1KKhCm8broS', NULL, 1, '2024-10-18 09:44:39', NULL, 1, 0, '0', '1729219479', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(42, 'ganteng', '$2y$10$lUPAwcydCcEb4VVaTwSImeSb55KcKOJkMD3KvPtGnlPniMN8.Px32', 'Syafir Jatirasa', '6282246187899', 'syafirlynelly@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'a92a5c-671a6f-2cec9a-36ef57-82e95e', 'kmDimCFM4Y01sopCOPj8qyJbwUI66wQSRn5hVpfy49jo2AU8cHtKFiePxYAkASMcfAktlFqdsru0DT739gcaaQNVBaovYEMO2uiWOo141O7XMder1XKkZVRSt8x3KmcJPhdg4ZXbF3EpaX7vmLQxGVqh0jfzHwsIZWviHnCD6lWz7lBY5GuCqfznHRBLN235L5yBEI6T', NULL, 1, '2024-10-18 09:54:49', NULL, 0, 0, '0', '1729220089', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(43, 'ranzzxyy', '$2y$10$lmrsNu5vbBxX8VH9a4fIAu/jAQazxF5VXnWKR7bHDL5W39zm5ldbW', 'Muhamad Ramdan', '62254776549863', 'kurniawank7905@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '5b54bb-3ba9c3-196746-c035f1-338ef9', 'BI7K2ToDV2W9BJAOmHO1g7aJyd8XiCZmE0ve31wFGuLAXvGnltHpgHkUPK5LUsdKNNf5gpkwPpwENvG7s4hNY2SnRkRrDqoWTc9wZDZfWq716lx2zjCBCOuAQRxlrpXmPizHLaLGr90udbFMetsuMVitzBzteWQx4Mj6y0yqo6hTErAR5KDQjFihmeI1CoTVl4bb8fYS', NULL, 1, '2024-10-18 11:01:27', NULL, 1, 0, '0', '1729224087', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(44, 'sukicau', '$2y$10$5as/Wu2SFWCOG9xHe1uW3uv1300cNg2Nv0w.pjgoTmi5mPrKJ2m2C', 'Sukicau', '6285776354971', 'mabaryuwahyu@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '9521b4-973c26-2fa268-128afd-c0a77b', 'SbKeklD6QQZ3fwI8v5FkcCWTtoOKcRCJup0dmsEr9nPgQSsw7LJ3SADkZpZUOIxrnqbGjO9HnvNmTYmTaBFFiV1HZYFCMvLxecHI8cVLzg362AdgDb32l6XtGUKMOXLh4t1isx5siP4XP9hwqAMGEtleKjY7JmRSlb420aqpykIafNofyzEoBVra8Jru7W069q5104fp', NULL, 1, '2024-10-18 12:27:14', NULL, 1, 0, '0', '1729229234', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(45, 'kyzryzz', '$2y$10$uUYNibBJ.zsz8C5QBjSjPuePkGO2AVo1Oriq/ogq6u0U6ZMoOvHZO', 'Kyzryzz Hayanasi', '6285921655444', 'cs.kyzxd@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '6d1925-c6d9a0-0b4eac-3b15eb-4416b4', 'rifgLTR9KbDPpYhGRwvWqxEozUZPabiAsyS90GJjPjI13fz2jFHF2OT9BP5S4D8lQ2ErOFiACY510VX6Hgckalg3XlnQq0sHaORWqIwy5fxg4C8rbJVea1ckb5mU2sxLxuOoSmNvJLVIT78yGKGNZy0rMQnWtokKJcMpCMeNh4BwqBA1LiVtezXe6SdKM76Anv39oNCR', NULL, 1, '2024-10-18 13:53:45', NULL, 1, 0, '0', '1729234425', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(46, 'riooxdzz', '$2y$10$1pwAmD28A4qgMOBKRN3LJ.RKVhzl6XuCT9Q3YVMuaIKymzb5pylFS', 'RiooAjah', '6285691304150', 'riooxdzz@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '50689d-3d8ecc-8a0f2b-1bb307-40fd36', 'rHVOJ2bhwA4iVJKyF6G3yi36hcTdoXyKXjRFC6glDZTsRx809zPLtT9QU4zavIYIqLjt7wgpbeGr0bSmf5PeMI1mWUJVRaI3KlLi2rv19wEpPOe5pm7tYCan47LPqBWFwqyWhC7308fSBE8igejlNBYFZo6d2MucHuG24OuDTkh8nxYvCQMRZtk9rOcAkm5VpDNSqnuM', NULL, 1, '2024-10-18 14:16:01', NULL, 0, 0, '0', '1729235761', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(47, 'fansyah', '$2y$10$JUSMUvhimFLSBXc1w/DwC.4YhxlkJOUARFVdh3KbkBVhe4mw2WcCW', 'FANDY', '6260192448122', 'fandyturuuu@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '8f2e43-ad9d1c-4787bb-00c506-bfe3ee', 'jSn9CfP02jxMyMaGYYZd9RLJT3eqvE5ePvtDDoFJwtdRbATzgO3P2kXQKI1XcIa1cBPkTwrWpB6bNBahx4v5vQEqRfCpFcqa05hlNw7fwz48O717WR9riBKUejDQGgIiy3SdLnub63xy8uDEzqXumor2ZHeEKNOscALWth9s4F8lAndAopJVnHgV0Xi70UubmHCh6OmY', NULL, 1, '2024-10-18 14:56:09', NULL, 1, 0, '0', '1729238169', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(48, 'zennstoree', '$2y$10$Y4ESZOgWTfq3jYUu./5GQOmYQ8J0BH61BFQZDMotOzYFIdPojClfG', 'zennstore', '6289699340701', 'satriazenn@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '9c7c47-4ba8f6-ebc939-14e52f-daf86c', 'xMFBdySjn5qDnDZxuJ0pTcCjI58QMuYc7KuhXqPtOc7a9wIMSWZeEvKNkAh2tGHXkk2b4DT1YALO0alWLJrhnSbzz9xyURAoJ3geK1tO9Vsylgf6AO18l3Ivr3IUZYJ8pGXsvN7MECHrdy2dgw9mPxaoG2Pij4BCWEQXiHzbuoFgiNB8hriRffswz55c6CbjLHZqtS6Q', NULL, 1, '2024-10-18 14:59:04', NULL, 1, 0, '0', '1729238344', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(49, 'lapendaf', '$2y$10$GmnsjAF0scmd47acg9GCC.xdbpcVixx/K0w9Attbg8MyuZdXVVgyu', 'ariyo ', '6283890931278', 'ariyojkt221@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '7df68b-0249e6-9b17bf-aab81c-52e528', '6dnYpFwkcCMDfRHN799cP6HrJWwE1DnsQQquT3C60CvENbxVFHWZhaKos8qmfe0e4ry3tlzAFadAyhp57O6yAt4JEnGbzefRGuKMxjKqLFTGsIPU17vhczaMumdOljUYBkqtZlj29aMQp1OUB3YI0SdRogDGPrLmzn7JXU9i2iKi8ZZ4xOgBPw8vQsNeYobXCVEriSSW', NULL, 1, '2024-10-18 15:06:19', NULL, 1, 0, '0', '1729238779', '', '0', 1, 'dark', '', 'preset-2', 'true', 'dark', 'false', 'male.jpg', 1),
(50, 'zrteam', '$2y$10$QeeLnE0jbyQd.CQg9pRtd.Slofe2lcCI8PTm8CTiACkYscH2o6R6G', 'zilfa', '6283127596164', 'zemoramd@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '858b94-625481-666fcb-b9e7ba-bee67b', 'dqTNrRS3IT6VeZbmRK0agzKcBDjJrfusNU4wXYZKutlLTkY2w0nO27R9IhGzKSxxZFENzHFi8VMfaXjs0p5xCpe4djAl4ccbwQAvQztHeOfyrLsonHsl2mVBBJbGFfwOk1FvJhW1MAVPXDQMp8bEhmUmu8nn7S76aI5vdhdL7aTy8ZPttRIPqygk9U5NlC4YGoJ3OW9W', NULL, 1, '2024-10-18 15:07:00', NULL, 1, 0, '0', '1729238820', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(52, 'puputtz0303', '$2y$10$LPIYVg82EwEJsOeWV14P/eaeU.sYMxIu.00B4Fo6KMpyrEHg7VU3i', 'Puputtz', '6282117951269', 'netflixyanti3@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'b10138-d54f16-c46b5b-ae4001-6afb2b', 'Lc0FZExEtPXYMerlpbkBjvyp7h141RovhBsmJ5bawvTKYHQZctJiiywXmGwkg3EMUAVTdouV0Bxl63OideYS7sLSP98eoDgjXNV97n0NS3IAGOW5tbD2KcTQ4hKlfiyh4LJBpHgfk0SzRJZTfQRD4OnmPzEyCN3s86LndP6fHW8sq21KMCURulX5uCUredprAWjY9Fr5', NULL, 1, '2024-10-18 22:23:03', NULL, 1, 0, '0', '1729264983', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(53, 'meithree', '$2y$10$qOEM2xcJu0tjlFq2Hz0iFuTgKtOKY193vzO6EI26a9eB3QwkBwi1i', 'Yona Meitri Atika Putri', '6282285487066', 'tikaa46uu@gmail.com', '', 5000, 'Reseller', 'Silver', 0, 0, 'male', 1, '65836d-ab5311-f5f440-20311f-e35115', 'qG236e6LVm5hu87T5ByluNSAyfaRxm3pGuS4Q42xPHBsoJ98oFzOed0W5ndmfVj3KfZQyswJKKko8aXihEXSQNTeq6r2rJPFnCHiYd9dTICqRaEYAJcOjCRrqDMvUhMVF1IPb6rX2ez4QYKFkchwVfIcvmzPT1U40pg1aDwNOEtlWZ3XbSwi5IH1GMzL9btLiNEWGt7k', NULL, 1, '2024-10-18 22:55:07', NULL, 1, 1, '0', '1729266907', '', '3', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(54, 'ptraaaagstn', '$2y$10$tO/CKRkJqwblrkVtyIya6.J1tT9.IE9aufOwGe/vAgtIQQt6beQDS', 'Putra', '6283150516123', 'suryosaputra0707@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '5931c4-51a29a-307b64-26462a-30a11b', '87ueD4w5mhtEGRSNdiGvKOnuStQh1nPMaHJQaV1CyajQXTfiOErcqgT1soh92oSZNbuYPcDlKi6yXqCDkMmnBppGyzxB5s0AJ3Jag84egmd3NlZf6yf3L0KYW624AG29OOdClpwLIRsvqUb2rzIfUtzigMPJEkFve0wk4jWCHRh5WlVRw06e8KYTnvxF3cLV57UTcHjz', NULL, 1, '2024-10-18 23:02:36', NULL, 0, 0, '0', '1729267356', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(55, 'mannid', '$2y$10$K7PTwzggaBqx.txIf8C58.NuAAkcFGz0jJnIoWLl.Zl8I3R7e1nrq', 'HERMAN JAYA LAIA', '6281270230782', 'prolemon204@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'dacc70-978b56-b69b3b-e5afda-1a56ab', 'AUQBJA7Y8mvYbk3TSyaNopm77X0Cfyse4XfUsnjgGfUyHIIOThbrGDeQVlv6BzHNxZTiORYrBT1eDSL5D8RjaZ7ln5SnWy400OzbiVrisPWdqpMgPqFfDQcsLHxuqwKFe1xNJ92l4w5tCMLE1uLooNBkHlXMdxh2EadrAQC096gtv1inJ6VkwKj4oCXat3cbpGw2J8KS', NULL, 1, '2024-10-19 01:08:03', NULL, 1, 0, '0', '1729274883', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(56, 'amelia', '$2y$10$Pk.kF6BsRCGrQAsfolzLd.lFmqCZ5aPZRuU.xIMCrlz64HBMmhhRK', 'amelia', '6282389924037', 'ameliavaness4@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, 'c23bd8-e80ff7-3b5c7d-7b66b6-cd1970', 'Q4RHiIybO8LdBlGhEZgHfSF4P6wnckUpIjqv0EpPJfWRqyuRlrhCmCbteZATuCnkH1NAmB538MDJXOBDffvzceYGOA23cz2WW7j69VkqcL2a2KJ0F1i1U7odGmuNK5IeanIYdZ8xpEhUsVCi30sWTs7FVwLwgha0pXrqRKmxMPQlxDdALBrTJgzXg15tbbjD69saxvSX', NULL, 1, '2024-10-19 01:54:08', NULL, 1, 0, '0', '1729277648', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(57, 'skdodjfn', '$2y$10$TAhHE8aSSKYVrMQi2/fY.uIVUevD4/psXhqUeE8deK.tvJ5IdfrHC', 'Kontol', '6283853531314', 'muhramgunawan112@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '62db43-9b35e0-4ec2da-9bc206-ad6a14', 'tmO5ACR0sPxQ1VrcpIKpTCjOtsa8TqbbFpBcTVMh6HEyXcdZIVJ1zJMFko7xdRh954MDvpmNuWtl0XAJiYG8o7DNvA1XerXgcyCG8MWOTaWQZtPHLHjgF20U5hDGNeOyo36VKHqfbjkWS2felEqf9UiuliERvr0B3Sssagw4IKoAwn1zYuk7uxBIq9Pzw6U4yQk3nJb9', NULL, 1, '2024-10-19 03:02:53', NULL, 1, 0, '0', '1729281773', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(58, 'fadil', '$2y$10$BDIHo32QXKMCLVudQaE4uuHaLCstYY3KtEHZ4FwyfplzvQ5hsu2Gy', 'Muhfadil', '6282187525824', 'muhfadil102938@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '3596d3-4a16ea-5393c8-bb5849-c1d266', 'HbNuhqOphhMOn5U4T5irBbe4kQ8CO7RPMh6yu2jJxIWcT6lJCO050qvGl7y9E21Yrsmdws8ygLiaXctKDtRL1XKW88CUHmBkPr6qnXoH2GNdxcgZIDVrdafIBuyoE4UlFsjgeS1PvIZH0bndCZt3xSpwbKSXDWk2E6TzYm3AfwQk5MZ99W0BzlUFMLSLzv3GoxPQtQ9c', NULL, 1, '2024-10-19 12:00:21', NULL, 1, 0, '0', '1729314021', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(59, 'nikkywop', '$2y$10$E0PRKOKoFSmlrm31njnh6O.p/Z.Da8eAB0JZOscNwZIF684nbG9gG', 'Siti robiatul adawiyah ', '6283815584661', 'siti1234hrsa@gmail.com', '', 5000, 'Reseller', 'Silver', 0, 0, 'male', 1, 'd805d8-772037-8a6730-353b1f-d5b49f', 'Ibvydocc6W7rYyFAaA7mX8DcG1hON5tTZ6BbCbQz8gFS92LfKsuP6goAR7ENCqNDmoqv3xTpSIYbLVtkl0srjpkgVkwqemfx2Emh9BBk8NiU9h1nRs2Jw6A7FP4QL0ag5pfE4qxVPRiHUCvdFOHM8WScXadlGwI9OrTBnZdn2veup1zHtyPs443KSRX3DxEJDKZMTeQL', NULL, 1, '2024-10-19 14:01:05', NULL, 1, 0, '0', '1729321265', '', '0', 1, 'light', '', 'preset-2', 'true', 'light', 'false', 'male.jpg', 1),
(60, 'ditzje', '$2y$10$XTLtc.OdEplQHxUnzHXOjeApaNKP6y0mr6K7GnotIlH0L5QxaEjyi', 'Ditzhosting', '6287894442115', 'riskiaditya22044@gmail.com', '', 0, 'Member', 'Silver', 0, 0, 'male', 1, '30ced3-e077d7-760f1a-901acc-70fb74', 'hpwJk1UVmangPFxT2rQSK8bj0x9WHzVNu3U8NVHgpXu4aSbDpbUsEFcDeKGkvz2yEhqIleK9FGi3Gwf1YpquDQBORI5rZ4l6tN4rMVaDjrOHSXCC1j7WTAduMkEMgRZi7onEZvXnPywKfZ6vQqPoCd4XbowjmYx3dGN2cB0cfyPBJsRn6Aazsx7gitYo9J5Q6FABmL3L', NULL, 1, '2024-10-20 05:25:36', NULL, 1, 0, '0', '1729376736', '', '0', 1, 'light', '', 'preset-1', 'true', 'dark', 'false', 'ditzje_1729379142.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_config`
--

CREATE TABLE `website_config` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `name` varchar(100) NOT NULL,
  `placeholder` text NOT NULL,
  `field_type` varchar(111) NOT NULL,
  `config_type` varchar(111) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;

--
-- Dumping data for table `website_config`
--

INSERT INTO `website_config` (`id`, `code`, `name`, `placeholder`, `field_type`, `config_type`, `value`) VALUES
(1, '', 'title', 'Title Website', 'text', 'appereance', 'Valerie Connect'),
(2, '', 'favicon', 'Url Favicon', 'text', 'appereance', '4aaf41a117a5b69b3342aa1095593205.png'),
(3, '', 'meta_author', 'Author', 'text', 'appereance', 'Sosial Media Marketing Panel Indonesia'),
(4, '', 'color_theme', 'Color Theme', 'select', 'appereance', 'preset-2'),
(5, '', 'bartitle', 'Bar Title', 'text', 'appereance', '#1 SMM Panel di Indonesia | Valerie Connect '),
(6, '', 'limit_order', 'Limit Pesanan Jika Pending', 'text', 'info', '1'),
(6, '', 'short_title', 'Short Title', 'text', 'appereance', 'Valerie Connect - LAYANAN SOSIAL MEDIA MARKETING'),
(7, '', 'about_us', 'Tentang Website', 'textarea', 'appereance', 'SMM Panel Indonesia, Jasa Buzzer, Link Penambah Followers, Likes, View, Subscriber. Peluang Usaha Bisnis Online Anda'),
(8, '', 'terms_link', 'Link Terms', 'text', 'info', 'https://valerieconnect.shop/page/site/ketentuan-layanan'),
(9, '', 'order_info', 'Info Cara Pemesanan', 'textarea', 'info', '<p><strong>Contoh target pesanan: ðŸ‘‰ </strong><a href=\"https://smm.valerieconnect.shop/page/site/contoh-target-pesanan\"><strong>di sini</strong></a></p><p><strong>PERATURAN SEBELUM MELAKUKAN PEMBELIAN</strong></p><ul><li>Pastikan link / username yang anda input sudah benar! (tidak private,tidak salah input, atau semacamnya)</li><li>Pastikan format data pembelian yang anda masukan sudah benar! (mintalah bantuan ke admin untuk mengecek format data pembelian)</li><li>Dilarang memasukan data yang sama apabila pembelian sebelumnya belum selesai! (termasuk melakukan pembelian di tempat lain)</li><li>Apabila saat pengecekan akun diprivate / link tidak diketahu,maka order akan dianggap completed oleh servernya!</li><li>Tidak ada jaminan speed akan sesuai dengan keterangan layanan (Itu hanya estimasi dari kami,bisa berubah sewaktu waktu)</li><li>Keluhan pembelian dapat disampaikan kepada admin APABILA pembelian sudah melewati 1x24 jam!</li><li>Dilarang meminta pembatalan jika itu adalah kesalahan input dari user!</li></ul><p><strong>*Tidak ada pengembalian saldo apabila anda melanggar peraturan di atas!</strong></p><p>Layanan ditulis dalam format:<br><strong>SERVICE NAME [MAXIMUM ORDER] [START TIME - SPEED]</strong><br>Kecepatan pengiriman dimulai setelah waktu mulai.<br><br>ðŸ”¥ = Layanan teratas.<br>ðŸ’§ = Dripfeed aktif.<br>â™» = Mudah Untuk Refill.<br>â›” = Mudah untuk cancel<br>Rxx = Periode isi ulang (xx merujuk pada waktu isi ulang, misalnya: R30 = Isi Ulang 30 Hari).<br>ARxx = Periode Isi Ulang Otomatis (xx merujuk pada waktu isi ulang otomatis, misalnya: AR30 = Isi Ulang 30 Hari Otomatis).<br><br><br><strong>INSTANT</strong> pesanan mulai dapat memakan waktu hingga 1 jam untuk memulai. (1H waktu mulai pesanan biasanya membutuhkan beberapa menit untuk memulai).<br><strong>H</strong> seperti 1H, 12H, dll berarti Jam.<br><strong>HQ / LQ</strong> = Kualitas Tinggi / Kualitas Rendah.<br><strong>SPEED</strong> HINGGA xx / Hari, mis. Order 10K / Hari bisa 5K / Hari, kami menyatakan kecepatan maksimum, tolong jangan uraikan deskripsi untuk bantuan lebih lanjut.<br><br><br>Layanan dalam kategori \"Layanan Murah (Mungkin Menghadapi Beberapa Masalah)\" dapat menghadapi beberapa masalah (Waktu mulai, Kecepatan, dan pengiriman dapat memakan waktu lebih lama daripada yang dinyatakan). Pesan dengan risiko Anda sendiri dari mereka.<br><br>Layanan dalam kategori <strong>Top Best Seller</strong>, adalah layanan Berkualitas Tinggi dan sering dipesan oleh pengguna kami.</p><p>Dengan melakukan orderan Anda dianggap sudah memahami <a href=\"https://kitadigital.id/page/site/ketentuan-layanan\">Syarat dan Ketentuan</a>Â Valerie Connect.</p>'),
(10, '', 'deposit_info', 'Info Cara Deposit', 'textarea', 'info', '<p><strong>Cara Melakukan Deposit Baru :</strong></p><ul><li>PilihÂ <i>Jenis Pembayaran</i>.</li><li>PilihÂ <i>Metode Pembayaran</i>.</li><li>InputÂ <i>Jumlah Deposit</i>Â yang Anda inginkan.</li><li>Transfer Pembayaran sesuai dengan nominal yang tertera.</li><li>Saldo akan otomatis bertambah dalam beberapa menit apabila Anda menggunakanÂ <i>Jenis Permintaan</i>Â <i><strong>OTOMATIS</strong></i>.</li></ul><p><strong>Penting !</strong></p><ul><li>Kami berhak menghapus atau memblokir akun Anda apabila terbukti melakukan kecurangan pada Deposit.</li><li>Jika menggunakanÂ <i>Jenis PermintaanÂ <strong>MANUAL</strong></i>, harap konfirmasi ke Admin agar Permintaan Deposit segera diterima.</li></ul>'),
(12, '', 'meta_keywords', 'Keyword', 'textarea', 'appereance', 'Valerie Connectl, Panel SMM, SMM Panel, Panel SMM Termurah, Panel SMM Indonesia, Jasa Sosial Media, Jasa Sosmed, Followers Instagram, Followers Instagram Gratis, Suntik Followers, Layanan Sosmed, Layanan Sosial Media'),
(14, '', 'meta_description', 'Deskripsi', 'textarea', 'appereance', 'SMM Panel Indonesia, Jasa Buzzer, Link Penambah Followers, Likes, View, Subscriber. Peluang Usaha Bisnis Online Anda'),
(15, '', 'paydisini_api_key', 'API KEY', 'text', 'paydisini', '491bf329da9ac8ec3655f709be8fc628'),
(17, '', 'tripay_merchant_code', 'MERCHANT CODE', 'text', 'tripay', 'T35372'),
(19, '', 'tripay_private_key', 'PRIVATE KEY', 'text', 'tripay', '1Z1Qb-QHZzS-CWwk8-hC565-JH2Bj'),
(20, 'whatsapp_gateway', 'whatsapp_gateway', 'Notifikasi Whatsapp Admin', 'text', 'config_wa', '6282323239919'),
(30, 'rate_point', 'rate_point', 'RATE POINT', 'text', 'referral', '0.5'),
(31, 'refferal_bonus', 'refferal_bonus', 'BONUS PER REFERRAL', 'text', 'referral', '2'),
(32, 'minimal_payout', 'minimal_payout', 'MINIMAL PAYOUT', 'text', 'referral', '150'),
(33, 'payout_info', 'payout_info', 'Info Cara Payout Point', 'textarea', 'info', '<p>Cara melakukan Payout Point:</p><ul><li>InputÂ <i>Jumlah Point</i>.</li><li>PastikanÂ <i>Point Anda</i>Â saat ini sudah cukup untuk melakukan Payout.</li></ul><p>Penting!</p><ul><li>Apabila Anda mengalami kesulitan silakan hubungi Admin.</li><li>Kami tidak bertanggung jawab atas kesalahan yang terjadi oleh pengguna.</li></ul>'),
(34, 'service_rating', 'service_rating', 'Rating Layanan', 'rating', 'text', '1'),
(35, '1', 'mt_web', '', '', 'mt_web', '0'),
(36, '', 'gr_status', '', '', '', 'off'),
(37, '', 'gr_site_key', 'gr_site_key', 'text', 'Recaptcha', '-'),
(38, '', 'gr_secret_key', 'Secret Key', 'text', 'Recaptcha', '-'),
(39, '', 'logo', '', '', '', 'c8526dc0078e7cbca53c8a3a02da629c.png'),
(40, '', 'mode_theme', '', '', '', 'light'),
(41, '', 'contrast_theme', '', '', '', ''),
(42, '', 'custom_tag', '', '', '', '&lt;meta charset=\"UTF-8\"&gt;\r\n&lt;meta name=\"description\" content=\"SMM Panel terbaik di Indonesia untuk layanan media sosial. Dapatkan follower, like, dan engagement dengan harga terjangkau.\"&gt;\r\n&lt;meta name=\"keywords\" content=\"SMM Panel, media sosial, follower, like, Instagram, Facebook, Twitter, layanan sosial media, murah, Indonesia\"&gt;\r\n&lt;meta name=\"author\" content=\"Valerie Connect\"&gt;'),
(43, '', 'gtm_head', '', '', '', ''),
(44, '', 'gtm_body', '', '', '', ''),
(45, '', 'footer', '', '', '', '2020 Valerie Connect -  #1 SMM Murah Indonesia'),
(46, '', 'top_order', '', '', '', '1'),
(47, '', 'top_deposit', '', '', '', '1'),
(48, '', 'top_service', '', '', '', '1'),
(49, '', 'referral_status', '', '', '', '1'),
(50, '', 'rating_status', '', '', '', '0'),
(51, '', 'page_register', '', '', '', '1'),
(52, '', 'page_forgot', '', '', '', '1'),
(53, '', 'mt_api', '', '', '', '1'),
(54, '', 'smtp_host', '', '', '', 'mail.hostinger.com'),
(55, '', 'smtp_username', '', '', '', 'support@valerieconnect.shop'),
(56, '', 'smtp_password', '', '', '', 'VLconnect1#'),
(57, '', 'smtp_encrypt', '', '', '', 'ssl'),
(58, '', 'smtp_port', '', '', '', '465'),
(59, '', 'title_landing', '', '', '', 'Valerie Connect - #1 SMM Panel Indonesia'),
(60, '', 'meta_description_landing', '', '', '', 'Website Penyedia Kebutuhan Sosial Media Untuk Membantu Bisnis mu Berkembang.'),
(61, '', 'meta_keywords_landing', '', '', '', 'Valerie Connect, Panel SMM, SMM Panel, Panel SMM Termurah, Panel SMM Indonesia, Jasa Sosial Media, Jasa Sosmed, Followers Instagram, Followers Instagram Gratis, Suntik Followers, Layanan Sosmed, Layanan Sosial Media'),
(62, '', 'navbar_brand_landing', '', '', '', 'Valerie Connect'),
(63, '', 'description1_landing', '', '', '', 'Supplier Kebutuhan Sosmed [ST_GRADIENT]Terbaik[CL_GRADIENT] dan [ST_GRADIENT]Termurah[CL_GRADIENT] di Indonesia.'),
(64, '', 'description2_landing', '', '', '', 'Valerie Connect | Website Penyedia Kebutuhan Sosial Media Untuk Membantu Bisnis mu Berkembang.'),
(65, '', 'about_title_landing', '', '', '', 'Fiture Valerie Connect'),
(66, '', 'about_description_landing', '', '', '', 'Fitur modern yang akan membuat Anda lebih mudah.'),
(67, '', 'about_1_title', '', '', '', 'Keamanan Data'),
(68, '', 'about_1_content', '', '', '', 'Seluruh pesanan diproses tanpa menggunakan password akun sosial media Anda, ini memastikan akun Anda aman.'),
(69, '', 'about_2_title', '', '', '', 'Support 24/7'),
(70, '', 'about_2_content', '', '', '', 'Kami siap membantu Anda jika Anda mengalami kesulitan atau tidak mengerti terkait layanan yang kami sediakan'),
(71, '', 'about_3_title', '', '', '', 'Tampilan Responsif'),
(72, '', 'feature_title', '', '', '', 'Mulai Menggunakan Valerie Connect'),
(73, '', 'feature_description', '', '', '', '4 Langkah mudah untuk bergabung di Valerie Connect'),
(74, '', 'testi_title', '', '', '', 'Mereka [ST_PRIMARY]Menyukai[CL_PRIMARY] Valerie Connect, Sekarang Giliran Anda ðŸ˜ '),
(75, '', 'testi_description', '', '', '', 'Kami bangga dengan pengembangan Layanan kami, yang secara konsisten diberi ulasan positif oleh pelanggan kami yang puas. Kami senang berbagi umpan balik positif yang kami terima dari klien setia kami.'),
(76, '', 'title_login', '', '', '', 'Masuk -  Valerie Connect'),
(77, '', 'meta_description_login', '', '', '', 'Valerie Connect SMM Panel Indonesia'),
(78, '', 'meta_keywords_login', '', '', '', 'Valerie Connect SMM Panel'),
(79, '', 'brand_login', '', '', '', 'Valerie Connect'),
(80, '', 'title_register', '', '', '', 'Daftar - ValerieConnect'),
(81, '', 'meta_description_register', '', '', '', 'Valerie Connect SMM Panel'),
(82, '', 'meta_keywords_register', '', '', '', 'Valerie Connectl,SMMpanel,smmindonesia'),
(83, '', 'brand_register', '', '', '', 'Valerie Connect'),
(84, '', 'title_forgot', '', '', '', 'Lupa Password'),
(85, '', 'meta_description_forgot', '', '', '', 'Website Penyedia Kebutuhan Sosial Media Untuk Membantu Bisnis mu Berkembang.'),
(86, '', 'meta_keywords_forgot', '', '', '', 'Valerie Connect, Panel SMM, SMM Panel, Panel SMM Termurah, Panel SMM Indonesia, Jasa Sosial Media, Jasa Sosmed, Followers Instagram, Followers Instagram Gratis, Suntik Followers, Layanan Sosmed, Layanan Sosial Media'),
(87, '', 'brand_forgot', '', '', '', 'Valerie Connect'),
(88, '', 'wa_admin', '', '', '', '6285784828303'),
(89, '', 'wa_endpoint', '', '', '', 'https://api.fonnte.com/send/?queries'),
(90, '', 'wa_app_key', '', '', '', 'a!T2bpsgTXP8BTd8eC2Ss49q7Q'),
(91, '', 'wa_auth_key', '', '', '', '-'),
(92, '', 'send_wa_otp', '', '', '', 'off'),
(93, '', 'send_wa_deposit', '', '', '', 'on'),
(94, '', 'send_wa_ticket_user', '', '', '', 'on'),
(95, '', 'send_wa_ticket_admin', '', '', '', 'on'),
(96, '', 'wa_otp_login', '', '', '', 'Halo _{{user_username}}_,\r\n\r\nini anda barusaja login\r\n\r\n*Waktu login {{login_time}}\r\n*Ip adress {{ip_address}}\r\n*Perangkar {{ua_device}} {{ua_browser}}\r\n\r\nPesan otomatis  *{{title}}.*'),
(97, '', 'wa_otp_register', '', '', '', 'Terima kasih telah bergabung dengan {{title}}.\r\n\r\nBerikut informasi akun Anda:\r\n- *Nama:* {{user_fullname}}\r\n- *Username:* {{user_username}}\r\n- *Email:* {{user_email}}\r\n- *Whatsapp:* {{user_whatsapp}}\r\n\r\nSegera lakukan Deposit agar bisa bertransaksi â˜ºï¸'),
(98, '', 'wa_admin_otp_register', '', '', '', 'Register user baru\r\n\r\n- *Nama:* {{user_fullname}}\r\n- *Username:* {{user_username}}\r\n- *Email:* {{user_email}}\r\n- *Whatsapp:* {{user_whatsapp}}'),
(99, '', 'wa_otp_reset', '', '', '', 'Halo _{{user_username}}_,\r\n\r\nIni adalah OTP anda\r\n{{otp}}\r\n\r\nPesan otomatis  *{{title}}.*'),
(100, '', 'wa_deposit_pending', '', '', '', 'Halo _{{user_username}}_,\r\n\r\nSegera lakukan pembayaran agar deposit kamu tidak dibatalkan secara otomatis.\r\n\r\n*ID:* {{deposit_id}}\r\n*Metode:* {{deposit_method}}\r\n*Jumlah Transfer:* Rp {{deposit_transfer}}\r\n*Saldo Diterima:* Rp {{deposit_amount}}\r\n*Status:* {{deposit_status}}\r\n*Tanggal Deposit:* {{deposit_create}}\r\n\r\nTerima kasih telah menggunakan *{{title}}.*'),
(101, '', 'wa_deposit_success', '', '', '', 'Halo _{{user_username}}_,\r\n\r\nTerima kasih telah melakukan pembayaran, deposit kamu sudah diterima.\r\n\r\n*ID:* {{deposit_id}}\r\n*Metode:* {{deposit_method}}\r\n*Jumlah Transfer:* Rp {{deposit_transfer}}\r\n*Saldo Diterima:* Rp {{deposit_amount}}\r\n*Status:* {{deposit_status}}\r\n*Tanggal Pembaruan:* {{deposit_update}}\r\n\r\nTerima kasih telah menggunakan *{{title}}.*'),
(102, '', 'wa_deposit_canceled', '', '', '', 'Halo _{{user_username}}_,\r\n\r\nDeposit telah dibatalkan, mohon untuk tidak melanjutkan pembayaran.\r\n\r\n*ID:* {{deposit_id}}\r\n*Metode:* {{deposit_method}}\r\n*Jumlah Transfer:* Rp {{deposit_transfer}}\r\n*Saldo Diterima:* Rp {{deposit_amount}}\r\n*Status:* {{deposit_status}}\r\n*Tanggal Pembaruan:* {{deposit_update}}\r\n\r\nTerima kasih telah menggunakan *{{title}}.*'),
(103, '', 'wa_admin_deposit_pending', '', '', '', '*{{title}} - Deposit Baru*\r\n\r\nHalo _Admin_,\r\n_{{user_username}}_ telah membuat deposit baru.\r\n\r\n- *ID:* {{deposit_id}}\r\n- *Metode:* {{deposit_method}}\r\n- *Jumlah Transfer:* Rp {{deposit_transfer}}\r\n- *Saldo Diterima:* Rp {{deposit_amount}}\r\n- *Status:* {{deposit_status}}\r\n- *Tanggal:* {{deposit_create}}'),
(104, '', 'wa_admin_deposit_success', '', '', '', '*{{title}} - Pembayaran Deposit*\r\n\r\nHalo _Admin_,\r\n_{{user_username}}_ telah melakukan pembayaran.\r\n\r\n- *ID:* {{deposit_id}}\r\n- *Metode:* {{deposit_method}}\r\n- *Jumlah Transfer:* Rp {{deposit_transfer}}\r\n- *Saldo Diterima:* Rp {{deposit_amount}}\r\n- *Status:* {{deposit_status}}\r\n- *Tanggal Pembaruan:* {{deposit_update}}'),
(105, '', 'wa_admin_deposit_canceled', '', '', '', '*{{title}} - Pembatalan Deposit*\r\n\r\nHalo _Admin_,\r\nDeposit telah dibatalkan.\r\n\r\n*ID:* {{deposit_id}}\r\n*Pengguna:* {{user_username}}\r\n*Metode:* {{deposit_method}}\r\n*Jumlah Transfer:* Rp {{deposit_transfer}}\r\n*Saldo Diterima:* Rp {{deposit_amount}}\r\n*Status:* {{deposit_status}}\r\n*Tanggal Pembaruan:* {{deposit_update}}'),
(106, '', 'wa_ticket_create', '', '', '', 'Hallo _{{user_username}}_,\r\n\r\nTerimakasih telah membuat Ticket ,berikut Detail data Ticket Anda.\r\n\r\n*Ticket ID :* {{ticket_id}}\r\n*Subject :* {{ticket_subject}}\r\n*Status :* {{ticket_status}}\r\n*Tanggal Pembuatan :* {{ticket_create}}\r\n*Tanggal Pembaruan :* {{ticket_update}}\r\n\r\nAdmin akan segera merespon Ticket mu dalam 1 x 24jam ,mohon ditunggu.'),
(107, '', 'wa_ticket_reply', '', '', '', 'Hallo _{{user_username}}_,\r\n\r\nTerimakasih telah membalas Ticket ,berikut Detail data Ticket Anda.\r\n\r\n*Ticket ID :* {{ticket_id}}\r\n*Subject :* {{ticket_subject}}\r\n*Status :* {{ticket_status}}\r\n*Tanggal Pembuatan :* {{ticket_create}}\r\n*Tanggal Pembaruan :* {{ticket_update}}\r\n\r\nAdmin akan segera merespon Ticketmu kembali secepatnya ,mohon ditunggu.'),
(108, '', 'wa_ticket_close', '', '', '', 'Hallo _{{user_username}}_,\r\n\r\nTerimakasih telah membuat Laporan dan Ticket anda kami tutup ,berikut Detail data Ticket Anda.\r\n\r\n*Ticket ID :* {{ticket_id}}\r\n*Subject :* {{ticket_subject}}\r\n*Status :* {{ticket_status}}\r\n*Tanggal Pembuatan :* {{ticket_create}}\r\n*Tanggal Pembaruan :* {{ticket_update}}\r\n\r\nAdmin menutup ticket ,jika ada kendala jangan sungkan membuat ticket / Hub whatsapp Admin.'),
(109, '', 'wa_admin_ticket_create', '', '', '', 'Hallo _{{admin_fullname}}_,\r\n\r\nPengguna mu dengan Username : {{user_username}} telah membuat Ticket ,berikut Detail data Ticketnya.\r\n\r\n*Ticket ID :* {{ticket_id}}\r\n*Subject :* {{ticket_subject}}\r\n*Status :* {{ticket_status}}\r\n*Tanggal Pembuatan :* {{ticket_create}}\r\n*Tanggal Pembaruan :* {{ticket_update}}\r\n\r\nsegera merespon Ticket Pengguna agar tidak kecewa dan selalu bersikap ramah selalu admin.'),
(110, '', 'wa_admin_ticket_reply', '', '', '', 'Hallo _{{admin_fullname}}_,\r\n\r\nPengguna mu dengan Username : {{user_username}} telah membalas Ticket ,berikut Detail data Ticketnya.\r\n\r\n*Ticket ID :* {{ticket_id}}\r\n*Subject :* {{ticket_subject}}\r\n*Status :* {{ticket_status}}\r\n*Tanggal Pembuatan :* {{ticket_create}}\r\n*Tanggal Pembaruan :* {{ticket_update}}\r\n\r\nsegera merespon Ticket Pengguna agar tidak kecewa dan selalu bersikap ramah selalu admin.'),
(111, '', 'convert_info', '', '', '', '<p>--</p>'),
(112, '', 'benefit_trx', '', '', '', '1500'),
(113, '', 'referral_rate_silver', '', '', '', '10'),
(114, '', 'referral_rate_gold', '', '', '', '15'),
(115, '', 'referral_rate_platinum', '', '', '', '20'),
(116, '', 'referral_rate_diamond', '', '', '', '25'),
(117, '', 'referral_minimun_convert', '', '', '', '100000'),
(118, '', 'about_3_content', '', '', '', 'Kami siap membantu Anda jika Anda mengalami kesulitan atau tidak mengerti terkait layanan yang kami sediakan'),
(119, '', 'sidebar_caption', '', '', '', 'true'),
(120, '', 'theme_sidebar', '', '', '', 'light'),
(121, '', 'qris_api_key', 'API KEY', 'text', 'shann_qris', '-'),
(121, '', 'tripay_api_key', '', '', '', 'DEV-5w1IPUyhATjvbJC6eKuwPWTmatnNnKtHnNx6ESn8'),
(122, '', 'qris_username', 'MERCHANT KEY', 'text', 'shann_qris', '-'),
(123, '', 'qris_us_qris', 'qris_us', 'text', 'shann_qris', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_balance`
--
ALTER TABLE `api_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_order`
--
ALTER TABLE `api_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_refill`
--
ALTER TABLE `api_refill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_refill_status`
--
ALTER TABLE `api_refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_request_param`
--
ALTER TABLE `api_request_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_service`
--
ALTER TABLE `api_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_status`
--
ALTER TABLE `api_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_mutation`
--
ALTER TABLE `bank_mutation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefit`
--
ALTER TABLE `benefit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefit_payout`
--
ALTER TABLE `benefit_payout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childpanel`
--
ALTER TABLE `childpanel`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `cookie`
--
ALTER TABLE `cookie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_price`
--
ALTER TABLE `custom_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_statistic`
--
ALTER TABLE `custom_statistic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_instagram`
--
ALTER TABLE `database_instagram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_method`
--
ALTER TABLE `deposit_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_method_instruction`
--
ALTER TABLE `deposit_method_instruction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gojek_mutation`
--
ALTER TABLE `gojek_mutation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_config`
--
ALTER TABLE `landing_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_balance_usage`
--
ALTER TABLE `log_balance_usage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_deposit_bank`
--
ALTER TABLE `log_deposit_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login_admin`
--
ALTER TABLE `log_login_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login_user`
--
ALTER TABLE `log_login_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_sms`
--
ALTER TABLE `log_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_pulsa_list`
--
ALTER TABLE `order_pulsa_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ovo_mutation`
--
ALTER TABLE `ovo_mutation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_komisi`
--
ALTER TABLE `referral_komisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_log`
--
ALTER TABLE `referral_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refill`
--
ALTER TABLE `refill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replace_keyword`
--
ALTER TABLE `replace_keyword`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_favorit`
--
ALTER TABLE `service_favorit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_logs`
--
ALTER TABLE `service_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_rating`
--
ALTER TABLE `service_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_recommended`
--
ALTER TABLE `service_recommended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_category`
--
ALTER TABLE `type_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_config`
--
ALTER TABLE `website_config`
  ADD PRIMARY KEY (`id`,`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_balance`
--
ALTER TABLE `api_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_order`
--
ALTER TABLE `api_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_refill`
--
ALTER TABLE `api_refill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_refill_status`
--
ALTER TABLE `api_refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_request_param`
--
ALTER TABLE `api_request_param`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_service`
--
ALTER TABLE `api_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_status`
--
ALTER TABLE `api_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_mutation`
--
ALTER TABLE `bank_mutation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `benefit`
--
ALTER TABLE `benefit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `benefit_payout`
--
ALTER TABLE `benefit_payout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `childpanel`
--
ALTER TABLE `childpanel`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cookie`
--
ALTER TABLE `cookie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `custom_price`
--
ALTER TABLE `custom_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_statistic`
--
ALTER TABLE `custom_statistic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `database_instagram`
--
ALTER TABLE `database_instagram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4585;

--
-- AUTO_INCREMENT for table `deposit_method`
--
ALTER TABLE `deposit_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `deposit_method_instruction`
--
ALTER TABLE `deposit_method_instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `gojek_mutation`
--
ALTER TABLE `gojek_mutation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_config`
--
ALTER TABLE `landing_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `log_balance_usage`
--
ALTER TABLE `log_balance_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `log_deposit_bank`
--
ALTER TABLE `log_deposit_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_login_admin`
--
ALTER TABLE `log_login_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `log_login_user`
--
ALTER TABLE `log_login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `log_sms`
--
ALTER TABLE `log_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_pulsa_list`
--
ALTER TABLE `order_pulsa_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ovo_mutation`
--
ALTER TABLE `ovo_mutation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_komisi`
--
ALTER TABLE `referral_komisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_log`
--
ALTER TABLE `referral_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refill`
--
ALTER TABLE `refill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replace_keyword`
--
ALTER TABLE `replace_keyword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_category`
--
ALTER TABLE `service_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_favorit`
--
ALTER TABLE `service_favorit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_logs`
--
ALTER TABLE `service_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_rating`
--
ALTER TABLE `service_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_recommended`
--
ALTER TABLE `service_recommended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_category`
--
ALTER TABLE `type_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `website_config`
--
ALTER TABLE `website_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
