-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_system
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `nota` int NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `comentario` text,
  `data_avaliacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `avaliacoes_chk_1` CHECK (((`nota` >= 1) and (`nota` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES (1,1,1,5,'Excelente smartphone','Produto de alta qualidade, entrega rápida','2023-01-20 10:00:00'),(2,2,2,4,'Bom notebook','Atende bem para trabalho, poderia ter mais RAM','2023-01-25 14:30:00'),(3,3,3,5,'TV incrível','Imagem de altíssima qualidade, recomendo','2023-02-15 16:45:00'),(4,4,4,3,'Bom, mas poderia ser melhor','Áudio regular, bateria dura bem','2023-03-05 09:20:00'),(5,5,5,5,'Tablet perfeito','Performance excelente, tela maravilhosa','2023-03-20 11:15:00');
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES (1,1,3,1),(2,1,6,2),(3,2,8,1),(4,3,2,1),(5,4,5,1),(6,5,10,1),(7,1,1,1),(8,2,4,3),(9,3,7,1),(10,4,9,1);
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (5,'Eletrodomésticos'),(1,'Eletrônicos'),(9,'Esportes'),(7,'Games'),(2,'Informática'),(8,'Livros'),(10,'Moda'),(6,'Móveis'),(3,'Smartphones'),(4,'TV e Vídeo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','joao.silva@email.com','(11) 99999-1111','111.222.333-44','2023-01-15 10:00:00'),(2,'Maria Santos','maria.santos@email.com','(11) 99999-2222','222.333.444-55','2023-01-20 14:30:00'),(3,'Pedro Oliveira','pedro.oliveira@email.com','(21) 99999-3333','333.444.555-66','2023-02-05 09:15:00'),(4,'Ana Costa','ana.costa@email.com','(21) 99999-4444','444.555.666-77','2023-02-10 16:45:00'),(5,'Carlos Pereira','carlos.pereira@email.com','(31) 99999-5555','555.666.777-88','2023-03-01 11:20:00'),(6,'Juliana Rodrigues','juliana.rodrigues@email.com','(31) 99999-6666','666.777.888-99','2023-03-12 13:10:00'),(7,'Fernando Almeida','fernando.almeida@email.com','(41) 99999-7777','777.888.999-00','2023-04-03 08:30:00'),(8,'Amanda Lima','amanda.lima@email.com','(41) 99999-8888','888.999.000-11','2023-04-18 15:25:00'),(9,'Ricardo Souza','ricardo.souza@email.com','(51) 99999-9999','999.000.111-22','2023-05-07 12:40:00'),(10,'Patrícia Martins','patricia.martins@email.com','(51) 99999-0000','000.111.222-33','2023-05-22 17:15:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupons`
--

DROP TABLE IF EXISTS `cupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `tipo_desconto` enum('percentual','valor_fixo') NOT NULL,
  `desconto_percentual` decimal(5,2) NOT NULL,
  `valor_minimo` decimal(10,2) DEFAULT NULL,
  `usos_maximos` int DEFAULT NULL,
  `data_validade` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupons`
--

