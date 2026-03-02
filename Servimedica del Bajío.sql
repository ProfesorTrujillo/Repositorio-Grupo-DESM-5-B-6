-- ======================================================
-- EQUIPO 1: CREACIÓN DE ESTRUCTURA Y PROCEDIMIENTOS
-- ACTIVIDAD: INSERTAR Y CONSULTAR PACIENTES
-- ======================================================

-- 1. Configuración inicial del entorno
CREATE DATABASE IF NOT EXISTS ClinicPlus;
USE ClinicPlus;

-- 2. Creación de la tabla base
DROP TABLE IF EXISTS Pacientes;
CREATE TABLE Pacientes(
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT CHECK (edad >= 0),
    diagnostico VARCHAR(100)
);

-- 3. Inserción de datos iniciales para pruebas
INSERT INTO Pacientes (nombre, edad, diagnostico) VALUES
('Ana López', 29, 'Chequeo general'),
('Bruno Díaz', 41, 'Hipertensión'),
('Carla Pérez', 35, 'Alergia estacional');

-- ------------------------------------------------------
-- PROCEDIMIENTO 1: Insertar nuevos pacientes
-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE sp_InsertarPaciente(
    IN _nombre VARCHAR(50),
    IN _edad INT,
    IN _diagnostico VARCHAR(100)
)
BEGIN
    -- Se insertan los datos usando los parámetros de entrada 
    INSERT INTO Pacientes (nombre, edad, diagnostico)
    VALUES (_nombre, _edad, _diagnostico);
    
    -- Mensaje de confirmación (Opcional pero recomendado)
    SELECT 'Paciente registrado con éxito' AS Mensaje;
END //

DELIMITER ;

CALL sp_InsertarPaciente('Roberto Gómez', 45, 'Control de Diabetes');
SELECT * FROM Pacientes;

-- ------------------------------------------------------
-- PROCEDIMIENTO 2: Consultar todos los pacientes
-- ------------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_ConsultarPacientes()
BEGIN
    SELECT * FROM Pacientes;
END //
DELIMITER ;

-- ======================================================
-- PRUEBAS DE FUNCIONAMIENTO (EJEMPLOS DE USO)
-- ======================================================
-- Para insertar un nuevo paciente:
-- CALL sp_InsertarPaciente('Elena Hernandez', 22, 'Gripe');

-- Para ver la lista completa:
-- CALL sp_ConsultarPacientes();