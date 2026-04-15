-- NOTA: No venía el CREATE TABLE completo en el documento,
-- solo estructura conceptual (diccionario de datos)

-- Ejemplo base reconstruido:

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT,
    id_categoria INT
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150),
    telefono_wa VARCHAR(15) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_registro DATETIME DEFAULT NOW(),
    estado VARCHAR(50)
);