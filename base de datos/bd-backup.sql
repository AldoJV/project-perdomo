CREATE DATABASE  IF NOT EXISTS `games` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `games`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: games
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `i_almacen` int(5) NOT NULL AUTO_INCREMENT,
  `e_almacen` varchar(45) NOT NULL,
  `a_direccion` varchar(45) NOT NULL,
  `a_cp` int(5) NOT NULL,
  PRIMARY KEY (`i_almacen`),
  KEY `fk_almacen_cp_idx` (`a_cp`),
  CONSTRAINT `fk_almacen_cp` FOREIGN KEY (`a_cp`) REFERENCES `region` (`a_cp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Almacen Tlane','Calle tal numero 6',54054),(2,'Almacen Naucalpan','Otra calle 25',53120),(3,'Almacen huixqui','Calle bob 7',52787);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen_inventario`
--

DROP TABLE IF EXISTS `almacen_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen_inventario` (
  `i_almacen` int(5) NOT NULL,
  `inventario_i_articulo` int(10) NOT NULL,
  PRIMARY KEY (`i_almacen`,`inventario_i_articulo`),
  KEY `fk_almacen_has_inventario_inventario1_idx` (`inventario_i_articulo`),
  KEY `fk_almacen_has_inventario_almacen1_idx` (`i_almacen`),
  CONSTRAINT `fk_almacen_has_inventario_almacen1` FOREIGN KEY (`i_almacen`) REFERENCES `almacen` (`i_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_almacen_has_inventario_inventario1` FOREIGN KEY (`inventario_i_articulo`) REFERENCES `inventario` (`i_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_inventario`
--

LOCK TABLES `almacen_inventario` WRITE;
/*!40000 ALTER TABLE `almacen_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `i_articulo` int(10) NOT NULL AUTO_INCREMENT,
  `n_articulo` varchar(45) NOT NULL,
  `i_plataforma` varchar(5) NOT NULL,
  `i_tipo` varchar(3) NOT NULL,
  `i_formato` varchar(1) NOT NULL,
  `q_precioVenta` float NOT NULL,
  `q_precioCompra` float DEFAULT NULL,
  `e_articulo` varchar(140) NOT NULL,
  `i_clasificacion` varchar(2) DEFAULT NULL,
  `i_genero` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`i_articulo`),
  KEY `fk_articulo_tipo_idx` (`i_tipo`),
  KEY `fk_articulo_plat_idx` (`i_plataforma`),
  KEY `fk_articulo_formato_idx` (`i_formato`),
  KEY `fk_articulo_clas` (`i_clasificacion`),
  KEY `fk_articulo_gen` (`i_genero`),
  CONSTRAINT `fk_articulo_clas` FOREIGN KEY (`i_clasificacion`) REFERENCES `clasificacion` (`i_clasificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_formato` FOREIGN KEY (`i_formato`) REFERENCES `formato` (`i_formato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_gen` FOREIGN KEY (`i_genero`) REFERENCES `genero` (`i_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_plat` FOREIGN KEY (`i_plataforma`) REFERENCES `plataforma` (`i_plataforma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulo_tipo` FOREIGN KEY (`i_tipo`) REFERENCES `tipo_articulo` (`i_tipo_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'GCN - Resident Evil 4','GCN','GAM','F',400,200,'El mejor juego de todos los tiempos','M','ACC'),(2,'PC - Resident Evil 4','PC','GAM','D',250,0,'El mejor juego de todos los tiempos, remasterizado para PC','M','ACC'),(3,'XBONE - Dark Souls III','XBONE','GAM','F',999,450,'La continuación de esta gran saga aclamada por su lore y su dificultad','M','ACC'),(4,'SPS4 - Dark Souls III','SPS4','GAM','F',999,450,'La continuación de esta gran saga aclamada por su lore y su dificultad','M','ACC'),(5,'PC - Dark Souls III','PC','GAM','D',509,0,'La continuación de esta gran saga aclamada por su lore y su dificultad','M','ACC'),(6,'PC - Undertale','PC','GAM','D',109,0,'Excelente juego RPG que te hará sentir sentimientos','E','RPG'),(7,'WIIU  - Super Smash Bros','WIIU','GAM','F',1099,500,'Fantastico y loco juego de peleas con las estrellas de Nintendo','E1','PEL'),(8,'3DS - Super Smash Bros','3DS','GAM','F',999,450,'Fantastico y loco juego de peleas con las estrellas de Nintendo','E1','PEL'),(9,'XBONE - Consola 500GB','XBONE','CON','F',6999,2000,'Consola de nueva generación de Microsoft, el mejor centro de entretenimiento',NULL,NULL),(10,'SPS4 - Consola Uncharted','SPS4','CON','F',7899,2400,'La nueva generación de Sony está aqui, incluye el juego de Uncharted',NULL,NULL),(11,'WIIU - Consola Smash','WIIU','CON','F',7000,2000,'La ultima consola de Nintendo te lleva a disfrutar sus franquicias al máximo, incluye Super Smash Bros',NULL,NULL),(12,'3DS - Consola New3dsXL','3DS','CON','F',3000,1500,'Lo mejor de Nintendo en portatiles, disfruta tus juegos donde sea',NULL,NULL),(13,'3DS - Consola 2DS','3DS','CON','F',1899,800,'El poderoso 3ds en su version economica, disfruta del 3ds sin gastar mucho',NULL,NULL),(14,'XBONE - Control Negro','XBONE','ACC','F',899,0,'Destruye a tu competencia con este elegante y ergonomico control',NULL,NULL),(15,'SPS4 - Control Negro','SPS4','ACC','F',899,0,'Sigue jugando con el increible DualShock4, el mejor control de Sony hasta hoy',NULL,NULL),(16,'WIIU - Pro Controller','WIIU','ACC','F',999,0,'Disfruta de la precision que el Pro controller ofrece',NULL,NULL),(17,'GCN - Control Smash','GCN','ACC','F',549,0,'Regresa el mejor control de nintendo, se el mejor en Smash con esta reliquia',NULL,NULL),(18,'Suscripcion Xbox Live 12','NA','CRD','F',999,0,'Extiende tu suscripcion a Xbox Live por un año',NULL,NULL),(19,'Suscripcion PSPlus 12','NA','CRD','F',799,0,'No dejes de gozar de los beneficios de PS+',NULL,NULL),(20,'Amiibo de Andres Manuel Lopez Obrador','NA','PRM','F',299,0,'Este amiibo del presidente legítimo es tan lujoso que no lo tiene ni Obama',NULL,NULL);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasificacion` (
  `i_clasificacion` varchar(3) NOT NULL,
  `e_clasificacion` varchar(25) NOT NULL,
  `q_edad` int(2) NOT NULL,
  PRIMARY KEY (`i_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion`
--

LOCK TABLES `clasificacion` WRITE;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
INSERT INTO `clasificacion` VALUES ('AO','Adults Only',18),('E','Everyone',3),('E10','Everyone 10+',10),('EC','Early Childhood',0),('M','Mature',17),('T','Teen ',13);
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `i_cliente` int(10) NOT NULL AUTO_INCREMENT,
  `n_username` varchar(25) NOT NULL,
  `e_password` varchar(32) NOT NULL,
  `i_persona` int(10) DEFAULT NULL,
  `i_tipocliente` int(2) NOT NULL,
  `q_saldo` float DEFAULT '0',
  PRIMARY KEY (`i_cliente`),
  UNIQUE KEY `n_username_UNIQUE` (`n_username`),
  KEY `fk_cliente_tipo_idx` (`i_tipocliente`),
  KEY `fk_cliente_pers_idx` (`i_persona`),
  CONSTRAINT `fk_cliente_pers` FOREIGN KEY (`i_persona`) REFERENCES `persona` (`i_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_tipo` FOREIGN KEY (`i_tipocliente`) REFERENCES `tipocliente` (`i_tipocliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'garrus','cereal',1,1,0),(2,'liara','cereal',2,2,1700),(3,'tali','cereal',3,1,0),(4,'wrex','cereal',4,1,0),(5,'ash','cereal',5,2,450),(6,'kaidan','cereal',6,1,800),(7,'mordin','cereal',7,2,0),(8,'miranda','cereal',8,1,0),(9,'jacob','cereal',9,2,2),(10,'zaeed','cereal',10,1,0),(11,'gurnt','cereal',11,1,0),(12,'jack','cereal',12,1,0),(13,'legion','cereal',13,1,0),(14,'samara','cereal',14,1,0),(15,'thane','cereal',15,1,0),(25,'aldo','9cdfb439c7876e703e307864c9167a15',NULL,1,0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_transaccion`
--

DROP TABLE IF EXISTS `detalle_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_transaccion` (
  `i_transaccion` int(11) NOT NULL,
  `q_total` float NOT NULL,
  `i_moneda` varchar(3) NOT NULL,
  `i_formapago` int(1) NOT NULL,
  PRIMARY KEY (`i_transaccion`),
  KEY `fk_detalle_transaccion_moneda_idx` (`i_moneda`),
  KEY `fk_detalle_transaccion_form_idx` (`i_formapago`),
  CONSTRAINT `fk_detalle_transaccion_form` FOREIGN KEY (`i_formapago`) REFERENCES `forma_pago` (`i_formapago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_id` FOREIGN KEY (`i_transaccion`) REFERENCES `transaccion` (`i_transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_moneda` FOREIGN KEY (`i_moneda`) REFERENCES `moneda` (`i_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_transaccion`
--

LOCK TABLES `detalle_transaccion` WRITE;
/*!40000 ALTER TABLE `detalle_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_transaccion_inventario`
--

DROP TABLE IF EXISTS `detalle_transaccion_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_transaccion_inventario` (
  `i_transaccion` int(11) NOT NULL,
  `i_articulo` int(10) NOT NULL,
  PRIMARY KEY (`i_transaccion`,`i_articulo`),
  KEY `fk_detalle_transaccion_has_inventario_inventario1_idx` (`i_articulo`),
  KEY `fk_detalle_transaccion_has_inventario_detalle_transaccion1_idx` (`i_transaccion`),
  CONSTRAINT `fk_detalle_transaccion_has_inventario_detalle_transaccion1` FOREIGN KEY (`i_transaccion`) REFERENCES `detalle_transaccion` (`i_transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_transaccion_has_inventario_inventario1` FOREIGN KEY (`i_articulo`) REFERENCES `inventario` (`i_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='inventario_i_articulo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_transaccion_inventario`
--

LOCK TABLES `detalle_transaccion_inventario` WRITE;
/*!40000 ALTER TABLE `detalle_transaccion_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_transaccion_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `i_direccion` int(10) NOT NULL AUTO_INCREMENT,
  `a_calle` varchar(25) NOT NULL,
  `a_numext` varchar(15) NOT NULL,
  `a_numint` varchar(15) DEFAULT NULL,
  `a_cp` int(5) NOT NULL,
  `f_activo` tinyint(1) NOT NULL DEFAULT '1',
  `i_persona` int(10) NOT NULL,
  PRIMARY KEY (`i_direccion`),
  UNIQUE KEY `i_direccion_UNIQUE` (`i_direccion`),
  KEY `fk_direccion_persona_idx` (`i_persona`),
  KEY `fk_direccion_cp_idx` (`a_cp`),
  CONSTRAINT `fk_direccion_cp` FOREIGN KEY (`a_cp`) REFERENCES `region` (`a_cp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_persona` FOREIGN KEY (`i_persona`) REFERENCES `persona` (`i_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Super calle','2','',54054,1,1),(2,'Secreta','42B','0',53000,1,2),(3,'Kilo','84','2A',53120,1,3),(4,'Mega','12','',53128,1,4),(5,'Giga','14','',54092,1,5),(6,'Tera','85','6b',54090,1,6),(7,'Peta','S/N','',52787,1,7),(8,'Pedro','45','',52799,1,8),(9,'Juan','420','',52784,1,9),(10,'Toño','1','',53120,1,10),(11,'Jaimito','75','302',53128,1,11),(12,'Catalina','4A','20',54092,1,12),(13,'Esteban','88','',52787,1,13),(14,'Carlos','23','201C',52799,1,14),(15,'Guillermo','46','',52784,1,15);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pago` (
  `i_formapago` int(1) NOT NULL AUTO_INCREMENT,
  `e_formapago` varchar(15) NOT NULL,
  PRIMARY KEY (`i_formapago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Visa/MC'),(2,'American Expres'),(3,'Paypal'),(4,'Saldo a favor');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato` (
  `i_formato` varchar(1) NOT NULL,
  `e_formato` varchar(10) NOT NULL,
  PRIMARY KEY (`i_formato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='fisico, digital, servicio, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES ('D','Digital'),('F','Fisico');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `i_genero` varchar(3) NOT NULL,
  `e_genero` varchar(45) NOT NULL,
  PRIMARY KEY (`i_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES ('ACC','Accion'),('AVE','Aventura'),('CAR','Carreras'),('FPS','First Person Shooter'),('HOR','Horror'),('MUS','Musica'),('PEL','Peleas'),('RPG','Juego de Rol'),('SIM','Simulacion'),('TPS','Third Person Shooter');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `i_articulo` int(10) NOT NULL,
  `q_existencia` int(4) NOT NULL,
  `d_actividad` date NOT NULL,
  `i_almacen` int(5) NOT NULL,
  PRIMARY KEY (`i_articulo`),
  KEY `fk_inventario_almacen_idx` (`i_almacen`),
  CONSTRAINT `fk_inventario_almacen` FOREIGN KEY (`i_almacen`) REFERENCES `almacen` (`i_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_articulo` FOREIGN KEY (`i_articulo`) REFERENCES `articulo` (`i_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `i_moneda` varchar(3) NOT NULL,
  `e_moneda` varchar(15) NOT NULL,
  PRIMARY KEY (`i_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES ('EUR','Euro'),('GBP','Libra Esterlina'),('MXN','Peso Mexicano'),('USD','Dolar Americano');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `i_pais` varchar(3) NOT NULL,
  `e_pais` varchar(45) NOT NULL,
  PRIMARY KEY (`i_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('ARG','Argentina'),('BRA','Brasil'),('CAN','Canada'),('FRA','Francia'),('GER','Alemania'),('ITA','Italia'),('MEX','Mexico'),('POR','Portugal'),('SPA','España'),('UK','Inglaterra'),('URU','Uruguay'),('USA','Estados Unidos');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `i_persona` int(10) NOT NULL AUTO_INCREMENT,
  `n_persona` varchar(25) NOT NULL,
  `n_apaterno` varchar(25) NOT NULL,
  `n_amaterno` varchar(25) DEFAULT NULL,
  `i_genero` varchar(2) NOT NULL,
  `d_nacimiento` date NOT NULL,
  `e_email` varchar(25) NOT NULL,
  `d_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`i_persona`),
  UNIQUE KEY `i_persona_UNIQUE` (`i_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Garrus','Vakarian','Gomez','M','1985-03-14','garrusv@turianmail.com','2016-03-29 19:48:56'),(2,'Liara','T\'Soni','','F','1980-09-08','liara@shadowbroker.net','2016-03-29 19:48:56'),(3,'Tali\'Zorah','Vas','Normandy','F','1989-06-16','tali@normandy.info','2016-03-29 19:48:56'),(4,'Wrex','Urdnot','','M','1980-11-27','papa-wrex@supermail.com','2016-03-29 19:48:56'),(5,'Ashley','Williams','Williams','F','1988-02-28','williams_ashley@alliance.','2016-03-29 19:48:56'),(6,'Kaidan','Alenko','','M','1985-12-19','that-guy@alliance.net','2016-03-29 19:48:56'),(7,'Mordin','Solus','','M','1980-07-25','mordin@stg.gov','2016-03-29 19:48:56'),(8,'Miranda','Lawson','','F','1987-04-20','miranda@cerberus.com','2016-03-29 19:48:56'),(9,'Jacob','Taylor','Latrell','M','1986-01-12','jt_dawg@cerberus.com','2016-03-29 19:48:56'),(10,'Zaeed ','Massani','','M','1983-11-23','zaeed@bluesuns.org','2016-03-29 19:48:56'),(11,'Grunt','Urdnot','','M','1994-01-04','grent-bdass@supermail.com','2016-03-29 19:48:56'),(12,'Jack','Zero','','F','1988-05-10','jack-mofos@alliance.net','2016-03-29 19:48:56'),(13,'Legion','Wesker','','M','1985-03-26','legion@consensus.net','2016-03-29 19:48:56'),(14,'Samara','Justicar','','F','1985-03-27','samara@justicars.com','2016-03-29 19:48:56'),(15,'Thane','Krios','Senpai','M','1985-03-28','thane_k@killersearch.org','2016-03-29 19:48:56');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataforma` (
  `i_plataforma` varchar(5) NOT NULL,
  `e_plataforma` varchar(50) NOT NULL,
  PRIMARY KEY (`i_plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES ('3DS','Nintendo 3ds'),('GCN','Nintendo Gamecube'),('NA','Ninguna'),('NDS','Nintendo DS'),('PC','PC Master Race'),('SPS2','PlayStation 2'),('SPS3','PlayStation 3'),('SPS4','PlayStation 4'),('WII','Nintendo Wii'),('WIIU','Nintendo Wii u'),('X360','Xbox 360'),('XBONE','Xbox One'),('XBOX','Xbox');
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `a_cp` int(5) NOT NULL,
  `a_colonia` varchar(45) NOT NULL,
  `n_ciudad` varchar(45) NOT NULL,
  `n_municipio` varchar(45) NOT NULL,
  `i_pais` varchar(3) NOT NULL,
  PRIMARY KEY (`a_cp`),
  UNIQUE KEY `a_cp_UNIQUE` (`a_cp`),
  KEY `fk_region_pais_idx` (`i_pais`),
  CONSTRAINT `fk_region_pais` FOREIGN KEY (`i_pais`) REFERENCES `pais` (`i_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (52784,'La herradura','Mexico','Huixquilucan','MEX'),(52787,'Paseo de las palmas','Mexico','Huixquilucan','MEX'),(52799,'Llano Grande','Mexico','Huixquilucan','MEX'),(53000,'San bartolo','Mexico','Naucalpan','MEX'),(53120,'Lomas Verdes','Mexico','Naucalpan','MEX'),(53128,'Santa Cruz','Mexico','Naucalpan','MEX'),(54054,'Bellavista','Mexico','Tlalnepantla','MEX'),(54090,'Puente de vigas','Mexico','Tlalnepantla','MEX'),(54092,'Rosario','Mexico','Tlalnepantla','MEX');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `i_review` int(11) NOT NULL AUTO_INCREMENT,
  `i_articulo` int(10) NOT NULL,
  `i_cliente` int(10) NOT NULL,
  `q_puntuacion` int(1) NOT NULL,
  `e_review` varchar(500) NOT NULL,
  PRIMARY KEY (`i_review`),
  KEY `fk_review_1_idx` (`i_articulo`),
  KEY `fk_review_2_idx` (`i_cliente`),
  CONSTRAINT `fk_review_1` FOREIGN KEY (`i_articulo`) REFERENCES `articulo` (`i_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_2` FOREIGN KEY (`i_cliente`) REFERENCES `cliente` (`i_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `i_persona` int(10) NOT NULL,
  `e_telefono` varchar(15) NOT NULL,
  `n_extension` varchar(8) DEFAULT NULL,
  KEY `fk_telefono_pers_idx` (`i_persona`),
  CONSTRAINT `fk_telefono_pers` FOREIGN KEY (`i_persona`) REFERENCES `persona` (`i_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'5569354612',''),(2,'5568709873',''),(3,'5564253345',''),(4,'5560978544',''),(5,'5513253780',''),(6,'67686960','455'),(7,'5515823542',''),(8,'5541261632',''),(9,'3556345345',''),(10,'2344567833',''),(11,'14354647','677'),(12,'12327','4'),(13,'99364879',''),(14,'56464544',''),(15,'3676437484','');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_articulo`
--

DROP TABLE IF EXISTS `tipo_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_articulo` (
  `i_tipo_articulo` varchar(3) NOT NULL,
  `n_tipo_articulo` varchar(25) NOT NULL,
  `e_tipo_articulo` varchar(50) NOT NULL,
  PRIMARY KEY (`i_tipo_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_articulo`
--

LOCK TABLES `tipo_articulo` WRITE;
/*!40000 ALTER TABLE `tipo_articulo` DISABLE KEYS */;
INSERT INTO `tipo_articulo` VALUES ('ACC','Accesorios','Lo necesario para que juegues como campeón'),('CNS','Consolas','Poderosas consolas a precios increibles'),('CRD','Tarjetas y Suscripciones','Todo para mejorar tu forma de jugar'),('GAM','Juegos','Los mejores videojuegos, de todo tipo'),('PRM','Promocionales','Coleccionables de tus juegos favoritos');
/*!40000 ALTER TABLE `tipo_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocliente`
--

DROP TABLE IF EXISTS `tipocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocliente` (
  `i_tipocliente` int(2) NOT NULL,
  `e_tipocliente` varchar(45) NOT NULL,
  PRIMARY KEY (`i_tipocliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocliente`
--

LOCK TABLES `tipocliente` WRITE;
/*!40000 ALTER TABLE `tipocliente` DISABLE KEYS */;
INSERT INTO `tipocliente` VALUES (1,'Normal'),(2,'VIP');
/*!40000 ALTER TABLE `tipocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `i_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `t_transaccion` int(1) NOT NULL,
  `d_transaccion` date NOT NULL,
  `i_cliente` int(10) NOT NULL,
  PRIMARY KEY (`i_transaccion`),
  KEY `fk_transaccion_cliente_idx` (`i_cliente`),
  CONSTRAINT `fk_transaccion_cliente` FOREIGN KEY (`i_cliente`) REFERENCES `cliente` (`i_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-02 16:06:42
