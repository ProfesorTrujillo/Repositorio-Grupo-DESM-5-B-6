CREATE TABLE Auditoria_Pedidos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio DATETIME
);

DELIMITER //

CREATE TRIGGER trg_auditoria_pedidos
AFTER UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO Auditoria_Pedidos(
            id_pedido,
            estado_anterior,
            estado_nuevo,
            fecha_cambio
        )
        VALUES(
            OLD.id_pedido,
            OLD.estado,
            NEW.estado,
            NOW()
        );
    END IF;
END //

DELIMITER ;

-- ======================================

DELIMITER //

CREATE TRIGGER trg_validar_stock
BEFORE INSERT ON Detalle_Pedidos
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;

    SELECT stock INTO v_stock
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para el producto';
    END IF;
END //

DELIMITER ;