-- PasteleriaJan | Script completo

DROP DATABASE IF EXISTS PasteleriaJan;
CREATE DATABASE PasteleriaJan;
USE PasteleriaJan;


-- ----------------------------------------------------------------
-- FASE 1 · Extracción de Datos
-- ----------------------------------------------------------------

-- · Modelo de datos

CREATE TABLE Roles (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Administradores (
    id         VARCHAR(50)  PRIMARY KEY,
    usuario    VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Usuarios (
    id             VARCHAR(50)  PRIMARY KEY,
    nombre         VARCHAR(150) NOT NULL,
    correo         VARCHAR(150) NOT NULL UNIQUE,
    pass           VARCHAR(150) NOT NULL,
    rol_id         INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES Roles(id)
);

CREATE TABLE Clases (
    id        VARCHAR(50)  PRIMARY KEY,
    tipo      VARCHAR(50)  NOT NULL,
    precio    INT,
    inscritos INT,
    descri    VARCHAR(150) NOT NULL,
    fecha     DATETIME
);

CREATE TABLE Postres (
    id        VARCHAR(50)   PRIMARY KEY,
    postre    VARCHAR(100)  NOT NULL,
    categoria VARCHAR(100)  NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Gelatinas (
    id        VARCHAR(50)   PRIMARY KEY,
    gelatina  VARCHAR(100)  NOT NULL,
    categoria VARCHAR(100)  NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Pasteles (
    id        VARCHAR(50)   PRIMARY KEY,
    nombre    VARCHAR(100)  NOT NULL,
    forma     ENUM('circular','cuadrado') NOT NULL,
    categoria VARCHAR(100),
    tamaño    VARCHAR(50)   NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Inscripciones (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id        VARCHAR(50) NOT NULL,
    clase_id          VARCHAR(50) NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (clase_id)   REFERENCES Clases(id),
    UNIQUE (usuario_id, clase_id)
);

-- datos iniciales

INSERT INTO Roles (nombre) VALUES ('Administrador'), ('Usuario');

INSERT INTO Gelatinas (id, gelatina, categoria, precio) VALUES
('G1', 'Gelatina de Fresa', 'agua',    25.00),
('G2', 'Gelatina de Leche', 'leche',   30.00),
('G3', 'Gelatina Mosaico',  'mosaico', 40.00);

INSERT INTO Pasteles (id, nombre, forma, categoria, tamaño, precio) VALUES
('P1', 'Pastel de Chocolate', 'circular', 'chocolate',   'mediano', 250.00),
('P2', 'Pastel de Vainilla',  'cuadrado', 'vainilla',    'grande',  300.00),
('P3', 'Pastel Tres Leches',  'circular', 'tres leches', 'chico',   200.00);

INSERT INTO Clases (id, tipo, precio, inscritos, descri, fecha) VALUES
('C1', 'Curso de Pasteles',  350, 0, 'Aprende a decorar y hornear pasteles',      '2026-04-15 10:00:00'),
('C2', 'Curso de Gelatinas', 300, 0, 'Técnicas modernas de gelatinas artísticas', '2026-04-20 15:00:00'),
('C3', 'Curso de Postres',   320, 0, 'Postres gourmet fáciles de preparar',       '2026-04-25 17:00:00');

INSERT INTO Usuarios (id, nombre, correo, pass, rol_id) VALUES
('U1', 'Juan Pérez', 'juan@correo.com',  'hash_password', 2),
('U2', 'Darck',      'darck@correo.com', 'hash_password', 1);

-- · Consultas avanzadas

SELECT * FROM Gelatinas WHERE categoria = 'mosaico';
SELECT * FROM Pasteles  WHERE categoria = 'chocolate';
SELECT * FROM Pasteles  WHERE tamaño    = 'grande';
SELECT * FROM Pasteles  WHERE forma     = 'circular';
SELECT * FROM Pasteles  WHERE forma     = 'cuadrado';

SELECT * FROM Gelatinas ORDER BY precio ASC;
SELECT * FROM Pasteles  ORDER BY precio ASC;
SELECT * FROM Gelatinas ORDER BY categoria ASC, precio ASC;
SELECT * FROM Pasteles  ORDER BY categoria ASC, nombre ASC, precio ASC;
SELECT * FROM Pasteles  ORDER BY tamaño ASC, precio ASC;

SELECT u.nombre, r.nombre AS rol
FROM Usuarios u
JOIN Roles r ON u.rol_id = r.id;

-- · Índices

CREATE INDEX idx_categoria_postres   ON Postres(categoria);
CREATE INDEX idx_categoria_pasteles  ON Pasteles(categoria);
CREATE INDEX idx_categoria_gelatinas ON Gelatinas(categoria);
CREATE INDEX idx_precio_postres      ON Postres(precio);

-- · Vistas

CREATE VIEW v_GelatinasCaras AS
    SELECT * FROM Gelatinas
    WHERE precio > (SELECT AVG(precio) FROM Gelatinas);

CREATE VIEW v_PastelesCaro AS
    SELECT * FROM Pasteles
    WHERE precio > (SELECT AVG(precio) FROM Pasteles);

CREATE VIEW v_UsuariosRol AS
    SELECT u.id, u.nombre, u.correo, r.nombre AS rol
    FROM Usuarios u
    JOIN Roles r ON u.rol_id = r.id;

CREATE VIEW v_ClasesDisponibles AS
    SELECT id, tipo, precio, inscritos, descri, fecha
    FROM Clases
    ORDER BY fecha ASC;


-- ----------------------------------------------------------------
-- FASE 2 · Programación Procedimental
-- ----------------------------------------------------------------

-- · Funciones

DELIMITER $$

CREATE FUNCTION fn_ValidarCorreo (correo VARCHAR(150))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    IF correo REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$' THEN
        RETURN 1;
    END IF;
    RETURN 0;
END$$

CREATE FUNCTION fn_PrecioPositivo (precio DECIMAL(10,2))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    DECLARE resultado TINYINT DEFAULT 0;
    IF precio >= 0 THEN SET resultado = 1; END IF;
    RETURN resultado;
END$$

CREATE FUNCTION fn_ValidarPassword (pass VARCHAR(150))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    IF CHAR_LENGTH(pass) < 8   THEN RETURN 0; END IF;
    IF pass NOT REGEXP '[0-9]' THEN RETURN 0; END IF;
    RETURN 1;
END$$

DELIMITER ;

-- · Procedimientos almacenados

DELIMITER $$

CREATE PROCEDURE sp_InsertarUsuario (
    IN  p_id        VARCHAR(50),
    IN  p_nombre    VARCHAR(150),
    IN  p_correo    VARCHAR(150),
    IN  p_pass      VARCHAR(150),
    IN  p_rol_id    INT,
    OUT p_resultado TINYINT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SET p_resultado = 0; END;

    START TRANSACTION;

    IF fn_ValidarCorreo(p_correo) = 0 THEN
        SET p_resultado = 0;
        ROLLBACK;
    ELSE
        INSERT INTO Usuarios (id, nombre, correo, pass, rol_id)
        VALUES (p_id, p_nombre, p_correo, p_pass, p_rol_id);

        COMMIT;
        SET p_resultado = 1;
    END IF;

END$$

CREATE PROCEDURE sp_InsertarPostre (
    IN  p_id        VARCHAR(50),
    IN  p_postre    VARCHAR(100),
    IN  p_categoria VARCHAR(100),
    IN  p_precio    DECIMAL(10,2),
    OUT p_resultado TINYINT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SET p_resultado = 0; END;

    START TRANSACTION;

    IF fn_PrecioPositivo(p_precio) = 0 THEN
        SET p_resultado = 0;
        ROLLBACK;
    ELSE
        INSERT INTO Postres (id, postre, categoria, precio)
        VALUES (p_id, p_postre, p_categoria, p_precio);

        COMMIT;
        SET p_resultado = 1;
    END IF;

END$$

CREATE PROCEDURE sp_ActualizarInscritos (
    IN  p_idClase         VARCHAR(50),
    IN  p_nuevosInscritos INT,
    OUT p_resultado       TINYINT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SET p_resultado = 0; END;

    START TRANSACTION;

    UPDATE Clases 
    SET inscritos = inscritos + p_nuevosInscritos 
    WHERE id = p_idClase;

    COMMIT;
    SET p_resultado = 1;

END$$

DELIMITER ;

-- · Triggers

DELIMITER $$

CREATE TRIGGER trg_ValidarPrecioPastel
BEFORE INSERT ON Pasteles FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del pastel no puede ser negativo.';
    END IF;
END$$

CREATE TRIGGER trg_ValidarPrecioGelatina
BEFORE INSERT ON Gelatinas FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio de la gelatina no puede ser negativo.';
    END IF;
END$$

CREATE TRIGGER trg_ValidarInscritos
BEFORE UPDATE ON Clases FOR EACH ROW
BEGIN
    IF NEW.inscritos < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de inscritos no puede ser negativo.';
    END IF;
END$$

DELIMITER ;

-- · Manejo de transacciones

-- Inscribir usuario a una clase
START TRANSACTION;
    INSERT INTO Inscripciones (usuario_id, clase_id) VALUES ('U1', 'C1');
    UPDATE Clases SET inscritos = inscritos + 1 WHERE id = 'C1';
COMMIT;

-- Ejemplo con rollback
START TRANSACTION;
    UPDATE Clases SET inscritos = inscritos + 1 WHERE id = 'C2';
    -- ROLLBACK; -- descomentar si ocurre un error
COMMIT;


-- ----------------------------------------------------------------
-- FASE 3 · Gestión de Base de Datos
-- ----------------------------------------------------------------

-- · Usuarios y privilegios

CREATE USER IF NOT EXISTS 'admin_jan'@'localhost'  IDENTIFIED BY 'Admin2024!';
CREATE USER IF NOT EXISTS 'lector_jan'@'localhost' IDENTIFIED BY 'Lector2024!';
CREATE USER IF NOT EXISTS 'app_jan'@'localhost'    IDENTIFIED BY 'App2024!';

GRANT ALL PRIVILEGES          ON PasteleriaJan.* TO 'admin_jan'@'localhost';
GRANT SELECT                  ON PasteleriaJan.* TO 'lector_jan'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON PasteleriaJan.* TO 'app_jan'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'admin_jan'@'localhost';
SHOW GRANTS FOR 'lector_jan'@'localhost';
SHOW GRANTS FOR 'app_jan'@'localhost';

-- · Respaldo y restauración (ejecutar en terminal)

-- mysqldump -u admin_jan -p PasteleriaJan > respaldo_pasteleriaJan.sql
-- mysql     -u admin_jan -p PasteleriaJan < respaldo_pasteleriaJan.sql
-- mysqldump -u admin_jan -p PasteleriaJan Pasteles Gelatinas Postres > respaldo_productos.sql
-- mysqldump -u admin_jan -p --no-data        PasteleriaJan > estructura_pasteleriaJan.sql
-- mysqldump -u admin_jan -p --no-create-info PasteleriaJan > datos_pasteleriaJan.sql

-- · Replicación

-- Maestro (my.cnf: log_bin = mysql-bin, server-id = 1)
CREATE USER IF NOT EXISTS 'replicador'@'%' IDENTIFIED BY 'Replica2024!';
GRANT REPLICATION SLAVE ON *.* TO 'replicador'@'%';
FLUSH PRIVILEGES;
SHOW MASTER STATUS;

-- Esclavo (my.cnf: server-id = 2)
STOP SLAVE;

CHANGE MASTER TO
    MASTER_HOST     = '192.168.1.1',
    MASTER_USER     = 'replicador',
    MASTER_PASSWORD = 'Replica2024!',
    MASTER_LOG_FILE = 'mysql-bin.000001',
    MASTER_LOG_POS  = 154;

START SLAVE;
SHOW SLAVE STATUS;

-- · Fragmentación

-- Horizontal: por rol
CREATE DATABASE IF NOT EXISTS PasteleriaJan_Admins;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Admins.Usuarios LIKE PasteleriaJan.Usuarios;
INSERT INTO PasteleriaJan_Admins.Usuarios SELECT * FROM PasteleriaJan.Usuarios WHERE rol_id = 1;

CREATE DATABASE IF NOT EXISTS PasteleriaJan_Clientes;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Clientes.Usuarios LIKE PasteleriaJan.Usuarios;
INSERT INTO PasteleriaJan_Clientes.Usuarios SELECT * FROM PasteleriaJan.Usuarios WHERE rol_id = 2;

SELECT * FROM PasteleriaJan_Admins.Usuarios;
SELECT * FROM PasteleriaJan_Clientes.Usuarios;

-- Vertical: datos sensibles vs públicos
CREATE DATABASE IF NOT EXISTS PasteleriaJan_Seguridad;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Seguridad.Usuarios_Sensible (
    id     VARCHAR(50)  PRIMARY KEY,
    correo VARCHAR(150) NOT NULL UNIQUE,
    pass   VARCHAR(150) NOT NULL
);
INSERT INTO PasteleriaJan_Seguridad.Usuarios_Sensible (id, correo, pass)
SELECT id, correo, pass FROM PasteleriaJan.Usuarios;

CREATE DATABASE IF NOT EXISTS PasteleriaJan_Publico;
CREATE TABLE IF NOT EXISTS PasteleriaJan_Publico.Usuarios_Info (
    id             VARCHAR(50)  PRIMARY KEY,
    nombre         VARCHAR(150) NOT NULL,
    rol_id         INT,
    fecha_registro TIMESTAMP
);
INSERT INTO PasteleriaJan_Publico.Usuarios_Info (id, nombre, rol_id, fecha_registro)
SELECT id, nombre, rol_id, fecha_registro FROM PasteleriaJan.Usuarios;

SELECT * FROM PasteleriaJan_Seguridad.Usuarios_Sensible;
SELECT * FROM PasteleriaJan_Publico.Usuarios_Info;

-- · Monitoreo y rendimiento

SHOW PROCESSLIST;

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;
SHOW VARIABLES LIKE 'slow_query_log';

SHOW GLOBAL STATUS;

EXPLAIN SELECT * FROM Postres  WHERE categoria = 'chocolate';
EXPLAIN SELECT * FROM Pasteles WHERE categoria = 'chocolate';
EXPLAIN SELECT * FROM Postres  WHERE categoria = 'chocolate' ORDER BY precio ASC;
EXPLAIN SELECT * FROM Clases   WHERE tipo LIKE 'Fondant%';

SHOW INDEX FROM Postres;
SHOW INDEX FROM Pasteles;
SHOW INDEX FROM Gelatinas;