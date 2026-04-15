DELIMITER //

CREATE PROCEDURE agregar_producto(
IN p_nombre VARCHAR(100),
IN p_precio DECIMAL(10,2),
IN p_stock INT
)
BEGIN
INSERT INTO productos(nombre,precio,stock)
VALUES(p_nombre,p_precio,p_stock);
END //

DELIMITER ;