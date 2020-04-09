CREATE DATABASE  IF NOT EXISTS `gilgodbd` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gilgodbd`;
-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gilgodbd
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogador` (
  `jogador` int(11) DEFAULT NULL,
  `quiz` int(11) DEFAULT NULL,
  `pontuacao` int(11) DEFAULT NULL,
  KEY `fk_usu_jog` (`jogador`),
  KEY `fk_quiz_jog` (`quiz`),
  CONSTRAINT `fk_quiz_jog` FOREIGN KEY (`quiz`) REFERENCES `quiz` (`idquiz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usu_jog` FOREIGN KEY (`jogador`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
INSERT INTO `jogador` VALUES (1,13,300),(1,13,60);
/*!40000 ALTER TABLE `jogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pergunta` (
  `idpergunta` int(11) NOT NULL AUTO_INCREMENT,
  `questao` varchar(45) NOT NULL,
  `resposta` varchar(45) NOT NULL,
  `alternativa2` varchar(45) DEFAULT NULL,
  `alternativa3` varchar(45) DEFAULT NULL,
  `alternativa4` varchar(45) DEFAULT NULL,
  `quizreferente` int(11) DEFAULT NULL,
  `dificuldade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpergunta`),
  KEY `fk_quiz_ref` (`quizreferente`),
  CONSTRAINT `fk_quiz_ref` FOREIGN KEY (`quizreferente`) REFERENCES `quiz` (`idquiz`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
INSERT INTO `pergunta` VALUES (2,'sadd','sdasd','nula','nula','nula',12,3),(3,'que cor é o céu?','azul','amarelo','tess','nula',13,1),(4,'ola...','mundo','nula','nula','nula',13,1),(5,'teste','ttt','teste4','dfsd','dfg',13,1);
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `idquiz` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `tema` varchar(45) DEFAULT NULL,
  `dificuldade` int(11) DEFAULT NULL,
  `autor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idquiz`),
  KEY `fk_autor` (`autor`),
  CONSTRAINT `fk_autor` FOREIGN KEY (`autor`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'bola','eeeee',4,1),(2,'azul','ddddd',3,1),(3,'bolas','ddd',3,1),(4,'dds','sdasd',3,1),(5,'asdas','asdasd',2,1),(6,'asdas','asds',2,1),(7,'asdsa','asdas',3,1),(8,'sdfsd','dsfsf',1,1),(9,'sadas','asdad',3,1),(10,'sada','asdad',2,1),(11,'asdasd','adssd',1,1),(12,'asasd','asdda',2,1),(13,'teste','teste',1,1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'adm','adm','adm');
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

-- Dump completed on 2020-04-09  0:30:20
