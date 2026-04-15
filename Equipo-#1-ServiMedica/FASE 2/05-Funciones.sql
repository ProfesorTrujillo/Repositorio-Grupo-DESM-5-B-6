DELIMITER $$
-- Función para obtener el nombre completo formateado
CREATE FUNCTION fn_nombre_completo(p_id INT) RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
    DECLARE v_full_name VARCHAR(150);
    SELECT CONCAT(nombre, ' ', apellido_paterno, ' ', IFNULL(apellido_materno, '')) 
    INTO v_full_name FROM usuarios WHERE id_usuario = p_id;
    RETURN v_full_name;
END$$
DELIMITER ;