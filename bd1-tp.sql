-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: bd1-tp
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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

LOCK TABLES `Automotriz` WRITE;
/*!40000 ALTER TABLE `Automotriz` DISABLE KEYS */;
INSERT INTO `Automotriz` VALUES (1,'Autos del Sur','Avenida Patagonia 567, Neuquén');
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

LOCK TABLES `Automovil` WRITE;
/*!40000 ALTER TABLE `Automovil` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concesionaria`
--

LOCK TABLES `Concesionaria` WRITE;
/*!40000 ALTER TABLE `Concesionaria` DISABLE KEYS */;
INSERT INTO `Concesionaria` VALUES (1,'Concesionaria Prueba','Calle de la Prueba 123');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstaciónDeTrabajo`
--

LOCK TABLES `EstaciónDeTrabajo` WRITE;
/*!40000 ALTER TABLE `EstaciónDeTrabajo` DISABLE KEYS */;
INSERT INTO `EstaciónDeTrabajo` VALUES (1,'Ensamblaje de Carrocería',1,1),(2,'Instalación de Motor',2,1),(3,'Pintura de Carrocería',3,1),(4,'Instalación de Equipamiento',4,1),(5,'Verificación de Calidad',5,1),(6,'Embalaje Final',6,1),(7,'Ensamblaje de Carrocería',1,2),(8,'Instalación de Motor',2,2),(9,'Pintura de Carrocería',3,2),(10,'Instalación de Equipamiento',4,2),(11,'Verificación de Calidad',5,2),(12,'Embalaje Final',6,2),(13,'Ensamblaje de Carrocería',1,3),(14,'Instalación de Motor',2,3),(15,'Pintura de Carrocería',3,3),(16,'Instalación de Equipamiento',4,3),(17,'Verificación de Calidad',5,3),(18,'Embalaje Final',6,3);
/*!40000 ALTER TABLE `EstaciónDeTrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformePedido`
--

DROP TABLE IF EXISTS `InformePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InformePedido` (
  `idInformePedido` int NOT NULL AUTO_INCREMENT,
  `montoTotal` double NOT NULL,
  `fechaEntregaEstimada` date NOT NULL,
  `idPedidoAutos` int NOT NULL,
  PRIMARY KEY (`idInformePedido`),
  KEY `fk_InformePedido_PedidoAutos1_idx` (`idPedidoAutos`),
  CONSTRAINT `fk_InformePedido_PedidoAutos1` FOREIGN KEY (`idPedidoAutos`) REFERENCES `PedidoAutos` (`idPedidoAutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformePedido`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insumo`
--

