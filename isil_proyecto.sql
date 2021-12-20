-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2020 a las 15:36:03
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `isil_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`) VALUES
(1, 'Perros', 'Para perros.'),
(2, 'Gatos', 'Para gatos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL,
  `fechacompra` datetime DEFAULT NULL,
  `estado` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `idpago` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idcompra`, `fechacompra`, `estado`, `monto`, `idpago`, `user_id`) VALUES
(55, '2020-10-30 00:00:00', 'Completado', 42.91, 63, 2),
(56, '2020-10-30 00:00:00', 'Completado', 4.11, 64, 2),
(58, '2020-10-30 00:00:00', 'Completado', 18.770000000000003, 67, 2),
(59, '2020-10-30 00:00:00', 'Completado', 30.63, 68, 2),
(60, '2020-10-31 00:00:00', 'Completado', 8.22, 69, NULL),
(61, '2020-10-31 00:00:00', 'Completado', 18.770000000000003, 70, NULL),
(62, '2020-10-31 00:00:00', 'Completado', 8.22, 71, NULL),
(63, '2020-10-31 00:00:00', 'Completado', 8.22, 72, NULL),
(64, '2020-11-04 00:00:00', 'Completado', 14.66, 73, 2),
(65, '2020-11-04 00:00:00', 'Completado', 17.22, 74, 2),
(66, '2020-11-04 00:00:00', 'Completado', 0, 75, 2),
(67, '2020-11-04 00:00:00', 'Completado', 8.22, 76, 2),
(68, '2020-11-04 00:00:00', 'Completado', 12.96, 77, 2),
(69, '2020-11-04 00:00:00', 'Completado', 8.85, 78, 2),
(70, '2020-11-05 00:00:00', 'Completado', 54.54, 79, 2),
(71, '2020-11-05 00:00:00', 'Completado', 4.11, 80, 2),
(72, '2020-11-05 00:00:00', 'Completado', 53.1, 81, 3),
(73, '2020-11-05 00:00:00', 'Completado', 4.11, 82, 3),
(74, '2020-11-05 00:00:00', 'Completado', 24.63, 83, 3),
(75, '2020-11-05 00:00:00', 'Completado', 20.54, 84, 8),
(76, '2020-11-05 00:00:00', 'Completado', 34.77, 85, 8),
(77, '2020-11-05 00:00:00', 'Completado', 38.02, 86, 8),
(78, '2020-11-05 00:00:00', 'Completado', 11.4, 87, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `iddetalle` int(11) NOT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `idcompra` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `preciocompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`iddetalle`, `idproducto`, `idcompra`, `cantidad`, `preciocompra`) VALUES
(1, 22, 55, 1, 10.55),
(2, 12, 55, 1, 4.11),
(3, 23, 55, 2, 8.85),
(4, 12, 56, 1, 4.11),
(5, 12, 58, 2, 4.11),
(6, 22, 58, 1, 10.55),
(7, 12, 59, 1, 4.11),
(8, 16, 59, 1, 2.12),
(9, 4, 59, 2, 12.2),
(10, 12, 60, 2, 4.11),
(11, 12, 61, 2, 4.11),
(12, 22, 61, 1, 10.55),
(13, 12, 62, 2, 4.11),
(14, 12, 63, 2, 4.11),
(15, 12, 64, 1, 4.11),
(16, 22, 64, 1, 10.55),
(17, 12, 65, 1, 4.11),
(18, 1, 65, 1, 1.41),
(19, 13, 65, 2, 5.85),
(20, 12, 67, 2, 4.11),
(21, 12, 68, 1, 4.11),
(22, 23, 68, 1, 8.85),
(23, 23, 69, 1, 8.85),
(24, 12, 70, 1, 4.11),
(25, 13, 70, 2, 5.85),
(26, 24, 70, 1, 8.85),
(27, 12, 71, 1, 4.11),
(28, 23, 72, 2, 8.85),
(29, 24, 72, 1, 8.85),
(30, 12, 73, 1, 4.11),
(31, 23, 74, 2, 8.85),
(32, 12, 74, 1, 4.11),
(33, 1, 74, 2, 1.41),
(34, 13, 75, 2, 5.85),
(35, 24, 75, 1, 8.85),
(36, 12, 76, 2, 4.11),
(37, 23, 76, 3, 8.85),
(38, 1, 77, 4, 1.41),
(39, 13, 77, 2, 5.85),
(40, 25, 77, 2, 3.58),
(41, 26, 77, 2, 3.58),
(42, 16, 77, 3, 2.12),
(43, 16, 78, 2, 2.12),
(44, 26, 78, 2, 3.58);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `monto`) VALUES
(63, 42.91),
(64, 4.11),
(65, 11.040000000000001),
(66, 0),
(67, 18.770000000000003),
(68, 30.63),
(69, 8.22),
(70, 18.770000000000003),
(71, 8.22),
(72, 8.22),
(73, 14.66),
(74, 17.22),
(75, 0),
(76, 8.22),
(77, 12.96),
(78, 8.85),
(79, 54.54),
(80, 4.11),
(81, 53.1),
(82, 4.11),
(83, 24.63),
(84, 20.549999999999997),
(85, 34.77),
(86, 38.02),
(87, 11.4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio` decimal(19,4) DEFAULT NULL,
  `foto_url` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `precio`, `foto_url`, `idcategoria`) VALUES
(1, 'Alimento Gatos Carne Michu', '1.4100', 'https://soporte.liris.com.ec/ImgAX/1024/7861032297300.jpg', 2),
(2, 'Alimento Gatos Pollo Michu', '1.4100', 'https://soporte.liris.com.ec/ImgAX/1024/7861032291551.jpg', 2),
(3, 'Buen Can Cachorro Pollo', '1.1500', 'https://soporte.liris.com.ec/ImgAX/1024/7861032291100.jpg', 1),
(4, 'Dog Chow Adulto Raza Mediana A Grande 2 Kilos', '12.2000', 'https://soporte.liris.com.ec/ImgAX/1024/7702521097288.jpg', 1),
(6, 'Almento Perro Trocitos Pollo Adul Procan 180G', '1.7000', 'https://soporte.liris.com.ec/ImgAX/1024/7861002831336.jpg', 1),
(7, 'Alimento Humedo Troc Cerdo Cach Procan 180Gr', '1.7900', 'https://soporte.liris.com.ec/ImgAX/1024/7861002831480.jpg', 1),
(8, 'Procan Armg Original', '0.9700', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830131.jpg', 1),
(9, 'Pro-Can Crp Pollcerleche', '1.3600', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830773.jpg', 1),
(10, 'Pro-Can Arp Pollcarveg', '1.2500', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830728.jpg', 1),
(11, 'Pro-Cat Gatitos 1Lb.', '2.5300', 'https://soporte.liris.com.ec/ImgAX/1024/7861002831138.jpg', 2),
(12, 'Pronaca Procan Armg Original 2 Kg', '4.1100', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830049.jpg', 1),
(13, 'Procan Rz Peque (Pollo-Cereal-Leche) 2 Kl', '5.8500', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830780.jpg', 1),
(14, 'Procan Armg Pollo-Arroz-Verd. Adulto 2 Kg', '4.3200', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830391.jpg', 1),
(16, 'Procat Recetas Del Mar  Adultos 1 Libra', '2.1200', 'https://soporte.liris.com.ec/ImgAX/1024/7861002830827.jpg', 2),
(17, 'Higiene Talco Bolfo 100 Gr', '4.0500', 'https://soporte.liris.com.ec/ImgAX/1024/7501051121254.jpg', 2),
(18, 'Higiene Jabon Perros Asuntol 90 Gr', '4.4500', 'https://soporte.liris.com.ec/ImgAX/1024/7702123007296.jpg', 1),
(19, 'Higiene Jabon Perros Asuntol 100 Gr', '4.3500', 'https://soporte.liris.com.ec/ImgAX/1024/7501051101003.jpg', 1),
(20, 'Pedigree Cachorro Carne En Salsa  Sobre 100 Gr', '1.3100', 'https://soporte.liris.com.ec/ImgAX/1024/7896029015001.jpg', 1),
(21, 'Whiskas Gatitos Carne En Salsa Sobre 85 Gr', '1.3100', 'https://soporte.liris.com.ec/ImgAX/1024/7896029047101.jpg', 2),
(22, 'Pedigree Vital Protect Sano Crecimiento E1  2 Kg', '10.5500', 'https://soporte.liris.com.ec/ImgAX/1024/7707214469649.jpg', 1),
(23, 'Alimento Gatos Pescado Whiskas Adultos 1.5 Kg', '8.8500', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466426.jpg', 2),
(24, 'Alimento Gatos Carne Whiskas Adultos 1.5 Kg', '8.8500', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466396.jpg', 2),
(25, 'Whiskas Adulto  Pollo Y Leche 500Gr', '3.5800', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466440.jpg', 2),
(26, 'Whiskas Adulto Carne Receta Original 500Gr', '3.5800', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466389.jpg', 2),
(27, 'Alimento Gatos Pescado Whiskas Adultos 500 Gr', '3.5800', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466419.jpg', 2),
(28, 'Cani Cachorros R. Medianas Y Grandes 454Gr', '2.0900', 'https://soporte.liris.com.ec/ImgAX/1024/7862112320055.jpg', 1),
(29, 'Cani Cachorros R. Pequeñas 454Gr', '2.1400', 'https://soporte.liris.com.ec/ImgAX/1024/7862112320611.jpg', 1),
(30, 'Cani Cachoros  R. Pequeñas 2Kg', '8.9900', 'https://soporte.liris.com.ec/ImgAX/1024/7862112320635.jpg', 1),
(32, 'Alimento prueba', '3.5800', 'https://soporte.liris.com.ec/ImgAX/1024/7707214466419.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `account_expired` tinyint(1) DEFAULT 0,
  `account_locked` tinyint(1) DEFAULT 0,
  `credentials_expired` tinyint(1) DEFAULT 0,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `disabled`, `account_expired`, `account_locked`, `credentials_expired`, `email`, `name`, `lastname`, `address`) VALUES
(1, 'admin', 'password', 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(2, 'user', 'password', 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(3, 'isil2020', 'isil', 0, 0, 0, 0, 'isil@gmail.com', NULL, NULL, NULL),
(4, 'yorivm', 'rejir4', 0, 0, 0, 0, 'mn@rotr.com', NULL, NULL, NULL),
(5, 'ert4', '342', 0, 0, 0, 0, 'fdhwe@ad.sw', NULL, NULL, NULL),
(6, 'hjgh', 'rtrhut', 0, 0, 0, 0, 'tfyhty', NULL, NULL, NULL),
(7, 'aw', 'aw', 0, 0, 0, 0, 'aw', NULL, NULL, NULL),
(8, 'yukg56', 'testing', 0, 0, 0, 0, 'marte@gmail.com', 'Mario', 'Arteaga', 'los cedros 402'),
(9, '6856jf', 'stg4', 0, 0, 0, 0, 'dget', 'ghfhr', 'jgfuty', 'tfhrt654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 3, 2),
(5, 7, 2),
(6, 8, 2),
(7, 9, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD KEY `ix_tmp_autoinc` (`idcategoria`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `compra_pago_idpago_fk` (`idpago`),
  ADD KEY `compra_users_user_id_fk` (`user_id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `detalle_compra_compra_idcompra_fk` (`idcompra`),
  ADD KEY `detalle_compra_producto_idproducto_fk` (`idproducto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `ix_tmp_autoinc` (`idproducto`),
  ADD KEY `fk__producto__idcate__286302ec` (`idcategoria`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_pago_idpago_fk` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`),
  ADD CONSTRAINT `compra_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_compra_idcompra_fk` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`),
  ADD CONSTRAINT `detalle_compra_producto_idproducto_fk` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk__producto__idcate__286302ec` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
