-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 00:12:54
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `ID_DIRECCION` int(11) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`ID_DIRECCION`, `DIRECCION`) VALUES
(1, 'BARRIO ABAJO'),
(2, 'BARRIO ARRIBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envios`
--

CREATE TABLE `tbl_envios` (
  `IDENVIO` int(11) NOT NULL,
  `DESCRPCION_ENVIO` varchar(300) NOT NULL,
  `FECHA` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_envios`
--

INSERT INTO `tbl_envios` (`IDENVIO`, `DESCRPCION_ENVIO`, `FECHA`, `ID_DIRECCION`) VALUES
(312, 'SHAMPOO', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facturas`
--

CREATE TABLE `tbl_facturas` (
  `ID_FACTURA` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `FECHA_FACTURA` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `PRODUCTO` varchar(100) NOT NULL,
  `PRECIO` double NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `ID_PEDIDOS` int(11) NOT NULL,
  `PRODUCTO` varchar(100) NOT NULL,
  `PRECIO` double NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD PRIMARY KEY (`IDENVIO`),
  ADD KEY `FK_DIRECCION_ENVIOS` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD KEY `FK_DIRECCION_FACTURAS` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `FK_DIRECCIONES_INVENTARIO` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`ID_PEDIDOS`),
  ADD KEY `FK_DIRECCION_PEDIDOS` (`ID_DIRECCION`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD CONSTRAINT `FK_DIRECCION_ENVIOS` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD CONSTRAINT `FK_DIRECCION_FACTURAS` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `FK_DIRECCIONES_PRODUCTO` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `FK_DIRECCION_PEDIDOS` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
