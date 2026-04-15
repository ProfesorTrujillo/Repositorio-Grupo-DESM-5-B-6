-- Ejemplo de manejo manual de transacciones para limpieza de datos
START TRANSACTION;
DELETE FROM bitacora_tickets WHERE fecha_cambio < DATE_SUB(NOW(), INTERVAL 1 YEAR);
-- ROLLBACK; -- Si ocurre un error
COMMIT; -- Si todo es correcto