DELIMITER //

CREATE PROCEDURE sp_registrar_pedido(
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_stock INT;
    DECLARE v_id_pedido INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al registrar pedido';
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    START TRANSACTION;

    SELECT stock INTO v_stock
    FROM Productos
    WHERE id_producto = p_id_producto
    FOR UPDATE;

    IF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;

    INSERT INTO Pedidos(id_cliente, estado, fecha)
    VALUES(p_id_cliente,'Pendiente',NOW());

    SET v_id_pedido = LAST_INSERT_ID();

    INSERT INTO Detalle_Pedidos(id_pedido,id_producto,cantidad)
    VALUES(v_id_pedido,p_id_producto,p_cantidad);

    UPDATE Productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;

END //

DELIMITER ;