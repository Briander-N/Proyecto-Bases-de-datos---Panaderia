
create database panaderia;

USE panaderia;

-- -----------------------------------------------------------------
-- 1. Crear y seleccionar la base de datos
-- -----------------------------------------------------------------
DROP DATABASE IF EXISTS panaderia;
CREATE DATABASE panaderia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE panaderia;

-- =====================================================================
-- TABLAS CATALOGO / MAESTRAS
-- =====================================================================

-- -----------------------------------------------------------------
-- 1) Clientes
-- -----------------------------------------------------------------
CREATE TABLE Clientes (
    ID_Cliente     VARCHAR(10)  PRIMARY KEY,
    Cedula         BIGINT       NOT NULL UNIQUE,
    Nombre         VARCHAR(60)  NOT NULL,
    Apellido       VARCHAR(60)  NOT NULL,
    Telefono       BIGINT       NOT NULL,
    Correo         VARCHAR(100) NOT NULL,
    Direccion      VARCHAR(150),
    Tipo_Cliente   VARCHAR(20)  NOT NULL   -- Frecuente / Nuevo / Mayorista
);

-- -----------------------------------------------------------------
-- 2) Empleados
-- -----------------------------------------------------------------
CREATE TABLE Empleados (
    ID_Empleado    VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(60)  NOT NULL,
    Cargo          VARCHAR(40)  NOT NULL   -- Panadero / Cajero / Administrador
);

-- -----------------------------------------------------------------
-- 3) Sucursales
-- -----------------------------------------------------------------
CREATE TABLE Sucursales (
    ID_Sucursal    VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(60)  NOT NULL,
    Ciudad         VARCHAR(60)  NOT NULL
);

-- -----------------------------------------------------------------
-- 4) Categorias (de productos)
-- -----------------------------------------------------------------
CREATE TABLE Categorias (
    ID_Categoria   VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(60)  NOT NULL UNIQUE
);

-- -----------------------------------------------------------------
-- 5) Marcas
-- -----------------------------------------------------------------
CREATE TABLE Marcas (
    ID_Marca       VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(60)  NOT NULL UNIQUE
);


-- -----------------------------------------------------------------
-- 6) Productos
-- -----------------------------------------------------------------
CREATE TABLE Productos (
    ID_Producto    VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(100) NOT NULL,
    ID_Categoria   VARCHAR(10)  NOT NULL,
    ID_Marca       VARCHAR(10)  NOT NULL,
    Unidad         VARCHAR(20)  NOT NULL,   -- Unidad, Kg, etc.
    Precio         DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    CONSTRAINT fk_producto_marca     FOREIGN KEY (ID_Marca)     REFERENCES Marcas(ID_Marca)
);

-- -----------------------------------------------------------------
-- 7) Proveedores
-- -----------------------------------------------------------------
CREATE TABLE Proveedores (
    ID_Proveedor   VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(100) NOT NULL,
    Ciudad         VARCHAR(60)  NOT NULL,
    Telefono       BIGINT       NOT NULL,
    Correo         VARCHAR(100) NOT NULL
);

-- -----------------------------------------------------------------
-- 8) Metodos de Pago
-- -----------------------------------------------------------------
CREATE TABLE MetodosPago (
    ID_MetodoPago  VARCHAR(10)  PRIMARY KEY,
    Nombre         VARCHAR(30)  NOT NULL UNIQUE  -- Efectivo, QR, Transferencia, Tarjeta
);

-- =====================================================================
-- TABLAS TRANSACCIONALES
-- =====================================================================

-- -----------------------------------------------------------------
-- 9) Ventas (cabecera)
-- -----------------------------------------------------------------
CREATE TABLE Ventas (
    ID_Venta       VARCHAR(10)  PRIMARY KEY,
    Fecha          DATE         NOT NULL,
    Hora           TIME         NOT NULL,
    Estado_Venta   VARCHAR(20)  NOT NULL,   -- Entregada / Pagada
    ID_Cliente     VARCHAR(10)  NOT NULL,
    ID_Empleado    VARCHAR(10)  NOT NULL,
    ID_Sucursal    VARCHAR(10)  NOT NULL,
    ID_MetodoPago  VARCHAR(10)  NOT NULL,
    Observacion    VARCHAR(200),
    CONSTRAINT fk_venta_cliente    FOREIGN KEY (ID_Cliente)    REFERENCES Clientes(ID_Cliente),
    CONSTRAINT fk_venta_empleado   FOREIGN KEY (ID_Empleado)   REFERENCES Empleados(ID_Empleado),
    CONSTRAINT fk_venta_sucursal   FOREIGN KEY (ID_Sucursal)   REFERENCES Sucursales(ID_Sucursal),
    CONSTRAINT fk_venta_metodopago FOREIGN KEY (ID_MetodoPago) REFERENCES MetodosPago(ID_MetodoPago)
);

-- -----------------------------------------------------------------
-- 10) Detalle_Venta (líneas de la venta / producto vendido)
-- -----------------------------------------------------------------
CREATE TABLE Detalle_Venta (
    ID_Detalle       VARCHAR(10)   PRIMARY KEY,
    ID_Venta         VARCHAR(10)   NOT NULL,
    ID_Producto      VARCHAR(10)   NOT NULL,
    ID_Proveedor     VARCHAR(10)   NOT NULL,
    Cantidad         INT           NOT NULL,
    Precio_Unitario  DECIMAL(10,2) NOT NULL,
    Promocion        VARCHAR(30)   NOT NULL DEFAULT 'Ninguna',  -- 10% / 2x1 / Cliente Frecuente / Ninguna
    Descuento        DECIMAL(10,2) NOT NULL DEFAULT 0,
    Subtotal         DECIMAL(10,2) NOT NULL,
    IVA              DECIMAL(10,2) NOT NULL,
    Total            DECIMAL(10,2) NOT NULL,
    Lote             VARCHAR(20),
    Fecha_Caducidad  DATE,
    CONSTRAINT fk_detalle_venta      FOREIGN KEY (ID_Venta)     REFERENCES Ventas(ID_Venta),
    CONSTRAINT fk_detalle_producto   FOREIGN KEY (ID_Producto)  REFERENCES Productos(ID_Producto),
    CONSTRAINT fk_detalle_proveedor  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

-- -----------------------------------------------------------------
-- Tabla de Auditoria (usada por procedimientos y triggers)
-- -----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Auditoria (
    ID_Auditoria INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(60) NOT NULL,
    Accion VARCHAR(20) NOT NULL,
    Tabla_Afectada VARCHAR(60) NOT NULL,
    Detalle VARCHAR(255),
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------------------
-- Tabla HistorialPrecios (usada por el trigger de cambio de precio)
-- -----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS HistorialPrecios (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto VARCHAR(10) NOT NULL,
    Precio_Anterior DECIMAL(10,2) NOT NULL,
    Precio_Nuevo DECIMAL(10,2) NOT NULL,
    Fecha_Cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

