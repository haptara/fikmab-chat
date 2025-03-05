-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2025 at 08:44 AM
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_28_043619_create_chat_messages_table', 1),
(5, '2025_02_28_043637_create_chat_messages_files_table', 1),
(6, '2025_02_28_043729_create_chat_messages_colors_table', 1),
(7, '2025_02_28_043744_create_chat_contacts_table', 1),
(8, '2025_02_28_043805_create_chat_archiveds_table', 1),
(9, '2025_02_28_043817_create_chat_groups_table', 1),
(10, '2025_02_28_043828_create_chat_groups_members_table', 1);

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
('EonUHrFhPY9KpYgHKV3ezRMlkadRrdtzqObj1ZaX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlZpbU4zR2dtNTZ3dWlOOUxqY1pPYjVuRWhzRTNCU1ZjbUdTMm8zZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fX0=', 1741164178);

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
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `bio` text,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `last_seen` datetime NOT NULL DEFAULT '2025-03-05 11:25:25',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `jenis_kelamin`, `status`, `bio`, `active_status`, `is_online`, `last_seen`, `remember_token`, `created_at`, `updated_at`) VALUES
('9e5b4cc7-7746-49f1-b662-8020a0ee3cfb', 'Fikri Tamvan Sekaleee', 'fikriisfluffy@gmail.com', '2025-03-05 04:41:06', '$2y$12$rohq6HU0FDaat64U1VnFd.JjuNBAWidXt3RoKJmZC6HjS.vCNPW1C', '/storage/avatars/46f89ddc-94c1-4a1d-aa1e-dd2afff75486.jpg', 'Laki-Laki', 'sibuk', 'Qui sequi qui explicabo ab. Voluptate possimus rerum maxime debitis reprehenderit et et. Enim iure quis suscipit quia aspernatur. Aut facilis necessitatibus vel molestias est.', 1, 0, '2025-03-05 11:25:25', 'fEceRRY6cu2MCcgeoblaNL6SleiturqqEBWpyMjsckoMnoA4EnCxrb8WPAZN', '2025-03-05 04:41:14', '2025-03-05 07:46:45'),
('9e5b4cc8-5e5f-4a48-b5d5-4812913fe6d6', 'Ajimin Januar', 'hasanah.syahrini@example.net', '2025-03-05 04:41:06', '$2y$12$YJjH5sWygDiRecN4SAmX8uSNYuN5FT95HO799zSVVRqenthR5cj8y', '5f2ec1', 'Laki-Laki', 'sibuk', 'Voluptatem facilis cum occaecati debitis est. Totam deserunt et necessitatibus placeat repudiandae et. Minus laudantium quidem velit eos et aliquam nihil. Quo ab nostrum nulla quo.', 1, 0, '2025-03-05 11:25:25', 'YZSLO60z6r', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-6bd4-4385-8274-b925e0bdda34', 'Rina Hariyah', 'sari.hidayanto@example.net', '2025-03-05 04:41:06', '$2y$12$fYFHc6v7xehSMApWpnxSi.bJmU85i9ei6HjjyLeFnOE32DAUOynN6', '21ab2b', 'Perempuan', 'sibuk', 'Et vero incidunt vitae itaque. Rem a laborum quis dolores et qui molestiae. Veritatis voluptatibus ut voluptatem dicta sed pariatur optio. Possimus quas neque sunt ea exercitationem quia et.', 1, 0, '2025-03-05 11:25:25', 'J52GAHg2dE', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-795c-4895-b0f7-597f89151080', 'Salimah Wahyuni', 'yulianti.cahyadi@example.org', '2025-03-05 04:41:07', '$2y$12$uosvn3VhTHOf6ECPlVM5UeZWteeF5Xre3zr8kSrD9fjbgm9PJTqae', '1c7777', 'Perempuan', 'sibuk', 'Ea id tempore neque et quas aut enim. Sint laborum accusantium occaecati aut impedit enim. Occaecati dolores porro iusto voluptates. Dolorem ad et dolorum explicabo. Architecto autem tempore et.', 1, 0, '2025-03-05 11:25:25', 'SjeNzhPgdN', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-87a0-4efa-88c3-7fc66fe53a97', 'Lamar Rangga Wijaya S.E.', 'silvia.agustina@example.com', '2025-03-05 04:41:07', '$2y$12$tzONOswGj0LyPuxMZnxS3uzlD3W9C5DNXVoVEQSkEVkLNdSo9LXhG', 'c43ac4', 'Laki-Laki', 'sibuk', 'Est dolore eum saepe quidem error reprehenderit. Voluptatem et nostrum praesentium assumenda eligendi quia numquam vitae. Aut minus aut at ut vel tempore.', 1, 0, '2025-03-05 11:25:25', 'MiN7ZM3MXJ', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-9532-4dc0-9032-070fdf332e57', 'Jono Pradana', 'wisnu.nasyidah@example.org', '2025-03-05 04:41:07', '$2y$12$MGDXqEN7WauG2DcrzHFM2Oxnm.lShtwOYskEPiexqFdm3i8muHUqO', 'eef0b0', 'Laki-Laki', 'sibuk', 'Consequuntur quis delectus rerum vero vel ut saepe. Incidunt recusandae et qui id. Atque odio quam aut sunt eaque.', 1, 0, '2025-03-05 11:25:25', '3fWgRhHPCM', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-9f7c-44ea-ade2-2763bbca8990', 'Prasetya Hutapea', 'jwahyuni@example.net', '2025-03-05 04:41:07', '$2y$12$7d/KAzy/fP2Z9gi6kMR6i.md8xY.kGGN3ptpxDdlVq12l2Zs1mAO6', '8ba6e0', 'Laki-Laki', 'sibuk', 'Assumenda veniam voluptatibus et consectetur. Quod autem nisi nobis esse eum.', 1, 0, '2025-03-05 11:25:25', 'waJvcyGKxz', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-a911-495f-9615-23bb0700fb92', 'Hilda Hariyah S.E.', 'bahuwarna25@example.org', '2025-03-05 04:41:07', '$2y$12$bXBWzTWqu0PFlGPZ0ZX/buZhTpuqKxXOewGpRkaN5G4nunAI3GXm.', '7435f5', 'Perempuan', 'sibuk', 'Praesentium est a earum. Omnis nulla id ut vero. Saepe fugit molestiae ad accusantium cupiditate laudantium aliquid.', 1, 0, '2025-03-05 11:25:25', 'u5xuAQ74w1', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-b35a-4282-aac3-5c902b70b1d5', 'Rika Andriani', 'napitupulu.hasna@example.org', '2025-03-05 04:41:08', '$2y$12$PTncKNHaB4tYNzVkfsgOde7Pw4T9/sWBW2I/vCgXIYj8G9AyKRxSu', '72cbed', 'Perempuan', 'sibuk', 'Inventore nam similique quia doloremque. Id laudantium ea corrupti et. Adipisci est voluptas iste eaque cumque tempore.', 1, 0, '2025-03-05 11:25:25', 'gAtwhmRXjN', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-bcee-4b38-9e43-51779920c4cb', 'Wahyu Mandala S.Pt', 'dwulandari@example.net', '2025-03-05 04:41:08', '$2y$12$ILEkguj.ywAoJiiLRSkOyODS/.hLKq4UaXnvrEkP9N/VQBzY0jdIK', 'f10f53', 'Laki-Laki', 'sibuk', 'Quis nisi et maiores sapiente aut quam. Qui et magni provident vel. Velit voluptas atque culpa recusandae fugit.', 1, 0, '2025-03-05 11:25:25', 'kIh4KEa12K', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-c739-4ba5-a1e9-d4c4b779bf41', 'Farhunnisa Pia Hassanah', 'paulin.manullang@example.org', '2025-03-05 04:41:08', '$2y$12$nIpt9.iu2wc3K7oJngtjX.xlVULPHcT/W6taeRYum.2UKcHyEOaOy', 'ec4a7f', 'Perempuan', 'sibuk', 'Ullam quos nemo culpa. Nemo est quia dignissimos est ut ab. Cum rerum temporibus odit minus dolores molestias consequatur atque. Ut mollitia cumque et ratione.', 1, 0, '2025-03-05 11:25:25', 'viAjzt4nLC', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-d0e7-46fc-8d7b-18c8005f57f7', 'Wasis Harsaya Pangestu', 'hardi.yolanda@example.com', '2025-03-05 04:41:08', '$2y$12$W46Jj/xDRWC.lQhgYrpZy.vY5ronHFQLrHpDLlyJSsozMfUQlD6Gu', '0c3e37', 'Laki-Laki', 'sibuk', 'A sint dolor quia mollitia dolorem. Nam ut et aut voluptatibus. Quia accusantium animi quis deleniti itaque.', 1, 0, '2025-03-05 11:25:25', 'zpePfjwOzr', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-db1c-4d39-a499-fd2fa57e3930', 'Wulan Widiastuti', 'mitra.wacana@example.org', '2025-03-05 04:41:08', '$2y$12$9R8EyKYMMlEZlseEEiQBsOgp24UNt0QX.OJvoa3rz0MEPU31ERTZa', '76f889', 'Perempuan', 'sibuk', 'Non distinctio doloremque quod animi fugit. Vero tempore reprehenderit asperiores. Et molestias et explicabo debitis deserunt rem deserunt.', 1, 0, '2025-03-05 11:25:25', 'Z29eSqPbY6', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-e4a8-4d05-801a-bb64336341f0', 'Mulyono Joko Suryono', 'radika80@example.net', '2025-03-05 04:41:09', '$2y$12$MyNjdydFBMfo.MTyngkXYezrwmEUn97VG4pObMqh0E.Iryv/A.sti', '1581b9', 'Laki-Laki', 'sibuk', 'Voluptates error dolores sit tempora ut fuga. Non quisquam quia velit ad in enim. Sunt possimus aperiam assumenda aut rerum suscipit. Aliquam id quia corporis et nulla dolores ipsum dolore.', 1, 0, '2025-03-05 11:25:25', 'qJkqebk99a', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-eefb-486c-8425-b84547bf6fca', 'Eja Winarno', 'wsantoso@example.com', '2025-03-05 04:41:09', '$2y$12$dVy39cdGYwZ9D/afsgJIquHWTRVJA69D4lk582hHm7VLk5ENy6v1S', 'b89966', 'Laki-Laki', 'sibuk', 'Sed sunt est ratione eligendi deleniti sunt nemo. Quia fugit distinctio autem nihil et eius. At est soluta est. Laboriosam adipisci reiciendis quae quia sapiente. Enim voluptates architecto unde.', 1, 0, '2025-03-05 11:25:25', 'ONUcXAfwV5', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc8-f888-42d1-b864-7ca31f0688aa', 'Kamidin Simbolon', 'salimah.widodo@example.com', '2025-03-05 04:41:09', '$2y$12$ZhP9FT2t0EzXLXJdCkkX7.oJVEdjxWiMUAQEqqFS8jlemjPvQGaLS', 'd6d624', 'Laki-Laki', 'sibuk', 'Neque odio aliquam impedit vel amet praesentium aut reprehenderit. Porro et sed sapiente fuga. Deleniti corrupti aut maxime dolorem ipsa. Incidunt qui molestiae velit similique.', 1, 0, '2025-03-05 11:25:25', 'UrlxCRIe1Y', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-02d6-4e1b-afcb-0f669aaa64e5', 'Anita Yuniar S.E.I', 'genta.habibi@example.org', '2025-03-05 04:41:09', '$2y$12$NgULJt1p5qEJqyGRVjiMZu7tZ5FVxTFNut1lIR9FZxeP11v9lL.9K', '1dcfed', 'Perempuan', 'sibuk', 'Doloribus et nemo laudantium et mollitia consequatur. Id sit sed quasi ipsum illo. Iste quia consequatur deleniti ut. Unde qui et magnam voluptatem.', 1, 0, '2025-03-05 11:25:25', 'tN4dNV3TSd', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-0c6b-4429-bc4a-81d6c879cf22', 'Tami Purnawati', 'lwijaya@example.org', '2025-03-05 04:41:09', '$2y$12$gxZsEjcXOdEgkXEyuk6OReVkuldEB7cSE5hNIrVUYCd6zwUV8Prgu', '4f110d', 'Perempuan', 'sibuk', 'Ut culpa quibusdam vel neque. Veritatis aspernatur reiciendis quas atque et illo. Quos quis natus laborum est.', 1, 0, '2025-03-05 11:25:25', '6bWQKaXx48', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-16b9-4f7d-8418-d19c2002604c', 'Ivan Makuta Samosir M.Ak', 'raisa10@example.com', '2025-03-05 04:41:10', '$2y$12$ow3dgHbxTMp.m3cMbbd4ruy4dq4nSBsY6xQ8zkbLc0dOndZQPPKcC', '04d07b', 'Laki-Laki', 'sibuk', 'Corporis ut quas ut. Molestiae sit qui in aut totam quos. Molestias non quo qui veritatis ut. Molestias provident tempora sint aliquid incidunt et.', 1, 0, '2025-03-05 11:25:25', '7iwnBqFLdi', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-2045-4e0f-93f2-70f7c19b66a1', 'Timbul Widodo', 'praba.sudiati@example.net', '2025-03-05 04:41:10', '$2y$12$MwnHnwMDJcTCCNPhfFyjpeu67HrSl4vFIoiUhLal3TuMA67sfD/Mm', '15cd99', 'Laki-Laki', 'sibuk', 'Dignissimos possimus quisquam ea quod blanditiis repudiandae est sed. Quod voluptates asperiores vero. Nostrum ratione cumque vitae et consequuntur accusamus. Corporis aliquid ipsum dolor labore.', 1, 0, '2025-03-05 11:25:25', 'VGLxNwnZtB', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-42a2-4dd7-abf4-b14ea34e0906', 'Asirwada Irawan', 'galih.rahayu@example.com', '2025-03-05 04:41:10', '$2y$12$ldCi79XXNL1fKixKBcZt9.gVuV1WLb6dRX/3uF0hAx2FltGIyUp7.', '46b49b', 'Laki-Laki', 'sibuk', 'Et quia quam tempore esse laboriosam dicta odit. Aliquam optio alias cum ex. Illum sequi quidem beatae assumenda itaque ut dicta. Ratione sint voluptates exercitationem.', 1, 0, '2025-03-05 11:25:25', 'eTOieUywM6', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-564e-4547-9bb1-494e70ca34d3', 'Zalindra Suartini M.TI.', 'shariyah@example.org', '2025-03-05 04:41:10', '$2y$12$/nz3tJ/E1CUBRLmInS4DLOwGImxCZvG0jAaAcTmpSp4cjLzieh7oy', '4f696c', 'Perempuan', 'sibuk', 'Expedita necessitatibus laboriosam odio ducimus officiis ex omnis. Rerum nihil sed repellendus provident vero quos. Ea nam aut officia at tempora velit rem aspernatur.', 1, 0, '2025-03-05 11:25:25', 'MfqPkPN73F', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-7acb-4771-926d-1002b721cec2', 'Erik Utama Kuswoyo', 'jfarida@example.net', '2025-03-05 04:41:10', '$2y$12$OLxoBPlNdMdYnbKKjxSgReDobkC6g0jl73lK4xcLAEn14Lf63DrpK', '3160e4', 'Laki-Laki', 'sibuk', 'Quis et dolor mollitia. Sed sit ea omnis. Esse numquam temporibus id dolores dicta ut. Quo iusto accusantium quia velit corrupti dignissimos possimus qui.', 1, 0, '2025-03-05 11:25:25', 'ryMaqdtMYm', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-9e88-4cd9-9040-db7dc0f06711', 'Malika Umi Uyainah', 'mulyani.umar@example.com', '2025-03-05 04:41:11', '$2y$12$vUlSh7MzortMwWNPIwYMuupSvpJGzS16hxFGfh3OaCCd6qP1Zen6u', '7d4b0e', 'Perempuan', 'sibuk', 'Dolorum sit magni magni rerum non adipisci ut. Eius esse earum eos. Cum iure quae eos beatae. Cumque itaque animi est voluptatem nostrum.', 1, 0, '2025-03-05 11:25:25', '8mn1hIMKfK', '2025-03-05 04:41:14', '2025-03-05 04:41:14'),
('9e5b4cc9-b6ce-4650-8dd4-fff44f36e76e', 'Michelle Suartini', 'egunarto@example.org', '2025-03-05 04:41:11', '$2y$12$zGIwg4dqEmF3UaVbk71UDusbkveGc1jy/rVcHxzm1JJRWk7MbO9ba', '6180e0', 'Perempuan', 'sibuk', 'Odio adipisci ad mollitia maiores aut dolor libero est. Fugit rerum quibusdam omnis eos. Deserunt rerum quo eaque esse dolor dolor repellendus. Eaque ea blanditiis enim et.', 1, 0, '2025-03-05 11:25:25', 'vBolmayCYr', '2025-03-05 04:41:15', '2025-03-05 04:41:15'),
('9e5b4cc9-d5a8-49be-b7c2-004c0d44a735', 'Jumadi Sabri Winarno', 'umar34@example.org', '2025-03-05 04:41:11', '$2y$12$bkXUskuBtvD4.YwG73mi.uu09pNgdxr/zwe/nSACmqU56MxPsAkUe', '17ba49', 'Laki-Laki', 'sibuk', 'Vel fugit saepe minus sunt. Et quas nam fugiat placeat soluta rerum sequi. Corrupti iusto odit magnam quibusdam nihil. Aut quasi qui culpa odio quod ut consequatur.', 1, 0, '2025-03-05 11:25:25', 'VYn8Lz5FFU', '2025-03-05 04:41:15', '2025-03-05 04:41:15'),
('9e5b4cc9-f14b-46fd-9d7f-71fec6d33f9e', 'Sari Wastuti M.M.', 'qrajata@example.com', '2025-03-05 04:41:11', '$2y$12$.bC2pEIwXfUYgI5kEqGYxONXsegoIZ4BCPHFjMZayRUFAV3nhbRDu', '7e839e', 'Perempuan', 'sibuk', 'Sed cumque nihil neque voluptatem. Eius quia placeat totam maxime iste.', 1, 0, '2025-03-05 11:25:25', 'QC1VTLMyXH', '2025-03-05 04:41:15', '2025-03-05 04:41:15'),
('9e5b4cca-055b-4f64-877d-44c5390a8266', 'Edi Atma Sitorus', 'natsir.nalar@example.org', '2025-03-05 04:41:11', '$2y$12$O/YxVsjgvXHNSJty.KdtX.4f0.DqbdtIVSF6LUUgK85s2jY2GZ2lm', '4e607b', 'Laki-Laki', 'sibuk', 'Sunt veritatis soluta dolores voluptatibus tempore ex facilis. Officiis magnam aut occaecati doloribus sed dignissimos et. Tempore aperiam accusantium cum sit quia velit dolorem.', 1, 0, '2025-03-05 11:25:25', 'MpZfW1zmxY', '2025-03-05 04:41:15', '2025-03-05 04:41:15'),
('9e5b4cca-0eaf-42ab-9bbf-f30fc8e7402b', 'Ghani Siregar', 'safitri.alika@example.org', '2025-03-05 04:41:12', '$2y$12$lME.P9f/D69qtFZiGBwISOUNjMJty.jxm0Ze3jE3gPZnZh06TqJmO', 'f07bf9', 'Laki-Laki', 'sibuk', 'Fugit voluptatem est facere tenetur. Eum enim beatae fuga doloribus et suscipit qui. Ut esse repudiandae minima omnis velit ducimus. Et odit enim vel ea qui iure dolorem.', 1, 0, '2025-03-05 11:25:25', '6qm3xMNz0V', '2025-03-05 04:41:15', '2025-03-05 04:41:15'),
('9e5b4cca-1aec-423e-9edd-685616567f9a', 'Hasna Wahyuni M.Ak', 'lalita.nasyidah@example.net', '2025-03-05 04:41:12', '$2y$12$DxpX/YrMGP.geAQtCujSX.6sealHIkGRBXVI42ftW9OpF0yMsQPsy', 'b5ca8b', 'Perempuan', 'sibuk', 'Consequuntur et sit illo nostrum. Dolore veritatis vitae voluptatibus. Maiores rerum blanditiis est et nobis perspiciatis.', 1, 0, '2025-03-05 11:25:25', '9tqYCLaIA0', '2025-03-05 04:41:15', '2025-03-05 04:41:15');

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
