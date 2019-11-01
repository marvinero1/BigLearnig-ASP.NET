-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.36-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para biglearnign
CREATE DATABASE IF NOT EXISTS `biglearnign` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `biglearnign`;

-- Volcando estructura para tabla biglearnign.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `cod_curso` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `curso_nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `modalidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `seccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `jornada` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  PRIMARY KEY (`cod_curso`),
  CONSTRAINT `FK_cursos_estudiante` FOREIGN KEY (`cod_curso`) REFERENCES `estudiante` (`cod_curso`),
  CONSTRAINT `FK_cursos_materias` FOREIGN KEY (`cod_curso`) REFERENCES `materias` (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla biglearnign.cursos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Volcando estructura para tabla biglearnign.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `id_docente` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `apellido` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `telefono` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `email` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  PRIMARY KEY (`id_docente`),
  CONSTRAINT `FK_docente_materias` FOREIGN KEY (`id_docente`) REFERENCES `materias` (`cod_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla biglearnign.docente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Volcando estructura para tabla biglearnign.estudiante
CREATE TABLE IF NOT EXISTS `estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `apellido_materno` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT '0',
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` binary(50) DEFAULT NULL,
  `padre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `madre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_curso` int(10) unsigned NOT NULL,
  `fecha_matricula` date NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `cod_curso` (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla biglearnign.estudiante: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla biglearnign.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `materia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_curso` int(100) unsigned NOT NULL,
  `cod_docente` int(100) unsigned NOT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `cod_curso` (`cod_curso`),
  KEY `cod_docente` (`cod_docente`),
  CONSTRAINT `FK_materias_notas` FOREIGN KEY (`id_materia`) REFERENCES `notas` (`cod_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla biglearnign.materias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;

-- Volcando estructura para tabla biglearnign.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `parcial1` int(100) DEFAULT '0',
  `parcial2` int(100) DEFAULT '0',
  `parcial3` int(100) DEFAULT '0',
  `promedio` int(100) DEFAULT '0',
  `recuperacion1` int(100) DEFAULT '0',
  `cod_curso` int(100) NOT NULL,
  `cod_materia` int(100) NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `cod_curso` (`cod_curso`),
  KEY `cod_materia` (`cod_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla biglearnign.notas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
