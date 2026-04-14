SHOW PROCESSLIST;

SHOW GLOBAL STATUS;

-- Activar slow query log
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;

-- Analizar consulta
EXPLAIN
SELECT s.title, COUNT(r.id)
FROM surveys s
LEFT JOIN responses r ON s.id = r.survey_id
GROUP BY s.id;