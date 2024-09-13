-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: bd1-tp
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `Automotriz`
--

DROP TABLE IF EXISTS `Automotriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Automotriz` (
  `idAutomotriz` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idAutomotriz`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Automotriz`
--

/*!40000 ALTER TABLE `Automotriz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Automovil`
--

DROP TABLE IF EXISTS `Automovil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Automovil` (
  `chasis` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinalizacion` date DEFAULT NULL,
  `idLíneaDeMontaje` int NOT NULL,
  `idPedidoAutos` int NOT NULL,
  PRIMARY KEY (`chasis`),
  KEY `fk_Automovil_LíneaDeMontaje1_idx` (`idLíneaDeMontaje`),
  KEY `fk_Automovil_PedidoAutos1_idx` (`idPedidoAutos`),
  CONSTRAINT `fk_Automovil_LíneaDeMontaje1` FOREIGN KEY (`idLíneaDeMontaje`) REFERENCES `LíneaDeMontaje` (`idLíneaDeMontaje`),
  CONSTRAINT `fk_Automovil_PedidoAutos1` FOREIGN KEY (`idPedidoAutos`) REFERENCES `PedidoAutos` (`idPedidoAutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Automovil`
--

/*!40000 ALTER TABLE `Automovil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Concesionaria`
--

DROP TABLE IF EXISTS `Concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Concesionaria` (
  `idConcesionaria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idConcesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concesionaria`
--

LOCK TABLES `Concesionaria` WRITE;
/*!40000 ALTER TABLE `Concesionaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstaciónDeTrabajo`
--

DROP TABLE IF EXISTS `EstaciónDeTrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstaciónDeTrabajo` (
  `idEstaciónDeTrabajo` int NOT NULL AUTO_INCREMENT,
  `trabajo` varchar(45) DEFAULT NULL,
  `orden` int NOT NULL,
  `idLíneaDeMontaje` int NOT NULL,
  PRIMARY KEY (`idEstaciónDeTrabajo`),
  KEY `fk_EstaciónDeTrabajo_LíneaDeMontaje1_idx` (`idLíneaDeMontaje`),
  CONSTRAINT `fk_EstaciónDeTrabajo_LíneaDeMontaje1` FOREIGN KEY (`idLíneaDeMontaje`) REFERENCES `LíneaDeMontaje` (`idLíneaDeMontaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstaciónDeTrabajo`
--

LOCK TABLES `InformePedido` WRITE;
/*!40000 ALTER TABLE `InformePedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformePedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insumo`
--

DROP TABLE IF EXISTS `Insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insumo` (
  `idInsumo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insumo`
--

LOCK TABLES `Insumo` WRITE;
/*!40000 ALTER TABLE `Insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InsumoPedido`
--

DROP TABLE IF EXISTS `InsumoPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InsumoPedido` (
  `idlLstaDeInsumosPedidos` int NOT NULL,
  `idInsumo` int NOT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` int NOT NULL,
  PRIMARY KEY (`idlLstaDeInsumosPedidos`,`idInsumo`),
  KEY `fk_ListaDeInsumosPedidos_has_Insumo_Insumo1_idx` (`idInsumo`),
  KEY `fk_ListaDeInsumosPedidos_has_Insumo_ListaDeInsumosPedidos1_idx` (`idlLstaDeInsumosPedidos`),
  CONSTRAINT `fk_ListaDeInsumosPedidos_has_Insumo_Insumo1` FOREIGN KEY (`idInsumo`) REFERENCES `Insumo` (`idInsumo`),
  CONSTRAINT `fk_ListaDeInsumosPedidos_has_Insumo_ListaDeInsumosPedidos1` FOREIGN KEY (`idlLstaDeInsumosPedidos`) REFERENCES `ListaDeInsumosPedidos` (`idlLstaDeInsumosPedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InsumoPedido`
--

LOCK TABLES `InsumoPedido` WRITE;
/*!40000 ALTER TABLE `InsumoPedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `InsumoPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InsumosRecibidos`
--

DROP TABLE IF EXISTS `InsumosRecibidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InsumosRecibidos` (
  `idInsumosRecibidos` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idlLstaDeInsumosPedidos` int NOT NULL,
  PRIMARY KEY (`idInsumosRecibidos`),
  KEY `fk_InsumosEntregados_ListaDeInsumosPedidos1_idx` (`idlLstaDeInsumosPedidos`),
  CONSTRAINT `fk_InsumosEntregados_ListaDeInsumosPedidos1` FOREIGN KEY (`idlLstaDeInsumosPedidos`) REFERENCES `ListaDeInsumosPedidos` (`idlLstaDeInsumosPedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InsumosRecibidos`
--

LOCK TABLES `InsumosRecibidos` WRITE;
/*!40000 ALTER TABLE `InsumosRecibidos` DISABLE KEYS */;
LOCK TABLES `ListaDeInsumosPedidos` WRITE;
/*!40000 ALTER TABLE `ListaDeInsumosPedidos` DISABLE KEYS */;
LOCK TABLES `LíneaDeMontaje` WRITE;
/*!40000 ALTER TABLE `LíneaDeMontaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `LíneaDeMontaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'Renault Argentina','Marca francesa de automóviles con presencia en Argentina desde hace décadas, conocida por su producción local en Córdoba y su amplia gama de modelos populares en el mercado argentino.'),(2,'Volkswagen Argentina','Marca alemana reconocida por su larga trayectoria en el mercado argentino, con plantas de producción en Pacheco y Córdoba, ofreciendo una amplia gama de vehículos para distintos segmentos.'),(3,'Chevrolet Argentina','Marca estadounidense con presencia histórica en Argentina, destacada por sus modelos icónicos y una variedad de vehículos populares en el país.');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModeloDeVehículo`
--

DROP TABLE IF EXISTS `ModeloDeVehículo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModeloDeVehículo` (
  `idModeloDeVehículo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `info` varchar(200) DEFAULT NULL,
  `Marca_idMarca` int NOT NULL,
  PRIMARY KEY (`idModeloDeVehículo`),
  KEY `fk_ModeloDeVehículo_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_ModeloDeVehículo_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `Marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModeloDeVehículo`
--

LOCK TABLES `ModeloDeVehículo` WRITE;
/*!40000 ALTER TABLE `ModeloDeVehículo` DISABLE KEYS */;
INSERT INTO `ModeloDeVehículo` VALUES (1,'Renault Captur','SUV elegante y espacioso de Renault.',1),(2,'Volkswagen Gol Trend','Compacto y confiable, un clásico de Volkswagen.',2),(3,'Chevrolet Onix','Auto compacto y moderno de Chevrolet.',3);
/*!40000 ALTER TABLE `ModeloDeVehículo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModeloPedido`
--

DROP TABLE IF EXISTS `ModeloPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModeloPedido` (
  `idModeloPedido` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `idModeloDeVehículo` int NOT NULL,
  `idPedidoAutos` int NOT NULL,
  PRIMARY KEY (`idModeloPedido`),
  KEY `fk_ModeloPedido_ModeloDeVehículo1_idx` (`idModeloDeVehículo`),
  KEY `fk_ModeloPedido_PedidoAutos1_idx` (`idPedidoAutos`),
  CONSTRAINT `fk_ModeloPedido_ModeloDeVehículo1` FOREIGN KEY (`idModeloDeVehículo`) REFERENCES `ModeloDeVehículo` (`idModeloDeVehículo`),
  CONSTRAINT `fk_ModeloPedido_PedidoAutos1` FOREIGN KEY (`idPedidoAutos`) REFERENCES `PedidoAutos` (`idPedidoAutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModeloPedido`
--

LOCK TABLES `ModeloPedido` WRITE;
/*!40000 ALTER TABLE `ModeloPedido` DISABLE KEYS */;
LOCK TABLES `PedidoAutos` WRITE;
/*!40000 ALTER TABLE `PedidoAutos` DISABLE KEYS */;
/*!40000 ALTER TABLE `PedidoAutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedor`
--

DROP TABLE IF EXISTS `Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedor`
--

/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistroAutomovilPorEstacionDeTrabajo`
--

DROP TABLE IF EXISTS `RegistroAutomovilPorEstacionDeTrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RegistroAutomovilPorEstacionDeTrabajo` (
  `idEstaciónDeTrabajo` int NOT NULL,
  `chasis` int NOT NULL,
  `fechaIngreso` datetime NOT NULL,
  `fechaEgreso` datetime DEFAULT NULL,
  PRIMARY KEY (`idEstaciónDeTrabajo`,`chasis`),
  KEY `fk_EstaciónDeTrabajo_has_Automovil_Automovil1_idx` (`chasis`),
  KEY `fk_EstaciónDeTrabajo_has_Automovil_EstaciónDeTrabajo1_idx` (`idEstaciónDeTrabajo`),
  CONSTRAINT `fk_EstaciónDeTrabajo_has_Automovil_Automovil1` FOREIGN KEY (`chasis`) REFERENCES `Automovil` (`chasis`),
  CONSTRAINT `fk_EstaciónDeTrabajo_has_Automovil_EstaciónDeTrabajo1` FOREIGN KEY (`idEstaciónDeTrabajo`) REFERENCES `EstaciónDeTrabajo` (`idEstaciónDeTrabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistroAutomovilPorEstacionDeTrabajo`
--

LOCK TABLES `RegistroAutomovilPorEstacionDeTrabajo` WRITE;
/*!40000 ALTER TABLE `RegistroAutomovilPorEstacionDeTrabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegistroAutomovilPorEstacionDeTrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd1-tp'
--
