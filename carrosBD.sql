-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-12-2019 a las 01:03:58
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrosBD`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `Num_placa` varchar(7) NOT NULL,
  `Precio` double(10,2) NOT NULL,
  `Seminuevo` int(1) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  `Marca` varchar(25) NOT NULL,
  `Year` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carros`
--

INSERT INTO `carros` (`Num_placa`, `Precio`, `Seminuevo`, `Color`, `Modelo`, `Marca`, `Year`) VALUES
('JASD34', 30000.00, 1, 'Beige', 'WRX STI', 'Subaru', '2000'),
('NBZT12', 2.00, 0, 'azul', 'flyer', 'vento', '8080');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carroscliente`
--

CREATE TABLE `carroscliente` (
  `Num_placa` varchar(7) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(3) NOT NULL,
  `Id_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Appellidos` varchar(35) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `RFC`, `Nombre`, `Appellidos`, `Direccion`, `Telefono`) VALUES
(1, 'CUOA9111114', 'Alberto', 'Cuevas', 'Melquiades Campos 1933', 101),
(2, 'LOMH91120212', 'Hector', 'Lopez', 'hacienda del carmen 1997', 221549),
(3, 'SIEP1234009', 'Emmanuel', 'Siordia', 'Hacienda Real 99', 14524378),
(4, 'PLJP09128912', 'Pablo', 'Chacon', 'Mezquitan Charco 2010', 9127843);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` blob DEFAULT NULL,
  `nomcomplete` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `pass`, `nomcomplete`) VALUES
(1, 'Emmanuel', 0x656d6d61313233, 'Emmanuel mendoza');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`Num_placa`);

--
-- Indices de la tabla `carroscliente`
--
ALTER TABLE `carroscliente`
  ADD KEY `Num_placa` (`Num_placa`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carroscliente`
--
ALTER TABLE `carroscliente`
  ADD CONSTRAINT `Id_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  ADD CONSTRAINT `Num_placa` FOREIGN KEY (`Num_placa`) REFERENCES `carros` (`Num_placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
