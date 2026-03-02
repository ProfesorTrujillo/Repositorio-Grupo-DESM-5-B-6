-- Crear base de datos y seleccionar
CREATE DATABASE IF NOT EXISTS ClinicPlus;
USE ClinicPlus;

-- Tabla Pacientes
DROP TABLE IF EXISTS Pacientes;

CREATE TABLE Pacientes(
  idPaciente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT CHECK (edad >= 0),
  diagnostico VARCHAR(100)
);

-- Datos de ejemplo
INSERT INTO Pacientes (nombre, edad, diagnostico) VALUES
('Ana López', 29, 'Chequeo general'),
('Bruno Díaz', 41, 'Hipertensión'),
('Carla Pérez', 35, 'Alergia estacional');

-- 🔥 PROCEDIMIENTO CON IF Y ELSE
DELIMITER //

CREATE PROCEDURE BuscarPaciente(IN p_id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Pacientes WHERE idPaciente = p_id) THEN
        
        -- Si existe, mostrar datos
        SELECT * 
        FROM Pacientes 
        WHERE idPaciente = p_id;

    ELSE
        
        -- Si no existe, mostrar mensaje
        SELECT 'El paciente no existe' AS Mensaje;

    END IF;
END //

DELIMITER ;

-- 🔎 Ejemplos
CALL BuscarPaciente(1);
CALL BuscarPaciente(10);