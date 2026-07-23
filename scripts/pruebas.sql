
USE panaderia;

-- =====================================================================
-- PROBAR FUNCIONES
-- =====================================================================
-- =====================================================================
-- PROBAR FUNCIONES
-- =====================================================================
-- 1
SELECT 
    p.ID_Producto,
    p.Nombre AS Producto,
    p.Precio AS 'Precio Unitario',
    fn_calcular_iva(p.Precio) AS 'IVA',
    p.Precio + fn_calcular_iva(p.Precio) AS 'Precio con IVA'
FROM Productos p
LIMIT 5;

-- 2
SELECT 
    p.ID_Producto,
    p.Nombre AS Producto,
    p.Precio AS 'Precio Unitario',
    fn_calcular_descuento(p.Precio, 5) AS 'Descuento 5%',
    fn_calcular_descuento(p.Precio, 10) AS 'Descuento 10%',
    fn_calcular_descuento(p.Precio, 15) AS 'Descuento 15%',
    fn_calcular_descuento(p.Precio, 20) AS 'Descuento 20%'
FROM Productos p
WHERE p.ID_Producto IN ('P01', 'P04', 'P08')
ORDER BY p.Precio DESC;

-- 3
SELECT fn_total_venta('V0001') AS Total_Venta; 

-- 4
SELECT 
    c.ID_Cliente,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    fn_total_comprado_cliente(c.ID_Cliente) AS 'Total Comprado'
FROM Clientes c
WHERE c.ID_Cliente IN ('C001', 'C002', 'C003');

-- 5
SELECT 
    e.ID_Empleado,
    e.Nombre AS Empleado,
    e.Cargo,
    fn_total_vendido_empleado(e.ID_Empleado) AS 'Total Vendido'
FROM Empleados e
WHERE e.ID_Empleado IN ('E01', 'E02', 'E03')
ORDER BY fn_total_vendido_empleado(e.ID_Empleado) DESC;

-- 6
SELECT 
    cat.ID_Categoria,
    cat.Nombre AS Categoría,
    fn_productos_por_categoria(cat.ID_Categoria) AS 'Cantidad de Productos'
FROM Categorias cat
ORDER BY fn_productos_por_categoria(cat.ID_Categoria) DESC;



-- =====================================================================
-- PRUEBAS PROCEDIMIENTOS ALMACENADOS
-- =====================================================================
-- =====================================================================
-- PRUEBAS PROCEDIMIENTOS ALMACENADOS
-- =====================================================================

-- 1 Valida cédula duplicada antes de insertar
CALL sp_registrar_cliente('C041', 1710000041, 'María', 'Mendoza', 0987654321, 'maria@mail.com', 'Calle 41', 'Nuevo');
select * from Clientes order by id_cliente desc limit 3;

-- 2 Registra producto con categoría y marca
CALL sp_registrar_producto('P11', 'Pan de Ajo', 'CAT02', 'MAR02', 'Unidad', 1.50);
SELECT * FROM panaderia.Productos;

-- 3 Almacena datos completos del proveedor
CALL sp_registrar_proveedor('PR06', 'Distribuidora Nacional', 'Quito', 022345678, 'distribuidora@proveedor.com');
SELECT * FROM panaderia.Proveedores;

-- 4 Registra nuevo empleado
CALL sp_registrar_empleado('E09', 'Carlos', 'Vendedor');
SELECT * FROM panaderia.Empleados;

-- 5 Registra venta con transacción (COMMIT/ROLLBACK)
CALL sp_registrar_venta('V0201', '2026-07-08', '10:30:00', 'Pagada', 'C001', 'E02', 'S01', 'MP01', 'Observación', 'DET201', 'P01', 'PR01', 5, 0.30, '10%', 0.15, 'L9999', '2026-07-15');
SELECT * FROM panaderia.Ventas;
SELECT * FROM panaderia.Detalle_Venta;

-- 6 Actualiza precio y guarda historial automáticamente
CALL sp_actualizar_precio_producto('P01', 0.35);
SELECT * FROM panaderia.Productos;

-- 7 Reporte de ventas mensuales del año 2026
CALL sp_reporte_ventas_mensuales(2026);


-- 8 Registra auditoría manual
CALL sp_registrar_auditoria('admin_local', 'MANUAL', 'Sistema', 'Auditoría manual de prueba');
SELECT * FROM panaderia.Auditoria;


-- =====================================================================
-- Verificacion de triggers creados
-- =====================================================================
SHOW TRIGGERS;

-- =====================================================================
-- PRUEBAS DE TRIGGERS
-- =====================================================================
-- =====================================================================
-- PRUEBAS DE TRIGGERS
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Prueba: trg_auditoria_insert_clientes (INSERT en Clientes)
-- ---------------------------------------------------------------------
INSERT INTO Clientes (ID_Cliente, Cedula, Nombre, Apellido, Telefono, Correo, Direccion, Tipo_Cliente)
VALUES ('C999', 9999999999, 'Prueba', 'Insert', 0999999999, 'prueba_insert@mail.com', 'Calle Prueba 1', 'Nuevo');

