CREATE DATABASE IF NOT EXISTS ClinicPlus;
USE ClinicPlus;

DROP TABLE IF EXISTS Pacientes;

CREATE TABLE Pacientes (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    diagnostico VARCHAR(100)
);

INSERT INTO Pacientes (nombre, edad, diagnostico) VALUES
('Ana López', 29, 'Chequeo general'),
('Bruno Díaz', 41, 'Hipertensión'),
('Carla Pérez', 35, 'Alergia estacional');

INSERT INTO Pacientes (nombre, edad, diagnostico)
VALUES ('Diego Martínez', 50, 'Diabetes');

INSERT INTO Pacientes (nombre, edad, diagnostico)
VALUES ('Laura Gómez', 22, 'Gripe');

SELECT * FROM Pacientes;

SELECT * FROM Pacientes WHERE edad > 30;

SELECT * FROM Pacientes WHERE diagnostico = 'Diabetes';

SELECT * FROM Pacientes WHERE nombre LIKE '%Ana%';

UPDATE Pacientes
SET diagnostico = 'Presión alta'
WHERE nombre = 'Bruno Díaz';

DELETE FROM Pacientes
WHERE nombre = 'Laura Gómez';

SELECT COUNT(*) AS TotalPacientes FROM Pacientes;

SELECT AVG(edad) AS EdadPromedio FROM Pacientes;

SELECT MAX(edad) AS EdadMayor FROM Pacientes;
