-- PasteleriaJan | Fase 2 · 07 - Triggers
-- ----------------------------------------------------------------
USE PasteleriaJan;

DELIMITER $$

-- · Impide insertar un pastel con precio negativo

CREATE TRIGGER trg_ValidarPrecioPastel
BEFORE INSERT ON Pasteles FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del pastel no puede ser negativo.';
    END IF;
END$$

-- · Impide insertar una gelatina con precio negativo

CREATE TRIGGER trg_ValidarPrecioGelatina
BEFORE INSERT ON Gelatinas FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio de la gelatina no puede ser negativo.';
    END IF;
END$$

-- · Impide actualizar inscritos a un valor negativo

CREATE TRIGGER trg_ValidarInscritos
BEFORE UPDATE ON Clases FOR EACH ROW
BEGIN
    IF NEW.inscritos < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de inscritos no puede ser negativo.';
    END IF;
END$$

DELIMITER ;
