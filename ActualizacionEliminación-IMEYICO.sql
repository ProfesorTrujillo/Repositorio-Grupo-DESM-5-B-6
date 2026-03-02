-- 
-- ClinicPlus Equipo 2 IMEYCO – Actualizar y Eliminar Pacientes
-- 

USE ClinicPlus;

-- 
-- 1. PROCEDIMIENTO: Actualizar un paciente
-- 
DELIMITER $$

CREATE PROCEDURE ActualizarPaciente(
    IN p_idPaciente  INT,
    IN p_nombre      VARCHAR(50),
    IN p_edad        INT,
    IN p_diagnostico VARCHAR(100)
)
BEGIN
    UPDATE Pacientes
    SET
        nombre      = p_nombre,
        edad        = p_edad,
        diagnostico = p_diagnostico
    WHERE idPaciente = p_idPaciente;

    IF ROW_COUNT() > 0 THEN
        SELECT CONCAT('Paciente con ID ', p_idPaciente, ' actualizado correctamente.') AS mensaje;
    ELSE
        SELECT CONCAT('No se encontró ningún paciente con ID ', p_idPaciente, '.') AS mensaje;
    END IF;
END$$

-- 
-- 2. PROCEDIMIENTO: Eliminar un paciente
-- 

CREATE PROCEDURE EliminarPaciente(
    IN p_idPaciente INT
)
BEGIN
    DELETE FROM Pacientes
    WHERE idPaciente = p_idPaciente;

    IF ROW_COUNT() > 0 THEN
        SELECT CONCAT('Paciente con ID ', p_idPaciente, ' eliminado correctamente.') AS mensaje;
    ELSE
        SELECT CONCAT('No se encontró ningún paciente con ID ', p_idPaciente, '.') AS mensaje;
    END IF;
END$$

DELIMITER ;

-- 
-- EJEMPLOS
-- 

SELECT * FROM Pacientes; -- Ver antes de cambios

CALL ActualizarPaciente(2, 'Bruno Díaz', 42, 'Hipertensión controlada');
CALL EliminarPaciente(3);

SELECT * FROM Pacientes; -- Ver después de cambios