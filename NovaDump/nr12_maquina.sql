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
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clienteId` int NOT NULL,
  `tipomaquinaId` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `numeroserie` varchar(45) DEFAULT NULL,
  `numeropatrimonio` varchar(45) DEFAULT NULL,
  `capacidade` varchar(15) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `fabricante` varchar(45) DEFAULT NULL,
  `setor` varchar(45) DEFAULT NULL,
  `fotofront` varchar(100) DEFAULT NULL,
  `fotole` varchar(100) DEFAULT NULL,
  `fotold` varchar(100) DEFAULT NULL,
  `fotopost` varchar(100) DEFAULT NULL,
  `genero` char(1) NOT NULL DEFAULT 'a',
  PRIMARY KEY (`id`),
  KEY `fk_Maquina_TipoMaquina1_idx` (`tipomaquinaId`),
  KEY `fk_maquinas_cliente1_idx` (`clienteId`),
  CONSTRAINT `fk_Maquina_TipoMaquina1` FOREIGN KEY (`tipomaquinaId`) REFERENCES `tipomaquina` (`id`),
  CONSTRAINT `fk_maquinas_cliente1` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (8,7,8,'Maquina A','222','222','222','222',2010,'222','222',NULL,NULL,NULL,NULL,'a');
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 22:26:12
