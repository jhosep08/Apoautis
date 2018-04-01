CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `acontecimientomedco`
--

DROP TABLE IF EXISTS `acontecimientomedco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acontecimientomedco` (
  `CodAcontecimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Cuando` varchar(80) DEFAULT NULL,
  `Donde` varchar(80) DEFAULT NULL,
  `DiagnosticoTratamiento` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CodAcontecimiento`,`Alumnos_CodAlumno`),
  KEY `fk_AcontecimientoMedco_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_AcontecimientoMedco_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acontecimientomedco`
--

LOCK TABLES `acontecimientomedco` WRITE;
/*!40000 ALTER TABLE `acontecimientomedco` DISABLE KEYS */;
/*!40000 ALTER TABLE `acontecimientomedco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `CodAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `NomAlumno` varchar(45) DEFAULT NULL,
  `LugarNaciAlum` varchar(60) DEFAULT NULL,
  `FechaNaciAlum` datetime DEFAULT NULL,
  `EdadAlum` int(11) DEFAULT NULL,
  `EdadCronologica` varchar(45) DEFAULT NULL,
  `SexoAlum` varchar(45) DEFAULT NULL,
  `IdAlum` varchar(45) DEFAULT NULL,
  `DireccionAlum` varchar(45) DEFAULT NULL,
  `TelFijoAlum` varchar(45) DEFAULT NULL,
  `CelAlumno` varchar(45) DEFAULT NULL,
  `EscolaridadAlum` varchar(45) DEFAULT NULL,
  `LugarOrigAlum` varchar(45) DEFAULT NULL,
  `InstProceAlumno` varchar(45) DEFAULT NULL,
  `InstDondeEstaIncluido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos/responsables`
--

DROP TABLE IF EXISTS `alumnos/responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos/responsables` (
  `CodAlumno` int(11) NOT NULL,
  `CodResp` int(11) NOT NULL,
  PRIMARY KEY (`CodAlumno`,`CodResp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos/responsables`
--

LOCK TABLES `alumnos/responsables` WRITE;
/*!40000 ALTER TABLE `alumnos/responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos/responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_has_responsables`
--

DROP TABLE IF EXISTS `alumnos_has_responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos_has_responsables` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Responsables_CodResp` int(11) NOT NULL,
  PRIMARY KEY (`Alumnos_CodAlumno`,`Responsables_CodResp`),
  KEY `fk_Alumnos_has_Responsables_Responsables1_idx` (`Responsables_CodResp`),
  KEY `fk_Alumnos_has_Responsables_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_Alumnos_has_Responsables_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_has_Responsables_Responsables1` FOREIGN KEY (`Responsables_CodResp`) REFERENCES `responsables` (`CodResp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_has_responsables`
--

LOCK TABLES `alumnos_has_responsables` WRITE;
/*!40000 ALTER TABLE `alumnos_has_responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_has_responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anamnesis`
--

DROP TABLE IF EXISTS `anamnesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anamnesis` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `TipoFamilia` varchar(45) DEFAULT NULL,
  `DuracionGestacion` varchar(45) DEFAULT NULL,
  `PesoAlNacer` varchar(45) DEFAULT NULL,
  `DatosPrenatales` varchar(45) DEFAULT NULL,
  `DatosPerinatales` varchar(45) DEFAULT NULL,
  `DatosPostnatales` varchar(45) DEFAULT NULL,
  KEY `fk_Anamnesis_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_Anamnesis_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anamnesis`
--

LOCK TABLES `anamnesis` WRITE;
/*!40000 ALTER TABLE `anamnesis` DISABLE KEYS */;
/*!40000 ALTER TABLE `anamnesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desarrollolenguaje`
--

DROP TABLE IF EXISTS `desarrollolenguaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desarrollolenguaje` (
  `CodLenguaje` int(11) NOT NULL,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `EdadComSonGut` varchar(45) DEFAULT NULL,
  `EdadComSonVoc` varchar(45) DEFAULT NULL,
  `EdadComSonSil` varchar(45) DEFAULT NULL,
  `EdadComSonPal` varchar(45) DEFAULT NULL,
  `PropiciaConver` varchar(45) DEFAULT NULL,
  `MuestraIntTema` varchar(45) DEFAULT NULL,
  `HablaEnTerPers` varchar(45) DEFAULT NULL,
  `DiceOracCompl` varchar(45) DEFAULT NULL,
  `RepitePalaEsc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodLenguaje`),
  KEY `fk_DesarrolloLenguaje_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_DesarrolloLenguaje_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrollolenguaje`
--

LOCK TABLES `desarrollolenguaje` WRITE;
/*!40000 ALTER TABLE `desarrollolenguaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `desarrollolenguaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desarrollomotriz`
--

DROP TABLE IF EXISTS `desarrollomotriz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desarrollomotriz` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `ControlCuello` varchar(45) DEFAULT NULL,
  `SeSento` varchar(45) DEFAULT NULL,
  `Gateo` varchar(45) DEFAULT NULL,
  `Camino` varchar(45) DEFAULT NULL,
  `Corrio` varchar(45) DEFAULT NULL,
  `Salta` varchar(45) DEFAULT NULL,
  `AntecedentesTransFami` varchar(45) DEFAULT NULL,
  `MovPeculiManoCuerp` varchar(45) DEFAULT NULL,
  KEY `fk_DesarrolloMotriz_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_DesarrolloMotriz_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrollomotriz`
--

LOCK TABLES `desarrollomotriz` WRITE;
/*!40000 ALTER TABLE `desarrollomotriz` DISABLE KEYS */;
/*!40000 ALTER TABLE `desarrollomotriz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desarrollosocial/comportamiento`
--

DROP TABLE IF EXISTS `desarrollosocial/comportamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desarrollosocial/comportamiento` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `AceptaBuscaInteraccion` varchar(80) DEFAULT NULL,
  `ParticipaEnActividades` varchar(80) DEFAULT NULL,
  `IntegradoEnKinder` varchar(80) DEFAULT NULL,
  `DesdeCuanIntegrado` varchar(80) DEFAULT NULL,
  `QueManifiesSuMaestra` varchar(80) DEFAULT NULL,
  `ComoSeDesenvuelve` varchar(80) DEFAULT NULL,
  `InteresPArticularJuguete` varchar(80) DEFAULT NULL,
  `DescribaDiaNormal` varchar(150) DEFAULT NULL,
  KEY `fk_DesarrolloSocial/Comportamiento_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_DesarrolloSocial/Comportamiento_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrollosocial/comportamiento`
--

LOCK TABLES `desarrollosocial/comportamiento` WRITE;
/*!40000 ALTER TABLE `desarrollosocial/comportamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `desarrollosocial/comportamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargadootrofamiliar`
--

DROP TABLE IF EXISTS `encargadootrofamiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encargadootrofamiliar` (
  `CodEncargadoOtrofam` int(11) NOT NULL AUTO_INCREMENT,
  `Responsables_CodResp` int(11) NOT NULL,
  `ParentescoEncarg` varchar(45) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodEncargadoOtrofam`),
  KEY `fk_EncargadoOtroFamiliar_Responsables1_idx` (`Responsables_CodResp`),
  CONSTRAINT `fk_EncargadoOtroFamiliar_Responsables1` FOREIGN KEY (`Responsables_CodResp`) REFERENCES `responsables` (`CodResp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargadootrofamiliar`
--

LOCK TABLES `encargadootrofamiliar` WRITE;
/*!40000 ALTER TABLE `encargadootrofamiliar` DISABLE KEYS */;
/*!40000 ALTER TABLE `encargadootrofamiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrevistapadres`
--

DROP TABLE IF EXISTS `entrevistapadres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrevistapadres` (
  `CodEntrevista` int(11) NOT NULL AUTO_INCREMENT,
  `ReferidoPor` varchar(45) DEFAULT NULL,
  `DetalleFueraEntre` varchar(85) DEFAULT NULL,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  PRIMARY KEY (`CodEntrevista`),
  KEY `fk_EntrevistaPadres_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_EntrevistaPadres_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrevistapadres`
--

LOCK TABLES `entrevistapadres` WRITE;
/*!40000 ALTER TABLE `entrevistapadres` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrevistapadres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `CodTipoEstado` int(11) NOT NULL,
  `CodEstado` int(11) NOT NULL,
  `DescripcionEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`CodTipoEstado`,`CodEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,1,'Usuario-Activo'),(1,2,'Usuario-Inactivo');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiosocioeconomico`
--

DROP TABLE IF EXISTS `estudiosocioeconomico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiosocioeconomico` (
  `CodEstudioSE` int(11) NOT NULL AUTO_INCREMENT,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Lugar` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `PersonaEntrevis` varchar(45) DEFAULT NULL,
  `RevisaAproPor` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CodEstudioSE`,`Alumnos_CodAlumno`),
  KEY `fk_EstudioSocioEconomico_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_EstudioSocioEconomico_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiosocioeconomico`
--

LOCK TABLES `estudiosocioeconomico` WRITE;
/*!40000 ALTER TABLE `estudiosocioeconomico` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiosocioeconomico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion` (
  `CodEvaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `FechaEvaluacion` datetime DEFAULT NULL,
  `ImpresionDiagnos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodEvaluacion`),
  KEY `fk_Evaluacion_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_Evaluacion_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialmedico`
--

DROP TABLE IF EXISTS `historialmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialmedico` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `UsaMedicamentos` varchar(80) DEFAULT NULL,
  `TieneAlergias` varchar(80) DEFAULT NULL,
  `LugaresRecibeAtencionMedica` varchar(80) DEFAULT NULL,
  `EnfermePadecenFamili` varchar(80) DEFAULT NULL,
  `CuantoGastaEnMed` double DEFAULT NULL,
  KEY `fk_HistorialMedico_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_HistorialMedico_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialmedico`
--

LOCK TABLES `historialmedico` WRITE;
/*!40000 ALTER TABLE `historialmedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionfamilia`
--

DROP TABLE IF EXISTS `informacionfamilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionfamilia` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `PersonasHabitan` int(11) DEFAULT NULL,
  `TienenMasHijos` varchar(45) DEFAULT NULL,
  `HabitanOtrosFami` varchar(45) DEFAULT NULL,
  `MiemEnTotal` int(11) DEFAULT NULL,
  `CuantMiembrTrab` int(11) DEFAULT NULL,
  `IngresoAbuela` double DEFAULT NULL,
  `IngresoMadre` double DEFAULT NULL,
  `IngresoPadre` double DEFAULT NULL,
  `IngresoHijo` double DEFAULT NULL,
  `Pension` double DEFAULT NULL,
  `OtrosIngresos` double DEFAULT NULL,
  `TotalMensLemp` double DEFAULT NULL,
  `GastoEnergiaElec` double DEFAULT NULL,
  `GastoAgua` double DEFAULT NULL,
  `GastoTel` double DEFAULT NULL,
  `GastoComida` double DEFAULT NULL,
  `GastoTransp` double DEFAULT NULL,
  `GastoSalub` double DEFAULT NULL,
  `GastoEduca` double DEFAULT NULL,
  `GastoGaso` double DEFAULT NULL,
  `GastoRopa` double DEFAULT NULL,
  `GastoVivienda` double DEFAULT NULL,
  `OtrosGastos` double DEFAULT NULL,
  `TotalGastos` double DEFAULT NULL,
  KEY `fk_InformacionFamilia_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_InformacionFamilia_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionfamilia`
--

LOCK TABLES `informacionfamilia` WRITE;
/*!40000 ALTER TABLE `informacionfamilia` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionfamilia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionvivienda`
--

DROP TABLE IF EXISTS `informacionvivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionvivienda` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Tenencia` varchar(45) DEFAULT NULL,
  `MaterialConst` varchar(45) DEFAULT NULL,
  `MaterialPiso` varchar(45) DEFAULT NULL,
  `ServiciosBacicos` varchar(45) DEFAULT NULL,
  `DisponeDe` varchar(45) DEFAULT NULL,
  KEY `fk_InformacionVivienda_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_InformacionVivienda_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionvivienda`
--

LOCK TABLES `informacionvivienda` WRITE;
/*!40000 ALTER TABLE `informacionvivienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionvivienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `CodLogin` bigint(20) NOT NULL AUTO_INCREMENT,
  `Intentos` int(11) DEFAULT NULL,
  `CodUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodLogin`),
  KEY `CodUsuario_idx` (`CodUsuario`),
  CONSTRAINT `CodUsuario` FOREIGN KEY (`CodUsuario`) REFERENCES `usuarios` (`CodUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (1,6,4),(2,6,5),(3,6,6),(5,6,7),(6,6,8),(7,6,9);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugaresrecreacion`
--

DROP TABLE IF EXISTS `lugaresrecreacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugaresrecreacion` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Parques` varchar(80) DEFAULT NULL,
  `CentrosComerciales` varchar(80) DEFAULT NULL,
  `Museos` varchar(80) DEFAULT NULL,
  `Cine` varchar(80) DEFAULT NULL,
  `Balnearios` varchar(80) DEFAULT NULL,
  `Playa` varchar(80) DEFAULT NULL,
  `Otros` varchar(80) DEFAULT NULL,
  KEY `fk_LugaresRecreacion_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_LugaresRecreacion_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugaresrecreacion`
--

LOCK TABLES `lugaresrecreacion` WRITE;
/*!40000 ALTER TABLE `lugaresrecreacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `lugaresrecreacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `CodMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `Jornada` varchar(45) DEFAULT NULL,
  `AnioIngreso` varchar(45) DEFAULT NULL,
  `RecibioEvalu` varchar(45) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `Entrevistador` varchar(45) DEFAULT NULL,
  `CuotaPago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodMatricula`,`Alumnos_CodAlumno`),
  KEY `fk_Matricula_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_Matricula_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rasgosidentificables`
--

DROP TABLE IF EXISTS `rasgosidentificables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rasgosidentificables` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `MuestroMovEstereOti` varchar(80) DEFAULT NULL,
  `AlineaObjetos` varchar(45) DEFAULT NULL,
  `MuestraCambTemp` varchar(45) DEFAULT NULL,
  `CamiPuntillas` varchar(45) DEFAULT NULL,
  `EntiPorSuNombre` varchar(45) DEFAULT NULL,
  `SigueInstrVerba` varchar(45) DEFAULT NULL,
  `MuestraEcolalia` varchar(45) DEFAULT NULL,
  `HablaSolo` varchar(45) DEFAULT NULL,
  `TonoVozPeculiar` varchar(45) DEFAULT NULL,
  `LenguajeFuncional` varchar(45) DEFAULT NULL,
  `GustaVerGirar` varchar(45) DEFAULT NULL,
  `MuesTermorAnte` varchar(45) DEFAULT NULL,
  `PatroMiraExtranos` varchar(45) DEFAULT NULL,
  `MiradaAlVacio` varchar(45) DEFAULT NULL,
  KEY `fk_RasgosIdentificables_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_RasgosIdentificables_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rasgosidentificables`
--

LOCK TABLES `rasgosidentificables` WRITE;
/*!40000 ALTER TABLE `rasgosidentificables` DISABLE KEYS */;
/*!40000 ALTER TABLE `rasgosidentificables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaccionaante`
--

DROP TABLE IF EXISTS `reaccionaante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reaccionaante` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `CorteCabello` varchar(80) DEFAULT NULL,
  `CorteUnas` varchar(80) DEFAULT NULL,
  `LimpiezaOidos` varchar(80) DEFAULT NULL,
  `Cepillado` varchar(80) DEFAULT NULL,
  `ConAdultosNinos` varchar(80) DEFAULT NULL,
  `ComoReacAnteCambios` varchar(80) DEFAULT NULL,
  KEY `fk_ReaccionaAnte_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_ReaccionaAnte_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaccionaante`
--

LOCK TABLES `reaccionaante` WRITE;
/*!40000 ALTER TABLE `reaccionaante` DISABLE KEYS */;
/*!40000 ALTER TABLE `reaccionaante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacionfamiliar`
--

DROP TABLE IF EXISTS `relacionfamiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacionfamiliar` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `ApegoUnMiemFami` varchar(80) DEFAULT NULL,
  `RelacionesConPadres` varchar(80) DEFAULT NULL,
  `ComporEnGeneral` varchar(80) DEFAULT NULL,
  `RelacionConHermanos` varchar(80) DEFAULT NULL,
  KEY `fk_RelacionFamiliar_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_RelacionFamiliar_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacionfamiliar`
--

LOCK TABLES `relacionfamiliar` WRITE;
/*!40000 ALTER TABLE `relacionfamiliar` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacionfamiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsables` (
  `CodResp` int(11) NOT NULL AUTO_INCREMENT,
  `NomComRes` varchar(45) DEFAULT NULL,
  `NumIdRes` int(11) DEFAULT NULL,
  `DomicilioRes` varchar(45) DEFAULT NULL,
  `ProfecionRes` varchar(45) DEFAULT NULL,
  `OficioRes` varchar(150) DEFAULT NULL,
  `LugarTrabajoRes` varchar(45) DEFAULT NULL,
  `TelCasaRes` varchar(45) DEFAULT NULL,
  `TelCelRes` varchar(45) DEFAULT NULL,
  `TelTrabajoRes` varchar(45) DEFAULT NULL,
  `CorreoRes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodResp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporesponsable`
--

DROP TABLE IF EXISTS `tiporesponsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiporesponsable` (
  `CodTipoRespo` int(11) NOT NULL AUTO_INCREMENT,
  `TipoResponsable` varchar(45) DEFAULT NULL,
  `Responsables_CodResp` int(11) NOT NULL,
  PRIMARY KEY (`CodTipoRespo`),
  KEY `fk_TipoResponsable_Responsables1_idx` (`Responsables_CodResp`),
  CONSTRAINT `fk_TipoResponsable_Responsables1` FOREIGN KEY (`Responsables_CodResp`) REFERENCES `responsables` (`CodResp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporesponsable`
--

LOCK TABLES `tiporesponsable` WRITE;
/*!40000 ALTER TABLE `tiporesponsable` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiporesponsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposatencion`
--

DROP TABLE IF EXISTS `tiposatencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposatencion` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `IncluExclu` varchar(45) DEFAULT NULL,
  KEY `fk_TiposAtencion_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_TiposAtencion_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposatencion`
--

LOCK TABLES `tiposatencion` WRITE;
/*!40000 ALTER TABLE `tiposatencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposatencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `CodUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `NomUsuario` varchar(45) DEFAULT NULL,
  `ClaveUsuaio` varchar(180) DEFAULT NULL,
  `CodigoEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'Az','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1),(5,'lolo','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1),(6,'Azul','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1),(7,'manolo','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1),(8,'qq','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1),(9,'arnoldito','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidadiaria`
--

DROP TABLE IF EXISTS `vidadiaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vidadiaria` (
  `Alumnos_CodAlumno` int(11) NOT NULL,
  `ComoEsSuRitmoDeSueño` varchar(80) DEFAULT NULL,
  `DuermeSolo` varchar(80) DEFAULT NULL,
  `AqueHoraSeAcuesta` varchar(80) DEFAULT NULL,
  `AqueHoraSeLevanta` varchar(80) DEFAULT NULL,
  `DuermeSinInterruccion` varchar(80) DEFAULT NULL,
  `DuermeConObjetoEspecial` varchar(80) DEFAULT NULL,
  `ComidaFavorita` varchar(80) DEFAULT NULL,
  `ComidaQueNoLeGusta` varchar(80) DEFAULT NULL,
  `ComeSolo` varchar(80) DEFAULT NULL,
  `UtilizaCubierto` varchar(80) DEFAULT NULL,
  `DesdeQueEdadComeSolo` varchar(80) DEFAULT NULL,
  `ComeCosasQueNoSeanComestibles` varchar(80) DEFAULT NULL,
  `LeAgradaBanarse` varchar(80) DEFAULT NULL,
  `CooperaParaElBano` varchar(80) DEFAULT NULL,
  `SeBanaSolo` varchar(80) DEFAULT NULL,
  `SeCambiaSolo` varchar(80) DEFAULT NULL,
  `CooperaParaCambiarse` varchar(80) DEFAULT NULL,
  `TieneRopaFavorita` varchar(80) DEFAULT NULL,
  `ControlaEsfinter` varchar(80) DEFAULT NULL,
  `MuestraSignosDefecado` varchar(80) DEFAULT NULL,
  `DaConoserPanalSucio` varchar(80) DEFAULT NULL,
  `DesdeQueEdadControlaEsfienter` varchar(80) DEFAULT NULL,
  `DesdeQueEdadUsaInodoro` varchar(80) DEFAULT NULL,
  `SeLimpiaSolo` varchar(80) DEFAULT NULL,
  `SeDejaLimpiar` varchar(80) DEFAULT NULL,
  KEY `fk_VidaDiaria_Alumnos1_idx` (`Alumnos_CodAlumno`),
  CONSTRAINT `fk_VidaDiaria_Alumnos1` FOREIGN KEY (`Alumnos_CodAlumno`) REFERENCES `alumnos` (`CodAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidadiaria`
--

LOCK TABLES `vidadiaria` WRITE;
/*!40000 ALTER TABLE `vidadiaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `vidadiaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-01 14:53:02
