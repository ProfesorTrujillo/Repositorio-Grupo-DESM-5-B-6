-- Selecciona la base de datos a utilizar
USE ClinicPlus;

-- Elimina los procedimientos si ya existen para evitar errores al crearlos nuevamente
DROP PROCEDURE IF EXISTS InsertarPaciente;
DROP PROCEDURE IF EXISTS ConsultarPacientes;

-- Cambiamos el delimitador para poder definir procedimientos almacenados
DELIMITER $$

-- =====================================================
-- Procedimiento: InsertarPaciente
-- Descripción: Inserta un nuevo paciente en la tabla Pacientes
-- Parámetros:
--    p_nombre       -> Nombre del paciente
--    p_edad         -> Edad del paciente
--    p_diagnostico  -> Diagnóstico del paciente
-- =====================================================
CREATE PROCEDURE InsertarPaciente(
    IN p_nombre VARCHAR(50),
    IN p_edad INT,
    IN p_diagnostico VARCHAR(100)
)
BEGIN
    INSERT INTO Pacientes(nombre, edad, diagnostico)
    VALUES (p_nombre, p_edad, p_diagnostico);
END $$

-- =====================================================
-- Procedimiento: ConsultarPacientes
-- Descripción: Muestra todos los registros de la tabla Pacientes
-- =====================================================
CREATE PROCEDURE ConsultarPacientes()
BEGIN
    SELECT * FROM Pacientes;
END $$

-- Restauramos el delimitador original
DELIMITER ;

-- =====================================================
-- EJEMPLO DE USO / SALIDA
-- =====================================================

-- Insertar un paciente de prueba
CALL InsertarPaciente('Juan Perez', 30, 'Gripe');

-- Consultar los pacientes registrados
CALL ConsultarPacientes();


-- Salida esperada
| id | nombre     | edad | diagnostico |
| -- | ---------- | ---- | ----------- |
| 1  | Juan Perez | 30   | Gripe       |

