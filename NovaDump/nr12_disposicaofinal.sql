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
-- Table structure for table `disposicaofinal`
--

DROP TABLE IF EXISTS `disposicaofinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disposicaofinal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposicaofinal`
--

LOCK TABLES `disposicaofinal` WRITE;
/*!40000 ALTER TABLE `disposicaofinal` DISABLE KEYS */;
INSERT INTO `disposicaofinal` VALUES (1,'SEM PROTEÇÃO INTEGRAL','Identificado ponto de perigo SEM PROTEÇÃO INTEGRAL, permitindo o acesso de forma voluntária e involuntária.'),(2,'COM PROTEÇÃO PARCIAL','Identificado ponto de perigo COM PROTEÇÃO PARCIAL, ao qual pode ser acessado de forma voluntária e involuntária.'),(3,'COM PROTEÇÃO INTEGRAL','Identificado ponto de perigo COM PROTEÇÃO INTEGRAL, inibindo o acesso de forma voluntária e involuntária.'),(4,'Parecer Técnico 1','Para que a operação da máquina se torne segura, de acordo com as medidas estabelecidas pela NR-12 os pontos de perigo devem receber proteções integrais conforme esta apreciação de risco e de acordo com o estabelecido pela Secretaria de Inspeção do Trabalho - SIT - e pela Associação Brasileira de Normas Técnicas - ABNT.'),(5,'Parecer Técnico 2','A operação da máquina é considerada segura, de acordo com as medidas estabelecidas pela NR-12 e pela Secretaria de Inspeção do Trabalho - SIT - e pela Associação Brasileira de Normas Técnicas - ABNT.');
/*!40000 ALTER TABLE `disposicaofinal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 22:26:18
