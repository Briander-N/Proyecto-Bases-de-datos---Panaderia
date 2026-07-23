-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: zephyr.proxy.rlwy.net    Database: panaderia
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `Auditoria`
--

DROP TABLE IF EXISTS `Auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auditoria` (
  `ID_Auditoria` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(60) NOT NULL,
  `Accion` varchar(20) NOT NULL,
  `Tabla_Afectada` varchar(60) NOT NULL,
  `Detalle` varchar(255) DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auditoria`
--

LOCK TABLES `Auditoria` WRITE;
/*!40000 ALTER TABLE `Auditoria` DISABLE KEYS */;
INSERT INTO `Auditoria` VALUES (1,'admin_local','MANUAL','Sistema','Auditoría manual de prueba','2026-07-09 02:55:07'),(2,'root@%','INSERT','Clientes','Nuevo cliente ID=C999 Nombre=Prueba Insert','2026-07-11 00:57:57'),(3,'root@%','UPDATE','Clientes','Cliente ID=C999 | Antes: Prueba Insert, Tel=999999999 | Ahora: Prueba Insert, Tel=988888888','2026-07-11 01:29:16'),(4,'root@%','DELETE','Clientes','Cliente eliminado ID=C999 Nombre=Prueba Insert','2026-07-11 01:30:39'),(5,'root@%','INSERT','Ventas','Venta ID=V9999 Cliente=C001 Fecha=2026-07-11','2026-07-11 01:35:06'),(6,'root@%','INSERT','Ventas','Venta ID=V8888 Cliente=C002 Fecha=2026-07-11','2026-07-11 01:38:27'),(7,'root@%','INSERT','Clientes','Nuevo cliente ID=CLI201 Nombre=Carlos Mendoza','2026-07-11 16:41:27'),(8,'root@%','INSERT','Ventas','Venta ID=V201 Cliente=C041 Fecha=2026-07-11','2026-07-11 16:49:37'),(9,'root@%','INSERT','Ventas','Venta ID=V0202 Cliente=C041 Fecha=2026-07-11','2026-07-11 16:51:05');
/*!40000 ALTER TABLE `Auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `ID_Categoria` varchar(10) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Categoria`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES ('CAT05','Bebidas'),('CAT03','Bocadillos'),('CAT02','Pan'),('CAT01','Pasteles'),('CAT04','Repostería');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `ID_Cliente` varchar(10) NOT NULL,
  `Cedula` bigint NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Telefono` bigint NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Tipo_Cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('C001',1710000001,'Ana','Vera',986274909,'c1@mail.com','Calle 1','Nuevo'),('C002',1710000002,'Sofía','García',917215136,'c2@mail.com','Calle 2','Frecuente'),('C003',1710000003,'Carlos','López',992292490,'c3@mail.com','Calle 3','Frecuente'),('C004',1710000004,'Marta','García',985818365,'c4@mail.com','Calle 4','Frecuente'),('C005',1710000005,'Ana','León',959299517,'c5@mail.com','Calle 5','Nuevo'),('C006',1710000006,'José','Ruiz',930503363,'c6@mail.com','Calle 6','Frecuente'),('C007',1710000007,'Luis','Ruiz',974895855,'c7@mail.com','Calle 7','Mayorista'),('C008',1710000008,'Pedro','Pérez',910166811,'c8@mail.com','Calle 8','Nuevo'),('C009',1710000009,'María','García',973850363,'c9@mail.com','Calle 9','Nuevo'),('C010',1710000010,'Juan','Ruiz',978950720,'c10@mail.com','Calle 10','Mayorista'),('C011',1710000011,'Carlos','Pérez',910445712,'c11@mail.com','Calle 11','Nuevo'),('C012',1710000012,'Luis','Mendoza',953417212,'c12@mail.com','Calle 12','Nuevo'),('C013',1710000013,'María','Ruiz',973997932,'c13@mail.com','Calle 13','Nuevo'),('C014',1710000014,'Carlos','León',968219498,'c14@mail.com','Calle 14','Frecuente'),('C015',1710000015,'Marta','Ruiz',977330904,'c15@mail.com','Calle 15','Nuevo'),('C016',1710000016,'Sofía','León',974430749,'c16@mail.com','Calle 16','Nuevo'),('C017',1710000017,'Lucía','Vera',976275142,'c17@mail.com','Calle 17','Nuevo'),('C018',1710000018,'Pedro','Torres',915856869,'c18@mail.com','Calle 18','Frecuente'),('C019',1710000019,'Luis','García',992853319,'c19@mail.com','Calle 19','Mayorista'),('C020',1710000020,'Marta','Mendoza',975628662,'c20@mail.com','Calle 20','Mayorista'),('C021',1710000021,'Pedro','Ruiz',992446732,'c21@mail.com','Calle 21','Nuevo'),('C022',1710000022,'Lucía','León',943738481,'c22@mail.com','Calle 22','Nuevo'),('C023',1710000023,'Lucía','García',951679534,'c23@mail.com','Calle 23','Nuevo'),('C024',1710000024,'José','Pérez',940411479,'c24@mail.com','Calle 24','Nuevo'),('C025',1710000025,'María','López',952543954,'c25@mail.com','Calle 25','Mayorista'),('C026',1710000026,'Ana','López',958435462,'c26@mail.com','Calle 26','Nuevo'),('C027',1710000027,'Carlos','Pérez',912141725,'c27@mail.com','Calle 27','Frecuente'),('C028',1710000028,'Juan','López',919370241,'c28@mail.com','Calle 28','Frecuente'),('C029',1710000029,'Lucía','Ruiz',920497903,'c29@mail.com','Calle 29','Nuevo'),('C030',1710000030,'Carlos','Torres',947766530,'c30@mail.com','Calle 30','Frecuente'),('C031',1710000031,'Juan','Ruiz',918669048,'c31@mail.com','Calle 31','Frecuente'),('C032',1710000032,'Marta','López',953895403,'c32@mail.com','Calle 32','Nuevo'),('C033',1710000033,'José','García',944340769,'c33@mail.com','Calle 33','Mayorista'),('C034',1710000034,'Marta','León',923881792,'c34@mail.com','Calle 34','Frecuente'),('C035',1710000035,'José','Mendoza',997621633,'c35@mail.com','Calle 35','Mayorista'),('C037',1710000037,'Juan','López',913446568,'c37@mail.com','Calle 37','Frecuente'),('C038',1710000038,'José','Ruiz',919449434,'c38@mail.com','Calle 38','Nuevo'),('C039',1710000039,'Ana','López',931160907,'c39@mail.com','Calle 39','Frecuente'),('C040',1710000040,'Lucía','León',976169528,'c40@mail.com','Calle 40','Mayorista'),('C041',1710000041,'María','Mendoza',987654321,'maria@mail.com','Calle 41','Nuevo'),('CLI201',1234567890,'Carlos','Mendoza',987654321,'carlos@gmail.com','Loja','Nuevo');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Venta`
--

DROP TABLE IF EXISTS `Detalle_Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Venta` (
  `ID_Detalle` varchar(10) NOT NULL,
  `ID_Venta` varchar(10) NOT NULL,
  `ID_Producto` varchar(10) NOT NULL,
  `ID_Proveedor` varchar(10) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  `Promocion` varchar(30) NOT NULL DEFAULT 'Ninguna',
  `Descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Subtotal` decimal(10,2) NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Lote` varchar(20) DEFAULT NULL,
  `Fecha_Caducidad` date DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle`),
  KEY `fk_detalle_venta` (`ID_Venta`),
  KEY `fk_detalle_producto` (`ID_Producto`),
  KEY `fk_detalle_proveedor` (`ID_Proveedor`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`),
  CONSTRAINT `fk_detalle_proveedor` FOREIGN KEY (`ID_Proveedor`) REFERENCES `Proveedores` (`ID_Proveedor`),
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`ID_Venta`) REFERENCES `Ventas` (`ID_Venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Venta`
--

LOCK TABLES `Detalle_Venta` WRITE;
/*!40000 ALTER TABLE `Detalle_Venta` DISABLE KEYS */;
INSERT INTO `Detalle_Venta` VALUES ('DET001','V0001','P04','PR01',6,18.00,'10%',10.80,108.00,14.58,111.78,'L7216','2026-07-02'),('DET002','V0002','P07','PR04',1,0.50,'10%',0.05,0.50,0.07,0.52,'L4241','2026-01-30'),('DET003','V0003','P01','PR02',5,0.30,'10%',0.15,1.50,0.20,1.55,'L8023','2026-04-06'),('DET004','V0004','P06','PR03',6,1.50,'Ninguna',0.90,9.00,1.21,9.31,'L1717','2026-02-19'),('DET005','V0005','P04','PR02',2,18.00,'Cliente Frecuente',3.60,36.00,4.86,37.26,'L6332','2026-04-28'),('DET006','V0006','P08','PR04',4,1.40,'10%',0.00,5.60,0.84,6.44,'L2891','2026-04-26'),('DET007','V0007','P01','PR01',8,0.30,'Cliente Frecuente',0.24,2.40,0.32,2.48,'L8470','2026-04-04'),('DET008','V0008','P08','PR04',3,1.40,'Ninguna',0.42,4.20,0.57,4.35,'L1038','2026-06-18'),('DET009','V0009','P04','PR05',7,18.00,'Ninguna',12.60,126.00,17.01,130.41,'L4043','2026-06-16'),('DET010','V0010','P07','PR04',1,0.50,'10%',0.00,0.50,0.07,0.57,'L1400','2026-06-13'),('DET011','V0011','P01','PR01',8,0.30,'Cliente Frecuente',0.24,2.40,0.32,2.48,'L3177','2026-03-05'),('DET012','V0012','P02','PR02',3,1.20,'10%',0.00,3.60,0.54,4.14,'L7356','2026-04-09'),('DET013','V0013','P03','PR02',5,0.80,'Cliente Frecuente',0.00,4.00,0.60,4.60,'L1853','2026-04-24'),('DET014','V0014','P03','PR03',7,0.80,'Cliente Frecuente',0.00,5.60,0.84,6.44,'L3111','2026-02-12'),('DET015','V0015','P09','PR03',4,0.40,'10%',0.16,1.60,0.22,1.66,'L5536','2026-02-13'),('DET016','V0016','P10','PR02',4,1.00,'Ninguna',0.00,4.00,0.60,4.60,'L9160','2026-06-12'),('DET017','V0017','P07','PR02',7,0.50,'Ninguna',0.00,3.50,0.53,4.03,'L6133','2026-03-13'),('DET018','V0018','P01','PR03',7,0.30,'Cliente Frecuente',0.21,2.10,0.28,2.17,'L5042','2026-05-13'),('DET019','V0019','P04','PR05',2,18.00,'Cliente Frecuente',0.00,36.00,5.40,41.40,'L8846','2026-01-19'),('DET020','V0020','P05','PR01',3,1.20,'Ninguna',0.00,3.60,0.54,4.14,'L4101','2026-04-30'),('DET021','V0021','P09','PR05',4,0.40,'Cliente Frecuente',0.00,1.60,0.24,1.84,'L5850','2026-05-10'),('DET022','V0022','P03','PR04',4,0.80,'2x1',0.32,3.20,0.43,3.31,'L8428','2026-03-21'),('DET023','V0023','P08','PR03',7,1.40,'Ninguna',0.98,9.80,1.32,10.14,'L4973','2026-07-06'),('DET024','V0024','P06','PR03',3,1.50,'10%',0.45,4.50,0.61,4.66,'L6088','2026-04-25'),('DET025','V0025','P06','PR03',6,1.50,'Ninguna',0.90,9.00,1.21,9.31,'L9521','2026-04-25'),('DET026','V0026','P08','PR02',1,1.40,'10%',0.14,1.40,0.19,1.45,'L6062','2026-02-22'),('DET027','V0027','P03','PR02',3,0.80,'Cliente Frecuente',0.24,2.40,0.32,2.48,'L8896','2026-06-28'),('DET028','V0028','P02','PR01',3,1.20,'10%',0.36,3.60,0.49,3.73,'L8981','2026-03-12'),('DET029','V0029','P10','PR02',5,1.00,'Cliente Frecuente',0.50,5.00,0.67,5.17,'L4905','2026-03-16'),('DET030','V0030','P04','PR03',3,18.00,'10%',0.00,54.00,8.10,62.10,'L3754','2026-05-21'),('DET031','V0031','P01','PR02',3,0.30,'Cliente Frecuente',0.09,0.90,0.12,0.93,'L7185','2026-02-24'),('DET032','V0032','P08','PR03',8,1.40,'Ninguna',0.00,11.20,1.68,12.88,'L9080','2026-06-03'),('DET033','V0033','P09','PR02',1,0.40,'10%',0.00,0.40,0.06,0.46,'L1153','2026-02-05'),('DET034','V0034','P01','PR01',3,0.30,'Ninguna',0.09,0.90,0.12,0.93,'L5600','2026-02-17'),('DET035','V0035','P06','PR03',3,1.50,'Ninguna',0.45,4.50,0.61,4.66,'L3975','2026-04-24'),('DET036','V0036','P03','PR03',5,0.80,'10%',0.40,4.00,0.54,4.14,'L9984','2026-06-12'),('DET037','V0037','P07','PR01',2,0.50,'Ninguna',0.00,1.00,0.15,1.15,'L7437','2026-02-11'),('DET038','V0038','P04','PR02',3,18.00,'2x1',5.40,54.00,7.29,55.89,'L8386','2026-01-28'),('DET039','V0039','P02','PR05',4,1.20,'10%',0.00,4.80,0.72,5.52,'L5894','2026-04-22'),('DET040','V0040','P06','PR04',8,1.50,'10%',1.20,12.00,1.62,12.42,'L1227','2026-06-09'),('DET041','V0041','P03','PR05',4,0.80,'10%',0.00,3.20,0.48,3.68,'L8125','2026-05-27'),('DET042','V0042','P09','PR04',7,0.40,'Cliente Frecuente',0.00,2.80,0.42,3.22,'L1907','2026-07-07'),('DET043','V0043','P03','PR01',7,0.80,'2x1',0.56,5.60,0.76,5.80,'L1920','2026-04-10'),('DET044','V0044','P03','PR02',2,0.80,'10%',0.16,1.60,0.22,1.66,'L7214','2026-02-17'),('DET045','V0045','P06','PR02',6,1.50,'10%',0.00,9.00,1.35,10.35,'L3407','2026-07-14'),('DET046','V0046','P09','PR05',6,0.40,'Ninguna',0.00,2.40,0.36,2.76,'L9533','2026-06-02'),('DET047','V0047','P04','PR01',3,18.00,'Cliente Frecuente',5.40,54.00,7.29,55.89,'L1177','2026-04-04'),('DET048','V0048','P07','PR02',5,0.50,'10%',0.25,2.50,0.34,2.59,'L9899','2026-04-26'),('DET049','V0049','P07','PR01',5,0.50,'Ninguna',0.00,2.50,0.38,2.88,'L3254','2026-03-16'),('DET050','V0050','P06','PR05',5,1.50,'10%',0.00,7.50,1.12,8.62,'L5372','2026-02-28'),('DET051','V0051','P10','PR05',1,1.00,'Cliente Frecuente',0.10,1.00,0.14,1.04,'L9288','2026-06-14'),('DET052','V0052','P01','PR05',4,0.30,'Cliente Frecuente',0.12,1.20,0.16,1.24,'L9180','2026-05-29'),('DET053','V0053','P03','PR05',1,0.80,'Ninguna',0.08,0.80,0.11,0.83,'L9343','2026-06-06'),('DET054','V0054','P09','PR02',6,0.40,'2x1',0.00,2.40,0.36,2.76,'L5802','2026-04-26'),('DET055','V0055','P06','PR03',5,1.50,'Cliente Frecuente',0.00,7.50,1.12,8.62,'L1452','2026-04-26'),('DET056','V0056','P05','PR01',8,1.20,'Ninguna',0.00,9.60,1.44,11.04,'L7147','2026-05-22'),('DET057','V0057','P06','PR03',1,1.50,'Cliente Frecuente',0.15,1.50,0.20,1.55,'L9083','2026-03-17'),('DET058','V0058','P07','PR04',2,0.50,'Cliente Frecuente',0.10,1.00,0.14,1.04,'L6564','2026-05-22'),('DET059','V0059','P10','PR03',2,1.00,'Ninguna',0.00,2.00,0.30,2.30,'L7563','2026-04-05'),('DET060','V0060','P08','PR04',1,1.40,'Cliente Frecuente',0.14,1.40,0.19,1.45,'L6313','2026-04-11'),('DET061','V0061','P10','PR05',4,1.00,'Ninguna',0.40,4.00,0.54,4.14,'L4585','2026-07-10'),('DET062','V0062','P02','PR03',2,1.20,'2x1',0.24,2.40,0.32,2.48,'L5944','2026-05-23'),('DET063','V0063','P03','PR04',8,0.80,'2x1',0.64,6.40,0.86,6.62,'L3532','2026-07-12'),('DET064','V0064','P06','PR01',5,1.50,'Cliente Frecuente',0.75,7.50,1.01,7.76,'L1673','2026-05-10'),('DET065','V0065','P03','PR02',1,0.80,'Ninguna',0.00,0.80,0.12,0.92,'L8889','2026-03-29'),('DET066','V0066','P10','PR03',7,1.00,'Ninguna',0.70,7.00,0.94,7.24,'L3510','2026-03-08'),('DET067','V0067','P08','PR03',8,1.40,'Ninguna',1.12,11.20,1.51,11.59,'L5861','2026-06-04'),('DET068','V0068','P07','PR03',4,0.50,'2x1',0.00,2.00,0.30,2.30,'L9685','2026-02-07'),('DET069','V0069','P02','PR05',1,1.20,'2x1',0.12,1.20,0.16,1.24,'L9033','2026-06-16'),('DET070','V0070','P09','PR01',7,0.40,'2x1',0.00,2.80,0.42,3.22,'L6560','2026-01-26'),('DET071','V0071','P04','PR01',7,18.00,'Ninguna',12.60,126.00,17.01,130.41,'L9426','2026-06-18'),('DET072','V0072','P01','PR03',6,0.30,'Ninguna',0.00,1.80,0.27,2.07,'L6148','2026-02-07'),('DET073','V0073','P05','PR01',7,1.20,'2x1',0.84,8.40,1.13,8.69,'L3041','2026-03-04'),('DET074','V0074','P03','PR03',1,0.80,'2x1',0.00,0.80,0.12,0.92,'L8571','2026-02-14'),('DET075','V0075','P04','PR02',6,18.00,'10%',10.80,108.00,14.58,111.78,'L3075','2026-04-16'),('DET076','V0076','P08','PR02',6,1.40,'2x1',0.84,8.40,1.13,8.69,'L7217','2026-03-01'),('DET077','V0077','P08','PR01',6,1.40,'10%',0.84,8.40,1.13,8.69,'L9191','2026-06-14'),('DET078','V0078','P08','PR03',7,1.40,'10%',0.98,9.80,1.32,10.14,'L1037','2026-05-30'),('DET079','V0079','P08','PR01',5,1.40,'Cliente Frecuente',0.70,7.00,0.94,7.24,'L3704','2026-03-07'),('DET080','V0080','P02','PR03',2,1.20,'Ninguna',0.24,2.40,0.32,2.48,'L5365','2026-03-02'),('DET081','V0081','P06','PR01',7,1.50,'Ninguna',1.05,10.50,1.42,10.87,'L2646','2026-05-26'),('DET082','V0082','P09','PR04',6,0.40,'Ninguna',0.24,2.40,0.32,2.48,'L1081','2026-06-03'),('DET083','V0083','P07','PR01',5,0.50,'Cliente Frecuente',0.00,2.50,0.38,2.88,'L3347','2026-02-26'),('DET084','V0084','P10','PR01',6,1.00,'Ninguna',0.00,6.00,0.90,6.90,'L9150','2026-01-28'),('DET085','V0085','P02','PR04',5,1.20,'Cliente Frecuente',0.60,6.00,0.81,6.21,'L9580','2026-02-02'),('DET086','V0086','P02','PR01',7,1.20,'Ninguna',0.00,8.40,1.26,9.66,'L7321','2026-06-04'),('DET087','V0087','P05','PR01',7,1.20,'2x1',0.84,8.40,1.13,8.69,'L8438','2026-06-28'),('DET088','V0088','P01','PR02',4,0.30,'10%',0.12,1.20,0.16,1.24,'L1086','2026-04-26'),('DET089','V0089','P06','PR01',5,1.50,'2x1',0.75,7.50,1.01,7.76,'L7515','2026-02-16'),('DET090','V0090','P04','PR04',4,18.00,'2x1',0.00,72.00,10.80,82.80,'L8353','2026-05-08'),('DET091','V0091','P04','PR05',4,18.00,'Cliente Frecuente',0.00,72.00,10.80,82.80,'L3411','2026-05-18'),('DET092','V0092','P03','PR04',4,0.80,'Ninguna',0.32,3.20,0.43,3.31,'L8257','2026-04-28'),('DET093','V0093','P02','PR03',1,1.20,'10%',0.12,1.20,0.16,1.24,'L6768','2026-01-24'),('DET094','V0094','P09','PR01',7,0.40,'10%',0.28,2.80,0.38,2.90,'L1388','2026-04-25'),('DET095','V0095','P08','PR04',7,1.40,'10%',0.98,9.80,1.32,10.14,'L2796','2026-06-23'),('DET096','V0096','P07','PR05',7,0.50,'Ninguna',0.35,3.50,0.47,3.62,'L4493','2026-01-18'),('DET097','V0097','P10','PR03',8,1.00,'Ninguna',0.80,8.00,1.08,8.28,'L3627','2026-07-22'),('DET098','V0098','P07','PR01',8,0.50,'Ninguna',0.00,4.00,0.60,4.60,'L4421','2026-04-12'),('DET099','V0099','P01','PR05',6,0.30,'10%',0.00,1.80,0.27,2.07,'L9224','2026-03-14'),('DET100','V0100','P04','PR05',6,18.00,'10%',0.00,108.00,16.20,124.20,'L2449','2026-02-10'),('DET101','V0101','P02','PR04',2,1.20,'Cliente Frecuente',0.24,2.40,0.32,2.48,'L9804','2026-07-19'),('DET102','V0102','P10','PR01',6,1.00,'2x1',0.00,6.00,0.90,6.90,'L5631','2026-07-04'),('DET103','V0103','P08','PR03',5,1.40,'10%',0.70,7.00,0.94,7.24,'L8046','2026-06-03'),('DET104','V0104','P04','PR02',7,18.00,'10%',12.60,126.00,17.01,130.41,'L4433','2026-04-12'),('DET105','V0105','P10','PR01',6,1.00,'10%',0.60,6.00,0.81,6.21,'L6291','2026-02-12'),('DET106','V0106','P04','PR03',1,18.00,'2x1',1.80,18.00,2.43,18.63,'L2466','2026-02-15'),('DET107','V0107','P01','PR03',7,0.30,'Cliente Frecuente',0.21,2.10,0.28,2.17,'L9539','2026-05-29'),('DET108','V0108','P04','PR02',3,18.00,'2x1',5.40,54.00,7.29,55.89,'L3122','2026-06-21'),('DET109','V0109','P08','PR03',6,1.40,'Ninguna',0.84,8.40,1.13,8.69,'L6625','2026-05-21'),('DET110','V0110','P01','PR02',3,0.30,'Cliente Frecuente',0.00,0.90,0.14,1.04,'L9694','2026-06-24'),('DET111','V0111','P02','PR05',7,1.20,'Ninguna',0.84,8.40,1.13,8.69,'L1016','2026-03-03'),('DET112','V0112','P06','PR05',4,1.50,'Cliente Frecuente',0.60,6.00,0.81,6.21,'L3796','2026-02-28'),('DET113','V0113','P08','PR01',5,1.40,'10%',0.70,7.00,0.94,7.24,'L6261','2026-04-03'),('DET114','V0114','P03','PR01',5,0.80,'Ninguna',0.40,4.00,0.54,4.14,'L6692','2026-03-25'),('DET115','V0115','P08','PR05',4,1.40,'Cliente Frecuente',0.00,5.60,0.84,6.44,'L1815','2026-02-03'),('DET116','V0116','P04','PR04',2,18.00,'Cliente Frecuente',3.60,36.00,4.86,37.26,'L7710','2026-02-05'),('DET117','V0117','P04','PR02',8,18.00,'10%',14.40,144.00,19.44,149.04,'L1921','2026-06-13'),('DET118','V0118','P02','PR05',7,1.20,'2x1',0.84,8.40,1.13,8.69,'L7147','2026-06-29'),('DET119','V0119','P10','PR01',2,1.00,'2x1',0.20,2.00,0.27,2.07,'L7408','2026-03-18'),('DET120','V0120','P08','PR01',1,1.40,'Ninguna',0.14,1.40,0.19,1.45,'L2690','2026-06-03'),('DET121','V0121','P08','PR04',8,1.40,'Ninguna',1.12,11.20,1.51,11.59,'L2179','2026-07-24'),('DET122','V0122','P08','PR04',3,1.40,'Cliente Frecuente',0.42,4.20,0.57,4.35,'L6312','2026-04-14'),('DET123','V0123','P09','PR02',8,0.40,'2x1',0.32,3.20,0.43,3.31,'L5810','2026-06-04'),('DET124','V0124','P07','PR02',1,0.50,'10%',0.00,0.50,0.07,0.57,'L1902','2026-05-07'),('DET125','V0125','P01','PR03',6,0.30,'Ninguna',0.18,1.80,0.24,1.86,'L9263','2026-02-17'),('DET126','V0126','P04','PR04',1,18.00,'Cliente Frecuente',1.80,18.00,2.43,18.63,'L2514','2026-06-19'),('DET127','V0127','P06','PR04',7,1.50,'10%',1.05,10.50,1.42,10.87,'L3604','2026-05-07'),('DET128','V0128','P10','PR03',4,1.00,'Ninguna',0.40,4.00,0.54,4.14,'L2494','2026-01-30'),('DET129','V0129','P06','PR04',7,1.50,'Cliente Frecuente',0.00,10.50,1.57,12.07,'L5926','2026-04-29'),('DET130','V0130','P01','PR04',8,0.30,'Ninguna',0.24,2.40,0.32,2.48,'L5914','2026-04-29'),('DET131','V0131','P01','PR03',4,0.30,'Ninguna',0.12,1.20,0.16,1.24,'L9352','2026-02-10'),('DET132','V0132','P07','PR04',7,0.50,'Ninguna',0.35,3.50,0.47,3.62,'L8777','2026-05-14'),('DET133','V0133','P03','PR01',6,0.80,'10%',0.48,4.80,0.65,4.97,'L7786','2026-05-03'),('DET134','V0134','P07','PR05',6,0.50,'Ninguna',0.00,3.00,0.45,3.45,'L9090','2026-05-28'),('DET135','V0135','P03','PR05',1,0.80,'2x1',0.00,0.80,0.12,0.92,'L1890','2026-02-17'),('DET136','V0136','P08','PR01',3,1.40,'Ninguna',0.00,4.20,0.63,4.83,'L8790','2026-04-12'),('DET137','V0137','P01','PR01',6,0.30,'Cliente Frecuente',0.18,1.80,0.24,1.86,'L6620','2026-06-21'),('DET138','V0138','P03','PR02',4,0.80,'2x1',0.32,3.20,0.43,3.31,'L7473','2026-02-05'),('DET139','V0139','P05','PR01',5,1.20,'Cliente Frecuente',0.60,6.00,0.81,6.21,'L7831','2026-01-29'),('DET140','V0140','P05','PR03',1,1.20,'10%',0.12,1.20,0.16,1.24,'L9172','2026-04-04'),('DET141','V0141','P08','PR01',7,1.40,'Cliente Frecuente',0.00,9.80,1.47,11.27,'L1645','2026-07-18'),('DET142','V0142','P01','PR05',6,0.30,'10%',0.00,1.80,0.27,2.07,'L5536','2026-04-09'),('DET143','V0143','P03','PR03',8,0.80,'Ninguna',0.00,6.40,0.96,7.36,'L1120','2026-02-03'),('DET144','V0144','P06','PR02',6,1.50,'Cliente Frecuente',0.90,9.00,1.21,9.31,'L4644','2026-07-03'),('DET145','V0145','P06','PR05',8,1.50,'Cliente Frecuente',1.20,12.00,1.62,12.42,'L7351','2026-02-19'),('DET146','V0146','P01','PR05',6,0.30,'10%',0.18,1.80,0.24,1.86,'L9502','2026-01-23'),('DET147','V0147','P04','PR04',6,18.00,'Ninguna',10.80,108.00,14.58,111.78,'L2781','2026-07-06'),('DET148','V0148','P04','PR01',6,18.00,'2x1',10.80,108.00,14.58,111.78,'L7455','2026-03-27'),('DET149','V0149','P03','PR03',7,0.80,'2x1',0.56,5.60,0.76,5.80,'L1496','2026-03-11'),('DET150','V0150','P04','PR03',2,18.00,'10%',0.00,36.00,5.40,41.40,'L1802','2026-06-04'),('DET151','V0151','P07','PR02',6,0.50,'Cliente Frecuente',0.30,3.00,0.41,3.11,'L7335','2026-05-23'),('DET152','V0152','P08','PR04',4,1.40,'Ninguna',0.00,5.60,0.84,6.44,'L8340','2026-06-25'),('DET153','V0153','P08','PR03',4,1.40,'Cliente Frecuente',0.56,5.60,0.76,5.80,'L2798','2026-02-13'),('DET154','V0154','P01','PR02',4,0.30,'Cliente Frecuente',0.12,1.20,0.16,1.24,'L6465','2026-05-25'),('DET155','V0155','P06','PR01',6,1.50,'2x1',0.90,9.00,1.21,9.31,'L9956','2026-04-11'),('DET156','V0156','P01','PR03',8,0.30,'Ninguna',0.24,2.40,0.32,2.48,'L5742','2026-06-16'),('DET157','V0157','P05','PR04',2,1.20,'Ninguna',0.24,2.40,0.32,2.48,'L8078','2026-04-22'),('DET158','V0158','P07','PR04',1,0.50,'Ninguna',0.05,0.50,0.07,0.52,'L1883','2026-04-17'),('DET159','V0159','P09','PR04',7,0.40,'Cliente Frecuente',0.28,2.80,0.38,2.90,'L7272','2026-01-07'),('DET160','V0160','P04','PR02',5,18.00,'Cliente Frecuente',9.00,90.00,12.15,93.15,'L4324','2026-06-03'),('DET161','V0161','P05','PR01',5,1.20,'Ninguna',0.60,6.00,0.81,6.21,'L9069','2026-05-07'),('DET162','V0162','P05','PR01',4,1.20,'10%',0.48,4.80,0.65,4.97,'L5001','2026-04-12'),('DET163','V0163','P08','PR03',4,1.40,'Ninguna',0.00,5.60,0.84,6.44,'L3333','2026-04-27'),('DET164','V0164','P01','PR04',4,0.30,'Ninguna',0.00,1.20,0.18,1.38,'L5728','2026-03-25'),('DET165','V0165','P10','PR01',1,1.00,'Cliente Frecuente',0.00,1.00,0.15,1.15,'L3578','2026-05-16'),('DET166','V0166','P07','PR05',6,0.50,'Ninguna',0.30,3.00,0.41,3.11,'L5620','2026-02-18'),('DET167','V0167','P08','PR04',3,1.40,'Ninguna',0.42,4.20,0.57,4.35,'L7079','2026-02-25'),('DET168','V0168','P10','PR03',1,1.00,'2x1',0.00,1.00,0.15,1.15,'L5682','2026-03-25'),('DET169','V0169','P09','PR04',2,0.40,'10%',0.08,0.80,0.11,0.83,'L2154','2026-03-30'),('DET170','V0170','P10','PR01',4,1.00,'Cliente Frecuente',0.00,4.00,0.60,4.60,'L9337','2026-02-10'),('DET171','V0171','P07','PR04',8,0.50,'10%',0.00,4.00,0.60,4.60,'L5695','2026-02-24'),('DET172','V0172','P05','PR05',6,1.20,'2x1',0.72,7.20,0.97,7.45,'L4727','2026-05-25'),('DET173','V0173','P06','PR05',4,1.50,'Cliente Frecuente',0.00,6.00,0.90,6.90,'L7927','2026-05-03'),('DET174','V0174','P03','PR04',3,0.80,'Cliente Frecuente',0.00,2.40,0.36,2.76,'L2758','2026-02-09'),('DET175','V0175','P02','PR01',1,1.20,'Ninguna',0.12,1.20,0.16,1.24,'L9454','2026-07-28'),('DET176','V0176','P05','PR03',1,1.20,'10%',0.00,1.20,0.18,1.38,'L7674','2026-01-26'),('DET177','V0177','P05','PR01',7,1.20,'Cliente Frecuente',0.00,8.40,1.26,9.66,'L1707','2026-05-04'),('DET178','V0178','P03','PR03',2,0.80,'2x1',0.00,1.60,0.24,1.84,'L1047','2026-04-04'),('DET179','V0179','P08','PR05',8,1.40,'Cliente Frecuente',1.12,11.20,1.51,11.59,'L1831','2026-03-26'),('DET180','V0180','P08','PR03',7,1.40,'2x1',0.00,9.80,1.47,11.27,'L7185','2026-03-11'),('DET181','V0181','P05','PR05',1,1.20,'Cliente Frecuente',0.00,1.20,0.18,1.38,'L6132','2026-04-01'),('DET182','V0182','P02','PR03',8,1.20,'2x1',0.00,9.60,1.44,11.04,'L5936','2026-03-06'),('DET183','V0183','P10','PR04',3,1.00,'Ninguna',0.00,3.00,0.45,3.45,'L9503','2026-06-30'),('DET184','V0184','P06','PR04',5,1.50,'Cliente Frecuente',0.00,7.50,1.12,8.62,'L8157','2026-01-28'),('DET185','V0185','P09','PR05',3,0.40,'Cliente Frecuente',0.12,1.20,0.16,1.24,'L1615','2026-03-31'),('DET186','V0186','P03','PR01',6,0.80,'Ninguna',0.48,4.80,0.65,4.97,'L5580','2026-03-22'),('DET187','V0187','P10','PR02',2,1.00,'10%',0.20,2.00,0.27,2.07,'L3812','2026-04-17'),('DET188','V0188','P10','PR01',4,1.00,'Ninguna',0.00,4.00,0.60,4.60,'L9961','2026-05-06'),('DET189','V0189','P06','PR03',7,1.50,'Cliente Frecuente',0.00,10.50,1.57,12.07,'L6717','2026-05-03'),('DET190','V0190','P02','PR03',3,1.20,'Cliente Frecuente',0.36,3.60,0.49,3.73,'L5346','2026-06-04'),('DET191','V0191','P07','PR02',4,0.50,'Ninguna',0.20,2.00,0.27,2.07,'L8171','2026-03-16'),('DET192','V0192','P05','PR02',2,1.20,'2x1',0.24,2.40,0.32,2.48,'L3793','2026-04-19'),('DET193','V0193','P05','PR04',3,1.20,'Cliente Frecuente',0.36,3.60,0.49,3.73,'L3238','2026-06-03'),('DET194','V0194','P07','PR02',2,0.50,'10%',0.10,1.00,0.14,1.04,'L7190','2026-02-18'),('DET195','V0195','P04','PR05',8,18.00,'2x1',0.00,144.00,21.60,165.60,'L4495','2026-04-09'),('DET196','V0196','P05','PR01',2,1.20,'2x1',0.24,2.40,0.32,2.48,'L7869','2026-05-06'),('DET197','V0197','P01','PR01',6,0.30,'Ninguna',0.00,1.80,0.27,2.07,'L6227','2026-03-04'),('DET198','V0198','P06','PR04',7,1.50,'2x1',1.05,10.50,1.42,10.87,'L6853','2026-02-22'),('DET199','V0199','P06','PR02',6,1.50,'Cliente Frecuente',0.90,9.00,1.21,9.31,'L7723','2026-01-28'),('DET200','V0200','P10','PR02',7,1.00,'Ninguna',0.70,7.00,0.94,7.24,'L1846','2026-04-05'),('DET201','V0201','P01','PR01',5,0.30,'10%',0.15,1.35,0.20,1.55,'L9999','2026-07-15');
/*!40000 ALTER TABLE `Detalle_Venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `ID_Empleado` varchar(10) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Cargo` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES ('E01','Diego','Administrador'),('E02','Paula','Cajero'),('E03','Kevin','Cajero'),('E04','Rosa','Panadero'),('E05','David','Panadero'),('E06','Nora','Cajero'),('E07','Luis','Panadero'),('E08','Mónica','Administrador'),('E09','Carlos','Vendedor');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HistorialPrecios`
--

DROP TABLE IF EXISTS `HistorialPrecios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HistorialPrecios` (
  `ID_Historial` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` varchar(10) NOT NULL,
  `Precio_Anterior` decimal(10,2) NOT NULL,
  `Precio_Nuevo` decimal(10,2) NOT NULL,
  `Fecha_Cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Historial`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `HistorialPrecios_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `Productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HistorialPrecios`
--

LOCK TABLES `HistorialPrecios` WRITE;
/*!40000 ALTER TABLE `HistorialPrecios` DISABLE KEYS */;
INSERT INTO `HistorialPrecios` VALUES (1,'P999',5.00,7.50,'2026-07-11 01:37:37');
/*!40000 ALTER TABLE `HistorialPrecios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marcas`
--

DROP TABLE IF EXISTS `Marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marcas` (
  `ID_Marca` varchar(10) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Marca`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marcas`
--

LOCK TABLES `Marcas` WRITE;
/*!40000 ALTER TABLE `Marcas` DISABLE KEYS */;
INSERT INTO `Marcas` VALUES ('MAR02','Bimbo'),('MAR03','Casera'),('MAR01','Delicia'),('MAR05','Dulce'),('MAR04','La Ideal'),('MAR07','Lojano'),('MAR06','Natural');
/*!40000 ALTER TABLE `Marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MetodosPago`
--

DROP TABLE IF EXISTS `MetodosPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MetodosPago` (
  `ID_MetodoPago` varchar(10) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_MetodoPago`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MetodosPago`
--

LOCK TABLES `MetodosPago` WRITE;
/*!40000 ALTER TABLE `MetodosPago` DISABLE KEYS */;
INSERT INTO `MetodosPago` VALUES ('MP01','Efectivo'),('MP02','QR'),('MP04','Tarjeta'),('MP03','Transferencia');
/*!40000 ALTER TABLE `MetodosPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `ID_Producto` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ID_Categoria` varchar(10) NOT NULL,
  `ID_Marca` varchar(10) NOT NULL,
  `Unidad` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `fk_producto_categoria` (`ID_Categoria`),
  KEY `fk_producto_marca` (`ID_Marca`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categorias` (`ID_Categoria`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`ID_Marca`) REFERENCES `Marcas` (`ID_Marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES ('P01','Pan Francés','CAT02','MAR02','Unidad',0.35),('P02','Croissant','CAT04','MAR04','Unidad',1.20),('P03','Dona','CAT04','MAR05','Unidad',0.80),('P04','Pastel Chocolate','CAT01','MAR01','Unidad',18.00),('P05','Café','CAT05','MAR07','Taza',1.20),('P06','Empanada','CAT03','MAR03','Unidad',1.50),('P07','Pan Integral','CAT02','MAR02','Unidad',0.50),('P08','Brownie','CAT01','MAR01','Unidad',1.40),('P09','Galleta','CAT04','MAR05','Unidad',0.40),('P10','Jugo','CAT05','MAR06','Vaso',1.00),('P11','Pan de Ajo','CAT02','MAR02','Unidad',1.50);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `ID_Proveedor` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `Telefono` bigint NOT NULL,
  `Correo` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES ('PR01','Harinas Andinas','Quito',21440029,'harinasandinas@proveedor.com'),('PR02','Lácteos Sierra','Latacunga',21492788,'lácteossierra@proveedor.com'),('PR03','Chocolate Ecuador','Quito',21225430,'chocolateecuador@proveedor.com'),('PR04','Azúcar Nacional','Guayaquil',24700838,'azúcarnacional@proveedor.com'),('PR05','Café Andino','Loja',22767457,'caféandino@proveedor.com'),('PR06','Distribuidora Nacional','Quito',22345678,'distribuidora@proveedor.com');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sucursales`
--

DROP TABLE IF EXISTS `Sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sucursales` (
  `ID_Sucursal` varchar(10) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sucursales`
--

LOCK TABLES `Sucursales` WRITE;
/*!40000 ALTER TABLE `Sucursales` DISABLE KEYS */;
INSERT INTO `Sucursales` VALUES ('S01','Centro','Quito'),('S02','Norte','Quito'),('S03','Sur','Quito');
/*!40000 ALTER TABLE `Sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `ID_Venta` varchar(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Estado_Venta` varchar(20) NOT NULL,
  `ID_Cliente` varchar(10) NOT NULL,
  `ID_Empleado` varchar(10) NOT NULL,
  `ID_Sucursal` varchar(10) NOT NULL,
  `ID_MetodoPago` varchar(10) NOT NULL,
  `Observacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `fk_venta_cliente` (`ID_Cliente`),
  KEY `fk_venta_empleado` (`ID_Empleado`),
  KEY `fk_venta_sucursal` (`ID_Sucursal`),
  KEY `fk_venta_metodopago` (`ID_MetodoPago`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes` (`ID_Cliente`),
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `Empleados` (`ID_Empleado`),
  CONSTRAINT `fk_venta_metodopago` FOREIGN KEY (`ID_MetodoPago`) REFERENCES `MetodosPago` (`ID_MetodoPago`),
  CONSTRAINT `fk_venta_sucursal` FOREIGN KEY (`ID_Sucursal`) REFERENCES `Sucursales` (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES ('V0001','2026-06-06','18:42:00','Entregada','C027','E05','S02','MP01',''),('V0002','2026-01-26','19:23:00','Pagada','C037','E02','S03','MP02',''),('V0003','2026-03-12','16:11:00','Pagada','C017','E07','S01','MP03','Venta matutina'),('V0004','2026-02-05','09:11:00','Entregada','C011','E08','S01','MP01',''),('V0005','2026-04-24','14:02:00','Entregada','C017','E04','S01','MP02','Venta matutina'),('V0006','2026-04-23','18:20:00','Entregada','C018','E07','S03','MP02',''),('V0007','2026-03-21','18:18:00','Pagada','C027','E07','S03','MP02',''),('V0008','2026-05-30','12:35:00','Pagada','C003','E02','S03','MP04','Venta matutina'),('V0009','2026-06-03','16:07:00','Entregada','C030','E08','S01','MP01','Pedido especial'),('V0010','2026-05-31','12:45:00','Pagada','C002','E02','S02','MP01','Venta matutina'),('V0011','2026-03-03','15:38:00','Entregada','C001','E05','S01','MP03',''),('V0012','2026-04-07','14:47:00','Entregada','C037','E08','S03','MP02','Pedido especial'),('V0013','2026-04-09','14:16:00','Pagada','C018','E06','S02','MP03','Pedido especial'),('V0014','2026-02-09','09:36:00','Pagada','C024','E02','S03','MP01','Pedido especial'),('V0015','2026-02-11','07:46:00','Pagada','C023','E04','S01','MP03','Venta matutina'),('V0016','2026-05-14','16:36:00','Pagada','C027','E04','S01','MP03',''),('V0017','2026-03-06','11:09:00','Pagada','C010','E02','S02','MP01','Venta matutina'),('V0018','2026-04-14','18:35:00','Entregada','C014','E03','S03','MP03','Pedido especial'),('V0019','2026-01-13','07:53:00','Pagada','C007','E07','S02','MP01',''),('V0020','2026-04-11','18:02:00','Pagada','C035','E01','S03','MP04','Pedido especial'),('V0021','2026-04-13','18:12:00','Entregada','C023','E02','S03','MP03',''),('V0022','2026-03-05','09:40:00','Entregada','C013','E05','S03','MP02','Venta matutina'),('V0023','2026-06-15','11:28:00','Pagada','C025','E02','S03','MP02',''),('V0024','2026-04-13','12:38:00','Pagada','C033','E05','S03','MP01',''),('V0025','2026-04-06','11:52:00','Pagada','C001','E07','S02','MP01','Pedido especial'),('V0026','2026-01-27','15:02:00','Entregada','C037','E08','S01','MP03',''),('V0027','2026-06-05','08:21:00','Entregada','C012','E04','S02','MP03',''),('V0028','2026-02-25','13:40:00','Pagada','C023','E05','S03','MP02','Pedido especial'),('V0029','2026-03-07','16:57:00','Entregada','C013','E08','S01','MP01',''),('V0030','2026-04-22','11:17:00','Pagada','C022','E05','S03','MP02',''),('V0031','2026-02-09','17:15:00','Entregada','C006','E02','S03','MP03',''),('V0032','2026-05-09','17:54:00','Entregada','C005','E06','S03','MP04','Venta matutina'),('V0033','2026-01-13','19:13:00','Entregada','C004','E07','S02','MP04','Pedido especial'),('V0034','2026-02-10','17:30:00','Pagada','C006','E05','S02','MP01','Venta matutina'),('V0035','2026-04-19','15:38:00','Entregada','C037','E04','S01','MP04','Pedido especial'),('V0036','2026-05-28','14:03:00','Pagada','C023','E08','S02','MP01',''),('V0037','2026-01-24','12:29:00','Entregada','C014','E03','S03','MP03','Pedido especial'),('V0038','2026-01-02','18:12:00','Entregada','C009','E08','S01','MP01','Venta matutina'),('V0039','2026-04-14','09:31:00','Pagada','C001','E07','S01','MP04','Pedido especial'),('V0040','2026-05-29','11:22:00','Pagada','C038','E01','S01','MP02',''),('V0041','2026-05-16','09:24:00','Entregada','C022','E08','S03','MP04','Pedido especial'),('V0042','2026-06-10','18:15:00','Pagada','C031','E08','S02','MP01','Venta matutina'),('V0043','2026-04-04','16:49:00','Pagada','C010','E06','S03','MP04',''),('V0044','2026-02-14','07:03:00','Entregada','C014','E06','S02','MP02','Pedido especial'),('V0045','2026-06-28','12:49:00','Pagada','C024','E05','S03','MP02',''),('V0046','2026-05-04','12:11:00','Entregada','C029','E05','S01','MP02','Pedido especial'),('V0047','2026-03-27','18:42:00','Pagada','C027','E08','S03','MP03','Pedido especial'),('V0048','2026-04-06','14:43:00','Entregada','C034','E03','S01','MP01','Venta matutina'),('V0049','2026-02-16','17:06:00','Pagada','C039','E06','S03','MP03','Venta matutina'),('V0050','2026-01-29','16:17:00','Entregada','C016','E03','S01','MP04','Venta matutina'),('V0051','2026-06-07','07:33:00','Entregada','C006','E04','S03','MP01',''),('V0052','2026-05-21','15:25:00','Entregada','C040','E05','S02','MP04','Pedido especial'),('V0053','2026-05-24','08:50:00','Entregada','C011','E04','S03','MP01','Pedido especial'),('V0054','2026-04-01','15:57:00','Entregada','C014','E08','S02','MP01',''),('V0055','2026-04-08','11:46:00','Pagada','C015','E06','S01','MP04','Pedido especial'),('V0056','2026-05-17','18:09:00','Pagada','C031','E04','S03','MP03','Venta matutina'),('V0057','2026-03-08','16:52:00','Pagada','C003','E03','S03','MP01','Pedido especial'),('V0058','2026-05-09','10:12:00','Entregada','C011','E05','S02','MP02',''),('V0059','2026-03-19','12:58:00','Pagada','C037','E04','S02','MP03','Pedido especial'),('V0060','2026-03-13','19:21:00','Entregada','C010','E03','S03','MP04',''),('V0061','2026-06-25','12:28:00','Pagada','C003','E05','S01','MP02',''),('V0062','2026-05-04','12:54:00','Entregada','C039','E01','S02','MP02','Venta matutina'),('V0063','2026-06-17','09:55:00','Entregada','C028','E01','S02','MP01',''),('V0064','2026-04-21','19:17:00','Entregada','C007','E06','S02','MP02','Pedido especial'),('V0065','2026-03-09','18:56:00','Pagada','C031','E05','S01','MP01',''),('V0066','2026-02-07','16:35:00','Pagada','C040','E08','S03','MP02','Pedido especial'),('V0067','2026-05-28','14:45:00','Pagada','C031','E07','S01','MP02','Pedido especial'),('V0068','2026-01-23','16:50:00','Pagada','C009','E07','S02','MP02',''),('V0069','2026-05-30','17:11:00','Entregada','C028','E07','S02','MP04','Pedido especial'),('V0070','2026-01-02','09:08:00','Pagada','C038','E03','S02','MP04','Pedido especial'),('V0071','2026-05-30','18:05:00','Pagada','C029','E06','S02','MP03',''),('V0072','2026-01-20','18:37:00','Pagada','C012','E02','S02','MP04','Pedido especial'),('V0073','2026-02-25','17:00:00','Entregada','C004','E02','S02','MP04','Venta matutina'),('V0074','2026-01-27','12:11:00','Entregada','C030','E08','S02','MP04','Venta matutina'),('V0075','2026-03-23','11:26:00','Entregada','C009','E08','S03','MP04',''),('V0076','2026-02-25','14:16:00','Entregada','C010','E05','S01','MP01','Venta matutina'),('V0077','2026-06-06','11:17:00','Entregada','C019','E08','S02','MP02',''),('V0078','2026-05-03','18:42:00','Entregada','C032','E01','S03','MP02',''),('V0079','2026-02-08','13:14:00','Pagada','C023','E03','S02','MP03','Pedido especial'),('V0080','2026-02-14','08:12:00','Pagada','C040','E08','S02','MP03',''),('V0081','2026-05-23','17:45:00','Pagada','C034','E07','S02','MP01','Pedido especial'),('V0082','2026-05-13','19:38:00','Entregada','C028','E05','S01','MP01',''),('V0083','2026-02-01','18:29:00','Entregada','C028','E01','S03','MP04','Pedido especial'),('V0084','2026-01-21','13:25:00','Pagada','C011','E07','S02','MP01','Pedido especial'),('V0085','2026-01-06','18:03:00','Entregada','C034','E01','S01','MP03',''),('V0086','2026-05-18','19:37:00','Pagada','C002','E01','S02','MP01',''),('V0087','2026-06-07','19:40:00','Pagada','C028','E02','S01','MP02','Venta matutina'),('V0088','2026-04-13','17:32:00','Pagada','C017','E07','S03','MP03','Venta matutina'),('V0089','2026-01-28','09:00:00','Entregada','C018','E02','S03','MP01','Pedido especial'),('V0090','2026-05-02','14:53:00','Pagada','C016','E05','S02','MP03','Pedido especial'),('V0091','2026-05-03','07:05:00','Entregada','C022','E02','S03','MP04',''),('V0092','2026-04-06','15:50:00','Entregada','C009','E01','S01','MP02',''),('V0093','2026-01-19','16:15:00','Entregada','C018','E07','S03','MP02','Venta matutina'),('V0094','2026-04-12','08:55:00','Entregada','C011','E02','S03','MP04','Venta matutina'),('V0095','2026-06-19','09:56:00','Pagada','C034','E01','S03','MP02','Venta matutina'),('V0096','2026-01-14','08:26:00','Pagada','C028','E07','S01','MP01','Venta matutina'),('V0097','2026-06-26','10:59:00','Entregada','C003','E05','S02','MP02',''),('V0098','2026-03-15','08:46:00','Entregada','C034','E04','S03','MP01',''),('V0099','2026-02-19','18:53:00','Entregada','C040','E08','S03','MP03','Venta matutina'),('V0100','2026-01-25','15:43:00','Entregada','C024','E02','S01','MP03','Pedido especial'),('V0101','2026-06-23','07:05:00','Pagada','C039','E08','S02','MP01','Venta matutina'),('V0102','2026-06-25','15:36:00','Pagada','C026','E01','S03','MP01','Pedido especial'),('V0103','2026-05-26','09:26:00','Pagada','C016','E02','S01','MP01',''),('V0104','2026-03-23','11:10:00','Entregada','C023','E07','S01','MP03','Pedido especial'),('V0105','2026-02-03','16:05:00','Pagada','C033','E04','S01','MP04','Venta matutina'),('V0106','2026-02-13','13:07:00','Entregada','C028','E01','S03','MP02','Pedido especial'),('V0107','2026-05-01','11:09:00','Entregada','C017','E07','S02','MP01','Pedido especial'),('V0108','2026-06-03','10:53:00','Pagada','C003','E06','S03','MP03','Pedido especial'),('V0109','2026-04-27','12:01:00','Entregada','C018','E05','S03','MP02','Venta matutina'),('V0110','2026-06-10','08:25:00','Pagada','C017','E06','S03','MP04','Pedido especial'),('V0111','2026-02-17','16:12:00','Pagada','C011','E05','S03','MP02','Venta matutina'),('V0112','2026-02-19','09:09:00','Pagada','C039','E03','S03','MP04','Venta matutina'),('V0113','2026-04-01','07:30:00','Pagada','C031','E05','S02','MP01',''),('V0114','2026-03-18','07:54:00','Entregada','C024','E08','S03','MP03',''),('V0115','2026-01-24','19:53:00','Entregada','C014','E05','S03','MP04','Pedido especial'),('V0116','2026-01-21','10:32:00','Entregada','C007','E01','S02','MP04',''),('V0117','2026-06-09','07:05:00','Pagada','C011','E02','S01','MP04','Venta matutina'),('V0118','2026-06-03','07:44:00','Entregada','C032','E02','S03','MP02','Venta matutina'),('V0119','2026-03-12','12:19:00','Pagada','C019','E04','S02','MP04','Pedido especial'),('V0120','2026-05-09','09:09:00','Entregada','C003','E04','S03','MP01','Venta matutina'),('V0121','2026-06-28','14:32:00','Pagada','C026','E07','S02','MP02',''),('V0122','2026-03-21','15:38:00','Entregada','C010','E05','S03','MP04',''),('V0123','2026-05-28','08:51:00','Pagada','C004','E06','S02','MP02',''),('V0124','2026-05-02','08:38:00','Entregada','C030','E01','S03','MP02','Venta matutina'),('V0125','2026-02-13','14:14:00','Pagada','C034','E02','S01','MP02','Venta matutina'),('V0126','2026-05-29','15:11:00','Pagada','C035','E05','S01','MP01','Pedido especial'),('V0127','2026-04-07','11:11:00','Entregada','C039','E04','S02','MP01','Venta matutina'),('V0128','2026-01-04','13:15:00','Pagada','C016','E02','S03','MP02',''),('V0129','2026-04-08','08:01:00','Pagada','C033','E03','S02','MP03',''),('V0130','2026-04-20','07:02:00','Pagada','C038','E02','S02','MP03','Pedido especial'),('V0131','2026-01-31','08:43:00','Pagada','C018','E08','S01','MP02','Venta matutina'),('V0132','2026-04-28','10:30:00','Entregada','C040','E07','S03','MP04','Venta matutina'),('V0133','2026-04-30','07:43:00','Entregada','C019','E01','S03','MP02','Pedido especial'),('V0134','2026-05-05','07:27:00','Entregada','C008','E05','S02','MP03',''),('V0135','2026-01-26','13:33:00','Entregada','C023','E03','S01','MP03','Pedido especial'),('V0136','2026-03-21','08:56:00','Pagada','C012','E04','S03','MP02','Pedido especial'),('V0137','2026-06-16','19:27:00','Pagada','C016','E05','S03','MP02','Venta matutina'),('V0138','2026-01-23','15:08:00','Pagada','C028','E04','S01','MP01','Venta matutina'),('V0139','2026-01-11','11:14:00','Entregada','C030','E02','S01','MP03','Pedido especial'),('V0140','2026-03-19','12:08:00','Pagada','C039','E05','S02','MP02','Venta matutina'),('V0141','2026-06-22','13:49:00','Pagada','C020','E01','S02','MP02',''),('V0142','2026-03-17','10:48:00','Pagada','C016','E07','S03','MP04','Venta matutina'),('V0143','2026-01-08','08:16:00','Entregada','C009','E08','S03','MP04','Pedido especial'),('V0144','2026-06-07','19:35:00','Pagada','C040','E02','S03','MP01',''),('V0145','2026-02-12','07:46:00','Pagada','C020','E05','S03','MP01','Venta matutina'),('V0146','2026-01-12','09:16:00','Pagada','C020','E01','S03','MP02',''),('V0147','2026-06-14','19:42:00','Pagada','C040','E06','S01','MP01',''),('V0148','2026-03-11','19:44:00','Pagada','C021','E08','S02','MP03',''),('V0149','2026-03-06','10:49:00','Entregada','C023','E03','S01','MP02',''),('V0150','2026-05-11','08:46:00','Pagada','C013','E07','S02','MP04','Venta matutina'),('V0151','2026-04-25','11:20:00','Pagada','C033','E06','S02','MP03','Venta matutina'),('V0152','2026-06-18','14:13:00','Entregada','C038','E05','S03','MP04',''),('V0153','2026-01-25','14:45:00','Pagada','C027','E07','S01','MP03','Venta matutina'),('V0154','2026-05-11','08:33:00','Entregada','C010','E03','S02','MP02',''),('V0155','2026-03-28','07:57:00','Entregada','C024','E07','S01','MP03','Pedido especial'),('V0156','2026-06-04','10:56:00','Pagada','C024','E03','S02','MP03','Pedido especial'),('V0157','2026-03-23','07:22:00','Pagada','C019','E06','S01','MP04','Venta matutina'),('V0158','2026-04-11','12:17:00','Pagada','C032','E03','S01','MP01','Venta matutina'),('V0159','2026-01-04','08:28:00','Entregada','C024','E03','S01','MP04','Pedido especial'),('V0160','2026-06-01','10:19:00','Entregada','C017','E04','S02','MP01','Venta matutina'),('V0161','2026-04-29','14:36:00','Entregada','C033','E05','S03','MP03','Venta matutina'),('V0162','2026-03-27','18:02:00','Entregada','C007','E07','S01','MP02',''),('V0163','2026-04-11','12:09:00','Entregada','C009','E06','S03','MP01','Venta matutina'),('V0164','2026-02-24','16:27:00','Pagada','C001','E03','S03','MP02','Venta matutina'),('V0165','2026-04-28','07:38:00','Pagada','C004','E08','S01','MP02','Pedido especial'),('V0166','2026-01-25','08:50:00','Entregada','C002','E04','S02','MP04',''),('V0167','2026-02-09','19:59:00','Pagada','C005','E04','S01','MP01','Venta matutina'),('V0168','2026-03-02','14:29:00','Entregada','C034','E07','S01','MP04',''),('V0169','2026-03-18','15:02:00','Pagada','C030','E05','S02','MP01','Venta matutina'),('V0170','2026-01-24','11:24:00','Entregada','C018','E05','S01','MP03','Pedido especial'),('V0171','2026-02-22','09:23:00','Entregada','C008','E04','S01','MP04','Pedido especial'),('V0172','2026-05-08','10:50:00','Pagada','C024','E02','S01','MP02','Pedido especial'),('V0173','2026-04-11','19:22:00','Entregada','C032','E07','S02','MP03','Venta matutina'),('V0174','2026-01-18','13:42:00','Entregada','C026','E05','S02','MP01',''),('V0175','2026-06-28','16:10:00','Pagada','C019','E05','S02','MP04','Venta matutina'),('V0176','2026-01-01','08:15:00','Pagada','C022','E04','S01','MP02','Venta matutina'),('V0177','2026-04-21','08:27:00','Pagada','C018','E01','S02','MP02','Pedido especial'),('V0178','2026-03-25','16:28:00','Pagada','C032','E04','S01','MP03','Pedido especial'),('V0179','2026-03-01','09:19:00','Pagada','C023','E01','S02','MP02','Venta matutina'),('V0180','2026-03-02','13:28:00','Pagada','C021','E07','S01','MP01','Venta matutina'),('V0181','2026-03-21','09:56:00','Entregada','C018','E05','S01','MP03',''),('V0182','2026-02-12','13:45:00','Entregada','C029','E03','S03','MP01',''),('V0183','2026-06-07','08:08:00','Entregada','C034','E01','S02','MP02','Venta matutina'),('V0184','2026-01-09','17:37:00','Entregada','C032','E02','S01','MP02','Pedido especial'),('V0185','2026-03-05','10:27:00','Pagada','C019','E05','S01','MP03',''),('V0186','2026-03-11','15:34:00','Entregada','C002','E03','S02','MP04','Pedido especial'),('V0187','2026-04-01','07:27:00','Pagada','C017','E02','S01','MP01','Venta matutina'),('V0188','2026-05-04','15:38:00','Entregada','C013','E08','S03','MP03',''),('V0189','2026-04-26','07:06:00','Pagada','C011','E08','S01','MP01','Venta matutina'),('V0190','2026-05-10','13:50:00','Pagada','C032','E07','S02','MP01','Venta matutina'),('V0191','2026-03-03','09:25:00','Pagada','C027','E04','S02','MP01',''),('V0192','2026-03-30','16:28:00','Pagada','C011','E05','S02','MP04','Pedido especial'),('V0193','2026-05-22','15:54:00','Entregada','C029','E08','S01','MP04','Venta matutina'),('V0194','2026-02-04','12:29:00','Entregada','C035','E05','S03','MP01',''),('V0195','2026-03-15','12:59:00','Pagada','C010','E03','S02','MP04','Pedido especial'),('V0196','2026-04-17','17:57:00','Pagada','C002','E01','S02','MP04','Venta matutina'),('V0197','2026-02-24','15:48:00','Entregada','C031','E05','S02','MP03','Pedido especial'),('V0198','2026-02-03','08:18:00','Entregada','C021','E08','S02','MP03','Venta matutina'),('V0199','2026-01-16','07:48:00','Entregada','C012','E08','S01','MP01',''),('V0200','2026-03-14','15:47:00','Entregada','C014','E01','S02','MP01',''),('V0201','2026-07-08','10:30:00','Pagada','C001','E02','S01','MP01','Observación'),('V0202','2026-07-11','10:30:00','Pagada','C041','E01','S01','MP01','Venta de prueba'),('V201','2026-07-11','10:30:00','Pagada','C041','E01','S01','MP01','Venta de prueba');
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes_frecuentes`
--

DROP TABLE IF EXISTS `vista_clientes_frecuentes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_frecuentes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `tipo_cliente`,
 1 AS `TotalComprado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_desempeno_empleados`
--

DROP TABLE IF EXISTS `vista_desempeno_empleados`;
/*!50001 DROP VIEW IF EXISTS `vista_desempeno_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_desempeno_empleados` AS SELECT 
 1 AS `id_empleado`,
 1 AS `Empleado`,
 1 AS `cargo`,
 1 AS `CantidadVentas`,
 1 AS `TotalVendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_ventas`
--

DROP TABLE IF EXISTS `vista_detalle_ventas`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_ventas` AS SELECT 
 1 AS `id_venta`,
 1 AS `Producto`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_categoria`
--

DROP TABLE IF EXISTS `vista_productos_categoria`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_categoria` AS SELECT 
 1 AS `id_producto`,
 1 AS `Producto`,
 1 AS `Categoria`,
 1 AS `Marca`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_consolidadas`
--

DROP TABLE IF EXISTS `vista_ventas_consolidadas`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_consolidadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_consolidadas` AS SELECT 
 1 AS `id_venta`,
 1 AS `fecha`,
 1 AS `Cliente`,
 1 AS `Empleado`,
 1 AS `MetodoPago`,
 1 AS `TotalVenta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_sucursal`
--

DROP TABLE IF EXISTS `vista_ventas_sucursal`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_sucursal` AS SELECT 
 1 AS `id_venta`,
 1 AS `fecha`,
 1 AS `Sucursal`,
 1 AS `Cliente`,
 1 AS `TotalVenta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_clientes_frecuentes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_frecuentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_frecuentes` AS select `c`.`ID_Cliente` AS `id_cliente`,`c`.`Nombre` AS `nombre`,`c`.`Apellido` AS `apellido`,`c`.`Tipo_Cliente` AS `tipo_cliente`,sum(`dv`.`Total`) AS `TotalComprado` from ((`Clientes` `c` join `Ventas` `v` on((`c`.`ID_Cliente` = `v`.`ID_Cliente`))) join `Detalle_Venta` `dv` on((`v`.`ID_Venta` = `dv`.`ID_Venta`))) group by `c`.`ID_Cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_desempeno_empleados`
--

/*!50001 DROP VIEW IF EXISTS `vista_desempeno_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_desempeno_empleados` AS select `e`.`ID_Empleado` AS `id_empleado`,`e`.`Nombre` AS `Empleado`,`e`.`Cargo` AS `cargo`,count(distinct `v`.`ID_Venta`) AS `CantidadVentas`,sum(`dv`.`Total`) AS `TotalVendido` from ((`Empleados` `e` join `Ventas` `v` on((`e`.`ID_Empleado` = `v`.`ID_Empleado`))) join `Detalle_Venta` `dv` on((`v`.`ID_Venta` = `dv`.`ID_Venta`))) group by `e`.`ID_Empleado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_ventas` AS select `dv`.`ID_Venta` AS `id_venta`,`p`.`Nombre` AS `Producto`,`dv`.`Cantidad` AS `cantidad`,`dv`.`Precio_Unitario` AS `precio_unitario`,`dv`.`Subtotal` AS `subtotal` from (`Detalle_Venta` `dv` join `Productos` `p` on((`dv`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_categoria` AS select `p`.`ID_Producto` AS `id_producto`,`p`.`Nombre` AS `Producto`,`c`.`Nombre` AS `Categoria`,`m`.`Nombre` AS `Marca`,`p`.`Precio` AS `precio` from ((`Productos` `p` join `Categorias` `c` on((`p`.`ID_Categoria` = `c`.`ID_Categoria`))) join `Marcas` `m` on((`p`.`ID_Marca` = `m`.`ID_Marca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_consolidadas`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_consolidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_consolidadas` AS select `v`.`ID_Venta` AS `id_venta`,`v`.`Fecha` AS `fecha`,concat(`c`.`Nombre`,' ',`c`.`Apellido`) AS `Cliente`,`e`.`Nombre` AS `Empleado`,`mp`.`Nombre` AS `MetodoPago`,sum(`dv`.`Total`) AS `TotalVenta` from ((((`Ventas` `v` join `Clientes` `c` on((`v`.`ID_Cliente` = `c`.`ID_Cliente`))) join `Empleados` `e` on((`v`.`ID_Empleado` = `e`.`ID_Empleado`))) join `MetodosPago` `mp` on((`v`.`ID_MetodoPago` = `mp`.`ID_MetodoPago`))) join `Detalle_Venta` `dv` on((`v`.`ID_Venta` = `dv`.`ID_Venta`))) group by `v`.`ID_Venta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_sucursal` AS select `v`.`ID_Venta` AS `id_venta`,`v`.`Fecha` AS `fecha`,`s`.`Nombre` AS `Sucursal`,concat(`c`.`Nombre`,' ',`c`.`Apellido`) AS `Cliente`,sum(`dv`.`Total`) AS `TotalVenta` from (((`Ventas` `v` join `Clientes` `c` on((`v`.`ID_Cliente` = `c`.`ID_Cliente`))) join `Sucursales` `s` on((`v`.`ID_Sucursal` = `s`.`ID_Sucursal`))) join `Detalle_Venta` `dv` on((`v`.`ID_Venta` = `dv`.`ID_Venta`))) group by `v`.`ID_Venta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-11 12:08:00
