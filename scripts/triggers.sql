USE panaderia;

-- =====================================================================
-- Triggers
-- =====================================================================
DELIMITER $$

-- 1. Auditoría: INSERT en Clientes
CREATE TRIGGER trg_auditoria_insert_clientes
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Usuario, Accion, Tabla_Afectada, Detalle)
    VALUES (CURRENT_USER(), 'INSERT', 'Clientes',
            CONCAT('Nuevo cliente ID=', NEW.ID_Cliente, ' Nombre=', NEW.Nombre, ' ', NEW.Apellido));
END$$

-- 2. Auditoría: UPDATE en Clientes
CREATE TRIGGER trg_auditoria_update_clientes
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Usuario, Accion, Tabla_Afectada, Detalle)
    VALUES (CURRENT_USER(), 'UPDATE', 'Clientes',
            CONCAT('Cliente ID=', OLD.ID_Cliente,
                   ' | Antes: ', OLD.Nombre, ' ', OLD.Apellido, ', Tel=', OLD.Telefono,
                   ' | Ahora: ', NEW.Nombre, ' ', NEW.Apellido, ', Tel=', NEW.Telefono));
END$$

-- 3. Auditoría: DELETE en Clientes
CREATE TRIGGER trg_auditoria_delete_clientes
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Usuario, Accion, Tabla_Afectada, Detalle)
    VALUES (CURRENT_USER(), 'DELETE', 'Clientes',
            CONCAT('Cliente eliminado ID=', OLD.ID_Cliente, ' Nombre=', OLD.Nombre, ' ', OLD.Apellido));
END$$

-- 4. Calcular Subtotal/IVA/Total automáticamente y validar cantidad > 0
CREATE TRIGGER trg_calcular_totales_detalle
BEFORE INSERT ON Detalle_Venta
FOR EACH ROW
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_iva DECIMAL(10,2);

    IF NEW.Cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cantidad vendida debe ser mayor a cero.';
    END IF;

    SET v_subtotal = (NEW.Cantidad * NEW.Precio_Unitario) - NEW.Descuento;
    SET v_iva = ROUND(v_subtotal * 0.15, 2);

    SET NEW.Subtotal = v_subtotal;
    SET NEW.IVA = v_iva;
    SET NEW.Total = v_subtotal + v_iva;
END$$

-- 5. Validar que el precio de un producto nuevo sea positivo
CREATE TRIGGER trg_valida_precio_positivo
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
    IF NEW.Precio <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio del producto debe ser mayor a cero.';
    END IF;
END$$

-- 6. Guardar historial cuando cambia el precio de un producto
CREATE TRIGGER trg_historial_cambio_precio
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF NEW.Precio <> OLD.Precio THEN
        INSERT INTO HistorialPrecios (ID_Producto, Precio_Anterior, Precio_Nuevo)
        VALUES (OLD.ID_Producto, OLD.Precio, NEW.Precio);
    END IF;
END$$

-- 7. Auditoría: INSERT en Ventas
CREATE TRIGGER trg_auditoria_venta
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Usuario, Accion, Tabla_Afectada, Detalle)
    VALUES (CURRENT_USER(), 'INSERT', 'Ventas',
            CONCAT('Venta ID=', NEW.ID_Venta, ' Cliente=', NEW.ID_Cliente, ' Fecha=', NEW.Fecha));
END$$

DELIMITER ;

