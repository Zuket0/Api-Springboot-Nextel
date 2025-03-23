-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2025 a las 22:44:49
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
-- Base de datos: `nextel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cli` int(8) NOT NULL,
  `nombre_cli` varchar(50) NOT NULL,
  `apellidos_cli` varchar(50) NOT NULL,
  `email_cli` varchar(50) NOT NULL,
  `numero_cli` bigint(9) NOT NULL,
  `contraseña_cli` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cli`, `nombre_cli`, `apellidos_cli`, `email_cli`, `numero_cli`, `contraseña_cli`, `tipo_usuario`) VALUES
(12547896, 'Jaime', 'Damian', 'aji6464@gmail.com', 943905939, '123', 2),
(35434684, 'Adrian', 'Jos', 'Adrian79@gmail.com', 456456456, '123', 2),
(51428547, 'Pablo', 'Peredo', 'Peredin@gmail.com', 885547158, '123456', 2),
(54835438, 'Lucho', 'Perez', 'Luchito@gmail.com', 354346846, '1234', 2),
(71234567, 'Facundo', 'Muñoz', 'facho@gmail.com', 912345678, '1234', 2),
(71376483, 'Mariano', 'Mendez', 'mendel2003@gmail.com', 123456789, '1234567', 2),
(72345678, 'María', 'Rodriguez', 'mariaDB@gmail.com', 922345678, '5678', 2),
(72525486, 'Juan', 'Chavez', 'juanch@gmail.com', 998851248, '123456', 2),
(73456789, 'Carlos', 'Lopez', 'carlos857@yahoo.com', 932345678, '9012', 2),
(74567890, 'Ana', 'Martínez', 'Anitax@utp.edu.pe', 942345678, '3456', 2),
(75241986, 'Mauricio', 'Quilca', 'Quilca79@gmail.com', 996658421, '12345', 2),
(75248159, 'Maximo', 'Moreno', 'Maximo@gmail.com', 885524198, '1234', 2),
(75285484, 'Dafne', 'chavez', 'zdafne702@gmial.com', 885574817, '123', 2),
(75412859, 'Nicolas', 'Ortiz', 'Ortiz@hotmail.com', 998574128, '7894', 2),
(75824195, 'Arturo', 'Campos', 'GamesStudios@gmail.com', 995841274, '1234', 2),
(75842195, 'Halim', 'Samir', 'Yiko158@gmail.com', 998548218, '123', 2),
(78541269, 'Kiara', 'Garcia', 'Haylulu@gmail.com', 996658418, '123456', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(8) NOT NULL,
  `id_producto` int(8) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_em` int(8) NOT NULL,
  `nombre_em` varchar(50) NOT NULL,
  `apellidos_em` varchar(50) NOT NULL,
  `email_em` varchar(50) NOT NULL,
  `contraseña_em` varchar(255) NOT NULL,
  `celular_em` bigint(9) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `Genero` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_em`, `nombre_em`, `apellidos_em`, `email_em`, `contraseña_em`, `celular_em`, `tipo_usuario`, `Genero`) VALUES
(71376484, 'Patricio', 'Bullicio', 'Patrix@gmail.com', '1234', 945976258, 1, 'M'),
(73646512, 'Alfredo', 'Beto', 'Nugget@gmail.com', '123', 943905939, 1, 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(8) NOT NULL,
  `id_cliente` int(8) NOT NULL,
  `id_empleado` int(8) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `estado_pedido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `id_empleado`, `fecha_pedido`, `estado_pedido`) VALUES
(1, 12547896, 71376484, '2024-09-10 10:00:00', 'Enviado'),
(2, 71376483, 73646512, '2024-04-18 10:40:00', 'Enviado'),
(3, 74567890, 73646512, '2024-01-16 19:43:32', 'Enviado'),
(4, 73456789, 71376484, '2023-07-12 17:32:06', 'Enviado'),
(5, 71234567, 73646512, '2023-11-22 12:27:15', 'Enviado'),
(6, 12547896, 71376484, '2023-05-10 20:03:56', 'Enviado'),
(7, 72525486, 73646512, '2022-07-28 17:30:56', 'Enviado'),
(8, 78541269, 71376484, '2022-09-09 14:02:10', 'Enviado'),
(9, 71376483, 73646512, '2022-02-14 18:23:19', 'Enviado'),
(10, 72345678, 71376484, '2021-10-22 13:15:25', 'Enviado'),
(11, 75412859, 73646512, '2021-06-10 15:52:12', 'Enviado'),
(12, 51428547, 71376484, '2021-08-12 19:42:51', 'Enviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(8) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `tipo_producto` varchar(255) NOT NULL,
  `precio_producto` double NOT NULL,
  `stock_producto` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `tipo_producto`, `precio_producto`, `stock_producto`, `url`) VALUES
