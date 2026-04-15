CREATE USER 'cajero'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT ON tacos_el_canelo.* TO 'cajero'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON tacos_el_canelo.* TO 'admin'@'localhost';

FLUSH PRIVILEGES;
