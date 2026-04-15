-- PasteleriaJan | Fase 3 · 10 - Respaldos y Restauración
-- ----------------------------------------------------------------
-- NOTA: Todos los comandos de este archivo se ejecutan en la TERMINAL
--       del sistema operativo, no dentro de MySQL.
-- ----------------------------------------------------------------

-- · Respaldo completo de la base de datos

-- mysqldump -u admin_jan -p PasteleriaJan > respaldo_pasteleriaJan.sql

-- · Restauración completa de la base de datos

-- mysql -u admin_jan -p PasteleriaJan < respaldo_pasteleriaJan.sql

-- · Respaldo solo de tablas de productos (Pasteles, Gelatinas, Postres)

-- mysqldump -u admin_jan -p PasteleriaJan Pasteles Gelatinas Postres > respaldo_productos.sql

-- · Respaldo únicamente de la estructura (sin datos)

-- mysqldump -u admin_jan -p --no-data PasteleriaJan > estructura_pasteleriaJan.sql

-- · Respaldo únicamente de los datos (sin estructura)

-- mysqldump -u admin_jan -p --no-create-info PasteleriaJan > datos_pasteleriaJan.sql
