-- Total vendido por cliente
SELECT c.nombre, SUM(p.total) AS total_compras
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

-- Productos más vendidos
SELECT pr.nombre, SUM(dp.cantidad) AS total_vendido
FROM productos pr
JOIN detalle_pedido dp ON pr.id_producto = dp.id_producto
GROUP BY pr.nombre
ORDER BY total_vendido DESC;

-- Promedio de ventas
SELECT AVG(total) AS promedio_ventas
FROM pedidos;

-- Subconsulta: clientes que han comprado más de 500
SELECT nombre
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM pedidos
    GROUP BY id_cliente
    HAVING SUM(total) > 500
);
