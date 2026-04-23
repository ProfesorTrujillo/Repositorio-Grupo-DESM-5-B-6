-- =========================================
-- 1. USUARIO SOLO CONSULTA
-- =========================================
CREATE USER 'lector'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON *.* TO 'lector'@'localhost';

-- =========================================
-- 2. ADMINISTRACIÓN DE PERMISOS
-- =========================================

-- a) Usuario administrador (control total)
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';

-- b) Usuario operativo (uso diario)
CREATE USER 'operativo'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'operativo'@'localhost';

-- =========================================
-- 3. PLAN DE RESPALDO
-- =========================================

-- Tipo de respaldo:
-- Respaldo completo (Full Backup)

-- Periodicidad:
-- Se realiza diariamente

-- Escenario de restauración:
-- En caso de falla del sistema o pérdida de datos,
-- se utiliza el respaldo más reciente para recuperar la información.

-- Script de respaldo:
-- mysqldump -u root -p empresa_db > respaldo.sql;

-- Script de restauración:
-- mysql -u root -p empresa_db < respaldo.sql;

-- =========================================
-- 4. REPLICACIÓN
-- =========================================

-- La replicación se puede implementar usando el modelo Maestro-Esclavo:
-- El servidor maestro gestiona INSERT, UPDATE y DELETE.
-- El servidor esclavo mantiene una copia actualizada para consultas.
-- Esto mejora el rendimiento y la disponibilidad del sistema.

-- =========================================
-- 5. FRAGMENTACIÓN
-- =========================================

-- La fragmentación permite dividir la base de datos en partes:
-- Horizontal: dividir registros (por ejemplo ventas por año).
-- Vertical: dividir columnas (por ejemplo datos sensibles).
-- Esto mejora el rendimiento y facilita el manejo de grandes volúmenes de datos.