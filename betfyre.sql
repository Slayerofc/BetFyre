-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 03, 2023 at 07:48 PM
-- Server version: 5.7.41-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bet`
--

-- --------------------------------------------------------

--
-- Table structure for table `battle`
--

CREATE TABLE `battle` (
  `id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT '0.00',
  `commission` decimal(20,2) DEFAULT NULL,
  `winner_team` varchar(255) DEFAULT NULL,
  `winner_factor` decimal(20,2) DEFAULT NULL,
  `winner_ticket` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `battle`
--

INSERT INTO `battle` (`id`, `price`, `commission`, `winner_team`, `winner_factor`, `winner_ticket`, `status`, `hash`, `created_at`, `updated_at`) VALUES
(28872, 198.70, 26.40, 'red', 1.80, 26, 3, '35fa8768bca8cc448fc42f604edcc3d1', '2023-02-08 01:25:05', '2023-02-08 01:26:38'),
(33046, 96.50, NULL, NULL, NULL, NULL, 1, 'd7f5ba8af978867fc2b5976e5dadfd15', '2023-02-10 00:42:16', '2023-02-10 00:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `battle_bets`
--

CREATE TABLE `battle_bets` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `win` int(11) DEFAULT '0',
  `win_sum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balType` varchar(255) DEFAULT NULL,
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `battle_bets`
--

INSERT INTO `battle_bets` (`id`, `game_id`, `user_id`, `price`, `color`, `win`, `win_sum`, `balType`, `fake`, `created_at`, `updated_at`) VALUES
(577303, 33046, 2158, 27.00, 'blue', 0, 0.00, 'balance', 1, '2023-02-10 00:42:16', '2023-02-10 00:42:16'),
(577304, 33046, 1788, 10.00, 'red', 0, 0.00, 'balance', 1, '2023-02-10 00:42:16', '2023-02-10 00:42:16'),
(577305, 33046, 2157, 3.50, 'blue', 0, 0.00, 'balance', 1, '2023-02-10 00:42:17', '2023-02-10 00:42:17'),
(577306, 33046, 2158, 20.00, 'blue', 0, 0.00, 'balance', 1, '2023-02-10 00:43:29', '2023-02-10 00:43:29'),
(577307, 33046, 2157, 29.50, 'blue', 0, 0.00, 'balance', 1, '2023-02-10 00:43:30', '2023-02-10 00:43:30'),
(577308, 33046, 2156, 6.50, 'red', 0, 0.00, 'balance', 1, '2023-02-10 00:43:30', '2023-02-10 00:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `bg` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `bonus_log`
--

CREATE TABLE `bonus_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `remaining` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `crash`
--

CREATE TABLE `crash` (
  `id` int(11) NOT NULL,
  `multiplier` decimal(20,2) DEFAULT NULL,
  `profit` decimal(20,2) DEFAULT '0.00',
  `hash` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `crash`
--

INSERT INTO `crash` (`id`, `multiplier`, `profit`, `hash`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 0.00, '1f684b45c3370687545239b27cdd5968', 0, '2023-04-30 19:59:27', '2023-04-30 19:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `crash_bets`
--

CREATE TABLE `crash_bets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `withdraw` decimal(20,2) DEFAULT NULL,
  `won` decimal(20,2) DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `fake` tinyint(1) NOT NULL DEFAULT '0',
  `balType` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dice`
--

CREATE TABLE `dice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `perc` decimal(20,2) DEFAULT '0.00',
  `vip` decimal(20,2) NOT NULL DEFAULT '0.00',
  `num` decimal(20,2) DEFAULT '0.00',
  `range` varchar(255) DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `win_sum` decimal(20,2) DEFAULT NULL,
  `balType` varchar(255) DEFAULT NULL,
  `fake` int(11) NOT NULL DEFAULT '0',
  `hash` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `double`
--

CREATE TABLE `double` (
  `id` int(11) NOT NULL,
  `winner_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winner_number` int(11) NOT NULL DEFAULT '0',
  `pot` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranked` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `double_bets`
--

CREATE TABLE `double_bets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '1',
  `price` double(12,2) NOT NULL DEFAULT '0.00',
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'balance',
  `game_id` int(11) NOT NULL DEFAULT '0',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `win_sum` double(10,2) NOT NULL DEFAULT '0.00',
  `fake` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `id` int(11) NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `flip`
--

CREATE TABLE `flip` (
  `id` int(11) NOT NULL,
  `heads` int(11) DEFAULT NULL,
  `heads_from` int(11) DEFAULT NULL,
  `heads_to` int(11) DEFAULT NULL,
  `tails` int(11) DEFAULT NULL,
  `tails_from` int(11) DEFAULT NULL,
  `tails_to` int(11) DEFAULT NULL,
  `bank` decimal(20,2) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `winner_ticket` int(11) DEFAULT NULL,
  `winner_sum` decimal(20,2) DEFAULT NULL,
  `balType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `flip`
--

INSERT INTO `flip` (`id`, `heads`, `heads_from`, `heads_to`, `tails`, `tails_from`, `tails_to`, `bank`, `winner_id`, `winner_ticket`, `winner_sum`, `balType`, `hash`, `status`, `created_at`, `updated_at`) VALUES
(1, 18226, 1, 601, 17765, 602, 1201, 12.00, 17765, 797, 9.00, 'balance', '3b076a738a9eb618011f192eecd34807', 1, '2023-02-18 16:54:16', '2023-02-18 16:56:04'),
(2, 18226, 1, 601, 17765, 602, 1201, 12.00, 17765, 625, 9.00, 'balance', 'a82c3e436d360441c7c80a7129367d68', 1, '2023-02-18 16:54:24', '2023-02-18 16:56:34'),
(3, 16566, 1, 11, 17765, 12, 21, 0.20, 16566, 8, 0.15, 'balance', 'a3d125535bcc09702eb2bd6fde6be720', 1, '2023-02-18 16:55:45', '2023-02-18 16:56:56'),
(4, 17765, 1, 201, NULL, NULL, NULL, 2.00, NULL, NULL, NULL, 'balance', '2cd2ecf8a844c33837d79934e69ba438', 0, '2023-02-18 16:57:26', '2023-02-18 16:57:26'),
(5, 16566, 1, 11, NULL, NULL, NULL, 0.10, NULL, NULL, NULL, 'balance', '2b57eeb998510318be6587683712af8b', 0, '2023-02-18 16:57:29', '2023-02-18 16:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `giveaway`
--

CREATE TABLE `giveaway` (
  `id` int(11) NOT NULL,
  `sum` decimal(8,2) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_to` int(11) DEFAULT NULL,
  `group_sub` int(11) NOT NULL DEFAULT '0',
  `min_dep` decimal(8,2) NOT NULL DEFAULT '0.00',
  `winner_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `giveaway_users`
--

CREATE TABLE `giveaway_users` (
  `id` int(11) NOT NULL,
  `giveaway_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hilo`
--

CREATE TABLE `hilo` (
  `id` int(11) NOT NULL,
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_amount` int(11) DEFAULT NULL,
  `card_section` varchar(255) DEFAULT NULL,
  `card_sign` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `profit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hash` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `hilo`
--

INSERT INTO `hilo` (`id`, `card_name`, `card_amount`, `card_section`, `card_sign`, `status`, `profit`, `hash`, `created_at`, `updated_at`) VALUES
(1, '5', 5, 'red', NULL, 3, 0.00, 'afa6ba0022ce076338bfec792841fc0b', '2023-02-27 17:34:28', '2023-02-27 17:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `hilo_bets`
--

CREATE TABLE `hilo_bets` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bet_type` int(11) DEFAULT NULL,
  `bet_x` double(20,2) DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT '0.00',
  `balance` varchar(255) DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `win_sum` decimal(20,2) DEFAULT '0.00',
  `win_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jackpot`
--

CREATE TABLE `jackpot` (
  `id` int(11) NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `winner_ticket` int(11) DEFAULT NULL,
  `winner_balance` decimal(20,2) DEFAULT NULL,
  `winner_bonus` decimal(20,2) DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jackpot`
--

INSERT INTO `jackpot` (`id`, `room`, `game_id`, `winner_id`, `winner_ticket`, `winner_balance`, `winner_bonus`, `hash`, `status`, `created_at`, `updated_at`) VALUES
(1, 'easy', 1, 14, 227, 10.00, 21.00, '940a362cd00828f1e444d47df4289488', 3, '2019-08-28 11:49:29', '2023-02-10 03:36:54'),
(2, 'medium', 1, 21, 6643, 191.33, 0.00, '047a00637fb49d48f797f814f7c87b08', 3, '2019-08-28 11:49:37', '2023-02-10 03:36:51'),
(3, 'hard', 1, 42, 52258, 510.94, 0.00, '321154cd8ebe4e838b36462a89b49da0', 3, '2019-08-28 11:49:40', '2023-02-10 03:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `jackpot_bets`
--

CREATE TABLE `jackpot_bets` (
  `id` int(11) NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `system` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `extra_info` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payments_providers`
--

CREATE TABLE `payments_providers` (
  `id` int(11) NOT NULL COMMENT 'Provider Identifer',
  `payment_methods` varchar(255) DEFAULT NULL COMMENT 'PIX, Credit Card, Crypto, Debig, PayPal Wallet',
  `provider_name` varchar(255) DEFAULT NULL COMMENT 'MercadoPago, PayPal, PicPay, PagSeguro',
  `url_return_ipn` varchar(255) DEFAULT NULL COMMENT 'IPN or Webhook return, https://127.0.0.1:8000/api/payments/mercadopago/return',
  `provider_status` int(11) DEFAULT '1' COMMENT 'Status of this provider | 0 = Disabled , 1 = Activated',
  `provider_mode` int(11) DEFAULT '0' COMMENT 'Mode Development or Production | 0 = Development , 1 = Production',
  `provider_key` text COMMENT 'Client KEY of provider',
  `provider_key_dev` text COMMENT 'Client Developer KEY of provider',
  `provider_token` text COMMENT 'Client TOKEN of provider',
  `provider_token_dev` text COMMENT 'Client Developer TOKEN of provider',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update info of this fields',
  `created_at` datetime DEFAULT NULL COMMENT 'Time created this table',
  `bearer_token` longtext COMMENT 'Bearer Access Token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `payments_providers`
--

INSERT INTO `payments_providers` (`id`, `payment_methods`, `provider_name`, `url_return_ipn`, `provider_status`, `provider_mode`, `provider_key`, `provider_key_dev`, `provider_token`, `provider_token_dev`, `updated_at`, `created_at`, `bearer_token`) VALUES
(1, 'PIX', 'Paggue', 'https://betfyre.com/api/payments/return', 0, 1, '2185012429206604320516', NULL, '620179497891262003', NULL, '2023-03-10 20:27:05', '2023-02-01 20:13:17', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiYzUyMDhjMGNmYmRlODgyNTkzZmVmYjcyNTA4MzQwN2M5ZDdlNmFjNmMyYTEzYTJiOTQ1NGZkNmE2MjYwYjY2ZWIzNjJjOWM4YTgwMjM5NWUiLCJpYXQiOjE2Nzg0OTA3MjcuODEwNTkzLCJuYmYiOjE2Nzg0OTA3MjcuODEwNTk1LCJleHAiOjE3MTAxMTMxMjcuNzg2Nzk3LCJzdWIiOiI4Mzk2Iiwic2NvcGVzIjpbXX0.Xxaz2eSFj_0JV3z60jeLePzwmbBzfOO8LpsmHH0zJDjxmEZPnD_VBSPorM109glX1rwnoIvmjrgLBYnf8Bd9HO1rl4EeOu8_bAXRWKQ6uKN-ZXk3mfjvCPtUbHhpCAsw-LAaqF_PoMjH5gBOhoOtjqL_JJm16dWh-w8kSAcvjPIkSJ1SAiEQpEl1fAakP4TA2sRet-9teyOL5yWPQnKBUvnGnBss4Q64AqrGT57CgvMb4WsRuQODbB9KuCQFLrIHRasNG8Wd5EWQlPLhOjT6PPj0y4_YpDpZ5idXcDYfaZmCWxA-UJ7sSQH4HON-9rtqCtl9yhX-n9gOnWuayWsFCqQsv4-4npGfKNs4knWmJ8HDmpd-VAMGUjUcy13R4FlpOjfimenrhUh-yLqe-X49XzZRuLh2SSPAvHOsF3-fcHUM13Av8GmrZarBE575USsSCauGrX_rrBtXNSAq7zLh13TdyrGPsEC_seMeXAkeuZJ5D0f85jZ-9ghO7q9JVBZ5J8i5q9GvipjjHTUNVigqlKnIgGxN7v-I7PGgWIKx46o08XotRjEzQKwck5aZX1mx7QNWIb0kdJsYozE4vGgwegL81EfPypc8mE6gt-gy8vs3S8pgBROlnz2KOtQCRW6dEZ6Ggb-TlcZWI2cZctlTv0i0PTzEQUkGiMl39n_XUII'),
(2, '#2 PIX', 'Mercadopago', 'https://betfyre.com/api/payments/return', 0, 1, '22678701485974296499731', NULL, '0967324881226487119', NULL, '2023-02-10 19:35:08', '2023-02-01 20:13:17', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiNmEyZmYxODg2YzRkZDllZGMwN2E0ZTY4OTJlZjdjMDVmZDU2YTBiNTliMzc3NGQ1YWM4ZTliOTBkNzQxZDhkY2YzZWYxYjEyZmRhNTBjOTYiLCJpYXQiOjE2NzYwNjE1NzkuMDE2Nzk3LCJuYmYiOjE2NzYwNjE1NzkuMDE2OCwiZXhwIjoxNzA3NTk3NTc5LjAwNDkxMywic3ViIjoiODIzNCIsInNjb3BlcyI6W119.ZELe7yZMayfb9Yxc_8lUb67p1eUBdwUaScqKuTgQMXReWfxMl3dAacI0stOOD96v8t15j2Byw0ei8RE58Lq2NVO1O7Xi-VuzOPabAKAbs0vKU209JCZC2VNvyHGmDOKNmrtp7vk9oBKNgr1lvX_5FLVwj08kbkpIoTh4HOs9LVXzcWoQRJZgtRLHxLZdjMVyMhax7yLpzPXJEJKRxzhz9f6r7bKH2VQPezknpK57MY_rST_GbnTKQ8IA5-z0MMTN3NGWcenSZHUEXm0sgmLV8NqUvbhV25eaJBND8E1SkZmFZ9TduZCuitBryNH-XoPM9_QeIctNCQ4f44FhmXnXdS_dgCRcMdFzVv9RDGUYKDT7ElyIgiDg3jB-5-HkQPJfIkbZDwOtRPgJLb--hMp9j1uVl7o54srWeI44IX66sHnV2Dsu9cFCAudmbcQNr-paIPxMnGSrYwMCPj3LTcRHTnO_E0FN3f7lVnWHkwxTaojFa0kGGcylpJ0ffQ0lZ8DYicleXrraOnz-HsctiZHWRK0CDZbfi7H0DzTjwAeazsA8OMNawk2t_ehvqlHscBxJPmmCGWzXoggBwzqobkGTDUe6QVZhuySYRHmMmzJOPs2VIDzLUUhp2aCzJolNmuYQepAZy3IysfvmSjq-mylV3_DZjUsf00s9wE9UXjSgK60'),
(3, 'PIX', 'Iugu', NULL, 0, 1, 'F7DBFDB574DDAC6BFBA5AA4A4B56C5D63EEEA5B05D35B808E9C04047BB142140', NULL, NULL, NULL, '2023-02-23 14:42:35', NULL, NULL),
(4, 'PIX', 'EzBank', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profit`
--

CREATE TABLE `profit` (
  `id` int(11) NOT NULL,
  `game` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(20,2) DEFAULT NULL,
  `count_use` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `promo_log`
--

CREATE TABLE `promo_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `promo_log`
--

INSERT INTO `promo_log` (`id`, `user_id`, `sum`, `code`, `type`, `created_at`, `updated_at`) VALUES
(1, 2176, 100.00, 'oi', 'balance', '2023-02-11 02:27:44', NULL),
(2, 2164, 10.00, 'eunattanbr', 'balance', '2023-02-11 04:19:58', NULL),
(3, 2159, 10.00, 'pedrostrapasson', 'balance', '2023-02-11 06:45:01', NULL),
(4, 2443, 1000.00, 'nattan', 'bonus', '2023-02-11 22:02:11', NULL),
(5, 2443, 1000.00, 'eu', 'balance', '2023-02-11 22:03:04', NULL),
(6, 2600, 1000.00, 'nattanbr', 'balance', '2023-02-12 03:42:26', NULL),
(7, 3523, 10.00, 'prigama', 'balance', '2023-02-12 23:23:57', NULL),
(8, 3525, 10.00, 'prigama', 'balance', '2023-02-12 23:24:45', NULL),
(9, 3529, 10.00, 'prigama', 'balance', '2023-02-12 23:24:50', NULL),
(10, 3527, 10.00, 'prigama', 'balance', '2023-02-12 23:25:28', NULL),
(11, 3534, 10.00, 'prigama', 'balance', '2023-02-12 23:25:32', NULL),
(12, 3538, 10.00, 'prigama', 'balance', '2023-02-12 23:25:46', NULL),
(13, 3530, 10.00, 'prigama', 'balance', '2023-02-12 23:25:49', NULL),
(14, 3528, 10.00, 'prigama', 'balance', '2023-02-12 23:25:58', NULL),
(15, 3546, 10.00, 'prigama', 'balance', '2023-02-12 23:26:01', NULL),
(16, 3542, 10.00, 'prigama', 'balance', '2023-02-12 23:26:08', NULL),
(17, 2164, 10.00, 'prigama', 'balance', '2023-02-13 01:40:52', NULL),
(18, 4147, 10.00, 'prigama', 'balance', '2023-02-13 01:43:51', NULL),
(19, 4187, 10.00, 'prigama', 'balance', '2023-02-13 01:45:18', NULL),
(20, 4189, 10.00, 'prigama', 'balance', '2023-02-13 01:45:32', NULL),
(21, 4185, 10.00, 'prigama', 'balance', '2023-02-13 01:45:46', NULL),
(22, 4188, 10.00, 'prigama', 'balance', '2023-02-13 01:46:07', NULL),
(23, 4193, 10.00, 'prigama', 'balance', '2023-02-13 01:47:43', NULL),
(24, 4202, 10.00, 'prigama', 'balance', '2023-02-13 01:50:41', NULL),
(25, 4205, 10.00, 'prigama', 'balance', '2023-02-13 01:54:52', NULL),
(26, 3246, 10.00, 'prigama', 'balance', '2023-02-13 01:55:02', NULL),
(27, 4218, 10.00, 'prigama', 'balance', '2023-02-13 01:56:41', NULL),
(28, 2443, 2000.00, 'pedro', 'balance', '2023-02-13 03:43:02', NULL),
(29, 4517, 10.00, 'pedro', 'balance', '2023-02-13 04:06:03', NULL),
(30, 4518, 10.00, 'pedro', 'balance', '2023-02-13 04:06:11', NULL),
(31, 4522, 10.00, 'pedro', 'balance', '2023-02-13 04:07:04', NULL),
(32, 4525, 10.00, 'pedro', 'balance', '2023-02-13 04:07:13', NULL),
(33, 4527, 10.00, 'pedro', 'balance', '2023-02-13 04:07:42', NULL),
(34, 4533, 10.00, 'pedro', 'balance', '2023-02-13 04:08:02', NULL),
(35, 4523, 10.00, 'pedro', 'balance', '2023-02-13 04:08:03', NULL),
(36, 4535, 10.00, 'pedro', 'balance', '2023-02-13 04:08:08', NULL),
(37, 4528, 10.00, 'pedro', 'balance', '2023-02-13 04:08:18', NULL),
(38, 4526, 10.00, 'pedro', 'balance', '2023-02-13 04:08:42', NULL),
(39, 5539, 10.00, 'pri', 'balance', '2023-02-13 22:33:44', NULL),
(40, 3871, 10.00, 'pri', 'balance', '2023-02-13 22:33:52', NULL),
(41, 5457, 10.00, 'pri', 'balance', '2023-02-13 22:34:07', NULL),
(42, 6024, 10.00, 'pri', 'balance', '2023-02-13 22:34:34', NULL),
(43, 3952, 10.00, 'pri', 'balance', '2023-02-13 22:34:36', NULL),
(44, 6029, 10.00, 'pri', 'balance', '2023-02-13 22:34:40', NULL),
(45, 6026, 10.00, 'pri', 'balance', '2023-02-13 22:34:44', NULL),
(46, 4000, 10.00, 'pri', 'balance', '2023-02-13 22:34:58', NULL),
(47, 5753, 10.00, 'pri', 'balance', '2023-02-13 22:35:17', NULL),
(48, 3658, 10.00, 'pri', 'balance', '2023-02-13 22:35:22', NULL),
(49, 2164, 1000.00, 'rider43', 'bonus', '2023-02-13 22:39:38', NULL),
(50, 2164, 0.00, '1234', 'balance', '2023-02-13 22:41:20', NULL),
(51, 6207, 10.00, 'anny', 'balance', '2023-02-13 22:54:08', NULL),
(52, 2159, 100.00, '159', 'balance', '2023-02-14 00:07:17', NULL),
(53, 6687, 10.00, 'anny', 'balance', '2023-02-14 00:56:08', NULL),
(54, 5685, 10.00, 'anny', 'balance', '2023-02-14 00:56:16', NULL),
(55, 6686, 10.00, 'anny', 'balance', '2023-02-14 00:56:18', NULL),
(56, 3706, 10.00, 'anny', 'balance', '2023-02-14 00:56:54', NULL),
(57, 2443, 1000.00, 'influencer', 'balance', '2023-02-14 21:53:57', NULL),
(58, 6248, 10.00, 'pri', 'balance', '2023-02-14 22:04:38', NULL),
(59, 6099, 10.00, 'pri', 'balance', '2023-02-14 22:04:46', NULL),
(60, 6301, 10.00, 'pri', 'balance', '2023-02-14 22:04:55', NULL),
(61, 7423, 10.00, 'pri', 'balance', '2023-02-14 22:05:08', NULL),
(62, 7113, 10.00, 'pri', 'balance', '2023-02-14 22:05:09', NULL),
(63, 6244, 10.00, 'pri', 'balance', '2023-02-14 22:05:22', NULL),
(64, 6675, 10.00, 'pri', 'balance', '2023-02-14 22:05:24', NULL),
(65, 3816, 10.00, 'pri', 'balance', '2023-02-14 22:05:35', NULL),
(66, 8477, 10.00, 'pri', 'balance', '2023-02-14 22:05:40', NULL),
(67, 8479, 10.00, 'pri', 'balance', '2023-02-14 22:05:49', NULL),
(68, 6129, 10.00, 'pri', 'balance', '2023-02-14 22:05:53', NULL),
(69, 4628, 10.00, 'pri', 'balance', '2023-02-14 22:05:54', NULL),
(70, 8481, 10.00, 'pri', 'balance', '2023-02-14 22:05:58', NULL),
(71, 8483, 10.00, 'pri', 'balance', '2023-02-14 22:06:04', NULL),
(72, 5619, 10.00, 'pri', 'balance', '2023-02-14 22:06:08', NULL),
(73, 7093, 10.00, 'pri', 'balance', '2023-02-14 22:06:12', NULL),
(74, 4208, 10.00, 'pri', 'balance', '2023-02-14 22:06:18', NULL),
(75, 8484, 10.00, 'pri', 'balance', '2023-02-14 22:06:26', NULL),
(76, 3874, 10.00, 'pri', 'balance', '2023-02-14 22:06:45', NULL),
(77, 8488, 10.00, 'pri', 'balance', '2023-02-14 22:06:53', NULL),
(78, 7082, 10.00, 'pri', 'balance', '2023-02-14 22:07:00', NULL),
(79, 8491, 10.00, 'pri', 'balance', '2023-02-14 22:07:02', NULL),
(80, 7002, 10.00, 'pri', 'balance', '2023-02-14 22:07:03', NULL),
(81, 8489, 10.00, 'pri', 'balance', '2023-02-14 22:07:08', NULL),
(82, 8498, 10.00, 'pri', 'balance', '2023-02-14 22:07:17', NULL),
(83, 8492, 10.00, 'pri', 'balance', '2023-02-14 22:07:20', NULL),
(84, 8487, 10.00, 'pri', 'balance', '2023-02-14 22:07:20', NULL),
(85, 8500, 10.00, 'pri', 'balance', '2023-02-14 22:07:22', NULL),
(86, 8394, 10.00, 'pri', 'balance', '2023-02-14 22:07:24', NULL),
(87, 8509, 10.00, 'pri', 'balance', '2023-02-14 22:07:29', NULL),
(88, 8480, 10.00, 'pri', 'balance', '2023-02-14 22:07:35', NULL),
(89, 6302, 10.00, 'pri', 'balance', '2023-02-14 22:07:41', NULL),
(90, 8495, 10.00, 'pri', 'balance', '2023-02-14 22:07:42', NULL),
(91, 8503, 10.00, 'pri', 'balance', '2023-02-14 22:07:45', NULL),
(92, 6540, 10.00, 'pri', 'balance', '2023-02-14 22:07:49', NULL),
(93, 8508, 10.00, 'pri', 'balance', '2023-02-14 22:07:52', NULL),
(94, 8504, 10.00, 'pri', 'balance', '2023-02-14 22:07:57', NULL),
(95, 4029, 10.00, 'pri', 'balance', '2023-02-14 22:07:58', NULL),
(96, 6198, 10.00, 'pri', 'balance', '2023-02-14 22:08:05', NULL),
(97, 8513, 10.00, 'pri', 'balance', '2023-02-14 22:08:07', NULL),
(98, 8511, 10.00, 'pri', 'balance', '2023-02-14 22:08:11', NULL),
(99, 8482, 10.00, 'pri', 'balance', '2023-02-14 22:08:34', NULL),
(100, 8522, 10.00, 'pri', 'balance', '2023-02-14 22:08:36', NULL),
(101, 8518, 10.00, 'pri', 'balance', '2023-02-14 22:08:38', NULL),
(102, 8485, 10.00, 'pri', 'balance', '2023-02-14 22:08:48', NULL),
(103, 8510, 10.00, 'pri', 'balance', '2023-02-14 22:08:53', NULL),
(104, 8527, 10.00, 'pri', 'balance', '2023-02-14 22:08:56', NULL),
(105, 8521, 10.00, 'pri', 'balance', '2023-02-14 22:08:57', NULL),
(106, 8526, 10.00, 'pri', 'balance', '2023-02-14 22:08:59', NULL),
(107, 6727, 10.00, 'pri', 'balance', '2023-02-14 22:09:03', NULL),
(108, 8530, 10.00, 'pri', 'balance', '2023-02-14 22:09:09', NULL),
(109, 8507, 10.00, 'pri', 'balance', '2023-02-14 22:09:11', NULL),
(110, 8524, 10.00, 'pri', 'balance', '2023-02-14 22:09:11', NULL),
(111, 8520, 10.00, 'pri', 'balance', '2023-02-14 22:09:28', NULL),
(112, 8537, 10.00, 'pri', 'balance', '2023-02-14 22:09:42', NULL),
(113, 5589, 10.00, 'pri', 'balance', '2023-02-14 22:09:43', NULL),
(114, 8536, 10.00, 'pri', 'balance', '2023-02-14 22:09:47', NULL),
(115, 4871, 10.00, 'pri', 'balance', '2023-02-14 22:09:51', NULL),
(116, 8517, 10.00, 'pri', 'balance', '2023-02-14 22:09:57', NULL),
(117, 8528, 10.00, 'pri', 'balance', '2023-02-14 22:09:57', NULL),
(118, 8501, 10.00, 'pri', 'balance', '2023-02-14 22:09:57', NULL),
(119, 8539, 10.00, 'pri', 'balance', '2023-02-14 22:10:04', NULL),
(120, 8535, 10.00, 'pri', 'balance', '2023-02-14 22:10:06', NULL),
(121, 8531, 10.00, 'pri', 'balance', '2023-02-14 22:10:18', NULL),
(122, 4641, 10.00, 'pri', 'balance', '2023-02-14 22:10:19', NULL),
(123, 6633, 10.00, 'pri', 'balance', '2023-02-14 22:10:19', NULL),
(124, 8525, 10.00, 'pri', 'balance', '2023-02-14 22:10:23', NULL),
(125, 8529, 10.00, 'pri', 'balance', '2023-02-14 22:10:24', NULL),
(126, 4937, 10.00, 'pri', 'balance', '2023-02-14 22:10:24', NULL),
(127, 8533, 10.00, 'pri', 'balance', '2023-02-14 22:10:32', NULL),
(128, 6156, 10.00, 'pri', 'balance', '2023-02-14 22:10:36', NULL),
(129, 8538, 10.00, 'pri', 'balance', '2023-02-14 22:10:38', NULL),
(130, 8523, 10.00, 'pri', 'balance', '2023-02-14 22:10:39', NULL),
(131, 8497, 10.00, 'pri', 'balance', '2023-02-14 22:10:45', NULL),
(132, 7038, 10.00, 'pri', 'balance', '2023-02-14 22:11:16', NULL),
(133, 7841, 10.00, 'pri', 'balance', '2023-02-14 22:11:19', NULL),
(134, 6858, 10.00, 'pri', 'balance', '2023-02-14 22:11:27', NULL),
(135, 8551, 10.00, 'pri', 'balance', '2023-02-14 22:11:27', NULL),
(136, 8555, 10.00, 'pri', 'balance', '2023-02-14 22:11:34', NULL),
(137, 8545, 10.00, 'pri', 'balance', '2023-02-14 22:11:40', NULL),
(138, 8558, 10.00, 'pri', 'balance', '2023-02-14 22:12:17', NULL),
(139, 8562, 10.00, 'pri', 'balance', '2023-02-14 22:12:26', NULL),
(140, 8550, 10.00, 'pri', 'balance', '2023-02-14 22:12:27', NULL),
(141, 8542, 10.00, 'pri', 'balance', '2023-02-14 22:12:30', NULL),
(142, 6345, 10.00, 'pri', 'balance', '2023-02-14 22:12:33', NULL),
(143, 8559, 10.00, 'pri', 'balance', '2023-02-14 22:12:39', NULL),
(144, 8561, 10.00, 'pri', 'balance', '2023-02-14 22:12:42', NULL),
(145, 8564, 10.00, 'pri', 'balance', '2023-02-14 22:12:56', NULL),
(146, 6652, 10.00, 'pri', 'balance', '2023-02-14 22:13:38', NULL),
(147, 6188, 10.00, 'pri', 'balance', '2023-02-14 22:13:40', NULL),
(148, 8566, 10.00, 'pri', 'balance', '2023-02-14 22:13:46', NULL),
(149, 8514, 10.00, 'pri', 'balance', '2023-02-14 22:13:56', NULL),
(150, 8506, 10.00, 'pri', 'balance', '2023-02-14 22:14:12', NULL),
(151, 6269, 10.00, 'pri', 'balance', '2023-02-14 22:14:16', NULL),
(152, 8573, 10.00, 'pri', 'balance', '2023-02-14 22:14:47', NULL),
(153, 8499, 10.00, 'pri', 'balance', '2023-02-14 22:14:49', NULL),
(154, 8540, 10.00, 'pri', 'balance', '2023-02-14 22:14:56', NULL),
(155, 3437, 10.00, 'pri', 'balance', '2023-02-14 22:14:59', NULL),
(156, 7021, 10.00, 'pri', 'balance', '2023-02-14 22:15:02', NULL),
(157, 6284, 10.00, 'pri', 'balance', '2023-02-14 22:15:04', NULL),
(158, 8567, 10.00, 'pri', 'balance', '2023-02-14 22:15:16', NULL),
(159, 8575, 10.00, 'pri', 'balance', '2023-02-14 22:15:32', NULL),
(160, 6408, 10.00, 'pri', 'balance', '2023-02-14 22:15:33', NULL),
(161, 8577, 10.00, 'pri', 'balance', '2023-02-14 22:15:44', NULL),
(162, 6180, 10.00, 'pri', 'balance', '2023-02-14 22:15:54', NULL),
(163, 6724, 10.00, 'pri', 'balance', '2023-02-14 22:16:03', NULL),
(164, 6974, 10.00, 'pri', 'balance', '2023-02-14 22:16:18', NULL),
(165, 8569, 10.00, 'pri', 'balance', '2023-02-14 22:16:25', NULL),
(166, 3766, 10.00, 'pri', 'balance', '2023-02-14 22:16:34', NULL),
(167, 8557, 10.00, 'pri', 'balance', '2023-02-14 22:16:54', NULL),
(168, 8580, 10.00, 'pri', 'balance', '2023-02-14 22:16:59', NULL),
(169, 7586, 10.00, 'pri', 'balance', '2023-02-14 22:17:21', NULL),
(170, 8579, 10.00, 'pri', 'balance', '2023-02-14 22:17:39', NULL),
(171, 8585, 10.00, 'pri', 'balance', '2023-02-14 22:17:56', NULL),
(172, 8590, 10.00, 'pri', 'balance', '2023-02-14 22:18:08', NULL),
(173, 8582, 10.00, 'pri', 'balance', '2023-02-14 22:18:12', NULL),
(174, 8593, 10.00, 'pri', 'balance', '2023-02-14 22:18:27', NULL),
(175, 8592, 10.00, 'pri', 'balance', '2023-02-14 22:18:38', NULL),
(176, 8512, 10.00, 'pri', 'balance', '2023-02-14 22:18:47', NULL),
(177, 8589, 10.00, 'pri', 'balance', '2023-02-14 22:19:09', NULL),
(178, 6443, 10.00, 'pri', 'balance', '2023-02-14 22:19:10', NULL),
(179, 5977, 10.00, 'pri', 'balance', '2023-02-14 22:19:25', NULL),
(180, 4013, 10.00, 'pri', 'balance', '2023-02-14 22:19:29', NULL),
(181, 8598, 10.00, 'pri', 'balance', '2023-02-14 22:19:29', NULL),
(182, 3858, 10.00, 'pri', 'balance', '2023-02-14 22:20:17', NULL),
(183, 8600, 10.00, 'pri', 'balance', '2023-02-14 22:20:19', NULL),
(184, 8594, 10.00, 'pri', 'balance', '2023-02-14 22:20:22', NULL),
(185, 3553, 10.00, 'pri', 'balance', '2023-02-14 22:20:33', NULL),
(186, 8601, 10.00, 'pri', 'balance', '2023-02-14 22:20:39', NULL),
(187, 8597, 10.00, 'pri', 'balance', '2023-02-14 22:20:58', NULL),
(188, 8599, 10.00, 'pri', 'balance', '2023-02-14 22:21:00', NULL),
(189, 8615, 10.00, 'pri', 'balance', '2023-02-14 22:21:26', NULL),
(190, 8612, 10.00, 'pri', 'balance', '2023-02-14 22:21:27', NULL),
(191, 8596, 10.00, 'pri', 'balance', '2023-02-14 22:21:28', NULL),
(192, 8614, 10.00, 'pri', 'balance', '2023-02-14 22:21:29', NULL),
(193, 8610, 10.00, 'pri', 'balance', '2023-02-14 22:21:34', NULL),
(194, 8611, 10.00, 'pri', 'balance', '2023-02-14 22:21:34', NULL),
(195, 8617, 10.00, 'pri', 'balance', '2023-02-14 22:21:35', NULL),
(196, 8613, 10.00, 'pri', 'balance', '2023-02-14 22:21:40', NULL),
(197, 6896, 10.00, 'pri', 'balance', '2023-02-14 22:22:02', NULL),
(198, 5470, 10.00, 'pri', 'balance', '2023-02-14 22:22:21', NULL),
(199, 8606, 10.00, 'pri', 'balance', '2023-02-14 22:22:30', NULL),
(200, 3261, 10.00, 'pri', 'balance', '2023-02-14 22:23:12', NULL),
(201, 8624, 10.00, 'pri', 'balance', '2023-02-14 22:23:18', NULL),
(202, 4266, 10.00, 'pri', 'balance', '2023-02-14 22:23:27', NULL),
(203, 3909, 10.00, 'pri', 'balance', '2023-02-14 22:23:52', NULL),
(204, 4399, 10.00, 'pri', 'balance', '2023-02-14 22:23:55', NULL),
(205, 8627, 10.00, 'pri', 'balance', '2023-02-14 22:24:34', NULL),
(206, 3631, 10.00, 'pri', 'balance', '2023-02-14 22:24:34', NULL),
(207, 8628, 10.00, 'pri', 'balance', '2023-02-14 22:24:37', NULL),
(208, 7669, 10.00, 'pri', 'balance', '2023-02-14 22:25:14', NULL),
(209, 8618, 10.00, 'pri', 'balance', '2023-02-14 22:25:27', NULL),
(210, 8630, 10.00, 'pri', 'balance', '2023-02-14 22:25:35', NULL),
(211, 8634, 10.00, 'pri', 'balance', '2023-02-14 22:25:59', NULL),
(212, 8631, 10.00, 'pri', 'balance', '2023-02-14 22:26:00', NULL),
(213, 8633, 10.00, 'pri', 'balance', '2023-02-14 22:26:03', NULL),
(214, 7257, 10.00, 'pri', 'balance', '2023-02-14 22:26:28', NULL),
(215, 7078, 10.00, 'pri', 'balance', '2023-02-14 22:26:49', NULL),
(216, 8636, 10.00, 'pri', 'balance', '2023-02-14 22:26:55', NULL),
(217, 8638, 10.00, 'pri', 'balance', '2023-02-14 22:27:07', NULL),
(218, 8639, 10.00, 'pri', 'balance', '2023-02-14 22:27:14', NULL),
(219, 8642, 10.00, 'pri', 'balance', '2023-02-14 22:27:16', NULL),
(220, 8643, 10.00, 'pri', 'balance', '2023-02-14 22:27:22', NULL),
(221, 2469, 10.00, 'pri', 'balance', '2023-02-14 22:27:40', NULL),
(222, 6097, 10.00, 'pri', 'balance', '2023-02-14 22:28:25', NULL),
(223, 8648, 10.00, 'pri', 'balance', '2023-02-14 22:28:41', NULL),
(224, 8650, 10.00, 'pri', 'balance', '2023-02-14 22:28:44', NULL),
(225, 8653, 10.00, 'pri', 'balance', '2023-02-14 22:29:07', NULL),
(226, 4089, 10.00, 'pri', 'balance', '2023-02-14 22:29:23', NULL),
(227, 8656, 10.00, 'pri', 'balance', '2023-02-14 22:29:25', NULL),
(228, 3705, 10.00, 'pri', 'balance', '2023-02-14 22:29:36', NULL),
(229, 8646, 10.00, 'pri', 'balance', '2023-02-14 22:29:46', NULL),
(230, 4731, 10.00, 'pri', 'balance', '2023-02-14 22:29:59', NULL),
(231, 8658, 10.00, 'pri', 'balance', '2023-02-14 22:30:00', NULL),
(232, 6079, 10.00, 'pri', 'balance', '2023-02-14 22:30:03', NULL),
(233, 8655, 10.00, 'pri', 'balance', '2023-02-14 22:30:18', NULL),
(234, 8657, 10.00, 'pri', 'balance', '2023-02-14 22:30:19', NULL),
(235, 8660, 10.00, 'pri', 'balance', '2023-02-14 22:30:30', NULL),
(236, 8663, 10.00, 'pri', 'balance', '2023-02-14 22:31:22', NULL),
(237, 4760, 10.00, 'pri', 'balance', '2023-02-14 22:31:22', NULL),
(238, 8664, 10.00, 'pri', 'balance', '2023-02-14 22:31:28', NULL),
(239, 8667, 10.00, 'pri', 'balance', '2023-02-14 22:31:32', NULL),
(240, 8670, 10.00, 'pri', 'balance', '2023-02-14 22:31:46', NULL),
(241, 8668, 10.00, 'pri', 'balance', '2023-02-14 22:31:49', NULL),
(242, 8671, 10.00, 'pri', 'balance', '2023-02-14 22:32:02', NULL),
(243, 8669, 10.00, 'pri', 'balance', '2023-02-14 22:32:09', NULL),
(244, 8666, 10.00, 'pri', 'balance', '2023-02-14 22:32:15', NULL),
(245, 8672, 10.00, 'pri', 'balance', '2023-02-14 22:32:16', NULL),
(246, 8673, 10.00, 'pri', 'balance', '2023-02-14 22:32:17', NULL),
(247, 8675, 10.00, 'pri', 'balance', '2023-02-14 22:32:35', NULL),
(248, 6356, 10.00, 'pri', 'balance', '2023-02-14 22:32:38', NULL),
(249, 5362, 10.00, 'pri', 'balance', '2023-02-14 22:32:45', NULL),
(250, 6798, 10.00, 'pri', 'balance', '2023-02-14 22:32:51', NULL),
(251, 7341, 10.00, 'pri', 'balance', '2023-02-14 22:33:00', NULL),
(252, 8665, 10.00, 'pri', 'balance', '2023-02-14 22:33:10', NULL),
(253, 8677, 10.00, 'pri', 'balance', '2023-02-14 22:33:13', NULL),
(254, 8678, 10.00, 'pri', 'balance', '2023-02-14 22:33:13', NULL),
(255, 8674, 10.00, 'pri', 'balance', '2023-02-14 22:34:00', NULL),
(256, 8683, 10.00, 'pri', 'balance', '2023-02-14 22:34:04', NULL),
(257, 6503, 10.00, 'pri', 'balance', '2023-02-14 22:34:22', NULL),
(258, 8687, 10.00, 'pri', 'balance', '2023-02-14 22:34:23', NULL),
(259, 8685, 10.00, 'pri', 'balance', '2023-02-14 22:34:35', NULL),
(260, 8690, 10.00, 'pri', 'balance', '2023-02-14 22:34:43', NULL),
(261, 5826, 10.00, 'pri', 'balance', '2023-02-14 22:35:07', NULL),
(262, 6730, 10.00, 'pri', 'balance', '2023-02-14 22:35:07', NULL),
(263, 8689, 10.00, 'pri', 'balance', '2023-02-14 22:35:08', NULL),
(264, 6530, 10.00, 'pri', 'balance', '2023-02-14 22:36:01', NULL),
(265, 8696, 10.00, 'pri', 'balance', '2023-02-14 22:36:06', NULL),
(266, 8688, 10.00, 'pri', 'balance', '2023-02-14 22:36:27', NULL),
(267, 6107, 10.00, 'pri', 'balance', '2023-02-14 22:36:34', NULL),
(268, 3311, 10.00, 'pri', 'balance', '2023-02-14 22:36:45', NULL),
(269, 8698, 10.00, 'pri', 'balance', '2023-02-14 22:36:47', NULL),
(270, 8697, 10.00, 'pri', 'balance', '2023-02-14 22:36:57', NULL),
(271, 7999, 10.00, 'pri', 'balance', '2023-02-14 22:37:05', NULL),
(272, 8695, 10.00, 'pri', 'balance', '2023-02-14 22:37:20', NULL),
(273, 8692, 10.00, 'pri', 'balance', '2023-02-14 22:37:26', NULL),
(274, 8704, 10.00, 'pri', 'balance', '2023-02-14 22:37:56', NULL),
(275, 8705, 10.00, 'pri', 'balance', '2023-02-14 22:37:56', NULL),
(276, 6330, 10.00, 'pri', 'balance', '2023-02-14 22:38:03', NULL),
(277, 8703, 10.00, 'pri', 'balance', '2023-02-14 22:38:07', NULL),
(278, 8707, 10.00, 'pri', 'balance', '2023-02-14 22:38:25', NULL),
(279, 8708, 10.00, 'pri', 'balance', '2023-02-14 22:38:30', NULL),
(280, 8710, 10.00, 'pri', 'balance', '2023-02-14 22:38:37', NULL),
(281, 8700, 10.00, 'pri', 'balance', '2023-02-14 22:38:44', NULL),
(282, 8709, 10.00, 'pri', 'balance', '2023-02-14 22:38:56', NULL),
(283, 8706, 10.00, 'pri', 'balance', '2023-02-14 22:39:07', NULL),
(284, 5683, 10.00, 'pri', 'balance', '2023-02-14 22:39:07', NULL),
(285, 8042, 10.00, 'pri', 'balance', '2023-02-14 22:39:19', NULL),
(286, 8714, 10.00, 'pri', 'balance', '2023-02-14 22:39:32', NULL),
(287, 8716, 10.00, 'pri', 'balance', '2023-02-14 22:39:44', NULL),
(288, 8713, 10.00, 'pri', 'balance', '2023-02-14 22:39:49', NULL),
(289, 6968, 10.00, 'pri', 'balance', '2023-02-14 22:39:58', NULL),
(290, 8719, 10.00, 'pri', 'balance', '2023-02-14 22:40:14', NULL),
(291, 8717, 10.00, 'pri', 'balance', '2023-02-14 22:40:17', NULL),
(292, 8722, 10.00, 'pri', 'balance', '2023-02-14 22:41:02', NULL),
(293, 8715, 10.00, 'pri', 'balance', '2023-02-14 22:41:10', NULL),
(294, 8723, 10.00, 'pri', 'balance', '2023-02-14 22:41:16', NULL),
(295, 8721, 10.00, 'pri', 'balance', '2023-02-14 22:41:18', NULL),
(296, 6392, 10.00, 'pri', 'balance', '2023-02-14 22:41:18', NULL),
(297, 6939, 10.00, 'pri', 'balance', '2023-02-14 22:41:37', NULL),
(298, 8727, 10.00, 'pri', 'balance', '2023-02-14 22:41:43', NULL),
(299, 3977, 10.00, 'pri', 'balance', '2023-02-14 22:41:52', NULL),
(300, 3772, 10.00, 'pri', 'balance', '2023-02-14 22:41:54', NULL),
(301, 4787, 10.00, 'pri', 'balance', '2023-02-14 22:41:57', NULL),
(302, 8729, 10.00, 'pri', 'balance', '2023-02-14 22:42:11', NULL),
(303, 8730, 10.00, 'pri', 'balance', '2023-02-14 22:42:23', NULL),
(304, 8718, 10.00, 'pri', 'balance', '2023-02-14 22:42:36', NULL),
(305, 5899, 10.00, 'pri', 'balance', '2023-02-14 22:43:11', NULL),
(306, 8724, 10.00, 'pri', 'balance', '2023-02-14 22:43:18', NULL),
(307, 4826, 10.00, 'pri', 'balance', '2023-02-14 22:44:10', NULL),
(308, 8187, 10.00, 'pri', 'balance', '2023-02-14 22:45:08', NULL),
(309, 8702, 10.00, 'pri', 'balance', '2023-02-14 22:45:30', NULL),
(310, 8734, 10.00, 'pri', 'balance', '2023-02-14 22:45:49', NULL),
(311, 8294, 10.00, 'pri', 'balance', '2023-02-14 22:45:55', NULL),
(312, 4614, 10.00, 'pri', 'balance', '2023-02-14 22:46:05', NULL),
(313, 8740, 10.00, 'pri', 'balance', '2023-02-14 22:46:13', NULL),
(314, 8739, 10.00, 'pri', 'balance', '2023-02-14 22:46:21', NULL),
(315, 8741, 10.00, 'pri', 'balance', '2023-02-14 22:46:29', NULL),
(316, 6087, 10.00, 'pri', 'balance', '2023-02-14 22:46:37', NULL),
(317, 8743, 10.00, 'pri', 'balance', '2023-02-14 22:46:37', NULL),
(318, 5423, 10.00, 'pri', 'balance', '2023-02-14 22:46:42', NULL),
(319, 8742, 10.00, 'pri', 'balance', '2023-02-14 22:46:57', NULL),
(320, 4784, 10.00, 'pri', 'balance', '2023-02-14 22:48:21', NULL),
(321, 8748, 10.00, 'pri', 'balance', '2023-02-14 22:48:40', NULL),
(322, 6201, 10.00, 'pri', 'balance', '2023-02-14 22:48:42', NULL),
(323, 6048, 10.00, 'pri', 'balance', '2023-02-14 22:48:51', NULL),
(324, 8750, 10.00, 'pri', 'balance', '2023-02-14 22:49:31', NULL),
(325, 7610, 10.00, 'pri', 'balance', '2023-02-14 22:49:58', NULL),
(326, 8754, 10.00, 'pri', 'balance', '2023-02-14 22:50:03', NULL),
(327, 8753, 10.00, 'pri', 'balance', '2023-02-14 22:50:03', NULL),
(328, 8756, 10.00, 'pri', 'balance', '2023-02-14 22:51:11', NULL),
(329, 8755, 10.00, 'pri', 'balance', '2023-02-14 22:51:15', NULL),
(330, 8758, 10.00, 'pri', 'balance', '2023-02-14 22:51:17', NULL),
(331, 8757, 10.00, 'pri', 'balance', '2023-02-14 22:51:38', NULL),
(332, 8760, 10.00, 'pri', 'balance', '2023-02-14 22:51:42', NULL),
(333, 8026, 10.00, 'pri', 'balance', '2023-02-14 22:52:01', NULL),
(334, 8761, 10.00, 'pri', 'balance', '2023-02-14 22:52:11', NULL),
(335, 8766, 10.00, 'pri', 'balance', '2023-02-14 22:52:34', NULL),
(336, 6111, 10.00, 'pri', 'balance', '2023-02-14 22:52:39', NULL),
(337, 7451, 10.00, 'pri', 'balance', '2023-02-14 22:52:40', NULL),
(338, 6256, 10.00, 'pri', 'balance', '2023-02-14 22:53:33', NULL),
(339, 7494, 10.00, 'pri', 'balance', '2023-02-14 22:53:36', NULL),
(340, 8769, 10.00, 'pri', 'balance', '2023-02-14 22:53:45', NULL),
(341, 6384, 10.00, 'pri', 'balance', '2023-02-14 22:54:20', NULL),
(342, 8768, 10.00, 'pri', 'balance', '2023-02-14 22:54:25', NULL),
(343, 6993, 10.00, 'pri', 'balance', '2023-02-14 22:54:54', NULL),
(344, 8772, 10.00, 'pri', 'balance', '2023-02-14 22:55:31', NULL),
(345, 8774, 10.00, 'pri', 'balance', '2023-02-14 22:55:52', NULL),
(346, 8733, 10.00, 'pri', 'balance', '2023-02-14 22:56:27', NULL),
(347, 8775, 10.00, 'pri', 'balance', '2023-02-14 22:56:34', NULL),
(348, 8763, 10.00, 'pri', 'balance', '2023-02-14 22:56:37', NULL),
(349, 7157, 10.00, 'pri', 'balance', '2023-02-14 22:56:45', NULL),
(350, 8779, 10.00, 'pri', 'balance', '2023-02-14 22:57:01', NULL),
(351, 8777, 10.00, 'pri', 'balance', '2023-02-14 22:57:07', NULL),
(352, 8783, 10.00, 'pri', 'balance', '2023-02-14 22:57:08', NULL),
(353, 8782, 10.00, 'pri', 'balance', '2023-02-14 22:57:21', NULL),
(354, 8786, 10.00, 'pri', 'balance', '2023-02-14 22:57:38', NULL),
(355, 8784, 10.00, 'pri', 'balance', '2023-02-14 22:57:49', NULL),
(356, 8785, 10.00, 'pri', 'balance', '2023-02-14 22:57:50', NULL),
(357, 8788, 10.00, 'pri', 'balance', '2023-02-14 22:58:00', NULL),
(358, 7650, 10.00, 'pri', 'balance', '2023-02-14 22:58:04', NULL),
(359, 8790, 10.00, 'pri', 'balance', '2023-02-14 22:58:25', NULL),
(360, 8787, 10.00, 'pri', 'balance', '2023-02-14 22:58:39', NULL),
(361, 4194, 10.00, 'pri', 'balance', '2023-02-14 22:58:51', NULL),
(362, 8792, 10.00, 'pri', 'balance', '2023-02-14 22:58:55', NULL),
(363, 6519, 10.00, 'pri', 'balance', '2023-02-14 22:59:07', NULL),
(364, 8791, 10.00, 'pri', 'balance', '2023-02-14 22:59:17', NULL),
(365, 8793, 10.00, 'pri', 'balance', '2023-02-14 22:59:27', NULL),
(366, 8795, 10.00, 'pri', 'balance', '2023-02-14 23:00:00', NULL),
(367, 8796, 10.00, 'pri', 'balance', '2023-02-14 23:00:10', NULL),
(368, 8789, 10.00, 'pri', 'balance', '2023-02-14 23:00:11', NULL),
(369, 8797, 10.00, 'pri', 'balance', '2023-02-14 23:00:18', NULL),
(370, 5880, 10.00, 'pri', 'balance', '2023-02-14 23:00:40', NULL),
(371, 8798, 10.00, 'pri', 'balance', '2023-02-14 23:00:44', NULL),
(372, 8780, 10.00, 'pri', 'balance', '2023-02-14 23:01:42', NULL),
(373, 7107, 10.00, 'pri', 'balance', '2023-02-14 23:02:37', NULL),
(374, 6245, 10.00, 'pri', 'balance', '2023-02-14 23:03:08', NULL),
(375, 8799, 10.00, 'pri', 'balance', '2023-02-14 23:03:19', NULL),
(376, 6178, 10.00, 'pri', 'balance', '2023-02-14 23:03:42', NULL),
(377, 8805, 10.00, 'pri', 'balance', '2023-02-14 23:04:05', NULL),
(378, 8806, 10.00, 'pri', 'balance', '2023-02-14 23:04:20', NULL),
(379, 8808, 10.00, 'pri', 'balance', '2023-02-14 23:04:22', NULL),
(380, 8804, 10.00, 'pri', 'balance', '2023-02-14 23:04:44', NULL),
(381, 8811, 10.00, 'pri', 'balance', '2023-02-14 23:04:52', NULL),
(382, 8809, 10.00, 'pri', 'balance', '2023-02-14 23:05:21', NULL),
(383, 8771, 10.00, 'pri', 'balance', '2023-02-14 23:05:24', NULL),
(384, 7668, 10.00, 'pri', 'balance', '2023-02-14 23:05:40', NULL),
(385, 8812, 10.00, 'pri', 'balance', '2023-02-14 23:05:41', NULL),
(386, 3773, 10.00, 'pri', 'balance', '2023-02-14 23:05:59', NULL),
(387, 8813, 10.00, 'pri', 'balance', '2023-02-14 23:06:04', NULL),
(388, 6620, 10.00, 'pri', 'balance', '2023-02-14 23:07:11', NULL),
(389, 8815, 10.00, 'pri', 'balance', '2023-02-14 23:07:32', NULL),
(390, 8819, 10.00, 'pri', 'balance', '2023-02-14 23:07:43', NULL),
(391, 8822, 10.00, 'pri', 'balance', '2023-02-14 23:08:25', NULL),
(392, 6313, 10.00, 'pri', 'balance', '2023-02-14 23:08:42', NULL),
(393, 8824, 10.00, 'pri', 'balance', '2023-02-14 23:08:48', NULL),
(394, 8825, 10.00, 'pri', 'balance', '2023-02-14 23:08:58', NULL),
(395, 6044, 10.00, 'pri', 'balance', '2023-02-14 23:09:04', NULL),
(396, 8828, 10.00, 'pri', 'balance', '2023-02-14 23:09:17', NULL),
(397, 8830, 10.00, 'pri', 'balance', '2023-02-14 23:09:27', NULL),
(398, 8831, 10.00, 'pri', 'balance', '2023-02-14 23:09:31', NULL),
(399, 8833, 10.00, 'pri', 'balance', '2023-02-14 23:10:17', NULL),
(400, 8834, 10.00, 'pri', 'balance', '2023-02-14 23:10:32', NULL),
(401, 8829, 10.00, 'pri', 'balance', '2023-02-14 23:10:41', NULL),
(402, 8826, 10.00, 'pri', 'balance', '2023-02-14 23:10:56', NULL),
(403, 5740, 10.00, 'pri', 'balance', '2023-02-14 23:11:01', NULL),
(404, 8836, 10.00, 'pri', 'balance', '2023-02-14 23:11:37', NULL),
(405, 4049, 10.00, 'pri', 'balance', '2023-02-14 23:11:53', NULL),
(406, 8837, 10.00, 'pri', 'balance', '2023-02-14 23:12:17', NULL),
(407, 8838, 10.00, 'pri', 'balance', '2023-02-14 23:13:03', NULL),
(408, 8810, 10.00, 'pri', 'balance', '2023-02-14 23:13:14', NULL),
(409, 8839, 10.00, 'pri', 'balance', '2023-02-14 23:13:33', NULL),
(410, 8840, 10.00, 'pri', 'balance', '2023-02-14 23:14:40', NULL),
(411, 8844, 10.00, 'pri', 'balance', '2023-02-14 23:14:51', NULL),
(412, 6171, 10.00, 'pri', 'balance', '2023-02-14 23:15:18', NULL),
(413, 8846, 10.00, 'pri', 'balance', '2023-02-14 23:15:21', NULL),
(414, 8841, 10.00, 'pri', 'balance', '2023-02-14 23:15:34', NULL),
(415, 8849, 10.00, 'pri', 'balance', '2023-02-14 23:16:14', NULL),
(416, 6823, 10.00, 'pri', 'balance', '2023-02-14 23:16:42', NULL),
(417, 8848, 10.00, 'pri', 'balance', '2023-02-14 23:17:23', NULL),
(418, 8851, 10.00, 'pri', 'balance', '2023-02-14 23:17:37', NULL),
(419, 8856, 10.00, 'pri', 'balance', '2023-02-14 23:17:39', NULL),
(420, 6131, 10.00, 'pri', 'balance', '2023-02-14 23:17:49', NULL),
(421, 8855, 10.00, 'pri', 'balance', '2023-02-14 23:18:33', NULL),
(422, 8860, 10.00, 'pri', 'balance', '2023-02-14 23:18:47', NULL),
(423, 8863, 10.00, 'pri', 'balance', '2023-02-14 23:19:12', NULL),
(424, 8365, 10.00, 'pri', 'balance', '2023-02-14 23:19:16', NULL),
(425, 8864, 10.00, 'pri', 'balance', '2023-02-14 23:19:35', NULL),
(426, 8865, 10.00, 'pri', 'balance', '2023-02-14 23:19:35', NULL),
(427, 8866, 10.00, 'pri', 'balance', '2023-02-14 23:19:42', NULL),
(428, 6483, 10.00, 'pri', 'balance', '2023-02-14 23:20:28', NULL),
(429, 6532, 10.00, 'pri', 'balance', '2023-02-14 23:20:29', NULL),
(430, 8868, 10.00, 'pri', 'balance', '2023-02-14 23:21:12', NULL),
(431, 8869, 10.00, 'pri', 'balance', '2023-02-14 23:21:23', NULL),
(432, 8871, 10.00, 'pri', 'balance', '2023-02-14 23:22:15', NULL),
(433, 8873, 10.00, 'pri', 'balance', '2023-02-14 23:22:20', NULL),
(434, 8876, 10.00, 'pri', 'balance', '2023-02-14 23:23:08', NULL),
(435, 8878, 10.00, 'pri', 'balance', '2023-02-14 23:23:26', NULL),
(436, 8875, 10.00, 'pri', 'balance', '2023-02-14 23:23:36', NULL),
(437, 8879, 10.00, 'pri', 'balance', '2023-02-14 23:24:08', NULL),
(438, 8887, 10.00, 'pri', 'balance', '2023-02-14 23:24:39', NULL),
(439, 8880, 10.00, 'pri', 'balance', '2023-02-14 23:25:07', NULL),
(440, 8882, 10.00, 'pri', 'balance', '2023-02-14 23:25:17', NULL),
(441, 8891, 10.00, 'pri', 'balance', '2023-02-14 23:25:26', NULL),
(442, 8885, 10.00, 'pri', 'balance', '2023-02-14 23:25:33', NULL),
(443, 8890, 10.00, 'pri', 'balance', '2023-02-14 23:25:35', NULL),
(444, 6242, 10.00, 'pri', 'balance', '2023-02-14 23:25:52', NULL),
(445, 8874, 10.00, 'pri', 'balance', '2023-02-14 23:26:19', NULL),
(446, 8895, 10.00, 'pri', 'balance', '2023-02-14 23:26:54', NULL),
(447, 8896, 10.00, 'pri', 'balance', '2023-02-14 23:27:09', NULL),
(448, 8894, 10.00, 'pri', 'balance', '2023-02-14 23:27:26', NULL),
(449, 8898, 10.00, 'pri', 'balance', '2023-02-14 23:27:47', NULL),
(450, 8900, 10.00, 'pri', 'balance', '2023-02-14 23:27:54', NULL),
(451, 3851, 10.00, 'pri', 'balance', '2023-02-14 23:28:08', NULL),
(452, 8903, 10.00, 'pri', 'balance', '2023-02-14 23:28:59', NULL),
(453, 8904, 10.00, 'pri', 'balance', '2023-02-14 23:29:03', NULL),
(454, 8897, 10.00, 'pri', 'balance', '2023-02-14 23:29:03', NULL),
(455, 8907, 10.00, 'pri', 'balance', '2023-02-14 23:29:43', NULL),
(456, 8905, 10.00, 'pri', 'balance', '2023-02-14 23:29:47', NULL),
(457, 5629, 10.00, 'pri', 'balance', '2023-02-14 23:29:52', NULL),
(458, 8901, 10.00, 'pri', 'balance', '2023-02-14 23:30:09', NULL),
(459, 8899, 10.00, 'pri', 'balance', '2023-02-14 23:30:23', NULL),
(460, 8908, 10.00, 'pri', 'balance', '2023-02-14 23:30:41', NULL),
(461, 8910, 10.00, 'pri', 'balance', '2023-02-14 23:31:12', NULL),
(462, 8909, 10.00, 'pri', 'balance', '2023-02-14 23:31:20', NULL),
(463, 6057, 10.00, 'pri', 'balance', '2023-02-14 23:31:27', NULL),
(464, 8911, 10.00, 'pri', 'balance', '2023-02-14 23:31:42', NULL),
(465, 3804, 10.00, 'pri', 'balance', '2023-02-14 23:32:24', NULL),
(466, 8914, 10.00, 'pri', 'balance', '2023-02-14 23:32:42', NULL),
(467, 8916, 10.00, 'pri', 'balance', '2023-02-14 23:33:29', NULL),
(468, 7289, 10.00, 'pri', 'balance', '2023-02-14 23:33:34', NULL),
(469, 8917, 10.00, 'pri', 'balance', '2023-02-14 23:34:14', NULL),
(470, 8922, 10.00, 'pri', 'balance', '2023-02-14 23:37:58', NULL),
(471, 6640, 10.00, 'pri', 'balance', '2023-02-14 23:39:03', NULL),
(472, 8921, 10.00, 'pri', 'balance', '2023-02-14 23:39:13', NULL),
(473, 8927, 10.00, 'pri', 'balance', '2023-02-14 23:39:38', NULL),
(474, 8928, 10.00, 'pri', 'balance', '2023-02-14 23:39:43', NULL),
(475, 8929, 10.00, 'pri', 'balance', '2023-02-14 23:39:51', NULL),
(476, 8930, 10.00, 'pri', 'balance', '2023-02-14 23:39:56', NULL),
(477, 6285, 10.00, 'pri', 'balance', '2023-02-14 23:40:25', NULL),
(478, 8933, 10.00, 'pri', 'balance', '2023-02-14 23:40:51', NULL),
(479, 5860, 10.00, 'pri', 'balance', '2023-02-14 23:41:23', NULL),
(480, 8931, 10.00, 'pri', 'balance', '2023-02-14 23:41:32', NULL),
(481, 8934, 10.00, 'pri', 'balance', '2023-02-14 23:41:37', NULL),
(482, 8396, 10.00, 'pri', 'balance', '2023-02-14 23:41:56', NULL),
(483, 8937, 10.00, 'pri', 'balance', '2023-02-14 23:43:10', NULL),
(484, 8940, 10.00, 'pri', 'balance', '2023-02-14 23:44:40', NULL),
(485, 8941, 10.00, 'pri', 'balance', '2023-02-14 23:44:41', NULL),
(486, 8945, 10.00, 'pri', 'balance', '2023-02-14 23:46:48', NULL),
(487, 8944, 10.00, 'pri', 'balance', '2023-02-14 23:46:50', NULL),
(488, 7518, 10.00, 'pri', 'balance', '2023-02-14 23:47:21', NULL),
(489, 8948, 10.00, 'pri', 'balance', '2023-02-14 23:47:22', NULL),
(490, 8946, 10.00, 'pri', 'balance', '2023-02-14 23:47:25', NULL),
(491, 8943, 10.00, 'pri', 'balance', '2023-02-14 23:47:39', NULL),
(492, 8877, 10.00, 'pri', 'balance', '2023-02-14 23:47:45', NULL),
(493, 8950, 10.00, 'pri', 'balance', '2023-02-14 23:47:54', NULL),
(494, 8951, 10.00, 'pri', 'balance', '2023-02-14 23:47:54', NULL),
(495, 8952, 10.00, 'pri', 'balance', '2023-02-14 23:48:25', NULL),
(496, 8953, 10.00, 'pri', 'balance', '2023-02-14 23:48:51', NULL),
(497, 8954, 10.00, 'pri', 'balance', '2023-02-14 23:49:07', NULL),
(498, 6175, 10.00, 'pri', 'balance', '2023-02-14 23:49:11', NULL),
(499, 8955, 10.00, 'pri', 'balance', '2023-02-14 23:49:33', NULL),
(500, 8956, 10.00, 'pri', 'balance', '2023-02-14 23:49:45', NULL),
(501, 8961, 10.00, 'pri', 'balance', '2023-02-14 23:50:49', NULL),
(502, 8963, 10.00, 'pri', 'balance', '2023-02-14 23:51:49', NULL),
(503, 8949, 10.00, 'pri', 'balance', '2023-02-14 23:51:55', NULL),
(504, 8964, 10.00, 'pri', 'balance', '2023-02-14 23:52:37', NULL),
(505, 8967, 10.00, 'pri', 'balance', '2023-02-14 23:54:24', NULL),
(506, 8968, 10.00, 'pri', 'balance', '2023-02-14 23:54:52', NULL),
(507, 6928, 10.00, 'pri', 'balance', '2023-02-14 23:55:20', NULL),
(508, 8965, 10.00, 'pri', 'balance', '2023-02-14 23:55:36', NULL),
(509, 4005, 10.00, 'pri', 'balance', '2023-02-14 23:56:04', NULL),
(510, 8972, 10.00, 'pri', 'balance', '2023-02-14 23:56:10', NULL),
(511, 8973, 10.00, 'pri', 'balance', '2023-02-14 23:57:03', NULL),
(512, 8974, 10.00, 'pri', 'balance', '2023-02-14 23:57:13', NULL),
(513, 8980, 10.00, 'pri', 'balance', '2023-02-14 23:58:11', NULL),
(514, 8981, 10.00, 'pri', 'balance', '2023-02-14 23:58:17', NULL),
(515, 6069, 10.00, 'pri', 'balance', '2023-02-14 23:58:31', NULL),
(516, 8979, 10.00, 'pri', 'balance', '2023-02-14 23:59:22', NULL),
(517, 8983, 10.00, 'pri', 'balance', '2023-02-15 00:00:11', NULL),
(518, 8988, 10.00, 'pri', 'balance', '2023-02-15 00:00:27', NULL),
(519, 8989, 10.00, 'pri', 'balance', '2023-02-15 00:00:34', NULL),
(520, 8985, 10.00, 'pri', 'balance', '2023-02-15 00:00:46', NULL),
(521, 8990, 10.00, 'pri', 'balance', '2023-02-15 00:01:23', NULL),
(522, 8992, 10.00, 'pri', 'balance', '2023-02-15 00:02:32', NULL),
(523, 8996, 10.00, 'pri', 'balance', '2023-02-15 00:04:39', NULL),
(524, 6023, 10.00, 'pri', 'balance', '2023-02-15 00:04:47', NULL),
(525, 9004, 10.00, 'pri', 'balance', '2023-02-15 00:07:57', NULL),
(526, 9006, 10.00, 'pri', 'balance', '2023-02-15 00:08:00', NULL),
(527, 8883, 10.00, 'pri', 'balance', '2023-02-15 00:08:15', NULL),
(528, 9008, 10.00, 'pri', 'balance', '2023-02-15 00:08:21', NULL),
(529, 9005, 10.00, 'pri', 'balance', '2023-02-15 00:09:02', NULL),
(530, 9009, 10.00, 'pri', 'balance', '2023-02-15 00:09:14', NULL),
(531, 9011, 10.00, 'pri', 'balance', '2023-02-15 00:09:23', NULL),
(532, 8194, 10.00, 'pri', 'balance', '2023-02-15 00:09:45', NULL),
(533, 9015, 10.00, 'pri', 'balance', '2023-02-15 00:10:49', NULL),
(534, 9013, 10.00, 'pri', 'balance', '2023-02-15 00:10:50', NULL),
(535, 9014, 10.00, 'pri', 'balance', '2023-02-15 00:10:59', NULL),
(536, 9007, 10.00, 'pri', 'balance', '2023-02-15 00:11:09', NULL),
(537, 9007, 10.00, 'pri', 'balance', '2023-02-15 00:11:09', NULL),
(538, 9018, 10.00, 'pri', 'balance', '2023-02-15 00:11:40', NULL),
(539, 9017, 10.00, 'pri', 'balance', '2023-02-15 00:12:02', NULL),
(540, 9021, 10.00, 'pri', 'balance', '2023-02-15 00:13:01', NULL),
(541, 9019, 10.00, 'pri', 'balance', '2023-02-15 00:13:44', NULL),
(542, 9025, 10.00, 'pri', 'balance', '2023-02-15 00:14:05', NULL),
(543, 9024, 10.00, 'pri', 'balance', '2023-02-15 00:14:15', NULL),
(544, 5366, 10.00, 'pri', 'balance', '2023-02-15 00:14:44', NULL),
(545, 9032, 10.00, 'pri', 'balance', '2023-02-15 00:16:44', NULL),
(546, 9034, 10.00, 'pri', 'balance', '2023-02-15 00:16:56', NULL),
(547, 9035, 10.00, 'pri', 'balance', '2023-02-15 00:17:06', NULL),
(548, 9037, 10.00, 'pri', 'balance', '2023-02-15 00:17:45', NULL),
(549, 7993, 10.00, 'pri', 'balance', '2023-02-15 00:18:02', NULL),
(550, 9020, 10.00, 'pri', 'balance', '2023-02-15 00:18:23', NULL),
(551, 6316, 10.00, 'pri', 'balance', '2023-02-15 00:18:35', NULL),
(552, 9045, 10.00, 'pri', 'balance', '2023-02-15 00:20:07', NULL),
(553, 6383, 10.00, 'pri', 'balance', '2023-02-15 00:20:11', NULL),
(554, 9048, 10.00, 'pri', 'balance', '2023-02-15 00:20:24', NULL),
(555, 9050, 10.00, 'pri', 'balance', '2023-02-15 00:20:58', NULL),
(556, 9051, 10.00, 'pri', 'balance', '2023-02-15 00:21:14', NULL),
(557, 9052, 10.00, 'pri', 'balance', '2023-02-15 00:21:15', NULL),
(558, 9054, 10.00, 'pri', 'balance', '2023-02-15 00:21:56', NULL),
(559, 7913, 10.00, 'pri', 'balance', '2023-02-15 00:22:17', NULL),
(560, 9055, 10.00, 'pri', 'balance', '2023-02-15 00:23:06', NULL),
(561, 9012, 10.00, 'pri', 'balance', '2023-02-15 00:23:17', NULL),
(562, 9059, 10.00, 'pri', 'balance', '2023-02-15 00:24:04', NULL),
(563, 9061, 10.00, 'pri', 'balance', '2023-02-15 00:24:13', NULL),
(564, 9058, 10.00, 'pri', 'balance', '2023-02-15 00:24:19', NULL),
(565, 9062, 10.00, 'pri', 'balance', '2023-02-15 00:24:57', NULL),
(566, 9069, 10.00, 'pri', 'balance', '2023-02-15 00:26:16', NULL),
(567, 9071, 10.00, 'pri', 'balance', '2023-02-15 00:27:31', NULL),
(568, 6903, 10.00, 'pri', 'balance', '2023-02-15 00:27:33', NULL),
(569, 8132, 10.00, 'pri', 'balance', '2023-02-15 00:27:39', NULL),
(570, 8085, 10.00, 'pri', 'balance', '2023-02-15 00:28:13', NULL),
(571, 9086, 10.00, 'pri', 'balance', '2023-02-15 00:30:08', NULL),
(572, 9087, 10.00, 'pri', 'balance', '2023-02-15 00:31:07', NULL),
(573, 9093, 10.00, 'pri', 'balance', '2023-02-15 00:31:14', NULL),
(574, 6702, 10.00, 'pri', 'balance', '2023-02-15 00:31:58', NULL),
(575, 9083, 10.00, 'pri', 'balance', '2023-02-15 00:32:49', NULL),
(576, 9098, 10.00, 'pri', 'balance', '2023-02-15 00:34:49', NULL),
(577, 9101, 10.00, 'pri', 'balance', '2023-02-15 00:35:14', NULL),
(578, 9094, 10.00, 'pri', 'balance', '2023-02-15 00:36:48', NULL),
(579, 9104, 10.00, 'pri', 'balance', '2023-02-15 00:37:10', NULL),
(580, 9108, 10.00, 'pri', 'balance', '2023-02-15 00:37:34', NULL),
(581, 9109, 10.00, 'pri', 'balance', '2023-02-15 00:37:47', NULL),
(582, 9105, 10.00, 'pri', 'balance', '2023-02-15 00:37:52', NULL),
(583, 9111, 10.00, 'pri', 'balance', '2023-02-15 00:38:24', NULL),
(584, 9110, 10.00, 'pri', 'balance', '2023-02-15 00:38:47', NULL),
(585, 9114, 10.00, 'pri', 'balance', '2023-02-15 00:39:09', NULL),
(586, 6459, 10.00, 'pri', 'balance', '2023-02-15 00:40:09', NULL),
(587, 9112, 10.00, 'pri', 'balance', '2023-02-15 00:40:55', NULL),
(588, 9124, 10.00, 'pri', 'balance', '2023-02-15 00:44:09', NULL),
(589, 9127, 10.00, 'pri', 'balance', '2023-02-15 00:44:44', NULL),
(590, 9130, 10.00, 'pri', 'balance', '2023-02-15 00:45:46', NULL),
(591, 9133, 10.00, 'pri', 'balance', '2023-02-15 00:46:19', NULL),
(592, 9137, 10.00, 'pri', 'balance', '2023-02-15 00:47:52', NULL),
(593, 9139, 10.00, 'pri', 'balance', '2023-02-15 00:48:14', NULL),
(594, 9140, 10.00, 'pri', 'balance', '2023-02-15 00:48:45', NULL),
(595, 8409, 10.00, 'pri', 'balance', '2023-02-15 00:49:43', NULL),
(596, 9142, 10.00, 'pri', 'balance', '2023-02-15 00:49:47', NULL),
(597, 9152, 10.00, 'pri', 'balance', '2023-02-15 00:50:26', NULL),
(598, 3962, 10.00, 'pri', 'balance', '2023-02-15 00:50:58', NULL),
(599, 9154, 10.00, 'pri', 'balance', '2023-02-15 00:51:50', NULL),
(600, 5245, 10.00, 'pri', 'balance', '2023-02-15 00:53:12', NULL),
(601, 9158, 10.00, 'pri', 'balance', '2023-02-15 00:53:36', NULL),
(602, 7186, 10.00, 'pri', 'balance', '2023-02-15 00:53:51', NULL),
(603, 9159, 10.00, 'pri', 'balance', '2023-02-15 00:54:01', NULL),
(604, 9162, 10.00, 'pri', 'balance', '2023-02-15 00:54:18', NULL),
(605, 9156, 10.00, 'pri', 'balance', '2023-02-15 00:55:02', NULL),
(606, 9161, 10.00, 'pri', 'balance', '2023-02-15 00:56:03', NULL),
(607, 9169, 10.00, 'pri', 'balance', '2023-02-15 01:00:07', NULL),
(608, 9171, 10.00, 'pri', 'balance', '2023-02-15 01:00:30', NULL),
(609, 9153, 10.00, 'pri', 'balance', '2023-02-15 01:00:54', NULL),
(610, 7245, 10.00, 'pri', 'balance', '2023-02-15 01:01:18', NULL),
(611, 6759, 10.00, 'pri', 'balance', '2023-02-15 01:01:25', NULL),
(612, 9176, 10.00, 'pri', 'balance', '2023-02-15 01:01:54', NULL),
(613, 9173, 10.00, 'pri', 'balance', '2023-02-15 01:02:12', NULL),
(614, 8801, 10.00, 'pri', 'balance', '2023-02-15 01:02:47', NULL),
(615, 9179, 10.00, 'pri', 'balance', '2023-02-15 01:02:54', NULL),
(616, 9183, 10.00, 'pri', 'balance', '2023-02-15 01:03:51', NULL),
(617, 9184, 10.00, 'pri', 'balance', '2023-02-15 01:04:52', NULL),
(618, 9185, 10.00, 'pri', 'balance', '2023-02-15 01:06:08', NULL),
(619, 9188, 10.00, 'pri', 'balance', '2023-02-15 01:06:37', NULL),
(620, 9189, 10.00, 'pri', 'balance', '2023-02-15 01:07:09', NULL),
(621, 9192, 10.00, 'pri', 'balance', '2023-02-15 01:08:22', NULL),
(622, 9195, 10.00, 'pri', 'balance', '2023-02-15 01:10:05', NULL),
(623, 9182, 10.00, 'pri', 'balance', '2023-02-15 01:10:27', NULL),
(624, 9199, 10.00, 'pri', 'balance', '2023-02-15 01:10:37', NULL),
(625, 9197, 10.00, 'pri', 'balance', '2023-02-15 01:11:07', NULL),
(626, 9203, 10.00, 'pri', 'balance', '2023-02-15 01:11:17', NULL),
(627, 9207, 10.00, 'pri', 'balance', '2023-02-15 01:12:49', NULL),
(628, 9208, 10.00, 'pri', 'balance', '2023-02-15 01:12:59', NULL),
(629, 9209, 10.00, 'pri', 'balance', '2023-02-15 01:13:12', NULL),
(630, 6654, 10.00, 'pri', 'balance', '2023-02-15 01:15:22', NULL),
(631, 9222, 10.00, 'pri', 'balance', '2023-02-15 01:19:04', NULL),
(632, 9113, 10.00, 'pri', 'balance', '2023-02-15 01:19:43', NULL),
(633, 9227, 10.00, 'pri', 'balance', '2023-02-15 01:22:45', NULL),
(634, 3481, 10.00, 'pri', 'balance', '2023-02-15 01:23:33', NULL),
(635, 9229, 10.00, 'pri', 'balance', '2023-02-15 01:24:35', NULL),
(636, 9230, 10.00, 'pri', 'balance', '2023-02-15 01:24:42', NULL),
(637, 3803, 10.00, 'pri', 'balance', '2023-02-15 01:26:11', NULL),
(638, 9233, 10.00, 'pri', 'balance', '2023-02-15 01:26:16', NULL),
(639, 9235, 10.00, 'pri', 'balance', '2023-02-15 01:27:32', NULL),
(640, 9240, 10.00, 'pri', 'balance', '2023-02-15 01:29:10', NULL),
(641, 7867, 10.00, 'pri', 'balance', '2023-02-15 01:29:26', NULL),
(642, 9237, 10.00, 'pri', 'balance', '2023-02-15 01:29:48', NULL),
(643, 9243, 10.00, 'pri', 'balance', '2023-02-15 01:30:45', NULL),
(644, 9242, 10.00, 'pri', 'balance', '2023-02-15 01:30:46', NULL),
(645, 9216, 10.00, 'pri', 'balance', '2023-02-15 01:32:32', NULL),
(646, 9250, 10.00, 'pri', 'balance', '2023-02-15 01:34:07', NULL),
(647, 9244, 10.00, 'pri', 'balance', '2023-02-15 01:35:16', NULL),
(648, 9253, 10.00, 'pri', 'balance', '2023-02-15 01:35:17', NULL),
(649, 9256, 10.00, 'pri', 'balance', '2023-02-15 01:36:14', NULL),
(650, 6431, 10.00, 'pri', 'balance', '2023-02-15 01:36:39', NULL),
(651, 9261, 10.00, 'pri', 'balance', '2023-02-15 01:38:15', NULL),
(652, 9265, 10.00, 'pri', 'balance', '2023-02-15 01:38:29', NULL),
(653, 9266, 10.00, 'pri', 'balance', '2023-02-15 01:38:33', NULL),
(654, 9267, 10.00, 'pri', 'balance', '2023-02-15 01:38:53', NULL),
(655, 9269, 10.00, 'pri', 'balance', '2023-02-15 01:42:00', NULL),
(656, 5532, 10.00, 'pri', 'balance', '2023-02-15 01:43:23', NULL),
(657, 9273, 10.00, 'pri', 'balance', '2023-02-15 01:43:52', NULL),
(658, 9271, 10.00, 'pri', 'balance', '2023-02-15 01:44:05', NULL),
(659, 4019, 10.00, 'pri', 'balance', '2023-02-15 01:46:48', NULL),
(660, 9284, 10.00, 'pri', 'balance', '2023-02-15 01:48:52', NULL),
(661, 9285, 10.00, 'pri', 'balance', '2023-02-15 01:49:06', NULL),
(662, 9287, 10.00, 'pri', 'balance', '2023-02-15 01:49:20', NULL),
(663, 9290, 10.00, 'pri', 'balance', '2023-02-15 01:50:53', NULL),
(664, 9289, 10.00, 'pri', 'balance', '2023-02-15 01:51:12', NULL),
(665, 9293, 10.00, 'pri', 'balance', '2023-02-15 01:53:09', NULL),
(666, 9295, 10.00, 'pri', 'balance', '2023-02-15 01:54:46', NULL),
(667, 9296, 10.00, 'pri', 'balance', '2023-02-15 01:54:49', NULL),
(668, 9297, 10.00, 'pri', 'balance', '2023-02-15 01:55:20', NULL),
(669, 9301, 10.00, 'pri', 'balance', '2023-02-15 01:56:48', NULL),
(670, 9294, 10.00, 'pri', 'balance', '2023-02-15 01:57:07', NULL),
(671, 6965, 10.00, 'pri', 'balance', '2023-02-15 01:57:38', NULL),
(672, 9305, 10.00, 'pri', 'balance', '2023-02-15 01:58:18', NULL),
(673, 9307, 10.00, 'pri', 'balance', '2023-02-15 01:58:37', NULL),
(674, 9292, 10.00, 'pri', 'balance', '2023-02-15 01:58:56', NULL),
(675, 9308, 10.00, 'pri', 'balance', '2023-02-15 01:59:25', NULL),
(676, 9107, 10.00, 'pri', 'balance', '2023-02-15 02:04:17', NULL),
(677, 6878, 10.00, 'pri', 'balance', '2023-02-15 02:04:44', NULL),
(678, 9318, 10.00, 'pri', 'balance', '2023-02-15 02:05:04', NULL),
(679, 9322, 10.00, 'pri', 'balance', '2023-02-15 02:07:35', NULL),
(680, 9324, 10.00, 'pri', 'balance', '2023-02-15 02:08:35', NULL),
(681, 9326, 10.00, 'pri', 'balance', '2023-02-15 02:09:15', NULL),
(682, 4837, 10.00, 'pri', 'balance', '2023-02-15 02:13:43', NULL),
(683, 9329, 10.00, 'pri', 'balance', '2023-02-15 02:15:04', NULL),
(684, 9334, 10.00, 'pri', 'balance', '2023-02-15 02:16:07', NULL),
(685, 5182, 10.00, 'pri', 'balance', '2023-02-15 02:16:07', NULL),
(686, 6735, 10.00, 'pri', 'balance', '2023-02-15 02:18:42', NULL),
(687, 9340, 10.00, 'pri', 'balance', '2023-02-15 02:21:08', NULL),
(688, 9343, 10.00, 'pri', 'balance', '2023-02-15 02:22:44', NULL),
(689, 9325, 10.00, 'pri', 'balance', '2023-02-15 02:23:31', NULL),
(690, 7109, 10.00, 'pri', 'balance', '2023-02-15 02:25:55', NULL),
(691, 9347, 10.00, 'pri', 'balance', '2023-02-15 02:26:29', NULL),
(692, 9348, 10.00, 'pri', 'balance', '2023-02-15 02:26:40', NULL),
(693, 9304, 10.00, 'pri', 'balance', '2023-02-15 02:31:42', NULL),
(694, 9359, 10.00, 'pri', 'balance', '2023-02-15 02:32:06', NULL),
(695, 9357, 10.00, 'pri', 'balance', '2023-02-15 02:32:17', NULL),
(696, 9361, 10.00, 'pri', 'balance', '2023-02-15 02:33:00', NULL),
(697, 9364, 1200.00, 'carregar1', 'balance', '2023-02-15 02:33:45', NULL),
(698, 3361, 10.00, 'reginaldo', 'balance', '2023-02-15 18:45:35', NULL),
(699, 6189, 10.00, 'reginaldo', 'balance', '2023-02-15 18:45:51', NULL),
(700, 7093, 10.00, 'reginaldo', 'balance', '2023-02-15 18:46:06', NULL),
(701, 5589, 10.00, 'reginaldo', 'balance', '2023-02-15 18:47:21', NULL),
(702, 5545, 10.00, 'reginaldo', 'balance', '2023-02-15 18:47:28', NULL),
(703, 10085, 10.00, 'reginaldo', 'balance', '2023-02-15 18:47:38', NULL),
(704, 10522, 10.00, 'gama', 'balance', '2023-02-15 21:43:22', NULL),
(705, 6137, 10.00, 'gama', 'balance', '2023-02-15 21:53:58', NULL),
(706, 6483, 10.00, 'gama', 'balance', '2023-02-15 21:54:08', NULL),
(707, 6190, 10.00, 'gama', 'balance', '2023-02-15 21:54:15', NULL),
(708, 6723, 10.00, 'gama', 'balance', '2023-02-15 21:54:47', NULL),
(709, 6301, 10.00, 'gama', 'balance', '2023-02-15 21:54:51', NULL),
(710, 2249, 1000.00, 'murilo', 'balance', '2023-02-16 00:27:17', NULL),
(711, 11474, 10.00, 'reginaldo', 'balance', '2023-02-16 00:27:17', NULL),
(712, 11519, 10.00, 'gama', 'balance', '2023-02-16 00:27:59', NULL),
(713, 11522, 10.00, 'gama', 'balance', '2023-02-16 00:28:08', NULL),
(714, 11521, 10.00, 'gama', 'balance', '2023-02-16 00:28:09', NULL),
(715, 11518, 10.00, 'gama', 'balance', '2023-02-16 00:28:27', NULL),
(716, 11515, 10.00, 'gama', 'balance', '2023-02-16 00:28:29', NULL),
(717, 4398, 10.00, 'gama', 'balance', '2023-02-16 00:28:43', NULL),
(718, 9536, 10.00, 'gama', 'balance', '2023-02-16 00:28:45', NULL),
(719, 11520, 10.00, 'gama', 'balance', '2023-02-16 00:28:49', NULL),
(720, 11509, 10.00, 'gama', 'balance', '2023-02-16 00:28:58', NULL),
(721, 11512, 10.00, 'reginaldo', 'balance', '2023-02-16 00:28:59', NULL),
(722, 11524, 10.00, 'gama', 'balance', '2023-02-16 00:28:59', NULL),
(723, 4398, 10.00, 'reginaldo', 'balance', '2023-02-16 00:29:43', NULL),
(724, 11528, 10.00, 'reginaldo', 'balance', '2023-02-16 00:31:05', NULL),
(725, 6075, 10.00, 'reginaldo', 'balance', '2023-02-16 00:31:47', NULL),
(726, 11534, 10.00, 'reginaldo', 'balance', '2023-02-16 00:33:22', NULL),
(727, 4560, 10.00, 'reginaldo', 'balance', '2023-02-16 00:33:52', NULL),
(728, 11532, 10.00, 'reginaldo', 'balance', '2023-02-16 00:36:22', NULL),
(729, 11535, 10.00, 'reginaldo', 'balance', '2023-02-16 00:42:33', NULL),
(730, 11554, 10.00, 'reginaldo', 'balance', '2023-02-16 00:42:53', NULL),
(731, 2249, 1000.00, 'murilo1', 'balance', '2023-02-16 00:52:47', NULL),
(732, 11614, 10.00, 'gama', 'balance', '2023-02-16 00:52:55', NULL),
(733, 11628, 10.00, 'gama', 'balance', '2023-02-16 00:52:57', NULL),
(734, 11613, 10.00, 'gama', 'balance', '2023-02-16 00:53:17', NULL),
(735, 9237, 10.00, 'gama', 'balance', '2023-02-16 00:53:31', NULL),
(736, 11615, 10.00, 'gama', 'balance', '2023-02-16 00:53:35', NULL),
(737, 11656, 10.00, 'reginaldo', 'balance', '2023-02-16 00:58:40', NULL),
(738, 11661, 10.00, 'gama', 'balance', '2023-02-16 00:59:05', NULL),
(739, 11618, 10.00, 'gama', 'balance', '2023-02-16 00:59:11', NULL),
(740, 11663, 10.00, 'gama', 'balance', '2023-02-16 00:59:16', NULL),
(741, 11655, 10.00, 'gama', 'balance', '2023-02-16 00:59:48', NULL),
(742, 11659, 10.00, 'gama', 'balance', '2023-02-16 01:00:08', NULL),
(743, 11069, 10.00, 'reginaldo', 'balance', '2023-02-16 01:02:00', NULL),
(744, 11670, 10.00, 'reginaldo', 'balance', '2023-02-16 01:03:00', NULL),
(745, 11682, 10.00, 'reginaldo', 'balance', '2023-02-16 01:03:34', NULL),
(746, 4749, 10.00, 'reginaldo', 'balance', '2023-02-16 01:04:50', NULL),
(747, 10479, 1000.00, 'larissaf', 'balance', '2023-02-16 01:24:17', NULL),
(748, 2164, 100.00, 'rider34', 'bonus', '2023-02-16 01:26:59', NULL),
(749, 12212, 1200.00, 'japa', 'balance', '2023-02-16 04:20:58', NULL),
(750, 5532, 10.00, 'reginaldo', 'balance', '2023-02-16 17:53:38', NULL),
(751, 7227, 10.00, 'pri', 'balance', '2023-02-16 17:56:13', NULL),
(752, 10876, 10.00, 'pri', 'balance', '2023-02-16 17:56:56', NULL),
(753, 6977, 10.00, 'reginaldo', 'balance', '2023-02-16 18:02:12', NULL),
(754, 13245, 10.00, 'reginaldo', 'balance', '2023-02-16 18:03:41', NULL),
(755, 5403, 10.00, 'pri', 'balance', '2023-02-16 18:05:54', NULL),
(756, 4680, 10.00, 'reginaldo', 'balance', '2023-02-16 18:06:39', NULL),
(757, 13268, 10.00, 'pri', 'balance', '2023-02-16 18:07:20', NULL),
(758, 6961, 10.00, 'pri', 'balance', '2023-02-16 18:08:52', NULL),
(759, 12174, 10.00, 'pri', 'balance', '2023-02-16 18:10:29', NULL),
(760, 6961, 10.00, 'reginaldo', 'balance', '2023-02-16 18:25:15', NULL),
(761, 2559, 10.00, 'pri', 'balance', '2023-02-16 21:48:52', NULL),
(762, 13725, 10.00, 'reginaldo', 'balance', '2023-02-16 21:49:00', NULL);
INSERT INTO `promo_log` (`id`, `user_id`, `sum`, `code`, `type`, `created_at`, `updated_at`) VALUES
(763, 3884, 10.00, 'reginaldo', 'balance', '2023-02-16 21:51:29', NULL),
(764, 13690, 10.00, 'reginaldo', 'balance', '2023-02-16 21:55:11', NULL),
(765, 8056, 10.00, 'reginaldo', 'balance', '2023-02-16 22:00:17', NULL),
(766, 12497, 10.00, 'pri', 'balance', '2023-02-16 22:00:27', NULL),
(767, 3487, 10.00, 'pri', 'balance', '2023-02-16 22:00:33', NULL),
(768, 6665, 10.00, 'pri', 'balance', '2023-02-16 22:00:35', NULL),
(769, 10605, 10.00, 'pri', 'balance', '2023-02-16 22:00:49', NULL),
(770, 12518, 10.00, 'pri', 'balance', '2023-02-16 22:00:51', NULL),
(771, 5546, 10.00, 'reginaldo', 'balance', '2023-02-16 22:06:20', NULL),
(772, 8552, 10.00, 'reginaldo', 'balance', '2023-02-16 22:09:46', NULL),
(773, 11890, 10.00, 'pri', 'balance', '2023-02-16 22:10:00', NULL),
(774, 4728, 10.00, 'pri', 'balance', '2023-02-16 22:10:01', NULL),
(775, 13806, 10.00, 'pri', 'balance', '2023-02-16 22:10:02', NULL),
(776, 13765, 10.00, 'pri', 'balance', '2023-02-16 22:10:02', NULL),
(777, 13823, 10.00, 'pri', 'balance', '2023-02-16 22:10:05', NULL),
(778, 11197, 10.00, 'pri', 'balance', '2023-02-16 22:11:52', NULL),
(779, 13821, 10.00, 'pri', 'balance', '2023-02-16 22:11:53', NULL),
(780, 10613, 10.00, 'pri', 'balance', '2023-02-16 22:11:54', NULL),
(781, 13852, 10.00, 'pri', 'balance', '2023-02-16 22:11:55', NULL),
(782, 13674, 10.00, 'pri', 'balance', '2023-02-16 22:11:56', NULL),
(783, 10291, 10.00, 'reginaldo', 'balance', '2023-02-16 22:16:26', NULL),
(784, 10211, 10.00, 'reginaldo', 'balance', '2023-02-16 22:20:28', NULL),
(785, 13356, 10.00, 'reginaldo', 'balance', '2023-02-16 22:25:31', NULL),
(786, 2413, 1000.00, 'teste', 'balance', '2023-02-16 22:26:18', NULL),
(787, 11248, 10.00, 'reginaldo', 'balance', '2023-02-16 22:36:38', NULL),
(788, 13687, 500.00, 'promo', 'balance', '2023-02-16 22:52:44', NULL),
(789, 2164, 200.00, 'rider12', 'balance', '2023-02-16 23:48:07', NULL),
(790, 2164, 10000.00, '403', 'balance', '2023-02-17 05:31:24', NULL),
(791, 6923, 10.00, 'pri', 'balance', '2023-02-17 19:50:46', NULL),
(792, 17152, 10.00, 'pri', 'balance', '2023-02-17 20:09:27', NULL),
(793, 9021, 10.00, 'reginaldo', 'balance', '2023-02-17 20:13:32', NULL),
(794, 16990, 10.00, 'reginaldo', 'balance', '2023-02-17 20:14:22', NULL),
(795, 17169, 10.00, 'reginaldo', 'balance', '2023-02-17 20:15:44', NULL),
(796, 7923, 10.00, 'reginaldo', 'balance', '2023-02-17 20:16:11', NULL),
(797, 17171, 10.00, 'reginaldo', 'balance', '2023-02-17 20:16:14', NULL),
(798, 13486, 10.00, 'reginaldo', 'balance', '2023-02-17 20:16:26', NULL),
(799, 17226, 10.00, 'pri', 'balance', '2023-02-17 20:26:57', NULL),
(800, 17228, 10.00, 'pri', 'balance', '2023-02-17 20:28:40', NULL),
(801, 17223, 10.00, 'pri', 'balance', '2023-02-17 20:37:03', NULL),
(802, 6312, 10.00, 'pri', 'balance', '2023-02-17 20:43:49', NULL),
(803, 14336, 10.00, 'pri', 'balance', '2023-02-17 20:44:04', NULL),
(804, 19239, 10.00, 'pri', 'balance', '2023-02-18 13:39:27', NULL),
(805, 15972, 10.00, 'pri', 'balance', '2023-02-18 13:45:34', NULL),
(806, 19293, 10.00, 'pri', 'balance', '2023-02-18 13:46:18', NULL),
(807, 6718, 10.00, 'reginaldo', 'balance', '2023-02-18 13:48:29', NULL),
(808, 6727, 10.00, 'reginaldo', 'balance', '2023-02-18 13:52:50', NULL),
(809, 17757, 10.00, 'reginaldo', 'balance', '2023-02-18 13:53:00', NULL),
(810, 5619, 10.00, 'reginaldo', 'balance', '2023-02-18 13:54:54', NULL),
(811, 5753, 10.00, 'reginaldo', 'balance', '2023-02-18 13:55:26', NULL),
(812, 5629, 10.00, 'reginaldo', 'balance', '2023-02-18 13:55:54', NULL),
(813, 19314, 10.00, 'reginaldo', 'balance', '2023-02-18 13:56:01', NULL),
(814, 19313, 10.00, 'reginaldo', 'balance', '2023-02-18 13:56:13', NULL),
(815, 19307, 10.00, 'reginaldo', 'balance', '2023-02-18 13:56:16', NULL),
(816, 19311, 10.00, 'reginaldo', 'balance', '2023-02-18 13:57:20', NULL),
(817, 4118, 10.00, 'reginaldo', 'balance', '2023-02-18 13:57:40', NULL),
(818, 19309, 10.00, 'reginaldo', 'balance', '2023-02-18 13:57:59', NULL),
(819, 12083, 10.00, 'reginaldo', 'balance', '2023-02-18 13:58:03', NULL),
(820, 19322, 10.00, 'reginaldo', 'balance', '2023-02-18 13:59:03', NULL),
(821, 19321, 10.00, 'reginaldo', 'balance', '2023-02-18 13:59:06', NULL),
(822, 17538, 10.00, 'reginaldo', 'balance', '2023-02-18 13:59:52', NULL),
(823, 13282, 10.00, 'reginaldo', 'balance', '2023-02-18 13:59:58', NULL),
(824, 10381, 10.00, 'reginaldo', 'balance', '2023-02-18 14:00:10', NULL),
(825, 7001, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:00', NULL),
(826, 6702, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:10', NULL),
(827, 11491, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:18', NULL),
(828, 6579, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:19', NULL),
(829, 11006, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:41', NULL),
(830, 10994, 10.00, 'reginaldo', 'balance', '2023-02-18 14:01:42', NULL),
(831, 16978, 10.00, 'reginaldo', 'balance', '2023-02-18 14:02:26', NULL),
(832, 19332, 10.00, 'reginaldo', 'balance', '2023-02-18 14:02:43', NULL),
(833, 6779, 10.00, 'reginaldo', 'balance', '2023-02-18 14:02:57', NULL),
(834, 7587, 10.00, 'pri', 'balance', '2023-02-18 14:03:30', NULL),
(835, 10348, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:06', NULL),
(836, 19324, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:11', NULL),
(837, 8833, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:33', NULL),
(838, 10423, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:48', NULL),
(839, 4232, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:50', NULL),
(840, 19331, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:58', NULL),
(841, 13192, 10.00, 'reginaldo', 'balance', '2023-02-18 14:04:59', NULL),
(842, 14245, 10.00, 'reginaldo', 'balance', '2023-02-18 14:05:06', NULL),
(843, 10488, 10.00, 'reginaldo', 'balance', '2023-02-18 14:05:18', NULL),
(844, 4784, 10.00, 'reginaldo', 'balance', '2023-02-18 14:05:24', NULL),
(845, 19316, 10.00, 'reginaldo', 'balance', '2023-02-18 14:05:51', NULL),
(846, 3539, 10.00, 'reginaldo', 'balance', '2023-02-18 14:06:01', NULL),
(847, 8265, 10.00, 'reginaldo', 'balance', '2023-02-18 14:06:16', NULL),
(848, 19292, 10.00, 'reginaldo', 'balance', '2023-02-18 14:06:50', NULL),
(849, 19345, 10.00, 'reginaldo', 'balance', '2023-02-18 14:07:03', NULL),
(850, 7656, 10.00, 'reginaldo', 'balance', '2023-02-18 14:07:18', NULL),
(851, 11944, 10.00, 'reginaldo', 'balance', '2023-02-18 14:07:56', NULL),
(852, 7968, 10.00, 'reginaldo', 'balance', '2023-02-18 14:08:05', NULL),
(853, 13208, 10.00, 'reginaldo', 'balance', '2023-02-18 14:08:18', NULL),
(854, 10375, 10.00, 'reginaldo', 'balance', '2023-02-18 14:08:37', NULL),
(855, 6456, 10.00, 'reginaldo', 'balance', '2023-02-18 14:08:40', NULL),
(856, 13955, 10.00, 'pri', 'balance', '2023-02-18 14:09:16', NULL),
(857, 19313, 10.00, 'pri', 'balance', '2023-02-18 14:09:23', NULL),
(858, 13415, 10.00, 'reginaldo', 'balance', '2023-02-18 14:09:41', NULL),
(859, 14794, 10.00, 'pri', 'balance', '2023-02-18 14:09:43', NULL),
(860, 12265, 10.00, 'reginaldo', 'balance', '2023-02-18 14:11:18', NULL),
(861, 19351, 10.00, 'reginaldo', 'balance', '2023-02-18 14:11:23', NULL),
(862, 19355, 10.00, 'reginaldo', 'balance', '2023-02-18 14:11:24', NULL),
(863, 19354, 10.00, 'reginaldo', 'balance', '2023-02-18 14:11:29', NULL),
(864, 10201, 10.00, 'reginaldo', 'balance', '2023-02-18 14:11:36', NULL),
(865, 19358, 10.00, 'reginaldo', 'balance', '2023-02-18 14:12:18', NULL),
(866, 19353, 10.00, 'reginaldo', 'balance', '2023-02-18 14:12:26', NULL),
(867, 11089, 10.00, 'reginaldo', 'balance', '2023-02-18 14:12:36', NULL),
(868, 6947, 10.00, 'reginaldo', 'balance', '2023-02-18 14:13:08', NULL),
(869, 19365, 10.00, 'reginaldo', 'balance', '2023-02-18 14:14:16', NULL),
(870, 19370, 10.00, 'reginaldo', 'balance', '2023-02-18 14:14:42', NULL),
(871, 6296, 10.00, 'reginaldo', 'balance', '2023-02-18 14:14:45', NULL),
(872, 9704, 10.00, 'reginaldo', 'balance', '2023-02-18 14:15:01', NULL),
(873, 6131, 10.00, 'reginaldo', 'balance', '2023-02-18 14:15:04', NULL),
(874, 11684, 10.00, 'reginaldo', 'balance', '2023-02-18 14:15:31', NULL),
(875, 19380, 10.00, 'reginaldo', 'balance', '2023-02-18 14:16:57', NULL),
(876, 18890, 10.00, 'reginaldo', 'balance', '2023-02-18 14:16:57', NULL),
(877, 19382, 10.00, 'reginaldo', 'balance', '2023-02-18 14:17:45', NULL),
(878, 5615, 10.00, 'reginaldo', 'balance', '2023-02-18 14:17:45', NULL),
(879, 18890, 10.00, 'pri', 'balance', '2023-02-18 14:17:47', NULL),
(880, 6532, 10.00, 'reginaldo', 'balance', '2023-02-18 14:17:51', NULL),
(881, 17822, 10.00, 'reginaldo', 'balance', '2023-02-18 14:18:19', NULL),
(882, 19388, 10.00, 'reginaldo', 'balance', '2023-02-18 14:18:53', NULL),
(883, 19389, 10.00, 'reginaldo', 'balance', '2023-02-18 14:19:08', NULL),
(884, 19391, 10.00, 'reginaldo', 'balance', '2023-02-18 14:20:09', NULL),
(885, 3994, 10.00, 'reginaldo', 'balance', '2023-02-18 14:20:15', NULL),
(886, 19397, 10.00, 'reginaldo', 'balance', '2023-02-18 14:21:10', NULL),
(887, 19401, 10.00, 'reginaldo', 'balance', '2023-02-18 14:21:14', NULL),
(888, 8777, 10.00, 'reginaldo', 'balance', '2023-02-18 14:21:27', NULL),
(889, 7927, 10.00, 'reginaldo', 'balance', '2023-02-18 14:21:34', NULL),
(890, 6895, 10.00, 'reginaldo', 'balance', '2023-02-18 14:21:52', NULL),
(891, 19403, 10.00, 'reginaldo', 'balance', '2023-02-18 14:22:00', NULL),
(892, 7702, 10.00, 'reginaldo', 'balance', '2023-02-18 14:22:18', NULL),
(893, 19406, 10.00, 'pri', 'balance', '2023-02-18 14:22:40', NULL),
(894, 17222, 10.00, 'reginaldo', 'balance', '2023-02-18 14:23:21', NULL),
(895, 19409, 10.00, 'reginaldo', 'balance', '2023-02-18 14:23:49', NULL),
(896, 19413, 10.00, 'pri', 'balance', '2023-02-18 14:24:31', NULL),
(897, 10221, 10.00, 'reginaldo', 'balance', '2023-02-18 14:24:37', NULL),
(898, 19414, 10.00, 'reginaldo', 'balance', '2023-02-18 14:24:54', NULL),
(899, 19419, 10.00, 'reginaldo', 'balance', '2023-02-18 14:25:38', NULL),
(900, 19405, 10.00, 'reginaldo', 'balance', '2023-02-18 14:26:46', NULL),
(901, 19423, 10.00, 'reginaldo', 'balance', '2023-02-18 14:27:14', NULL),
(902, 6505, 10.00, 'reginaldo', 'balance', '2023-02-18 14:27:27', NULL),
(903, 8124, 10.00, 'reginaldo', 'balance', '2023-02-18 14:27:47', NULL),
(904, 10960, 10.00, 'reginaldo', 'balance', '2023-02-18 14:27:50', NULL),
(905, 19427, 10.00, 'pri', 'balance', '2023-02-18 14:27:54', NULL),
(906, 8124, 10.00, 'pri', 'balance', '2023-02-18 14:28:14', NULL),
(907, 19429, 10.00, 'reginaldo', 'balance', '2023-02-18 14:28:40', NULL),
(908, 19430, 10.00, 'reginaldo', 'balance', '2023-02-18 14:28:47', NULL),
(909, 19403, 10.00, 'pri', 'balance', '2023-02-18 14:28:54', NULL),
(910, 11308, 10.00, 'reginaldo', 'balance', '2023-02-18 14:29:26', NULL),
(911, 8067, 10.00, 'reginaldo', 'balance', '2023-02-18 14:30:37', NULL),
(912, 5899, 10.00, 'reginaldo', 'balance', '2023-02-18 14:30:56', NULL),
(913, 3300, 10.00, 'reginaldo', 'balance', '2023-02-18 14:31:01', NULL),
(914, 19442, 10.00, 'pri', 'balance', '2023-02-18 14:31:11', NULL),
(915, 10248, 10.00, 'reginaldo', 'balance', '2023-02-18 14:31:12', NULL),
(916, 19444, 10.00, 'pri', 'balance', '2023-02-18 14:31:29', NULL),
(917, 19444, 10.00, 'reginaldo', 'balance', '2023-02-18 14:31:38', NULL),
(918, 14104, 10.00, 'reginaldo', 'balance', '2023-02-18 14:32:23', NULL),
(919, 14236, 10.00, 'reginaldo', 'balance', '2023-02-18 14:32:28', NULL),
(920, 17049, 10.00, 'reginaldo', 'balance', '2023-02-18 14:32:38', NULL),
(921, 4757, 10.00, 'reginaldo', 'balance', '2023-02-18 14:33:54', NULL),
(922, 5606, 10.00, 'reginaldo', 'balance', '2023-02-18 14:34:25', NULL),
(923, 8622, 10.00, 'pri', 'balance', '2023-02-18 14:34:30', NULL),
(924, 19451, 10.00, 'pri', 'balance', '2023-02-18 14:34:57', NULL),
(925, 12632, 10.00, 'reginaldo', 'balance', '2023-02-18 14:34:59', NULL),
(926, 19451, 10.00, 'reginaldo', 'balance', '2023-02-18 14:35:08', NULL),
(927, 12632, 10.00, 'pri', 'balance', '2023-02-18 14:35:10', NULL),
(928, 19401, 10.00, 'pri', 'balance', '2023-02-18 14:35:54', NULL),
(929, 10907, 10.00, 'reginaldo', 'balance', '2023-02-18 14:35:56', NULL),
(930, 19458, 10.00, 'pri', 'balance', '2023-02-18 14:39:53', NULL),
(931, 10960, 10.00, 'pri', 'balance', '2023-02-18 14:40:34', NULL),
(932, 19462, 10.00, 'pri', 'balance', '2023-02-18 14:41:06', NULL),
(933, 19462, 10.00, 'reginaldo', 'balance', '2023-02-18 14:41:16', NULL),
(934, 2554, 10.00, 'pri', 'balance', '2023-02-18 14:41:23', NULL),
(935, 6291, 10.00, 'reginaldo', 'balance', '2023-02-18 14:41:50', NULL),
(936, 17259, 10.00, 'reginaldo', 'balance', '2023-02-18 14:42:22', NULL),
(937, 19471, 10.00, 'reginaldo', 'balance', '2023-02-18 14:43:47', NULL),
(938, 19471, 10.00, 'pri', 'balance', '2023-02-18 14:43:54', NULL),
(939, 17794, 10.00, 'reginaldo', 'balance', '2023-02-18 14:43:54', NULL),
(940, 13207, 10.00, 'reginaldo', 'balance', '2023-02-18 14:43:57', NULL),
(941, 17185, 10.00, 'reginaldo', 'balance', '2023-02-18 14:44:12', NULL),
(942, 19475, 10.00, 'reginaldo', 'balance', '2023-02-18 14:44:23', NULL),
(943, 19466, 10.00, 'reginaldo', 'balance', '2023-02-18 14:44:42', NULL),
(944, 19476, 10.00, 'reginaldo', 'balance', '2023-02-18 14:45:16', NULL),
(945, 14197, 10.00, 'reginaldo', 'balance', '2023-02-18 14:45:29', NULL),
(946, 14593, 10.00, 'reginaldo', 'balance', '2023-02-18 14:45:54', NULL),
(947, 13912, 10.00, 'reginaldo', 'balance', '2023-02-18 14:46:10', NULL),
(948, 19470, 10.00, 'reginaldo', 'balance', '2023-02-18 14:46:30', NULL),
(949, 19472, 10.00, 'reginaldo', 'balance', '2023-02-18 14:47:04', NULL),
(950, 6542, 10.00, 'reginaldo', 'balance', '2023-02-18 14:47:07', NULL),
(951, 19465, 10.00, 'reginaldo', 'balance', '2023-02-18 14:47:12', NULL),
(952, 6296, 10.00, 'pri', 'balance', '2023-02-18 14:47:31', NULL),
(953, 13997, 10.00, 'pri', 'balance', '2023-02-18 14:47:34', NULL),
(954, 6072, 10.00, 'pri', 'balance', '2023-02-18 14:47:46', NULL),
(955, 12057, 10.00, 'pri', 'balance', '2023-02-18 14:47:47', NULL),
(956, 14197, 10.00, 'pri', 'balance', '2023-02-18 14:47:52', NULL),
(957, 11241, 10.00, 'pri', 'balance', '2023-02-18 14:48:00', NULL),
(958, 19316, 10.00, 'pri', 'balance', '2023-02-18 14:48:06', NULL),
(959, 3567, 10.00, 'pri', 'balance', '2023-02-18 14:48:07', NULL),
(960, 12764, 10.00, 'pri', 'balance', '2023-02-18 14:48:22', NULL),
(961, 3666, 10.00, 'pri', 'balance', '2023-02-18 14:48:23', NULL),
(962, 11311, 10.00, 'pri', 'balance', '2023-02-18 14:48:32', NULL),
(963, 13997, 10.00, 'reginaldo', 'balance', '2023-02-18 14:48:50', NULL),
(964, 14498, 10.00, 'pri', 'balance', '2023-02-18 14:48:51', NULL),
(965, 6694, 10.00, 'pri', 'balance', '2023-02-18 14:48:56', NULL),
(966, 17920, 10.00, 'pri', 'balance', '2023-02-18 14:48:58', NULL),
(967, 11413, 10.00, 'pri', 'balance', '2023-02-18 14:49:03', NULL),
(968, 18573, 10.00, 'pri', 'balance', '2023-02-18 14:49:08', NULL),
(969, 19481, 10.00, 'reginaldo', 'balance', '2023-02-18 14:49:16', NULL),
(970, 11442, 10.00, 'pri', 'balance', '2023-02-18 14:49:22', NULL),
(971, 5378, 10.00, 'pri', 'balance', '2023-02-18 14:49:52', NULL),
(972, 6066, 10.00, 'pri', 'balance', '2023-02-18 14:49:53', NULL),
(973, 11438, 10.00, 'pri', 'balance', '2023-02-18 14:49:55', NULL),
(974, 19439, 10.00, 'reginaldo', 'balance', '2023-02-18 14:50:01', NULL),
(975, 13795, 10.00, 'pri', 'balance', '2023-02-18 14:50:05', NULL),
(976, 10541, 10.00, 'pri', 'balance', '2023-02-18 14:50:11', NULL),
(977, 5570, 10.00, 'reginaldo', 'balance', '2023-02-18 14:50:14', NULL),
(978, 11072, 10.00, 'pri', 'balance', '2023-02-18 14:50:21', NULL),
(979, 13353, 10.00, 'pri', 'balance', '2023-02-18 14:50:35', NULL),
(980, 13941, 10.00, 'reginaldo', 'balance', '2023-02-18 14:50:36', NULL),
(981, 11097, 10.00, 'pri', 'balance', '2023-02-18 14:50:37', NULL),
(982, 12131, 10.00, 'pri', 'balance', '2023-02-18 14:50:39', NULL),
(983, 5082, 10.00, 'pri', 'balance', '2023-02-18 14:50:56', NULL),
(984, 11458, 10.00, 'pri', 'balance', '2023-02-18 14:50:59', NULL),
(985, 6831, 10.00, 'pri', 'balance', '2023-02-18 14:51:12', NULL),
(986, 10221, 10.00, 'pri', 'balance', '2023-02-18 14:51:15', NULL),
(987, 17222, 10.00, 'pri', 'balance', '2023-02-18 14:51:17', NULL),
(988, 14270, 10.00, 'pri', 'balance', '2023-02-18 14:51:22', NULL),
(989, 13207, 10.00, 'pri', 'balance', '2023-02-18 14:51:43', NULL),
(990, 14230, 10.00, 'pri', 'balance', '2023-02-18 14:51:45', NULL),
(991, 17368, 10.00, 'pri', 'balance', '2023-02-18 14:51:50', NULL),
(992, 19493, 10.00, 'pri', 'balance', '2023-02-18 14:51:50', NULL),
(993, 6813, 10.00, 'pri', 'balance', '2023-02-18 14:51:52', NULL),
(994, 6082, 10.00, 'pri', 'balance', '2023-02-18 14:51:54', NULL),
(995, 17299, 10.00, 'pri', 'balance', '2023-02-18 14:51:54', NULL),
(996, 13337, 10.00, 'pri', 'balance', '2023-02-18 14:51:57', NULL),
(997, 7353, 10.00, 'pri', 'balance', '2023-02-18 14:51:59', NULL),
(998, 11201, 10.00, 'pri', 'balance', '2023-02-18 14:52:07', NULL),
(999, 19499, 10.00, 'pri', 'balance', '2023-02-18 14:52:17', NULL),
(1000, 14749, 10.00, 'pri', 'balance', '2023-02-18 14:52:24', NULL),
(1001, 17404, 10.00, 'pri', 'balance', '2023-02-18 14:52:33', NULL),
(1002, 14472, 10.00, 'pri', 'balance', '2023-02-18 14:52:38', NULL),
(1003, 19504, 10.00, 'pri', 'balance', '2023-02-18 14:52:39', NULL),
(1004, 10348, 10.00, 'pri', 'balance', '2023-02-18 14:52:42', NULL),
(1005, 19503, 10.00, 'pri', 'balance', '2023-02-18 14:52:46', NULL),
(1006, 19507, 10.00, 'pri', 'balance', '2023-02-18 14:52:50', NULL),
(1007, 3822, 10.00, 'pri', 'balance', '2023-02-18 14:52:51', NULL),
(1008, 9775, 10.00, 'pri', 'balance', '2023-02-18 14:52:56', NULL),
(1009, 9788, 10.00, 'pri', 'balance', '2023-02-18 14:52:58', NULL),
(1010, 3372, 10.00, 'pri', 'balance', '2023-02-18 14:52:58', NULL),
(1011, 13891, 10.00, 'pri', 'balance', '2023-02-18 14:53:00', NULL),
(1012, 19510, 10.00, 'reginaldo', 'balance', '2023-02-18 14:53:02', NULL),
(1013, 19508, 10.00, 'pri', 'balance', '2023-02-18 14:53:17', NULL),
(1014, 3558, 10.00, 'pri', 'balance', '2023-02-18 14:53:28', NULL),
(1015, 17822, 10.00, 'pri', 'balance', '2023-02-18 14:53:29', NULL),
(1016, 19404, 10.00, 'pri', 'balance', '2023-02-18 14:53:36', NULL),
(1017, 4042, 10.00, 'pri', 'balance', '2023-02-18 14:53:40', NULL),
(1018, 17185, 10.00, 'pri', 'balance', '2023-02-18 14:53:47', NULL),
(1019, 14551, 10.00, 'pri', 'balance', '2023-02-18 14:54:00', NULL),
(1020, 6034, 10.00, 'pri', 'balance', '2023-02-18 14:54:04', NULL),
(1021, 10240, 10.00, 'pri', 'balance', '2023-02-18 14:54:06', NULL),
(1022, 11862, 10.00, 'pri', 'balance', '2023-02-18 14:54:16', NULL),
(1023, 4889, 10.00, 'pri', 'balance', '2023-02-18 14:54:21', NULL),
(1024, 19511, 10.00, 'reginaldo', 'balance', '2023-02-18 14:54:28', NULL),
(1025, 19515, 10.00, 'pri', 'balance', '2023-02-18 14:54:28', NULL),
(1026, 12832, 10.00, 'pri', 'balance', '2023-02-18 14:54:31', NULL),
(1027, 4128, 10.00, 'pri', 'balance', '2023-02-18 14:54:45', NULL),
(1028, 19519, 10.00, 'pri', 'balance', '2023-02-18 14:54:50', NULL),
(1029, 4611, 10.00, 'reginaldo', 'balance', '2023-02-18 14:54:55', NULL),
(1030, 10848, 10.00, 'pri', 'balance', '2023-02-18 14:55:00', NULL),
(1031, 19520, 10.00, 'pri', 'balance', '2023-02-18 14:55:14', NULL),
(1032, 19521, 10.00, 'pri', 'balance', '2023-02-18 14:55:22', NULL),
(1033, 19520, 10.00, 'reginaldo', 'balance', '2023-02-18 14:55:22', NULL),
(1034, 10430, 10.00, 'pri', 'balance', '2023-02-18 14:55:23', NULL),
(1035, 19525, 10.00, 'pri', 'balance', '2023-02-18 14:55:33', NULL),
(1036, 12083, 10.00, 'pri', 'balance', '2023-02-18 14:55:45', NULL),
(1037, 13332, 10.00, 'reginaldo', 'balance', '2023-02-18 14:55:47', NULL),
(1038, 19513, 10.00, 'reginaldo', 'balance', '2023-02-18 14:57:24', NULL),
(1039, 14236, 10.00, 'pri', 'balance', '2023-02-18 14:57:28', NULL),
(1040, 7044, 10.00, 'pri', 'balance', '2023-02-18 14:57:52', NULL),
(1041, 16910, 10.00, 'pri', 'balance', '2023-02-18 14:58:01', NULL),
(1042, 10903, 10.00, 'pri', 'balance', '2023-02-18 14:58:09', NULL),
(1043, 17040, 10.00, 'pri', 'balance', '2023-02-18 14:58:10', NULL),
(1044, 19532, 10.00, 'pri', 'balance', '2023-02-18 14:58:17', NULL),
(1045, 19527, 10.00, 'pri', 'balance', '2023-02-18 14:58:18', NULL),
(1046, 10248, 10.00, 'pri', 'balance', '2023-02-18 14:58:20', NULL),
(1047, 11867, 10.00, 'pri', 'balance', '2023-02-18 14:58:29', NULL),
(1048, 18715, 10.00, 'pri', 'balance', '2023-02-18 14:58:29', NULL),
(1049, 14364, 10.00, 'pri', 'balance', '2023-02-18 14:58:33', NULL),
(1050, 19534, 10.00, 'pri', 'balance', '2023-02-18 14:58:52', NULL),
(1051, 19524, 10.00, 'pri', 'balance', '2023-02-18 14:58:59', NULL),
(1052, 10619, 10.00, 'pri', 'balance', '2023-02-18 14:59:02', NULL),
(1053, 4097, 10.00, 'pri', 'balance', '2023-02-18 14:59:04', NULL),
(1054, 12365, 10.00, 'reginaldo', 'balance', '2023-02-18 14:59:09', NULL),
(1055, 11221, 10.00, 'pri', 'balance', '2023-02-18 14:59:13', NULL),
(1056, 19536, 10.00, 'pri', 'balance', '2023-02-18 14:59:22', NULL),
(1057, 17340, 10.00, 'pri', 'balance', '2023-02-18 14:59:28', NULL),
(1058, 11570, 10.00, 'pri', 'balance', '2023-02-18 14:59:38', NULL),
(1059, 6189, 10.00, 'pri', 'balance', '2023-02-18 14:59:46', NULL),
(1060, 19535, 10.00, 'pri', 'balance', '2023-02-18 14:59:46', NULL),
(1061, 13473, 10.00, 'pri', 'balance', '2023-02-18 14:59:59', NULL),
(1062, 14086, 10.00, 'pri', 'balance', '2023-02-18 15:00:02', NULL),
(1063, 8676, 10.00, 'pri', 'balance', '2023-02-18 15:00:14', NULL),
(1064, 11089, 10.00, 'pri', 'balance', '2023-02-18 15:00:36', NULL),
(1065, 17643, 10.00, 'pri', 'balance', '2023-02-18 15:00:38', NULL),
(1066, 10375, 10.00, 'pri', 'balance', '2023-02-18 15:00:43', NULL),
(1067, 13912, 10.00, 'pri', 'balance', '2023-02-18 15:01:12', NULL),
(1068, 12028, 10.00, 'pri', 'balance', '2023-02-18 15:01:33', NULL),
(1069, 19489, 10.00, 'pri', 'balance', '2023-02-18 15:02:54', NULL),
(1070, 15070, 10.00, 'pri', 'balance', '2023-02-18 15:03:28', NULL),
(1071, 9401, 10.00, 'pri', 'balance', '2023-02-18 15:04:00', NULL),
(1072, 14479, 10.00, 'pri', 'balance', '2023-02-18 15:04:01', NULL),
(1073, 7247, 10.00, 'pri', 'balance', '2023-02-18 15:04:03', NULL),
(1074, 8265, 10.00, 'pri', 'balance', '2023-02-18 15:04:19', NULL),
(1075, 19309, 10.00, 'pri', 'balance', '2023-02-18 15:04:46', NULL),
(1076, 19548, 10.00, 'pri', 'balance', '2023-02-18 15:04:48', NULL),
(1077, 12833, 10.00, 'pri', 'balance', '2023-02-18 15:04:52', NULL),
(1078, 19516, 10.00, 'pri', 'balance', '2023-02-18 15:04:53', NULL),
(1079, 6771, 10.00, 'pri', 'balance', '2023-02-18 15:04:57', NULL),
(1080, 19545, 10.00, 'pri', 'balance', '2023-02-18 15:04:59', NULL),
(1081, 7077, 10.00, 'pri', 'balance', '2023-02-18 15:05:11', NULL),
(1082, 11607, 10.00, 'pri', 'balance', '2023-02-18 15:05:18', NULL),
(1083, 13778, 10.00, 'reginaldo', 'balance', '2023-02-18 15:05:19', NULL),
(1084, 19547, 10.00, 'pri', 'balance', '2023-02-18 15:05:20', NULL),
(1085, 19523, 10.00, 'pri', 'balance', '2023-02-18 15:05:21', NULL),
(1086, 17510, 10.00, 'pri', 'balance', '2023-02-18 15:05:26', NULL),
(1087, 10721, 10.00, 'pri', 'balance', '2023-02-18 15:05:36', NULL),
(1088, 5928, 10.00, 'pri', 'balance', '2023-02-18 15:05:37', NULL),
(1089, 19552, 10.00, 'pri', 'balance', '2023-02-18 15:05:54', NULL),
(1090, 13290, 10.00, 'pri', 'balance', '2023-02-18 15:06:09', NULL),
(1091, 7199, 10.00, 'reginaldo', 'balance', '2023-02-18 15:06:20', NULL),
(1092, 6813, 10.00, 'reginaldo', 'balance', '2023-02-18 15:06:33', NULL),
(1093, 19439, 10.00, 'pri', 'balance', '2023-02-18 15:06:53', NULL),
(1094, 19556, 10.00, 'pri', 'balance', '2023-02-18 15:07:00', NULL),
(1095, 4118, 10.00, 'pri', 'balance', '2023-02-18 15:07:09', NULL),
(1096, 10994, 10.00, 'pri', 'balance', '2023-02-18 15:07:20', NULL),
(1097, 19558, 10.00, 'pri', 'balance', '2023-02-18 15:07:25', NULL),
(1098, 12319, 10.00, 'pri', 'balance', '2023-02-18 15:07:47', NULL),
(1099, 19544, 10.00, 'pri', 'balance', '2023-02-18 15:08:09', NULL),
(1100, 15009, 10.00, 'pri', 'balance', '2023-02-18 15:08:14', NULL),
(1101, 17661, 10.00, 'pri', 'balance', '2023-02-18 15:08:20', NULL),
(1102, 19562, 10.00, 'pri', 'balance', '2023-02-18 15:08:38', NULL),
(1103, 13332, 10.00, 'pri', 'balance', '2023-02-18 15:08:43', NULL),
(1104, 19563, 10.00, 'pri', 'balance', '2023-02-18 15:09:04', NULL),
(1105, 6457, 10.00, 'pri', 'balance', '2023-02-18 15:09:08', NULL),
(1106, 19567, 10.00, 'pri', 'balance', '2023-02-18 15:09:13', NULL),
(1107, 11797, 10.00, 'pri', 'balance', '2023-02-18 15:09:21', NULL),
(1108, 19572, 10.00, 'pri', 'balance', '2023-02-18 15:09:52', NULL),
(1109, 12056, 10.00, 'pri', 'balance', '2023-02-18 15:10:00', NULL),
(1110, 7092, 10.00, 'reginaldo', 'balance', '2023-02-18 15:10:03', NULL),
(1111, 19573, 10.00, 'reginaldo', 'balance', '2023-02-18 15:10:04', NULL),
(1112, 14729, 10.00, 'pri', 'balance', '2023-02-18 15:10:06', NULL),
(1113, 13544, 10.00, 'pri', 'balance', '2023-02-18 15:10:15', NULL),
(1114, 6313, 10.00, 'reginaldo', 'balance', '2023-02-18 15:10:31', NULL),
(1115, 19580, 10.00, 'pri', 'balance', '2023-02-18 15:10:36', NULL),
(1116, 19581, 10.00, 'pri', 'balance', '2023-02-18 15:10:59', NULL),
(1117, 19579, 10.00, 'pri', 'balance', '2023-02-18 15:11:00', NULL),
(1118, 16014, 10.00, 'pri', 'balance', '2023-02-18 15:11:05', NULL),
(1119, 17779, 10.00, 'pri', 'balance', '2023-02-18 15:11:07', NULL),
(1120, 19577, 10.00, 'reginaldo', 'balance', '2023-02-18 15:11:14', NULL),
(1121, 6299, 10.00, 'pri', 'balance', '2023-02-18 15:11:18', NULL),
(1122, 19585, 10.00, 'pri', 'balance', '2023-02-18 15:11:20', NULL),
(1123, 19587, 10.00, 'pri', 'balance', '2023-02-18 15:11:33', NULL),
(1124, 5199, 10.00, 'pri', 'balance', '2023-02-18 15:11:38', NULL),
(1125, 6258, 10.00, 'pri', 'balance', '2023-02-18 15:12:07', NULL),
(1126, 10488, 10.00, 'pri', 'balance', '2023-02-18 15:12:16', NULL),
(1127, 19590, 10.00, 'pri', 'balance', '2023-02-18 15:13:07', NULL),
(1128, 17578, 10.00, 'pri', 'balance', '2023-02-18 15:14:44', NULL),
(1129, 17028, 10.00, 'pri', 'balance', '2023-02-18 15:14:49', NULL),
(1130, 19597, 10.00, 'pri', 'balance', '2023-02-18 15:14:53', NULL),
(1131, 12553, 10.00, 'pri', 'balance', '2023-02-18 15:14:59', NULL),
(1132, 19598, 10.00, 'pri', 'balance', '2023-02-18 15:14:59', NULL),
(1133, 19591, 10.00, 'reginaldo', 'balance', '2023-02-18 15:15:05', NULL),
(1134, 8873, 10.00, 'reginaldo', 'balance', '2023-02-18 15:15:26', NULL),
(1135, 18918, 10.00, 'pri', 'balance', '2023-02-18 15:15:27', NULL),
(1136, 19595, 10.00, 'reginaldo', 'balance', '2023-02-18 15:15:33', NULL),
(1137, 19409, 10.00, 'pri', 'balance', '2023-02-18 15:15:35', NULL),
(1138, 11652, 10.00, 'pri', 'balance', '2023-02-18 15:15:39', NULL),
(1139, 7468, 10.00, 'pri', 'balance', '2023-02-18 15:15:42', NULL),
(1140, 19595, 10.00, 'pri', 'balance', '2023-02-18 15:15:43', NULL),
(1141, 12808, 10.00, 'pri', 'balance', '2023-02-18 15:17:23', NULL),
(1142, 19586, 10.00, 'pri', 'balance', '2023-02-18 15:17:23', NULL),
(1143, 14073, 10.00, 'pri', 'balance', '2023-02-18 15:17:36', NULL),
(1144, 19533, 10.00, 'pri', 'balance', '2023-02-18 15:17:36', NULL),
(1145, 3453, 10.00, 'reginaldo', 'balance', '2023-02-18 15:17:39', NULL),
(1146, 19602, 10.00, 'pri', 'balance', '2023-02-18 15:18:04', NULL),
(1147, 12261, 10.00, 'reginaldo', 'balance', '2023-02-18 15:18:24', NULL),
(1148, 17259, 10.00, 'pri', 'balance', '2023-02-18 15:18:32', NULL),
(1149, 19601, 10.00, 'pri', 'balance', '2023-02-18 15:18:37', NULL),
(1150, 17665, 10.00, 'reginaldo', 'balance', '2023-02-18 15:18:40', NULL),
(1151, 17501, 10.00, 'pri', 'balance', '2023-02-18 15:18:51', NULL),
(1152, 16659, 10.00, 'pri', 'balance', '2023-02-18 15:18:52', NULL),
(1153, 19610, 10.00, 'pri', 'balance', '2023-02-18 15:19:01', NULL),
(1154, 19613, 10.00, 'pri', 'balance', '2023-02-18 15:19:26', NULL),
(1155, 12422, 10.00, 'pri', 'balance', '2023-02-18 15:19:27', NULL),
(1156, 17416, 10.00, 'reginaldo', 'balance', '2023-02-18 15:19:53', NULL),
(1157, 8267, 10.00, 'pri', 'balance', '2023-02-18 15:20:03', NULL),
(1158, 13985, 10.00, 'pri', 'balance', '2023-02-18 15:20:08', NULL),
(1159, 11500, 10.00, 'pri', 'balance', '2023-02-18 15:20:12', NULL),
(1160, 17614, 10.00, 'pri', 'balance', '2023-02-18 15:20:21', NULL),
(1161, 10792, 10.00, 'pri', 'balance', '2023-02-18 15:20:24', NULL),
(1162, 11442, 10.00, 'reginaldo', 'balance', '2023-02-18 15:20:29', NULL),
(1163, 19616, 10.00, 'reginaldo', 'balance', '2023-02-18 15:20:34', NULL),
(1164, 19139, 10.00, 'pri', 'balance', '2023-02-18 15:20:37', NULL),
(1165, 6576, 10.00, 'pri', 'balance', '2023-02-18 15:20:41', NULL),
(1166, 10110, 10.00, 'reginaldo', 'balance', '2023-02-18 15:20:41', NULL),
(1167, 19616, 10.00, 'pri', 'balance', '2023-02-18 15:20:43', NULL),
(1168, 19612, 10.00, 'pri', 'balance', '2023-02-18 15:20:45', NULL),
(1169, 19618, 10.00, 'pri', 'balance', '2023-02-18 15:20:59', NULL),
(1170, 6291, 10.00, 'pri', 'balance', '2023-02-18 15:20:59', NULL),
(1171, 17669, 10.00, 'pri', 'balance', '2023-02-18 15:21:04', NULL),
(1172, 19618, 10.00, 'reginaldo', 'balance', '2023-02-18 15:21:58', NULL),
(1173, 19608, 10.00, 'pri', 'balance', '2023-02-18 15:22:41', NULL),
(1174, 13174, 10.00, 'pri', 'balance', '2023-02-18 15:22:43', NULL),
(1175, 4034, 10.00, 'pri', 'balance', '2023-02-18 15:23:11', NULL),
(1176, 13987, 10.00, 'reginaldo', 'balance', '2023-02-18 15:23:14', NULL),
(1177, 10481, 10.00, 'pri', 'balance', '2023-02-18 15:23:15', NULL),
(1178, 14095, 10.00, 'pri', 'balance', '2023-02-18 15:23:21', NULL),
(1179, 14566, 10.00, 'pri', 'balance', '2023-02-18 15:23:30', NULL),
(1180, 12845, 10.00, 'pri', 'balance', '2023-02-18 15:23:34', NULL),
(1181, 14239, 10.00, 'pri', 'balance', '2023-02-18 15:23:47', NULL),
(1182, 11557, 10.00, 'pri', 'balance', '2023-02-18 15:23:55', NULL),
(1183, 3658, 10.00, 'reginaldo', 'balance', '2023-02-18 15:23:56', NULL),
(1184, 17468, 10.00, 'reginaldo', 'balance', '2023-02-18 15:24:15', NULL),
(1185, 10964, 10.00, 'pri', 'balance', '2023-02-18 15:24:29', NULL),
(1186, 13799, 10.00, 'pri', 'balance', '2023-02-18 15:24:36', NULL),
(1187, 19626, 10.00, 'reginaldo', 'balance', '2023-02-18 15:24:37', NULL),
(1188, 11006, 10.00, 'pri', 'balance', '2023-02-18 15:24:37', NULL),
(1189, 19626, 10.00, 'pri', 'balance', '2023-02-18 15:24:43', NULL),
(1190, 19630, 10.00, 'pri', 'balance', '2023-02-18 15:24:51', NULL),
(1191, 11597, 10.00, 'pri', 'balance', '2023-02-18 15:24:56', NULL),
(1192, 3890, 10.00, 'pri', 'balance', '2023-02-18 15:24:56', NULL),
(1193, 19628, 10.00, 'pri', 'balance', '2023-02-18 15:24:57', NULL),
(1194, 19631, 10.00, 'pri', 'balance', '2023-02-18 15:24:57', NULL),
(1195, 18848, 10.00, 'pri', 'balance', '2023-02-18 15:25:26', NULL),
(1196, 17794, 10.00, 'pri', 'balance', '2023-02-18 15:25:45', NULL),
(1197, 19637, 10.00, 'reginaldo', 'balance', '2023-02-18 15:25:53', NULL),
(1198, 19629, 10.00, 'pri', 'balance', '2023-02-18 15:26:07', NULL),
(1199, 13192, 10.00, 'pri', 'balance', '2023-02-18 15:26:08', NULL),
(1200, 19639, 10.00, 'pri', 'balance', '2023-02-18 15:27:00', NULL),
(1201, 19633, 10.00, 'pri', 'balance', '2023-02-18 15:28:19', NULL),
(1202, 19633, 10.00, 'reginaldo', 'balance', '2023-02-18 15:30:13', NULL),
(1203, 19638, 10.00, 'pri', 'balance', '2023-02-18 15:31:42', NULL),
(1204, 17019, 10.00, 'pri', 'balance', '2023-02-18 15:31:51', NULL),
(1205, 14239, 10.00, 'reginaldo', 'balance', '2023-02-18 15:31:58', NULL),
(1206, 14527, 10.00, 'pri', 'balance', '2023-02-18 15:32:00', NULL),
(1207, 11263, 10.00, 'pri', 'balance', '2023-02-18 15:32:13', NULL),
(1208, 12698, 10.00, 'pri', 'balance', '2023-02-18 15:32:19', NULL),
(1209, 19643, 10.00, 'pri', 'balance', '2023-02-18 15:32:33', NULL),
(1210, 3990, 10.00, 'reginaldo', 'balance', '2023-02-18 15:33:21', NULL),
(1211, 17122, 10.00, 'reginaldo', 'balance', '2023-02-18 15:33:29', NULL),
(1212, 4861, 10.00, 'pri', 'balance', '2023-02-18 15:33:32', NULL),
(1213, 14735, 10.00, 'pri', 'balance', '2023-02-18 15:33:55', NULL),
(1214, 6919, 10.00, 'pri', 'balance', '2023-02-18 15:34:05', NULL),
(1215, 12883, 10.00, 'reginaldo', 'balance', '2023-02-18 15:34:20', NULL),
(1216, 19624, 10.00, 'pri', 'balance', '2023-02-18 15:34:34', NULL),
(1217, 10211, 10.00, 'pri', 'balance', '2023-02-18 15:34:52', NULL),
(1218, 19651, 10.00, 'reginaldo', 'balance', '2023-02-18 15:34:56', NULL),
(1219, 8938, 10.00, 'pri', 'balance', '2023-02-18 15:36:11', NULL),
(1220, 17612, 10.00, 'pri', 'balance', '2023-02-18 15:36:54', NULL),
(1221, 19662, 10.00, 'pri', 'balance', '2023-02-18 15:37:17', NULL),
(1222, 5797, 10.00, 'pri', 'balance', '2023-02-18 15:37:26', NULL),
(1223, 19664, 10.00, 'reginaldo', 'balance', '2023-02-18 15:37:58', NULL),
(1224, 19665, 10.00, 'pri', 'balance', '2023-02-18 15:38:31', NULL),
(1225, 19666, 10.00, 'pri', 'balance', '2023-02-18 15:38:41', NULL),
(1226, 14163, 10.00, 'pri', 'balance', '2023-02-18 15:38:55', NULL),
(1227, 13544, 10.00, 'reginaldo', 'balance', '2023-02-18 15:39:00', NULL),
(1228, 19670, 10.00, 'pri', 'balance', '2023-02-18 15:39:15', NULL),
(1229, 19661, 10.00, 'pri', 'balance', '2023-02-18 15:39:25', NULL),
(1230, 18979, 10.00, 'reginaldo', 'balance', '2023-02-18 15:39:40', NULL),
(1231, 19663, 10.00, 'pri', 'balance', '2023-02-18 15:40:01', NULL),
(1232, 14337, 10.00, 'pri', 'balance', '2023-02-18 15:41:25', NULL),
(1233, 14129, 10.00, 'pri', 'balance', '2023-02-18 15:43:14', NULL),
(1234, 11250, 10.00, 'pri', 'balance', '2023-02-18 15:43:43', NULL),
(1235, 9511, 10.00, 'pri', 'balance', '2023-02-18 15:43:52', NULL),
(1236, 10459, 10.00, 'pri', 'balance', '2023-02-18 15:43:55', NULL),
(1237, 11834, 10.00, 'pri', 'balance', '2023-02-18 15:44:15', NULL),
(1238, 14284, 10.00, 'reginaldo', 'balance', '2023-02-18 15:44:23', NULL),
(1239, 17529, 10.00, 'pri', 'balance', '2023-02-18 15:44:30', NULL),
(1240, 14284, 10.00, 'pri', 'balance', '2023-02-18 15:44:46', NULL),
(1241, 19659, 10.00, 'pri', 'balance', '2023-02-18 15:44:49', NULL),
(1242, 19612, 10.00, 'reginaldo', 'balance', '2023-02-18 15:44:54', NULL),
(1243, 19676, 10.00, 'pri', 'balance', '2023-02-18 15:45:03', NULL),
(1244, 19677, 10.00, 'pri', 'balance', '2023-02-18 15:45:05', NULL),
(1245, 4159, 10.00, 'pri', 'balance', '2023-02-18 15:45:17', NULL),
(1246, 4680, 10.00, 'pri', 'balance', '2023-02-18 15:45:32', NULL),
(1247, 19292, 10.00, 'pri', 'balance', '2023-02-18 15:45:33', NULL),
(1248, 16484, 10.00, 'pri', 'balance', '2023-02-18 15:45:38', NULL),
(1249, 19674, 10.00, 'pri', 'balance', '2023-02-18 15:45:53', NULL),
(1250, 8459, 10.00, 'pri', 'balance', '2023-02-18 15:46:12', NULL),
(1251, 19476, 10.00, 'pri', 'balance', '2023-02-18 15:46:14', NULL),
(1252, 7016, 10.00, 'pri', 'balance', '2023-02-18 15:46:53', NULL),
(1253, 19673, 10.00, 'pri', 'balance', '2023-02-18 15:47:04', NULL),
(1254, 17883, 10.00, 'pri', 'balance', '2023-02-18 15:47:08', NULL),
(1255, 3990, 10.00, 'pri', 'balance', '2023-02-18 15:47:45', NULL),
(1256, 18906, 10.00, 'pri', 'balance', '2023-02-18 15:47:50', NULL),
(1257, 19685, 10.00, 'pri', 'balance', '2023-02-18 15:47:50', NULL),
(1258, 14725, 10.00, 'reginaldo', 'balance', '2023-02-18 15:47:51', NULL),
(1259, 19682, 10.00, 'pri', 'balance', '2023-02-18 15:47:58', NULL),
(1260, 4038, 10.00, 'pri', 'balance', '2023-02-18 15:48:21', NULL),
(1261, 17687, 10.00, 'pri', 'balance', '2023-02-18 15:48:21', NULL),
(1262, 12205, 10.00, 'pri', 'balance', '2023-02-18 15:48:31', NULL),
(1263, 17542, 10.00, 'reginaldo', 'balance', '2023-02-18 15:48:54', NULL),
(1264, 14303, 10.00, 'pri', 'balance', '2023-02-18 15:49:05', NULL),
(1265, 19689, 10.00, 'pri', 'balance', '2023-02-18 15:49:34', NULL),
(1266, 17965, 10.00, 'reginaldo', 'balance', '2023-02-18 15:50:19', NULL),
(1267, 19688, 10.00, 'reginaldo', 'balance', '2023-02-18 15:50:36', NULL),
(1268, 19691, 10.00, 'pri', 'balance', '2023-02-18 15:52:03', NULL),
(1269, 5615, 10.00, 'pri', 'balance', '2023-02-18 15:52:13', NULL),
(1270, 4807, 10.00, 'pri', 'balance', '2023-02-18 15:52:16', NULL),
(1271, 12705, 10.00, 'pri', 'balance', '2023-02-18 15:52:22', NULL),
(1272, 6155, 10.00, 'pri', 'balance', '2023-02-18 15:52:37', NULL),
(1273, 12778, 10.00, 'pri', 'balance', '2023-02-18 15:52:56', NULL),
(1274, 8820, 10.00, 'pri', 'balance', '2023-02-18 15:52:59', NULL),
(1275, 19692, 10.00, 'pri', 'balance', '2023-02-18 15:53:06', NULL),
(1276, 6335, 10.00, 'pri', 'balance', '2023-02-18 15:53:25', NULL),
(1277, 19695, 10.00, 'pri', 'balance', '2023-02-18 15:53:58', NULL),
(1278, 17744, 10.00, 'pri', 'balance', '2023-02-18 15:54:30', NULL),
(1279, 11273, 10.00, 'pri', 'balance', '2023-02-18 15:55:03', NULL),
(1280, 19700, 10.00, 'pri', 'balance', '2023-02-18 15:55:21', NULL),
(1281, 17888, 10.00, 'pri', 'balance', '2023-02-18 15:55:25', NULL),
(1282, 7261, 10.00, 'pri', 'balance', '2023-02-18 15:55:47', NULL),
(1283, 19701, 10.00, 'reginaldo', 'balance', '2023-02-18 15:56:00', NULL),
(1284, 13415, 10.00, 'pri', 'balance', '2023-02-18 15:56:17', NULL),
(1285, 11716, 10.00, 'pri', 'balance', '2023-02-18 15:56:57', NULL),
(1286, 19706, 10.00, 'pri', 'balance', '2023-02-18 15:57:17', NULL),
(1287, 19698, 10.00, 'pri', 'balance', '2023-02-18 15:57:22', NULL),
(1288, 5689, 10.00, 'pri', 'balance', '2023-02-18 15:57:56', NULL),
(1289, 19660, 10.00, 'pri', 'balance', '2023-02-18 15:58:03', NULL),
(1290, 19660, 10.00, 'reginaldo', 'balance', '2023-02-18 15:58:11', NULL),
(1291, 18722, 10.00, 'pri', 'balance', '2023-02-18 15:58:20', NULL),
(1292, 3935, 10.00, 'pri', 'balance', '2023-02-18 15:58:24', NULL),
(1293, 19702, 10.00, 'pri', 'balance', '2023-02-18 15:58:29', NULL),
(1294, 14244, 10.00, 'pri', 'balance', '2023-02-18 15:58:29', NULL),
(1295, 19708, 10.00, 'pri', 'balance', '2023-02-18 15:58:51', NULL),
(1296, 16852, 10.00, 'pri', 'balance', '2023-02-18 15:58:56', NULL),
(1297, 6136, 10.00, 'pri', 'balance', '2023-02-18 15:58:59', NULL),
(1298, 19724, 10.00, 'pri', 'balance', '2023-02-18 15:59:28', NULL),
(1299, 13056, 10.00, 'pri', 'balance', '2023-02-18 15:59:29', NULL),
(1300, 19712, 10.00, 'pri', 'balance', '2023-02-18 15:59:48', NULL),
(1301, 15933, 10.00, 'pri', 'balance', '2023-02-18 16:00:11', NULL),
(1302, 19715, 10.00, 'pri', 'balance', '2023-02-18 16:00:33', NULL),
(1303, 19726, 10.00, 'pri', 'balance', '2023-02-18 16:00:50', NULL),
(1304, 14139, 10.00, 'pri', 'balance', '2023-02-18 16:00:52', NULL),
(1305, 19696, 10.00, 'pri', 'balance', '2023-02-18 16:01:02', NULL),
(1306, 19730, 10.00, 'pri', 'balance', '2023-02-18 16:01:09', NULL),
(1307, 18374, 10.00, 'reginaldo', 'balance', '2023-02-18 16:01:17', NULL),
(1308, 19730, 10.00, 'reginaldo', 'balance', '2023-02-18 16:01:18', NULL),
(1309, 19718, 10.00, 'pri', 'balance', '2023-02-18 16:01:18', NULL),
(1310, 19733, 10.00, 'pri', 'balance', '2023-02-18 16:02:26', NULL),
(1311, 12797, 10.00, 'pri', 'balance', '2023-02-18 16:02:44', NULL),
(1312, 6505, 10.00, 'pri', 'balance', '2023-02-18 16:03:00', NULL),
(1313, 8093, 10.00, 'reginaldo', 'balance', '2023-02-18 16:03:12', NULL),
(1314, 19745, 10.00, 'pri', 'balance', '2023-02-18 16:04:01', NULL),
(1315, 10618, 10.00, 'pri', 'balance', '2023-02-18 16:04:06', NULL),
(1316, 13846, 10.00, 'pri', 'balance', '2023-02-18 16:04:14', NULL),
(1317, 19739, 10.00, 'pri', 'balance', '2023-02-18 16:04:48', NULL),
(1318, 11988, 10.00, 'pri', 'balance', '2023-02-18 16:04:49', NULL),
(1319, 19720, 10.00, 'pri', 'balance', '2023-02-18 16:05:00', NULL),
(1320, 19741, 10.00, 'pri', 'balance', '2023-02-18 16:05:12', NULL),
(1321, 19719, 10.00, 'pri', 'balance', '2023-02-18 16:05:13', NULL),
(1322, 19742, 10.00, 'pri', 'balance', '2023-02-18 16:06:49', NULL),
(1323, 7140, 10.00, 'pri', 'balance', '2023-02-18 16:06:54', NULL),
(1324, 16234, 10.00, 'reginaldo', 'balance', '2023-02-18 16:06:56', NULL),
(1325, 19732, 10.00, 'pri', 'balance', '2023-02-18 16:07:03', NULL),
(1326, 8885, 10.00, 'reginaldo', 'balance', '2023-02-18 16:07:53', NULL),
(1327, 19704, 10.00, 'pri', 'balance', '2023-02-18 16:08:03', NULL),
(1328, 19754, 10.00, 'reginaldo', 'balance', '2023-02-18 16:08:04', NULL),
(1329, 19760, 10.00, 'pri', 'balance', '2023-02-18 16:08:32', NULL),
(1330, 7378, 10.00, 'pri', 'balance', '2023-02-18 16:08:34', NULL),
(1331, 19746, 10.00, 'pri', 'balance', '2023-02-18 16:08:36', NULL),
(1332, 8064, 10.00, 'pri', 'balance', '2023-02-18 16:08:37', NULL),
(1333, 19743, 10.00, 'pri', 'balance', '2023-02-18 16:09:28', NULL),
(1334, 19721, 10.00, 'pri', 'balance', '2023-02-18 16:10:37', NULL),
(1335, 19757, 10.00, 'pri', 'balance', '2023-02-18 16:10:47', NULL),
(1336, 19767, 10.00, 'pri', 'balance', '2023-02-18 16:11:20', NULL),
(1337, 19766, 10.00, 'pri', 'balance', '2023-02-18 16:11:20', NULL),
(1338, 19768, 10.00, 'pri', 'balance', '2023-02-18 16:11:29', NULL),
(1339, 12403, 10.00, 'pri', 'balance', '2023-02-18 16:11:33', NULL),
(1340, 19771, 10.00, 'pri', 'balance', '2023-02-18 16:11:40', NULL),
(1341, 19640, 10.00, 'pri', 'balance', '2023-02-18 16:11:42', NULL),
(1342, 19765, 10.00, 'pri', 'balance', '2023-02-18 16:11:43', NULL),
(1343, 19774, 10.00, 'pri', 'balance', '2023-02-18 16:12:06', NULL),
(1344, 19773, 10.00, 'pri', 'balance', '2023-02-18 16:12:20', NULL),
(1345, 11222, 10.00, 'reginaldo', 'balance', '2023-02-18 16:12:29', NULL),
(1346, 19775, 10.00, 'pri', 'balance', '2023-02-18 16:12:30', NULL),
(1347, 19776, 10.00, 'pri', 'balance', '2023-02-18 16:12:37', NULL),
(1348, 13108, 10.00, 'pri', 'balance', '2023-02-18 16:13:09', NULL),
(1349, 12041, 10.00, 'pri', 'balance', '2023-02-18 16:13:42', NULL),
(1350, 5909, 10.00, 'reginaldo', 'balance', '2023-02-18 16:13:59', NULL),
(1351, 19782, 10.00, 'pri', 'balance', '2023-02-18 16:14:00', NULL),
(1352, 19777, 10.00, 'pri', 'balance', '2023-02-18 16:14:13', NULL),
(1353, 19781, 10.00, 'pri', 'balance', '2023-02-18 16:15:04', NULL),
(1354, 19787, 10.00, 'pri', 'balance', '2023-02-18 16:17:38', NULL),
(1355, 17082, 10.00, 'pri', 'balance', '2023-02-18 16:18:09', NULL),
(1356, 19789, 10.00, 'pri', 'balance', '2023-02-18 16:18:32', NULL),
(1357, 11222, 10.00, 'pri', 'balance', '2023-02-18 16:18:58', NULL),
(1358, 18623, 10.00, 'reginaldo', 'balance', '2023-02-18 16:20:49', NULL),
(1359, 11574, 10.00, 'pri', 'balance', '2023-02-18 16:21:09', NULL),
(1360, 11518, 10.00, 'pri', 'balance', '2023-02-18 16:21:17', NULL),
(1361, 11027, 10.00, 'pri', 'balance', '2023-02-18 16:21:40', NULL),
(1362, 6598, 10.00, 'pri', 'balance', '2023-02-18 16:22:41', NULL),
(1363, 19806, 10.00, 'pri', 'balance', '2023-02-18 16:23:21', NULL),
(1364, 19808, 10.00, 'pri', 'balance', '2023-02-18 16:24:05', NULL),
(1365, 19813, 10.00, 'pri', 'balance', '2023-02-18 16:25:11', NULL),
(1366, 6919, 10.00, 'reginaldo', 'balance', '2023-02-18 16:26:11', NULL),
(1367, 19033, 10.00, 'pri', 'balance', '2023-02-18 16:26:12', NULL),
(1368, 18260, 10.00, 'pri', 'balance', '2023-02-18 16:26:33', NULL),
(1369, 8093, 10.00, 'pri', 'balance', '2023-02-18 16:26:45', NULL),
(1370, 19820, 10.00, 'pri', 'balance', '2023-02-18 16:27:19', NULL),
(1371, 19819, 10.00, 'pri', 'balance', '2023-02-18 16:27:31', NULL),
(1372, 19825, 10.00, 'pri', 'balance', '2023-02-18 16:27:50', NULL),
(1373, 19829, 10.00, 'pri', 'balance', '2023-02-18 16:28:05', NULL),
(1374, 19832, 10.00, 'pri', 'balance', '2023-02-18 16:28:21', NULL),
(1375, 19831, 10.00, 'pri', 'balance', '2023-02-18 16:28:23', NULL),
(1376, 10392, 10.00, 'reginaldo', 'balance', '2023-02-18 16:28:41', NULL),
(1377, 13801, 10.00, 'reginaldo', 'balance', '2023-02-18 16:28:42', NULL),
(1378, 19834, 10.00, 'pri', 'balance', '2023-02-18 16:28:44', NULL),
(1379, 19830, 10.00, 'pri', 'balance', '2023-02-18 16:29:32', NULL),
(1380, 19838, 10.00, 'pri', 'balance', '2023-02-18 16:29:38', NULL),
(1381, 19840, 10.00, 'pri', 'balance', '2023-02-18 16:29:41', NULL),
(1382, 19824, 10.00, 'pri', 'balance', '2023-02-18 16:29:42', NULL),
(1383, 19839, 10.00, 'pri', 'balance', '2023-02-18 16:30:01', NULL),
(1384, 19844, 10.00, 'pri', 'balance', '2023-02-18 16:30:13', NULL),
(1385, 10392, 10.00, 'pri', 'balance', '2023-02-18 16:30:15', NULL),
(1386, 19837, 10.00, 'pri', 'balance', '2023-02-18 16:30:38', NULL),
(1387, 14844, 10.00, 'pri', 'balance', '2023-02-18 16:30:57', NULL),
(1388, 9704, 10.00, 'pri', 'balance', '2023-02-18 16:30:57', NULL),
(1389, 19846, 10.00, 'pri', 'balance', '2023-02-18 16:30:59', NULL),
(1390, 11684, 10.00, 'pri', 'balance', '2023-02-18 16:31:29', NULL),
(1391, 19826, 10.00, 'pri', 'balance', '2023-02-18 16:31:40', NULL),
(1392, 19823, 10.00, 'pri', 'balance', '2023-02-18 16:31:51', NULL),
(1393, 3291, 10.00, 'reginaldo', 'balance', '2023-02-18 16:32:27', NULL),
(1394, 19853, 10.00, 'pri', 'balance', '2023-02-18 16:32:40', NULL),
(1395, 19852, 10.00, 'reginaldo', 'balance', '2023-02-18 16:33:01', NULL),
(1396, 19852, 10.00, 'pri', 'balance', '2023-02-18 16:33:08', NULL),
(1397, 12386, 10.00, 'pri', 'balance', '2023-02-18 16:33:29', NULL),
(1398, 19857, 10.00, 'pri', 'balance', '2023-02-18 16:33:29', NULL),
(1399, 8853, 10.00, 'pri', 'balance', '2023-02-18 16:34:02', NULL),
(1400, 5909, 10.00, 'pri', 'balance', '2023-02-18 16:34:17', NULL),
(1401, 19860, 10.00, 'pri', 'balance', '2023-02-18 16:34:58', NULL),
(1402, 19847, 10.00, 'pri', 'balance', '2023-02-18 16:35:00', NULL),
(1403, 19855, 10.00, 'reginaldo', 'balance', '2023-02-18 16:35:04', NULL),
(1404, 18623, 10.00, 'pri', 'balance', '2023-02-18 16:35:11', NULL),
(1405, 11608, 10.00, 'pri', 'balance', '2023-02-18 16:35:16', NULL),
(1406, 12172, 10.00, 'pri', 'balance', '2023-02-18 16:35:34', NULL),
(1407, 19866, 10.00, 'pri', 'balance', '2023-02-18 16:36:28', NULL),
(1408, 14341, 10.00, 'pri', 'balance', '2023-02-18 16:36:38', NULL),
(1409, 19868, 10.00, 'pri', 'balance', '2023-02-18 16:36:53', NULL),
(1410, 19861, 10.00, 'pri', 'balance', '2023-02-18 16:36:58', NULL),
(1411, 19870, 10.00, 'pri', 'balance', '2023-02-18 16:37:34', NULL),
(1412, 19864, 10.00, 'pri', 'balance', '2023-02-18 16:37:35', NULL),
(1413, 19872, 10.00, 'pri', 'balance', '2023-02-18 16:37:51', NULL),
(1414, 7631, 10.00, 'reginaldo', 'balance', '2023-02-18 16:37:52', NULL),
(1415, 19873, 10.00, 'pri', 'balance', '2023-02-18 16:37:55', NULL),
(1416, 12958, 10.00, 'pri', 'balance', '2023-02-18 16:38:30', NULL),
(1417, 5582, 10.00, 'pri', 'balance', '2023-02-18 16:38:44', NULL),
(1418, 19869, 10.00, 'pri', 'balance', '2023-02-18 16:38:49', NULL),
(1419, 19877, 10.00, 'pri', 'balance', '2023-02-18 16:38:50', NULL),
(1420, 19875, 10.00, 'pri', 'balance', '2023-02-18 16:38:53', NULL),
(1421, 11733, 10.00, 'pri', 'balance', '2023-02-18 16:38:56', NULL),
(1422, 19880, 10.00, 'pri', 'balance', '2023-02-18 16:39:16', NULL),
(1423, 19884, 10.00, 'pri', 'balance', '2023-02-18 16:39:33', NULL),
(1424, 12135, 10.00, 'pri', 'balance', '2023-02-18 16:39:39', NULL),
(1425, 19885, 10.00, 'pri', 'balance', '2023-02-18 16:39:44', NULL),
(1426, 19828, 10.00, 'pri', 'balance', '2023-02-18 16:40:08', NULL),
(1427, 19887, 10.00, 'pri', 'balance', '2023-02-18 16:40:46', NULL),
(1428, 19891, 10.00, 'pri', 'balance', '2023-02-18 16:41:22', NULL),
(1429, 19893, 10.00, 'pri', 'balance', '2023-02-18 16:41:25', NULL),
(1430, 11727, 10.00, 'pri', 'balance', '2023-02-18 16:41:34', NULL),
(1431, 19858, 10.00, 'pri', 'balance', '2023-02-18 16:43:54', NULL),
(1432, 6294, 10.00, 'pri', 'balance', '2023-02-18 16:44:03', NULL),
(1433, 19898, 10.00, 'pri', 'balance', '2023-02-18 16:44:03', NULL),
(1434, 10839, 10.00, 'pri', 'balance', '2023-02-18 16:44:12', NULL),
(1435, 19899, 10.00, 'pri', 'balance', '2023-02-18 16:44:53', NULL),
(1436, 3491, 10.00, 'pri', 'balance', '2023-02-18 16:45:11', NULL),
(1437, 19900, 10.00, 'pri', 'balance', '2023-02-18 16:45:16', NULL),
(1438, 18414, 10.00, 'pri', 'balance', '2023-02-18 16:45:21', NULL),
(1439, 19903, 10.00, 'pri', 'balance', '2023-02-18 16:45:37', NULL),
(1440, 18101, 10.00, 'pri', 'balance', '2023-02-18 16:45:38', NULL),
(1441, 12847, 10.00, 'pri', 'balance', '2023-02-18 16:45:40', NULL),
(1442, 19901, 10.00, 'pri', 'balance', '2023-02-18 16:46:31', NULL),
(1443, 19909, 10.00, 'pri', 'balance', '2023-02-18 16:46:43', NULL),
(1444, 19865, 10.00, 'pri', 'balance', '2023-02-18 16:46:54', NULL),
(1445, 19912, 10.00, 'reginaldo', 'balance', '2023-02-18 16:47:11', NULL),
(1446, 19911, 10.00, 'pri', 'balance', '2023-02-18 16:47:13', NULL),
(1447, 19908, 10.00, 'pri', 'balance', '2023-02-18 16:47:15', NULL),
(1448, 3737, 10.00, 'pri', 'balance', '2023-02-18 16:49:13', NULL),
(1449, 19897, 10.00, 'reginaldo', 'balance', '2023-02-18 16:50:23', NULL),
(1450, 4103, 10.00, 'pri', 'balance', '2023-02-18 16:50:26', NULL),
(1451, 13355, 10.00, 'reginaldo', 'balance', '2023-02-18 16:51:07', NULL),
(1452, 9998, 10.00, 'pri', 'balance', '2023-02-18 16:51:09', NULL),
(1453, 12936, 10.00, 'pri', 'balance', '2023-02-18 16:51:41', NULL),
(1454, 19919, 10.00, 'pri', 'balance', '2023-02-18 16:51:59', NULL),
(1455, 19920, 10.00, 'pri', 'balance', '2023-02-18 16:52:08', NULL),
(1456, 19910, 10.00, 'reginaldo', 'balance', '2023-02-18 16:52:22', NULL),
(1457, 7525, 10.00, 'pri', 'balance', '2023-02-18 16:53:26', NULL),
(1458, 19652, 10.00, 'pri', 'balance', '2023-02-18 16:53:30', NULL),
(1459, 18148, 10.00, 'pri', 'balance', '2023-02-18 16:54:08', NULL),
(1460, 19929, 10.00, 'reginaldo', 'balance', '2023-02-18 16:54:14', NULL),
(1461, 12618, 10.00, 'pri', 'balance', '2023-02-18 16:54:15', NULL),
(1462, 19815, 10.00, 'pri', 'balance', '2023-02-18 16:54:16', NULL),
(1463, 14104, 10.00, 'pri', 'balance', '2023-02-18 16:54:17', NULL),
(1464, 10851, 10.00, 'pri', 'balance', '2023-02-18 16:54:40', NULL),
(1465, 19935, 10.00, 'pri', 'balance', '2023-02-18 16:55:04', NULL),
(1466, 18007, 10.00, 'pri', 'balance', '2023-02-18 16:55:07', NULL),
(1467, 11367, 10.00, 'pri', 'balance', '2023-02-18 16:56:09', NULL),
(1468, 19931, 10.00, 'pri', 'balance', '2023-02-18 16:56:14', NULL),
(1469, 19934, 10.00, 'pri', 'balance', '2023-02-18 16:56:43', NULL),
(1470, 10549, 10.00, 'pri', 'balance', '2023-02-18 16:57:44', NULL),
(1471, 10381, 10.00, 'pri', 'balance', '2023-02-18 16:57:56', NULL),
(1472, 12008, 10.00, 'pri', 'balance', '2023-02-18 16:58:12', NULL),
(1473, 19940, 10.00, 'pri', 'balance', '2023-02-18 16:58:12', NULL),
(1474, 11759, 10.00, 'pri', 'balance', '2023-02-18 16:58:46', NULL),
(1475, 17967, 10.00, 'pri', 'balance', '2023-02-18 16:59:10', NULL),
(1476, 19936, 10.00, 'pri', 'balance', '2023-02-18 16:59:15', NULL),
(1477, 4038, 10.00, 'reginaldo', 'balance', '2023-02-18 16:59:31', NULL),
(1478, 19953, 10.00, 'pri', 'balance', '2023-02-18 17:00:36', NULL),
(1479, 5199, 10.00, 'reginaldo', 'balance', '2023-02-18 17:00:55', NULL),
(1480, 11681, 10.00, 'pri', 'balance', '2023-02-18 17:00:56', NULL),
(1481, 19951, 10.00, 'pri', 'balance', '2023-02-18 17:01:01', NULL),
(1482, 19942, 10.00, 'pri', 'balance', '2023-02-18 17:01:09', NULL),
(1483, 19955, 10.00, 'pri', 'balance', '2023-02-18 17:01:15', NULL),
(1484, 5259, 10.00, 'pri', 'balance', '2023-02-18 17:01:25', NULL),
(1485, 19952, 10.00, 'pri', 'balance', '2023-02-18 17:01:51', NULL),
(1486, 19892, 10.00, 'pri', 'balance', '2023-02-18 17:02:06', NULL),
(1487, 19962, 10.00, 'pri', 'balance', '2023-02-18 17:03:17', NULL),
(1488, 14303, 10.00, 'reginaldo', 'balance', '2023-02-18 17:03:36', NULL),
(1489, 3994, 10.00, 'pri', 'balance', '2023-02-18 17:03:47', NULL),
(1490, 19964, 10.00, 'pri', 'balance', '2023-02-18 17:03:56', NULL),
(1491, 19947, 10.00, 'pri', 'balance', '2023-02-18 17:03:58', NULL),
(1492, 19966, 10.00, 'reginaldo', 'balance', '2023-02-18 17:04:30', NULL),
(1493, 19963, 10.00, 'pri', 'balance', '2023-02-18 17:04:43', NULL);
INSERT INTO `promo_log` (`id`, `user_id`, `sum`, `code`, `type`, `created_at`, `updated_at`) VALUES
(1494, 19966, 10.00, 'pri', 'balance', '2023-02-18 17:04:44', NULL),
(1495, 19954, 10.00, 'pri', 'balance', '2023-02-18 17:04:56', NULL),
(1496, 14115, 10.00, 'pri', 'balance', '2023-02-18 17:05:15', NULL),
(1497, 19924, 10.00, 'pri', 'balance', '2023-02-18 17:05:17', NULL),
(1498, 6312, 10.00, 'reginaldo', 'balance', '2023-02-18 17:05:17', NULL),
(1499, 19971, 10.00, 'pri', 'balance', '2023-02-18 17:05:20', NULL),
(1500, 11036, 10.00, 'pri', 'balance', '2023-02-18 17:06:24', NULL),
(1501, 14046, 10.00, 'pri', 'balance', '2023-02-18 17:06:42', NULL),
(1502, 19851, 10.00, 'reginaldo', 'balance', '2023-02-18 17:07:25', NULL),
(1503, 19965, 10.00, 'pri', 'balance', '2023-02-18 17:07:47', NULL),
(1504, 14232, 10.00, 'pri', 'balance', '2023-02-18 17:08:10', NULL),
(1505, 19970, 10.00, 'pri', 'balance', '2023-02-18 17:08:13', NULL),
(1506, 19397, 10.00, 'pri', 'balance', '2023-02-18 17:08:19', NULL),
(1507, 12946, 10.00, 'pri', 'balance', '2023-02-18 17:08:23', NULL),
(1508, 19851, 10.00, 'pri', 'balance', '2023-02-18 17:08:40', NULL),
(1509, 18686, 10.00, 'reginaldo', 'balance', '2023-02-18 17:10:09', NULL),
(1510, 19845, 10.00, 'pri', 'balance', '2023-02-18 17:10:15', NULL),
(1511, 19982, 10.00, 'reginaldo', 'balance', '2023-02-18 17:10:24', NULL),
(1512, 6057, 10.00, 'reginaldo', 'balance', '2023-02-18 17:10:52', NULL),
(1513, 13598, 10.00, 'reginaldo', 'balance', '2023-02-18 17:10:53', NULL),
(1514, 19983, 10.00, 'pri', 'balance', '2023-02-18 17:11:09', NULL),
(1515, 19975, 10.00, 'pri', 'balance', '2023-02-18 17:11:11', NULL),
(1516, 15373, 10.00, 'pri', 'balance', '2023-02-18 17:11:22', NULL),
(1517, 19972, 10.00, 'pri', 'balance', '2023-02-18 17:11:30', NULL),
(1518, 10554, 10.00, 'pri', 'balance', '2023-02-18 17:11:44', NULL),
(1519, 8941, 10.00, 'reginaldo', 'balance', '2023-02-18 17:11:54', NULL),
(1520, 6037, 10.00, 'pri', 'balance', '2023-02-18 17:13:11', NULL),
(1521, 19993, 10.00, 'pri', 'balance', '2023-02-18 17:13:19', NULL),
(1522, 18773, 10.00, 'pri', 'balance', '2023-02-18 17:13:24', NULL),
(1523, 6280, 10.00, 'pri', 'balance', '2023-02-18 17:13:24', NULL),
(1524, 19188, 10.00, 'pri', 'balance', '2023-02-18 17:13:42', NULL),
(1525, 19994, 10.00, 'reginaldo', 'balance', '2023-02-18 17:13:44', NULL),
(1526, 19994, 10.00, 'pri', 'balance', '2023-02-18 17:13:51', NULL),
(1527, 19876, 10.00, 'pri', 'balance', '2023-02-18 17:14:00', NULL),
(1528, 19988, 10.00, 'pri', 'balance', '2023-02-18 17:14:19', NULL),
(1529, 12698, 10.00, 'reginaldo', 'balance', '2023-02-18 17:14:34', NULL),
(1530, 18168, 10.00, 'pri', 'balance', '2023-02-18 17:14:41', NULL),
(1531, 19999, 10.00, 'reginaldo', 'balance', '2023-02-18 17:14:54', NULL),
(1532, 19981, 10.00, 'pri', 'balance', '2023-02-18 17:17:12', NULL),
(1533, 20144, 10.00, 'reginaldo', 'balance', '2023-02-23 19:31:54', NULL),
(1534, 20153, 10.00, 'reginaldo', 'balance', '2023-02-23 19:37:10', NULL),
(1535, 20154, 10.00, 'reginaldo', 'balance', '2023-02-23 19:40:49', NULL),
(1536, 20162, 10.00, 'reginaldo', 'balance', '2023-02-23 19:52:16', NULL),
(1537, 17352, 10.00, 'reginaldo', 'balance', '2023-02-23 19:57:17', NULL),
(1538, 20179, 10.00, 'reginaldo', 'balance', '2023-02-23 20:02:54', NULL),
(1539, 20181, 10.00, 'reginaldo', 'balance', '2023-02-23 20:06:30', NULL),
(1540, 20184, 10.00, 'reginaldo', 'balance', '2023-02-23 20:09:03', NULL),
(1541, 20191, 10.00, 'reginaldo', 'balance', '2023-02-23 20:12:15', NULL),
(1542, 20197, 10.00, 'reginaldo', 'balance', '2023-02-23 20:13:48', NULL),
(1543, 20199, 10.00, 'reginaldo', 'balance', '2023-02-23 20:15:28', NULL),
(1544, 8388, 10.00, 'pri', 'balance', '2023-02-23 20:18:37', NULL),
(1545, 20209, 10.00, 'reginaldo', 'balance', '2023-02-23 20:20:50', NULL),
(1546, 20218, 10.00, 'reginaldo', 'balance', '2023-02-23 20:27:38', NULL),
(1547, 20224, 10.00, 'reginaldo', 'balance', '2023-02-23 20:34:19', NULL),
(1548, 20226, 10.00, 'reginaldo', 'balance', '2023-02-23 20:36:18', NULL),
(1549, 20231, 10.00, 'reginaldo', 'balance', '2023-02-23 20:37:54', NULL),
(1550, 20233, 10.00, 'reginaldo', 'balance', '2023-02-23 20:41:44', NULL),
(1551, 20235, 10.00, 'reginaldo', 'balance', '2023-02-23 20:43:36', NULL),
(1552, 20240, 10.00, 'reginaldo', 'balance', '2023-02-23 20:47:36', NULL),
(1553, 20242, 10.00, 'reginaldo', 'balance', '2023-02-23 20:50:05', NULL),
(1554, 20244, 10.00, 'reginaldo', 'balance', '2023-02-23 20:51:59', NULL),
(1555, 20247, 10.00, 'reginaldo', 'balance', '2023-02-23 20:53:32', NULL),
(1556, 20249, 10.00, 'reginaldo', 'balance', '2023-02-23 20:56:37', NULL),
(1557, 20251, 10.00, 'reginaldo', 'balance', '2023-02-23 20:59:01', NULL),
(1558, 20252, 10.00, 'reginaldo', 'balance', '2023-02-23 21:00:28', NULL),
(1559, 20254, 10.00, 'reginaldo', 'balance', '2023-02-23 21:01:27', NULL),
(1560, 20266, 10.00, 'reginaldo', 'balance', '2023-02-23 21:11:59', NULL),
(1561, 20269, 10.00, 'reginaldo', 'balance', '2023-02-23 21:14:19', NULL),
(1562, 20272, 10.00, 'reginaldo', 'balance', '2023-02-23 21:18:35', NULL),
(1563, 4623, 1000.00, 'nathan', 'balance', '2023-02-23 21:31:49', NULL),
(1564, 8622, 10.00, 'reginaldo', 'balance', '2023-02-23 21:58:19', NULL),
(1565, 20477, 10.00, 'reginaldo', 'balance', '2023-02-23 22:36:56', NULL),
(1566, 20511, 10.00, 'reginaldo', 'balance', '2023-02-23 22:53:00', NULL),
(1567, 20662, 10.00, 'reginaldo', 'balance', '2023-02-24 00:49:17', NULL),
(1568, 20665, 10.00, 'reginaldo', 'balance', '2023-02-24 00:51:51', NULL),
(1569, 20667, 10.00, 'reginaldo', 'balance', '2023-02-24 00:53:05', NULL),
(1570, 20669, 10.00, 'reginaldo', 'balance', '2023-02-24 00:55:07', NULL),
(1571, 20677, 10.00, 'reginaldo', 'balance', '2023-02-24 01:00:09', NULL),
(1572, 20678, 10.00, 'reginaldo', 'balance', '2023-02-24 01:01:35', NULL),
(1573, 5219, 10.00, 'pri', 'balance', '2023-02-24 02:34:04', NULL),
(1574, 20788, 10.00, 'pri', 'balance', '2023-02-24 02:37:03', NULL),
(1575, 17610, 10.00, 'pri', 'balance', '2023-02-24 02:37:49', NULL),
(1576, 16007, 10.00, 'reginaldo', 'balance', '2023-02-24 02:54:59', NULL),
(1577, 20964, 10.00, 'reginaldo', 'balance', '2023-02-24 12:20:04', NULL),
(1578, 19912, 10.00, 'pri', 'balance', '2023-02-24 12:31:02', NULL),
(1579, 18356, 10.00, 'reginaldo', 'balance', '2023-02-24 15:21:30', NULL),
(1580, 6519, 10.00, 'reginaldo', 'balance', '2023-02-24 15:27:12', NULL),
(1581, 21082, 10.00, 'reginaldo', 'balance', '2023-02-24 15:35:12', NULL),
(1582, 21182, 10.00, 'reginaldo', 'balance', '2023-02-24 19:04:18', NULL),
(1583, 21200, 10.00, 'reginaldo', 'balance', '2023-02-24 19:38:40', NULL),
(1584, 3481, 10.00, 'reginaldo', 'balance', '2023-02-24 22:15:20', NULL),
(1585, 4061, 10.00, 'reginaldo', 'balance', '2023-02-24 22:17:19', NULL),
(1586, 21274, 20.00, 'pedro', 'balance', '2023-02-24 22:21:03', NULL),
(1587, 17433, 20.00, 'pedro', 'balance', '2023-02-24 22:21:07', NULL),
(1588, 15474, 20.00, 'pedro', 'balance', '2023-02-24 22:21:34', NULL),
(1589, 18382, 20.00, 'pedro', 'balance', '2023-02-24 22:21:45', NULL),
(1590, 15233, 20.00, 'pedro', 'balance', '2023-02-24 22:21:50', NULL),
(1591, 21279, 20.00, 'pedro', 'balance', '2023-02-24 22:22:16', NULL),
(1592, 21278, 20.00, 'pedro', 'balance', '2023-02-24 22:22:19', NULL),
(1593, 21199, 20.00, 'pedro', 'balance', '2023-02-24 22:22:55', NULL),
(1594, 21282, 20.00, 'pedro', 'balance', '2023-02-24 22:23:05', NULL),
(1595, 21283, 20.00, 'pedro', 'balance', '2023-02-24 22:23:15', NULL),
(1596, 21287, 20.00, 'pedro', 'balance', '2023-02-24 22:23:20', NULL),
(1597, 21268, 20.00, 'pedro', 'balance', '2023-02-24 22:23:48', NULL),
(1598, 21296, 20.00, 'pedro', 'balance', '2023-02-24 22:23:48', NULL),
(1599, 21293, 20.00, 'pedro', 'balance', '2023-02-24 22:23:55', NULL),
(1600, 4521, 20.00, 'pedro', 'balance', '2023-02-24 22:24:18', NULL),
(1601, 21294, 20.00, 'pedro', 'balance', '2023-02-24 22:24:23', NULL),
(1602, 21281, 20.00, 'pedro', 'balance', '2023-02-24 22:24:26', NULL),
(1603, 21198, 20.00, 'pedro', 'balance', '2023-02-24 22:24:30', NULL),
(1604, 4551, 20.00, 'pedro', 'balance', '2023-02-24 22:24:54', NULL),
(1605, 21303, 20.00, 'pedro', 'balance', '2023-02-24 22:25:09', NULL),
(1606, 21305, 20.00, 'pedro', 'balance', '2023-02-24 22:25:11', NULL),
(1607, 21306, 20.00, 'pedro', 'balance', '2023-02-24 22:25:12', NULL),
(1608, 21302, 20.00, 'pedro', 'balance', '2023-02-24 22:25:16', NULL),
(1609, 4562, 20.00, 'pedro', 'balance', '2023-02-24 22:25:16', NULL),
(1610, 21310, 20.00, 'pedro', 'balance', '2023-02-24 22:25:32', NULL),
(1611, 17043, 20.00, 'pedro', 'balance', '2023-02-24 22:25:52', NULL),
(1612, 21308, 20.00, 'pedro', 'balance', '2023-02-24 22:26:06', NULL),
(1613, 19858, 20.00, 'pedro', 'balance', '2023-02-24 22:26:06', NULL),
(1614, 21240, 20.00, 'pedro', 'balance', '2023-02-24 22:26:19', NULL),
(1615, 3250, 20.00, 'pedro', 'balance', '2023-02-24 22:26:26', NULL),
(1616, 21312, 20.00, 'pedro', 'balance', '2023-02-24 22:26:27', NULL),
(1617, 17629, 20.00, 'pedro', 'balance', '2023-02-24 22:26:30', NULL),
(1618, 21319, 20.00, 'pedro', 'balance', '2023-02-24 22:26:43', NULL),
(1619, 21328, 20.00, 'pedro', 'balance', '2023-02-24 22:27:10', NULL),
(1620, 21332, 20.00, 'pedro', 'balance', '2023-02-24 22:27:30', NULL),
(1621, 21333, 20.00, 'pedro', 'balance', '2023-02-24 22:28:03', NULL),
(1622, 15418, 20.00, 'pedro', 'balance', '2023-02-24 22:28:11', NULL),
(1623, 4577, 20.00, 'pedro', 'balance', '2023-02-24 22:28:28', NULL),
(1624, 15226, 20.00, 'pedro', 'balance', '2023-02-24 22:28:31', NULL),
(1625, 3749, 20.00, 'pedro', 'balance', '2023-02-24 22:28:32', NULL),
(1626, 21342, 20.00, 'pedro', 'balance', '2023-02-24 22:28:43', NULL),
(1627, 15294, 20.00, 'pedro', 'balance', '2023-02-24 22:28:49', NULL),
(1628, 12508, 20.00, 'pedro', 'balance', '2023-02-24 22:28:53', NULL),
(1629, 21320, 20.00, 'pedro', 'balance', '2023-02-24 22:28:54', NULL),
(1630, 21347, 20.00, 'pedro', 'balance', '2023-02-24 22:28:57', NULL),
(1631, 21341, 20.00, 'pedro', 'balance', '2023-02-24 22:29:01', NULL),
(1632, 21349, 20.00, 'pedro', 'balance', '2023-02-24 22:29:18', NULL),
(1633, 21330, 20.00, 'pedro', 'balance', '2023-02-24 22:29:26', NULL),
(1634, 21337, 20.00, 'pedro', 'balance', '2023-02-24 22:29:27', NULL),
(1635, 21345, 20.00, 'pedro', 'balance', '2023-02-24 22:29:33', NULL),
(1636, 21356, 20.00, 'pedro', 'balance', '2023-02-24 22:30:06', NULL),
(1637, 15278, 20.00, 'pedro', 'balance', '2023-02-24 22:30:06', NULL),
(1638, 18379, 20.00, 'pedro', 'balance', '2023-02-24 22:30:13', NULL),
(1639, 21354, 20.00, 'pedro', 'balance', '2023-02-24 22:30:16', NULL),
(1640, 15300, 20.00, 'pedro', 'balance', '2023-02-24 22:30:47', NULL),
(1641, 21358, 20.00, 'pedro', 'balance', '2023-02-24 22:30:52', NULL),
(1642, 18433, 20.00, 'pedro', 'balance', '2023-02-24 22:30:52', NULL),
(1643, 20098, 20.00, 'pedro', 'balance', '2023-02-24 22:32:03', NULL),
(1644, 21364, 20.00, 'pedro', 'balance', '2023-02-24 22:32:06', NULL),
(1645, 21321, 20.00, 'pedro', 'balance', '2023-02-24 22:32:08', NULL),
(1646, 21336, 20.00, 'pedro', 'balance', '2023-02-24 22:32:12', NULL),
(1647, 20857, 20.00, 'pedro', 'balance', '2023-02-24 22:32:22', NULL),
(1648, 2290, 20.00, 'pedro', 'balance', '2023-02-24 22:32:39', NULL),
(1649, 19668, 20.00, 'pedro', 'balance', '2023-02-24 22:32:45', NULL),
(1650, 21289, 20.00, 'pedro', 'balance', '2023-02-24 22:32:55', NULL),
(1651, 21365, 20.00, 'pedro', 'balance', '2023-02-24 22:33:00', NULL),
(1652, 11094, 10.00, 'reginaldo', 'balance', '2023-02-24 22:33:07', NULL),
(1653, 21326, 20.00, 'pedro', 'balance', '2023-02-24 22:33:07', NULL),
(1654, 21367, 20.00, 'pedro', 'balance', '2023-02-24 22:33:19', NULL),
(1655, 21373, 20.00, 'pedro', 'balance', '2023-02-24 22:33:25', NULL),
(1656, 21378, 20.00, 'pedro', 'balance', '2023-02-24 22:34:05', NULL),
(1657, 21382, 20.00, 'pedro', 'balance', '2023-02-24 22:34:14', NULL),
(1658, 20263, 20.00, 'pedro', 'balance', '2023-02-24 22:34:36', NULL),
(1659, 21374, 20.00, 'pedro', 'balance', '2023-02-24 22:35:19', NULL),
(1660, 21394, 20.00, 'pedro', 'balance', '2023-02-24 22:35:52', NULL),
(1661, 21398, 20.00, 'pedro', 'balance', '2023-02-24 22:36:04', NULL),
(1662, 21400, 20.00, 'pedro', 'balance', '2023-02-24 22:36:21', NULL),
(1663, 21399, 20.00, 'pedro', 'balance', '2023-02-24 22:36:22', NULL),
(1664, 21334, 20.00, 'pedro', 'balance', '2023-02-24 22:36:30', NULL),
(1665, 21313, 20.00, 'pedro', 'balance', '2023-02-24 22:36:37', NULL),
(1666, 4570, 20.00, 'pedro', 'balance', '2023-02-24 22:37:56', NULL),
(1667, 21410, 10.00, 'reginaldo', 'balance', '2023-02-24 22:38:09', NULL),
(1668, 21410, 10.00, 'pri', 'balance', '2023-02-24 22:38:15', NULL),
(1669, 21408, 20.00, 'pedro', 'balance', '2023-02-24 22:38:16', NULL),
(1670, 21409, 20.00, 'pedro', 'balance', '2023-02-24 22:38:21', NULL),
(1671, 21413, 20.00, 'pedro', 'balance', '2023-02-24 22:38:43', NULL),
(1672, 21411, 20.00, 'pedro', 'balance', '2023-02-24 22:38:48', NULL),
(1673, 21414, 20.00, 'pedro', 'balance', '2023-02-24 22:39:15', NULL),
(1674, 21415, 20.00, 'pedro', 'balance', '2023-02-24 22:39:23', NULL),
(1675, 21412, 20.00, 'pedro', 'balance', '2023-02-24 22:39:31', NULL),
(1676, 21419, 20.00, 'pedro', 'balance', '2023-02-24 22:39:51', NULL),
(1677, 21391, 20.00, 'pedro', 'balance', '2023-02-24 22:40:30', NULL),
(1678, 21422, 20.00, 'pedro', 'balance', '2023-02-24 22:41:09', NULL),
(1679, 10221, 20.00, 'pedro', 'balance', '2023-02-24 22:41:09', NULL),
(1680, 21431, 20.00, 'pedro', 'balance', '2023-02-24 22:41:23', NULL),
(1681, 15984, 20.00, 'pedro', 'balance', '2023-02-24 22:41:40', NULL),
(1682, 21429, 20.00, 'pedro', 'balance', '2023-02-24 22:41:55', NULL),
(1683, 21428, 20.00, 'pedro', 'balance', '2023-02-24 22:42:03', NULL),
(1684, 21424, 20.00, 'pedro', 'balance', '2023-02-24 22:42:04', NULL),
(1685, 21435, 20.00, 'pedro', 'balance', '2023-02-24 22:42:41', NULL),
(1686, 21432, 20.00, 'pedro', 'balance', '2023-02-24 22:42:46', NULL),
(1687, 21366, 20.00, 'pedro', 'balance', '2023-02-24 22:42:47', NULL),
(1688, 21434, 20.00, 'pedro', 'balance', '2023-02-24 22:42:49', NULL),
(1689, 9760, 20.00, 'pedro', 'balance', '2023-02-24 22:43:28', NULL),
(1690, 21441, 20.00, 'pedro', 'balance', '2023-02-24 22:43:48', NULL),
(1691, 19136, 20.00, 'pedro', 'balance', '2023-02-24 22:43:51', NULL),
(1692, 21443, 20.00, 'pedro', 'balance', '2023-02-24 22:43:56', NULL),
(1693, 21440, 20.00, 'pedro', 'balance', '2023-02-24 22:44:08', NULL),
(1694, 21439, 20.00, 'pedro', 'balance', '2023-02-24 22:44:12', NULL),
(1695, 21417, 20.00, 'pedro', 'balance', '2023-02-24 22:44:58', NULL),
(1696, 21446, 20.00, 'pedro', 'balance', '2023-02-24 22:45:33', NULL),
(1697, 18765, 20.00, 'pedro', 'balance', '2023-02-24 22:45:43', NULL),
(1698, 21447, 20.00, 'pedro', 'balance', '2023-02-24 22:46:14', NULL),
(1699, 21442, 20.00, 'pedro', 'balance', '2023-02-24 22:47:34', NULL),
(1700, 21451, 20.00, 'pedro', 'balance', '2023-02-24 22:47:35', NULL),
(1701, 21461, 20.00, 'pedro', 'balance', '2023-02-24 22:49:16', NULL),
(1702, 21460, 20.00, 'pedro', 'balance', '2023-02-24 22:49:17', NULL),
(1703, 21420, 20.00, 'pedro', 'balance', '2023-02-24 22:49:21', NULL),
(1704, 21457, 20.00, 'pedro', 'balance', '2023-02-24 22:49:27', NULL),
(1705, 21466, 10.00, 'reginaldo', 'balance', '2023-02-24 22:49:48', NULL),
(1706, 21369, 20.00, 'pedro', 'balance', '2023-02-24 22:49:57', NULL),
(1707, 21468, 20.00, 'pedro', 'balance', '2023-02-24 22:50:15', NULL),
(1708, 21470, 20.00, 'pedro', 'balance', '2023-02-24 22:50:21', NULL),
(1709, 21475, 20.00, 'pedro', 'balance', '2023-02-24 22:50:32', NULL),
(1710, 21474, 20.00, 'pedro', 'balance', '2023-02-24 22:50:51', NULL),
(1711, 21471, 20.00, 'pedro', 'balance', '2023-02-24 22:51:11', NULL),
(1712, 21480, 20.00, 'pedro', 'balance', '2023-02-24 22:51:57', NULL),
(1713, 21484, 20.00, 'pedro', 'balance', '2023-02-24 22:53:02', NULL),
(1714, 20711, 20.00, 'pedro', 'balance', '2023-02-24 22:53:30', NULL),
(1715, 21472, 20.00, 'pedro', 'balance', '2023-02-24 22:53:35', NULL),
(1716, 21490, 20.00, 'pedro', 'balance', '2023-02-24 22:54:05', NULL),
(1717, 5360, 20.00, 'pedro', 'balance', '2023-02-24 22:54:26', NULL),
(1718, 21492, 20.00, 'pedro', 'balance', '2023-02-24 22:54:28', NULL),
(1719, 21489, 20.00, 'pedro', 'balance', '2023-02-24 22:55:31', NULL),
(1720, 21502, 20.00, 'pedro', 'balance', '2023-02-24 22:56:31', NULL),
(1721, 21497, 20.00, 'pedro', 'balance', '2023-02-24 22:56:36', NULL),
(1722, 21493, 20.00, 'pedro', 'balance', '2023-02-24 22:56:42', NULL),
(1723, 3601, 20.00, 'pedro', 'balance', '2023-02-24 22:56:53', NULL),
(1724, 21505, 20.00, 'pedro', 'balance', '2023-02-24 22:57:17', NULL),
(1725, 21473, 20.00, 'pedro', 'balance', '2023-02-24 22:57:23', NULL),
(1726, 21503, 20.00, 'pedro', 'balance', '2023-02-24 22:57:32', NULL),
(1727, 21508, 20.00, 'pedro', 'balance', '2023-02-24 22:57:41', NULL),
(1728, 21510, 20.00, 'pedro', 'balance', '2023-02-24 22:58:06', NULL),
(1729, 21501, 20.00, 'pedro', 'balance', '2023-02-24 22:58:37', NULL),
(1730, 21512, 20.00, 'pedro', 'balance', '2023-02-24 22:58:48', NULL),
(1731, 21513, 20.00, 'pedro', 'balance', '2023-02-24 22:59:57', NULL),
(1732, 21516, 20.00, 'pedro', 'balance', '2023-02-24 23:00:10', NULL),
(1733, 21517, 20.00, 'pedro', 'balance', '2023-02-24 23:00:11', NULL),
(1734, 21496, 20.00, 'pedro', 'balance', '2023-02-24 23:00:17', NULL),
(1735, 21523, 20.00, 'pedro', 'balance', '2023-02-24 23:00:26', NULL),
(1736, 21526, 20.00, 'pedro', 'balance', '2023-02-24 23:00:44', NULL),
(1737, 21486, 20.00, 'pedro', 'balance', '2023-02-24 23:00:51', NULL),
(1738, 21522, 20.00, 'pedro', 'balance', '2023-02-24 23:01:10', NULL),
(1739, 21506, 20.00, 'pedro', 'balance', '2023-02-24 23:01:18', NULL),
(1740, 20950, 20.00, 'pedro', 'balance', '2023-02-24 23:01:39', NULL),
(1741, 21534, 20.00, 'pedro', 'balance', '2023-02-24 23:02:41', NULL),
(1742, 21536, 20.00, 'pedro', 'balance', '2023-02-24 23:03:04', NULL),
(1743, 21531, 20.00, 'pedro', 'balance', '2023-02-24 23:03:04', NULL),
(1744, 21511, 20.00, 'pedro', 'balance', '2023-02-24 23:03:17', NULL),
(1745, 21542, 20.00, 'pedro', 'balance', '2023-02-24 23:03:39', NULL),
(1746, 21530, 20.00, 'pedro', 'balance', '2023-02-24 23:03:46', NULL),
(1747, 12389, 20.00, 'pedro', 'balance', '2023-02-24 23:04:22', NULL),
(1748, 4061, 10.00, 'pri', 'balance', '2023-02-24 23:04:44', NULL),
(1749, 21548, 20.00, 'pedro', 'balance', '2023-02-24 23:05:50', NULL),
(1750, 8058, 20.00, 'pedro', 'balance', '2023-02-24 23:05:55', NULL),
(1751, 21541, 20.00, 'pedro', 'balance', '2023-02-24 23:05:55', NULL),
(1752, 21552, 20.00, 'pedro', 'balance', '2023-02-24 23:06:25', NULL),
(1753, 21551, 20.00, 'pedro', 'balance', '2023-02-24 23:06:34', NULL),
(1754, 21555, 10.00, 'reginaldo', 'balance', '2023-02-24 23:06:55', NULL),
(1755, 21555, 10.00, 'pri', 'balance', '2023-02-24 23:07:02', NULL),
(1756, 21561, 20.00, 'pedro', 'balance', '2023-02-24 23:07:52', NULL),
(1757, 21553, 20.00, 'pedro', 'balance', '2023-02-24 23:07:52', NULL),
(1758, 21556, 20.00, 'pedro', 'balance', '2023-02-24 23:08:02', NULL),
(1759, 21559, 20.00, 'pedro', 'balance', '2023-02-24 23:08:03', NULL),
(1760, 21562, 20.00, 'pedro', 'balance', '2023-02-24 23:08:47', NULL),
(1761, 21566, 20.00, 'pedro', 'balance', '2023-02-24 23:09:38', NULL),
(1762, 21564, 20.00, 'pedro', 'balance', '2023-02-24 23:09:40', NULL),
(1763, 21573, 20.00, 'pedro', 'balance', '2023-02-24 23:11:26', NULL),
(1764, 16739, 20.00, 'pedro', 'balance', '2023-02-24 23:12:26', NULL),
(1765, 21578, 20.00, 'pedro', 'balance', '2023-02-24 23:12:47', NULL),
(1766, 21579, 20.00, 'pedro', 'balance', '2023-02-24 23:12:55', NULL),
(1767, 21571, 20.00, 'pedro', 'balance', '2023-02-24 23:13:38', NULL),
(1768, 21584, 20.00, 'pedro', 'balance', '2023-02-24 23:13:47', NULL),
(1769, 21580, 20.00, 'pedro', 'balance', '2023-02-24 23:13:56', NULL),
(1770, 21589, 20.00, 'pedro', 'balance', '2023-02-24 23:15:15', NULL),
(1771, 21585, 20.00, 'pedro', 'balance', '2023-02-24 23:15:33', NULL),
(1772, 18557, 20.00, 'pedro', 'balance', '2023-02-24 23:15:40', NULL),
(1773, 21538, 20.00, 'pedro', 'balance', '2023-02-24 23:16:05', NULL),
(1774, 20206, 20.00, 'pedro', 'balance', '2023-02-24 23:16:42', NULL),
(1775, 21597, 20.00, 'pedro', 'balance', '2023-02-24 23:16:57', NULL),
(1776, 21593, 20.00, 'pedro', 'balance', '2023-02-24 23:17:01', NULL),
(1777, 21596, 20.00, 'pedro', 'balance', '2023-02-24 23:17:08', NULL),
(1778, 21466, 10.00, 'pri', 'balance', '2023-02-24 23:17:27', NULL),
(1779, 21600, 20.00, 'pedro', 'balance', '2023-02-24 23:17:42', NULL),
(1780, 21601, 20.00, 'pedro', 'balance', '2023-02-24 23:17:56', NULL),
(1781, 21576, 20.00, 'pedro', 'balance', '2023-02-24 23:18:09', NULL),
(1782, 21587, 20.00, 'pedro', 'balance', '2023-02-24 23:18:51', NULL),
(1783, 21599, 20.00, 'pedro', 'balance', '2023-02-24 23:19:47', NULL),
(1784, 19420, 20.00, 'pedro', 'balance', '2023-02-24 23:20:05', NULL),
(1785, 21603, 20.00, 'pedro', 'balance', '2023-02-24 23:20:47', NULL),
(1786, 21607, 20.00, 'pedro', 'balance', '2023-02-24 23:20:54', NULL),
(1787, 21608, 20.00, 'pedro', 'balance', '2023-02-24 23:21:05', NULL),
(1788, 4760, 10.00, 'reginaldo', 'balance', '2023-02-24 23:21:40', NULL),
(1789, 21606, 20.00, 'pedro', 'balance', '2023-02-24 23:22:18', NULL),
(1790, 21609, 20.00, 'pedro', 'balance', '2023-02-24 23:22:31', NULL),
(1791, 21610, 20.00, 'pedro', 'balance', '2023-02-24 23:22:37', NULL),
(1792, 21615, 20.00, 'pedro', 'balance', '2023-02-24 23:22:44', NULL),
(1793, 21616, 20.00, 'pedro', 'balance', '2023-02-24 23:23:17', NULL),
(1794, 16544, 20.00, 'pedro', 'balance', '2023-02-24 23:23:20', NULL),
(1795, 21621, 10.00, 'reginaldo', 'balance', '2023-02-24 23:23:21', NULL),
(1796, 21617, 20.00, 'pedro', 'balance', '2023-02-24 23:23:41', NULL),
(1797, 21621, 10.00, 'pri', 'balance', '2023-02-24 23:24:18', NULL),
(1798, 21622, 20.00, 'pedro', 'balance', '2023-02-24 23:24:53', NULL),
(1799, 20030, 20.00, 'pedro', 'balance', '2023-02-24 23:25:20', NULL),
(1800, 21605, 20.00, 'pedro', 'balance', '2023-02-24 23:25:39', NULL),
(1801, 21623, 20.00, 'pedro', 'balance', '2023-02-24 23:26:09', NULL),
(1802, 21520, 20.00, 'pedro', 'balance', '2023-02-24 23:26:40', NULL),
(1803, 21629, 20.00, 'pedro', 'balance', '2023-02-24 23:26:40', NULL),
(1804, 21625, 20.00, 'pedro', 'balance', '2023-02-24 23:26:44', NULL),
(1805, 18957, 20.00, 'pedro', 'balance', '2023-02-24 23:27:55', NULL),
(1806, 21631, 20.00, 'pedro', 'balance', '2023-02-24 23:27:56', NULL),
(1807, 15357, 20.00, 'pedro', 'balance', '2023-02-24 23:28:07', NULL),
(1808, 21638, 20.00, 'pedro', 'balance', '2023-02-24 23:29:49', NULL),
(1809, 21637, 20.00, 'pedro', 'balance', '2023-02-24 23:30:09', NULL),
(1810, 21633, 20.00, 'pedro', 'balance', '2023-02-24 23:30:50', NULL),
(1811, 21642, 20.00, 'pedro', 'balance', '2023-02-24 23:31:24', NULL),
(1812, 21644, 20.00, 'pedro', 'balance', '2023-02-24 23:32:07', NULL),
(1813, 21645, 20.00, 'pedro', 'balance', '2023-02-24 23:32:20', NULL),
(1814, 21647, 20.00, 'pedro', 'balance', '2023-02-24 23:32:32', NULL),
(1815, 8904, 20.00, 'pedro', 'balance', '2023-02-24 23:33:08', NULL),
(1816, 21646, 20.00, 'pedro', 'balance', '2023-02-24 23:33:22', NULL),
(1817, 21640, 20.00, 'pedro', 'balance', '2023-02-24 23:33:25', NULL),
(1818, 21652, 20.00, 'pedro', 'balance', '2023-02-24 23:34:15', NULL),
(1819, 21649, 20.00, 'pedro', 'balance', '2023-02-24 23:36:00', NULL),
(1820, 21660, 20.00, 'pedro', 'balance', '2023-02-24 23:36:44', NULL),
(1821, 21574, 20.00, 'pedro', 'balance', '2023-02-24 23:37:31', NULL),
(1822, 21292, 20.00, 'pedro', 'balance', '2023-02-24 23:37:38', NULL),
(1823, 21662, 20.00, 'pedro', 'balance', '2023-02-24 23:38:15', NULL),
(1824, 21669, 20.00, 'pedro', 'balance', '2023-02-24 23:41:47', NULL),
(1825, 19012, 20.00, 'pedro', 'balance', '2023-02-24 23:42:25', NULL),
(1826, 21670, 10.00, 'pri', 'balance', '2023-02-24 23:43:46', NULL),
(1827, 21674, 20.00, 'pedro', 'balance', '2023-02-24 23:43:54', NULL),
(1828, 21670, 10.00, 'reginaldo', 'balance', '2023-02-24 23:44:40', NULL),
(1829, 15258, 20.00, 'pedro', 'balance', '2023-02-24 23:45:23', NULL),
(1830, 21679, 20.00, 'pedro', 'balance', '2023-02-24 23:45:55', NULL),
(1831, 21680, 20.00, 'pedro', 'balance', '2023-02-24 23:46:05', NULL),
(1832, 21677, 20.00, 'pedro', 'balance', '2023-02-24 23:46:24', NULL),
(1833, 15630, 20.00, 'pedro', 'balance', '2023-02-24 23:47:02', NULL),
(1834, 21684, 20.00, 'pedro', 'balance', '2023-02-24 23:47:16', NULL),
(1835, 21687, 20.00, 'pedro', 'balance', '2023-02-24 23:48:06', NULL),
(1836, 21668, 20.00, 'pedro', 'balance', '2023-02-24 23:48:14', NULL),
(1837, 21690, 20.00, 'pedro', 'balance', '2023-02-24 23:48:48', NULL),
(1838, 21686, 20.00, 'pedro', 'balance', '2023-02-24 23:48:50', NULL),
(1839, 21685, 20.00, 'pedro', 'balance', '2023-02-24 23:49:02', NULL),
(1840, 4547, 20.00, 'pedro', 'balance', '2023-02-24 23:49:10', NULL),
(1841, 21692, 20.00, 'pedro', 'balance', '2023-02-24 23:49:44', NULL),
(1842, 21695, 20.00, 'pedro', 'balance', '2023-02-24 23:50:32', NULL),
(1843, 21682, 20.00, 'pedro', 'balance', '2023-02-24 23:50:46', NULL),
(1844, 21696, 20.00, 'pedro', 'balance', '2023-02-24 23:50:56', NULL),
(1845, 20230, 20.00, 'pedro', 'balance', '2023-02-24 23:51:02', NULL),
(1846, 21698, 20.00, 'pedro', 'balance', '2023-02-24 23:51:50', NULL),
(1847, 21703, 20.00, 'pedro', 'balance', '2023-02-24 23:51:59', NULL),
(1848, 21700, 20.00, 'pedro', 'balance', '2023-02-24 23:52:02', NULL),
(1849, 21702, 20.00, 'pedro', 'balance', '2023-02-24 23:52:39', NULL),
(1850, 21707, 20.00, 'pedro', 'balance', '2023-02-24 23:53:36', NULL),
(1851, 21705, 20.00, 'pedro', 'balance', '2023-02-24 23:53:38', NULL),
(1852, 21713, 20.00, 'pedro', 'balance', '2023-02-24 23:54:34', NULL),
(1853, 21714, 20.00, 'pedro', 'balance', '2023-02-24 23:54:59', NULL),
(1854, 18946, 20.00, 'pedro', 'balance', '2023-02-24 23:55:14', NULL),
(1855, 21716, 10.00, 'pri', 'balance', '2023-02-24 23:55:38', NULL),
(1856, 21719, 20.00, 'pedro', 'balance', '2023-02-24 23:55:50', NULL),
(1857, 21718, 20.00, 'pedro', 'balance', '2023-02-24 23:56:17', NULL),
(1858, 21716, 10.00, 'reginaldo', 'balance', '2023-02-24 23:56:34', NULL),
(1859, 21166, 20.00, 'pedro', 'balance', '2023-02-24 23:56:39', NULL),
(1860, 15629, 20.00, 'pedro', 'balance', '2023-02-24 23:56:52', NULL),
(1861, 21721, 20.00, 'pedro', 'balance', '2023-02-24 23:57:23', NULL),
(1862, 21724, 20.00, 'pedro', 'balance', '2023-02-24 23:58:44', NULL),
(1863, 21723, 20.00, 'pedro', 'balance', '2023-02-24 23:59:00', NULL),
(1864, 21726, 20.00, 'pedro', 'balance', '2023-02-24 23:59:22', NULL),
(1865, 21720, 20.00, 'pedro', 'balance', '2023-02-24 23:59:34', NULL),
(1866, 21725, 20.00, 'pedro', 'balance', '2023-02-24 23:59:40', NULL),
(1867, 21730, 20.00, 'pedro', 'balance', '2023-02-25 00:01:03', NULL),
(1868, 21465, 20.00, 'pedro', 'balance', '2023-02-25 00:02:23', NULL),
(1869, 21732, 20.00, 'pedro', 'balance', '2023-02-25 00:02:41', NULL),
(1870, 21739, 20.00, 'pedro', 'balance', '2023-02-25 00:03:47', NULL),
(1871, 21740, 20.00, 'pedro', 'balance', '2023-02-25 00:03:49', NULL),
(1872, 21737, 10.00, 'pri', 'balance', '2023-02-25 00:03:59', NULL),
(1873, 21738, 20.00, 'pedro', 'balance', '2023-02-25 00:04:00', NULL),
(1874, 21737, 10.00, 'reginaldo', 'balance', '2023-02-25 00:04:23', NULL),
(1875, 21733, 10.00, 'reginaldo', 'balance', '2023-02-25 00:04:46', NULL),
(1876, 21743, 20.00, 'pedro', 'balance', '2023-02-25 00:04:47', NULL),
(1877, 21742, 20.00, 'pedro', 'balance', '2023-02-25 00:05:05', NULL),
(1878, 21092, 20.00, 'pedro', 'balance', '2023-02-25 00:05:12', NULL),
(1879, 21722, 20.00, 'pedro', 'balance', '2023-02-25 00:06:12', NULL),
(1880, 21746, 20.00, 'pedro', 'balance', '2023-02-25 00:06:36', NULL),
(1881, 21745, 20.00, 'pedro', 'balance', '2023-02-25 00:06:42', NULL),
(1882, 21744, 20.00, 'pedro', 'balance', '2023-02-25 00:07:09', NULL),
(1883, 13571, 20.00, 'pedro', 'balance', '2023-02-25 00:07:26', NULL),
(1884, 21317, 20.00, 'pedro', 'balance', '2023-02-25 00:08:43', NULL),
(1885, 21757, 10.00, 'reginaldo', 'balance', '2023-02-25 00:09:27', NULL),
(1886, 21757, 10.00, 'pri', 'balance', '2023-02-25 00:11:04', NULL),
(1887, 21764, 20.00, 'pedro', 'balance', '2023-02-25 00:11:17', NULL),
(1888, 21756, 20.00, 'pedro', 'balance', '2023-02-25 00:11:22', NULL),
(1889, 21766, 20.00, 'pedro', 'balance', '2023-02-25 00:11:45', NULL),
(1890, 14236, 20.00, 'pedro', 'balance', '2023-02-25 00:12:40', NULL),
(1891, 21773, 20.00, 'pedro', 'balance', '2023-02-25 00:15:03', NULL),
(1892, 21780, 20.00, 'pedro', 'balance', '2023-02-25 00:18:10', NULL),
(1893, 15805, 20.00, 'pedro', 'balance', '2023-02-25 00:18:41', NULL),
(1894, 21314, 20.00, 'pedro', 'balance', '2023-02-25 00:22:35', NULL),
(1895, 21783, 20.00, 'pedro', 'balance', '2023-02-25 00:23:28', NULL),
(1896, 21790, 20.00, 'pedro', 'balance', '2023-02-25 00:27:47', NULL),
(1897, 21788, 20.00, 'pedro', 'balance', '2023-02-25 00:28:17', NULL),
(1898, 21781, 20.00, 'pedro', 'balance', '2023-02-25 00:28:27', NULL),
(1899, 21704, 20.00, 'pedro', 'balance', '2023-02-25 00:28:34', NULL),
(1900, 21792, 20.00, 'pedro', 'balance', '2023-02-25 00:28:56', NULL),
(1901, 20156, 20.00, 'pedro', 'balance', '2023-02-25 00:31:47', NULL),
(1902, 21797, 20.00, 'pedro', 'balance', '2023-02-25 00:33:56', NULL),
(1903, 21751, 20.00, 'pedro', 'balance', '2023-02-25 00:34:00', NULL),
(1904, 21805, 20.00, 'pedro', 'balance', '2023-02-25 00:35:54', NULL),
(1905, 21808, 20.00, 'pedro', 'balance', '2023-02-25 00:38:27', NULL),
(1906, 21813, 20.00, 'pedro', 'balance', '2023-02-25 00:40:21', NULL),
(1907, 21793, 20.00, 'pedro', 'balance', '2023-02-25 00:40:40', NULL),
(1908, 11094, 10.00, 'pri', 'balance', '2023-02-25 00:42:43', NULL),
(1909, 21817, 20.00, 'pedro', 'balance', '2023-02-25 00:43:40', NULL),
(1910, 21733, 10.00, 'pri', 'balance', '2023-02-25 00:44:21', NULL),
(1911, 21822, 20.00, 'pedro', 'balance', '2023-02-25 00:46:12', NULL),
(1912, 21821, 20.00, 'pedro', 'balance', '2023-02-25 00:46:27', NULL),
(1913, 21815, 20.00, 'pedro', 'balance', '2023-02-25 00:47:04', NULL),
(1914, 20532, 20.00, 'pedro', 'balance', '2023-02-25 00:47:53', NULL),
(1915, 21825, 20.00, 'pedro', 'balance', '2023-02-25 00:48:00', NULL),
(1916, 21828, 20.00, 'pedro', 'balance', '2023-02-25 00:50:05', NULL),
(1917, 21829, 20.00, 'pedro', 'balance', '2023-02-25 00:50:46', NULL),
(1918, 21830, 20.00, 'pedro', 'balance', '2023-02-25 00:51:33', NULL),
(1919, 21831, 20.00, 'pedro', 'balance', '2023-02-25 00:53:23', NULL),
(1920, 21836, 20.00, 'pedro', 'balance', '2023-02-25 00:54:32', NULL),
(1921, 21844, 20.00, 'pedro', 'balance', '2023-02-25 01:04:28', NULL),
(1922, 21850, 10.00, 'pri', 'balance', '2023-02-25 01:08:27', NULL),
(1923, 21849, 20.00, 'pedro', 'balance', '2023-02-25 01:08:31', NULL),
(1924, 21850, 10.00, 'reginaldo', 'balance', '2023-02-25 01:08:35', NULL),
(1925, 21851, 20.00, 'pedro', 'balance', '2023-02-25 01:12:23', NULL),
(1926, 9472, 20.00, 'pedro', 'balance', '2023-02-25 01:12:25', NULL),
(1927, 21853, 20.00, 'pedro', 'balance', '2023-02-25 01:12:57', NULL),
(1928, 21857, 20.00, 'pedro', 'balance', '2023-02-25 01:19:14', NULL),
(1929, 21863, 20.00, 'pedro', 'balance', '2023-02-25 01:25:32', NULL),
(1930, 21867, 20.00, 'pedro', 'balance', '2023-02-25 01:31:17', NULL),
(1931, 21869, 20.00, 'pedro', 'balance', '2023-02-25 01:33:27', NULL),
(1932, 21870, 20.00, 'pedro', 'balance', '2023-02-25 01:33:55', NULL),
(1933, 21868, 20.00, 'pedro', 'balance', '2023-02-25 01:34:01', NULL),
(1934, 21865, 20.00, 'pedro', 'balance', '2023-02-25 01:34:48', NULL),
(1935, 21871, 20.00, 'pedro', 'balance', '2023-02-25 01:37:29', NULL),
(1936, 21872, 20.00, 'pedro', 'balance', '2023-02-25 01:41:03', NULL),
(1937, 6367, 20.00, 'pedro', 'balance', '2023-02-25 01:41:09', NULL),
(1938, 21873, 20.00, 'pedro', 'balance', '2023-02-25 01:41:54', NULL),
(1939, 21879, 20.00, 'pedro', 'balance', '2023-02-25 01:46:56', NULL),
(1940, 21876, 20.00, 'pedro', 'balance', '2023-02-25 01:50:09', NULL),
(1941, 21427, 20.00, 'pedro', 'balance', '2023-02-25 01:52:20', NULL),
(1942, 21874, 20.00, 'pedro', 'balance', '2023-02-25 01:52:38', NULL),
(1943, 8838, 20.00, 'pedro', 'balance', '2023-02-25 01:53:01', NULL),
(1944, 15539, 20.00, 'pedro', 'balance', '2023-02-25 01:54:39', NULL),
(1945, 21882, 20.00, 'pedro', 'balance', '2023-02-25 01:55:43', NULL),
(1946, 20587, 20.00, 'pedro', 'balance', '2023-02-25 01:55:57', NULL),
(1947, 21887, 20.00, 'pedro', 'balance', '2023-02-25 02:02:23', NULL),
(1948, 17941, 20.00, 'pedro', 'balance', '2023-02-25 02:02:31', NULL),
(1949, 21888, 20.00, 'pedro', 'balance', '2023-02-25 02:03:34', NULL),
(1950, 21891, 20.00, 'pedro', 'balance', '2023-02-25 02:04:40', NULL),
(1951, 21769, 20.00, 'pedro', 'balance', '2023-02-25 02:06:31', NULL),
(1952, 21895, 10.00, 'reginaldo', 'balance', '2023-02-25 02:07:33', NULL),
(1953, 21895, 10.00, 'pri', 'balance', '2023-02-25 02:07:40', NULL),
(1954, 21896, 20.00, 'pedro', 'balance', '2023-02-25 02:12:10', NULL),
(1955, 21901, 20.00, 'pedro', 'balance', '2023-02-25 02:16:56', NULL),
(1956, 21899, 20.00, 'pedro', 'balance', '2023-02-25 02:17:43', NULL),
(1957, 21903, 20.00, 'pedro', 'balance', '2023-02-25 02:19:28', NULL),
(1958, 21902, 20.00, 'pedro', 'balance', '2023-02-25 02:21:01', NULL),
(1959, 21906, 20.00, 'pedro', 'balance', '2023-02-25 02:22:17', NULL),
(1960, 21907, 20.00, 'pedro', 'balance', '2023-02-25 02:22:50', NULL),
(1961, 21911, 20.00, 'pedro', 'balance', '2023-02-25 02:25:18', NULL),
(1962, 21912, 20.00, 'pedro', 'balance', '2023-02-25 02:25:59', NULL),
(1963, 21917, 20.00, 'pedro', 'balance', '2023-02-25 02:30:05', NULL),
(1964, 21919, 20.00, 'pedro', 'balance', '2023-02-25 02:35:55', NULL),
(1965, 21920, 20.00, 'pedro', 'balance', '2023-02-25 02:37:35', NULL),
(1966, 21926, 20.00, 'pedro', 'balance', '2023-02-25 02:50:48', NULL),
(1967, 21930, 20.00, 'pedro', 'balance', '2023-02-25 02:58:25', NULL),
(1968, 21931, 20.00, 'pedro', 'balance', '2023-02-25 03:02:35', NULL),
(1969, 21934, 20.00, 'pedro', 'balance', '2023-02-25 03:06:03', NULL),
(1970, 21937, 20.00, 'pedro', 'balance', '2023-02-25 03:08:44', NULL),
(1971, 21938, 20.00, 'pedro', 'balance', '2023-02-25 03:08:53', NULL),
(1972, 20971, 20.00, 'pedro', 'balance', '2023-02-25 03:11:52', NULL),
(1973, 19038, 20.00, 'pedro', 'balance', '2023-02-25 03:20:25', NULL),
(1974, 21947, 20.00, 'pedro', 'balance', '2023-02-25 03:24:07', NULL),
(1975, 21949, 20.00, 'pedro', 'balance', '2023-02-25 03:30:49', NULL),
(1976, 12472, 10.00, 'reginaldo', 'balance', '2023-02-25 03:39:22', NULL),
(1977, 19019, 20.00, 'pedro', 'balance', '2023-02-25 03:41:03', NULL),
(1978, 21953, 20.00, 'pedro', 'balance', '2023-02-25 03:42:27', NULL),
(1979, 21956, 20.00, 'pedro', 'balance', '2023-02-25 03:50:38', NULL),
(1980, 21954, 20.00, 'pedro', 'balance', '2023-02-25 03:53:29', NULL),
(1981, 21960, 20.00, 'pedro', 'balance', '2023-02-25 04:00:43', NULL),
(1982, 21961, 20.00, 'pedro', 'balance', '2023-02-25 04:00:51', NULL),
(1983, 21942, 20.00, 'pedro', 'balance', '2023-02-25 04:03:21', NULL),
(1984, 21958, 20.00, 'pedro', 'balance', '2023-02-25 04:03:43', NULL),
(1985, 21964, 20.00, 'pedro', 'balance', '2023-02-25 04:04:52', NULL),
(1986, 21941, 20.00, 'pedro', 'balance', '2023-02-25 04:07:01', NULL),
(1987, 21966, 20.00, 'pedro', 'balance', '2023-02-25 04:12:47', NULL),
(1988, 21970, 20.00, 'pedro', 'balance', '2023-02-25 04:14:59', NULL),
(1989, 21969, 20.00, 'pedro', 'balance', '2023-02-25 04:16:07', NULL),
(1990, 21972, 20.00, 'pedro', 'balance', '2023-02-25 04:17:03', NULL),
(1991, 21974, 20.00, 'pedro', 'balance', '2023-02-25 04:21:12', NULL),
(1992, 21977, 20.00, 'pedro', 'balance', '2023-02-25 04:21:51', NULL),
(1993, 21978, 20.00, 'pedro', 'balance', '2023-02-25 04:22:21', NULL),
(1994, 21980, 20.00, 'pedro', 'balance', '2023-02-25 04:25:27', NULL),
(1995, 21981, 20.00, 'pedro', 'balance', '2023-02-25 04:26:17', NULL),
(1996, 21982, 20.00, 'pedro', 'balance', '2023-02-25 04:26:55', NULL),
(1997, 21983, 20.00, 'pedro', 'balance', '2023-02-25 04:27:39', NULL),
(1998, 21984, 20.00, 'pedro', 'balance', '2023-02-25 04:27:55', NULL),
(1999, 21985, 20.00, 'pedro', 'balance', '2023-02-25 04:28:40', NULL),
(2000, 21986, 20.00, 'pedro', 'balance', '2023-02-25 04:30:56', NULL),
(2001, 21987, 20.00, 'pedro', 'balance', '2023-02-25 04:31:23', NULL),
(2002, 21988, 20.00, 'pedro', 'balance', '2023-02-25 04:32:49', NULL),
(2003, 21990, 20.00, 'pedro', 'balance', '2023-02-25 04:33:53', NULL),
(2004, 21989, 20.00, 'pedro', 'balance', '2023-02-25 04:33:57', NULL),
(2005, 21992, 20.00, 'pedro', 'balance', '2023-02-25 04:34:42', NULL),
(2006, 21993, 20.00, 'pedro', 'balance', '2023-02-25 04:35:26', NULL),
(2007, 21994, 20.00, 'pedro', 'balance', '2023-02-25 04:36:46', NULL),
(2008, 21995, 20.00, 'pedro', 'balance', '2023-02-25 04:40:13', NULL),
(2009, 21998, 20.00, 'pedro', 'balance', '2023-02-25 04:44:03', NULL),
(2010, 21997, 20.00, 'pedro', 'balance', '2023-02-25 04:44:35', NULL),
(2011, 19841, 20.00, 'pedro', 'balance', '2023-02-25 04:45:22', NULL),
(2012, 22000, 20.00, 'pedro', 'balance', '2023-02-25 04:46:22', NULL),
(2013, 22003, 20.00, 'pedro', 'balance', '2023-02-25 04:53:47', NULL),
(2014, 22005, 20.00, 'pedro', 'balance', '2023-02-25 05:02:26', NULL),
(2015, 21568, 20.00, 'pedro', 'balance', '2023-02-25 05:03:48', NULL),
(2016, 16519, 20.00, 'pedro', 'balance', '2023-02-25 05:31:28', NULL),
(2017, 2159, 20.00, 'pedro', 'balance', '2023-02-25 05:33:16', NULL),
(2018, 22011, 20.00, 'pedro', 'balance', '2023-02-25 05:42:10', NULL),
(2019, 22013, 20.00, 'pedro', 'balance', '2023-02-25 05:46:10', NULL),
(2020, 22012, 20.00, 'pedro', 'balance', '2023-02-25 05:50:31', NULL),
(2021, 22015, 20.00, 'pedro', 'balance', '2023-02-25 05:51:15', NULL),
(2022, 22021, 20.00, 'pedro', 'balance', '2023-02-25 06:49:31', NULL),
(2023, 22021, 20.00, 'pedro', 'balance', '2023-02-25 06:49:32', NULL),
(2024, 20866, 20.00, 'pedro', 'balance', '2023-02-25 06:55:03', NULL),
(2025, 22031, 20.00, 'pedro', 'balance', '2023-02-25 08:21:08', NULL),
(2026, 5082, 10.00, 'reginaldo', 'balance', '2023-02-25 09:34:06', NULL),
(2027, 22047, 20.00, 'pedro', 'balance', '2023-02-25 10:23:59', NULL),
(2028, 22050, 20.00, 'pedro', 'balance', '2023-02-25 10:45:20', NULL),
(2029, 22055, 20.00, 'pedro', 'balance', '2023-02-25 10:51:38', NULL),
(2030, 15198, 20.00, 'pedro', 'balance', '2023-02-25 10:52:23', NULL),
(2031, 15382, 20.00, 'pedro', 'balance', '2023-02-25 10:52:54', NULL),
(2032, 22056, 20.00, 'pedro', 'balance', '2023-02-25 10:53:19', NULL),
(2033, 22059, 20.00, 'pedro', 'balance', '2023-02-25 11:19:03', NULL),
(2034, 5366, 20.00, 'pedro', 'balance', '2023-02-25 11:20:35', NULL),
(2035, 20914, 20.00, 'pedro', 'balance', '2023-02-25 11:38:56', NULL),
(2036, 14306, 20.00, 'pedro', 'balance', '2023-02-25 11:39:28', NULL),
(2037, 22072, 20.00, 'pedro', 'balance', '2023-02-25 12:20:36', NULL),
(2038, 22074, 20.00, 'pedro', 'balance', '2023-02-25 12:29:33', NULL),
(2039, 8296, 10.00, 'reginaldo', 'balance', '2023-02-25 12:29:57', NULL),
(2040, 21976, 20.00, 'pedro', 'balance', '2023-02-25 12:31:53', NULL),
(2041, 22077, 20.00, 'pedro', 'balance', '2023-02-25 12:32:21', NULL),
(2042, 22082, 10.00, 'reginaldo', 'balance', '2023-02-25 12:44:28', NULL),
(2043, 22083, 20.00, 'pedro', 'balance', '2023-02-25 12:46:26', NULL),
(2044, 8129, 20.00, 'pedro', 'balance', '2023-02-25 12:53:53', NULL),
(2045, 8388, 10.00, 'reginaldo', 'balance', '2023-02-25 13:02:52', NULL),
(2046, 22087, 20.00, 'pedro', 'balance', '2023-02-25 13:05:31', NULL),
(2047, 22093, 20.00, 'pedro', 'balance', '2023-02-25 13:12:13', NULL),
(2048, 22097, 10.00, 'reginaldo', 'balance', '2023-02-25 13:22:46', NULL),
(2049, 22103, 20.00, 'pedro', 'balance', '2023-02-25 13:36:46', NULL),
(2050, 22104, 20.00, 'pedro', 'balance', '2023-02-25 13:37:42', NULL),
(2051, 22105, 20.00, 'pedro', 'balance', '2023-02-25 13:40:10', NULL),
(2052, 20259, 20.00, 'pedro', 'balance', '2023-02-25 13:44:50', NULL),
(2053, 22106, 20.00, 'pedro', 'balance', '2023-02-25 13:45:09', NULL),
(2054, 22107, 20.00, 'pedro', 'balance', '2023-02-25 13:51:00', NULL),
(2055, 22111, 20.00, 'pedro', 'balance', '2023-02-25 13:52:28', NULL),
(2056, 22080, 20.00, 'pedro', 'balance', '2023-02-25 13:55:51', NULL),
(2057, 22113, 20.00, 'pedro', 'balance', '2023-02-25 13:56:39', NULL),
(2058, 22115, 20.00, 'pedro', 'balance', '2023-02-25 14:00:08', NULL),
(2059, 22117, 20.00, 'pedro', 'balance', '2023-02-25 14:01:52', NULL),
(2060, 22120, 20.00, 'pedro', 'balance', '2023-02-25 14:14:28', NULL),
(2061, 22122, 20.00, 'pedro', 'balance', '2023-02-25 14:17:39', NULL),
(2062, 22126, 20.00, 'pedro', 'balance', '2023-02-25 14:24:15', NULL),
(2063, 22128, 20.00, 'pedro', 'balance', '2023-02-25 14:28:34', NULL),
(2064, 22130, 20.00, 'pedro', 'balance', '2023-02-25 14:31:02', NULL),
(2065, 22131, 20.00, 'pedro', 'balance', '2023-02-25 14:31:25', NULL),
(2066, 22133, 20.00, 'pedro', 'balance', '2023-02-25 14:32:16', NULL),
(2067, 22134, 20.00, 'pedro', 'balance', '2023-02-25 14:32:55', NULL),
(2068, 22136, 20.00, 'pedro', 'balance', '2023-02-25 14:35:03', NULL),
(2069, 22138, 20.00, 'pedro', 'balance', '2023-02-25 14:40:47', NULL),
(2070, 22140, 20.00, 'pedro', 'balance', '2023-02-25 14:46:40', NULL),
(2071, 22137, 20.00, 'pedro', 'balance', '2023-02-25 14:50:00', NULL),
(2072, 21898, 20.00, 'pedro', 'balance', '2023-02-25 14:52:26', NULL),
(2073, 22145, 20.00, 'pedro', 'balance', '2023-02-25 14:55:47', NULL),
(2074, 22146, 20.00, 'pedro', 'balance', '2023-02-25 14:56:35', NULL),
(2075, 22147, 20.00, 'pedro', 'balance', '2023-02-25 14:58:03', NULL),
(2076, 22148, 20.00, 'pedro', 'balance', '2023-02-25 15:02:49', NULL),
(2077, 22149, 20.00, 'pedro', 'balance', '2023-02-25 15:03:46', NULL),
(2078, 22152, 20.00, 'pedro', 'balance', '2023-02-25 15:07:36', NULL),
(2079, 22156, 20.00, 'pedro', 'balance', '2023-02-25 15:11:22', NULL),
(2080, 22157, 20.00, 'pedro', 'balance', '2023-02-25 15:12:35', NULL),
(2081, 23294, 150.00, 'nat', 'balance', '2023-02-27 15:18:56', NULL),
(2082, 24173, 100.00, 'nattan', 'balance', '2023-02-28 17:18:06', NULL),
(2083, 4623, 100.00, 'nattan', 'balance', '2023-02-28 22:46:47', NULL),
(2084, 24570, 100.00, 'nattan', 'balance', '2023-03-01 01:04:18', NULL),
(2085, 24574, 100.00, 'nattan', 'balance', '2023-03-01 01:09:06', NULL),
(2086, 24576, 100.00, 'nattan', 'balance', '2023-03-01 01:11:48', NULL),
(2087, 2164, 10000.00, '8243', 'balance', '2023-03-02 14:59:35', NULL),
(2088, 2165, 1000.00, 'ep10', 'bonus', '2023-03-02 15:53:54', NULL),
(2089, 26743, 10.00, 'eduarda', 'balance', '2023-03-02 16:14:24', NULL),
(2090, 14336, 10.00, 'eduarda', 'balance', '2023-03-02 16:16:02', NULL),
(2091, 12029, 10.00, 'eduarda', 'balance', '2023-03-02 16:21:42', NULL),
(2092, 2164, 50000.00, '434343', 'balance', '2023-03-09 02:09:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `min` decimal(20,2) NOT NULL DEFAULT '1.00',
  `max` decimal(20,2) NOT NULL DEFAULT '1000.00',
  `bets` int(11) NOT NULL DEFAULT '3',
  `time` int(11) NOT NULL DEFAULT '10',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roulette`
--

CREATE TABLE `roulette` (
  `id` int(11) NOT NULL,
  `winner_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `hash` text COLLATE utf8mb4_unicode_ci,
  `profit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ranked` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roulette_bets`
--

CREATE TABLE `roulette_bets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `win_sum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sends`
--

CREATE TABLE `sends` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'webzow',
  `sitename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'webzow',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'webzow',
  `description` text COLLATE utf8mb4_unicode_ci,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `site_disable` int(11) NOT NULL DEFAULT '0',
  `vk_url` text COLLATE utf8mb4_unicode_ci,
  `vk_support_link` text COLLATE utf8mb4_unicode_ci,
  `vk_service_key` text COLLATE utf8mb4_unicode_ci,
  `censore_replace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'i ♥ webzow',
  `chat_dep` decimal(20,2) DEFAULT '10.00',
  `fakebets` int(11) NOT NULL DEFAULT '0',
  `fake_min_bet` decimal(20,2) DEFAULT '0.10',
  `fake_max_bet` decimal(20,2) DEFAULT '100.00',
  `fk_mrh_ID` int(11) DEFAULT NULL,
  `fk_secret1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_secret2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payeer_mrh_ID` int(11) DEFAULT NULL,
  `payeer_secret1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payeer_secret2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payeer_account_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payeer_api_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payeer_api_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_koef` decimal(20,2) DEFAULT '1.30',
  `profit_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jackpot_commission` int(11) DEFAULT '10',
  `wheel_timer` int(11) DEFAULT '15',
  `wheel_min_bet` decimal(20,2) DEFAULT '0.10',
  `wheel_max_bet` decimal(20,2) DEFAULT '1000.00',
  `wheel_rotate` decimal(20,2) DEFAULT '0.00',
  `wheel_rotate2` decimal(20,2) DEFAULT '0.00',
  `wheel_rotate_start` decimal(20,2) DEFAULT '0.00',
  `double_rotate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `double_rotate_start` decimal(20,2) NOT NULL DEFAULT '0.00',
  `crash_min_bet` decimal(20,2) DEFAULT '0.10',
  `crash_max_bet` decimal(20,2) DEFAULT '1000.00',
  `crash_timer` int(11) DEFAULT '10',
  `battle_timer` int(11) DEFAULT '10',
  `battle_min_bet` decimal(20,2) DEFAULT '0.10',
  `battle_max_bet` decimal(20,2) DEFAULT '1000.00',
  `battle_commission` int(11) DEFAULT '10',
  `dice_min_bet` decimal(20,2) DEFAULT '0.10',
  `dice_max_bet` decimal(20,2) DEFAULT '1000.00',
  `flip_commission` int(11) DEFAULT '15',
  `flip_min_bet` decimal(20,2) DEFAULT '0.10',
  `flip_max_bet` decimal(20,2) DEFAULT '1000.00',
  `hilo_timer` int(11) NOT NULL DEFAULT '20',
  `hilo_min_bet` decimal(20,2) NOT NULL DEFAULT '0.10',
  `hilo_max_bet` decimal(20,2) NOT NULL DEFAULT '1000.00',
  `hilo_bets` int(11) NOT NULL DEFAULT '3',
  `tower_min_bet` int(11) DEFAULT NULL,
  `tower_max_bet` int(11) DEFAULT NULL,
  `exchange_min` decimal(20,2) DEFAULT '3000.00',
  `exchange_curs` int(11) DEFAULT '3',
  `ref_perc` int(11) DEFAULT '5',
  `ref_sum` decimal(20,2) DEFAULT '0.50',
  `min_ref_withdraw` decimal(20,2) DEFAULT '10.00',
  `min_dep` decimal(20,2) DEFAULT '1.00',
  `min_dep_withdraw` decimal(20,2) DEFAULT '50.00',
  `requery_perc` decimal(8,2) NOT NULL DEFAULT '10.00',
  `requery_bet_perc` decimal(8,2) DEFAULT '1.00',
  `dep_bonus_min` decimal(20,2) NOT NULL DEFAULT '0.00',
  `dep_bonus_perc` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bonus_group_time` int(11) DEFAULT '15',
  `max_active_ref` int(11) DEFAULT '8',
  `payeer_com_percent` decimal(20,2) DEFAULT '1.00',
  `payeer_com_rub` decimal(20,2) DEFAULT '0.00',
  `payeer_min` decimal(20,2) DEFAULT '10.00',
  `qiwi_com_percent` decimal(20,2) DEFAULT '2.90',
  `qiwi_com_rub` decimal(20,2) DEFAULT '0.00',
  `qiwi_min` decimal(20,2) DEFAULT '10.00',
  `yandex_com_percent` decimal(20,2) DEFAULT '0.00',
  `yandex_com_rub` decimal(20,2) DEFAULT '0.00',
  `yandex_min` decimal(20,2) DEFAULT '10.00',
  `webmoney_com_percent` decimal(20,2) DEFAULT '5.00',
  `webmoney_com_rub` decimal(20,2) DEFAULT '0.00',
  `webmoney_min` decimal(20,2) DEFAULT '10.00',
  `visa_com_percent` decimal(20,2) DEFAULT '4.00',
  `visa_com_rub` decimal(20,2) DEFAULT '50.00',
  `visa_min` decimal(20,2) DEFAULT '1000.00',
  `mp_com_percent` decimal(20,2) DEFAULT '1.00',
  `mp_com_brl` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mp_min` decimal(20,2) NOT NULL DEFAULT '10.00',
  `double_next_result` decimal(11,0) NOT NULL DEFAULT '-1',
  `double_red_percent` int(11) NOT NULL DEFAULT '47',
  `double_black_percent` int(11) NOT NULL DEFAULT '47',
  `double_white_percent` int(11) NOT NULL DEFAULT '6',
  `cpa_min_deposit_value` int(11) NOT NULL DEFAULT '40',
  `repost_post_id` varchar(258) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_point_withdraw` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'When withdraw the value on a bet, won points for Level up.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `domain`, `sitename`, `title`, `description`, `keywords`, `site_disable`, `vk_url`, `vk_support_link`, `vk_service_key`, `censore_replace`, `chat_dep`, `fakebets`, `fake_min_bet`, `fake_max_bet`, `fk_mrh_ID`, `fk_secret1`, `fk_secret2`, `fk_api`, `fk_wallet`, `payeer_mrh_ID`, `payeer_secret1`, `payeer_secret2`, `payeer_account_ID`, `payeer_api_ID`, `payeer_api_pass`, `profit_koef`, `profit_money`, `jackpot_commission`, `wheel_timer`, `wheel_min_bet`, `wheel_max_bet`, `wheel_rotate`, `wheel_rotate2`, `wheel_rotate_start`, `double_rotate`, `double_rotate_start`, `crash_min_bet`, `crash_max_bet`, `crash_timer`, `battle_timer`, `battle_min_bet`, `battle_max_bet`, `battle_commission`, `dice_min_bet`, `dice_max_bet`, `flip_commission`, `flip_min_bet`, `flip_max_bet`, `hilo_timer`, `hilo_min_bet`, `hilo_max_bet`, `hilo_bets`, `tower_min_bet`, `tower_max_bet`, `exchange_min`, `exchange_curs`, `ref_perc`, `ref_sum`, `min_ref_withdraw`, `min_dep`, `min_dep_withdraw`, `requery_perc`, `requery_bet_perc`, `dep_bonus_min`, `dep_bonus_perc`, `bonus_group_time`, `max_active_ref`, `payeer_com_percent`, `payeer_com_rub`, `payeer_min`, `qiwi_com_percent`, `qiwi_com_rub`, `qiwi_min`, `yandex_com_percent`, `yandex_com_rub`, `yandex_min`, `webmoney_com_percent`, `webmoney_com_rub`, `webmoney_min`, `visa_com_percent`, `visa_com_rub`, `visa_min`, `mp_com_percent`, `mp_com_brl`, `mp_min`, `double_next_result`, `double_red_percent`, `double_black_percent`, `double_white_percent`, `cpa_min_deposit_value`, `repost_post_id`, `level_point_withdraw`) VALUES
(1, 'betfyre.grupomsesportes.com', 'MS FYRE', 'msfyre | Online Cassino', 'MsFyre - a sua nova casa de aposta 100% fairplay!', 'betfyre.com', 0, NULL, NULL, NULL, '***', 0.00, 1, 2.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, -999999999999999999.99, 30, 15, 0.50, 500.00, 146.30, 146.30, 1677933503.00, 384.23, 1678821639.00, 1.00, 500.00, 5, 15, 1.00, 500.00, 30, 1.00, 500.00, 20, 1.00, 500.00, 20, 1.00, 1000.00, 3, 1, 500, 100.00, 100, NULL, NULL, NULL, 1.00, 1.00, 43.00, 0.00, 50.00, 0.00, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 50.00, 50.00, -1, 45, 49, 6, 0, NULL, 5.50);

-- --------------------------------------------------------

--
-- Table structure for table `slots_hash`
--

CREATE TABLE `slots_hash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slots_transactions`
--

CREATE TABLE `slots_transactions` (
  `id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'bgaming',
  `game` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `system_levels`
--

CREATE TABLE `system_levels` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `score` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `towers`
--

CREATE TABLE `towers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `bet` double(255,2) NOT NULL,
  `bombs` int(11) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `revealed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `coeff` double(255,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(258) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(258) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `real_name` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `requery` decimal(8,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level` int(11) NOT NULL DEFAULT '0',
  `score_level` decimal(8,2) NOT NULL DEFAULT '0.00',
  `score_level_current` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(520) COLLATE utf8mb4_unicode_ci DEFAULT '/img/userfyre.png',
  `superadmin` int(11) NOT NULL DEFAULT '0',
  `is_lowadmin` int(11) NOT NULL DEFAULT '0',
  `is_moder` int(11) NOT NULL DEFAULT '0',
  `is_youtuber` int(11) NOT NULL DEFAULT '0',
  `fake` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `banchat` int(11) DEFAULT NULL,
  `banchat_reason` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `ban` int(11) NOT NULL DEFAULT '0',
  `ban_reason` text COLLATE utf8mb4_unicode_ci,
  `link_trans` int(11) NOT NULL DEFAULT '0',
  `link_reg` int(11) NOT NULL DEFAULT '0',
  `ref_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ref_money_all` decimal(20,2) NOT NULL DEFAULT '0.00',
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `isDeveloper` int(11) DEFAULT '0',
  `cpf` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `street_name` text COLLATE utf8mb4_unicode_ci,
  `street_number` int(11) DEFAULT NULL,
  `neighborhood` varchar(210) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(210) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `federal_unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_new_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `real_name`, `number_phone`, `balance`, `requery`, `bonus`, `level`, `score_level`, `score_level_current`, `unique_id`, `ip`, `is_admin`, `avatar`, `superadmin`, `is_lowadmin`, `is_moder`, `is_youtuber`, `fake`, `time`, `banchat`, `banchat_reason`, `user_id`, `ban`, `ban_reason`, `link_trans`, `link_reg`, `ref_id`, `ref_money`, `ref_money_all`, `remember_token`, `isDeveloper`, `cpf`, `zip_code`, `street_name`, `street_number`, `neighborhood`, `city`, `federal_unit`, `updated_at`, `created_at`, `token_new_pass`) VALUES
(0, 'euprincipe', 'scriptphpdev@gmail.com', '$2y$10$M7/Iyj7nQ3fzAsMqrSdWtO0b1LRV6WIpC7vFxKuRr44EkEzKtlfkS', 'Matheus Soares', '74998125331', 0.00, 0.00, 0.00, 0, 0.00, '0', 'zFjV8NLC3Ke', NULL, 1, '/img/userfyre.png', 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, 0.00, 0.00, 'Hlrc51hNfdlukwQFAZXAhS0ChQk9IJu7z4c52EVp3dVE85ZminTKhskqtxrv', 1, '11454171405', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-03 19:48:13', '2023-04-30 20:01:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wheel`
--

CREATE TABLE `wheel` (
  `id` int(11) NOT NULL,
  `winner_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `hash` text COLLATE utf8mb4_unicode_ci,
  `profit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ranked` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wheel`
--

INSERT INTO `wheel` (`id`, `winner_color`, `price`, `status`, `hash`, `profit`, `ranked`, `created_at`, `updated_at`) VALUES
(1, 'black', 33.00, 3, 'b8fa5c995a4257c41da7e1a4f413e781', 0.00, 0, '2023-02-23 11:07:29', '2023-02-23 15:09:58'),
(2, 'black', 29.50, 3, '79a1d1f2cf672f43f0acbdd6ee1f3958', 0.00, 0, '2023-02-23 15:09:58', '2023-02-23 15:10:42'),
(3, 'green', 28.00, 3, '5e804c7801c8ca5e8019194b9aa373cc', 0.00, 0, '2023-02-23 15:10:42', '2023-02-23 15:12:21'),
(4, 'red', 83.50, 3, '6835a5215079bc97f2f4ae7e4bf66c76', 0.00, 0, '2023-02-23 15:12:22', '2023-02-28 15:31:54'),
(5, 'black', 1503.50, 3, '181bad09066017c7dcbd36af3cbeb91f', 0.00, 0, '2023-02-28 15:31:54', '2023-02-28 15:40:22'),
(6, 'black', 23036.00, 3, '1909d570584cb54e3b6c3ae7369993aa', 0.00, 0, '2023-02-28 15:40:22', '2023-02-28 21:28:49'),
(7, 'black', 39530.50, 3, 'b3c90ca0bb8c029a1708f2f27c128fe4', 0.00, 0, '2023-02-28 21:28:49', '2023-03-01 09:38:32'),
(8, 'black', 34156.00, 3, 'ac8c3dfdf8b34e04cf555580d0b327f5', 0.00, 0, '2023-03-01 09:38:32', '2023-03-01 14:49:28'),
(9, 'black', 30087.50, 3, '73e78b5b924619c56f803e9c96ecb45f', 0.00, 0, '2023-03-01 14:49:28', '2023-03-01 20:35:18'),
(10, 'black', 39660.50, 3, '4cea66241bdee9ce79f109510ebab97a', 0.00, 0, '2023-03-01 20:35:18', '2023-03-02 14:30:22'),
(11, 'black', 16175.50, 3, '0ff03b90fb697a24dda1c985e59564bf', 0.00, 0, '2023-03-02 14:30:22', '2023-03-02 19:23:21'),
(12, 'red', 22257.00, 3, '71e36a555b9293db3412d4fa536ed3a6', 0.00, 0, '2023-03-02 19:23:21', '2023-03-03 11:28:01'),
(13, 'black', 19616.50, 3, '7cab54e7222354d14467ac861a0717db', 0.00, 0, '2023-03-03 11:28:01', '2023-03-03 16:55:13'),
(14, 'black', 22392.50, 3, 'ced8ada70932a16dd5ebcbd64afad643', 0.00, 0, '2023-03-03 16:55:13', '2023-03-04 09:38:34'),
(15, NULL, 21659.00, 1, '522b491ff4e5c27b7f11e6d8c8c75b2c', 0.00, 0, '2023-03-04 09:38:34', '2023-03-04 18:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `wheel_bets`
--

CREATE TABLE `wheel_bets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win` int(11) NOT NULL DEFAULT '0',
  `win_sum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fake` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `valueWithCom` decimal(20,2) DEFAULT NULL,
  `wallet` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL DEFAULT 'asaas',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `battle`
--
ALTER TABLE `battle`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `battle_bets`
--
ALTER TABLE `battle_bets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `battle_bets_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `battle_bets_game_id_foreign` (`game_id`) USING BTREE;

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bonus_log`
--
ALTER TABLE `bonus_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bonus_log_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `crash`
--
ALTER TABLE `crash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `crash_bets`
--
ALTER TABLE `crash_bets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `crash_bets_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `crash_bets_round_id_foreign` (`round_id`) USING BTREE;

--
-- Indexes for table `dice`
--
ALTER TABLE `dice`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `dice_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `double`
--
ALTER TABLE `double`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `double_bets`
--
ALTER TABLE `double_bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `flip`
--
ALTER TABLE `flip`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `giveaway`
--
ALTER TABLE `giveaway`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `giveaway_users`
--
ALTER TABLE `giveaway_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hilo`
--
ALTER TABLE `hilo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hilo_bets`
--
ALTER TABLE `hilo_bets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `jackpot`
--
ALTER TABLE `jackpot`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `jackpot_bets`
--
ALTER TABLE `jackpot_bets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `payments_providers`
--
ALTER TABLE `payments_providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `profit`
--
ALTER TABLE `profit`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promo_log`
--
ALTER TABLE `promo_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `roulette`
--
ALTER TABLE `roulette`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `roulette_bets`
--
ALTER TABLE `roulette_bets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sends`
--
ALTER TABLE `sends`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `slots_hash`
--
ALTER TABLE `slots_hash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slots_transactions`
--
ALTER TABLE `slots_transactions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `system_levels`
--
ALTER TABLE `system_levels`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `towers`
--
ALTER TABLE `towers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`email`) USING BTREE,
  ADD KEY `id` (`id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `wheel`
--
ALTER TABLE `wheel`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wheel_bets`
--
ALTER TABLE `wheel_bets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdraw_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `battle`
--
ALTER TABLE `battle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33047;

--
-- AUTO_INCREMENT for table `battle_bets`
--
ALTER TABLE `battle_bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577309;

--
-- AUTO_INCREMENT for table `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonus_log`
--
ALTER TABLE `bonus_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crash`
--
ALTER TABLE `crash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crash_bets`
--
ALTER TABLE `crash_bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
