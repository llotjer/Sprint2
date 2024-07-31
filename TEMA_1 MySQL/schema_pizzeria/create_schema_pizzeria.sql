-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria
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
-- Table structure for table `botiga`
--

DROP TABLE IF EXISTS `botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botiga` (
  `id_botiga` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `adreça` varchar(45) NOT NULL,
  `CP` varchar(45) NOT NULL,
  `localitat` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_botiga`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiga`
--

LOCK TABLES `botiga` WRITE;
/*!40000 ALTER TABLE `botiga` DISABLE KEYS */;
INSERT INTO `botiga` VALUES (1,'Pizza World','carrer blah, num n, local 2','08002','BCN','BCN');
/*!40000 ALTER TABLE `botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `idx_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'Begudes'),(2,'Oferta'),(4,'Pizzes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom1` varchar(45) NOT NULL,
  `cognom2` varchar(45) DEFAULT NULL,
  `adreça` varchar(100) NOT NULL,
  `CP` varchar(45) NOT NULL,
  `localitat` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `idx_nom` (`nom`),
  KEY `id_botiga_idx` (`botiga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Xavier','Reynal','Boix','carrer blah, num n, pis p, porta t','08001','BCN','BCN','933256325',0),(2,'Santi','Reynal','Dighero','carrer blah, num n, pis p, porta t','08001','BCN','BCN','933256325',0),(3,'Virgina','Dighero','Lassalle','carrer blah, num n, pis p, porta t','65412','Quilmes','BAIRES','005411428',0),(4,'Júlia','Reynal','Dighero','carrer blah, num n, pis p, porta t','97541','Organyà','Alt Urgell','972145124',0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `id_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `tipus` enum('local','domicili') NOT NULL,
  `botiga_id` int(11) NOT NULL DEFAULT 1,
  `client_id` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comanda`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2024-07-30 13:09:17','domicili',1,2,0),(2,'2024-07-30 13:12:03','domicili',1,1,0),(3,'2024-07-30 13:12:47','domicili',1,3,0),(4,'2024-07-30 13:14:09','local',1,0,1);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom1` varchar(45) NOT NULL,
  `cognom2` varchar(45) NOT NULL,
  `NIF` varchar(45) NOT NULL,
  `telf` varchar(9) NOT NULL,
  `tipus` enum('cuiner','repartidor') NOT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id_empleat`),
  UNIQUE KEY `botiga_id_botiga_UNIQUE` (`botiga_id`),
  KEY `idx_nom` (`nom`),
  KEY `idx_nif` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'Joan','Peret','Valls','32653265k','932563254','repartidor',0);
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `id_producte` int(11) NOT NULL AUTO_INCREMENT,
  `tipus` enum('pizza','hamburguesa','beguda') NOT NULL,
  `nom` varchar(45) NOT NULL,
  `descripcio` varchar(45) NOT NULL,
  `imatge` mediumblob DEFAULT NULL,
  `preu` decimal(5,2) NOT NULL,
  `botiga_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id_producte`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` VALUES (1,'beguda','Moritz 7','cervesa rossa',NULL,2.85,1,1),(2,'beguda','Vichy','Aigua amb gas',NULL,3.15,1,1),(3,'beguda','Cocacola','Refresc amb gas',NULL,2.10,1,1),(4,'pizza','Margarita','Pizza amb tomàquet, mozzarella i orénga',NULL,11.25,1,1),(5,'pizza','Alemana','Pizza amb rodanxes de frankfurt, mostassa, ce',NULL,14.25,1,1),(6,'pizza','Caprese','Pizza amb alfàbrega, tomàquet en rodanxes i m',NULL,16.50,1,1);
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes_comanda`
--

DROP TABLE IF EXISTS `productes_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes_comanda` (
  `comanda_id` int(11) NOT NULL,
  `producte_id` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes_comanda`
--

LOCK TABLES `productes_comanda` WRITE;
/*!40000 ALTER TABLE `productes_comanda` DISABLE KEYS */;
INSERT INTO `productes_comanda` VALUES (1,2,4),(1,4,2),(4,6,1),(4,1,2),(2,1,4),(2,5,2),(3,4,2),(3,2,2);
/*!40000 ALTER TABLE `productes_comanda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-31 10:03:24
