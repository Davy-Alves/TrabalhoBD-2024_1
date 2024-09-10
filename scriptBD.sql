-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: universidade
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `matricula` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'João','Rua Parque Encantado'),(2,'Maria ','Rua Parque Encantado'),(3,'Michelangelo','Rua Alta Renascença'),(4,'Rafael','Rua Alta Renascença'),(5,'Dante Alighieri','Rua Florença'),(6,'Ludwing Van Beethoven','Rua Bonaventura');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_telefone`
--

DROP TABLE IF EXISTS `aluno_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_telefone` (
  `numero` int NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `ALUNO_matricula` int NOT NULL,
  PRIMARY KEY (`numero`,`ALUNO_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_telefone`
--

LOCK TABLES `aluno_telefone` WRITE;
/*!40000 ALTER TABLE `aluno_telefone` DISABLE KEYS */;
INSERT INTO `aluno_telefone` VALUES (123456789,'Celular',1),(456123789,'Trabalho',3),(987654321,'Residencial',2);
/*!40000 ALTER TABLE `aluno_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursa`
--

DROP TABLE IF EXISTS `cursa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursa` (
  `Nome` int NOT NULL,
  `Média Final` decimal(10,0) NOT NULL,
  `Frequência` int NOT NULL,
  `ALUNO_matricula` int NOT NULL,
  `DISCIPLINA_codigo` int NOT NULL,
  PRIMARY KEY (`ALUNO_matricula`,`DISCIPLINA_codigo`),
  UNIQUE KEY `Nome_UNIQUE` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursa`
--

LOCK TABLES `cursa` WRITE;
/*!40000 ALTER TABLE `cursa` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `cod` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Engenharia da Computação'),(3,'Física'),(2,'Matemática');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `codigo` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `ementa` varchar(100) DEFAULT NULL,
  `credito` int DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `DEPARTAMENTO_cod` int NOT NULL,
  `ORIENTADOR_numero` int NOT NULL,
  `ORIENTADOR_DEPARTAMENTO_cod1` int NOT NULL,
  PRIMARY KEY (`codigo`,`DEPARTAMENTO_cod`,`ORIENTADOR_numero`,`ORIENTADOR_DEPARTAMENTO_cod1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Sistema Linear','Sinais e Séries de Fourier',4,'Engenharia da Computação',1,1,1),(2,'Análise de Algoritimos','Tempo Polinomial não determinístico',4,'Engenharia da Computação',1,2,2),(3,'Eletromagnetismo','Força elétrica e Campo Elétrico',4,'Física',3,3,3),(4,'Matemática Discreta','Lógica Matemática e Grafos',8,'Matemática',2,2,2),(5,'Séries e Equações Diferenciais','Séries de Taylor e EDOs',4,'Matemática',2,4,2);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_has_disciplina`
--

DROP TABLE IF EXISTS `disciplina_has_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina_has_disciplina` (
  `cod Disciplina` int NOT NULL,
  `cod Requisito` int NOT NULL,
  PRIMARY KEY (`cod Disciplina`,`cod Requisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_has_disciplina`
--

LOCK TABLES `disciplina_has_disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina_has_disciplina` DISABLE KEYS */;
INSERT INTO `disciplina_has_disciplina` VALUES (1,2),(5,4);
/*!40000 ALTER TABLE `disciplina_has_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduacao`
--

DROP TABLE IF EXISTS `graduacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduacao` (
  `ano_ingresso` date NOT NULL,
  `ALUNO_matricula` int NOT NULL,
  PRIMARY KEY (`ALUNO_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduacao`
--

LOCK TABLES `graduacao` WRITE;
/*!40000 ALTER TABLE `graduacao` DISABLE KEYS */;
INSERT INTO `graduacao` VALUES ('2020-01-01',1),('2021-08-01',2),('2022-02-05',3),('2022-02-05',4),('2022-02-05',5),('2023-08-03',6);
/*!40000 ALTER TABLE `graduacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientador`
--

DROP TABLE IF EXISTS `orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orientador` (
  `numero` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `DEPARTAMENTO_cod1` int NOT NULL,
  PRIMARY KEY (`numero`,`DEPARTAMENTO_cod1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientador`
--

LOCK TABLES `orientador` WRITE;
/*!40000 ALTER TABLE `orientador` DISABLE KEYS */;
INSERT INTO `orientador` VALUES (1,'Alexandre Rolim',1),(2,'Luiz manoel figueiredo',2),(3,'Euclimar Passos',3),(4,'Rui ',2);
/*!40000 ALTER TABLE `orientador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_graduacao`
--

DROP TABLE IF EXISTS `pos_graduacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_graduacao` (
  `formacao_escolar` longtext NOT NULL,
  `ORIENTADOR_numero` int NOT NULL,
  `ALUNO_matricula` int NOT NULL,
  PRIMARY KEY (`ORIENTADOR_numero`,`ALUNO_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_graduacao`
--

LOCK TABLES `pos_graduacao` WRITE;
/*!40000 ALTER TABLE `pos_graduacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_graduacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09 23:33:34
