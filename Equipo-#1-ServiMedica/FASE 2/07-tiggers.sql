DELIMITER $$
-- Auditoría automática cuando un usuario actualiza su email
CREATE TRIGGER `tg_auditoria_update_usuario` AFTER UPDATE ON `usuarios` FOR EACH ROW 
BEGIN
    IF OLD.email <> NEW.email THEN
        INSERT INTO auditoria_usuarios (id_usuario, campo_modificado, valor_anterior, valor_nuevo, usuario_bd)
        VALUES (OLD.id_usuario, 'email', OLD.email, NEW.email, USER());
    END IF;
END$$
DELIMITER ;