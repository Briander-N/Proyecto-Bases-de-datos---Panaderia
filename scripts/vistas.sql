use panaderia;
-- vista clientes frecuentes

create view vista_clientes_frecuentes as
select
c.id_cliente,
c.nombre,
c.apellido,
c.tipo_cliente,
sum(dv.total) as TotalComprado
from Clientes c
join Ventas v on c.id_cliente = v.id_cliente
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by c.id_cliente;


-- vista ventas consolidadas

create view vista_ventas_consolidadas as
select
v.id_venta,
v.fecha,
concat(c.nombre,' ',c.apellido) as Cliente,
e.nombre as Empleado,
mp.nombre as MetodoPago,
sum(dv.total) as TotalVenta
from Ventas v
join Clientes c on v.id_cliente = c.id_cliente
join Empleados e on v.id_empleado = e.id_empleado
join MetodosPago mp on v.id_metodopago = mp.id_metodopago
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by v.id_venta;


-- vista productos por categoria

create view vista_productos_categoria as
select
p.id_producto,
p.nombre as Producto,
c.nombre as Categoria,
m.nombre as Marca,
p.precio
from Productos p
join Categorias c on p.id_categoria = c.id_categoria
join Marcas m on p.id_marca = m.id_marca;


-- vista ventas por sucursal

create view vista_ventas_sucursal as
select
v.id_venta,
v.fecha,
s.nombre as Sucursal,
concat(c.nombre,' ',c.apellido) as Cliente,
sum(dv.total) as TotalVenta
from Ventas v
join Clientes c on v.id_cliente = c.id_cliente
join Sucursales s on v.id_sucursal = s.id_sucursal
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by v.id_venta;


-- vista detalle de ventas

create view vista_detalle_ventas as
select
dv.id_venta,
p.nombre as Producto,
dv.cantidad,
dv.precio_unitario,
dv.subtotal
from Detalle_Venta dv
join Productos p on dv.id_producto = p.id_producto;


-- vista desempeño empleados

create view vista_desempeno_empleados as
select
e.id_empleado,
e.nombre as Empleado,
e.cargo,
count(distinct v.id_venta) as CantidadVentas,
sum(dv.total) as TotalVendido
from Empleados e
join Ventas v on e.id_empleado = v.id_empleado
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by e.id_empleado;