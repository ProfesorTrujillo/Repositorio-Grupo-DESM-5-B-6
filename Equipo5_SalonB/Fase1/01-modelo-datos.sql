-- CREACION DE BASE DE DATOS
CREATE DATABASE inventario_salon;
USE inventario_salon;

-- TABLA PROVEEDORES
CREATE TABLE proveedores(
id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100)
);

-- TABLA PRODUCTOS
CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
precio DECIMAL(10,2),
stock INT,
id_proveedor INT,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- TABLA CLIENTES
CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(20)
);

-- TABLA VENTAS
CREATE TABLE ventas(
id_venta INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
fecha DATE,
total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);