(1, 'iPhone 13', 'Celular con 4GB de RAM y 128GB de capacidad', 'Apple', 2079, 10, 'https://i.imgur.com/o5o4ewW.png'),
(2, 'iPhone 15', 'Celular con 6GB de Ram y 128GB de capacidad\r\n', 'Apple', 2999, 25, 'https://i.imgur.com/3bme3A7.png'),
(3, 'Redmi Note 13 Pro', 'Celular con 8GB de Ram y 256GB de capacidad\r\n', 'Xiaomi', 969, 50, 'https://i.imgur.com/Vu7Et0K.png'),
(4, 'Moto G54 5G', 'Celular con 8GB de Ram y 256GB de capacidad\r\n', 'Motorola', 699, 21, 'https://i.imgur.com/wGvbz4t.png'),
(5, 'Redmi Note 13 Pro Plus', 'Celular con 12GB de Ram y 512GB de capacidad\r\n', 'Xiaomi', 1659, 15, 'https://i.imgur.com/u08KnKz.png'),
(6, 'Samsung Galaxy A06', 'Celular con 4GB de Ram y 128GB de capacidad', 'Samsung', 399, 30, 'https://i.imgur.com/ZyRVT9p.png'),
(7, 'Samsung Galaxy A55', 'Celular con 8GB de Ram y 256GB de capacidad', 'Samsung', 1579, 10, 'https://i.imgur.com/3OTx6Vu.png'),
(8, 'Honor H200', 'Celular con 12GB de Ram y 256GB de capacidad', 'Honor', 1729, 43, 'https://i.imgur.com/5EoAPdC.png'),
(9, 'Zte A55', 'Celular con 4GB de Ram y 128GB de capacidad', 'Zte', 319, 28, 'https://i.imgur.com/4xAozkF.png'),
(10, 'Oppo Reno 12 5G', 'Celular con 12GB de Ram y 512GB de capacidad', 'Oppo', 2079, 32, 'https://i.imgur.com/6aszVcG.png'),
(11, 'Moto G22', 'Celular con 4GB de Ram y 128GB de capacidad', 'Motorola', 100, 27, 'https://i.imgur.com/UKkuayq.png'),
(12, 'iPhone 16 Pro Max', 'Celular con 8GB de Ram y 256GB de capacidad', 'Apple', 6279, 94, 'https://i.imgur.com/8790N8Q.png'),
(13, 'iPhone 14', 'Celular con 6GB de Ram y 128GB de capacidad', 'Apple', 3519, 37, 'https://i.imgur.com/vAOHJMW.png'),
(14, 'Honor Magic 7 Lite', 'Celular con 8GB de Ram y 512GB de capacidad', 'Honor', 1699, 48, 'https://i.imgur.com/JqIUlDI.png'),
(15, 'Samsung S24 Ultra', 'Celular con 12GB de Ram y 512GB de capacidad', 'Samsung', 5409, 64, 'https://i.imgur.com/ICbRPqP.png'),
(16, 'Samsung Galaxy S24 Plus', 'Celular con 12GB de Ram y 512GB de capacidad', 'Samsung', 5299, 61, 'https://i.imgur.com/QPESff4.png'),
(17, 'Nokia 105 4G', 'Celular con 48Mb de Ram y 128Mb de capacidad', 'Nokia', 139, 13, 'https://i.imgur.com/ZlNzBGl.png'),
(18, 'Nokia C2 2nd Edition', 'Celular con 2GB de Ram y 32GB de capacidad', 'Nokia', 259, 22, 'https://i.imgur.com/F65OCHR.png'),
(19, 'Motorola Razr 50', 'Celular con 12GB de Ram y 512GB de capacidad', 'Motorola', 3029, 35, 'https://i.imgur.com/16ZBn5G.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`) VALUES
(1, 'empleado'),
(2, 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cli`),
  ADD KEY `tipo_usuario` (`tipo_usuario`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_em`),
  ADD KEY `tipo_usuario` (`tipo_usuario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cli`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_em`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
