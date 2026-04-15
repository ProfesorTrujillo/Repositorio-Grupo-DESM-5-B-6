-- Consulta 1: Productos estrella
SELECT nombre, precio, stock 
FROM Productos 
WHERE precio > (SELECT AVG(precio) FROM Productos)
AND stock > 0;

-- Consulta 2: Clientes frecuentes
SELECT nombre_completo, telefono_wa 
FROM Clientes 
WHERE id_cliente IN (
    SELECT id_cliente 
    FROM Pedidos 
    GROUP BY id_cliente 
    HAVING COUNT(id_pedido) > 3
);