-- PasteleriaJan | Fase 2 · 06 - Procedimientos Almacenados
-- ----------------------------------------------------------------
USE PasteleriaJan;

DELIMITER $$

-- · Inserta un usuario validando el correo antes de guardar

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

-- · Inserta un postre validando que el precio sea positivo

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

-- · Actualiza el número de inscritos de una clase

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
