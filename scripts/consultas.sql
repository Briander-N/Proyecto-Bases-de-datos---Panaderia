use panaderia
-- 1. listado de clientes
select id_cliente, nombre, apellido, telefono, correo, tipo_cliente
from Clientes;


-- 2. listado de empleados
select id_empleado, nombre, cargo
from Empleados;


-- 3. listado de sucursales
select id_sucursal, nombre, ciudad
from Sucursales;


-- 4. listado de productos
select id_producto, nombre, precio, unidad
from Productos;


-- 5. productos con categoria
select p.nombre as Producto,
       c.nombre as Categoria,
       p.precio
from Productos p
join Categorias c on p.id_categoria = c.id_categoria;


-- 6. productos con marca
select p.nombre as Producto,
       m.nombre as Marca,
       p.precio
from Productos p
join Marcas m on p.id_marca = m.id_marca;


-- 7. productos con proveedor
select distinct
       p.nombre as Producto,
       pr.nombre as Proveedor,
       pr.ciudad
from Detalle_Venta dv
join Productos p on dv.id_producto = p.id_producto
join Proveedores pr on dv.id_proveedor = pr.id_proveedor;


-- 8. ventas por fecha
select id_venta,
       fecha,
       estado_venta
from Ventas
order by fecha;


-- 9. clientes con sus compras
select concat(c.nombre,' ',c.apellido) as Cliente,
       v.fecha,
       sum(dv.total) as Total
from Ventas v
join Clientes c on v.id_cliente = c.id_cliente
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by v.id_venta, c.nombre, c.apellido, v.fecha;


-- 10. ventas con vendedor
select
v.id_venta,
concat(c.nombre,' ',c.apellido) as Cliente,
e.nombre as Empleado,
sum(dv.total) as Total
from Ventas v
join Clientes c on v.id_cliente = c.id_cliente
join Empleados e on v.id_empleado = e.id_empleado
join Detalle_Venta dv on v.id_venta = dv.id_venta
group by v.id_venta,c.nombre,c.apellido,e.nombre;


-- 11. detalle de productos vendidos
select
dv.id_venta,
p.nombre as Producto,
dv.cantidad,
dv.precio_unitario,
dv.subtotal
from Detalle_Venta dv
join Productos p on dv.id_producto = p.id_producto;


-- 12. total vendido por cliente
select
concat(c.nombre,' ',c.apellido) as Cliente,
sum(dv.total) as TotalComprado
from Clientes c
join Ventas v on c.id_cliente=v.id_cliente
join Detalle_Venta dv on v.id_venta=dv.id_venta
group by c.id_cliente;


-- 13. total vendido por empleado
select
e.nombre as Empleado,
sum(dv.total) as TotalVendido
from Empleados e
join Ventas v on e.id_empleado=v.id_empleado
join Detalle_Venta dv on v.id_venta=dv.id_venta
group by e.id_empleado;


-- 14. productos mas vendidos
select
p.nombre as Producto,
sum(dv.cantidad) as TotalUnidadesVendidas
from Productos p
join Detalle_Venta dv on p.id_producto=dv.id_producto
group by p.id_producto
order by TotalUnidadesVendidas desc;


-- 15. ventas por sucursal
select
s.nombre as Sucursal,
count(v.id_venta) as TotalVentas
from Sucursales s
join Ventas v on s.id_sucursal=v.id_sucursal
group by s.id_sucursal;


-- 16. ventas por metodo de pago
select
mp.nombre as MetodoPago,
count(v.id_venta) as CantidadVentas
from MetodosPago mp
join Ventas v on mp.id_metodopago=v.id_metodopago
group by mp.id_metodopago;


-- 17. ingresos por categoria
select
c.nombre as Categoria,
sum(dv.total) as TotalIngresos
from Categorias c
join Productos p on c.id_categoria=p.id_categoria
join Detalle_Venta dv on p.id_producto=dv.id_producto
group by c.id_categoria;


-- 18. clientes con compras superiores al promedio
select
concat(c.nombre,' ',c.apellido) as Cliente,
sum(dv.total) as TotalComprado
from Clientes c
join Ventas v on c.id_cliente=v.id_cliente
join Detalle_Venta dv on v.id_venta=dv.id_venta
group by c.id_cliente
having sum(dv.total) >
(
    select avg(total_cliente)
    from(
        select sum(dv.total) as total_cliente
        from Ventas v
        join Detalle_Venta dv on v.id_venta=dv.id_venta
        group by v.id_cliente
    ) t
);


-- 19. productos con precio mayor al promedio
select
nombre,
precio
from Productos
where precio >
(
    select avg(precio)
    from Productos
);


-- 20. empleados con mas ventas que el promedio
select
e.nombre,
count(v.id_venta) as CantidadVentas
from Empleados e
join Ventas v on e.id_empleado=v.id_empleado
group by e.id_empleado
having count(v.id_venta)>
(
    select avg(totalVentas)
    from(
        select count(*) as totalVentas
        from Ventas
        group by id_empleado
    ) t
);