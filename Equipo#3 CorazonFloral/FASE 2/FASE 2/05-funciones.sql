DELIMITER //

CREATE FUNCTION fn_calcular_envio(p_subtotal DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_envio DECIMAL(10,2);

    IF p_subtotal >= 1000 THEN
        SET v_envio = 0;
    ELSEIF p_subtotal >= 500 THEN
        SET v_envio = 50;
    ELSE
        SET v_envio = 100;
    END IF;

    RETURN v_envio;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE FUNCTION fn_total_descuento_envio(
    p_subtotal DECIMAL(10,2),
    p_porcentaje_desc DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_descuento DECIMAL(10,2);
    DECLARE v_envio DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);

    SET v_descuento = p_subtotal * (p_porcentaje_desc / 100);
    SET v_envio = fn_calcular_envio(p_subtotal);
    SET v_total = (p_subtotal - v_descuento) + v_envio;

    RETURN v_total;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE FUNCTION fn_validar_horario(p_fecha DATETIME)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_hora INT;

    SET v_hora = HOUR(p_fecha);

    IF v_hora BETWEEN 8 AND 20 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;