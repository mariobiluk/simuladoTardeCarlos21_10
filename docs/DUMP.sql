-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: db_flysafe
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `agendamentos`
--

DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos` (
  `codAgendamento` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `idCliente` int NOT NULL,
  `idDrone` int NOT NULL,
  PRIMARY KEY (`codAgendamento`),
  KEY `idCliente` (`idCliente`),
  KEY `idDrone` (`idDrone`),
  CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`idDrone`) REFERENCES `drones` (`codDrone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
INSERT INTO `agendamentos` VALUES (1,'2026-10-10','13:00:00',1,1),(2,'2026-11-11','15:00:00',2,2),(3,'2026-12-12','17:00:00',3,3),(4,'2027-01-01','14:00:00',4,4);
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'mario','mario@gmail','U2FsdGVkX18faqcRlETypnOVElrWnae2x7JJSU7T8Lg=','U2FsdGVkX1+aKkuvMs5L8sh9i4K2Yk3USBeWyhWnziU=','48999545106'),(2,'eliel','eliel@gmail','U2FsdGVkX18OHaBjan3y+86TFHmm6hbPu6l1Ek1z0s0=','U2FsdGVkX19jvTzUTSDtUAPkVCuNKckwYxYLC7FEvZA=','48999947925'),(3,'fabio','fabio@gmail','U2FsdGVkX1+Ub2vesaqJ47051bRT1n/Dij6amx3H/yw=','U2FsdGVkX18JEh7S5D2WUsVPmWIEXvs2oUIoL1bYCKk=','48999956523'),(4,'ariel','ariel@gmail','U2FsdGVkX1/bfpyrviO0e/b6lEQSGyca24CuM2AoS3w=','U2FsdGVkX1/oKtX6BE/3as/JUFVqVwl4imjv70o9h7w=','48999545106'),(5,'matheus','matheus@gmail.com','U2FsdGVkX1/Jf+NSJcIJcXePlYtNj/6JVAgrVcace14=','U2FsdGVkX1+eoypN7IdPxnczBvtk6HOsLgohCjwiNSI=','48999545105');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drones`
--

DROP TABLE IF EXISTS `drones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drones` (
  `codDrone` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `numSerie` int NOT NULL,
  `tipoServico` varchar(255) NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`codDrone`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `drones_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drones`
--

LOCK TABLES `drones` WRITE;
/*!40000 ALTER TABLE `drones` DISABLE KEYS */;
INSERT INTO `drones` VALUES (1,'quevoa','dedrone',6767,'manutencao',1),(2,'quepaira','dosdrone',6868,'revisao',2),(3,'queflutua','didrones',6969,'inspecao',3),(4,'kificanoar','dehelice',7070,'manutencao',4);
/*!40000 ALTER TABLE `drones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21 15:59:14
