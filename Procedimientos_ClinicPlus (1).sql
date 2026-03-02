USE ClinicPlus;

DROP PROCEDURE IF EXISTS InsertarPaciente;
DROP PROCEDURE IF EXISTS ConsultarPacientes;

DELIMITER $$

CREATE PROCEDURE InsertarPaciente(
    IN p_nombre VARCHAR(50),
    IN p_edad INT,
    IN p_diagnostico VARCHAR(100)
)
BEGIN
    INSERT INTO Pacientes(nombre, edad, diagnostico)
    VALUES (p_nombre, p_edad, p_diagnostico);
END $$

CREATE PROCEDURE ConsultarPacientes()
BEGIN
    SELECT * FROM Pacientes;
END $$

DELIMITER ;
