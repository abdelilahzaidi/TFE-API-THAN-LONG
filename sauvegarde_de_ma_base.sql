-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: api
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
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `programId` int DEFAULT NULL,
  `grade` enum('0 CAP','1er CAP','2├¿me CAP','3├¿me CAP','1├¿re DAN','2├¿me DAN','3├¿me DAN','4├¿me DAN','1├¿re DAN MASTER','2├¿me DAN MASTER','3├¿me DAN MASTER','4├¿me DAN MASTER') NOT NULL DEFAULT '0 CAP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_0226ebdefb259058335bc8d5b7` (`programId`),
  CONSTRAINT `FK_0226ebdefb259058335bc8d5b74` FOREIGN KEY (`programId`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,1,'0 CAP'),(2,2,'0 CAP'),(3,3,'0 CAP');
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
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period`
--

LOCK TABLES `period` WRITE;
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
INSERT INTO `period` VALUES (1,'2023-2024'),(2,'2021-2022'),(3,'2020-2021'),(4,'2025-2026');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Ceinture blue 0 cap','bbzbzbzbzbzbzbzzbzbz'),(2,'Ceinture blue 1 cap','bbzbzbzbzbzbzbzzbzbz'),(3,'Ceinture blue 2 cap','bbzbzbzbzbzbzbzzbzbz'),(4,'Ceinture blue 3 cap','bbzbzbzbzbzbzbzzbzbz'),(5,'Ceinture blue 0 cap','bbzbzbzbzbzbzbzzbzbz'),(6,'Ceinture blue 1er cap','bbzbzbzbzbzbzbzzbzbz'),(7,'Ceinture blue 2├¿me cap','bbzbzbzbzbzbzbzzbzbz');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'PROFESSOR'),(2,'SuperVisor');
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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Super m├⌐chant'),(2,'Super dragon'),(3,'zaidi Abdelilah'),(4,'Super voshin');
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
-- Table structure for table `user_cour`
--

DROP TABLE IF EXISTS `user_cour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cour` (
  `user_id` int NOT NULL,
  `cour_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`cour_id`),
  KEY `IDX_aa80493654c4f36c3adcfae2ca` (`user_id`),
  KEY `IDX_995e2307d7b07dc91d60bcfefb` (`cour_id`),
  CONSTRAINT `FK_995e2307d7b07dc91d60bcfefb7` FOREIGN KEY (`cour_id`) REFERENCES `cour` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aa80493654c4f36c3adcfae2ca7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cour`
--

LOCK TABLES `user_cour` WRITE;
/*!40000 ALTER TABLE `user_cour` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cour` ENABLE KEYS */;
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
  KEY `IDX_32a6fc2fcb019d8e3a8ace0f55` (`role_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'rorona','zorro','male','1984-12-29 00:00:00','Rue des coteaux 181',0,'2023-09-16 23:11:04','0483004-929','zorro@hotmail.com','$2b$12$YeJD.4p45c6KGSv2bKP4TecSI3SR1XJu//l6VQaFrQ3ALhiBzL4wO','admin',1);
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

-- Dump completed on 2023-09-17 14:23:11
