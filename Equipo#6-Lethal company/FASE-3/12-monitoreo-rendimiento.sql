-- Consultas lentas
SHOW VARIABLES LIKE 'slow_query_log';

-- Estado del servidor
SHOW STATUS;

-- Uso de índices
EXPLAIN SELECT * FROM productos WHERE nombre = 'Taco al pastor';
