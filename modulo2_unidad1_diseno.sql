-- =====================================================
-- Módulo 2 - Unidad 1: Diseño de tablas
-- Sistema de gestión de ventas
-- Motor objetivo: PostgreSQL
-- =====================================================

-- -----------------------------------------------------
-- Tabla: clientes
-- -----------------------------------------------------
CREATE TABLE clientes (
    id_cliente      INT,            -- Número entero: identificador único, no necesita decimales
    nombre          VARCHAR(100),   -- Texto de longitud variable, limitado a 100 caracteres (evita desperdiciar espacio con CHAR fijo)
    perfil_bio      TEXT,           -- Texto largo sin límite fijo, ideal para biografías o notas de longitud variable/impredecible
    fecha_registro  DATE            -- Solo fecha (sin hora), suficiente para registrar cuándo se dio de alta el cliente
);

-- -----------------------------------------------------
-- Tabla: productos
-- -----------------------------------------------------
CREATE TABLE productos (
    id_producto     INT,            -- Número entero: identificador único del producto
    descripcion     VARCHAR(255),   -- Texto de hasta 255 caracteres, suficiente para un nombre/descripción de producto
    precio          DECIMAL(10,2),  -- DECIMAL en lugar de FLOAT: garantiza precisión exacta con el dinero (hasta 10 dígitos, 2 decimales)
    esta_activo     BOOLEAN         -- Valor lógico (true/false) para representar si el producto está a la venta; más claro y autoexplicativo que un número (0/1) o texto ('si'/'no')
);
