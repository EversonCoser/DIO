-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercenovo
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
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `TipoCliente` enum('FISICA','JURIDICA') NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João Silva','FISICA','Rua A, 123'),(2,'Empresa XYZ','JURIDICA','Av. B, 456'),(3,'Maria Souza','FISICA','Rua C, 789'),(4,'Comércio ABC','JURIDICA','Rua D, 321'),(5,'Carlos Lima','FISICA','Av. E, 654'),(6,'João Silva','FISICA','Rua Nova, 789'),(7,'Empresa XYZ','JURIDICA','Av. Comercial, 456');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_pedido`
--

DROP TABLE IF EXISTS `cliente_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_pedido` (
  `Cliente_idCliente` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`,`Pedido_idPedido`),
  KEY `Pedido_idPedido` (`Pedido_idPedido`),
  CONSTRAINT `cliente_has_pedido_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  CONSTRAINT `cliente_has_pedido_ibfk_2` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_pedido`
--

LOCK TABLES `cliente_has_pedido` WRITE;
/*!40000 ALTER TABLE `cliente_has_pedido` DISABLE KEYS */;
INSERT INTO `cliente_has_pedido` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `cliente_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `CodigoDeRastreamento` varchar(45) NOT NULL,
  `Status` enum('PREPARANDO','ENVIADO','ENTREGUE') NOT NULL,
  PRIMARY KEY (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,'AA123456BR','PREPARANDO'),(2,'BB234567BR','ENVIADO'),(3,'CC345678BR','ENTREGUE'),(4,'DD456789BR','ENVIADO'),(5,'EE567890BR','PREPARANDO');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Local` varchar(100) NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Depósito Central'),(2,'Filial Norte'),(3,'Filial Sul'),(4,'Armazém Leste'),(5,'Armazém Oeste');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_has_produto`
--

DROP TABLE IF EXISTS `estoque_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_has_produto` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`,`Produto_idProduto`),
  KEY `Produto_idProduto` (`Produto_idProduto`),
  CONSTRAINT `estoque_has_produto_ibfk_1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`) ON DELETE CASCADE,
  CONSTRAINT `estoque_has_produto_ibfk_2` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_has_produto`
--

LOCK TABLES `estoque_has_produto` WRITE;
/*!40000 ALTER TABLE `estoque_has_produto` DISABLE KEYS */;
INSERT INTO `estoque_has_produto` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `estoque_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `idFormaPagamento` int NOT NULL AUTO_INCREMENT,
  `TipoPagamento` enum('CARTAO','PIX','BOLETO') NOT NULL,
  `Detalhe` varchar(100) NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`idFormaPagamento`),
  KEY `Pedido_idPedido` (`Pedido_idPedido`),
  CONSTRAINT `formapagamento_ibfk_1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (1,'CARTAO','Cartão Visa',1),(2,'PIX','Chave e-mail',2),(3,'BOLETO','Boleto Bancário',3),(4,'CARTAO','Cartão Master',4),(5,'PIX','Chave CPF',5),(6,'PIX','Pagamento via QR Code',1);
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(45) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Tech Eletrônicos','11.111.111/0001-11'),(2,'Moveis & Cia','22.222.222/0001-22'),(3,'EletroBrasil','33.333.333/0001-33'),(4,'Moda Premium','44.444.444/0001-44'),(5,'Doces Finos','55.555.555/0001-55');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_has_produto`
--

DROP TABLE IF EXISTS `fornecedor_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_has_produto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `Produto_idProduto` (`Produto_idProduto`),
  CONSTRAINT `fornecedor_has_produto_ibfk_1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE CASCADE,
  CONSTRAINT `fornecedor_has_produto_ibfk_2` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_has_produto`
--

LOCK TABLES `fornecedor_has_produto` WRITE;
/*!40000 ALTER TABLE `fornecedor_has_produto` DISABLE KEYS */;
INSERT INTO `fornecedor_has_produto` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `fornecedor_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacoescartao`
--

DROP TABLE IF EXISTS `informacoescartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacoescartao` (
  `idInformacoesCartao` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `Limite` decimal(10,2) NOT NULL,
  `Validade` date NOT NULL,
  `PessoaFisica_idPessoaFisica` int DEFAULT NULL,
  `PessoaJuridica_idPessoaJuridica` int DEFAULT NULL,
  PRIMARY KEY (`idInformacoesCartao`),
  KEY `PessoaFisica_idPessoaFisica` (`PessoaFisica_idPessoaFisica`),
  KEY `PessoaJuridica_idPessoaJuridica` (`PessoaJuridica_idPessoaJuridica`),
  CONSTRAINT `informacoescartao_ibfk_1` FOREIGN KEY (`PessoaFisica_idPessoaFisica`) REFERENCES `pessoafisica` (`idPessoaFisica`),
  CONSTRAINT `informacoescartao_ibfk_2` FOREIGN KEY (`PessoaJuridica_idPessoaJuridica`) REFERENCES `pessoajuridica` (`idPessoaJuridica`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacoescartao`
--

LOCK TABLES `informacoescartao` WRITE;
/*!40000 ALTER TABLE `informacoescartao` DISABLE KEYS */;
INSERT INTO `informacoescartao` VALUES (1,'Crédito',5000.00,'2026-12-01',1,NULL),(2,'Débito',2000.00,'2025-08-15',NULL,2),(3,'Crédito',7000.00,'2027-05-10',2,NULL),(4,'Débito',1000.00,'2024-11-30',NULL,1),(5,'Crédito',3000.00,'2025-07-20',3,NULL);
/*!40000 ALTER TABLE `informacoescartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Status` enum('PENDENTE','PAGO','ENVIADO','ENTREGUE','CANCELADO') NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Frete` decimal(10,2) NOT NULL,
  `ValorPedido` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idx_valTotal` (`ValorPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'PENDENTE','Pedido de João Silva',15.00,520.00),(2,'PAGO','Pedido da Empresa XYZ',20.00,320.00),(3,'ENVIADO','Pedido de Maria Souza',10.00,150.00),(4,'ENTREGUE','Pedido do Comércio ABC',30.00,5000.00),(5,'CANCELADO','Pedido de Carlos Lima',0.00,340.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_entrega`
--

DROP TABLE IF EXISTS `pedido_has_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_entrega` (
  `Pedido_idPedido` int NOT NULL,
  `Entrega_idEntrega` int NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Entrega_idEntrega`),
  KEY `Entrega_idEntrega` (`Entrega_idEntrega`),
  CONSTRAINT `pedido_has_entrega_ibfk_1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `pedido_has_entrega_ibfk_2` FOREIGN KEY (`Entrega_idEntrega`) REFERENCES `entrega` (`idEntrega`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_entrega`
--

LOCK TABLES `pedido_has_entrega` WRITE;
/*!40000 ALTER TABLE `pedido_has_entrega` DISABLE KEYS */;
INSERT INTO `pedido_has_entrega` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `pedido_has_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoafisica` (
  `idPessoaFisica` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idPessoaFisica`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `Cliente_idCliente` (`Cliente_idCliente`),
  CONSTRAINT `pessoafisica_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
INSERT INTO `pessoafisica` VALUES (1,'111.222.333-44',1),(2,'555.666.777-88',3),(3,'999.888.777-66',5);
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoajuridica` (
  `idPessoaJuridica` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(18) NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idPessoaJuridica`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  UNIQUE KEY `Cliente_idCliente` (`Cliente_idCliente`),
  CONSTRAINT `pessoajuridica_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES (1,'12.345.678/0001-99',2),(2,'98.765.432/0001-11',4);
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idx_descr` (`Descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Eletrônico','Smartphone',1500.00),(2,'Móveis','Mesa de Escritório',500.00),(3,'Eletrodoméstico','Geladeira',3000.00),(4,'Vestimenta','Jaqueta de Couro',250.00),(5,'Alimento','Chocolate Importado',25.00),(6,'Eletrônico','Fone Bluetooth',150.00),(7,'Móvel','Cadeira Gamer',600.00),(8,'Eletrônico','Fone Bluetooth',150.00),(9,'Móvel','Cadeira Gamer',600.00),(10,'Eletrônico','Fone Bluetooth',150.00),(11,'Móvel','Cadeira Gamer',600.00),(12,'Eletrônico','Fone Bluetooth',150.00),(13,'Móvel','Cadeira Gamer',600.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_pedido`
--

DROP TABLE IF EXISTS `produto_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_has_pedido` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `Pedido_idPedido` (`Pedido_idPedido`),
  CONSTRAINT `produto_has_pedido_ibfk_1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE,
  CONSTRAINT `produto_has_pedido_ibfk_2` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_pedido`
--

LOCK TABLES `produto_has_pedido` WRITE;
/*!40000 ALTER TABLE `produto_has_pedido` DISABLE KEYS */;
INSERT INTO `produto_has_pedido` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `produto_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceirovendedor`
--

DROP TABLE IF EXISTS `terceirovendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceirovendedor` (
  `idTerceiroVendedor` int NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(45) NOT NULL,
  `Local` varchar(100) NOT NULL,
  PRIMARY KEY (`idTerceiroVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceirovendedor`
--

LOCK TABLES `terceirovendedor` WRITE;
/*!40000 ALTER TABLE `terceirovendedor` DISABLE KEYS */;
INSERT INTO `terceirovendedor` VALUES (1,'Marketplace A','São Paulo'),(2,'Marketplace B','Rio de Janeiro'),(3,'Loja Parceira 1','Curitiba'),(4,'Loja Parceira 2','Belo Horizonte'),(5,'E-commerce X','Porto Alegre');
/*!40000 ALTER TABLE `terceirovendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceirovendedor_has_pedido`
--

DROP TABLE IF EXISTS `terceirovendedor_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceirovendedor_has_pedido` (
  `TerceiroVendedor_idTerceiroVendedor` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`TerceiroVendedor_idTerceiroVendedor`,`Pedido_idPedido`),
  KEY `Pedido_idPedido` (`Pedido_idPedido`),
  CONSTRAINT `terceirovendedor_has_pedido_ibfk_1` FOREIGN KEY (`TerceiroVendedor_idTerceiroVendedor`) REFERENCES `terceirovendedor` (`idTerceiroVendedor`) ON DELETE CASCADE,
  CONSTRAINT `terceirovendedor_has_pedido_ibfk_2` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceirovendedor_has_pedido`
--

LOCK TABLES `terceirovendedor_has_pedido` WRITE;
/*!40000 ALTER TABLE `terceirovendedor_has_pedido` DISABLE KEYS */;
INSERT INTO `terceirovendedor_has_pedido` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `terceirovendedor_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07  9:59:55
