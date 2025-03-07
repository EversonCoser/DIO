-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ordemservico
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDCLIENTE` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `ENDEREÇO` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `TELEFONE` varchar(45) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `UK_CLIENTE_CPF` (`CPF`),
  UNIQUE KEY `UK_CLIENTE_EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'11122233344','João Silva','Rua A, 123','joao.silva@email.com','999999999'),(2,'22233344455','Maria Santos','Rua B, 456','maria.santos@email.com','888888888'),(3,'33344455566','Carlos Lima','Rua C, 789','carlos.lima@email.com','777777777');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `IDEQUIPE` int NOT NULL AUTO_INCREMENT,
  `NOMEEQUIPE` varchar(45) NOT NULL,
  PRIMARY KEY (`IDEQUIPE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Equipe 1'),(2,'Equipe 2');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_mecanico`
--

DROP TABLE IF EXISTS `equipe_mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_mecanico` (
  `EQUIPE_ID` int NOT NULL,
  `MECANICO_ID` int NOT NULL,
  PRIMARY KEY (`EQUIPE_ID`,`MECANICO_ID`),
  KEY `FK_MECANICO_EQUIPE_MECANICO` (`MECANICO_ID`),
  CONSTRAINT `FK_EQUIPE_EQUIPE_MECANICO` FOREIGN KEY (`EQUIPE_ID`) REFERENCES `equipe` (`IDEQUIPE`),
  CONSTRAINT `FK_MECANICO_EQUIPE_MECANICO` FOREIGN KEY (`MECANICO_ID`) REFERENCES `mecanico` (`IDMECANICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_mecanico`
--

LOCK TABLES `equipe_mecanico` WRITE;
/*!40000 ALTER TABLE `equipe_mecanico` DISABLE KEYS */;
INSERT INTO `equipe_mecanico` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `equipe_mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `IDMECANICO` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `ENDEREÇO` varchar(45) NOT NULL,
  `TELEFONE` varchar(45) NOT NULL,
  `ESPECIALIDADE` varchar(45) NOT NULL,
  PRIMARY KEY (`IDMECANICO`),
  UNIQUE KEY `UK_MECANICO_CPF` (`CPF`),
  UNIQUE KEY `UK_MECANICO_EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'11111111111','Pedro Ferreira','pedro.ferreira@email.com','Rua D, 100','666666666','Motor'),(2,'22222222222','Ana Costa','ana.costa@email.com','Rua E, 200','555555555','Suspensão'),(3,'33333333333','Lucas Mendes','lucas.mendes@email.com','Rua F, 300','444444444','Freios');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico` (
  `IDORDEM_SERVICO` int NOT NULL AUTO_INCREMENT,
  `DATA_ENTRADA` date NOT NULL,
  `DATA_SAIDA` date DEFAULT NULL,
  `STATUS` enum('EM ESPERA','ATENDENDO','FINALIZADO') NOT NULL,
  `VALOR_TOTAL` decimal(10,2) NOT NULL,
  `VEICULO_ID` int NOT NULL,
  `MECANICOS_ID` int NOT NULL,
  PRIMARY KEY (`IDORDEM_SERVICO`),
  KEY `FK_VEICULO_ORDEM_SERVICO` (`VEICULO_ID`),
  KEY `FK_EQUIPE_MECANICO_ORDEM_SERVICO` (`MECANICOS_ID`),
  CONSTRAINT `FK_EQUIPE_MECANICO_ORDEM_SERVICO` FOREIGN KEY (`MECANICOS_ID`) REFERENCES `equipe_mecanico` (`EQUIPE_ID`),
  CONSTRAINT `FK_VEICULO_ORDEM_SERVICO` FOREIGN KEY (`VEICULO_ID`) REFERENCES `veiculo` (`IDVEICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (1,'2025-02-01','2025-02-05','FINALIZADO',1500.00,1,1),(2,'2025-02-10',NULL,'EM ESPERA',800.00,2,2),(3,'2025-02-15','2025-02-20','FINALIZADO',1200.00,3,2);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico_peca`
--

DROP TABLE IF EXISTS `ordem_servico_peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico_peca` (
  `ORDEM_SERVICO_PECA_ID` int NOT NULL,
  `PECA_ID` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `VALOR_TOTAL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ORDEM_SERVICO_PECA_ID`,`PECA_ID`),
  KEY `FK_PECA_ORDEM_SERVICO_PECA` (`PECA_ID`),
  CONSTRAINT `FK_ORDEM_SERVICO_ORDEM_SERVICO_PECA` FOREIGN KEY (`ORDEM_SERVICO_PECA_ID`) REFERENCES `ordem_servico` (`IDORDEM_SERVICO`),
  CONSTRAINT `FK_PECA_ORDEM_SERVICO_PECA` FOREIGN KEY (`PECA_ID`) REFERENCES `pecas` (`IDPECA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_peca`
--

LOCK TABLES `ordem_servico_peca` WRITE;
/*!40000 ALTER TABLE `ordem_servico_peca` DISABLE KEYS */;
INSERT INTO `ordem_servico_peca` VALUES (1,1,2,100.00),(2,2,1,150.00),(3,3,1,200.00);
/*!40000 ALTER TABLE `ordem_servico_peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico_servico`
--

DROP TABLE IF EXISTS `ordem_servico_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico_servico` (
  `ORDEM_SERVICO_ID` int NOT NULL,
  `SERVICO_ID` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `VALOR_TOTAL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ORDEM_SERVICO_ID`,`SERVICO_ID`),
  KEY `FK_SERVICO_ORDEM_SERVICO_SERVICO` (`SERVICO_ID`),
  CONSTRAINT `FK_ORDEM_SERVICO_ORDEM_SERVICO_SERVICO` FOREIGN KEY (`ORDEM_SERVICO_ID`) REFERENCES `ordem_servico` (`IDORDEM_SERVICO`),
  CONSTRAINT `FK_SERVICO_ORDEM_SERVICO_SERVICO` FOREIGN KEY (`SERVICO_ID`) REFERENCES `servico` (`IDSERVICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_servico`
--

LOCK TABLES `ordem_servico_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico_servico` VALUES (1,1,1,100.00),(2,2,2,160.00),(3,3,1,500.00);
/*!40000 ALTER TABLE `ordem_servico_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `IDPECA` int NOT NULL AUTO_INCREMENT,
  `NOMEPECA` varchar(45) NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDPECA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (1,'Filtro de óleo',50.00),(2,'Pastilha de freio',150.00),(3,'Correia dentada',200.00);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `IDSERVICO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(45) NOT NULL,
  `VALORMAODEOBRA` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDSERVICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Troca de óleo',100.00),(2,'Alinhamento',80.00),(3,'Revisão geral',500.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `IDVEICULO` int NOT NULL AUTO_INCREMENT,
  `PLACA` varchar(10) NOT NULL,
  `MODELO` varchar(45) DEFAULT NULL,
  `ANO` int DEFAULT NULL,
  `MARCA` varchar(45) DEFAULT NULL,
  `CLIENTE_ID` int NOT NULL,
  PRIMARY KEY (`IDVEICULO`),
  KEY `FK_CLIENTE_VEICULO` (`CLIENTE_ID`),
  CONSTRAINT `FK_CLIENTE_VEICULO` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `cliente` (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'ABC1234','Civic',2020,'Honda',1),(2,'DEF5678','Corolla',2019,'Toyota',2),(3,'GHI9012','Golf',2018,'Volkswagen',3);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 10:08:18
