-- PasteleriaJan | Fase 2 · 08 - Transacciones
-- ----------------------------------------------------------------
USE PasteleriaJan;

-- · Inscribir un usuario a una clase
--   Inserta la inscripción y actualiza el contador de inscritos de forma atómica

START TRANSACTION;
    INSERT INTO Inscripciones (usuario_id, clase_id) VALUES ('U1', 'C1');
    UPDATE Clases SET inscritos = inscritos + 1 WHERE id = 'C1';
COMMIT;

-- · Ejemplo con ROLLBACK
--   Si ocurre un error durante la operación, se revierte todo el cambio

START TRANSACTION;
    UPDATE Clases SET inscritos = inscritos + 1 WHERE id = 'C2';
    -- ROLLBACK; -- descomentar si ocurre un error
COMMIT;
