CREATE USER 'admin_proyecto'@'localhost' IDENTIFIED BY 'Admin#2026!';
GRANT ALL PRIVILEGES ON imeyco_db.* TO 'admin_proyecto'@'localhost';

CREATE USER 'lector_app'@'%' IDENTIFIED BY 'L3ct0r_App#2026';
GRANT SELECT ON imeyco_db.* TO 'lector_app'@'%';

CREATE USER 'editor_app'@'localhost' IDENTIFIED BY 'Ed1t0r_App#2026';
GRANT SELECT, INSERT, UPDATE ON imeyco_db.* TO 'editor_app'@'localhost';

FLUSH PRIVILEGES;