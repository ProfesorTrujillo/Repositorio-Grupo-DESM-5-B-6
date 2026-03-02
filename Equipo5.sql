 PROCEDIMIENTO ADICIONAL (VALIDACIÓN)

Buscar paciente por nombre y validar existencia.

DELIMITER //

CREATE PROCEDURE buscar_paciente_nombre(
    IN p_nombre VARCHAR(100)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Pacientes WHERE nombre = p_nombre) THEN
        SELECT * FROM Pacientes WHERE nombre = p_nombre;
    ELSE
        SELECT 'Paciente no encontrado' AS mensaje;
    END IF;
END //

DELIMITER ;
Ejecutar:
CALL buscar_paciente_nombre('Juan Pérez');
Consulta para verificar datos
SELECT * FROM Pacientes;
