-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2024 a las 09:23:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `curso`
--
CREATE DATABASE IF NOT EXISTS `curso` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `curso`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `apellidos`, `telefono`) VALUES
(1, 'Pepe', 'Rubio Crespo', '678453412'),
(2, 'Pepe', 'Rubio Crespo', '678453412'),
(3, 'Pepe', 'Rubio Crespo', '678453412'),
(4, 'Pepe', 'Rubio Crespo', '678453412');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `PAIS` varchar(30) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `SEXO` varchar(1) NOT NULL,
  `CURSO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`ID`, `NOMBRE`, `PAIS`, `FECHA_NACIMIENTO`, `SEXO`, `CURSO`) VALUES
(0, 'fasdf', 'sadfas', '2019-10-14', 'H', 'asdf'),
(1, 'Pepito Gonzalez', 'Rumania', '0000-00-00', 'H', 'Bases de datos'),
(2, 'Laura Sanz', 'Mexico', '0000-00-00', 'M', 'Contabilidad'),
(12, 'fasdf', 'sadfas', '2019-10-14', 'H', 'asdf'),
(123, 'Miriam Ruiz', 'Cuba', '0000-00-00', 'M', 'Contabilidad'),
(129, 'Cristian Lopez', 'España', '0000-00-00', 'H', 'Economia'),
(213, 'Luis Perez', 'Argentina', '0000-00-00', 'H', 'Cocina'),
(6235, 'Simone Simons', 'Holanda', '0000-00-00', 'M', 'Ballet'),
(10012, 'Mustafa Kemal', 'Turquia', '0000-00-00', 'H', 'Ballet'),
(12321, 'Susana Perez', 'España', '0000-00-00', 'M', 'Java'),
(12322, 'Fernando Torres', 'España', '0000-00-00', 'H', 'Java');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `idArticulo` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `telefono`) VALUES
(1, 'NombreCliente1', '1063780581'),
(2, 'NombreCliente2', '993730224'),
(3, 'NombreCliente3', '1002919202'),
(4, 'NombreCliente4', '595007928'),
(5, 'NombreCliente5', '731557108'),
(6, 'NombreCliente6', '784266740'),
(7, 'NombreCliente7', '582567029'),
(8, 'NombreCliente8', '1040269988'),
(9, 'NombreCliente9', '691110820'),
(10, 'NombreCliente10', '968186523'),
(11, 'j', '6'),
(14, 'j', '6'),
(15, 'j', '6'),
(16, 'j', '6'),
(17, 'j', '6'),
(18, 'j', '6'),
(19, 'j', '6'),
(20, 'j', '6'),
(21, 'Javier', '4'),
(22, 'j', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombre`, `apellidos`, `telefono`) VALUES
(1, 'c1', 'am', '1'),
(2, 'c2', 'am', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplo1`
--

CREATE TABLE `ejemplo1` (
  `id` int(11) NOT NULL,
  `valor1` varchar(255) DEFAULT NULL,
  `valor2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `ejemplo1`
--

INSERT INTO `ejemplo1` (`id`, `valor1`, `valor2`) VALUES
(1, 'Valor1-1', 'Valor2-1'),
(2, 'Valor1-2', 'Valor2-2'),
(3, 'Valor1-3', 'Valor2-3'),
(4, 'Valor1-4', 'Valor2-4'),
(5, 'Valor1-5', 'Valor2-5'),
(6, 'Valor1-6', 'Valor2-6'),
(7, 'Valor1-7', 'Valor2-7'),
(8, 'Valor1-8', 'Valor2-8'),
(9, 'Valor1-9', 'Valor2-9'),
(10, 'Valor1-10', 'Valor2-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplo2`
--

CREATE TABLE `ejemplo2` (
  `id` int(11) NOT NULL,
  `valor1` varchar(255) DEFAULT NULL,
  `valor2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `ejemplo2`
--

INSERT INTO `ejemplo2` (`id`, `valor1`, `valor2`) VALUES
(1, 'Valor1-1', 'Valor2-1'),
(2, 'Valor1-2', 'Valor2-2'),
(3, 'Valor1-3', 'Valor2-3'),
(4, 'Valor1-4', 'Valor2-4'),
(5, 'Valor1-5', 'Valor2-5'),
(6, 'Valor1-6', 'Valor2-6'),
(7, 'Valor1-7', 'Valor2-7'),
(8, 'Valor1-8', 'Valor2-8'),
(9, 'Valor1-9', 'Valor2-9'),
(10, 'Valor1-10', 'Valor2-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `granjeros`
--

CREATE TABLE `granjeros` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `granjeros`
--

INSERT INTO `granjeros` (`id`, `nombre`, `edad`) VALUES
(1, 'PepeGranjeros', 21),
(2, 'JoséGranjeros', 45),
(1, 'PepeGranjeros', 21),
(2, 'JoséGranjeros', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla1`
--

CREATE TABLE `tabla1` (
  `clave_tabla_1` int(11) NOT NULL,
  `campo1_tabla_1` varchar(50) DEFAULT NULL,
  `campo2_tabla1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tabla1`
--

INSERT INTO `tabla1` (`clave_tabla_1`, `campo1_tabla_1`, `campo2_tabla1`) VALUES
(1, 'valor1', 0),
(2, 'valor2', 0),
(3, 'valor3', 0),
(4, 'valor4', 0),
(5, 'valor5', 0),
(6, 'valor6', 0),
(7, 'valor7', 0),
(8, 'valor8', 0),
(9, 'valor9', 0),
(10, 'valor1', 0),
(11, 'valor2', 0),
(12, 'valor3', 0),
(13, 'valor4', 0),
(14, 'valor5', 0),
(15, 'valor6', 0),
(16, 'valor7', 0),
(17, 'valor8', 0),
(18, 'valor9', 0),
(19, 'valor1', 0),
(20, 'valor2', 0),
(21, 'valor3', 0),
(22, 'valor4', 0),
(23, 'valor5', 0),
(24, 'valor6', 0),
(25, 'valor7', 0),
(26, 'valor8', 0),
(27, 'valor9', 0),
(28, 'valor1', 0),
(29, 'valor2', 0),
(30, 'valor3', 0),
(31, 'valor4', 0),
(32, 'valor5', 0),
(33, 'valor6', 0),
(34, 'valor7', 0),
(35, 'valor8', 0),
(36, 'valor9', 0),
(37, 'valor1', 0),
(38, 'valor2', 0),
(39, 'valor3', 0),
(40, 'valor4', 0),
(41, 'valor5', 0),
(42, 'valor6', 0),
(43, 'valor7', 0),
(44, 'valor8', 0),
(45, 'valor9', 0),
(46, 'valor1', 0),
(47, 'valor2', 0),
(48, 'valor3', 0),
(49, 'valor4', 0),
(50, 'valor5', 0),
(51, 'valor6', 0),
(52, 'valor7', 0),
(53, 'valor8', 0),
(54, 'valor9', 0),
(200, 'asdfasdf', 323),
(205, 'qwerqwer', 55324),
(206, 'xcvxv', 221556),
(208, 'qwerqwer', 55324),
(209, 'xcvxv', 221556),
(211, 'qwerqwer', 55324),
(212, 'xcvxv', 221556),
(214, 'qwerqwer', 55324),
(215, 'xcvxv', 221556),
(217, 'qwerqwer', 55324),
(218, 'xcvxv', 221556),
(220, 'qwerqwer', 55324),
(221, 'xcvxv', 221556),
(223, 'qwerqwer', 55324),
(224, 'xcvxv', 221556),
(227, 'qwerqwer', 55324),
(228, 'xcvxv', 221556),
(230, 'qwerqwer', 55324),
(231, 'xcvxv', 221556),
(233, 'qwerqwer', 55324),
(234, 'xcvxv', 221556);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla2`
--

CREATE TABLE `tabla2` (
  `clave_tabla_2` int(11) NOT NULL,
  `campo1_tabla_2` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tabla2`
--

INSERT INTO `tabla2` (`clave_tabla_2`, `campo1_tabla_2`) VALUES
(1, '2019-10-06'),
(2, '2019-10-06'),
(3, '2019-10-06'),
(4, '2019-10-06'),
(5, '2019-10-06'),
(6, '2019-10-06'),
(7, '2019-10-06'),
(8, '2019-10-06'),
(9, '2019-10-06'),
(10, '2019-10-06'),
(11, '2019-10-06'),
(12, '2019-10-06'),
(13, '2019-10-06'),
(14, '2019-10-06'),
(15, '2019-10-06'),
(16, '2019-10-06'),
(17, '2019-10-06'),
(18, '2019-10-06'),
(19, '2019-10-06'),
(20, '2019-10-06'),
(21, '2019-10-06'),
(22, '2019-10-06'),
(23, '2019-10-06'),
(24, '2019-10-06'),
(25, '2019-10-06'),
(26, '2019-10-06'),
(27, '2019-10-06'),
(28, '2019-10-06'),
(29, '2019-10-06'),
(30, '2019-10-06'),
(31, '2019-10-06'),
(32, '2019-10-06'),
(33, '2019-10-06'),
(34, '2019-10-06'),
(35, '2019-10-06'),
(36, '2019-10-06'),
(37, '2019-10-06'),
(38, '2019-10-06'),
(39, '2019-10-06'),
(40, '2019-10-06'),
(41, '2019-10-06'),
(42, '2019-10-06'),
(43, '2019-10-06'),
(44, '2019-10-06'),
(45, '2019-10-06'),
(46, '2019-10-06'),
(47, '2019-10-06'),
(48, '2019-10-06'),
(49, '2019-10-06'),
(50, '2019-10-06'),
(51, '2019-10-06'),
(52, '2019-10-06'),
(53, '2019-10-06'),
(54, '2019-10-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla3`
--

CREATE TABLE `tabla3` (
  `clave_tabla_3` int(11) NOT NULL,
  `campo1_tabla_3` float DEFAULT NULL,
  `clave_tabla_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tabla3`
--

INSERT INTO `tabla3` (`clave_tabla_3`, `campo1_tabla_3`, `clave_tabla_2`) VALUES
(1, 10, 5),
(2, 20, 5),
(3, 30, 4),
(4, 40, 1),
(5, 50, 9),
(6, 60, 5),
(7, 70, 6),
(8, 80, 7),
(9, 90, 1),
(10, 10, 5),
(11, 20, 5),
(12, 30, 4),
(13, 40, 1),
(14, 50, 9),
(15, 60, 5),
(16, 70, 6),
(17, 80, 7),
(18, 90, 1),
(19, 10, 5),
(20, 20, 5),
(21, 30, 4),
(22, 40, 1),
(23, 50, 9),
(24, 60, 5),
(25, 70, 6),
(26, 80, 7),
(27, 90, 1),
(28, 10, 5),
(29, 20, 5),
(30, 30, 4),
(31, 40, 1),
(32, 50, 9),
(33, 60, 5),
(34, 70, 6),
(35, 80, 7),
(36, 90, 1),
(37, 10, 5),
(38, 20, 5),
(39, 30, 4),
(40, 40, 1),
(41, 50, 9),
(42, 60, 5),
(43, 70, 6),
(44, 80, 7),
(45, 90, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id`, `nombre`, `edad`) VALUES
(1, 'PepeVendedores', 21),
(2, 'JoséVendedores', 45),
(1, 'PepeVendedores', 21),
(2, 'JoséVendedores', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idArticulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `ejemplo1`
--
ALTER TABLE `ejemplo1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejemplo2`
--
ALTER TABLE `ejemplo2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  ADD PRIMARY KEY (`clave_tabla_1`);

--
-- Indices de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  ADD PRIMARY KEY (`clave_tabla_2`);

--
-- Indices de la tabla `tabla3`
--
ALTER TABLE `tabla3`
  ADD PRIMARY KEY (`clave_tabla_3`),
  ADD KEY `clave_tabla_2` (`clave_tabla_2`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `idArticulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ejemplo1`
--
ALTER TABLE `ejemplo1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ejemplo2`
--
ALTER TABLE `ejemplo2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  MODIFY `clave_tabla_1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  MODIFY `clave_tabla_2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `tabla3`
--
ALTER TABLE `tabla3`
  MODIFY `clave_tabla_3` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tabla3`
--
ALTER TABLE `tabla3`
  ADD CONSTRAINT `tabla3_ibfk_1` FOREIGN KEY (`clave_tabla_2`) REFERENCES `tabla2` (`clave_tabla_2`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `examen`
--
CREATE DATABASE IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `examen`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla1`
--

CREATE TABLE `tabla1` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla1`
--

INSERT INTO `tabla1` (`id`, `nombre`, `apellidos`, `telefono`) VALUES
(2, 'Pepe', 'Rubio Crespo', '678453412');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla2`
--

CREATE TABLE `tabla2` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tabla1`
--
ALTER TABLE `tabla1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tabla2`
--
ALTER TABLE `tabla2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'bd_tienda', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"categorias\",\"configuracion\",\"descuentos\",\"detalles_pedido\",\"impuestos\",\"metodos_pago\",\"opciones_menu\",\"pedidos\",\"productos\",\"proveedores\",\"roles\",\"usuarios\",\"valoraciones\"],\"table_structure[]\":[\"categorias\",\"configuracion\",\"descuentos\",\"detalles_pedido\",\"impuestos\",\"metodos_pago\",\"opciones_menu\",\"pedidos\",\"productos\",\"proveedores\",\"roles\",\"usuarios\",\"valoraciones\"],\"table_data[]\":[\"categorias\",\"configuracion\",\"descuentos\",\"detalles_pedido\",\"impuestos\",\"metodos_pago\",\"opciones_menu\",\"pedidos\",\"productos\",\"proveedores\",\"roles\",\"usuarios\",\"valoraciones\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"productos\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"pedidos\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"detalles_pedido\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"usuarios\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"proveedores\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"valoraciones\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"configuracion\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"categorias\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"descuentos\"},{\"db\":\"tienda_pedrodavid_gramcko_marquez\",\"table\":\"impuestos\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'tienda_pedrodavid_gramcko_marquez', 'detalles_pedido', '{\"sorted_col\":\"`detalles_pedido`.`id_pedido` ASC\"}', '2024-05-08 22:56:59'),
('root', 'tienda_pedrodavid_gramcko_marquez', 'pedidos', '{\"sorted_col\":\"`id` ASC\"}', '2024-05-08 19:10:36'),
('root', 'tienda_pedrodavid_gramcko_marquez', 'productos', '[]', '2024-05-08 19:17:56'),
('root', 'usuario_prueba', 'usuario', '{\"sorted_col\":\"`usuario`.`password` ASC\"}', '2024-04-05 09:25:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-05-10 07:22:53', '{\"Console\\/Mode\":\"show\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda_pedrodavid_gramcko_marquez`
--
CREATE DATABASE IF NOT EXISTS `tienda_pedrodavid_gramcko_marquez` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_pedrodavid_gramcko_marquez`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `activo`) VALUES
(1, 'Perros', 'Productos de perros', 1),
(2, 'Gatos', 'Productos de gatos', 1),
(3, 'Otros animales', 'Productos de diversos animales', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `clave`, `valor`, `tipo`) VALUES
(1, 'nombre_empresa', 'Happy Pets', 'String'),
(2, 'cif', 'B14507610', 'String'),
(3, 'direccion', 'Calle de Santa Clara 99, 49032, Zamora España', 'String'),
(6, 'correo', 'administracion@happypets.es', NULL),
(7, 'factura', '116', 'int'),
(8, 'telefono', '777888999', 'int'),
(9, 'web', 'www.happypets.es', 'String');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `precio_unidad` float DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id`, `id_pedido`, `id_producto`, `precio_unidad`, `unidades`, `impuesto`, `total`) VALUES
(183, 152, 13, 55.99, 5, 21, 279.95),
(184, 153, 17, 20.99, 1, 21, 20.99),
(185, 153, 19, 11.25, 1, 21, 11.25),
(186, 153, 14, 25.99, 2, 21, 51.98),
(187, 153, 21, 17.19, 1, 21, 17.19),
(188, 154, 18, 20.49, 1, 21, 20.49),
(189, 154, 16, 13.59, 1, 21, 13.59),
(190, 155, 19, 11.25, 20, 21, 225),
(191, 156, 15, 8.49, 5, 21, 42.45),
(193, 157, 21, 17.19, 1, 21, 17.19),
(194, 158, 20, 102.99, 12, 21, 1235.8799999999999),
(195, 158, 21, 17.19, 1, 21, 17.19),
(196, 159, 16, 13.59, 3, 21, 40.769999999999996),
(197, 160, 15, 8.49, 1, 21, 8.49),
(198, 160, 14, 25.99, 2, 21, 51.98),
(199, 161, 18, 20.49, 3, 21, 61.47),
(200, 161, 21, 17.19, 4, 21, 68.76),
(212, 168, 15, 8.49, 2, 21, 16.98),
(214, 170, 15, 8.49, 8, 21, 67.92),
(215, 171, 14, 25.99, 1, 21, 25.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `id` int(11) NOT NULL,
  `impuesto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_menu`
--

CREATE TABLE `opciones_menu` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `nombre_opcion` varchar(255) DEFAULT NULL,
  `url_opcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `metodo_pago` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `num_factura` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_usuario`, `fecha`, `metodo_pago`, `estado`, `num_factura`, `total`) VALUES
(152, 15, '2024-02-08 21:14:06', 'tarjeta', 'Cancelado', NULL, 279.95),
(153, 15, '2024-01-08 21:10:12', 'tarjeta', 'Enviado', '00102', 101.41),
(154, 15, '2024-03-08 21:10:12', 'tarjeta', 'Enviado', '00103', 34.08),
(155, 15, '2024-01-08 21:13:50', 'tarjeta', 'Cancelado', NULL, 225),
(156, 15, '2024-03-08 21:16:52', 'tarjeta', 'Enviado', '00104', 42.45),
(157, 15, '2024-03-08 21:16:52', 'tarjeta', 'Enviado', '00105', 120.17999999999999),
(158, 15, '2024-03-08 21:18:32', 'tarjeta', 'Enviado', '00106', 1253.07),
(159, 15, '2024-03-08 21:18:32', 'tarjeta', 'Enviado', '00107', 40.769999999999996),
(160, 15, '2024-04-08 20:18:32', 'tarjeta', 'Enviado', '00108', 60.47),
(161, 15, '2024-04-08 20:18:32', 'tarjeta', 'Enviado', '00109', 130.23000000000002),
(168, 31, '2024-05-09 07:24:46', 'tarjeta', 'Cancelado', NULL, 16.98),
(170, 33, '2024-05-09 08:57:57', 'paypal', 'Enviado', '00115', 67.92),
(171, 33, '2024-05-09 09:00:04', 'tarjeta', 'Enviado', '00116', 25.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(800) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_baja` timestamp NOT NULL DEFAULT current_timestamp(),
  `impuesto` float DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_alta`, `fecha_baja`, `impuesto`, `imagen`, `activo`) VALUES
(13, 1, 'Pienso labradores adulto', 'Pienso completo para perros de cordero y arroz. Alimento diseÃ±ado especialmente para perros de edad adulta, es una opciÃ³n muy equilibrada y apetitosa que cuenta con la calidad nutritiva adecuada. 15KG', 55.99, 93, '2024-05-09 07:23:51', '0000-00-00 00:00:00', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw8204b831/images/pienso_gastroinestinal_perros_criadores_arroz_CRD2317_M.jpg?sw=780&sh=780&q=85', 1),
(14, 1, 'Salvaje base adultos salmón pienso para perros', 'Pienso para perros Salvaje Base Adulto con salmón\nEl pienso Salvaje Base para perros es un alimento completo y equilibrado para razas pequeñas, medianas y grandes. Su fórmula especial y de alta calidad aporta todos los nutrientes que necesita tu mascota. ', 25.99, 85, '2024-05-09 08:58:59', '0000-00-00 00:00:00', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw95bd0067/images/pienso_perros_salvaje_adulto_salmon_SAB0993.jpg?sw=528&sh=528', 1),
(15, 1, 'Wow Gum Dental 360 Hueso Mordedor para perros', 'Juguete dental para mascotas con forma de hueso\nEl juguete para perros TK-Pet Dental 360 tiene forma de hueso y está especialmente diseñado para poder satisfacer el instinto de morder que tienen estas mascotas.  ', 8.49, 82, '2024-05-09 08:57:38', '0000-00-00 00:00:00', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw7578045f/images/juguete_perro_TK_Pet_Dental_360_hueso_para_perro_juguete_de_goma_TKP30265.jpg?sw=780&sh=780&q=85', 1),
(16, 3, 'Ferplast sippy bebedero con ventosa para roedores', 'Posee una válvula dosificadora profesional en acero inoxidable y desmontable para su limpieza.\n\nEste bebedero especial para roedores que puede pegarse en el cristal es un producto exclusivo de TiendAnimal, pensado para resolver el problema que supone proporcionar agua fresca a nuestros roedores si los criamos dentro de una pecera o en un terrario de plástico. Hay multitud de mascotas que tenemos que instalar en acuarios y terrarios y los dueños de este tipo de mascotas no encontramos bebederos apropiados. Erizos, cobayas, hamsters... nuestra opción de instalarlos en acuarios es por múltiples motivos, por seguridad, comodidad, limpieza, pero lo terrible es que diariamente tenemos que pegar y despegar el bebedero con soluciones caseras que son incómodas y no funcionan bien.', 13.59, 93, '2024-05-08 22:54:56', '0000-00-00 00:00:00', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw8e0153f9/images/accesorios_roedores_ferplast_bebedero_sippy_FER84676070_300.jpg?sw=780&sh=780&q=85', 1),
(17, 1, 'Vectra 3D pipetas antiparasitarias para perros', 'Las pipetas para perros Vectra 3D protegen a tu mejor amigo de forma sencilla frente a todos los parásitos que pueden atacarle. Es una solución eficaz frente a pulgas, garrapatas, mosquitos, flebotomos y moscas del establo que, además, también protege tu hogar de los huevos, pupas y larvas de pulga.\r\nSe trata de un antiparasitario externo de acción total con un efecto repelente que actúa cuando los diferentes parásitos entran en contacto con la piel de tu mascota. La protección de cada pipeta dura todo un mes, por lo que con Vectra podrás proteger a tu perro durante 3 meses.', 20.99, 95, '2024-05-08 23:02:55', '0000-00-00 00:00:00', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dwcb49bd64/images/antiparasitario_perro_vectra_3D_CEVC66150D_1.jpg?sw=780&sh=780&q=85', 1),
(18, 2, 'Vectra Felis Pipetas Antiparasitario Para Gato', 'Estas pipetas repelen a las pulgas con la excelente composición dinotefuran (insecticida y acaricida). Su excelente composición es resistente al agua por lo que no tendréis que os preocupar cuando bañes a tu querida mascota; la protección dura 4 semanas d', 20.49, 93, '2024-05-08 23:02:55', '2024-04-26 18:41:15', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw83b617e5/images/antiparasitarios_gatos_vectra_felis_CEVC66010B.jpg?sw=528&sh=528', 1),
(19, 1, 'Whimzees snacks dentales para perros de razas grandes', 'Los snacks para perros grandes Whimzees cepillo dental son golosinas para mascotas que están elaboradas con ingredientes vegetales naturales cuidadosamente seleccionados. Su base de almidón de patata es perfecta, ya que inyecta una dosis de energía a tu mejor amigo a la vez que es muy digestible y no contiene gluten.\r\n\r\nEstos premios de sello holandés son muy innovadores, ya que son los primeros bajos en grasas, libres de colorantes, conservantes y saborizantes artificiales. Respetan el medio ambiente y la naturaleza al 100%, por eso sus componentes son libres de transgénicos y sostenibles. Su forma especial llena de surcos ayuda a limpiar sus dientes mejor.', 11.25, 79, '2024-05-08 20:12:03', '2024-04-28 18:06:42', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw26e7ed5a/images/snack-perro-cepillo-perros-grandes-whimzees-WHMWHZ304_0.jpg?sw=780&sh=780&q=85', 1),
(20, 3, 'Sera vipagran granulos para peces', 'Este alimento en hojuelas para peces de boca pequeña y faringe estrecha es delicioso y tiene una textura suave, lo que lo hace muy fácil de digerir. Es también de hundimiento lento, por lo que los peces que se alimentan en las zonas intermedias del agua pueden comer con calma.\r\n\r\nEntre sus ingredientes principales tiene prebióticos y harina de insectos, que constituye una rica fuente de proteína natural, sin colorantes ni conservantes químicos añadidos. También incorpora espirulina y mejillón de labio verde, para mantener a los peces muy bien nutridos, con un alimento balanceado y delicioso.', 102.99, 87, '2024-05-08 20:17:05', '2024-04-28 18:20:33', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dwa1c9f53f/images/alimenot_peces_sera_vipagran_250ml_SER203.png?sw=780&sh=780&q=85', 1),
(21, 2, 'Carnilove adult pollo y conejo pienso para gatos', 'Carnilove Chicken & Rabbit es un pienso completo y equilibrado para gatos adultos. Contiene carne de pollo y de conejo como ingredientes principales para un aporte de proteínas de alto valor biológico. Es libre de cereales y patata, por lo que es una opción estupenda para los gatos con el estómago sensible o con intolerancia o alergia a estos alimentos.\r\n\r\nEl pienso Carnilove proporciona una alimentación óptima adaptada a las necesidades nutricionales de los felinos y teniendo en cuenta su naturaleza carnívora. Por eso incorpora un 78% de carne de primera calidad. La receta se completa con frutas, vegetales y plantas: manzana, arándanos, zanahorias, guisantes y garbanzos. Una proporción adecuada de proteínas, grasas, vitaminas y minerales para que el gato tenga una salud óptima y una buena', 17.19, 93, '2024-05-08 20:18:31', '2024-05-07 18:38:54', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dwb9d775a2/images/Carnilove_Chicken_y_Rabbit_pienso_para_gatos_CAR42381_M.jpg?sw=780&sh=780&q=85', 1),
(24, 2, 'Pienso', 'pieso', 22.5, 100, '2024-05-09 09:00:49', '2024-05-09 09:00:49', 21, 'https://www.tiendanimal.es/dw/image/v2/BDLQ_PRD/on/demandware.static/-/Sites-kiwoko-master-catalog/default/dw64029a1c/images/pienso_gatos_criadores_especial_esterilizado_pollo_CRD6789_M_sello.jpg?sw=780&sh=780&q=85', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `cif` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `localidad`, `provincia`, `telefono`, `cif`, `email`, `activo`) VALUES
(1, 'Mascotas de todo', 'Avenida reyes catolicos 6', 'Madrid', 'Madrid', '56464613', 'G1134446', 'pdgramcko@serbatic.es', 1),
(2, 'Pienso animales', 'avenida del loco 1', 'Barcelona', 'Barcelona', '46488112', 'G1346485', 'admin@admin.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Cliente'),
(2, 'Empleado'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido1` varchar(255) DEFAULT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `passCambiada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_rol`, `email`, `clave`, `nombre`, `apellido1`, `apellido2`, `direccion`, `provincia`, `localidad`, `telefono`, `dni`, `activo`, `passCambiada`) VALUES
(15, 1, 'pedro@pedro.com', 't7bjYA8eU9qLzUo81ndb4lw/zGXvjJwSsJ8fDT9vB1yNTJhfs5YRNwOpJViPqyNQ', 'pedro', 'pedro', 'pedro', 'pedro', 'pedro', 'pedro', '7222', '1222', 1, 0),
(23, 3, 'admin', 'tbe+6J42Rg6zXgz4TiIkk534vh+H+owRr6VL6d11+E7FYdCq2Vm5D006y1LSka8a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(31, 1, 'aa@a.es', 'manEtwCKNMkbs9GAUwMH60QbTl4R1X7xheNwu5bwv213NlZ5Wsc96hoFJ/C3+PBZ', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', '77777', '7946212A', 1, 0),
(32, 2, 'empleado@prueba.es', 'YtQkulPZoUdcLLXEh5jwmZ+EayfStuDBahaPSH6x7xvtYM1yGpzeflli12FLoXyZ', 'Pedro', 'Gramcko', 'Marquez', 'Avenida galicia 19', 'Zamora', 'Zamora', '755382400', '74882520C', 1, 0),
(33, 1, 'prueba@prueba.es', 'FiPuZ9lFQh8lYyGbdPjK9J9e6+/TlSTIejyXUexGUijWY5atsDe70Qpr52FQh4Sp', 'Pedro', 'Pedro', 'Pedro', 'Zamora', 'Zamora', 'Zamora', '742454', '4745471A', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoraciones`
--

CREATE TABLE `valoraciones` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `valoraciones`
--
ALTER TABLE `valoraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `opciones_menu`
--
ALTER TABLE `opciones_menu`
  ADD CONSTRAINT `opciones_menu_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `valoraciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `usuario_prueba`
--
CREATE DATABASE IF NOT EXISTS `usuario_prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `usuario_prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nombre` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `password`) VALUES
('miguel', 'miguel'),
('pedro', 'pedro');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