LOCK TABLES `Insumo` WRITE;
/*!40000 ALTER TABLE `Insumo` DISABLE KEYS */;
INSERT INTO `Insumo` VALUES (2,'Motor Pro','es un motor pro');
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
/*!40000 ALTER TABLE `InsumosRecibidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListaDeInsumosPedidos`
--

DROP TABLE IF EXISTS `ListaDeInsumosPedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ListaDeInsumosPedidos` (
  `idlLstaDeInsumosPedidos` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idLíneaDeMontaje` int NOT NULL,
  `idProveedor` int NOT NULL,
  PRIMARY KEY (`idlLstaDeInsumosPedidos`),
  KEY `fk_listaDeInsumosPedidos_LíneaDeMontaje1_idx` (`idLíneaDeMontaje`),
  KEY `fk_listaDeInsumosPedidos_Proveedor1_idx` (`idProveedor`),
  CONSTRAINT `fk_listaDeInsumosPedidos_LíneaDeMontaje1` FOREIGN KEY (`idLíneaDeMontaje`) REFERENCES `LíneaDeMontaje` (`idLíneaDeMontaje`),
  CONSTRAINT `fk_listaDeInsumosPedidos_Proveedor1` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListaDeInsumosPedidos`
--

LOCK TABLES `ListaDeInsumosPedidos` WRITE;
/*!40000 ALTER TABLE `ListaDeInsumosPedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ListaDeInsumosPedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LíneaDeMontaje`
--

DROP TABLE IF EXISTS `LíneaDeMontaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LíneaDeMontaje` (
  `idLíneaDeMontaje` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `capacidadProductivaDeUnidades` int NOT NULL,
  `idModeloDeVhículo` int NOT NULL,
  `idAutomotriz` int NOT NULL,
  PRIMARY KEY (`idLíneaDeMontaje`),
  KEY `fk_LíneaDeMontaje_ModeloDeVhículo1_idx` (`idModeloDeVhículo`),
  KEY `fk_LíneaDeMontaje_Automotriz1_idx` (`idAutomotriz`),
  CONSTRAINT `fk_LíneaDeMontaje_Automotriz1` FOREIGN KEY (`idAutomotriz`) REFERENCES `Automotriz` (`idAutomotriz`),
  CONSTRAINT `fk_LíneaDeMontaje_ModeloDeVhículo1` FOREIGN KEY (`idModeloDeVhículo`) REFERENCES `ModeloDeVehículo` (`idModeloDeVehículo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LíneaDeMontaje`
--

LOCK TABLES `LíneaDeMontaje` WRITE;
/*!40000 ALTER TABLE `LíneaDeMontaje` DISABLE KEYS */;
INSERT INTO `LíneaDeMontaje` VALUES (1,'Línea de Montaje Renault Captur',100,1,1),(2,'Línea de Montaje Volkswagen Gol Trend',120,2,1),(3,'Línea de Montaje Chevrolet Onix',80,3,1);
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
/*!40000 ALTER TABLE `ModeloPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PedidoAutos`
--

DROP TABLE IF EXISTS `PedidoAutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidoAutos` (
  `idPedidoAutos` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idConcesionaria` int NOT NULL,
  `idAutomotriz` int NOT NULL,
  PRIMARY KEY (`idPedidoAutos`),
  KEY `fk_PedidoAutos_Concesionaria1_idx` (`idConcesionaria`),
  KEY `fk_PedidoAutos_Automotriz1_idx` (`idAutomotriz`),
  CONSTRAINT `fk_PedidoAutos_Automotriz1` FOREIGN KEY (`idAutomotriz`) REFERENCES `Automotriz` (`idAutomotriz`),
  CONSTRAINT `fk_PedidoAutos_Concesionaria1` FOREIGN KEY (`idConcesionaria`) REFERENCES `Concesionaria` (`idConcesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PedidoAutos`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
INSERT INTO `Proveedor` VALUES (1,'Nicole'),(2,'Pedro');
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
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Alta_Concesionaria`(
	IN nombre_concesionaria VARCHAR(45),
    IN direccion_concesionaria VARCHAR(45),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
    DECLARE existe_nombre INT;
    DECLARE existe_direccion INT;

    -- Verificar si ya existe una concesionaria con el mismo nombre
    SELECT COUNT(*) INTO existe_nombre FROM Concesionaria WHERE nombre = nombre_concesionaria;
    IF existe_nombre > 0 THEN
        SET nResultado = -1;
        SET cMensaje = 'Ya existe una concesionaria con ese nombre.';
    ELSE
        -- Verificar si ya existe una concesionaria con la misma dirección
        SELECT COUNT(*) INTO existe_direccion FROM Concesionaria WHERE direccion = direccion_concesionaria;
        IF existe_direccion > 0 THEN
            SET nResultado = -2;
            SET cMensaje = 'Ya existe una concesionaria con esa dirección.';
        ELSE
            INSERT INTO Concesionaria (nombre, direccion) VALUES (nombre_concesionaria, direccion_concesionaria);
            SET nResultado = 0;
            SET cMensaje = '';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Alta_Insumo`(
	IN nombre VARCHAR(45),
	IN descripcion VARCHAR(100),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
	DECLARE existe INT;

	SELECT COUNT(*) INTO existe FROM Insumo i WHERE i.nombre = nombre;
	IF existe > 0 THEN
		SET nResultado = -1;
        SET cMensaje = 'Ya existe un insumo con ese nombre.';
    ELSE
        INSERT INTO Insumo (nombre, descripcion) VALUES(nombre, descripcion);
        SET nResultado = 0;
        SET cMensaje = '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Alta_Proveedor`(
	IN nombre VARCHAR(45),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
	
	DECLARE existe INT;

	SELECT COUNT(*) INTO existe FROM Proveedor p WHERE p.nombre = nombre;
	IF existe > 0 THEN
		SET nResultado = -1;
        SET cMensaje = 'Ya existe un proveedor con ese nombre.';
    ELSE
        INSERT INTO Proveedor (nombre) VALUES(nombre);
        SET nResultado = 0;
        SET cMensaje = '';
    END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Baja_Concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Baja_Concesionaria`(
	IN id INT,
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
    DECLARE existe INT;

    -- Verificar si la concesionaria a eliminar existe
    SELECT COUNT(*) INTO existe FROM Concesionaria WHERE idConcesionaria = id;
    IF existe = 0 THEN
        SET nResultado = -5;
        SET cMensaje = 'La concesionaria a eliminar no existe.';
    ELSE
        DELETE FROM Concesionaria WHERE idConcesionaria = id;
        SET nResultado = 0;
        SET cMensaje = '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Baja_Insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Baja_Insumo`(
	IN id INT,
	OUT nResultado INT,
	OUT cMensaje VARCHAR(255)
)
BEGIN
	DECLARE existe INT;

    SELECT COUNT(*) INTO existe FROM Insumo WHERE idInsumo = id;
    IF existe = 0 THEN
        SET nResultado = -3;
        SET cMensaje = 'El insumo a eliminar no existe.';
    ELSE
        DELETE FROM Insumo WHERE idInsumo = id;
        SET nResultado = 0;
        SET cMensaje = '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Baja_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Baja_Proveedor`(
	IN id INT,
	OUT nResultado INT,
	OUT cMensaje VARCHAR(255)
)
BEGIN
    DECLARE existe INT;

    SELECT COUNT(*) INTO existe FROM Proveedor WHERE idProveedor = id;
    IF existe = 0 THEN
        SET nResultado = -3;
        SET cMensaje = 'El proveedor a eliminar no existe.';
    ELSE
        DELETE FROM Proveedor WHERE idProveedor = id;
        SET nResultado = 0;
        SET cMensaje = '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Modificacion_Concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Modificacion_Concesionaria`(
	IN id INT,
    IN nombre_concesionaria VARCHAR(45),
    IN direccion_concesionaria VARCHAR(45),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
    DECLARE existe_nombre INT;
   	DECLARE existe_direccion INT;
   
   SELECT COUNT(*) INTO existe_nombre FROM Concesionaria WHERE idConcesionaria = id;
    
   IF existe_nombre = 0 THEN
   		SET nResultado = -5;
        SET cMensaje = 'La concesionaria a eliminar no existe.';
   ELSE
	    -- Verificar si la concesionaria a modificar existe
	    SELECT COUNT(*) INTO existe_nombre FROM Concesionaria WHERE nombre = nombre_concesionaria AND idConcesionaria <> id;
	    
	    SELECT COUNT(*) INTO existe_direccion FROM Concesionaria WHERE direccion = direccion_concesionaria AND idConcesionaria <> id;
	    
	    IF existe_nombre > 0 THEN
	        SET nResultado = -3;
	        SET cMensaje = 'Ya existe una concesionaria con ese nombre.';
	    ELSEIF existe_direccion > 0 THEN
	        SET nResultado = -4;
	        SET cMensaje = 'Ya existe una concesionaria con esa dirección.';
	    ELSE
	        UPDATE Concesionaria SET nombre = nombre_concesionaria, direccion = direccion_concesionaria WHERE idConcesionaria = id;
	        SET nResultado = 0;
	        SET cMensaje = '';
	    END IF;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Modificacion_Insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Modificacion_Insumo`(
	IN id INT,
    IN nombre VARCHAR(45),
    IN descripcion VARCHAR(100),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
	DECLARE existe INT;

    SELECT COUNT(*) INTO existe FROM Insumo WHERE idInsumo = id;
   
	IF existe = 0 THEN
        SET nResultado = -3;
        SET cMensaje = 'El insumo no existe.';
	ELSE
   		SELECT COUNT(*) INTO existe FROM Insumo i WHERE i.nombre = nombre AND i.idInsumo <> id;
	
		IF existe > 0 THEN
        	SET nResultado = -2;
        	SET cMensaje = 'Ya existe un insumo con ese nombre.';
    	ELSE
        	UPDATE Insumo i SET i.nombre = nombre , i.descripcion = descripcion WHERE i.idInsumo = id;
        	SET nResultado = 0;
        	SET cMensaje = '';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Modificacion_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elidev`@`localhost` PROCEDURE `Modificacion_Proveedor`(
	IN id INT,
    IN nombre VARCHAR(45),
    OUT nResultado INT,
    OUT cMensaje VARCHAR(255)
)
BEGIN
	DECLARE existe INT;

    SELECT COUNT(*) INTO existe FROM Proveedor WHERE idProveedor = id;
   
	IF existe = 0 THEN
        SET nResultado = -3;
        SET cMensaje = 'El proveedor no existe.';
	ELSE
   		SELECT COUNT(*) INTO existe FROM Proveedor p WHERE p.nombre = nombre AND p.idProveedor <> id;
	
		IF existe > 0 THEN
        	SET nResultado = -2;
        	SET cMensaje = 'Ya existe un proveedor con ese nombre.';
    	ELSE
        	UPDATE Proveedor p SET p.nombre = nombre WHERE p.idProveedor = id ;
        	SET nResultado = 0;
        	SET cMensaje = '';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14  0:24:35
