-- VISTA DE PRODUCTOS Y STOCK
CREATE VIEW vista_productos_stock AS
SELECT nombre, stock
FROM productos;

-- VISTA DE VENTAS POR CLIENTE
CREATE VIEW vista_ventas_clientes AS
SELECT c.nombre, v.total
FROM ventas v
JOIN clientes c
ON v.id_cliente = c.id_cliente;
