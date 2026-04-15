DELIMITER //

CREATE TRIGGER actualizar_stock
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
UPDATE productos
SET stock = stock - 1
WHERE id_producto = NEW.id_venta;
END //

DELIMITER ;