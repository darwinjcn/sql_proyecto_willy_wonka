# FABRICA DE CHOCOLATES WILLY WONKA

TABLA DE RECETAS

(Almacena los detalles de todas las recetas)

`create table recetas
(
receta_id SERIAL PRIMARY KEY,
nombre VARCHAR,
descripcion VARCHAR,
tiempo_coccion INTERVAL,
temperatura VARCHAR,
intrucciones TEXT,
imagen_url BYTEA,
fecha_creacion DATE
);`

NOTA: A fines de optimizar las consultas no se incluyo la columna ‘activa’ debido a que si una receta no es utilizada simplemente se borra del sistema

INDICES

create index idx_recetas_recetas_id on recetas (receta_id)

BIBLIOTECA DE SABORES

`create table biblioteca_sabores
(
sabor_id SERIAL PRIMARY KEY,
nombre VARCHAR,
descripcion TEXT,
sabor VARCHAR,
aroma VARCHAR
);`

NOTA:

Se cambio la columna ‘categoria’ por ‘sabor’ y ‘intensidad_base’ por ‘aroma’ a fin de que sea mas legible e entendible esta tabla

GESTION DE ALERGENOS

`CREATE TABLE alergenos
(
alergeno_id SERIAL PRIMARY KEY,
nombre VARCHAR,
descripcion TEXT,
categoria_alergeno VARCHAR,
nivel_riesgo VARCHAR
);`

INGREDIENTES

(especifica los ingredientes de cada receta)

`create table ingredientes
(
ingrediente_id SERIAL PRIMARY KEY,
nombre VARCHAR,
unidad_medida VARCHAR,
precio_unitario numeric,
origen VARCHAR
);`

NOTA: Se elimino la columna ‘local’ debido a que la nueva columna ‘origen’ puede cumplir la misma funcion y se optimiza las consultas

oompaloompas

`create table oompaloompas
(
empleado_id SERIAL PRIMARY KEY,
nombre VARCHAR,
fecha_ingreso DATE,
especialidad VARCHAR,
rendimiento VARCHAR,
nivel_experiencia VARCHAR,
estado VARCHAR
);`

NOTA: la columna ‘rendimiento’ tiene el tipo de dato VARCHAR para establecer rendimiento ‘ALTO, MEDIO, BAJO’ 

la columna ‘activo’ se renombro a ‘estado’ para especificar si esta activo, despedido, jubilado

INDICE

CREATE INDEX idx_oompaloompas_empleado_id on oompaloompas (empleado_id)

INVENTARIO

`create table INVENTARIO
(
inventario_id SERIAL PRIMARY KEY,
ingrediente_id INT,
cantidad_stock INT,
fecha_caducidad DATE,
punto_reorden INT,
stock_maximo INT,
ubicacion VARCHAR,
fecha_ultimo_abastecimiento DATE,`

`CONSTRAINT FK_ingrediente_id FOREIGN KEY (ingrediente_id) REFERENCES ingredientes (ingrediente_id)
);`

VISTAAA INVENTARIO

CREATE VIEW inventario_resumido AS
select ingredientes.nombre, inventario.cantidad_stock, inventario.fecha_caducidad, inventario.ubicacion from ingredientes
INNER JOIN inventario
on inventario.ingrediente_id = ingredientes.ingrediente_id

PROVEEDORES

`create table proveedores
(
proveedor_id SERIAL PRIMARY KEY,
nombre VARCHAR,
contacto NUMERIC,
acuerdos_comerciales TEXT,
pais VARCHAR
);`

NOTA: ah fines de optimizacion de consultas se eliminaron las columnas ‘local’, ‘calificacion’, ‘activo’

Se agrego la columna ‘pais’

EVALUACIONES

`create table evaluaciones
(
evaluacion_id SERIAL PRIMARY KEY,
empleado_id INT,
fecha_evaluacion DATE,
puntuacion INT,
comentarios TEXT,
areas_mejorar TEXT,
objetivos_personales TEXT,
CONSTRAINT FK_empleado_id FOREIGN KEY (empleado_id) REFERENCES oompaloompas (empleado_id)
);`

VISTAS

CAPACITACIONES

`create table capacitacion
(
capacitacion_id SERIAL PRIMARY KEY,
empleado_id INT,
tipo_capacitacion INT,
fecha_inicio DATE,
fecha_finalizacion DATE,
instructor VARCHAR,
calificacion INT,
habilidades_desarrolladas TEXT,`

`CONSTRAINT FK_empleados_id FOREIGN KEY (empleado_id) REFERENCES oompaloompas (empleado_id)
);`

VISTAS

NOTA: A FIN DE OPTIMIZAR LA BASE DE DATOS SE QUITO LA COLUMNA ‘ESTADO’ 

EQUIPO

`create table equipos
(
equipo_id SERIAL PRIMARY KEY,
nombre VARCHAR,
tipo VARCHAR,
fecha_adquisicion DATE,
ultima_calibracion DATE,
proximo_mantenimiento DATE,
estado VACHAR
);`

mantenimiento

