USE panaderia;

-- =====================================================================
-- PROCEDIMIENTOS ALMACENADOS
-- =====================================================================
DELIMITER $$

-- 1 Registrar cliente (valida cédula duplicada)
CREATE PROCEDURE sp_registrar_cliente(
    IN p_id_cliente VARCHAR(10),
    IN p_cedula BIGINT,
    IN p_nombre VARCHAR(60),
    IN p_apellido VARCHAR(60),
    IN p_telefono BIGINT,
    IN p_correo VARCHAR(100),
    IN p_direccion VARCHAR(150),
    IN p_tipo_cliente VARCHAR(20)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Clientes WHERE Cedula = p_cedula) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un cliente registrado con esa cédula.';
    ELSE
        INSERT INTO Clientes (ID_Cliente, Cedula, Nombre, Apellido, Telefono, Correo, Direccion, Tipo_Cliente)
        VALUES (p_id_cliente, p_cedula, p_nombre, p_apellido, p_telefono, p_correo, p_direccion, p_tipo_cliente);
    END IF;
END$$

-- 2 Registrar producto
CREATE PROCEDURE sp_registrar_producto(
    IN p_id_producto VARCHAR(10),
    IN p_nombre VARCHAR(100),
    IN p_id_categoria VARCHAR(10),
    IN p_id_marca VARCHAR(10),
    IN p_unidad VARCHAR(20),
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Productos (ID_Producto, Nombre, ID_Categoria, ID_Marca, Unidad, Precio)
    VALUES (p_id_producto, p_nombre, p_id_categoria, p_id_marca, p_unidad, p_precio);
END$$

-- 3 Registrar proveedor
CREATE PROCEDURE sp_registrar_proveedor(
    IN p_id_proveedor VARCHAR(10),
    IN p_nombre VARCHAR(100),
    IN p_ciudad VARCHAR(60),
    IN p_telefono BIGINT,
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO Proveedores (ID_Proveedor, Nombre, Ciudad, Telefono, Correo)
    VALUES (p_id_proveedor, p_nombre, p_ciudad, p_telefono, p_correo);
END$$

-- 4 Registrar empleado
CREATE PROCEDURE sp_registrar_empleado(
    IN p_id_empleado VARCHAR(10),
    IN p_nombre VARCHAR(60),
    IN p_cargo VARCHAR(40)
)
BEGIN
    INSERT INTO Empleados (ID_Empleado, Nombre, Cargo)
    VALUES (p_id_empleado, p_nombre, p_cargo);
END$$

-- 5 Registrar venta completa
CREATE PROCEDURE sp_registrar_venta(
    IN p_id_venta VARCHAR(10),
    IN p_fecha DATE,
    IN p_hora TIME,
    IN p_estado_venta VARCHAR(20),
    IN p_id_cliente VARCHAR(10),
    IN p_id_empleado VARCHAR(10),
    IN p_id_sucursal VARCHAR(10),
    IN p_id_metodopago VARCHAR(10),
    IN p_observacion VARCHAR(200),
    IN p_id_detalle VARCHAR(10),
    IN p_id_producto VARCHAR(10),
    IN p_id_proveedor VARCHAR(10),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_promocion VARCHAR(30),
    IN p_descuento DECIMAL(10,2),
    IN p_lote VARCHAR(20),
    IN p_fecha_caducidad DATE
)
proc_body: BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_iva DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    INSERT INTO Ventas (ID_Venta, Fecha, Hora, Estado_Venta, ID_Cliente, ID_Empleado, ID_Sucursal, ID_MetodoPago, Observacion)
    VALUES (p_id_venta, p_fecha, p_hora, p_estado_venta, p_id_cliente, p_id_empleado, p_id_sucursal, p_id_metodopago, p_observacion);

    SET v_subtotal = ROUND((p_cantidad * p_precio_unitario) - p_descuento, 2);
    SET v_iva = ROUND(v_subtotal * 0.15, 2);
    SET v_total = ROUND(v_subtotal + v_iva, 2);

    INSERT INTO Detalle_Venta
        (ID_Detalle, ID_Venta, ID_Producto, ID_Proveedor, Cantidad, Precio_Unitario,
         Promocion, Descuento, Subtotal, IVA, Total, Lote, Fecha_Caducidad)
    VALUES
        (p_id_detalle, p_id_venta, p_id_producto, p_id_proveedor, p_cantidad, p_precio_unitario,
         p_promocion, p_descuento, v_subtotal, v_iva, v_total, p_lote, p_fecha_caducidad);
    COMMIT;
    SELECT 'Venta registrada exitosamente' AS Mensaje, p_id_venta AS ID_Venta;
END$$

-- 6 Actualizar precio de un producto (el historial lo guarda el trigger)
CREATE PROCEDURE sp_actualizar_precio_producto(
    IN p_id_producto VARCHAR(10),
    IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
    UPDATE Productos
    SET Precio = p_nuevo_precio
    WHERE ID_Producto = p_id_producto;
END$$

-- 7 Reporte de ventas mensuales de un año dado
CREATE PROCEDURE sp_reporte_ventas_mensuales(IN p_anio INT)
BEGIN
    SELECT
        MONTH(v.Fecha) AS Mes,
        COUNT(DISTINCT v.ID_Venta) AS TotalVentas,
        SUM(dv.Total) AS MontoTotal
    FROM Ventas v
    JOIN Detalle_Venta dv ON dv.ID_Venta = v.ID_Venta
    WHERE YEAR(v.Fecha) = p_anio
    GROUP BY MONTH(v.Fecha)
    ORDER BY Mes;
END$$

-- 8 Registrar auditoría manualmente (además de los triggers automáticos)
CREATE PROCEDURE sp_registrar_auditoria(
    IN p_usuario VARCHAR(60),
    IN p_accion VARCHAR(20),
    IN p_tabla VARCHAR(60),
    IN p_detalle VARCHAR(255)
)
BEGIN
    INSERT INTO Auditoria (Usuario, Accion, Tabla_Afectada, Detalle)
    VALUES (p_usuario, p_accion, p_tabla, p_detalle);
END$$

DELIMITER ;

