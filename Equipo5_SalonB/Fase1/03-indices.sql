-- INDICE PARA BUSQUEDA DE PRODUCTOS
CREATE INDEX idx_nombre_producto
ON productos(nombre);

-- INDICE PARA CONSULTAS DE CLIENTES
CREATE INDEX idx_cliente
ON ventas(id_cliente);