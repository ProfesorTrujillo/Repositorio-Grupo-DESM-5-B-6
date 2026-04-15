-- PasteleriaJan | Fase 3 · 12 - Monitoreo y Rendimiento
-- ----------------------------------------------------------------
USE PasteleriaJan;


-- ================================================================
-- MONITOREO DE PROCESOS
-- ================================================================

-- · Ver procesos activos en el servidor en tiempo real
SHOW PROCESSLIST;

-- · Ver todas las variables de estado globales del servidor
SHOW GLOBAL STATUS;


-- ================================================================
-- REGISTRO DE CONSULTAS LENTAS
-- ================================================================

-- · Activar el log de consultas lentas
SET GLOBAL slow_query_log = 'ON';

-- · Definir el umbral en segundos (consultas que tarden más de 1s se registran)
SET GLOBAL long_query_time = 1;

-- · Verificar que el log quedó activado
SHOW VARIABLES LIKE 'slow_query_log';


-- ================================================================
-- ANÁLISIS DE CONSULTAS CON EXPLAIN
-- ================================================================

-- · Analizar búsqueda por categoría en Postres (sin ORDER BY)
EXPLAIN SELECT * FROM Postres  WHERE categoria = 'chocolate';

-- · Analizar búsqueda por categoría en Pasteles
EXPLAIN SELECT * FROM Pasteles WHERE categoria = 'chocolate';

-- · Analizar búsqueda con filtro y ordenamiento en Postres
EXPLAIN SELECT * FROM Postres  WHERE categoria = 'chocolate' ORDER BY precio ASC;

-- · Analizar búsqueda con LIKE en Clases
EXPLAIN SELECT * FROM Clases   WHERE tipo LIKE 'Fondant%';


-- ================================================================
-- REVISIÓN DE ÍNDICES
-- ================================================================

-- · Mostrar índices existentes en cada tabla
SHOW INDEX FROM Postres;
SHOW INDEX FROM Pasteles;
SHOW INDEX FROM Gelatinas;
