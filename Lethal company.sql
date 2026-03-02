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

--  VALIDACIÓN MÁS EFICIENTE (por PRIMARY KEY)
SELECT EXISTS (
    SELECT 1
    FROM Pacientes
    WHERE idPaciente = 1
    LIMIT 1
) AS Existe;

SELECT EXISTS (
    SELECT 1
    FROM Pacientes
    WHERE nombre = 'NOMBRE_A_BUSCAR'
    LIMIT 1

) AS Existe;





EJEMPLO USANDO PROCEDIMIENTOS.
DELIMITER $$
CREATE PROCEDURE sp_BuscarPacientePorNombre(
  IN p_nombre VARCHAR(50)
)
BEGIN
  IF EXISTS (SELECT 1 FROM Pacientes WHERE nombre = p_nombre) THEN
    SELECT * FROM Pacientes WHERE nombre = p_nombre;
  ELSE
    SELECT CONCAT('No existe paciente con el nombre: ', p_nombre) AS mensaje;
  END IF;
END $$
DELIMITER 
