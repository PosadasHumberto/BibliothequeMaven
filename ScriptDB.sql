CREATE DATABASE  IF NOT EXISTS `biblioteque` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteque`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteque
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `biblio_livres`
--

DROP TABLE IF EXISTS `biblio_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblio_livres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_biblio` int DEFAULT NULL,
  `id_livre` int DEFAULT NULL,
  `nb_livres` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_biblio_bibliolivres_idx` (`id_biblio`),
  KEY `fk_livres_bibliolivres_idx` (`id_livre`),
  CONSTRAINT `fk_biblio_bibliolivres` FOREIGN KEY (`id_biblio`) REFERENCES `bibliotheques` (`id`),
  CONSTRAINT `fk_livres_bibliolivres` FOREIGN KEY (`id_livre`) REFERENCES `livres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_livres`
--

LOCK TABLES `biblio_livres` WRITE;
/*!40000 ALTER TABLE `biblio_livres` DISABLE KEYS */;
INSERT INTO `biblio_livres` VALUES (1,1,1,10),(2,2,1,10),(3,1,2,10),(4,2,2,10),(5,1,3,10),(6,2,3,10),(7,1,4,10),(8,2,4,10),(9,1,5,10),(10,2,5,10);
/*!40000 ALTER TABLE `biblio_livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliotheques`
--

DROP TABLE IF EXISTS `bibliotheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotheques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) DEFAULT NULL,
  `biblio_livres_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bibliotheques_biblio_livres_idx` (`biblio_livres_id`),
  CONSTRAINT `bibliotheques_biblio_livres` FOREIGN KEY (`biblio_livres_id`) REFERENCES `biblio_livres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotheques`
--

LOCK TABLES `bibliotheques` WRITE;
/*!40000 ALTER TABLE `bibliotheques` DISABLE KEYS */;
INSERT INTO `bibliotheques` VALUES (1,'Bibliotheque 1',NULL),(2,'Bibliotheque 2',NULL);
/*!40000 ALTER TABLE `bibliotheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livres`
--

DROP TABLE IF EXISTS `livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(60) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `auteur` varchar(60) DEFAULT NULL,
  `langue` varchar(45) DEFAULT NULL,
  `editeur` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  `biblio_livres_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `livres_biblio_livres_idx` (`biblio_livres_id`),
  CONSTRAINT `livres_biblio_livres` FOREIGN KEY (`biblio_livres_id`) REFERENCES `livres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livres`
--

LOCK TABLES `livres` WRITE;
/*!40000 ALTER TABLE `livres` DISABLE KEYS */;
INSERT INTO `livres` VALUES (1,'Le petit prince','Roman','Antoine de Saint-Exupéry','Français','Reynal & Hitchcock','Le Petit Prince est une œuvre de langue française, la plus connue d\'Antoine de Saint-Exupéry.','7897opkjhg','2020-12-10 00:00:00',1),(2,'Odyssée','mythologique','Homère','Français','Reynal & Hitchcock','Elle est considérée, avec l’Iliade, comme l\'un des deux « poèmes fondateurs » de la culture grecque antique et comme l’un des plus grands chefs-d’œuvre de la littérature mondiale.','svnfoubhebuo8b74','2020-12-06 00:00:00',2),(3,'Voyage au bout de la nuit','Roman','Louis-Ferdinand Céline','Français','Denoël et Steele','Avec ce livre, l auteur obtient le prix Renaudot, manquant de deux voix le prix Goncourt. Il constitue une œuvre devenue classique du XX siècle, traduite en 37 langues.','righsflrs387','2020-12-09 00:00:00',1),(4,'Paroles 1','Fiction','Jacques Prévert','Français','Le Point du Jour','Les textes de Jacques Prévert ont d\'abord été publiés isolément dans diverses revues depuis les années trente (le Commerce, Bifur, la Révolution surréaliste, Cahiers GLM /Guy Lévis-Mano, Soutes, Cahiers d\'art) avant d\'être regroupés partiellement de façon amateur par des étudiants de Reims à la fin de la guerre','fkutdcli8795','2020-12-08 00:00:00',2),(5,'Madame Bovary','Realisme','Gustave Flaubert','Français','Michel Lévy frères','Après l’échec de La Tentation de Saint Antoine, Louis Bouilhet conseille à Flaubert de prendre comme sujet un fait divers tel que celui du suicide de Delphine Delamare suivi de celui de son époux','fughjf4548754','2020-12-07 00:00:00',1);
/*!40000 ALTER TABLE `livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prets`
--

DROP TABLE IF EXISTS `prets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_bibliolivres` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `date_depart` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `prolongements` int DEFAULT NULL,
  `etat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bibliolivres_prets_idx` (`id_bibliolivres`),
  KEY `fk_user_prets_idx` (`id_user`),
  CONSTRAINT `fk_bibliolivres_prets` FOREIGN KEY (`id_bibliolivres`) REFERENCES `biblio_livres` (`id`),
  CONSTRAINT `fk_user_prets` FOREIGN KEY (`id_user`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prets`
--

LOCK TABLES `prets` WRITE;
/*!40000 ALTER TABLE `prets` DISABLE KEYS */;
/*!40000 ALTER TABLE `prets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'Posadas','Jesus','chinessehp@hotmail.com','12345'),(2,'Rodriguez','Humberto','Humpos@hotmail.com','12345'),(3,'Doe','John','johndoe@hotmail.com','12345'),(4,'Wallace','Rasheed','rwallace@test.com','12345'),(5,'Mbappe','Kilian','kiki@testcom','12345'),(6,'Lewis','Rashard','rlewis@testcom','12345'),(7,'Johnson','Michael','speedup@testcom','12345');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biblioteque'
--

--
-- Dumping routines for database 'biblioteque'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20 12:53:53
