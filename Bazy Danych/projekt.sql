-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plywanie
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `klasa_sportowa`
--

DROP TABLE IF EXISTS `klasa_sportowa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasa_sportowa` (
  `id_klasa_sportowa` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  PRIMARY KEY (`id_klasa_sportowa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasa_sportowa`
--

LOCK TABLES `klasa_sportowa` WRITE;
/*!40000 ALTER TABLE `klasa_sportowa` DISABLE KEYS */;
INSERT INTO `klasa_sportowa` VALUES (1,'Mistrzowska Międzynarodowa'),(2,'Mistrzowska'),(3,'II'),(4,'I'),(5,'17-18'),(6,'16');
/*!40000 ALTER TABLE `klasa_sportowa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klub`
--

DROP TABLE IF EXISTS `klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klub` (
  `id_klub` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `id_region` int NOT NULL,
  PRIMARY KEY (`id_klub`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `klub_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` VALUES (1,'AGH Kraków',1),(2,'Fala Krasnik',2),(3,'MKP Szczecin',3),(4,'As Roma Nuoto',4),(5,'Paris Aqua',6),(6,'New York Swimming Club',5),(7,'Unia Oświęcim',1);
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraj`
--

DROP TABLE IF EXISTS `kraj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kraj` (
  `id_kraj` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  PRIMARY KEY (`id_kraj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraj`
--

LOCK TABLES `kraj` WRITE;
/*!40000 ALTER TABLE `kraj` DISABLE KEYS */;
INSERT INTO `kraj` VALUES (1,'Polska'),(2,'Włochy'),(3,'USA'),(4,'Francja');
/*!40000 ALTER TABLE `kraj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `id_kraj` int NOT NULL,
  PRIMARY KEY (`id_region`),
  KEY `id_kraj` (`id_kraj`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`id_kraj`) REFERENCES `kraj` (`id_kraj`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Malopolska',1),(2,'Lubelskie',1),(3,'Zachodniopomorskie',1),(4,'Lacjum',2),(5,'Nowy York',3),(6,'Ille de France',4);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `styl`
--

DROP TABLE IF EXISTS `styl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `styl` (
  `id_styl` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  PRIMARY KEY (`id_styl`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styl`
--

LOCK TABLES `styl` WRITE;
/*!40000 ALTER TABLE `styl` DISABLE KEYS */;
INSERT INTO `styl` VALUES (1,'Motylkowy'),(2,'Grzbietowy'),(3,'Klasyczny'),(4,'Dowolny'),(5,'Zmienny');
/*!40000 ALTER TABLE `styl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zawodnik`
--

DROP TABLE IF EXISTS `zawodnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zawodnik` (
  `id_zawodnik` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `nazwisko` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `nr_licencji` int NOT NULL,
  `miejscowosc_urodzenia` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `status` enum('Aktywny','Kontuzja','Wygasl','Zawieszony') CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci DEFAULT NULL,
  `id_klub` int DEFAULT NULL,
  `id_klasa_sportowa` int DEFAULT NULL,
  `rocznik` int DEFAULT NULL,
  `id_styl` int DEFAULT NULL,
  PRIMARY KEY (`id_zawodnik`),
  KEY `id_klub` (`id_klub`),
  KEY `id_klasa_sportowa` (`id_klasa_sportowa`),
  KEY `id_styl` (`id_styl`),
  CONSTRAINT `zawodnik_ibfk_1` FOREIGN KEY (`id_klub`) REFERENCES `klub` (`id_klub`) ON DELETE CASCADE,
  CONSTRAINT `zawodnik_ibfk_2` FOREIGN KEY (`id_klasa_sportowa`) REFERENCES `klasa_sportowa` (`id_klasa_sportowa`) ON DELETE CASCADE,
  CONSTRAINT `zawodnik_ibfk_3` FOREIGN KEY (`id_styl`) REFERENCES `styl` (`id_styl`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zawodnik`
--

LOCK TABLES `zawodnik` WRITE;
/*!40000 ALTER TABLE `zawodnik` DISABLE KEYS */;
INSERT INTO `zawodnik` VALUES (1,'Piotr','Borsuk',71339,'Krasnik','Aktywny',1,1,2003,1),(2,'Szymon','Zubr',78238,'Oświecim','Zawieszony',1,2,2000,1),(3,'Sophia','Fleur',51323,'Paryz','Aktywny',5,4,2001,4),(4,'Luca','Tasso',42070,'Rzym','Wygasl',4,3,2001,1),(5,'Jack','Adams',22391,'Copacabana','Zawieszony',6,6,2003,5),(6,'Konrad','Kobra',78562,'Puławy','Kontuzja',3,5,1989,1),(7,'Przemek','Polewka',12476,'Katowice','Kontuzja',7,6,2005,3),(8,'John','Prince',34567,'Monteppelier','Aktywny',5,3,2002,2);
/*!40000 ALTER TABLE `zawodnik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24  7:30:25
