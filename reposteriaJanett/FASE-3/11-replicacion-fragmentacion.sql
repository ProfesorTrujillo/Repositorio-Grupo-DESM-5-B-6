-- PasteleriaJan | Fase 3 · 11 - Replicación y Fragmentación
-- ----------------------------------------------------------------
USE PasteleriaJan;


-- ================================================================
-- REPLICACIÓN
-- ================================================================

-- · Configuración del servidor MAESTRO
--   Agregar en my.cnf antes de iniciar:
--     log_bin   = mysql-bin
--     server-id = 1

-- Crear usuario dedicado para la replicación
CREATE USER IF NOT EXISTS 'replicador'@'%' IDENTIFIED BY 'Replica2024!';
GRANT REPLICATION SLAVE ON *.* TO 'replicador'@'%';
FLUSH PRIVILEGES;

-- Verificar estado del maestro (obtener File y Position para el esclavo)
SHOW MASTER STATUS;

-- · Configuración del servidor ESCLAVO
--   Agregar en my.cnf antes de iniciar:
--     server-id = 2

-- Detener el esclavo antes de configurarlo
STOP SLAVE;

-- Apuntar al maestro con los datos obtenidos en SHOW MASTER STATUS
CHANGE MASTER TO
    MASTER_HOST     = '192.168.1.1',
    MASTER_USER     = 'replicador',
    MASTER_PASSWORD = 'Replica2024!',
    MASTER_LOG_FILE = 'mysql-bin.000001',
    MASTER_LOG_POS  = 154;

-- Iniciar y verificar el esclavo
START SLAVE;
SHOW SLAVE STATUS;


-- ================================================================
-- FRAGMENTACIÓN HORIZONTAL
-- ================================================================
-- Divide la tabla Usuarios por rol:
--   · PasteleriaJan_Admins   → usuarios con rol Administrador (rol_id = 1)
--   · PasteleriaJan_Clientes → usuarios con rol Cliente       (rol_id = 2)

CREATE DATABASE IF NOT EXISTS PasteleriaJan_Admins;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Admins.Usuarios LIKE PasteleriaJan.Usuarios;
INSERT INTO PasteleriaJan_Admins.Usuarios
    SELECT * FROM PasteleriaJan.Usuarios WHERE rol_id = 1;

CREATE DATABASE IF NOT EXISTS PasteleriaJan_Clientes;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Clientes.Usuarios LIKE PasteleriaJan.Usuarios;
INSERT INTO PasteleriaJan_Clientes.Usuarios
    SELECT * FROM PasteleriaJan.Usuarios WHERE rol_id = 2;

-- Verificar fragmentos horizontales
SELECT * FROM PasteleriaJan_Admins.Usuarios;
SELECT * FROM PasteleriaJan_Clientes.Usuarios;


-- ================================================================
-- FRAGMENTACIÓN VERTICAL
-- ================================================================
-- Divide la tabla Usuarios por sensibilidad de datos:
--   · PasteleriaJan_Seguridad → datos sensibles (correo, contraseña)
--   · PasteleriaJan_Publico   → datos públicos  (nombre, rol, fecha)

-- Fragmento con datos sensibles
CREATE DATABASE IF NOT EXISTS PasteleriaJan_Seguridad;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Seguridad.Usuarios_Sensible (
    id     VARCHAR(50)  PRIMARY KEY,
    correo VARCHAR(150) NOT NULL UNIQUE,
    pass   VARCHAR(150) NOT NULL
);
INSERT INTO PasteleriaJan_Seguridad.Usuarios_Sensible (id, correo, pass)
    SELECT id, correo, pass FROM PasteleriaJan.Usuarios;

-- Fragmento con datos públicos
CREATE DATABASE IF NOT EXISTS PasteleriaJan_Publico;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Publico.Usuarios_Info (
    id             VARCHAR(50)  PRIMARY KEY,
    nombre         VARCHAR(150) NOT NULL,
    rol_id         INT,
    fecha_registro TIMESTAMP
);
INSERT INTO PasteleriaJan_Publico.Usuarios_Info (id, nombre, rol_id, fecha_registro)
    SELECT id, nombre, rol_id, fecha_registro FROM PasteleriaJan.Usuarios;

-- Verificar fragmentos verticales
SELECT * FROM PasteleriaJan_Seguridad.Usuarios_Sensible;
SELECT * FROM PasteleriaJan_Publico.Usuarios_Info;
