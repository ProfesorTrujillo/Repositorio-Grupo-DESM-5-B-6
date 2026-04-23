SELECT c.nombre, e.id_envio, emp.nombre AS empleado
FROM clientes c
INNER JOIN envios e ON c.id_cliente = e.id_cliente
INNER JOIN empleados emp ON e.id_empleado = emp.id_empleado;

-- INNER JOIN se usa porque se necesitan registros relacionados en todas las tablas
SELECT *
FROM envios
WHERE costo > (SELECT AVG(costo) FROM envios);

SELECT id_cliente,
COUNT(*) AS total_envios,
SUM(costo) AS total_facturado
FROM envios
GROUP BY id_cliente;

CREATE VIEW vista_envios AS
SELECT c.nombre, e.costo, e.fecha
FROM clientes c
JOIN envios e ON c.id_cliente = e.id_cliente;

CREATE INDEX idx_fecha ON envios(fecha);