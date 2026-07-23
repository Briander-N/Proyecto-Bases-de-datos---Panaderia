use panaderia;

-- crear usuarios

create user 'usuario_admin'@'%' identified by 'Admin123*';
create user 'usuario_gerente'@'%' identified by 'Gerente123*';
create user 'usuario_cajero'@'%' identified by 'Cajero123*';
create user 'usuario_vendedor'@'%' identified by 'Vendedor123*';
create user 'usuario_auditor'@'%' identified by 'Auditor123*';


-- administrador

grant all privileges on panaderia.* to 'usuario_admin'@'%';


-- gerente

grant select on panaderia.Clientes to 'usuario_gerente'@'%';
grant select on panaderia.Productos to 'usuario_gerente'@'%';
grant select on panaderia.Categorias to 'usuario_gerente'@'%';
grant select on panaderia.Marcas to 'usuario_gerente'@'%';
grant select on panaderia.Proveedores to 'usuario_gerente'@'%';
grant select on panaderia.Sucursales to 'usuario_gerente'@'%';
grant select on panaderia.MetodosPago to 'usuario_gerente'@'%';
grant select on panaderia.Ventas to 'usuario_gerente'@'%';
grant select on panaderia.Detalle_Venta to 'usuario_gerente'@'%';


-- cajero

grant select on panaderia.Clientes to 'usuario_cajero'@'%';
grant select on panaderia.Productos to 'usuario_cajero'@'%';
grant select on panaderia.MetodosPago to 'usuario_cajero'@'%';

grant insert on panaderia.Ventas to 'usuario_cajero'@'%';
grant insert on panaderia.Detalle_Venta to 'usuario_cajero'@'%';


-- vendedor

grant select on panaderia.Clientes to 'usuario_vendedor'@'%';
grant select on panaderia.Productos to 'usuario_vendedor'@'%';

grant insert on panaderia.Ventas to 'usuario_vendedor'@'%';
grant insert on panaderia.Detalle_Venta to 'usuario_vendedor'@'%';


-- auditor

grant select on panaderia.* to 'usuario_auditor'@'%';

flush privileges;