--MODELO LOGICO BANCO DE DADOS MYSQL

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` enum('receita','despesa') DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Salário','receita'),(2,'Alimentação','despesa'),(3,'Transporte','despesa'),(4,'Investimento','receita'),(5,'snoopynho','despesa'),(6,'manutenção','receita');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `id_conta` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` enum('corrente','poupança','carteira','outro') DEFAULT NULL,
  `saldo_inicial` decimal(10,2) DEFAULT NULL,
  `db_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_conta`),
  KEY `db_usuario` (`db_usuario`),
  CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`db_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,'Conta Corrente','corrente',2500.00,1),(2,'Carteira Física','carteira',300.00,1);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_financeira`
--

DROP TABLE IF EXISTS `meta_financeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_financeira` (
  `id_meta` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `valor_objetivo` decimal(10,2) DEFAULT NULL,
  `valor_atual` decimal(10,2) DEFAULT NULL,
  `data_limite` date DEFAULT NULL,
  `db_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `db_usuario` (`db_usuario`),
  CONSTRAINT `meta_financeira_ibfk_1` FOREIGN KEY (`db_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_financeira`
--

LOCK TABLES `meta_financeira` WRITE;
/*!40000 ALTER TABLE `meta_financeira` DISABLE KEYS */;
INSERT INTO `meta_financeira` VALUES (1,'Viajar para o Nordeste',5000.00,1500.00,'2025-12-31',1),(2,'Comprar um notebook novo',3500.00,500.00,'2025-10-15',1),(3,'comprar uma fonte corsair cx550w',600.00,10.00,'2025-06-30',NULL),(4,'comprar uma escada 9 degraus',300.20,120.20,'2025-07-08',1);
/*!40000 ALTER TABLE `meta_financeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacao` (
  `id_transacao` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_transacao` date DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tipo` enum('receita','despesa') DEFAULT NULL,
  `db_conta` int DEFAULT NULL,
  `db_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_transacao`),
  KEY `db_conta` (`db_conta`),
  KEY `db_categoria` (`db_categoria`),
  CONSTRAINT `transacao_ibfk_1` FOREIGN KEY (`db_conta`) REFERENCES `conta` (`id_conta`),
  CONSTRAINT `transacao_ibfk_2` FOREIGN KEY (`db_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacao`
--

LOCK TABLES `transacao` WRITE;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` VALUES (1,3000.00,'2025-06-01','Salário de Junho','receita',1,1),(2,-50.00,'2025-06-03','Almoço no restaurante','despesa',1,2),(3,-120.00,'2025-06-05','Passagem de ônibus','despesa',2,3),(4,500.00,'2025-06-10','Aplicação em renda fixa','receita',1,4),(21,500.00,'2025-06-29','pix de pagamento de serviços externos','despesa',1,3);
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Eduardo Tavares','senha123'),(2,'graziela','aert344e43');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 21:48:07
