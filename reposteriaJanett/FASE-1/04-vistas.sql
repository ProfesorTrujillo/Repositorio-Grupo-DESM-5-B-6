-- PasteleriaJan | Fase 1 · 04 - Vistas
-- ----------------------------------------------------------------
USE PasteleriaJan;

-- · Gelatinas con precio superior al promedio

CREATE VIEW v_GelatinasCaras AS
    SELECT * FROM Gelatinas
    WHERE precio > (SELECT AVG(precio) FROM Gelatinas);

-- · Pasteles con precio superior al promedio

CREATE VIEW v_PastelesCaro AS
    SELECT * FROM Pasteles
    WHERE precio > (SELECT AVG(precio) FROM Pasteles);

-- · Usuarios con su rol asignado

CREATE VIEW v_UsuariosRol AS
    SELECT u.id, u.nombre, u.correo, r.nombre AS rol
    FROM Usuarios u
    JOIN Roles r ON u.rol_id = r.id;

-- · Clases disponibles ordenadas por fecha

CREATE VIEW v_ClasesDisponibles AS
    SELECT id, tipo, precio, inscritos, descri, fecha
    FROM Clases
    ORDER BY fecha ASC;
