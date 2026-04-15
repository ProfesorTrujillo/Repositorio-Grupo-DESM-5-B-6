-- PRODUCTOS CON PRECIO MAYOR A 100
SELECT nombre, precio
FROM productos
WHERE precio > 100;

-- TOTAL DE COMPRAS POR CLIENTE
SELECT c.nombre, SUM(v.total) AS total_compras
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;

-- PRODUCTOS CON STOCK BAJO
SELECT *
FROM productos
WHERE stock < 5;