-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 08:54:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebacompufax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `edad`, `email`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', 30, 'juan@example.com', '2024-01-01'),
(2, 'María', 'Gómez', 25, 'maria@example.com', '2024-01-02'),
(3, 'Carlos', 'López', 35, 'carlos@example.com', '2024-01-03'),
(4, 'Laura', 'Martínez', 28, 'laura@example.com', '2024-01-04'),
(5, 'Pedro', 'Rodríguez', 40, 'pedro@example.com', '2024-01-05'),
(6, 'test7', 'test7', 23, 'test7@example.com', NULL),
(7, 'test89', 'test89', 13, 'test89@example.com', NULL),
(8, 'test89', 'test89', 13, 'test89@example.com', NULL),
(9, 'test90', 'test90', 33, 'test90@example.com', NULL),
(10, 'test50', 'test50', 50, 'test50@example.com', NULL),
(11, 'test50', 'test50', 50, 'test50@example.com', NULL),
(12, 'test50', 'test50', 50, 'test50@example.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id`, `cliente_id`, `calle`, `ciudad`, `codigo_postal`) VALUES
(1, 1, 'Pinos del Norte', 'Mérida', '97203'),
(2, 2, 'Avenida Central 456', 'Ciudad B', '23456'),
(3, 3, 'francisco de montejo', 'Mérida', '97203'),
(4, 4, 'Boulevard Norte 321', 'Ciudad D', '45678'),
(5, 5, 'Calle Sur 654', 'Ciudad E', '56789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `producto` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `folio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `cliente_id`, `producto`, `cantidad`, `fecha_pedido`, `folio`) VALUES
(1, 1, 'Producto A', 2, '2024-01-01', 'ABC123'),
(2, 2, 'Producto B', 3, '2024-01-02', 'DEF456'),
(3, 3, 'Producto C', 1, '2024-01-03', 'GHI789'),
(4, 4, 'Producto D', 4, '2024-01-04', 'JKL012'),
(5, 5, 'Producto E', 2, '2024-01-05', 'MNO345'),
(6, 10, 'Producto Fax', 2, '2024-06-25', 'TEST493673'),
(7, 10, 'Producto Lavadora', 1, '2024-06-25', 'TEST493673'),
(8, 11, 'Producto Xbox', 1, '2024-06-25', 'TEST975130'),
(9, 11, 'Producto PC', 3, '2024-06-25', 'TEST975130'),
(10, 11, 'Producto Licuadora', 4, '2024-06-25', 'TEST975130');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
