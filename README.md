# retail-project-sql
Pre-entrega SQL - Proyecto retail
# Retail Project SQL

Pre-entrega de base de datos para un proyecto retail, desarrollada en PostgreSQL.

## Tablas

- `clientes`: información de los clientes.
- `productos`: productos, categorías, precios y stock.
- `ventas`: registro de ventas con claves foráneas hacia clientes y productos.

## Contenido del script

- Creación de tablas y claves primarias.
- Restricciones `UNIQUE`, `NOT NULL`, `CHECK` y `FOREIGN KEY`.
- Carga inicial de datos dentro de una transacción.
- Actualización de precios por categoría.
- Eliminación de una venta de prueba.

## Cómo ejecutar

1. Crear una base de datos llamada `retail_project` en PostgreSQL.
2. Abrir pgAdmin 4 y conectarse a esa base de datos.
3. Abrir el archivo `script.sql` en Query Tool.
4. Ejecutar el script completo.

**Requisito:** PostgreSQL instalado y funcionando.
