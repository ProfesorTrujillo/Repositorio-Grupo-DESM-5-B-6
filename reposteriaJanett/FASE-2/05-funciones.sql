-- PasteleriaJan | Fase 2 · 05 - Funciones
-- ----------------------------------------------------------------
USE PasteleriaJan;

DELIMITER $$

-- · Valida que el correo tenga formato correcto

CREATE FUNCTION fn_ValidarCorreo (correo VARCHAR(150))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    IF correo REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$' THEN
        RETURN 1;
    END IF;
    RETURN 0;
END$$

-- · Valida que el precio no sea negativo

CREATE FUNCTION fn_PrecioPositivo (precio DECIMAL(10,2))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    DECLARE resultado TINYINT DEFAULT 0;
    IF precio >= 0 THEN SET resultado = 1; END IF;
    RETURN resultado;
END$$

-- · Valida que la contraseña tenga al menos 8 caracteres y un número

CREATE FUNCTION fn_ValidarPassword (pass VARCHAR(150))
RETURNS TINYINT
DETERMINISTIC
BEGIN
    IF CHAR_LENGTH(pass) < 8   THEN RETURN 0; END IF;
    IF pass NOT REGEXP '[0-9]' THEN RETURN 0; END IF;
    RETURN 1;
END$$

DELIMITER ;
