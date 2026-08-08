-- ============================================================
-- m4_consultas_negocio.sql (versión SQL Server / T-SQL)
-- Proyecto: RetailPro — Ventas_Tech_DB
-- Diferencias vs. la versión PostgreSQL:
--   EXTRACT(MONTH FROM fecha_venta)  ->  MONTH(fecha_venta)
--   LIMIT 5                          ->  SELECT TOP 5 ... (arriba, no al final)
-- Columnas usadas: id_cliente, id_producto, cantidad, precio_unitario, fecha_venta
-- ============================================================


-- ------------------------------------------------------------
-- Consulta 1: Resumen ejecutivo mensual
-- ------------------------------------------------------------
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- ------------------------------------------------------------
-- Consulta 2: Ranking de productos (Top 5)
-- ------------------------------------------------------------
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;


-- ------------------------------------------------------------
-- Consulta 3: Clientes recurrentes
-- ------------------------------------------------------------
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- ------------------------------------------------------------
-- Consulta 4: Meses por encima/por debajo del promedio
-- ------------------------------------------------------------
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS totales_por_mes
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- ============================================================
-- HALLAZGOS
-- ============================================================
-- 1. Los 10 pedidos registrados en Ventas_Tech_DB corresponden todos
--    al mes de marzo ($6.444 facturados, ticket promedio $644,40).
--    Al haber un único mes de datos, la Consulta 4 clasifica marzo
--    como "Por debajo" del promedio: es correcto matemáticamente
--    (la comparación usa > estricto y el promedio de un solo valor
--    es igual a sí mismo), pero evidencia que el dataset de prueba
--    actual no permite un análisis de tendencia mensual real; para
--    eso se necesitaría cargar pedidos de más períodos.
--
-- 2. El producto id_producto=1 concentra el 55,9% de la facturación
--    total ($3.600 de $6.444) vendiendo solo 3 unidades, mientras que
--    el producto id_producto=2 vendió 13 unidades -la mayor cantidad
--    de todo el ranking- y generó apenas $364. Confirma que el mix
--    de ingresos depende de pocos productos de precio unitario alto,
--    no de volumen de unidades vendidas.
--
-- 3. Los 5 clientes con compras registradas hicieron exactamente 2
--    pedidos cada uno (2 x 5 = 10, coincide con el total de pedidos
--    de la Consulta 1), es decir que el 100% de los clientes activos
--    son recurrentes y ninguno superó las 2 compras. En una base de
--    datos de prueba tan chica esto probablemente sea diseño
--    intencional del dataset más que un patrón de negocio real.
-- ============================================================
