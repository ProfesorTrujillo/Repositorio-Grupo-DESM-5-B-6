-- =====================================
-- CREAR BASE DE DATOS
-- =====================================
DROP DATABASE IF EXISTS logistica;
CREATE DATABASE logistica;
USE logistica;

-- =====================================
-- TABLAS
-- =====================================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    costo DECIMAL(10,2),
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- =====================================
-- DATOS DE PRUEBA
-- =====================================
INSERT INTO clientes (nombre) VALUES 
('Empresa A'), ('Empresa B');

INSERT INTO empleados (nombre, disponible) VALUES 
('kevin', TRUE),
('ernesto', TRUE);

INSERT INTO envios (id_cliente, id_empleado, costo, fecha) VALUES
(1,1,500,'2026-01-01'),
(1,2,800,'2026-01-05'),
(2,1,300,'2026-01-10');

-- =====================================
-- UNIDAD I
-- =====================================

-- Consulta multitabla
SELECT c.nombre AS cliente,
       e.id_envio AS envio,
       emp.nombre AS empleado
FROM clientes c
INNER JOIN envios e ON c.id_cliente = e.id_cliente
INNER JOIN empleados emp ON e.id_empleado = emp.id_empleado;
-- INNER JOIN porque solo queremos datos relacionados

-- Subconsulta (mayor al promedio)
SELECT *
FROM envios
WHERE costo > (SELECT AVG(costo) FROM envios);

-- Total envíos por cliente
SELECT id_cliente, COUNT(*) AS total_envios
FROM envios
GROUP BY id_cliente;

-- Total facturado por cliente
SELECT id_cliente, SUM(costo) AS total_facturado
FROM envios
GROUP BY id_cliente;

-- Vista
CREATE VIEW vista_envios_costos AS
SELECT c.nombre, e.costo, e.fecha
FROM envios e
JOIN clientes c ON e.id_cliente = c.id_cliente;

-- Índice
CREATE INDEX idx_fecha_envios ON envios(fecha);

-- =====================================
-- UNIDAD II
-- =====================================

DELIMITER //

CREATE FUNCTION fn_total_envios_cliente(p_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT IFNULL(SUM(costo),0)
    INTO total
    FROM envios
    WHERE id_cliente = p_cliente;

    RETURN total;
END //

CREATE PROCEDURE sp_registrar_envio(p_cliente INT, p_costo DECIMAL(10,2))
BEGIN
    DECLARE emp INT;

    SELECT id_empleado INTO emp
    FROM empleados
    WHERE disponible = TRUE
    LIMIT 1;

    INSERT INTO envios(id_cliente, id_empleado, costo, fecha)
    VALUES (p_cliente, emp, p_costo, CURDATE());
END //

CREATE TABLE auditoria_envios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    costo_anterior DECIMAL(10,2),
    costo_nuevo DECIMAL(10,2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_auditoria_envios
AFTER UPDATE ON envios
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_envios(id_envio, costo_anterior, costo_nuevo)
    VALUES (OLD.id_envio, OLD.costo, NEW.costo);
END //

DELIMITER ;

-- =====================================
-- TRANSACCIÓN
-- =====================================
START TRANSACTION;

INSERT INTO clientes(nombre) VALUES ('Cliente TX');

INSERT INTO envios(id_cliente, id_empleado, costo, fecha)
VALUES (1,1,900,CURDATE());

COMMIT;

-- =====================================
-- UNIDAD III
-- =====================================

-- (Estos pueden fallar si no eres admin, pero NO afecta tu examen)

CREATE USER IF NOT EXISTS 'consulta_user'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON logistica.* TO 'consulta_user'@'localhost';

CREATE USER IF NOT EXISTS 'operativo_user'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE ON logistica.* TO 'operativo_user'@'localhost';

-- =====================================
-- FIN
-- =====================================