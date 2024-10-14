-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edsi
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `rut` varchar(9) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` varchar(10) DEFAULT NULL,
  `dirección` varchar(200) DEFAULT NULL,
  `telefono_fijo` varchar(10) DEFAULT NULL,
  `telefono_movil` varchar(10) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `comentarios` varchar(1000) DEFAULT NULL,
  `estado_civil_id_estado_civil` int NOT NULL,
  `comuna_id_comuna` int NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `fk_Cliente_Estado Civil1_idx` (`estado_civil_id_estado_civil`),
  KEY `fk_Cliente_Comuna1_idx` (`comuna_id_comuna`),
  CONSTRAINT `fk_Cliente_Comuna1` FOREIGN KEY (`comuna_id_comuna`) REFERENCES `comuna` (`id_comuna`),
  CONSTRAINT `fk_Cliente_Estado Civil1` FOREIGN KEY (`estado_civil_id_estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `num_compra` int NOT NULL AUTO_INCREMENT,
  `rut_proveedor` varchar(9) NOT NULL,
  `detalle_compra` varchar(300) DEFAULT NULL,
  `folio_documento` int NOT NULL,
  `tasa_impuesto` int DEFAULT NULL,
  `fecha_emision` datetime NOT NULL,
  `anulado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Proveedor_rut_proveedor` varchar(9) NOT NULL,
  `Tipo Documento_id_tipo_documento` int NOT NULL,
  `Tipo Impuesto_id_tipo_impuesto` int NOT NULL,
  PRIMARY KEY (`num_compra`),
  KEY `fk_Compra_Proveedor1_idx` (`Proveedor_rut_proveedor`),
  KEY `fk_Compra_Tipo Documento1_idx` (`Tipo Documento_id_tipo_documento`),
  KEY `fk_Compra_Tipo Impuesto1_idx` (`Tipo Impuesto_id_tipo_impuesto`),
  CONSTRAINT `fk_Compra_Proveedor1` FOREIGN KEY (`Proveedor_rut_proveedor`) REFERENCES `proveedor` (`rut_proveedor`),
  CONSTRAINT `fk_Compra_Tipo Documento1` FOREIGN KEY (`Tipo Documento_id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `fk_Compra_Tipo Impuesto1` FOREIGN KEY (`Tipo Impuesto_id_tipo_impuesto`) REFERENCES `tipo_impuesto` (`id_tipo_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `id_comuna` int NOT NULL AUTO_INCREMENT,
  `nombre_comuna` varchar(45) NOT NULL,
  PRIMARY KEY (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL,
  `cantidad` int NOT NULL,
  `Insumo_id_insumo` int NOT NULL,
  `Compra_num_compra` int NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_Detalle Compra_Insumo1_idx` (`Insumo_id_insumo`),
  KEY `fk_Detalle Compra_Compra1_idx` (`Compra_num_compra`),
  CONSTRAINT `fk_Detalle Compra_Compra1` FOREIGN KEY (`Compra_num_compra`) REFERENCES `compra` (`num_compra`),
  CONSTRAINT `fk_Detalle Compra_Insumo1` FOREIGN KEY (`Insumo_id_insumo`) REFERENCES `insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `Producto_cod_producto` varchar(9) NOT NULL,
  `Venta_num_venta` int NOT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `fk_Detalle Venta_Producto1_idx` (`Producto_cod_producto`),
  KEY `fk_Detalle Venta_Venta1_idx` (`Venta_num_venta`),
  CONSTRAINT `fk_Detalle Venta_Producto1` FOREIGN KEY (`Producto_cod_producto`) REFERENCES `producto` (`cod_producto`),
  CONSTRAINT `fk_Detalle Venta_Venta1` FOREIGN KEY (`Venta_num_venta`) REFERENCES `venta` (`num_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id_estado_civil` int NOT NULL AUTO_INCREMENT,
  `nombre_estado_civil` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `tipo_insumo` varchar(100) DEFAULT NULL,
  `descripción_insumo` varchar(300) NOT NULL,
  `monto_total_insumo` int NOT NULL,
  `monto_neto_insumo` int DEFAULT NULL,
  `monto_iva_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `cod_producto` varchar(9) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `precio_producto` int NOT NULL,
  PRIMARY KEY (`cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `rut_proveedor` varchar(9) NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `telefono_proveedor` int DEFAULT NULL,
  `direccion_proveedor` varchar(200) DEFAULT NULL,
  `correo_proveedor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`rut_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int NOT NULL,
  `nombre_tipo_documento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `num_venta` int NOT NULL,
  `Cliente_rut` varchar(9) NOT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `abono` int DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  PRIMARY KEY (`num_venta`),
  KEY `fk_Venta_Cliente_idx` (`Cliente_rut`),
  CONSTRAINT `fk_Venta_Cliente` FOREIGN KEY (`Cliente_rut`) REFERENCES `cliente` (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13 22:12:57
