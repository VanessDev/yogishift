-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 17 avr. 2026 à 08:24
-- Version du serveur : 8.4.3
-- Version de PHP : 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `yogishift`
--

-- --------------------------------------------------------

--
-- Structure de la table `applications`
--

CREATE TABLE `applications` (
  `id_application` int NOT NULL,
  `job_offer_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `motivationMessage` text,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `applications`
--

INSERT INTO `applications` (`id_application`, `job_offer_id`, `teacher_id`, `status`, `motivationMessage`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 'pending', 'Je suis parfaite pour ce job', '2026-03-23 15:08:37', NULL),
(2, 2, 2, 'pending', 'Très motivée', '2026-03-23 15:08:37', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `availabilities`
--

CREATE TABLE `availabilities` (
  `id_availability` int NOT NULL,
  `teacher_id` int NOT NULL,
  `dayOfWeek` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `conversations`
--

CREATE TABLE `conversations` (
  `id_conversation` int NOT NULL,
  `teacher_id` int NOT NULL,
  `studio_id` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `job_offer_id` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `conversations`
--

INSERT INTO `conversations` (`id_conversation`, `teacher_id`, `studio_id`, `createdAt`, `job_offer_id`, `shift_id`) VALUES
(1, 1, 1, '2026-03-23 15:08:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `favorite_job_offers`
--

CREATE TABLE `favorite_job_offers` (
  `teacher_id` int NOT NULL,
  `job_offer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `favorite_job_offers`
--

INSERT INTO `favorite_job_offers` (`teacher_id`, `job_offer_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `favorite_shifts`
--

CREATE TABLE `favorite_shifts` (
  `teacher_id` int NOT NULL,
  `shift_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `favorite_shifts`
--

INSERT INTO `favorite_shifts` (`teacher_id`, `shift_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `job_offers`
--

CREATE TABLE `job_offers` (
  `id_job_offer` int NOT NULL,
  `studio_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `contractType` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salaryMin` decimal(10,2) DEFAULT NULL,
  `salaryMax` decimal(10,2) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ;

--
-- Déchargement des données de la table `job_offers`
--

INSERT INTO `job_offers` (`id_job_offer`, `studio_id`, `title`, `description`, `contractType`, `location`, `salaryMin`, `salaryMax`, `startDate`, `endDate`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Cours Vinyasa matin', NULL, NULL, 'Bordeaux', 50.00, NULL, NULL, NULL, '2026-03-23 15:08:37', NULL),
(2, 2, 'Cours Hatha soir', NULL, NULL, 'Paris', 60.00, NULL, NULL, NULL, '2026-03-23 15:08:37', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `job_offer_yoga_styles`
--

CREATE TABLE `job_offer_yoga_styles` (
  `job_offer_id` int NOT NULL,
  `yoga_style_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id_message` int NOT NULL,
  `conversation_id` int NOT NULL,
  `sender_user_id` int NOT NULL,
  `content` text,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `messageType` enum('text','system') DEFAULT 'text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id_message`, `conversation_id`, `sender_user_id`, `content`, `createdAt`, `messageType`) VALUES
(1, 1, 1, 'Bonjour !', '2026-03-23 15:08:37', 'text'),
(2, 1, 3, 'Bonjour, merci pour votre message', '2026-03-23 15:08:37', 'text');

-- --------------------------------------------------------

--
-- Structure de la table `shifts`
--

CREATE TABLE `shifts` (
  `id_shift` int NOT NULL,
  `studio_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `paymentRate` decimal(10,2) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` enum('open','assigned','completed','cancelled') DEFAULT 'open',
  `teacher_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `shifts`
--

INSERT INTO `shifts` (`id_shift`, `studio_id`, `date`, `startTime`, `endTime`, `paymentRate`, `location`, `status`, `teacher_id`) VALUES
(1, 1, '2026-04-01', '09:00:00', '10:00:00', 40.00, 'Bordeaux', 'open', NULL),
(2, 2, '2026-04-02', '18:00:00', '19:00:00', 45.00, 'Paris', 'open', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `shift_yoga_styles`
--

CREATE TABLE `shift_yoga_styles` (
  `shift_id` int NOT NULL,
  `yoga_style_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `studios`
--

CREATE TABLE `studios` (
  `id_studio` int NOT NULL,
  `owner_user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `studios`
--

INSERT INTO `studios` (`id_studio`, `owner_user_id`, `name`, `description`, `location`, `website`, `createdAt`, `updatedAt`, `isVerified`) VALUES
(1, 3, 'Zen Studio', 'Studio calme', 'Bordeaux', NULL, '2026-03-23 15:08:37', NULL, 0),
(2, 4, 'Flow Studio', 'Studio dynamique', 'Paris', NULL, '2026-03-23 15:08:37', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `studio_yoga_styles`
--

CREATE TABLE `studio_yoga_styles` (
  `studio_id` int NOT NULL,
  `yoga_style_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `teacher_profiles`
--

CREATE TABLE `teacher_profiles` (
  `id_teacher` int NOT NULL,
  `user_id` int NOT NULL,
  `displayName` varchar(100) DEFAULT NULL,
  `bio` text,
  `location` varchar(255) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `teacher_profiles`
--

INSERT INTO `teacher_profiles` (`id_teacher`, `user_id`, `displayName`, `bio`, `location`, `experience`, `updatedAt`) VALUES
(1, 1, 'Alice Yoga', 'Prof vinyasa', 'Bordeaux', 3, NULL),
(2, 2, 'Sophie Zen', 'Prof hatha', 'Paris', 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `teacher_yoga_styles`
--

CREATE TABLE `teacher_yoga_styles` (
  `teacher_id` int NOT NULL,
  `yoga_style_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `teacher_yoga_styles`
--

INSERT INTO `teacher_yoga_styles` (`teacher_id`, `yoga_style_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userType` enum('teacher','studio','admin') NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `userType`, `createdAt`, `deletedAt`) VALUES
(1, 'teacher1@mail.com', 'password', 'teacher', '2026-03-23 15:08:36', NULL),
(2, 'teacher2@mail.com', 'password', 'teacher', '2026-03-23 15:08:36', NULL),
(3, 'studio1@mail.com', 'password', 'studio', '2026-03-23 15:08:36', NULL),
(4, 'studio2@mail.com', 'password', 'studio', '2026-03-23 15:08:36', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `yoga_styles`
--

CREATE TABLE `yoga_styles` (
  `id_yoga_style` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `yoga_styles`
--

INSERT INTO `yoga_styles` (`id_yoga_style`, `name`, `description`) VALUES
(1, 'Vinyasa', NULL),
(2, 'Hatha', NULL),
(3, 'Yin', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id_application`),
  ADD UNIQUE KEY `job_offer_id` (`job_offer_id`,`teacher_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Index pour la table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`id_availability`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Index pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id_conversation`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`,`studio_id`),
  ADD KEY `studio_id` (`studio_id`),
  ADD KEY `job_offer_id` (`job_offer_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Index pour la table `favorite_job_offers`
--
ALTER TABLE `favorite_job_offers`
  ADD PRIMARY KEY (`teacher_id`,`job_offer_id`),
  ADD KEY `job_offer_id` (`job_offer_id`);

--
-- Index pour la table `favorite_shifts`
--
ALTER TABLE `favorite_shifts`
  ADD PRIMARY KEY (`teacher_id`,`shift_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Index pour la table `job_offers`
--
ALTER TABLE `job_offers`
  ADD PRIMARY KEY (`id_job_offer`),
  ADD KEY `studio_id` (`studio_id`),
  ADD KEY `idx_job_location` (`location`);

--
-- Index pour la table `job_offer_yoga_styles`
--
ALTER TABLE `job_offer_yoga_styles`
  ADD PRIMARY KEY (`job_offer_id`,`yoga_style_id`),
  ADD KEY `yoga_style_id` (`yoga_style_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_user_id` (`sender_user_id`);

--
-- Index pour la table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id_shift`),
  ADD KEY `studio_id` (`studio_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `idx_shift_date` (`date`);

--
-- Index pour la table `shift_yoga_styles`
--
ALTER TABLE `shift_yoga_styles`
  ADD PRIMARY KEY (`shift_id`,`yoga_style_id`),
  ADD KEY `yoga_style_id` (`yoga_style_id`);

--
-- Index pour la table `studios`
--
ALTER TABLE `studios`
  ADD PRIMARY KEY (`id_studio`),
  ADD KEY `owner_user_id` (`owner_user_id`);

--
-- Index pour la table `studio_yoga_styles`
--
ALTER TABLE `studio_yoga_styles`
  ADD PRIMARY KEY (`studio_id`,`yoga_style_id`),
  ADD KEY `yoga_style_id` (`yoga_style_id`);

--
-- Index pour la table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD PRIMARY KEY (`id_teacher`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_teacher_location` (`location`);

--
-- Index pour la table `teacher_yoga_styles`
--
ALTER TABLE `teacher_yoga_styles`
  ADD PRIMARY KEY (`teacher_id`,`yoga_style_id`),
  ADD KEY `yoga_style_id` (`yoga_style_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `yoga_styles`
--
ALTER TABLE `yoga_styles`
  ADD PRIMARY KEY (`id_yoga_style`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `applications`
--
ALTER TABLE `applications`
  MODIFY `id_application` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `availabilities`
--
ALTER TABLE `availabilities`
  MODIFY `id_availability` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id_conversation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `job_offers`
--
ALTER TABLE `job_offers`
  MODIFY `id_job_offer` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id_shift` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `studios`
--
ALTER TABLE `studios`
  MODIFY `id_studio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  MODIFY `id_teacher` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `yoga_styles`
--
ALTER TABLE `yoga_styles`
  MODIFY `id_yoga_style` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offers` (`id_job_offer`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE;

--
-- Contraintes pour la table `availabilities`
--
ALTER TABLE `availabilities`
  ADD CONSTRAINT `availabilities_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE;

--
-- Contraintes pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id_studio`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_ibfk_3` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offers` (`id_job_offer`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_ibfk_4` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id_shift`) ON DELETE CASCADE;

--
-- Contraintes pour la table `favorite_job_offers`
--
ALTER TABLE `favorite_job_offers`
  ADD CONSTRAINT `favorite_job_offers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_job_offers_ibfk_2` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offers` (`id_job_offer`) ON DELETE CASCADE;

--
-- Contraintes pour la table `favorite_shifts`
--
ALTER TABLE `favorite_shifts`
  ADD CONSTRAINT `favorite_shifts_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_shifts_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id_shift`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job_offers`
--
ALTER TABLE `job_offers`
  ADD CONSTRAINT `job_offers_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id_studio`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job_offer_yoga_styles`
--
ALTER TABLE `job_offer_yoga_styles`
  ADD CONSTRAINT `job_offer_yoga_styles_ibfk_1` FOREIGN KEY (`job_offer_id`) REFERENCES `job_offers` (`id_job_offer`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_offer_yoga_styles_ibfk_2` FOREIGN KEY (`yoga_style_id`) REFERENCES `yoga_styles` (`id_yoga_style`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id_conversation`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id_studio`) ON DELETE CASCADE,
  ADD CONSTRAINT `shifts_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE SET NULL;

--
-- Contraintes pour la table `shift_yoga_styles`
--
ALTER TABLE `shift_yoga_styles`
  ADD CONSTRAINT `shift_yoga_styles_ibfk_1` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id_shift`) ON DELETE CASCADE,
  ADD CONSTRAINT `shift_yoga_styles_ibfk_2` FOREIGN KEY (`yoga_style_id`) REFERENCES `yoga_styles` (`id_yoga_style`) ON DELETE CASCADE;

--
-- Contraintes pour la table `studios`
--
ALTER TABLE `studios`
  ADD CONSTRAINT `studios_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `studio_yoga_styles`
--
ALTER TABLE `studio_yoga_styles`
  ADD CONSTRAINT `studio_yoga_styles_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id_studio`) ON DELETE CASCADE,
  ADD CONSTRAINT `studio_yoga_styles_ibfk_2` FOREIGN KEY (`yoga_style_id`) REFERENCES `yoga_styles` (`id_yoga_style`) ON DELETE CASCADE;

--
-- Contraintes pour la table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD CONSTRAINT `teacher_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `teacher_yoga_styles`
--
ALTER TABLE `teacher_yoga_styles`
  ADD CONSTRAINT `teacher_yoga_styles_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_yoga_styles_ibfk_2` FOREIGN KEY (`yoga_style_id`) REFERENCES `yoga_styles` (`id_yoga_style`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
