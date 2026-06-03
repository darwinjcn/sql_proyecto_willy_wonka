-- ==========================================
-- FASE 2.1: INSERCIÓN DE DATOS
-- Fábrica de Chocolates Willy Wonka
-- ==========================================

-- Insertar en recetas
INSERT INTO recetas(nombre, descripcion, tiempo_coccion, temperatura, intrucciones, imagen_url, fecha_creacion, cantidad_produccion) VALUES
('Chocolate Fluff','Un chocolate suave como una nube, ideal para niños', INTERVAL '15 minutes', 'Baja','Mezclar ingredientes, calentar a fuego lento, enfriar y disfrutar', 'https://th.bing.com/th/id/OIP.mq6QZKawsR1LrfGQMeM9yAHaLI','2024-01-10', 100), 
('Caramelo Elástico','Caramelo que se estira como goma de mascar', INTERVAL '20 minutes','Media','Cocer a fuego lento y estirar con las manos', 'https://th.bing.com/th/id/OIP.BD6fouHyeAmN4BaBEE61LwHaET','2024-01-12', 80), 
('Galletas Luminiscentes','Galletas que brillan en la oscuridad', INTERVAL '25 minutes','Alta','Mezclar la masa, hornear, y dejar enfriar en un lugar oscuro', 'https://th.bing.com/th/id/OIP.7Ty5gv5xYZy0EpbX77BfLwHaFj','2024-01-14', 150), 
('Barras de Chocolate Explosivas','Barras con centro relleno de burbujas de aire', INTERVAL '10 minutes','Alta','Verter el chocolate, rellenar con aire, y dejar enfriar', 'https://th.bing.com/th/id/OIP.e431oVE_q1Bo7uPHx89ruQHaFq','2024-01-16', 120);

-- BIBLIOTECA DE SABORES
INSERT INTO biblioteca_sabores(nombre, descripcion, sabor, aroma) VALUES
('Dulce','Sabor dulce y suave','Dulce','Agradable'), 
('Picante','Sabor picante y fuerte','Picante','Fuerte'), 
('Ácido','Sabor ácido que despierta los sentidos','Ácido','Cítrico'), 
('Amargo','Sabor amargo que resalta la intensidad del cacao','Amargo','Terroso'), 
('Salado','Sabor salado con un toque suave','Salado','Sutil'), 
('Menta','Sabor fresco y refrescante','Menta','Herbáceo');

-- TABLA DE ALERGENOS
INSERT INTO alergenos(nombre, descripcion, categoria_alergeno, nivel_riesgo) VALUES
('Frutos Rojos','Alergias a frutos rojos','Frutos','Alto'), 
('Lácteos','Alergias a productos lácteos','Lácteos','Medio'), 
('Gluten','Alergias al gluten en productos derivados de trigo','Cereales','Alto'), 
('Cacahuates','Alergia a los cacahuates (maní)','Frutos secos','Alto'), 
('Soja','Alergia a la soja y sus derivados','Legumbres','Medio');

-- TABLA DE INGREDIENTES
INSERT INTO ingredientes(nombre, unidad_medida, precio_unitario, origen) VALUES
('Chocolate','kg', 10.00,'Brasil'), ('Azúcar','kg', 2.00,'Colombia'), 
('Manteca de Cacao','kg', 15.00,'República Dominicana'), ('Vainilla','g', 5.00,'Madagascar'), 
('Leche en Polvo','kg', 3.50,'Argentina'), ('Café','kg', 8.00,'Colombia');

-- TABLA DE OOMPALOOMPAS
INSERT INTO oompaloompas(nombre, fecha_ingreso, especialidad, rendimiento, nivel_experiencia, estado) VALUES
('Willy','2020-01-01','Chef','ALTO','Experto','Activo'), ('Oompa','2021-01-01','Decorador','MEDIO','Intermedio','Activo'), 
('Choco','2019-06-15','Ingeniero de Chocolate','ALTO','Avanzado','Activo'), ('Caramel','2022-03-22','Especialista en Caramelos','BAJO','Principiante','Activo');

-- TABLA DE INVENTARIO
INSERT INTO inventario(ingrediente_id, cantidad_stock, cantidad_comprometida, fecha_caducidad, punto_reorden, stock_maximo, ubicacion, fecha_ultimo_abastecimiento) VALUES
(1, 50, 10,'2023-12-31', 20, 100,'Almacén 1','2023-01-01'), (2, 100, 20,'2023-12-31', 30, 150,'Almacén 2','2023-01-01'), 
(3, 200, 50,'2023-06-30', 50, 300,'Almacén 3','2023-03-15'), (4, 150, 30,'2023-11-15', 40, 200,'Almacén 4','2023-05-10');

