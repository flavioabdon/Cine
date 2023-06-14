-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2023 a las 23:25:36
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--
CREATE DATABASE IF NOT EXISTS `cine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cine`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asiento`
--

DROP TABLE IF EXISTS `Asiento`;
CREATE TABLE IF NOT EXISTS `Asiento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroAsiento` int(11) DEFAULT NULL,
  `Fila` varchar(10) DEFAULT NULL,
  `CineOSala` varchar(100) DEFAULT NULL,
  `EstadoDisponibilidad` varchar(20) DEFAULT NULL,
  `Funcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Asiento_FK` (`Funcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Boleta`
--

DROP TABLE IF EXISTS `Boleta`;
CREATE TABLE IF NOT EXISTS `Boleta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FuncionID` int(11) DEFAULT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `PrecioTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FuncionID` (`FuncionID`),
  KEY `UsuarioID` (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Funcion`
--

DROP TABLE IF EXISTS `Funcion`;
CREATE TABLE IF NOT EXISTS `Funcion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeliculaID` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFinalizacion` time DEFAULT NULL,
  `CineOSala` varchar(100) DEFAULT NULL,
  `PrecioEntrada` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PeliculaID` (`PeliculaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `InformacionCuenta`
--

DROP TABLE IF EXISTS `InformacionCuenta`;
CREATE TABLE IF NOT EXISTS `InformacionCuenta` (
  `UsuarioID` int(11) NOT NULL,
  `DireccionEnvio` varchar(100) DEFAULT NULL,
  `NumeroTelefono` varchar(20) DEFAULT NULL,
  `PreferenciasComunicacion` text DEFAULT NULL,
  PRIMARY KEY (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pago`
--

DROP TABLE IF EXISTS `Pago`;
CREATE TABLE IF NOT EXISTS `Pago` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BoletaID` int(11) DEFAULT NULL,
  `MetodoPago` varchar(50) DEFAULT NULL,
  `NumeroTarjeta` varchar(16) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BoletaID` (`BoletaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pelicula`
--

DROP TABLE IF EXISTS `Pelicula`;
CREATE TABLE IF NOT EXISTS `Pelicula` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Sinopsis` text DEFAULT NULL,
  `Duracion` int(11) DEFAULT NULL,
  `Director` varchar(100) DEFAULT NULL,
  `ActoresPrincipales` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TerminosCondiciones`
--

DROP TABLE IF EXISTS `TerminosCondiciones`;
CREATE TABLE IF NOT EXISTS `TerminosCondiciones` (
  `ID` int(11) NOT NULL,
  `TextoCompleto` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `NombreUsuario` varchar(50) DEFAULT NULL,
  `Contrasena` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`ID`, `Nombre`, `Apellido`, `CorreoElectronico`, `NombreUsuario`, `Contrasena`) VALUES
(1, 'Gerardo', 'Mendoza', 'gerardo@gmail.com', 'gerardo.mendoza', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Asiento`
--
ALTER TABLE `Asiento`
  ADD CONSTRAINT `Asiento_FK` FOREIGN KEY (`Funcion`) REFERENCES `Funcion` (`ID`);

--
-- Filtros para la tabla `Boleta`
--
ALTER TABLE `Boleta`
  ADD CONSTRAINT `Boleta_ibfk_1` FOREIGN KEY (`FuncionID`) REFERENCES `Funcion` (`ID`),
  ADD CONSTRAINT `Boleta_ibfk_2` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`ID`);

--
-- Filtros para la tabla `Funcion`
--
ALTER TABLE `Funcion`
  ADD CONSTRAINT `Funcion_ibfk_1` FOREIGN KEY (`PeliculaID`) REFERENCES `Pelicula` (`ID`);

--
-- Filtros para la tabla `InformacionCuenta`
--
ALTER TABLE `InformacionCuenta`
  ADD CONSTRAINT `InformacionCuenta_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`ID`);

--
-- Filtros para la tabla `Pago`
--
ALTER TABLE `Pago`
  ADD CONSTRAINT `Pago_ibfk_1` FOREIGN KEY (`BoletaID`) REFERENCES `Boleta` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
