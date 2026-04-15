CREATE VIEW vista_ventas AS
SELECT p.id_pedido, c.nombre AS cliente, p.total, p.fecha
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

CREATE VIEW vista_stock_bajo AS
SELECT nombre, stock
FROM productos
WHERE stock < 10;