-- TABLA DE PROVEEDORES
INSERT INTO proveedores(nombre, contacto, acuerdos_comerciales, pais) VALUES
('Proveedor 1','1234567890','Acuerdo A','Brasil'), ('Proveedor 2','0987654321','Acuerdo B','Colombia'), 
('Proveedor 3','1122334455','Acuerdo C','México'), ('Proveedor 4','2233445566','Acuerdo D','Perú');

-- TABLA DE EVALUACIONES
INSERT INTO evaluaciones(empleado_id, fecha_evaluacion, puntuacion, comentarios, areas_mejorar, objetivos_personales) VALUES
(1,'2024-01-10', 85,'Excelente trabajo, pero mejora en la puntualidad','Puntualidad', 'Ser más puntual'),
(2,'2024-01-12', 90,'Trabajo sobresaliente, sigue así','N/A','N/A'), 
(3,'2024-01-14', 80,'Buen desempeño, pero mejorar la comunicación','Comunicación','Mejorar la comunicación con el equipo');

-- TABLA DE EQUIPOS
INSERT INTO equipos(nombre, tipo, fecha_adquisicion, ultima_calibracion, proximo_mantenimiento, estado) VALUES
('Olla de Presión','Electrodoméstico','2023-01-01','2023-12-31','2024-01-01', 'Activo'), 
('Batidora Industrial','Electrodoméstico','2023-02-01','2023-12-31','2024-02-01', 'Activo'), 
('Horno Eléctrico','Electrodoméstico','2023-03-01','2023-12-31','2024-03-01', 'Activo');

-- TABLA DE CAPACITACION
INSERT INTO capacitacion(empleado_id, tipo_capacitacion, fecha_inicio, fecha_finalizacion, instructor, calificacion, habilidades_desarrolladas) VALUES
(1,'Cocina Avanzada','2024-01-15','2024-01-20','Chef Maestro', 95,'Nuevas técnicas de cocina'), 
(2,'Decoración de Postres','2024-01-18','2024-01-23','Decoradora Estrella', 90, 'Decoración creativa');

-- TABLA DE MANTENIMIENTO
INSERT INTO mantenimiento(equipo_id, fecha_mantenimiento, tipo_mantenimiento, descripcion, responsable, estado) VALUES
(1,'2024-01-01','Reparación General','Reparación de la olla de presión', 1, 'Completado'), 
(2,'2024-02-01','Limpieza y Calibración','Limpieza de la batidora industrial', 2, 'Completado');

-- TABLA DE PLAN DE PRODUCCION
INSERT INTO plan_produccion(fecha_inicio, fecha_fin, estado_plan, observaciones) VALUES
('2024-01-01','2024-01-31','En Proceso','Producción de chocolates'), 
('2024-02-01','2024-02-28','En Proceso','Producción de caramelos');

-- TABLA PRODUCCION
INSERT INTO produccion(receta_id, empleado_id, plan_produccion_id, fecha_inicio, fecha_fin, lote, estado_ejecucion, unidades_producidas, costo_total, observaciones) VALUES
(1, 1, 1,'2024-01-01','2024-01-02', 1,'Completado', 100, 500.00,'Producción exitosa'), 
(2, 2, 2,'2024-02-01','2024-02-02', 2,'Completado', 120, 600.00,'Producción exitosa');

-- TABLA DE CONTROL DE PRODUCCION
INSERT INTO control_produccion(produccion_id, fecha_control, aprobado, observaciones, responsable) VALUES
(1,'2024-01-03', TRUE,'Control exitoso', 1), (2,'2024-02-03', TRUE,'Control exitoso', 2);

-- TABLAS PUENTE
INSERT INTO produccion_equipos(produccion_id, equipo_id) VALUES (1, 1), (2, 2);
INSERT INTO recetas_ingredientes(receta_id, ingrediente_id) VALUES (1, 1), (1, 2), (2, 3);
INSERT INTO recetas_alergenos(receta_id, alergeno_id) VALUES (1, 1), (1, 2);
INSERT INTO ingredientes_proveedores(ingrediente_id, proveedor_id) VALUES (1, 1), (2, 2);
INSERT INTO recetas_equipos(receta_id, equipo_id, observaciones) VALUES (1, 4,'Equipo usado para Chocolate Fluff');

-- TABLA DE REPORTE
INSERT INTO reporte(produccion_id, fecha_reporte, tipo_reporte, observaciones, responsable) VALUES
(1,'2024-01-10','Informe de producción','Producción exitosa','Willy'), 
(2,'2024-01-11','Informe de producción','Producción exitosa','Oompa');