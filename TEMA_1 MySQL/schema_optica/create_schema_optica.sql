-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: optica_cul_ampolla
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `adreça`
--

DROP TABLE IF EXISTS `adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adreça` (
  `id_adreça` int(11) NOT NULL AUTO_INCREMENT,
  `carrer` varchar(100) NOT NULL COMMENT 'Holds addresse''s street name',
  `numero` int(11) NOT NULL COMMENT 'Holds addresse''s street number',
  `pis` int(11) DEFAULT NULL COMMENT 'Holds adresse''s floor number',
  `porta` varchar(2) NOT NULL COMMENT 'Holds addresse''s door''s flat',
  `ciutat` varchar(45) NOT NULL COMMENT 'Holds addresse''s city name',
  `CP` varchar(10) NOT NULL COMMENT 'Holds addresse''s postal code',
  `pais` varchar(45) NOT NULL COMMENT 'Holds addresse''s country''s name',
  PRIMARY KEY (`id_adreça`),
  KEY `idx_cp` (`CP`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adreça`
--

LOCK TABLES `adreça` WRITE;
/*!40000 ALTER TABLE `adreça` DISABLE KEYS */;
INSERT INTO `adreça` VALUES (0,'Roc Boronat',11,2,'4','Barcelona','08002','Esp'),(1,'Agustina Saragossa',3,5,'D','BCN','08017','Esp'),(2,'Ulala',3,NULL,'B','Paris','3B123','Fr'),(3,'Carme',18,3,'A','Cerdanyola del Vallés','18254','Esp'),(4,'Jarl',4,0,'C','San Diego','654123','USA');
/*!40000 ALTER TABLE `adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_te_adreça`
--

DROP TABLE IF EXISTS `client_te_adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_te_adreça` (
  `id_client_te_adreça` int(11) NOT NULL AUTO_INCREMENT,
  `adreça_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id_client_te_adreça`,`adreça_id`,`clients_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_te_adreça`
--

LOCK TABLES `client_te_adreça` WRITE;
/*!40000 ALTER TABLE `client_te_adreça` DISABLE KEYS */;
INSERT INTO `client_te_adreça` VALUES (1,1,1);
/*!40000 ALTER TABLE `client_te_adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `telf` varchar(9) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data_registre` datetime NOT NULL DEFAULT current_timestamp(),
  `adreça_id` int(11) NOT NULL,
  PRIMARY KEY (`id_clients`),
  KEY `idx_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Xavi','932050082','xreynalb@gmail.com','2024-07-30 16:16:36',1),(2,'Jordi','933256235','jordiordi@gmail.com','2024-07-30 19:18:46',3);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id_empleats` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom` varchar(45) NOT NULL,
  `NIF` varchar(45) NOT NULL,
  PRIMARY KEY (`id_empleats`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'Jander','Clander','654132415H');
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL COMMENT 'Holds dealer''s name',
  `telf` varchar(45) NOT NULL COMMENT 'Holds dealer''s telf',
  `fax` varchar(45) NOT NULL COMMENT 'Holds dealer''s fax',
  `nif` varchar(45) NOT NULL COMMENT 'Holds dealer''s NIF',
  `adreça_id` int(11) NOT NULL,
  PRIMARY KEY (`id_proveidor`),
  UNIQUE KEY `proveidor_nif_UNIQUE` (`nif`),
  KEY `idx_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'GRAL.OPTICA','935474585','graloptica@graloptica.es','B65254145M',0),(2,'Aflelú','123456789','aflelu@aflelu.fr','A5015040L',2),(3,'Oakley','001542136','oakley@oakley.us','6541245R',4);
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor_te_adreça`
--

DROP TABLE IF EXISTS `proveidor_te_adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor_te_adreça` (
  `id_proveidor_te_adreça` int(11) NOT NULL AUTO_INCREMENT,
  `proveidor_id` int(11) NOT NULL,
  `adreça_id` int(11) NOT NULL,
  PRIMARY KEY (`id_proveidor_te_adreça`,`proveidor_id`,`adreça_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor_te_adreça`
--

LOCK TABLES `proveidor_te_adreça` WRITE;
/*!40000 ALTER TABLE `proveidor_te_adreça` DISABLE KEYS */;
INSERT INTO `proveidor_te_adreça` VALUES (1,1,0),(2,2,3);
/*!40000 ALTER TABLE `proveidor_te_adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL COMMENT 'Holds glasse''s brand',
  `graduació_esq` varchar(45) NOT NULL COMMENT 'Holds glasse''s left grad',
  `graduació_dret` varchar(45) NOT NULL COMMENT 'Holds glasse''s right grad',
  `montura` enum('pasta','flotant','metàl·lica') NOT NULL COMMENT 'Holds glasse''s structure',
  `color_montura` varchar(45) NOT NULL COMMENT 'Holds glasse''s structure color',
  `color_vidre` varchar(45) NOT NULL COMMENT 'Holds glasse''s glass color',
  `preu` decimal(10,2) NOT NULL COMMENT 'Holds glasse''s price',
  `proveidor_id` int(11) NOT NULL,
  PRIMARY KEY (`id_ulleres`),
  KEY `idx_preu` (`preu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,'Ray-Ban','0.5','1.25','pasta','negre','transllúcid',95.90,1),(2,'CHIN-CHIN','0.25','0.25','flotant','groc','transparent',15.90,2),(3,'Encoder','0.00','0.00','metàl·lica','negre','vermell',192.00,3);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventes` (
  `id_ventes` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `ulleres_id` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ventes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (1,1,1,1,'2019-05-14 19:15:06'),(2,1,2,1,'2020-02-05 19:15:06');
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-30 19:49:46
