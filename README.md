# 🥖 Base de Datos - Panadería

Proyecto de base de datos relacional para el sistema de ventas de una panadería: clientes, empleados, sucursales, productos, proveedores y todo el flujo de una venta, con funciones, procedimientos, triggers, vistas y control de usuarios.

##  Integrantes

- Alejandro Aguirre
- Briander Verdezoto

## Estructura del proyecto

```
scripts/
 ├── schema.sql          # Creación de la base de datos y tablas
 ├── funciones.sql        # Funciones almacenadas (IVA, descuentos, totales, etc.)
 ├── procedimientos.sql   # Procedimientos almacenados (registrar clientes, ventas, etc.)
 ├── triggers.sql          # Triggers de auditoría y cálculos automáticos
 ├── vistas.sql            # Vistas de consulta (clientes frecuentes, reportes, etc.)
 ├── consultas.sql         # Consultas de ejemplo sobre la base de datos
 ├── transacciones.sql     # Ejemplos de transacciones (START TRANSACTION / COMMIT)
 ├── usuarios.sql          # Creación de usuarios y permisos por rol
 └── pruebas.sql           # Pruebas de funciones, procedimientos y triggers

Archivos CSV/
 └── Panaderia_data.csv    # Datos usados para poblar la base de datos

backups/
 ├── panaderia_inicial.sql
 ├── panaderia_intermedio.sql
 └── panaderia_final.sql   # Respaldos de la base de datos en distintas etapas
```

##  Tecnologías

- MySQL

##  Cómo usar

1. Ejecutar `scripts/schema.sql` para crear la base de datos y las tablas.
2. Cargar los datos desde `Archivos CSV/Panaderia_data.csv`.
3. Ejecutar en orden: `funciones.sql` → `procedimientos.sql` → `triggers.sql` → `vistas.sql`.
4. Crear los usuarios con `usuarios.sql` (opcional, según los permisos que necesites).
5. Usar `pruebas.sql` para verificar que todo funcione correctamente.

Si algo se daña, en `backups/` hay respaldos de la base de datos en distintas etapas del proyecto para restaurar. 🙂
