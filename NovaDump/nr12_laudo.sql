CREATE DATABASE  IF NOT EXISTS `nr12` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nr12`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: nr12
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `laudo`
--

DROP TABLE IF EXISTS `laudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laudo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `usuarioId` int NOT NULL,
  `maquinaId` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `data_inicial` date DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `limitesMaquina` longtext,
  `imagem` varchar(100) DEFAULT NULL,
  `responsavelId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Laudos_Usuarios_idx` (`usuarioId`),
  KEY `fk_Laudos_Maquina1_idx` (`maquinaId`),
  KEY `fk_Laudos_UsuarioResponsavel_idx` (`responsavelId`),
  CONSTRAINT `fk_Laudos_Maquina1` FOREIGN KEY (`maquinaId`) REFERENCES `maquina` (`id`),
  CONSTRAINT `fk_Laudos_UsuarioResponsavel` FOREIGN KEY (`responsavelId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_Laudos_Usuarios` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laudo`
--

LOCK TABLES `laudo` WRITE;
/*!40000 ALTER TABLE `laudo` DISABLE KEYS */;
INSERT INTO `laudo` VALUES (92,'JOI-EMB-001-2021',8,8,'Em Elaboração','2021-08-14',NULL,'teste',NULL,NULL);
/*!40000 ALTER TABLE `laudo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 22:26:14
