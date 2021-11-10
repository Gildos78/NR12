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
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(55) NOT NULL,
  `tipodispositivoId` int NOT NULL,
  `respostaCorreta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perguntas_tipodispositivo1_idx` (`tipodispositivoId`),
  KEY `fk_pergunta_resposta1_idx` (`respostaCorreta`),
  CONSTRAINT `fk_pergunta_resposta1` FOREIGN KEY (`respostaCorreta`) REFERENCES `resposta` (`id`),
  CONSTRAINT `fk_perguntas_tipodispositivo1` FOREIGN KEY (`tipodispositivoId`) REFERENCES `tipodispositivo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
INSERT INTO `pergunta` VALUES (9,'Instalado',5,1),(10,'Localizado em zona segura',5,1),(11,'Passível em acionamento acidental',5,2),(12,'Instalado',6,1),(13,'Localizado em zona segura',6,1),(14,'Passível de acionamento acidental',6,2),(15,'Instalado',7,1),(16,'Localizado em Zona Segura',7,2),(17,'Passível de acionamento acidental',7,1),(18,'Passível de burla',7,1),(19,'Está identificado em língua portuguesa',7,2),(20,'Acionado em EBT ou por dupla isolação',7,2),(21,'Há dispositivos instalados',8,1),(22,'O dispositivo é usado para partida/parada',8,2),(23,'Pode ser acionado por outro operador',8,1),(24,'Exige rearme manual',8,1),(25,'Apresenta retenção após acionado',8,1),(26,'É passível de burla',8,2),(27,'Está identificado em língua portuguesa',8,1),(28,'Acionado em extrabaixa tensão',8,1),(29,'Passível de burla',6,2),(30,'Está identificado em língua portuguesa',6,1),(31,'Acionado em EBT ou por dupla isolação',6,1),(32,'Passível de burla',5,2),(33,'Está identificado em língua portuguesa',5,1),(34,'Acionado em EBT ou por dupla isolação',5,1);
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 22:26:16