`create table mantenimiento
(
mantenimiento_id SERIAL PRIMARY KEY,
equipo_id INT,
fecha_mantenimiento DATE,
tipo_mantenimiento VARCHAR,
descripcion TEXT,
responsable INT,
estado VARCHAR,`

`CONSTRAINT FK_equipo_id FOREIGN KEY (equipo_id) REFERENCES equipos (equipo_id),
CONSTRAINT FK_responsable_id FOREIGN KEY (responsable) REFERENCES oompaloompas (empleado_id)
);`

vista

NOTA: a fin de diseñar la base de datos lo mas real posible la columna ‘responsable’ es llave foranea de emplead_id a fin de asignarle un empleado a ese mantenimiento

plan de produccion

`create table plan_produccion
(
plan_id SERIAL PRIMARY KEY,
fecha_inicio DATE,
fecha_fin DATE,
estado_plan VARCHAR,
observaciones TEXT
);`

NOTA:

Se elimino la columna ‘LOTE’ debido que ya se encuentra en la tabla de produccion

PRODUCCION

`create table produccion
(
produccion_id SERIAL PRIMARY KEY,
receta_id INT,
empleado_id INT,
plan_produccion_id INT,
fecha_inicio DATE,
fecha_fin DATE,
lote SERIAL UNIQUE,
estado_ejecucion VARCHAR,
unidades_produccidas INT,
observaciones TEXT,
CONSTRAINT FK_receta_id FOREIGN KEY (receta_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_empleado_id FOREIGN KEY (empleado_id) REFERENCES oompaloompas (empleado_id),
CONSTRAINT FK_plan_produccion_id FOREIGN KEY (plan_produccion_id) REFERENCES plan_produccion (plan_id)
);`

VISTA PRODUCCION

CREATE VIEW produccion_resumida AS
select recetas.nombre AS "Nombre receta", oompaloompas.nombre AS "encargado",
produccion.lote,
produccion.unidades_produccidas,
produccion.observaciones,
plan_produccion.observaciones AS "Finalidad produccion"
from produccion
inner join recetas
on recetas.receta_id = produccion.receta_id
inner join oompaloompas
on oompaloompas.empleado_id = produccion.empleado_id
inner join plan_produccion
on plan_produccion.plan_id = produccion.plan_produccion_id

CONTROL_PRODUCCION

`create table control_produccion
(
control_id SERIAL PRIMARY KEY,
produccion_id INT,
fecha_control DATE,
aprobado BOOLEAN,
observaciones TEXT,
responsable INT,
CONSTRAINT FK_produccion_id FOREIGN KEY (produccion_id) REFERENCES produccion (produccion_id),
CONSTRAINT FK_responsable_id FOREIGN KEY (responsable) REFERENCES oompaloompas (empleado_id)
);`

NOTA: se agrego una foreign key a responsable referenciando la tabla oompaloompas en la columna de empleado_id

produccion_equipos

`CREATE TABLE produccion_equipos
(
produccion_id INT,
equipo_id INT,
CONSTRAINT FK_produccion_id FOREIGN KEY (produccion_id) REFERENCES produccion (produccion_id),
CONSTRAINT FK_equipo_id FOREIGN KEY (equipo_id) REFERENCES equipos (equipo_id)
);`

recetas_ingredientes

`create table recetas_ingredientes
(
receta_id INT,
ingrediente_id INT,
CONSTRAINT FK_receta_id FOREIGN KEY (receta_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_ingrediente_id FOREIGN KEY (ingrediente_id) REFERENCES ingredientes (ingrediente_id)
);`

recetas_alergenos

`create table recetas_alergenos
(
receta_id INT,
alergeno_id INT,
CONSTRAINT FK_receta_id FOREIGN KEY (receta_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_alergeno_id FOREIGN KEY (alergeno_id) REFERENCES alergenos (alergeno_id)
);`

recetas_sabor

`create table recetas_sabores
(
receta_id INT,
sabor_id INT,
CONSTRAINT FK_receta_id FOREIGN KEY (receta_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_sabor_id FOREIGN KEY (sabor_id) REFERENCES biblioteca_sabores (sabor_id)
);`

ingredientes_proveedores

`create table ingredientes_proveedores
(
ingredientes_id INT,
proveedor_id INT,
CONSTRAINT FK_ingredientes_id FOREIGN KEY (ingredientes_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES proveedores (proveedor_id)
);`

recetas_equipos

`create table recetas_equipos
(
recetas_equipo_id SERIAL PRIMARY KEY,
receta_id INT,
equipo_id INT,
observaciones TEXT,
CONSTRAINT FK_receta_id FOREIGN KEY (receta_id) REFERENCES recetas (receta_id),
CONSTRAINT FK_equipos_id FOREIGN KEY (equipo_id) REFERENCES equipos (equipo_id)
);`

reporte

`create table reporte
(
reporte_id SERIAL PRIMARY KEY,
produccion_id INT,
fecha_reporte DATE,
tipo_reporte VARCHAR,
observaciones TEXT,
reposansable VARCHAR,
CONSTRAINT FK_produccion_id FOREIGN KEY (produccion_id) REFERENCES produccion (produccion_id)
);`
