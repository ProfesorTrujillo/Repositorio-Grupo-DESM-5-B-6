-- Definición de seguridad y perfiles de acceso
DROP USER IF EXISTS 'administrador'@'localhost';
DROP USER IF EXISTS 'encargado'@'localhost';
DROP USER IF EXISTS 'usuario'@'%';

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'Admin123*';  
CREATE USER 'encargado'@'localhost' IDENTIFIED BY 'NuevoPass123*';  
CREATE USER 'usuario'@'%' IDENTIFIED BY 'Usuario123*'; 

GRANT ALL PRIVILEGES ON `servimedica`.* TO 'administrador'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON `servimedica`.* TO 'encargado'@'localhost'; 
GRANT SELECT ON `servimedica`.v_tickets_pendientes TO 'usuario'@'%'; 
GRANT SELECT (nombre, email) ON `servimedica`.usuarios TO 'usuario'@'%'; 

FLUSH PRIVILEGES;