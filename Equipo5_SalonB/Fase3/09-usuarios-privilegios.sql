CREATE USER 'admin_proyecto'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON inventario_salon.* TO 'admin_proyecto'@'localhost';

CREATE USER 'editor_app'@'localhost' IDENTIFIED BY 'editor123';
GRANT SELECT, INSERT, UPDATE ON inventario_salon.* TO 'editor_app'@'localhost';

CREATE USER 'lector_app'@'%' IDENTIFIED BY 'lector123';
GRANT SELECT ON inventario_salon.* TO 'lector_app'@'%';