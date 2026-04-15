-- PasteleriaJan | Fase 3 · 09 - Usuarios y Privilegios
-- ----------------------------------------------------------------
USE PasteleriaJan;

-- · Creación de usuarios

CREATE USER IF NOT EXISTS 'admin_jan'@'localhost'  IDENTIFIED BY 'Admin2024!';
CREATE USER IF NOT EXISTS 'lector_jan'@'localhost' IDENTIFIED BY 'Lector2024!';
CREATE USER IF NOT EXISTS 'app_jan'@'localhost'    IDENTIFIED BY 'App2024!';

-- · Asignación de privilegios
--   admin_jan  -> acceso total a la base de datos
--   lector_jan -> solo lectura
--   app_jan    -> lectura, inserción y actualización

GRANT ALL PRIVILEGES         ON PasteleriaJan.* TO 'admin_jan'@'localhost';
GRANT SELECT                 ON PasteleriaJan.* TO 'lector_jan'@'localhost';
GRANT SELECT, INSERT, UPDATE ON PasteleriaJan.* TO 'app_jan'@'localhost';

-- · Aplicar cambios de privilegios

FLUSH PRIVILEGES;

-- · Verificar privilegios asignados

SHOW GRANTS FOR 'admin_jan'@'localhost';
SHOW GRANTS FOR 'lector_jan'@'localhost';
SHOW GRANTS FOR 'app_jan'@'localhost';