LOCK TABLES `cupons` WRITE;
/*!40000 ALTER TABLE `cupons` DISABLE KEYS */;
INSERT INTO `cupons` VALUES (1,'PRIMEIRACOMPRA','Desconto para primeira compra','percentual',15.00,100.00,1000,'2024-12-31'),(2,'BLACKFRIDAY23','Cupom Black Friday 2023','percentual',20.00,200.00,5000,'2023-11-30'),(3,'NATAL2023','Promoção de Natal','percentual',10.00,50.00,3000,'2023-12-25'),(4,'FRETEGRATIS','Cupom frete grátis','valor_fixo',0.00,150.00,2000,'2024-06-30'),(5,'BEMVINDO10','Desconto de boas-vindas','percentual',10.00,80.00,10000,'2024-12-31');
/*!40000 ALTER TABLE `cupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,1,'São Paulo','SP','01234-567','100','Centro','Apto 101'),(2,1,'São Paulo','SP','01234-568','200','Jardins','Casa 2'),(3,2,'Rio de Janeiro','RJ','12345-678','300','Copacabana','Bloco A'),(4,2,'Rio de Janeiro','RJ','12345-679','400','Ipanema','Sala 5'),(5,3,'Belo Horizonte','MG','23456-789','500','Savassi','Apto 302'),(6,3,'Belo Horizonte','MG','23456-780','600','Funcionários',NULL),(7,4,'Porto Alegre','RS','34567-890','700','Moinhos de Vento','Casa verde'),(8,4,'Porto Alegre','RS','34567-891','800','Centro Histórico','Loja 10'),(9,5,'Salvador','BA','45678-901','900','Barra','Apto 1501'),(10,5,'Salvador','BA','45678-902','1000','Ondina',NULL);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `quantidade_minima` int NOT NULL DEFAULT '5',
  `localizacao` varchar(50) DEFAULT NULL,
  `data_ultima_entrada` date DEFAULT NULL,
  `data_ultima_saida` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produto_id` (`produto_id`),
  CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,50,10,'Prateleira A1','2023-11-01','2023-11-15'),(2,2,30,5,'Prateleira B2','2023-11-05','2023-11-18'),(3,3,25,3,'Prateleira C3','2023-10-28','2023-11-12'),(4,4,100,20,'Prateleira D4','2023-11-10','2023-11-20'),(5,5,15,2,'Prateleira E5','2023-11-03','2023-11-16'),(6,6,80,15,'Prateleira F6','2023-11-08','2023-11-19'),(7,7,60,10,'Prateleira G7','2023-11-12','2023-11-21'),(8,8,10,1,'Prateleira H8','2023-10-25','2023-11-14'),(9,9,20,2,'Prateleira I9','2023-11-06','2023-11-17'),(10,10,35,5,'Prateleira J10','2023-11-14','2023-11-22');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'TechImport Ltda','12.345.678/0001-90','vendas@techimport.com','(11) 3333-4444','Rua das Flores, 100 - São Paulo/SP'),(2,'EletroWorld S.A.','23.456.789/0001-01','contato@eletroworld.com','(11) 4444-5555','Av. Paulista, 500 - São Paulo/SP'),(3,'MobileTech Brasil','34.567.890/0001-12','suporte@mobiletech.com','(21) 5555-6666','Rua do Comércio, 200 - Rio de Janeiro/RJ'),(4,'CasaConforto Ltda','45.678.901/0001-23','vendas@casaconforto.com','(31) 6666-7777','Av. Amazonas, 300 - Belo Horizonte/MG'),(5,'GameMania Distribuidora','56.789.012/0001-34','pedidos@gamemania.com','(41) 7777-8888','Rua das Palmeiras, 400 - Curitiba/PR'),(6,'BookStore Nacional','67.890.123/0001-45','contato@bookstore.com','(51) 8888-9999','Av. Borges, 600 - Porto Alegre/RS'),(7,'SportLife Equipamentos','78.901.234/0001-56','vendas@sportlife.com','(61) 9999-0000','Quadra 100, Lote 10 - Brasília/DF'),(8,'FashionStyle Moda','89.012.345/0001-67','contato@fashionstyle.com','(71) 2222-3333','Av. Sete, 700 - Salvador/BA'),(9,'CozinhaPlus Utensílios','90.123.456/0001-78','suporte@cozinhaplus.com','(81) 3333-4444','Rua do Sol, 800 - Recife/PE'),(10,'MóbelMaster Indústria','01.234.567/0001-89','vendas@mobelmaster.com','(85) 4444-5555','Av. Beira Mar, 900 - Fortaleza/CE');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fretes`
--

DROP TABLE IF EXISTS `fretes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fretes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regiao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `nome_transportadora` varchar(50) NOT NULL,
  `prazo_entrega` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fretes`
--

LOCK TABLES `fretes` WRITE;
/*!40000 ALTER TABLE `fretes` DISABLE KEYS */;
INSERT INTO `fretes` VALUES (1,'Sudeste',25.00,'Correios SEDEX',3,1),(2,'Sul',35.00,'Correios SEDEX',4,1),(3,'Nordeste',45.00,'Correios SEDEX',5,1),(4,'Centro-Oeste',40.00,'Correios SEDEX',4,1),(5,'Norte',55.00,'Correios SEDEX',6,1),(6,'Sudeste',15.00,'Correios PAC',7,1),(7,'Sul',20.00,'Correios PAC',8,1),(8,'Nordeste',25.00,'Correios PAC',9,1),(9,'Centro-Oeste',22.00,'Correios PAC',8,1),(10,'Norte',30.00,'Correios PAC',10,1);
/*!40000 ALTER TABLE `fretes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `desconto` decimal(8,2) DEFAULT '0.00',
  `total_item` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,1,1,2999.99,0.00,2999.99),(2,1,4,1,399.99,0.00,399.99),(3,2,2,1,3499.99,0.00,3499.99),(4,2,6,2,199.99,0.00,399.98),(5,3,3,1,2599.99,0.00,2599.99),(6,3,7,1,299.99,100.00,199.99),(7,4,8,1,4499.99,0.00,4499.99),(8,5,10,1,1899.99,0.00,1899.99),(9,5,4,1,399.99,300.00,99.99),(10,5,5,1,2899.99,0.00,2899.99);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pedidos`
--

DROP TABLE IF EXISTS `log_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `status_anterior` varchar(50) DEFAULT NULL,
  `status_novo` varchar(50) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `dados_antigos` text,
  `dados_novos` text,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `log_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pedidos`
--

LOCK TABLES `log_pedidos` WRITE;
/*!40000 ALTER TABLE `log_pedidos` DISABLE KEYS */;
INSERT INTO `log_pedidos` VALUES (1,1,NULL,'pendente','sistema',NULL,'Pedido criado','2023-01-10 14:30:00'),(2,1,'pendente','confirmado','admin','status: pendente','status: confirmado','2023-01-10 15:00:00'),(3,1,'confirmado','enviado','admin','status: confirmado','status: enviado','2023-01-11 09:30:00'),(4,1,'enviado','entregue','sistema','status: enviado','status: entregue','2023-01-13 14:15:00'),(5,2,NULL,'pendente','sistema',NULL,'Pedido criado','2023-01-15 10:15:00'),(6,2,'pendente','confirmado','admin','status: pendente','status: confirmado','2023-01-15 11:00:00'),(7,2,'confirmado','enviado','admin','status: confirmado','status: enviado','2023-01-16 08:45:00'),(8,2,'enviado','entregue','sistema','status: enviado','status: entregue','2023-01-18 16:20:00'),(9,3,NULL,'pendente','sistema',NULL,'Pedido criado','2023-02-05 16:45:00'),(10,3,'pendente','confirmado','admin','status: pendente','status: confirmado','2023-02-06 09:00:00');
/*!40000 ALTER TABLE `log_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `metodo` enum('cartao','pix','boleto') NOT NULL,
  `status` enum('pendente','aprovado','recusado') DEFAULT 'pendente',
  `data_pagamento` datetime DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `codigo_transacao` varchar(100) DEFAULT NULL,
  `chave_pix` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,'cartao','aprovado','2023-01-10 14:35:00',3249.99,'TXN001234567',NULL),(2,2,'pix','aprovado','2023-01-15 10:20:00',3899.99,'PIX001234568','11999991111'),(3,3,'boleto','aprovado','2023-02-06 09:00:00',2799.99,'BLT001234569',NULL),(4,4,'cartao','aprovado','2023-02-20 09:25:00',4599.99,'TXN001234570',NULL),(5,5,'pix','aprovado','2023-03-08 13:15:00',1999.99,'PIX001234571','21999992222');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `endereco_id` int NOT NULL,
  `data_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pendente','enviado','entregue','cancelado') DEFAULT 'pendente',
  `total` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `valor_frete` decimal(8,2) NOT NULL,
  `codigo_rastreio` varchar(50) DEFAULT NULL,
  `data_envio` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `endereco_id` (`endereco_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,1,'2023-01-10 14:30:00','entregue',3249.99,3224.99,25.00,'BR123456789SP','2023-01-11','2023-01-13'),(2,2,3,'2023-01-15 10:15:00','entregue',3899.99,3874.99,25.00,'BR123456790RJ','2023-01-16','2023-01-18'),(3,3,5,'2023-02-05 16:45:00','entregue',2799.99,2774.99,25.00,'BR123456791MG','2023-02-06','2023-02-08'),(4,4,7,'2023-02-20 09:20:00','entregue',4599.99,4574.99,25.00,'BR123456792RS','2023-02-21','2023-02-23'),(5,5,9,'2023-03-08 13:10:00','entregue',1999.99,1974.99,25.00,'BR123456793BA','2023-03-09','2023-03-11');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `preco_custo` decimal(10,2) DEFAULT NULL,
  `peso_kg` decimal(8,3) DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `fornecedor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `fornecedor_id` (`fornecedor_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Smartphone Galaxy S23','Smartphone Android com 128GB, 8GB RAM, câmera tripla',2999.99,1800.00,0.168,3,3),(2,'Notebook Dell Inspiron 15','Notebook Intel i5, 8GB RAM, SSD 256GB, 15.6\"',3499.99,2200.00,1.850,2,2),(3,'TV LED 55\" 4K Samsung','Smart TV 55 polegadas, 4K UHD, HDR, Wi-Fi',2599.99,1600.00,12.500,4,1),(4,'Fone de Ouvido Bluetooth','Fone sem fio, cancelamento de ruído, bateria 30h',399.99,150.00,0.250,1,1),(5,'Tablet iPad 10.2\"','Tablet Apple, 64GB, Wi-Fi, tela Retina',2899.99,1900.00,0.487,1,2),(6,'Mouse Gamer RGB','Mouse óptico, 6400DPI, 7 botões, iluminação RGB',199.99,80.00,0.120,2,2),(7,'Teclado Mecânico','Teclado mecânico switches azuis, LED azul, USB',299.99,120.00,0.850,2,2),(8,'PlayStation 5','Console de videogame, 825GB SSD, controle DualSense',4499.99,3000.00,4.500,7,5),(9,'Xbox Series S','Console Microsoft, 512GB SSD, controle sem fio',2399.99,1600.00,1.900,7,5),(10,'Smartwatch Apple Watch','Relógio inteligente, GPS, 44mm, pulseira esportiva',1899.99,1100.00,0.048,1,1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-22 20:58:24
