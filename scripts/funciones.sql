
USE panaderia;

-- =====================================================================
-- FUNCIONES
-- =====================================================================
DELIMITER $$

-- 1 Calcular IVA sobre un monto (15% - tarifa vigente en Ecuador)
CREATE FUNCTION fn_calcular_iva(p_monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(p_monto * 0.15, 2);
END$$

-- 2 Calcular descuento según porcentaje
CREATE FUNCTION fn_calcular_descuento(p_monto DECIMAL(10,2), p_porcentaje DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(p_monto * (p_porcentaje / 100), 2);
END$$

-- 3 Total de una venta (suma del detalle)--
CREATE FUNCTION fn_total_venta(p_id_venta VARCHAR(10))
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT COALESCE(SUM(Total), 0) INTO v_total
    FROM Detalle_Venta
    WHERE ID_Venta = p_id_venta;
    RETURN v_total;
END$$

-- 4 Total histórico comprado por un cliente--
CREATE FUNCTION fn_total_comprado_cliente(p_id_cliente VARCHAR(10))
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT COALESCE(SUM(dv.Total), 0) INTO v_total
    FROM Ventas v
    JOIN Detalle_Venta dv ON dv.ID_Venta = v.ID_Venta
    WHERE v.ID_Cliente = p_id_cliente;
    RETURN v_total;
END$$

-- 5 Total vendido por un empleado--
CREATE FUNCTION fn_total_vendido_empleado(p_id_empleado VARCHAR(10))
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT COALESCE(SUM(dv.Total), 0) INTO v_total
    FROM Ventas v
    JOIN Detalle_Venta dv ON dv.ID_Venta = v.ID_Venta
    WHERE v.ID_Empleado = p_id_empleado;
    RETURN v_total;
END$$

-- 6 Cantidad de productos registrados en una categoría--
CREATE FUNCTION fn_productos_por_categoria(p_id_categoria VARCHAR(10))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE v_cantidad INT;
    SELECT COUNT(*) INTO v_cantidad
    FROM Productos
    WHERE ID_Categoria = p_id_categoria;
    RETURN v_cantidad;
END$$

DELIMITER ;

