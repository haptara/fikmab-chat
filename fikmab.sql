-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2025 at 09:53 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fikmab`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_archiveds`
--

CREATE TABLE `chat_archiveds` (
  `id` char(36) NOT NULL,
  `archived_id` char(36) NOT NULL,
  `from_type` varchar(255) NOT NULL,
  `from_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_contacts`
--

CREATE TABLE `chat_contacts` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `contact_id` char(36) NOT NULL,
  `is_contact_saved` tinyint(1) NOT NULL DEFAULT '0',
  `is_contact_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_groups`
--

CREATE TABLE `chat_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text,
  `creator_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_groups_members`
--

CREATE TABLE `chat_groups_members` (
  `id` char(36) NOT NULL,
  `group_id` char(36) NOT NULL,
  `member_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `to_type` varchar(255) NOT NULL,
  `to_id` char(36) NOT NULL,
  `body` mediumtext,
  `seen_in_id` text,
  `deleted_in_id` text,
  `sort_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages_colors`
--

CREATE TABLE `chat_messages_colors` (
  `id` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `to_type` varchar(255) NOT NULL,
  `to_id` char(36) NOT NULL,
  `message_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages_files`
--

CREATE TABLE `chat_messages_files` (
  `id` char(36) NOT NULL,
  `chat_id` char(36) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `sent_by_id` char(36) NOT NULL,
  `deleted_in_id` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '0001_01_01_000000_create_users_table', 1),
(12, '0001_01_01_000001_create_cache_table', 1),
(13, '0001_01_01_000002_create_jobs_table', 1),
(14, '2025_02_28_043619_create_chat_messages_table', 1),
(15, '2025_02_28_043637_create_chat_messages_files_table', 1),
(16, '2025_02_28_043729_create_chat_messages_colors_table', 1),
(17, '2025_02_28_043744_create_chat_contacts_table', 1),
(18, '2025_02_28_043805_create_chat_archiveds_table', 1),
(19, '2025_02_28_043817_create_chat_groups_table', 1),
(20, '2025_02_28_043828_create_chat_groups_members_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Vzn4p2A60jHl5FOaFvEYosXI1vS9lUeG0Fd1uczM', '9e51884c-15c0-40c4-93dc-61e924278345', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY0tSV2dudlZjUTNHVzlvV2FxSkNHbGtCSWx3YVRMY0dZNGFpemkxayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO3M6MzY6IjllNTE4ODRjLTE1YzAtNDBjNC05M2RjLTYxZTkyNDI3ODM0NSI7fQ==', 1740735577);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `last_seen` datetime NOT NULL DEFAULT '2025-02-28 08:08:58',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `active_status`, `is_online`, `last_seen`, `remember_token`, `created_at`, `updated_at`) VALUES
('9e51884c-15c0-40c4-93dc-61e924278345', 'Fikri Nurmaila', 'fikriisfluffy@gmail.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'LrUUL6qY0b', '2025-02-28 01:09:22', '2025-02-28 01:09:23'),
('9e51884c-2dd4-4555-857c-7bc5d1f618c2', 'Enrico Klocko', 'linda51@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'C41IrFpMWq', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-379a-4fec-bd8c-ff580a1286ab', 'Mr. Deshawn Beier DVM', 'jones.mazie@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'pX8HxWrM4G', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-40eb-4aec-92b7-3ce5f5bd8569', 'Cheyenne Keeling DDS', 'josianne.larson@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'TVH9xrJbpw', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-4b7a-48f1-a5e6-7ecd48626648', 'Ms. Electa Koch V', 'asia39@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'nCSX8krY5a', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-54c4-4576-be35-bc9fffe5066d', 'Karolann Bogisich', 'armstrong.jacynthe@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'mRVJuMOJ4d', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-748d-44cf-b247-44df85b552d3', 'Delaney O\'Keefe', 'ystanton@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'AASiBPxC3x', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-88a3-4aaa-8b0b-75a212d82afc', 'Maida Kirlin', 'mozell45@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'QK7ZRABRHk', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-b11e-4284-9b67-c8b2f00e9835', 'Jett Green DDS', 'lulu42@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'vfxrAdfWYX', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-c839-4f95-9024-0dfd80feba3d', 'Ayden Feil', 'carey.brekke@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'ZkKsrLU8kS', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-d821-4282-9af7-8cb44768637d', 'Ms. Ara Bosco', 'tavares43@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'TeuUKP7vGM', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-e27c-4922-8fdc-442b2f3734b1', 'Dr. Eve Olson', 'dschroeder@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'wVXFtQHmaN', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-ec00-4f1d-89e5-7c4b7c1ca636', 'Verdie Kautzer', 'chanel87@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'x2zPjvC0yp', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884c-f65c-465d-8909-c7bc24b0c3bd', 'Prof. Beverly Swift V', 'keon92@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'wc9BcgzxGN', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884d-0a3a-485c-ae81-423a79dbb0b5', 'Jaylon Johns', 'vernie31@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', '6DMsQ1cIdz', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884d-1f78-4f4c-bc08-3a682bab462c', 'Mrs. Abigale Mayer', 'armstrong.giovanni@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'XktwQ1VlGf', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884d-29ff-4bd5-aea6-c230e5675bc4', 'Kaci Senger', 'umante@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', '6K9dRIyJZF', '2025-02-28 01:09:22', '2025-02-28 01:09:22'),
('9e51884d-3357-49ad-8a14-3392b62d2147', 'Melyssa Okuneva', 'wjenkins@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', '8CiUL4QCXI', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-3de0-4d62-941c-9f6dc24bfb21', 'Charles Huel', 'nina.oberbrunner@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'TDgpCFo2Lm', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-472e-46c6-b4d2-593d763e9414', 'Prof. Annette Harris', 'marcel.bechtelar@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'x2gVnSB9MD', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-51c7-44c5-ace2-68fc7256ce4c', 'Ken Weber', 'emard.raven@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'IbyQ7GsoTY', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-5b0f-485f-9b92-a15df433f591', 'Ms. Aleen Price', 'marietta.okeefe@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'exOp5yHXex', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-659e-4d90-9f47-0cc460b508f7', 'Isadore Kling V', 'raegan.bednar@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'qs5QLTo9xH', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-6eed-45c6-92ef-64ef9c5cf3d9', 'Dr. Sim Morar MD', 'jones.benedict@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'XgwGEWw01G', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-7981-4223-b56f-42b1f67bf49b', 'Jaron Becker', 'genesis.bailey@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'ANkiv5q8Jj', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-82cb-4e9b-b5e2-158adb6f31e2', 'Roselyn Kling', 'doyle.luigi@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'eP5eWon0c7', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-8d5d-4b00-a574-231258fc676b', 'Ansley McCullough II', 'sienna.weimann@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'mvZ4HZZYL8', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-96b0-482f-8af3-973aee1df8ae', 'Gus McDermott', 'sydnie43@example.net', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'OwEDX7YRfh', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-a136-4480-998f-06364d86c23a', 'Reta Herman', 'amira49@example.com', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', '37Fnufu21t', '2025-02-28 01:09:23', '2025-02-28 01:09:23'),
('9e51884d-aa8c-48e8-89e1-24dfd56c3f49', 'Lelah Johnston', 'antonia.schaefer@example.org', '2025-02-28 01:09:22', '$2y$12$nwCkKehGO4lLWBU6re8oD.KYJ6LsSa8P4OhqR4350ClM27Ecyybg6', NULL, 1, 0, '2025-02-28 08:08:58', 'J5Je2S3XNj', '2025-02-28 01:09:23', '2025-02-28 01:09:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `chat_archiveds`
--
ALTER TABLE `chat_archiveds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_archiveds_from_type_from_id_index` (`from_type`,`from_id`);

--
-- Indexes for table `chat_contacts`
--
ALTER TABLE `chat_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_contacts_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_groups`
--
ALTER TABLE `chat_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_groups_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `chat_groups_members`
--
ALTER TABLE `chat_groups_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_groups_members_group_id_foreign` (`group_id`),
  ADD KEY `chat_groups_members_member_id_foreign` (`member_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `chat_messages_from_id_foreign` (`from_id`);

--
-- Indexes for table `chat_messages_colors`
--
ALTER TABLE `chat_messages_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_colors_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `chat_messages_colors_from_id_foreign` (`from_id`);

--
-- Indexes for table `chat_messages_files`
--
ALTER TABLE `chat_messages_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_files_chat_id_foreign` (`chat_id`),
  ADD KEY `chat_messages_files_sent_by_id_foreign` (`sent_by_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_contacts`
--
ALTER TABLE `chat_contacts`
  ADD CONSTRAINT `chat_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chat_groups`
--
ALTER TABLE `chat_groups`
  ADD CONSTRAINT `chat_groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chat_groups_members`
--
ALTER TABLE `chat_groups_members`
  ADD CONSTRAINT `chat_groups_members_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `chat_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_groups_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `chat_groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages_colors`
--
ALTER TABLE `chat_messages_colors`
  ADD CONSTRAINT `chat_messages_colors_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages_files`
--
ALTER TABLE `chat_messages_files`
  ADD CONSTRAINT `chat_messages_files_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_messages_files_sent_by_id_foreign` FOREIGN KEY (`sent_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