SELECT * FROM Auditoria WHERE Tabla_Afectada = 'Clientes' ORDER BY ID_Auditoria DESC LIMIT 1;
SELECT * FROM Clientes WHERE ID_Cliente = 'C999';


-- ---------------------------------------------------------------------
-- 2. Prueba: trg_auditoria_update_clientes (UPDATE en Clientes)
-- ---------------------------------------------------------------------
UPDATE Clientes 
SET Telefono = 0988888888, Correo = 'alejo@mail.com'
WHERE ID_Cliente = 'C999';

SELECT * FROM Auditoria WHERE Tabla_Afectada = 'Clientes' ORDER BY ID_Auditoria DESC LIMIT 1;
SELECT * FROM Clientes WHERE ID_Cliente = 'C999';


-- ---------------------------------------------------------------------
-- 3. Prueba: trg_auditoria_delete_clientes (DELETE en Clientes)
-- ---------------------------------------------------------------------
DELETE FROM Clientes WHERE ID_Cliente = 'C999';

SELECT * FROM Auditoria WHERE Tabla_Afectada = 'Clientes' ORDER BY ID_Auditoria DESC LIMIT 1;
SELECT * FROM Clientes WHERE ID_Cliente = 'C999';  -- No debe devolver nada


-- ---------------------------------------------------------------------
-- 4. Prueba: trg_calcular_totales_detalle (INSERT en Detalle_Venta)
-- ---------------------------------------------------------------------
-- Primero creamos una venta de prueba
INSERT INTO Ventas (ID_Venta, Fecha, Hora, Estado_Venta, ID_Cliente, ID_Empleado, ID_Sucursal, ID_MetodoPago, Observacion)
VALUES ('V9999', CURDATE(), CURTIME(), 'Pagada', 'C001', 'E01', 'S01', 'MP01', 'Venta de prueba para trigger');

-- Insertamos un detalle de venta (SOLO con datos básicos, el trigger calcula el resto)
INSERT INTO Detalle_Venta (ID_Detalle, ID_Venta, ID_Producto, ID_Proveedor, Cantidad, Precio_Unitario, Promocion, Descuento, Subtotal, IVA, Total, Lote, Fecha_Caducidad)
VALUES ('D9999', 'V9999', 'P01', 'PR01', 5, 0.30, '10%', 0.15, 0, 0, 0, 'L9999', '2026-12-31');

SELECT * FROM Detalle_Venta WHERE ID_Detalle = 'D9999';
SELECT * FROM Auditoria WHERE Tabla_Afectada = 'Ventas' ORDER BY ID_Auditoria DESC LIMIT 1;


-- ---------------------------------------------------------------------
-- 5. Prueba: trg_valida_precio_positivo (INSERT en Productos)
-- ---------------------------------------------------------------------
-- Esta prueba debe fallar (precio negativo)
INSERT INTO Productos (ID_Producto, Nombre, ID_Categoria, ID_Marca, Unidad, Precio)
VALUES ('P999', 'Producto Prueba', 'CAT01', 'MAR01', 'Unidad', -5.00);
-- Error esperado: "El precio del producto debe ser mayor a cero."

-- Esta prueba debe funcionar (precio positivo)
INSERT INTO Productos (ID_Producto, Nombre, ID_Categoria, ID_Marca, Unidad, Precio)
VALUES ('P999', 'Producto Prueba', 'CAT01', 'MAR01', 'Unidad', 5.00);

SELECT * FROM Productos WHERE ID_Producto = 'P999';


-- ---------------------------------------------------------------------
-- 6. Prueba: trg_historial_cambio_precio (UPDATE en Productos)
-- ---------------------------------------------------------------------
UPDATE Productos SET Precio = 7.50 WHERE ID_Producto = 'P999';

SELECT * FROM HistorialPrecios WHERE ID_Producto = 'P999' ORDER BY ID_Historial DESC LIMIT 1;
SELECT * FROM Productos WHERE ID_Producto = 'P999';


-- ---------------------------------------------------------------------
-- 7. Prueba: trg_auditoria_venta (INSERT en Ventas)
-- ---------------------------------------------------------------------
-- Ya creamos una venta en la prueba #4, pero hacemos otra para verificar
INSERT INTO Ventas (ID_Venta, Fecha, Hora, Estado_Venta, ID_Cliente, ID_Empleado, ID_Sucursal, ID_MetodoPago, Observacion)
VALUES ('V8888', CURDATE(), CURTIME(), 'Pagada', 'C002', 'E02', 'S02', 'MP02', 'Venta de prueba para trigger auditoria');

SELECT * FROM Auditoria WHERE Tabla_Afectada = 'Ventas' ORDER BY ID_Auditoria DESC LIMIT 1;
SELECT * FROM Ventas WHERE ID_Venta = 'V8888';



