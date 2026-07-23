use panaderia
-- 1. venta completa

start transaction;
insert into Ventas
(id_venta, fecha, hora, estado_venta, id_cliente, id_empleado, id_sucursal, id_metodopago, observacion)
values
('V0202','2026-07-11','10:30:00','Pagada','C041','E01','S01','MP01','Venta de prueba');

insert into Detalle_Venta
(id_detalle,id_venta,id_producto,id_proveedor,cantidad,precio_unitario,promocion,descuento,subtotal,iva,total,lote,fecha_caducidad)
values
('DET201','V0202','P001','PR001',2,2.50,'Ninguna',0,5.00,0.60,5.60,'L001','2026-12-31');

commit;


-- 2. registrar cliente

start transaction;

insert into Clientes
(id_cliente,cedula,nombre,apellido,telefono,correo,direccion,tipo_cliente)
values
('CLI201',1234567890,'Carlos','Mendoza',987654321,'carlos@gmail.com','Loja','Nuevo');

commit;


-- 3. actualizar precio de un producto

start transaction;

update Productos
set precio = 3.25
where id_producto = 'PRO001';

commit;


-- 4. cambiar metodo de pago

start transaction;

update Ventas
set id_metodopago = 2
where id_venta = 'VEN001';

commit;