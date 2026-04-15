-- PasteleriaJan | Fase 1 · 01 - Modelo de Datos
-- ----------------------------------------------------------------

DROP DATABASE IF EXISTS PasteleriaJan;
CREATE DATABASE PasteleriaJan;
USE PasteleriaJan;

-- · Tablas

CREATE TABLE Roles (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Administradores (
    id         VARCHAR(50)  PRIMARY KEY,
    usuario    VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Usuarios (
    id             VARCHAR(50)  PRIMARY KEY,
    nombre         VARCHAR(150) NOT NULL,
    correo         VARCHAR(150) NOT NULL UNIQUE,
    pass           VARCHAR(150) NOT NULL,
    rol_id         INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES Roles(id)
);

CREATE TABLE Clases (
    id        VARCHAR(50)  PRIMARY KEY,
    tipo      VARCHAR(50)  NOT NULL,
    precio    INT,
    inscritos INT,
    descri    VARCHAR(150) NOT NULL,
    fecha     DATETIME
);

CREATE TABLE Postres (
    id        VARCHAR(50)   PRIMARY KEY,
    postre    VARCHAR(100)  NOT NULL,
    categoria VARCHAR(100)  NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Gelatinas (
    id        VARCHAR(50)   PRIMARY KEY,
    gelatina  VARCHAR(100)  NOT NULL,
    categoria VARCHAR(100)  NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Pasteles (
    id        VARCHAR(50)   PRIMARY KEY,
    nombre    VARCHAR(100)  NOT NULL,
    forma     ENUM('circular','cuadrado') NOT NULL,
    categoria VARCHAR(100),
    tamaño    VARCHAR(50)   NOT NULL,
    precio    DECIMAL(10,2) NOT NULL CHECK (precio >= 0)
);

CREATE TABLE Inscripciones (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id        VARCHAR(50) NOT NULL,
    clase_id          VARCHAR(50) NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (clase_id)   REFERENCES Clases(id),
    UNIQUE (usuario_id, clase_id)
);

-- · Datos iniciales

INSERT INTO Roles (nombre) VALUES ('Administrador'), ('Usuario');

INSERT INTO Gelatinas (id, gelatina, categoria, precio) VALUES
('G1', 'Gelatina de Fresa', 'agua',    25.00),
('G2', 'Gelatina de Leche', 'leche',   30.00),
('G3', 'Gelatina Mosaico',  'mosaico', 40.00);

INSERT INTO Pasteles (id, nombre, forma, categoria, tamaño, precio) VALUES
('P1', 'Pastel de Chocolate', 'circular', 'chocolate',   'mediano', 250.00),
('P2', 'Pastel de Vainilla',  'cuadrado', 'vainilla',    'grande',  300.00),
('P3', 'Pastel Tres Leches',  'circular', 'tres leches', 'chico',   200.00);

INSERT INTO Clases (id, tipo, precio, inscritos, descri, fecha) VALUES
('C1', 'Curso de Pasteles',  350, 0, 'Aprende a decorar y hornear pasteles',      '2026-04-15 10:00:00'),
('C2', 'Curso de Gelatinas', 300, 0, 'Técnicas modernas de gelatinas artísticas', '2026-04-20 15:00:00'),
('C3', 'Curso de Postres',   320, 0, 'Postres gourmet fáciles de preparar',       '2026-04-25 17:00:00');

INSERT INTO Usuarios (id, nombre, correo, pass, rol_id) VALUES
('U1', 'Juan Pérez', 'juan@correo.com',  'hash_password', 2),
('U2', 'Darck',      'darck@correo.com', 'hash_password', 1);
