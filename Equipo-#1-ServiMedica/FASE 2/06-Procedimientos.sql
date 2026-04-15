DELIMITER $$
-- Registro de contacto y generación de ticket automático
CREATE PROCEDURE `sp_registrar_contacto` (
    IN `p_nombre` VARCHAR(50), IN `p_ap_pat` VARCHAR(50), IN `p_ap_mat` VARCHAR(50), 
    IN `p_email` VARCHAR(100), IN `p_tel` VARCHAR(15), IN `p_ciudad` VARCHAR(50), IN `p_mensaje` TEXT
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al registrar contacto.'; END;
    START TRANSACTION;
        INSERT INTO usuarios (nombre, apellido_paterno, apellido_materno, email, telefono, ciudad)
        VALUES (p_nombre, p_ap_pat, p_ap_mat, p_email, p_tel, p_ciudad);
        INSERT INTO tickets (id_usuario, mensaje) VALUES (LAST_INSERT_ID(), p_mensaje);
    COMMIT;
END$$

-- Actualización de estado de ticket con registro en bitácora
CREATE PROCEDURE `sp_atender_ticket` (IN `p_id_ticket` INT) 
BEGIN
    UPDATE tickets SET estado = 'Atendido' WHERE id_ticket = p_id_ticket;
    INSERT INTO bitacora_tickets (id_ticket, estado_anterior, estado_nuevo) 
    VALUES (p_id_ticket, 'Pendiente', 'Atendido');
END$$
DELIMITER ;