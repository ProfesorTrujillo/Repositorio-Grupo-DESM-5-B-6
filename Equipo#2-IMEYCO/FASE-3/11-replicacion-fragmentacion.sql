-- Fragmentación vertical
CREATE DATABASE imeyco_admin_db;

CREATE TABLE imeyco_admin_db.usuarios_admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  password_hash VARCHAR(255)
);

-- Fragmentación horizontal
CREATE DATABASE imeyco_db_2026;

CREATE TABLE imeyco_db_2026.responses LIKE imeyco_db.responses;

INSERT INTO imeyco_db_2026.responses
SELECT * FROM imeyco_db.responses
WHERE YEAR(submitted_at)=2026;