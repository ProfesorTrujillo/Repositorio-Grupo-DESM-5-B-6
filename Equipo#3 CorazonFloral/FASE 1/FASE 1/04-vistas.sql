CREATE VIEW vista_catalogo_cliente AS
SELECT nombre, descripcion, precio
FROM Productos
WHERE stock > 0;