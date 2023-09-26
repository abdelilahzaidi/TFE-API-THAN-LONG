---- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: thdb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abonnement`
--

DROP TABLE IF EXISTS `abonnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonnement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  `typeAbonnementId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_da5a57340e96d68027ba83c2e99` (`userId`),
  KEY `FK_eec5e572ddf2ae52dee662346ba` (`typeAbonnementId`),
  CONSTRAINT `FK_da5a57340e96d68027ba83c2e99` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_eec5e572ddf2ae52dee662346ba` FOREIGN KEY (`typeAbonnementId`) REFERENCES `typeabonnement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonnement`
--

LOCK TABLES `abonnement` WRITE;
/*!40000 ALTER TABLE `abonnement` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cour`
--

DROP TABLE IF EXISTS `cour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) NOT NULL,
  `lieuId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c6c233191bde5b3a58f06b14ad8` (`lieuId`),
  CONSTRAINT `FK_c6c233191bde5b3a58f06b14ad8` FOREIGN KEY (`lieuId`) REFERENCES `lieu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cour`
--

LOCK TABLES `cour` WRITE;
/*!40000 ALTER TABLE `cour` DISABLE KEYS */;
/*!40000 ALTER TABLE `cour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datecour`
--

DROP TABLE IF EXISTS `datecour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datecour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCour` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datecour`
--

