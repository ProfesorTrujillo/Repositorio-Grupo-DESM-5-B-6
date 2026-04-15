DELIMITER //

CREATE PROCEDURE insertar_pedido(
    IN cliente_id INT,
    IN total_pedido DECIMAL(10,2)
)
BEGIN
    INSERT INTO pedidos(id_cliente, total)
    VALUES(cliente_id, total_pedido);
END //

DELIMITER ;
