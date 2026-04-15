-- CREACIÓN DE USUARIOS
CREATE USER 'admin_floral'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'empleado_floral'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'lector_floral'@'%' IDENTIFIED BY '1234';
CREATE USER 'app_floral'@'localhost' IDENTIFIED BY '1234';

-- PERMISOS
GRANT ALL PRIVILEGES ON corazon_floral.* TO 'admin_floral'@'localhost';

GRANT SELECT, INSERT, UPDATE 
ON corazon_floral.* TO 'empleado_floral'@'localhost';

GRANT SELECT 
ON corazon_floral.* TO 'lector_floral'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON corazon_floral.* TO 'app_floral'@'localhost';

-- APLICAR CAMBIOS
FLUSH PRIVILEGES;

-- REVOCAR (ejemplo)
REVOKE DELETE ON corazon_floral.* FROM 'empleado_floral'@'localhost';