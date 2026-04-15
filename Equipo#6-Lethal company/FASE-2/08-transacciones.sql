START TRANSACTION;

INSERT INTO pedidos(id_cliente, total)
VALUES (1, 150);

INSERT INTO detalle_pedido(id_pedido, id_producto, cantidad, subtotal)
VALUES (1, 2, 3, 90);

COMMIT;

-- En caso de error:
-- ROLLBACK;