LOCK TABLES `datecour` WRITE;
/*!40000 ALTER TABLE `datecour` DISABLE KEYS */;
/*!40000 ALTER TABLE `datecour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL,
  `eventTypeId` int DEFAULT NULL,
  `lieuId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3b674f340d59a5fc144f2229763` (`eventTypeId`),
  KEY `FK_14191a2fba2b928e3528c01e03a` (`lieuId`),
  CONSTRAINT `FK_14191a2fba2b928e3528c01e03a` FOREIGN KEY (`lieuId`) REFERENCES `lieu` (`id`),
  CONSTRAINT `FK_3b674f340d59a5fc144f2229763` FOREIGN KEY (`eventTypeId`) REFERENCES `type_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateEnvoie` datetime NOT NULL,
  `etatDePaiement` tinyint NOT NULL,
  `montant` int NOT NULL,
  `abonnementId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9b912c4dd857f1de2ba01dddfaf` (`abonnementId`),
  CONSTRAINT `FK_9b912c4dd857f1de2ba01dddfaf` FOREIGN KEY (`abonnementId`) REFERENCES `abonnement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heureDebut` datetime NOT NULL,
  `heureFin` datetime NOT NULL,
  `jour` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaire`
--

LOCK TABLES `horaire` WRITE;
/*!40000 ALTER TABLE `horaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `horaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) NOT NULL,
  `programId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_0226ebdefb259058335bc8d5b7` (`programId`),
  CONSTRAINT `FK_0226ebdefb259058335bc8d5b74` FOREIGN KEY (`programId`) REFERENCES `program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieu`
--

LOCK TABLES `lieu` WRITE;
/*!40000 ALTER TABLE `lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `senderId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bc096b4e18b1f9508197cd98066` (`senderId`),
  CONSTRAINT `FK_bc096b4e18b1f9508197cd98066` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_receivers_users`
--

DROP TABLE IF EXISTS `message_receivers_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_receivers_users` (
  `messageId` int NOT NULL,
  `usersId` int NOT NULL,
  PRIMARY KEY (`messageId`,`usersId`),
  KEY `IDX_26b2a421502805c90c5a40669e` (`messageId`),
  KEY `IDX_5e7a8e6eab7ee9bb20ee981cd5` (`usersId`),
  CONSTRAINT `FK_26b2a421502805c90c5a40669e7` FOREIGN KEY (`messageId`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_5e7a8e6eab7ee9bb20ee981cd51` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_receivers_users`
--

LOCK TABLES `message_receivers_users` WRITE;
/*!40000 ALTER TABLE `message_receivers_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_receivers_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_user`
--

DROP TABLE IF EXISTS `message_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_user` (
  `user_id` int NOT NULL,
  `message_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`message_id`),
  KEY `IDX_fb5c11a1a5452abfc4c4f5c63c` (`user_id`),
  KEY `IDX_d43e65f8723678362878b29a7c` (`message_id`),
  CONSTRAINT `FK_d43e65f8723678362878b29a7cc` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  CONSTRAINT `FK_fb5c11a1a5452abfc4c4f5c63c7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_user`
--

LOCK TABLES `message_user` WRITE;
/*!40000 ALTER TABLE `message_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period`
--

LOCK TABLES `period` WRITE;
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
/*!40000 ALTER TABLE `period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_period`
--

DROP TABLE IF EXISTS `role_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_period` (
  `period_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`period_id`,`role_id`),
  KEY `IDX_cd71be299676fd4b6b62e8c747` (`period_id`),
  KEY `IDX_31868bd36f50fb4889cdef99b0` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_period`
--

LOCK TABLES `role_period` WRITE;
/*!40000 ALTER TABLE `role_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horaireId` int DEFAULT NULL,
  `courId` int DEFAULT NULL,
  `dateCourId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_800af8f9032c1de9c5693a33fa3` (`horaireId`),
  KEY `FK_96e974e1445864ff3fb11a5f72c` (`courId`),
  KEY `FK_d5464f8e061a3334e1027fb486a` (`dateCourId`),
  CONSTRAINT `FK_800af8f9032c1de9c5693a33fa3` FOREIGN KEY (`horaireId`) REFERENCES `horaire` (`id`),
  CONSTRAINT `FK_96e974e1445864ff3fb11a5f72c` FOREIGN KEY (`courId`) REFERENCES `cour` (`id`),
  CONSTRAINT `FK_d5464f8e061a3334e1027fb486a` FOREIGN KEY (`dateCourId`) REFERENCES `datecour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_user` (
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `IDX_ed60beadf0e6dffb2b9a5d164e` (`team_id`),
  KEY `IDX_32437794ab1a0519530561ea15` (`user_id`),
  CONSTRAINT `FK_32437794ab1a0519530561ea159` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_event`
--

DROP TABLE IF EXISTS `type_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeEvent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_event`
--

LOCK TABLES `type_event` WRITE;
/*!40000 ALTER TABLE `type_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeabonnement`
--

DROP TABLE IF EXISTS `typeabonnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeabonnement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `tarif` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeabonnement`
--

LOCK TABLES `typeabonnement` WRITE;
/*!40000 ALTER TABLE `typeabonnement` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeabonnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_event` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `IDX_e39ffa0fac3ca53674b151e259` (`user_id`),
  KEY `IDX_dbb01827843862e452b97065d5` (`event_id`),
  CONSTRAINT `FK_dbb01827843862e452b97065d5c` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e39ffa0fac3ca53674b151e2591` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_event`
--

LOCK TABLES `user_event` WRITE;
/*!40000 ALTER TABLE `user_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_period`
--

DROP TABLE IF EXISTS `user_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_period` (
  `period_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`period_id`,`user_id`),
  KEY `IDX_74de2342ff31b566caf33655d2` (`period_id`),
  KEY `IDX_a15f0e7463dae4335a3413f047` (`user_id`),
  CONSTRAINT `FK_a15f0e7463dae4335a3413f0474` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_period`
--

LOCK TABLES `user_period` WRITE;
/*!40000 ALTER TABLE `user_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_d0e5815877f7395a198a4cb0a4` (`user_id`),
  KEY `IDX_32a6fc2fcb019d8e3a8ace0f55` (`role_id`),
  CONSTRAINT `FK_d0e5815877f7395a198a4cb0a46` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seance`
--

DROP TABLE IF EXISTS `user_seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seance` (
  `seance_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`seance_id`,`user_id`),
  KEY `IDX_2cf2507b497c1392b95fe82b13` (`seance_id`),
  KEY `IDX_36e02856bc1ba62c0d0119e614` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seance`
--

LOCK TABLES `user_seance` WRITE;
/*!40000 ALTER TABLE `user_seance` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `birthDate` datetime NOT NULL,
  `adress` varchar(255) NOT NULL,
  `actif` tinyint NOT NULL DEFAULT '1',
  `attributionDate` datetime NOT NULL,
  `gsm` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('member','admin') NOT NULL DEFAULT 'member',
  `levelId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  KEY `FK_2735b8ee71c0fa7f68190fe61b5` (`levelId`),
  CONSTRAINT `FK_2735b8ee71c0fa7f68190fe61b5` FOREIGN KEY (`levelId`) REFERENCES `level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 23:10:15
