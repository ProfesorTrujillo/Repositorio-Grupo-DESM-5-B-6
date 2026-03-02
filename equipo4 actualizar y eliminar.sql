-- Crear base de datos y seleccionar
CREATE DATABASE IF NOT EXISTS ClinicPlus;
USE ClinicPlus;
-- Tabla Pacientes
DROP TABLE IF EXISTS Pacientes;
CREATE TABLE Pacientes(
  idPaciente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT CHECK (edad>= 0),
  diagnostico VARCHAR(100)
);
-- Datos de ejemplo
INSERT INTO Pacientes (nombre, edad, diagnostico) VALUES
('Ana López', 29, 'Chequeogeneral'),
('Bruno Díaz', 41, 'Hipertensión'),
('Carla Pérez', 35, 'Alergia estacional');

DELIMITER $$

DROP PROCEDURE IF EXISTS actualizarPaciente $$
CREATE PROCEDURE actualizarPaciente(
    IN p_idPaciente INT,
    IN p_nombre VARCHAR(50),
    IN p_edad INT,
    IN p_diagnostico VARCHAR(100)
)
BEGIN
    -- Validaciones
    IF p_idPaciente IS NULL OR p_idPaciente <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idPaciente es requerido y debe ser positivo.';
    END IF;

    IF p_edad IS NOT NULL AND p_edad < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La edad no puede ser negativa.';
    END IF;

    -- Verifica que exista
    IF (SELECT COUNT(*) FROM Pacientes WHERE idPaciente = p_idPaciente) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente no encontrado.';
    END IF;

    -- Actualización parcial
    UPDATE Pacientes
    SET 
        nombre = COALESCE(p_nombre, nombre),
        edad = COALESCE(p_edad, edad),
        diagnostico = COALESCE(p_diagnostico, diagnostico)
    WHERE idPaciente = p_idPaciente;

    -- Confirmación
    SELECT 'Paciente actualizado correctamente' AS mensaje,
           idPaciente, nombre, edad, diagnostico
    FROM Pacientes
    WHERE idPaciente = p_idPaciente;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS eliminarPaciente $$
CREATE PROCEDURE eliminarPaciente(
    IN p_idPaciente INT
)
BEGIN
    IF p_idPaciente IS NULL OR p_idPaciente <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idPaciente es requerido y debe ser positivo.';
    END IF;

    IF (SELECT COUNT(*) FROM Pacientes WHERE idPaciente = p_idPaciente) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente no encontrado. No se puede eliminar.';
    END IF;

    DELETE FROM Pacientes WHERE idPaciente = p_idPaciente;

    SELECT CONCAT('Paciente con ID ', p_idPaciente, ' eliminado correctamente.') AS mensaje;
END $$

DELIMITER ;

select * from Pacientes;

-- ejemplo de editar 

CALL actualizarPaciente(1, 'Ana María López', 30, 'Chequeo general');
CALL actualizarPaciente(2, NULL, NULL, 'Hipertensión controlada');

-- ejemplo eliminar

CALL eliminarPaciente(3);
CALL eliminarPaciente(999); -- lanzará error

select * from Pacientes;