-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2021 a las 08:40:01
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mvc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `NumerodeDocumento` int(11) NOT NULL,
  `CarnetdeTrabajo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritodecompra`
--

CREATE TABLE `carritodecompra` (
  `CodigoCarritodeCompra` int(11) NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `NombreProducto` varchar(100) NOT NULL,
  `FechadeCreacion` date NOT NULL,
  `FechadeVencimiento` date NOT NULL,
  `Activo` enum('SI','NO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CodigoCategoria` int(11) NOT NULL,
  `NombredeCategoria` varchar(100) NOT NULL,
  `DescripcionCategoria` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodigoCategoria`, `NombredeCategoria`, `DescripcionCategoria`) VALUES
(1, 'verduras', 'categoria verduras'),
(2, 'frutas', 'categoria de frutas '),
(3, 'tuberculos', 'categoria  tuberculos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `NumerodeDocumento` int(11) NOT NULL,
  `Ciudad` varchar(200) NOT NULL,
  `Direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecarritodecompra`
--

CREATE TABLE `detallecarritodecompra` (
  `CodigoCarritodeCompra` int(11) NOT NULL,
  `CodigoProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledeenvio`
--

CREATE TABLE `detalledeenvio` (
  `CodigoEnvio` int(11) NOT NULL,
  `EnPreparacion` int(11) NOT NULL,
  `EnCamino` int(11) NOT NULL,
  `Entregado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledefactura`
--

CREATE TABLE `detalledefactura` (
  `CodigoFactura` int(11) NOT NULL,
  `CodigoProducto` int(11) NOT NULL,
  `CodigoFormadePago` int(11) NOT NULL,
  `ValorUnitario` decimal(10,0) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Subtotal` decimal(10,0) NOT NULL,
  `ValorDomicilio` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledepedido`
--

CREATE TABLE `detalledepedido` (
  `CodigoPedido` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ValorUnitario` decimal(10,0) NOT NULL,
  `SubTotal` decimal(10,0) NOT NULL,
  `ValorDomicilio` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliarios`
--

CREATE TABLE `domiciliarios` (
  `NumerodeDocumento` int(11) NOT NULL,
  `CarnetdeTrabajo` varchar(100) NOT NULL,
  `NumeroSeguroDom` varchar(200) NOT NULL,
  `NumeroSeguroVehi` varchar(100) NOT NULL,
  `ValorDomicilio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `CodigoEnvio` int(11) NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `CodigoPedido` int(11) NOT NULL,
  `CodigoFactura` int(11) NOT NULL,
  `DireccionEnvio` varchar(100) NOT NULL,
  `Activo` enum('SI','NO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `CodigoFactura` int(11) NOT NULL,
  `CodigoCarritodeCompra` int(11) NOT NULL,
  `CodigoPedido` int(11) NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `FechadeCreacion` date NOT NULL,
  `Activo` enum('SI','NO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formasdepago`
--

CREATE TABLE `formasdepago` (
  `CodigoFormadePago` int(11) NOT NULL,
  `NombreFormadePago` varchar(100) NOT NULL,
  `DescripcionFormadePago` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagospse`
--

CREATE TABLE `pagospse` (
  `CodigoFormadePago` int(11) NOT NULL,
  `TipoFormadePago` enum('NEQUI','DAVIPLATA') NOT NULL,
  `NombreTitular` varchar(100) NOT NULL,
  `TipodePersona` enum('NATURAL','JURIDICA') NOT NULL,
  `TipodeDocumento` enum('T.I','C.C','C.E') NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `NumeroTelefonico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `CodigoPedido` int(11) NOT NULL,
  `CodigoCarritodeCompra` int(11) NOT NULL,
  `CodigoProducto` int(11) NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `NombreProducto` varchar(100) NOT NULL,
  `CodigoMediodePago` int(11) NOT NULL,
  `FechadeCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `TipodeDocumento` enum('C.C','T.I','C.E') NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `Telefono` varchar(100) NOT NULL,
  `CorreoElectronico` varchar(200) NOT NULL,
  `Sexo` enum('F','M') NOT NULL,
  `Contrasena` varchar(400) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Nombres`, `Apellidos`, `TipodeDocumento`, `NumerodeDocumento`, `Telefono`, `CorreoElectronico`, `Sexo`, `Contrasena`, `id_rol`) VALUES
('Raul', 'Castro Arias', 'C.C', 73248974, '3115987468', 'raul@gmail.com', 'M', '25f9e794323b453885f5181f1b624d0b', 3),
('camilo', 'Cuervo', 'C.C', 1012432120, '3014391260', 'bccuervo0@gmail.com', 'M', '9ae2be73b58b565bce3e47493a56e26a', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CodigoProducto` int(11) NOT NULL,
  `CodigoCategoria` int(11) NOT NULL,
  `NitProveedor` varchar(100) NOT NULL,
  `NombreProducto` varchar(100) NOT NULL,
  `ValorUnitario` decimal(10,0) NOT NULL,
  `Imagen` blob NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CodigoProducto`, `CodigoCategoria`, `NitProveedor`, `NombreProducto`, `ValorUnitario`, `Imagen`, `Cantidad`) VALUES
(8, 2, '123456789', 'manzana', '1000', '', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `NumerodeDocumento` int(11) NOT NULL,
  `NitProveedor` varchar(100) NOT NULL,
  `Ciudad` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`NumerodeDocumento`, `NitProveedor`, `Ciudad`) VALUES
(73248974, '123456789', 'Soacha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `Rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id`, `Rol`) VALUES
(1, 'Cliente'),
(2, 'vendedor'),
(3, 'proveedor'),
(4, 'administrador'),
(5, 'domiciliario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `CodigoFormadePago` int(11) NOT NULL,
  `TipodeTarjeta` enum('DEBITO','CREDITO') NOT NULL,
  `Numerodetarjeta` int(11) NOT NULL,
  `NombredelaTarjeta` varchar(100) NOT NULL,
  `FechadeExpiracion` date NOT NULL,
  `CodigodeSeguridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `CarnetdeTrabajo` varchar(200) NOT NULL,
  `NumerodeDocumento` int(11) NOT NULL,
  `FechadeIngreso` date NOT NULL,
  `SueldoBasico` decimal(10,0) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Estrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD UNIQUE KEY `CarnetdeTrabajo` (`CarnetdeTrabajo`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`);

--
-- Indices de la tabla `carritodecompra`
--
ALTER TABLE `carritodecompra`
  ADD PRIMARY KEY (`CodigoCarritodeCompra`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`),
  ADD KEY `NombreProducto` (`NombreProducto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CodigoCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`NumerodeDocumento`);

--
-- Indices de la tabla `detallecarritodecompra`
--
ALTER TABLE `detallecarritodecompra`
  ADD KEY `CodigoCarritodeCompra` (`CodigoCarritodeCompra`),
  ADD KEY `CodigoProducto` (`CodigoProducto`),
  ADD KEY `Cantidad` (`Cantidad`);

--
-- Indices de la tabla `detalledeenvio`
--
ALTER TABLE `detalledeenvio`
  ADD KEY `CodigoEnvio` (`CodigoEnvio`);

--
-- Indices de la tabla `detalledefactura`
--
ALTER TABLE `detalledefactura`
  ADD KEY `CodigoFactura` (`CodigoFactura`),
  ADD KEY `CodigoProducto` (`CodigoProducto`),
  ADD KEY `CodigoFormadePago` (`CodigoFormadePago`),
  ADD KEY `ValorUnitario` (`ValorUnitario`),
  ADD KEY `Cantidad` (`Cantidad`),
  ADD KEY `Subtotal` (`Subtotal`),
  ADD KEY `ValorDomicilio` (`ValorDomicilio`),
  ADD KEY `Total` (`Total`);

--
-- Indices de la tabla `detalledepedido`
--
ALTER TABLE `detalledepedido`
  ADD KEY `CodigoPedido` (`CodigoPedido`),
  ADD KEY `Cantidad` (`Cantidad`),
  ADD KEY `ValorUnitario` (`ValorUnitario`),
  ADD KEY `ValorDomicilio` (`ValorDomicilio`),
  ADD KEY `SubTotal` (`SubTotal`,`Total`),
  ADD KEY `Total` (`Total`);

--
-- Indices de la tabla `domiciliarios`
--
ALTER TABLE `domiciliarios`
  ADD PRIMARY KEY (`CarnetdeTrabajo`),
  ADD UNIQUE KEY `NumeroSeguroDom` (`NumeroSeguroDom`),
  ADD UNIQUE KEY `NumeroSeguroVehi` (`NumeroSeguroVehi`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`),
  ADD KEY `ValorDomicilio` (`ValorDomicilio`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`CodigoEnvio`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`),
  ADD KEY `CodigoPedido` (`CodigoPedido`),
  ADD KEY `CodigoFactura` (`CodigoFactura`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`CodigoFactura`),
  ADD KEY `CodigoCarritodeCompra` (`CodigoCarritodeCompra`),
  ADD KEY `CodigoPedido` (`CodigoPedido`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`);

--
-- Indices de la tabla `formasdepago`
--
ALTER TABLE `formasdepago`
  ADD PRIMARY KEY (`CodigoFormadePago`);

--
-- Indices de la tabla `pagospse`
--
ALTER TABLE `pagospse`
  ADD KEY `CodigoFormadePago` (`CodigoFormadePago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`CodigoPedido`),
  ADD KEY `CodigoCarritodeCompra` (`CodigoCarritodeCompra`),
  ADD KEY `CodigoProducto` (`CodigoProducto`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`),
  ADD KEY `NombreProducto` (`NombreProducto`),
  ADD KEY `CodigoMediodePago` (`CodigoMediodePago`),
  ADD KEY `FechadeCreacion` (`FechadeCreacion`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`NumerodeDocumento`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CodigoProducto`),
  ADD KEY `CodigoCategoria` (`CodigoCategoria`),
  ADD KEY `NitProveedor` (`NitProveedor`),
  ADD KEY `ValorUnitario` (`ValorUnitario`),
  ADD KEY `NombreProducto` (`NombreProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`NitProveedor`),
  ADD UNIQUE KEY `NumerodeDocumento` (`NumerodeDocumento`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD KEY `CodigoFormadePago` (`CodigoFormadePago`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`CarnetdeTrabajo`),
  ADD KEY `NumerodeDocumento` (`NumerodeDocumento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritodecompra`
--
ALTER TABLE `carritodecompra`
  MODIFY `CodigoCarritodeCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CodigoCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `CodigoEnvio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `CodigoFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formasdepago`
--
ALTER TABLE `formasdepago`
  MODIFY `CodigoFormadePago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `CodigoPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `CodigoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `persona` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carritodecompra`
--
ALTER TABLE `carritodecompra`
  ADD CONSTRAINT `carritodecompra_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `clientes` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carritodecompra_ibfk_2` FOREIGN KEY (`NombreProducto`) REFERENCES `productos` (`NombreProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `persona` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallecarritodecompra`
--
ALTER TABLE `detallecarritodecompra`
  ADD CONSTRAINT `detallecarritodecompra_ibfk_1` FOREIGN KEY (`CodigoProducto`) REFERENCES `productos` (`CodigoProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallecarritodecompra_ibfk_2` FOREIGN KEY (`CodigoCarritodeCompra`) REFERENCES `carritodecompra` (`CodigoCarritodeCompra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledeenvio`
--
ALTER TABLE `detalledeenvio`
  ADD CONSTRAINT `detalledeenvio_ibfk_1` FOREIGN KEY (`CodigoEnvio`) REFERENCES `envio` (`CodigoEnvio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledefactura`
--
ALTER TABLE `detalledefactura`
  ADD CONSTRAINT `detalledefactura_ibfk_1` FOREIGN KEY (`CodigoFactura`) REFERENCES `facturas` (`CodigoFactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_2` FOREIGN KEY (`CodigoProducto`) REFERENCES `detalledepedido` (`CodigoPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_3` FOREIGN KEY (`CodigoFormadePago`) REFERENCES `pedido` (`CodigoMediodePago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_4` FOREIGN KEY (`ValorUnitario`) REFERENCES `detalledepedido` (`ValorUnitario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_5` FOREIGN KEY (`Cantidad`) REFERENCES `detalledepedido` (`Cantidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_6` FOREIGN KEY (`Subtotal`) REFERENCES `detalledepedido` (`SubTotal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_7` FOREIGN KEY (`ValorDomicilio`) REFERENCES `detalledepedido` (`ValorDomicilio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledefactura_ibfk_8` FOREIGN KEY (`Total`) REFERENCES `detalledepedido` (`Total`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledepedido`
--
ALTER TABLE `detalledepedido`
  ADD CONSTRAINT `detalledepedido_ibfk_1` FOREIGN KEY (`CodigoPedido`) REFERENCES `pedido` (`CodigoPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledepedido_ibfk_2` FOREIGN KEY (`Cantidad`) REFERENCES `detallecarritodecompra` (`Cantidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledepedido_ibfk_3` FOREIGN KEY (`ValorDomicilio`) REFERENCES `domiciliarios` (`ValorDomicilio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledepedido_ibfk_4` FOREIGN KEY (`ValorUnitario`) REFERENCES `productos` (`ValorUnitario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `domiciliarios`
--
ALTER TABLE `domiciliarios`
  ADD CONSTRAINT `domiciliarios_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `persona` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `clientes` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`CodigoCarritodeCompra`) REFERENCES `carritodecompra` (`CodigoCarritodeCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`CodigoPedido`) REFERENCES `pedido` (`CodigoPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `pedido` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagospse`
--
ALTER TABLE `pagospse`
  ADD CONSTRAINT `pagospse_ibfk_1` FOREIGN KEY (`CodigoFormadePago`) REFERENCES `formasdepago` (`CodigoFormadePago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`CodigoCarritodeCompra`) REFERENCES `carritodecompra` (`CodigoCarritodeCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`CodigoProducto`) REFERENCES `productos` (`CodigoProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `clientes` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`NombreProducto`) REFERENCES `carritodecompra` (`NombreProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`CodigoMediodePago`) REFERENCES `formasdepago` (`CodigoFormadePago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CodigoCategoria`) REFERENCES `categoria` (`CodigoCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`NitProveedor`) REFERENCES `proveedores` (`NitProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `persona` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`CodigoFormadePago`) REFERENCES `formasdepago` (`CodigoFormadePago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`NumerodeDocumento`) REFERENCES `persona` (`NumerodeDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
