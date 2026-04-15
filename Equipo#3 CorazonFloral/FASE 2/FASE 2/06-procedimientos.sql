DELIMITER //

CREATE PROCEDURE sp_pago_tarjeta(
    IN p_id_pedido INT,
    IN p_monto DECIMAL(10,2),
    IN p_tarjeta VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en el pago';
    END;

    START TRANSACTION;

    IF p_monto <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Monto inválido';
    END IF;

    INSERT INTO Pagos(id_pedido, monto, metodo_pago, referencia, fecha_pago)
    VALUES(p_id_pedido, p_monto, 'Tarjeta', p_tarjeta, NOW());

    UPDATE Pedidos
    SET estado = 'Pagado'
    WHERE id_pedido = p_id_pedido;

    COMMIT;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE PROCEDURE sp_descontar_stock(
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_stock INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    SELECT stock INTO v_stock
    FROM Productos
    WHERE id_producto = p_id_producto
    FOR UPDATE;

    IF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;

    UPDATE Productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE PROCEDURE sp_validar_entrega_horario(
    IN p_id_pedido INT,
    IN p_fecha DATETIME
)
BEGIN
    DECLARE v_valido BOOLEAN;

    START TRANSACTION;

    SET v_valido = fn_validar_horario(p_fecha);

    IF v_valido = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Entrega fuera de horario';
    END IF;

    UPDATE Pedidos
    SET fecha_entrega = p_fecha,
        estado = 'En camino'
    WHERE id_pedido = p_id_pedido;

    COMMIT;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE PROCEDURE sp_entregar_pedido_liberar_carrito(
    IN p_id_pedido INT,
    IN p_id_cliente INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE Pedidos
    SET estado = 'Entregado',
        fecha_entrega = NOW()
    WHERE id_pedido = p_id_pedido;

    DELETE FROM Carrito
    WHERE id_cliente = p_id_cliente;

    COMMIT;
END //

DELIMITER ;