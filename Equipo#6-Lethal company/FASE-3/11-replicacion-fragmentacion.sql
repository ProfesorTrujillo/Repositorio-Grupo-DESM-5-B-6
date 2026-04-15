-- Ejemplo conceptual de fragmentación
CREATE TABLE pedidos_2025 AS
SELECT * FROM pedidos
WHERE YEAR(fecha) = 2025;

-- Replicación (configuración básica)
-- CHANGE MASTER TO
-- MASTER_HOST='ip_servidor',
-- MASTER_USER='replica',
-- MASTER_PASSWORD='1234';
