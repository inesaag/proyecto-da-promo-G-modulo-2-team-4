CREATE DATABASE  IF NOT EXISTS `bho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bho`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bho
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `premios_oscar`
--

DROP TABLE IF EXISTS `premios_oscar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premios_oscar` (
  `id_pelicula` int NOT NULL,
  `id_actor` int NOT NULL,
  `id_actriz` int NOT NULL,
  `id_ceremonia` int NOT NULL AUTO_INCREMENT,
  `año_ceremonia` year DEFAULT NULL,
  `mejor_pelicula` varchar(200) DEFAULT NULL,
  `mejor_director` varchar(100) DEFAULT NULL,
  `mejor_actor` varchar(150) DEFAULT NULL,
  `mejor_actriz` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_ceremonia`),
  KEY `fkid_pelicula_oscar` (`id_pelicula`),
  KEY `fkid_actor` (`id_actor`),
  KEY `fkid_actriz` (`id_actriz`),
  CONSTRAINT `fkid_actor` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`),
  CONSTRAINT `fkid_actriz` FOREIGN KEY (`id_actriz`) REFERENCES `actores` (`id_actor`),
  CONSTRAINT `fkid_pelicula_oscar` FOREIGN KEY (`id_pelicula`) REFERENCES `api` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premios_oscar`
--

LOCK TABLES `premios_oscar` WRITE;
/*!40000 ALTER TABLE `premios_oscar` DISABLE KEYS */;
/*!40000 ALTER TABLE `premios_oscar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 16:24:43
