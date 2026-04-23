-- ==========================================================
-- EXAMEN PRÁCTICO: BASES DE DATOS AVANZADAS
-- ALUMNO: Luis Angel Palacio Hernandez
-- CARRERA: Desarrollo de Software Multiplataforma
-- ==========================================================

-- 0. PREPARACIÓN DEL ENTORNO 
CREATE DATABASE IF NOT EXISTS logistica_uta;
USE logistica_uta;

-- Creación de tablas base
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    puesto VARCHAR(50)
);

CREATE TABLE envios (
    id_envio INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    fecha DATE,
    costo_total DECIMAL(10,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Datos de prueba
INSERT INTO clientes (nombre, ciudad) VALUES ('Empresa Alfa', 'Aguascalientes'), ('Boutique Beta', 'León');
INSERT INTO empleados (nombre, puesto) VALUES ('Juan Pérez', 'Chofer'), ('María López', 'Logística');
INSERT INTO envios VALUES (NULL, 1, 1, CURDATE(), 1200.50, 'Entregado'), (NULL, 2, 2, CURDATE(), 850.00, 'Pendiente');


-- ==========================================================
-- UNIDAD I: EXTRACCIÓN DE DATOS (DQL)
-- ==========================================================

-- 1. Consulta con JOINs: Obtener envíos con nombre de cliente y empleado asignado
-- Razonamiento: Utilizamos INNER JOIN para combinar datos relacionados de múltiples tablas.
SELECT e.id_envio, c.nombre AS Cliente, emp.nombre AS Repartidor, e.costo_total
FROM envios e
INNER JOIN clientes c ON e.id_cliente = c.id_cliente
INNER JOIN empleados emp ON e.id_empleado = emp.id_empleado;

-- 2. Subconsulta: Listar envíos cuyo costo es superior al promedio general
-- Razonamiento: Filtramos dinámicamente comparando cada fila contra el AVG calculado.
SELECT id_envio, fecha, costo_total
FROM envios
WHERE costo_total > (SELECT AVG(costo_total) FROM envios);

-- 3. Creación de una VISTA: Reporte ejecutivo de envíos pendientes
-- Razonamiento: Simplifica consultas frecuentes y mejora la seguridad al limitar el acceso a datos específicos.
CREATE OR REPLACE VIEW vista_envios_pendientes AS
SELECT id_envio, fecha, costo_total 
FROM envios 
WHERE estado = 'Pendiente';


-- ==========================================================
-- UNIDAD II: PROGRAMACIÓN PROCEDIMENTAL
-- ==========================================================

-- 1. FUNCIÓN: Calcular el IVA (16%) de un envío
-- Razonamiento: Permite reutilizar la lógica de cálculo del impuesto en múltiples consultas o procedimientos.
DELIMITER //
CREATE FUNCTION fn_calcular_iva(monto DECIMAL(10,2)) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    RETURN monto * 0.16;
END //
DELIMITER ;

-- 2. PROCEDIMIENTO ALMACENADO: Registrar un nuevo envío con Transacción (ACID)
-- Razonamiento: Usamos START TRANSACTION para asegurar que el registro sea Atómico.
DELIMITER //
CREATE PROCEDURE sp_registrar_envio(
    IN p_cliente INT, IN p_empleado INT, IN p_monto DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK; 
    END;

    START TRANSACTION;
        INSERT INTO envios (id_cliente, id_empleado, fecha, costo_total, estado)
        VALUES (p_cliente, p_empleado, CURDATE(), p_monto, 'Pendiente');
    COMMIT;
END //
DELIMITER ;

-- 3. TRIGGER: Auditoría de cambios en costos
-- Razonamiento: Automatiza el registro de modificaciones para seguridad de los datos.
CREATE TABLE bitacora_costos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    costo_anterior DECIMAL(10,2),
    costo_nuevo DECIMAL(10,2),
    usuario VARCHAR(50),
    fecha_cambio DATETIME
);

DELIMITER //
CREATE TRIGGER tg_auditar_actualizacion_costo
AFTER UPDATE ON envios
FOR EACH ROW
BEGIN
    IF OLD.costo_total <> NEW.costo_total THEN
        INSERT INTO bitacora_costos (id_envio, costo_anterior, costo_nuevo, usuario, fecha_cambio)
        VALUES (OLD.id_envio, OLD.costo_total, NEW.costo_total, USER(), NOW());
    END IF;
END //
DELIMITER ;


-- ==========================================================
-- UNIDAD III: GESTIÓN Y ADMINISTRACIÓN (DCL/TCL)
-- ==========================================================

-- 1. Gestión de Seguridad: Crear usuario y asignar privilegios
-- Razonamiento: Aplicamos el principio de menor privilegio.
CREATE USER IF NOT EXISTS 'analista_logistica'@'localhost' IDENTIFIED BY 'Uta2026!';
GRANT SELECT ON logistica_uta.vista_envios_pendientes TO 'analista_logistica'@'localhost';

-- 2. Ejemplo de Control de Transacciones (TCL)
-- Razonamiento: Se muestra el uso de SAVEPOINT para revertir acciones parciales.
START TRANSACTION;
    UPDATE envios SET costo_total = costo_total + 100 WHERE id_envio = 1;
    SAVEPOINT ajuste_manual;
    DELETE FROM envios WHERE id_envio = 2; 
    ROLLBACK TO ajuste_manual;
COMMIT;

FLUSH PRIVILEGES;