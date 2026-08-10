# RetailPro — Proyecto de Análisis de Datos

Proyecto integrador del curso de bases de datos y Business Intelligence, sobre un caso ficticio de RetailPro, una empresa distribuidora de tecnología. Cubre el flujo completo: diseño relacional, carga de datos en SQL Server, consultas de negocio, pipeline ETL en Power BI y modelo analítico con medidas DAX.

## Herramientas usadas

- **SQL Server** (SQL Server Express) — motor de base de datos
- **SSMS** (SQL Server Management Studio) — desarrollo y validación de consultas T-SQL
- **Power BI Desktop** — modelado, ETL y visualización
- **Power Query (lenguaje M)** — limpieza y transformación de datos
- **DAX** — medidas y análisis del modelo

## Base de datos

- Instancia: `DESKTOP-10IJFBR\SQLEXPRESS`
- Base de datos: `Ventas_Tech_DB`
- Tablas: `categorias`, `clientes`, `productos`, `ventas`

Para conectarte desde Power BI o SSMS a esta instancia, es necesario tildar
**"Trust Server Certificate"** al configurar la conexión, o la conexión falla.

## Estructura del repositorio

```
modulo 2/     → Diseño relacional, normalización y diagrama ER (M2)
modulo4/      → Consultas de negocio con funciones de agregación (M4)
modulo6/      → Pipeline ETL en Power Query, conectado a Ventas_Tech_DB (M6)
modulo8/      → Modelo de datos con relaciones, calendario y medidas DAX (M8)
```

## Cómo ejecutar los scripts SQL

1. Abrí SSMS y conectate a `DESKTOP-10IJFBR\SQLEXPRESS` (tildando Trust Server Certificate en las opciones de conexión).
2. Click derecho sobre `Ventas_Tech_DB` → **Nueva consulta**, para asegurarte de que corre contra la base correcta y no contra `master`.
3. Pegá el contenido del script `.sql` de la carpeta del módulo correspondiente y ejecutalo con F5.

## Cómo abrir los archivos de Power BI

Los archivos `.pbix` de `modulo6` y `modulo8` requieren conexión activa a `Ventas_Tech_DB`. Abrilos con Power BI Desktop y actualizá los datos (Inicio → Actualizar) para traer la información más reciente de la base.
