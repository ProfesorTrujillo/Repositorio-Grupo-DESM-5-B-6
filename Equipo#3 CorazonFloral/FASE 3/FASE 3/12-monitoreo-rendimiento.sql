-- CREAR ÍNDICE
CREATE INDEX idx_producto_nombre 
ON Productos(nombre);

-- ANALIZAR CONSULTA
EXPLAIN SELECT * 
FROM Productos 
WHERE nombre = 'Rosa Roja';

-- VARIABLES DE RENDIMIENTO
SHOW STATUS LIKE 'Threads_connected';
SHOW STATUS LIKE 'Slow_queries';
SHOW STATUS LIKE 'Questions';
SHOW STATUS LIKE 'Handler_read_rnd_next';
SHOW STATUS LIKE 'Innodb_buffer_pool_read_requests';