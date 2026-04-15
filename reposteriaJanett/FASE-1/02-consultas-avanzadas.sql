-- PasteleriaJan | Fase 1 · 02 - Consultas Avanzadas
-- ----------------------------------------------------------------
USE PasteleriaJan;

-- · Filtros por categoría y características

SELECT * FROM Gelatinas WHERE categoria = 'mosaico';
SELECT * FROM Pasteles  WHERE categoria = 'chocolate';
SELECT * FROM Pasteles  WHERE tamaño    = 'grande';
SELECT * FROM Pasteles  WHERE forma     = 'circular';
SELECT * FROM Pasteles  WHERE forma     = 'cuadrado';

-- · Ordenamientos

SELECT * FROM Gelatinas ORDER BY precio ASC;
SELECT * FROM Pasteles  ORDER BY precio ASC;
SELECT * FROM Gelatinas ORDER BY categoria ASC, precio ASC;
SELECT * FROM Pasteles  ORDER BY categoria ASC, nombre ASC, precio ASC;
SELECT * FROM Pasteles  ORDER BY tamaño ASC, precio ASC;

-- · Join entre Usuarios y Roles

SELECT u.nombre, r.nombre AS rol
FROM Usuarios u
JOIN Roles r ON u.rol_id = r.id;
