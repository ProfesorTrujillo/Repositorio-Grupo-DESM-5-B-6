CREATE DATABASE logistica;
USE logistica;

-- CLIENTES
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- CENTROS DE DISTRIBUCIÓN
CREATE TABLE centros_distribucion (
    id_centro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(150)
);

-- EMPLEADOS
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(50),
    id_centro INT,
    FOREIGN KEY (id_centro) REFERENCES centros_distribucion(id_centro)
);

-- RUTAS
CREATE TABLE rutas (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    origen VARCHAR(100),
    destino VARCHAR(100),
    distancia_km DECIMAL(10,2)
);

-- ENVÍOS
CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_ruta INT,
    fecha_envio DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta)
);

-- COSTOS OPERATIVOS
CREATE TABLE costos_operativos (
    id_costo INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    combustible DECIMAL(10,2),
    mantenimiento DECIMAL(10,2),
    otros DECIMAL(10,2),
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio)
);

-- FACTURACIÓN
CREATE TABLE facturacion (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    total DECIMAL(10,2),
    fecha_factura DATE,
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio)
);

ALTER TABLE envios ADD id_empleado INT;
ALTER TABLE envios ADD FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);

/*
Se utiliza INNER JOIN porque solo se requieren registros que tengan relación en todas las tablas:
cliente, envío y empleado. Esto garantiza integridad en los datos mostrados.
*/
SELECT 
    c.nombre AS cliente,
    e.id_envio,
    emp.nombre AS empleado_responsable
FROM envios e
INNER JOIN clientes c ON e.id_cliente = c.id_cliente
INNER JOIN empleados emp ON e.id_empleado = emp.id_empleado;

SELECT *
FROM costos_operativos
WHERE (combustible + mantenimiento + otros) > (
    SELECT AVG(combustible + mantenimiento + otros)
    FROM costos_operativos
);

SELECT 
    c.nombre AS cliente,
    COUNT(e.id_envio) AS total_envios,
    SUM(f.total) AS total_facturado
FROM clientes c
LEFT JOIN envios e ON c.id_cliente = e.id_cliente
LEFT JOIN facturacion f ON e.id_envio = f.id_envio
GROUP BY c.nombre;

CREATE VIEW vista_ejecutiva_envios AS
SELECT 
    e.id_envio,
    c.nombre AS cliente,
    r.origen,
    r.destino,
    e.estado,
    (co.combustible + co.mantenimiento + co.otros) AS costo_total,
    f.total AS total_facturado
FROM envios e
JOIN clientes c ON e.id_cliente = c.id_cliente
JOIN rutas r ON e.id_ruta = r.id_ruta
JOIN costos_operativos co ON e.id_envio = co.id_envio
JOIN facturacion f ON e.id_envio = f.id_envio;

CREATE INDEX idx_fecha_envio ON envios(fecha_envio);

SELECT * FROM envios WHERE fecha_envio = '2026-04-23';

DELIMITER $$

CREATE FUNCTION fn_costo_total_cliente(p_id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT IFNULL(SUM(co.combustible + co.mantenimiento + co.otros),0)
    INTO total
    FROM envios e
    JOIN costos_operativos co ON e.id_envio = co.id_envio
    WHERE e.id_cliente = p_id_cliente;

    RETURN total;
END $$

DELIMITER ;

SELECT fn_costo_total_cliente(1);

DELIMITER $$

CREATE PROCEDURE sp_registrar_envio (
    IN p_id_cliente INT,
    IN p_id_ruta INT,
    IN p_fecha DATE
)
BEGIN
    DECLARE v_empleado INT;

    -- Seleccionar un empleado disponible (ejemplo: el primero)
    SELECT id_empleado INTO v_empleado
    FROM empleados
    LIMIT 1;

    -- Insertar envío
    INSERT INTO envios (id_cliente, id_ruta, fecha_envio, estado, id_empleado)
    VALUES (p_id_cliente, p_id_ruta, p_fecha, 'Pendiente', v_empleado);

END $$

DELIMITER ;

CALL sp_registrar_envio(1, 1, '2026-04-23');

CREATE TABLE auditoria_costos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_envio INT,
    costo_anterior DECIMAL(10,2),
    costo_nuevo DECIMAL(10,2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_auditoria_costos
AFTER UPDATE ON costos_operativos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_costos (
        id_envio,
        costo_anterior,
        costo_nuevo
    )
    VALUES (
        OLD.id_envio,
        (OLD.combustible + OLD.mantenimiento + OLD.otros),
        (NEW.combustible + NEW.mantenimiento + NEW.otros)
    );
END $$

DELIMITER ;

START TRANSACTION;

-- Insertar envío
INSERT INTO envios (id_cliente, id_ruta, fecha_envio, estado, id_empleado)
VALUES (1, 1, '2026-04-23', 'Pendiente', 1);

-- Obtener último ID
SET @id_envio = LAST_INSERT_ID();

-- Insertar costos
INSERT INTO costos_operativos (id_envio, combustible, mantenimiento, otros)
VALUES (@id_envio, 500, 200, 100);

-- Insertar facturación
INSERT INTO facturacion (id_envio, total, fecha_factura)
VALUES (@id_envio, 800, CURDATE());

-- Confirmar cambios
COMMIT;

-- Si ocurre error:
-- ROLLBACK;

CREATE USER 'consulta_user'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT ON logistica.* TO 'consulta_user'@'localhost';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON logistica.* TO 'admin_user'@'localhost' WITH GRANT OPTION;

CREATE USER 'operativo_user'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE ON logistica.* TO 'operativo_user'@'localhost';

-- Respaldo completo (desde consola)
-- mysqldump -u root -p logistica > respaldo.sql

-- Restaurar base de datos
-- mysql -u root -p logistica < respaldo.sql

/*
La replicación se implementaría utilizando un servidor maestro (master)
y uno o más servidores esclavos (slave).

El servidor maestro registra todos los cambios en un log binario.
Los servidores esclavos replican automáticamente estos cambios.

Esto permite:
- Alta disponibilidad
- Balanceo de carga
- Recuperación ante fallos

Configuración básica:
1. Activar log_bin en el servidor maestro
2. Crear usuario de replicación
3. Configurar los esclavos con CHANGE MASTER TO
4. Iniciar replicación con START SLAVE
*/

/*
La fragmentación consiste en dividir la base de datos en partes más pequeñas
para mejorar el rendimiento.

Tipos:

1. Fragmentación horizontal:
   Se dividen los registros (ejemplo: envíos por región o fecha)

2. Fragmentación vertical:
   Se dividen las columnas (ejemplo: separar datos sensibles)

Ventajas:
- Mejora tiempos de consulta
- Reduce carga del sistema
- Optimiza almacenamiento

Ejemplo:
Tabla envios dividida por año:
envios_2025, envios_2026
*/