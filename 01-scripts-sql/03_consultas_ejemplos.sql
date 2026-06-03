-- ==========================================
-- FASE 2.2: CONSULTAS BÁSICAS
-- ==========================================

-- Filtrar alérgenos por categoría
SELECT * FROM alergenos WHERE categoria_alergeno = 'Frutos';

-- Filtrar evaluaciones con puntuación mayor a 90
SELECT * FROM evaluaciones WHERE puntuacion > 90;

-- Ordenar proveedores por país
SELECT nombre, contacto, pais FROM proveedores ORDER BY pais ASC;

-- Ordenar equipos por tipo
SELECT nombre, tipo, fecha_adquisicion, estado FROM equipos ORDER BY tipo ASC;

-- Agrupar por unidades producidas y sumar costo
SELECT unidades_producidas, SUM(costo_total) as Costo_Produccion 
FROM produccion GROUP BY unidades_producidas;

-- Filtrar grupos con costo mayor a 1500
SELECT unidades_producidas, SUM(costo_total) as Costo_Produccion 
FROM produccion GROUP BY unidades_producidas HAVING SUM(costo_total) > 1500;

-- Contar total de producciones
SELECT COUNT(*) AS Total_Producciones FROM produccion;

-- Calcular promedio de unidades por costo
SELECT costo_total, ROUND(AVG(unidades_producidas),2) 
FROM produccion GROUP BY costo_total;

-- ==========================================
-- FASE 2.3: CONSULTAS AVANZADAS (JOIN Y VISTAS)
-- ==========================================

-- INNER JOIN: Capacitaciones con nombre de empleado
SELECT o.nombre, c.tipo_capacitacion, c.instructor, c.calificacion
FROM capacitacion c
INNER JOIN oompaloompas o ON o.empleado_id = c.empleado_id;

-- VISTA: Capacitaciones
CREATE VIEW capacitacion_view AS
SELECT o.nombre, c.tipo_capacitacion, c.instructor, c.calificacion
FROM capacitacion c
INNER JOIN oompaloompas o ON o.empleado_id = c.empleado_id;

-- INNER JOIN: Evaluaciones por debajo de 80
SELECT o.nombre AS empleado, e.puntuacion, e.comentarios
FROM evaluaciones e
INNER JOIN oompaloompas o ON e.empleado_id = o.empleado_id
WHERE e.puntuacion < 80;

-- VISTA: Bajo Rendimiento
CREATE VIEW BAJO_RENDIMIENTO AS
SELECT o.nombre AS empleado, e.puntuacion, e.comentarios
FROM evaluaciones e
INNER JOIN oompaloompas o ON e.empleado_id = o.empleado_id
WHERE e.puntuacion < 80;

-- INNER JOIN: Ingredientes por proveedor
SELECT i.nombre AS Ingrediente, p.nombre AS Proveedor, p.pais
FROM ingredientes_proveedores ip
INNER JOIN ingredientes i ON i.ingrediente_id = ip.ingrediente_id
INNER JOIN proveedores p ON ip.proveedor_id = p.proveedor_id;

-- INNER JOIN: Producción resumida
SELECT r.nombre AS "Receta", o.nombre AS "Encargado", p.lote, p.unidades_producidas
FROM produccion p
INNER JOIN recetas r ON r.receta_id = p.receta_id
INNER JOIN oompaloompas o ON o.empleado_id = p.empleado_id;

-- ==========================================
-- FASE 2.4: ELIMINACIÓN DE DATOS
-- ==========================================

-- Eliminar registros específicos
DELETE FROM alergenos WHERE nombre = 'Ajo';
DELETE FROM alergenos WHERE alergeno_id = 15;

-- Eliminar varios registros con mismo valor
DELETE FROM evaluaciones WHERE puntuacion = 80;

-- ==========================================
-- FASE 2.5: ACTUALIZACIÓN DE DATOS
-- ==========================================

-- Actualizar un solo dato
UPDATE inventario SET ubicacion = 'Almacén 7' 
WHERE inventario_id = 5 AND ingrediente_id = 5;

-- Actualizar varios datos
UPDATE evaluaciones SET 
puntuacion = 75, 
comentarios = 'Se necesita mas proactividad', 
fecha_evaluacion = '2025-01-24' 
WHERE evaluacion_id = 5 
RETURNING *;