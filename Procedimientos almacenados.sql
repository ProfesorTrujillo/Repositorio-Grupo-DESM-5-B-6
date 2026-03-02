-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2026 a las 19:22:19
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
-- Base de datos: `actividad_joins`
--
CREATE DATABASE IF NOT EXISTS `actividad_joins` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `actividad_joins`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `ciudad`) VALUES
(1, 'Ana', 'Aguascalientes'),
(2, 'Janet', 'CDMX'),
(3, 'Eduardo', 'Guadalajara'),
(4, 'Osqui', 'Monterrey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `producto`, `id_cliente`) VALUES
(1, 'Laptop', 1),
(2, 'Celular', 1),
(3, 'Tablet', 2),
(4, 'Monitor', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedidos_clientes` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
--
-- Base de datos: `bd_empresa`
--
CREATE DATABASE IF NOT EXISTS `bd_empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_empresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `departamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `departamento`) VALUES
(10, 'Sistemas'),
(20, 'Contabilidad'),
(30, 'Mercadotecnia'),
(40, 'Recursos Humanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `id_departamento`, `salario`) VALUES
(1, 'Ana Ruiz', 10, 15000.00),
(2, 'Luis Pérez', 20, 18000.00),
(3, 'Clara Soto', 10, 22000.00),
(4, 'Hugo Díaz', 30, 17000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id_proyecto` int(11) NOT NULL,
  `nombre_proyecto` varchar(50) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_proyecto`, `nombre_proyecto`, `id_departamento`) VALUES
(100, 'Migración BD', 10),
(200, 'Auditoría 2025', 20),
(300, 'Campaña Norte', 30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_proyecto`);
--
-- Base de datos: `clinicplus`
--
CREATE DATABASE IF NOT EXISTS `clinicplus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clinicplus`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `idPaciente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `diagnostico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`idPaciente`, `nombre`, `edad`, `diagnostico`) VALUES
(1, 'Ana López', 29, 'Chequeo general'),
(2, 'Bruno Díaz', 41, 'Presión alta'),
(3, 'Carla Pérez', 35, 'Alergia estacional'),
(4, 'Diego Martínez', 50, 'Diabetes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`idPaciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Base de datos: `corazon_floral`
--
CREATE DATABASE IF NOT EXISTS `corazon_floral` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `corazon_floral`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`) VALUES
(1, 'Juan Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `estado`, `fecha`, `fecha_entrega`) VALUES
(1, 1, 'En camino', '2026-02-24 08:03:03', '2026-04-10 12:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
--
-- Base de datos: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `pais`) VALUES
(1, 'Ana', 'México'),
(2, 'Luis', 'Colombia'),
(3, 'María', 'Perú'),
(4, 'Carlos', 'Chile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 1, 15000.00),
(2, 1, 2, 1, 800.00),
(3, 2, 2, 1, 800.00),
(4, 3, 4, 1, 9000.00),
(5, 4, 3, 1, 500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `categoria`) VALUES
(1, 'Laptop', 15000.00, 'Tecnología'),
(2, 'Audífonos', 800.00, 'Accesorios'),
(3, 'Mouse', 500.00, 'Accesorios'),
(4, 'Tablet', 9000.00, 'Tecnología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `fecha`, `total`) VALUES
(1, 1, '2025-01-10', 15800.00),
(2, 2, '2025-01-12', 800.00),
(3, 3, '2025-01-15', 9500.00),
(4, 1, '2025-01-20', 500.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
--
-- Base de datos: `edu_ags_ghkj`
--
CREATE DATABASE IF NOT EXISTS `edu_ags_ghkj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `edu_ags_ghkj`;
--
-- Base de datos: `edu_ags_kjh`
--
CREATE DATABASE IF NOT EXISTS `edu_ags_kjh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `edu_ags_kjh`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id_taller` int(11) NOT NULL,
  `id_ponente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id_taller`, `id_ponente`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyos`
--

CREATE TABLE `apoyos` (
  `id_apoyo` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `patrocinador` varchar(100) DEFAULT NULL,
  `monto_mxn` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `apoyos`
--

INSERT INTO `apoyos` (`id_apoyo`, `id_sede`, `patrocinador`, `monto_mxn`) VALUES
(1, 1, 'Empresa A', 10000.00),
(2, 2, 'Empresa B', 8000.00),
(3, 3, 'Empresa C', 12000.00),
(4, 4, 'Empresa D', 9000.00),
(5, 1, 'Empresa E', 7000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `id_participante` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `pago_mxn` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `id_participante`, `id_taller`, `fecha_inscripcion`, `pago_mxn`) VALUES
(1, 1, 1, '2026-01-10', 500.00),
(2, 2, 2, '2026-01-11', 600.00),
(3, 3, 3, '2026-01-12', 700.00),
(4, 4, 4, '2026-01-13', 400.00),
(5, 5, 5, '2026-01-14', 550.00),
(6, 6, 6, '2026-01-15', 650.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id_participante` int(11) NOT NULL,
  `nombre_participante` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id_participante`, `nombre_participante`, `email`, `ciudad`) VALUES
(1, 'Pedro', 'p1@mail.com', 'Aguascalientes'),
(2, 'Laura', 'p2@mail.com', 'Calvillo'),
(3, 'Ana', 'p3@mail.com', 'Jesús María'),
(4, 'Luis', 'p4@mail.com', 'Rincón'),
(5, 'Mario', 'p5@mail.com', 'Zacatecas'),
(6, 'Sofía', 'p6@mail.com', 'León');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponentes`
--

CREATE TABLE `ponentes` (
  `id_ponente` int(11) NOT NULL,
  `nombre_ponente` varchar(100) DEFAULT NULL,
  `honorarios_mxn` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ponentes`
--

INSERT INTO `ponentes` (`id_ponente`, `nombre_ponente`, `honorarios_mxn`) VALUES
(1, 'Juan Pérez', 5000.00),
(2, 'Ana López', 4500.00),
(3, 'Carlos Ruiz', 6000.00),
(4, 'María Torres', 5500.00),
(5, 'Luis Gómez', 4800.00),
(6, 'Sofía Díaz', 5200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre_sede` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre_sede`, `ciudad`) VALUES
(1, 'Sede Aguascalientes', 'Aguascalientes'),
(2, 'Sede Calvillo', 'Calvillo'),
(3, 'Sede Jesús María', 'Jesús María'),
(4, 'Sede Rincón', 'Rincón de Romos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `id_taller` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `id_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`id_taller`, `titulo`, `id_sede`) VALUES
(1, 'MySQL Básico', 1),
(2, 'Python', 1),
(3, 'Angular', 2),
(4, 'Ciberseguridad', 3),
(5, 'Redes', 4),
(6, 'IA', 2),
(7, 'Linux', 3),
(8, 'Bases de Datos', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_taller`,`id_ponente`),
  ADD KEY `id_ponente` (`id_ponente`);

--
-- Indices de la tabla `apoyos`
--
ALTER TABLE `apoyos`
  ADD PRIMARY KEY (`id_apoyo`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `id_participante` (`id_participante`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id_participante`);

--
-- Indices de la tabla `ponentes`
--
ALTER TABLE `ponentes`
  ADD PRIMARY KEY (`id_ponente`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`id_ponente`) REFERENCES `ponentes` (`id_ponente`);

--
-- Filtros para la tabla `apoyos`
--
ALTER TABLE `apoyos`
  ADD CONSTRAINT `apoyos_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_participante`) REFERENCES `participantes` (`id_participante`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_taller`) REFERENCES `talleres` (`id_taller`);

--
-- Filtros para la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD CONSTRAINT `talleres_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);
--
-- Base de datos: `escuela_db`
--
CREATE DATABASE IF NOT EXISTS `escuela_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escuela_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `grupo` varchar(20) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `grupo`, `estatus`) VALUES
(1, 'Juan Pérez', '3A', 'Activo'),
(2, 'María López', '3B', 'Activo'),
(3, 'Carlos Ruiz', '2A', 'Inactivo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `gym_entrenamiento`
--
CREATE DATABASE IF NOT EXISTS `gym_entrenamiento` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gym_entrenamiento`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id_acceso` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `puerta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_acceso`, `id_socio`, `fecha_hora`, `puerta`) VALUES
(1, 1, '2025-08-12 07:15:00', 'Torniquete'),
(2, 2, '2025-08-12 19:04:00', 'Recepcion'),
(3, 3, '2025-08-13 06:55:00', 'Torniquete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE `ejercicios` (
  `id_ejercicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `grupo_muscular` varchar(60) NOT NULL,
  `equipo` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`id_ejercicio`, `nombre`, `grupo_muscular`, `equipo`) VALUES
(1, 'Sentadilla', 'Piernas', 'Barra'),
(2, 'Press Banca', 'Pecho', 'Barra'),
(3, 'Remo con Mancuerna', 'Espalda', 'Mancuernas'),
(4, 'Plancha', 'Core', 'Peso corporal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento_registros`
--

CREATE TABLE `entrenamiento_registros` (
  `id_registro` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series_realizadas` int(11) NOT NULL,
  `rep_promedio` int(11) NOT NULL,
  `peso_promedio_kg` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenamiento_registros`
--

INSERT INTO `entrenamiento_registros` (`id_registro`, `id_socio`, `fecha`, `id_ejercicio`, `series_realizadas`, `rep_promedio`, `peso_promedio_kg`) VALUES
(1, 1, '2025-08-12', 1, 4, 8, 60.00),
(2, 1, '2025-08-12', 2, 4, 8, 40.00),
(3, 2, '2025-08-13', 2, 5, 5, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `id_membresia` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id_membresia`, `id_socio`, `tipo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 1, 'Mensual', '2025-08-01', '2025-08-31', 'Activa'),
(2, 2, 'Mensual', '2025-08-03', '2025-09-02', 'Activa'),
(3, 3, 'Anual', '2025-08-05', '2026-08-04', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_socio`, `fecha_pago`, `monto`, `metodo`) VALUES
(1, 1, '2025-08-01', 500.00, 'Tarjeta'),
(2, 2, '2025-08-03', 500.00, 'Efectivo'),
(3, 3, '2025-08-05', 4800.00, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE `rutinas` (
  `id_rutina` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `objetivo` varchar(80) NOT NULL,
  `dia_semana` varchar(10) NOT NULL,
  `vigente_desde` date NOT NULL,
  `vigente_hasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`id_rutina`, `id_socio`, `nombre`, `objetivo`, `dia_semana`, `vigente_desde`, `vigente_hasta`) VALUES
(1, 1, 'FullBody A', 'Hipertrofia', 'Lunes', '2025-08-01', NULL),
(2, 1, 'FullBody B', 'Hipertrofia', 'Miércoles', '2025-08-01', NULL),
(3, 2, 'Fuerza Superior', 'Fuerza', 'Martes', '2025-08-03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina_ejercicios`
--

CREATE TABLE `rutina_ejercicios` (
  `id_rutina_ejercicio` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `repeticiones` int(11) NOT NULL,
  `descanso_segundos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina_ejercicios`
--

INSERT INTO `rutina_ejercicios` (`id_rutina_ejercicio`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `descanso_segundos`) VALUES
(1, 1, 1, 4, 8, 120),
(2, 1, 2, 4, 8, 120),
(3, 1, 3, 3, 10, 90),
(4, 2, 4, 3, 45, 60),
(5, 3, 2, 5, 5, 180);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id_socio`, `nombre`, `email`, `telefono`, `fecha_registro`) VALUES
(1, 'Ana Pérez', 'ana.perez@gym.com', '4491112233', '2025-08-01'),
(2, 'Luis Gómez', 'luis.gomez@gym.com', '4775556677', '2025-08-03'),
(3, 'María López', 'maria.lopez@gym.com', '4493334455', '2025-08-05');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_entrenamientos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_entrenamientos` (
`nombre` varchar(120)
,`fecha` date
,`ejercicio` varchar(100)
,`series_realizadas` int(11)
,`peso_promedio_kg` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pagos_socios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pagos_socios` (
`nombre` varchar(120)
,`fecha_pago` date
,`monto` decimal(10,2)
,`metodo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_rutinas_detalle`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_rutinas_detalle` (
`rutina` varchar(100)
,`ejercicio` varchar(100)
,`series` int(11)
,`repeticiones` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_socios_activos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_socios_activos` (
`id_socio` int(11)
,`nombre` varchar(120)
,`tipo` varchar(40)
,`fecha_fin` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_plan_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_plan_hoy` (
`id_socio` int(11)
,`socio` varchar(120)
,`rutina` varchar(100)
,`objetivo` varchar(80)
,`series` int(11)
,`repeticiones` int(11)
,`ejercicio` varchar(100)
,`grupo_muscular` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_progreso_resumen`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_progreso_resumen` (
`id_socio` int(11)
,`nombre` varchar(120)
,`ejercicio` varchar(100)
,`rep_promedio` decimal(14,4)
,`peso_promedio_kg` decimal(10,6)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_socios_activos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_socios_activos` (
`id_socio` int(11)
,`nombre` varchar(120)
,`email` varchar(150)
,`tipo` varchar(40)
,`fecha_fin` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_entrenamientos`
--
DROP TABLE IF EXISTS `vista_entrenamientos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_entrenamientos`  AS SELECT `s`.`nombre` AS `nombre`, `er`.`fecha` AS `fecha`, `e`.`nombre` AS `ejercicio`, `er`.`series_realizadas` AS `series_realizadas`, `er`.`peso_promedio_kg` AS `peso_promedio_kg` FROM ((`entrenamiento_registros` `er` join `socios` `s` on(`er`.`id_socio` = `s`.`id_socio`)) join `ejercicios` `e` on(`er`.`id_ejercicio` = `e`.`id_ejercicio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pagos_socios`
--
DROP TABLE IF EXISTS `vista_pagos_socios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pagos_socios`  AS SELECT `s`.`nombre` AS `nombre`, `p`.`fecha_pago` AS `fecha_pago`, `p`.`monto` AS `monto`, `p`.`metodo` AS `metodo` FROM (`socios` `s` join `pagos` `p` on(`s`.`id_socio` = `p`.`id_socio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_rutinas_detalle`
--
DROP TABLE IF EXISTS `vista_rutinas_detalle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_rutinas_detalle`  AS SELECT `r`.`nombre` AS `rutina`, `e`.`nombre` AS `ejercicio`, `re`.`series` AS `series`, `re`.`repeticiones` AS `repeticiones` FROM ((`rutinas` `r` join `rutina_ejercicios` `re` on(`r`.`id_rutina` = `re`.`id_rutina`)) join `ejercicios` `e` on(`re`.`id_ejercicio` = `e`.`id_ejercicio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_socios_activos`
--
DROP TABLE IF EXISTS `vista_socios_activos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_socios_activos`  AS SELECT `s`.`id_socio` AS `id_socio`, `s`.`nombre` AS `nombre`, `m`.`tipo` AS `tipo`, `m`.`fecha_fin` AS `fecha_fin` FROM (`socios` `s` join `membresias` `m` on(`s`.`id_socio` = `m`.`id_socio`)) WHERE `m`.`estado` = 'Activa' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_plan_hoy`
--
DROP TABLE IF EXISTS `vw_plan_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_plan_hoy`  AS SELECT `s`.`id_socio` AS `id_socio`, `s`.`nombre` AS `socio`, `r`.`nombre` AS `rutina`, `r`.`objetivo` AS `objetivo`, `re`.`series` AS `series`, `re`.`repeticiones` AS `repeticiones`, `e`.`nombre` AS `ejercicio`, `e`.`grupo_muscular` AS `grupo_muscular` FROM (((`socios` `s` join `rutinas` `r` on(`r`.`id_socio` = `s`.`id_socio`)) join `rutina_ejercicios` `re` on(`re`.`id_rutina` = `r`.`id_rutina`)) join `ejercicios` `e` on(`e`.`id_ejercicio` = `re`.`id_ejercicio`)) WHERE `r`.`vigente_desde` <= curdate() AND (`r`.`vigente_hasta` is null OR curdate() <= `r`.`vigente_hasta`) AND `r`.`dia_semana` = 'Lunes' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_progreso_resumen`
--
DROP TABLE IF EXISTS `vw_progreso_resumen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_progreso_resumen`  AS SELECT `s`.`id_socio` AS `id_socio`, `s`.`nombre` AS `nombre`, `e`.`nombre` AS `ejercicio`, avg(`er`.`rep_promedio`) AS `rep_promedio`, avg(`er`.`peso_promedio_kg`) AS `peso_promedio_kg` FROM ((`entrenamiento_registros` `er` join `socios` `s` on(`s`.`id_socio` = `er`.`id_socio`)) join `ejercicios` `e` on(`e`.`id_ejercicio` = `er`.`id_ejercicio`)) GROUP BY `s`.`id_socio`, `s`.`nombre`, `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_socios_activos`
--
DROP TABLE IF EXISTS `vw_socios_activos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_socios_activos`  AS SELECT `s`.`id_socio` AS `id_socio`, `s`.`nombre` AS `nombre`, `s`.`email` AS `email`, `m`.`tipo` AS `tipo`, `m`.`fecha_fin` AS `fecha_fin` FROM (`socios` `s` join `membresias` `m` on(`m`.`id_socio` = `s`.`id_socio`)) WHERE `m`.`estado` = 'Activa' AND curdate() between `m`.`fecha_inicio` and `m`.`fecha_fin` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id_acceso`),
  ADD KEY `idx_accesos_fecha` (`fecha_hora`),
  ADD KEY `idx_accesos_socio_fecha` (`id_socio`,`fecha_hora`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`id_ejercicio`),
  ADD KEY `idx_ejercicios_grupo` (`grupo_muscular`),
  ADD KEY `idx_ejercicios_id` (`id_ejercicio`);

--
-- Indices de la tabla `entrenamiento_registros`
--
ALTER TABLE `entrenamiento_registros`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_socio` (`id_socio`),
  ADD KEY `id_ejercicio` (`id_ejercicio`),
  ADD KEY `idx_entrenamiento_fecha` (`fecha`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`id_membresia`),
  ADD KEY `id_socio` (`id_socio`),
  ADD KEY `idx_membresias_estado` (`estado`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_socio` (`id_socio`),
  ADD KEY `idx_pagos_fecha` (`fecha_pago`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`id_rutina`),
  ADD KEY `idx_rutinas_id` (`id_rutina`),
  ADD KEY `idx_rutinas_socio` (`id_socio`),
  ADD KEY `idx_rutinas_fechas` (`vigente_desde`,`vigente_hasta`);

--
-- Indices de la tabla `rutina_ejercicios`
--
ALTER TABLE `rutina_ejercicios`
  ADD PRIMARY KEY (`id_rutina_ejercicio`),
  ADD KEY `idx_re_rutina` (`id_rutina`),
  ADD KEY `idx_re_ejercicio` (`id_ejercicio`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`),
  ADD KEY `idx_socios_nombre` (`nombre`),
  ADD KEY `idx_socios_id` (`id_socio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id_acceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  MODIFY `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `entrenamiento_registros`
--
ALTER TABLE `entrenamiento_registros`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  MODIFY `id_rutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rutina_ejercicios`
--
ALTER TABLE `rutina_ejercicios`
  MODIFY `id_rutina_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `entrenamiento_registros`
--
ALTER TABLE `entrenamiento_registros`
  ADD CONSTRAINT `entrenamiento_registros_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  ADD CONSTRAINT `entrenamiento_registros_ibfk_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`);

--
-- Filtros para la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD CONSTRAINT `membresias_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD CONSTRAINT `rutinas_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);

--
-- Filtros para la tabla `rutina_ejercicios`
--
ALTER TABLE `rutina_ejercicios`
  ADD CONSTRAINT `rutina_ejercicios_ibfk_1` FOREIGN KEY (`id_rutina`) REFERENCES `rutinas` (`id_rutina`),
  ADD CONSTRAINT `rutina_ejercicios_ibfk_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicios` (`id_ejercicio`);
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

--
-- Volcado de datos para la tabla `pma__favorite`
--

INSERT INTO `pma__favorite` (`username`, `tables`) VALUES
('root', '[]');

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
('root', '[{\"db\":\"actividad_joins\",\"table\":\"clientes\"},{\"db\":\"servicios_automotrices\",\"table\":\"tecnico\"},{\"db\":\"servicios_automotrices\",\"table\":\"servicio\"},{\"db\":\"servicios_automotrices\",\"table\":\"orden_servicio\"},{\"db\":\"servicios_automotrices\",\"table\":\"cliente\"},{\"db\":\"actividad_joins\",\"table\":\"pedidos\"},{\"db\":\"taqueria_app\",\"table\":\"carrito\"},{\"db\":\"tienda2\",\"table\":\"clients\"},{\"db\":\"tienda2\",\"table\":\"bills\"}]');

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
('root', 'actividad_joins', 'clientes', '{\"sorted_col\":\"`id_cliente` ASC\"}', '2026-01-19 17:53:13');

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
('root', '2026-01-19 17:34:37', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

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
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Base de datos: `servicios_automotrices`
--
CREATE DATABASE IF NOT EXISTS `servicios_automotrices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `servicios_automotrices`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`) VALUES
(1, 'Carlos Méndez', '4491234567'),
(2, 'Ana López', '4499876543'),
(3, 'Luis Torres', '4495566778'),
(4, 'María Ruiz', '4499988776');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_servicio`
--

INSERT INTO `orden_servicio` (`id_orden`, `id_cliente`, `id_tecnico`, `id_servicio`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 3),
(4, 3, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(50) DEFAULT NULL,
  `costo` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre_servicio`, `costo`) VALUES
(1, 'Cambio de aceite', 800.00),
(2, 'Revisión eléctrica', 1200.00),
(3, 'Diagnóstico por escáner', 1500.00),
(4, 'Afinación', 1800.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `nombre`, `especialidad`) VALUES
(1, 'Pedro Sánchez', 'Mecánica General'),
(2, 'Laura Cruz', 'Electricidad Automotriz'),
(3, 'Jorge Ramos', 'Diagnóstico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id_tecnico`),
  ADD CONSTRAINT `orden_servicio_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);
--
-- Base de datos: `taqueria_app`
--
CREATE DATABASE IF NOT EXISTS `taqueria_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `taqueria_app`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unitario` decimal(10,2) NOT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `mesa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `telefono`, `mesa_id`) VALUES
(1, 'op', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `tipo` enum('efectivo','tarjeta') NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `mesa_id` int(11) DEFAULT NULL,
  `tipo` enum('mesa','llevar') NOT NULL DEFAULT 'mesa',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `mesa_id`, `tipo`, `fecha`, `cliente_id`, `usuario_id`) VALUES
(1, NULL, 'llevar', '2025-08-01 16:47:35', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `metodo_pago_id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL DEFAULT 'completado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` enum('alimento','bebida') NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellidoP_usuario` varchar(50) NOT NULL,
  `apellidoM_usuario` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `telefono_emergencia` varchar(15) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_usuario`, `apellidoP_usuario`, `apellidoM_usuario`, `telefono`, `telefono_emergencia`, `correo_electronico`, `direccion`, `fecha_nacimiento`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Karol Janet', 'Gómez', 'Hernández', '4493483341', '4492582000', 'hkarol337@gmail.com', 'pegueros 126 la soledad', '2005-04-10', '1234', '2025-08-01 16:46:47', '2025-08-01 16:46:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesa_id` (`mesa_id`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesa_id` (`mesa_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `metodo_pago_id` (`metodo_pago_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pago` (`id`) ON UPDATE CASCADE;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda2`
--
CREATE DATABASE IF NOT EXISTS `tienda2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `status` enum('open','paid','lost') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bills`
--

INSERT INTO `bills` (`bill_id`, `client_id`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 89743, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(2, 91577, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(3, 46843, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(4, 67024, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(5, 23159, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(6, 73188, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(7, 11977, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(8, 83275, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(9, 42466, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(10, 28898, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(11, 8303, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(12, 60939, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(13, 50651, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(14, 71005, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(15, 26902, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(16, 59194, NULL, 'open', '2025-07-22 13:37:03', '2025-07-22 13:37:03'),
(17, 26073, NULL, 'open', '2025-07-22 13:37:04', '2025-07-22 13:37:04'),
(18, 6106, NULL, 'open', '2025-07-22 13:37:04', '2025-07-22 13:37:04'),
(19, 12723, NULL, 'open', '2025-07-22 13:37:04', '2025-07-22 13:37:04'),
(20, 54165, NULL, 'open', '2025-07-22 13:37:04', '2025-07-22 13:37:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill_products`
--

CREATE TABLE `bill_products` (
  `bill_product_id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bill_products`
--

INSERT INTO `bill_products` (`bill_product_id`, `bill_id`, `product_id`, `quantity`, `price`, `discount`, `date_added`, `created_at`, `updated_at`) VALUES
(1, 13, 1599, 7, 2825.28, 10, '2024-04-18 01:17:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(2, 6, 233, 19, 3597.27, 0, '2024-10-01 22:38:13', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(3, 10, 1516, 9, 3305.04, 15, '2024-12-08 01:23:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(4, 5, 27, 4, 369.38, 20, '2025-02-28 11:46:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(5, 15, 1831, 10, 3901.88, 10, '2025-02-26 01:23:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(6, 20, 1724, 15, 2381.34, 5, '2024-08-19 14:12:54', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(7, 20, 457, 7, 767.42, 15, '2024-07-13 03:13:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(8, 10, 268, 20, 2368.45, 20, '2024-09-17 20:05:44', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(9, 14, 815, 7, 3741.49, 20, '2024-11-01 23:49:56', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(10, 2, 586, 10, 1945.7, 10, '2025-03-03 23:01:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(11, 10, 1738, 17, 2527.03, 10, '2024-12-23 19:09:03', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(12, 14, 1886, 6, 3938.05, 5, '2024-04-23 19:05:27', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(13, 18, 1574, 1, 4502.88, 5, '2024-06-20 01:36:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(14, 5, 19, 17, 2084.26, 50, '2024-06-25 17:23:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(15, 14, 1366, 20, 2123.39, 0, '2024-08-19 14:33:36', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(16, 11, 498, 12, 2789.32, 20, '2024-05-20 18:45:57', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(17, 13, 1532, 14, 3294.75, 50, '2024-06-30 18:35:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(18, 8, 1079, 14, 3424.3, 20, '2025-02-01 09:01:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(19, 8, 1560, 20, 1471.42, 20, '2024-09-03 08:49:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(20, 9, 1490, 7, 4965.65, 5, '2024-11-05 18:29:58', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(21, 17, 857, 4, 4157.74, 15, '2024-07-12 07:44:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(22, 4, 1914, 8, 1943.26, 10, '2024-06-11 06:22:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(23, 9, 848, 13, 4641.37, 10, '2024-09-06 04:31:18', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(24, 8, 1867, 1, 2639.69, 5, '2024-08-18 21:25:19', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(25, 3, 1188, 4, 1849.26, 50, '2024-12-31 19:41:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(26, 10, 1029, 16, 3789.84, 10, '2024-10-04 05:55:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(27, 18, 2238, 6, 2574.81, 50, '2025-01-08 23:08:24', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(28, 8, 221, 11, 2640.63, 5, '2024-12-04 02:11:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(29, 17, 441, 4, 3950.99, 20, '2024-07-13 16:20:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(30, 5, 137, 8, 4274.5, 10, '2024-10-23 15:11:01', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(31, 4, 624, 10, 519.99, 15, '2024-11-03 20:21:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(32, 14, 1735, 1, 3220.07, 5, '2024-11-29 22:35:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(33, 5, 1475, 18, 4601.38, 50, '2024-08-14 14:10:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(34, 14, 2077, 11, 3504.48, 0, '2024-05-29 23:28:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(35, 4, 42, 4, 4023.63, 20, '2024-03-25 02:05:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(36, 14, 1661, 6, 3120.14, 20, '2024-04-13 15:08:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(37, 2, 1996, 20, 2935.01, 5, '2024-10-15 16:30:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(38, 11, 1631, 3, 4300.72, 20, '2024-05-14 07:52:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(39, 19, 1570, 13, 2291.89, 10, '2024-05-04 17:50:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(40, 14, 736, 12, 244.03, 0, '2025-01-12 15:19:19', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(41, 2, 1891, 12, 2255.41, 20, '2024-06-30 21:01:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(42, 14, 1072, 7, 3001.03, 5, '2024-05-26 20:04:52', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(43, 7, 836, 4, 2746, 20, '2024-10-10 15:47:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(44, 13, 1640, 7, 1784.89, 15, '2024-05-04 17:03:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(45, 11, 1047, 9, 4289.6, 50, '2025-02-15 06:09:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(46, 17, 766, 15, 4087.46, 5, '2024-10-04 11:22:32', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(47, 20, 468, 1, 2044.45, 50, '2024-12-27 05:14:13', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(48, 8, 451, 4, 3848.87, 50, '2024-06-11 10:21:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(49, 10, 1143, 17, 488.78, 50, '2024-07-18 01:02:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(50, 2, 1637, 14, 425.04, 50, '2024-05-20 04:47:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(51, 3, 1220, 15, 1433.32, 10, '2024-12-21 01:56:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(52, 4, 2191, 14, 454.24, 10, '2024-06-20 02:41:54', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(53, 4, 1982, 10, 225.51, 15, '2024-06-19 22:23:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(54, 20, 1865, 16, 4833.19, 10, '2025-01-07 01:24:11', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(55, 6, 763, 4, 2872.3, 20, '2024-03-16 13:09:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(56, 8, 1117, 2, 287.9, 50, '2024-12-30 06:18:25', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(57, 2, 1624, 13, 3534.63, 10, '2024-04-05 10:46:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(58, 17, 1931, 8, 4296.11, 20, '2025-01-19 16:29:03', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(59, 2, 203, 8, 874.26, 0, '2025-03-06 03:13:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(60, 17, 2168, 17, 3948.91, 50, '2024-07-02 15:46:20', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(61, 15, 2152, 1, 18.72, 15, '2024-09-23 20:49:58', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(62, 16, 993, 20, 2305.14, 0, '2024-12-28 05:49:18', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(63, 12, 431, 3, 1485.93, 5, '2024-04-20 17:13:18', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(64, 11, 1753, 15, 3364.3, 0, '2024-09-20 14:45:09', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(65, 17, 1646, 4, 2473.62, 15, '2025-02-23 18:38:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(66, 4, 2231, 14, 1418.58, 50, '2025-02-09 00:28:55', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(67, 11, 1076, 13, 3566.94, 20, '2024-06-26 08:53:38', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(68, 7, 175, 18, 2047.32, 50, '2024-04-25 14:35:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(69, 8, 1767, 16, 2392.27, 50, '2024-10-03 13:32:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(70, 16, 567, 8, 387.71, 50, '2024-07-04 12:53:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(71, 17, 1984, 8, 1913.51, 5, '2024-07-12 08:20:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(72, 11, 2347, 13, 276.01, 10, '2025-02-08 05:04:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(73, 11, 1863, 12, 4022.17, 5, '2024-05-27 03:14:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(74, 8, 34, 16, 40.12, 10, '2024-06-04 05:09:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(75, 16, 1979, 6, 103.8, 0, '2024-12-10 01:23:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(76, 20, 825, 10, 3996.58, 20, '2024-09-28 10:38:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(77, 5, 1824, 5, 3741.12, 50, '2024-05-19 13:04:01', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(78, 18, 2039, 3, 3631.74, 5, '2024-09-08 03:58:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(79, 16, 138, 3, 4455, 10, '2024-10-18 05:53:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(80, 7, 2006, 14, 2128.59, 50, '2024-09-04 18:04:55', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(81, 14, 795, 11, 4398.55, 20, '2025-03-04 01:43:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(82, 1, 1320, 16, 1823.91, 50, '2024-11-08 13:32:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(83, 13, 339, 2, 607.41, 10, '2024-09-28 14:26:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(84, 17, 1513, 20, 215.3, 50, '2024-04-02 09:01:05', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(85, 1, 752, 9, 3027.45, 20, '2025-02-11 05:38:01', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(86, 9, 1781, 14, 2063.34, 0, '2024-09-14 03:04:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(87, 5, 1346, 7, 1406.35, 15, '2025-02-10 01:35:44', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(88, 20, 1717, 2, 1160.16, 0, '2025-02-11 20:38:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(89, 9, 1624, 5, 3534.63, 20, '2024-05-11 02:57:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(90, 14, 909, 11, 74.86, 15, '2025-02-01 19:25:00', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(91, 14, 883, 8, 280.73, 0, '2024-07-23 02:53:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(92, 20, 804, 2, 3833.37, 5, '2024-09-03 05:13:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(93, 9, 1564, 4, 2602.07, 15, '2025-01-28 13:27:34', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(94, 1, 286, 17, 3916, 15, '2024-11-21 08:52:04', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(95, 16, 299, 20, 675.31, 0, '2024-10-02 14:09:24', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(96, 18, 1653, 9, 1020.32, 50, '2025-01-21 19:22:25', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(97, 18, 1943, 17, 4898.83, 15, '2024-04-11 07:31:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(98, 7, 2211, 5, 233.1, 0, '2025-01-07 17:10:09', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(99, 1, 1987, 16, 2765.99, 5, '2024-04-18 13:22:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(100, 20, 29, 18, 3434.37, 0, '2024-12-23 06:58:58', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(101, 11, 503, 12, 3647.9, 0, '2024-12-01 19:00:18', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(102, 17, 311, 1, 4396.22, 50, '2024-11-16 18:47:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(103, 5, 2043, 4, 1081.9, 15, '2025-01-10 18:42:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(104, 9, 1245, 14, 2104.32, 10, '2024-05-25 22:08:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(105, 15, 1539, 19, 2136.88, 5, '2024-05-28 21:53:32', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(106, 18, 634, 9, 4374.95, 15, '2024-06-12 11:03:24', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(107, 1, 1644, 6, 2373.79, 50, '2024-05-18 04:43:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(108, 3, 701, 19, 3229.87, 20, '2024-08-25 15:31:05', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(109, 4, 1927, 4, 937.14, 15, '2024-11-09 17:50:57', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(110, 19, 1894, 1, 4570.94, 50, '2024-04-01 11:41:58', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(111, 16, 2133, 3, 3698.65, 0, '2024-05-16 09:21:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(112, 20, 1369, 7, 1431.01, 10, '2024-06-20 17:34:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(113, 11, 953, 15, 4683.59, 0, '2024-10-16 04:30:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(114, 14, 2351, 15, 3058.96, 50, '2024-10-22 07:04:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(115, 3, 924, 2, 4986.59, 15, '2024-05-25 04:01:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(116, 15, 1363, 4, 695.01, 5, '2024-05-30 13:15:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(117, 14, 494, 18, 4517.7, 0, '2024-04-16 11:09:13', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(118, 5, 1273, 2, 191.69, 20, '2024-08-08 10:44:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(119, 16, 1386, 17, 4767.89, 20, '2024-06-26 08:29:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(120, 2, 1569, 15, 4180.39, 15, '2024-07-01 05:33:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(121, 12, 1854, 18, 3880.36, 20, '2025-01-19 21:00:00', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(122, 17, 2219, 8, 2378.42, 10, '2024-12-01 02:48:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(123, 18, 1898, 15, 1916.79, 50, '2024-12-01 18:48:39', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(124, 8, 1668, 1, 4834.55, 20, '2024-03-19 20:08:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(125, 18, 801, 19, 296.04, 50, '2024-11-12 00:36:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(126, 5, 1914, 8, 1943.26, 50, '2024-07-26 08:20:57', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(127, 16, 2307, 7, 49.41, 10, '2024-05-30 22:43:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(128, 3, 773, 15, 2024.26, 50, '2024-11-04 03:03:09', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(129, 18, 1138, 16, 1539.14, 15, '2024-09-15 19:04:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(130, 4, 1370, 9, 3500, 5, '2025-01-09 05:49:24', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(131, 3, 239, 7, 4963.64, 50, '2024-10-24 14:56:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(132, 18, 369, 5, 2332.47, 50, '2024-08-13 23:57:25', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(133, 3, 487, 13, 469.32, 0, '2024-11-16 03:44:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(134, 16, 2232, 13, 4442.69, 5, '2024-09-24 09:21:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(135, 4, 609, 9, 4264.79, 0, '2024-06-05 08:19:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(136, 13, 1934, 6, 3979.94, 15, '2024-07-23 15:06:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(137, 5, 752, 13, 3027.45, 20, '2025-03-05 13:47:09', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(138, 17, 987, 13, 689.21, 5, '2024-08-04 18:00:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(139, 14, 500, 14, 2715.4, 10, '2024-09-30 12:25:13', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(140, 20, 999, 6, 374.95, 20, '2024-05-26 15:35:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(141, 11, 68, 10, 4802.34, 5, '2024-06-09 10:17:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(142, 11, 522, 17, 1522.79, 10, '2024-09-08 20:23:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(143, 5, 1440, 19, 4715.82, 20, '2024-05-07 03:48:19', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(144, 7, 269, 8, 1779.5, 10, '2024-07-20 18:07:03', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(145, 12, 111, 20, 3061.83, 20, '2025-02-06 18:39:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(146, 7, 1400, 19, 2259.35, 5, '2024-04-12 08:37:21', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(147, 14, 1488, 9, 392.37, 10, '2024-03-26 00:36:21', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(148, 11, 27, 9, 369.38, 20, '2024-04-08 08:15:59', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(149, 14, 2324, 10, 4279.14, 20, '2024-09-22 07:39:59', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(150, 10, 2037, 13, 3758.47, 10, '2024-10-23 21:25:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(151, 3, 490, 5, 4767.29, 5, '2024-03-20 09:14:59', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(152, 9, 158, 17, 2094.19, 15, '2024-06-16 15:03:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(153, 10, 669, 12, 4832.85, 20, '2024-07-08 18:45:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(154, 13, 2357, 5, 1937.87, 20, '2024-06-05 23:50:20', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(155, 19, 938, 19, 338.43, 20, '2025-02-13 04:01:48', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(156, 14, 373, 2, 2131.03, 0, '2025-01-10 02:36:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(157, 3, 602, 15, 4225.98, 0, '2024-05-03 16:23:32', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(158, 4, 1056, 17, 3195.24, 10, '2024-12-03 08:06:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(159, 12, 806, 19, 3083.11, 10, '2024-03-30 10:23:05', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(160, 4, 403, 17, 1094.27, 15, '2024-11-23 08:29:57', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(161, 5, 1351, 2, 2791.66, 20, '2024-10-28 05:47:34', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(162, 9, 1741, 12, 4546.64, 50, '2025-02-20 00:11:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(163, 13, 159, 4, 2357.43, 5, '2024-11-21 01:05:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(164, 11, 762, 13, 281.83, 10, '2024-07-20 05:37:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(165, 7, 19, 6, 2084.26, 50, '2024-09-11 21:08:58', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(166, 18, 1020, 16, 4480.12, 10, '2024-04-03 13:21:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(167, 18, 86, 15, 1818.77, 0, '2024-04-07 01:44:04', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(168, 9, 914, 10, 551.28, 50, '2024-11-15 11:32:39', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(169, 9, 351, 7, 3827.18, 20, '2024-11-24 20:27:48', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(170, 3, 1747, 14, 2442.89, 50, '2024-08-25 06:49:00', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(171, 17, 964, 17, 2053.66, 50, '2024-05-17 20:36:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(172, 11, 1013, 4, 4984.29, 50, '2025-01-17 15:52:34', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(173, 3, 1681, 20, 70.08, 0, '2024-07-22 01:32:25', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(174, 11, 950, 11, 3312.8, 20, '2024-08-23 02:45:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(175, 15, 2328, 10, 2560.41, 50, '2024-03-14 17:59:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(176, 2, 459, 17, 3390.69, 5, '2024-06-14 07:33:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(177, 12, 832, 16, 1761, 15, '2024-09-28 13:24:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(178, 4, 2025, 3, 3758.78, 5, '2024-07-21 21:26:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(179, 12, 1795, 6, 2461.54, 15, '2024-03-27 18:24:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(180, 17, 1989, 5, 4407.57, 15, '2024-06-02 00:57:20', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(181, 17, 2186, 12, 136.23, 50, '2024-08-27 00:40:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(182, 16, 332, 13, 3945.85, 50, '2024-07-01 19:30:39', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(183, 15, 2315, 10, 1997.55, 0, '2024-04-22 10:48:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(184, 3, 74, 14, 561.9, 15, '2024-07-23 07:25:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(185, 20, 950, 13, 3312.8, 5, '2024-12-20 17:45:21', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(186, 13, 511, 13, 2107.38, 0, '2025-03-06 09:04:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(187, 13, 1197, 20, 2602.99, 15, '2025-02-28 17:48:50', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(188, 18, 1181, 1, 262.2, 20, '2025-02-09 13:03:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(189, 15, 1133, 7, 4484.95, 10, '2024-12-02 05:16:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(190, 9, 130, 8, 616.8, 5, '2024-05-14 12:46:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(191, 9, 2058, 10, 255.28, 0, '2024-12-19 00:40:07', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(192, 7, 789, 11, 2287.08, 10, '2024-11-06 18:18:21', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(193, 8, 2294, 8, 793.64, 15, '2024-10-10 10:32:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(194, 17, 1383, 18, 3618.33, 50, '2024-11-06 08:20:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(195, 14, 341, 18, 1352.03, 20, '2024-08-06 05:15:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(196, 12, 697, 7, 2770.71, 20, '2025-01-25 00:31:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(197, 16, 2292, 1, 3103.52, 15, '2024-08-08 20:49:52', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(198, 4, 1943, 8, 4898.83, 50, '2024-09-17 22:39:42', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(199, 7, 1053, 17, 2470.16, 15, '2025-03-02 05:21:56', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(200, 10, 1706, 11, 427.12, 50, '2024-05-16 08:46:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(201, 18, 45, 20, 899.94, 50, '2025-01-01 01:23:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(202, 1, 1052, 9, 3405.57, 10, '2025-02-14 10:01:44', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(203, 9, 823, 10, 2455.04, 0, '2024-07-28 06:40:05', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(204, 17, 2358, 17, 2024.73, 20, '2024-06-22 14:02:34', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(205, 8, 328, 7, 2722.73, 20, '2024-06-16 17:15:00', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(206, 4, 1128, 4, 590.34, 10, '2024-11-05 13:16:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(207, 15, 1193, 14, 2799.33, 5, '2024-10-21 14:15:32', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(208, 13, 375, 3, 2912.46, 10, '2024-06-15 00:07:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(209, 18, 871, 5, 3565.62, 50, '2025-01-17 00:15:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(210, 9, 2044, 20, 4600.59, 20, '2024-12-29 11:49:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(211, 18, 745, 12, 4475.32, 10, '2025-03-06 06:25:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(212, 8, 1533, 8, 3558.82, 5, '2024-10-29 10:22:38', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(213, 18, 2286, 1, 4441.18, 15, '2025-02-16 03:27:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(214, 3, 171, 3, 630.24, 5, '2024-07-24 18:10:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(215, 14, 45, 17, 899.94, 10, '2024-05-02 14:03:30', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(216, 1, 285, 15, 3675.88, 0, '2024-03-24 13:46:16', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(217, 12, 912, 18, 3590.2, 5, '2024-07-12 04:01:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(218, 4, 1508, 14, 2093.92, 15, '2024-07-05 12:41:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(219, 3, 1428, 13, 4196.06, 10, '2024-04-22 14:28:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(220, 17, 122, 3, 3539.62, 15, '2024-10-16 03:14:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(221, 20, 341, 7, 1352.03, 20, '2024-10-30 01:45:03', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(222, 13, 617, 7, 4771.88, 5, '2024-10-12 19:54:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(223, 5, 1784, 10, 1200.35, 10, '2025-01-18 16:45:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(224, 18, 1645, 10, 1701.4, 10, '2025-02-20 12:23:09', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(225, 14, 643, 10, 3197.57, 5, '2024-09-16 21:10:41', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(226, 3, 561, 1, 3661.26, 15, '2024-12-28 21:00:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(227, 1, 921, 17, 3326.77, 50, '2024-07-19 05:31:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(228, 2, 1057, 10, 2771.03, 20, '2024-06-19 09:57:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(229, 7, 322, 7, 4185.27, 50, '2024-11-11 11:37:04', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(230, 13, 419, 10, 1460.9, 5, '2025-01-16 03:48:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(231, 17, 2085, 7, 2486.67, 50, '2024-04-07 21:01:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(232, 4, 2261, 16, 876.25, 10, '2024-10-31 16:57:35', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(233, 14, 113, 11, 1745.3, 5, '2024-07-18 10:00:56', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(234, 2, 211, 2, 1544.4, 5, '2024-11-20 16:26:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(235, 18, 2255, 12, 536.95, 20, '2024-12-12 03:07:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(236, 8, 904, 19, 4436.97, 10, '2024-06-01 16:30:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(237, 9, 239, 10, 4963.64, 20, '2024-09-28 17:29:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(238, 10, 1717, 8, 1160.16, 0, '2024-11-08 01:38:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(239, 6, 1249, 1, 1003.41, 10, '2024-03-22 03:28:17', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(240, 6, 1424, 16, 2536.24, 10, '2024-10-24 04:30:27', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(241, 8, 1966, 1, 1435.62, 10, '2025-01-17 01:03:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(242, 16, 1298, 9, 2967.12, 15, '2024-08-19 07:17:36', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(243, 3, 189, 3, 298.42, 10, '2024-07-18 13:27:25', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(244, 15, 1368, 19, 2032.44, 5, '2024-05-08 21:48:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(245, 12, 1770, 5, 4456.78, 0, '2024-04-15 19:49:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(246, 1, 1769, 12, 211.56, 0, '2024-06-01 07:10:11', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(247, 14, 1053, 18, 2470.16, 0, '2024-12-02 17:36:19', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(248, 18, 1024, 5, 447.08, 20, '2024-06-13 08:54:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(249, 4, 2296, 18, 3720.34, 20, '2025-02-24 13:15:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(250, 5, 2200, 19, 4638.4, 50, '2024-05-12 08:49:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(251, 17, 1708, 15, 2663.09, 50, '2025-03-04 07:12:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(252, 12, 106, 14, 1313.46, 50, '2024-07-24 11:53:15', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(253, 9, 810, 18, 3450.58, 0, '2024-12-02 14:33:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(254, 11, 2127, 13, 980.8, 10, '2024-05-22 14:19:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(255, 5, 976, 6, 3030.74, 20, '2024-04-06 04:30:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(256, 11, 2099, 19, 4319.29, 50, '2024-12-01 03:44:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(257, 20, 1823, 6, 3706.68, 50, '2024-11-27 10:21:06', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(258, 7, 2191, 4, 454.24, 10, '2024-11-17 04:45:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(259, 10, 1194, 13, 69.73, 20, '2024-05-01 19:17:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(260, 6, 1522, 11, 575.56, 0, '2024-04-01 03:09:02', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(261, 10, 1327, 12, 3135.82, 15, '2024-04-23 06:27:31', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(262, 2, 1524, 1, 3107.12, 0, '2025-01-28 08:15:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(263, 12, 80, 3, 3396.4, 20, '2024-06-11 00:06:56', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(264, 20, 1593, 5, 528.63, 0, '2024-12-03 02:46:39', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(265, 7, 1315, 4, 263.08, 50, '2024-10-30 03:34:23', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(266, 7, 24, 6, 174.38, 50, '2024-05-28 11:03:07', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(267, 9, 823, 3, 2455.04, 20, '2024-08-27 01:44:13', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(268, 11, 2235, 13, 1924.19, 5, '2024-06-29 12:04:20', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(269, 8, 2296, 11, 3720.34, 50, '2024-12-05 14:19:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(270, 18, 1142, 15, 2635.65, 20, '2025-02-19 17:56:38', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(271, 18, 2300, 10, 2900.02, 20, '2024-04-27 10:15:59', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(272, 10, 1329, 4, 4326.72, 20, '2025-02-23 14:36:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(273, 18, 1167, 19, 734.44, 10, '2024-12-05 18:07:42', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(274, 12, 1468, 3, 1553.44, 20, '2024-10-31 12:45:33', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(275, 18, 1283, 9, 404.78, 20, '2024-03-19 13:54:03', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(276, 2, 1923, 20, 1793.75, 10, '2024-11-21 18:21:45', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(277, 12, 2151, 5, 668.54, 50, '2025-02-08 18:37:00', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(278, 18, 420, 12, 135.27, 50, '2024-08-12 03:30:40', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(279, 8, 41, 19, 422.38, 50, '2025-01-29 14:03:26', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(280, 11, 432, 12, 2407.03, 20, '2024-08-20 17:13:37', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(281, 2, 214, 19, 2639.37, 5, '2024-03-18 21:16:49', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(282, 12, 2171, 9, 1709.75, 10, '2024-10-12 12:18:08', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(283, 10, 763, 2, 2872.3, 0, '2025-02-15 19:39:46', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(284, 12, 1739, 15, 1371.67, 5, '2024-05-18 15:29:47', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(285, 20, 1368, 6, 2032.44, 15, '2024-08-04 22:58:54', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(286, 17, 1231, 2, 1964.41, 15, '2024-12-29 10:07:52', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(287, 18, 1710, 17, 3028.81, 50, '2024-12-29 14:35:10', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(288, 18, 2281, 17, 2087.87, 5, '2024-08-12 07:58:01', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(289, 16, 1456, 17, 4997, 50, '2024-06-25 08:29:54', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(290, 2, 1663, 7, 3359.54, 15, '2024-10-02 12:22:43', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(291, 3, 845, 3, 2300.87, 5, '2024-09-07 18:01:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(292, 6, 279, 5, 4290.55, 0, '2024-05-25 06:36:53', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(293, 19, 1416, 11, 3958.14, 15, '2024-11-14 23:59:22', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(294, 5, 800, 16, 1121.97, 50, '2024-03-23 23:10:34', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(295, 17, 1828, 6, 3097.15, 10, '2024-11-17 14:42:36', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(296, 18, 46, 2, 1490.74, 5, '2024-03-20 05:47:29', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(297, 17, 1734, 20, 1088.15, 10, '2024-06-07 00:28:12', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(298, 4, 987, 20, 689.21, 20, '2024-10-03 09:22:14', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(299, 19, 1148, 19, 4198.57, 20, '2024-05-27 14:01:28', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(300, 1, 283, 17, 3782.98, 5, '2024-12-15 01:10:16', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(301, 19, 2212, 8, 2312.47, 10, '2024-04-20 23:14:19', '2025-07-22 13:37:32', '2025-07-22 13:37:32'),
(302, 10, 1413, 8, 4552.11, 15, '2024-06-29 22:22:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(303, 8, 976, 19, 3030.74, 5, '2024-09-04 20:48:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(304, 8, 607, 10, 868.99, 15, '2025-01-28 12:56:31', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(305, 2, 79, 14, 1804.09, 0, '2024-11-15 17:41:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(306, 12, 1358, 7, 946.29, 15, '2024-04-22 14:42:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(307, 12, 486, 19, 1375.46, 15, '2024-10-18 12:43:05', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(308, 2, 357, 8, 2159.65, 15, '2024-11-18 11:14:47', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(309, 17, 1686, 3, 2898.29, 20, '2025-01-23 04:44:20', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(310, 19, 215, 18, 2819.55, 20, '2024-06-22 14:47:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(311, 20, 191, 8, 4958.3, 50, '2024-03-28 22:01:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(312, 8, 1188, 17, 1849.26, 50, '2024-03-29 23:08:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(313, 16, 1755, 16, 1428.29, 10, '2024-03-22 09:28:17', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(314, 5, 1224, 8, 3953.78, 50, '2024-04-14 09:28:02', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(315, 12, 96, 4, 4398.15, 15, '2024-12-01 15:04:10', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(316, 7, 791, 3, 117.76, 15, '2025-02-11 07:29:54', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(317, 14, 1132, 3, 913.65, 10, '2024-06-05 11:27:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(318, 6, 891, 1, 3104.72, 0, '2024-03-25 19:36:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(319, 15, 32, 20, 3733.65, 10, '2024-05-30 09:40:05', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(320, 5, 1817, 11, 3801.28, 15, '2024-06-22 04:36:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(321, 4, 765, 6, 4910.44, 15, '2024-07-08 06:32:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(322, 8, 1047, 8, 4289.6, 15, '2024-11-22 01:07:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(323, 15, 641, 20, 3813.97, 50, '2024-04-26 11:40:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(324, 16, 336, 9, 3187.78, 50, '2024-11-09 22:16:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(325, 5, 83, 11, 2460.4, 15, '2024-12-17 22:00:24', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(326, 20, 406, 2, 1200.02, 20, '2024-05-30 03:07:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(327, 2, 453, 4, 364.78, 50, '2024-09-14 09:52:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(328, 9, 959, 13, 3609.19, 15, '2024-07-30 18:27:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(329, 3, 2197, 3, 631.17, 5, '2024-06-29 13:33:24', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(330, 20, 611, 12, 1227.37, 0, '2024-11-21 07:54:18', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(331, 17, 1965, 8, 3379, 50, '2024-03-22 09:16:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(332, 19, 57, 15, 2016.79, 50, '2025-03-09 17:54:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(333, 1, 1413, 8, 4552.11, 0, '2025-02-10 12:34:29', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(334, 6, 228, 5, 3852.04, 50, '2024-09-28 01:44:39', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(335, 6, 1499, 17, 4619.15, 10, '2024-11-22 13:26:27', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(336, 1, 1789, 13, 4143.3, 15, '2024-09-03 04:30:00', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(337, 5, 1129, 20, 605.44, 10, '2024-04-02 10:46:45', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(338, 6, 1109, 2, 500.18, 0, '2025-01-01 22:38:17', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(339, 3, 1394, 15, 4803.68, 50, '2025-03-08 05:07:33', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(340, 20, 278, 7, 671.13, 5, '2025-01-17 21:40:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(341, 3, 67, 12, 1668.78, 50, '2024-08-06 10:55:00', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(342, 10, 553, 5, 4864.28, 15, '2025-02-22 15:18:34', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(343, 20, 1514, 18, 4483.25, 10, '2024-04-23 13:54:18', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(344, 6, 2324, 17, 4279.14, 15, '2024-12-07 20:54:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(345, 15, 2036, 15, 1709.11, 5, '2024-11-26 13:07:20', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(346, 2, 407, 6, 3264.99, 50, '2024-06-28 08:29:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(347, 4, 1098, 8, 3034.99, 0, '2025-02-17 12:59:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(348, 12, 257, 7, 732.88, 20, '2024-10-25 22:30:54', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(349, 1, 1868, 3, 4839.8, 0, '2024-08-25 13:48:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(350, 17, 1429, 18, 600.21, 0, '2025-01-28 11:10:46', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(351, 5, 260, 8, 1205.59, 0, '2024-07-23 10:13:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(352, 17, 1046, 7, 4186.38, 20, '2024-06-29 13:05:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(353, 5, 1015, 4, 78.68, 10, '2024-03-20 20:21:50', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(354, 12, 927, 16, 4689.28, 20, '2024-09-01 03:45:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(355, 6, 631, 8, 877.37, 0, '2025-03-01 20:37:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(356, 15, 1266, 7, 4558.13, 10, '2024-10-02 07:13:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(357, 6, 1353, 9, 1553.3, 50, '2025-02-21 23:38:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(358, 2, 1138, 13, 1539.14, 0, '2024-08-07 11:28:10', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(359, 2, 2106, 4, 850.7, 15, '2024-07-29 20:38:09', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(360, 15, 1903, 8, 4160.44, 15, '2024-06-18 05:12:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(361, 13, 1465, 16, 156.93, 15, '2024-11-21 14:15:47', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(362, 6, 1002, 2, 3379.84, 10, '2025-03-06 00:47:26', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(363, 19, 887, 8, 1126.48, 5, '2024-06-29 07:31:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(364, 5, 1074, 10, 3963.1, 5, '2024-04-12 22:42:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(365, 6, 1939, 6, 4092.03, 15, '2024-03-21 16:57:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(366, 2, 1113, 6, 636.5, 5, '2024-07-08 17:39:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(367, 13, 231, 16, 4667.41, 0, '2024-04-28 20:04:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(368, 6, 452, 20, 4373.25, 15, '2024-06-12 09:27:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(369, 19, 1183, 6, 1019.05, 0, '2025-01-11 22:21:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(370, 6, 1350, 16, 4832.8, 15, '2024-08-02 05:38:15', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(371, 2, 692, 8, 2059.44, 0, '2025-01-27 21:20:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(372, 10, 2142, 9, 4176.68, 10, '2025-01-24 21:53:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(373, 20, 2134, 15, 2302.41, 0, '2025-02-08 14:13:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(374, 5, 774, 6, 584.24, 15, '2024-07-09 08:06:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(375, 11, 1327, 19, 3135.82, 5, '2024-08-29 20:44:49', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(376, 7, 1723, 10, 1742.38, 50, '2024-09-10 08:56:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(377, 16, 1134, 11, 2955.4, 50, '2025-01-26 01:38:09', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(378, 16, 766, 20, 4087.46, 50, '2025-03-09 09:35:48', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(379, 16, 1317, 18, 4434.68, 20, '2024-04-17 16:12:09', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(380, 3, 1093, 11, 955.04, 0, '2024-06-03 00:12:56', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(381, 17, 1893, 16, 3949.33, 20, '2024-12-15 03:29:34', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(382, 8, 665, 1, 1754.94, 5, '2024-07-24 13:12:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(383, 5, 1405, 15, 841.52, 0, '2024-10-26 22:09:16', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(384, 20, 1783, 7, 537.6, 10, '2024-08-22 02:11:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(385, 9, 496, 14, 1686.19, 50, '2024-07-05 05:56:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(386, 12, 1420, 6, 3164.05, 50, '2024-06-25 04:44:40', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(387, 7, 146, 20, 240.13, 50, '2024-11-20 03:57:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(388, 7, 438, 6, 562.03, 0, '2024-07-03 14:56:45', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(389, 7, 2078, 8, 313.5, 15, '2024-10-29 14:34:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(390, 13, 2089, 15, 2895.91, 15, '2024-04-17 14:45:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(391, 2, 371, 2, 2382.74, 50, '2024-03-15 12:30:34', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(392, 7, 64, 1, 3364.2, 50, '2025-01-24 20:46:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(393, 6, 785, 3, 1743.9, 20, '2024-10-08 16:22:24', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(394, 10, 468, 3, 2044.45, 0, '2025-03-09 19:36:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(395, 10, 2152, 11, 18.72, 0, '2024-09-30 16:49:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(396, 20, 1480, 8, 4975.19, 10, '2024-08-07 11:35:00', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(397, 7, 2341, 7, 3452.48, 50, '2024-10-31 02:17:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(398, 19, 573, 19, 829.19, 20, '2025-01-25 08:20:15', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(399, 1, 1533, 17, 3558.82, 50, '2024-10-12 09:55:24', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(400, 8, 59, 8, 2973.93, 50, '2024-11-30 10:40:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(401, 10, 1710, 8, 3028.81, 15, '2024-12-15 23:26:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(402, 13, 310, 11, 3069.06, 50, '2025-01-01 15:56:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(403, 3, 115, 15, 4199.32, 20, '2024-11-03 09:43:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(404, 2, 2195, 18, 158.26, 10, '2024-10-21 03:40:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(405, 4, 234, 13, 1408.34, 0, '2024-12-27 12:31:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(406, 3, 2321, 14, 3168.06, 20, '2024-10-25 18:17:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(407, 20, 1342, 12, 2792.5, 5, '2025-01-11 13:19:38', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(408, 12, 57, 12, 2016.79, 15, '2024-12-27 05:05:56', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(409, 18, 1345, 7, 2515.36, 15, '2024-03-17 01:50:13', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(410, 18, 1590, 6, 1129.98, 10, '2024-03-13 19:36:38', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(411, 9, 1582, 17, 4661.16, 20, '2024-11-20 23:50:13', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(412, 5, 2111, 10, 2137.25, 50, '2025-01-30 23:45:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(413, 7, 943, 6, 4004.25, 20, '2024-09-08 16:05:15', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(414, 18, 786, 1, 715.31, 10, '2024-03-31 02:04:18', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(415, 2, 1726, 15, 3230.37, 10, '2025-02-22 22:44:31', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(416, 2, 1942, 13, 3457.95, 0, '2024-03-18 15:09:48', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(417, 17, 2190, 1, 4832.94, 20, '2024-08-13 13:28:47', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(418, 17, 1247, 11, 2211.57, 15, '2024-04-10 10:09:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(419, 11, 1809, 10, 2616.65, 0, '2024-05-02 02:27:27', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(420, 7, 625, 2, 4198.29, 10, '2024-08-31 12:35:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(421, 16, 2000, 6, 2876.31, 5, '2024-06-15 05:51:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(422, 8, 1056, 10, 3195.24, 15, '2024-04-24 09:26:40', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(423, 1, 1596, 9, 2843.21, 10, '2024-07-22 22:08:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(424, 18, 2291, 15, 2678.61, 0, '2024-07-06 09:14:33', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(425, 1, 1144, 17, 599.4, 10, '2024-06-01 10:31:17', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(426, 18, 531, 14, 4176.14, 5, '2024-12-19 22:45:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(427, 20, 154, 20, 3737.14, 10, '2024-07-07 19:29:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(428, 10, 1896, 12, 657.05, 0, '2024-07-13 12:12:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(429, 7, 933, 1, 2732.01, 20, '2025-02-13 13:14:46', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(430, 19, 405, 3, 2193.86, 50, '2024-10-07 01:38:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(431, 19, 2061, 6, 3925.82, 20, '2024-06-09 12:52:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(432, 8, 1012, 11, 2263.29, 15, '2024-04-09 04:32:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(433, 12, 296, 3, 1375.91, 5, '2024-07-11 21:39:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(434, 19, 499, 15, 977.08, 50, '2025-02-20 01:10:28', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(435, 6, 998, 9, 3795.6, 20, '2024-06-28 16:33:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(436, 4, 1578, 18, 686.51, 50, '2024-09-13 22:41:56', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(437, 14, 2017, 19, 2554.59, 0, '2024-12-11 07:00:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(438, 13, 36, 20, 2356.07, 0, '2024-10-19 19:44:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(439, 1, 862, 20, 4541.2, 15, '2024-06-17 20:10:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(440, 4, 2165, 17, 213.07, 0, '2024-10-14 03:03:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(441, 12, 1408, 13, 2681.27, 5, '2025-01-07 02:24:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(442, 17, 228, 14, 3852.04, 15, '2025-01-23 20:22:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(443, 15, 1221, 5, 3302.34, 5, '2024-06-27 07:15:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(444, 7, 2061, 8, 3925.82, 50, '2024-12-28 13:04:01', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(445, 15, 953, 20, 4683.59, 0, '2024-10-24 10:12:34', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(446, 2, 2271, 5, 3442.33, 5, '2024-09-11 09:29:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(447, 1, 2332, 18, 3267.73, 5, '2025-01-24 08:08:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(448, 16, 768, 7, 2148.93, 5, '2024-11-07 04:25:00', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(449, 3, 1201, 7, 4673.85, 0, '2024-12-05 09:19:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(450, 16, 885, 12, 1654.27, 0, '2024-03-25 15:46:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(451, 9, 1894, 20, 4570.94, 15, '2024-06-16 17:04:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(452, 15, 1092, 5, 2207.28, 0, '2024-03-16 07:44:46', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(453, 4, 1878, 16, 2587.3, 50, '2024-12-30 22:52:10', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(454, 7, 1166, 15, 261.29, 20, '2024-08-13 03:43:41', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(455, 6, 672, 16, 3947.58, 10, '2025-01-17 05:43:47', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(456, 8, 1837, 10, 2545.15, 5, '2024-11-21 01:04:10', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(457, 7, 928, 8, 1989.83, 10, '2024-10-31 09:01:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(458, 18, 577, 16, 4407.47, 10, '2024-05-05 02:03:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(459, 14, 1141, 5, 1257.45, 50, '2024-12-13 23:52:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(460, 2, 920, 11, 2734.51, 10, '2024-03-26 19:12:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(461, 13, 179, 5, 1540.82, 0, '2024-03-30 16:04:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(462, 9, 2079, 4, 1222.54, 5, '2024-10-10 02:26:15', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(463, 13, 1078, 16, 2971.52, 20, '2024-06-26 21:34:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(464, 2, 624, 6, 519.99, 10, '2024-10-30 03:14:44', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(465, 6, 686, 13, 2993.86, 15, '2024-06-12 06:46:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(466, 12, 314, 16, 157.22, 15, '2024-10-25 18:48:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(467, 17, 1050, 13, 4557.47, 50, '2024-07-30 21:10:05', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(468, 19, 4, 19, 3865.66, 20, '2024-10-03 00:48:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(469, 10, 1130, 2, 1188.21, 50, '2024-10-21 20:33:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(470, 15, 2007, 13, 3619.12, 10, '2024-09-11 18:09:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(471, 16, 1412, 3, 1612.31, 15, '2025-02-09 00:52:46', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(472, 12, 1147, 9, 4113.27, 15, '2024-12-06 23:17:02', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(473, 16, 1467, 1, 2143.43, 20, '2024-07-29 09:41:20', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(474, 5, 800, 5, 1121.97, 0, '2025-02-01 20:39:54', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(475, 13, 1488, 9, 392.37, 10, '2025-01-05 17:43:33', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(476, 13, 1417, 18, 3112.1, 5, '2024-04-03 20:42:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(477, 13, 181, 9, 4264.6, 20, '2024-06-04 20:41:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(478, 7, 849, 1, 2941.72, 20, '2024-07-19 09:03:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(479, 7, 1126, 18, 3121.76, 20, '2024-05-30 08:14:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(480, 5, 1791, 10, 3959.06, 10, '2024-04-24 09:03:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(481, 10, 1290, 13, 1193.33, 20, '2024-03-31 00:22:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(482, 12, 974, 6, 623.99, 20, '2025-01-14 03:38:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(483, 5, 1085, 10, 2516.72, 10, '2024-07-04 18:13:05', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(484, 6, 262, 5, 1820.83, 0, '2025-02-01 18:12:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(485, 12, 2315, 7, 1997.55, 10, '2024-09-19 16:41:27', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(486, 10, 627, 13, 661.12, 0, '2024-09-19 18:00:48', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(487, 11, 383, 4, 4199.19, 15, '2024-05-04 10:42:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(488, 9, 1668, 11, 4834.55, 15, '2024-06-07 00:53:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(489, 20, 1819, 12, 1150.11, 10, '2024-05-14 06:44:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(490, 7, 1202, 18, 1490.26, 15, '2024-06-08 03:21:15', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(491, 20, 529, 20, 2116.52, 20, '2024-07-15 05:24:17', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(492, 19, 74, 8, 561.9, 50, '2024-12-14 17:36:06', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(493, 2, 180, 6, 4806.87, 5, '2024-05-13 09:33:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(494, 11, 608, 16, 2515.59, 10, '2024-09-27 20:50:22', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(495, 4, 1784, 19, 1200.35, 15, '2024-10-01 19:55:44', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(496, 7, 732, 6, 4233.54, 5, '2024-07-16 19:24:49', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(497, 1, 1654, 9, 2548.52, 15, '2024-09-26 13:16:16', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(498, 19, 422, 8, 3029.9, 10, '2025-02-19 23:10:41', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(499, 13, 710, 1, 3379.67, 15, '2025-02-09 18:38:44', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(500, 17, 1150, 18, 2230.8, 15, '2024-06-01 02:48:48', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(501, 20, 2301, 19, 4447.08, 0, '2024-07-13 08:35:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(502, 2, 1998, 16, 1304.5, 20, '2024-07-23 04:30:50', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(503, 19, 348, 3, 3236.44, 15, '2024-10-15 01:25:39', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(504, 11, 2164, 16, 490.24, 50, '2024-03-18 18:20:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33');
INSERT INTO `bill_products` (`bill_product_id`, `bill_id`, `product_id`, `quantity`, `price`, `discount`, `date_added`, `created_at`, `updated_at`) VALUES
(505, 20, 268, 6, 2368.45, 50, '2024-11-02 04:59:31', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(506, 18, 1996, 15, 2935.01, 10, '2024-07-08 23:43:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(507, 8, 110, 4, 760.17, 5, '2024-10-18 08:54:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(508, 20, 1155, 13, 3912.37, 5, '2024-11-22 02:41:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(509, 12, 1986, 7, 4000.18, 15, '2024-09-28 14:02:12', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(510, 3, 1169, 10, 2833.46, 20, '2024-04-14 22:46:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(511, 20, 2035, 7, 4905.38, 20, '2025-02-11 20:29:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(512, 9, 1813, 15, 116.51, 10, '2024-04-23 19:01:16', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(513, 13, 440, 15, 3599.39, 5, '2024-06-25 07:20:41', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(514, 12, 678, 8, 1428.49, 20, '2025-01-28 09:53:41', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(515, 3, 446, 13, 3904.83, 0, '2024-08-22 20:34:46', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(516, 7, 1442, 3, 2105.73, 50, '2024-06-07 17:19:31', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(517, 9, 655, 2, 1169.19, 10, '2024-12-17 02:46:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(518, 18, 2093, 10, 1199.89, 50, '2024-10-19 04:03:18', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(519, 19, 275, 10, 715.27, 5, '2024-11-04 10:09:02', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(520, 13, 459, 3, 3390.69, 0, '2024-05-13 01:02:31', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(521, 16, 326, 18, 3823.38, 10, '2024-07-11 15:40:01', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(522, 19, 374, 7, 1143.23, 15, '2024-10-21 02:31:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(523, 20, 528, 1, 583.82, 5, '2025-02-11 13:00:14', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(524, 6, 143, 17, 3676.52, 15, '2024-09-17 01:54:32', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(525, 20, 453, 3, 364.78, 20, '2024-09-26 02:32:10', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(526, 6, 2153, 9, 3937.63, 5, '2024-10-01 02:31:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(527, 13, 770, 18, 3240.79, 10, '2024-03-30 00:18:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(528, 10, 1619, 10, 4981.72, 5, '2024-07-23 21:27:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(529, 7, 1767, 1, 2392.27, 0, '2024-04-07 15:22:23', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(530, 16, 1640, 2, 1784.89, 20, '2024-03-18 17:39:12', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(531, 8, 1519, 7, 4853.18, 5, '2024-07-01 08:54:13', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(532, 9, 2260, 2, 462.31, 15, '2024-03-23 12:58:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(533, 12, 1765, 9, 3472.6, 20, '2024-09-03 12:41:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(534, 11, 886, 13, 1775.54, 15, '2024-06-12 11:59:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(535, 1, 1416, 6, 3958.14, 5, '2024-07-22 22:09:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(536, 12, 522, 7, 1522.79, 0, '2024-07-12 04:16:27', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(537, 13, 2274, 7, 1294.09, 10, '2024-05-05 16:29:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(538, 6, 217, 3, 835.76, 20, '2024-08-23 12:30:54', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(539, 18, 209, 13, 3562.1, 5, '2024-06-24 09:10:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(540, 17, 1112, 17, 1775.18, 15, '2024-11-18 12:05:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(541, 6, 381, 13, 1998.19, 20, '2024-07-05 01:55:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(542, 5, 2340, 13, 4558.62, 5, '2025-01-12 20:42:16', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(543, 5, 2063, 14, 203.42, 0, '2024-08-15 16:27:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(544, 18, 1938, 2, 2106.54, 10, '2024-04-08 18:37:28', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(545, 7, 418, 18, 3264.99, 15, '2024-12-31 21:30:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(546, 14, 2349, 8, 2127.93, 5, '2024-06-12 23:32:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(547, 13, 1454, 2, 4816.54, 15, '2024-12-07 23:49:51', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(548, 5, 381, 6, 1998.19, 15, '2024-09-05 07:21:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(549, 18, 1244, 15, 3245.88, 20, '2024-04-07 06:58:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(550, 15, 75, 11, 4139.4, 5, '2024-09-26 12:00:57', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(551, 1, 2017, 4, 2554.59, 50, '2025-01-06 22:37:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(552, 10, 675, 2, 3922.9, 50, '2025-01-01 17:09:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(553, 4, 118, 1, 16.64, 15, '2025-01-05 09:29:58', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(554, 2, 1392, 5, 1595.89, 15, '2025-01-17 09:20:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(555, 14, 1704, 19, 2930.03, 0, '2025-02-15 08:49:02', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(556, 16, 1551, 9, 855.74, 10, '2024-07-01 10:13:29', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(557, 9, 909, 19, 74.86, 0, '2024-09-14 07:32:02', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(558, 4, 1758, 20, 746.68, 10, '2024-10-18 20:18:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(559, 5, 1023, 8, 3235.4, 20, '2024-10-10 06:41:47', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(560, 17, 554, 8, 585.78, 20, '2024-06-13 18:14:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(561, 9, 2358, 13, 2024.73, 20, '2025-02-26 01:19:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(562, 2, 1895, 14, 3840.02, 15, '2024-09-29 22:32:43', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(563, 11, 270, 6, 3608.42, 20, '2024-06-14 19:19:44', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(564, 14, 196, 18, 980.56, 0, '2024-06-27 09:59:24', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(565, 8, 1217, 8, 3826.42, 20, '2024-08-21 01:03:37', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(566, 10, 2159, 12, 1152.69, 15, '2024-09-27 08:23:13', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(567, 15, 620, 15, 179, 10, '2024-12-16 11:36:29', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(568, 6, 743, 7, 1092.33, 5, '2024-08-22 03:17:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(569, 14, 1306, 3, 739.09, 5, '2024-09-29 01:25:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(570, 9, 1609, 10, 2470.39, 5, '2024-12-28 16:58:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(571, 5, 326, 9, 3823.38, 50, '2025-01-20 07:16:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(572, 2, 2220, 10, 286.39, 5, '2024-06-02 11:06:55', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(573, 3, 227, 5, 940.84, 15, '2024-10-03 16:52:22', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(574, 5, 699, 11, 2682.04, 20, '2024-04-25 02:25:56', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(575, 17, 289, 15, 3386.23, 15, '2024-05-27 04:50:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(576, 14, 156, 18, 770.66, 0, '2024-05-10 23:08:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(577, 4, 858, 9, 4438.4, 10, '2024-09-19 22:14:52', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(578, 2, 1735, 5, 3220.07, 20, '2024-10-10 10:26:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(579, 2, 1831, 8, 3901.88, 5, '2024-10-02 09:48:12', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(580, 18, 1830, 9, 3603.8, 5, '2024-04-24 02:21:26', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(581, 7, 374, 4, 1143.23, 50, '2024-11-05 15:39:42', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(582, 13, 2145, 18, 1153.83, 20, '2025-03-02 04:12:04', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(583, 16, 2149, 16, 1808.76, 20, '2024-05-28 11:17:41', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(584, 12, 2211, 10, 233.1, 10, '2024-07-08 20:39:03', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(585, 7, 819, 9, 3673.32, 10, '2024-11-27 07:25:45', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(586, 19, 659, 18, 3999.33, 0, '2024-05-23 00:16:14', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(587, 10, 1871, 19, 480.11, 0, '2024-10-08 12:28:54', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(588, 9, 1530, 1, 4945.29, 50, '2024-04-28 19:00:21', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(589, 10, 2060, 6, 3922.31, 20, '2024-07-28 18:54:20', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(590, 6, 1250, 17, 1988.68, 10, '2024-04-30 12:25:36', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(591, 2, 1252, 4, 983.15, 50, '2024-04-11 18:13:20', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(592, 8, 77, 3, 2801.4, 20, '2024-05-15 09:52:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(593, 5, 1055, 14, 3158.58, 50, '2024-10-28 01:37:00', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(594, 13, 1643, 5, 13.65, 20, '2024-06-08 07:36:23', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(595, 1, 1659, 7, 4485.58, 50, '2025-02-24 14:13:35', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(596, 8, 1640, 17, 1784.89, 20, '2024-09-20 05:29:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(597, 15, 666, 11, 4867.51, 50, '2024-05-12 00:03:40', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(598, 13, 1169, 11, 2833.46, 50, '2025-03-02 06:39:30', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(599, 8, 463, 20, 3289.33, 0, '2024-06-22 23:07:29', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(600, 6, 1606, 15, 560.16, 5, '2025-02-08 14:30:12', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(601, 3, 24, 17, 174.38, 20, '2025-01-24 05:36:27', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(602, 14, 961, 14, 3127.01, 5, '2024-08-18 15:14:50', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(603, 15, 1724, 20, 2381.34, 10, '2025-02-16 19:09:36', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(604, 10, 664, 12, 1374.68, 15, '2024-05-18 22:25:19', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(605, 7, 1917, 14, 2861.53, 10, '2024-12-30 17:14:59', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(606, 18, 443, 3, 1807.54, 0, '2025-01-24 12:02:01', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(607, 3, 486, 11, 1375.46, 5, '2024-06-14 12:33:01', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(608, 7, 926, 12, 4647.14, 10, '2024-10-22 06:44:25', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(609, 15, 2078, 18, 313.5, 15, '2025-02-28 07:13:34', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(610, 1, 1820, 8, 4149.42, 10, '2025-02-11 01:04:07', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(611, 5, 917, 7, 3706.01, 20, '2024-07-29 05:11:08', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(612, 12, 1900, 15, 1322.28, 20, '2025-02-09 21:56:17', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(613, 2, 2065, 2, 2090.84, 5, '2024-07-02 07:05:11', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(614, 17, 488, 7, 1158.43, 50, '2024-05-09 01:34:53', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(615, 11, 405, 10, 2193.86, 15, '2024-12-15 02:42:50', '2025-07-22 13:37:33', '2025-07-22 13:37:33'),
(616, 5, 933, 4, 2732.01, 5, '2024-04-02 04:48:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(617, 1, 1367, 1, 2410.07, 15, '2024-07-25 21:28:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(618, 10, 1019, 17, 1642.83, 15, '2024-04-07 09:52:39', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(619, 17, 931, 15, 982.92, 20, '2024-05-17 16:27:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(620, 7, 870, 6, 3568.72, 20, '2025-02-03 16:07:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(621, 13, 1142, 6, 2635.65, 50, '2025-03-06 22:01:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(622, 18, 2215, 2, 896.97, 50, '2024-11-19 15:18:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(623, 10, 2074, 8, 2362.24, 50, '2024-05-09 01:16:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(624, 5, 448, 10, 23.66, 0, '2024-10-07 22:21:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(625, 17, 271, 14, 2877.32, 15, '2024-09-03 23:37:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(626, 2, 389, 11, 3534.17, 20, '2024-11-04 22:04:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(627, 20, 1619, 20, 4981.72, 0, '2024-10-04 06:22:55', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(628, 15, 601, 15, 839.5, 0, '2024-04-05 21:13:44', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(629, 7, 334, 9, 4864.36, 20, '2024-05-02 12:06:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(630, 16, 2209, 9, 4739.18, 15, '2024-07-03 17:52:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(631, 16, 2097, 13, 479.5, 15, '2024-03-14 01:43:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(632, 16, 1468, 13, 1553.44, 20, '2025-02-27 21:00:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(633, 8, 669, 16, 4832.85, 10, '2024-08-18 14:57:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(634, 14, 363, 19, 2276.94, 15, '2025-02-09 01:35:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(635, 13, 2333, 3, 1193.94, 0, '2024-12-03 12:11:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(636, 16, 752, 18, 3027.45, 5, '2024-09-09 03:22:21', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(637, 1, 627, 16, 661.12, 15, '2024-06-23 03:23:03', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(638, 6, 2284, 1, 2603.84, 50, '2024-11-15 22:33:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(639, 7, 1099, 5, 2921.59, 20, '2024-07-13 06:46:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(640, 20, 2358, 10, 2024.73, 20, '2024-12-25 02:14:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(641, 18, 633, 4, 2838.24, 0, '2024-09-08 21:25:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(642, 17, 1281, 15, 1400.07, 50, '2024-07-30 09:03:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(643, 6, 711, 10, 4324.51, 5, '2024-06-08 17:19:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(644, 8, 1155, 4, 3912.37, 0, '2024-12-19 23:41:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(645, 7, 2358, 10, 2024.73, 5, '2024-10-13 09:31:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(646, 13, 709, 7, 4382.38, 0, '2024-12-01 00:21:56', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(647, 15, 163, 9, 4681.19, 20, '2024-07-30 23:02:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(648, 9, 2134, 5, 2302.41, 20, '2024-12-06 21:13:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(649, 12, 2070, 13, 3585.71, 0, '2024-05-11 01:05:40', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(650, 20, 880, 8, 4531.81, 10, '2024-06-28 11:38:26', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(651, 14, 891, 4, 3104.72, 15, '2025-01-19 17:11:07', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(652, 18, 1814, 4, 2275.27, 5, '2024-07-28 15:46:14', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(653, 10, 747, 3, 2305.87, 0, '2024-05-25 13:12:26', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(654, 6, 32, 2, 3733.65, 50, '2025-01-17 18:44:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(655, 4, 1350, 6, 4832.8, 20, '2024-05-21 20:02:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(656, 15, 1557, 2, 3552.94, 15, '2024-04-08 13:30:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(657, 4, 296, 4, 1375.91, 0, '2024-12-18 16:19:24', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(658, 6, 388, 17, 3879.79, 50, '2024-11-05 19:23:44', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(659, 13, 1578, 14, 686.51, 15, '2024-12-22 21:04:46', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(660, 14, 1799, 1, 4581.82, 50, '2024-10-20 20:57:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(661, 1, 1351, 4, 2791.66, 50, '2024-11-11 01:52:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(662, 13, 853, 2, 1863.8, 0, '2024-04-23 07:53:13', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(663, 7, 1139, 7, 1586.56, 5, '2024-12-21 10:55:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(664, 6, 761, 3, 1076.32, 5, '2025-01-15 16:56:52', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(665, 10, 608, 2, 2515.59, 5, '2024-08-04 10:05:07', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(666, 10, 115, 5, 4199.32, 50, '2024-12-26 01:16:19', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(667, 13, 1947, 16, 2287.61, 10, '2024-11-11 07:19:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(668, 15, 305, 8, 4316.74, 0, '2024-08-16 19:58:27', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(669, 15, 219, 13, 2384.46, 0, '2024-11-28 15:19:35', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(670, 2, 1046, 9, 4186.38, 20, '2024-12-06 11:56:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(671, 15, 2341, 12, 3452.48, 20, '2025-02-19 00:52:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(672, 9, 521, 15, 2084.94, 50, '2024-11-25 14:10:34', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(673, 10, 428, 4, 225.38, 10, '2024-12-27 09:03:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(674, 13, 1670, 20, 4817.51, 0, '2025-01-04 01:22:24', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(675, 15, 861, 18, 3933.78, 15, '2024-09-12 06:37:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(676, 19, 1157, 2, 1997.27, 5, '2024-09-04 08:43:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(677, 15, 447, 9, 3767.59, 0, '2024-05-24 20:36:22', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(678, 18, 1205, 15, 3875.97, 15, '2024-05-14 15:39:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(679, 10, 470, 6, 3277.33, 10, '2024-09-06 13:20:46', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(680, 4, 1174, 3, 1234.86, 0, '2024-08-14 06:27:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(681, 1, 935, 1, 417.49, 50, '2024-09-08 05:16:59', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(682, 3, 547, 4, 4321.34, 15, '2024-12-31 21:57:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(683, 12, 1033, 8, 793.99, 20, '2024-03-22 10:09:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(684, 18, 1315, 5, 263.08, 50, '2025-02-17 14:00:14', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(685, 20, 1825, 1, 1164.01, 50, '2024-09-03 17:16:30', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(686, 1, 1022, 11, 747.82, 0, '2024-11-29 09:59:19', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(687, 4, 2172, 5, 966.93, 5, '2025-02-17 16:41:22', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(688, 8, 295, 17, 2796.9, 15, '2024-06-09 03:18:29', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(689, 19, 1999, 5, 3279.58, 0, '2024-11-08 00:32:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(690, 5, 373, 13, 2131.03, 20, '2024-12-06 19:53:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(691, 7, 1002, 19, 3379.84, 0, '2024-08-03 04:00:18', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(692, 12, 2323, 4, 146.57, 0, '2024-06-19 10:42:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(693, 8, 1868, 8, 4839.8, 0, '2024-12-21 10:43:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(694, 17, 1015, 2, 78.68, 0, '2024-05-24 11:23:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(695, 7, 438, 6, 562.03, 15, '2024-12-20 01:10:44', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(696, 6, 326, 9, 3823.38, 15, '2024-12-20 22:13:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(697, 4, 933, 8, 2732.01, 50, '2024-10-18 16:10:59', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(698, 15, 23, 5, 2452.1, 10, '2024-04-10 11:24:18', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(699, 17, 525, 15, 4914.6, 5, '2024-08-05 15:23:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(700, 3, 1317, 15, 4434.68, 15, '2024-12-25 01:38:59', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(701, 17, 1239, 14, 519.42, 5, '2025-02-18 04:01:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(702, 10, 2228, 4, 814.16, 10, '2024-07-28 02:43:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(703, 2, 2284, 13, 2603.84, 0, '2024-07-15 02:43:57', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(704, 10, 1015, 13, 78.68, 5, '2024-08-08 13:41:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(705, 3, 779, 4, 1740.75, 5, '2024-10-06 00:46:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(706, 6, 1458, 17, 2994.38, 15, '2024-11-17 17:55:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(707, 18, 2025, 4, 3758.78, 50, '2024-07-12 19:23:40', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(708, 20, 1435, 14, 888.91, 15, '2024-07-10 14:31:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(709, 12, 56, 9, 1103, 10, '2024-05-08 02:27:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(710, 14, 659, 2, 3999.33, 5, '2025-01-16 17:34:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(711, 8, 1308, 6, 4715.19, 15, '2024-09-11 03:28:37', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(712, 9, 1925, 14, 3446.12, 5, '2024-07-13 15:22:05', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(713, 16, 2221, 15, 3378.14, 20, '2024-12-16 17:36:21', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(714, 14, 438, 13, 562.03, 5, '2024-06-22 00:00:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(715, 18, 1939, 6, 4092.03, 15, '2025-03-08 23:08:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(716, 20, 2161, 20, 3832.29, 50, '2024-10-01 10:27:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(717, 8, 930, 18, 3273.02, 15, '2024-09-04 05:47:03', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(718, 5, 2125, 13, 4560.6, 20, '2024-10-29 12:23:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(719, 10, 1636, 13, 420.29, 10, '2024-07-25 12:12:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(720, 3, 1813, 8, 116.51, 50, '2024-12-25 02:08:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(721, 8, 1443, 19, 4938.54, 5, '2024-12-27 13:11:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(722, 5, 1723, 15, 1742.38, 0, '2024-03-30 10:59:30', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(723, 13, 1975, 11, 485.33, 5, '2024-09-09 15:48:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(724, 4, 1085, 16, 2516.72, 0, '2024-05-11 23:58:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(725, 13, 1817, 20, 3801.28, 0, '2024-07-10 01:25:07', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(726, 17, 1061, 14, 712.85, 20, '2024-04-03 16:02:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(727, 11, 801, 19, 296.04, 50, '2025-02-14 19:11:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(728, 16, 339, 7, 607.41, 10, '2024-09-05 19:21:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(729, 12, 1792, 5, 1051.03, 20, '2024-10-24 21:31:07', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(730, 15, 1885, 16, 3695.23, 15, '2025-02-19 04:28:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(731, 9, 584, 19, 829.56, 50, '2024-09-17 12:28:21', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(732, 7, 709, 12, 4382.38, 20, '2024-08-05 02:37:34', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(733, 12, 586, 5, 1945.7, 0, '2025-01-29 10:39:24', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(734, 7, 1428, 11, 4196.06, 15, '2025-03-05 03:59:08', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(735, 6, 386, 17, 3883.24, 15, '2024-05-03 20:16:11', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(736, 20, 1581, 4, 3031.06, 5, '2024-06-20 02:34:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(737, 10, 2091, 11, 4953, 0, '2025-01-10 03:42:38', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(738, 20, 1477, 6, 572.83, 10, '2024-03-30 06:53:41', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(739, 1, 607, 8, 868.99, 50, '2024-11-06 02:52:48', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(740, 19, 1660, 13, 4252.58, 0, '2025-01-26 23:16:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(741, 7, 1340, 8, 3201.79, 10, '2024-12-14 01:03:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(742, 20, 1179, 18, 2985.12, 15, '2025-02-02 11:27:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(743, 8, 1092, 10, 2207.28, 0, '2024-07-02 19:52:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(744, 17, 1460, 1, 2234.52, 20, '2024-10-07 06:31:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(745, 17, 1777, 17, 2568.43, 20, '2024-04-06 08:09:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(746, 12, 1326, 14, 3881.37, 10, '2025-02-05 19:48:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(747, 20, 1183, 16, 1019.05, 50, '2024-05-27 09:17:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(748, 11, 166, 8, 326.49, 15, '2024-08-30 04:05:11', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(749, 19, 237, 17, 748.37, 20, '2024-04-23 17:21:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(750, 20, 1426, 2, 2433.55, 15, '2024-12-25 14:27:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(751, 3, 827, 9, 811.47, 20, '2024-03-17 23:49:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(752, 19, 2043, 1, 1081.9, 20, '2024-10-30 13:27:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(753, 17, 11, 4, 2288.46, 0, '2024-09-05 21:08:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(754, 16, 425, 17, 339.49, 50, '2024-06-30 20:17:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(755, 10, 1051, 7, 3481.45, 0, '2024-04-19 07:55:52', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(756, 10, 355, 11, 2260.08, 20, '2024-09-09 18:39:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(757, 3, 2277, 18, 43.3, 0, '2025-03-01 15:40:30', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(758, 17, 1944, 20, 3829.23, 5, '2024-08-22 11:07:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(759, 19, 2084, 4, 3330.02, 20, '2024-06-27 17:52:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(760, 11, 236, 18, 4409.03, 15, '2024-11-18 19:01:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(761, 16, 1440, 11, 4715.82, 15, '2024-08-28 13:42:27', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(762, 15, 1958, 6, 4979.44, 15, '2025-01-14 08:51:48', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(763, 13, 58, 20, 3587.11, 50, '2025-02-03 10:42:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(764, 3, 1030, 4, 970.94, 50, '2024-06-05 04:44:57', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(765, 19, 1456, 6, 4997, 10, '2024-12-10 21:58:38', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(766, 4, 2011, 1, 2894.13, 5, '2025-03-02 12:59:48', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(767, 5, 1769, 10, 211.56, 10, '2024-07-07 11:31:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(768, 18, 391, 4, 4834.78, 50, '2024-07-29 17:20:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(769, 9, 2002, 7, 1393.76, 50, '2025-02-09 15:13:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(770, 10, 462, 14, 3365.91, 5, '2025-01-08 17:22:44', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(771, 10, 88, 10, 4319.79, 50, '2024-07-18 02:01:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(772, 5, 1324, 11, 3193.13, 5, '2025-02-22 09:37:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(773, 4, 1845, 6, 3390.86, 15, '2024-12-26 02:39:40', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(774, 1, 1178, 12, 4522.01, 15, '2024-12-28 21:01:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(775, 12, 197, 12, 2190.22, 15, '2024-10-21 19:53:06', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(776, 11, 335, 7, 2256.48, 10, '2024-11-30 23:01:41', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(777, 14, 1872, 20, 3591.06, 0, '2024-12-04 15:39:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(778, 1, 43, 2, 1075.82, 15, '2025-01-03 15:38:56', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(779, 14, 383, 1, 4199.19, 5, '2024-05-03 05:40:39', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(780, 18, 2070, 13, 3585.71, 15, '2024-03-29 23:46:13', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(781, 13, 1717, 7, 1160.16, 50, '2025-02-22 05:38:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(782, 5, 1467, 19, 2143.43, 5, '2024-11-06 01:14:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(783, 13, 2049, 17, 3359.71, 10, '2024-07-06 19:14:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(784, 15, 1531, 6, 3645.15, 15, '2025-01-09 09:53:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(785, 2, 193, 3, 1726.25, 15, '2024-03-20 15:26:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(786, 4, 558, 16, 2216.07, 50, '2024-12-30 06:24:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(787, 14, 629, 14, 3177.83, 15, '2025-01-09 00:09:05', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(788, 18, 2197, 10, 631.17, 20, '2025-01-17 12:41:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(789, 2, 1300, 13, 2226.24, 15, '2024-08-17 10:20:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(790, 13, 1071, 7, 3813.46, 20, '2024-04-07 01:14:41', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(791, 7, 1928, 12, 1148.93, 5, '2024-10-02 12:46:17', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(792, 2, 1229, 19, 1981.2, 0, '2024-12-20 02:02:05', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(793, 1, 1583, 13, 4302.18, 15, '2024-12-31 00:39:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(794, 10, 485, 20, 1795.49, 50, '2024-06-24 11:25:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(795, 5, 828, 4, 2106.14, 0, '2024-12-26 06:03:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(796, 3, 2100, 8, 3790.63, 50, '2024-04-12 01:11:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(797, 7, 989, 5, 3143.7, 15, '2024-04-17 08:22:03', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(798, 10, 787, 16, 1975.86, 20, '2024-10-14 20:08:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(799, 12, 430, 14, 1370.36, 15, '2024-08-02 07:44:34', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(800, 14, 242, 11, 4862.17, 10, '2024-09-05 00:26:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(801, 15, 2166, 18, 1782.09, 15, '2024-11-27 13:49:49', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(802, 17, 1341, 3, 2594.24, 10, '2024-10-07 16:10:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(803, 17, 1929, 9, 2004.64, 5, '2024-11-13 01:53:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(804, 8, 1013, 20, 4984.29, 50, '2024-05-23 10:31:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(805, 14, 1781, 4, 2063.34, 5, '2024-08-13 04:03:32', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(806, 20, 1238, 9, 710.05, 20, '2024-11-28 05:57:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(807, 6, 1148, 12, 4198.57, 5, '2025-02-11 20:37:07', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(808, 17, 17, 10, 856.64, 50, '2024-04-25 22:43:30', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(809, 20, 396, 9, 4365.42, 50, '2024-08-09 16:38:27', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(810, 12, 1904, 5, 4462.48, 15, '2024-06-02 20:07:13', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(811, 13, 559, 16, 1812.76, 20, '2025-01-05 16:21:13', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(812, 15, 1691, 17, 1779.35, 15, '2024-10-17 20:26:46', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(813, 8, 1869, 7, 1188.78, 15, '2024-03-23 13:44:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(814, 20, 1282, 8, 1740.53, 10, '2024-06-22 11:12:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(815, 17, 853, 9, 1863.8, 15, '2024-03-25 14:13:03', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(816, 6, 1137, 2, 4692.01, 15, '2024-05-20 04:51:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(817, 3, 1311, 11, 3077.37, 5, '2024-12-15 04:02:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(818, 10, 47, 12, 1526.42, 15, '2024-08-24 21:27:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(819, 2, 781, 6, 3371.49, 20, '2024-10-13 22:44:40', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(820, 8, 1254, 19, 2707.25, 0, '2024-04-01 11:37:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(821, 18, 501, 17, 4215.93, 20, '2024-07-05 12:18:37', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(822, 4, 2342, 13, 75.58, 15, '2024-11-29 04:42:55', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(823, 15, 11, 16, 2288.46, 5, '2025-03-09 01:29:24', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(824, 18, 720, 18, 3146.09, 20, '2024-09-26 10:35:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(825, 4, 1621, 18, 3532.39, 10, '2024-12-24 07:10:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(826, 13, 2129, 9, 1013.43, 20, '2025-01-05 20:24:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(827, 12, 390, 19, 3297.73, 5, '2025-03-02 15:54:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(828, 4, 1330, 14, 1315.09, 5, '2025-01-25 17:04:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(829, 3, 40, 7, 2641.38, 20, '2024-10-14 05:09:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(830, 10, 1687, 6, 3309.17, 10, '2025-01-28 09:02:06', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(831, 16, 291, 16, 2359.37, 50, '2025-01-18 15:30:57', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(832, 9, 2220, 5, 286.39, 10, '2025-01-07 02:57:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(833, 1, 1126, 17, 3121.76, 50, '2024-12-14 19:54:01', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(834, 9, 1020, 1, 4480.12, 20, '2024-12-22 17:49:59', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(835, 15, 905, 18, 3329.74, 50, '2024-07-17 15:45:54', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(836, 20, 1074, 10, 3963.1, 15, '2024-06-14 13:13:02', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(837, 5, 438, 12, 562.03, 15, '2024-06-30 15:15:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(838, 15, 1073, 19, 2884.77, 20, '2024-11-08 20:16:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(839, 1, 2092, 16, 2575.57, 20, '2024-07-25 17:38:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(840, 13, 1401, 4, 4682.08, 0, '2024-06-30 04:11:57', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(841, 19, 489, 14, 3524.99, 0, '2024-03-16 08:52:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(842, 11, 707, 18, 3708.43, 0, '2024-06-16 09:06:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(843, 10, 1807, 7, 2012.71, 0, '2024-12-21 15:14:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(844, 18, 1052, 5, 3405.57, 0, '2024-03-27 01:25:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(845, 20, 978, 10, 3723.96, 15, '2024-05-02 15:44:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(846, 5, 1675, 18, 1218.66, 15, '2024-10-12 17:12:24', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(847, 19, 1504, 2, 934.96, 15, '2025-02-27 16:39:16', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(848, 15, 1456, 16, 4997, 0, '2024-07-25 21:03:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(849, 16, 18, 13, 2303.36, 10, '2024-11-05 00:26:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(850, 5, 995, 14, 4297.82, 10, '2025-01-27 08:08:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(851, 16, 391, 18, 4834.78, 15, '2024-12-23 13:11:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(852, 20, 1525, 17, 1043.97, 5, '2025-01-05 20:32:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(853, 3, 2247, 6, 4369.14, 0, '2024-06-27 12:28:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(854, 18, 2316, 13, 510.38, 50, '2024-11-15 17:00:37', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(855, 15, 1171, 15, 649.27, 20, '2024-07-29 21:41:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(856, 9, 1734, 20, 1088.15, 15, '2024-08-06 17:40:41', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(857, 16, 1945, 10, 1418.5, 0, '2024-09-09 00:11:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(858, 10, 2083, 15, 2864.5, 15, '2024-06-25 14:02:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(859, 9, 1701, 5, 2878.89, 5, '2024-10-21 23:09:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(860, 7, 1735, 18, 3220.07, 50, '2024-04-13 22:18:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(861, 4, 1623, 10, 3256.62, 5, '2025-02-20 09:49:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(862, 12, 1481, 5, 1227.05, 50, '2024-05-14 04:34:38', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(863, 7, 689, 16, 1550.48, 10, '2024-05-27 18:41:42', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(864, 8, 1297, 11, 1884.08, 5, '2025-03-11 01:09:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(865, 4, 2313, 12, 2204.5, 15, '2024-07-10 10:47:33', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(866, 9, 393, 10, 4887.78, 5, '2024-11-11 19:50:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(867, 13, 1811, 15, 378.36, 10, '2025-02-13 20:47:22', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(868, 17, 704, 18, 3135.52, 0, '2024-05-06 22:43:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(869, 2, 156, 16, 770.66, 5, '2024-09-17 10:02:21', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(870, 20, 2199, 18, 791.39, 5, '2024-05-03 18:31:45', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(871, 4, 244, 14, 2586.1, 15, '2025-02-10 21:39:00', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(872, 11, 2234, 5, 1279.85, 0, '2024-07-06 08:02:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(873, 7, 734, 4, 1373.8, 0, '2024-06-27 06:11:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(874, 1, 1718, 9, 1286.4, 5, '2024-04-02 04:42:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(875, 14, 1208, 12, 4837.89, 0, '2024-07-10 19:42:15', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(876, 13, 1478, 4, 3551.67, 5, '2025-01-02 14:59:35', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(877, 9, 1865, 1, 4833.19, 20, '2024-07-07 17:14:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(878, 10, 1208, 3, 4837.89, 50, '2024-09-21 06:06:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(879, 20, 627, 14, 661.12, 50, '2024-11-12 06:05:14', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(880, 3, 359, 5, 1712.08, 50, '2024-05-01 06:43:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(881, 19, 2003, 19, 2145.54, 5, '2025-01-27 11:38:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(882, 11, 81, 18, 4705.19, 15, '2024-11-10 08:04:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(883, 3, 1924, 17, 4051.81, 10, '2025-03-06 13:19:14', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(884, 11, 580, 6, 653.74, 5, '2024-04-28 09:13:11', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(885, 13, 254, 16, 1932.45, 5, '2024-05-31 03:32:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(886, 14, 698, 9, 3468.16, 0, '2025-01-23 22:56:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(887, 5, 295, 16, 2796.9, 5, '2024-07-30 12:37:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(888, 13, 1837, 20, 2545.15, 15, '2024-09-30 07:46:48', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(889, 12, 1826, 19, 1760.5, 0, '2024-03-13 10:02:01', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(890, 19, 267, 3, 2638.27, 0, '2024-07-13 09:15:09', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(891, 9, 1024, 14, 447.08, 5, '2024-05-28 22:01:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(892, 14, 1150, 4, 2230.8, 0, '2025-01-19 02:48:03', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(893, 4, 254, 18, 1932.45, 5, '2024-05-24 02:16:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(894, 11, 594, 7, 976.23, 15, '2024-08-10 11:55:59', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(895, 10, 256, 14, 677.83, 5, '2025-01-08 08:21:34', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(896, 3, 1167, 16, 734.44, 20, '2024-07-27 02:30:27', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(897, 15, 1514, 15, 4483.25, 20, '2024-04-11 07:25:47', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(898, 10, 1076, 8, 3566.94, 50, '2024-11-26 11:41:35', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(899, 7, 1336, 5, 4579.83, 0, '2024-09-06 00:22:12', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(900, 15, 1698, 6, 4629.95, 0, '2024-07-14 07:39:36', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(901, 6, 313, 13, 1185.18, 50, '2024-06-25 19:48:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(902, 17, 834, 18, 1569.82, 50, '2024-04-17 02:21:50', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(903, 11, 797, 13, 1667.13, 5, '2024-09-18 08:24:39', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(904, 11, 195, 17, 4766.48, 50, '2025-03-07 21:54:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(905, 6, 972, 15, 4493.57, 20, '2024-07-05 17:05:58', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(906, 10, 365, 5, 2195.3, 10, '2025-01-19 17:29:30', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(907, 20, 1991, 14, 1442.26, 5, '2024-11-28 20:37:18', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(908, 14, 969, 13, 2677.54, 15, '2024-09-11 09:54:35', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(909, 20, 215, 8, 2819.55, 50, '2024-03-27 20:35:39', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(910, 18, 2135, 14, 3640.21, 20, '2024-08-21 22:52:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(911, 15, 2236, 20, 2220.44, 20, '2024-09-04 07:20:40', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(912, 12, 2217, 12, 3814.64, 15, '2024-06-20 17:32:20', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(913, 7, 659, 10, 3999.33, 20, '2024-04-18 23:48:55', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(914, 12, 1565, 20, 2771.73, 50, '2024-07-20 05:59:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(915, 19, 1137, 16, 4692.01, 5, '2024-12-15 09:42:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(916, 17, 2356, 16, 3696.08, 10, '2025-01-09 23:20:08', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(917, 9, 1403, 2, 1050.15, 20, '2024-04-29 11:18:28', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(918, 7, 1534, 14, 1200.91, 15, '2024-03-18 21:10:57', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(919, 4, 720, 1, 3146.09, 5, '2024-05-26 05:05:48', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(920, 12, 617, 11, 4771.88, 20, '2024-08-24 15:24:53', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(921, 10, 2140, 16, 813.31, 10, '2025-02-18 19:31:25', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(922, 5, 544, 13, 2410.11, 15, '2024-12-26 08:21:43', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(923, 4, 225, 13, 1407.17, 15, '2025-02-03 01:26:04', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(924, 19, 1279, 10, 326.78, 50, '2025-01-06 17:19:10', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(925, 7, 232, 18, 4428.89, 50, '2024-03-19 11:59:22', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(926, 11, 477, 6, 1743.75, 10, '2024-08-17 13:00:31', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(927, 6, 1656, 8, 1854.51, 5, '2024-05-11 00:21:35', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(928, 10, 2037, 14, 3758.47, 0, '2024-10-24 09:42:51', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(929, 1, 2200, 8, 4638.4, 10, '2024-08-31 17:24:23', '2025-07-22 13:37:34', '2025-07-22 13:37:34'),
(930, 2, 599, 11, 3744.59, 5, '2024-09-21 15:17:48', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(931, 9, 1056, 16, 3195.24, 20, '2024-09-08 13:59:55', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(932, 14, 1728, 5, 1555.46, 10, '2024-11-27 06:44:06', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(933, 11, 1751, 11, 3057.72, 15, '2024-06-08 15:53:20', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(934, 17, 1517, 12, 4483.92, 20, '2024-10-12 23:15:51', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(935, 8, 287, 19, 1495.79, 15, '2024-06-26 10:25:02', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(936, 14, 1550, 18, 871.09, 5, '2024-09-17 08:39:33', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(937, 14, 1587, 20, 689.08, 20, '2024-11-28 08:57:49', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(938, 14, 2314, 1, 3595.86, 15, '2024-09-28 20:58:49', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(939, 15, 806, 4, 3083.11, 10, '2024-07-03 01:49:52', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(940, 4, 1753, 19, 3364.3, 20, '2024-06-07 20:37:10', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(941, 12, 602, 5, 4225.98, 0, '2025-01-16 22:11:05', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(942, 4, 705, 20, 1431.04, 20, '2024-03-24 18:51:11', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(943, 13, 2309, 12, 632.52, 5, '2024-04-22 01:32:54', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(944, 3, 1597, 8, 1071.86, 20, '2024-11-24 04:58:27', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(945, 12, 1032, 19, 2261.65, 50, '2025-02-02 01:59:04', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(946, 12, 805, 10, 3999.83, 0, '2024-04-23 13:34:23', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(947, 8, 1343, 1, 2422.18, 20, '2024-05-25 10:02:32', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(948, 2, 697, 7, 2770.71, 20, '2024-04-07 06:25:57', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(949, 14, 1993, 10, 1482.59, 15, '2025-02-19 14:24:06', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(950, 9, 648, 8, 2603.2, 15, '2024-11-15 14:39:28', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(951, 3, 298, 19, 4864.79, 20, '2024-09-03 14:33:52', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(952, 2, 1315, 19, 263.08, 50, '2024-12-22 01:38:09', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(953, 19, 1086, 14, 4493.61, 10, '2025-01-05 10:04:14', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(954, 5, 2043, 17, 1081.9, 15, '2024-07-06 08:34:19', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(955, 2, 1748, 17, 2166.83, 20, '2024-06-30 00:18:02', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(956, 5, 1005, 4, 1880.81, 5, '2024-08-25 09:24:00', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(957, 9, 9, 19, 3737.54, 20, '2024-09-01 19:17:42', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(958, 5, 1443, 13, 4938.54, 10, '2025-02-03 21:54:26', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(959, 20, 1500, 19, 4305.66, 0, '2025-01-19 04:32:26', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(960, 16, 2167, 18, 1423.58, 10, '2025-01-13 10:33:02', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(961, 6, 446, 7, 3904.83, 10, '2024-11-19 04:12:28', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(962, 3, 116, 11, 1565.09, 15, '2025-03-02 00:48:51', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(963, 4, 2190, 16, 4832.94, 50, '2024-05-10 19:07:00', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(964, 18, 216, 6, 2865.43, 50, '2025-01-28 13:05:11', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(965, 11, 1711, 18, 4387.54, 50, '2025-01-18 15:43:31', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(966, 10, 779, 12, 1740.75, 5, '2024-06-04 19:28:26', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(967, 5, 379, 7, 4607.48, 20, '2025-02-08 11:16:25', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(968, 4, 1296, 17, 2435.11, 15, '2024-04-27 07:05:32', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(969, 2, 553, 10, 4864.28, 0, '2024-06-01 05:03:21', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(970, 15, 629, 8, 3177.83, 5, '2024-12-26 13:48:07', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(971, 14, 2015, 13, 4618.33, 50, '2024-10-23 11:27:19', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(972, 8, 1098, 9, 3034.99, 20, '2024-08-14 21:24:28', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(973, 20, 1564, 19, 2602.07, 10, '2025-02-14 23:34:10', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(974, 9, 447, 11, 3767.59, 0, '2025-02-04 02:50:10', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(975, 9, 1866, 5, 4826.02, 5, '2024-08-07 00:52:46', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(976, 5, 1789, 20, 4143.3, 10, '2024-11-01 11:11:40', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(977, 17, 902, 1, 3855.22, 5, '2024-12-22 14:29:02', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(978, 1, 122, 1, 3539.62, 5, '2024-11-16 02:11:30', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(979, 8, 1241, 18, 3074.2, 10, '2024-05-07 10:25:52', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(980, 1, 839, 3, 2768.92, 50, '2024-05-24 19:28:22', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(981, 1, 1832, 2, 2060.57, 50, '2024-08-14 13:17:18', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(982, 4, 2207, 12, 400.23, 20, '2024-07-23 03:36:58', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(983, 12, 1376, 12, 4416.61, 0, '2024-09-24 06:32:34', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(984, 16, 1785, 2, 4288.75, 10, '2024-12-01 09:03:26', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(985, 19, 765, 10, 4910.44, 5, '2024-04-10 23:14:21', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(986, 8, 34, 11, 40.12, 50, '2024-08-28 12:02:47', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(987, 16, 1365, 2, 605.32, 20, '2024-10-28 16:36:26', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(988, 10, 742, 11, 563.6, 50, '2024-06-04 22:37:36', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(989, 8, 1750, 13, 1917.02, 10, '2024-07-25 10:05:20', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(990, 7, 1993, 14, 1482.59, 50, '2025-02-17 21:02:28', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(991, 5, 1103, 19, 1633.63, 20, '2025-02-28 23:57:34', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(992, 19, 2140, 4, 813.31, 0, '2024-07-06 18:02:42', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(993, 4, 711, 10, 4324.51, 0, '2024-08-27 15:49:27', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(994, 1, 279, 6, 4290.55, 5, '2024-11-06 06:08:30', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(995, 9, 8, 2, 4546.2, 5, '2025-03-01 01:38:39', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(996, 9, 1545, 10, 2460.73, 20, '2024-06-26 20:35:01', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(997, 18, 476, 16, 357.77, 5, '2024-08-20 17:09:51', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(998, 10, 1944, 12, 3829.23, 5, '2024-08-20 14:07:38', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(999, 20, 2024, 15, 4565.01, 5, '2025-01-14 07:53:08', '2025-07-22 13:37:35', '2025-07-22 13:37:35'),
(1000, 20, 1768, 13, 3086.65, 50, '2024-11-11 07:16:38', '2025-07-22 13:37:35', '2025-07-22 13:37:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Heavy Duty Steel Computer', '3401885628391', 'heavy-duty-steel-computer', 'Recusandae quo qui nulla labore quos nam vel. Et molestiae nesciunt recusandae eveniet. Amet possimus quam non adipisci unde blanditiis voluptas.', 418.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2, 'Practical Copper Bench', '1806788828411', 'practical-copper-bench', 'Tempore libero ea sint nemo tempore amet. Repellat officia delectus quo distinctio nesciunt. Quis nesciunt beatae neque libero molestiae nihil.', 4959.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(3, 'Intelligent Granite Hat', '4888816406461', 'intelligent-granite-hat', 'Possimus atque fugit est voluptate ut et. Dolor nemo ut officiis voluptatem.', 2431.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(4, 'Enormous Silk Clock', '0739035532100', 'enormous-silk-clock', 'Ut iusto unde deleniti qui accusantium quas. Voluptatem deserunt dolorem suscipit dolores et debitis accusantium.', 3865.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(5, 'Heavy Duty Steel Gloves', '3319728531114', 'heavy-duty-steel-gloves', 'Voluptate qui laborum exercitationem. Cupiditate molestiae aut ullam nulla nihil.', 1559.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(6, 'Lightweight Steel Car', '1583500678683', 'lightweight-steel-car', 'Vel maiores facilis quod. Eos labore est quaerat. Dolores dolorum neque dolor deleniti est inventore doloremque.', 1758.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(7, 'Intelligent Cotton Table', '9232726760970', 'intelligent-cotton-table', 'Consequatur numquam rerum cumque ducimus soluta. Aliquam est iste porro omnis libero deserunt quaerat. Magni nulla suscipit inventore voluptas ipsum debitis.', 886.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(8, 'Practical Concrete Coat', '1978395704942', 'practical-concrete-coat', 'Iste vel et voluptate eaque distinctio quia. Molestiae blanditiis sed perspiciatis illo unde aliquam. Vel ipsum tenetur accusantium vel consequatur id est.', 4546.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(9, 'Mediocre Silk Coat', '2708658064228', 'mediocre-silk-coat', 'Id aspernatur esse sunt aut consequatur. Earum qui possimus ut eligendi itaque laborum.', 3737.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(10, 'Heavy Duty Bronze Computer', '1393735353824', 'heavy-duty-bronze-computer', 'Cumque excepturi facilis quia qui voluptas. Temporibus quaerat natus eum. Occaecati voluptatem aut ratione beatae.', 1073.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(11, 'Enormous Wooden Watch', '0802214578982', 'enormous-wooden-watch', 'Pariatur enim aliquam quos omnis illum architecto. Pariatur tempora explicabo inventore aperiam rem.', 2288.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(12, 'Lightweight Wool Coat', '7013114773152', 'lightweight-wool-coat', 'Adipisci expedita atque dicta id doloribus hic. Error ut cumque non consequatur id aut qui.', 738.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(13, 'Aerodynamic Cotton Car', '0098036557278', 'aerodynamic-cotton-car', 'Est veniam aliquid voluptates omnis dolore non. Cupiditate mollitia aut vero dolore. Aut consequatur veritatis doloremque qui est maiores.', 3442.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(14, 'Synergistic Bronze Bench', '3639153032872', 'synergistic-bronze-bench', 'Cum ut harum ratione. Dolor hic omnis quas veniam.', 267.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(15, 'Mediocre Wooden Bench', '3646619205428', 'mediocre-wooden-bench', 'Est aut id ipsa impedit nobis aspernatur. Assumenda quod maxime blanditiis necessitatibus laudantium cumque voluptas. Velit ut sint id aut.', 3352.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(16, 'Mediocre Copper Car', '0581580143542', 'mediocre-copper-car', 'Qui iste quia aliquam debitis. Aspernatur at cupiditate voluptatem temporibus. Sequi eos maiores doloremque deleniti reprehenderit vel sapiente.', 386.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(17, 'Durable Copper Pants', '9452181737830', 'durable-copper-pants', 'Dignissimos ratione repellat mollitia sunt. Quod delectus animi molestiae blanditiis eveniet dolore.', 856.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(18, 'Fantastic Marble Keyboard', '6132144810321', 'fantastic-marble-keyboard', 'Quia culpa aut aut iste odio. Quae aut quidem voluptas. Voluptatibus veritatis suscipit beatae ut reprehenderit neque placeat.', 2303.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(19, 'Intelligent Leather Pants', '6924170038127', 'intelligent-leather-pants', 'Possimus sunt nobis est sapiente quas voluptatem excepturi. Error ullam repellat iure vel.', 2084.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(20, 'Lightweight Wooden Bench', '3402474315166', 'lightweight-wooden-bench', 'Maiores repellat dolorem odit atque hic. Voluptatem enim modi eos tempora et corrupti.', 3836.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(21, 'Enormous Granite Computer', '8089930844269', 'enormous-granite-computer', 'Nobis commodi et doloremque sed voluptatibus. Commodi et commodi vitae ut facere. Et natus voluptas sint voluptatem.', 1260.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(22, 'Enormous Wool Clock', '0895918881335', 'enormous-wool-clock', 'Ipsum rem rerum labore corporis provident. Eos quod provident voluptatum.', 3240.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(23, 'Practical Steel Hat', '5107226652596', 'practical-steel-hat', 'Minima aliquid et cumque tenetur rerum in itaque enim. Quia sint nemo possimus consequatur.', 2452.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(24, 'Sleek Iron Hat', '2578606478816', 'sleek-iron-hat', 'Repellendus cupiditate ipsa beatae illo rerum omnis laborum. Quae sit et id omnis qui. Eveniet necessitatibus voluptatum velit et tempora sapiente.', 174.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(25, 'Intelligent Leather Computer', '7821631659343', 'intelligent-leather-computer', 'Dolorum qui vitae porro nihil voluptas vel ut. Quod aut labore nemo enim fugit quidem. Incidunt ex beatae itaque modi.', 3182.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(26, 'Incredible Bronze Keyboard', '5040644943641', 'incredible-bronze-keyboard', 'Veniam numquam eum natus qui commodi quidem. Similique fuga est illum rem culpa.', 2376.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(27, 'Enormous Granite Car', '9229842709174', 'enormous-granite-car', 'Et suscipit quo nemo. Consequatur aut molestias fugiat eveniet iure. Et et velit consectetur repellendus voluptas.', 369.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(28, 'Small Wool Lamp', '1320377925669', 'small-wool-lamp', 'Similique autem incidunt doloribus qui. Sunt sequi atque omnis temporibus dignissimos quos nobis. Beatae doloribus animi autem laborum aut minus.', 2709.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(29, 'Intelligent Wool Watch', '9011418601117', 'intelligent-wool-watch', 'Rerum molestiae ex expedita placeat expedita. Enim corrupti qui autem sint dolor ea neque. Perferendis quaerat quos laboriosam accusantium.', 3434.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(30, 'Ergonomic Rubber Plate', '0151621951001', 'ergonomic-rubber-plate', 'Rem quo repudiandae cumque qui qui. Cumque aut id itaque doloribus quae ad. Minima placeat ea provident voluptatem eos nam aut quas.', 4504.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(31, 'Durable Paper Clock', '7134791836180', 'durable-paper-clock', 'Facere repudiandae quasi dolorum ut et delectus. Vitae laudantium ea pariatur accusantium velit ullam rerum.', 65.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(32, 'Enormous Wooden Gloves', '1934157096007', 'enormous-wooden-gloves', 'Sunt beatae optio mollitia totam. Ex aut consequatur quo nostrum culpa. Commodi culpa totam aliquid expedita accusamus.', 3733.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(33, 'Mediocre Marble Keyboard', '1226322079343', 'mediocre-marble-keyboard', 'Qui est architecto voluptas. Placeat facere fuga necessitatibus adipisci sint architecto laboriosam.', 3298.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(34, 'Durable Aluminum Clock', '9977781118617', 'durable-aluminum-clock', 'Aut voluptatem fuga ullam sint hic dolorem. Quod vel similique laudantium vel impedit impedit.', 40.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(35, 'Intelligent Cotton Plate', '3104243342464', 'intelligent-cotton-plate', 'Id consectetur quae et optio ut consequatur laudantium eligendi. Mollitia iure sunt sunt itaque quisquam voluptas totam.', 2356.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(36, 'Small Rubber Bag', '6239376876214', 'small-rubber-bag', 'Tenetur vel doloribus occaecati quas qui dolorem sapiente. Perspiciatis sunt quisquam beatae voluptates. Dolores alias autem optio enim dolorum.', 4309.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(37, 'Ergonomic Linen Gloves', '5748132454890', 'ergonomic-linen-gloves', 'Porro assumenda quam est ut doloremque excepturi fuga. Eos placeat doloribus quia quos quas ratione assumenda.', 4833.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(38, 'Aerodynamic Paper Shoes', '2218282920383', 'aerodynamic-paper-shoes', 'Qui quia est et est aut qui pariatur. Vel earum iure est qui.', 2373.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(39, 'Lightweight Wooden Car', '0774919393002', 'lightweight-wooden-car', 'Explicabo exercitationem sit laborum ex minus. Fugit necessitatibus quae assumenda aut autem vitae.', 2641.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(40, 'Aerodynamic Linen Coat', '5346217704016', 'aerodynamic-linen-coat', 'Maiores recusandae nisi deleniti. Voluptatum sapiente omnis quis quia suscipit.', 422.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(41, 'Fantastic Wooden Watch', '6033658302329', 'fantastic-wooden-watch', 'Quia enim aut soluta qui voluptatem. Voluptatem deleniti quia aut suscipit. Cum ut ad omnis dolor in.', 4023.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(42, 'Rustic Wooden Chair', '8343503228901', 'rustic-wooden-chair', 'Hic eligendi illum repellendus amet ex odio. Sapiente fugit qui nulla ea maiores sunt et sit.', 1075.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(43, 'Enormous Granite Gloves', '0872452194572', 'enormous-granite-gloves', 'Ut est corporis blanditiis officia aliquid consequatur. Facere soluta assumenda repudiandae tempora. Ducimus et et consequatur minus consequuntur.', 1001.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(44, 'Rustic Cotton Coat', '4768913310017', 'rustic-cotton-coat', 'Libero in qui aperiam quam repudiandae dolorum et. Iste nihil ab fuga.', 899.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(45, 'Aerodynamic Concrete Clock', '5854178700416', 'aerodynamic-concrete-clock', 'Nobis molestiae sequi necessitatibus dolorem odit aut. Aut inventore error est molestias odit officia maxime. Id odio quia voluptate.', 1490.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(46, 'Gorgeous Iron Watch', '0644733541357', 'gorgeous-iron-watch', 'Dolorum est possimus odio excepturi. Dicta facere maxime quia consequatur necessitatibus cumque nihil. Nesciunt est et quaerat nam.', 1526.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(47, 'Rustic Linen Bench', '4632575169453', 'rustic-linen-bench', 'Hic sapiente sed excepturi corrupti id qui et. Nesciunt in omnis enim voluptate. Qui totam labore quis.', 2268.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(48, 'Aerodynamic Silk Knife', '7666388005483', 'aerodynamic-silk-knife', 'Doloremque eum et vel dolorem nemo magnam. Culpa hic non nesciunt nisi voluptas perferendis quam porro.', 4503.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(49, 'Sleek Silk Clock', '1898628444073', 'sleek-silk-clock', 'Ad similique ut rem fugit tempora aspernatur. Neque cumque tempora natus amet vel. Maiores aut ratione corrupti ut.', 4061.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(50, 'Lightweight Paper Bag', '0537386732992', 'lightweight-paper-bag', 'Repudiandae at porro deleniti ipsum illum reiciendis rerum beatae. Explicabo sit ea id aliquid quisquam. Eaque ut porro similique.', 1427.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(51, 'Durable Bronze Wallet', '3869160969810', 'durable-bronze-wallet', 'Laudantium a dolores modi esse harum. Eum sequi praesentium qui. In accusantium quia sit odio iure.', 1228.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(52, 'Heavy Duty Wool Wallet', '8665217185739', 'heavy-duty-wool-wallet', 'Tempora sunt tempora alias corporis quam est reprehenderit. Alias molestias facere mollitia excepturi minima.', 907.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(53, 'Small Marble Shoes', '7522898155998', 'small-marble-shoes', 'Aut distinctio possimus dolorum delectus sunt. Eos omnis incidunt iste voluptatem quos unde doloremque.', 3472.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(54, 'Enormous Cotton Keyboard', '7520988918355', 'enormous-cotton-keyboard', 'Ut libero nisi ipsam aliquam molestiae sequi aut. Id animi deleniti incidunt perspiciatis veniam. Voluptatibus provident quos non rerum.', 4158.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(55, 'Incredible Wool Bottle', '8672098182375', 'incredible-wool-bottle', 'Optio provident voluptatibus sit quia. Magnam ea dolores ratione voluptatem. Occaecati beatae aut quia corrupti est corporis occaecati impedit.', 1103, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(56, 'Practical Cotton Bottle', '1382941086435', 'practical-cotton-bottle', 'Rerum reiciendis quas ab qui aut sit quas. Ad dolores fugiat sint perferendis nobis.', 2016.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(57, 'Enormous Steel Computer', '0967279046071', 'enormous-steel-computer', 'In delectus minus velit iusto. Aspernatur suscipit perspiciatis voluptatem labore ab enim magnam. Odit sed non provident maxime commodi facilis quisquam.', 3587.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(58, 'Ergonomic Bronze Shoes', '0933649884697', 'ergonomic-bronze-shoes', 'Et optio rem quam consequatur quasi molestias. Vel natus cupiditate consequatur nam magnam ut. Eaque corporis dolor atque dolores.', 2973.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(59, 'Intelligent Concrete Bottle', '3307431398223', 'intelligent-concrete-bottle', 'Eum ut quidem nihil ut nisi voluptatem voluptatem. Sit quo facere doloribus molestiae. Nisi ut dolorem vitae quia non perspiciatis.', 26.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(60, 'Ergonomic Granite Bench', '3729346770589', 'ergonomic-granite-bench', 'Voluptate delectus aspernatur voluptas. Sed minus nihil odio sunt est.', 2190.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(61, 'Small Copper Car', '8678488327555', 'small-copper-car', 'Cum iure molestias et beatae maxime dolorem quo. Qui fuga et veniam dolorum aliquid consequatur aut nobis.', 88.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(62, 'Synergistic Linen Chair', '6248869155149', 'synergistic-linen-chair', 'Dolorum voluptate autem error harum. Veniam ratione error nisi aliquid culpa consequuntur incidunt quia. Fugit laboriosam excepturi mollitia distinctio.', 2777.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(63, 'Small Steel Pants', '2628705775122', 'small-steel-pants', 'Dicta assumenda molestiae dolorum atque voluptas ab. Sit sint in aut sed molestias voluptates. Aut ipsam et quibusdam enim laudantium.', 3364.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(64, 'Small Copper Table', '6497432433140', 'small-copper-table', 'Sed qui aspernatur adipisci officia quia. Aut iste omnis sed quia est nesciunt dolores.', 2737.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(65, 'Ergonomic Leather Shirt', '8551942694748', 'ergonomic-leather-shirt', 'Voluptas voluptas nam nam provident ut. Nihil incidunt velit quos doloribus soluta reiciendis. Itaque aut debitis omnis ab ipsam.', 3279.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(66, 'Fantastic Wool Hat', '5294803829202', 'fantastic-wool-hat', 'Assumenda odit accusamus facere consequatur molestiae autem. Dolor enim nihil culpa iure. Perspiciatis et ipsa soluta quae.', 1668.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(67, 'Fantastic Steel Watch', '1534083199546', 'fantastic-steel-watch', 'Neque ipsum veniam sunt et eum sequi qui aut. Cum hic deserunt perferendis eum voluptatem sed.', 4802.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(68, 'Sleek Plastic Bench', '2258202174526', 'sleek-plastic-bench', 'Officia perspiciatis et quibusdam. Laboriosam nam earum vel aut. Illo et amet dolor.', 3208.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(69, 'Synergistic Rubber Bench', '7048876150514', 'synergistic-rubber-bench', 'Esse cupiditate quas ad magni ipsam ratione. Fugit at aut provident dolorum sed ipsum voluptate ad.', 310.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(70, 'Mediocre Wooden Bag', '1788238101995', 'mediocre-wooden-bag', 'Architecto sed magnam amet rerum quisquam quae nesciunt. Vitae iure aut nam ut error iste voluptatum eum.', 4245.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(71, 'Ergonomic Rubber Knife', '8902944306311', 'ergonomic-rubber-knife', 'Sint labore sit iste ullam illum iure. Illo ut sed nostrum. Aut non sit odit qui et et alias.', 4984.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(72, 'Rustic Leather Table', '0410138086263', 'rustic-leather-table', 'Velit et corporis accusamus. Nesciunt tenetur dignissimos ratione ipsa similique.', 3452.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(73, 'Awesome Wool Watch', '6851702350047', 'awesome-wool-watch', 'Id molestiae est incidunt rerum non dolor. Porro consequatur voluptatibus molestiae repellat nihil.', 561.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(74, 'Enormous Aluminum Pants', '9467162488069', 'enormous-aluminum-pants', 'Et totam esse excepturi illum optio voluptatem totam. Corrupti distinctio eos deserunt totam culpa reprehenderit dicta. Adipisci error aut dolor minima sapiente.', 4139.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(75, 'Enormous Paper Knife', '9308306623352', 'enormous-paper-knife', 'Minima provident reiciendis sint cumque molestias est. Corrupti iure voluptate et voluptates voluptatem officia.', 2671.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(76, 'Incredible Aluminum Chair', '3376759603074', 'incredible-aluminum-chair', 'Qui sit sequi in repellat sed atque. Ea dolor eaque et aut aut quo.', 2801.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(77, 'Heavy Duty Copper Bottle', '9569696633929', 'heavy-duty-copper-bottle', 'Delectus et cupiditate sint. Vel occaecati tempora rerum voluptatem dolorem deleniti. Voluptatem aut sit illo sequi ut vel.', 4697.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(78, 'Ergonomic Copper Car', '1634560693519', 'ergonomic-copper-car', 'Et saepe incidunt est esse commodi enim rerum. Non aut in nostrum. Sequi id nam facilis voluptatum quia dolor libero.', 1804.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(79, 'Fantastic Wool Table', '5757507783206', 'fantastic-wool-table', 'Sed ullam soluta nesciunt consequuntur. Quas quia voluptatem maxime eveniet. Veniam harum voluptas aperiam error qui fugit quas.', 3396.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(80, 'Sleek Steel Computer', '0763959229785', 'sleek-steel-computer', 'Provident saepe ut labore. Repudiandae enim aperiam unde quis sint eaque exercitationem.', 4705.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(81, 'Aerodynamic Cotton Shirt', '0148455978472', 'aerodynamic-cotton-shirt', 'Mollitia quos aspernatur facilis architecto sit quae et quod. Voluptatibus ea nesciunt qui nihil veniam.', 2923.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(82, 'Synergistic Rubber Gloves', '4430628699830', 'synergistic-rubber-gloves', 'Vitae et quia et cupiditate asperiores nihil. Dignissimos voluptatem qui vel molestias esse. Voluptatum suscipit omnis incidunt autem.', 2460.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(83, 'Fantastic Copper Lamp', '9753888568377', 'fantastic-copper-lamp', 'Deserunt voluptas aliquam ut reiciendis nemo veniam. Non dolorem repellat perspiciatis praesentium.', 114.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(84, 'Intelligent Rubber Coat', '6483878482132', 'intelligent-rubber-coat', 'Repellendus qui non ut eos dolor consequatur adipisci aut. Perferendis quo a consequuntur sapiente minus deleniti. Sit illo occaecati accusamus necessitatibus ea nihil nostrum.', 4631.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(85, 'Mediocre Copper Plate', '3026413412060', 'mediocre-copper-plate', 'Error id aperiam ipsum quis. Dolore doloribus est sequi rerum velit et et. Fugiat atque nihil qui voluptatem laudantium laudantium.', 1818.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(86, 'Mediocre Wooden Plate', '6193135084770', 'mediocre-wooden-plate', 'Hic repudiandae dolores quae magni quia tempora sapiente iste. Veniam ullam quia ipsam saepe sunt et.', 1934.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(87, 'Intelligent Linen Lamp', '0065175877130', 'intelligent-linen-lamp', 'Dignissimos voluptas non vitae. Mollitia tenetur sequi exercitationem accusantium.', 4319.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(88, 'Awesome Marble Hat', '3869387130062', 'awesome-marble-hat', 'Tenetur aut dolorem et alias et. Impedit qui aut consectetur quas laborum reiciendis dolorum numquam.', 3867.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(89, 'Lightweight Cotton Watch', '0088880315360', 'lightweight-cotton-watch', 'Dolor voluptatem sint earum autem laboriosam ad at. Quo eveniet nulla et qui voluptates delectus. Ut et vero cumque eum aliquid.', 3659.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(90, 'Fantastic Iron Shoes', '7527097336568', 'fantastic-iron-shoes', 'Quisquam voluptatem consequatur omnis et aspernatur. Repellat eligendi suscipit dolorem qui dolore et omnis possimus.', 4109.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(91, 'Rustic Bronze Shoes', '2148528746807', 'rustic-bronze-shoes', 'Tenetur est dolorem soluta omnis. Id sint consequuntur cum minus ipsam.', 3424.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(92, 'Fantastic Bronze Bench', '3837440854941', 'fantastic-bronze-bench', 'Neque excepturi architecto in aliquid. Voluptas repellendus et impedit. Voluptas illo voluptas omnis quidem.', 2547.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(93, 'Gorgeous Leather Plate', '2230368594431', 'gorgeous-leather-plate', 'Ut voluptas maiores quia est. Rerum et facere eligendi.', 2887.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(94, 'Synergistic Wooden Chair', '3568814846261', 'synergistic-wooden-chair', 'Veritatis praesentium ullam quaerat blanditiis. Saepe culpa repudiandae assumenda aut saepe. Eius omnis exercitationem ut a veniam.', 4351.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(95, 'Rustic Aluminum Chair', '8436262140338', 'rustic-aluminum-chair', 'Necessitatibus nemo aut quis dolor. Ut provident ullam enim soluta fugit exercitationem. Debitis exercitationem voluptatum eum ducimus delectus molestiae accusantium.', 4398.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(96, 'Ergonomic Iron Clock', '3887488295459', 'ergonomic-iron-clock', 'Eos sed eum et similique. Minima quisquam nam odit suscipit libero autem unde.', 2500.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(97, 'Small Leather Watch', '5440484387290', 'small-leather-watch', 'Pariatur quidem doloremque consequatur. Et quam velit voluptatum ipsam. Odio dolores aut atque veniam error nemo.', 3862.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(98, 'Small Copper Computer', '2658020302123', 'small-copper-computer', 'Deserunt est neque aliquam sed vero. Temporibus dolor aut in a dolor. Distinctio sint vel a assumenda in aut iure.', 4404.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(99, 'Awesome Granite Gloves', '5180792400068', 'awesome-granite-gloves', 'Minima qui atque ut qui. Dolor quo illo optio facere eligendi. Alias vel quod temporibus ad ut officiis.', 2321.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(100, 'Ergonomic Wool Pants', '8471958561677', 'ergonomic-wool-pants', 'Aut aliquid rerum maxime repudiandae soluta dolorem nulla. Blanditiis facilis officiis quo et.', 1451.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(101, 'Intelligent Wooden Watch', '8341127141125', 'intelligent-wooden-watch', 'Molestiae et voluptate iusto ut esse expedita. Qui dolores et reprehenderit cupiditate perferendis. Enim harum deserunt aliquam et architecto.', 4080, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(102, 'Fantastic Bronze Car', '5672249071377', 'fantastic-bronze-car', 'Nemo maiores nulla doloribus explicabo commodi. Excepturi eos consectetur qui accusantium dicta unde.', 2409.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(103, 'Enormous Wooden Table', '8468652535158', 'enormous-wooden-table', 'Nam in rerum non. Ab enim enim quasi nisi autem.', 2229.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(104, 'Ergonomic Wool Watch', '5968688339964', 'ergonomic-wool-watch', 'Eos nihil blanditiis assumenda cumque. Velit fuga blanditiis minus. Voluptas delectus impedit accusantium temporibus odit quaerat aliquid.', 3656.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(105, 'Incredible Leather Lamp', '1317437289120', 'incredible-leather-lamp', 'Est ea dolorem quos libero. Dolorem quam nihil consequatur et minima ad repudiandae quo. Necessitatibus neque aliquid officia perferendis illo qui.', 1313.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(106, 'Fantastic Steel Knife', '0206437798613', 'fantastic-steel-knife', 'Esse tempore quidem sit aperiam harum excepturi. Amet dolorem rerum numquam adipisci. Quod ducimus praesentium et corporis laboriosam rerum accusamus.', 1847.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(107, 'Small Rubber Shirt', '1191807825725', 'small-rubber-shirt', 'Incidunt voluptas tempora quod fuga ut illo. Fugiat velit debitis atque ipsa quod sequi dolorem recusandae.', 1550.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(108, 'Enormous Silk Computer', '8403662335725', 'enormous-silk-computer', 'Praesentium aperiam nihil error quisquam non. Architecto hic fugit nobis aut.', 3826.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(109, 'Sleek Iron Knife', '5813561491041', 'sleek-iron-knife', 'Ea qui eum rerum voluptatem voluptas sint soluta. Rerum et eveniet quos quia. Dolorem molestias necessitatibus fugit nihil in.', 760.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(110, 'Practical Iron Hat', '2160631834219', 'practical-iron-hat', 'Aut suscipit sapiente error repudiandae voluptas sit et. Optio omnis omnis ut aut possimus aliquid. Quod itaque quas quia dolor harum quia.', 3061.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(111, 'Mediocre Leather Plate', '6115907351798', 'mediocre-leather-plate', 'Commodi eos ea autem possimus voluptate dolor eaque explicabo. Quo aspernatur consequatur occaecati cum et. Molestiae ipsum aperiam veniam pariatur veritatis recusandae delectus.', 3908.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(112, 'Intelligent Rubber Keyboard', '5569158488917', 'intelligent-rubber-keyboard', 'Aspernatur odit voluptatibus incidunt explicabo aut nemo praesentium reiciendis. Omnis possimus odit asperiores aliquid. Cumque consequatur omnis ducimus et quam.', 1745.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(113, 'Intelligent Silk Lamp', '8718247500697', 'intelligent-silk-lamp', 'Minus aspernatur voluptatum omnis aut inventore. Occaecati minima laborum aliquid omnis recusandae enim molestiae. Numquam et inventore sed blanditiis quasi ad.', 678.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(114, 'Fantastic Cotton Wallet', '2631882162081', 'fantastic-cotton-wallet', 'Autem vero et similique. Necessitatibus sint consequatur eveniet ullam. Eius dolore sit est numquam.', 4199.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(115, 'Awesome Plastic Pants', '6447340198068', 'awesome-plastic-pants', 'Minus debitis similique officia aliquam eos. Voluptatem aut magnam vel porro nisi iste.', 1565.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(116, 'Gorgeous Copper Clock', '4849576935226', 'gorgeous-copper-clock', 'Libero vel pariatur eligendi quis quis voluptatem repellendus molestias. Et libero neque rerum quisquam. Sapiente temporibus rem culpa quia et et aut.', 4808.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(117, 'Sleek Steel Bag', '7815749802272', 'sleek-steel-bag', 'Non quidem sed alias et officiis dignissimos distinctio. Et sint cum consequatur vitae est occaecati. Voluptas aspernatur unde aliquam ratione sint eveniet ipsum.', 16.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(118, 'Sleek Wool Bench', '8887449873141', 'sleek-wool-bench', 'Eaque esse natus quam ratione omnis eius. Laboriosam reprehenderit qui voluptas odit.', 2443.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(119, 'Practical Marble Car', '3252034313954', 'practical-marble-car', 'Vel modi voluptatum ipsa sit et. Quo dolor quos dolor saepe non molestiae.', 3988.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(120, 'Fantastic Steel Hat', '4515235589894', 'fantastic-steel-hat', 'Eum quaerat vero rem occaecati tempora ea. Aliquam earum quis eius et provident rerum.', 3664.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(121, 'Enormous Concrete Shoes', '4843178521382', 'enormous-concrete-shoes', 'Velit qui qui nam praesentium nulla quos voluptatem. Odit aspernatur culpa sequi ea.', 3539.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(122, 'Ergonomic Copper Bench', '3366984774717', 'ergonomic-copper-bench', 'Vel perferendis magni sunt accusamus id qui. Cumque vel molestias omnis voluptas fuga ducimus placeat. Ut veniam deleniti quia.', 1608.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(123, 'Mediocre Cotton Plate', '3107553937450', 'mediocre-cotton-plate', 'Pariatur itaque accusamus qui beatae placeat qui. Dignissimos et praesentium laudantium qui. Laboriosam aliquam non explicabo autem amet dolor tempore.', 1766.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(124, 'Rustic Copper Watch', '7684971025175', 'rustic-copper-watch', 'Ut sunt eaque ut debitis illo. Numquam id quas qui quos.', 427.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(125, 'Incredible Bronze Watch', '6538614194951', 'incredible-bronze-watch', 'Aut aut ratione quas dignissimos quia et magni. Nostrum omnis rerum fuga quia placeat adipisci. Officiis dignissimos occaecati voluptas sint.', 3772.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(126, 'Small Silk Shirt', '9820707460935', 'small-silk-shirt', 'Dolore reprehenderit magni sint voluptate. Qui dignissimos quia iusto aliquam saepe.', 3021.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(127, 'Sleek Wool Shirt', '0572995149519', 'sleek-wool-shirt', 'Corporis quia laudantium saepe tenetur. Aspernatur dolorum voluptas fugiat magni eum sapiente et.', 2754.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(128, 'Small Wool Clock', '2080713746967', 'small-wool-clock', 'Dolorum et porro qui ut perspiciatis eum. Voluptatibus quia aut qui expedita aperiam occaecati numquam. Aut dolor quo distinctio id distinctio.', 3102.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(129, 'Sleek Granite Table', '1492337505027', 'sleek-granite-table', 'Iusto recusandae doloremque et quaerat sunt praesentium alias. Dolor harum repellendus aut ex.', 616.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(130, 'Aerodynamic Marble Bag', '9159721168023', 'aerodynamic-marble-bag', 'Odit magnam asperiores illo voluptas quasi. Necessitatibus delectus qui est necessitatibus aut et voluptatem.', 2999.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(131, 'Heavy Duty Aluminum Bag', '9420465374637', 'heavy-duty-aluminum-bag', 'Nostrum officia repellat cum id itaque id totam. Veritatis quibusdam blanditiis itaque enim nihil dolore non.', 1489.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(132, 'Awesome Silk Computer', '3448768527020', 'awesome-silk-computer', 'Neque rem veritatis facilis voluptatem qui. Rerum dolore ducimus vero quos nemo ut nisi.', 3811.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(133, 'Aerodynamic Steel Shirt', '3750880137576', 'aerodynamic-steel-shirt', 'Repellat debitis omnis assumenda laborum. Dolores dolor at fugit.', 600.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(134, 'Enormous Leather Coat', '9717620979784', 'enormous-leather-coat', 'Voluptatem fugit nostrum architecto facere error quo. Nihil sed qui vel laudantium et.', 1087.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(135, 'Synergistic Leather Bottle', '8775328183101', 'synergistic-leather-bottle', 'Provident rerum ducimus molestiae deleniti in. Sint consequatur tempore et aut natus. Dicta perspiciatis velit dolorem nostrum sapiente neque.', 3771.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(136, 'Rustic Paper Watch', '1789345490798', 'rustic-paper-watch', 'Est doloremque qui ducimus totam consequatur aut. Perspiciatis est illo enim. Libero quia omnis rerum sit placeat architecto odio.', 4274.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(137, 'Intelligent Steel Shoes', '3658495663254', 'intelligent-steel-shoes', 'Error ipsum libero praesentium itaque delectus occaecati dolorem quia. Libero quisquam soluta eaque autem consequatur.', 4455, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(138, 'Aerodynamic Plastic Bottle', '9197264496562', 'aerodynamic-plastic-bottle', 'Error eligendi sint autem pariatur blanditiis dolores. Et et architecto accusantium quam. Est dolor sit fugit.', 1826.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(139, 'Practical Bronze Pants', '2094553693862', 'practical-bronze-pants', 'Voluptatem rerum libero voluptate debitis sapiente quia. Nesciunt est et placeat quisquam earum est. Sunt repudiandae omnis et non.', 93.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(140, 'Intelligent Wool Chair', '9805999434987', 'intelligent-wool-chair', 'Unde quasi sunt aut omnis est. Ex enim commodi et aspernatur dolor. Optio sit maiores quibusdam hic.', 440.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(141, 'Incredible Steel Gloves', '3472466859022', 'incredible-steel-gloves', 'Iure eligendi nulla laboriosam facilis incidunt officia. Omnis non accusantium deleniti. Culpa id eveniet corporis vel sapiente voluptas commodi.', 4326.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(142, 'Rustic Linen Plate', '7293636411057', 'rustic-linen-plate', 'Unde in quasi minus corporis corporis. Rerum eius quibusdam eum eum voluptatum aut asperiores et. Voluptas aut alias quisquam corporis iste officiis.', 3676.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(143, 'Fantastic Silk Clock', '0680020151502', 'fantastic-silk-clock', 'Ut ut rerum possimus laborum asperiores illum sint. Hic minima consequatur voluptatem officia.', 4643.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(144, 'Small Steel Knife', '4338435260031', 'small-steel-knife', 'Expedita ipsa et ipsam. Dolorem sunt sit saepe hic.', 649.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(145, 'Sleek Wool Keyboard', '4998776303639', 'sleek-wool-keyboard', 'Eos nulla unde excepturi quis officia vero dolores. Nemo voluptatem porro possimus blanditiis.', 240.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(146, 'Sleek Copper Plate', '3586453121211', 'sleek-copper-plate', 'Sit cum repudiandae id culpa. Ab quia quas cum sed omnis.', 1834.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(147, 'Synergistic Cotton Gloves', '5241302161876', 'synergistic-cotton-gloves', 'In aspernatur vel dolor quibusdam. Unde voluptatem aut fuga rerum quas impedit. Asperiores aut quaerat deserunt tenetur repudiandae minima.', 4706.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(148, 'Gorgeous Silk Knife', '3400682697111', 'gorgeous-silk-knife', 'Tempore harum laboriosam aliquam laboriosam enim nihil. Corrupti maiores nam et illum a. Dicta enim repudiandae sint voluptatem dignissimos voluptatem deserunt.', 542.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(149, 'Mediocre Granite Watch', '8686188496044', 'mediocre-granite-watch', 'Vero reiciendis ut mollitia et in temporibus veritatis. Sint voluptatum porro repellendus inventore. Et corrupti deleniti quis omnis cumque adipisci cum.', 4721.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(150, 'Heavy Duty Leather Car', '6018948880015', 'heavy-duty-leather-car', 'Quia nostrum quibusdam officiis. Qui et omnis aut atque beatae quam. Molestiae quia accusamus sunt at eum expedita reprehenderit.', 652.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(151, 'Mediocre Aluminum Car', '9914924720214', 'mediocre-aluminum-car', 'Laudantium nobis enim nihil nemo. Aspernatur culpa dolores expedita et. Ipsum molestiae ut dolore sit hic aliquam.', 4431.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(152, 'Lightweight Copper Computer', '0643668614266', 'lightweight-copper-computer', 'Molestias hic tempora expedita quod. Ut laboriosam ratione natus. Quidem possimus voluptas vel aut.', 1144.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(153, 'Ergonomic Wool Gloves', '8338167792882', 'ergonomic-wool-gloves', 'Unde consectetur et id dicta consequuntur et amet. At mollitia impedit explicabo et fuga doloribus aut. Voluptas unde facilis sunt modi quis eligendi.', 3737.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(154, 'Practical Marble Coat', '1598774614862', 'practical-marble-coat', 'Quibusdam qui explicabo iure corrupti quia soluta. Dolores deserunt ut rerum ab laudantium rerum. Hic voluptatem nam deserunt porro tenetur.', 3185.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(155, 'Gorgeous Granite Knife', '8949379756281', 'gorgeous-granite-knife', 'Voluptatibus sint atque fugit qui sit consequatur. Ab mollitia et qui ea voluptatibus ullam eveniet. Deserunt est quas ad eum laudantium repudiandae.', 770.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(156, 'Rustic Copper Bench', '4947463395020', 'rustic-copper-bench', 'Quisquam consequuntur consectetur ducimus optio fugiat tenetur veniam numquam. Doloribus reprehenderit qui aliquam nostrum soluta ut sit.', 3101.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(157, 'Awesome Wooden Bench', '2906534714919', 'awesome-wooden-bench', 'Aut soluta dolorem minus voluptatem. Commodi incidunt ab rem itaque. Ratione ex sequi sit in.', 2094.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(158, 'Rustic Concrete Shoes', '7132357708353', 'rustic-concrete-shoes', 'Consequatur repellendus velit doloribus a. Omnis recusandae quaerat consequuntur. Quia temporibus quia tempore ducimus unde facere eligendi.', 2357.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(159, 'Mediocre Marble Bottle', '3468160465607', 'mediocre-marble-bottle', 'Qui est magni et quos voluptas molestiae error. Est et magnam distinctio non consequatur ut assumenda. Sunt aut et culpa et asperiores.', 3057.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(160, 'Small Silk Coat', '9529941345632', 'small-silk-coat', 'Atque ab veniam exercitationem maiores. Voluptate consequatur optio quia assumenda autem velit quo. Aut facilis vel quos sit et optio quia.', 3254.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(161, 'Synergistic Wool Hat', '9098433531407', 'synergistic-wool-hat', 'Tempora voluptas placeat in optio eligendi quidem amet debitis. Exercitationem blanditiis aut maiores est consectetur et dignissimos qui. Non est odit molestiae dolor.', 3399.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(162, 'Gorgeous Plastic Bottle', '1731660530703', 'gorgeous-plastic-bottle', 'Et non perferendis dicta non. Sit provident minima quo et.', 4681.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(163, 'Practical Steel Bench', '6268626713269', 'practical-steel-bench', 'Quis rerum minus sint sunt est voluptatem. Ipsum iusto nisi ut commodi at minima. Quo atque voluptas amet architecto iste quis ab.', 2048.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(164, 'Lightweight Rubber Clock', '3191168276127', 'lightweight-rubber-clock', 'Deserunt possimus sint corporis dolores velit. Ab et vel cumque soluta suscipit.', 4522.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(165, 'Incredible Plastic Car', '7678751430402', 'incredible-plastic-car', 'Odit voluptas odio officia nulla et. Animi perferendis id perferendis pariatur ratione a.', 326.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(166, 'Heavy Duty Iron Gloves', '9820168810898', 'heavy-duty-iron-gloves', 'Autem placeat doloribus harum et qui perferendis. Vel et et voluptatem quis doloremque.', 491.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(167, 'Incredible Wool Shoes', '5068337392286', 'incredible-wool-shoes', 'Dolor voluptatibus quam nesciunt et. Vel voluptate necessitatibus iusto et enim adipisci maxime. Vero blanditiis sunt sint nam.', 432.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(168, 'Incredible Aluminum Wallet', '0698215486810', 'incredible-aluminum-wallet', 'Occaecati nihil sed tenetur doloremque nihil dolorem. Repellat eum facere tempore beatae aliquam voluptatem itaque.', 3899.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(169, 'Gorgeous Paper Gloves', '1083466548414', 'gorgeous-paper-gloves', 'Dolorem quo velit modi laudantium nisi quasi id laboriosam. Architecto maxime eveniet ut.', 3272.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(170, 'Awesome Steel Car', '7928456245772', 'awesome-steel-car', 'Odit necessitatibus maxime totam qui autem non molestias. Consequuntur a in id amet labore qui qui. Modi itaque aut enim amet voluptatum fugit.', 630.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(171, 'Sleek Copper Car', '4781647247923', 'sleek-copper-car', 'Recusandae dolor ut voluptatem suscipit est placeat. Reprehenderit expedita ab quibusdam qui et quas.', 3298.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(172, 'Practical Marble Bottle', '8881231349586', 'practical-marble-bottle', 'Voluptatem nulla ipsa voluptas. Totam eligendi eveniet voluptas aspernatur. Molestiae odio fugiat totam totam ipsum consequatur.', 1835.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(173, 'Synergistic Plastic Keyboard', '4960495130070', 'synergistic-plastic-keyboard', 'Aut corrupti quia debitis ipsa aut. Dignissimos assumenda praesentium enim iste quia incidunt vero velit. Ex possimus quia impedit non at.', 434.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(174, 'Gorgeous Copper Plate', '5267102646283', 'gorgeous-copper-plate', 'Repellendus cum excepturi hic nobis. Necessitatibus rerum fugiat ratione sed adipisci.', 2047.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(175, 'Small Leather Knife', '3657210231310', 'small-leather-knife', 'Enim facere voluptas a qui optio neque. Cum velit doloremque architecto dolorem.', 2585.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(176, 'Lightweight Marble Coat', '2071634574227', 'lightweight-marble-coat', 'Placeat vel qui velit officia nobis. Quia doloremque ut est optio voluptatem et quae.', 2472.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(177, 'Intelligent Marble Bag', '3919597164347', 'intelligent-marble-bag', 'Beatae sit nemo rerum est saepe modi. Unde minus vitae magnam magnam inventore.', 1680.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(178, 'Incredible Copper Watch', '5941376069343', 'incredible-copper-watch', 'Omnis doloremque voluptas ab sed molestiae. Magni molestiae in et blanditiis reprehenderit excepturi.', 1540.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(179, 'Awesome Paper Lamp', '2840316035345', 'awesome-paper-lamp', 'Quos repellat alias odio eos consequuntur. Porro natus ratione eaque quaerat quo.', 4806.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(180, 'Aerodynamic Leather Bench', '6326302105965', 'aerodynamic-leather-bench', 'Voluptatem at omnis atque. Qui aut consectetur velit adipisci. Quisquam saepe ea aut at harum laborum ipsam.', 4264.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(181, 'Heavy Duty Aluminum Clock', '3672719051306', 'heavy-duty-aluminum-clock', 'Error quia in voluptatibus quam. Adipisci sunt nemo voluptas ad nulla. Sed modi inventore ut ipsa.', 4390.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(182, 'Gorgeous Marble Computer', '8194415244264', 'gorgeous-marble-computer', 'Quia et sequi qui accusantium quam. Aut et id ea odio temporibus sapiente quos nulla. Voluptatum facere omnis sed quam vero.', 3913.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(183, 'Practical Silk Plate', '7105341985313', 'practical-silk-plate', 'Eveniet non et quaerat illum autem a dolores. Voluptate ducimus quis iusto ut. Et quo odio maiores cum quis ut.', 1665.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(184, 'Mediocre Steel Gloves', '6252944368447', 'mediocre-steel-gloves', 'Perspiciatis veritatis ea explicabo. Commodi odit rerum est voluptates nulla voluptatibus magni. Quidem tempore et asperiores cupiditate nobis accusantium.', 444.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(185, 'Awesome Bronze Car', '6484053222970', 'awesome-bronze-car', 'Facilis ea odio quas voluptas laudantium voluptas dolores. Tenetur molestiae exercitationem est explicabo temporibus.', 3396.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(186, 'Mediocre Wooden Table', '2736540924329', 'mediocre-wooden-table', 'Illo omnis rerum consequatur. Repellat rerum distinctio earum pariatur velit iste excepturi. Totam enim quo quae nobis nesciunt aliquam ut.', 3896.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(187, 'Fantastic Bronze Shoes', '6560717941002', 'fantastic-bronze-shoes', 'Rem dolores perspiciatis cum deleniti architecto repellat in. Quaerat eaque quibusdam qui in aut et. Debitis iusto corporis voluptate consequatur iusto enim.', 871.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(188, 'Mediocre Wool Bottle', '8663475245752', 'mediocre-wool-bottle', 'Id et ut perferendis tempora magni. Dignissimos unde alias consequatur commodi. Perferendis exercitationem nulla officiis et et autem.', 298.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(189, 'Small Iron Shoes', '3602922303206', 'small-iron-shoes', 'Animi sed maiores rerum exercitationem aut qui placeat. Explicabo sapiente enim reprehenderit ipsa. Repellendus amet dolores voluptates quos voluptatem aut cupiditate.', 4436.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(190, 'Practical Rubber Pants', '7483764324187', 'practical-rubber-pants', 'Voluptas ipsa velit id fuga. Facilis odit alias neque eum qui. Accusantium perferendis animi minus ab aut illum.', 4958.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(191, 'Heavy Duty Iron Computer', '9025621828926', 'heavy-duty-iron-computer', 'A dolores culpa quaerat sequi. Est asperiores nobis unde.', 4826.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(192, 'Incredible Silk Lamp', '1198376854040', 'incredible-silk-lamp', 'Sapiente sint quas consectetur modi recusandae sapiente sit. Aspernatur similique provident hic modi voluptatum omnis et. Optio praesentium et similique non debitis eos.', 1726.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(193, 'Small Wooden Lamp', '3300698529454', 'small-wooden-lamp', 'Quis aut et cumque odio unde soluta. Blanditiis voluptatum sit ipsa incidunt.', 314.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(194, 'Sleek Leather Plate', '6833037603951', 'sleek-leather-plate', 'Molestiae ut voluptatem est quis rerum earum culpa. Possimus sed excepturi enim quam quia et vel quia.', 4766.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(195, 'Lightweight Plastic Knife', '0573490546186', 'lightweight-plastic-knife', 'Eius fugit nihil unde. Quasi non impedit nostrum vel id quia.', 980.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(196, 'Intelligent Silk Chair', '0765689339987', 'intelligent-silk-chair', 'Velit minima praesentium saepe ut dolorum. Magnam accusantium dolores quia exercitationem et adipisci ducimus.', 2190.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(197, 'Ergonomic Paper Shirt', '8040284914008', 'ergonomic-paper-shirt', 'Reiciendis ducimus doloribus facilis excepturi quod vel. Ex odio est id voluptatibus. Veniam natus cupiditate est et.', 4071.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(198, 'Intelligent Marble Lamp', '6630468256493', 'intelligent-marble-lamp', 'Inventore neque distinctio et. Laudantium sunt quo iste laudantium et dolorem eligendi.', 1810.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(199, 'Ergonomic Copper Hat', '8274091655285', 'ergonomic-copper-hat', 'Corrupti aliquam iusto pariatur ut beatae repudiandae. Quos unde necessitatibus cumque ea. Quasi quaerat molestiae praesentium quis veniam enim.', 1334.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(200, 'Lightweight Marble Shirt', '3913099004514', 'lightweight-marble-shirt', 'Fuga aut molestiae eos quisquam ut et eaque voluptatibus. Aut ut nemo voluptate ut quasi aut.', 2200.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(201, 'Practical Bronze Table', '6220217042738', 'practical-bronze-table', 'Enim temporibus quod ex rerum explicabo ipsum quia quia. Reiciendis enim repellat exercitationem repudiandae aliquam minima ut. Sit maiores velit expedita quasi cumque qui.', 3434.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(202, 'Lightweight Cotton Coat', '2228323494292', 'lightweight-cotton-coat', 'Deleniti et mollitia reiciendis ut. Fugiat expedita cupiditate reiciendis ut sed.', 874.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(203, 'Mediocre Concrete Clock', '9053373849524', 'mediocre-concrete-clock', 'Quos iusto quasi voluptas rerum et. Soluta iure et possimus praesentium est repudiandae libero est.', 4827.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(204, 'Lightweight Aluminum Wallet', '5060376118285', 'lightweight-aluminum-wallet', 'Doloremque non iusto natus mollitia ut est ratione. Voluptas officiis facere et iusto iure inventore. Numquam eius molestiae dolor molestiae cumque.', 1750.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(205, 'Aerodynamic Plastic Knife', '1441289946167', 'aerodynamic-plastic-knife', 'Non quia et sint quia expedita quae. Rem quia iure ab eaque sunt quia maxime sed.', 3478.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(206, 'Heavy Duty Aluminum Plate', '8376963932859', 'heavy-duty-aluminum-plate', 'Atque eligendi et est sapiente quia sed ab voluptas. Dolore ut qui soluta.', 929.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(207, 'Aerodynamic Plastic Coat', '8535739225018', 'aerodynamic-plastic-coat', 'Ratione explicabo voluptatum dolorem veritatis aut at architecto. Neque perspiciatis earum inventore.', 902.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(208, 'Lightweight Linen Shirt', '7270626445094', 'lightweight-linen-shirt', 'Repudiandae hic eum ut eos ut voluptatem. Culpa explicabo eligendi architecto perferendis.', 3562.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(209, 'Fantastic Marble Car', '6673410919114', 'fantastic-marble-car', 'Qui excepturi rerum nobis. In quaerat voluptatum corporis aut cupiditate. Cupiditate corporis quidem quos rerum omnis.', 3012.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(210, 'Synergistic Granite Shirt', '4288029477591', 'synergistic-granite-shirt', 'Dolorem perferendis voluptatibus facere qui aut architecto dolorum autem. Sint dolor sunt non.', 1544.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(211, 'Intelligent Linen Keyboard', '0603167209820', 'intelligent-linen-keyboard', 'Officiis culpa odit illo illo ex occaecati ut. Qui quo quo aut et similique sit.', 1381.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(212, 'Ergonomic Plastic Bottle', '0253669676615', 'ergonomic-plastic-bottle', 'Animi optio deleniti ut non. Veniam perspiciatis molestiae alias est iusto animi.', 1961.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(213, 'Incredible Rubber Coat', '0161697760445', 'incredible-rubber-coat', 'Qui fugit rerum corporis ut quis. Asperiores sed nulla voluptate pariatur id. Eos aspernatur qui voluptates sit.', 2639.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(214, 'Enormous Granite Wallet', '9543428261000', 'enormous-granite-wallet', 'Animi eligendi ea maxime praesentium nulla quis quos rerum. Qui dolores dolor reprehenderit fugit quas voluptatem doloremque dignissimos.', 2819.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(215, 'Rustic Paper Gloves', '2882512746397', 'rustic-paper-gloves', 'Et voluptatem sequi reiciendis natus et. Dolorem amet sed et sit distinctio dignissimos. Vitae aperiam voluptatem accusantium accusantium pariatur omnis.', 2865.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(216, 'Gorgeous Granite Chair', '2343784676121', 'gorgeous-granite-chair', 'Aut placeat eos nihil consequatur nobis quod aut explicabo. Quo optio ut sed inventore ipsam cum at.', 835.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(217, 'Enormous Wooden Plate', '7339989337665', 'enormous-wooden-plate', 'Quia molestiae ut aut assumenda. Dolores consequuntur dignissimos dolorum sit. Non atque facere dicta debitis optio facilis.', 4831.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(218, 'Mediocre Marble Plate', '9263024936064', 'mediocre-marble-plate', 'Quis voluptatem adipisci rem iure autem ut maiores. Saepe molestias asperiores alias praesentium voluptatem quia velit. Nihil inventore minima aliquid.', 2384.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(219, 'Ergonomic Concrete Watch', '4757775431916', 'ergonomic-concrete-watch', 'Repudiandae vero consequuntur ipsam et nihil. Accusamus commodi id officia. Velit hic nulla inventore voluptas.', 356.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(220, 'Enormous Copper Coat', '3062533841656', 'enormous-copper-coat', 'Vero iste possimus repellendus sunt. Rerum voluptas iste dolorum cum sit est aut aperiam.', 2640.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(221, 'Practical Iron Wallet', '7813660398416', 'practical-iron-wallet', 'At molestiae aperiam sed consequatur aut consequuntur sunt. Consequuntur hic nesciunt nam itaque eaque consequatur sit. Provident cupiditate consectetur cum qui dolore aspernatur voluptate amet.', 308.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(222, 'Fantastic Cotton Bench', '6230567441204', 'fantastic-cotton-bench', 'Quis totam pariatur accusamus quis corporis est. Dignissimos sint nesciunt eaque in. Sit deleniti maiores non in eum tempore.', 4310.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(223, 'Practical Linen Computer', '6099171008414', 'practical-linen-computer', 'Ratione fugiat quia similique et. Commodi laborum facilis sit porro eligendi similique ut vel.', 1973, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(224, 'Synergistic Marble Wallet', '6736417191737', 'synergistic-marble-wallet', 'Deserunt minima voluptatem nostrum doloribus. Et deleniti quia modi consequatur animi a et.', 1407.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(225, 'Awesome Linen Knife', '7420119703198', 'awesome-linen-knife', 'Odio libero atque ea. Excepturi aspernatur perferendis esse ea incidunt odio.', 783.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(226, 'Intelligent Paper Car', '5778077989461', 'intelligent-paper-car', 'Molestiae in ullam ea iste et. Esse amet pariatur magnam dolorem error consequuntur sit. Esse soluta voluptas amet repellat necessitatibus hic asperiores eum.', 940.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(227, 'Mediocre Cotton Bottle', '1708237557425', 'mediocre-cotton-bottle', 'Voluptas similique libero eius delectus. Illo beatae veritatis qui eaque. Ducimus nisi esse non id voluptatem.', 3852.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(228, 'Awesome Aluminum Knife', '4742624389067', 'awesome-aluminum-knife', 'Sint quaerat iure dicta perspiciatis alias et atque. In molestiae dolor eum enim.', 4041.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(229, 'Fantastic Linen Bench', '7556683581679', 'fantastic-linen-bench', 'Ad accusamus omnis eligendi quod molestiae consequatur aut. Unde ut porro qui.', 4889.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(230, 'Mediocre Copper Chair', '0103460822264', 'mediocre-copper-chair', 'Sunt ut et voluptas perferendis dolorum. Saepe vitae tenetur et ad temporibus consequuntur qui.', 4667.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(231, 'Intelligent Copper Bag', '3088404231234', 'intelligent-copper-bag', 'Odit quod officia placeat est qui in tempore. Odit quisquam illo consectetur libero autem consequuntur. Porro illo vel repellendus alias in adipisci est.', 4428.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(232, 'Gorgeous Leather Wallet', '6551215332355', 'gorgeous-leather-wallet', 'Occaecati non tempore vitae illum qui. Iste odit est quaerat minus voluptas.', 3597.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(233, 'Fantastic Linen Bag', '9301943424054', 'fantastic-linen-bag', 'Corporis velit a tenetur nostrum laborum quibusdam aut. At reprehenderit et impedit voluptatem voluptatum.', 1408.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(234, 'Lightweight Cotton Wallet', '0215955761672', 'lightweight-cotton-wallet', 'Aperiam temporibus aperiam recusandae labore qui ipsum. Mollitia nihil voluptate esse in quasi aut itaque blanditiis. Dolore et veritatis tenetur et delectus laboriosam.', 4394.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(235, 'Fantastic Iron Bottle', '7405373344875', 'fantastic-iron-bottle', 'Quos distinctio aut voluptas doloremque. Ut deserunt et non voluptas quod reiciendis reprehenderit et. Eum asperiores rem culpa.', 4409.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(236, 'Lightweight Marble Hat', '6555463448363', 'lightweight-marble-hat', 'Eum repudiandae dolore cupiditate voluptas quia veritatis similique voluptatum. Distinctio mollitia deleniti illum accusamus qui sunt. Omnis impedit ut maiores autem consequatur consequatur.', 748.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(237, 'Awesome Silk Shirt', '9256533932726', 'awesome-silk-shirt', 'Dolorum et omnis asperiores cupiditate ipsa id dolorum. Qui voluptas quia sed veritatis sit incidunt.', 2529, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(238, 'Intelligent Marble Bottle', '6974981894979', 'intelligent-marble-bottle', 'Officiis et ratione aut sint nihil harum. Occaecati a natus sapiente harum.', 4963.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(239, 'Small Marble Knife', '6570864676092', 'small-marble-knife', 'Hic adipisci at est sint tenetur harum enim tempora. Qui dolore vero animi vero.', 4675.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(240, 'Incredible Rubber Wallet', '6791803669061', 'incredible-rubber-wallet', 'Et quo a aut eveniet dolor. Quia est recusandae qui id ab.', 192.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(241, 'Awesome Cotton Clock', '6665348837110', 'awesome-cotton-clock', 'Laboriosam quia aliquam laboriosam tenetur perspiciatis. Animi debitis deleniti ducimus nesciunt ipsam enim ut.', 4862.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(242, 'Sleek Marble Computer', '2520642788961', 'sleek-marble-computer', 'Impedit in eum vel animi et magni et ut. Veritatis qui distinctio ea neque quo et et. Nisi animi qui aperiam cum voluptas similique nemo.', 4549.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(243, 'Gorgeous Marble Gloves', '0465028842184', 'gorgeous-marble-gloves', 'Sunt alias quia porro. Excepturi cupiditate eligendi nesciunt nulla omnis et ut nemo. Esse et enim et deleniti quasi mollitia.', 2586.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(244, 'Synergistic Wooden Coat', '4708268899492', 'synergistic-wooden-coat', 'Nostrum aut officiis est pariatur magni qui. Nihil alias nam eaque dolor expedita ipsa illo.', 273.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(245, 'Incredible Concrete Plate', '1728643875050', 'incredible-concrete-plate', 'Recusandae voluptatem qui fugiat vitae. Et facilis qui quia et commodi et. Sint voluptatum at sint.', 1403.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(246, 'Incredible Wool Plate', '6734743022459', 'incredible-wool-plate', 'Earum repellat voluptatum dolores impedit temporibus. Praesentium voluptatem ex doloribus qui blanditiis.', 2988.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(247, 'Lightweight Granite Pants', '6226287639847', 'lightweight-granite-pants', 'Nisi commodi recusandae praesentium officiis consequatur voluptates ex. Asperiores officia similique sint ut mollitia ea. In sed dignissimos dolor quas autem.', 2850.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(248, 'Gorgeous Plastic Watch', '7297820738098', 'gorgeous-plastic-watch', 'Ut eum aspernatur voluptatum. Qui quia vero eveniet aut eum et labore culpa. Voluptatem magnam quo nemo rerum.', 385.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(249, 'Enormous Linen Watch', '5425494147980', 'enormous-linen-watch', 'Doloremque pariatur et dolores quaerat vel soluta fugit. Et unde modi perferendis amet.', 110.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(250, 'Intelligent Plastic Shoes', '3930069611749', 'intelligent-plastic-shoes', 'Eos asperiores consequatur dolore velit quo. Non deleniti cupiditate laborum neque quod nihil. Dolorem nostrum dolorum aperiam voluptas rerum rerum.', 800.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(251, 'Incredible Paper Bag', '3733343416036', 'incredible-paper-bag', 'Quia quas explicabo ut quis. Consequatur incidunt qui occaecati.', 4196.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(252, 'Heavy Duty Bronze Table', '1565274255642', 'heavy-duty-bronze-table', 'Et repellat vitae molestias repellat fuga dolores. Cupiditate harum cumque necessitatibus aut debitis neque praesentium. Beatae recusandae officiis tenetur quo tempore dignissimos.', 2565.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(253, 'Intelligent Wooden Clock', '0865964207274', 'intelligent-wooden-clock', 'Blanditiis odit consectetur iure alias explicabo. Saepe cum aut facilis sed magnam ut exercitationem ut. Dolorum provident deleniti molestiae odit porro omnis.', 1932.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(254, 'Incredible Bronze Lamp', '4408099048570', 'incredible-bronze-lamp', 'Reiciendis animi neque et nulla illo. Enim id et ut vel. Non est excepturi ut non pariatur et.', 4688.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(255, 'Ergonomic Cotton Gloves', '1444475501355', 'ergonomic-cotton-gloves', 'Id laudantium a dolores nam quibusdam quas quis nam. Minus fuga voluptas dolor architecto qui velit et.', 677.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(256, 'Intelligent Wool Coat', '5618051610281', 'intelligent-wool-coat', 'Facere et rem laudantium qui veritatis. Eveniet voluptatem dicta velit cupiditate. Ut ex dolores maiores at facilis.', 732.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(257, 'Awesome Granite Watch', '7539799913961', 'awesome-granite-watch', 'Dolores voluptatem sint nisi ducimus quo. Dolore ea eius quaerat soluta. Consequatur harum molestiae saepe delectus accusantium.', 4406.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(258, 'Sleek Bronze Knife', '4624903829122', 'sleek-bronze-knife', 'Velit atque eos et ut et aliquid. Ut quis temporibus minima sapiente sint odio quos.', 2977.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(259, 'Ergonomic Copper Plate', '5027206265465', 'ergonomic-copper-plate', 'Quia sed aut accusamus. Mollitia doloremque dicta qui et autem perferendis.', 1205.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(260, 'Aerodynamic Granite Pants', '8191433752528', 'aerodynamic-granite-pants', 'Eos modi incidunt quia rerum qui mollitia. Eum ab architecto distinctio et enim voluptatibus. Sint voluptas delectus libero molestiae mollitia aut cum.', 4684.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(261, 'Sleek Steel Chair', '3776329264245', 'sleek-steel-chair', 'Aliquid quo fuga perspiciatis sed quia et. Et qui voluptas quam veniam fugit aut.', 1820.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(262, 'Incredible Granite Bag', '4379194808232', 'incredible-granite-bag', 'Et voluptas rerum rerum autem nam consequatur beatae. Ut quidem ducimus veritatis nulla et commodi voluptas. Repellendus aspernatur quas dolorem esse neque dolorum.', 2131.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(263, 'Small Wooden Plate', '8069174504006', 'small-wooden-plate', 'Sunt amet et enim cum dolorum. Perferendis necessitatibus ipsum molestias ut.', 2689.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(264, 'Durable Iron Table', '5163298609555', 'durable-iron-table', 'Veniam ut delectus voluptas tempore aut consequatur molestiae. Aut minus qui sed perspiciatis.', 4417.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(265, 'Synergistic Wool Shirt', '3735326738081', 'synergistic-wool-shirt', 'Natus nulla ducimus deleniti ea porro. Dicta ab corporis consequatur sunt et et. Dolores est sint praesentium et molestias laudantium ea.', 4162.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(266, 'Small Bronze Bench', '8882708562125', 'small-bronze-bench', 'Dolorem laudantium rerum quia deserunt voluptatem. Nulla doloremque voluptatem praesentium dolor voluptas. Omnis harum non aliquam.', 2638.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(267, 'Awesome Iron Coat', '8723574036290', 'awesome-iron-coat', 'Voluptatem qui non autem tempora ut tempora architecto. Quos rerum nemo sint explicabo asperiores ipsa ipsum. Debitis suscipit aut odio voluptates est.', 2368.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(268, 'Practical Silk Pants', '8181484170297', 'practical-silk-pants', 'Sint sapiente ipsum voluptatibus pariatur eaque aliquid. Ea dolorum excepturi aut autem nam saepe. Officiis ullam dignissimos accusamus et.', 1779.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(269, 'Synergistic Steel Car', '1359881963300', 'synergistic-steel-car', 'Vitae reprehenderit perferendis facere reprehenderit quo molestias modi. Molestias magnam possimus nam cumque dolore quis. Quia commodi rerum perferendis.', 3608.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(270, 'Practical Paper Computer', '2246979215191', 'practical-paper-computer', 'Itaque veniam minima molestiae occaecati. Nemo illo quidem sed aut. Perferendis nihil vel quibusdam veritatis iusto.', 2877.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(271, 'Practical Marble Clock', '9741216115720', 'practical-marble-clock', 'Molestiae aut reprehenderit eum exercitationem. Ducimus culpa libero vitae reprehenderit et dolorem. Et nulla delectus est dolor est ea fuga quis.', 4587.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(272, 'Fantastic Granite Bench', '7906372717221', 'fantastic-granite-bench', 'Qui a voluptatem eveniet et. Ut et veniam adipisci neque. Maiores doloribus qui hic voluptatem molestias ab cumque voluptas.', 2785.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(273, 'Enormous Linen Bottle', '2744381956263', 'enormous-linen-bottle', 'Quia et temporibus voluptatum earum esse et. Repellat eum exercitationem ullam quod molestias.', 1164.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(274, 'Mediocre Linen Keyboard', '3014355269446', 'mediocre-linen-keyboard', 'Doloribus quibusdam quaerat quia et sit. Et laborum totam qui tempore eius sit.', 715.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(275, 'Mediocre Aluminum Coat', '1684259027323', 'mediocre-aluminum-coat', 'Quibusdam libero voluptatem amet cumque consectetur. Aut tenetur consectetur quo et maiores aut.', 2978.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(276, 'Awesome Leather Clock', '3889692125973', 'awesome-leather-clock', 'Amet consectetur non fugit dolorem consectetur explicabo totam. Nihil perspiciatis et laboriosam.', 1082.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(277, 'Gorgeous Aluminum Knife', '3089311039708', 'gorgeous-aluminum-knife', 'Similique quaerat minus et deserunt. Molestiae officia veniam qui accusantium neque.', 671.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(278, 'Incredible Wool Car', '8024309545842', 'incredible-wool-car', 'Labore ut dolorem error voluptatum nemo dolor at qui. Similique quam quia sunt commodi.', 4290.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(279, 'Rustic Leather Computer', '4473293310082', 'rustic-leather-computer', 'Nesciunt et distinctio aperiam qui sint. Ab incidunt velit minus laborum voluptatem culpa labore illum. Veniam ab tenetur consectetur facilis ut.', 86.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(280, 'Lightweight Bronze Lamp', '9849687459920', 'lightweight-bronze-lamp', 'Non sed nam dolores et magnam voluptates. Omnis vel voluptatibus quaerat quidem voluptatibus.', 1642.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(281, 'Practical Silk Bench', '8807852314772', 'practical-silk-bench', 'Natus ipsum sit consequatur vero earum a placeat. Est ut sapiente voluptatem. Est ea eligendi eum magnam laudantium placeat voluptas.', 539.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(282, 'Rustic Aluminum Coat', '1549764965280', 'rustic-aluminum-coat', 'Alias repellat animi rerum enim amet dolorem ut. Recusandae voluptas eligendi nam sed eaque accusantium.', 3782.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(283, 'Fantastic Rubber Shoes', '4970095979078', 'fantastic-rubber-shoes', 'Vitae voluptatem quasi et. Maiores consequatur ad repellat. Nemo et dicta qui quos voluptas.', 2457.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(284, 'Sleek Rubber Car', '4350134006222', 'sleek-rubber-car', 'Excepturi iusto consequatur sit eveniet dicta numquam consequatur. Quia ut officia quo quis.', 3675.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(285, 'Heavy Duty Silk Keyboard', '7471321902435', 'heavy-duty-silk-keyboard', 'Quia non voluptatem dolorum vero quaerat quae nobis quo. Dolorum dignissimos quam nesciunt voluptatem ut commodi veritatis sed.', 3916, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(286, 'Awesome Concrete Pants', '0850057908367', 'awesome-concrete-pants', 'Dicta nulla nulla veritatis voluptatibus quia. Est blanditiis sed rerum excepturi.', 1495.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(287, 'Rustic Rubber Bag', '1197528332443', 'rustic-rubber-bag', 'Repellat repudiandae ut et commodi quia. Ratione vero quia porro inventore veniam.', 1633.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(288, 'Synergistic Iron Computer', '3455260434312', 'synergistic-iron-computer', 'Numquam voluptatibus nobis maxime molestias suscipit nulla eaque. Et quia expedita quisquam tempore distinctio.', 3386.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(289, 'Intelligent Wooden Bottle', '7056377459937', 'intelligent-wooden-bottle', 'Quia rerum fuga perspiciatis eos. Ullam iste aut est quasi. Unde explicabo labore voluptatem nisi magnam et.', 2662.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(290, 'Aerodynamic Wooden Gloves', '2688997842162', 'aerodynamic-wooden-gloves', 'Et voluptas aut nostrum ab soluta. Temporibus eius officiis esse earum voluptas.', 2359.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(291, 'Synergistic Paper Gloves', '2707356533913', 'synergistic-paper-gloves', 'Necessitatibus in voluptatem architecto aspernatur molestiae culpa. Ut ad non laborum voluptas.', 1233.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(292, 'Durable Steel Lamp', '0217678617700', 'durable-steel-lamp', 'Itaque quia expedita sit. Quia et aperiam porro et consequatur quaerat nobis.', 1909.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(293, 'Intelligent Iron Bottle', '7471115887498', 'intelligent-iron-bottle', 'Occaecati at qui totam repellendus est dignissimos. Labore natus nihil magnam aut quia perspiciatis. Cupiditate nam cumque adipisci labore consequatur.', 1738.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(294, 'Synergistic Leather Bench', '1499818948939', 'synergistic-leather-bench', 'Quasi sint illo officia in veniam. Quisquam voluptas eveniet voluptate et aut laboriosam. Et odit iste et totam quam.', 2796.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(295, 'Small Marble Plate', '6978846655217', 'small-marble-plate', 'Possimus assumenda voluptates libero ut. Minima minima architecto sed officia eos. Rerum quisquam praesentium facilis quos perspiciatis.', 1375.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(296, 'Ergonomic Paper Watch', '3595377988626', 'ergonomic-paper-watch', 'Libero impedit dolores temporibus voluptatem quam facilis aperiam. Quis exercitationem voluptas ab occaecati occaecati qui accusantium. Et aut aliquid voluptates sit eos sunt.', 4395.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(297, 'Ergonomic Plastic Car', '1255861235248', 'ergonomic-plastic-car', 'Quibusdam est in aut alias. Enim iste nulla est. Quis hic aut vitae ipsa qui.', 4864.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(298, 'Mediocre Silk Table', '4844896383016', 'mediocre-silk-table', 'Expedita illo corrupti commodi. Harum repudiandae a id sit at.', 675.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(299, 'Gorgeous Linen Wallet', '4405840928518', 'gorgeous-linen-wallet', 'Dicta facilis dolores et rerum et aliquam. Eaque blanditiis in autem et veniam molestiae quo. Qui perferendis recusandae impedit cumque assumenda eius.', 4507.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(300, 'Practical Steel Pants', '5711242545963', 'practical-steel-pants', 'Tempore qui commodi optio fugiat sit. In praesentium accusamus nemo qui optio.', 1293.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(301, 'Awesome Plastic Shirt', '6776511919905', 'awesome-plastic-shirt', 'Ea est distinctio incidunt nihil dolorem nisi. Est delectus quis fugit inventore ipsa. Eveniet veritatis aut unde voluptates quae aliquid.', 686.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(302, 'Ergonomic Steel Gloves', '6175669804451', 'ergonomic-steel-gloves', 'Voluptatem voluptas molestias occaecati tempore. Quas enim aperiam consequatur aut eligendi aperiam officia ad.', 4505.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(303, 'Gorgeous Cotton Bottle', '7454012796360', 'gorgeous-cotton-bottle', 'Vero ducimus dicta quia. Eveniet sit id rerum excepturi. Ratione totam corrupti voluptate rerum.', 99.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(304, 'Mediocre Plastic Computer', '9013673869325', 'mediocre-plastic-computer', 'Impedit iure omnis sit et. Soluta accusamus alias numquam amet aliquid. Blanditiis qui ea id earum.', 4316.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(305, 'Mediocre Iron Wallet', '1784692022449', 'mediocre-iron-wallet', 'Voluptas voluptatem nulla quia aut itaque et sunt. Dolorem ratione maiores fugiat omnis iure eius. Est libero aspernatur rerum architecto.', 513.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(306, 'Sleek Marble Pants', '5870294120747', 'sleek-marble-pants', 'Vitae sunt ipsa est id rerum aspernatur earum. Odit sequi numquam officiis mollitia consequuntur qui. Dignissimos ab amet dolorem quod.', 300.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(307, 'Heavy Duty Paper Table', '8083823157412', 'heavy-duty-paper-table', 'Enim in delectus consequatur molestiae fugit et aut. Molestiae fuga ipsum deleniti velit.', 130.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(308, 'Small Aluminum Pants', '1930893125216', 'small-aluminum-pants', 'Ea rerum voluptates eum quos architecto sint aut. Est itaque accusantium voluptatibus quod.', 3287.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(309, 'Enormous Granite Hat', '4974364841615', 'enormous-granite-hat', 'Voluptate provident non velit molestiae. Non voluptas facere inventore consequatur.', 3069.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(310, 'Incredible Copper Table', '6476291074961', 'incredible-copper-table', 'Saepe repudiandae sit quaerat quos. Sed deleniti ducimus nobis nemo ab ullam.', 4396.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(311, 'Ergonomic Bronze Coat', '9949601943044', 'ergonomic-bronze-coat', 'Saepe ut aut voluptatem quidem tempore. Inventore eos explicabo in cupiditate voluptatum.', 3149.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(312, 'Incredible Wool Computer', '3570882471634', 'incredible-wool-computer', 'Eos laudantium enim ducimus est sunt expedita. Consectetur numquam debitis ut velit quam sint aut autem. Qui aut aspernatur voluptatem alias eum.', 1185.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(313, 'Incredible Cotton Wallet', '1456712325426', 'incredible-cotton-wallet', 'Earum nihil voluptatem unde. Sint harum dignissimos quisquam sed ut ut. Voluptate sit saepe vitae nihil.', 157.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(314, 'Heavy Duty Paper Lamp', '7687698209965', 'heavy-duty-paper-lamp', 'Quasi voluptatem et pariatur nam itaque et dolore. In dolorum ratione sequi iusto et. Consequatur magnam aperiam qui asperiores impedit.', 2237.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(315, 'Small Wool Shirt', '1674400782287', 'small-wool-shirt', 'Voluptas voluptates repudiandae minus omnis. Commodi cumque quaerat sequi recusandae illum. Voluptatem ut placeat earum et molestiae molestiae vitae.', 4422.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(316, 'Awesome Steel Shoes', '5335625505476', 'awesome-steel-shoes', 'Accusantium quia earum consequuntur neque laboriosam consectetur. Qui dolorem et dignissimos blanditiis ipsam omnis commodi. Quod totam aut cum culpa.', 2242.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(317, 'Fantastic Silk Chair', '0133768123398', 'fantastic-silk-chair', 'Impedit voluptatem eligendi eligendi. Et dolor cupiditate ipsum rerum molestiae doloribus. Autem debitis impedit quia cum saepe ab.', 4276.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(318, 'Mediocre Aluminum Watch', '4021629145053', 'mediocre-aluminum-watch', 'Magnam maiores dolorum aut consequatur est nobis et labore. Voluptates totam consectetur omnis modi error ratione distinctio distinctio.', 1832.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(319, 'Enormous Steel Clock', '2426059254542', 'enormous-steel-clock', 'Cupiditate commodi accusantium molestias est odio qui culpa. Adipisci minima nostrum inventore provident eum sunt. Aut iure eaque officia voluptatem fugiat itaque.', 4831.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(320, 'Synergistic Marble Bag', '0814055679094', 'synergistic-marble-bag', 'Ut voluptatibus doloremque nulla ut doloribus provident veniam qui. Ex fuga laborum est non nam. Est deleniti ut ratione est accusamus quis voluptas.', 4449.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(321, 'Aerodynamic Copper Computer', '1008133529732', 'aerodynamic-copper-computer', 'Aut vel sed aut distinctio facere temporibus animi illum. Dolor esse est molestiae omnis.', 4185.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(322, 'Mediocre Granite Bench', '7220846612196', 'mediocre-granite-bench', 'Perspiciatis dicta qui dignissimos et facilis perferendis iusto. Molestias numquam architecto blanditiis sed sit consequuntur beatae sapiente.', 3019.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(323, 'Aerodynamic Marble Lamp', '6214171046635', 'aerodynamic-marble-lamp', 'Ut vitae consequatur consequatur et. Et occaecati accusantium non enim optio quos.', 1477.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(324, 'Lightweight Concrete Table', '9243396570585', 'lightweight-concrete-table', 'Et est et nostrum est nam labore amet. Facilis dolores asperiores modi et quam.', 3923.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(325, 'Sleek Bronze Bag', '8362972548990', 'sleek-bronze-bag', 'Recusandae quaerat qui dolor eligendi nesciunt. Fugiat consequatur magni aliquam est. Beatae sunt aspernatur est libero maxime.', 3823.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(326, 'Small Concrete Shoes', '3601731833669', 'small-concrete-shoes', 'Ut id sed voluptates vero quae delectus dolorum et. Consectetur recusandae voluptatem dolorem dolorum. Sed laboriosam non quis hic ea.', 2044.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(327, 'Aerodynamic Granite Watch', '7247011242811', 'aerodynamic-granite-watch', 'Consequatur in qui omnis et. Voluptates repellendus id sunt magnam rem dolor. Corporis quia nam iure recusandae maiores modi porro.', 2722.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(328, 'Intelligent Granite Clock', '5520859310198', 'intelligent-granite-clock', 'A accusamus magnam explicabo ea. Totam ducimus qui doloribus dignissimos aut aut tempore. Sit non beatae rem quibusdam dolores optio.', 1334.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(329, 'Rustic Wooden Lamp', '3262393727460', 'rustic-wooden-lamp', 'Molestiae perspiciatis quasi sint magnam. Soluta dolorem soluta sed modi nemo laudantium quasi.', 739.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(330, 'Practical Marble Table', '7065137518951', 'practical-marble-table', 'Quidem ut non adipisci harum ducimus possimus. Et ut provident sed ex.', 4619.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(331, 'Lightweight Paper Wallet', '8004212035890', 'lightweight-paper-wallet', 'Facere dolore in eligendi eligendi quisquam adipisci. Voluptatem molestiae rerum eum velit cumque. Repudiandae quae et itaque praesentium aut atque vero.', 3945.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(332, 'Enormous Concrete Bag', '4033991444733', 'enormous-concrete-bag', 'Autem aut itaque et omnis sint. Deserunt est ratione dolor autem sint dolore.', 4779.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(333, 'Awesome Bronze Watch', '2340377305086', 'awesome-bronze-watch', 'Perferendis sunt eos quo non. Voluptatem deserunt quo quos doloribus.', 4864.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(334, 'Intelligent Concrete Computer', '3583525067507', 'intelligent-concrete-computer', 'Recusandae culpa voluptatem velit molestiae exercitationem nihil ut. Similique iure iusto sit labore recusandae et rerum ut. Ex veritatis voluptas quasi nihil debitis accusantium aut.', 2256.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(335, 'Enormous Leather Hat', '4325175592607', 'enormous-leather-hat', 'Magnam odit accusantium ducimus modi eligendi et. Temporibus sint facilis eligendi modi iure maxime officia. Praesentium at fugiat iure blanditiis.', 3187.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(336, 'Lightweight Paper Computer', '0800502030037', 'lightweight-paper-computer', 'Vel animi in magni. Dicta omnis iure eos voluptatum. Velit consequuntur possimus sunt et aut.', 1158.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(337, 'Durable Marble Car', '4755630965217', 'durable-marble-car', 'Sed sed eos sunt sed architecto dignissimos. Minima aspernatur officia et incidunt quas recusandae voluptatibus. Laboriosam et exercitationem quae nesciunt odit natus.', 4619.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(338, 'Mediocre Linen Gloves', '3235266659410', 'mediocre-linen-gloves', 'Id repellat voluptatem voluptas libero sint laborum. Impedit velit soluta molestiae quibusdam delectus recusandae. Rerum officiis dolor asperiores at dolore officiis dolor.', 607.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(339, 'Enormous Copper Lamp', '0422403602313', 'enormous-copper-lamp', 'Distinctio aperiam voluptatem accusantium et a. Unde debitis vel in perferendis libero.', 4770.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(340, 'Sleek Aluminum Bottle', '7046028324424', 'sleek-aluminum-bottle', 'A aliquam veritatis et sit cum totam. Odio vero explicabo culpa. Illum aperiam ut aliquam aut labore.', 1352.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(341, 'Gorgeous Cotton Keyboard', '9074136292623', 'gorgeous-cotton-keyboard', 'Temporibus sed et ut autem placeat quisquam et. Vel ipsa dolore et nulla perferendis rem. Et nostrum consectetur quo enim consequatur.', 639.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(342, 'Mediocre Marble Coat', '1801350915391', 'mediocre-marble-coat', 'Minima fugiat similique repellat ut pariatur ut aut soluta. Explicabo voluptate quia maxime vero ut repellat. Accusamus qui cum dolor excepturi fugiat id molestiae.', 4896.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(343, 'Awesome Aluminum Hat', '5860142767095', 'awesome-aluminum-hat', 'Rerum aut harum beatae quo eaque similique. Repellendus voluptate ex ut. Et aut expedita voluptatem omnis est optio error.', 1234.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(344, 'Small Granite Wallet', '6769581317382', 'small-granite-wallet', 'Debitis quia reprehenderit cumque commodi et perspiciatis. Numquam ipsam quibusdam nihil sunt quam voluptatem esse.', 748.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(345, 'Fantastic Paper Coat', '7886913813325', 'fantastic-paper-coat', 'Unde dolor impedit est dicta laborum veniam aliquid. Nisi et possimus vitae explicabo.', 599.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(346, 'Sleek Granite Computer', '1845989743741', 'sleek-granite-computer', 'Quas recusandae recusandae modi aut sapiente hic. Amet qui tenetur aut iusto modi.', 452.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(347, 'Aerodynamic Wool Plate', '3625596231668', 'aerodynamic-wool-plate', 'Tenetur alias quasi iure dolores veniam. Non itaque cupiditate ipsam. Explicabo qui velit dolore ut.', 3236.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(348, 'Incredible Copper Shirt', '2353700931531', 'incredible-copper-shirt', 'Et laudantium et quaerat. Et officiis eaque eaque amet velit animi sit. Quod voluptas maxime sed et quis quasi corrupti.', 4569.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(349, 'Enormous Bronze Bottle', '3789357109105', 'enormous-bronze-bottle', 'Deleniti beatae fugiat temporibus et quia corporis. Sapiente laborum quaerat consequatur. Ut dolor porro ut neque ea.', 2877.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(350, 'Enormous Iron Bag', '2647020167566', 'enormous-iron-bag', 'Dolores quas nihil magni. Rem sit laudantium omnis placeat quidem voluptate qui. Eum eum assumenda excepturi repellendus sed.', 3827.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(351, 'Durable Marble Lamp', '1536870698782', 'durable-marble-lamp', 'Assumenda neque eligendi id provident ut. Ut nesciunt iste et.', 572.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(352, 'Synergistic Steel Bottle', '4187761460437', 'synergistic-steel-bottle', 'Perferendis dolores modi praesentium laudantium magni in. Voluptas rerum sapiente ut velit voluptates nulla sed. Enim laborum error earum corrupti ut.', 2555.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(353, 'Mediocre Concrete Pants', '4337625553281', 'mediocre-concrete-pants', 'Iure soluta tempora iure ut. Debitis qui culpa quis aut ad itaque.', 2938.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(354, 'Small Copper Plate', '8355704620552', 'small-copper-plate', 'Ipsam quaerat aut qui qui necessitatibus sapiente molestiae. Qui est autem autem sapiente consectetur eum. Voluptatibus est unde libero odit qui.', 2260.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(355, 'Awesome Silk Coat', '8627050764465', 'awesome-silk-coat', 'Cupiditate dolorum rerum consectetur dolores adipisci. Voluptate praesentium provident dolorem qui excepturi. Placeat nobis fugit ipsa enim sed.', 4351.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(356, 'Enormous Cotton Watch', '9873990217045', 'enormous-cotton-watch', 'Sapiente sint itaque rem qui qui impedit. Ullam ab quos ut eum molestiae aliquam laboriosam.', 2159.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(357, 'Lightweight Linen Keyboard', '4567445820397', 'lightweight-linen-keyboard', 'Et aliquid veniam atque omnis adipisci tenetur aut. Ducimus libero ut nostrum voluptas velit velit aut. Impedit delectus voluptatem sint facere est ut.', 4418.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(358, 'Enormous Bronze Plate', '6479002443476', 'enormous-bronze-plate', 'Ut dolore eum maxime. Aut natus et numquam recusandae est temporibus. Quisquam et odit odio provident.', 1712.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(359, 'Lightweight Leather Computer', '1741059224472', 'lightweight-leather-computer', 'Ab explicabo qui repudiandae voluptatem ratione rem quaerat. Ullam porro nostrum quis vitae illo.', 4296.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(360, 'Awesome Bronze Hat', '2974947647810', 'awesome-bronze-hat', 'Et quae distinctio nemo odit deserunt ducimus sint. Totam culpa rem deserunt aut fuga porro.', 4565.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(361, 'Practical Wool Pants', '3911011038371', 'practical-wool-pants', 'Voluptates nam expedita illo consectetur exercitationem. Tempore animi illo laboriosam reiciendis ipsa nulla nam nesciunt. Aut dolor commodi deleniti accusamus ut.', 1534.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(362, 'Intelligent Linen Shirt', '0669267037589', 'intelligent-linen-shirt', 'Aut non qui alias consequatur voluptatem eligendi omnis. Voluptate laborum similique dolorem aut illo perferendis temporibus. Pariatur repellat accusamus ipsam.', 2276.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(363, 'Lightweight Paper Pants', '5802584564757', 'lightweight-paper-pants', 'Quo labore quia consequatur magni facilis. Consectetur eveniet laborum consequuntur.', 3330.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(364, 'Mediocre Leather Lamp', '9244391298702', 'mediocre-leather-lamp', 'Possimus in tempore quia neque voluptatum molestias numquam. In vel aliquam placeat autem maiores. Laboriosam aut dolor totam voluptas quia.', 2195.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(365, 'Gorgeous Wooden Lamp', '7573497571986', 'gorgeous-wooden-lamp', 'Qui quis tempore voluptatem et. Voluptas quia perferendis nemo sit nihil dolor. Quisquam quaerat numquam quia minus explicabo non tenetur et.', 3617.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(366, 'Lightweight Cotton Bench', '1526506257407', 'lightweight-cotton-bench', 'Ipsum tempora quo quas dolore repellat sint. Inventore illo iusto vel et tempora quia.', 4059.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(367, 'Practical Leather Plate', '1287870116522', 'practical-leather-plate', 'Nihil modi reprehenderit saepe expedita aut ut. Qui perferendis maxime molestiae illum veritatis.', 3783.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(368, 'Mediocre Aluminum Bench', '4724842874815', 'mediocre-aluminum-bench', 'Deleniti et odit quas assumenda a sed ipsa nulla. Quis quaerat ratione animi facere qui sit.', 2332.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(369, 'Lightweight Copper Car', '5231723820254', 'lightweight-copper-car', 'Accusamus harum aperiam nesciunt alias. Officia maiores iste accusamus. Velit rem sequi quia ut aut.', 2533.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(370, 'Enormous Wooden Keyboard', '9112674136143', 'enormous-wooden-keyboard', 'Omnis eos doloremque tempora dolorem aut consequatur. Possimus magni nemo est et.', 2382.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(371, 'Awesome Wooden Watch', '4917314416150', 'awesome-wooden-watch', 'Itaque sint iste est perspiciatis itaque. Inventore amet ratione ut voluptatum voluptas labore iste alias. Quo dicta quia a sit.', 1481.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(372, 'Fantastic Granite Keyboard', '4984594758546', 'fantastic-granite-keyboard', 'Consequuntur asperiores rem ipsum accusamus sunt accusantium excepturi earum. Autem accusantium voluptatem a ad.', 2131.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(373, 'Heavy Duty Wool Coat', '5997983338365', 'heavy-duty-wool-coat', 'Ea magni sunt non ea. Voluptas sit dolore iusto et iusto consectetur. Ipsum qui dolorem molestias quis accusamus saepe dolorem.', 1143.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(374, 'Lightweight Aluminum Chair', '5430458454233', 'lightweight-aluminum-chair', 'Neque architecto corrupti a dolores. Dolore nisi excepturi at laboriosam voluptas eum. Libero blanditiis nihil dolore.', 2912.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(375, 'Intelligent Rubber Clock', '2061744325949', 'intelligent-rubber-clock', 'Autem eos et dolores accusamus delectus. Quam rerum quod ab aut est.', 1452.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(376, 'Awesome Bronze Shoes', '8455702111738', 'awesome-bronze-shoes', 'Similique asperiores inventore deleniti. Est eos non vero iste. Perferendis rerum sed laboriosam vel necessitatibus recusandae.', 3961.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(377, 'Durable Leather Pants', '5577629260900', 'durable-leather-pants', 'Et cum voluptatum velit ipsam. Totam explicabo at ut nisi autem recusandae voluptatum. Amet asperiores quia ipsa aperiam nihil voluptatem.', 1564, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(378, 'Ergonomic Steel Pants', '2289194973453', 'ergonomic-steel-pants', 'Velit deserunt amet facilis voluptas culpa est. Et iure distinctio sit ipsam velit fuga quo inventore.', 4607.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(379, 'Intelligent Wooden Hat', '7618890137039', 'intelligent-wooden-hat', 'Molestias facilis blanditiis cumque. Voluptatem neque eaque qui enim earum facilis. Eius accusamus autem sed id excepturi illo temporibus quis.', 1808.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(380, 'Rustic Granite Chair', '5622923530546', 'rustic-granite-chair', 'Minus nobis saepe aut. Libero illo ab minima voluptas ut. Occaecati iure ab quidem qui dolores itaque.', 1998.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(381, 'Aerodynamic Cotton Shoes', '1214879614452', 'aerodynamic-cotton-shoes', 'Perferendis in ratione doloremque nesciunt. Aliquid et quia repellendus et.', 4737.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(382, 'Aerodynamic Linen Clock', '4486110118945', 'aerodynamic-linen-clock', 'Tenetur vel sit aliquid ipsa ad aut iste. Ad repellendus enim nam eius nam cumque ut.', 4199.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(383, 'Gorgeous Linen Table', '6991407688196', 'gorgeous-linen-table', 'Voluptas eius nulla modi ullam voluptatem quidem. Et ut consequatur in mollitia molestiae amet adipisci. Velit officia veritatis quia sunt qui.', 1043.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(384, 'Fantastic Copper Gloves', '2541604732648', 'fantastic-copper-gloves', 'In minus labore odio qui perferendis quisquam ut. Ea omnis blanditiis voluptas ratione accusantium dolorem.', 2771.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(385, 'Ergonomic Aluminum Car', '8059615360537', 'ergonomic-aluminum-car', 'Dignissimos quis architecto tenetur consequatur ipsum ex. Tempora eveniet et libero quibusdam nisi aut aliquid.', 3883.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(386, 'Awesome Iron Hat', '2394668698418', 'awesome-iron-hat', 'Amet sit et aut omnis tempore et. Aspernatur enim sit qui unde.', 3144.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(387, 'Intelligent Copper Bench', '6549666034751', 'intelligent-copper-bench', 'Dolorum sed voluptatibus ut ex nisi. Illo velit molestiae illum nulla quaerat.', 3879.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(388, 'Durable Concrete Watch', '0168330099122', 'durable-concrete-watch', 'At deserunt non temporibus sed eligendi. Cupiditate exercitationem non dolor.', 3534.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(389, 'Ergonomic Leather Computer', '2314088581084', 'ergonomic-leather-computer', 'Vel velit sint voluptatum expedita laboriosam quisquam. Autem quo ullam quo expedita laudantium vel voluptatem. Voluptas fugiat error magnam velit aut consequatur.', 3297.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(390, 'Synergistic Linen Table', '1238917556788', 'synergistic-linen-table', 'Voluptatem reiciendis dolor quaerat repellat vitae quas sit quas. Omnis maiores at quis commodi.', 4834.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(391, 'Practical Aluminum Keyboard', '8685598021075', 'practical-aluminum-keyboard', 'Enim rerum nihil iure rerum dicta voluptas et delectus. Sunt distinctio repellat distinctio quasi est et harum velit.', 2750.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(392, 'Incredible Silk Watch', '2784321374122', 'incredible-silk-watch', 'Et quis quo architecto voluptates. Et rerum dolores alias aut placeat ipsa. Voluptate quasi repellendus maiores doloribus veritatis.', 4887.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(393, 'Fantastic Paper Bench', '1462839821604', 'fantastic-paper-bench', 'Omnis odio enim ex quo temporibus vitae aut. Beatae vero ea dolore deleniti unde.', 1358.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(394, 'Lightweight Wooden Watch', '2831037318046', 'lightweight-wooden-watch', 'A dolores id et ipsam tempora incidunt. Numquam mollitia minima eum blanditiis.', 4296.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(395, 'Enormous Iron Car', '7171602867872', 'enormous-iron-car', 'Et fugiat veritatis tenetur dolor voluptatibus aut nihil non. Consequatur vero aut ducimus maiores dolor. Praesentium aliquid sed fugit cumque.', 4365.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(396, 'Lightweight Wooden Coat', '1311907302029', 'lightweight-wooden-coat', 'Recusandae sit sit qui eos dolorum adipisci vel. Sit commodi at eaque.', 1176.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(397, 'Aerodynamic Leather Pants', '0156791663228', 'aerodynamic-leather-pants', 'Sit nam et et qui. Alias cum quo asperiores eligendi pariatur nihil repudiandae. Quo sed ex facilis temporibus.', 1573.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(398, 'Lightweight Aluminum Knife', '8049100232869', 'lightweight-aluminum-knife', 'Minus reprehenderit eveniet voluptas quidem eum aspernatur. Adipisci corporis quia omnis ipsum.', 187.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(399, 'Mediocre Aluminum Gloves', '3015570798469', 'mediocre-aluminum-gloves', 'Sed est corporis aliquid atque illum illo alias. Illo sed repellat dolorem aut atque voluptas aliquam voluptatum. Deleniti harum id temporibus atque facilis.', 1227.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(400, 'Rustic Plastic Computer', '5799418760068', 'rustic-plastic-computer', 'Quas officiis debitis facere consequuntur aperiam et consequatur. Eligendi et et exercitationem dolor.', 855.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(401, 'Mediocre Marble Shoes', '8671563320977', 'mediocre-marble-shoes', 'Est fugiat molestiae a atque id autem. Qui dolorem aliquam quia libero facilis quisquam.', 2699.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(402, 'Mediocre Leather Chair', '1829369767329', 'mediocre-leather-chair', 'Rerum sunt animi perspiciatis culpa. Earum harum omnis quasi rerum dignissimos eveniet.', 1094.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(403, 'Enormous Copper Pants', '6162065768838', 'enormous-copper-pants', 'Facilis eum modi possimus provident velit. Maiores tempora iure a. Similique recusandae exercitationem eos et aut labore.', 2797.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(404, 'Enormous Marble Shoes', '5277002695786', 'enormous-marble-shoes', 'Animi pariatur ipsa velit eos reprehenderit amet quod. Sit soluta qui neque sit.', 2193.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(405, 'Aerodynamic Bronze Bottle', '2577690087676', 'aerodynamic-bronze-bottle', 'Dignissimos et provident aut labore soluta. Odio ex autem ad commodi.', 1200.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(406, 'Heavy Duty Silk Bottle', '1450956629364', 'heavy-duty-silk-bottle', 'Voluptatum molestiae quidem neque nesciunt odit et. Cumque labore consequuntur facilis vel.', 3264.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(407, 'Mediocre Wooden Knife', '4743356324104', 'mediocre-wooden-knife', 'Cumque aspernatur amet sequi rerum dolores eaque unde. Eos et quisquam nemo delectus.', 3667.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(408, 'Incredible Plastic Shirt', '2590831085409', 'incredible-plastic-shirt', 'Accusantium veniam adipisci et est repellat numquam eos. Quidem dolorem est voluptas.', 339.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(409, 'Incredible Linen Bottle', '1308981183064', 'incredible-linen-bottle', 'Repellendus laboriosam dolorem officia et. Non rerum dolorum temporibus voluptates vitae sapiente.', 2402.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(410, 'Enormous Cotton Hat', '9097444774537', 'enormous-cotton-hat', 'Sequi ut ea voluptatum id voluptate rerum. Nihil accusamus qui nihil aliquid illo.', 4033.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(411, 'Awesome Wooden Table', '1052624136251', 'awesome-wooden-table', 'Sequi quasi occaecati quibusdam unde est eos ea. Tempore minus qui qui commodi possimus. Est consequatur fuga aut est labore.', 2154.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(412, 'Aerodynamic Aluminum Hat', '9608482403152', 'aerodynamic-aluminum-hat', 'In iusto nesciunt sunt sint. Iusto accusamus recusandae dolore distinctio. Facilis facere qui tempore quo libero esse.', 3624.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(413, 'Heavy Duty Marble Computer', '5216347427188', 'heavy-duty-marble-computer', 'Officia enim omnis ab quo suscipit doloremque vel. Consequuntur laudantium ut sed autem commodi ea inventore.', 2006.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(414, 'Aerodynamic Bronze Gloves', '4865149667431', 'aerodynamic-bronze-gloves', 'Omnis est aliquam sit sit velit nam. Sit et pariatur natus cupiditate consequuntur. Qui accusantium iste commodi occaecati aspernatur quis non.', 394.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(415, 'Intelligent Copper Wallet', '9128979661778', 'intelligent-copper-wallet', 'Vero nobis repudiandae autem suscipit. Vel est quia qui rerum maiores dolorum voluptatem. Ipsum mollitia molestiae fugit qui.', 3629.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(416, 'Practical Cotton Computer', '5991117582501', 'practical-cotton-computer', 'Quisquam et et aut libero. Dolorem libero nesciunt ullam maiores.', 1592.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(417, 'Enormous Rubber Keyboard', '2690672891174', 'enormous-rubber-keyboard', 'Tenetur magni distinctio nihil ut. Ut adipisci dolor qui.', 3264.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(418, 'Fantastic Steel Gloves', '1499519737603', 'fantastic-steel-gloves', 'Fugiat dolore voluptatem non sequi et occaecati. A eius explicabo et voluptatum voluptatem pariatur. Ut molestiae aut dolorem eius.', 1460.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(419, 'Intelligent Wool Wallet', '2738705816609', 'intelligent-wool-wallet', 'Itaque voluptas praesentium omnis vitae sed ratione. Voluptas consequatur velit porro voluptatem ut. Officiis quos quisquam ut minus accusantium odit sed.', 135.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(420, 'Aerodynamic Rubber Clock', '7285423758698', 'aerodynamic-rubber-clock', 'Voluptatibus quis esse expedita ut fugiat et. Odit distinctio architecto inventore. Esse autem dolorem nobis quia.', 2329.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(421, 'Lightweight Silk Plate', '2478847733739', 'lightweight-silk-plate', 'Et doloremque veniam enim amet cumque. Est illum nulla facilis culpa nihil necessitatibus ut. Nulla vitae culpa quos modi blanditiis sit.', 3029.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(422, 'Intelligent Aluminum Shoes', '8793593638034', 'intelligent-aluminum-shoes', 'Est nulla sunt qui et rerum minus facere. Asperiores consequuntur sapiente maiores ea. Dolores laudantium voluptas sed et neque a harum.', 3089.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(423, 'Sleek Rubber Shoes', '2068389938466', 'sleek-rubber-shoes', 'Molestias culpa accusamus necessitatibus maxime perferendis. Officiis quas distinctio velit vitae. Eos temporibus voluptas veritatis nisi laudantium quo iure.', 318.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(424, 'Ergonomic Marble Wallet', '2136819389352', 'ergonomic-marble-wallet', 'Voluptate qui placeat cum ratione voluptates quia. Assumenda alias dignissimos ipsam aut suscipit.', 339.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(425, 'Heavy Duty Plastic Table', '3326565766746', 'heavy-duty-plastic-table', 'Deserunt nostrum impedit reiciendis enim voluptatem dolore et. Labore nam quas at molestiae nesciunt velit.', 4760.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(426, 'Small Marble Watch', '0799411796106', 'small-marble-watch', 'Eum quasi nulla et qui ratione fuga. Aspernatur non minus qui laborum explicabo et in. Cum architecto repudiandae magnam eos voluptatibus.', 969.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(427, 'Small Paper Hat', '9430155080878', 'small-paper-hat', 'Praesentium explicabo saepe magni expedita. Dolore sed repellat quia in qui.', 225.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(428, 'Enormous Cotton Lamp', '2690847485795', 'enormous-cotton-lamp', 'Nostrum atque modi amet magni delectus nihil est. Corporis quisquam aperiam magnam enim autem eveniet quaerat. Earum natus adipisci quis voluptas.', 303.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(429, 'Practical Steel Shoes', '4000504567111', 'practical-steel-shoes', 'Blanditiis nostrum laborum voluptatibus. Dolor ut voluptas voluptatem et eaque.', 1370.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(430, 'Incredible Steel Plate', '2455760938434', 'incredible-steel-plate', 'Incidunt est nobis nihil autem. Rerum porro consequatur consequatur quam omnis qui qui dicta.', 1485.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(431, 'Gorgeous Wooden Clock', '0773973859547', 'gorgeous-wooden-clock', 'Quidem sunt et facilis ut at exercitationem. Illo quia voluptatem dignissimos aut voluptas impedit. Voluptas ea aliquam molestias iste.', 2407.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(432, 'Small Leather Bottle', '0884243650709', 'small-leather-bottle', 'Aut sapiente possimus quis veniam. In sequi mollitia nihil temporibus esse.', 1402.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(433, 'Heavy Duty Bronze Hat', '1104593322279', 'heavy-duty-bronze-hat', 'Nisi aut doloremque minima ipsam provident. In itaque pariatur est perspiciatis et.', 3545.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(434, 'Mediocre Leather Wallet', '4968786113450', 'mediocre-leather-wallet', 'Eveniet aut facilis ab earum. Iusto suscipit ea fugiat nostrum harum consequatur repellendus.', 2924.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(435, 'Heavy Duty Silk Bench', '7362847583973', 'heavy-duty-silk-bench', 'Nisi esse numquam corporis est unde laborum. Excepturi nobis blanditiis magni dicta autem. Facilis aut ut voluptatem ut recusandae.', 3095.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(436, 'Ergonomic Rubber Bench', '9477877606979', 'ergonomic-rubber-bench', 'Eveniet ut repellat quidem id aut atque fugiat. Id aut dolores omnis consequatur mollitia. Nobis corporis atque sint provident.', 1916.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(437, 'Awesome Granite Plate', '0383012980196', 'awesome-granite-plate', 'Quia beatae quasi blanditiis exercitationem est repudiandae. Occaecati omnis unde sint numquam sed ipsam. Quo pariatur illum eos sit nisi.', 562.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(438, 'Practical Leather Bag', '0100272815026', 'practical-leather-bag', 'Totam et accusamus culpa reiciendis incidunt magnam animi. In omnis unde repellendus.', 3047.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(439, 'Synergistic Granite Chair', '0890271615153', 'synergistic-granite-chair', 'Sint quis voluptate corporis omnis expedita. Aut saepe dolores facere pariatur rerum. Dolorem voluptates modi aspernatur adipisci ipsum quae aut.', 3599.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(440, 'Fantastic Marble Knife', '1894570757223', 'fantastic-marble-knife', 'Tempore laborum qui aut ut assumenda in hic. Sequi eos aut sint esse quia quia. Inventore suscipit eos ea doloribus sapiente dolores qui.', 3950.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(441, 'Lightweight Leather Pants', '0408185391447', 'lightweight-leather-pants', 'Veritatis praesentium optio maiores exercitationem nihil dolorem. Impedit eveniet aut quam quo. Esse soluta aut nesciunt cupiditate ipsa.', 3172.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(442, 'Incredible Concrete Pants', '7629115760246', 'incredible-concrete-pants', 'Eos commodi consequatur dolores. Recusandae aut quia sint qui corporis autem. Et sint cumque autem id impedit.', 1807.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(443, 'Enormous Marble Table', '5958879744677', 'enormous-marble-table', 'Earum harum inventore et voluptate fuga ea consequatur. Incidunt tenetur excepturi non nesciunt aut beatae voluptatum.', 3752.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(444, 'Awesome Aluminum Bag', '3880524084406', 'awesome-aluminum-bag', 'Iure et ut dolorem esse incidunt quo mollitia praesentium. Quia voluptatem saepe velit est aut qui asperiores ut.', 3374.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(445, 'Practical Copper Gloves', '8624452650877', 'practical-copper-gloves', 'Qui omnis quis neque porro. Ad sed corporis aliquam sit aut enim quibusdam. Odio dolores quasi qui suscipit vero.', 3904.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(446, 'Practical Leather Keyboard', '8194737124947', 'practical-leather-keyboard', 'Illum quisquam exercitationem odio rem. Facere fugit reiciendis voluptas impedit totam quia labore quaerat. Adipisci dolores quia dolorum incidunt.', 3767.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(447, 'Durable Marble Gloves', '9372320607018', 'durable-marble-gloves', 'Ratione voluptas deleniti reprehenderit perspiciatis animi. Sed velit labore magni ea assumenda eum. Impedit sit voluptatum commodi consequatur modi.', 23.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(448, 'Durable Rubber Hat', '1959255225708', 'durable-rubber-hat', 'Laborum sint et ad commodi voluptatibus ducimus maxime. Corrupti sint in a. Sit beatae eveniet veritatis laborum.', 221.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(449, 'Enormous Wool Shoes', '0492322747426', 'enormous-wool-shoes', 'Reprehenderit fugiat id quidem et. Totam quos aliquam sit harum voluptatum.', 4384.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(450, 'Awesome Marble Table', '2689735763985', 'awesome-marble-table', 'Et commodi harum ut numquam voluptatem. Suscipit magni accusantium et beatae sint fuga nisi nihil. In quam occaecati consequatur consequatur culpa quo quidem.', 3848.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(451, 'Mediocre Bronze Shirt', '7935240125967', 'mediocre-bronze-shirt', 'Optio eius qui autem dicta dolores id recusandae sint. Quae pariatur magni voluptatem nobis.', 4373.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(452, 'Rustic Iron Shirt', '0474626891043', 'rustic-iron-shirt', 'Eum exercitationem voluptas facere molestiae debitis. Labore iste porro iusto debitis pariatur neque repellat.', 364.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(453, 'Practical Iron Bag', '9307547409893', 'practical-iron-bag', 'Non sed voluptatibus blanditiis dolores molestiae. Sit mollitia suscipit voluptas at quas in soluta et. Quia officiis dicta deserunt iste tempora quaerat.', 786.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(454, 'Enormous Iron Knife', '5148597006847', 'enormous-iron-knife', 'Numquam omnis dolore dolor iste similique. Et ut totam accusantium autem.', 2594.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(455, 'Sleek Concrete Bag', '1984827174788', 'sleek-concrete-bag', 'Nihil assumenda numquam eum eos rerum. Libero magnam ipsum architecto accusantium corporis voluptatem.', 4372, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(456, 'Small Concrete Computer', '5637039595013', 'small-concrete-computer', 'Soluta blanditiis et ab nemo quidem incidunt reprehenderit dignissimos. Aut dignissimos voluptatem quidem qui autem rerum sed.', 767.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(457, 'Awesome Marble Watch', '0208916947178', 'awesome-marble-watch', 'Quod adipisci voluptates ut amet illum sint maiores et. Iusto molestias pariatur neque eaque dignissimos. Iure harum necessitatibus corrupti culpa.', 2105.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(458, 'Heavy Duty Bronze Clock', '6121598628484', 'heavy-duty-bronze-clock', 'Nemo atque expedita necessitatibus dignissimos asperiores dolorem quasi. Cumque rerum ipsum officiis soluta eum. Consequuntur corrupti quia enim est.', 3390.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(459, 'Heavy Duty Plastic Chair', '9469323076689', 'heavy-duty-plastic-chair', 'Voluptatibus ipsa similique dolor ad commodi rerum recusandae. Assumenda occaecati minima accusantium consequatur hic.', 2556.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(460, 'Synergistic Linen Shoes', '1185639106770', 'synergistic-linen-shoes', 'Impedit id qui natus sit et. Et in quo commodi eaque dolorum expedita mollitia vero.', 4654.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(461, 'Gorgeous Steel Pants', '8235374191302', 'gorgeous-steel-pants', 'Expedita laboriosam iste voluptas et facilis eius incidunt. Sequi nemo quis magni nulla exercitationem. Quia voluptatum consectetur molestias et tempora adipisci.', 3365.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(462, 'Lightweight Paper Watch', '4197204734339', 'lightweight-paper-watch', 'Animi ad voluptas officiis minima possimus commodi veniam. Eveniet rerum a harum numquam vel.', 3289.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(463, 'Lightweight Cotton Clock', '3399648480822', 'lightweight-cotton-clock', 'Omnis qui dolor vero tempora. Ut praesentium ex quae quo perspiciatis impedit deleniti saepe.', 944.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(464, 'Synergistic Paper Table', '7267910899619', 'synergistic-paper-table', 'Harum fugit consequuntur qui voluptatem ratione quis laboriosam. Unde exercitationem facilis eveniet eum. Occaecati quo aperiam et et qui molestiae.', 3586.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(465, 'Incredible Aluminum Hat', '9071372596041', 'incredible-aluminum-hat', 'Quibusdam sequi quis eum blanditiis vitae ea sint. Qui exercitationem praesentium pariatur omnis repellendus qui reiciendis perspiciatis. In ea rem provident et alias natus.', 2293.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(466, 'Sleek Cotton Gloves', '9415346636126', 'sleek-cotton-gloves', 'Quia corrupti minus consectetur tempore veritatis culpa sapiente voluptas. Vitae quod qui nam. Ea rerum tempora omnis.', 767.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(467, 'Enormous Iron Watch', '0082309643447', 'enormous-iron-watch', 'Reiciendis est autem suscipit amet quasi. Optio qui exercitationem rerum natus ex. Repellendus sed rem maiores est est qui quam magnam.', 2044.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(468, 'Durable Linen Bag', '8905233249214', 'durable-linen-bag', 'Qui officia totam unde similique aut. Consequatur quis similique ex omnis. Vel officia voluptas ipsa et eaque eligendi minus.', 4312.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(469, 'Awesome Marble Pants', '0769034122743', 'awesome-marble-pants', 'Facilis nihil et esse aut assumenda. Minus rerum amet et optio nobis quia similique hic.', 3277.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(470, 'Lightweight Cotton Shoes', '6020988673656', 'lightweight-cotton-shoes', 'Deserunt vel necessitatibus eos repudiandae debitis. Ut quisquam consectetur at aut.', 2308.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(471, 'Intelligent Wool Bottle', '4651006397319', 'intelligent-wool-bottle', 'Voluptatem animi deleniti nihil nesciunt quia explicabo. Voluptatem molestiae odit inventore sit laboriosam. Numquam nisi commodi unde omnis dolorem ipsum qui.', 985.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(472, 'Sleek Iron Clock', '7015194844098', 'sleek-iron-clock', 'Modi qui atque ducimus cum. Eius autem nemo velit temporibus quod ipsam sed et.', 2011.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(473, 'Rustic Iron Lamp', '8783327712956', 'rustic-iron-lamp', 'Hic aut odit minus autem non quo consequuntur. Officia adipisci quas deleniti aut fugit sit. Numquam culpa itaque voluptas fugit perferendis doloribus.', 3804.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(474, 'Gorgeous Wool Chair', '0411179350665', 'gorgeous-wool-chair', 'Sed error sint minima officiis qui voluptatem et dolorem. Nulla id consequatur occaecati ipsam sed. Inventore qui rerum non unde quos itaque.', 3796.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(475, 'Awesome Aluminum Pants', '7911682404310', 'awesome-aluminum-pants', 'Qui illum placeat omnis ut accusamus ut quibusdam. Voluptas incidunt eos voluptates aut sed dignissimos ipsam. Minima dolores cum porro amet quo possimus sed.', 357.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(476, 'Sleek Plastic Table', '9959359734672', 'sleek-plastic-table', 'Nobis eum similique corporis magni sunt. Aut quibusdam et repellendus voluptatem nisi.', 1743.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(477, 'Fantastic Copper Chair', '3153742042030', 'fantastic-copper-chair', 'Dolorem qui consequuntur beatae est hic. Quam rerum inventore praesentium voluptas sit laboriosam qui. Ipsum est molestiae molestiae ut beatae error vitae.', 4560.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(478, 'Incredible Wool Gloves', '2385757562413', 'incredible-wool-gloves', 'Ea aliquid odit inventore modi ut et officia. Cum vitae quia maiores est tenetur suscipit. Fugiat voluptas possimus perferendis aut quam animi qui est.', 970.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(479, 'Mediocre Rubber Coat', '0764841927628', 'mediocre-rubber-coat', 'Eos et ab necessitatibus qui perspiciatis reiciendis. Explicabo cum qui suscipit dolorem in et eos voluptatem.', 4853.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(480, 'Incredible Paper Pants', '4095694826186', 'incredible-paper-pants', 'Qui consequatur rem iusto repellat. Sit excepturi mollitia quidem quaerat. Ipsum sint qui culpa.', 1006.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(481, 'Lightweight Cotton Plate', '6920282077498', 'lightweight-cotton-plate', 'Ipsam exercitationem hic molestias dignissimos nemo neque delectus. Tenetur est sint harum aut dolores. Doloremque nisi eum ut autem.', 3219.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(482, 'Heavy Duty Linen Hat', '5551723319399', 'heavy-duty-linen-hat', 'Non sed et est vel neque. Laboriosam laboriosam excepturi voluptas ab. Harum labore assumenda voluptas est voluptatem dolor molestias.', 1801.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(483, 'Mediocre Marble Gloves', '9805228658559', 'mediocre-marble-gloves', 'Ut tempore atque rem non aut nihil dolore. Aspernatur a soluta nam cumque doloribus eos deserunt.', 3740.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(484, 'Durable Wool Pants', '9458375196544', 'durable-wool-pants', 'Consequatur nulla rerum beatae provident facilis. Laudantium dolores maxime facilis accusamus incidunt quidem. Et provident laudantium similique atque quos.', 1795.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(485, 'Incredible Steel Pants', '0909291763567', 'incredible-steel-pants', 'Hic sed repellendus quis esse et et. Qui et et non sunt magni.', 1375.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(486, 'Intelligent Linen Car', '7847941785862', 'intelligent-linen-car', 'Qui in eos blanditiis numquam dolores iste. Ut sit dolorem quis quibusdam quos debitis voluptas dolore. Velit occaecati earum sed sit sed aliquam in.', 469.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(487, 'Sleek Cotton Chair', '6794655345602', 'sleek-cotton-chair', 'Corporis eum earum laudantium dolor odio. Cum quam sed inventore architecto facere autem. Ut nisi et temporibus deleniti sed facilis.', 1158.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(488, 'Sleek Plastic Lamp', '9770993092900', 'sleek-plastic-lamp', 'Fuga provident consectetur iste quia reprehenderit. Aut quis quasi sed at magnam. Quo alias beatae facilis labore consequuntur aut officiis.', 3524.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(489, 'Aerodynamic Wooden Computer', '5838083010082', 'aerodynamic-wooden-computer', 'Deleniti voluptatem ipsum quia quis voluptatum. Qui perferendis et qui ad eius ipsum. Voluptas non ab expedita fuga qui et.', 4767.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(490, 'Sleek Leather Pants', '3562923539052', 'sleek-leather-pants', 'Placeat consequatur suscipit officia reiciendis. Quia magnam est magnam quisquam corporis incidunt maiores eum.', 1026.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(491, 'Synergistic Cotton Clock', '9913959853249', 'synergistic-cotton-clock', 'Porro consectetur minima velit nemo expedita. Accusamus sunt nemo qui amet.', 3412.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(492, 'Lightweight Granite Shirt', '8240527399986', 'lightweight-granite-shirt', 'Aut corporis minus omnis aut. Totam maiores qui molestiae quibusdam impedit.', 4492.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(493, 'Rustic Aluminum Shirt', '3978762667922', 'rustic-aluminum-shirt', 'Quo sint possimus aut dolores porro laudantium. Id blanditiis deleniti velit laborum. Aut voluptas esse dolorum dignissimos sunt.', 4517.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(494, 'Lightweight Rubber Bench', '1711468960988', 'lightweight-rubber-bench', 'Sed dolorem quis odio quisquam sint corporis corporis consequatur. Fuga delectus nobis enim autem delectus officia laboriosam. Asperiores debitis distinctio autem facere dignissimos minus alias.', 4719.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(495, 'Heavy Duty Leather Gloves', '1182910675932', 'heavy-duty-leather-gloves', 'Et quod sapiente doloribus minus labore placeat at. Ex architecto illo magni aut reiciendis odio.', 1686.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(496, 'Aerodynamic Paper Bottle', '4118975997747', 'aerodynamic-paper-bottle', 'Dolor voluptas harum nam. Sunt officiis consequatur provident quasi nihil voluptatibus minus.', 4730.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(497, 'Incredible Aluminum Bag', '4311575682239', 'incredible-aluminum-bag', 'Quae possimus est et provident. Quia recusandae facere aliquid corrupti est magnam natus.', 2789.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(498, 'Small Marble Clock', '1556713516776', 'small-marble-clock', 'Qui et dolor dolores voluptas earum officia. Nostrum eos sed laborum et nemo excepturi dolor iure.', 977.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(499, 'Durable Wool Computer', '8984979931751', 'durable-wool-computer', 'Eos omnis suscipit ipsa. Quia necessitatibus harum nobis aut quia. Non eos corrupti non est consectetur.', 2715.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(500, 'Aerodynamic Iron Chair', '6316280531900', 'aerodynamic-iron-chair', 'Dicta assumenda aliquid voluptas voluptas eos. Debitis quasi debitis non at eos. Harum rerum nisi aliquam repellendus quas atque.', 4215.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(501, 'Sleek Wool Wallet', '5137930515092', 'sleek-wool-wallet', 'Dolore dolorum qui aspernatur quis velit in. Nesciunt error qui et architecto repellat. Dolorem earum illum neque vel.', 2767.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(502, 'Durable Iron Bench', '7537142714616', 'durable-iron-bench', 'Magnam impedit eius harum sequi. Beatae soluta qui voluptatem dolores.', 3647.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(503, 'Awesome Concrete Wallet', '0097481784079', 'awesome-concrete-wallet', 'Quis repellat ullam non sed. Sint ea fuga quidem autem ducimus hic voluptas tenetur.', 1299, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(504, 'Enormous Copper Bag', '1041087732810', 'enormous-copper-bag', 'Distinctio repudiandae exercitationem voluptatem qui. Maiores soluta odio soluta sed laboriosam.', 2855.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(505, 'Awesome Rubber Lamp', '1822683471866', 'awesome-rubber-lamp', 'Exercitationem adipisci aperiam labore laudantium consequuntur non sunt tempore. Suscipit maxime laboriosam nisi voluptatum est sequi id.', 3696.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(506, 'Durable Aluminum Hat', '0743834677801', 'durable-aluminum-hat', 'Repellat et perferendis eos autem quia culpa. Doloribus saepe dicta et sint. Dolore quis in consequuntur sed.', 3674.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(507, 'Enormous Rubber Clock', '0478287602314', 'enormous-rubber-clock', 'Et hic suscipit mollitia iste tempora. Dolorum quidem et commodi sint totam ut.', 4525.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(508, 'Sleek Cotton Car', '8886895349477', 'sleek-cotton-car', 'Modi quia natus doloribus assumenda. Iste et amet ipsum minima animi quasi nihil.', 2503.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(509, 'Gorgeous Wool Watch', '6322909439014', 'gorgeous-wool-watch', 'Neque architecto vel molestiae. Voluptatem consequatur aut non et sapiente magni.', 2301.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(510, 'Ergonomic Plastic Shoes', '4150628440033', 'ergonomic-plastic-shoes', 'Consequatur quos sapiente explicabo molestias reprehenderit aliquid ad. Aspernatur cupiditate voluptas cum quidem. Neque dolore facilis commodi eaque.', 2107.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(511, 'Enormous Silk Watch', '4188309953954', 'enormous-silk-watch', 'Inventore est vero cumque ab. Debitis vitae quaerat optio fuga nobis.', 2894.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(512, 'Enormous Aluminum Knife', '5355080749963', 'enormous-aluminum-knife', 'Eligendi quia ut aut aliquam in sint beatae quae. Mollitia laborum ab iure laboriosam sit tempora et.', 3560.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(513, 'Incredible Linen Pants', '2024872974137', 'incredible-linen-pants', 'Dolores aut optio animi consectetur quaerat sunt. Ducimus qui tempore repudiandae voluptatem nulla.', 1921.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(514, 'Gorgeous Steel Wallet', '2293747755311', 'gorgeous-steel-wallet', 'Esse ea saepe facilis labore quia. Iusto blanditiis sit error.', 2166.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(515, 'Gorgeous Granite Hat', '8607652563710', 'gorgeous-granite-hat', 'Quas reiciendis illum voluptate. Aut harum cupiditate praesentium quibusdam sed.', 2712.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(516, 'Small Iron Table', '0297191591558', 'small-iron-table', 'Officia doloribus voluptatem molestias dolore maiores rerum. Et doloremque quis odit et.', 2543.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(517, 'Durable Marble Hat', '0495327998404', 'durable-marble-hat', 'Rerum soluta et modi sapiente tempora incidunt. Qui aut consequatur nam magni quos ut dicta.', 4168.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(518, 'Ergonomic Silk Bottle', '8660685311420', 'ergonomic-silk-bottle', 'Nihil cum nam nisi quia error. Quas et laboriosam natus sit nihil dolore omnis. Tempore autem vitae dolor facilis.', 3844.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(519, 'Gorgeous Marble Watch', '2485206572687', 'gorgeous-marble-watch', 'Et ea maiores ullam et ullam ut. Nam aut sequi et laudantium ut. Et suscipit laudantium ipsum minus non non.', 2314.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(520, 'Lightweight Wool Watch', '2950967083982', 'lightweight-wool-watch', 'Quaerat consequuntur exercitationem nesciunt qui aut libero id. Dolore ipsam et beatae architecto quo est. Deleniti minus et adipisci repellendus quae culpa.', 2084.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(521, 'Aerodynamic Wool Table', '2288793186943', 'aerodynamic-wool-table', 'Unde possimus quia sapiente aperiam rerum cumque. Soluta incidunt possimus vel quos. Deserunt culpa labore harum.', 1522.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(522, 'Gorgeous Rubber Shoes', '0001398031669', 'gorgeous-rubber-shoes', 'Adipisci suscipit corrupti voluptatibus rem voluptatem ipsam. Tempora eum esse aut eum soluta dignissimos dignissimos. Exercitationem recusandae quo voluptatum vel veniam quisquam dolor.', 4684.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(523, 'Mediocre Silk Clock', '6323368966127', 'mediocre-silk-clock', 'Nisi occaecati ut sit nobis nesciunt. Atque officia repellendus occaecati unde laboriosam. Aut sed non blanditiis.', 2293.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(524, 'Heavy Duty Steel Shoes', '8624760430123', 'heavy-duty-steel-shoes', 'Nisi tenetur culpa sunt dolores et qui beatae. Sit eius voluptate est minus est vel. Beatae repellat nihil ab voluptatem numquam dolores consequuntur.', 4914.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(525, 'Sleek Wool Coat', '3715611246187', 'sleek-wool-coat', 'Quod voluptatum explicabo quasi. Et adipisci quod omnis natus. Praesentium incidunt eos unde fugiat aut repudiandae rem.', 2977.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(526, 'Intelligent Marble Computer', '9817571272627', 'intelligent-marble-computer', 'Non consequatur distinctio consequatur itaque porro commodi et. Qui porro doloribus doloribus praesentium. Omnis deserunt distinctio labore quo quod autem ipsum.', 3516.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(527, 'Fantastic Wool Bottle', '8567834054118', 'fantastic-wool-bottle', 'Cumque enim animi aut ut. Sit unde ut a est voluptate enim quia. Rerum doloribus mollitia sed distinctio corporis natus.', 583.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(528, 'Awesome Copper Clock', '5440516511587', 'awesome-copper-clock', 'Et consequatur perspiciatis omnis. Perferendis voluptatem exercitationem neque fugiat omnis. Facilis culpa quos beatae laudantium sint iusto fugiat.', 2116.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(529, 'Rustic Aluminum Pants', '3374800656659', 'rustic-aluminum-pants', 'Mollitia dolores dolorem velit consectetur. Neque aliquid aut tenetur id ea voluptates nisi amet.', 640.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(530, 'Aerodynamic Iron Knife', '1850211411152', 'aerodynamic-iron-knife', 'Ab amet impedit exercitationem quidem quae sit. Amet et similique eligendi numquam velit. Explicabo ea fugiat fugit delectus.', 4176.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(531, 'Heavy Duty Cotton Computer', '3010630065925', 'heavy-duty-cotton-computer', 'Illum omnis culpa alias neque repellat. Autem aliquid sint nihil adipisci beatae ab. Dolores quidem deleniti voluptas et nisi perferendis dolorem.', 277.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(532, 'Gorgeous Copper Coat', '6437053684552', 'gorgeous-copper-coat', 'Reiciendis recusandae voluptatem odio vero inventore quis necessitatibus quia. Autem sunt nisi architecto reprehenderit.', 1041.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(533, 'Gorgeous Aluminum Plate', '2319675206968', 'gorgeous-aluminum-plate', 'Minus quae quia similique tempore quae quam perspiciatis. Non et maiores consequatur asperiores velit voluptatem labore. Est repellat et et quos.', 2182.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(534, 'Practical Wooden Keyboard', '9157049643222', 'practical-wooden-keyboard', 'Neque voluptas dolorum explicabo nam eveniet. Ut nisi omnis et velit.', 4170.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(535, 'Lightweight Linen Coat', '2439483810659', 'lightweight-linen-coat', 'Perferendis iure praesentium rerum velit ipsam vitae aut. Quaerat delectus repellat id sint neque officiis.', 3582.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(536, 'Ergonomic Aluminum Chair', '1756911045829', 'ergonomic-aluminum-chair', 'Ex dolor velit laborum dolorem sed atque autem. Maxime officia dolor quo fugit deserunt nulla omnis. Error ea ratione possimus officiis tempore pariatur fugiat.', 1343.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(537, 'Sleek Plastic Knife', '3734816768188', 'sleek-plastic-knife', 'Ratione est non consequatur officia est. Laborum et eum eligendi esse voluptatibus cumque voluptatem nihil.', 2333.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(538, 'Gorgeous Plastic Bench', '9750877774481', 'gorgeous-plastic-bench', 'Consequatur voluptatum amet occaecati placeat sunt numquam. In deleniti consequatur sit velit quis esse. Rerum quam iure quis quam.', 3809.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(539, 'Lightweight Silk Bottle', '4510509094128', 'lightweight-silk-bottle', 'Ratione quia provident mollitia numquam incidunt voluptatum non. Perspiciatis est et optio nulla reprehenderit quas et.', 3206.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(540, 'Durable Silk Bench', '1044852085807', 'durable-silk-bench', 'Modi et perspiciatis optio quo in ex. Adipisci molestiae molestiae maiores. Doloribus iste optio corrupti accusantium ad.', 620.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(541, 'Ergonomic Leather Hat', '4669568615536', 'ergonomic-leather-hat', 'Nostrum aspernatur quos eaque est. Nulla reprehenderit et est fugit architecto.', 2444.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(542, 'Synergistic Aluminum Clock', '2570604063926', 'synergistic-aluminum-clock', 'Asperiores veniam aut maiores qui error quis quas. Aut enim aut officia alias iste. In quisquam perspiciatis dolorem voluptatem aut.', 745.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(543, 'Gorgeous Granite Gloves', '0310564724152', 'gorgeous-granite-gloves', 'Omnis sit eum rerum placeat. Numquam enim reprehenderit nam voluptates quia dolores voluptatem.', 2410.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(544, 'Gorgeous Aluminum Table', '7543401387057', 'gorgeous-aluminum-table', 'Similique molestias veniam ut modi ea. Et ut sit similique natus enim tempore. Qui veniam tempore rem harum assumenda temporibus.', 3886.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(545, 'Mediocre Linen Lamp', '5390849728056', 'mediocre-linen-lamp', 'Eum deleniti necessitatibus magni porro animi sit quia. Aut ad natus nihil voluptatibus.', 3623.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(546, 'Intelligent Copper Keyboard', '5258649933738', 'intelligent-copper-keyboard', 'Magnam rem dicta laudantium perferendis iusto. Et qui voluptatem reprehenderit esse. Fuga culpa nulla quae molestiae ut totam.', 4321.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(547, 'Synergistic Silk Pants', '7262737668752', 'synergistic-silk-pants', 'Et ut qui eum officiis sunt quaerat. Eum at doloribus ut et nihil mollitia occaecati. Dolores quam et voluptatem repellendus aut.', 81.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(548, 'Mediocre Concrete Bag', '1767616106494', 'mediocre-concrete-bag', 'Sunt id ratione explicabo facere dicta. Unde ipsam quo eaque et dolore sit aliquid. Enim ut odit et sint unde.', 767.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(549, 'Mediocre Rubber Table', '5099738619986', 'mediocre-rubber-table', 'Qui commodi autem aspernatur dolorem. Voluptatem veniam atque ullam nemo commodi sint labore. Est nihil rerum quisquam dolorem.', 667.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(550, 'Aerodynamic Wooden Pants', '9130414423957', 'aerodynamic-wooden-pants', 'Vel et sunt magni labore maxime odio ad. Alias quia facilis inventore nulla.', 852.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(551, 'Awesome Iron Gloves', '1175313414772', 'awesome-iron-gloves', 'Repellat tempore aut non facilis labore et excepturi. Eaque laudantium sunt minus soluta.', 1539.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(552, 'Practical Copper Lamp', '9811721444742', 'practical-copper-lamp', 'Earum rerum eaque debitis quis eligendi. Atque ut perspiciatis non voluptas. Quam ut totam dolor doloremque et sequi recusandae.', 4864.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(553, 'Enormous Silk Wallet', '0668247622906', 'enormous-silk-wallet', 'Unde animi nam blanditiis repellat et. Distinctio magnam sed magni soluta.', 585.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(554, 'Aerodynamic Wool Keyboard', '6026028830133', 'aerodynamic-wool-keyboard', 'Quo cupiditate laudantium repellendus placeat consequatur. Quo blanditiis tenetur quis voluptate et enim. Ut temporibus ut ut officia sapiente doloremque eum illo.', 1279.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(555, 'Sleek Wool Car', '7608558699726', 'sleek-wool-car', 'Pariatur sit omnis ratione assumenda qui. Architecto quis est assumenda sunt doloribus sequi quasi.', 2441.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(556, 'Durable Marble Knife', '9143648480122', 'durable-marble-knife', 'Perspiciatis similique assumenda sunt corporis soluta quam quasi. Quam consequatur voluptatem sunt non ab.', 3012.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(557, 'Fantastic Marble Computer', '9770509918878', 'fantastic-marble-computer', 'Id nesciunt atque ipsam quam. Officia placeat molestiae qui optio repellat asperiores qui quo.', 2216.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(558, 'Lightweight Steel Watch', '2278766205924', 'lightweight-steel-watch', 'Commodi voluptatem et omnis harum. Esse aut explicabo rerum eius ducimus laboriosam. Perferendis facere consectetur dolorem unde.', 1812.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(559, 'Incredible Rubber Table', '6084099538310', 'incredible-rubber-table', 'Similique sunt praesentium rerum id nihil. Blanditiis ad incidunt temporibus modi.', 2318.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(560, 'Fantastic Linen Wallet', '9192316824959', 'fantastic-linen-wallet', 'Molestiae aut dolore enim explicabo rerum reprehenderit. Voluptates et vero neque voluptatem perferendis facere quia.', 3661.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(561, 'Synergistic Iron Bag', '3767519332769', 'synergistic-iron-bag', 'Nemo ut est enim omnis sed laborum sunt. Officia alias odit temporibus exercitationem nemo eius. Aliquam et laboriosam vel ipsa ut similique.', 1782.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(562, 'Durable Bronze Pants', '6454686870961', 'durable-bronze-pants', 'Eum vero ut at. Ipsum reprehenderit alias ut et. Dolorem unde qui voluptas perspiciatis autem quia similique dolor.', 2270.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(563, 'Rustic Bronze Shirt', '9429367051608', 'rustic-bronze-shirt', 'Odit laborum quia aut quis. Ratione eos veniam rerum perspiciatis corporis officia.', 3438.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(564, 'Awesome Iron Bag', '5005286453378', 'awesome-iron-bag', 'Aut provident beatae culpa voluptates maiores alias. Ipsam voluptate distinctio fugiat magni aut. A at quasi a error voluptate voluptatem qui.', 4218.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(565, 'Small Concrete Hat', '8599123878211', 'small-concrete-hat', 'Reiciendis atque dignissimos enim iste quia consequatur iure. Quibusdam id at tempora repellendus fugiat eos aperiam. Et et voluptates consequuntur sequi dolores.', 1998.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(566, 'Enormous Cotton Bag', '7382077618665', 'enormous-cotton-bag', 'Quam ullam ea eos perferendis totam. Nihil qui quo voluptas dolorem explicabo in nihil.', 387.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(567, 'Practical Silk Gloves', '5800640040818', 'practical-silk-gloves', 'Cum aut temporibus vel reiciendis nemo ipsum pariatur. Quos impedit dolorem saepe maxime repellat ut. Adipisci consequatur quos corporis omnis nostrum.', 600.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(568, 'Mediocre Concrete Bench', '1146316516145', 'mediocre-concrete-bench', 'Ut doloremque vel qui deserunt qui. Facilis quo aut commodi illum quaerat illo odit.', 4687.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(569, 'Aerodynamic Linen Gloves', '7780920150254', 'aerodynamic-linen-gloves', 'Odit et vero odio ut dolores. Et quod beatae molestiae dolorem pariatur et. Quibusdam neque dolor harum at.', 2700.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(570, 'Synergistic Copper Watch', '7915453677408', 'synergistic-copper-watch', 'Et nihil ipsum facilis voluptas tenetur ut. Qui possimus nihil quasi mollitia sit magnam. Ea error explicabo molestias error doloremque veritatis aut aliquam.', 158.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(571, 'Awesome Bronze Chair', '3818112928788', 'awesome-bronze-chair', 'Dolorem earum laboriosam tempora quas voluptatem. Ipsum quibusdam ullam odit ipsa rerum voluptatum voluptatem. Atque illum suscipit autem et voluptatem placeat nihil.', 1330.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(572, 'Aerodynamic Leather Coat', '3721439139440', 'aerodynamic-leather-coat', 'Aperiam sed qui magnam nisi vitae. Quam ex quis repudiandae similique delectus et.', 829.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(573, 'Sleek Bronze Shoes', '8305529436975', 'sleek-bronze-shoes', 'Ut aut exercitationem facilis mollitia doloremque. Perspiciatis quo a aut odio. Accusamus qui nam sunt sapiente in itaque.', 2755.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(574, 'Mediocre Leather Bag', '7846057850150', 'mediocre-leather-bag', 'Mollitia vero sit deserunt ea debitis. Reprehenderit repellat velit et praesentium cumque totam quis. Nesciunt expedita saepe mollitia quos.', 223.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(575, 'Sleek Rubber Keyboard', '4099523234869', 'sleek-rubber-keyboard', 'Accusantium odit distinctio et quasi. Reiciendis temporibus exercitationem omnis temporibus et placeat pariatur. Fugit minima natus accusamus dolores sit ullam.', 4095.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(576, 'Durable Aluminum Bottle', '0316231360470', 'durable-aluminum-bottle', 'Qui nihil autem autem vitae minus ea. Dolor amet eius a vero. Quo sed aut veritatis qui aut soluta.', 4407.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(577, 'Rustic Granite Shirt', '3348396024390', 'rustic-granite-shirt', 'Repellendus vero voluptatem ratione et. Perferendis expedita optio sed cum assumenda accusantium ad quas. Nihil vero consectetur dolor.', 1102.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(578, 'Practical Cotton Keyboard', '3494788460588', 'practical-cotton-keyboard', 'Et fugiat ex nostrum distinctio dolores et. Mollitia voluptas ea eos possimus consequuntur voluptatum.', 1796.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(579, 'Practical Aluminum Watch', '3994089289852', 'practical-aluminum-watch', 'Saepe exercitationem maiores et veniam ut qui commodi odio. Necessitatibus distinctio ipsa doloribus cum odit. Ut praesentium tempore autem vitae.', 653.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(580, 'Sleek Cotton Table', '7743764665896', 'sleek-cotton-table', 'Nisi recusandae nulla occaecati vero et. Non sed tempore voluptatem repellendus facilis quidem.', 1307.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(581, 'Small Steel Coat', '9564776072162', 'small-steel-coat', 'Est delectus voluptas consequatur earum. Quis modi non nihil repudiandae quaerat non quasi. Tempora voluptas omnis ex quia impedit molestiae.', 1909.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(582, 'Heavy Duty Plastic Car', '5010201227897', 'heavy-duty-plastic-car', 'Reprehenderit possimus rerum beatae. Quasi hic beatae fugit saepe quis.', 395.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(583, 'Lightweight Rubber Bag', '2154206089074', 'lightweight-rubber-bag', 'Totam omnis consequatur laudantium minima est occaecati. Sequi similique aliquid doloremque sed. Voluptas autem cum autem quibusdam voluptatem vitae.', 829.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(584, 'Aerodynamic Concrete Car', '8558489367449', 'aerodynamic-concrete-car', 'Repudiandae quidem et voluptas numquam. Molestiae et amet quibusdam officia. Harum ad quis eaque aut.', 4470.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(585, 'Lightweight Aluminum Car', '3132062607839', 'lightweight-aluminum-car', 'Ut praesentium repellat aut commodi nulla. Ducimus error aut quo aspernatur alias rerum soluta. Pariatur eum explicabo omnis aperiam maiores et.', 1945.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(586, 'Rustic Plastic Bottle', '8970257258955', 'rustic-plastic-bottle', 'Et rerum sunt voluptas ad natus vel. Nam consectetur est nemo quia tenetur. Tempora molestiae odit et enim.', 3357.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(587, 'Synergistic Concrete Pants', '6568948100434', 'synergistic-concrete-pants', 'Ipsum quis nesciunt dicta eum minus. Natus impedit qui quasi corrupti veritatis. Id enim vel molestiae sequi voluptas dolorum.', 804.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(588, 'Heavy Duty Aluminum Keyboard', '1890091069340', 'heavy-duty-aluminum-keyboard', 'Dicta quod distinctio ut illo accusantium veritatis laborum. Molestiae assumenda labore aut adipisci.', 615.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(589, 'Mediocre Steel Computer', '7666247165792', 'mediocre-steel-computer', 'Laborum non non perferendis quos ullam voluptates ut perferendis. Non quisquam ut dignissimos. Eum et minus et esse.', 1391.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(590, 'Practical Linen Watch', '9112468463233', 'practical-linen-watch', 'Accusamus aut consectetur est illum at. Qui porro nihil asperiores qui facilis. Accusamus neque tempore architecto velit.', 1250.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(591, 'Ergonomic Bronze Car', '9958089093646', 'ergonomic-bronze-car', 'Ut in quia voluptatibus eum voluptas ut consequuntur. Non assumenda nihil ea voluptas consequatur dolores.', 1965.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(592, 'Heavy Duty Silk Computer', '3090068143167', 'heavy-duty-silk-computer', 'Laborum rerum repellat nemo ut et. Est quas et fuga est sint. Soluta eos fugit rerum qui inventore voluptates ea.', 3318.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(593, 'Aerodynamic Bronze Watch', '0744314726613', 'aerodynamic-bronze-watch', 'Consectetur totam eos neque sint omnis et aliquid nesciunt. Sint in accusamus aut quae velit cupiditate. Omnis et sunt sint numquam aut pariatur.', 976.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(594, 'Incredible Wool Coat', '8289466160219', 'incredible-wool-coat', 'Eius aut itaque sed magnam. Quo perspiciatis praesentium ad in.', 2119.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(595, 'Practical Marble Bag', '3693405611239', 'practical-marble-bag', 'Dolor qui quia sed ex repudiandae facere velit. Ut explicabo placeat quaerat ut.', 4283.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(596, 'Heavy Duty Wool Bag', '2743491726865', 'heavy-duty-wool-bag', 'Esse consequatur ad nulla eligendi quis pariatur vitae. Molestiae placeat dicta voluptas quam maiores.', 4722.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(597, 'Fantastic Iron Table', '7455277606555', 'fantastic-iron-table', 'Maiores ipsum inventore adipisci maxime earum. Iure accusamus excepturi asperiores doloremque accusantium nobis.', 3514.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(598, 'Heavy Duty Iron Bench', '1289411371940', 'heavy-duty-iron-bench', 'Rerum cupiditate totam deserunt delectus velit. Cupiditate et facere adipisci rerum quia consequatur.', 3744.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(599, 'Intelligent Rubber Plate', '7038826357049', 'intelligent-rubber-plate', 'Maiores doloribus omnis voluptates est vero. Quod minima sapiente sapiente unde earum vero. At inventore temporibus quam consequatur et.', 4828.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(600, 'Fantastic Silk Computer', '4792468726627', 'fantastic-silk-computer', 'Quidem quia ullam in nulla earum omnis sunt. Quos ut cum dolore aut. Sint dicta qui expedita nesciunt.', 839.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(601, 'Enormous Cotton Car', '8110758492018', 'enormous-cotton-car', 'Voluptatem aspernatur animi quo impedit cum. Veniam quasi voluptatem animi expedita ut dolorem velit.', 4225.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(602, 'Lightweight Aluminum Bag', '1865700917060', 'lightweight-aluminum-bag', 'Dolores nobis delectus asperiores aliquam soluta enim. Facere est blanditiis corporis praesentium iusto sequi.', 1241.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(603, 'Synergistic Iron Hat', '3971630484232', 'synergistic-iron-hat', 'Velit ut est in aut. Velit qui aliquid provident neque et et ullam quasi.', 386.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(604, 'Intelligent Cotton Lamp', '4243295568275', 'intelligent-cotton-lamp', 'Praesentium non voluptas fugiat provident nisi et consequuntur. Nam laborum occaecati ullam enim qui non sit. Blanditiis aliquid temporibus incidunt totam.', 4861.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(605, 'Ergonomic Wool Coat', '5450336823005', 'ergonomic-wool-coat', 'Quidem est mollitia ipsam animi dolores et. Eaque dolorum et omnis rerum cupiditate officia.', 4636.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(606, 'Heavy Duty Granite Keyboard', '3019672467636', 'heavy-duty-granite-keyboard', 'Maiores voluptas dicta minus molestiae quasi. In cumque expedita vero voluptas iure.', 868.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(607, 'Enormous Rubber Watch', '3877475132430', 'enormous-rubber-watch', 'Voluptates fugiat laborum delectus. Atque perferendis officiis accusamus ullam molestiae porro debitis aut.', 2515.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(608, 'Small Cotton Coat', '4466283978119', 'small-cotton-coat', 'Tempore voluptatem voluptas non ex quidem rerum velit possimus. Nostrum eos sunt eius rerum nam. Maxime molestias non consequatur aut et pariatur accusamus.', 4264.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(609, 'Fantastic Granite Wallet', '6804012072796', 'fantastic-granite-wallet', 'Eveniet magni iste et voluptas debitis error. Veniam aut voluptates quod quos ullam reiciendis.', 3853.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(610, 'Intelligent Leather Chair', '6580842155778', 'intelligent-leather-chair', 'Nihil commodi ut a maiores voluptatem. Minus aut aut molestias maxime voluptas.', 1227.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(611, 'Ergonomic Copper Coat', '9158543902792', 'ergonomic-copper-coat', 'Molestiae dolor ea ullam enim laborum inventore facere. Odit qui repellat minus velit.', 2865.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(612, 'Awesome Aluminum Watch', '5639772893975', 'awesome-aluminum-watch', 'Ipsa earum dolores cum eligendi non non molestiae. Aut dolorum tenetur repellat delectus nostrum consequuntur odio suscipit. Voluptatem officia consequatur quisquam ut et suscipit dolor.', 1407.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(613, 'Practical Linen Bottle', '9172655396669', 'practical-linen-bottle', 'Sed perspiciatis qui saepe inventore totam et et. Id nulla quo minima qui odit repellendus minus. Accusantium doloribus consequuntur molestiae vero qui quasi velit.', 1823.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(614, 'Durable Steel Keyboard', '6043470856108', 'durable-steel-keyboard', 'Omnis ab nesciunt est est. Nesciunt aspernatur saepe doloremque accusamus sequi. Incidunt tenetur veritatis delectus quia sunt reiciendis debitis.', 4726.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(615, 'Gorgeous Marble Lamp', '0067746098746', 'gorgeous-marble-lamp', 'Non dolores beatae fuga sit rem. Ad quas voluptatem iste fuga cupiditate asperiores. Animi ducimus animi cupiditate.', 4858.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(616, 'Heavy Duty Steel Clock', '9685620089195', 'heavy-duty-steel-clock', 'Tempore voluptatum sed libero placeat assumenda. Voluptatem hic ut aut at rerum harum dignissimos tempora. Necessitatibus minima dolorem illum aspernatur ut culpa.', 4771.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(617, 'Aerodynamic Aluminum Gloves', '8423364282677', 'aerodynamic-aluminum-gloves', 'Sit iste tempore sapiente laudantium esse et illum. Sed error soluta voluptatem aperiam nostrum delectus debitis. Ab delectus aut omnis saepe reprehenderit iste aut.', 3913.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(618, 'Gorgeous Cotton Coat', '8196518610717', 'gorgeous-cotton-coat', 'Sit omnis ducimus nostrum id quam dicta. Sit nostrum magni unde velit.', 4381.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(619, 'Rustic Rubber Computer', '6178801639256', 'rustic-rubber-computer', 'Blanditiis minima ad libero doloribus alias exercitationem rerum deserunt. Nihil quos et inventore sit nulla voluptatem. Sunt rerum inventore consequatur numquam quae eos.', 179, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(620, 'Sleek Paper Clock', '5462739140146', 'sleek-paper-clock', 'Laboriosam atque qui enim ut maiores praesentium voluptatibus enim. Voluptatem quo voluptatem eveniet voluptate fuga in fuga.', 467.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(621, 'Heavy Duty Linen Plate', '2133551783721', 'heavy-duty-linen-plate', 'Et explicabo nostrum molestiae omnis et. Nostrum sunt et similique rerum consequatur.', 510.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(622, 'Aerodynamic Linen Shirt', '5003558250533', 'aerodynamic-linen-shirt', 'Facere doloribus rerum impedit unde. Aut consequatur unde magni modi magni veritatis ullam.', 2134.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(623, 'Enormous Paper Watch', '9105220043989', 'enormous-paper-watch', 'Sed repellat libero iusto sequi consequatur nam. Inventore qui voluptatum corrupti saepe facilis. Nobis modi quibusdam corrupti ut voluptas ipsa.', 519.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(624, 'Practical Bronze Clock', '9432930654557', 'practical-bronze-clock', 'Rerum dolor quaerat quod deleniti. Dolores illo et minima sunt explicabo. In vel repellat dolor est expedita voluptatum et.', 4198.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(625, 'Lightweight Iron Plate', '1271086195600', 'lightweight-iron-plate', 'Velit et qui aut odit sint nulla rerum. Voluptatem consequatur quia nihil quasi.', 486.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(626, 'Heavy Duty Rubber Shoes', '4846029167753', 'heavy-duty-rubber-shoes', 'Velit praesentium sed beatae sit. Enim rerum vero quod sit numquam. Et quo quis veniam placeat omnis quam in.', 661.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(627, 'Lightweight Bronze Clock', '7167214168971', 'lightweight-bronze-clock', 'Maiores recusandae repellendus dolor consequatur doloremque aut. Et rem fuga dolorem et nam. Ipsa ea eum dolore corrupti.', 4017.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(628, 'Sleek Cotton Computer', '2365925775111', 'sleek-cotton-computer', 'Aspernatur et aut aliquam est modi minus aut. Ab voluptas possimus sapiente earum nulla. Dolorem et optio numquam totam illo reprehenderit.', 3177.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(629, 'Small Cotton Plate', '4762711904003', 'small-cotton-plate', 'Eligendi deserunt quibusdam ut. Atque velit nobis praesentium consectetur sit voluptate labore. Iure placeat ut voluptas dignissimos aliquid nostrum.', 236.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(630, 'Sleek Paper Coat', '6474540744252', 'sleek-paper-coat', 'Eveniet corrupti quis hic blanditiis ad. Quia dolorem voluptas nihil temporibus ea quas non.', 877.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(631, 'Enormous Paper Car', '7951288753115', 'enormous-paper-car', 'Aut et est voluptatibus est voluptatem omnis. Qui id distinctio quidem quisquam. Ut ipsa corrupti illum.', 4415.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(632, 'Rustic Steel Bench', '7338061719030', 'rustic-steel-bench', 'Doloribus exercitationem doloribus inventore. Soluta molestiae et iste qui.', 2838.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(633, 'Lightweight Iron Computer', '3670844241104', 'lightweight-iron-computer', 'Voluptas et nam asperiores cupiditate ratione recusandae. Minus quis qui distinctio.', 4374.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(634, 'Enormous Wooden Clock', '7726831124106', 'enormous-wooden-clock', 'Excepturi cupiditate accusantium hic maiores harum quo aut ut. Voluptatem similique odit soluta enim nesciunt deserunt tempora.', 4784.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(635, 'Mediocre Paper Shirt', '4954096324129', 'mediocre-paper-shirt', 'Dolore aut doloribus ut aut. Possimus suscipit cum sint quod rerum molestias. Inventore occaecati asperiores assumenda consectetur officiis earum est odit.', 653.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(636, 'Rustic Silk Chair', '3357824314088', 'rustic-silk-chair', 'Nesciunt voluptatibus facere aliquam quam suscipit quia. Rerum aperiam animi exercitationem quis velit fugit tempore voluptates. Suscipit alias deleniti sit facilis optio.', 1686.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(637, 'Awesome Linen Table', '9581595337692', 'awesome-linen-table', 'Enim iste veniam quisquam expedita nesciunt voluptatem. Eveniet consequatur deserunt nihil debitis et quod aliquam. Quo sapiente inventore ut id nihil.', 1387.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(638, 'Intelligent Steel Bag', '1539248722027', 'intelligent-steel-bag', 'Doloribus totam sed non ullam. Sunt sed quo omnis omnis nostrum.', 2403.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(639, 'Heavy Duty Steel Keyboard', '1290529609986', 'heavy-duty-steel-keyboard', 'Alias rerum accusantium qui ducimus dolores. Debitis quis consectetur odit omnis nostrum sunt rerum ut.', 3275.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(640, 'Gorgeous Concrete Watch', '9389062460399', 'gorgeous-concrete-watch', 'Voluptas et laboriosam aliquam aliquid ut magni autem. Rerum qui iste qui. Sed tenetur aut voluptatem maiores suscipit molestiae.', 3813.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(641, 'Heavy Duty Bronze Coat', '1394822635472', 'heavy-duty-bronze-coat', 'Molestiae mollitia mollitia ut dolores. Cumque aut aspernatur laborum non ea.', 2715.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(642, 'Aerodynamic Paper Computer', '3981829870739', 'aerodynamic-paper-computer', 'Harum reiciendis consequatur ut quis. Illum molestiae rem optio nostrum.', 3197.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(643, 'Mediocre Steel Table', '0395795088075', 'mediocre-steel-table', 'Cupiditate autem asperiores quisquam voluptates est non ducimus. Distinctio veniam consequatur provident consequatur est quibusdam.', 4072.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(644, 'Lightweight Bronze Keyboard', '6629453386956', 'lightweight-bronze-keyboard', 'Hic voluptatem ut laboriosam laborum placeat. Nobis et autem officia exercitationem dolorem rerum. Fugiat facilis adipisci totam dolorem et neque ab.', 2316.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(645, 'Aerodynamic Paper Table', '6887691178171', 'aerodynamic-paper-table', 'Aut sunt voluptas voluptatem et harum sit temporibus dignissimos. Consequatur doloribus ut est voluptatem provident sint.', 966.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(646, 'Aerodynamic Concrete Plate', '7598144821498', 'aerodynamic-concrete-plate', 'Occaecati voluptas et aliquam veniam et illum ut vitae. Voluptatibus vitae distinctio recusandae dolorem non ea.', 3162.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(647, 'Heavy Duty Linen Table', '9023958194530', 'heavy-duty-linen-table', 'Rerum et dolores recusandae officiis qui et. Nisi dicta doloremque aspernatur magnam dicta. Explicabo laborum dignissimos voluptatem delectus officia.', 2603.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(648, 'Practical Rubber Hat', '5668580412214', 'practical-rubber-hat', 'Et voluptas architecto est. Voluptatem sunt ipsa magnam qui aut in.', 747.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(649, 'Aerodynamic Cotton Clock', '1823745207911', 'aerodynamic-cotton-clock', 'Numquam rem est quia dicta veritatis nobis praesentium. Rem aliquid nesciunt quidem quos et tenetur.', 1285.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(650, 'Durable Iron Wallet', '4314513990717', 'durable-iron-wallet', 'Qui nulla fugit aut qui aliquid. Quos tempore enim et non impedit.', 3841.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(651, 'Lightweight Wool Shoes', '9372959085522', 'lightweight-wool-shoes', 'Ea ipsam fuga aut dolor ducimus delectus. Earum blanditiis dolorem id quis itaque dolorem eligendi. Quia consequatur facere voluptate praesentium.', 1664.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(652, 'Lightweight Wool Knife', '8675997139679', 'lightweight-wool-knife', 'Sed doloremque temporibus et distinctio. Quos voluptas ducimus voluptatem fugiat nihil.', 2040.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(653, 'Gorgeous Bronze Lamp', '3636757335767', 'gorgeous-bronze-lamp', 'Sed porro consequatur et animi sit enim. Id deleniti eum ut velit non vel.', 4505.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(654, 'Fantastic Wooden Shoes', '0354592436472', 'fantastic-wooden-shoes', 'Saepe iusto hic sequi tempore suscipit sunt. Sunt consequuntur corrupti alias magnam aut amet. Maxime molestias qui accusantium totam quia et rerum.', 1169.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(655, 'Enormous Steel Car', '7435998640670', 'enormous-steel-car', 'Ea sed laborum autem. Recusandae mollitia cum fugiat necessitatibus molestiae excepturi dolorem.', 575.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(656, 'Heavy Duty Granite Shirt', '2566165023479', 'heavy-duty-granite-shirt', 'Debitis est dolorem nisi et et. Ratione commodi doloribus autem dolor.', 441.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(657, 'Synergistic Wool Wallet', '8733391091129', 'synergistic-wool-wallet', 'Aut accusantium et aut mollitia et. Dolore aliquam id aut id praesentium dolor.', 2739.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(658, 'Small Concrete Table', '3553821090592', 'small-concrete-table', 'Aut blanditiis nihil aliquid libero. Voluptas veritatis sit illum architecto.', 3999.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(659, 'Intelligent Cotton Gloves', '3724999666951', 'intelligent-cotton-gloves', 'Sint quas sed dolor est voluptatum consectetur ab mollitia. Sit voluptas ut modi iste blanditiis.', 3957.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(660, 'Enormous Cotton Knife', '5934252081553', 'enormous-cotton-knife', 'Ea aspernatur voluptatem quo sequi accusantium enim autem autem. Nam eveniet modi est sed voluptas voluptatum omnis ex. Qui eos facere molestiae in aut.', 1409.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(661, 'Incredible Leather Knife', '5997158868659', 'incredible-leather-knife', 'Id tempora repudiandae placeat sed vero suscipit earum. Est quo repudiandae assumenda qui repellendus cum voluptate. Magnam tempora modi quo suscipit est.', 1720.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(662, 'Lightweight Iron Lamp', '6522206282997', 'lightweight-iron-lamp', 'Ab sint fugit odio qui harum et fugiat. Perferendis ad deserunt perspiciatis accusamus non placeat. Asperiores nisi perspiciatis consectetur vel eum quidem debitis.', 476.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(663, 'Heavy Duty Steel Shirt', '6864559542190', 'heavy-duty-steel-shirt', 'Excepturi omnis inventore magnam. Ut sed quaerat quia blanditiis eveniet et.', 1374.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(664, 'Fantastic Plastic Car', '9439741167443', 'fantastic-plastic-car', 'Dolorem sed nam non aliquam non qui doloribus. Omnis necessitatibus repudiandae ullam error ut.', 1754.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(665, 'Practical Granite Bench', '5797320177165', 'practical-granite-bench', 'Quasi dolore molestiae ipsam cumque. Soluta magni provident saepe quas.', 4867.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(666, 'Ergonomic Iron Keyboard', '7166714108555', 'ergonomic-iron-keyboard', 'Id voluptatibus ut architecto ex eaque. Laborum nobis recusandae et provident consequatur dicta accusamus perspiciatis. Eaque dolorum aut aut minus.', 4162.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(667, 'Heavy Duty Plastic Wallet', '2103875137913', 'heavy-duty-plastic-wallet', 'Voluptas adipisci aut doloribus aspernatur inventore. Quae nulla excepturi consequatur in. Vel est reprehenderit et corporis vel.', 1752.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(668, 'Durable Paper Bottle', '3305028469165', 'durable-paper-bottle', 'Ut culpa aut corrupti voluptatum aliquid. Eveniet commodi perspiciatis est nulla.', 4832.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(669, 'Heavy Duty Copper Computer', '1486697411111', 'heavy-duty-copper-computer', 'Alias harum nihil incidunt quos. Sint reprehenderit quas fuga aperiam. Id aut enim consequuntur corrupti et error tenetur.', 3121.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(670, 'Gorgeous Iron Pants', '2125360075760', 'gorgeous-iron-pants', 'Deserunt quae totam impedit. Tempore error dolorum eligendi autem tenetur.', 2428.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(671, 'Small Wooden Keyboard', '3705238046772', 'small-wooden-keyboard', 'Velit expedita fugiat officia vel et quis. Possimus commodi sint ut excepturi voluptate nihil libero maiores.', 3947.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(672, 'Rustic Marble Hat', '3530408267691', 'rustic-marble-hat', 'Dolorem quos qui ad suscipit. Occaecati illum necessitatibus molestiae neque voluptatum quia unde.', 990.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(673, 'Ergonomic Paper Shoes', '1736326190468', 'ergonomic-paper-shoes', 'Eius est debitis enim omnis ex quo. Quae voluptatem veniam esse.', 4382.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(674, 'Ergonomic Copper Chair', '4307634513743', 'ergonomic-copper-chair', 'Iste in laboriosam sit est ratione sit. Sunt sunt et est et expedita. Suscipit magnam quam qui laudantium.', 3922.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(675, 'Mediocre Iron Knife', '7997330173098', 'mediocre-iron-knife', 'Eveniet officiis vitae asperiores consequatur id. Quos voluptate ex quas magni suscipit nisi. Consectetur deleniti eum recusandae.', 1546.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(676, 'Synergistic Rubber Keyboard', '4368552764792', 'synergistic-rubber-keyboard', 'Amet aut et sint voluptas. Quia sit quasi impedit quis.', 3779.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(677, 'Synergistic Rubber Wallet', '4898930209213', 'synergistic-rubber-wallet', 'Eum illum aperiam incidunt quidem quia sunt. Aperiam omnis quis qui iusto porro. Cum non ipsam ex voluptatum.', 1428.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(678, 'Awesome Rubber Pants', '5557517262032', 'awesome-rubber-pants', 'Voluptatem quaerat quibusdam nihil autem sint beatae. Quas repellat voluptas id. Odio amet ab officia ea repudiandae porro quisquam.', 13.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(679, 'Practical Steel Lamp', '3693257291788', 'practical-steel-lamp', 'Dignissimos minima officiis et impedit necessitatibus repellendus. Unde officiis et sit animi animi laudantium est. Repellat possimus quibusdam ipsum soluta est quia nemo.', 2105.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(680, 'Incredible Copper Clock', '0226426168913', 'incredible-copper-clock', 'Architecto quae fugit repellat qui odit quibusdam consequatur deleniti. Dolorem eum et occaecati consequuntur.', 65.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(681, 'Intelligent Rubber Table', '5750793246769', 'intelligent-rubber-table', 'Occaecati pariatur non iure blanditiis architecto corrupti hic. Molestias possimus dolor impedit consequatur omnis voluptate. Mollitia quia consequuntur quaerat quia laborum omnis quo.', 226.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(682, 'Ergonomic Granite Lamp', '4585027289325', 'ergonomic-granite-lamp', 'Repellendus velit aut iusto quis. Et quibusdam sunt non eum in totam.', 1013.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(683, 'Mediocre Linen Clock', '0590900353363', 'mediocre-linen-clock', 'Harum est harum ut dolor voluptatibus adipisci. Nihil consequuntur sequi sed perspiciatis quia.', 610.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(684, 'Incredible Concrete Lamp', '9951139268209', 'incredible-concrete-lamp', 'Facere ad sunt autem id. Tenetur in nam numquam illum debitis.', 2067.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(685, 'Heavy Duty Cotton Table', '2338040969536', 'heavy-duty-cotton-table', 'Adipisci omnis velit neque voluptates ea a. Quis ullam consectetur accusamus. Quisquam voluptates voluptate quas rerum officia vero ut nemo.', 2993.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(686, 'Sleek Aluminum Bench', '6486303466127', 'sleek-aluminum-bench', 'Vero et eum facere qui doloribus commodi qui quas. Quam neque molestias aut. Perspiciatis sit consequatur perspiciatis architecto ab porro.', 586.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(687, 'Sleek Silk Chair', '7176427114316', 'sleek-silk-chair', 'Nobis rerum minima ut velit fuga eum et. Nesciunt quam nobis omnis qui. Qui placeat ut totam.', 4396.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(688, 'Lightweight Granite Chair', '9934796656602', 'lightweight-granite-chair', 'Doloremque quam quas sint at. Id aliquam ut aspernatur incidunt.', 1550.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(689, 'Enormous Silk Pants', '0998960830679', 'enormous-silk-pants', 'Est alias voluptas recusandae dolor fugiat quos. Ea autem deleniti amet. Molestias rerum et ut autem.', 940.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(690, 'Aerodynamic Rubber Pants', '2904136197376', 'aerodynamic-rubber-pants', 'Voluptas natus id esse aut ratione velit. Libero ut tempore dolores natus omnis laboriosam quos. Dolore maiores unde repellendus quia praesentium vitae.', 3754.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(691, 'Incredible Linen Clock', '2172685362198', 'incredible-linen-clock', 'Cumque impedit aut sapiente ut voluptatem. Deleniti nesciunt rerum aut.', 2059.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(692, 'Gorgeous Rubber Keyboard', '4412620725717', 'gorgeous-rubber-keyboard', 'Sunt repellat necessitatibus quidem tempore voluptatibus mollitia. Nihil rerum minima aperiam quos eos.', 4282.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(693, 'Incredible Marble Car', '5754031060254', 'incredible-marble-car', 'Exercitationem cumque et et voluptas quam labore expedita quia. Id et dolores perspiciatis sint in hic autem. Nulla quam id sint nostrum placeat.', 1756.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(694, 'Ergonomic Rubber Keyboard', '0080405377570', 'ergonomic-rubber-keyboard', 'Quo rerum quas autem nihil non. Voluptate ea facere ipsum accusantium consequatur.', 796.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(695, 'Ergonomic Wooden Clock', '3761407251002', 'ergonomic-wooden-clock', 'Rerum explicabo id placeat labore ut magnam perspiciatis eos. Et excepturi laborum minima similique ipsam. Libero temporibus aperiam rem aut eius ut tenetur totam.', 4448.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(696, 'Gorgeous Steel Chair', '3507341138791', 'gorgeous-steel-chair', 'Deleniti perferendis voluptate magni architecto. Est dolores adipisci quis perspiciatis rerum. Nemo aut nemo sed eligendi dolorum.', 2770.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(697, 'Gorgeous Wooden Shoes', '7827411674605', 'gorgeous-wooden-shoes', 'Et vel distinctio veritatis eos id. Ratione officia impedit fugit ut. Consequatur et molestias temporibus nihil numquam nihil odit.', 3468.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(698, 'Synergistic Wool Bag', '8204493138406', 'synergistic-wool-bag', 'Et est consectetur voluptatem omnis omnis dolores. Quia consequatur ea sit est excepturi culpa. Ullam maiores necessitatibus odit sunt.', 2682.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(699, 'Intelligent Aluminum Gloves', '5358753290304', 'intelligent-aluminum-gloves', 'Nobis quo aut labore aperiam. Sed tenetur sunt vel minus voluptatem at. Dolorem eaque sint voluptas inventore.', 802.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(700, 'Sleek Rubber Pants', '6926655314900', 'sleek-rubber-pants', 'Eaque libero dolorum harum facere quo sequi. Voluptas optio soluta omnis laboriosam quaerat ab voluptatem. Totam dolores velit iste voluptatum nihil ea.', 3229.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(701, 'Synergistic Rubber Knife', '4955865987132', 'synergistic-rubber-knife', 'Eum non reiciendis doloremque ullam quia architecto. Debitis et laboriosam corporis laboriosam non delectus aperiam.', 4115.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(702, 'Small Wooden Shirt', '1252088570152', 'small-wooden-shirt', 'Sed dolor facere commodi et molestias. Architecto excepturi id praesentium dolorem eveniet veritatis. Perferendis ipsa ab ea sit sed dolores sunt.', 1167.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(703, 'Awesome Paper Bag', '5999714086200', 'awesome-paper-bag', 'Excepturi deserunt facere eaque magni aliquam. Nulla ab a ut ab.', 3135.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(704, 'Aerodynamic Iron Keyboard', '9916617146547', 'aerodynamic-iron-keyboard', 'Omnis quia ipsam aut. Aut aut eaque labore sint natus praesentium harum ducimus. Qui sequi officia dolor perferendis veniam quo distinctio.', 1431.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(705, 'Gorgeous Steel Bottle', '0951627575979', 'gorgeous-steel-bottle', 'Molestias est officia vel incidunt. Velit perferendis quae esse optio. A odio sint voluptas itaque rerum.', 890.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(706, 'Synergistic Leather Table', '7914622456509', 'synergistic-leather-table', 'Eum laudantium neque quia consequuntur. Et et hic illo sed beatae facere accusantium excepturi.', 3708.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(707, 'Small Cotton Shirt', '1048704745178', 'small-cotton-shirt', 'Incidunt corrupti consequatur omnis numquam. Voluptatum inventore illo quam deserunt. Suscipit iure quia ut est quibusdam.', 1607.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(708, 'Intelligent Iron Keyboard', '2866908661426', 'intelligent-iron-keyboard', 'Quos explicabo sed et. Consequatur vero dolorem vitae et unde nihil.', 4382.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(709, 'Synergistic Iron Bottle', '7124629532018', 'synergistic-iron-bottle', 'Porro et dolores voluptatem rerum. Dolorem et officia nulla quo velit.', 3379.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(710, 'Practical Leather Bench', '8203004912481', 'practical-leather-bench', 'Autem ea vel molestiae pariatur id. Qui sed doloribus mollitia culpa sit aliquam.', 4324.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(711, 'Intelligent Linen Knife', '9374677342604', 'intelligent-linen-knife', 'Eius cumque blanditiis magnam perferendis culpa dolor. Consequatur natus fugiat qui velit aperiam culpa qui.', 3971.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(712, 'Heavy Duty Granite Coat', '0014471101104', 'heavy-duty-granite-coat', 'Accusamus a porro possimus. Numquam nulla cupiditate sed corporis blanditiis id ut. Maiores possimus et voluptatem.', 2806.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(713, 'Gorgeous Wooden Watch', '1903610678852', 'gorgeous-wooden-watch', 'Est aut necessitatibus exercitationem excepturi fugit ea atque. Eos magni non repellendus voluptatem nam quod et quia.', 4232.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(714, 'Practical Wooden Plate', '9357806383457', 'practical-wooden-plate', 'Temporibus molestiae corrupti voluptatum accusamus non recusandae. Ut ut eos repellendus enim iure reprehenderit ut. Iure aperiam alias neque ea.', 2620.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(715, 'Rustic Iron Keyboard', '3438762001886', 'rustic-iron-keyboard', 'Eos ipsa itaque voluptates voluptatem velit consectetur minima. Sapiente quibusdam quia quia consequuntur.', 1985.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(716, 'Small Marble Lamp', '7094841148970', 'small-marble-lamp', 'Perferendis vero deleniti minima quia consequatur ea. Repellendus quia saepe ut eos consequatur.', 4288.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(717, 'Sleek Bronze Clock', '1222760557061', 'sleek-bronze-clock', 'Occaecati aut voluptatum et consectetur ea. Consequatur quam ut id suscipit.', 2295.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(718, 'Incredible Iron Plate', '9837862244683', 'incredible-iron-plate', 'Porro consequatur impedit qui illo consectetur consequatur. Placeat accusantium voluptatibus blanditiis enim. Autem perferendis fuga quo at est voluptatum maiores.', 4263.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(719, 'Enormous Wooden Hat', '6943570823256', 'enormous-wooden-hat', 'Soluta commodi natus tempora officia. Quae tempore maiores delectus minus aperiam illum sit fugit.', 3146.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(720, 'Gorgeous Paper Watch', '7872343963525', 'gorgeous-paper-watch', 'Consectetur doloremque repellat eaque nesciunt qui. Deleniti consectetur doloremque nihil velit dolorem aliquid illum.', 3002.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(721, 'Heavy Duty Linen Keyboard', '3525502797311', 'heavy-duty-linen-keyboard', 'Vel illum quae cumque fuga non. Aperiam ut omnis blanditiis molestiae. Occaecati cumque omnis omnis laborum similique laborum voluptas.', 2491.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(722, 'Lightweight Iron Coat', '2270439477973', 'lightweight-iron-coat', 'Perspiciatis sit sed qui numquam cum. Deleniti enim ipsum occaecati quae officia commodi dolor facilis.', 3326.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(723, 'Gorgeous Bronze Gloves', '8210015413609', 'gorgeous-bronze-gloves', 'Quos vel eligendi sapiente exercitationem aut explicabo voluptatibus dolores. Ut repellendus reiciendis voluptates et fugiat hic.', 158.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(724, 'Sleek Concrete Pants', '2867940196709', 'sleek-concrete-pants', 'Porro qui voluptas placeat sit. Explicabo eos tempora qui laborum occaecati rerum molestias. Eos distinctio voluptatem dolorem dolores non.', 4627.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(725, 'Mediocre Copper Bag', '3537106339446', 'mediocre-copper-bag', 'Architecto velit dolore quod aut quidem molestias qui. Nihil earum iusto deleniti maiores doloremque.', 1040.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(726, 'Gorgeous Rubber Clock', '7103852358077', 'gorgeous-rubber-clock', 'Alias eaque nihil architecto. Illo molestiae placeat aliquam. Quaerat consectetur illum aut qui provident.', 1920.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(727, 'Small Plastic Knife', '4098444434600', 'small-plastic-knife', 'Voluptatum dolore praesentium porro ipsum ab dolorem. Aperiam earum eos blanditiis praesentium adipisci officia.', 333.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(728, 'Sleek Silk Lamp', '3161131647674', 'sleek-silk-lamp', 'Vel blanditiis illum voluptates placeat qui. Ad modi et consequatur exercitationem quasi nesciunt vitae.', 4044.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(729, 'Lightweight Wool Gloves', '8646348475005', 'lightweight-wool-gloves', 'Aut ea corrupti ducimus sint ipsum commodi harum sed. Repellendus est voluptates earum quas laboriosam.', 3344.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(730, 'Durable Steel Shoes', '6528712144057', 'durable-steel-shoes', 'Sed eveniet a sit eum. Sit sint accusantium fuga eos eos facilis aut in. Autem ipsa ad voluptatem aut.', 4373.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(731, 'Aerodynamic Paper Keyboard', '9410151820883', 'aerodynamic-paper-keyboard', 'Culpa pariatur velit voluptates ratione. Nostrum laboriosam iure est aut nihil architecto. Quas est dignissimos ratione autem.', 4233.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(732, 'Awesome Plastic Plate', '6873006467467', 'awesome-plastic-plate', 'Vero molestiae voluptate quibusdam ut expedita cum. Provident excepturi quod dolore quibusdam voluptatem consequuntur fuga sint.', 4999.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(733, 'Enormous Copper Shirt', '4778045058770', 'enormous-copper-shirt', 'Itaque deserunt maxime aut quo dolor. A aperiam cupiditate doloremque modi similique.', 1373.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(734, 'Rustic Concrete Pants', '9615221215457', 'rustic-concrete-pants', 'Et praesentium provident expedita et consequuntur porro consequatur. Culpa similique cupiditate rem minus aperiam et.', 943.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(735, 'Heavy Duty Steel Bag', '6025300218126', 'heavy-duty-steel-bag', 'Repellendus autem corrupti magnam consequatur. Aspernatur voluptas voluptas velit.', 244.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(736, 'Practical Aluminum Shoes', '6190910247306', 'practical-aluminum-shoes', 'Minus tempore repellat non eius labore doloribus quos. Aliquid ratione sunt excepturi et consequuntur earum beatae. Facere cumque magni assumenda iste placeat corrupti.', 4102.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(737, 'Intelligent Bronze Knife', '5514934301553', 'intelligent-bronze-knife', 'Blanditiis voluptatem saepe accusamus molestiae asperiores non. Placeat cupiditate doloribus accusantium ipsum esse. Magnam voluptatem neque officiis quisquam.', 1253.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(738, 'Intelligent Paper Bench', '2346084808834', 'intelligent-paper-bench', 'Ipsa rerum consequatur aut fuga vel. Et recusandae quaerat modi saepe.', 118.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(739, 'Mediocre Rubber Plate', '8059871377140', 'mediocre-rubber-plate', 'Quia quis dicta maxime ratione est laborum. Accusantium maiores officia harum autem sit. Et et natus dolore ratione.', 2205.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(740, 'Ergonomic Plastic Keyboard', '2094535744421', 'ergonomic-plastic-keyboard', 'Accusantium voluptates ducimus ut doloremque aut est sapiente. Voluptatem odio deleniti expedita et fuga asperiores ab rerum. Nihil rem qui dolorem libero dolores sunt.', 312.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(741, 'Incredible Iron Keyboard', '1189894143174', 'incredible-iron-keyboard', 'Commodi ea porro illum aliquid similique qui corrupti commodi. Rem quia nesciunt explicabo nihil ut sunt. Molestiae error rerum quia quo.', 563.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(742, 'Sleek Granite Pants', '6131451514311', 'sleek-granite-pants', 'Impedit beatae tenetur omnis et autem. Doloremque tempore veniam aliquam et repudiandae provident iste. Aut aut repellendus vero voluptas earum at.', 1092.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(743, 'Sleek Marble Lamp', '7004366014216', 'sleek-marble-lamp', 'Libero similique illum tenetur odit tenetur et numquam. Iste voluptatem quo possimus hic. Laboriosam eaque ipsum placeat error aut.', 3536.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(744, 'Fantastic Leather Keyboard', '4634693086599', 'fantastic-leather-keyboard', 'Culpa maxime nobis qui velit fugiat. Repellat ab doloribus quis ea et porro possimus.', 4475.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(745, 'Intelligent Bronze Table', '8644923977456', 'intelligent-bronze-table', 'Accusamus nam est fugit et laborum quod. Iste quo aut et omnis. Ea nihil in quia qui voluptatem tempora.', 804.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(746, 'Durable Aluminum Coat', '1908430529872', 'durable-aluminum-coat', 'Voluptas in est ipsum dolores distinctio beatae et velit. Ut autem et aut quasi a. Est quis minus excepturi eligendi commodi maiores nobis molestiae.', 2305.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(747, 'Sleek Silk Plate', '0323427733895', 'sleek-silk-plate', 'Cum fugiat voluptates et est. Ut voluptas accusamus est qui molestiae vero accusantium.', 1738, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(748, 'Rustic Wool Shoes', '7302512998831', 'rustic-wool-shoes', 'Soluta voluptatum aliquid aliquid officia. Vel quidem sequi omnis dolores assumenda aut.', 2539.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(749, 'Fantastic Steel Bag', '5359284429508', 'fantastic-steel-bag', 'Velit enim quibusdam molestias. Impedit sit deleniti et quae est voluptas pariatur alias.', 3906.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(750, 'Durable Copper Bench', '2688812433285', 'durable-copper-bench', 'Nam iusto rerum sapiente qui. Est autem facilis tempore hic.', 1598.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(751, 'Durable Copper Bag', '7713937463093', 'durable-copper-bag', 'Aut aut est earum enim. Iure doloremque quia reiciendis fugit sapiente debitis.', 3027.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(752, 'Small Copper Shirt', '8339448752625', 'small-copper-shirt', 'Magnam nisi asperiores suscipit quis. Quis earum id nam reprehenderit quia doloribus sed. Quod delectus eveniet dolor aliquid.', 2495.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(753, 'Incredible Leather Plate', '1388767054658', 'incredible-leather-plate', 'Voluptatibus sequi voluptatem porro sit qui illum eos. Ut voluptas excepturi ab est corrupti voluptatum.', 638.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(754, 'Incredible Linen Keyboard', '2766066690606', 'incredible-linen-keyboard', 'Sit quaerat non veritatis quas. Eum aut ea et eligendi ut. Maiores est velit vel veniam.', 690.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(755, 'Lightweight Paper Clock', '2186331355243', 'lightweight-paper-clock', 'Commodi doloremque ut dolorem iusto quia. Voluptatem sunt enim expedita aut in voluptatem.', 3913.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(756, 'Incredible Marble Watch', '9168871098920', 'incredible-marble-watch', 'Alias voluptatibus iste illum rerum. Incidunt harum aperiam reiciendis voluptatem.', 857.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(757, 'Small Bronze Bottle', '8000012206218', 'small-bronze-bottle', 'Voluptatum modi perspiciatis labore deserunt dolor. Voluptatum ducimus velit deleniti illo. Omnis dolorum ex tempora eveniet nostrum voluptatibus molestiae enim.', 4257.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(758, 'Gorgeous Concrete Keyboard', '6618049815277', 'gorgeous-concrete-keyboard', 'Voluptatem consectetur veritatis ex soluta velit et et. Ut inventore vero natus.', 460.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(759, 'Incredible Iron Shirt', '4854402257441', 'incredible-iron-shirt', 'Unde eos quos eveniet earum et est autem sed. Harum occaecati fugiat aut.', 805.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(760, 'Mediocre Silk Knife', '4500753060802', 'mediocre-silk-knife', 'Labore reiciendis rerum aut amet nulla voluptas. Laudantium iure reprehenderit et adipisci. Dolores atque consequatur vitae nemo aut impedit doloremque.', 1076.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(761, 'Synergistic Silk Bag', '0308737677473', 'synergistic-silk-bag', 'Sit odio laudantium tempore reprehenderit officia quo laborum id. Eveniet architecto ut deleniti quibusdam omnis.', 281.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(762, 'Intelligent Cotton Bench', '8503495263148', 'intelligent-cotton-bench', 'Eaque consequuntur qui vitae ut. Ducimus numquam optio suscipit voluptatem qui nulla. Laudantium natus et sapiente est omnis.', 2872.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(763, 'Gorgeous Wooden Knife', '2046721788276', 'gorgeous-wooden-knife', 'Dolores eaque id suscipit qui quis ut porro. Minima rem ab ut rerum dolores. Recusandae similique et optio eum.', 2937.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(764, 'Ergonomic Concrete Clock', '6984472932042', 'ergonomic-concrete-clock', 'Quo eligendi quisquam omnis non odit repudiandae. Accusamus eaque dicta sint voluptates quas qui.', 4910.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(765, 'Synergistic Copper Keyboard', '5122207495412', 'synergistic-copper-keyboard', 'Temporibus repellendus est modi magni ut enim corporis. Minima quia tenetur odio. Aliquam voluptatem architecto molestiae in consequatur sit quia.', 4087.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(766, 'Durable Iron Computer', '2213893341534', 'durable-iron-computer', 'Velit eum veritatis rerum dolores molestias labore. Omnis quas odio illo aliquid sapiente est tempora. Quo quae ut atque.', 1155.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(767, 'Fantastic Linen Plate', '0913082139103', 'fantastic-linen-plate', 'Quia eligendi est doloremque iure. Fugit sed omnis illum libero tenetur tempore. Non unde eveniet repellat dolor accusamus dolorem distinctio.', 2148.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(768, 'Fantastic Plastic Wallet', '2304229687416', 'fantastic-plastic-wallet', 'Est debitis aliquam vel aut. Sed sunt quia fuga in repellendus doloribus. Esse et deserunt id nisi et.', 1421.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(769, 'Incredible Paper Clock', '3816923221074', 'incredible-paper-clock', 'Reiciendis harum odio amet et. Repudiandae eum officia est adipisci tenetur magni blanditiis. Eos perspiciatis id dolore eum exercitationem qui nostrum.', 3240.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(770, 'Awesome Rubber Table', '4293248764391', 'awesome-rubber-table', 'Earum quo repellat corporis eius cumque. Accusamus voluptas natus molestiae repellat qui nesciunt quia. Sit rerum excepturi error voluptas sequi non.', 4219.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(771, 'Incredible Linen Bag', '3523819667679', 'incredible-linen-bag', 'Voluptatum sequi nam unde eos consectetur quod consequatur. Quia molestias dolorem neque est itaque.', 1810.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(772, 'Intelligent Steel Lamp', '5511501303743', 'intelligent-steel-lamp', 'Mollitia sunt inventore reiciendis dolorem placeat enim ad rerum. Ea assumenda ut ex consectetur repellat.', 2024.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(773, 'Synergistic Silk Shirt', '9987736455285', 'synergistic-silk-shirt', 'Dolores consequatur impedit et voluptatem minus similique rerum. Officia nisi ducimus fuga perspiciatis perferendis esse odit.', 584.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(774, 'Durable Cotton Coat', '0141731340970', 'durable-cotton-coat', 'Id nostrum saepe tempora distinctio illum ullam. Quia est iusto illum aut sit repudiandae.', 2700.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(775, 'Ergonomic Linen Pants', '7698870453502', 'ergonomic-linen-pants', 'Quo enim ipsam sequi et voluptatem adipisci eum voluptatem. Facere ullam eaque quae dolorem.', 2259.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(776, 'Sleek Bronze Hat', '4237061802489', 'sleek-bronze-hat', 'Quidem asperiores reprehenderit voluptatem quod rerum temporibus. Hic minus maxime eum numquam ut. Esse aut sit qui mollitia voluptas.', 1281, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(777, 'Sleek Granite Shoes', '9552645145208', 'sleek-granite-shoes', 'Laudantium maxime ad ex accusantium. Aliquid mollitia dolor impedit atque unde aut eaque quas.', 1073.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(778, 'Small Silk Plate', '9751851949604', 'small-silk-plate', 'Consectetur non iusto ipsum molestias eveniet est ratione. Dolores consectetur vel mollitia quisquam quos.', 1740.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(779, 'Awesome Plastic Wallet', '3415681197494', 'awesome-plastic-wallet', 'Nesciunt omnis alias dolorem possimus impedit. Officiis repellat illo itaque accusantium assumenda mollitia a. Voluptatum et aliquam corporis sequi est.', 3773.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(780, 'Aerodynamic Silk Bag', '8195808807646', 'aerodynamic-silk-bag', 'Laborum enim qui iusto et hic molestiae deserunt. Unde dolor dolorem maxime unde quo.', 3371.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(781, 'Durable Silk Hat', '8764212607540', 'durable-silk-hat', 'Saepe exercitationem et veniam libero. Vel nulla repellat ex tenetur.', 4590.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(782, 'Ergonomic Leather Chair', '6246541176079', 'ergonomic-leather-chair', 'Voluptatem esse omnis doloremque in atque aperiam necessitatibus. Voluptate dolor et ratione id. Ut accusamus fugiat necessitatibus voluptas.', 2468.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(783, 'Gorgeous Bronze Table', '0741333495230', 'gorgeous-bronze-table', 'Consequuntur magni labore magnam fuga expedita adipisci a. Qui rerum nihil qui itaque. Eaque et ipsum reiciendis omnis provident esse alias totam.', 162.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(784, 'Durable Copper Coat', '3650822025094', 'durable-copper-coat', 'Nobis aut sed minima repudiandae ut eos. Qui nemo ut esse quia. Incidunt vel sit ipsa qui facilis vel.', 1743.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(785, 'Intelligent Paper Computer', '0147767192422', 'intelligent-paper-computer', 'Quisquam quo non qui. Repudiandae illo architecto distinctio voluptas voluptas et. Temporibus et aut saepe.', 715.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(786, 'Synergistic Plastic Clock', '1238235076517', 'synergistic-plastic-clock', 'Et cupiditate dolores quas ratione et. Hic sunt voluptas rerum maiores iure fugiat non. Eos quod aut dolores aut quia.', 1975.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(787, 'Fantastic Rubber Shirt', '2030324675699', 'fantastic-rubber-shirt', 'Nam illum est voluptas rerum dolores nihil dolorem tempora. Quos optio voluptas est. Cum illo temporibus iste fugiat amet placeat.', 2192.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(788, 'Fantastic Concrete Pants', '8226784482449', 'fantastic-concrete-pants', 'Reprehenderit iste non optio veniam voluptates. Consequatur rerum consectetur neque perspiciatis aliquid.', 2287.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(789, 'Mediocre Silk Shirt', '0202855324663', 'mediocre-silk-shirt', 'Dolorem aut voluptatum tempore minus ut. Facilis quo sed incidunt consequatur quo. Hic voluptatem ab neque debitis.', 2916.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(790, 'Gorgeous Concrete Computer', '8105148756825', 'gorgeous-concrete-computer', 'Placeat ut aspernatur accusamus. Tempora eligendi molestias cupiditate sint rerum. Ut odit ut sed totam ea laborum hic.', 117.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(791, 'Awesome Wooden Keyboard', '2665265767013', 'awesome-wooden-keyboard', 'Rerum et eveniet aut molestias est corrupti ut. Ea sunt ratione nisi sequi sed aut qui.', 1414.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(792, 'Durable Plastic Keyboard', '5623203614949', 'durable-plastic-keyboard', 'Omnis delectus nobis ut ea voluptas. Fuga consequatur saepe inventore perspiciatis aspernatur molestias nemo eum.', 3895.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(793, 'Aerodynamic Iron Wallet', '7603365511681', 'aerodynamic-iron-wallet', 'Ut aut dignissimos placeat dignissimos id molestias. Libero minus voluptas rem provident ducimus aspernatur corrupti minus.', 628.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(794, 'Awesome Copper Wallet', '8834950266726', 'awesome-copper-wallet', 'Vel recusandae qui rerum. Error velit eos dolore.', 4398.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(795, 'Incredible Concrete Table', '5496823021035', 'incredible-concrete-table', 'Voluptatum recusandae cum aut eligendi omnis. Corrupti voluptas optio architecto illo adipisci voluptates nihil.', 3610.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(796, 'Enormous Leather Bag', '2769250674468', 'enormous-leather-bag', 'Vero nulla nobis atque. Dolores enim perferendis magnam cum a et. Iure maiores quia non dolorum ipsam distinctio inventore.', 1667.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(797, 'Sleek Cotton Pants', '5624795863142', 'sleek-cotton-pants', 'Velit ullam culpa velit ex hic deleniti. Voluptas quibusdam nisi fugiat enim reiciendis.', 2358.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(798, 'Ergonomic Paper Plate', '3154211467545', 'ergonomic-paper-plate', 'Tempora voluptate nam sapiente rerum et mollitia. Libero distinctio vel ut non dolorem. Quo doloribus ex sed ullam ut est.', 4610.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(799, 'Enormous Marble Watch', '7512614601984', 'enormous-marble-watch', 'Facere cum sint corporis omnis soluta a omnis. Enim saepe ratione aut possimus.', 1121.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(800, 'Gorgeous Silk Bench', '1178666928804', 'gorgeous-silk-bench', 'Voluptatem suscipit totam sit quis rem impedit rerum. Qui id id nesciunt voluptatibus doloribus.', 296.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(801, 'Heavy Duty Rubber Gloves', '4005806939987', 'heavy-duty-rubber-gloves', 'Asperiores voluptatem porro dolores dignissimos. Et consequuntur quia libero exercitationem sunt qui.', 97.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(802, 'Durable Granite Chair', '8519782117988', 'durable-granite-chair', 'Quia et suscipit esse aut nisi quibusdam cupiditate. Quidem sit tenetur dolorem laudantium accusamus excepturi. Illum sunt voluptates at voluptatum doloribus eum.', 2239.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(803, 'Practical Marble Lamp', '7823369813158', 'practical-marble-lamp', 'Et fugit incidunt et est vel maiores. Debitis architecto quis provident iusto dolor dolores.', 3833.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(804, 'Durable Cotton Bottle', '7870800782658', 'durable-cotton-bottle', 'Corporis est unde sint sunt. Nisi dolor quia necessitatibus similique eius harum cum. Minus ipsam deserunt sed et neque.', 3999.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(805, 'Rustic Cotton Clock', '1694960795114', 'rustic-cotton-clock', 'Quam molestiae eaque ipsa. Iure id consequatur recusandae ullam quidem asperiores. Sit sit consectetur et accusamus est voluptatum.', 3083.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(806, 'Sleek Iron Plate', '0236807777948', 'sleek-iron-plate', 'Nihil et dignissimos consectetur. Iure odio est nisi aut.', 387.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(807, 'Enormous Wool Chair', '6974322618837', 'enormous-wool-chair', 'Autem aliquid iure earum. Voluptatem officia in fugit ipsum quibusdam est et quia. Fugit odit ipsum quos.', 3359.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(808, 'Heavy Duty Silk Pants', '3181050100142', 'heavy-duty-silk-pants', 'Recusandae similique asperiores quidem blanditiis saepe voluptatem sunt atque. Qui et facilis necessitatibus deserunt non dolorum. Velit illum provident molestias.', 4757.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(809, 'Small Cotton Bag', '2203405730475', 'small-cotton-bag', 'Deleniti suscipit libero soluta deserunt id eum quis. Hic praesentium quidem quia. Esse quod et laboriosam.', 3450.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(810, 'Enormous Paper Chair', '2927513402313', 'enormous-paper-chair', 'Culpa omnis aut quos id consequatur corporis cum. Neque qui ullam voluptatem magnam ullam ratione eum. Accusantium quia et quia neque aut accusantium occaecati.', 2836.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(811, 'Ergonomic Bronze Bag', '6277532891657', 'ergonomic-bronze-bag', 'Est aliquid consectetur dolore illum explicabo eaque et. Soluta odit magnam accusamus est et.', 3095.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(812, 'Small Steel Clock', '2935788034467', 'small-steel-clock', 'Consequatur nam quia consectetur aut blanditiis. Eligendi quo repudiandae repellat placeat aliquid ea. Labore quo ipsa id beatae.', 1615.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(813, 'Heavy Duty Cotton Hat', '6438232797438', 'heavy-duty-cotton-hat', 'Laborum voluptas similique quas expedita. Ipsam debitis itaque vel asperiores ipsa. Aut voluptatibus inventore labore et velit deleniti.', 1535.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(814, 'Ergonomic Rubber Coat', '4625220939693', 'ergonomic-rubber-coat', 'Et deserunt commodi nobis quasi dicta. Vero debitis quo quia qui soluta veniam ad.', 3741.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(815, 'Rustic Copper Gloves', '1458060270052', 'rustic-copper-gloves', 'Libero eveniet alias non magnam. Molestiae assumenda sit quia sit ea voluptatem voluptatem officia. Sit commodi sequi corporis vitae qui eum rerum aliquam.', 4852.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(816, 'Enormous Cotton Coat', '2855797286742', 'enormous-cotton-coat', 'Numquam aut iste molestiae suscipit doloremque magnam. Aut inventore vitae adipisci earum pariatur eius in. Et eum veniam quis ullam recusandae at.', 2825.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(817, 'Synergistic Concrete Hat', '4143366813634', 'synergistic-concrete-hat', 'Voluptatem vel reiciendis velit ad ipsum quidem. Repudiandae maiores totam sed numquam fugiat ea provident eos. Ea atque quos odio voluptatem.', 4746.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(818, 'Rustic Marble Wallet', '8512606364766', 'rustic-marble-wallet', 'Commodi impedit et voluptas consequatur ad. Alias non laborum reiciendis qui quaerat. Praesentium quis consequuntur incidunt totam facere dolores.', 3673.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(819, 'Synergistic Granite Coat', '5185512955651', 'synergistic-granite-coat', 'Necessitatibus rerum cumque deleniti mollitia sit saepe. Dolor porro sit rerum harum dignissimos sapiente porro sint.', 4328.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(820, 'Gorgeous Bronze Keyboard', '7248044790003', 'gorgeous-bronze-keyboard', 'Est reprehenderit quidem voluptatem odit sit quae. Et facilis soluta assumenda aliquam autem dolores ipsam iste. Praesentium sunt praesentium laborum.', 3904.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(821, 'Small Wooden Coat', '5929991282057', 'small-wooden-coat', 'Tempore aperiam voluptatem maxime aut voluptatem odio. Odio nihil consequuntur sed quae non.', 3123.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(822, 'Mediocre Steel Knife', '8001536697636', 'mediocre-steel-knife', 'Maiores voluptatem impedit officia vitae. Sunt eius minima et tempore eos facilis. Et dolor nesciunt at hic voluptas molestiae.', 2455.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(823, 'Lightweight Bronze Wallet', '6798897746401', 'lightweight-bronze-wallet', 'Dolorem aliquam pariatur facere quia maiores quisquam voluptatem. Ea deserunt non ipsam officia sequi.', 1281.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(824, 'Enormous Silk Shoes', '6257545329903', 'enormous-silk-shoes', 'Sequi debitis eius quasi est facere aut. Et temporibus nisi in commodi adipisci qui nemo ea. Sit exercitationem sed voluptatum et natus.', 3996.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(825, 'Enormous Bronze Knife', '4993051956067', 'enormous-bronze-knife', 'Repellendus beatae sequi et. Natus ab enim rerum eveniet dolor. Quis aut inventore doloribus et nihil iure.', 4602.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(826, 'Aerodynamic Cotton Lamp', '2675337089004', 'aerodynamic-cotton-lamp', 'Dicta aliquid non ab aliquam. Ipsum et rerum nobis possimus quia et nihil blanditiis. Necessitatibus est aut voluptas aspernatur blanditiis.', 811.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(827, 'Practical Marble Watch', '9289943849049', 'practical-marble-watch', 'Eligendi ut et et magni. Perspiciatis et ut reprehenderit officiis. Commodi temporibus odio rerum iusto minima ut autem.', 2106.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(828, 'Sleek Paper Bag', '3483288503710', 'sleek-paper-bag', 'Voluptatem ratione impedit dicta eos itaque a dolorem. Impedit est vitae ut quos quis. Animi neque placeat ad hic et doloribus ipsam.', 1017.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(829, 'Small Linen Plate', '8703243306909', 'small-linen-plate', 'Sint ratione consequatur eum saepe voluptates. Laudantium nostrum repellat iure.', 4880.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(830, 'Sleek Wool Bag', '7240790462425', 'sleek-wool-bag', 'Et velit deleniti nisi occaecati. Eius quo est facere aut ut sint.', 4294.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(831, 'Fantastic Rubber Watch', '7751157060241', 'fantastic-rubber-watch', 'Est labore ut atque aut. Omnis tempore ratione veritatis ullam eos eligendi totam. Ut quas voluptates perspiciatis sunt facere.', 1761, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(832, 'Rustic Steel Shirt', '7697520305369', 'rustic-steel-shirt', 'Nostrum id libero dolores commodi est eos. Delectus inventore cumque dolor veniam quae voluptas aut. Eos doloremque similique sunt ut.', 1884.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(833, 'Aerodynamic Silk Shoes', '7449659755016', 'aerodynamic-silk-shoes', 'Molestiae rem vitae et exercitationem esse. Pariatur veniam cum est nobis quasi dolor est debitis.', 1569.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(834, 'Heavy Duty Rubber Table', '0215800243582', 'heavy-duty-rubber-table', 'Ab eveniet adipisci id id. Voluptas quia quisquam officia corrupti et recusandae et esse.', 3768.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(835, 'Heavy Duty Linen Bench', '2810054964887', 'heavy-duty-linen-bench', 'Consequatur fugit doloribus accusamus voluptatum. Voluptatem neque accusantium nam debitis et voluptate nihil.', 2746, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(836, 'Aerodynamic Wooden Hat', '2181203826647', 'aerodynamic-wooden-hat', 'Quasi error quia praesentium laborum eligendi nostrum. Nisi maiores aspernatur et omnis distinctio amet hic. Eaque rem odit totam quibusdam a et tenetur voluptatem.', 888.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(837, 'Rustic Rubber Knife', '1106158049836', 'rustic-rubber-knife', 'Consequatur molestiae possimus qui atque ducimus est. Et debitis sint perspiciatis facere quia.', 1683.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(838, 'Heavy Duty Aluminum Shoes', '0255053164609', 'heavy-duty-aluminum-shoes', 'Nihil quia minus enim omnis et aut officia. Ut corporis aperiam quam animi tempora voluptatem est.', 2768.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(839, 'Small Steel Bottle', '7429399637162', 'small-steel-bottle', 'Quia dignissimos consectetur sunt magni magnam sunt. Ab sit doloribus voluptatibus vero dolores facere.', 3568.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(840, 'Sleek Concrete Hat', '9522266829399', 'sleek-concrete-hat', 'Nisi laudantium labore sit. Molestiae optio tempore quo labore. Aspernatur cum distinctio praesentium quis.', 3821.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(841, 'Aerodynamic Wool Gloves', '2290406447143', 'aerodynamic-wool-gloves', 'Accusamus suscipit distinctio commodi inventore sed dolores. Quibusdam incidunt ut similique.', 1859, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(842, 'Heavy Duty Wooden Wallet', '4418702505918', 'heavy-duty-wooden-wallet', 'Blanditiis est soluta sint provident. Laboriosam sed ipsam vero. Quis fugiat sed modi labore aliquid voluptatibus.', 734.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(843, 'Awesome Paper Bench', '8210047322047', 'awesome-paper-bench', 'Qui sunt facilis non earum nostrum. Fugiat explicabo sunt illo sint ut. Exercitationem animi facere quia sapiente.', 4534.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(844, 'Lightweight Copper Lamp', '9156618561622', 'lightweight-copper-lamp', 'Voluptatem voluptatem natus vitae asperiores iure ea. Ipsam non ut cumque.', 2300.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(845, 'Rustic Wool Bench', '7814074586628', 'rustic-wool-bench', 'Et reiciendis necessitatibus eligendi enim eum nulla. Qui at nihil sit. Sunt natus quisquam eius earum.', 1039.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(846, 'Incredible Bronze Chair', '8565589908434', 'incredible-bronze-chair', 'Rerum sit temporibus rem provident iure. Tenetur quidem similique consequatur quia eos. Cum quis laudantium aut quaerat voluptatem adipisci.', 2996.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(847, 'Lightweight Granite Keyboard', '3587503055944', 'lightweight-granite-keyboard', 'Reiciendis labore et quod est reprehenderit sint. Quasi libero est harum blanditiis.', 4641.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(848, 'Lightweight Plastic Shirt', '7281491991388', 'lightweight-plastic-shirt', 'Cupiditate quo nesciunt inventore tenetur fugiat voluptatem. Laboriosam tenetur necessitatibus eius corporis voluptates.', 2941.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(849, 'Durable Wooden Bag', '8346873667028', 'durable-wooden-bag', 'Omnis ut quam consectetur aperiam aut ut nemo deserunt. Et aut quibusdam minus et officiis atque.', 3032.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(850, 'Lightweight Bronze Hat', '9018672836880', 'lightweight-bronze-hat', 'Ut et ut et est qui dolorum. Sunt qui ex nostrum sit aut.', 4347.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(851, 'Synergistic Linen Bottle', '2776089909050', 'synergistic-linen-bottle', 'Exercitationem ipsam corrupti blanditiis excepturi doloribus minus. Sed fugit ex non nihil est. Amet blanditiis perferendis autem et magni.', 4303.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(852, 'Synergistic Plastic Hat', '3273131419172', 'synergistic-plastic-hat', 'Quia dignissimos dolores est et accusantium commodi explicabo sunt. Distinctio et neque neque quae quam.', 1863.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(853, 'Gorgeous Cotton Lamp', '6878637912867', 'gorgeous-cotton-lamp', 'Commodi ut ad omnis officiis. Molestias dolorem nihil saepe velit ullam ut adipisci.', 2321.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(854, 'Fantastic Granite Shirt', '2024942479357', 'fantastic-granite-shirt', 'Magni pariatur architecto aliquam sit magni quia fuga cumque. Architecto rerum blanditiis atque et et nam officiis. Veritatis reprehenderit iure laborum quia a.', 1894.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(855, 'Sleek Wooden Bottle', '5426977112181', 'sleek-wooden-bottle', 'Cum quam minima culpa non deleniti. Eligendi et error non officiis. Perspiciatis dolore laboriosam maxime expedita itaque.', 383.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(856, 'Practical Linen Table', '0977759257149', 'practical-linen-table', 'Voluptatem vel voluptate quia ab. Rerum perspiciatis ut laudantium dolorem.', 4157.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(857, 'Synergistic Concrete Knife', '2057831182106', 'synergistic-concrete-knife', 'Itaque facilis accusantium tenetur nemo. Velit laborum doloremque repellat repellendus dolore. Repellendus vel quia atque voluptatem.', 4438.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(858, 'Enormous Aluminum Hat', '1269931154810', 'enormous-aluminum-hat', 'Ratione expedita odit qui et quia. Cum ratione voluptatum non similique hic ut. Vitae nisi consequatur saepe magnam.', 827.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(859, 'Synergistic Paper Computer', '2746160802808', 'synergistic-paper-computer', 'Inventore vel eligendi cum quam sed eos officia. Recusandae tempore omnis quis at odio dolorum.', 248.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(860, 'Intelligent Plastic Coat', '8958773699865', 'intelligent-plastic-coat', 'Quia rerum omnis sint ipsum. Asperiores quidem possimus ipsam ullam accusamus consequatur quod. Natus asperiores voluptatem qui provident voluptatibus atque.', 3933.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(861, 'Gorgeous Aluminum Coat', '3593392335753', 'gorgeous-aluminum-coat', 'Quia aliquid odit aut in voluptatem. Nulla quos ut perferendis vero eligendi officiis.', 4541.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(862, 'Aerodynamic Granite Table', '1774820228034', 'aerodynamic-granite-table', 'Et illum modi labore distinctio magni est laborum. Odit consectetur officiis assumenda non.', 2815.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(863, 'Gorgeous Paper Car', '0664691224208', 'gorgeous-paper-car', 'Ea et deserunt voluptas vero consequuntur. Iure et odio ipsam illum. Veritatis deleniti dolorum quibusdam reprehenderit nostrum consequatur blanditiis.', 1187.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(864, 'Gorgeous Iron Shoes', '2951784979090', 'gorgeous-iron-shoes', 'Facilis in dignissimos eum asperiores optio deleniti dicta. Eaque numquam nulla doloribus commodi non.', 4004.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(865, 'Small Wool Bag', '3924595305975', 'small-wool-bag', 'Dolorem consequatur expedita reprehenderit dolor iste. Totam aut at eum. Enim ex quo porro numquam iste ut velit.', 4753.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(866, 'Rustic Marble Knife', '5910372761926', 'rustic-marble-knife', 'Fuga eos odio quia sed eum. Voluptatibus explicabo voluptatem ut reprehenderit doloremque voluptates. Consequuntur fuga impedit recusandae non qui impedit nisi.', 3459.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(867, 'Sleek Wooden Table', '9534919317986', 'sleek-wooden-table', 'Voluptatum ratione ipsam est maxime molestiae earum doloribus. Veniam consectetur repellendus voluptatem ratione laborum a. Et dolore magnam aut et est qui facilis aspernatur.', 2935.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(868, 'Gorgeous Granite Computer', '5394538771644', 'gorgeous-granite-computer', 'Odit non et nulla sunt omnis odio. Eius necessitatibus facilis cupiditate labore sed. Consequatur officiis facilis aut laborum et.', 4584.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(869, 'Incredible Granite Shirt', '7913941541590', 'incredible-granite-shirt', 'Aut sint odit nihil. Aut debitis expedita atque voluptatem veniam. Odio corporis accusantium eaque rem incidunt quia enim.', 3568.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(870, 'Gorgeous Steel Coat', '0279832747333', 'gorgeous-steel-coat', 'Qui ut error velit veniam voluptatibus commodi. Assumenda fugiat ducimus sequi et.', 3565.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(871, 'Intelligent Iron Shirt', '8276226150818', 'intelligent-iron-shirt', 'Doloremque rerum vero similique aut aut. Id molestiae omnis sunt sit autem.', 2004.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(872, 'Durable Concrete Gloves', '3360793207756', 'durable-concrete-gloves', 'Provident molestias aut quo maxime aut amet. Ipsa veritatis incidunt in perferendis reiciendis deserunt aut nulla. Possimus delectus asperiores eum minus.', 2611.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(873, 'Intelligent Plastic Watch', '2325525511984', 'intelligent-plastic-watch', 'Ex ducimus est iste porro sapiente voluptas aspernatur laborum. Excepturi minima iusto voluptate rerum sed asperiores amet.', 1522.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(874, 'Ergonomic Steel Bottle', '1530472522353', 'ergonomic-steel-bottle', 'Architecto repudiandae architecto expedita porro rerum cum adipisci. Inventore cumque omnis sit quasi repellendus enim.', 1250.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(875, 'Durable Rubber Pants', '9786679303031', 'durable-rubber-pants', 'Similique provident quia quam ut. Eum laudantium provident natus animi necessitatibus voluptatem.', 800.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(876, 'Small Marble Shirt', '4339062690000', 'small-marble-shirt', 'Totam laudantium sed ut at ut nesciunt. Beatae itaque ratione quod praesentium quia vitae. Quas aut mollitia corrupti nesciunt non.', 3749.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(877, 'Incredible Wool Hat', '3983196410839', 'incredible-wool-hat', 'Rem laborum aut atque nesciunt omnis voluptas quaerat. Necessitatibus deserunt ut quia corporis.', 4827.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(878, 'Intelligent Aluminum Knife', '4091474717651', 'intelligent-aluminum-knife', 'Quia quia at minus corporis. Voluptas aut qui dolore ad maxime dicta.', 2952.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(879, 'Fantastic Leather Table', '8453251923413', 'fantastic-leather-table', 'Sit omnis dolor nam consequatur consequuntur. Reprehenderit laboriosam voluptatem aut est. Dolorem placeat quis voluptas eum rerum quis consequatur.', 4531.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(880, 'Rustic Copper Keyboard', '2568539604758', 'rustic-copper-keyboard', 'Fugiat et molestiae perferendis. Soluta maxime praesentium enim voluptatem.', 934.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(881, 'Lightweight Concrete Watch', '7962979632428', 'lightweight-concrete-watch', 'Consequuntur aut illo saepe at ratione ut. Ab consequatur ipsam soluta suscipit nobis fugit.', 1800.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(882, 'Lightweight Bronze Knife', '0057735574320', 'lightweight-bronze-knife', 'Natus laboriosam libero quam quas itaque. Vel eius nostrum quae ipsum sed voluptas. Nobis laborum provident dignissimos ut velit illo voluptatem.', 280.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(883, 'Synergistic Granite Table', '6137553112462', 'synergistic-granite-table', 'Qui perferendis omnis placeat sequi ex. Ipsam assumenda quia est qui omnis. Et tenetur doloribus eos quis itaque qui.', 4047.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(884, 'Aerodynamic Copper Knife', '5491803256285', 'aerodynamic-copper-knife', 'Aut aliquid quis ut maiores placeat voluptatem aut et. Numquam repellat asperiores ex beatae omnis ut eaque.', 1654.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(885, 'Awesome Linen Pants', '1203537964169', 'awesome-linen-pants', 'Odit at est dolorem ratione. Atque enim vel veniam natus. Esse ut hic dolorem nesciunt necessitatibus nostrum culpa.', 1775.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(886, 'Synergistic Copper Car', '1615731071299', 'synergistic-copper-car', 'Officia laboriosam in veritatis temporibus nihil vel et voluptatum. Ullam numquam ea praesentium magnam voluptatem veniam sunt. Impedit dolor veniam est nulla ut dolor.', 1126.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(887, 'Gorgeous Silk Watch', '3336137705721', 'gorgeous-silk-watch', 'Et eaque quis adipisci repudiandae mollitia. Ab aut beatae ut quisquam quas ratione. Ipsam est consequatur aspernatur.', 3314.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(888, 'Lightweight Concrete Knife', '2027503468128', 'lightweight-concrete-knife', 'Eum voluptatem ab blanditiis praesentium sit sint. Est consectetur reprehenderit accusamus nihil.', 214.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(889, 'Heavy Duty Linen Wallet', '4774222362692', 'heavy-duty-linen-wallet', 'Nobis accusantium voluptas vel error est. Et eligendi consequatur consequatur pariatur necessitatibus suscipit.', 4311.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(890, 'Small Wool Bench', '7855007613158', 'small-wool-bench', 'Sequi sit vero placeat ut et quam qui. Excepturi autem aut omnis vitae.', 3104.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(891, 'Incredible Wooden Keyboard', '0217547747033', 'incredible-wooden-keyboard', 'Minus soluta a sit est et deleniti. Consequatur corrupti vero dolore. In reiciendis illo distinctio voluptates.', 1611.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(892, 'Durable Iron Watch', '9471397244123', 'durable-iron-watch', 'Veniam deleniti sit sequi quis. Quae ut suscipit expedita. Qui molestiae veritatis aut reprehenderit commodi.', 3889.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(893, 'Intelligent Rubber Knife', '3545033266261', 'intelligent-rubber-knife', 'Quibusdam animi reiciendis et repellendus velit vel placeat. Pariatur tenetur qui voluptates qui rerum quibusdam earum. Aliquam voluptate eveniet laudantium iste perspiciatis ipsa.', 932.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(894, 'Aerodynamic Cotton Chair', '3923693927652', 'aerodynamic-cotton-chair', 'Officiis praesentium itaque dolore ad quibusdam aperiam corporis. Et blanditiis et perspiciatis.', 3300.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(895, 'Sleek Steel Coat', '7325563727540', 'sleek-steel-coat', 'Voluptatem ea sapiente placeat voluptates fugiat ipsa qui. Magni ducimus et sequi pariatur accusamus iure quia omnis. Ex possimus unde nemo.', 4885.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(896, 'Rustic Marble Bottle', '5145150481486', 'rustic-marble-bottle', 'Expedita nihil consequatur tempora nesciunt unde ullam eaque. Dolore iusto officiis quas ab.', 720.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(897, 'Practical Bronze Shoes', '5935284141253', 'practical-bronze-shoes', 'Aliquam et ea laudantium cumque magni aut qui ut. Vitae pariatur quaerat eum.', 3729.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(898, 'Ergonomic Leather Coat', '9305533421669', 'ergonomic-leather-coat', 'Cumque eligendi saepe beatae sed est iure. Ut sequi est enim quas mollitia magni.', 2096.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(899, 'Incredible Silk Wallet', '8418907002324', 'incredible-silk-wallet', 'Aut nemo at et voluptatem reprehenderit laborum. Enim nemo natus voluptas illum enim blanditiis. Quia inventore nisi eius dolor.', 371.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(900, 'Gorgeous Granite Bottle', '4620997571626', 'gorgeous-granite-bottle', 'Voluptas deleniti voluptatem dolores qui. Sed aperiam autem possimus voluptas sint nam occaecati. Quos sed ipsam perspiciatis quo nulla officiis officia.', 1044.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(901, 'Synergistic Bronze Pants', '1677076427902', 'synergistic-bronze-pants', 'Esse corrupti voluptatem fugit fugiat inventore totam sit. Molestiae sit et rerum vero. In eveniet optio est praesentium vitae eligendi.', 3855.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(902, 'Practical Wooden Knife', '3933510420297', 'practical-wooden-knife', 'Enim id incidunt voluptatem sed. Nam voluptas rerum earum culpa est. Est quo fuga eligendi quia accusantium voluptatum.', 488.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(903, 'Rustic Granite Lamp', '1812101019978', 'rustic-granite-lamp', 'Blanditiis voluptatum enim dignissimos laboriosam est odit. Reprehenderit quidem tempore unde consectetur non. Consequatur labore qui autem cupiditate.', 4436.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(904, 'Durable Cotton Wallet', '7483639366007', 'durable-cotton-wallet', 'Officiis dolor quo perferendis sequi officia voluptas. Qui qui omnis qui nisi laborum.', 3329.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(905, 'Intelligent Iron Table', '1536976051535', 'intelligent-iron-table', 'Id iusto odio est eum sunt. Aut placeat assumenda perferendis magni sequi error.', 3738.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(906, 'Durable Paper Shirt', '8261254050490', 'durable-paper-shirt', 'Nihil provident repellat deserunt sint. Et sit dolor necessitatibus eaque vel neque quas.', 4204.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(907, 'Small Cotton Hat', '0372706070909', 'small-cotton-hat', 'Repellat ad sit vel. Reprehenderit accusamus consectetur in ab aliquam. Nulla molestiae quae ut quasi error quia.', 2377.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(908, 'Synergistic Concrete Gloves', '8608756200716', 'synergistic-concrete-gloves', 'Sed est doloremque inventore quis voluptatem consequatur. Ipsum est voluptatibus sed iusto. Ut ut cumque ut maiores et tempora ipsam.', 74.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(909, 'Mediocre Rubber Gloves', '4075311973868', 'mediocre-rubber-gloves', 'Exercitationem rerum modi libero fugiat qui magni possimus mollitia. Nisi est in sunt et iusto. Qui et consequuntur temporibus sunt unde.', 541.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(910, 'Small Silk Pants', '4343941749819', 'small-silk-pants', 'Rem doloremque laborum cum eos sequi. Et culpa vero earum aut. Eum voluptates saepe beatae doloribus.', 1726.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(911, 'Fantastic Wool Shirt', '8467497840588', 'fantastic-wool-shirt', 'Expedita et consequatur officiis eum quasi. Quia ullam voluptatem beatae illum.', 3590.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(912, 'Synergistic Rubber Hat', '7829153864405', 'synergistic-rubber-hat', 'Molestias recusandae dolorum quam voluptatem est. Enim voluptas et aut illum illum qui consectetur. Vitae numquam qui maxime reprehenderit unde.', 4915.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(913, 'Awesome Granite Wallet', '9604416941196', 'awesome-granite-wallet', 'Aliquam exercitationem ducimus rerum error similique. Impedit vel dolore ipsam sunt dolorum quasi minima quia.', 551.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(914, 'Sleek Linen Bottle', '6444500695160', 'sleek-linen-bottle', 'Laboriosam reprehenderit qui alias et. Unde nostrum architecto harum vero modi delectus architecto. Quidem in et est rerum soluta.', 1700.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(915, 'Gorgeous Leather Chair', '4101442488466', 'gorgeous-leather-chair', 'Et cum quaerat tempora aut laudantium. Et libero omnis aut sapiente. Saepe illo est quaerat harum minus et voluptates.', 1090.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(916, 'Practical Cotton Watch', '9353492205325', 'practical-cotton-watch', 'Autem rerum consectetur quo fugit. Temporibus dolore id ut.', 3706.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(917, 'Lightweight Wool Chair', '3102723430151', 'lightweight-wool-chair', 'Dolor aut modi voluptas. Ut animi nihil dolorum et temporibus omnis et. Sit provident eius quo dolorem.', 1763.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(918, 'Intelligent Granite Table', '4158665930982', 'intelligent-granite-table', 'Sint dignissimos quia laudantium animi. Natus nihil voluptate at saepe corrupti voluptas.', 4137.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(919, 'Practical Concrete Watch', '2857187469551', 'practical-concrete-watch', 'Doloribus rem non voluptates eveniet est. Voluptate nostrum ipsum voluptate quam et. Quo velit adipisci excepturi repellat.', 2734.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(920, 'Awesome Iron Keyboard', '9383492707031', 'awesome-iron-keyboard', 'Sapiente nihil et corrupti quo asperiores atque non minus. Accusamus provident laboriosam corporis quia tempora in. Deleniti non est sapiente fugiat.', 3326.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(921, 'Rustic Aluminum Bottle', '4714257979366', 'rustic-aluminum-bottle', 'Odio temporibus ea beatae repellendus. Blanditiis minima at accusamus omnis quae sit earum. Atque ipsa adipisci accusamus voluptas quae dolorum aspernatur.', 4583.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(922, 'Lightweight Wooden Pants', '5978620280698', 'lightweight-wooden-pants', 'Consequatur iste natus aut iusto ea voluptatum. Placeat fuga reiciendis corporis corrupti.', 2724.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(923, 'Small Leather Lamp', '4787815264600', 'small-leather-lamp', 'Dolor quas corrupti architecto earum. Amet natus aliquam aut.', 4986.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(924, 'Heavy Duty Wooden Gloves', '2198528648724', 'heavy-duty-wooden-gloves', 'Eum voluptates consequatur qui et at et. Et pariatur et magnam consequatur non ea optio.', 1641.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(925, 'Heavy Duty Plastic Computer', '6977825260084', 'heavy-duty-plastic-computer', 'Sed expedita dolorem blanditiis quo excepturi. Et voluptatem libero iste et voluptatem ratione ratione. Delectus eum id velit consectetur nulla eveniet voluptatum.', 4647.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(926, 'Intelligent Aluminum Clock', '0725999922538', 'intelligent-aluminum-clock', 'Iure dolor consequatur mollitia in voluptate totam quidem similique. Ut quae qui molestiae enim ut.', 4689.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(927, 'Enormous Iron Chair', '9546750805188', 'enormous-iron-chair', 'Vero rerum a enim omnis ut. Quos maiores iste non libero. Non sint atque quo repellat voluptas ratione est.', 1989.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(928, 'Awesome Leather Chair', '9904033531726', 'awesome-leather-chair', 'Dolores hic repudiandae consequatur harum. Ea quasi quisquam quia mollitia repellendus eos.', 3527.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(929, 'Incredible Marble Clock', '6101109851051', 'incredible-marble-clock', 'Ea ad voluptatibus alias velit. Odio repudiandae rerum reiciendis suscipit non.', 3273.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(930, 'Heavy Duty Rubber Pants', '4570654242805', 'heavy-duty-rubber-pants', 'Veniam quos sequi quo autem tempora alias aut. Molestiae quod quo iusto ut.', 982.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(931, 'Gorgeous Rubber Hat', '6564016861863', 'gorgeous-rubber-hat', 'Dicta suscipit molestias ut maiores sed quos iusto quis. Ratione atque mollitia mollitia dolorem non itaque. Natus et at repudiandae aspernatur sunt.', 3639.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(932, 'Ergonomic Steel Table', '9006324308816', 'ergonomic-steel-table', 'Deleniti quis maiores debitis est. Est nesciunt officiis nisi qui. Soluta dolorem quo qui voluptas illum porro libero molestiae.', 2732.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(933, 'Aerodynamic Linen Lamp', '8739454121062', 'aerodynamic-linen-lamp', 'Officiis sed laboriosam qui officiis. Nesciunt quas labore quia cum ipsa distinctio facere.', 3184.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(934, 'Intelligent Plastic Wallet', '3082050263762', 'intelligent-plastic-wallet', 'Sed fugit fuga id pariatur non a. Nesciunt deserunt reprehenderit voluptatem laborum nihil aut itaque.', 417.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(935, 'Gorgeous Granite Car', '2333295871320', 'gorgeous-granite-car', 'Qui accusantium placeat eum delectus hic voluptas sed. Blanditiis expedita sit doloribus corrupti. Atque vel ad natus sunt.', 673.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(936, 'Durable Bronze Shoes', '7946494728767', 'durable-bronze-shoes', 'Iure maiores dignissimos atque eius deleniti aut. Dolore ullam ut quia magnam corrupti voluptatibus. Asperiores qui a sint voluptas quasi quidem.', 1165.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(937, 'Ergonomic Marble Watch', '5325990047190', 'ergonomic-marble-watch', 'Eum soluta accusamus quia recusandae. Rerum voluptatum sed dolor repellendus provident magnam consequatur soluta.', 338.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(938, 'Sleek Marble Bag', '8080054734092', 'sleek-marble-bag', 'Necessitatibus est cupiditate neque consequuntur fuga non. Eius tempore rerum voluptatem ea.', 3445.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(939, 'Heavy Duty Silk Plate', '8640812044452', 'heavy-duty-silk-plate', 'Omnis ex odio aut perferendis et. Optio et amet aperiam et laudantium veniam quia sapiente.', 3486.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(940, 'Awesome Iron Watch', '1221710503783', 'awesome-iron-watch', 'Veritatis odio ut et dolores. Iure sit aut itaque.', 1303.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(941, 'Ergonomic Wooden Gloves', '9851942068808', 'ergonomic-wooden-gloves', 'Nam ex possimus blanditiis porro tempore. Quos quibusdam tempore nam nulla est voluptas et reiciendis. Suscipit perferendis consequuntur consequuntur sunt consectetur enim.', 371.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(942, 'Enormous Steel Bag', '0007902765198', 'enormous-steel-bag', 'Quod quo et eaque enim culpa. Quia natus sint velit deserunt numquam id. Dignissimos aspernatur sunt dolor.', 4004.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(943, 'Aerodynamic Wool Bench', '0140718451067', 'aerodynamic-wool-bench', 'Delectus aspernatur necessitatibus magnam rerum quia illum quia pariatur. Accusantium enim ex et omnis labore quod id. Nesciunt beatae libero reiciendis est est soluta consequatur culpa.', 4019.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(944, 'Incredible Paper Watch', '9658404344032', 'incredible-paper-watch', 'Esse officiis accusamus hic tempore aliquid quisquam. Nulla quo omnis et ea nihil. Ipsum earum reprehenderit consequatur rerum doloribus ratione.', 306.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(945, 'Practical Wooden Clock', '5664816736239', 'practical-wooden-clock', 'Et facilis iste odit. A saepe est et illo.', 3477.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(946, 'Sleek Iron Keyboard', '4078097740983', 'sleek-iron-keyboard', 'Eaque numquam sit iure id adipisci. Quo qui eveniet totam dolore.', 1391.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(947, 'Sleek Rubber Table', '6317268406227', 'sleek-rubber-table', 'Iusto sed qui dolor. Aut enim sapiente non id perferendis harum. Distinctio reiciendis a et.', 2382.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(948, 'Fantastic Cotton Watch', '5579922029949', 'fantastic-cotton-watch', 'Sed reprehenderit excepturi eaque quaerat ab ut error. Qui optio optio est aspernatur ipsum.', 1743.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(949, 'Incredible Cotton Knife', '5781116767166', 'incredible-cotton-knife', 'Enim vel perspiciatis vel excepturi consequatur et. Suscipit repudiandae soluta omnis necessitatibus quibusdam. Odit deserunt incidunt veritatis corrupti odit quod dolorem qui.', 3312.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(950, 'Rustic Wool Clock', '1669135226748', 'rustic-wool-clock', 'Tempora laudantium voluptas itaque. Illum dolorem et natus dolores totam.', 2336.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(951, 'Small Silk Gloves', '6374907820219', 'small-silk-gloves', 'Perspiciatis totam sunt modi ipsum. Necessitatibus temporibus dicta facilis recusandae quasi qui aut. Maiores est velit asperiores quisquam.', 3261.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(952, 'Lightweight Marble Shoes', '3338815151455', 'lightweight-marble-shoes', 'Laborum doloribus soluta non qui sit quo. Asperiores ipsam velit ut doloribus voluptates harum aliquam.', 4683.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(953, 'Fantastic Wool Lamp', '5146509556923', 'fantastic-wool-lamp', 'Alias aut vel eum reiciendis. Esse asperiores quibusdam totam itaque at architecto.', 4501.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(954, 'Small Steel Plate', '6153382095424', 'small-steel-plate', 'Assumenda deleniti minima exercitationem velit eum eum maxime nihil. Nemo consequatur ut sit maiores quo necessitatibus quaerat.', 4248.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(955, 'Small Bronze Shoes', '7240683231961', 'small-bronze-shoes', 'Adipisci adipisci porro at repellendus voluptatibus. Quia architecto reprehenderit numquam aliquam sit alias porro. Deleniti molestias et molestiae delectus modi iste cupiditate mollitia.', 1796.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(956, 'Mediocre Wool Knife', '2359840457870', 'mediocre-wool-knife', 'Animi fugit labore molestiae qui occaecati sit esse nesciunt. Fugiat recusandae voluptates sit. Dolor perferendis omnis quam similique quidem veritatis maxime.', 1219.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(957, 'Sleek Marble Keyboard', '7333020197256', 'sleek-marble-keyboard', 'Placeat qui a qui distinctio. Beatae dolor dicta sit consequatur dolor ut.', 3718.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(958, 'Small Paper Gloves', '3355798594659', 'small-paper-gloves', 'Iure rem sunt iure blanditiis ullam. Voluptate atque voluptas dolores quos animi perspiciatis.', 3609.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(959, 'Durable Leather Bench', '8458358838486', 'durable-leather-bench', 'Ad deserunt ut totam. Consectetur non quam accusantium quisquam tempora.', 1591.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(960, 'Awesome Rubber Computer', '1792828039292', 'awesome-rubber-computer', 'Rerum repellat aut totam quo. Dolores eaque dolorem quisquam quidem officia.', 3127.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(961, 'Ergonomic Wool Chair', '4137545201664', 'ergonomic-wool-chair', 'Provident vel ipsa qui ut voluptatem. Et labore officia unde eos. Sed est qui quae minus.', 1290.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(962, 'Intelligent Cotton Watch', '3769856661731', 'intelligent-cotton-watch', 'Ipsum quia voluptatibus corporis enim tenetur tempore commodi. Modi odit eos laudantium molestiae quos corrupti veniam dolor.', 3811.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(963, 'Ergonomic Rubber Bottle', '4689565712649', 'ergonomic-rubber-bottle', 'Voluptatibus perferendis magnam occaecati et est in accusantium a. Ut tenetur et ut est. Odit modi cum possimus.', 2053.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(964, 'Fantastic Marble Bench', '2198034131963', 'fantastic-marble-bench', 'Necessitatibus qui aut sint reprehenderit. Mollitia officiis praesentium qui recusandae.', 611.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(965, 'Aerodynamic Leather Shoes', '4734774179261', 'aerodynamic-leather-shoes', 'Molestiae vitae sed et unde quaerat suscipit quaerat. Cumque illum est distinctio veritatis corporis voluptatem facilis.', 4034.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(966, 'Fantastic Paper Watch', '9730873243396', 'fantastic-paper-watch', 'Veritatis est aut aut tenetur est culpa. Tempore voluptates optio aut iure debitis qui corrupti. Fugiat voluptate perferendis in libero.', 1506.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(967, 'Aerodynamic Marble Computer', '8445176109423', 'aerodynamic-marble-computer', 'Error quidem vitae quisquam. Earum ea autem qui minima.', 3377.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(968, 'Practical Cotton Plate', '5597056998344', 'practical-cotton-plate', 'Placeat hic accusantium vel qui perspiciatis qui. Est aut repellat repellendus consequuntur. Voluptas amet id dolor neque.', 2677.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(969, 'Sleek Paper Keyboard', '5829880734936', 'sleek-paper-keyboard', 'Est quisquam vel dolores nesciunt voluptas. Tempora consequatur et voluptatem debitis. Enim fuga explicabo optio architecto non.', 4322.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(970, 'Awesome Plastic Knife', '3534590109326', 'awesome-plastic-knife', 'Laudantium ipsam non error. Est ut illum corporis aut eos.', 788.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(971, 'Sleek Steel Table', '5575897390442', 'sleek-steel-table', 'Asperiores aut possimus natus distinctio earum in mollitia. Doloribus ad ut deserunt eum. Aut sint quia molestiae consectetur asperiores possimus qui.', 4493.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(972, 'Aerodynamic Wooden Plate', '8020476498813', 'aerodynamic-wooden-plate', 'Aut voluptatem ratione sint in voluptas modi. Enim doloribus est quibusdam.', 2184.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(973, 'Awesome Steel Lamp', '9741420609435', 'awesome-steel-lamp', 'Aut distinctio ipsam et sed deserunt illo qui. Quibusdam aut blanditiis quidem illo quidem nulla. Nobis ad quam enim qui possimus hic.', 623.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(974, 'Lightweight Linen Watch', '6796060781693', 'lightweight-linen-watch', 'Ut maxime nihil sit aspernatur possimus alias. Reiciendis impedit veritatis unde iusto rerum. Quia et amet nobis quidem tenetur velit delectus.', 3498.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(975, 'Fantastic Concrete Wallet', '3417819080647', 'fantastic-concrete-wallet', 'Ut a omnis saepe sint beatae. Officiis nihil quisquam qui ut repudiandae reiciendis voluptate. Quos dignissimos eveniet eum eius mollitia iure.', 3030.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(976, 'Sleek Leather Bag', '6655512505945', 'sleek-leather-bag', 'Eligendi facere ut natus incidunt officia. Enim cumque voluptas quaerat facilis deserunt.', 4367.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(977, 'Incredible Linen Bench', '9249226031271', 'incredible-linen-bench', 'Ut necessitatibus mollitia expedita autem. Facilis aliquam ipsa consequatur quam. Non fugiat voluptatibus libero perferendis pariatur.', 3723.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(978, 'Awesome Leather Pants', '6983292059168', 'awesome-leather-pants', 'Nihil est neque eligendi quisquam rerum deleniti laborum. Molestiae iusto amet dicta maxime.', 4534.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(979, 'Practical Iron Shirt', '5708154399319', 'practical-iron-shirt', 'Numquam dolor blanditiis eius voluptatem itaque libero ipsa. Dolorum harum adipisci nihil nisi dignissimos officia. Reiciendis tempora consequatur autem exercitationem officia.', 3769.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(980, 'Incredible Bronze Wallet', '0734548742213', 'incredible-bronze-wallet', 'Dolore recusandae velit cum ipsa vel voluptas officiis. Recusandae voluptatibus veniam id ut rerum laboriosam. Consequatur tempore et incidunt voluptatum natus quod quas.', 24.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(981, 'Durable Plastic Computer', '2056296362931', 'durable-plastic-computer', 'Molestias eum expedita accusantium nam doloremque iusto. Vero non voluptas nihil et.', 3067.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(982, 'Aerodynamic Steel Gloves', '2648302445655', 'aerodynamic-steel-gloves', 'Ut soluta tempore vitae quos eos. Alias consequuntur modi autem velit.', 3759.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(983, 'Lightweight Silk Bag', '3394505896648', 'lightweight-silk-bag', 'Rem molestiae sit vel. Ducimus illo praesentium nihil dolorum aut necessitatibus ut. Possimus aut et mollitia autem.', 717.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(984, 'Awesome Plastic Shoes', '7740103277680', 'awesome-plastic-shoes', 'Quia cum reprehenderit perspiciatis nostrum voluptatem sunt. Eaque non possimus sapiente cum voluptas praesentium.', 3497.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(985, 'Heavy Duty Plastic Gloves', '2439812354298', 'heavy-duty-plastic-gloves', 'Fuga pariatur et enim. Animi quia nihil voluptatibus ut architecto eos dolores.', 2032.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(986, 'Small Aluminum Computer', '7311479703068', 'small-aluminum-computer', 'Excepturi quam corrupti et nihil aut vel eum nam. Eius eveniet omnis qui molestias ut perspiciatis modi.', 689.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(987, 'Ergonomic Linen Knife', '7997608978905', 'ergonomic-linen-knife', 'Quod sunt sequi dolores iure. Et id ex voluptatem facere hic doloremque.', 1084.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(988, 'Synergistic Linen Car', '7200172382888', 'synergistic-linen-car', 'Est delectus aut quo reiciendis. Est temporibus consequatur assumenda.', 3143.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(989, 'Small Plastic Coat', '5050215513753', 'small-plastic-coat', 'Omnis velit alias quam enim. Dolorem voluptate maxime labore et ipsa fuga. Quam voluptatem dignissimos culpa eius eveniet.', 4872.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(990, 'Gorgeous Wool Gloves', '5947044343296', 'gorgeous-wool-gloves', 'Et sunt minima sequi quaerat. Corporis distinctio aut voluptas qui optio.', 3502.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(991, 'Enormous Plastic Pants', '3347409592079', 'enormous-plastic-pants', 'Molestiae nihil at veniam pariatur ad dolorem laborum error. Quisquam et esse qui architecto itaque modi odio.', 3474.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(992, 'Small Wooden Bottle', '8902156460696', 'small-wooden-bottle', 'Doloribus occaecati dignissimos laboriosam distinctio. Officia nihil itaque et labore.', 2305.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(993, 'Gorgeous Leather Knife', '2362869679949', 'gorgeous-leather-knife', 'Nostrum vel quia culpa delectus distinctio eum. Saepe assumenda in cumque dolorem ut assumenda et. Id labore commodi ea quasi voluptatibus.', 1081.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(994, 'Gorgeous Cotton Shirt', '5204189512704', 'gorgeous-cotton-shirt', 'Et quo sint nulla explicabo qui quia. Eius accusantium quia et libero numquam.', 4297.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(995, 'Rustic Rubber Watch', '5839008062667', 'rustic-rubber-watch', 'Sit illum aut sit non officia consectetur necessitatibus laudantium. Quas perspiciatis voluptates ad et molestiae fugiat.', 585.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(996, 'Durable Wool Shoes', '1819728548201', 'durable-wool-shoes', 'Quae aut veritatis est enim. Esse nihil aspernatur doloribus fuga porro minus.', 1506.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(997, 'Fantastic Rubber Bench', '3105233510832', 'fantastic-rubber-bench', 'Eius quis excepturi illum autem. Qui perferendis totam explicabo excepturi odio nihil sint. Commodi quae quibusdam iste dolore iusto non non.', 3795.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(998, 'Synergistic Aluminum Car', '4372580621477', 'synergistic-aluminum-car', 'Laborum blanditiis et eos aut tenetur et itaque dicta. Sunt consequatur rerum nulla et. Cupiditate eligendi excepturi qui.', 374.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(999, 'Gorgeous Wool Shoes', '6483689389699', 'gorgeous-wool-shoes', 'Dolore aut id totam laboriosam est qui natus. Nobis quibusdam quos nobis aliquam est et maiores. Ea in qui fugit dolor odio.', 2344.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1000, 'Gorgeous Iron Hat', '1123349703759', 'gorgeous-iron-hat', 'Iste non voluptatum praesentium animi. Est ut repellat excepturi.', 2498.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1001, 'Awesome Marble Car', '3150137425423', 'awesome-marble-car', 'Placeat omnis sit consectetur autem aut. Necessitatibus placeat dolores eos itaque facilis ad saepe temporibus.', 3379.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1002, 'Intelligent Linen Gloves', '4419087645497', 'intelligent-linen-gloves', 'Sint reprehenderit quis laboriosam et. Dolore sequi non sunt qui.', 4573.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1003, 'Rustic Plastic Hat', '6804700464728', 'rustic-plastic-hat', 'Cumque autem et cumque rerum id. Quas molestias dolores et dolorem omnis ex corrupti vel.', 81.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1004, 'Practical Rubber Bottle', '8917306914219', 'practical-rubber-bottle', 'Nesciunt dolorum occaecati beatae iusto. Sed ipsam itaque libero temporibus assumenda et.', 1880.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1005, 'Fantastic Leather Wallet', '0709740958564', 'fantastic-leather-wallet', 'Architecto reiciendis labore error et molestias pariatur. Sint ut tempora voluptatum.', 217.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1006, 'Fantastic Silk Wallet', '7205816599240', 'fantastic-silk-wallet', 'Nihil dolorum omnis sequi velit voluptatem repellendus dolor est. Accusantium quis ad sunt fugit et reiciendis perferendis. Ratione ipsa hic sint necessitatibus ut.', 4805.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1007, 'Incredible Leather Shirt', '3063081039939', 'incredible-leather-shirt', 'Error dolore expedita reprehenderit vero. Commodi officia quia ipsa quibusdam nihil. Autem perspiciatis officia ut omnis saepe earum.', 2514.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1008, 'Sleek Plastic Chair', '0360877628548', 'sleek-plastic-chair', 'Et perferendis nam accusantium molestias dolores quia eos. Totam ab in ea vitae eligendi sequi consequatur.', 2033.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1009, 'Awesome Linen Plate', '3498010808087', 'awesome-linen-plate', 'Aut nostrum consequatur voluptate. Amet dolor suscipit earum et vel. Et facere sed et qui modi quae consequuntur.', 1075.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1010, 'Intelligent Plastic Hat', '6864315105683', 'intelligent-plastic-hat', 'Sit id facilis in enim laboriosam. Voluptatem optio rem tempora eveniet nam.', 2396.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1011, 'Lightweight Rubber Shoes', '1465365014274', 'lightweight-rubber-shoes', 'Voluptas occaecati consequatur mollitia assumenda omnis ut. Sed aliquid qui enim illum saepe iure reiciendis.', 2263.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1012, 'Lightweight Granite Gloves', '0671057565851', 'lightweight-granite-gloves', 'Asperiores porro voluptas doloribus quaerat ea. Consequuntur soluta at rem expedita libero culpa et qui.', 4984.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1013, 'Mediocre Wooden Coat', '5453522411352', 'mediocre-wooden-coat', 'Enim ut impedit et iure. Aliquid nisi sapiente natus est fuga aperiam ad. Voluptatem asperiores quia ullam saepe iusto deserunt quae.', 856.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1014, 'Lightweight Marble Watch', '7403371798539', 'lightweight-marble-watch', 'Impedit dolores blanditiis provident. Rerum porro veniam et aliquam qui dolor quis dolor. Qui debitis voluptas voluptatem est nisi.', 78.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1015, 'Awesome Steel Table', '5427496750786', 'awesome-steel-table', 'Dolores quis cumque eveniet nihil ipsam id dicta sint. Possimus voluptatem in nisi quaerat. Libero veniam quia rerum.', 1188.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1016, 'Rustic Steel Hat', '4569463127304', 'rustic-steel-hat', 'Sint in quisquam deserunt quaerat et occaecati aliquid. Dicta non beatae pariatur vero. Culpa enim qui omnis.', 3458.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1017, 'Sleek Marble Car', '0515796843774', 'sleek-marble-car', 'Aperiam illum repellendus rerum inventore vero. Unde officiis sit mollitia nobis laboriosam ut dolorum.', 4342.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1018, 'Small Silk Table', '8433767696452', 'small-silk-table', 'Nostrum voluptates maxime vel quibusdam ut dignissimos. Et consequatur est voluptatem voluptatem a doloremque.', 1642.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1019, 'Fantastic Steel Plate', '4298743882571', 'fantastic-steel-plate', 'Et doloribus provident et sit quis. Illum quaerat voluptates perferendis.', 4480.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1020, 'Fantastic Silk Keyboard', '5984341317551', 'fantastic-silk-keyboard', 'At ullam officia ipsa et quae ipsum labore. Aliquid quisquam numquam optio sed odit ipsum. Omnis ut beatae eum consequatur ut est.', 4566.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1021, 'Aerodynamic Leather Shirt', '0238380300117', 'aerodynamic-leather-shirt', 'Excepturi aliquid dolor quia placeat. Esse minus occaecati numquam qui. Quis dolore voluptates voluptas atque autem a ut.', 747.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1022, 'Incredible Wool Bench', '8065172696620', 'incredible-wool-bench', 'Et necessitatibus voluptates cupiditate aliquam ut alias. Quia minus animi nemo in quidem ipsa. Natus nostrum laboriosam accusantium sequi illo ipsa.', 3235.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1023, 'Durable Silk Lamp', '0142789896174', 'durable-silk-lamp', 'Vel quis corrupti adipisci quo sed labore. Ab commodi temporibus atque. Similique rerum placeat sint eos.', 447.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1024, 'Durable Wooden Pants', '1722290513013', 'durable-wooden-pants', 'Quidem sed nihil optio est est dolorum. Saepe rerum ad qui.', 4703.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1025, 'Mediocre Marble Pants', '1370958927575', 'mediocre-marble-pants', 'Dolores consequatur eaque numquam eaque cumque iste iure cum. Modi soluta provident in quia aut.', 2843.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1026, 'Mediocre Bronze Coat', '6962873943423', 'mediocre-bronze-coat', 'Numquam aliquid dolore voluptate sed voluptatem. Ut laudantium dolores et qui.', 4715.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1027, 'Gorgeous Cotton Plate', '5831888970469', 'gorgeous-cotton-plate', 'Illum impedit necessitatibus sed nulla eaque consectetur. Vitae suscipit voluptatem maiores et vero distinctio. Soluta voluptas est deleniti quo molestias ducimus.', 2770.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1028, 'Gorgeous Silk Gloves', '9167566472656', 'gorgeous-silk-gloves', 'Omnis omnis voluptates nisi. Sunt delectus asperiores praesentium provident.', 3789.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1029, 'Synergistic Iron Watch', '7838634183454', 'synergistic-iron-watch', 'Asperiores ullam asperiores vitae. Omnis impedit sit officiis velit porro eaque et. Qui eos autem ut eius reiciendis numquam doloremque occaecati.', 970.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1030, 'Ergonomic Paper Clock', '9657534698985', 'ergonomic-paper-clock', 'Sunt fuga sit eaque voluptatem quis dolores voluptatem est. Qui corrupti velit voluptas illum ea doloribus.', 1005.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1031, 'Aerodynamic Aluminum Coat', '5422295727441', 'aerodynamic-aluminum-coat', 'Eius fugit dolores ut nihil iure tenetur cumque. In voluptatum facere repudiandae inventore expedita. Cum incidunt accusamus dicta reiciendis autem vel neque.', 2261.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1032, 'Intelligent Concrete Car', '2371879577947', 'intelligent-concrete-car', 'Similique at ut deleniti praesentium et et repudiandae. Ut sit earum a non ullam neque.', 793.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1033, 'Ergonomic Steel Shoes', '8431411414124', 'ergonomic-steel-shoes', 'Illo possimus nihil eos et. Doloremque non voluptas qui adipisci cupiditate ea dignissimos omnis. Quo illum dignissimos aut qui blanditiis cupiditate ex.', 1922.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1034, 'Fantastic Bronze Bag', '0706762764258', 'fantastic-bronze-bag', 'Officiis sit nostrum aliquid pariatur ratione id architecto. Ab placeat ipsum est et quaerat sunt.', 649.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1035, 'Synergistic Rubber Plate', '4733715973296', 'synergistic-rubber-plate', 'In molestiae ipsa dicta quisquam rerum. Omnis id maiores ut deleniti ratione. Ipsam labore eos saepe numquam eligendi similique.', 2147.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1036, 'Intelligent Copper Chair', '2763006422235', 'intelligent-copper-chair', 'Pariatur dolorum vitae aliquid quibusdam adipisci repellendus sunt. Animi voluptas omnis facilis ipsa nihil minus nesciunt. Sunt officiis dolores magnam aut rerum.', 459.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1037, 'Mediocre Steel Shirt', '2434406374041', 'mediocre-steel-shirt', 'Amet eum ut optio tenetur. Corrupti nihil a at ipsam beatae ullam officia. Cumque provident velit hic sed aliquam.', 3027.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1038, 'Sleek Iron Computer', '0379284078709', 'sleek-iron-computer', 'Enim et qui aspernatur sit ad consectetur. Dolorum at aut ipsa. Quaerat enim iure quia in sit quas odio.', 532.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1039, 'Mediocre Concrete Watch', '4343038710371', 'mediocre-concrete-watch', 'Non aliquam veniam similique in. Quia vitae quas voluptatum culpa quo. Fugiat repellat consequatur natus autem et aut cum fugit.', 3950.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1040, 'Aerodynamic Silk Bottle', '6429491094925', 'aerodynamic-silk-bottle', 'Aut minus vitae sit voluptatem ipsum temporibus vero. Dolore sapiente occaecati exercitationem vel itaque.', 2281.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1041, 'Heavy Duty Wool Shirt', '3987850572611', 'heavy-duty-wool-shirt', 'Consequatur voluptatum illo quia qui. Est eaque qui et eos et qui ipsa. Nihil ratione dolor minima dolorem occaecati.', 1835.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1042, 'Synergistic Wooden Bag', '2964336052806', 'synergistic-wooden-bag', 'Saepe cum aut tempora vitae. Reprehenderit at nemo recusandae.', 3265.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1043, 'Incredible Plastic Coat', '3124986191143', 'incredible-plastic-coat', 'Distinctio accusantium eos facere tempore qui qui. Reiciendis sequi reiciendis esse expedita. Explicabo eum ipsum reprehenderit architecto est odio qui.', 1939.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1044, 'Rustic Concrete Shirt', '5000293793691', 'rustic-concrete-shirt', 'Dignissimos perspiciatis qui accusantium est provident voluptatem. Delectus ea sint quam et dolorem sapiente. Incidunt laborum odio laboriosam id esse et et et.', 3196.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1045, 'Heavy Duty Concrete Clock', '5387368508702', 'heavy-duty-concrete-clock', 'Repellat odit voluptas quia ea expedita est quia aspernatur. Ut et accusantium facere fuga vitae.', 4186.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1046, 'Fantastic Aluminum Bottle', '1739749293129', 'fantastic-aluminum-bottle', 'Ut et facere enim voluptatem qui sit. Ut sed nisi eius consequuntur perspiciatis totam.', 4289.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1047, 'Rustic Rubber Hat', '8918399283640', 'rustic-rubber-hat', 'Iure quisquam cupiditate facere vel debitis vero aut. Vel quas rerum molestias magni quis.', 3420.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1048, 'Mediocre Paper Wallet', '1849798098658', 'mediocre-paper-wallet', 'Quidem accusantium minima non velit. Quis est totam voluptatem quia.', 2451.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1049, 'Aerodynamic Linen Keyboard', '0377154662751', 'aerodynamic-linen-keyboard', 'Enim qui ea vero mollitia. Voluptas quasi qui est consequatur. Vitae vitae quis culpa consequuntur sint est.', 4557.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1050, 'Incredible Iron Watch', '1817093631573', 'incredible-iron-watch', 'Itaque ut voluptas dicta alias tenetur. Tenetur ut neque consequatur sed eos ipsum. Adipisci praesentium dolorem et non inventore.', 3481.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1051, 'Lightweight Iron Wallet', '7920820603515', 'lightweight-iron-wallet', 'Eum quam praesentium aut consequatur voluptatem. Quae est sint ipsam possimus et voluptatem. Ducimus atque molestias dignissimos et.', 3405.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1052, 'Ergonomic Bronze Chair', '1796473203879', 'ergonomic-bronze-chair', 'Quia ut in magnam omnis qui architecto. Consectetur itaque est qui qui aut. Dicta consectetur optio labore.', 2470.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1053, 'Enormous Wooden Chair', '6260913012147', 'enormous-wooden-chair', 'Doloribus nemo qui laudantium voluptatem sit rerum id doloribus. Unde voluptatum ea dolores rerum et non. Dolor quia suscipit et error maiores distinctio architecto nemo.', 4720.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1054, 'Heavy Duty Leather Bench', '0664897793041', 'heavy-duty-leather-bench', 'Et temporibus ad dolores magnam et nulla pariatur modi. Voluptas et voluptates saepe. Expedita in vero possimus qui et iure quia.', 3158.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1055, 'Synergistic Aluminum Wallet', '8809156912081', 'synergistic-aluminum-wallet', 'Itaque ad dolor provident. Doloribus voluptatibus commodi non veniam quibusdam. Error repudiandae possimus tenetur repudiandae maxime.', 3195.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1056, 'Sleek Wooden Bench', '3308715167306', 'sleek-wooden-bench', 'At nulla explicabo aut qui dignissimos ea. Dolorum culpa libero nihil odit occaecati. Animi doloremque aliquam quis pariatur.', 2771.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1057, 'Small Wooden Bag', '4543245526301', 'small-wooden-bag', 'Aspernatur placeat laboriosam ipsam quibusdam voluptas magnam ut. Sapiente in ex sed occaecati quas molestiae.', 3707.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1058, 'Gorgeous Rubber Wallet', '5824677768149', 'gorgeous-rubber-wallet', 'Commodi modi voluptas voluptatum voluptas necessitatibus assumenda et. In aut cum dolorum et aperiam consequuntur.', 2679.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1059, 'Fantastic Cotton Lamp', '0761371846405', 'fantastic-cotton-lamp', 'Voluptas nostrum sit harum fugiat repellat. Sunt est doloribus tenetur ad maiores sit et sed.', 1348.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1060, 'Incredible Concrete Bottle', '2997181601196', 'incredible-concrete-bottle', 'Architecto laborum libero et quia aut. Vitae eaque dolor facilis porro. Explicabo officiis libero quia tempore modi molestias ea.', 712.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1061, 'Intelligent Paper Keyboard', '6004985929800', 'intelligent-paper-keyboard', 'Quod consequuntur dolores facere quia eos praesentium repellat. Quidem ea non nisi sit officia sit ad hic.', 4351.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1062, 'Small Aluminum Gloves', '6199928557599', 'small-aluminum-gloves', 'Sint consequatur consequatur qui sed. Voluptas sit fuga similique aut velit autem. Ab sunt et eum nemo officia.', 3461.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1063, 'Enormous Concrete Wallet', '8671333059915', 'enormous-concrete-wallet', 'Placeat est dolor et non est nisi voluptas. Nam laudantium velit ea ipsa ratione commodi praesentium. Vitae soluta facere est vel.', 120.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1064, 'Lightweight Rubber Table', '4144918941553', 'lightweight-rubber-table', 'Et sed et asperiores earum. Modi maiores quis et alias eos id. Pariatur sequi ducimus aut ea voluptatem.', 1845.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1065, 'Ergonomic Cotton Bottle', '1386051037325', 'ergonomic-cotton-bottle', 'Exercitationem voluptas optio eligendi nostrum recusandae. Doloribus tempore earum deleniti voluptatem.', 2802.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1066, 'Mediocre Iron Computer', '8413978254153', 'mediocre-iron-computer', 'Incidunt voluptas quibusdam laudantium doloremque et et. Sed eos exercitationem vel facere facere voluptatem dolorem debitis. Qui voluptatem quis maxime exercitationem quae.', 4319.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1067, 'Intelligent Rubber Chair', '3556977114013', 'intelligent-rubber-chair', 'Sequi rerum velit praesentium quia commodi nulla. Fugit consequuntur laborum reprehenderit tenetur molestias sit.', 1106.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1068, 'Intelligent Bronze Coat', '9075053905221', 'intelligent-bronze-coat', 'Iste numquam accusamus sed illum. Quaerat est et assumenda perspiciatis doloremque magnam. Et blanditiis iusto et architecto cum quas aut esse.', 2238.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1069, 'Durable Linen Hat', '5763799207344', 'durable-linen-hat', 'Quos est beatae vitae at cupiditate. Inventore mollitia assumenda rerum quasi qui. Iure rerum omnis aut ut consequatur provident.', 4556.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1070, 'Incredible Iron Table', '7086936217128', 'incredible-iron-table', 'Porro alias est magni modi. Voluptate corporis nesciunt facere itaque quis.', 3813.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1071, 'Gorgeous Steel Hat', '0509823981409', 'gorgeous-steel-hat', 'Doloremque consequuntur et tempore. Quis ad veritatis unde magni. Mollitia dolores non ut beatae quae ab.', 3001.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1072, 'Fantastic Silk Shirt', '8631269305098', 'fantastic-silk-shirt', 'Est quia vel sunt iusto iure porro est. Facilis id harum ut et qui est minima aut.', 2884.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1073, 'Mediocre Rubber Pants', '8160537989215', 'mediocre-rubber-pants', 'Sequi at sapiente ipsa dolorem odio. Quo aut ducimus qui.', 3963.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1074, 'Durable Wool Coat', '6572844036728', 'durable-wool-coat', 'Voluptatem repellendus est iure unde. Nostrum omnis quasi minima quos qui.', 4778.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1075, 'Ergonomic Plastic Bag', '5013965393471', 'ergonomic-plastic-bag', 'Voluptatem in delectus nemo iure voluptate. Fugit modi ut et velit velit.', 3566.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1076, 'Synergistic Cotton Hat', '4794198855165', 'synergistic-cotton-hat', 'Repellat quisquam corrupti nostrum perspiciatis ea magni. Quia commodi quaerat cupiditate qui fugit. Facilis aut repudiandae tempora enim quibusdam et beatae quia.', 4681.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1077, 'Incredible Wooden Gloves', '1886337730730', 'incredible-wooden-gloves', 'Iste provident consequuntur et harum tempore voluptatibus velit. Et quae voluptas quisquam. Cum accusamus odio fugiat aliquid.', 2971.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1078, 'Aerodynamic Plastic Shoes', '0882105232506', 'aerodynamic-plastic-shoes', 'Sunt corrupti officia ut minus culpa assumenda nesciunt. Expedita minus nisi voluptatem hic. Nostrum maxime dolores possimus est ut iure.', 3424.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1079, 'Intelligent Silk Shoes', '2356040959227', 'intelligent-silk-shoes', 'Fugiat at recusandae reiciendis est ut sapiente ea. At architecto saepe tempore voluptates omnis unde.', 1109.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1080, 'Ergonomic Wool Computer', '5415979588704', 'ergonomic-wool-computer', 'Aliquid molestias voluptas dignissimos sit sed. Reiciendis odit quidem doloremque dolore voluptatem. Atque voluptatem enim consequatur aut et eaque eveniet.', 345.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1081, 'Ergonomic Leather Bench', '1267225628849', 'ergonomic-leather-bench', 'Consequatur corporis eum vel ut ipsam optio voluptate. Perspiciatis mollitia voluptatibus hic omnis aliquam et ut.', 577.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1082, 'Gorgeous Wool Coat', '5683811709659', 'gorgeous-wool-coat', 'Incidunt voluptas modi omnis dolorem et id. Alias et laboriosam odit voluptatem.', 161.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1083, 'Fantastic Concrete Lamp', '9453511599012', 'fantastic-concrete-lamp', 'Atque est eius repellendus voluptatem ipsa. Sed nihil voluptatem aut hic totam. Nihil natus quia inventore dolor fugiat quaerat id perspiciatis.', 2518.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1084, 'Durable Bronze Chair', '8939926945565', 'durable-bronze-chair', 'Non illo qui quisquam numquam ut. Qui consequatur dolorem facere nulla iusto.', 2516.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1085, 'Intelligent Paper Bag', '9267005351846', 'intelligent-paper-bag', 'Quod nulla similique quis ea. Voluptatem officiis voluptas consequatur et.', 4493.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1086, 'Aerodynamic Aluminum Table', '7993513878095', 'aerodynamic-aluminum-table', 'Non fuga libero ipsum explicabo quo. Sed accusantium et dignissimos tenetur harum magnam enim.', 3468.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1087, 'Enormous Paper Shirt', '7108028629555', 'enormous-paper-shirt', 'Aperiam quaerat dolorum et nihil alias ea ex. Ea mollitia reprehenderit suscipit sit exercitationem vel aut. Asperiores aut qui eum qui deleniti perspiciatis omnis.', 932.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1088, 'Practical Bronze Coat', '4777011541339', 'practical-bronze-coat', 'Neque ut illum qui. Accusantium nobis ipsa dolor numquam.', 3445.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1089, 'Intelligent Bronze Pants', '3609623433904', 'intelligent-bronze-pants', 'Placeat id consectetur quasi. Nemo exercitationem nihil est autem sit.', 821.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1090, 'Fantastic Wooden Bottle', '0892823020583', 'fantastic-wooden-bottle', 'Accusantium eum numquam perspiciatis culpa ut et. Dolor et veritatis pariatur alias est porro.', 3001.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1091, 'Practical Paper Keyboard', '4316307991283', 'practical-paper-keyboard', 'Dolores quaerat et ipsum facere eum et est porro. Rerum atque vitae cum voluptatem rerum numquam.', 2207.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1092, 'Awesome Steel Bench', '8882421838569', 'awesome-steel-bench', 'Numquam molestiae ea ratione dolor. Saepe vitae excepturi quisquam ut reprehenderit.', 955.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1093, 'Mediocre Plastic Pants', '5594058584933', 'mediocre-plastic-pants', 'Error sunt commodi similique distinctio non hic. Doloribus deleniti commodi optio nemo voluptas iure aut. Assumenda ab libero quia ut quasi est.', 2793.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1094, 'Gorgeous Wool Plate', '1815900609173', 'gorgeous-wool-plate', 'Voluptatem necessitatibus recusandae et quia ut odit omnis. Consequatur ea rerum aut ut.', 4073.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1095, 'Incredible Iron Lamp', '3486479279623', 'incredible-iron-lamp', 'Dignissimos eum est consequatur. Praesentium est voluptatum provident sint dolores.', 922.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1096, 'Aerodynamic Cotton Watch', '0295793843860', 'aerodynamic-cotton-watch', 'Odit repellat adipisci nesciunt. Excepturi qui non nulla nihil qui aut ab dicta.', 2715.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1097, 'Practical Granite Bag', '1334158981638', 'practical-granite-bag', 'Animi rerum quidem nam labore autem. Minima fugiat corporis sapiente deleniti aut molestias. Voluptate nesciunt velit asperiores.', 3034.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1098, 'Practical Cotton Lamp', '9351994446284', 'practical-cotton-lamp', 'Et quod praesentium nihil. Ea suscipit accusamus dolores ad molestiae omnis saepe omnis. Corporis autem molestias assumenda placeat libero aut.', 2921.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1099, 'Fantastic Rubber Wallet', '8109133249583', 'fantastic-rubber-wallet', 'Ex nihil velit sed voluptas ut totam doloremque. Maxime quidem aut neque dolores et dolorem et.', 3450.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1100, 'Small Steel Chair', '5225035061337', 'small-steel-chair', 'Voluptatem et aperiam sequi et aut eum. Sint laboriosam modi ratione qui occaecati consequatur quibusdam animi. Earum debitis ab velit consequuntur est.', 1518.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1101, 'Practical Paper Bag', '6427695832619', 'practical-paper-bag', 'Eaque temporibus eum rerum omnis mollitia sed rem. Sequi ex qui eligendi.', 2936.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1102, 'Heavy Duty Cotton Bench', '1630196153069', 'heavy-duty-cotton-bench', 'Est distinctio vero doloribus qui. Laboriosam eos debitis ut ea exercitationem.', 1633.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1103, 'Synergistic Silk Table', '1789178002069', 'synergistic-silk-table', 'Voluptas qui error et ut. Recusandae consectetur iusto natus doloribus voluptas.', 843.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1104, 'Mediocre Leather Car', '2837113488566', 'mediocre-leather-car', 'Rerum ab nulla molestiae consequatur eveniet. Est aut pariatur ipsum nostrum. Consequatur voluptatem omnis sit eveniet ea iure quis.', 1229.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1105, 'Ergonomic Marble Bag', '2608481477588', 'ergonomic-marble-bag', 'Provident consequatur provident exercitationem natus tempore. Sunt non repellat quia et est molestiae similique. Provident ratione quas dolorem et.', 168.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1106, 'Durable Steel Knife', '2589698637272', 'durable-steel-knife', 'Reprehenderit a impedit repellendus. Molestias minima unde quia. Optio officiis aliquam dolore ut sed.', 3271.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1107, 'Practical Silk Wallet', '5920271463852', 'practical-silk-wallet', 'Rerum nulla et et corporis earum distinctio qui accusantium. Est ducimus optio et voluptatem qui quibusdam perspiciatis.', 4780.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1108, 'Mediocre Leather Computer', '4945018365351', 'mediocre-leather-computer', 'Voluptas ea explicabo mollitia rerum officia quas. Asperiores harum aperiam minus id ipsum odio. Quos sunt velit dolore cum.', 500.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1109, 'Mediocre Granite Plate', '2580607867889', 'mediocre-granite-plate', 'Consectetur non pariatur omnis molestiae recusandae quod possimus totam. Et sed necessitatibus voluptas occaecati consequatur dolorem voluptas.', 2418.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1110, 'Synergistic Silk Plate', '6500792059193', 'synergistic-silk-plate', 'Rem sit voluptas error tempora nulla autem. Id ut tempore voluptatem at quis molestias consequatur sunt. Veniam ut voluptatem et ducimus fuga.', 1378.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1111, 'Lightweight Iron Bench', '5714427114923', 'lightweight-iron-bench', 'Nihil nobis aut eos perspiciatis quia qui nam nisi. Qui tempora quis earum.', 1775.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1112, 'Gorgeous Plastic Shirt', '7063725724555', 'gorgeous-plastic-shirt', 'Molestias minus quibusdam corrupti quisquam. Minus in cum iure corrupti quaerat enim soluta.', 636.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1113, 'Enormous Rubber Bottle', '8756866987109', 'enormous-rubber-bottle', 'Ipsa ut amet eaque a in voluptatem. Voluptas similique numquam reprehenderit consequatur. Omnis fugit est sit dolorem repudiandae dignissimos tempore.', 902.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1114, 'Fantastic Aluminum Car', '7597481009811', 'fantastic-aluminum-car', 'Tempore sed laborum velit eius ab fuga corporis. Hic dolorum qui debitis quasi.', 4008.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1115, 'Sleek Granite Watch', '9520948548743', 'sleek-granite-watch', 'Culpa doloremque quia dignissimos architecto est et nulla. Velit hic rerum earum velit est vel blanditiis. Quis qui quibusdam quo et eum est ea.', 3803.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1116, 'Lightweight Copper Bag', '9153890302608', 'lightweight-copper-bag', 'Pariatur et ipsam corporis dicta commodi qui totam. Possimus ullam dicta molestiae et animi quibusdam sit.', 287.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1117, 'Sleek Steel Keyboard', '6394704828294', 'sleek-steel-keyboard', 'Ut perspiciatis reiciendis aut voluptatem quam omnis ducimus. Eum consequatur rerum placeat rem et culpa repellat.', 4241.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1118, 'Aerodynamic Linen Bag', '0359305042957', 'aerodynamic-linen-bag', 'In sint cupiditate inventore vel. Deleniti ut corrupti praesentium enim repellat rerum deleniti. Dolores facilis commodi maiores blanditiis quis accusamus id.', 3117.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1119, 'Rustic Linen Gloves', '7119951585061', 'rustic-linen-gloves', 'Et cumque aut et explicabo velit. Quo velit rem est aliquam enim architecto et. Asperiores ad ipsam est animi ipsam similique.', 2166.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1120, 'Incredible Rubber Bottle', '3817814205630', 'incredible-rubber-bottle', 'Nemo dolor a eum error saepe voluptates. Ducimus nemo amet suscipit natus voluptate consequatur asperiores et. Placeat id itaque sapiente ea beatae.', 4714.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1121, 'Lightweight Copper Plate', '6208674004469', 'lightweight-copper-plate', 'Molestias laboriosam atque dolor quos ea autem quis. Vitae qui quia commodi sed aut at. Tempora quia quisquam corrupti nam.', 1139.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1122, 'Awesome Leather Car', '6742397022251', 'awesome-leather-car', 'Dolor quia est molestias reprehenderit corporis voluptate. Maiores dolorem ratione voluptatem culpa debitis fuga nemo. Aperiam dicta dicta non mollitia.', 873.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1123, 'Enormous Rubber Bag', '1343368186061', 'enormous-rubber-bag', 'Et magni recusandae eum enim similique. Voluptas debitis at magnam. Ullam quibusdam nam omnis et veniam commodi est.', 4476.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1124, 'Practical Steel Table', '2705244521592', 'practical-steel-table', 'Beatae aliquam porro qui ut rem qui deserunt. Nesciunt quis architecto aut corrupti earum recusandae. Minus repudiandae odit enim aut rem dolorum.', 4242.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1125, 'Intelligent Marble Hat', '1805585122036', 'intelligent-marble-hat', 'Consequuntur ex nam dolorem magni. Voluptatum consequatur molestiae rerum aut velit et expedita. Exercitationem assumenda accusamus aut rerum.', 3121.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1126, 'Aerodynamic Steel Bench', '4852467777546', 'aerodynamic-steel-bench', 'Dolores aut harum enim rerum. Velit ipsam laboriosam sed dolor qui. Mollitia doloremque quia culpa nesciunt aut exercitationem doloremque.', 2345.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1127, 'Practical Aluminum Lamp', '1228886339574', 'practical-aluminum-lamp', 'Quam qui reiciendis laborum ut consectetur magni ut. Illum beatae sint libero at.', 590.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1128, 'Ergonomic Wooden Table', '2298405500326', 'ergonomic-wooden-table', 'Quae tenetur culpa magni officiis at. Eum cumque architecto voluptatem cum nihil ut.', 605.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1129, 'Ergonomic Aluminum Hat', '5869069344211', 'ergonomic-aluminum-hat', 'Ut soluta minus quam sint dolores corporis illo. Quidem non et suscipit tempore et nostrum qui. Est aut ratione sit mollitia.', 1188.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1130, 'Synergistic Bronze Car', '1157985825940', 'synergistic-bronze-car', 'Qui voluptatibus hic saepe itaque. Dolore dolorem soluta eligendi distinctio.', 695.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1131, 'Small Concrete Clock', '0923536192981', 'small-concrete-clock', 'Ducimus totam accusantium quae dolorem nihil quisquam. Praesentium distinctio maiores eos dolorem sit. Iste quia ex sit dolores error sed veniam.', 913.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1132, 'Heavy Duty Rubber Knife', '4027026812109', 'heavy-duty-rubber-knife', 'Amet officia magnam neque consequuntur optio ut error omnis. Quo animi aut ut non minima itaque accusamus. Maiores fugit aut ea iure eveniet labore.', 4484.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1133, 'Heavy Duty Bronze Watch', '0275799503791', 'heavy-duty-bronze-watch', 'Eos nobis natus dolorem quos aperiam omnis itaque. Consequuntur odit expedita corrupti eum.', 2955.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1134, 'Durable Marble Watch', '3535944495782', 'durable-marble-watch', 'Eius iusto dolorem voluptas non quia quia. Totam eum dicta rem facere.', 46.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1135, 'Small Granite Table', '7038707446329', 'small-granite-table', 'Velit qui sed ut praesentium consequatur numquam cupiditate. Occaecati quidem ab deleniti magnam quia vitae. Ab iusto distinctio consectetur molestias est id nihil.', 3705.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1136, 'Aerodynamic Bronze Knife', '1367476007551', 'aerodynamic-bronze-knife', 'Qui sed impedit est laboriosam. Aut incidunt sed rerum hic qui tempora rem aut. Amet numquam sit autem.', 4692.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1137, 'Synergistic Leather Knife', '4840908784475', 'synergistic-leather-knife', 'Soluta quia nihil impedit quo in. Aut consequatur cum dolores et voluptatem.', 1539.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1138, 'Incredible Cotton Gloves', '2151923828344', 'incredible-cotton-gloves', 'Est aperiam iure ullam voluptatem sit. Ut non quibusdam consequatur soluta.', 1586.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1139, 'Incredible Leather Bench', '9367941654558', 'incredible-leather-bench', 'Cupiditate sequi consectetur omnis doloribus. Asperiores aut similique rerum qui. Rerum eius molestias quia quia sunt unde repudiandae expedita.', 1248.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1140, 'Awesome Paper Gloves', '7192903150203', 'awesome-paper-gloves', 'Veniam et ut deleniti cupiditate. Excepturi nesciunt nisi sapiente impedit dignissimos.', 1257.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1141, 'Mediocre Steel Bottle', '9938931102450', 'mediocre-steel-bottle', 'Perferendis molestiae qui illum quia aspernatur repudiandae quibusdam sed. Distinctio voluptas qui aut soluta et minus.', 2635.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1142, 'Synergistic Silk Keyboard', '5864254064585', 'synergistic-silk-keyboard', 'Rerum sit repudiandae mollitia non quidem minima. Architecto dolor occaecati vero.', 488.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1143, 'Durable Wooden Computer', '4765498140848', 'durable-wooden-computer', 'Omnis sint nemo sit sed voluptatem ea. Dolore eos voluptas vitae et a ea odio. Non totam esse qui quas.', 599.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1144, 'Ergonomic Wool Bench', '0602238657232', 'ergonomic-wool-bench', 'Veniam molestias dolor veniam praesentium. Quia autem laborum velit voluptate nisi inventore. Quibusdam impedit nam inventore illum eaque.', 796.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1145, 'Incredible Paper Bench', '3307282713862', 'incredible-paper-bench', 'Ut voluptates natus eveniet. Facere et sit facere ut autem. Vel consequuntur assumenda dolore eos tenetur.', 573.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1146, 'Durable Plastic Pants', '0408513854620', 'durable-plastic-pants', 'Numquam voluptas tempora ducimus est fugit aut. Fugit laboriosam delectus consequatur et et neque rerum voluptates. Sit blanditiis velit debitis doloremque eligendi.', 4113.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1147, 'Aerodynamic Plastic Chair', '2147688833785', 'aerodynamic-plastic-chair', 'Ducimus tempora enim culpa veniam officia. Consequatur aut natus doloremque qui rerum numquam.', 4198.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1148, 'Lightweight Steel Coat', '0438670981884', 'lightweight-steel-coat', 'Eligendi et aspernatur blanditiis fugiat ex quae non. Maiores et in modi. Et vero inventore ut molestiae.', 3930.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1149, 'Lightweight Concrete Clock', '8111449046633', 'lightweight-concrete-clock', 'Voluptatem qui vitae nihil deleniti earum quis tenetur atque. Quia aspernatur soluta delectus assumenda suscipit odit. Et ab minus sunt nihil eaque.', 2230.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1150, 'Awesome Aluminum Keyboard', '2191854688105', 'awesome-aluminum-keyboard', 'Nobis quaerat mollitia architecto qui nihil. Delectus ut ea voluptates tempora. Excepturi ullam et officiis officiis eveniet voluptatem.', 2516.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1151, 'Small Concrete Bench', '1598889509039', 'small-concrete-bench', 'Reiciendis est animi nisi nihil iusto ea sunt expedita. Voluptas quia nulla omnis quo unde quia eum. Ex eveniet enim quidem minima eaque.', 4280.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1152, 'Sleek Marble Hat', '9877206562509', 'sleek-marble-hat', 'Quasi nihil commodi eum asperiores doloremque. Libero veritatis rerum assumenda consequatur voluptatibus consequatur dicta in. Rem assumenda laudantium autem unde eligendi.', 4935.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1153, 'Small Granite Keyboard', '4955481406666', 'small-granite-keyboard', 'Quaerat sit adipisci quo laboriosam dolore nisi earum. Facilis eveniet qui omnis omnis accusantium voluptas qui. Nisi reiciendis dolorem minima sed ea ipsum quidem libero.', 4146.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1154, 'Small Paper Chair', '8594954286747', 'small-paper-chair', 'Et hic est doloremque non. Provident autem voluptatibus qui illum vero autem eius. Assumenda incidunt et qui qui quos.', 3912.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1155, 'Lightweight Cotton Keyboard', '5077544905851', 'lightweight-cotton-keyboard', 'Nam voluptas velit possimus et et et quaerat. Aperiam dolor necessitatibus iste dolores laboriosam. Ratione sunt neque quos sunt omnis enim.', 583.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1156, 'Ergonomic Linen Bench', '1279537767666', 'ergonomic-linen-bench', 'Deleniti totam voluptatum numquam et voluptate veniam adipisci reprehenderit. Officiis libero provident vel quia. Repellendus nesciunt placeat odio ad aperiam.', 1997.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1157, 'Practical Linen Bench', '0811552409131', 'practical-linen-bench', 'Quidem consequuntur qui labore ipsa. Consequatur ut dolorem ratione.', 1102.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1158, 'Intelligent Steel Pants', '3982196370594', 'intelligent-steel-pants', 'Non veritatis sit similique omnis et sit. Et libero soluta voluptatem hic.', 1074.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1159, 'Rustic Concrete Lamp', '9183207470478', 'rustic-concrete-lamp', 'Eligendi vitae dolores nam eveniet veniam omnis. Minima quia numquam perferendis et dolores.', 3552.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1160, 'Small Iron Clock', '8320728098403', 'small-iron-clock', 'Qui sed ipsa hic qui fuga sunt in ipsum. Quis quae omnis sunt molestiae eligendi deleniti qui earum. In sunt quasi et doloremque nesciunt ut.', 931.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1161, 'Small Linen Lamp', '4353712817388', 'small-linen-lamp', 'Doloremque facere ut magni illum voluptas. Esse nesciunt officiis quod.', 4106.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1162, 'Gorgeous Concrete Bag', '8131899236682', 'gorgeous-concrete-bag', 'Esse laudantium qui cum labore rerum accusantium molestias. Sapiente voluptate sit aspernatur omnis et quisquam amet veniam.', 172.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1163, 'Synergistic Granite Wallet', '5192443283012', 'synergistic-granite-wallet', 'Qui deserunt ut beatae. Iure tempore ducimus inventore est hic possimus. Non at eaque commodi distinctio rerum id.', 2685.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1164, 'Fantastic Aluminum Lamp', '2355756993051', 'fantastic-aluminum-lamp', 'Vitae similique blanditiis exercitationem enim doloribus. Iusto assumenda ut distinctio iure nobis possimus. Velit sint aliquam quia.', 46.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1165, 'Incredible Wooden Table', '0558444829270', 'incredible-wooden-table', 'Ipsam nam fuga autem omnis consequatur in. Ipsa non veniam ipsam et officia odio.', 261.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1166, 'Sleek Copper Keyboard', '9310581657069', 'sleek-copper-keyboard', 'Eligendi nihil nostrum molestias. Numquam sed aut magnam exercitationem. Vel temporibus quos voluptatem dicta sit voluptatem.', 734.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1167, 'Lightweight Wooden Keyboard', '1360924257973', 'lightweight-wooden-keyboard', 'Quia ex et nostrum dolores quia. A occaecati vel reprehenderit fuga sed nobis quo nulla. Nihil consequatur dolorum in error fuga voluptatem qui.', 4650.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1168, 'Awesome Wool Chair', '7372167665976', 'awesome-wool-chair', 'Voluptas error qui aut qui quis aut. Earum qui modi natus sit. Omnis odit beatae doloribus sapiente consequatur qui non et.', 2833.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1169, 'Small Iron Bench', '0231200037576', 'small-iron-bench', 'Aut quisquam et aliquid sapiente hic ut fugit. Ducimus aut quasi optio qui culpa sint quaerat. Perspiciatis ad sunt ea dicta quo aliquam.', 3700.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1170, 'Ergonomic Marble Chair', '1602749364529', 'ergonomic-marble-chair', 'Aspernatur et nihil optio atque hic. Totam tempore minima dicta sunt accusamus rerum.', 649.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1171, 'Rustic Copper Chair', '6898656990387', 'rustic-copper-chair', 'Voluptates ut in quidem minus repellendus blanditiis quaerat. Est dolorum non odio qui vel sed.', 4153.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1172, 'Small Concrete Knife', '3113635936754', 'small-concrete-knife', 'Earum et enim asperiores quia. Adipisci iste ut aut nulla consequuntur rerum omnis. Sit suscipit error ab ut quae eveniet.', 3406.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1173, 'Intelligent Granite Gloves', '6501882126764', 'intelligent-granite-gloves', 'Impedit doloremque tenetur totam ea. Ut et natus praesentium eligendi consequatur aut et dicta. Repudiandae ducimus hic alias iure vel.', 1234.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1174, 'Rustic Leather Watch', '4643626291566', 'rustic-leather-watch', 'Et soluta aut sunt et expedita sit. Cupiditate ut quia quod deserunt blanditiis maiores non.', 669.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1175, 'Gorgeous Granite Shirt', '8229977910385', 'gorgeous-granite-shirt', 'Dignissimos ut quia quisquam vel qui est. Vel vero ad sint nesciunt dolor.', 492.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1176, 'Small Linen Shoes', '3879386879817', 'small-linen-shoes', 'Quisquam praesentium itaque labore. Perspiciatis vero sunt excepturi dolorem.', 3586.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1177, 'Mediocre Steel Wallet', '8287508444426', 'mediocre-steel-wallet', 'Molestias rerum libero dolorem explicabo. Nesciunt cum nihil placeat minus. Assumenda omnis ut officia minus ut aspernatur et veritatis.', 4522.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1178, 'Small Wool Table', '2024112655604', 'small-wool-table', 'Sit sequi deserunt eos beatae officia magni. Labore molestiae molestiae velit magnam.', 2985.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1179, 'Awesome Aluminum Table', '7358105679199', 'awesome-aluminum-table', 'Ut id quia accusantium enim laborum eum consequatur rerum. Omnis sint error enim ducimus ipsa aspernatur. Expedita ipsam quo laborum ut officiis et.', 4288.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1180, 'Ergonomic Leather Bag', '6840372237949', 'ergonomic-leather-bag', 'Fugiat at quia non et vel assumenda. Harum et laudantium corporis est quia. Ipsam mollitia a et est et.', 262.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1181, 'Mediocre Silk Lamp', '4588478678519', 'mediocre-silk-lamp', 'Doloremque molestiae nihil est nisi modi. Sed ea nulla ut ut.', 1150.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1182, 'Incredible Leather Pants', '2741059335276', 'incredible-leather-pants', 'Dolor aut adipisci voluptas culpa voluptas. Rem alias quia est cumque.', 1019.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1183, 'Mediocre Steel Chair', '8119771224354', 'mediocre-steel-chair', 'Facere tenetur et temporibus laboriosam veniam. Quasi sed alias assumenda aliquid molestiae enim quae.', 1993.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1184, 'Enormous Cotton Shirt', '7916633737516', 'enormous-cotton-shirt', 'Ut ipsa dignissimos necessitatibus quibusdam quod tempora labore incidunt. Inventore quo non iste ut.', 2161.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1185, 'Sleek Linen Bag', '4936312836920', 'sleek-linen-bag', 'Voluptas est commodi eaque tempore culpa sit qui. Odio eum vel in pariatur adipisci. Voluptas reprehenderit molestias reprehenderit.', 4446.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1186, 'Practical Plastic Gloves', '7644519207746', 'practical-plastic-gloves', 'Minima suscipit modi corporis consequatur cum eaque quasi. Similique facere soluta nihil earum sit dicta. Itaque occaecati officia ut voluptatum veniam doloribus.', 1734.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1187, 'Lightweight Bronze Bottle', '6295126728226', 'lightweight-bronze-bottle', 'Iure veniam nemo impedit. Cumque ullam expedita laboriosam.', 1849.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1188, 'Fantastic Aluminum Table', '3005590042529', 'fantastic-aluminum-table', 'Delectus facilis repellat quod blanditiis est quia omnis. Tempore saepe eum ratione qui voluptatibus quas. Praesentium maxime cumque doloribus commodi aut.', 3686.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1189, 'Rustic Iron Chair', '2352527132596', 'rustic-iron-chair', 'Ducimus at alias perspiciatis ab maiores nulla facere. Qui illo odit ea mollitia aut praesentium non qui.', 3090.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1190, 'Heavy Duty Wooden Watch', '5970322936491', 'heavy-duty-wooden-watch', 'Qui magni quaerat quas rerum id ut et qui. Amet eos aut velit ut quidem. Cupiditate est aliquam quis.', 3197.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1191, 'Ergonomic Aluminum Bag', '1695192925805', 'ergonomic-aluminum-bag', 'Sed et molestiae facere beatae quis. Minus tempore facere praesentium ipsam. Voluptate nemo excepturi maxime amet.', 2932.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1192, 'Synergistic Copper Lamp', '8321759331576', 'synergistic-copper-lamp', 'Eum quaerat et saepe provident non accusantium excepturi consequatur. Repudiandae rerum omnis et ex alias voluptatem.', 2799.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1193, 'Fantastic Wool Gloves', '6440441541740', 'fantastic-wool-gloves', 'Beatae soluta pariatur cupiditate omnis nemo molestias. Dolorem perspiciatis quibusdam qui illum. Nobis autem voluptatem autem quo qui perspiciatis voluptatem.', 69.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1194, 'Lightweight Steel Table', '8105852790542', 'lightweight-steel-table', 'Pariatur voluptate consectetur excepturi qui vel dicta et. Ea eius et voluptas voluptas est voluptatem ipsam.', 1284.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1195, 'Small Copper Shoes', '5337225536881', 'small-copper-shoes', 'Excepturi architecto ad dolor. Corporis enim porro aut facilis aperiam.', 3920.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1196, 'Heavy Duty Marble Lamp', '5890227801680', 'heavy-duty-marble-lamp', 'At quos maxime aut aut odio nihil sint. Quidem expedita porro et omnis quaerat sit. Laudantium et excepturi et minima esse similique incidunt.', 2602.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1197, 'Incredible Wool Pants', '8920648422830', 'incredible-wool-pants', 'Molestias id hic consectetur provident debitis quod atque. Officiis quas est temporibus et dolorem nam enim. Necessitatibus autem omnis laudantium amet doloribus dolorem minima.', 373.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1198, 'Intelligent Leather Hat', '7066187440766', 'intelligent-leather-hat', 'Debitis voluptates aut consectetur eligendi. Omnis ipsam quasi illum deleniti totam ad maxime.', 1187.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1199, 'Fantastic Cotton Plate', '4068277234715', 'fantastic-cotton-plate', 'Non quia aut nihil perferendis. Fugit dolores quisquam labore et molestiae. Sit assumenda libero facere et.', 1820.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1200, 'Fantastic Marble Shoes', '5338538188286', 'fantastic-marble-shoes', 'Qui rem sint hic atque. Laboriosam natus doloremque officiis iure. Quia soluta commodi ut et minima aspernatur et pariatur.', 4673.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1201, 'Durable Paper Wallet', '5804167425615', 'durable-paper-wallet', 'Eveniet possimus quibusdam et eveniet atque suscipit voluptas. Sit voluptatem quo voluptatibus sed molestiae odit.', 1490.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1202, 'Fantastic Steel Coat', '2557006487857', 'fantastic-steel-coat', 'Fugit atque nostrum porro excepturi. Unde adipisci eos corrupti officia nam aut sequi. Sit quis laudantium vitae.', 4300.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1203, 'Rustic Granite Shoes', '6672516648676', 'rustic-granite-shoes', 'Dolor reprehenderit repellat facilis doloremque repudiandae sed. Veniam debitis quos qui similique minus impedit architecto similique.', 3364.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1204, 'Durable Concrete Bottle', '6826906666508', 'durable-concrete-bottle', 'Impedit et ratione et pariatur. Qui aut sint exercitationem id non. Eaque perferendis enim aut delectus voluptatem.', 3875.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1205, 'Fantastic Wooden Bag', '1532843683366', 'fantastic-wooden-bag', 'Accusantium aliquam tempore in sit quo dolor et rerum. Quibusdam qui iusto magni beatae quos voluptatem.', 1406.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1206, 'Gorgeous Iron Shirt', '2928422249853', 'gorgeous-iron-shirt', 'Qui est corrupti adipisci. Iste nulla consectetur praesentium cum eos veritatis. Eum et ex et ut cumque mollitia.', 3582.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1207, 'Enormous Granite Knife', '6661170531035', 'enormous-granite-knife', 'Asperiores est repellat aut ducimus et. Doloremque voluptatem ipsa omnis perspiciatis ut omnis nihil magnam.', 4837.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1208, 'Gorgeous Linen Watch', '3814996983660', 'gorgeous-linen-watch', 'Velit laborum aliquam vel et quia. Est deleniti fuga sapiente impedit. Nobis et dolorem asperiores totam et.', 2794.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1209, 'Aerodynamic Marble Bench', '5609805065686', 'aerodynamic-marble-bench', 'Eum ex et sit porro est asperiores saepe. Consequuntur aliquam qui qui nam maiores autem. Aut modi eius asperiores inventore.', 1255.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1210, 'Enormous Marble Plate', '1745543023657', 'enormous-marble-plate', 'Optio est aut vitae qui dolorem. Aliquid eos doloremque eligendi sed sed nihil consequatur omnis.', 1549.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1211, 'Enormous Cotton Chair', '4094158830875', 'enormous-cotton-chair', 'Optio pariatur eos pariatur eos saepe. Quidem assumenda adipisci est molestiae cumque sint. Qui itaque omnis ipsa quis.', 1532.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1212, 'Fantastic Plastic Lamp', '0467497145124', 'fantastic-plastic-lamp', 'Doloribus ab quis distinctio non. Et tenetur sint ipsa neque pariatur facere quibusdam. Sint magnam corrupti est et ad.', 4873.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1213, 'Incredible Paper Hat', '6696207458825', 'incredible-paper-hat', 'Itaque et voluptatibus consequatur repellendus et. Nesciunt aperiam error at iusto.', 2966.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1214, 'Incredible Cotton Lamp', '2304573305813', 'incredible-cotton-lamp', 'Ipsum quasi voluptatem aperiam dolorum at. Ipsum ut in aliquam et qui.', 991.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1215, 'Lightweight Leather Car', '1007739167607', 'lightweight-leather-car', 'Voluptates dolor facere et dolores. Odio eveniet ipsum commodi aut accusamus.', 1193.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1216, 'Synergistic Linen Shirt', '4559427582300', 'synergistic-linen-shirt', 'Nam molestiae quia voluptatibus temporibus. Sed quidem ab aliquam id. Minus sed harum quasi nulla rerum placeat quia sed.', 3826.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1217, 'Rustic Leather Shirt', '0154713433942', 'rustic-leather-shirt', 'Quidem ex minima accusamus veritatis. Soluta natus veniam earum quod.', 1275.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1218, 'Sleek Marble Clock', '3721138490507', 'sleek-marble-clock', 'Nisi pariatur libero amet repudiandae non aliquam ipsum. Pariatur rerum quis aspernatur quam numquam.', 2355.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1219, 'Heavy Duty Leather Bag', '3117921551331', 'heavy-duty-leather-bag', 'Maiores hic voluptatem iusto autem et ratione. Qui ea ut perspiciatis aut facere ipsa. Qui consequatur non id et.', 1433.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1220, 'Heavy Duty Rubber Bottle', '0834370810552', 'heavy-duty-rubber-bottle', 'Quo quod quos dolorem. Eveniet distinctio ut minima ut delectus tenetur explicabo. Rem nobis consequatur quia et quis.', 3302.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1221, 'Aerodynamic Rubber Plate', '0605138303834', 'aerodynamic-rubber-plate', 'Et unde dolore dolorem qui officia ipsum autem. Nihil aut dicta sint quis.', 4154.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1222, 'Ergonomic Concrete Gloves', '4899017742081', 'ergonomic-concrete-gloves', 'Et non incidunt est. Hic veniam quia vitae atque. Qui dolores voluptatem sed blanditiis eos ab doloribus.', 733.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1223, 'Mediocre Granite Coat', '0307167590536', 'mediocre-granite-coat', 'Ea quia ut saepe ut. Debitis eos autem reprehenderit. Praesentium cumque dolor qui vel quia.', 3953.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1224, 'Durable Copper Table', '5755151682913', 'durable-copper-table', 'In laborum ut cupiditate itaque iusto vel recusandae est. Explicabo laborum voluptatem sed iusto. Facere sequi et ut est incidunt sit.', 2234.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1225, 'Synergistic Copper Bench', '2251804498175', 'synergistic-copper-bench', 'Dolorem et sapiente dolor sed. Qui nostrum neque ullam occaecati architecto.', 3190.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1226, 'Lightweight Bronze Pants', '6123187942100', 'lightweight-bronze-pants', 'Facilis natus repellendus unde provident dolorem rerum. Aut vel provident aut ullam. Porro culpa molestiae beatae ut.', 1661.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1227, 'Gorgeous Rubber Plate', '4960818294274', 'gorgeous-rubber-plate', 'Aut repellat rerum itaque tenetur natus voluptatem. Aut voluptatem dignissimos ut delectus veritatis quibusdam.', 642.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1228, 'Rustic Cotton Bottle', '5298248976866', 'rustic-cotton-bottle', 'Corporis quos dolorem earum tenetur sunt et exercitationem. Reprehenderit sit nisi veritatis et at doloribus ut. Veniam voluptatem et repellendus quasi excepturi qui.', 1981.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1229, 'Synergistic Wooden Clock', '3301814970020', 'synergistic-wooden-clock', 'Voluptatem harum earum illo dolores est. Voluptatem voluptas voluptate qui nisi.', 3024.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1230, 'Small Wooden Pants', '4867302950640', 'small-wooden-pants', 'Eum sunt dolorem error omnis. Sunt et iure ex nihil voluptatem.', 1964.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1231, 'Practical Granite Watch', '3501493866113', 'practical-granite-watch', 'Unde ipsum non placeat possimus ut. Exercitationem architecto commodi quaerat ducimus sed quod maxime.', 1778.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1232, 'Incredible Granite Coat', '1470053464316', 'incredible-granite-coat', 'Atque omnis quod ea nostrum. Et ullam culpa rerum ad reprehenderit aut.', 2152.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1233, 'Fantastic Wool Chair', '5866206282368', 'fantastic-wool-chair', 'Ut qui autem itaque. Libero est rerum sed aut dolore earum velit. Sit ducimus officia nobis animi iure dolorem.', 3929.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1234, 'Sleek Paper Bench', '5111234355172', 'sleek-paper-bench', 'Incidunt sit ea ad quia. Est aut dolor fugiat labore quibusdam sed fuga.', 3373.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1235, 'Sleek Linen Shirt', '8415530607414', 'sleek-linen-shirt', 'Eligendi illum iusto quia aliquam. Repudiandae autem tempora vero molestias earum ut.', 4846.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1236, 'Gorgeous Silk Computer', '3724985364083', 'gorgeous-silk-computer', 'Dolorem quam eaque optio et magni unde rerum voluptas. Reiciendis veritatis voluptate eveniet illum. Facere earum ducimus voluptatem fuga tempore facere.', 4804.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1237, 'Synergistic Paper Knife', '8548541855731', 'synergistic-paper-knife', 'Architecto voluptates vel eaque rem. Hic earum dicta consequatur enim animi.', 710.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1238, 'Synergistic Aluminum Chair', '7073006390850', 'synergistic-aluminum-chair', 'Aut necessitatibus architecto at quas dolorum. Ipsa repellat iste est aut et.', 519.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1239, 'Gorgeous Granite Bag', '9854346513714', 'gorgeous-granite-bag', 'Hic placeat laudantium eaque necessitatibus. Asperiores quaerat voluptatem nobis maxime aut.', 4390.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1240, 'Awesome Plastic Keyboard', '8396979353790', 'awesome-plastic-keyboard', 'Assumenda sunt doloribus laboriosam aliquam beatae sequi qui. Quaerat qui minima est odit quia minima.', 3074.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1241, 'Heavy Duty Paper Chair', '0247251412736', 'heavy-duty-paper-chair', 'Nobis laborum est id esse amet autem sed aliquid. Omnis et ipsum maxime ipsa est qui accusantium rerum. Optio quia et amet aspernatur.', 1215.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1242, 'Aerodynamic Cotton Bag', '9415754130292', 'aerodynamic-cotton-bag', 'Quod quod laudantium iure non quam est. Quasi veritatis quia dolores quo sint neque.', 4751.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1243, 'Incredible Concrete Watch', '8492042338609', 'incredible-concrete-watch', 'Minima vitae dolore praesentium facilis aut laudantium. Aperiam minus animi excepturi dolor earum unde ipsam iure. Qui tempore vero illo odio dicta ut molestias.', 3245.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1244, 'Incredible Iron Wallet', '3173602312387', 'incredible-iron-wallet', 'Ea ducimus numquam et cupiditate consequatur a dolorum repellat. Accusantium deserunt incidunt aut at.', 2104.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1245, 'Fantastic Rubber Hat', '0132961940160', 'fantastic-rubber-hat', 'Voluptates aliquid ut voluptates ut ad. Cum ullam ipsum nemo optio. Fugit ea qui natus nulla.', 3392.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1246, 'Sleek Marble Coat', '5919673653671', 'sleek-marble-coat', 'Eaque qui voluptate quas magni blanditiis aliquid doloremque odio. Libero aspernatur dolorum sint harum.', 2211.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1247, 'Sleek Wooden Gloves', '9408371728034', 'sleek-wooden-gloves', 'Et deleniti officiis qui placeat est. Hic non qui ut sed enim minima non.', 4807.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1248, 'Practical Paper Pants', '4827889966434', 'practical-paper-pants', 'Consequatur explicabo ipsum ea vero vel voluptas at. Dicta officia id vitae fugit quo cumque. Earum sunt aut pariatur.', 1003.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1249, 'Mediocre Wool Hat', '9511046902636', 'mediocre-wool-hat', 'Magni eligendi aut ut explicabo nisi. Iusto hic laboriosam molestias quod ea repudiandae sunt. Soluta iure rem voluptatem earum deserunt veritatis aspernatur.', 1988.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1250, 'Enormous Plastic Wallet', '2234986498928', 'enormous-plastic-wallet', 'Ducimus assumenda accusantium tenetur. Et porro fuga deleniti fugit. Dolorem ducimus deleniti debitis non animi cum.', 1355.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1251, 'Fantastic Granite Table', '6765976160502', 'fantastic-granite-table', 'Atque hic odio veniam aut. Voluptatem inventore voluptatum odio ad praesentium est. Facilis eveniet sit voluptate rerum non.', 983.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1252, 'Ergonomic Leather Table', '6191910273319', 'ergonomic-leather-table', 'Voluptas quasi eveniet soluta commodi pariatur officiis laudantium. Id rerum molestiae ullam eos quis. Aut doloremque eos culpa perspiciatis qui tenetur odio.', 3794.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1253, 'Lightweight Leather Knife', '8715010753731', 'lightweight-leather-knife', 'Et harum et ipsa libero aut delectus quaerat veniam. Dolores quia laboriosam error mollitia voluptatem beatae sed.', 2707.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1254, 'Ergonomic Cotton Clock', '7099374668476', 'ergonomic-cotton-clock', 'Unde et quis doloribus. Consequuntur ut velit quidem non ratione.', 4082.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1255, 'Aerodynamic Copper Car', '7385867129549', 'aerodynamic-copper-car', 'Quia suscipit voluptas aliquam explicabo deserunt et. Aperiam veritatis reprehenderit qui porro modi quia ea at.', 3358.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1256, 'Aerodynamic Bronze Shoes', '7135147710949', 'aerodynamic-bronze-shoes', 'Velit veritatis animi ipsa id dignissimos. Sint sit doloribus soluta libero pariatur.', 128.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1257, 'Sleek Wooden Watch', '6692079951730', 'sleek-wooden-watch', 'Sint sapiente quaerat numquam expedita. Qui qui voluptatibus iusto accusantium. Aut laborum et illo rerum voluptatem alias voluptatum.', 925.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1258, 'Lightweight Steel Bottle', '0249892344117', 'lightweight-steel-bottle', 'Fugiat et qui tempora. Quam aliquid assumenda dolorum omnis quia ipsam distinctio.', 3386.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1259, 'Awesome Bronze Clock', '5175833506526', 'awesome-bronze-clock', 'Tempore aspernatur quia est totam cumque. Deserunt autem officia eius fugiat sapiente. Sapiente omnis sapiente corrupti qui in dolor ut.', 3735.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1260, 'Incredible Rubber Hat', '6223753840509', 'incredible-rubber-hat', 'At quis omnis quae odio laborum velit perspiciatis sit. Inventore iure cupiditate qui quos. Autem repellat consequatur rerum nisi magni laudantium.', 4203.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1261, 'Awesome Granite Shirt', '1574823721910', 'awesome-granite-shirt', 'Quia et beatae explicabo totam soluta. Dolorem fugiat rerum nisi et. Quam officia voluptatem pariatur aut.', 1733.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1262, 'Lightweight Bronze Shirt', '2945431454542', 'lightweight-bronze-shirt', 'Perferendis ab voluptas nihil officia numquam enim. Odit et vel ut laudantium nihil labore blanditiis est. Numquam quidem alias ut.', 4241.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1263, 'Small Rubber Chair', '9914764916983', 'small-rubber-chair', 'Aut est beatae perferendis voluptas placeat deserunt sequi. Perferendis dolor nihil nostrum a quis veniam.', 1845.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1264, 'Incredible Linen Plate', '8740163017973', 'incredible-linen-plate', 'Autem voluptatem officiis quo quis. Similique neque aut dolorem ut. Libero rerum aut possimus maiores qui pariatur.', 3939.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1265, 'Incredible Bronze Plate', '0172878689660', 'incredible-bronze-plate', 'Accusantium rem quidem quibusdam vel. Omnis aut est sunt sed.', 4558.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1266, 'Aerodynamic Aluminum Pants', '8255269879481', 'aerodynamic-aluminum-pants', 'Hic sequi fuga delectus neque sequi quasi. Eos odio maiores recusandae.', 1770.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1267, 'Aerodynamic Silk Hat', '3881394950600', 'aerodynamic-silk-hat', 'Facere nobis beatae odit voluptatem nisi quas perferendis dolor. Excepturi nobis aliquam rerum mollitia.', 3491.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1268, 'Fantastic Copper Bottle', '0245081010672', 'fantastic-copper-bottle', 'Omnis soluta numquam et est assumenda voluptatem voluptatem. Culpa enim quod quo in qui et rem.', 4306.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1269, 'Synergistic Concrete Plate', '9541592777655', 'synergistic-concrete-plate', 'Pariatur eum vitae nisi voluptates. Odit a quia nihil illum exercitationem. Recusandae beatae aspernatur repudiandae est cum autem sequi sunt.', 2045.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1270, 'Gorgeous Iron Coat', '7615510112070', 'gorgeous-iron-coat', 'Culpa recusandae voluptas laboriosam assumenda consequatur. Facere laudantium commodi vitae iusto.', 618.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1271, 'Ergonomic Wool Bottle', '6758492285767', 'ergonomic-wool-bottle', 'Ab velit sequi et minus. Voluptatibus rerum quos et at aut voluptas minima.', 2598.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1272, 'Durable Wooden Coat', '7910806905597', 'durable-wooden-coat', 'Et maiores porro asperiores nulla vel harum. Impedit tempora aspernatur consequuntur enim velit. Adipisci et veritatis similique rerum voluptatem aperiam veniam.', 191.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1273, 'Durable Iron Bottle', '4947717227176', 'durable-iron-bottle', 'Consequatur ut consequatur placeat rem recusandae est nostrum. Perferendis quos dolor in officiis cum aut porro. Aut blanditiis beatae natus necessitatibus rerum velit nam.', 2630.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1274, 'Fantastic Wool Car', '6904662934540', 'fantastic-wool-car', 'In amet quia vero libero. Qui ut eos quas nihil earum.', 4179.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1275, 'Incredible Plastic Lamp', '8945031186465', 'incredible-plastic-lamp', 'Nihil quo explicabo vel suscipit quia. Voluptatem totam odit cum est corrupti. Suscipit dolores illo a iste dignissimos itaque.', 1763.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1276, 'Durable Cotton Chair', '5465693531364', 'durable-cotton-chair', 'Molestias vel consectetur voluptas ratione eum excepturi. Enim quia dolore maxime occaecati. Rerum sit voluptate amet nobis sunt cupiditate.', 4468.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1277, 'Mediocre Wool Coat', '1420223724214', 'mediocre-wool-coat', 'Aliquid autem explicabo quis laudantium dolor animi autem. Quia possimus aut alias corporis. Nobis ipsam in officia est dolor.', 300.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1278, 'Awesome Marble Clock', '0034048709922', 'awesome-marble-clock', 'Recusandae deleniti ea consequatur. Iure cumque et rerum quas molestias saepe. Fugiat hic enim minus a.', 326.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1279, 'Aerodynamic Linen Pants', '7296359948121', 'aerodynamic-linen-pants', 'Laudantium beatae est ut dolorum labore nihil ratione laudantium. Aspernatur animi numquam autem reprehenderit dolorum sit inventore nisi.', 3363.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1280, 'Ergonomic Cotton Keyboard', '5688045973685', 'ergonomic-cotton-keyboard', 'Nobis impedit porro corrupti dicta voluptas. Facere ipsa sed et. Fugiat reiciendis ut qui occaecati voluptas.', 1400.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1281, 'Awesome Concrete Gloves', '1376077759844', 'awesome-concrete-gloves', 'Esse maxime provident quaerat id expedita. Reiciendis repellat libero praesentium vel ducimus ipsa. Aut perferendis dignissimos cum quos.', 1740.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1282, 'Ergonomic Plastic Knife', '7866144768380', 'ergonomic-plastic-knife', 'Est provident excepturi et. Cumque omnis et corporis exercitationem voluptatem delectus doloremque.', 404.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1283, 'Aerodynamic Wooden Chair', '7149891666629', 'aerodynamic-wooden-chair', 'Voluptas unde ipsa quia adipisci dicta quisquam libero assumenda. Corporis ex vel quo alias.', 3886.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1284, 'Ergonomic Aluminum Shirt', '4902965589643', 'ergonomic-aluminum-shirt', 'Sed facere corrupti libero ipsam. Autem ut dolorum harum tenetur a.', 1532.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1285, 'Practical Silk Shoes', '6997763627510', 'practical-silk-shoes', 'Qui harum natus quia rerum. Non rerum eaque porro cum.', 617.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1286, 'Synergistic Linen Bag', '1544993573190', 'synergistic-linen-bag', 'Eius qui repellat consequuntur. Vel reiciendis et esse natus quos. Voluptas vitae non libero et ut.', 4948.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1287, 'Gorgeous Iron Car', '9762043648656', 'gorgeous-iron-car', 'Adipisci quis rerum sit tempore et veniam. A ad soluta soluta qui. Aut ut saepe nemo cupiditate exercitationem reprehenderit.', 4498.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1288, 'Heavy Duty Wooden Bench', '0746973363987', 'heavy-duty-wooden-bench', 'Quos omnis ipsam placeat asperiores. Minima iure eius qui velit. Et voluptatum itaque ab iste.', 1355.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1289, 'Fantastic Leather Clock', '8333436306548', 'fantastic-leather-clock', 'Rerum sunt illum nihil voluptatem sequi tempora quibusdam. Ipsa animi nisi eligendi.', 1193.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1290, 'Lightweight Bronze Bag', '6364129819979', 'lightweight-bronze-bag', 'Asperiores odit ipsa voluptatem commodi et laboriosam dolore. Commodi inventore eaque est veniam non consequatur in. Incidunt officiis porro error sint et recusandae.', 1745.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1291, 'Synergistic Marble Knife', '3604587177222', 'synergistic-marble-knife', 'Porro aut eum quisquam. Nisi id voluptatum quidem blanditiis quasi non. Nihil non dignissimos dolorem ut dolorem.', 567.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1292, 'Ergonomic Concrete Plate', '0862358864204', 'ergonomic-concrete-plate', 'Beatae sed quo amet optio. Quaerat vitae ut ut excepturi. At et iure est ut et sit.', 2662.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1293, 'Rustic Steel Watch', '7579862889137', 'rustic-steel-watch', 'Dolor optio doloribus veniam doloremque. Aut adipisci similique esse quidem. Blanditiis quis id rem consequuntur non omnis.', 4067.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1294, 'Rustic Plastic Clock', '0798146079355', 'rustic-plastic-clock', 'Enim enim eum dignissimos aliquam deserunt pariatur. Consequatur atque et perferendis dicta nesciunt.', 597.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1295, 'Lightweight Granite Car', '7383564168069', 'lightweight-granite-car', 'Et dolore tenetur quibusdam doloremque laborum. Molestiae consequatur molestiae quibusdam voluptates dolores recusandae sit.', 2435.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1296, 'Ergonomic Aluminum Plate', '4793281730082', 'ergonomic-aluminum-plate', 'Possimus ex asperiores eius voluptates. Fuga quisquam quasi dolores placeat ab.', 1884.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1297, 'Enormous Aluminum Chair', '7504320538296', 'enormous-aluminum-chair', 'Voluptatem officiis dolorem ut sunt officia voluptatem et odio. Est sit est modi dolores. Tempore molestiae consequatur et dolor reiciendis et accusamus.', 2967.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1298, 'Fantastic Plastic Bottle', '1194730169690', 'fantastic-plastic-bottle', 'Ut ea minima enim illo inventore facere. Odio suscipit nam nihil aut unde explicabo qui sed. Magni ea nam nihil minima.', 3689.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1299, 'Practical Steel Coat', '1468072990763', 'practical-steel-coat', 'Animi corporis voluptatem non totam. Tenetur consectetur est ducimus modi labore cupiditate ullam. Iusto ea dicta sed et quam quia ea tempora.', 2226.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1300, 'Intelligent Granite Car', '0847071521276', 'intelligent-granite-car', 'Dolorum amet cumque ipsam rerum consequuntur quia sit qui. Molestias qui excepturi dolores velit omnis sit.', 2808.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1301, 'Aerodynamic Linen Hat', '0227903286137', 'aerodynamic-linen-hat', 'Aut dolores facilis id quia molestiae. Commodi excepturi quidem aliquid et ratione et. Quam pariatur deleniti sint ut alias consectetur rerum.', 4629.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1302, 'Mediocre Leather Clock', '8106226886786', 'mediocre-leather-clock', 'Et quis praesentium facilis dolorem. Et et quia mollitia totam in.', 2595.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1303, 'Aerodynamic Leather Watch', '9693096729392', 'aerodynamic-leather-watch', 'Reprehenderit sit aut non delectus voluptatem doloribus mollitia. Et est alias rerum suscipit saepe. Laudantium sit neque iure consequatur similique doloribus ut occaecati.', 452.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1304, 'Small Copper Pants', '4866710207827', 'small-copper-pants', 'Consequuntur non reiciendis et rem voluptas non doloribus dolor. Dolorem voluptatum in suscipit voluptatem neque quisquam eos.', 2877.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1305, 'Lightweight Iron Bottle', '1188948655656', 'lightweight-iron-bottle', 'Laborum quos quia nam debitis quos occaecati. Ut et id aut modi animi quidem. Dolorem amet qui corporis quibusdam.', 739.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1306, 'Intelligent Granite Shoes', '4922263435398', 'intelligent-granite-shoes', 'Aliquid qui nobis voluptatem nulla. Velit voluptatem omnis est aperiam qui. Nihil vitae occaecati quae in.', 3733.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1307, 'Sleek Aluminum Wallet', '7167602313600', 'sleek-aluminum-wallet', 'Voluptatibus molestiae voluptates voluptas dolorum. Et quaerat occaecati praesentium libero facere consectetur.', 4715.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1308, 'Small Rubber Wallet', '1749192546413', 'small-rubber-wallet', 'Omnis aut vel quia ut et. Unde velit excepturi quia. At soluta ipsa nemo.', 1952.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1309, 'Awesome Silk Lamp', '1183129531354', 'awesome-silk-lamp', 'Quis ut necessitatibus qui autem ut quo. Reiciendis molestiae porro soluta aut repellendus sunt.', 4664.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1310, 'Durable Wool Shirt', '8883110732496', 'durable-wool-shirt', 'Aut ut omnis et expedita minima. Quia labore qui excepturi sed repudiandae dolorem dolores. Est ea tempore consequatur ut temporibus doloremque.', 3077.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1311, 'Heavy Duty Plastic Bag', '6304791443782', 'heavy-duty-plastic-bag', 'Facilis omnis doloremque accusantium autem et. Beatae amet voluptatem iste est totam. Beatae ducimus aut et cum ducimus minus.', 2736.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1312, 'Fantastic Aluminum Bag', '2357280550045', 'fantastic-aluminum-bag', 'Omnis maxime occaecati voluptatem optio debitis non enim. Eum occaecati soluta tempore eum accusantium.', 3996.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1313, 'Heavy Duty Wool Lamp', '3502206304625', 'heavy-duty-wool-lamp', 'Eum doloremque atque cupiditate dolorem. Repellat et ut natus facere dolores consequuntur. Optio reprehenderit deserunt modi.', 3063.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1314, 'Heavy Duty Concrete Shirt', '2142998577367', 'heavy-duty-concrete-shirt', 'Similique qui voluptas est reprehenderit velit dicta libero. Sit saepe perspiciatis cupiditate inventore cumque facere natus.', 263.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1315, 'Awesome Cotton Knife', '8307474327339', 'awesome-cotton-knife', 'Quis praesentium recusandae enim eum dolorum. Nobis dolorem voluptatem esse iste dolores adipisci nobis.', 1987.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1316, 'Fantastic Wooden Chair', '6543921164856', 'fantastic-wooden-chair', 'Placeat quas vel qui et exercitationem deserunt. Blanditiis ducimus voluptates eum est. Hic omnis natus at aut qui vel et.', 4434.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1317, 'Durable Paper Plate', '0847581993471', 'durable-paper-plate', 'Nostrum eius natus molestias nulla. Officiis aspernatur veniam molestiae vel voluptate. Repudiandae assumenda ea eum molestias id aspernatur.', 1098.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1318, 'Heavy Duty Granite Bench', '5168494214817', 'heavy-duty-granite-bench', 'Libero veritatis eos aspernatur voluptatem cupiditate vel veritatis. Ullam laboriosam qui totam laboriosam. Reprehenderit illum eum inventore ut eius quidem.', 1710.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1319, 'Aerodynamic Paper Bench', '0645259951163', 'aerodynamic-paper-bench', 'Sit laboriosam nihil qui modi beatae et. Alias est dolore deleniti sint atque quisquam quidem. Est et voluptas aperiam.', 1823.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1320, 'Sleek Leather Computer', '9656672876026', 'sleek-leather-computer', 'Natus et quae itaque nihil dicta. Saepe eaque est animi aspernatur ut debitis. Neque illum voluptatem nulla blanditiis aliquam illum repellendus.', 2533.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1321, 'Durable Concrete Wallet', '7380593607453', 'durable-concrete-wallet', 'Dignissimos id expedita ea et aliquam nisi ut consequatur. Consequuntur enim modi doloribus labore optio numquam.', 1573.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1322, 'Aerodynamic Concrete Bottle', '5276237288077', 'aerodynamic-concrete-bottle', 'Illo delectus accusamus tenetur. Non similique sint adipisci saepe. Vitae est distinctio et voluptas eius perferendis.', 716.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1323, 'Intelligent Plastic Lamp', '0140862379910', 'intelligent-plastic-lamp', 'Perferendis perferendis ea aspernatur possimus rem at non. Nihil voluptatem exercitationem nesciunt odit magni dolor. Sint iste non ratione vel consequuntur.', 3193.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1324, 'Intelligent Bronze Hat', '6670546564850', 'intelligent-bronze-hat', 'Veritatis libero voluptas ut totam et sit rerum. Perferendis ducimus similique itaque unde qui nobis.', 947.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1325, 'Fantastic Wool Computer', '8454557100911', 'fantastic-wool-computer', 'Adipisci itaque quasi neque exercitationem quia rem reiciendis. A velit blanditiis qui totam totam velit id.', 3881.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1326, 'Rustic Linen Watch', '0803413403648', 'rustic-linen-watch', 'Tenetur voluptatibus beatae itaque illo. Cupiditate quia placeat velit non.', 3135.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1327, 'Ergonomic Steel Bag', '4337835357266', 'ergonomic-steel-bag', 'Ducimus inventore vitae consequatur minus. Fugiat totam sequi assumenda veritatis. Quisquam praesentium aliquam et possimus quo quia enim.', 3466.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1328, 'Enormous Concrete Clock', '2463701077999', 'enormous-concrete-clock', 'Fugit rerum dolores quo nam numquam earum ullam. Et minima eligendi dolor nemo. Aut illo veritatis culpa saepe a.', 4326.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1329, 'Gorgeous Paper Pants', '2437619920487', 'gorgeous-paper-pants', 'Quas iste consequatur rerum nemo doloribus temporibus a et. Qui officiis vel fugit quos.', 1315.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1330, 'Practical Rubber Chair', '3217500963392', 'practical-rubber-chair', 'Explicabo aut cumque maxime facere autem qui suscipit. Corporis magnam molestias dolorum blanditiis aut ipsa. Consequatur autem quam aut perferendis suscipit.', 2215.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1331, 'Small Paper Coat', '9312592645196', 'small-paper-coat', 'Consequuntur ut vero reiciendis necessitatibus maxime. Quaerat ratione natus voluptates neque.', 665.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1332, 'Durable Linen Knife', '3615336144600', 'durable-linen-knife', 'Rerum eius omnis nam. Quibusdam ipsam dolorem est ut sit similique ea reiciendis. Est omnis voluptatem perspiciatis vel quia.', 218.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1333, 'Durable Aluminum Wallet', '6968479339486', 'durable-aluminum-wallet', 'Qui aut nemo aut quia inventore ipsam. Ullam quaerat fugit est.', 3930.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1334, 'Small Marble Car', '8381953186280', 'small-marble-car', 'Ea aspernatur culpa omnis et. Et ullam molestiae qui ut et.', 563.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1335, 'Ergonomic Leather Knife', '3489460254265', 'ergonomic-leather-knife', 'Sed id assumenda explicabo. Aut voluptatem dolorum labore et.', 4579.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1336, 'Fantastic Marble Watch', '6301605489844', 'fantastic-marble-watch', 'Illum dolore officia aliquam. Ex odit vel velit quas.', 1935.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1337, 'Lightweight Marble Bench', '2399350870257', 'lightweight-marble-bench', 'Dolor maiores similique et maiores. Quis quidem ullam maxime nostrum natus. Vel voluptatem sed quae non atque.', 2690.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1338, 'Practical Aluminum Bottle', '6791732056307', 'practical-aluminum-bottle', 'Doloremque perspiciatis eaque est quia rerum aliquam. Cupiditate voluptas ut eligendi animi qui ut in.', 3825.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1339, 'Gorgeous Wooden Bag', '4554001634918', 'gorgeous-wooden-bag', 'Ducimus ut labore unde veniam quod earum exercitationem. Molestias nesciunt at libero eaque.', 3201.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1340, 'Mediocre Copper Bottle', '9831507142518', 'mediocre-copper-bottle', 'Id illo accusantium vitae. Hic repellat aut ratione qui quas accusamus.', 2594.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1341, 'Aerodynamic Iron Shoes', '4373538048582', 'aerodynamic-iron-shoes', 'Sint praesentium dolor aut. Ducimus aut non rerum voluptas corporis inventore.', 2792.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1342, 'Incredible Concrete Wallet', '7268532169340', 'incredible-concrete-wallet', 'Quos nemo et itaque voluptatibus. Temporibus temporibus nihil vero rerum sapiente ratione facilis. Blanditiis dolorem veniam quos recusandae.', 2422.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1343, 'Ergonomic Cotton Shoes', '9549549889857', 'ergonomic-cotton-shoes', 'Omnis et ratione nam expedita facilis. Voluptas eveniet delectus adipisci expedita incidunt cumque sint dolores.', 2143.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1344, 'Aerodynamic Bronze Pants', '7898495285353', 'aerodynamic-bronze-pants', 'Error praesentium et et cupiditate et. Dicta sint quibusdam ratione quasi exercitationem fuga qui.', 2515.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1345, 'Awesome Copper Watch', '4081849186373', 'awesome-copper-watch', 'Error eum et repellendus rerum. Possimus sit animi magni illum sunt rerum.', 1406.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1346, 'Gorgeous Rubber Car', '5067995679999', 'gorgeous-rubber-car', 'Possimus non autem non voluptatem ut quo cupiditate mollitia. Nobis vitae iusto autem perspiciatis exercitationem doloribus laboriosam. Commodi incidunt sed voluptatem id nulla quia nesciunt eos.', 2314.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1347, 'Sleek Marble Shirt', '6894458249715', 'sleek-marble-shirt', 'Qui et neque ad optio qui deleniti cupiditate. Id voluptatibus nihil earum est perferendis. Quod quod rerum molestias aut corporis.', 3226.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1348, 'Small Granite Lamp', '0205801117951', 'small-granite-lamp', 'Excepturi dolorem quibusdam similique quas similique molestias. Et esse est reprehenderit enim nihil quo. Cum quo beatae itaque officia quia.', 3532.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1349, 'Sleek Wooden Wallet', '6499551739493', 'sleek-wooden-wallet', 'Hic harum consequuntur animi ullam est quaerat. Et repellat non porro ipsa culpa cum dolorem beatae. Dignissimos provident voluptas non consequatur.', 4832.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1350, 'Sleek Linen Watch', '3651146369093', 'sleek-linen-watch', 'Voluptatum occaecati ullam cumque et molestiae. Laudantium facere in molestiae minima vel cupiditate officia. Suscipit est quo dolorem voluptas inventore provident.', 2791.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1351, 'Fantastic Aluminum Keyboard', '1083642665416', 'fantastic-aluminum-keyboard', 'Suscipit consectetur rerum libero quo. Voluptatem voluptas itaque mollitia aliquam. Iure veniam et cumque consectetur non.', 3120.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1352, 'Durable Steel Wallet', '5198420354812', 'durable-steel-wallet', 'Eius consequatur voluptas neque impedit velit. Qui facere porro consequatur quas porro aut.', 1553.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1353, 'Practical Marble Gloves', '9038971540653', 'practical-marble-gloves', 'Id amet quia culpa aut voluptates culpa. Est molestias voluptatum tempora. Rerum perspiciatis sed asperiores dolorem repudiandae.', 2814.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1354, 'Fantastic Steel Clock', '9418751216938', 'fantastic-steel-clock', 'Dicta consequuntur rerum sit ex autem omnis soluta. Veritatis repellendus accusamus hic veritatis facilis tenetur.', 105.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1355, 'Sleek Silk Shoes', '7850453861306', 'sleek-silk-shoes', 'Distinctio blanditiis laudantium temporibus ea et tempore. Ipsam voluptates autem consectetur earum debitis omnis hic.', 4095.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1356, 'Heavy Duty Marble Coat', '6561049747737', 'heavy-duty-marble-coat', 'Recusandae omnis ut aut fuga. Iste minus aut mollitia id doloremque. Molestiae qui perferendis nemo ipsa.', 4575.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1357, 'Heavy Duty Plastic Watch', '3155251561705', 'heavy-duty-plastic-watch', 'Velit quos qui dolores ex molestiae tempora ipsa iste. At dolor culpa dolor labore in.', 946.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1358, 'Durable Iron Keyboard', '8822029712120', 'durable-iron-keyboard', 'Debitis eveniet nesciunt suscipit dolores omnis aut a. Sed nobis et voluptatem fugiat eos sequi.', 2586.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1359, 'Fantastic Wool Knife', '4242556469290', 'fantastic-wool-knife', 'Cumque quis et provident temporibus. Vero sed id minus ex est et voluptatibus.', 2389.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1360, 'Intelligent Linen Clock', '8580335794543', 'intelligent-linen-clock', 'Voluptates velit consequuntur qui ut. Sunt consequatur est cumque eligendi expedita. Quisquam qui deserunt cumque autem atque sit.', 4790.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1361, 'Enormous Iron Computer', '1421859988971', 'enormous-iron-computer', 'Sit aut eos nulla ut. Nihil excepturi voluptatibus ipsa.', 4524.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1362, 'Heavy Duty Plastic Keyboard', '1580445982950', 'heavy-duty-plastic-keyboard', 'Aut est aut nisi odio incidunt hic. Et expedita sit repellendus.', 695.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1363, 'Gorgeous Bronze Plate', '9758513743594', 'gorgeous-bronze-plate', 'Tempora ut nemo est eos voluptate natus autem aut. Earum perferendis velit et ipsam quia labore. Iste nam possimus qui facere.', 261.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1364, 'Gorgeous Linen Clock', '4361962424249', 'gorgeous-linen-clock', 'Iusto aut officiis qui sit nam doloribus excepturi eaque. Pariatur consequuntur rerum minus ipsum ratione in.', 605.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1365, 'Lightweight Granite Computer', '6213107312981', 'lightweight-granite-computer', 'Temporibus rerum nulla alias quisquam labore. Veritatis explicabo rerum aut et accusamus neque ad occaecati. Deleniti aut sit laudantium vel sapiente.', 2123.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1366, 'Heavy Duty Copper Plate', '5715424079512', 'heavy-duty-copper-plate', 'Et a voluptate repudiandae ratione pariatur accusamus ab. Consequatur et quo quam nam.', 2410.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1367, 'Small Iron Watch', '7909704789828', 'small-iron-watch', 'Et corrupti quisquam cum nihil. Consequuntur ullam ut quia ea.', 2032.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1368, 'Aerodynamic Wooden Bag', '8312801519448', 'aerodynamic-wooden-bag', 'Ut distinctio iure excepturi quos possimus consequatur. Et omnis perspiciatis ut voluptatem.', 1431.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1369, 'Awesome Marble Chair', '7784633883393', 'awesome-marble-chair', 'Dolorem culpa odit repudiandae odio natus blanditiis inventore. Placeat omnis dignissimos neque iste ipsam vero cumque dolorum.', 3500, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1370, 'Lightweight Marble Lamp', '0908226402854', 'lightweight-marble-lamp', 'Error qui possimus distinctio eligendi consequatur quia. Ut magni quis ut porro.', 4221.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1371, 'Aerodynamic Linen Table', '1534999230180', 'aerodynamic-linen-table', 'Quae eum aut accusantium earum. Qui consequatur quis minima suscipit illum. Dolorem architecto quam laudantium cum rerum repudiandae.', 2179.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1372, 'Awesome Linen Bench', '5557050606966', 'awesome-linen-bench', 'Magnam tenetur mollitia repellat quia numquam harum maxime hic. Recusandae sapiente impedit iure ad eveniet. Qui rem et sit et in ea ipsa dolores.', 4396.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1373, 'Practical Wool Wallet', '4780422539796', 'practical-wool-wallet', 'Vel sed ullam aut veniam cum repudiandae. Quia aspernatur omnis non consequatur eligendi ullam quidem. Tempore ratione ipsa voluptas et quia.', 1622.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1374, 'Intelligent Leather Plate', '4690244724259', 'intelligent-leather-plate', 'Esse temporibus et voluptatem iure eligendi earum dolorem. Illum nulla ut ea voluptatibus. Vero voluptates soluta aliquam voluptas rerum earum.', 735.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1375, 'Incredible Silk Pants', '9421563794099', 'incredible-silk-pants', 'Ipsum sunt quis recusandae voluptas quisquam quia enim dignissimos. Eius vel esse quo molestiae. Ullam sunt numquam necessitatibus culpa cum.', 4416.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1376, 'Intelligent Leather Watch', '9305864106792', 'intelligent-leather-watch', 'Quasi repellat eaque fugiat praesentium voluptatibus cupiditate voluptas. Sequi qui voluptas hic voluptatem sequi voluptatem eligendi.', 3593.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1377, 'Ergonomic Steel Shirt', '4054894428293', 'ergonomic-steel-shirt', 'Ea consectetur sapiente reiciendis soluta atque sequi illo. Non incidunt aut ad error nobis omnis tempora molestias.', 4805.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1378, 'Gorgeous Silk Pants', '5073380894441', 'gorgeous-silk-pants', 'Ea ipsa ut eveniet ea. Soluta odit aperiam quo aut omnis. Velit possimus aspernatur voluptatem incidunt occaecati.', 697.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1379, 'Synergistic Marble Chair', '7795945704115', 'synergistic-marble-chair', 'Laudantium aliquid doloribus est debitis. Modi praesentium molestiae asperiores voluptatibus dolorem est necessitatibus. Qui accusamus et nemo ab.', 4314.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1380, 'Awesome Granite Computer', '7576921958650', 'awesome-granite-computer', 'Suscipit et recusandae et ut. Eum vel omnis id sequi.', 3556.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1381, 'Synergistic Marble Bottle', '8827885633152', 'synergistic-marble-bottle', 'Ut maxime omnis quod nobis omnis vitae laudantium. Illum sit non molestiae delectus est pariatur.', 4857.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1382, 'Fantastic Paper Lamp', '6861168132798', 'fantastic-paper-lamp', 'Ipsa consequatur reprehenderit rem ullam. Labore est modi enim omnis deleniti maxime corporis delectus. Quasi nobis corporis aut eum.', 3618.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1383, 'Mediocre Wool Pants', '2738805764527', 'mediocre-wool-pants', 'Rerum et consectetur nesciunt ea. Illum adipisci quia omnis minima asperiores deleniti.', 3723.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1384, 'Heavy Duty Paper Watch', '5281735124550', 'heavy-duty-paper-watch', 'Et tenetur nesciunt illo voluptates. Asperiores rerum perferendis expedita doloremque et commodi cumque deleniti.', 554.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1385, 'Incredible Aluminum Watch', '1752043325761', 'incredible-aluminum-watch', 'Doloremque deleniti iusto et quam velit fugit voluptatem. Sapiente animi itaque et consequatur alias.', 4767.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1386, 'Lightweight Paper Bench', '7607146387571', 'lightweight-paper-bench', 'Quo id a quasi quia. Delectus asperiores illo rerum sit voluptatem laudantium. Dolorem tenetur culpa et dicta illo.', 4573.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1387, 'Gorgeous Silk Clock', '9181755565813', 'gorgeous-silk-clock', 'Provident expedita beatae aut. Eum maxime quia dolore atque facere omnis.', 4428.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1388, 'Intelligent Leather Coat', '9651558037775', 'intelligent-leather-coat', 'Sint veniam minus qui placeat. Rerum ipsam sunt saepe minima voluptatem ad accusantium.', 1181.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1389, 'Small Cotton Clock', '8719410507703', 'small-cotton-clock', 'Adipisci reiciendis excepturi laboriosam iure amet. Eaque incidunt nesciunt enim molestiae ut aut corporis maiores. Aspernatur ad est maxime quidem suscipit alias.', 265.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1390, 'Aerodynamic Steel Watch', '1248160789437', 'aerodynamic-steel-watch', 'Corrupti quo consequatur aut minima ipsa. Doloribus blanditiis repudiandae repellat et et iste. Quae quas magni pariatur distinctio velit.', 1981.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1391, 'Aerodynamic Marble Coat', '9381094215930', 'aerodynamic-marble-coat', 'Ut fugiat numquam necessitatibus laborum omnis. Ab id consectetur itaque labore amet.', 1595.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1392, 'Heavy Duty Wool Bottle', '4941754748670', 'heavy-duty-wool-bottle', 'Quibusdam dolorem iure eos ducimus. Nulla placeat aut sed eos impedit occaecati. Maxime totam tempora occaecati sequi.', 2372.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1393, 'Incredible Wool Table', '9695416507833', 'incredible-wool-table', 'Unde eveniet et ut. Rerum ut quo enim est eos vel. Tempora placeat ex similique quia numquam consectetur id corrupti.', 4803.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1394, 'Aerodynamic Copper Gloves', '2524592334032', 'aerodynamic-copper-gloves', 'Ut dolore quidem cum et voluptatem. Dolorem qui voluptate quia eum a at et.', 3161.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1395, 'Intelligent Plastic Knife', '9621660971489', 'intelligent-plastic-knife', 'Quod nemo facilis vitae voluptas blanditiis tempora. Blanditiis quas non sit dolore incidunt.', 3481.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1396, 'Awesome Plastic Lamp', '0004765833675', 'awesome-plastic-lamp', 'Dolores dolores provident aspernatur in eius. Optio et aut perferendis.', 1798.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1397, 'Gorgeous Paper Knife', '5028465194411', 'gorgeous-paper-knife', 'Sunt voluptatem ipsam quod et. Dolorem accusamus magnam odio dignissimos omnis quod nobis enim. Adipisci dicta enim deserunt perspiciatis sit asperiores.', 2392.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1398, 'Durable Wooden Hat', '2947721531247', 'durable-wooden-hat', 'Ducimus ratione alias autem deleniti quas. Labore ut dolorum occaecati natus delectus harum. Cupiditate blanditiis voluptatem sit fuga.', 4511.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1399, 'Rustic Granite Bag', '9695260178319', 'rustic-granite-bag', 'Harum officiis est ut animi incidunt. Nihil aut eos qui nobis. Optio ut illo ut rerum illum optio.', 2259.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1400, 'Synergistic Wooden Gloves', '7896578084817', 'synergistic-wooden-gloves', 'Quis culpa ut quasi vel ipsa quibusdam inventore. Tempora itaque nihil tempora delectus consequatur sed. Eos quasi labore fugit.', 4682.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1401, 'Mediocre Plastic Car', '1995375308563', 'mediocre-plastic-car', 'Aspernatur rerum aut porro qui voluptatum eligendi nulla laboriosam. Consequuntur non molestias labore veritatis qui aut.', 2363.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1402, 'Heavy Duty Plastic Shirt', '1276532784124', 'heavy-duty-plastic-shirt', 'Accusamus inventore totam doloremque. Blanditiis possimus consequatur consectetur ea esse fugit quia sit.', 1050.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1403, 'Gorgeous Linen Bag', '3235977072553', 'gorgeous-linen-bag', 'Necessitatibus id ex earum autem id accusamus. Voluptas rerum veniam et saepe.', 3629.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1404, 'Lightweight Marble Plate', '1470811900773', 'lightweight-marble-plate', 'Iste laboriosam voluptas assumenda fuga non. Cumque consequatur a doloribus aperiam in error.', 841.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1405, 'Intelligent Marble Gloves', '2944216937607', 'intelligent-marble-gloves', 'Nihil reiciendis ut ullam fuga aspernatur optio ipsa. Corrupti ut architecto dolores necessitatibus.', 934.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1406, 'Practical Silk Watch', '9690515919358', 'practical-silk-watch', 'Dolorem autem dolor est eos nihil accusamus. Laudantium iure itaque dicta commodi.', 4873.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1407, 'Durable Silk Pants', '4568628453548', 'durable-silk-pants', 'Fugit dolore sit rerum error nemo ut tempore. Qui omnis inventore id inventore.', 2681.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1408, 'Small Wool Pants', '2558089763173', 'small-wool-pants', 'Sunt eius similique quo sint. Tempora perspiciatis accusantium repellat at quas est.', 2140.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1409, 'Incredible Wooden Coat', '3150171995401', 'incredible-wooden-coat', 'Voluptatem aut esse maiores explicabo nihil consectetur et. Nihil nulla dignissimos aliquam modi voluptas nihil eligendi iusto.', 3007.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1410, 'Incredible Bronze Car', '3423465786376', 'incredible-bronze-car', 'Enim sunt dolorem autem in culpa quidem nostrum. Enim et non vel velit sed ullam. Enim dolorem maiores quas est est.', 1599.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1411, 'Intelligent Copper Shirt', '3086448087626', 'intelligent-copper-shirt', 'Natus quidem iste saepe qui iusto. Voluptatem corrupti ut est voluptatem. Voluptas dolorum et tempore qui iste.', 1612.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1412, 'Gorgeous Copper Shoes', '6616897594238', 'gorgeous-copper-shoes', 'Sint temporibus accusamus aut et rem et. Deleniti quis mollitia recusandae dolorum. Est optio et qui.', 4552.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1413, 'Mediocre Marble Car', '3468210617963', 'mediocre-marble-car', 'Id quisquam voluptatum sit aliquam laboriosam. Voluptatem molestiae rem odio nemo et quaerat aut. Voluptas sunt vel consequatur praesentium exercitationem.', 3669.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1414, 'Intelligent Paper Shirt', '1522863961452', 'intelligent-paper-shirt', 'Tempore id autem sunt natus. Ut velit illum sed velit nesciunt. Reiciendis nostrum saepe quo perspiciatis sunt omnis quo.', 3365.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1415, 'Synergistic Bronze Knife', '0224284549516', 'synergistic-bronze-knife', 'Praesentium velit occaecati deleniti voluptatum. Quia sit cum iure sit alias voluptate. Minus aperiam qui sint consequatur at vero eius.', 3958.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1416, 'Durable Bronze Hat', '6422152149378', 'durable-bronze-hat', 'Iure quam numquam corrupti aspernatur sunt vel consequatur. Voluptatem est dolorem voluptatem blanditiis nihil occaecati. Ex omnis aliquid possimus nemo aut ut.', 3112.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1417, 'Rustic Granite Knife', '7755978403683', 'rustic-granite-knife', 'Eveniet nesciunt non dolorem excepturi porro. Molestiae corrupti exercitationem consectetur.', 3048.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1418, 'Rustic Leather Bag', '5544874335899', 'rustic-leather-bag', 'Eum et molestiae id. Et atque non sapiente odio.', 917.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1419, 'Awesome Concrete Car', '8447671530917', 'awesome-concrete-car', 'Quasi iste et similique assumenda omnis culpa. Delectus quam facere nihil autem doloremque doloremque.', 3164.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1420, 'Intelligent Bronze Shoes', '6526486561889', 'intelligent-bronze-shoes', 'Dolor sunt omnis eos aut tempore blanditiis rem et. Nobis est maxime nisi soluta dolor assumenda placeat. Aut hic id omnis maiores enim.', 1668.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1421, 'Intelligent Plastic Gloves', '3169313810700', 'intelligent-plastic-gloves', 'Debitis molestiae in autem unde adipisci. Ut ab quia molestias vero eius doloremque. Consequuntur praesentium est perferendis fugiat nesciunt corporis laborum eos.', 1144.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1422, 'Heavy Duty Wooden Coat', '5480119615039', 'heavy-duty-wooden-coat', 'Et eveniet incidunt non pariatur accusamus aut. Quos laudantium voluptas natus corporis.', 1326.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1423, 'Sleek Bronze Pants', '1510005995571', 'sleek-bronze-pants', 'Velit fugit voluptatum provident atque facere est. Voluptatem nam ullam quibusdam distinctio consequatur esse qui. Corrupti corporis veritatis laborum libero consequatur.', 2536.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1424, 'Enormous Leather Bottle', '8474764474001', 'enormous-leather-bottle', 'Non explicabo saepe et error voluptatem aut. Omnis aut doloremque excepturi officia ut eligendi.', 4039.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1425, 'Ergonomic Granite Watch', '9732033511901', 'ergonomic-granite-watch', 'Consequuntur aliquid iste enim voluptate natus et sed illo. Odit rerum aperiam suscipit similique ipsum et consequatur. Et voluptas mollitia vitae ut atque.', 2433.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1426, 'Small Paper Bag', '2412348127772', 'small-paper-bag', 'Ex sed quis velit molestias quis consequatur. Delectus praesentium tempora nihil et temporibus nisi.', 2754.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1427, 'Fantastic Plastic Computer', '1144192292801', 'fantastic-plastic-computer', 'Et cumque dolorem tempore ea facere. Et ut modi iure est repellat quibusdam. Commodi eveniet et praesentium qui reiciendis.', 4196.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1428, 'Incredible Cotton Pants', '0357481281078', 'incredible-cotton-pants', 'Quisquam accusantium quis nobis porro. Dolores non nulla sunt quis asperiores.', 600.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1429, 'Rustic Wool Car', '7008211768828', 'rustic-wool-car', 'Qui delectus similique id quia voluptatem eaque dolor. Dolores aperiam odit ab reiciendis reprehenderit hic.', 130.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1430, 'Small Iron Knife', '9063031245209', 'small-iron-knife', 'Autem rerum aut natus et. Et temporibus consectetur ut provident asperiores. Sed beatae blanditiis consequatur id et.', 1274.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1431, 'Awesome Copper Knife', '7341252604015', 'awesome-copper-knife', 'Libero facilis nam laudantium aut ad. Molestiae dicta nulla eaque molestias quo maxime. Et dolorem non aliquid numquam enim.', 4190.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1432, 'Small Granite Watch', '4544684367395', 'small-granite-watch', 'Architecto consectetur placeat doloribus mollitia. Sit quia sequi ab placeat qui aut. Fugit et nobis et quia.', 127.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1433, 'Mediocre Rubber Hat', '8510984374797', 'mediocre-rubber-hat', 'Eum et ullam facere ab ea et voluptatem. Qui neque eaque est dolor dignissimos.', 2256.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1434, 'Enormous Aluminum Gloves', '2628581512996', 'enormous-aluminum-gloves', 'Non quia quis et earum culpa alias corporis. Expedita sit quis saepe enim numquam animi ut. Molestiae at repellat omnis dicta illo quis.', 888.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1435, 'Mediocre Wooden Bottle', '4664002131764', 'mediocre-wooden-bottle', 'Est officiis recusandae ut voluptate. Aperiam ut ipsa nostrum qui vero.', 208.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1436, 'Sleek Leather Watch', '5212947566937', 'sleek-leather-watch', 'Deleniti omnis voluptatem nemo quidem fugit qui tempora. Ipsum laudantium quidem non rerum deleniti aut.', 2961.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1437, 'Durable Marble Plate', '0014866116584', 'durable-marble-plate', 'Rerum culpa sed eum et. Quod qui neque est vitae et non. Officia qui autem non natus molestiae quibusdam laboriosam.', 3657.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1438, 'Gorgeous Paper Computer', '9478308628010', 'gorgeous-paper-computer', 'Non autem iste laborum nihil mollitia impedit eos. Atque eum non rem tempore rerum id. Libero debitis aut ullam quas quibusdam adipisci accusantium est.', 4561.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1439, 'Synergistic Wool Chair', '8264054920307', 'synergistic-wool-chair', 'Recusandae esse et soluta et excepturi omnis. Qui quisquam natus cumque.', 4715.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1440, 'Small Wooden Wallet', '5435038807881', 'small-wooden-wallet', 'Beatae tempora nihil ex ut blanditiis provident facilis. Optio cumque et et enim.', 3280.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1441, 'Heavy Duty Steel Bench', '4012768513650', 'heavy-duty-steel-bench', 'Dolores quasi excepturi voluptatibus et magnam. Dolore neque quo placeat porro. Dolor ut quidem quia eligendi harum.', 2105.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1442, 'Gorgeous Wool Bench', '2291667797909', 'gorgeous-wool-bench', 'Ut ut eos excepturi necessitatibus laborum iure. Eveniet dolorem non tempore vero tempora.', 4938.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1443, 'Small Linen Watch', '4079430934151', 'small-linen-watch', 'Impedit accusamus quae enim. Eum quia placeat in quis et.', 808.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1444, 'Practical Paper Watch', '3182813386728', 'practical-paper-watch', 'Earum voluptatem aut cum dolor et odit. Velit ut necessitatibus dicta quasi id.', 4006.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1445, 'Mediocre Marble Computer', '1452538356194', 'mediocre-marble-computer', 'Sed ea itaque in aperiam numquam. Aut harum quos optio dolor sed.', 601.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1446, 'Rustic Wooden Computer', '5320679909134', 'rustic-wooden-computer', 'Neque voluptatem ea ipsam error tempora repudiandae rerum. Provident vel recusandae impedit dolorem illo nemo.', 4768.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1447, 'Synergistic Cotton Wallet', '1737482755768', 'synergistic-cotton-wallet', 'Sunt tempora ullam officiis corrupti. Quia non fugit qui beatae rerum ratione.', 3600.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1448, 'Incredible Bronze Bottle', '5382183051259', 'incredible-bronze-bottle', 'Est rem doloremque est voluptatum. Et voluptatem tempore perspiciatis aliquid et. Necessitatibus et ea et vitae consequatur occaecati.', 4326.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1449, 'Mediocre Concrete Car', '5014668844864', 'mediocre-concrete-car', 'Animi qui quae voluptatem aperiam. Eligendi voluptatibus et omnis qui.', 3863.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1450, 'Awesome Concrete Coat', '5884634171566', 'awesome-concrete-coat', 'Amet quisquam voluptate iusto dolores libero. Voluptas iusto accusamus consequatur consequatur facere voluptatum aliquid iste. Qui vel aspernatur exercitationem dolorum facere nam et.', 4938.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1451, 'Intelligent Concrete Shoes', '9450957278310', 'intelligent-concrete-shoes', 'Voluptates perspiciatis magnam porro ut iure vel. Dolorum sit quo eligendi tenetur quod nisi. Error corrupti velit minima.', 3790.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1452, 'Gorgeous Bronze Clock', '9823915186970', 'gorgeous-bronze-clock', 'Nihil et fuga deserunt et consectetur harum. Reiciendis ad minima rerum omnis minima sed amet quis. Corporis aut dicta vitae tenetur quia quia commodi.', 2034.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1453, 'Practical Leather Computer', '1462460195105', 'practical-leather-computer', 'Quia ex non libero. Error nisi nam et est et sunt. Suscipit quos repellendus est et.', 4816.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1454, 'Incredible Plastic Chair', '1085455865380', 'incredible-plastic-chair', 'Et rerum occaecati unde deleniti porro qui. Voluptatum dolor itaque enim in corrupti voluptatibus.', 2381.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1455, 'Ergonomic Wooden Plate', '9124042157537', 'ergonomic-wooden-plate', 'Iure dolore nostrum molestias qui voluptatem officia optio et. Ut excepturi ut doloremque molestias ducimus.', 4997, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1456, 'Fantastic Aluminum Clock', '6469616046637', 'fantastic-aluminum-clock', 'Magnam aut repellat eveniet blanditiis. Sunt culpa veritatis similique praesentium. Veniam cupiditate assumenda nulla est mollitia consectetur praesentium.', 3622.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1457, 'Gorgeous Bronze Hat', '3134297210310', 'gorgeous-bronze-hat', 'Ut tenetur reprehenderit exercitationem fugit qui rerum voluptatem. Modi rerum voluptatem odit aliquid.', 2994.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1458, 'Intelligent Cotton Coat', '5665201468742', 'intelligent-cotton-coat', 'Iste rem dolores praesentium perspiciatis et. Quisquam vero similique sunt fuga nihil molestiae est.', 1708, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1459, 'Rustic Iron Bag', '4927936415905', 'rustic-iron-bag', 'Ut dignissimos adipisci commodi eum unde nisi possimus. Dolorem voluptate corporis molestiae laudantium voluptatem ipsa occaecati quibusdam. Dicta ad corrupti quos rerum impedit.', 2234.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1460, 'Incredible Granite Lamp', '1591008186388', 'incredible-granite-lamp', 'Dolor autem et similique quos illum. Eos iure ipsam nihil voluptatibus deleniti.', 324.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1461, 'Durable Granite Wallet', '7563211702727', 'durable-granite-wallet', 'Odio similique sint eum repudiandae quam iusto ratione. Architecto enim autem et quam molestias beatae. Nostrum commodi ea ipsam nam quae.', 4320.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1462, 'Intelligent Silk Computer', '6428856565612', 'intelligent-silk-computer', 'Voluptate inventore dolores tempora consequatur quod ut. Quisquam rerum exercitationem et exercitationem recusandae et voluptas. Veniam quia incidunt repudiandae non eos distinctio nostrum.', 295.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1463, 'Heavy Duty Leather Chair', '0825157789994', 'heavy-duty-leather-chair', 'Necessitatibus velit molestiae et magni placeat aliquam inventore quam. Quia est ducimus molestiae quas et consequuntur repudiandae pariatur. Consequatur necessitatibus debitis natus ipsa molestias eius.', 4248.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1464, 'Sleek Iron Watch', '5808751203672', 'sleek-iron-watch', 'Dignissimos quia aliquid sequi nobis eos ab excepturi. Aliquid nihil omnis velit eius non et consectetur perspiciatis.', 156.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1465, 'Lightweight Aluminum Coat', '7582210434521', 'lightweight-aluminum-coat', 'Sed cupiditate voluptates fugiat aut. Magnam unde provident et fugit sed est quasi. Quisquam illum est quisquam alias neque non hic.', 3049.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1466, 'Ergonomic Aluminum Lamp', '2783197354948', 'ergonomic-aluminum-lamp', 'Harum officiis quaerat maxime provident iste corporis voluptas. Sed rerum laboriosam quis quis sunt.', 2143.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1467, 'Ergonomic Paper Computer', '9064792954348', 'ergonomic-paper-computer', 'Dolorem suscipit praesentium voluptas voluptas quia. Adipisci provident ut rem quaerat cum dolores ea. Voluptatem ipsum culpa laborum doloremque facere nemo rerum.', 1553.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1468, 'Mediocre Aluminum Plate', '4625178910225', 'mediocre-aluminum-plate', 'Voluptatem dolorum porro delectus saepe. Qui molestiae assumenda voluptatem rerum quibusdam quo corporis.', 2582.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1469, 'Heavy Duty Bronze Knife', '0568392799198', 'heavy-duty-bronze-knife', 'Provident excepturi cupiditate omnis atque sit quidem ut. Numquam voluptatem vel mollitia repellendus accusamus facere molestiae.', 1101.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1470, 'Aerodynamic Bronze Keyboard', '7487169101602', 'aerodynamic-bronze-keyboard', 'Quisquam magnam quia provident fuga non et. Harum enim sit voluptas ratione.', 4642.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1471, 'Aerodynamic Iron Clock', '9743154741832', 'aerodynamic-iron-clock', 'Quia et tenetur laboriosam et. Aliquid aut repellat enim totam dolorum excepturi voluptatem et. Et explicabo totam itaque aut ut.', 3733.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1472, 'Mediocre Linen Bag', '8798169432955', 'mediocre-linen-bag', 'Est modi praesentium aliquam optio ex occaecati. Libero dolore sed laudantium non quod.', 1393.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1473, 'Small Silk Knife', '0223503228652', 'small-silk-knife', 'Consequatur aut in qui. Optio expedita reprehenderit consequatur qui eius.', 3091.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1474, 'Incredible Plastic Bag', '1453960079460', 'incredible-plastic-bag', 'Ea reiciendis dolore et autem ratione sit qui. Dicta explicabo perspiciatis aperiam itaque maiores.', 4601.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1475, 'Sleek Wool Watch', '6922253065633', 'sleek-wool-watch', 'Voluptatibus provident quia unde mollitia. Quia cupiditate possimus optio sapiente modi.', 4909.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1476, 'Incredible Steel Hat', '8389709717504', 'incredible-steel-hat', 'Praesentium est ducimus debitis minus sit est. Magni sunt quo veritatis in. Eligendi doloremque qui sint ut.', 572.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1477, 'Awesome Rubber Shirt', '8974616742932', 'awesome-rubber-shirt', 'Natus ipsam rem fuga necessitatibus. Dolore aut exercitationem dolore et.', 3551.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1478, 'Enormous Wool Table', '6050543291346', 'enormous-wool-table', 'Neque deleniti inventore totam consequuntur. Eaque adipisci et commodi molestiae. Laboriosam praesentium ad illum vero.', 3404.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1479, 'Heavy Duty Leather Table', '4982137073781', 'heavy-duty-leather-table', 'Ut aliquam quis dolorum in repellat minima fuga a. Blanditiis nam facere qui est occaecati qui.', 4975.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1480, 'Aerodynamic Concrete Watch', '2947934061272', 'aerodynamic-concrete-watch', 'Aut eaque aut placeat illo amet. Porro ipsa aperiam minima ea et adipisci. Dolor quia quibusdam ea neque recusandae porro.', 1227.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1481, 'Enormous Plastic Shoes', '8050827539933', 'enormous-plastic-shoes', 'Eveniet aut dolor dolorem dignissimos. Impedit quos voluptas laudantium deserunt eos. Quaerat sunt nulla nemo velit.', 4660.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1482, 'Practical Granite Shirt', '2636688893085', 'practical-granite-shirt', 'Nemo hic omnis et tempore. Sed nisi tenetur sit voluptates quidem autem.', 4338.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1483, 'Synergistic Wooden Shoes', '7488130604221', 'synergistic-wooden-shoes', 'Eaque dignissimos consectetur nemo maxime placeat tempora incidunt saepe. Et non quo saepe in molestiae.', 4286.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1484, 'Mediocre Iron Coat', '1874624455282', 'mediocre-iron-coat', 'Et corrupti autem molestiae possimus eius provident qui. Quis necessitatibus quos amet nam veniam maiores enim. Architecto ipsum deserunt ab est est et.', 3325.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1485, 'Synergistic Aluminum Table', '6596954580445', 'synergistic-aluminum-table', 'Ipsa distinctio asperiores molestiae eos quis rerum nihil. Hic qui sed possimus rerum ea maiores. Autem aut rerum vitae veniam.', 3752.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1486, 'Sleek Marble Knife', '6219527397799', 'sleek-marble-knife', 'Voluptate pariatur deserunt sed. Quia reprehenderit dolorem vel aut temporibus modi.', 3960.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1487, 'Lightweight Granite Shoes', '6985505602253', 'lightweight-granite-shoes', 'Placeat minima dolorem ut est. Nemo fugiat asperiores rerum laudantium assumenda voluptatem vel sapiente. Autem velit placeat eos sint qui porro a.', 392.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1488, 'Gorgeous Wooden Bench', '0999487083616', 'gorgeous-wooden-bench', 'Dicta aut laborum eligendi exercitationem. Aliquid occaecati sit voluptatibus nam et. Voluptatem soluta quod necessitatibus pariatur laboriosam veniam animi.', 4415.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1489, 'Intelligent Copper Coat', '5284512362343', 'intelligent-copper-coat', 'Eum amet quibusdam consequuntur voluptas sunt ex. Autem sed tempore commodi accusantium. Optio qui quos totam.', 4965.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1490, 'Synergistic Paper Lamp', '3437458920500', 'synergistic-paper-lamp', 'Aperiam debitis deleniti et qui tempora et minus ullam. Sint eaque sequi praesentium magni velit quia commodi. Aliquid perspiciatis qui occaecati consequatur ut optio.', 4492.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1491, 'Fantastic Copper Wallet', '1662945322136', 'fantastic-copper-wallet', 'Aut aut dolor accusamus vel tempore. Et quos similique voluptas expedita sit dignissimos quisquam.', 4619.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1492, 'Small Aluminum Bench', '7704923460981', 'small-aluminum-bench', 'Totam ratione aperiam deserunt dignissimos. Repellendus facere veniam totam sit.', 711.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1493, 'Heavy Duty Cotton Bottle', '1052968132452', 'heavy-duty-cotton-bottle', 'Id non similique dolorem porro. Et aut expedita dolor in dolores voluptatem explicabo. Blanditiis aut temporibus assumenda veniam voluptatem quo nostrum.', 901.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1494, 'Awesome Silk Watch', '0975453758528', 'awesome-silk-watch', 'Rerum et rerum sit qui consectetur consequuntur et accusantium. Veritatis dicta dolores fuga est. Accusantium ducimus nesciunt inventore ut esse rerum.', 4511.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1495, 'Practical Plastic Watch', '8515043515449', 'practical-plastic-watch', 'Dolores dolor et distinctio neque quos perspiciatis quos. Eveniet distinctio sed fugiat neque sunt dolor. Ullam doloribus fugit quod voluptatem ullam.', 582.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1496, 'Heavy Duty Granite Wallet', '4468075300917', 'heavy-duty-granite-wallet', 'Sed maxime nihil sint natus delectus quaerat veniam. Accusantium nulla sapiente et nostrum similique quis.', 1816.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1497, 'Aerodynamic Leather Chair', '8919970411056', 'aerodynamic-leather-chair', 'Voluptate reprehenderit numquam debitis. Quo sunt a tempora a. Odit vitae et rem id ut ex.', 3789.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1498, 'Synergistic Cotton Pants', '0109243708510', 'synergistic-cotton-pants', 'Velit a quis ut sed et error. Quidem pariatur blanditiis officia suscipit nulla vel. Ut enim tenetur soluta aliquid incidunt consectetur nihil.', 4619.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1499, 'Lightweight Granite Bottle', '9368738032184', 'lightweight-granite-bottle', 'Delectus suscipit est dolorum molestiae nesciunt. Distinctio reiciendis occaecati culpa explicabo assumenda. Quasi natus et harum cupiditate omnis commodi et.', 4305.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1500, 'Lightweight Cotton Hat', '6076129758782', 'lightweight-cotton-hat', 'Similique veniam pariatur mollitia a. Delectus quidem earum eaque ea.', 1665.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1501, 'Incredible Aluminum Computer', '8393055233588', 'incredible-aluminum-computer', 'Minus voluptatem iure magni optio ullam occaecati voluptates sint. Voluptas esse rem occaecati quasi sed. Dolorem voluptas unde eligendi eius.', 2018.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1502, 'Aerodynamic Granite Hat', '2124991002558', 'aerodynamic-granite-hat', 'Et repudiandae tempora accusamus repellendus voluptas pariatur est tempora. Qui qui est sunt perferendis nemo.', 4386.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1503, 'Awesome Aluminum Lamp', '2468387353283', 'awesome-aluminum-lamp', 'Minima doloremque minima odio et error similique ex. Tenetur praesentium in nobis veritatis officia dolore.', 934.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1504, 'Practical Steel Shirt', '1692414491278', 'practical-steel-shirt', 'Quaerat dolore eum aut quos voluptatem corporis. Fugit quae ratione dolorum cum labore suscipit eius. Non suscipit voluptate perferendis voluptates est officia.', 4687.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1505, 'Fantastic Iron Bench', '7755050538616', 'fantastic-iron-bench', 'Non delectus sunt qui repellendus. Beatae voluptatibus repellendus ad eius quo molestiae eaque fugiat. Ut molestiae maiores reiciendis explicabo aliquid esse.', 732.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1506, 'Rustic Paper Shoes', '5661297536945', 'rustic-paper-shoes', 'Magnam aut eaque hic et cum. Corporis doloribus enim porro sint blanditiis non debitis.', 266.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1507, 'Sleek Leather Hat', '8729289507476', 'sleek-leather-hat', 'Consequatur esse voluptatem velit et reprehenderit. Molestiae temporibus corporis labore quo sit delectus deleniti. Dolorem laudantium accusantium harum sapiente maiores et.', 2093.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1508, 'Sleek Linen Table', '7633336999453', 'sleek-linen-table', 'Ea culpa qui ab ipsam. Nisi maxime cum sed autem earum. Et recusandae quis omnis nulla quibusdam.', 4153.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1509, 'Sleek Granite Gloves', '3892841310939', 'sleek-granite-gloves', 'Accusamus rerum autem velit nostrum eum voluptas. Repellendus eos magnam enim doloremque. Hic molestiae doloremque est aut aut molestias et.', 3877.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1510, 'Sleek Linen Computer', '3202323148460', 'sleek-linen-computer', 'Quasi nostrum beatae molestiae enim quia nemo. Aut molestiae consequatur porro qui qui reiciendis et.', 2111.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1511, 'Lightweight Wool Car', '5302439979687', 'lightweight-wool-car', 'Nihil corporis ipsum quia aut. Mollitia sint exercitationem ipsam inventore qui et. Facere ullam accusamus et cupiditate ipsa sit.', 3023.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1512, 'Incredible Aluminum Bench', '4131303646193', 'incredible-aluminum-bench', 'Minus saepe omnis itaque est impedit optio eaque. Aut eveniet est sint cupiditate ratione minima voluptatem.', 215.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1513, 'Mediocre Aluminum Clock', '2826431793445', 'mediocre-aluminum-clock', 'Qui nam repellendus aspernatur temporibus nostrum. Aut consequatur pariatur dicta. Repellat voluptates voluptates unde nihil sit praesentium.', 4483.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1514, 'Practical Plastic Knife', '8208707115337', 'practical-plastic-knife', 'Quisquam accusantium autem magni nostrum nobis quasi id. Repudiandae molestiae velit sit ab unde necessitatibus eos.', 2151.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1515, 'Awesome Cotton Hat', '0912089059599', 'awesome-cotton-hat', 'Dolore laborum temporibus id minima esse et. Commodi modi sit sint modi ipsa.', 3305.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1516, 'Practical Paper Wallet', '3307806914638', 'practical-paper-wallet', 'Eum nihil delectus illo ea et consequuntur. Vero eveniet natus officia qui est pariatur. Nihil qui veritatis debitis quia rerum necessitatibus repellendus.', 4483.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1517, 'Awesome Steel Hat', '3779065567182', 'awesome-steel-hat', 'Sed quidem facilis laborum ut ut ea voluptate. Possimus eligendi reiciendis labore qui in.', 2424.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1518, 'Heavy Duty Steel Pants', '0171572893526', 'heavy-duty-steel-pants', 'Voluptatem accusamus mollitia rerum inventore odit. Maiores qui quasi odio doloribus consectetur quia ullam natus. Dignissimos aut itaque illo quam.', 4853.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1519, 'Rustic Concrete Computer', '3249379865125', 'rustic-concrete-computer', 'Maiores quaerat velit dolorem dicta illum assumenda. Vitae voluptatibus enim voluptas quo aut beatae. Enim consequatur quo aliquam ea.', 1129.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1520, 'Gorgeous Paper Chair', '5022150423183', 'gorgeous-paper-chair', 'Autem dolorem repellat fugit commodi. Nobis et similique nemo fugit qui eos animi.', 1396.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1521, 'Aerodynamic Iron Gloves', '2606857888402', 'aerodynamic-iron-gloves', 'Eius quisquam enim reiciendis ab et. Nam animi ipsum soluta incidunt. Placeat officia ducimus esse velit accusantium odio sit.', 575.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1522, 'Enormous Bronze Hat', '0332454876666', 'enormous-bronze-hat', 'Sunt sed minima laboriosam ea nobis eos. Eligendi esse omnis sed nostrum vero. Mollitia libero porro similique quis accusantium dignissimos.', 26.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1523, 'Durable Wooden Bench', '3608638614551', 'durable-wooden-bench', 'Placeat doloremque voluptatem cumque aut beatae. Necessitatibus officia est nam doloremque eum. Quo minima eveniet nulla eius id voluptas.', 3107.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1524, 'Small Aluminum Watch', '6504485349417', 'small-aluminum-watch', 'Dicta dicta enim aut atque. Eveniet consectetur quaerat optio nemo qui non ut. Reprehenderit perferendis et labore voluptatem quaerat iusto.', 1043.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1525, 'Incredible Linen Chair', '4875276757745', 'incredible-linen-chair', 'Explicabo eos sit inventore officia voluptatem et molestiae. Adipisci necessitatibus blanditiis consequatur aut et delectus inventore. Hic veniam voluptas quia quia quis.', 3223.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1526, 'Practical Iron Bottle', '5381161054633', 'practical-iron-bottle', 'Debitis molestiae et eveniet quae maiores enim dicta. Fugiat veniam porro rem impedit.', 2058.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1527, 'Ergonomic Cotton Bench', '6833306207415', 'ergonomic-cotton-bench', 'Non nobis fugit deleniti deserunt fuga. Repudiandae asperiores dolores itaque non. Illo omnis aut recusandae placeat eveniet.', 2598.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1528, 'Heavy Duty Iron Knife', '6080729207632', 'heavy-duty-iron-knife', 'Exercitationem fugit in voluptas ut quis. Eum consequatur magnam ut in. Qui blanditiis consequuntur magnam exercitationem voluptas.', 4919.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1529, 'Sleek Granite Hat', '4638420339231', 'sleek-granite-hat', 'Rerum et est corrupti voluptas dolore in fugit. Eos omnis ad ullam impedit eveniet dolor. Deserunt ea nisi facere et.', 4945.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1530, 'Gorgeous Linen Plate', '1574437060368', 'gorgeous-linen-plate', 'Et quia earum sint suscipit. Saepe quod expedita et perspiciatis magnam fugit.', 3645.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1531, 'Gorgeous Cotton Table', '3964022138516', 'gorgeous-cotton-table', 'Fugiat dolore vitae a odit. Praesentium facilis voluptates repellat qui.', 3294.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1532, 'Lightweight Linen Computer', '4469774969702', 'lightweight-linen-computer', 'Velit perferendis ut numquam quam dolore accusantium. Voluptas delectus est dolor unde.', 3558.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1533, 'Durable Plastic Gloves', '6845025330008', 'durable-plastic-gloves', 'Quibusdam aperiam vitae atque neque sapiente corporis. Dicta voluptatem labore dolor aut.', 1200.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1534, 'Durable Granite Plate', '4489419237539', 'durable-granite-plate', 'Nobis consequatur ea quia possimus et vitae. Dolores sit voluptatem vero fugiat ab laudantium necessitatibus. Veniam voluptas qui consequatur ut dolores molestias adipisci.', 3732.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1535, 'Durable Concrete Chair', '7957918009423', 'durable-concrete-chair', 'Minus eum dolores nam nihil. Illum quas quisquam delectus eos distinctio voluptatibus fuga. Assumenda quae laudantium dignissimos cumque recusandae id rerum.', 3790.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1536, 'Incredible Concrete Chair', '6312032555095', 'incredible-concrete-chair', 'Eveniet nisi repudiandae eos aut alias soluta est officia. Aut culpa quaerat sit nobis est quia qui.', 1388.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1537, 'Aerodynamic Aluminum Wallet', '4672836105400', 'aerodynamic-aluminum-wallet', 'Architecto nihil et expedita beatae consequuntur et hic. Quisquam facilis ea voluptates ipsum consequatur.', 3049.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1538, 'Awesome Aluminum Plate', '7839943072712', 'awesome-aluminum-plate', 'Vitae ullam aliquam fugit ad et quod nisi. Velit et accusamus natus rem fugit quidem. Perspiciatis quis dolor commodi adipisci.', 2136.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1539, 'Sleek Aluminum Car', '4046083427064', 'sleek-aluminum-car', 'Ut voluptate nihil quidem rem consequatur incidunt. Quia et aut cumque.', 1240.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1540, 'Intelligent Leather Wallet', '7388174341901', 'intelligent-leather-wallet', 'Ullam odit dolor aspernatur rem nisi adipisci. Quia illum aliquam et ipsa.', 755.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1541, 'Aerodynamic Iron Coat', '7972659948244', 'aerodynamic-iron-coat', 'Maxime optio ex officia dolorem facere. Corrupti reiciendis id sed eaque doloribus aliquam suscipit.', 1588.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1542, 'Fantastic Paper Wallet', '5267353142503', 'fantastic-paper-wallet', 'Pariatur quia sed non quis delectus minima. Quaerat impedit est veniam excepturi rerum exercitationem.', 2020.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1543, 'Awesome Copper Shoes', '5098209517769', 'awesome-copper-shoes', 'Pariatur dolores ut libero laudantium enim doloribus. Dignissimos ullam doloremque eaque.', 1083.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1544, 'Fantastic Aluminum Shirt', '8236836858900', 'fantastic-aluminum-shirt', 'Aliquid pariatur delectus cum assumenda. Adipisci enim repellendus consequatur dicta voluptatum enim.', 2460.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1545, 'Small Plastic Pants', '3396577637679', 'small-plastic-pants', 'Et dolor aut harum. Id tenetur cum ab quia sed sit.', 3824.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1546, 'Intelligent Iron Chair', '0018575260279', 'intelligent-iron-chair', 'Dignissimos ut rerum nihil natus hic sit enim. Consequatur iusto aut sit illo praesentium. Est ut earum mollitia dolor repudiandae expedita.', 4021.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1547, 'Mediocre Aluminum Knife', '8826648451743', 'mediocre-aluminum-knife', 'Rerum alias aut voluptatum aut. Itaque aliquam consectetur eaque provident sapiente. Exercitationem in incidunt adipisci et.', 4137.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1548, 'Practical Iron Computer', '8554081343218', 'practical-iron-computer', 'Aspernatur rerum et deleniti ut modi ea. Nemo ad delectus eos consequatur saepe itaque maxime. Dolores qui numquam doloribus iusto harum.', 1078.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1549, 'Durable Wooden Clock', '1435132298404', 'durable-wooden-clock', 'Qui sunt nihil sint provident eius accusamus non. Quasi adipisci ipsa odio voluptatem libero praesentium asperiores. Voluptatum explicabo quasi sunt facere sit illo qui dignissimos.', 871.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1550, 'Fantastic Linen Table', '9707963808957', 'fantastic-linen-table', 'Atque ullam culpa dolorem deserunt quod. Consequatur facere voluptatum quia quia neque.', 855.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1551, 'Awesome Wooden Bag', '5169544857206', 'awesome-wooden-bag', 'Qui fugiat eligendi sit culpa id distinctio. Dolore asperiores quaerat assumenda reiciendis.', 4953.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1552, 'Ergonomic Granite Table', '1983592430587', 'ergonomic-granite-table', 'Tempora magnam omnis iste itaque tempore. Consequatur dignissimos in distinctio eius saepe cupiditate.', 2965.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1553, 'Gorgeous Wooden Keyboard', '3909618805946', 'gorgeous-wooden-keyboard', 'Aut aut impedit voluptate minus. Et nesciunt aliquid doloribus quidem.', 2769.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1554, 'Gorgeous Steel Shirt', '5001779866601', 'gorgeous-steel-shirt', 'Et officiis est repellendus tempora magni. Neque optio velit dicta enim est eveniet dolorem rem. Iusto deleniti hic nesciunt aut quis aut et.', 614.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1555, 'Lightweight Silk Computer', '0753362273383', 'lightweight-silk-computer', 'Ipsum suscipit qui magni vitae quam blanditiis facere et. Nostrum sit sed nemo. Provident qui voluptatum labore.', 2998.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1556, 'Aerodynamic Aluminum Bag', '0166044507667', 'aerodynamic-aluminum-bag', 'Incidunt a officia suscipit aperiam nemo beatae. Voluptatibus repellendus nihil consequuntur ea voluptatem vel illum.', 3552.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1557, 'Awesome Wool Knife', '5600361101757', 'awesome-wool-knife', 'Error maiores vero sapiente in excepturi et. Officiis ipsum non sapiente ut.', 3476.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1558, 'Ergonomic Paper Keyboard', '1256814065950', 'ergonomic-paper-keyboard', 'Itaque est maxime perferendis reprehenderit quibusdam reprehenderit ut. Aliquam velit sed velit rerum doloribus dolores architecto.', 2494.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1559, 'Rustic Silk Gloves', '4259860658746', 'rustic-silk-gloves', 'Rem et id est. Repellat voluptatem debitis quam soluta fugiat sed.', 1471.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1560, 'Fantastic Silk Watch', '0253836563793', 'fantastic-silk-watch', 'Distinctio ut ea aperiam eligendi facilis unde non ipsum. Tempore et unde ut provident consectetur nemo. Eum quia velit omnis saepe sapiente animi animi.', 1788.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1561, 'Mediocre Concrete Chair', '1329295996874', 'mediocre-concrete-chair', 'Consequuntur mollitia doloremque ut illum occaecati. Qui vitae rerum debitis sed reprehenderit eos. Repellendus voluptatum excepturi natus.', 4885.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1562, 'Incredible Rubber Shoes', '8963623475230', 'incredible-rubber-shoes', 'Officia omnis veritatis quibusdam aperiam. Suscipit nisi omnis voluptatem debitis. Excepturi nobis officiis eos debitis enim porro laborum.', 3543.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1563, 'Sleek Copper Bottle', '7861491604190', 'sleek-copper-bottle', 'Corrupti nisi sunt a quaerat quo quas. Consequatur consequuntur officiis praesentium laudantium. Molestias assumenda iste laudantium dicta est.', 2602.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1564, 'Durable Concrete Lamp', '7740272891632', 'durable-concrete-lamp', 'Ducimus pariatur quaerat esse dolores. Tenetur libero aut dicta nisi. Fugit est ex eius est vel qui sunt doloremque.', 2771.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1565, 'Awesome Bronze Gloves', '2070861029616', 'awesome-bronze-gloves', 'Est expedita inventore atque accusamus. Libero aliquid tenetur cumque et neque eos. Alias eius consequatur sit nisi eius.', 400.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1566, 'Rustic Concrete Watch', '5620970516544', 'rustic-concrete-watch', 'Ipsam quis ratione et fugit. Eum quis ut qui cum mollitia quidem consequatur. Numquam beatae ad ut doloremque soluta excepturi qui.', 4786.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1567, 'Heavy Duty Paper Bag', '8940990773619', 'heavy-duty-paper-bag', 'Sed eaque quas sit dolore aut illum dolor. Est officia cupiditate est nostrum culpa.', 2582.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1568, 'Rustic Bronze Gloves', '5765076541912', 'rustic-bronze-gloves', 'Aut at eos laborum animi non incidunt. Quo voluptatem iusto consequatur quas quos similique. Impedit deleniti similique sint qui vero dignissimos suscipit non.', 4180.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1569, 'Incredible Aluminum Shirt', '4890196311815', 'incredible-aluminum-shirt', 'Quisquam recusandae voluptatem omnis error tempore hic. Enim nostrum provident vel maxime soluta et voluptatem.', 2291.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1570, 'Ergonomic Concrete Chair', '3412856561203', 'ergonomic-concrete-chair', 'Ullam ipsa error illum blanditiis. Ea eius quia ut animi.', 625.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1571, 'Gorgeous Bronze Chair', '4525420210809', 'gorgeous-bronze-chair', 'Dolore autem voluptatibus hic delectus. Et minus omnis et maxime magni enim. Laboriosam necessitatibus minima placeat qui totam.', 3987.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1572, 'Rustic Cotton Bench', '8242180255654', 'rustic-cotton-bench', 'Officia commodi officia unde. Ut nihil beatae aperiam nesciunt.', 1491.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1573, 'Mediocre Leather Bench', '1417071741043', 'mediocre-leather-bench', 'Repellat nostrum rem nam molestiae enim ut. Sed velit et voluptatem aut.', 4502.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1574, 'Lightweight Silk Keyboard', '0675381155634', 'lightweight-silk-keyboard', 'Est est consequatur ea et expedita molestiae. Id molestiae dolorum quae voluptates numquam suscipit.', 4670.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1575, 'Synergistic Paper Wallet', '4428784691355', 'synergistic-paper-wallet', 'Est porro vitae et ullam. Maiores ut et eum facere et.', 1329.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1576, 'Enormous Cotton Clock', '0065611708752', 'enormous-cotton-clock', 'Facilis nesciunt a quia sequi. Provident illum autem qui delectus sapiente nemo amet et.', 2913.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1577, 'Ergonomic Rubber Hat', '4828107912950', 'ergonomic-rubber-hat', 'Officia animi molestiae accusamus. Et accusantium repudiandae dolorem enim et. Et consequatur voluptatem rerum aperiam tenetur aut.', 686.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1578, 'Rustic Marble Shirt', '2799962418326', 'rustic-marble-shirt', 'Impedit rerum ipsum rerum quia nobis. Quos dignissimos quod ratione quia consequatur eligendi voluptas. Id quos nihil ut eum quod et voluptate dolor.', 4953.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1579, 'Sleek Rubber Plate', '7823112318329', 'sleek-rubber-plate', 'Illum quod maxime alias dolorem ab. Eos enim odio architecto quisquam libero. Rerum minus ab qui ullam ipsam saepe quam.', 3246.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1580, 'Enormous Leather Knife', '4327847103593', 'enormous-leather-knife', 'Rerum distinctio non est consequatur beatae ut. Est non voluptatem ea et cupiditate eius eligendi. Voluptas eaque assumenda dolorum sequi.', 3031.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1581, 'Intelligent Steel Watch', '5778866246492', 'intelligent-steel-watch', 'Numquam quia veniam nam qui. Officia dolores excepturi alias voluptatem et autem aut. Provident voluptatum corporis et facere officia.', 4661.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1582, 'Heavy Duty Leather Clock', '5052736544247', 'heavy-duty-leather-clock', 'Nihil ex quam soluta quis. Dolore quo facilis nam non et quo eveniet.', 4302.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1583, 'Enormous Wooden Knife', '3402498551199', 'enormous-wooden-knife', 'Ea perferendis ab at quis necessitatibus. Sequi adipisci nulla laboriosam.', 526.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1584, 'Durable Bronze Knife', '9252196061179', 'durable-bronze-knife', 'Corporis quo quae ad quis vel. Voluptatem autem odio ea blanditiis optio unde.', 1866.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1585, 'Synergistic Copper Shirt', '5010675178442', 'synergistic-copper-shirt', 'Ducimus illum eos non repellendus asperiores. Repellat neque qui velit ipsam in id voluptatem. Nostrum odio officiis cumque earum minus incidunt cupiditate.', 2478.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1586, 'Heavy Duty Silk Watch', '6473648913355', 'heavy-duty-silk-watch', 'Enim beatae reprehenderit enim impedit molestiae placeat. Ut velit praesentium et perferendis aut numquam.', 689.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1587, 'Heavy Duty Iron Bag', '2991910577523', 'heavy-duty-iron-bag', 'Eaque quibusdam laboriosam dignissimos distinctio fugit. Dolore natus rerum dolor sit.', 1525.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1588, 'Lightweight Rubber Chair', '6363031046824', 'lightweight-rubber-chair', 'Et repudiandae at rem et distinctio. Incidunt dolore repellendus facere qui iure.', 1033.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1589, 'Synergistic Paper Pants', '5652203243804', 'synergistic-paper-pants', 'Consequatur quod qui modi consequatur ea est quibusdam eum. Sint voluptates et cupiditate quidem nostrum. Aut eum praesentium alias dolorum non sit.', 1129.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1590, 'Durable Linen Clock', '9263182811395', 'durable-linen-clock', 'Nihil quia voluptas et sed tempora minus. Aut dolorem dolorum est est autem sit repellendus.', 3765.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1591, 'Heavy Duty Rubber Plate', '0697554655512', 'heavy-duty-rubber-plate', 'Commodi sint cumque porro sunt et. Eos in sed dolores omnis in in quae maiores.', 558.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1592, 'Practical Bronze Gloves', '6700909677559', 'practical-bronze-gloves', 'Est praesentium dolores delectus sit. Eaque omnis dignissimos in deleniti explicabo.', 528.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1593, 'Fantastic Paper Pants', '6110653401612', 'fantastic-paper-pants', 'Exercitationem magni qui optio mollitia sed numquam. Aut officiis expedita dicta fugiat.', 3232.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1594, 'Durable Paper Table', '1497639409608', 'durable-paper-table', 'Rerum nam tempore eos magni. Voluptas occaecati voluptates quibusdam qui facere perspiciatis sequi odit. Veritatis quae facilis quae aliquam vero voluptatibus nesciunt.', 3938.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1595, 'Practical Iron Car', '3901560638405', 'practical-iron-car', 'Voluptatem quos vitae ipsum dolor ut dolorum ut. Est labore minima maxime et.', 2843.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1596, 'Rustic Concrete Bench', '1575781349277', 'rustic-concrete-bench', 'Ab impedit adipisci rem culpa cupiditate expedita optio. Magnam et quo qui alias eligendi consectetur. Et omnis doloremque odio qui.', 1071.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1597, 'Mediocre Linen Car', '7939547005250', 'mediocre-linen-car', 'Expedita doloribus laudantium nesciunt incidunt consectetur dicta eos. Itaque itaque quisquam praesentium dolores.', 1094.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1598, 'Synergistic Granite Knife', '3118991147677', 'synergistic-granite-knife', 'Non aliquid corporis est vel itaque. Molestiae neque velit sed tenetur perspiciatis.', 2825.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1599, 'Intelligent Marble Watch', '7113011812937', 'intelligent-marble-watch', 'Porro similique consequatur sunt. Voluptatem ducimus provident repudiandae fuga earum ad eum. Saepe ullam ratione dolorem ut nisi.', 4526.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1600, 'Mediocre Silk Bag', '7770959880093', 'mediocre-silk-bag', 'Corrupti eaque aut voluptatem provident facere non quod vel. Sapiente voluptate et deserunt necessitatibus et facere id. Rerum facilis quia qui est quam voluptate perspiciatis.', 3987.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1601, 'Incredible Granite Shoes', '0410813619137', 'incredible-granite-shoes', 'Doloremque rerum in accusamus soluta voluptatum sed. Enim magni in vitae hic.', 1404.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1602, 'Lightweight Granite Table', '1646150710070', 'lightweight-granite-table', 'Est molestiae quia iste recusandae ea unde atque. Ea iure non nihil omnis laboriosam quo consectetur delectus.', 1718.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1603, 'Small Marble Pants', '7703631506189', 'small-marble-pants', 'Ipsa est dignissimos dolore est. Ratione in molestiae eligendi quos fuga aut.', 3202.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1604, 'Small Bronze Pants', '8633418237595', 'small-bronze-pants', 'Voluptatem consequuntur hic officiis aliquid et quia incidunt. Ut voluptatem repellat et id officia fuga.', 3564.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1605, 'Ergonomic Bronze Bench', '3484967474833', 'ergonomic-bronze-bench', 'Illo aut quasi officia impedit numquam quae. Eos animi dolor illum sint voluptatibus recusandae.', 560.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1606, 'Sleek Bronze Car', '1970477635731', 'sleek-bronze-car', 'A blanditiis eaque sit magni qui ut. Praesentium quibusdam et autem animi optio.', 18.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1607, 'Durable Paper Bag', '3592442166156', 'durable-paper-bag', 'Architecto dolorem sit nulla voluptas. Qui voluptatibus sit accusamus in. Aliquid aperiam enim alias ipsum qui at nesciunt vel.', 1551.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1608, 'Synergistic Concrete Table', '2656563531840', 'synergistic-concrete-table', 'Ut omnis tempora et quia omnis sapiente et. Sit earum voluptas qui.', 2470.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1609, 'Rustic Plastic Bag', '1891880050464', 'rustic-plastic-bag', 'Ex cupiditate nihil sed ut et esse. At quis velit enim consequuntur mollitia corrupti voluptatem. Officia numquam laboriosam iste non ut.', 594.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1610, 'Gorgeous Aluminum Chair', '4282059615664', 'gorgeous-aluminum-chair', 'Deserunt nesciunt ad pariatur eius sed porro. Omnis repellat distinctio occaecati aut vel laudantium dolores magnam.', 1432.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1611, 'Awesome Wool Keyboard', '2472081858012', 'awesome-wool-keyboard', 'Voluptatibus ut est quibusdam provident aut blanditiis sunt deleniti. Numquam omnis eaque voluptatem qui voluptatem.', 2534.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1612, 'Lightweight Bronze Plate', '2975707840045', 'lightweight-bronze-plate', 'Temporibus quia fugiat qui autem culpa consequatur laboriosam. Autem sed eum qui consequatur. Et est et est asperiores natus perspiciatis.', 1896.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1613, 'Intelligent Wooden Wallet', '9294539343337', 'intelligent-wooden-wallet', 'Est officiis fugiat ipsam aperiam. Repellat suscipit beatae iure animi nobis aut.', 155.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1614, 'Heavy Duty Wool Car', '7740783668730', 'heavy-duty-wool-car', 'Earum quidem perferendis ipsam qui. Qui odio sit sed maxime.', 4987.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1615, 'Sleek Rubber Bench', '8155042090860', 'sleek-rubber-bench', 'Consectetur reprehenderit sequi incidunt non soluta voluptas et. Et modi laborum laborum porro consequatur. Deserunt quaerat mollitia dolorum quis et.', 3716.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1616, 'Rustic Wool Knife', '0812855283855', 'rustic-wool-knife', 'Facilis suscipit a eos molestiae et. Nostrum quos deserunt tenetur.', 470.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1617, 'Lightweight Silk Knife', '8180525817306', 'lightweight-silk-knife', 'Nisi soluta quae debitis et quasi. Veniam distinctio corporis rerum ea dolor. Porro voluptas quia nobis aliquid.', 3871.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1618, 'Heavy Duty Concrete Bottle', '7464156763838', 'heavy-duty-concrete-bottle', 'A nulla non necessitatibus quia est. Quo quis excepturi qui. Quod quidem quod assumenda eum inventore.', 4981.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1619, 'Synergistic Marble Table', '5817465878649', 'synergistic-marble-table', 'Sunt voluptatem voluptatum saepe est aut iure. Occaecati voluptatum labore perferendis et officia voluptates. Possimus blanditiis molestias odio ullam similique.', 3753.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1620, 'Intelligent Linen Computer', '4256195069421', 'intelligent-linen-computer', 'Culpa reprehenderit quia repellendus laboriosam aperiam. Quia placeat commodi fugiat qui. Incidunt dolor omnis rem laudantium.', 3532.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1621, 'Small Concrete Gloves', '4237975198968', 'small-concrete-gloves', 'In saepe minus earum accusantium. Repudiandae nihil excepturi eos hic perferendis voluptatum.', 4863.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1622, 'Enormous Linen Computer', '0734124867538', 'enormous-linen-computer', 'Sed minima cumque eaque asperiores cupiditate voluptatibus. Recusandae rerum sit occaecati qui qui. Alias quasi ut perspiciatis ut quos fugit rem.', 3256.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1623, 'Awesome Leather Shirt', '8951970719787', 'awesome-leather-shirt', 'Vel expedita temporibus natus. Aliquam non aut nihil doloribus eos.', 3534.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1624, 'Gorgeous Cotton Car', '4541921359021', 'gorgeous-cotton-car', 'Voluptas excepturi tenetur voluptatem doloremque cum ut et. Necessitatibus voluptatem eum et saepe non nesciunt culpa rerum. Totam libero et autem.', 2875.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1625, 'Durable Silk Car', '5528888758219', 'durable-silk-car', 'Aliquam facere qui dolores enim sequi quasi. Culpa consequatur odio exercitationem dignissimos quas maxime.', 533.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1626, 'Mediocre Marble Watch', '1069035521262', 'mediocre-marble-watch', 'Animi id in qui debitis. Incidunt explicabo non officiis dignissimos reiciendis nemo. Expedita placeat perferendis ipsum.', 3661.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1627, 'Rustic Bronze Bag', '9152181663961', 'rustic-bronze-bag', 'Impedit est voluptas deserunt sed repudiandae debitis maiores. Esse perspiciatis error ad. Dolorem ullam cupiditate provident non facilis.', 839.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1628, 'Mediocre Silk Pants', '8259532946320', 'mediocre-silk-pants', 'Aspernatur similique voluptatem est eaque nihil illum accusantium. Nemo voluptas sit ut autem molestiae voluptatem magni. Laudantium omnis facilis adipisci dicta.', 3016.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1629, 'Sleek Leather Bottle', '3719907454386', 'sleek-leather-bottle', 'Dolorem sequi iste nihil officiis vel nobis et. Et quasi tempora voluptatem asperiores.', 570.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1630, 'Gorgeous Paper Bench', '1461197586743', 'gorgeous-paper-bench', 'Perspiciatis nulla sit maiores et. Enim accusamus est porro doloremque inventore.', 4300.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1631, 'Heavy Duty Plastic Bottle', '5991265678903', 'heavy-duty-plastic-bottle', 'Delectus molestiae sit est et dolores est dolores. Quo autem nostrum voluptas eum.', 4672.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1632, 'Rustic Leather Wallet', '4719551530282', 'rustic-leather-wallet', 'Deserunt vel itaque beatae maxime officia est est. Rerum officiis saepe corrupti in sit non.', 3978.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1633, 'Incredible Copper Plate', '0990597469222', 'incredible-copper-plate', 'Saepe cumque laborum suscipit dolor. Earum nesciunt provident autem temporibus qui dolorum. Voluptates rerum ut incidunt repudiandae.', 1306.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1634, 'Fantastic Bronze Computer', '3320818244715', 'fantastic-bronze-computer', 'Iure natus dolores qui quae rerum. Molestias quis quia perspiciatis cupiditate qui ea non. Quae quis ad nesciunt hic itaque voluptates animi.', 741.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1635, 'Lightweight Wooden Bottle', '4022615937201', 'lightweight-wooden-bottle', 'Ipsum est dignissimos voluptatem non quo ut. Nostrum quia labore necessitatibus eveniet ut nesciunt rem. Doloremque ipsam consectetur eum id dolore officiis.', 420.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1636, 'Mediocre Cotton Shirt', '8729384182219', 'mediocre-cotton-shirt', 'Reprehenderit tempore nesciunt eos perspiciatis ratione unde ut. Consequuntur commodi qui sunt quis quia excepturi.', 425.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1637, 'Small Concrete Wallet', '3714976408292', 'small-concrete-wallet', 'Autem dignissimos minima eos qui odit voluptate. Blanditiis ipsum officia architecto vel.', 1646.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1638, 'Rustic Copper Clock', '6219668086118', 'rustic-copper-clock', 'Sed expedita similique rerum. Sed sit quas nulla. Est vitae cupiditate pariatur veniam.', 70.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1639, 'Mediocre Leather Pants', '3949569786932', 'mediocre-leather-pants', 'Ipsam deleniti et sapiente sapiente ea. Corporis perspiciatis nobis assumenda animi quia. Deleniti quibusdam sequi recusandae similique ratione culpa at.', 1784.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1640, 'Intelligent Silk Gloves', '0534147524629', 'intelligent-silk-gloves', 'Ratione illo ipsa quidem eum consectetur. Eum quaerat veritatis cum aliquam inventore ut.', 3851.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1641, 'Fantastic Paper Hat', '1800182856155', 'fantastic-paper-hat', 'Quibusdam ab dolorem possimus aperiam. Laudantium magnam iste porro rerum quas ut dolores. Voluptates natus nobis optio dolorem ab.', 3599.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1642, 'Small Marble Computer', '6598748721997', 'small-marble-computer', 'Omnis et repellendus veritatis. Quidem aut qui accusamus ad omnis sunt. Ducimus cupiditate ut tenetur nesciunt.', 13.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1643, 'Durable Aluminum Knife', '0344337281351', 'durable-aluminum-knife', 'Enim sit necessitatibus ut qui perspiciatis quasi. Molestias numquam est earum alias. Aspernatur quia tenetur veritatis et vel distinctio.', 2373.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1644, 'Practical Rubber Plate', '9227562134634', 'practical-rubber-plate', 'Quo distinctio enim non quis eaque est itaque. Cumque quod earum ipsa consequuntur. Molestias laborum debitis laboriosam sapiente quia.', 1701.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1645, 'Practical Copper Watch', '7997480330815', 'practical-copper-watch', 'Nulla et hic nulla optio. Odit cupiditate nesciunt nihil ipsum soluta porro recusandae. Ratione non cum est magni non provident natus dolor.', 2473.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1646, 'Ergonomic Concrete Computer', '2238326011488', 'ergonomic-concrete-computer', 'Mollitia ab magnam possimus optio dignissimos. Qui maiores facilis neque.', 4957.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1647, 'Awesome Linen Car', '7282167595039', 'awesome-linen-car', 'Quia repudiandae autem commodi tenetur eligendi perferendis. Asperiores sit repellendus dolore. Est qui sequi voluptatem tenetur nulla.', 2438.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1648, 'Mediocre Wool Watch', '8609456343116', 'mediocre-wool-watch', 'Laudantium est eos quod nemo aut error. Harum sed tempora alias amet omnis odio. Aut beatae corporis molestiae sequi maiores nulla.', 1671.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1649, 'Synergistic Rubber Lamp', '3164347897352', 'synergistic-rubber-lamp', 'A eaque dolorem eum natus facere sit totam accusantium. Nulla consequatur odio sit animi occaecati dolorem doloribus. Odio rerum vel ad non et.', 4761.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1650, 'Practical Paper Clock', '9877557041821', 'practical-paper-clock', 'Quos fugit omnis et enim ipsam. Minus earum et aut et quia. Ut sint saepe tempora omnis officia voluptas debitis.', 4313.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1651, 'Heavy Duty Aluminum Shirt', '7977891547255', 'heavy-duty-aluminum-shirt', 'Voluptatum excepturi sed asperiores ut ad tenetur impedit. Deserunt voluptas qui et dolores voluptatem.', 393.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1652, 'Fantastic Copper Car', '4318137944859', 'fantastic-copper-car', 'Autem ea quas placeat voluptatibus maxime iure et. Iusto quo nostrum eum debitis in nisi est.', 1020.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1653, 'Fantastic Silk Shoes', '0338881471092', 'fantastic-silk-shoes', 'Omnis at id veritatis. Cum fugit cum quia autem. Praesentium dolorem alias possimus non tempora eum reiciendis voluptatum.', 2548.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1654, 'Sleek Linen Keyboard', '0873543613859', 'sleek-linen-keyboard', 'Eos eligendi dignissimos unde magnam et et. Non totam aut nesciunt inventore optio officia. Consectetur incidunt culpa voluptas eos voluptatem ut quae unde.', 3305, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1655, 'Synergistic Plastic Lamp', '0440940693878', 'synergistic-plastic-lamp', 'Adipisci quisquam et ratione ratione vel. Numquam error voluptates explicabo fugiat molestiae.', 1854.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1656, 'Sleek Copper Coat', '3994796119336', 'sleek-copper-coat', 'Optio iste odio et. Iste rerum facere ex sed sed voluptate accusamus.', 1534.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1657, 'Small Linen Hat', '2326437941227', 'small-linen-hat', 'Saepe in aliquam voluptatem dignissimos. Nisi architecto aut voluptatibus sit dicta qui. Quasi laboriosam quo quis sunt deleniti.', 511.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1658, 'Heavy Duty Granite Pants', '6800466685421', 'heavy-duty-granite-pants', 'Dolores consequuntur eveniet labore sed. Labore et sit ut quo culpa et et.', 4485.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1659, 'Rustic Steel Plate', '2020238217634', 'rustic-steel-plate', 'Reprehenderit necessitatibus esse commodi ut repellendus velit. Rerum esse laudantium ullam sit dolor omnis.', 4252.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1660, 'Ergonomic Wool Car', '3974235874835', 'ergonomic-wool-car', 'Eaque nemo ut neque similique ut magni. Praesentium et ab repudiandae eum.', 3120.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1661, 'Enormous Iron Bench', '9023805896242', 'enormous-iron-bench', 'Veritatis rerum aliquam aspernatur non omnis repellat quia numquam. Beatae quos incidunt eos laudantium voluptas delectus et. Sequi velit facilis qui minus quis.', 1899.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1662, 'Mediocre Concrete Plate', '1004330630493', 'mediocre-concrete-plate', 'Saepe consequatur occaecati recusandae ut illo aut. Nam eos voluptas et. Optio rem quisquam exercitationem maxime est eius voluptates non.', 3359.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1663, 'Rustic Marble Computer', '9357171056024', 'rustic-marble-computer', 'Et excepturi qui magnam fugit eius sint. Ea corrupti est et veritatis placeat voluptatibus assumenda. Minus facere aut perspiciatis vitae.', 1101.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1664, 'Rustic Silk Knife', '1072421305094', 'rustic-silk-knife', 'Rerum aperiam eius sequi et sint ut officia. Veritatis sed autem suscipit eum veritatis vel aut. Cumque nobis minus ut beatae.', 1493.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1665, 'Incredible Iron Gloves', '4842794992453', 'incredible-iron-gloves', 'Ex omnis temporibus tempore. Laudantium suscipit voluptas inventore corporis accusantium.', 1115.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1666, 'Lightweight Bronze Car', '7883969860549', 'lightweight-bronze-car', 'Minima praesentium qui non quia maiores eligendi. Repudiandae ab perferendis et qui. Fuga ut adipisci molestiae voluptatum.', 3931.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1667, 'Sleek Copper Pants', '3344652638424', 'sleek-copper-pants', 'Alias ut beatae aspernatur dolorem. Eum dolor vel neque non molestiae.', 4834.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1668, 'Sleek Aluminum Gloves', '5932300981114', 'sleek-aluminum-gloves', 'Nostrum unde tenetur itaque accusantium odio. Fugit facilis aspernatur tempore voluptate iure veniam architecto. Ipsam et magnam excepturi et cum ut.', 951.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1669, 'Intelligent Linen Shoes', '5488764077554', 'intelligent-linen-shoes', 'Ex sequi officiis et illo quidem. Ipsam animi accusantium itaque ut mollitia ut vero tempora. Eligendi ipsam commodi explicabo aut.', 4817.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1670, 'Small Rubber Pants', '4112457255882', 'small-rubber-pants', 'Quas mollitia sit eaque blanditiis autem. In et sunt eos quibusdam corporis tempora qui. Sunt est asperiores earum sit commodi dolor sint quia.', 765.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1671, 'Practical Plastic Lamp', '3384042598648', 'practical-plastic-lamp', 'Autem eveniet fugit dolorum quia. Voluptates possimus totam eius dolores. Rerum harum molestiae optio molestiae sint maxime.', 189.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1672, 'Synergistic Linen Gloves', '6872442030822', 'synergistic-linen-gloves', 'Nam illum consequuntur quam eaque illum dolor enim. Velit quas architecto debitis odit. Illo accusantium tempora ut voluptatibus eos laudantium praesentium.', 1775.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1673, 'Synergistic Marble Shirt', '7418488300278', 'synergistic-marble-shirt', 'Tempora dolor est qui esse sunt. Aspernatur unde dolor et distinctio.', 1954.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1674, 'Enormous Aluminum Bottle', '7509211480531', 'enormous-aluminum-bottle', 'Corporis ducimus fugiat ullam repudiandae est officia quia dolor. Soluta ut deleniti culpa amet facere. Sunt in dolor eos voluptatem eveniet ipsa deserunt.', 1218.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1675, 'Incredible Bronze Coat', '2500581911880', 'incredible-bronze-coat', 'Officia neque ut voluptas autem at enim necessitatibus. Reprehenderit esse laborum molestias neque.', 2932.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1676, 'Intelligent Granite Watch', '8992779192203', 'intelligent-granite-watch', 'Deleniti fuga modi ut ipsa. Nobis ducimus possimus quod ab. Ut veritatis quidem asperiores quo atque doloribus voluptas.', 1296.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1677, 'Fantastic Linen Clock', '7990326925114', 'fantastic-linen-clock', 'A officiis consequatur ea est. Eum voluptas quidem magnam minus corporis doloribus architecto cum. Et perspiciatis quia excepturi.', 2912.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1678, 'Practical Copper Shoes', '2149218479562', 'practical-copper-shoes', 'Est debitis sit deserunt. Cupiditate molestiae eveniet blanditiis non.', 1869.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1679, 'Enormous Concrete Plate', '9870059436539', 'enormous-concrete-plate', 'Velit occaecati sint perspiciatis quia voluptate. Et eum inventore assumenda sit. Est voluptatem iure aspernatur id.', 4700.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1680, 'Practical Bronze Shirt', '8832556495618', 'practical-bronze-shirt', 'Et sed cum repellat eius ut qui est alias. Sunt aut temporibus consequatur veritatis commodi aut ipsa. Perferendis repellendus facere et.', 70.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1681, 'Synergistic Copper Wallet', '8075106277719', 'synergistic-copper-wallet', 'Distinctio blanditiis animi et quaerat. Ab harum qui id atque sit hic sequi.', 4985.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1682, 'Durable Aluminum Bench', '4589744617652', 'durable-aluminum-bench', 'Natus commodi in et ullam omnis. Dolores nam rerum repudiandae aspernatur.', 2554.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1683, 'Enormous Marble Bottle', '8480133801880', 'enormous-marble-bottle', 'Alias dolorem neque eum vitae eaque et. Laborum aut minima dolores necessitatibus praesentium cum. Modi eius atque ullam saepe sequi eos.', 4664.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1684, 'Small Iron Hat', '5054075567253', 'small-iron-hat', 'Dolorum inventore omnis iure ullam hic. At libero aperiam ipsa eos reiciendis repellat soluta. Velit qui molestias et repellat debitis cupiditate.', 3679.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1685, 'Durable Linen Shirt', '1841577144655', 'durable-linen-shirt', 'Blanditiis voluptas qui molestias omnis. Non deserunt quidem doloribus aspernatur fugiat quia libero est.', 2898.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1686, 'Awesome Paper Car', '4704043981260', 'awesome-paper-car', 'Fuga excepturi sunt qui natus assumenda voluptas. Ut debitis accusamus quia sunt magnam.', 3309.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1687, 'Incredible Silk Table', '0497581384382', 'incredible-silk-table', 'Deleniti earum fugiat illum sed sint omnis consequatur. Dicta quis voluptas consequatur sed et nostrum. Velit quo tempora aperiam.', 467.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1688, 'Sleek Cotton Wallet', '5245642296762', 'sleek-cotton-wallet', 'Est impedit aut ducimus nihil quam. Corrupti vel sed tempora cum voluptatem dolorem voluptas.', 717.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1689, 'Lightweight Granite Bag', '6375248359871', 'lightweight-granite-bag', 'Maxime quaerat facere aut sed delectus qui veniam. Ab reiciendis magnam dolorem velit incidunt praesentium.', 3128.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1690, 'Incredible Copper Pants', '8707826332620', 'incredible-copper-pants', 'Dolores beatae vel explicabo corrupti tempora. Quia commodi sunt quo aut quae. Asperiores delectus cum aliquid enim et autem.', 1779.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1691, 'Gorgeous Concrete Lamp', '3547028869600', 'gorgeous-concrete-lamp', 'Consequuntur hic quidem officia quia omnis et aliquam a. Neque beatae voluptatem nam error cupiditate. Accusantium adipisci cumque ut aliquid neque.', 859.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1692, 'Incredible Iron Coat', '7230550916367', 'incredible-iron-coat', 'Voluptatem ut minus laudantium voluptas velit repellendus est enim. Facere iure cumque dolor consequatur officiis officia quaerat. Ipsum corrupti dolorum sunt necessitatibus amet architecto modi.', 1671.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1693, 'Aerodynamic Copper Clock', '3705673083219', 'aerodynamic-copper-clock', 'Veritatis similique illum qui totam molestiae enim. Magni saepe autem architecto est. Nam ipsa et quas inventore doloribus iure.', 2590.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1694, 'Rustic Steel Car', '8039153705465', 'rustic-steel-car', 'Sit beatae adipisci odit accusamus. Sint quo rerum nihil commodi labore eos non.', 765.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1695, 'Synergistic Silk Bottle', '1878088013972', 'synergistic-silk-bottle', 'Accusantium dolor est sint perspiciatis maxime magni sapiente delectus. Impedit ad dolore est labore. Excepturi ut natus excepturi tempora vitae quibusdam.', 2015.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1696, 'Awesome Concrete Shoes', '2073929835082', 'awesome-concrete-shoes', 'Qui enim laboriosam qui possimus est aut quo. Placeat aut necessitatibus enim quis aut eos rerum. Temporibus eaque dolores quaerat eligendi veritatis perferendis ex.', 4685.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1697, 'Mediocre Cotton Chair', '3081656944891', 'mediocre-cotton-chair', 'Saepe numquam et magni quibusdam ut dolor. Voluptate magni nam aut officiis.', 4629.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1698, 'Durable Cotton Plate', '8841496204440', 'durable-cotton-plate', 'Esse culpa ut et quae officiis iste. Vero ut repudiandae expedita labore repellendus aut.', 1062.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1699, 'Awesome Aluminum Bottle', '9865813736093', 'awesome-aluminum-bottle', 'Quo eveniet rem recusandae et. Ut quibusdam voluptas eum in et adipisci. Neque excepturi veniam ea consequatur deleniti unde natus.', 4237.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1700, 'Durable Paper Shoes', '5246651362424', 'durable-paper-shoes', 'Itaque quas aut enim sit. Consequatur aut et ratione deleniti provident voluptatem. Voluptate tenetur minus est laboriosam ut suscipit.', 2878.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1701, 'Synergistic Paper Car', '7541457112340', 'synergistic-paper-car', 'Dicta quos id blanditiis qui. Quibusdam veniam velit porro dolores at est non alias. Quis eos mollitia veritatis eligendi repellendus.', 1353.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1702, 'Mediocre Linen Plate', '4554947153092', 'mediocre-linen-plate', 'Accusantium similique omnis suscipit nesciunt. Id tempore sed rerum harum consequuntur incidunt est.', 1763.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1703, 'Gorgeous Paper Clock', '2867914966918', 'gorgeous-paper-clock', 'Error occaecati voluptates omnis quo. Velit debitis amet aspernatur facere rem et.', 2930.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1704, 'Ergonomic Steel Keyboard', '8324578020478', 'ergonomic-steel-keyboard', 'Hic quos veritatis in. Sed laborum laboriosam ad necessitatibus illum.', 4707.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1705, 'Awesome Wool Lamp', '6928291656772', 'awesome-wool-lamp', 'Voluptate dolor ab perferendis dicta et beatae et. Voluptatum pariatur sed officiis deserunt.', 427.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1706, 'Intelligent Wool Knife', '0486734700445', 'intelligent-wool-knife', 'Sed sed et repellendus eos quae necessitatibus. Dolorem hic pariatur commodi adipisci placeat nisi. Dolorem rerum animi aliquid quos harum maxime fugit voluptatem.', 3669.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1707, 'Sleek Leather Shirt', '4947083222485', 'sleek-leather-shirt', 'Odit voluptates numquam fuga iusto sit commodi voluptas. Cupiditate quo accusamus fugit incidunt. Fugit reiciendis non dolorem voluptatem.', 2663.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1708, 'Practical Rubber Watch', '4764557145329', 'practical-rubber-watch', 'Est et provident animi ipsa. Alias est sit dolorem aut voluptas ducimus.', 242.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1709, 'Ergonomic Aluminum Bench', '8238507776353', 'ergonomic-aluminum-bench', 'Laborum eligendi numquam vel esse autem. Iure fugit blanditiis aut eum consequatur et. Perferendis quae reprehenderit natus sunt dignissimos cumque.', 3028.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1710, 'Lightweight Marble Clock', '1969728553429', 'lightweight-marble-clock', 'Vel quod qui qui doloribus maiores. Ut quia fuga libero cum enim.', 4387.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1711, 'Rustic Linen Bag', '1286096605162', 'rustic-linen-bag', 'Repellendus quos sint ea est. Ipsum rerum similique est nobis dicta impedit assumenda.', 25.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1712, 'Heavy Duty Bronze Plate', '1255891385715', 'heavy-duty-bronze-plate', 'Et nihil dolorem et vel possimus laboriosam. Expedita doloribus ducimus repellendus voluptatem eius officiis.', 3740.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1713, 'Sleek Bronze Coat', '6221887791476', 'sleek-bronze-coat', 'Iusto sit dolor quo voluptas iure in. Blanditiis ullam dolor enim ducimus et. Sunt temporibus numquam facere voluptatem eos sequi.', 4557.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1714, 'Fantastic Bronze Pants', '1836032502538', 'fantastic-bronze-pants', 'Voluptate assumenda sit voluptas. Voluptatem aut odit totam dolore velit magnam dolorum.', 1316.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1715, 'Awesome Concrete Chair', '1338135759272', 'awesome-concrete-chair', 'Natus placeat est dolorum quisquam qui aut eaque optio. Provident aliquid ullam modi laborum. Ut ut sunt molestiae perspiciatis.', 2259.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1716, 'Sleek Copper Watch', '8670481624662', 'sleek-copper-watch', 'Et aut aliquid est temporibus eligendi ea dolores. In minima non veritatis accusamus nostrum voluptas excepturi est.', 1160.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1717, 'Durable Marble Clock', '6941478883051', 'durable-marble-clock', 'Quia dolore nisi molestias dolorem quibusdam. Et ducimus mollitia perferendis et.', 1286.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1718, 'Durable Linen Bottle', '4809029976510', 'durable-linen-bottle', 'Fuga iure eos voluptatibus nemo quis ut quia laboriosam. Vel qui non ut odio quo architecto ut. Repudiandae vitae id provident velit.', 1378.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1719, 'Ergonomic Paper Knife', '1701560471192', 'ergonomic-paper-knife', 'Non quis suscipit rerum autem deleniti. Ab nam ipsum magnam nemo.', 4748.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1720, 'Enormous Iron Bottle', '1888544384430', 'enormous-iron-bottle', 'Quidem ipsa animi aut ratione. Commodi doloremque molestiae quibusdam dolor inventore quae. Laudantium blanditiis repudiandae velit omnis.', 1225.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1721, 'Aerodynamic Steel Lamp', '0456407916091', 'aerodynamic-steel-lamp', 'Et perspiciatis quidem veniam. Architecto impedit recusandae magnam voluptatem est itaque voluptatem.', 1437.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1722, 'Awesome Concrete Shirt', '2047132265882', 'awesome-concrete-shirt', 'Et occaecati reiciendis eveniet optio ratione ut illo perferendis. Et eum quia ut ipsa dolorem. Quas ad eum eaque aperiam aliquid ipsum autem aut.', 1742.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1723, 'Gorgeous Iron Chair', '9869477278401', 'gorgeous-iron-chair', 'Quasi numquam ut consequatur. Doloremque incidunt et temporibus sapiente.', 2381.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1724, 'Practical Rubber Computer', '6079723069728', 'practical-rubber-computer', 'Rerum officia sit quos quibusdam molestiae ea nostrum. Quas voluptatem voluptatum ut eum ad voluptas autem.', 4889.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1725, 'Enormous Plastic Car', '2036854631037', 'enormous-plastic-car', 'Ea quod dolores molestiae dolor. Accusantium laboriosam corporis accusantium qui quis eum. Aspernatur eum quod vel iusto magnam voluptatem.', 3230.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1726, 'Small Plastic Table', '7256500193572', 'small-plastic-table', 'Dolores non voluptatem nemo ad doloremque enim et numquam. Eaque doloribus iusto necessitatibus earum. Sequi et pariatur dolores.', 2623.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1727, 'Heavy Duty Leather Plate', '0106922671097', 'heavy-duty-leather-plate', 'Totam perspiciatis molestiae voluptas aut omnis ea neque. Corrupti unde delectus sed voluptatem voluptatem minima. Qui odio officiis accusantium quos aliquid voluptas deleniti cum.', 1555.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1728, 'Mediocre Marble Wallet', '7312873795543', 'mediocre-marble-wallet', 'At perspiciatis eum qui omnis. Deserunt dicta accusantium ad ea aut autem praesentium.', 1039.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1729, 'Small Steel Bench', '5393729407058', 'small-steel-bench', 'Error consequatur ut architecto voluptatem provident cupiditate. Praesentium et sit reiciendis ratione quibusdam adipisci ut.', 1327.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1730, 'Practical Bronze Bottle', '5050483672305', 'practical-bronze-bottle', 'Recusandae iusto molestiae dolorem dolores officia aliquam est ut. Rerum ea est voluptas vel. Commodi et nulla fuga harum.', 3511.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1731, 'Intelligent Concrete Bag', '3705797013192', 'intelligent-concrete-bag', 'Possimus quia enim pariatur deleniti consequuntur sint perspiciatis. Quia non velit et quibusdam et dolores.', 429.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1732, 'Ergonomic Iron Knife', '4552279358284', 'ergonomic-iron-knife', 'Voluptatem consequatur tempora ullam veritatis. Repellendus ratione consequuntur accusantium aut.', 1427.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1733, 'Awesome Bronze Computer', '8091184719279', 'awesome-bronze-computer', 'Voluptates voluptates hic minima. Rem dicta quis sunt eaque et autem modi.', 1088.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1734, 'Durable Steel Plate', '0855750852986', 'durable-steel-plate', 'Vel atque facere sit. Aut quos ipsam nihil eos. Similique alias magni est.', 3220.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1735, 'Practical Wooden Bench', '1708462808422', 'practical-wooden-bench', 'Sint quibusdam quia eveniet qui accusantium necessitatibus similique. Facilis asperiores et magni non.', 3125.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1736, 'Small Granite Clock', '6762095205381', 'small-granite-clock', 'Et qui ut ad libero saepe laboriosam. Facere dolorem odio magnam temporibus minima.', 727.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1737, 'Synergistic Iron Bench', '1536614212748', 'synergistic-iron-bench', 'Et officia voluptatem laudantium ut rerum exercitationem nostrum. Illum sit illo a quas quia.', 2527.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1738, 'Fantastic Leather Shirt', '6039566633661', 'fantastic-leather-shirt', 'Consectetur voluptatibus quo provident ullam ratione adipisci omnis. Et accusantium ea repudiandae similique sint animi. Et odit eos tempore distinctio.', 1371.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1739, 'Sleek Paper Shirt', '8025225871763', 'sleek-paper-shirt', 'Est accusamus possimus dolorum magnam voluptatum necessitatibus voluptatum. Eveniet ut quos debitis animi. Iste omnis delectus quo facilis reiciendis tempora.', 3487.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1740, 'Practical Wool Knife', '8931954293144', 'practical-wool-knife', 'Ipsum est ut animi ab sed. Similique dolorem mollitia omnis commodi laudantium voluptatum qui.', 4546.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1741, 'Rustic Plastic Gloves', '5174756480654', 'rustic-plastic-gloves', 'Magnam rerum voluptatum ut rerum itaque. Quia ipsa blanditiis aut iure voluptatem sapiente.', 2048.32, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1742, 'Mediocre Paper Coat', '7118986327806', 'mediocre-paper-coat', 'Distinctio nihil libero tempore. Earum vitae culpa et sed illum.', 1606.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1743, 'Fantastic Steel Table', '4748071266692', 'fantastic-steel-table', 'Qui molestiae explicabo et. Occaecati sed perspiciatis rem eos. Libero facilis impedit consequatur et ea voluptatem.', 1105.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1744, 'Small Aluminum Bottle', '3069929750080', 'small-aluminum-bottle', 'Sapiente et aut consectetur modi soluta. Consequatur accusantium odio nisi tempora qui est praesentium. Minus nulla harum cupiditate et.', 2475.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1745, 'Rustic Copper Hat', '5460112214286', 'rustic-copper-hat', 'Ab quia culpa aut fugit maxime et molestias. Doloremque error eligendi exercitationem quia rerum et. Ab repellendus repellendus facilis soluta quisquam adipisci optio.', 3001.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1746, 'Mediocre Iron Car', '1828134337729', 'mediocre-iron-car', 'Et eum omnis adipisci est. Tempore corrupti repellendus dicta est ab. Vitae aut soluta dolor ut sint aspernatur in quod.', 2442.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1747, 'Lightweight Paper Lamp', '7562802095958', 'lightweight-paper-lamp', 'Necessitatibus molestias minima id saepe ut enim quam. Quia ea omnis qui voluptates reiciendis. Perferendis sed reprehenderit impedit mollitia atque.', 2166.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1748, 'Gorgeous Plastic Chair', '9223278316920', 'gorgeous-plastic-chair', 'Eos odio laudantium aut ab dolores voluptas. Qui consequatur qui nemo.', 4468.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1749, 'Durable Granite Shoes', '3422056934066', 'durable-granite-shoes', 'Aut in sed aut illum. Labore fugiat ipsam cupiditate molestias accusantium accusantium at temporibus.', 1917.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1750, 'Intelligent Silk Knife', '6357510525658', 'intelligent-silk-knife', 'Dolor ex omnis placeat quas nihil. Esse laboriosam rem accusamus qui officiis reprehenderit incidunt.', 3057.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1751, 'Mediocre Iron Bottle', '0126820675164', 'mediocre-iron-bottle', 'Nesciunt repudiandae id nesciunt ut eveniet quaerat est. Quia fuga quo sint ullam provident et assumenda. Rerum id aspernatur iusto repellendus aut dolorem pariatur.', 1988.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1752, 'Synergistic Cotton Shirt', '9472521626303', 'synergistic-cotton-shirt', 'Non amet ea consequatur velit. Sit esse et et quia enim. Hic itaque et odit odit ut non.', 3364.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1753, 'Fantastic Iron Coat', '2619656471331', 'fantastic-iron-coat', 'Nam delectus sed temporibus. Doloribus tempore animi a harum omnis. Sit earum qui qui laboriosam sequi ut iste.', 217.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1754, 'Rustic Marble Gloves', '6570674806023', 'rustic-marble-gloves', 'A cum voluptatem libero nihil. Rerum eos consequatur suscipit modi vitae. Sint aut enim sint sapiente nulla deleniti.', 1428.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1755, 'Mediocre Granite Keyboard', '0569902066557', 'mediocre-granite-keyboard', 'Eligendi earum autem occaecati odio sed repudiandae quo. Deleniti tenetur vel natus nesciunt.', 260.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1756, 'Small Iron Shirt', '6355966111708', 'small-iron-shirt', 'Ratione sit quis alias molestiae. Quisquam amet vitae excepturi ea omnis.', 3327.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1757, 'Practical Cotton Table', '6771212802372', 'practical-cotton-table', 'Ipsa sed et incidunt ratione provident consectetur aperiam. Voluptas magni laborum dolore facere atque et non.', 746.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1758, 'Lightweight Copper Watch', '5111792444738', 'lightweight-copper-watch', 'Aut inventore doloribus tenetur et. Incidunt quibusdam repellat et ipsa. Quibusdam culpa et ea ut.', 3846.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1759, 'Gorgeous Granite Plate', '7486781103926', 'gorgeous-granite-plate', 'Inventore at cupiditate totam reiciendis velit. Ducimus molestiae distinctio iste ad illo itaque. Recusandae tempora ut voluptatibus non earum ut saepe odit.', 4870.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1760, 'Durable Leather Hat', '3880516362529', 'durable-leather-hat', 'Inventore accusantium saepe debitis ut quidem ratione dolor. Soluta dolores doloremque impedit unde eius soluta.', 1374.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1761, 'Aerodynamic Copper Watch', '2113835284281', 'aerodynamic-copper-watch', 'Accusamus eius natus est vel et. Neque molestiae velit itaque molestiae deserunt. Quaerat atque sequi ad nam magni esse nemo omnis.', 3279.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1762, 'Awesome Silk Plate', '1655032305594', 'awesome-silk-plate', 'Dolores qui rerum rem ea debitis mollitia aperiam reiciendis. Tempora cum magni quia est impedit doloremque. Aliquam voluptatem dolorum vitae eligendi modi pariatur eum possimus.', 1434.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1763, 'Ergonomic Plastic Shirt', '5871057370461', 'ergonomic-plastic-shirt', 'Mollitia doloremque nobis sapiente est recusandae id. Beatae et consectetur et voluptas numquam occaecati.', 4350.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1764, 'Enormous Concrete Bottle', '7393820564566', 'enormous-concrete-bottle', 'Eius laborum omnis minima aut tempore molestias ut. Ad consequuntur voluptatem nemo assumenda debitis voluptate recusandae. Aut dolorem ut sed sint nulla architecto autem.', 3472.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1765, 'Small Cotton Bench', '4688704128334', 'small-cotton-bench', 'Odit ratione quisquam laboriosam et. Placeat voluptatem deserunt expedita deleniti tempore maiores possimus deserunt. Modi aliquam autem eveniet officiis et sed quis.', 4720.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1766, 'Fantastic Aluminum Computer', '2667237468058', 'fantastic-aluminum-computer', 'Eaque occaecati reiciendis qui cum. Autem amet voluptas non quibusdam cum veniam facilis voluptas. Veritatis ducimus sit molestiae iste optio.', 2392.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1767, 'Awesome Granite Chair', '8262269929207', 'awesome-granite-chair', 'Quia neque aliquam reprehenderit autem. Delectus magni neque tenetur qui iusto et voluptatem.', 3086.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1768, 'Enormous Linen Wallet', '2970167812670', 'enormous-linen-wallet', 'Sed minima aliquam et voluptatem unde quaerat et at. Repellat et vel atque sunt.', 211.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1769, 'Awesome Rubber Bottle', '1818706066560', 'awesome-rubber-bottle', 'Ex quae ratione placeat et natus inventore asperiores similique. Qui accusamus voluptatem exercitationem quaerat.', 4456.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1770, 'Synergistic Bronze Computer', '9262016048150', 'synergistic-bronze-computer', 'Consectetur voluptas quo eum enim nam quia delectus autem. Saepe rerum laboriosam corrupti est illo.', 4559.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1771, 'Incredible Aluminum Plate', '8743960802636', 'incredible-aluminum-plate', 'Eos odit est deserunt. Et voluptatem perferendis adipisci dignissimos quis maxime aut.', 430.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1772, 'Aerodynamic Wool Pants', '4137345780307', 'aerodynamic-wool-pants', 'Et nobis non velit error sint. Quo minima sed ea et facilis. Dolores non consequatur minus adipisci quia.', 4288.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1773, 'Small Copper Knife', '7864902471367', 'small-copper-knife', 'Nesciunt cum mollitia rerum ut fugiat autem et. Maxime nobis et ipsam. Sint enim qui optio.', 913.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1774, 'Durable Wooden Lamp', '0291801643392', 'durable-wooden-lamp', 'Ut sed ab doloribus recusandae est ex vel. Recusandae placeat molestiae quis quam. Et accusamus repellendus aperiam eligendi dolorum vitae dolores.', 2735.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1775, 'Intelligent Wooden Coat', '4547703170846', 'intelligent-wooden-coat', 'Sit officia sunt quia quia voluptas harum. Nostrum architecto repellendus tenetur saepe et odit.', 1625.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1776, 'Incredible Wooden Computer', '4050275693335', 'incredible-wooden-computer', 'Dolores soluta nihil facilis fugiat dolorem voluptate. Mollitia rerum officiis qui eius.', 2568.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1777, 'Synergistic Steel Watch', '3417013423561', 'synergistic-steel-watch', 'Consequatur ratione expedita animi aut itaque. Beatae ut dignissimos aut in voluptatibus et eveniet.', 3123.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1778, 'Intelligent Concrete Keyboard', '3386392015301', 'intelligent-concrete-keyboard', 'Illo eum quasi nihil quia ullam. Ab autem necessitatibus est totam laboriosam. Ad maxime minima voluptas nam illum.', 860.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1779, 'Practical Wooden Table', '7347150700811', 'practical-wooden-table', 'Reprehenderit eligendi sunt ad eum magni nesciunt rerum. Inventore aut ea est vel.', 2986.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1780, 'Enormous Rubber Pants', '3254496444870', 'enormous-rubber-pants', 'Sed beatae ratione laboriosam maxime. Aut autem magni in porro dolorum accusantium rerum tenetur.', 2063.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1781, 'Heavy Duty Linen Bottle', '3434528781764', 'heavy-duty-linen-bottle', 'Provident quia velit ea alias occaecati dicta quia. Repudiandae vitae excepturi consequuntur asperiores et eveniet libero. Qui sed cupiditate a ut enim saepe sit autem.', 3373.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1782, 'Awesome Linen Wallet', '1329987094475', 'awesome-linen-wallet', 'Hic inventore quis porro laboriosam quidem vel. Accusantium ut cum consequuntur qui necessitatibus saepe.', 537.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1783, 'Durable Steel Clock', '5942959954995', 'durable-steel-clock', 'Omnis nihil natus sunt pariatur quos enim nesciunt. Fugit ut ut excepturi cumque consequuntur autem cum.', 1200.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1784, 'Lightweight Aluminum Gloves', '2939600398355', 'lightweight-aluminum-gloves', 'Quo aut quis magni. Quaerat velit magni sunt possimus qui nesciunt. Delectus mollitia maiores nam sit voluptates autem ut.', 4288.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1785, 'Ergonomic Cotton Wallet', '1554729824601', 'ergonomic-cotton-wallet', 'Et omnis asperiores sint recusandae. Esse magni ut est quam nihil. Dolor non sed repudiandae ea eum quia vitae inventore.', 4884.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1786, 'Incredible Steel Knife', '2298527714267', 'incredible-steel-knife', 'Consequatur dolore quia enim qui aliquid explicabo voluptatem. Dolor non dolorem nostrum excepturi non. Sunt quam quis est repellat architecto voluptate sed.', 3690.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1787, 'Sleek Bronze Lamp', '0240240526988', 'sleek-bronze-lamp', 'Tenetur aut iste ut ut fugit. Culpa totam numquam ea labore quis consequatur dolorem sequi.', 1447.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1788, 'Awesome Leather Bottle', '6675748306871', 'awesome-leather-bottle', 'Dolor quia corrupti saepe sint nesciunt voluptatem. Totam deserunt optio quasi ut at inventore qui. Amet enim aut quo minima sint.', 4143.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1789, 'Heavy Duty Aluminum Computer', '0764864138001', 'heavy-duty-aluminum-computer', 'Et molestias voluptatibus natus voluptas et velit. Ducimus ratione dolor delectus repudiandae.', 850.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1790, 'Practical Concrete Gloves', '9027791886201', 'practical-concrete-gloves', 'Error at officiis vel eius eius odio voluptatem voluptas. Consequatur rerum ipsa unde eius libero.', 3959.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1791, 'Intelligent Rubber Gloves', '9296082500687', 'intelligent-rubber-gloves', 'Rerum aperiam id quas adipisci necessitatibus quia eum optio. Nulla optio voluptatem quae labore numquam labore veritatis et. Ut aut temporibus vel voluptas placeat saepe a.', 1051.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1792, 'Heavy Duty Rubber Bag', '0570412834840', 'heavy-duty-rubber-bag', 'Aut id sit quam ipsum deleniti in. Exercitationem veniam cum voluptates facilis repudiandae. Sint saepe sit aut ipsum deleniti.', 2842.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1793, 'Heavy Duty Granite Bottle', '3550332377105', 'heavy-duty-granite-bottle', 'Saepe corporis expedita rerum qui asperiores ducimus. Sequi rerum fugiat aspernatur enim temporibus.', 1485.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1794, 'Small Cotton Table', '7413673252035', 'small-cotton-table', 'Quia aut accusantium asperiores illo quas et fugiat. Ut et in voluptas enim eos. Ducimus quia facilis non accusamus quidem iusto.', 2461.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1795, 'Sleek Plastic Plate', '1693228830291', 'sleek-plastic-plate', 'Minus adipisci deleniti sit nemo sint eius nemo. Quasi voluptas ut voluptatem quia est.', 345.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1796, 'Incredible Cotton Shirt', '6072758853447', 'incredible-cotton-shirt', 'Sed ullam vel quis rem sed. Dolorem nobis quo ab aliquam quia praesentium. Facere voluptatem perferendis nobis ad quaerat necessitatibus voluptate alias.', 2175.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1797, 'Rustic Paper Chair', '8733655490323', 'rustic-paper-chair', 'Pariatur quasi laudantium est hic asperiores. Aut et omnis accusantium molestiae.', 3079.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1798, 'Aerodynamic Iron Plate', '4716149628888', 'aerodynamic-iron-plate', 'Consectetur incidunt nihil et. Non rerum consequatur nesciunt sequi pariatur.', 4581.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1799, 'Sleek Aluminum Bag', '9357769191410', 'sleek-aluminum-bag', 'Voluptatem laboriosam nobis omnis blanditiis sequi sunt earum dolor. Nulla consequatur temporibus eveniet vero officiis. Ad accusantium veritatis fugit id aut voluptas veritatis quisquam.', 3628.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1800, 'Enormous Rubber Wallet', '6193768197595', 'enormous-rubber-wallet', 'Sit assumenda expedita veritatis eum sint. Excepturi distinctio iure nihil perferendis harum aliquid optio omnis.', 607.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1801, 'Synergistic Copper Bottle', '6941118364681', 'synergistic-copper-bottle', 'Sequi aut vitae porro cum. Eveniet eaque quo eveniet dolorum. Unde consequuntur necessitatibus dolores adipisci non enim.', 885.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1802, 'Enormous Paper Bottle', '2751165527533', 'enormous-paper-bottle', 'Inventore est quae sed similique consequatur. Error eos voluptas modi officia molestiae. Voluptatem quos quos atque incidunt.', 1217.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1803, 'Lightweight Plastic Clock', '3575762097393', 'lightweight-plastic-clock', 'Corporis voluptatum occaecati ea inventore nostrum. Eos quisquam sunt in. Qui ex aut illum.', 1586.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1804, 'Rustic Steel Pants', '0726445201863', 'rustic-steel-pants', 'Dolorem qui modi velit. Fugit ipsum debitis culpa nostrum.', 2217.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1805, 'Lightweight Cotton Lamp', '6753331906032', 'lightweight-cotton-lamp', 'Natus est quisquam non qui omnis cupiditate omnis. Delectus iure porro unde molestiae vel repellat quo. Vel quo qui officiis explicabo voluptatem et.', 3991.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1806, 'Mediocre Wool Wallet', '3728221491335', 'mediocre-wool-wallet', 'Provident hic aspernatur et. Itaque mollitia ipsum ea atque voluptas doloribus.', 2012.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1807, 'Aerodynamic Marble Knife', '4859538164175', 'aerodynamic-marble-knife', 'Error quas quaerat labore dolor fugiat deserunt qui nihil. Quibusdam ea voluptatem enim quam minus aut iure.', 3032.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1808, 'Intelligent Wooden Chair', '1328019987204', 'intelligent-wooden-chair', 'Fugiat in est eveniet alias. Esse fugiat adipisci distinctio molestias enim et vero.', 2616.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1809, 'Fantastic Copper Bench', '9348046567288', 'fantastic-copper-bench', 'Fuga maxime praesentium ullam quasi tenetur. Quasi quasi nostrum nihil magnam facilis doloribus.', 1096.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1810, 'Intelligent Concrete Chair', '3397059681708', 'intelligent-concrete-chair', 'Neque et explicabo animi eum blanditiis ut. Laudantium corporis recusandae repellat temporibus.', 378.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1811, 'Ergonomic Marble Pants', '1682930903829', 'ergonomic-marble-pants', 'Libero illum consequatur error dolorum iusto quia in. Ratione minus quibusdam quaerat mollitia consequatur sed fuga.', 3020.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1812, 'Intelligent Paper Chair', '1011871697397', 'intelligent-paper-chair', 'Magni possimus incidunt eligendi esse. Tempora necessitatibus dignissimos aut ut qui non.', 116.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1813, 'Sleek Linen Chair', '2430506381965', 'sleek-linen-chair', 'Minima nam fuga et alias sed esse vel. Itaque id vel velit eos.', 2275.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1814, 'Incredible Cotton Clock', '0770800892234', 'incredible-cotton-clock', 'Non amet quia voluptates natus molestiae cum. Dolorum ut molestias necessitatibus suscipit corporis praesentium.', 1201.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1815, 'Durable Concrete Clock', '9314860230790', 'durable-concrete-clock', 'Sint ipsa est blanditiis corporis. Id tempora commodi et aliquid placeat. Similique quaerat facilis a aut est placeat.', 4292.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1816, 'Sleek Aluminum Shirt', '1844014532794', 'sleek-aluminum-shirt', 'Officia sed distinctio doloribus sequi inventore amet. Voluptatibus libero aut quas dolores quos est enim. Aut reprehenderit numquam laboriosam est quod.', 3801.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1817, 'Intelligent Marble Shoes', '9519583710431', 'intelligent-marble-shoes', 'Alias quisquam consequatur atque nemo dolores totam. Omnis cum laborum ut distinctio veritatis dolores. Consectetur sed animi quo.', 4299.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1818, 'Enormous Plastic Table', '7680484110322', 'enormous-plastic-table', 'Id velit nobis sunt et numquam ducimus. Animi error dicta cumque.', 1150.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1819, 'Awesome Bronze Bottle', '2487029978516', 'awesome-bronze-bottle', 'Officiis omnis pariatur nemo qui est. Eaque excepturi alias voluptas unde molestiae dicta.', 4149.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1820, 'Small Steel Watch', '7220996782053', 'small-steel-watch', 'Odit enim fuga illum et cum. Fuga sint deleniti ab illum non amet sit. Voluptates harum suscipit sed illo minima in sequi.', 4339.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1821, 'Ergonomic Iron Shoes', '7543482875764', 'ergonomic-iron-shoes', 'Pariatur commodi mollitia doloribus quia officia repellendus harum. Officia quidem repellat architecto veniam.', 819.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1822, 'Intelligent Silk Bottle', '1696831106890', 'intelligent-silk-bottle', 'Nisi saepe quibusdam ea nostrum et ut laudantium. Ad amet impedit dolore minus quidem.', 3706.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1823, 'Aerodynamic Paper Gloves', '1201458862168', 'aerodynamic-paper-gloves', 'Possimus sed consectetur quaerat atque quia velit illo sunt. Quod mollitia iste voluptas cupiditate dolores praesentium voluptates. Quasi cumque officiis voluptatem itaque doloribus.', 3741.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1824, 'Lightweight Plastic Bench', '5582711365289', 'lightweight-plastic-bench', 'Aliquid possimus aliquid cum natus voluptas. Rerum esse nisi culpa quis sed nam provident aut.', 1164.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1825, 'Gorgeous Bronze Car', '4769813580531', 'gorgeous-bronze-car', 'Accusamus iure ea odio. Ut quia ut est fuga aut modi aliquid.', 1760.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1826, 'Lightweight Steel Computer', '9218130711654', 'lightweight-steel-computer', 'Labore non facere tempora aliquid labore consequatur beatae. Tempora est dolorum quisquam fugit nulla.', 3687.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1827, 'Heavy Duty Linen Shoes', '9309324167866', 'heavy-duty-linen-shoes', 'Aut quo deleniti temporibus dolores aliquid et consequatur. Ducimus quos et aut quos molestias culpa. Optio delectus alias adipisci molestias harum.', 3097.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1828, 'Heavy Duty Wooden Shoes', '3057903319507', 'heavy-duty-wooden-shoes', 'Minima omnis tenetur voluptatem facilis ea officia. Numquam ut possimus earum velit enim.', 1816.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1829, 'Mediocre Paper Hat', '2692834358716', 'mediocre-paper-hat', 'Alias qui id ut cumque perferendis. Earum et eaque quidem provident animi sit reiciendis eligendi.', 3603.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1830, 'Ergonomic Wooden Wallet', '9753881914874', 'ergonomic-wooden-wallet', 'Optio est repellendus sit suscipit. Ut tempore delectus non eveniet earum. Laborum assumenda nesciunt labore iusto est.', 3901.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1831, 'Fantastic Aluminum Knife', '9901644637014', 'fantastic-aluminum-knife', 'Repudiandae velit dignissimos sit ut eum enim nisi illum. Omnis dolor est qui similique ut.', 2060.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1832, 'Awesome Marble Gloves', '2883542858456', 'awesome-marble-gloves', 'Perferendis natus inventore quia nostrum fugit aut necessitatibus. Soluta mollitia rem aut ullam in autem.', 2724.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1833, 'Small Iron Wallet', '7948405834680', 'small-iron-wallet', 'Voluptatum repudiandae iste quo aut expedita aspernatur molestias. Voluptas nam ut perspiciatis sed consequatur. Quidem distinctio dolor sit.', 3853.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1834, 'Mediocre Bronze Gloves', '8728459731727', 'mediocre-bronze-gloves', 'Suscipit consequuntur qui omnis nam est omnis nobis. Suscipit dolore aut in enim ab similique ut. Ut sapiente laborum fuga ducimus voluptates nihil ut officiis.', 1900.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1835, 'Ergonomic Linen Coat', '8881699289158', 'ergonomic-linen-coat', 'Et in magnam et animi. Esse pariatur dolorum soluta tenetur.', 4539.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1836, 'Ergonomic Steel Wallet', '9014766983607', 'ergonomic-steel-wallet', 'Et iure aut debitis ullam sed. Consequuntur dolor modi nam eius ipsam quis.', 2545.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1837, 'Gorgeous Cotton Hat', '6643866652415', 'gorgeous-cotton-hat', 'Dolores inventore ut accusamus dignissimos. Voluptatibus itaque quod iure.', 1845.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1838, 'Sleek Iron Gloves', '0647574525210', 'sleek-iron-gloves', 'Ad qui enim provident eligendi eligendi nam ad nihil. Accusamus aut doloremque quam veritatis non totam ea.', 1934.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1839, 'Intelligent Wooden Bag', '6752901659170', 'intelligent-wooden-bag', 'Reprehenderit qui modi quia amet. Rerum incidunt sequi velit distinctio asperiores.', 3827.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1840, 'Practical Cotton Hat', '4865020753734', 'practical-cotton-hat', 'Rerum illo a voluptatibus cumque asperiores debitis ipsum. Neque magni laboriosam modi explicabo alias neque.', 1736.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1841, 'Incredible Marble Wallet', '8415907259253', 'incredible-marble-wallet', 'Tempora nihil inventore quae sit repellendus autem enim. Officiis autem et numquam perferendis. Omnis odio iure necessitatibus voluptas velit minima.', 2104.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1842, 'Practical Wooden Gloves', '1309040314054', 'practical-wooden-gloves', 'Nobis quod distinctio fuga expedita praesentium. Eum rerum deserunt omnis quaerat culpa optio.', 2952.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1843, 'Ergonomic Concrete Hat', '9371711645202', 'ergonomic-concrete-hat', 'Est cupiditate est nobis fugit odit aliquid. Nemo quis ut ut necessitatibus nesciunt nemo minus sequi. Maiores consectetur sunt et adipisci sed odit.', 47.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1844, 'Practical Concrete Knife', '7172410227490', 'practical-concrete-knife', 'Voluptates fuga aut id. Quo voluptatum aut ut doloribus libero.', 3390.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1845, 'Heavy Duty Marble Knife', '0069527891287', 'heavy-duty-marble-knife', 'Voluptate vel debitis accusantium enim dolore deserunt. Non qui ipsa natus eius et minima. Quae non et aut.', 567.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1846, 'Awesome Wooden Shoes', '3879992489486', 'awesome-wooden-shoes', 'Placeat rem maiores iure officia est illo eos dignissimos. Occaecati doloremque placeat est est qui inventore. Non eos quibusdam facere sint distinctio similique accusantium.', 3446.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1847, 'Fantastic Granite Hat', '8610268615278', 'fantastic-granite-hat', 'Culpa necessitatibus voluptas sed aperiam iste consectetur sint. Dolorum accusantium ut ullam ad. Ea accusantium soluta enim id ea laudantium.', 734.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1848, 'Rustic Aluminum Hat', '7435386887663', 'rustic-aluminum-hat', 'Dolorum ut et tempora. Nesciunt possimus vel in voluptate molestiae inventore. Eum molestiae esse provident et consequatur mollitia.', 3982.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1849, 'Fantastic Granite Pants', '0886038877896', 'fantastic-granite-pants', 'Neque placeat sit eligendi ut reiciendis. Vero alias nemo sunt libero sit. Illo molestiae eum dolores.', 2747.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1850, 'Rustic Silk Shirt', '3347433722183', 'rustic-silk-shirt', 'Voluptatem deleniti aliquid sed dolores illum aut officiis. Quae quia ipsum voluptatem labore voluptatem dignissimos.', 1068.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1851, 'Incredible Bronze Hat', '9348232672796', 'incredible-bronze-hat', 'Officia beatae id eius quasi consequuntur tenetur facere voluptatem. Sunt eos consequuntur assumenda neque laudantium. Fuga nam minima nostrum neque sapiente.', 406.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1852, 'Sleek Wool Computer', '7341664296983', 'sleek-wool-computer', 'Corrupti mollitia aut earum quae. Officiis enim corrupti maxime sit nobis.', 291.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1853, 'Mediocre Aluminum Lamp', '1041338636652', 'mediocre-aluminum-lamp', 'Nemo vero nam velit provident officiis. Qui aliquam qui omnis dolorum sit. Porro repudiandae quas dolores maxime voluptatem quo adipisci.', 3880.36, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1854, 'Synergistic Granite Car', '8410458080646', 'synergistic-granite-car', 'Eum non accusantium rerum omnis. Aspernatur fugit omnis molestias.', 4390.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1855, 'Enormous Copper Hat', '9639308995902', 'enormous-copper-hat', 'Id non ex et non odio nam. Est libero pariatur dolorum ad inventore dolores. Aperiam rerum blanditiis eos sapiente.', 3777.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1856, 'Fantastic Paper Clock', '9394791503347', 'fantastic-paper-clock', 'Itaque odit quia cupiditate culpa. Laborum quaerat qui quo quae occaecati et delectus. Temporibus eum quis ipsam excepturi nisi est.', 4866.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1857, 'Gorgeous Concrete Table', '9486668588073', 'gorgeous-concrete-table', 'Quisquam in autem iusto omnis exercitationem. Sequi alias hic dolor ut sequi.', 2367.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1858, 'Incredible Rubber Lamp', '1040110100848', 'incredible-rubber-lamp', 'Alias veritatis esse rerum ut veritatis. Consequatur iure aspernatur dolorem alias enim repellat ex adipisci.', 3599.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1859, 'Small Rubber Plate', '6986664480157', 'small-rubber-plate', 'Amet ipsa mollitia consequatur ut eligendi quisquam iure qui. Delectus totam enim quibusdam alias quia. Quia tempora et quisquam amet.', 2732.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1860, 'Durable Paper Car', '7028444950395', 'durable-paper-car', 'Laudantium debitis sit porro. Sapiente nulla excepturi quis.', 2511, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1861, 'Heavy Duty Marble Keyboard', '6439554180410', 'heavy-duty-marble-keyboard', 'In quae soluta explicabo quos. Sit quo aut aliquam blanditiis vero molestias. Ullam dignissimos rem facere est.', 4566.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1862, 'Ergonomic Steel Watch', '8959285695215', 'ergonomic-steel-watch', 'Omnis sit ut rem mollitia est ipsa. Qui molestias a laboriosam harum architecto aut eaque.', 4022.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1863, 'Aerodynamic Marble Bottle', '1209875990297', 'aerodynamic-marble-bottle', 'Perspiciatis quibusdam aut ducimus nulla. Est cumque sit rerum corrupti mollitia nam. Porro sit dolor nobis repellat rerum.', 1533.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1864, 'Lightweight Bronze Gloves', '3445396422901', 'lightweight-bronze-gloves', 'Consequuntur exercitationem quia ab ipsum qui sunt ut. Minus tenetur dolores est iure.', 4833.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1865, 'Ergonomic Cotton Table', '5426810306319', 'ergonomic-cotton-table', 'Nihil hic dolores officia perspiciatis modi. Non sunt magnam temporibus eligendi placeat consequatur temporibus. Nesciunt omnis labore sint.', 4826.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1866, 'Small Rubber Lamp', '9883067875887', 'small-rubber-lamp', 'Expedita est autem assumenda optio. Asperiores in non et non amet ratione libero. Qui voluptatem id quo vel et voluptatem voluptas.', 2639.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1867, 'Fantastic Rubber Gloves', '4700749529379', 'fantastic-rubber-gloves', 'Incidunt sint minima deserunt eius. Sit recusandae repudiandae quos sed officia. Ipsa minus optio omnis.', 4839.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1868, 'Practical Copper Clock', '4908185359363', 'practical-copper-clock', 'Veniam dolorem id inventore illo minima. Consequatur ad sint molestias.', 1188.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1869, 'Small Wooden Clock', '8295295583679', 'small-wooden-clock', 'Aspernatur aut consectetur vitae repellat eos minima reprehenderit qui. Laboriosam debitis voluptatibus ipsam aut.', 4736.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1870, 'Fantastic Concrete Knife', '0297674330742', 'fantastic-concrete-knife', 'Reiciendis voluptates minima minus nostrum esse. Tempora consequatur esse iure qui at velit ut. Voluptate sit porro eum corporis velit ab quos cum.', 480.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1871, 'Small Steel Shirt', '7404597804400', 'small-steel-shirt', 'Vero dignissimos quo ipsum dolor. Sunt vel quia qui molestias sit inventore illo. Odit et commodi aliquam illo et consequatur.', 3591.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1872, 'Awesome Paper Watch', '4995083827759', 'awesome-paper-watch', 'Sint beatae velit libero recusandae facilis nemo. Voluptatem dignissimos ut odit labore sit harum debitis est.', 1778.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1873, 'Ergonomic Wooden Pants', '1273817391305', 'ergonomic-wooden-pants', 'Qui saepe itaque temporibus quis quaerat. Et consequatur sunt perspiciatis consequatur nisi et. Reiciendis voluptatem id inventore omnis.', 1528.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1874, 'Ergonomic Linen Keyboard', '9717486369828', 'ergonomic-linen-keyboard', 'Eos est dolores optio quisquam similique. Corporis tenetur aut sint asperiores architecto ullam.', 4121.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1875, 'Aerodynamic Leather Clock', '0498911552181', 'aerodynamic-leather-clock', 'Modi reiciendis repudiandae sed veniam. Placeat dolores tempore est omnis accusantium autem iure saepe.', 544.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1876, 'Mediocre Wooden Car', '8547821799635', 'mediocre-wooden-car', 'Itaque unde blanditiis reprehenderit dolor qui. Et voluptate consequatur molestiae explicabo ut saepe ipsum. Nemo sint nisi suscipit commodi.', 4768.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1877, 'Rustic Marble Plate', '5595750391935', 'rustic-marble-plate', 'Fugiat laboriosam recusandae dolorum veniam ad eos unde. Saepe incidunt hic rerum deserunt enim saepe hic.', 2587.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1878, 'Mediocre Paper Plate', '9544625479311', 'mediocre-paper-plate', 'Id nostrum odio consequatur illum dolorum. Repellendus voluptatem delectus fugiat et maxime.', 72.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1879, 'Awesome Plastic Chair', '3540373616509', 'awesome-plastic-chair', 'Accusantium et accusamus omnis. Vero hic magni impedit tempore et et quia. Et molestias et qui quae id facere.', 4119.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1880, 'Lightweight Aluminum Bench', '2743498993208', 'lightweight-aluminum-bench', 'Magnam esse molestias repudiandae quos eum non ab. Molestiae iure amet ut quaerat.', 703.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1881, 'Ergonomic Concrete Knife', '0336068504199', 'ergonomic-concrete-knife', 'Eos voluptatibus voluptatibus in consectetur velit quae. Cupiditate quidem id aut consequuntur vel. Quaerat commodi et illum perspiciatis ut sed expedita.', 4344.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1882, 'Aerodynamic Steel Wallet', '1372280749245', 'aerodynamic-steel-wallet', 'Quos rem saepe consequuntur vel cupiditate quisquam. Culpa et labore et alias. Et nobis nihil corrupti molestiae qui libero rerum.', 4678.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1883, 'Practical Rubber Bench', '0583812553563', 'practical-rubber-bench', 'Expedita odio sed eligendi et dolorem. Perspiciatis quo sed nesciunt neque dolorem dignissimos magni consectetur.', 2636.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1884, 'Fantastic Steel Shirt', '1603065842531', 'fantastic-steel-shirt', 'Reiciendis magnam suscipit voluptatem excepturi ipsam assumenda. Esse nihil velit inventore et est beatae et. Quo asperiores commodi dicta quo voluptates provident.', 3695.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1885, 'Enormous Granite Coat', '6272733249115', 'enormous-granite-coat', 'Odit et eveniet non quos id molestiae voluptatibus ut. Recusandae omnis autem non est voluptas officia quia.', 3938.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1886, 'Enormous Wool Wallet', '2423238674474', 'enormous-wool-wallet', 'Et corrupti hic rerum atque sunt in. Vel ea quas suscipit voluptatem illo rem nam. Sit sit voluptatibus velit nulla alias officia esse.', 2171.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1887, 'Fantastic Copper Computer', '2428269612068', 'fantastic-copper-computer', 'Quis quasi eum ab. Placeat ut aut maxime velit quod.', 3817.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1888, 'Incredible Silk Hat', '6066428604200', 'incredible-silk-hat', 'Explicabo consequatur ea maiores quo distinctio itaque ut. Numquam voluptatem non nobis voluptas sint.', 159.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1889, 'Aerodynamic Leather Computer', '0242913478112', 'aerodynamic-leather-computer', 'Deleniti velit temporibus laudantium nihil earum aperiam similique. Culpa doloribus totam quibusdam itaque. Aperiam saepe at veritatis soluta voluptas nihil aut.', 785.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1890, 'Practical Aluminum Plate', '1800951920681', 'practical-aluminum-plate', 'Sequi et fugit sunt. Hic quisquam modi nobis reiciendis in velit qui.', 2255.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1891, 'Enormous Bronze Gloves', '1488536672004', 'enormous-bronze-gloves', 'Voluptas incidunt voluptas maxime porro in ut. Et nostrum consequuntur recusandae veniam dolorem.', 3289.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1892, 'Sleek Iron Bench', '1959677558903', 'sleek-iron-bench', 'Iusto dolore ut dignissimos repudiandae nulla. Maxime veniam magni dolor qui eos explicabo et. Quis rerum assumenda nobis qui quibusdam deserunt.', 3949.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1893, 'Fantastic Wool Bag', '1118291213227', 'fantastic-wool-bag', 'Ut iure maxime rerum consequatur. Consequatur quasi molestiae non fugit eligendi sit. Rerum et perferendis est enim cumque.', 4570.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1894, 'Durable Cotton Shoes', '4218455436794', 'durable-cotton-shoes', 'Amet accusamus commodi non qui explicabo. Distinctio enim perspiciatis deserunt aut molestias. Corrupti assumenda enim eos molestiae quia tempora quisquam impedit.', 3840.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1895, 'Practical Granite Bottle', '3554876613255', 'practical-granite-bottle', 'Sequi molestias voluptatem sit quibusdam maiores in suscipit iste. Voluptatem modi ipsam magnam vero laborum earum ipsa. Eligendi magnam deleniti rem in eveniet autem voluptas.', 657.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1896, 'Durable Marble Pants', '2157666938616', 'durable-marble-pants', 'Magni velit omnis recusandae ipsum. Molestiae quae eveniet minima quia commodi saepe maiores.', 1039.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1897, 'Heavy Duty Linen Gloves', '8452365701412', 'heavy-duty-linen-gloves', 'Aut dolore minima quos qui est omnis. Veritatis deserunt dignissimos dolorem quisquam nihil nihil. Et non et quae distinctio quae quo impedit.', 1916.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1898, 'Sleek Silk Bench', '3366842896124', 'sleek-silk-bench', 'Vel repellendus ex soluta ad deserunt. Non qui hic ipsam. Inventore sint exercitationem recusandae repellat aut quia expedita molestiae.', 229.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1899, 'Rustic Cotton Lamp', '6532807156955', 'rustic-cotton-lamp', 'Ullam sed deleniti laboriosam qui. Natus et quas repellendus eum. Praesentium officiis similique at esse aut quisquam.', 1322.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1900, 'Awesome Leather Hat', '5563620338540', 'awesome-leather-hat', 'Nihil labore non assumenda est dolore. Eum et rerum dolorem aut dolores id.', 3844.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1901, 'Sleek Wool Clock', '2240549505033', 'sleek-wool-clock', 'Architecto qui quas earum aperiam autem mollitia enim. Asperiores velit asperiores quia eum beatae. Quae eum velit voluptatem.', 2183.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1902, 'Enormous Steel Watch', '5489557425828', 'enormous-steel-watch', 'Dolores id accusantium deleniti similique libero. Quos rerum ducimus esse est aliquid esse et veniam.', 4160.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1903, 'Gorgeous Steel Bag', '9915901744636', 'gorgeous-steel-bag', 'Doloribus minima ea sunt qui eum. Exercitationem aut voluptates quasi illo autem est. Doloribus id tempore labore aliquid.', 4462.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1904, 'Practical Rubber Wallet', '2013104871795', 'practical-rubber-wallet', 'Omnis tenetur et architecto consequuntur qui autem. Sequi non aspernatur ipsam ut quos aut voluptatum libero. Voluptates perferendis quos tempore est omnis.', 2306.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1905, 'Durable Cotton Shirt', '4744406678031', 'durable-cotton-shirt', 'Iure eum fugit labore quis dignissimos. Quia consequatur repellendus soluta.', 4010.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1906, 'Enormous Bronze Coat', '7308148731477', 'enormous-bronze-coat', 'Rerum in autem ut placeat. Et reiciendis debitis qui nostrum et.', 2408.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1907, 'Intelligent Concrete Knife', '4408435910707', 'intelligent-concrete-knife', 'Tempora cum repellat et modi alias. Praesentium sit sit ducimus esse omnis. Distinctio officia quod tempore doloribus voluptatibus dicta.', 1177.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1908, 'Fantastic Cotton Chair', '7646835639911', 'fantastic-cotton-chair', 'Consequuntur id esse quaerat recusandae sed enim eos. Et expedita molestias maxime occaecati. Tenetur sed unde quidem sed.', 4162.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1909, 'Lightweight Silk Wallet', '5771107735069', 'lightweight-silk-wallet', 'Molestiae consequatur ipsum aliquam natus. Aut laboriosam rerum voluptatem in est molestiae. Perferendis facere accusamus atque.', 1262.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1910, 'Lightweight Aluminum Computer', '5636509540195', 'lightweight-aluminum-computer', 'Commodi officiis repudiandae impedit velit. Et officiis porro voluptatibus. Distinctio enim enim iure.', 2189.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1911, 'Sleek Linen Clock', '1627426809896', 'sleek-linen-clock', 'Veniam eius labore provident. Corrupti sint libero ut officia omnis ut dolores omnis. Voluptas aut qui et.', 3600.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1912, 'Durable Cotton Car', '5759786823833', 'durable-cotton-car', 'Repudiandae qui aliquam exercitationem est et. Molestiae quod beatae voluptatem corporis corrupti ab.', 3018.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1913, 'Rustic Leather Bench', '1351463897577', 'rustic-leather-bench', 'Est et aperiam aspernatur voluptas velit. Quibusdam praesentium perspiciatis voluptatibus distinctio qui soluta. Cupiditate accusantium eum qui perferendis optio quia dolorum.', 1943.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1914, 'Gorgeous Bronze Shoes', '3972571719209', 'gorgeous-bronze-shoes', 'Iure praesentium nesciunt sint. Id nam maxime a et illum. Quis incidunt aut assumenda et in magnam minus totam.', 1725.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1915, 'Synergistic Granite Clock', '0774512501026', 'synergistic-granite-clock', 'Neque ea temporibus incidunt tempore est aut. Laudantium debitis commodi reprehenderit repellat quos. Adipisci occaecati odio odit commodi omnis est.', 125.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1916, 'Durable Silk Gloves', '0382421609766', 'durable-silk-gloves', 'Et minima dolores itaque deleniti. Quis exercitationem saepe quia mollitia ab.', 2861.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1917, 'Practical Aluminum Shirt', '1026187578698', 'practical-aluminum-shirt', 'Fugiat aut a exercitationem sed ipsam. Amet vero quibusdam dignissimos.', 2004, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1918, 'Aerodynamic Rubber Shoes', '8626578774321', 'aerodynamic-rubber-shoes', 'Incidunt ut nihil molestiae ut. Ad quis praesentium autem architecto nulla sit vero. Hic molestiae quas in officia.', 3337.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1919, 'Intelligent Wool Plate', '8994005331042', 'intelligent-wool-plate', 'Et et et aut accusantium. Ipsa illo suscipit voluptates.', 4783.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1920, 'Synergistic Wool Table', '2887508802538', 'synergistic-wool-table', 'Sint quis assumenda voluptatem autem. Iste eum sit magnam impedit incidunt doloremque tempore. Tenetur repudiandae facere placeat quia.', 2801.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1921, 'Intelligent Rubber Car', '4148586612845', 'intelligent-rubber-car', 'Aspernatur qui atque quia dolor qui consequatur. Illum qui aspernatur placeat odio fuga voluptatem. Corporis et et voluptatem ut aliquam consequatur sit voluptatibus.', 2085.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1922, 'Incredible Wooden Bag', '0789584184930', 'incredible-wooden-bag', 'Incidunt sint accusantium et sunt. Nostrum eius inventore eum est. Est non consequuntur eaque qui et.', 1793.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1923, 'Synergistic Bronze Watch', '9420714525070', 'synergistic-bronze-watch', 'Nisi alias facilis illum repellat consequatur placeat. Et dolorum beatae autem occaecati autem reiciendis.', 4051.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1924, 'Aerodynamic Concrete Pants', '9119517977239', 'aerodynamic-concrete-pants', 'Minima exercitationem et est aut dolores veniam. Voluptatibus repudiandae enim nemo. Voluptatem quibusdam labore et aut provident maxime.', 3446.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1925, 'Rustic Linen Hat', '6989355509014', 'rustic-linen-hat', 'In adipisci temporibus quam. Sint eligendi aperiam magni pariatur sit earum beatae. Ipsam aut quos commodi nemo aut quas.', 3542.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1926, 'Gorgeous Copper Keyboard', '4175643184083', 'gorgeous-copper-keyboard', 'Tempora sapiente blanditiis natus suscipit facere. Totam a voluptatibus et debitis quam. Aut voluptatem sapiente accusantium voluptates voluptatem.', 937.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1927, 'Enormous Cotton Wallet', '2194206076414', 'enormous-cotton-wallet', 'Dolores dolorem error qui atque et est consectetur sunt. Suscipit aliquid repudiandae quo quo inventore.', 1148.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1928, 'Small Plastic Plate', '5453403469908', 'small-plastic-plate', 'Accusantium deleniti totam tempora sed dolor. Est cupiditate cumque doloremque laborum doloremque eligendi enim. Tenetur aliquid nihil est vel sed.', 2004.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1929, 'Ergonomic Iron Table', '8203539898663', 'ergonomic-iron-table', 'Voluptas qui molestiae qui dicta tempora in. Et commodi quae dicta veritatis.', 2349.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1930, 'Synergistic Rubber Bottle', '9368028750200', 'synergistic-rubber-bottle', 'Est omnis voluptas modi nemo quia. Ex sit cupiditate aut. Voluptate ratione id omnis iste vel enim.', 4296.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1931, 'Aerodynamic Rubber Bench', '4769558551070', 'aerodynamic-rubber-bench', 'Illum non deserunt temporibus saepe quia quo. Maxime qui quam est architecto eum.', 2149.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1932, 'Ergonomic Steel Plate', '6192301126948', 'ergonomic-steel-plate', 'Nam odit soluta rem consequatur aliquam voluptates molestiae. Et reiciendis alias voluptatem recusandae.', 2421.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1933, 'Ergonomic Copper Bottle', '7185012062055', 'ergonomic-copper-bottle', 'Et dolorum earum porro illo eum. Laudantium voluptatem voluptate sint veritatis accusantium dignissimos et eum.', 3979.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1934, 'Durable Silk Shirt', '4043925077685', 'durable-silk-shirt', 'Culpa esse consectetur consequatur voluptas vel. Velit ratione laudantium ea nulla. Expedita animi non fugit similique.', 1175.88, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1935, 'Awesome Granite Shoes', '8725060736042', 'awesome-granite-shoes', 'Nostrum eius cum omnis nulla. Vel expedita odit explicabo. Itaque ut eaque voluptas reprehenderit.', 701.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1936, 'Synergistic Paper Shoes', '0479990186429', 'synergistic-paper-shoes', 'Doloribus numquam rerum quis veritatis. Similique voluptas et accusamus. Atque natus voluptatibus cupiditate et veritatis quidem.', 2737.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1937, 'Fantastic Bronze Plate', '7955486180483', 'fantastic-bronze-plate', 'Accusantium occaecati aut qui corporis ipsa non perspiciatis enim. Enim nihil voluptatem officia eligendi. A doloremque accusamus dolorem iure qui.', 2106.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1938, 'Rustic Marble Keyboard', '8171811327906', 'rustic-marble-keyboard', 'Saepe enim est eaque expedita. Voluptatum necessitatibus illum in itaque. Est voluptate voluptatem voluptatum eos dicta.', 4092.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1939, 'Enormous Aluminum Coat', '7101976650213', 'enormous-aluminum-coat', 'Nihil facere illo inventore laboriosam voluptate. Esse quisquam dolore in delectus dolorem voluptatem aut.', 1409.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1940, 'Small Linen Bench', '3755908545180', 'small-linen-bench', 'Porro beatae qui veniam architecto. Voluptatem minima enim nisi dolorum non assumenda. Possimus molestiae neque molestias blanditiis corrupti quas vero inventore.', 1124.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1941, 'Incredible Paper Lamp', '5109404221228', 'incredible-paper-lamp', 'Inventore enim ut vitae et. Qui placeat omnis vel sunt consequuntur nihil qui eum. Voluptatem voluptatum est fugit dolor facilis officiis quis ratione.', 3457.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1942, 'Enormous Steel Lamp', '3112196954375', 'enormous-steel-lamp', 'Optio exercitationem iure inventore quos. Quia odio ut dicta.', 4898.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1943, 'Gorgeous Steel Gloves', '6184825392367', 'gorgeous-steel-gloves', 'Natus minus voluptatibus aliquam totam quibusdam. Amet incidunt voluptas et nisi. Inventore delectus voluptates deleniti officiis.', 3829.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1944, 'Synergistic Leather Shoes', '0379707066221', 'synergistic-leather-shoes', 'Quo veritatis reprehenderit et delectus consectetur. Neque rerum facilis quidem culpa ut exercitationem omnis.', 1418.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1945, 'Sleek Granite Clock', '9236083536834', 'sleek-granite-clock', 'Expedita maiores iure ipsam id pariatur sunt ipsam. Qui et molestiae neque dolorem. Quia tempora voluptas ipsum eius eos odit.', 443.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1946, 'Enormous Iron Wallet', '9191816292862', 'enormous-iron-wallet', 'Corporis magni expedita et consequuntur. Perspiciatis quia minima officiis ut corrupti sequi.', 2287.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1947, 'Intelligent Silk Table', '4065784156936', 'intelligent-silk-table', 'Eligendi et consequuntur doloribus voluptatem rem omnis velit animi. Eligendi voluptas dolorem alias voluptatum non consequuntur.', 1772.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1948, 'Fantastic Granite Knife', '6805070471149', 'fantastic-granite-knife', 'Excepturi ut id explicabo voluptate atque. Dolor et repellat consequatur adipisci. Soluta beatae fugiat dicta error minus aliquam.', 1486.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1949, 'Mediocre Linen Wallet', '6078984425984', 'mediocre-linen-wallet', 'Quod sit illum eos cum ipsum. Et doloribus quas omnis blanditiis aut. Natus delectus laborum ut qui.', 3960.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1950, 'Sleek Plastic Bottle', '0859269950324', 'sleek-plastic-bottle', 'Debitis omnis optio repudiandae fugiat. Dolores et dolor dolorum ea harum blanditiis. Itaque ut eum mollitia molestias deleniti.', 2357.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1951, 'Heavy Duty Iron Bottle', '1502093542072', 'heavy-duty-iron-bottle', 'Architecto incidunt quidem iure iusto vel adipisci enim. Aut et iure quia similique exercitationem cupiditate consequuntur.', 2892.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1952, 'Enormous Concrete Hat', '4337417339925', 'enormous-concrete-hat', 'Dicta numquam nulla maiores eaque molestias placeat et. Dolor laboriosam sed sunt nihil.', 1352.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1953, 'Fantastic Silk Bottle', '8578438875832', 'fantastic-silk-bottle', 'Totam esse porro ratione voluptates est praesentium. Delectus enim voluptatem aut aut. Qui fugit quis facilis doloremque consequatur reprehenderit.', 3552.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1954, 'Fantastic Aluminum Wallet', '0088904964451', 'fantastic-aluminum-wallet', 'Voluptatibus et voluptas enim cum nihil consequuntur mollitia commodi. Numquam sint doloribus corrupti fuga.', 840.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1955, 'Heavy Duty Linen Pants', '8373708722539', 'heavy-duty-linen-pants', 'Maxime tenetur maiores quo quia consequatur mollitia eligendi asperiores. Tempore facilis facere unde similique est deleniti.', 3499.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1956, 'Aerodynamic Silk Gloves', '7470920819526', 'aerodynamic-silk-gloves', 'Occaecati consequatur odit consequatur quos iste. Est expedita molestiae quis aut omnis.', 1639.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1957, 'Awesome Leather Wallet', '5535798066600', 'awesome-leather-wallet', 'Consequatur modi ut recusandae facilis. Sed rem in in similique suscipit voluptatem aliquid. Atque quae odio qui nesciunt voluptatem fuga.', 4979.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1958, 'Ergonomic Aluminum Bottle', '9617396643639', 'ergonomic-aluminum-bottle', 'Natus et eos quidem ipsa sit. Ipsa ducimus dolorum voluptatem quis ipsam consequatur.', 1690.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1959, 'Intelligent Cotton Shirt', '8111973360786', 'intelligent-cotton-shirt', 'Amet earum occaecati non quibusdam nisi id illum. Amet temporibus at molestiae voluptatem voluptate.', 508.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1960, 'Durable Cotton Bench', '1936299074899', 'durable-cotton-bench', 'Quidem qui aperiam est nemo. Qui temporibus esse possimus maxime sit debitis.', 1498.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1961, 'Fantastic Linen Shoes', '3097771979045', 'fantastic-linen-shoes', 'Nesciunt ut ea nostrum quo exercitationem. Perferendis aperiam non et ut quo quaerat animi. Inventore ea quo dolorem totam hic hic blanditiis nam.', 1123.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1962, 'Enormous Wool Bench', '9876174697206', 'enormous-wool-bench', 'Quia sit amet sed corporis. Earum eius dolor voluptate veritatis non.', 4763.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1963, 'Synergistic Concrete Keyboard', '9928456013010', 'synergistic-concrete-keyboard', 'Recusandae molestiae aspernatur dolores eveniet non. Autem eos dolores quasi eaque quaerat.', 3302.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1964, 'Rustic Plastic Bench', '9083472469897', 'rustic-plastic-bench', 'Aut ut aut quia quis id quos. Iusto voluptatibus qui aliquid quo numquam.', 3379, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1965, 'Heavy Duty Rubber Wallet', '2507043832066', 'heavy-duty-rubber-wallet', 'Dicta et rem tenetur consectetur voluptatem quas repellat. Praesentium sit quo consequuntur tenetur placeat. Dignissimos non est numquam consequatur totam qui recusandae.', 1435.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1966, 'Sleek Aluminum Shoes', '8717792472145', 'sleek-aluminum-shoes', 'Autem porro libero quod sunt officiis. Possimus rerum non aliquam qui quae saepe. Accusantium sed et magni aut molestiae.', 1244.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1967, 'Enormous Aluminum Car', '8460811281142', 'enormous-aluminum-car', 'Qui nihil neque ipsa et corporis quod reprehenderit. Veniam impedit consequatur nam inventore fugiat et nemo. Ex praesentium saepe nobis voluptas quia id voluptatem.', 2879.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1968, 'Fantastic Rubber Chair', '2345198192174', 'fantastic-rubber-chair', 'Excepturi autem inventore vero a. Quibusdam occaecati eos eius eligendi mollitia. Autem eaque ut facilis officiis voluptatem similique a.', 1924.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1969, 'Durable Silk Knife', '3657567058158', 'durable-silk-knife', 'Nemo aspernatur eum soluta error. Dolore sunt quibusdam dolor distinctio voluptatibus aut quidem.', 4982.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1970, 'Heavy Duty Silk Lamp', '2709374894335', 'heavy-duty-silk-lamp', 'Culpa odit ut a recusandae eum possimus adipisci. Atque rerum omnis autem fugiat omnis aut excepturi. Corporis aliquam voluptatibus odit autem nostrum quam enim.', 2666.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1971, 'Sleek Granite Chair', '6409534965719', 'sleek-granite-chair', 'Minima sit et distinctio sint sunt. Rem ut animi cum voluptatem. Assumenda expedita reiciendis est eum perferendis.', 1818.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1972, 'Awesome Linen Keyboard', '0340370971020', 'awesome-linen-keyboard', 'Voluptatem amet cum blanditiis ex ut. Aspernatur laboriosam dolorem eum et.', 1725.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1973, 'Fantastic Leather Bench', '6955260121795', 'fantastic-leather-bench', 'Earum tenetur consequuntur pariatur qui harum. Harum eius qui repellendus soluta. Aut architecto laborum cum aperiam dolor.', 4972.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1974, 'Sleek Wooden Pants', '6656158980615', 'sleek-wooden-pants', 'Ea dolor ipsa officiis quos. Neque eos exercitationem nihil doloribus autem quaerat.', 485.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1975, 'Lightweight Plastic Chair', '6802139471706', 'lightweight-plastic-chair', 'Corporis omnis possimus ab. Dolores eius voluptas rerum quibusdam ipsam in corrupti. Sapiente corrupti quaerat officia explicabo minima.', 2333.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1976, 'Rustic Silk Plate', '4497970086299', 'rustic-silk-plate', 'Autem qui assumenda itaque possimus. Non minima sapiente a aliquid maiores.', 712.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1977, 'Small Steel Table', '0974669115064', 'small-steel-table', 'Expedita dolorem expedita sunt et. Iste molestiae hic in neque.', 644.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1978, 'Awesome Iron Bench', '1225524634978', 'awesome-iron-bench', 'Officiis corrupti consequatur minus et voluptate sit. Explicabo amet architecto dolores architecto.', 103.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1979, 'Aerodynamic Bronze Clock', '5013335877785', 'aerodynamic-bronze-clock', 'Magni nihil commodi soluta culpa. Et ab voluptas commodi et sed. Ut dolor voluptas quasi sint vitae.', 4791.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1980, 'Sleek Concrete Bottle', '3432723753777', 'sleek-concrete-bottle', 'Doloribus cupiditate placeat et vitae commodi. Ut nobis quam qui optio voluptatem nobis atque. Animi sequi pariatur dignissimos repellat magni expedita.', 602.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1981, 'Intelligent Wool Table', '4053845509968', 'intelligent-wool-table', 'At sequi occaecati fugit maxime veritatis. Nam delectus molestiae fuga facere nemo et consequatur ut.', 225.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1982, 'Fantastic Steel Chair', '7109977337089', 'fantastic-steel-chair', 'Facilis quia inventore minus consequatur. Aut vel ipsa ad animi.', 4415.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1983, 'Awesome Aluminum Shoes', '2610805780052', 'awesome-aluminum-shoes', 'Voluptatem veritatis error et laboriosam. Hic ratione dolor reprehenderit dolores molestias magni commodi. Assumenda tenetur tempora itaque facere praesentium sed.', 1913.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1984, 'Ergonomic Linen Chair', '9071880641660', 'ergonomic-linen-chair', 'Temporibus ut cumque qui cumque. Dolore autem molestias odio quod quia doloribus odit.', 3314.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1985, 'Lightweight Granite Lamp', '6270681345842', 'lightweight-granite-lamp', 'Aliquid et quia rerum. Rerum et explicabo laborum impedit.', 4000.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1986, 'Gorgeous Cotton Gloves', '5421093826370', 'gorgeous-cotton-gloves', 'Explicabo sit dolor aperiam quaerat. Eveniet est et provident molestiae.', 2765.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1987, 'Lightweight Silk Table', '2101812741117', 'lightweight-silk-table', 'Cumque ex incidunt eveniet natus quia. Et perferendis unde labore sit porro quaerat possimus. Officiis molestiae consectetur rem veniam nihil et.', 4201.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1988, 'Mediocre Silk Chair', '9750791521000', 'mediocre-silk-chair', 'Quibusdam sunt possimus accusantium earum molestiae in praesentium. Veritatis repudiandae animi et libero et ad consequatur. Porro enim qui voluptas assumenda blanditiis facere.', 4407.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1989, 'Sleek Granite Shirt', '5445705417831', 'sleek-granite-shirt', 'Soluta odio non modi fugiat. Dolorem deleniti quibusdam doloribus soluta aspernatur. Non sint voluptas a et id sunt placeat.', 3322.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1990, 'Ergonomic Plastic Bench', '8699104674150', 'ergonomic-plastic-bench', 'Cupiditate laborum ut veniam qui. Iure id omnis velit id sint.', 1442.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1991, 'Lightweight Linen Hat', '4204952967671', 'lightweight-linen-hat', 'Voluptas est non tenetur laboriosam quos dolores. Facilis maiores rem excepturi iste.', 1470.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1992, 'Aerodynamic Wooden Lamp', '0255557695050', 'aerodynamic-wooden-lamp', 'Et beatae id amet alias id et distinctio dolores. Vero sit facere qui sint eligendi. Et excepturi dolores commodi quos autem ut ipsam.', 1482.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1993, 'Heavy Duty Concrete Wallet', '7666395853763', 'heavy-duty-concrete-wallet', 'Ad et vitae voluptates qui dicta veniam. Quam aut ut quis aut. Dicta fugiat atque et dolore esse error aliquid.', 4426.03, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1994, 'Small Paper Bench', '4847217786275', 'small-paper-bench', 'Omnis pariatur sunt nobis porro qui. At suscipit eius eum optio.', 779.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1995, 'Awesome Steel Bottle', '7457414355920', 'awesome-steel-bottle', 'Beatae repudiandae numquam et aspernatur voluptatem est nihil. Voluptatem ipsum illum illum id et. Et error recusandae et nulla.', 2935.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1996, 'Intelligent Paper Table', '5598545725014', 'intelligent-paper-table', 'Non error reiciendis eligendi fuga ut eligendi rerum. Totam ex animi voluptatum quo nesciunt.', 2244.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1997, 'Rustic Copper Lamp', '4408895230100', 'rustic-copper-lamp', 'In sit dolorem molestiae quidem natus. Ex recusandae ut rem saepe hic eius assumenda adipisci. Qui rerum occaecati iusto sed.', 1304.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1998, 'Lightweight Linen Table', '3580133670327', 'lightweight-linen-table', 'Sit dolorem cumque voluptatem amet doloremque accusamus dolore animi. Nisi iusto aspernatur provident ea placeat nesciunt.', 3279.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(1999, 'Sleek Steel Gloves', '3844854918688', 'sleek-steel-gloves', 'Dolores voluptas sit odit dolorum facilis reprehenderit ut eveniet. Rerum culpa consequuntur omnis.', 2876.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2000, 'Heavy Duty Marble Watch', '0426354988090', 'heavy-duty-marble-watch', 'Deserunt omnis odit omnis laborum ea. Esse ea facilis consequatur assumenda neque.', 886.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2001, 'Intelligent Bronze Gloves', '3197268057871', 'intelligent-bronze-gloves', 'Molestiae expedita quia eum vitae cupiditate delectus eos placeat. Laborum aliquam voluptatem voluptas a ipsum quae. Blanditiis ea est non qui dolore nobis vel inventore.', 1393.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2002, 'Heavy Duty Bronze Bottle', '9130448833562', 'heavy-duty-bronze-bottle', 'Ut veritatis repudiandae magnam ex. Ut officia tempora autem illum suscipit.', 2145.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2003, 'Incredible Linen Coat', '2444421463750', 'incredible-linen-coat', 'Voluptatibus et et atque aut eveniet explicabo omnis. Error qui magni ipsam qui ducimus corporis.', 344.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2004, 'Practical Steel Gloves', '6190059905884', 'practical-steel-gloves', 'Neque sapiente rerum dolores deleniti quod inventore sit omnis. Est in modi illum.', 4074.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2005, 'Awesome Aluminum Shirt', '0657578189851', 'awesome-aluminum-shirt', 'Voluptas neque debitis enim earum. Et veritatis nisi est inventore nihil. Aut repellat odio rerum perspiciatis tempore.', 2128.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2006, 'Lightweight Linen Pants', '7477818266073', 'lightweight-linen-pants', 'Ut dolores harum in. Quisquam qui suscipit dolor officiis eveniet non. Velit quos non et et aliquid quos.', 3619.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2007, 'Enormous Paper Plate', '5629598552330', 'enormous-paper-plate', 'Aut est possimus odit est dolores. Quasi porro ut id. Ut consectetur est adipisci tenetur numquam amet.', 2268.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2008, 'Mediocre Plastic Coat', '7175272785719', 'mediocre-plastic-coat', 'Omnis harum molestiae odio ea beatae rerum rem quasi. Voluptas ut possimus et officia nihil laborum ut. Dolorem sit et id in voluptatem ea suscipit.', 3912.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2009, 'Ergonomic Bronze Knife', '3170733320540', 'ergonomic-bronze-knife', 'Nam et repudiandae repudiandae nulla reprehenderit. Voluptas sequi quisquam placeat animi. Voluptatem ducimus repellat alias.', 1931.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2010, 'Rustic Concrete Car', '5331157959015', 'rustic-concrete-car', 'Qui similique voluptate quidem vero. Voluptate vel velit enim ipsam. At voluptas voluptas ipsum voluptates laborum laborum.', 2894.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2011, 'Gorgeous Leather Watch', '4002261952322', 'gorgeous-leather-watch', 'Illo modi sed enim esse accusantium dicta delectus aspernatur. Odio repudiandae corrupti doloribus voluptates eum sed provident.', 3761.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2012, 'Enormous Steel Keyboard', '9388196237587', 'enormous-steel-keyboard', 'Enim saepe rerum et numquam aut molestiae voluptatem. Odio ipsum omnis et quibusdam est ea. Rerum qui doloribus ipsam dolores.', 2620.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2013, 'Rustic Marble Watch', '9043151886117', 'rustic-marble-watch', 'Fugit corrupti voluptates blanditiis consequuntur adipisci. Eos temporibus inventore est at aut at incidunt et. Distinctio pariatur eveniet earum deleniti mollitia quis.', 1389.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2014, 'Rustic Aluminum Table', '2041263152479', 'rustic-aluminum-table', 'Rerum distinctio rerum dolor ad. Earum doloremque provident nisi corporis. Saepe quis provident minima quo voluptatibus sed.', 4618.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2015, 'Incredible Cotton Coat', '1687250614899', 'incredible-cotton-coat', 'A accusantium iusto in nobis suscipit aperiam. Quo quas velit voluptate dolores. Eos sed molestiae exercitationem in qui.', 4106.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2016, 'Sleek Wooden Coat', '1083744037753', 'sleek-wooden-coat', 'Ipsum culpa ea et odit. Explicabo exercitationem doloremque aut.', 2554.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2017, 'Lightweight Silk Chair', '2861121853627', 'lightweight-silk-chair', 'Aut sunt ut omnis voluptate. In sunt commodi quo molestiae quibusdam odio consequuntur. Amet cumque corporis et quam sed accusamus similique dolores.', 992.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2018, 'Practical Concrete Bag', '2020930684956', 'practical-concrete-bag', 'Impedit maiores ab maxime non eum ut. Dolores labore veritatis itaque minima qui eos quia est.', 1548.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2019, 'Sleek Plastic Bag', '1259328227319', 'sleek-plastic-bag', 'Veritatis et illo eaque deserunt porro. Quia assumenda reprehenderit voluptas adipisci.', 1557.98, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2020, 'Intelligent Iron Lamp', '4967363322025', 'intelligent-iron-lamp', 'Non voluptatum recusandae atque culpa necessitatibus et. Asperiores quibusdam voluptas ratione eaque.', 3696.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2021, 'Rustic Leather Knife', '1007818548075', 'rustic-leather-knife', 'Nobis vel hic temporibus ut culpa inventore. Quo dolor aut qui impedit.', 402.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2022, 'Heavy Duty Iron Lamp', '3017894901822', 'heavy-duty-iron-lamp', 'Animi mollitia aut voluptatem. Impedit deleniti et reprehenderit esse suscipit debitis.', 962.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2023, 'Enormous Granite Bottle', '8603909001219', 'enormous-granite-bottle', 'Nihil ut et et itaque perferendis. Consequuntur et excepturi excepturi quia. Iste facere quisquam aut a id sapiente.', 4565.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2024, 'Enormous Copper Bench', '5784870456758', 'enormous-copper-bench', 'Neque et molestiae in maiores. Quisquam quas tempore dicta minima omnis. Quidem reprehenderit delectus eligendi magnam vitae consequatur sunt.', 3758.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2025, 'Gorgeous Leather Bottle', '6529240516989', 'gorgeous-leather-bottle', 'Dolorem corrupti consequatur dolorem animi molestiae qui corrupti. Ex autem delectus saepe rerum. Dignissimos voluptas aut laborum blanditiis itaque est.', 1537.12, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2026, 'Gorgeous Linen Shoes', '1651157013482', 'gorgeous-linen-shoes', 'Sunt enim voluptas omnis aut velit itaque. Ad autem fugiat aut pariatur eos quia. Et suscipit eum tenetur cum excepturi laborum.', 1901.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2027, 'Synergistic Iron Keyboard', '9955827042737', 'synergistic-iron-keyboard', 'Et eos id quia tempore. Ut vel quo ducimus eaque. Quasi natus debitis error.', 2626.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2028, 'Fantastic Linen Car', '6802844935555', 'fantastic-linen-car', 'Esse aut sint quos qui harum quas omnis. Voluptatibus consectetur illo omnis vero. Sint perspiciatis et veritatis consequatur ipsum ut quo.', 1130.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2029, 'Lightweight Copper Bottle', '2235391526992', 'lightweight-copper-bottle', 'Quas voluptatem voluptas eum nulla impedit et laboriosam. Et aperiam commodi maxime ab et ut. Rerum ex ratione adipisci quidem.', 564.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2030, 'Heavy Duty Plastic Plate', '8228102486573', 'heavy-duty-plastic-plate', 'Dicta ut nulla quod ratione ducimus. Et tempora aliquam sed accusamus in harum.', 3028.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2031, 'Fantastic Iron Pants', '2444312165275', 'fantastic-iron-pants', 'Voluptatem aspernatur amet quidem modi eos. Vel reprehenderit aut vel nisi.', 2281.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2032, 'Aerodynamic Concrete Coat', '8055254315525', 'aerodynamic-concrete-coat', 'Et qui quae asperiores doloribus. In culpa eum tenetur aut placeat excepturi qui.', 2023.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(2033, 'Practical Iron Clock', '8185021327922', 'practical-iron-clock', 'Vero asperiores aut quidem amet. Fugiat provident ut molestiae harum.', 3996.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2034, 'Durable Paper Pants', '2746687051222', 'durable-paper-pants', 'Est consequatur necessitatibus id nesciunt iusto. Consequuntur perspiciatis quae vel quis doloribus sint. Voluptatum aperiam qui omnis aliquam.', 4905.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2035, 'Synergistic Concrete Computer', '0543913029084', 'synergistic-concrete-computer', 'Voluptas voluptatem sit quia temporibus. Rem est consequuntur eaque autem architecto itaque dicta.', 1709.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2036, 'Fantastic Silk Knife', '1854349693039', 'fantastic-silk-knife', 'Rerum a officiis aut ea magnam. Aperiam iusto cum occaecati qui ut minus dolor. Quas vitae alias ad est laborum eos similique perspiciatis.', 3758.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2037, 'Intelligent Copper Computer', '9662023288981', 'intelligent-copper-computer', 'Repellendus possimus dolores est. Voluptate quis tenetur eius nulla. Quibusdam repellat ut laudantium.', 1850.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2038, 'Heavy Duty Leather Shirt', '8639358393957', 'heavy-duty-leather-shirt', 'Quas numquam exercitationem autem et libero. Provident et modi natus modi voluptate nam.', 3631.74, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2039, 'Mediocre Aluminum Bottle', '4602665040979', 'mediocre-aluminum-bottle', 'Perferendis reiciendis vel quidem eligendi recusandae quo et. Eaque quibusdam non et nam eius exercitationem. Sed architecto suscipit necessitatibus voluptatem maxime maxime vel et.', 1814.22, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2040, 'Lightweight Rubber Pants', '2812241396983', 'lightweight-rubber-pants', 'Consequatur assumenda velit et sint rerum. Ea eum sint dolorum ut.', 1990.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2041, 'Small Cotton Knife', '8586556164066', 'small-cotton-knife', 'Sit aut et consectetur quas et facere id. Sed facere ea voluptatibus ut.', 4186.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2042, 'Incredible Plastic Gloves', '1999119661761', 'incredible-plastic-gloves', 'Tenetur sint commodi suscipit qui veritatis. Aut aspernatur ullam dolorem suscipit velit sapiente.', 1081.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2043, 'Durable Copper Gloves', '2194517032802', 'durable-copper-gloves', 'Cum quam eos cum placeat. Qui eius quod et. Adipisci non quos architecto nostrum qui et.', 4600.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2044, 'Rustic Marble Shoes', '2556360008074', 'rustic-marble-shoes', 'Possimus quo ut explicabo iste. Quis harum esse placeat vel.', 1486.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2045, 'Aerodynamic Wooden Bottle', '0671948918469', 'aerodynamic-wooden-bottle', 'Pariatur nesciunt illo id blanditiis pariatur. Sint vitae qui repudiandae rem. Autem autem ex nulla provident accusantium quo maiores.', 3065.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2046, 'Heavy Duty Cotton Clock', '3821787744317', 'heavy-duty-cotton-clock', 'Possimus ut dolorem unde quia assumenda. Debitis sed doloremque magnam animi sunt.', 405.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2047, 'Enormous Copper Gloves', '4289880103551', 'enormous-copper-gloves', 'Neque id nulla enim ipsa. Commodi voluptas debitis eaque quidem rerum sed ipsam.', 2029.79, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2048, 'Mediocre Copper Gloves', '2147522369340', 'mediocre-copper-gloves', 'Optio doloremque voluptas ducimus tempora modi numquam autem. Consequatur neque deserunt ducimus enim beatae blanditiis et.', 3359.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2049, 'Lightweight Granite Wallet', '8327886170910', 'lightweight-granite-wallet', 'Sint esse assumenda animi non praesentium perferendis. Accusantium voluptas odio voluptatibus reiciendis ut est neque.', 2153.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2050, 'Practical Paper Bench', '0435401485338', 'practical-paper-bench', 'Voluptatem sint illo aut qui velit. Ut est est maxime quos.', 3974.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2051, 'Incredible Wooden Watch', '2155437238361', 'incredible-wooden-watch', 'Quo similique vel autem qui facilis natus rerum recusandae. Ut alias qui inventore itaque nostrum aut consequatur.', 2294.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2052, 'Gorgeous Aluminum Shoes', '6316384507399', 'gorgeous-aluminum-shoes', 'Eius sunt ut voluptas explicabo autem qui ipsum. Soluta provident perspiciatis ipsum modi pariatur repellat.', 495.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2053, 'Synergistic Copper Chair', '4057101219707', 'synergistic-copper-chair', 'Alias dolorum illum aut enim aut. Eaque excepturi itaque alias velit voluptas.', 4507.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2054, 'Durable Concrete Keyboard', '6769351908215', 'durable-concrete-keyboard', 'Earum nemo earum placeat labore vel. Voluptatem autem consequatur sed non.', 2861.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2055, 'Lightweight Concrete Plate', '7562616520370', 'lightweight-concrete-plate', 'Beatae qui consequatur laborum rerum. Voluptatem fuga quo et.', 3751.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2056, 'Small Leather Pants', '2657084599616', 'small-leather-pants', 'Quia praesentium et accusamus quo. Maiores qui necessitatibus tempora deleniti minus magni ex.', 447.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2057, 'Incredible Iron Computer', '3549270416946', 'incredible-iron-computer', 'Nisi ut vitae odio sapiente eum quia. Autem iure quis consequuntur soluta qui.', 255.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2058, 'Durable Plastic Plate', '1321707548602', 'durable-plastic-plate', 'Eum tempora quibusdam quia. Necessitatibus qui deserunt quo veniam atque. In sint consectetur dolorum voluptate dolores pariatur dolor.', 3128.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2059, 'Awesome Cotton Wallet', '0626505005151', 'awesome-cotton-wallet', 'Eius assumenda voluptas recusandae nihil quidem dolores eos. Corporis est explicabo animi asperiores possimus voluptatem veniam. Non nulla asperiores sunt itaque.', 3922.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2060, 'Rustic Silk Shoes', '5153264027674', 'rustic-silk-shoes', 'Quo aut eligendi quas tempora magni harum. Modi enim saepe quod nisi. Qui quibusdam et voluptate quidem rerum nostrum voluptas a.', 3925.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2061, 'Gorgeous Leather Lamp', '0455612389430', 'gorgeous-leather-lamp', 'Velit dolor illum maxime hic autem. Aliquid nihil sed ullam eum animi cupiditate sed. Aut et voluptatum totam perferendis non voluptate.', 3319.46, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2062, 'Rustic Cotton Wallet', '0347899775443', 'rustic-cotton-wallet', 'Necessitatibus asperiores numquam harum iste tenetur. Aut ut at omnis deserunt. Et deleniti repellendus qui eum veniam id.', 203.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2063, 'Durable Rubber Shirt', '9898970866747', 'durable-rubber-shirt', 'Eveniet expedita aspernatur autem. Commodi aliquid deleniti pariatur ipsam est et in id.', 4303.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2064, 'Gorgeous Concrete Shoes', '1195461454758', 'gorgeous-concrete-shoes', 'Ut atque nihil earum. Molestiae hic et dolore aspernatur dolor blanditiis et.', 2090.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2065, 'Gorgeous Concrete Wallet', '1426591135508', 'gorgeous-concrete-wallet', 'Excepturi possimus sint odit facere. Ipsam corrupti dolores assumenda magni dolorem aut.', 1306.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2066, 'Heavy Duty Marble Gloves', '0039735671827', 'heavy-duty-marble-gloves', 'Nulla magnam ducimus optio molestiae quia maiores. Corrupti enim asperiores et nemo dolores tempora. Quibusdam quia adipisci nihil ea dolor distinctio deleniti.', 125.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2067, 'Enormous Linen Keyboard', '1532130142347', 'enormous-linen-keyboard', 'Officia iure tenetur unde aut. Eos odit rem eum saepe.', 4392.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2068, 'Incredible Granite Pants', '8472185122495', 'incredible-granite-pants', 'Et nostrum repudiandae dolorem consequatur aut. Ex laboriosam ut tenetur.', 4000.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2069, 'Aerodynamic Iron Lamp', '7589725203710', 'aerodynamic-iron-lamp', 'Minus eaque ipsa distinctio ab architecto reiciendis. Iure sunt eaque quos qui enim.', 3585.71, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2070, 'Ergonomic Cotton Plate', '6550535578597', 'ergonomic-cotton-plate', 'Blanditiis omnis nam voluptas esse voluptatibus harum non. Dignissimos laboriosam magnam provident.', 1753.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2071, 'Lightweight Aluminum Pants', '9507778171501', 'lightweight-aluminum-pants', 'Tenetur atque id voluptatibus officiis blanditiis eaque eum. Dolores repudiandae ut dicta.', 1357.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2072, 'Durable Concrete Car', '8125688641832', 'durable-concrete-car', 'Non esse illum illo ut. Est nam aut ullam est fugit perspiciatis voluptatem occaecati.', 1377.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2073, 'Enormous Wooden Bag', '7637611249073', 'enormous-wooden-bag', 'Officiis est molestiae accusantium in. Et est ipsam enim neque. Commodi magnam id et id minima.', 2362.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2074, 'Heavy Duty Concrete Bag', '0534950477976', 'heavy-duty-concrete-bag', 'Voluptas tempora est quia qui asperiores eum. Repellendus non mollitia ut.', 3937.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2075, 'Small Plastic Wallet', '1421778261391', 'small-plastic-wallet', 'Enim blanditiis quibusdam nemo et facere id perspiciatis. Velit eos fugit placeat qui.', 2311.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2076, 'Small Granite Hat', '3380943674917', 'small-granite-hat', 'Quaerat ipsum aut voluptatem repudiandae iusto. At et alias et praesentium.', 3504.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2077, 'Heavy Duty Steel Lamp', '4019440294623', 'heavy-duty-steel-lamp', 'Est minima ipsum velit enim tempore. Explicabo deleniti commodi ut qui.', 313.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2078, 'Rustic Aluminum Lamp', '8013804805957', 'rustic-aluminum-lamp', 'Dolorum ipsam ratione qui. Voluptas qui sed aut commodi facere.', 1222.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2079, 'Heavy Duty Cotton Car', '7160610879700', 'heavy-duty-cotton-car', 'Nesciunt animi aspernatur quod. Minima qui quam aspernatur consequatur optio.', 4047.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2080, 'Mediocre Copper Wallet', '1500663718278', 'mediocre-copper-wallet', 'Vero amet dolore et et impedit. Mollitia est qui consequatur quos assumenda porro.', 4324.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2081, 'Small Steel Bag', '3889699427490', 'small-steel-bag', 'Aspernatur est debitis est. Suscipit ea inventore recusandae.', 1108.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2082, 'Small Wool Computer', '1967053347645', 'small-wool-computer', 'Fugit accusantium alias ea voluptas. Qui error possimus vel ea qui. Aut et numquam eius qui dolor beatae.', 2864.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2083, 'Synergistic Wooden Knife', '5888481970464', 'synergistic-wooden-knife', 'Aliquam ipsum earum minus. Et modi laudantium a natus illo iusto aut. Earum autem voluptatem magni et consequatur praesentium ut.', 3330.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2084, 'Ergonomic Bronze Keyboard', '3692148843242', 'ergonomic-bronze-keyboard', 'Exercitationem qui reiciendis odio quae et rem dolore iure. Qui numquam omnis et et rem praesentium quidem. Qui quasi porro dolor et.', 2486.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2085, 'Heavy Duty Plastic Coat', '6787656571750', 'heavy-duty-plastic-coat', 'Repellat corrupti autem qui tempore hic officia aut et. Aut enim eaque doloremque eligendi et sit tenetur excepturi.', 1199.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2086, 'Mediocre Copper Keyboard', '8010213382802', 'mediocre-copper-keyboard', 'Dolore quis suscipit voluptas. Ab id est et laboriosam.', 1136.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2087, 'Incredible Steel Clock', '0844384091137', 'incredible-steel-clock', 'Dolorem temporibus aliquid vel recusandae. Dignissimos nisi dolorum eos debitis sequi. Hic qui veritatis et incidunt sit ipsa non.', 4582.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2088, 'Aerodynamic Paper Hat', '7451112771990', 'aerodynamic-paper-hat', 'Aut reprehenderit est rem fuga deserunt repellat. Nisi culpa sint ipsa ut.', 2895.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2089, 'Ergonomic Rubber Table', '6779480431201', 'ergonomic-rubber-table', 'Voluptas voluptas accusamus omnis qui quo. Laudantium sed est veritatis adipisci et quas iure error.', 2447.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2090, 'Practical Granite Plate', '4824163669340', 'practical-granite-plate', 'Ea fugit illo sed architecto. Qui dolores est voluptatibus nihil veritatis sed odit. Aliquid et possimus blanditiis molestiae.', 4953, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2091, 'Synergistic Cotton Chair', '5519880883085', 'synergistic-cotton-chair', 'Quo soluta earum velit voluptatem sit molestias perspiciatis. Molestiae libero qui quaerat ducimus et cum consectetur voluptatum. Qui similique deleniti quasi laboriosam recusandae id.', 2575.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2092, 'Rustic Aluminum Computer', '5953355022584', 'rustic-aluminum-computer', 'Libero eaque dolor rerum. Fugiat omnis pariatur laudantium aut amet adipisci.', 1199.89, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2093, 'Sleek Iron Wallet', '0288459785055', 'sleek-iron-wallet', 'Similique impedit quam exercitationem ipsam aut sequi. Quidem sapiente quisquam minus vel vero sint corporis rerum. Sunt molestiae itaque in nobis rem sed ut officia.', 4935.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2094, 'Durable Bronze Bag', '8781209130607', 'durable-bronze-bag', 'Libero qui voluptas quam nisi corporis. Earum odio blanditiis enim qui.', 2684.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2095, 'Mediocre Cotton Bench', '8232366588225', 'mediocre-cotton-bench', 'Voluptatum quas hic consectetur numquam ea. Alias error omnis nemo dolor molestias aut ut.', 1438.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2096, 'Practical Marble Chair', '4041727066272', 'practical-marble-chair', 'Sint itaque quasi aspernatur quia expedita delectus sed saepe. Similique eos quis hic ullam. Debitis deserunt et inventore dolores laudantium suscipit.', 479.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2097, 'Aerodynamic Silk Coat', '9973252388671', 'aerodynamic-silk-coat', 'Dolorem quis dignissimos soluta est. Id cupiditate voluptatem ut ea.', 1277.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2098, 'Practical Marble Shirt', '6321015044679', 'practical-marble-shirt', 'Qui autem deserunt dolores ut veritatis quod reiciendis. Possimus porro aliquam excepturi nihil.', 4319.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2099, 'Small Aluminum Plate', '1806836757830', 'small-aluminum-plate', 'Magni porro alias autem nesciunt officia et exercitationem. Commodi odio delectus vel provident temporibus.', 3790.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2100, 'Durable Granite Lamp', '4759755424055', 'durable-granite-lamp', 'Perspiciatis vero quia impedit. Et voluptas accusamus minus quos architecto aut id.', 3769.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2101, 'Durable Copper Bottle', '9930092636614', 'durable-copper-bottle', 'Alias quo explicabo illo dolores iusto quisquam. Distinctio est aut dolorem voluptatum est eveniet ut.', 954.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2102, 'Incredible Silk Coat', '9350833517178', 'incredible-silk-coat', 'Et enim nobis vel et. Velit officia ratione quia laudantium est amet. Voluptatem quas praesentium nesciunt quia.', 108.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2103, 'Sleek Wooden Plate', '6910341283410', 'sleek-wooden-plate', 'Aut impedit ipsam vero vitae repellat non qui quasi. Tempore inventore officiis laboriosam velit perspiciatis maiores.', 3124.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2104, 'Practical Rubber Table', '8463508310156', 'practical-rubber-table', 'Saepe blanditiis libero eaque ea quia eaque. Quisquam modi illo labore impedit quae libero reiciendis. Rerum est illum sed architecto.', 1578.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2105, 'Rustic Linen Knife', '3225141872997', 'rustic-linen-knife', 'Eos quam sequi voluptas eos ratione assumenda quasi. Quasi a quae quia laborum. Explicabo porro est tempore.', 850.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2106, 'Incredible Wooden Chair', '8049906903802', 'incredible-wooden-chair', 'Porro fuga rem officia fuga error incidunt eaque. Voluptate maiores quia quia odio eum ipsam possimus.', 2913.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2107, 'Ergonomic Steel Lamp', '0208604588775', 'ergonomic-steel-lamp', 'Sint voluptatibus voluptas dignissimos molestiae. Dolor id autem qui quia hic qui. Ipsam voluptatem nam omnis necessitatibus porro sed hic.', 3481.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2108, 'Aerodynamic Linen Car', '8782187414666', 'aerodynamic-linen-car', 'Quisquam in velit tenetur dolorum incidunt. Molestiae molestias dolores iste veniam consequuntur.', 3781.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2109, 'Durable Rubber Table', '0122293360613', 'durable-rubber-table', 'Voluptatem exercitationem eum est nobis architecto. Aliquam dolorum sint id similique eius qui delectus. Voluptatibus ea amet sunt blanditiis.', 663.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2110, 'Fantastic Iron Wallet', '5153698734247', 'fantastic-iron-wallet', 'Veritatis rerum sint et quis et earum illo. Iure qui maxime atque blanditiis. Voluptatibus repudiandae modi dolores.', 2137.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2111, 'Mediocre Paper Car', '3037853062845', 'mediocre-paper-car', 'Commodi sunt omnis et ut vero voluptatem facilis. Laborum non neque itaque id ipsa similique repellat est. Est beatae sit et ab consequuntur atque expedita qui.', 4842.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2112, 'Mediocre Paper Shoes', '7120569753124', 'mediocre-paper-shoes', 'Omnis deleniti omnis incidunt autem vel. Eos rem voluptate omnis vel earum sunt in. Debitis ducimus eum impedit hic.', 3325.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2113, 'Practical Copper Knife', '6426334481379', 'practical-copper-knife', 'Repellendus ipsam velit qui facere perspiciatis doloribus dolorem. Error natus quisquam et fugiat. Perferendis eius itaque provident qui minus voluptate consequatur.', 650.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2114, 'Rustic Granite Clock', '5203033928555', 'rustic-granite-clock', 'Cum molestias aut non nesciunt aut quo. Temporibus odio impedit quia hic facere laborum.', 1273.77, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2115, 'Aerodynamic Iron Shirt', '6739799819619', 'aerodynamic-iron-shirt', 'Ex odio ut velit molestiae nam sit. Quaerat dolorum cupiditate unde nam. Vitae esse ab aut repudiandae.', 905.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2116, 'Ergonomic Cotton Hat', '1384343481344', 'ergonomic-cotton-hat', 'Molestias ea ullam id quis. Repellat quae fuga tempora hic omnis debitis.', 4672.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2117, 'Incredible Marble Plate', '5526879595904', 'incredible-marble-plate', 'Laboriosam repudiandae et quo. Excepturi enim libero accusantium non dolorem quasi.', 4469.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2118, 'Heavy Duty Iron Shoes', '1138395447618', 'heavy-duty-iron-shoes', 'Alias velit nostrum nisi qui ipsum. Ad et dolorem sunt sed quis modi et.', 3435.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2119, 'Intelligent Steel Computer', '9193555707799', 'intelligent-steel-computer', 'Perferendis consectetur reiciendis rerum eveniet. Aut voluptatibus illum et quas est molestiae sunt sint.', 3704.9, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2120, 'Incredible Rubber Keyboard', '2844681425121', 'incredible-rubber-keyboard', 'Consectetur ut aut ex cum in ipsa qui. Deleniti dolor autem hic quas consequatur. Sunt deserunt illum maxime ea.', 4803.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2121, 'Sleek Cotton Keyboard', '7724954374279', 'sleek-cotton-keyboard', 'Perferendis quasi repellendus nemo excepturi voluptatibus nam. Atque et magni modi maiores. Veritatis qui tempora consequatur qui.', 4112.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2122, 'Incredible Copper Chair', '4630674813635', 'incredible-copper-chair', 'Quis illum sapiente repellat laudantium quo inventore. Tempora minima quo exercitationem ea sint.', 726.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2123, 'Enormous Plastic Hat', '4542183843785', 'enormous-plastic-hat', 'Amet facere qui necessitatibus aliquid necessitatibus sed. Est eos eos qui.', 4058.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2124, 'Lightweight Aluminum Plate', '9136118991037', 'lightweight-aluminum-plate', 'Aut doloremque possimus voluptatem voluptatem non accusantium. Ut quibusdam dolorem placeat provident quos consequuntur nostrum.', 4560.6, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2125, 'Sleek Steel Bottle', '0450885495789', 'sleek-steel-bottle', 'Consectetur facilis nam unde tenetur fugit. Quia sit vero ullam ex voluptate voluptatibus.', 761.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2126, 'Mediocre Rubber Car', '3729882373060', 'mediocre-rubber-car', 'Excepturi aut ipsam numquam rerum veritatis omnis rerum. Similique rem aut cumque eos.', 980.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2127, 'Fantastic Aluminum Chair', '4881014398026', 'fantastic-aluminum-chair', 'Doloribus doloremque omnis rerum optio. Et iusto voluptate ad aut iusto.', 2873.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2128, 'Aerodynamic Silk Watch', '7982536988478', 'aerodynamic-silk-watch', 'Pariatur voluptatibus vel soluta rerum ipsam id optio. Animi magnam ipsa saepe quod.', 1013.43, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2129, 'Lightweight Marble Chair', '8488654390616', 'lightweight-marble-chair', 'Suscipit fuga sapiente quod sed assumenda nam consequuntur. Tenetur aut mollitia quia atque est. Perspiciatis numquam iusto voluptas ipsum corrupti.', 2642.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2130, 'Aerodynamic Aluminum Bottle', '6173512697359', 'aerodynamic-aluminum-bottle', 'Saepe quaerat maxime nemo tempora sit et. Aut magni atque nihil qui eos in sequi. Quaerat enim distinctio consequatur eum dignissimos ipsum et autem.', 3752, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2131, 'Durable Bronze Shirt', '4873814098855', 'durable-bronze-shirt', 'Ipsa est vitae ipsa doloremque. Sit magni quae culpa dignissimos. Quia tempora consequatur ratione.', 4597.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2132, 'Synergistic Silk Car', '0243108147479', 'synergistic-silk-car', 'Minus tempore et ut non laborum et voluptas quis. Doloribus architecto odio quae deserunt blanditiis aliquam. Est est sed repellat iusto.', 3698.65, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2133, 'Fantastic Wooden Computer', '3702107147035', 'fantastic-wooden-computer', 'Accusantium ut eos consequatur quia. Ipsum alias rerum voluptate repudiandae similique officiis.', 2302.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2134, 'Intelligent Wool Bag', '5882743448890', 'intelligent-wool-bag', 'Quis commodi voluptatum consequuntur odio molestiae ea. Dolorum corporis voluptate delectus.', 3640.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2135, 'Gorgeous Copper Knife', '9892635455277', 'gorgeous-copper-knife', 'Culpa exercitationem deleniti velit non itaque laboriosam nihil. Sed similique voluptatum velit nulla rerum et quis.', 907.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2136, 'Sleek Granite Bag', '2530302329588', 'sleek-granite-bag', 'Deleniti voluptatem quia quibusdam amet beatae reprehenderit. Assumenda qui neque nam.', 4662.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2137, 'Incredible Marble Computer', '3653643487478', 'incredible-marble-computer', 'Facere voluptas illo accusamus quis voluptatem pariatur est. Quia ut eligendi vitae et.', 3847.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2138, 'Aerodynamic Wool Bag', '4995757170860', 'aerodynamic-wool-bag', 'Est quasi ullam tenetur numquam repellendus eos aspernatur. Consequatur est eius ullam est ipsum quos. Quos laborum nihil quisquam et perspiciatis.', 2271.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2139, 'Small Aluminum Wallet', '7134374424773', 'small-aluminum-wallet', 'Quae ducimus omnis tempore illo aperiam. Et repudiandae aut autem ut quibusdam animi dolorum.', 813.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2140, 'Practical Plastic Chair', '0369560486656', 'practical-plastic-chair', 'Voluptatum in maxime dicta enim in. Error non occaecati et culpa error fugiat rerum voluptatem. Optio autem et dolor ut quam.', 4105.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2141, 'Fantastic Paper Knife', '2998768981564', 'fantastic-paper-knife', 'Eaque omnis voluptatem quos neque quos sed tempore. Eos ut minus velit magni earum. Occaecati non et debitis excepturi provident sit veritatis id.', 4176.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2142, 'Durable Plastic Bench', '7632848786919', 'durable-plastic-bench', 'Velit ea totam id occaecati iste eum officiis. Aliquam illum dolor repellendus rem eos omnis.', 1686.11, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2143, 'Ergonomic Granite Knife', '7969333708317', 'ergonomic-granite-knife', 'Assumenda quia est molestiae neque dolorem atque sequi. Quidem sunt totam enim.', 2918.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2144, 'Ergonomic Wooden Bag', '1862225315579', 'ergonomic-wooden-bag', 'Sapiente qui repellat reiciendis quae et. Totam quia ex voluptates aliquam. Optio recusandae in ut.', 1153.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2145, 'Rustic Cotton Shirt', '3276287080524', 'rustic-cotton-shirt', 'Ex et ex quia. Quod voluptas voluptatum ad et laudantium nulla. Harum cupiditate sunt eum.', 4317.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2146, 'Synergistic Leather Car', '4982418868211', 'synergistic-leather-car', 'Consequatur provident debitis voluptas fuga expedita recusandae numquam. Aut modi enim aspernatur perspiciatis saepe. Et est architecto aliquid aut in veniam.', 2037.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2147, 'Practical Iron Keyboard', '1292217841050', 'practical-iron-keyboard', 'Molestiae aut laborum minima quisquam exercitationem officiis ut. Quia adipisci deleniti odio explicabo id quis.', 4852.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2148, 'Rustic Iron Watch', '3392731189015', 'rustic-iron-watch', 'Qui qui fugit ipsa corporis blanditiis quo. Quaerat aut et et ut nemo corrupti at.', 1808.76, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2149, 'Aerodynamic Leather Knife', '9653256435112', 'aerodynamic-leather-knife', 'Sit eaque perferendis consequuntur officiis iste soluta ipsam. Cumque voluptatem et natus aliquid nostrum consequatur.', 1721.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2150, 'Lightweight Leather Shirt', '7720152684257', 'lightweight-leather-shirt', 'Velit et a ipsum nihil iusto deserunt tenetur. Quia quia dignissimos quibusdam non in repellat iure accusantium. Hic nihil tempore dicta ipsam.', 668.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2151, 'Aerodynamic Silk Computer', '6806875857947', 'aerodynamic-silk-computer', 'Vitae voluptatibus aut deleniti voluptatem et adipisci vero. Doloremque tempora cumque consectetur.', 18.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2152, 'Heavy Duty Concrete Chair', '9862314740642', 'heavy-duty-concrete-chair', 'Rerum earum sint labore dolorem. Ipsum quasi labore deserunt quidem est deleniti veniam qui.', 3937.63, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2153, 'Awesome Steel Keyboard', '9135247170689', 'awesome-steel-keyboard', 'Consequuntur nihil reprehenderit distinctio consequatur sint sed. Accusamus mollitia nisi harum rerum doloremque quibusdam aspernatur.', 1870.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2154, 'Ergonomic Aluminum Wallet', '2068730134486', 'ergonomic-aluminum-wallet', 'Qui officia suscipit inventore animi. Sapiente perferendis veniam nisi adipisci illum.', 3446.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2155, 'Sleek Concrete Computer', '4214236537650', 'sleek-concrete-computer', 'Nihil reiciendis repellendus voluptatem deserunt dolorem. Doloribus repellat aut dolor mollitia dicta perspiciatis beatae est.', 2281.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2156, 'Mediocre Steel Plate', '8557160251060', 'mediocre-steel-plate', 'Fugit ut illum libero est. Quos consequatur aut iste dolores eligendi dolor quia.', 4695.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2157, 'Durable Rubber Gloves', '5362219853354', 'durable-rubber-gloves', 'Et doloribus voluptate magnam vel omnis. Molestias non accusantium aut quia. Ut exercitationem dolor mollitia.', 961.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2158, 'Gorgeous Linen Shirt', '2842467031931', 'gorgeous-linen-shirt', 'Sint aut quae vel dolorem. Et ullam exercitationem doloribus dolores in ratione autem id. Error perferendis nisi cupiditate iusto similique et.', 1152.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2159, 'Incredible Wool Keyboard', '9254212070585', 'incredible-wool-keyboard', 'Suscipit quia minima corrupti pariatur recusandae ea magni. Et ab modi vitae. Deleniti nobis placeat maxime quo magnam sunt optio.', 2214.45, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2160, 'Enormous Marble Bag', '0281902320131', 'enormous-marble-bag', 'Rem vel libero voluptatem eos ab quasi. Sed explicabo distinctio ullam et nihil animi officia. Commodi rerum illum est.', 3832.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2161, 'Mediocre Marble Chair', '8318935020799', 'mediocre-marble-chair', 'Voluptatem est sint nam quo voluptatem officia beatae. Ut mollitia suscipit eum vel.', 1498.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2162, 'Ergonomic Wool Bag', '8364457564648', 'ergonomic-wool-bag', 'Sapiente inventore et accusamus qui. Deleniti non illum quia sit voluptatem praesentium. Et et enim omnis.', 384.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2163, 'Awesome Aluminum Computer', '6239016709735', 'awesome-aluminum-computer', 'Vero repellendus laboriosam ut odio nam nobis incidunt. Dolor voluptatum maxime ut molestiae dolorum culpa maxime. Earum qui culpa est labore quis non est.', 490.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2164, 'Fantastic Leather Lamp', '9974473792797', 'fantastic-leather-lamp', 'Labore voluptates modi et porro eveniet. Voluptatum velit ex cumque qui. Ut non suscipit eos.', 213.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2165, 'Mediocre Concrete Computer', '5039387916319', 'mediocre-concrete-computer', 'Quis non consequatur voluptatem adipisci rerum qui temporibus. Modi facilis enim nobis distinctio autem possimus quibusdam.', 1782.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2166, 'Rustic Iron Hat', '9456092359754', 'rustic-iron-hat', 'Veniam non id dolores eum laborum aut aut. Est voluptate consectetur omnis asperiores.', 1423.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2167, 'Rustic Wooden Car', '2336788608984', 'rustic-wooden-car', 'Quasi debitis tempora repellat vel aut porro. Inventore rerum at temporibus illo recusandae voluptas libero voluptas. Cum sit autem ab.', 3948.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2168, 'Incredible Leather Car', '1111402619024', 'incredible-leather-car', 'Vel temporibus enim dolorum quidem est. Voluptatem eius autem sunt odit non aspernatur perferendis.', 1996.8, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2169, 'Practical Silk Chair', '1317607900398', 'practical-silk-chair', 'Earum magni occaecati rerum veniam in quia. Sed est itaque sit sed vero laborum doloribus. Esse autem provident nam quo et et.', 1607.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2170, 'Awesome Wooden Hat', '1894473437352', 'awesome-wooden-hat', 'Quia corrupti reiciendis et aut labore. Sit dicta cum expedita voluptas rem rem expedita enim.', 1709.75, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2171, 'Durable Cotton Gloves', '6654579496371', 'durable-cotton-gloves', 'Aspernatur repellat fugiat sed ea. Est doloremque natus necessitatibus. Earum necessitatibus eum eaque ut tempora.', 966.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2172, 'Ergonomic Marble Shirt', '9361565410910', 'ergonomic-marble-shirt', 'Impedit quia labore sequi. Non eos eveniet inventore est.', 4078.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2173, 'Rustic Concrete Keyboard', '8090928300209', 'rustic-concrete-keyboard', 'Ut blanditiis alias sapiente et voluptates perspiciatis. Aut soluta ea nulla mollitia vel ut et ullam. Pariatur nulla hic recusandae.', 1313.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2174, 'Durable Plastic Lamp', '6203146252362', 'durable-plastic-lamp', 'Et distinctio non odit. Voluptatibus voluptatem deleniti qui recusandae sit assumenda deleniti.', 4234.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2175, 'Aerodynamic Plastic Gloves', '0771545832615', 'aerodynamic-plastic-gloves', 'Voluptates tenetur qui cumque eveniet enim porro tempore. Ut dolorum natus possimus sed cumque at ratione. A maxime dolores sapiente tenetur reiciendis error.', 2926.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2176, 'Ergonomic Paper Bench', '3848284778850', 'ergonomic-paper-bench', 'Saepe adipisci quia impedit velit. Modi est doloribus et.', 1747.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2177, 'Practical Leather Shoes', '2647680185474', 'practical-leather-shoes', 'Autem consequatur tempora voluptate ipsam est voluptatem molestiae. Sed laudantium ipsa animi placeat odit ex iste nulla. Non dolorem dolores animi rem id facilis.', 3534.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2178, 'Aerodynamic Plastic Hat', '4951927809657', 'aerodynamic-plastic-hat', 'Vel rerum exercitationem magnam. Sunt doloribus saepe officiis eos.', 3173.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2179, 'Synergistic Plastic Shirt', '7642052332369', 'synergistic-plastic-shirt', 'Consequatur eum ullam ratione voluptatum veritatis similique sit possimus. Iure adipisci id magni voluptas maiores magnam officiis qui.', 1243.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2180, 'Awesome Iron Shirt', '4332771033380', 'awesome-iron-shirt', 'Aut neque vero aliquam sunt. Beatae aut exercitationem officia quisquam et labore natus.', 3231.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2181, 'Ergonomic Leather Wallet', '1222179314811', 'ergonomic-leather-wallet', 'Autem quia molestiae eos et quos excepturi mollitia. Quis culpa rerum qui minus et. Totam nostrum numquam delectus perferendis ut.', 4862.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2182, 'Aerodynamic Linen Wallet', '7829599078060', 'aerodynamic-linen-wallet', 'Praesentium eius quasi omnis est adipisci. Similique minima laudantium ducimus eum eum earum. Non sint et totam voluptatibus ut et.', 1713.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2183, 'Fantastic Iron Watch', '1394695538078', 'fantastic-iron-watch', 'Provident est praesentium officia. Et magni itaque enim dolorum delectus optio distinctio occaecati.', 4973.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2184, 'Rustic Linen Coat', '2875942538984', 'rustic-linen-coat', 'In nihil voluptatem ut. Aliquam voluptas quo fuga repellendus et. Excepturi ut debitis pariatur harum.', 4035.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2185, 'Heavy Duty Paper Bench', '6773191973906', 'heavy-duty-paper-bench', 'Quia expedita ducimus culpa a temporibus. Sit sit sit omnis.', 136.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2186, 'Ergonomic Bronze Shirt', '1324679333412', 'ergonomic-bronze-shirt', 'Et qui a in laborum. Error molestiae officiis placeat nostrum quasi corporis velit.', 2888.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2187, 'Gorgeous Silk Bag', '6476440424647', 'gorgeous-silk-bag', 'Sint laboriosam reprehenderit et quis blanditiis. Repellat dicta soluta mollitia iusto non dolorum qui. Veniam sapiente ipsum aut commodi excepturi.', 2934.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2188, 'Practical Concrete Pants', '3503877309964', 'practical-concrete-pants', 'Iste molestiae rerum voluptatibus est non nam voluptatem. Aliquid blanditiis minima illum cum veniam dolores. Temporibus sit ut qui quas doloremque velit non.', 4165, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2189, 'Mediocre Bronze Bag', '6945886779876', 'mediocre-bronze-bag', 'Dolor ullam ullam dolores aut omnis aspernatur deserunt. Nostrum ut ut consequatur et laboriosam tempora voluptatum quia.', 4832.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2190, 'Sleek Silk Coat', '4605494026862', 'sleek-silk-coat', 'Omnis omnis rerum quae cupiditate aut. Rem est maxime dicta repudiandae. Amet dolor quia neque.', 454.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2191, 'Fantastic Concrete Bag', '5834931834886', 'fantastic-concrete-bag', 'Natus sit qui ab ratione sit tempora non. Nisi laboriosam optio possimus quos itaque consectetur vel odit. Quod aut sunt qui blanditiis accusamus.', 3870.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2192, 'Synergistic Silk Hat', '0051438844544', 'synergistic-silk-hat', 'Qui ut earum soluta porro. Impedit omnis veritatis modi doloremque corporis a iusto.', 3061.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2193, 'Rustic Steel Table', '4204647781377', 'rustic-steel-table', 'Quia corporis iusto eaque tempora. Odit et tempore quas non omnis. Dolore iste sed alias voluptatem sed rem.', 2121.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2194, 'Fantastic Linen Hat', '8837569088246', 'fantastic-linen-hat', 'Libero perferendis beatae et omnis qui tenetur. Tempora repellendus odit similique deserunt.', 158.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2195, 'Awesome Wool Gloves', '3674538242613', 'awesome-wool-gloves', 'Beatae minus nobis corporis tempore ex quia. Nostrum autem ratione reiciendis quo qui rem laborum. Et consequatur magnam aut hic quisquam.', 669.05, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2196, 'Heavy Duty Leather Lamp', '8058675327870', 'heavy-duty-leather-lamp', 'Ipsa ab quasi quo voluptatem et itaque ex et. Fuga numquam possimus repudiandae repellendus. Iusto iure odit minus tenetur asperiores dolor.', 631.17, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2197, 'Lightweight Iron Watch', '4388247054946', 'lightweight-iron-watch', 'Quia sequi incidunt delectus et molestiae et dolorum. Facilis odio tempora consequatur dicta sed ut.', 2242.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2198, 'Incredible Linen Shirt', '3577298298077', 'incredible-linen-shirt', 'Incidunt et dolorum necessitatibus. Voluptate vitae debitis animi animi aliquam aut dolorem et.', 791.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2199, 'Incredible Steel Shoes', '1917018193015', 'incredible-steel-shoes', 'Inventore ea doloribus nihil dolorum tempora nesciunt deserunt. Est voluptas itaque voluptatem quod iste asperiores esse dolorum.', 4638.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2200, 'Enormous Silk Hat', '4694193466178', 'enormous-silk-hat', 'Corporis eveniet vel sed impedit. Neque nam optio quae voluptas. Inventore praesentium est omnis et non at magnam.', 369.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2201, 'Aerodynamic Granite Plate', '8780425635576', 'aerodynamic-granite-plate', 'Harum repellat laboriosam iste omnis animi deserunt facilis. Est sed harum molestiae rem sunt hic. Et voluptatem est vero corporis quia.', 3228.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2202, 'Synergistic Wool Keyboard', '8876166161396', 'synergistic-wool-keyboard', 'Omnis distinctio voluptate vel velit dolor accusamus. Eum iure et quia amet alias porro voluptatum.', 1008.29, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2203, 'Mediocre Marble Lamp', '6981718030302', 'mediocre-marble-lamp', 'Dolor consectetur nulla atque eum modi. Eos velit quia velit natus eum dolor omnis qui. Nam commodi rerum officia eos.', 1732.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2204, 'Small Paper Wallet', '0292059506880', 'small-paper-wallet', 'Est aliquam tempore voluptatibus incidunt. Et sit at tempore laborum et et necessitatibus et.', 2377.35, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2205, 'Practical Cotton Coat', '9619969908282', 'practical-cotton-coat', 'Et eligendi eveniet et et nam. Voluptas voluptas officia possimus.', 267.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2206, 'Synergistic Iron Chair', '6212297070664', 'synergistic-iron-chair', 'Accusamus quo natus exercitationem dolorem ea doloribus. Repellat est quia omnis ut excepturi. Voluptatem cupiditate iure sint praesentium officia quia modi.', 400.23, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2207, 'Incredible Bronze Bench', '6463283025087', 'incredible-bronze-bench', 'Deleniti quos odit sit est sapiente voluptas nemo qui. Aliquam totam sint neque placeat minus id veniam est.', 1237.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2208, 'Mediocre Wooden Lamp', '9509838940522', 'mediocre-wooden-lamp', 'Repudiandae quibusdam explicabo temporibus esse hic deleniti. Quos in beatae numquam quae est soluta inventore. Itaque vero eum iste officiis.', 4739.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2209, 'Durable Iron Gloves', '7303961361580', 'durable-iron-gloves', 'Quae repellat aliquam quia rem. Pariatur corporis in ex error inventore et.', 2284.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2210, 'Intelligent Rubber Computer', '0928322139942', 'intelligent-rubber-computer', 'Non sit sit est aut eos vel et. Minus autem voluptatem corrupti quo quibusdam et inventore.', 233.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2211, 'Rustic Aluminum Keyboard', '5531595094730', 'rustic-aluminum-keyboard', 'Quos aspernatur vero a voluptas ea. Distinctio aspernatur incidunt alias qui repellat voluptatem possimus.', 2312.47, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2212, 'Synergistic Rubber Car', '2918766910274', 'synergistic-rubber-car', 'At voluptatem voluptas autem occaecati expedita optio est. Libero quo magnam omnis ducimus porro quo consequatur. Ut ad omnis dolores explicabo soluta nemo.', 4042.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2213, 'Heavy Duty Wool Hat', '3307308219514', 'heavy-duty-wool-hat', 'Accusamus temporibus nulla repellat excepturi saepe ex quo. Nulla unde laboriosam veniam sed. Dignissimos blanditiis inventore et et earum.', 521.28, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2214, 'Small Iron Computer', '7031824376579', 'small-iron-computer', 'Et hic enim repudiandae exercitationem ea doloribus. Quia est nobis nulla expedita ea. Excepturi quos voluptate illo voluptates officiis eligendi soluta.', 896.97, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2215, 'Fantastic Cotton Bottle', '9941057291632', 'fantastic-cotton-bottle', 'Expedita labore totam est eos voluptas et. Velit blanditiis deleniti dignissimos dolore quidem et. Laboriosam cumque totam voluptate est.', 3343.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2216, 'Incredible Granite Chair', '3571699491402', 'incredible-granite-chair', 'Repudiandae perferendis voluptatem molestiae magnam voluptas. Praesentium consequatur eaque dolorem nulla autem similique est. Qui ut esse aut numquam nemo omnis.', 3814.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2217, 'Intelligent Copper Car', '8131308760883', 'intelligent-copper-car', 'Consequatur aut qui deleniti ratione eos atque velit. Perferendis quam et natus expedita. Et tempora non repellendus ut ea consequatur aliquam.', 4988.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2218, 'Gorgeous Paper Wallet', '3716195703158', 'gorgeous-paper-wallet', 'Est optio aut quaerat et. Adipisci est voluptate ut quas. Quo voluptates qui amet quis dolorem ducimus odio.', 2378.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2219, 'Gorgeous Marble Coat', '2084004174637', 'gorgeous-marble-coat', 'Quasi dicta illo voluptatum esse inventore. Delectus repudiandae beatae et sequi quibusdam.', 286.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2220, 'Awesome Granite Keyboard', '3662582803553', 'awesome-granite-keyboard', 'Accusamus mollitia voluptatibus ipsam quasi veniam. Quas ea ut ducimus recusandae. Necessitatibus aut saepe mollitia quis.', 3378.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2221, 'Mediocre Granite Shoes', '6890468426634', 'mediocre-granite-shoes', 'Omnis suscipit assumenda in id perspiciatis vero numquam. Esse aut voluptas soluta velit ut. Corrupti magnam doloribus voluptatem quis.', 66.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2222, 'Mediocre Bronze Plate', '0793190644863', 'mediocre-bronze-plate', 'Consequatur iure rerum assumenda. Itaque sunt omnis est natus voluptatibus at. Aperiam quia officia quo explicabo voluptatem ad.', 4577.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2223, 'Small Wooden Table', '0387491173438', 'small-wooden-table', 'Veritatis dolorem nam est aperiam. Officia mollitia vel quisquam. Aut neque repudiandae nemo et.', 4955.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2224, 'Rustic Plastic Car', '3630916670010', 'rustic-plastic-car', 'Animi nihil ducimus ipsum enim voluptate. Dolores excepturi id veniam ratione aliquam ut. Reprehenderit possimus ut deleniti adipisci delectus voluptas.', 2147.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2225, 'Synergistic Steel Chair', '0365118205472', 'synergistic-steel-chair', 'Optio reiciendis ea odio debitis est. Reprehenderit magnam nihil officia.', 3777.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2226, 'Small Concrete Bag', '6660324665893', 'small-concrete-bag', 'Illum velit similique perferendis expedita. Deleniti quod consequatur et.', 3463.54, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2227, 'Awesome Steel Plate', '7223995994670', 'awesome-steel-plate', 'Sint facere vel facere esse. Expedita dolores quo nesciunt tenetur consequuntur eligendi.', 814.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2228, 'Rustic Steel Keyboard', '3695532605570', 'rustic-steel-keyboard', 'Voluptatem beatae esse rerum nulla distinctio est. Est unde ullam eos aut non id. Sit blanditiis cupiditate facilis.', 685.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2229, 'Rustic Aluminum Shoes', '4405860150234', 'rustic-aluminum-shoes', 'Laboriosam voluptatem porro labore est dignissimos. Dolores ea saepe veniam est.', 2700.21, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2230, 'Ergonomic Steel Hat', '6602096977927', 'ergonomic-steel-hat', 'Similique laboriosam nisi velit neque. Voluptates ea cumque veritatis esse quo rerum. Incidunt quos nesciunt nisi quia autem.', 1418.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2231, 'Ergonomic Copper Lamp', '4314647426489', 'ergonomic-copper-lamp', 'Quia illo praesentium dolores ab aliquid est repudiandae. Sint facere dicta omnis unde.', 4442.69, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2232, 'Lightweight Copper Gloves', '5456865125115', 'lightweight-copper-gloves', 'Labore aperiam itaque labore veritatis earum nemo quia. Aliquid ullam sapiente atque porro incidunt. Id ullam possimus tempora quam explicabo nesciunt laborum.', 3629.83, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2233, 'Ergonomic Rubber Bag', '3975665623000', 'ergonomic-rubber-bag', 'Praesentium at cupiditate excepturi quos saepe voluptates delectus. Eveniet dolor ut aut soluta vel iure.', 1279.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2234, 'Practical Silk Lamp', '4407118025110', 'practical-silk-lamp', 'Dolorem nemo minima voluptas incidunt est doloremque. Ut earum quis minima. Voluptatem sit est alias in ex sit.', 1924.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2235, 'Durable Paper Chair', '2892909824836', 'durable-paper-chair', 'Voluptas repudiandae tempora facilis est quia. In nesciunt eligendi molestiae nihil reiciendis doloribus labore. Magni deleniti corporis ut necessitatibus ea.', 2220.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2236, 'Ergonomic Copper Pants', '7926783674531', 'ergonomic-copper-pants', 'Nostrum placeat voluptas ut temporibus hic aut ea. Omnis voluptatibus voluptates animi repudiandae eius necessitatibus. Itaque in quia rerum quibusdam.', 4730.92, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2237, 'Enormous Rubber Table', '7225742546347', 'enormous-rubber-table', 'Deleniti et unde nostrum rerum quis aperiam minus. Fugit doloremque expedita officia iste dicta quisquam voluptates laudantium.', 2574.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2238, 'Synergistic Silk Bench', '4854713416360', 'synergistic-silk-bench', 'Et atque et nemo asperiores rerum ex. Voluptatem quo quod labore. Deserunt occaecati ea incidunt nobis suscipit.', 2212.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2239, 'Synergistic Steel Hat', '4769131162167', 'synergistic-steel-hat', 'Tenetur ut reiciendis ut illo aut. In aut nihil numquam ea vel.', 4919.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07');
INSERT INTO `products` (`product_id`, `name`, `sku`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(2240, 'Durable Rubber Clock', '7854528919930', 'durable-rubber-clock', 'Voluptatem aliquid doloremque tempore dicta nostrum dolore et. Recusandae ad sint deserunt. Ex commodi veniam sit et.', 546.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2241, 'Gorgeous Aluminum Bottle', '5546701436588', 'gorgeous-aluminum-bottle', 'Voluptas sunt quisquam voluptas accusamus ut reprehenderit sed atque. Perferendis quis pariatur veritatis qui quibusdam. Dolorum corrupti facilis et sed.', 3553.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2242, 'Durable Wool Keyboard', '3536453265569', 'durable-wool-keyboard', 'Earum eligendi quo et corrupti quasi autem. Aperiam eum laborum suscipit adipisci non voluptatem ab. Dolor commodi ea cum voluptates non.', 977.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2243, 'Rustic Iron Bottle', '4010306287018', 'rustic-iron-bottle', 'Vitae praesentium voluptatem rem sed provident dolore quo. Numquam ut nobis quidem. Dolores omnis architecto id laboriosam.', 4697.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2244, 'Enormous Iron Shirt', '0840707281131', 'enormous-iron-shirt', 'Repellat veritatis voluptatibus odit magnam. Et laborum praesentium voluptatibus explicabo eaque ad omnis.', 2424.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2245, 'Incredible Rubber Chair', '0859306944101', 'incredible-rubber-chair', 'Laudantium culpa odio est qui. Neque dolor incidunt rerum qui delectus. Expedita dolores reprehenderit est minus deserunt beatae culpa.', 1987.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2246, 'Enormous Plastic Bench', '7650483909777', 'enormous-plastic-bench', 'Neque est molestiae omnis minima. Quibusdam officiis voluptas iure vel sint commodi est. Itaque possimus quisquam ut quisquam hic qui.', 4369.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2247, 'Enormous Bronze Table', '5974610332682', 'enormous-bronze-table', 'Nesciunt ex architecto aliquam impedit. Minima molestias perferendis quod minus. Mollitia quasi voluptas et cupiditate.', 4457.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2248, 'Mediocre Marble Bench', '7808108386889', 'mediocre-marble-bench', 'Molestiae illo ad vitae numquam ex nihil molestiae. Sed voluptates dignissimos omnis officiis.', 4594.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2249, 'Awesome Aluminum Chair', '5887210790656', 'awesome-aluminum-chair', 'Quo commodi voluptatibus unde ut sit ut voluptatem eos. Sit sequi velit iure beatae voluptatibus possimus sed. Veniam eius facere nihil cupiditate voluptatem dicta.', 783.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2250, 'Lightweight Wool Lamp', '5532786651176', 'lightweight-wool-lamp', 'Quibusdam corrupti veniam porro velit mollitia veniam rerum. Dignissimos eius error sit omnis sapiente omnis. Tempora enim animi adipisci quis eos non placeat.', 1043.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2251, 'Rustic Cotton Bag', '2979063123125', 'rustic-cotton-bag', 'Dolores autem odio dolor aperiam. Omnis cumque autem totam tempora recusandae natus odit sit. Voluptatum et ducimus quod sunt occaecati occaecati.', 4165.44, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2252, 'Practical Wool Computer', '5183981854611', 'practical-wool-computer', 'Voluptates minus est pariatur reiciendis dicta. Porro dolores fugit consequatur corporis rerum omnis. Asperiores fuga qui officiis cupiditate sunt voluptatem dolores.', 1481.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2253, 'Ergonomic Aluminum Knife', '4980141124017', 'ergonomic-aluminum-knife', 'Vero animi hic quod architecto alias. Quod aut quibusdam eum aut expedita vero.', 3337.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2254, 'Gorgeous Paper Hat', '9314278371634', 'gorgeous-paper-hat', 'Iure adipisci magni quam ut voluptate rerum ipsam distinctio. Autem aut sed aut velit repellat dignissimos suscipit et. Occaecati officia libero ut hic nesciunt.', 536.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2255, 'Practical Leather Shirt', '9720756583268', 'practical-leather-shirt', 'Autem esse laboriosam recusandae aut autem ea voluptatem. Omnis id nulla et quo ullam.', 1746.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2256, 'Mediocre Aluminum Table', '8035046841937', 'mediocre-aluminum-table', 'Provident esse dolorum aut beatae vero. Incidunt iusto autem laborum temporibus ducimus.', 3228.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2257, 'Practical Silk Table', '9210784394092', 'practical-silk-table', 'Enim animi atque id ut officia quia. Fuga assumenda ratione officiis similique minima eius tenetur.', 4065.13, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2258, 'Awesome Wooden Lamp', '4787793333275', 'awesome-wooden-lamp', 'Voluptatum voluptas maiores vero et natus sed qui rerum. Aut deserunt est non nostrum non veniam. Aut quae enim qui libero quia nihil quis.', 1744.27, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2259, 'Mediocre Silk Watch', '0990652910751', 'mediocre-silk-watch', 'Qui vel nesciunt sit velit. Quasi tempora quasi quod repudiandae explicabo. Illum modi delectus dolorem suscipit.', 462.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2260, 'Sleek Bronze Chair', '9256275035839', 'sleek-bronze-chair', 'Nisi laborum cum consequuntur adipisci. Rerum corrupti eum delectus.', 876.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2261, 'Durable Leather Watch', '0924213879072', 'durable-leather-watch', 'Officia velit impedit quos assumenda at sed. Ratione nulla in sunt debitis vel perferendis aliquid. Mollitia magni voluptatem at corporis unde corrupti amet.', 2987.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2262, 'Enormous Linen Bag', '7654527374620', 'enormous-linen-bag', 'Recusandae eum modi recusandae cupiditate porro illo. Et voluptas totam voluptates.', 2364.15, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2263, 'Enormous Copper Knife', '0141629052725', 'enormous-copper-knife', 'Velit expedita placeat molestias provident eveniet optio corporis animi. Laudantium pariatur reprehenderit voluptatem. Possimus neque veniam voluptatem assumenda eos.', 4634.2, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2264, 'Ergonomic Wool Wallet', '6623294929228', 'ergonomic-wool-wallet', 'Aut voluptatum neque velit dolorum illo vero. Eligendi et et velit laborum magni facere porro.', 4967.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2265, 'Awesome Wool Shirt', '3014596302995', 'awesome-wool-shirt', 'Error ex sed vero odit eius amet sit. Rerum voluptatem tempora facere et debitis quo libero.', 486.16, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2266, 'Enormous Silk Knife', '7927443487812', 'enormous-silk-knife', 'Quas omnis omnis sed et eveniet qui. Quibusdam quia quasi molestias non eius. Natus molestiae dolorem sit eveniet earum vero maxime nam.', 4534.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2267, 'Intelligent Bronze Plate', '7073891303546', 'intelligent-bronze-plate', 'Modi praesentium ipsa nulla quo sint. Iure quis architecto ex. Harum et dolorem pariatur quis debitis quis deleniti placeat.', 936.78, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2268, 'Small Linen Gloves', '7996027953838', 'small-linen-gloves', 'Quo ut earum amet vero unde. Rerum autem voluptate et quos est sunt rerum praesentium.', 4043.82, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2269, 'Awesome Concrete Plate', '2223551760218', 'awesome-concrete-plate', 'Et similique aut quia quo quo facere ab. Laudantium tempore magni nemo maiores.', 3255.25, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2270, 'Synergistic Leather Wallet', '9738728979148', 'synergistic-leather-wallet', 'Sequi fuga rem accusantium omnis non ut saepe. Sunt tenetur aut ea. Voluptatem eveniet maiores consectetur.', 3442.33, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2271, 'Synergistic Steel Keyboard', '2947460522339', 'synergistic-steel-keyboard', 'Officiis minus cum eligendi et. Officiis dolorem accusamus fugiat ab delectus id sit et.', 2879.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2272, 'Practical Linen Pants', '2753280422670', 'practical-linen-pants', 'Ut ab nihil facilis ea. Eveniet animi nihil est quod corporis. Id sit quasi et occaecati.', 2945.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2273, 'Enormous Aluminum Computer', '2738144347979', 'enormous-aluminum-computer', 'Facere labore adipisci iusto non placeat quasi et. Dolor non magni iusto est totam minus corporis.', 1294.09, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2274, 'Gorgeous Copper Gloves', '8457752317436', 'gorgeous-copper-gloves', 'Sunt consequatur optio quidem architecto quia. Voluptas perferendis commodi necessitatibus dolorum modi et quo. Iusto et ex hic.', 3192.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2275, 'Lightweight Plastic Hat', '5506892471416', 'lightweight-plastic-hat', 'Sit quam recusandae autem atque nostrum officiis unde expedita. Quidem aspernatur distinctio expedita suscipit totam rerum autem veritatis.', 1569.81, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2276, 'Lightweight Leather Wallet', '4400058681033', 'lightweight-leather-wallet', 'Hic mollitia quia qui nam molestiae. Nobis exercitationem similique ea debitis consequatur velit voluptatem.', 43.3, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2277, 'Ergonomic Rubber Clock', '2348717223366', 'ergonomic-rubber-clock', 'Est minus dolore corporis culpa aut libero molestias. Tenetur iure temporibus ab id maiores. Quia fugit laborum qui et.', 147.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2278, 'Lightweight Plastic Coat', '2761748503830', 'lightweight-plastic-coat', 'Sint dolorem nulla sed omnis. Iste natus harum qui excepturi aspernatur officiis.', 225.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2279, 'Lightweight Rubber Shirt', '3339348051007', 'lightweight-rubber-shirt', 'Autem est ut occaecati veniam. Natus aliquid praesentium sapiente minus est illum.', 353.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2280, 'Intelligent Copper Hat', '4124297680212', 'intelligent-copper-hat', 'Velit delectus porro rerum repellat quia. Aut aut voluptatibus incidunt.', 2087.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2281, 'Aerodynamic Copper Plate', '3375635272915', 'aerodynamic-copper-plate', 'Dicta aut eveniet repellendus sed excepturi sint a. Enim nisi nisi ut sit sunt eaque qui.', 3377.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2282, 'Incredible Aluminum Car', '5588184235395', 'incredible-aluminum-car', 'Excepturi in tempore beatae ducimus reprehenderit dicta assumenda. Ut numquam non sit impedit aliquam quia.', 853.59, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2283, 'Mediocre Plastic Shirt', '6493742521829', 'mediocre-plastic-shirt', 'Voluptatem quaerat maiores non rerum officiis modi. Non quo voluptatem modi quasi tempora praesentium. A eius velit cum architecto facere a qui.', 2603.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2284, 'Mediocre Wooden Pants', '5309213988460', 'mediocre-wooden-pants', 'Consequatur quo sint consectetur et unde ut. Minima aut et aut. Et eos atque dolore.', 2620.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2285, 'Mediocre Paper Bench', '6022728678358', 'mediocre-paper-bench', 'Perspiciatis quod magnam quia repellendus. Distinctio et dolor fugit.', 4441.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2286, 'Synergistic Iron Plate', '1717266295222', 'synergistic-iron-plate', 'Quisquam aut quis natus autem. Quo nemo harum cupiditate sunt sed.', 4963.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2287, 'Incredible Silk Plate', '1647539160912', 'incredible-silk-plate', 'Voluptas repellendus placeat voluptatum consequatur quaerat voluptas. Sint nam hic iure expedita vel. Et esse delectus aliquam ipsam fuga cumque.', 2248.18, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2288, 'Sleek Plastic Computer', '3840824288805', 'sleek-plastic-computer', 'Aut non quod non. Cupiditate inventore aut ea modi doloremque distinctio dolores.', 3457.66, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2289, 'Synergistic Copper Table', '1826537149765', 'synergistic-copper-table', 'Placeat veritatis quas provident repudiandae a aut aut aut. Omnis ex ut eos velit esse. Repudiandae autem labore in illum vel.', 642.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2290, 'Practical Copper Coat', '0706090357894', 'practical-copper-coat', 'Dolorem necessitatibus facere laudantium error possimus. Nostrum ducimus ut autem earum molestiae facere et voluptate.', 2678.61, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2291, 'Intelligent Aluminum Watch', '6664665483970', 'intelligent-aluminum-watch', 'Natus est voluptatum sapiente velit. Deleniti quisquam qui debitis pariatur ut.', 3103.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2292, 'Intelligent Granite Lamp', '0153722210285', 'intelligent-granite-lamp', 'Dolores asperiores quidem iusto aut dolores laborum. Velit dignissimos commodi quasi exercitationem rem sequi ratione. Est voluptas incidunt itaque sed quam consequatur eos provident.', 2215.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2293, 'Small Iron Pants', '6929031483740', 'small-iron-pants', 'Assumenda voluptas illo inventore recusandae fuga consequuntur in. Quisquam necessitatibus molestiae expedita iure. Mollitia voluptas accusantium eveniet perferendis.', 793.64, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2294, 'Awesome Silk Keyboard', '4414816819477', 'awesome-silk-keyboard', 'Enim minima aut non id commodi. Commodi perferendis odio est cum vel voluptas.', 3790.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2295, 'Small Copper Hat', '6061101551499', 'small-copper-hat', 'Laborum molestias ut et. Ipsam exercitationem quasi quibusdam odit.', 3720.34, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2296, 'Practical Concrete Bench', '7650634818972', 'practical-concrete-bench', 'Et dolorem et quia accusamus modi doloremque. Dolorem qui veritatis qui sit. Blanditiis repudiandae quod non suscipit quae sit.', 3959.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2297, 'Awesome Wool Plate', '7306229657586', 'awesome-wool-plate', 'Quidem sed impedit maiores labore ipsam sint qui rerum. Architecto maxime dolores numquam neque necessitatibus laborum voluptatibus.', 583.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2298, 'Intelligent Bronze Bag', '2188414809803', 'intelligent-bronze-bag', 'Natus quis officiis asperiores quae nihil hic dignissimos. Nostrum non ducimus porro rerum in. Cum pariatur et architecto ut et et.', 888.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2299, 'Mediocre Wooden Shirt', '2548077536988', 'mediocre-wooden-shirt', 'Minima alias ea et et. Quod aut voluptas molestiae velit.', 2900.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2300, 'Small Aluminum Knife', '5050282885913', 'small-aluminum-knife', 'Vitae sunt dolore excepturi fugiat reiciendis dolore dolorum. Hic consectetur nemo qui dolore iure.', 4447.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2301, 'Sleek Steel Pants', '6704271285824', 'sleek-steel-pants', 'Beatae tempora soluta quis fugiat beatae. Quod sunt voluptatem quasi doloremque commodi autem impedit. Corrupti nemo fuga neque vitae ab quasi omnis.', 1586.04, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2302, 'Awesome Plastic Watch', '4656723334661', 'awesome-plastic-watch', 'Rerum praesentium voluptatem repellendus fugit quo modi ut incidunt. Modi in est nam est aut odio.', 4411.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2303, 'Incredible Paper Computer', '8469096841287', 'incredible-paper-computer', 'Officia aut inventore consequatur dolores ut vel. Magnam tenetur et sunt quo reiciendis consequatur iure dolorem. Eos sed qui neque perferendis.', 4218.7, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2304, 'Synergistic Aluminum Pants', '7197460248417', 'synergistic-aluminum-pants', 'Sed delectus aut deleniti expedita doloribus minima. Optio eaque quas et itaque. Eum quod et qui sed eos consequatur.', 918.51, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2305, 'Fantastic Paper Gloves', '5649932102403', 'fantastic-paper-gloves', 'Accusamus voluptatem adipisci sunt facilis. Esse maiores rerum quis rerum deleniti.', 4606.68, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2306, 'Rustic Leather Lamp', '1917245275386', 'rustic-leather-lamp', 'Voluptatem sed numquam repellat expedita ut. Sed maxime nihil officia. Officia repellendus impedit ad rerum dolor deleniti.', 49.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2307, 'Intelligent Concrete Coat', '9768249750674', 'intelligent-concrete-coat', 'Voluptatem ut accusantium debitis laboriosam sit et. Fuga molestiae neque temporibus modi quas. Culpa eaque ducimus non enim dolorem perferendis sint.', 3430.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2308, 'Rustic Marble Bag', '9059829797418', 'rustic-marble-bag', 'Excepturi nisi est sint sit omnis ipsum. Quis enim non et voluptatem. Officiis nobis et numquam reprehenderit non.', 632.52, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2309, 'Lightweight Wooden Wallet', '9980046089492', 'lightweight-wooden-wallet', 'Et molestiae repellendus iste reprehenderit possimus. Autem voluptatem illum laboriosam veritatis. Et praesentium dignissimos sit asperiores ipsum quia.', 1365.42, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2310, 'Aerodynamic Iron Bottle', '9856621388475', 'aerodynamic-iron-bottle', 'Aut porro molestias et nobis pariatur necessitatibus temporibus. Eum doloremque minus quo dolore. Doloribus est qui qui repellendus.', 3757.67, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2311, 'Intelligent Granite Keyboard', '7011794880429', 'intelligent-granite-keyboard', 'In necessitatibus nostrum consequatur et consectetur ut. Eligendi quisquam numquam blanditiis suscipit mollitia.', 3924.53, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2312, 'Awesome Paper Computer', '7253516638561', 'awesome-paper-computer', 'Qui quidem quibusdam sint nobis. Eum voluptatem veritatis sequi.', 2204.5, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2313, 'Mediocre Bronze Knife', '9949169388684', 'mediocre-bronze-knife', 'Laborum ab harum at placeat distinctio ipsum. Praesentium aliquam molestiae quia nam. Itaque nobis qui maiores sit quisquam.', 3595.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2314, 'Gorgeous Plastic Computer', '6051647673335', 'gorgeous-plastic-computer', 'Nemo est vitae dolore perferendis. Accusantium aliquam eveniet corrupti corporis est aut.', 1997.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2315, 'Intelligent Wooden Keyboard', '5025761387493', 'intelligent-wooden-keyboard', 'Exercitationem voluptatem ipsum nihil maiores cupiditate ut autem. Nobis quae enim velit similique. Amet consequatur doloribus nesciunt consequuntur modi rem iste.', 510.38, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2316, 'Rustic Leather Pants', '0354439957023', 'rustic-leather-pants', 'Nihil nesciunt est et nobis velit. Sapiente atque minus commodi. Illum id nihil atque libero aperiam.', 4892.56, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2317, 'Lightweight Leather Table', '0676804673940', 'lightweight-leather-table', 'Nam fugiat minus vero qui. Enim quidem quas corporis cum corporis consequatur natus. Praesentium dignissimos sit consequatur magnam nisi.', 4249.85, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2318, 'Sleek Leather Keyboard', '5286842464575', 'sleek-leather-keyboard', 'Sit est animi itaque animi recusandae sit ipsam. Ipsum nobis eum doloribus sit aut iusto consequuntur.', 494.72, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2319, 'Durable Copper Knife', '7884843933885', 'durable-copper-knife', 'Reiciendis et dolor voluptas mollitia non illum sunt quo. Molestiae quidem consequatur eos eveniet nisi deserunt nemo vel. In est corrupti perferendis eveniet qui.', 1313.1, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2320, 'Heavy Duty Copper Gloves', '8630536166646', 'heavy-duty-copper-gloves', 'Vero ut in animi. Nemo sunt vero est. Qui qui provident et exercitationem.', 3168.06, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2321, 'Sleek Cotton Plate', '3709321242584', 'sleek-cotton-plate', 'Consequatur dolorem deserunt dicta consectetur nobis. Voluptatem nulla est fugit ut.', 3787.26, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2322, 'Heavy Duty Copper Bench', '6795517132279', 'heavy-duty-copper-bench', 'Quasi omnis numquam alias expedita voluptatum ratione repudiandae repudiandae. Illo qui id totam at quo doloremque et esse.', 146.57, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2323, 'Practical Iron Table', '5865110641049', 'practical-iron-table', 'Est autem vel porro porro quas. Minima qui nam eum dolorem laudantium dolorum. Nostrum voluptatum tenetur provident ut et qui.', 4279.14, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2324, 'Heavy Duty Paper Pants', '5787103293298', 'heavy-duty-paper-pants', 'Doloribus libero aliquam totam eius est odio. Voluptatem et aperiam et optio. Voluptas qui veniam eos.', 2284.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2325, 'Ergonomic Paper Car', '6601113788805', 'ergonomic-paper-car', 'Maiores tempora et sint dignissimos qui officiis. Amet nihil pariatur minima sit.', 1082.95, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2326, 'Incredible Wooden Hat', '8024943704216', 'incredible-wooden-hat', 'Eius iusto harum eos temporibus natus dolore. Ea consequatur in odit excepturi voluptatem.', 2991.31, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2327, 'Heavy Duty Wool Computer', '5873937611442', 'heavy-duty-wool-computer', 'Cupiditate neque vel fugiat sint consequatur. Velit soluta consequuntur alias at magnam ad officiis. Iste et inventore aut esse odio voluptatem ea.', 2560.41, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2328, 'Practical Bronze Keyboard', '2629178463912', 'practical-bronze-keyboard', 'Aliquam quas voluptatem ut odio veniam. Aspernatur eum est dolorum. Illo repudiandae ex eos odio possimus.', 899.19, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2329, 'Ergonomic Iron Chair', '3587307188541', 'ergonomic-iron-chair', 'Quia totam provident rerum temporibus autem tenetur. Veritatis est ea nam earum.', 4182.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2330, 'Awesome Bronze Wallet', '3890527857075', 'awesome-bronze-wallet', 'In tempora qui nihil doloremque eos unde sunt accusantium. Tenetur voluptatem maiores eos qui quia. Dolorum perspiciatis aliquid autem omnis rerum aliquam explicabo.', 1084.02, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2331, 'Synergistic Granite Plate', '8937213774270', 'synergistic-granite-plate', 'Qui voluptatibus est quia numquam quis qui. Culpa dolor tenetur alias sit sed amet tenetur.', 3267.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2332, 'Gorgeous Marble Plate', '3608418177917', 'gorgeous-marble-plate', 'Ullam voluptatibus magnam facilis sequi omnis consequatur iste et. Consequuntur ipsam placeat molestias rem tempore iure.', 1193.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2333, 'Synergistic Iron Lamp', '3819887981350', 'synergistic-iron-lamp', 'Quam qui voluptatum dignissimos ducimus ut. Esse molestiae qui et nostrum. Saepe totam vero quidem.', 640.24, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2334, 'Rustic Wooden Bottle', '2457108597983', 'rustic-wooden-bottle', 'Quod at accusamus libero vel soluta esse vel. Fuga iusto sit non sequi.', 2968.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2335, 'Durable Aluminum Car', '2478216395926', 'durable-aluminum-car', 'Veniam quia saepe dolorum corrupti porro. Ipsum ut quisquam facilis et quam.', 3222.94, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2336, 'Durable Wooden Bottle', '4770972262466', 'durable-wooden-bottle', 'Deleniti hic enim ut culpa sed dolorem. Explicabo minima eaque rem qui quam.', 4325.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2337, 'Lightweight Bronze Table', '5284344070867', 'lightweight-bronze-table', 'Eos hic qui doloremque nihil. Et et et saepe autem. Enim nihil eligendi est.', 4718.4, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2338, 'Fantastic Linen Knife', '5256934008086', 'fantastic-linen-knife', 'Voluptatem voluptatem porro et rerum dolorum rerum corrupti. Qui et aut magni sunt atque et dignissimos. Qui omnis saepe rerum fugit rerum et est.', 4333.84, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2339, 'Gorgeous Copper Bench', '3595497755016', 'gorgeous-copper-bench', 'Dicta in non doloribus neque et. Dicta consequatur et dolorem consequatur itaque error. Quo qui explicabo amet eaque officia dolores a.', 4558.62, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2340, 'Durable Steel Table', '6118835423186', 'durable-steel-table', 'Quo perspiciatis occaecati voluptatem et eum. Laborum amet perspiciatis sed voluptates vero aut.', 3452.48, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2341, 'Intelligent Copper Shoes', '8706181306833', 'intelligent-copper-shoes', 'Aliquam velit neque quod aspernatur aut ea accusamus. Labore est repudiandae quae vel ut nisi deserunt officia. Nihil aut tempore tempore et vel minima qui.', 75.58, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2342, 'Lightweight Concrete Coat', '7254866139883', 'lightweight-concrete-coat', 'Aut eum deleniti commodi ad. Dolor voluptas rerum corporis et numquam voluptas.', 4027.39, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2343, 'Gorgeous Silk Shoes', '2462841737923', 'gorgeous-silk-shoes', 'Consequatur laborum autem perferendis laudantium suscipit rerum voluptatum laudantium. Rerum enim aut error enim molestiae totam sed autem.', 1606.49, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2344, 'Practical Silk Knife', '6200828751281', 'practical-silk-knife', 'Quod quaerat est beatae cumque sed est. Voluptate ratione velit eaque blanditiis totam optio. Possimus ratione repellendus optio dolores ut molestiae vitae.', 2220.86, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2345, 'Enormous Steel Wallet', '0407914592995', 'enormous-steel-wallet', 'Maiores temporibus nemo aut. Commodi ullam nesciunt quae aut.', 3277.91, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2346, 'Aerodynamic Plastic Shirt', '1026773836782', 'aerodynamic-plastic-shirt', 'Repudiandae hic saepe dolores soluta. Aperiam impedit consequatur repellendus iste perspiciatis eaque.', 276.01, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2347, 'Incredible Wooden Lamp', '5623529292661', 'incredible-wooden-lamp', 'Reiciendis voluptatem nihil dolor. Assumenda quaerat laudantium error voluptas ipsum minima repellat. Magnam quis quidem temporibus quod.', 521.37, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2348, 'Gorgeous Leather Table', '1091897400225', 'gorgeous-leather-table', 'Quo itaque blanditiis accusantium ut aperiam hic. Recusandae totam praesentium vitae quo in.', 2127.93, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2349, 'Practical Steel Car', '1810886520405', 'practical-steel-car', 'Earum ducimus magni corrupti ab quibusdam et. Quia reprehenderit veniam quo est quo. Consequuntur molestiae ut qui eos dolor.', 1585.99, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2350, 'Enormous Iron Lamp', '9940605100532', 'enormous-iron-lamp', 'Non vitae cupiditate qui eos odio totam. Qui excepturi quas illum aut porro saepe.', 3058.96, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2351, 'Heavy Duty Aluminum Gloves', '1695142105493', 'heavy-duty-aluminum-gloves', 'Est mollitia sed facere adipisci cupiditate quae. Dolorum impedit similique hic omnis consequatur beatae. Quos quis sint vel laboriosam est ea amet.', 3711.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2352, 'Enormous Cotton Computer', '1796471037292', 'enormous-cotton-computer', 'Impedit sapiente enim ut placeat. Voluptas facilis eligendi molestias facere perspiciatis totam. Tenetur incidunt similique voluptatibus officia.', 1511.07, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2353, 'Awesome Rubber Chair', '4187628647735', 'awesome-rubber-chair', 'Quos aliquam rerum neque eos totam quaerat. Consequatur nulla ab molestias ab quia.', 3207.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2354, 'Synergistic Linen Pants', '8001360103969', 'synergistic-linen-pants', 'Aliquid quia numquam et debitis. Hic tempora expedita vitae excepturi itaque veritatis.', 3896.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2355, 'Enormous Steel Table', '2462735843396', 'enormous-steel-table', 'Assumenda delectus quia doloribus qui laboriosam. Consequatur labore reiciendis nostrum architecto in ut qui. Tenetur voluptas maxime non ea.', 3696.08, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2356, 'Lightweight Steel Gloves', '3562846388218', 'lightweight-steel-gloves', 'Fugit voluptatem aut distinctio porro. Id dolores sequi architecto. Ipsam impedit omnis dolorem delectus cum minima dolore.', 1937.87, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2357, 'Rustic Steel Bag', '0510154539306', 'rustic-steel-bag', 'Repudiandae voluptatem est dignissimos cupiditate ipsam nobis. Et accusantium a adipisci sit.', 2024.73, '2025-07-22 13:39:07', '2025-07-22 13:39:07'),
(2358, 'Durable Wooden Chair', '3274119381573', 'durable-wooden-chair', 'Et et vero ut iste nulla soluta quae. Porro qui alias unde recusandae in.', 143.55, '2025-07-22 13:39:07', '2025-07-22 13:39:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indices de la tabla `bill_products`
--
ALTER TABLE `bill_products`
  ADD PRIMARY KEY (`bill_product_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `bill_products`
--
ALTER TABLE `bill_products`
  MODIFY `bill_product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2359;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
