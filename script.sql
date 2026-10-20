
-- =========================================
-- PROYECTO RETAIL
-- Base de datos: retail_project
-- Motor: PostgreSQL
-- =========================================


-- 1. CREACION DE TABLAS

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    edad INTEGER NOT NULL,
    CONSTRAINT chk_cliente_edad CHECK (edad >= 18)
);


CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL,
    CONSTRAINT chk_producto_precio CHECK (precio > 0),
    CONSTRAINT chk_producto_stock CHECK (stock >= 0)
);


CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    fecha DATE NOT NULL,
    cantidad INTEGER NOT NULL,
    observacion VARCHAR(100),
    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),
    CONSTRAINT fk_venta_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),
    CONSTRAINT chk_venta_cantidad CHECK (cantidad > 0)
);


-- 2. CARGA INICIAL DE DATOS

BEGIN;

-- Clientes: 5 registros

INSERT INTO clientes (nombre, email, edad) VALUES
('Juan Perez', 'juan.perez@email.com', 28),
('Maria Gomez', 'maria.gomez@email.com', 34),
('Lucas Fernandez', 'lucas.fernandez@email.com', 25),
('Ana Lopez', 'ana.lopez@email.com', 42),
('Sofia Martinez', 'sofia.martinez@email.com', 31);


-- Productos: 5 registros

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Teclado', 'Accesorios', 25000.00, 20),
('Mouse', 'Accesorios', 15000.00, 35),
('Monitor', 'Electronica', 180000.00, 10),
('Auriculares', 'Accesorios', 32000.00, 15),
('Notebook', 'Computacion', 950000.00, 5);


-- Ventas: 5 registros

INSERT INTO ventas
    (id_cliente, id_producto, fecha, cantidad, observacion)
VALUES
(1, 1, '2026-10-10', 1, 'Venta normal'),
(2, 3, '2026-10-11', 1, 'Venta normal'),
(3, 2, '2026-10-12', 2, 'Venta normal'),
(4, 5, '2026-10-13', 1, 'Venta normal'),
(5, 4, '2026-10-14', 1, 'VENTA DE PRUEBA PARA ELIMINAR');


-- 3. VERIFICAR PRECIOS ANTES DEL UPDATE

SELECT id_producto, nombre, categoria, precio
FROM productos
WHERE categoria = 'Accesorios';


-- 4. AUMENTAR UN 10 % LOS PRECIOS DE ACCESORIOS

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Accesorios';


-- 5. VERIFICAR LA VENTA ANTES DEL DELETE

SELECT id_venta, id_cliente, id_producto, observacion
FROM ventas
WHERE observacion = 'VENTA DE PRUEBA PARA ELIMINAR';


-- 6. ELIMINAR LA VENTA DE PRUEBA

DELETE FROM ventas
WHERE observacion = 'VENTA DE PRUEBA PARA ELIMINAR';


-- 7. CONFIRMAR LOS CAMBIOS

COMMIT;


-- 8. VERIFICACION FINAL

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
