--
-- PostgreSQL database dump
--

\restrict fUaGNYXMbZHCtYNPV3ohfMfEX5pFf6VQnuAsKpE4WbCdPWDjO8LUSelaeNVovqw

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-03 11:42:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16697)
-- Name: alergenos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alergenos (
    alergeno_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    categoria_alergeno character varying(100),
    nivel_riesgo character varying(50)
);


ALTER TABLE public.alergenos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16704)
-- Name: alergenos_alergeno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alergenos_alergeno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alergenos_alergeno_id_seq OWNER TO postgres;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 220
-- Name: alergenos_alergeno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alergenos_alergeno_id_seq OWNED BY public.alergenos.alergeno_id;


--
-- TOC entry 221 (class 1259 OID 16705)
-- Name: biblioteca_sabores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biblioteca_sabores (
    sabor_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    sabor character varying(100),
    aroma character varying(100)
);


ALTER TABLE public.biblioteca_sabores OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16712)
-- Name: biblioteca_sabores_sabor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.biblioteca_sabores_sabor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.biblioteca_sabores_sabor_id_seq OWNER TO postgres;

--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 222
-- Name: biblioteca_sabores_sabor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.biblioteca_sabores_sabor_id_seq OWNED BY public.biblioteca_sabores.sabor_id;


--
-- TOC entry 223 (class 1259 OID 16713)
-- Name: capacitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capacitacion (
    capacitacion_id integer NOT NULL,
    empleado_id integer,
    tipo_capacitacion character varying(100),
    fecha_inicio date,
    fecha_finalizacion date,
    instructor character varying(100),
    calificacion integer,
    habilidades_desarrolladas text,
    CONSTRAINT capacitacion_calificacion_check CHECK (((calificacion >= 0) AND (calificacion <= 100)))
);


ALTER TABLE public.capacitacion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16720)
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capacitacion_capacitacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.capacitacion_capacitacion_id_seq OWNER TO postgres;

--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 224
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capacitacion_capacitacion_id_seq OWNED BY public.capacitacion.capacitacion_id;


--
-- TOC entry 225 (class 1259 OID 16721)
-- Name: control_produccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_produccion (
    control_id integer NOT NULL,
    produccion_id integer,
    fecha_control date,
    aprobado boolean,
    observaciones text,
    responsable integer
);


ALTER TABLE public.control_produccion OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16727)
-- Name: control_produccion_control_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_produccion_control_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.control_produccion_control_id_seq OWNER TO postgres;

--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 226
-- Name: control_produccion_control_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_produccion_control_id_seq OWNED BY public.control_produccion.control_id;


--
-- TOC entry 227 (class 1259 OID 16728)
-- Name: equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipos (
    equipo_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(100),
    fecha_adquisicion date,
    ultima_calibracion date,
    proximo_mantenimiento date,
    estado character varying(50)
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16733)
-- Name: equipos_equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipos_equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipos_equipo_id_seq OWNER TO postgres;

--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 228
-- Name: equipos_equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipos_equipo_id_seq OWNED BY public.equipos.equipo_id;


--
-- TOC entry 229 (class 1259 OID 16734)
-- Name: evaluaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluaciones (
    evaluacion_id integer NOT NULL,
    empleado_id integer,
    fecha_evaluacion date,
    puntuacion integer,
    comentarios text,
    areas_mejorar text,
    objetivos_personales text,
    CONSTRAINT evaluaciones_puntuacion_check CHECK (((puntuacion >= 0) AND (puntuacion <= 100)))
);


ALTER TABLE public.evaluaciones OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16741)
-- Name: evaluaciones_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluaciones_evaluacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evaluaciones_evaluacion_id_seq OWNER TO postgres;

--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 230
-- Name: evaluaciones_evaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluaciones_evaluacion_id_seq OWNED BY public.evaluaciones.evaluacion_id;


--
-- TOC entry 231 (class 1259 OID 16742)
-- Name: ingredientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredientes (
    ingrediente_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    unidad_medida character varying(50),
    precio_unitario numeric(10,2),
    origen character varying(100)
);


ALTER TABLE public.ingredientes OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16747)
-- Name: ingredientes_ingrediente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredientes_ingrediente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredientes_ingrediente_id_seq OWNER TO postgres;

--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 232
-- Name: ingredientes_ingrediente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredientes_ingrediente_id_seq OWNED BY public.ingredientes.ingrediente_id;


--
-- TOC entry 233 (class 1259 OID 16748)
-- Name: ingredientes_proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredientes_proveedores (
    ingrediente_id integer,
    proveedor_id integer
);


ALTER TABLE public.ingredientes_proveedores OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16751)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    inventario_id integer NOT NULL,
    ingrediente_id integer,
    cantidad_stock integer,
    cantidad_comprometida integer DEFAULT 0,
    fecha_caducidad date,
    punto_reorden integer,
    stock_maximo integer,
    ubicacion character varying(100),
    fecha_ultimo_abastecimiento date
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16756)
-- Name: inventario_inventario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventario_inventario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventario_inventario_id_seq OWNER TO postgres;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 235
-- Name: inventario_inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventario_inventario_id_seq OWNED BY public.inventario.inventario_id;


--
-- TOC entry 236 (class 1259 OID 16757)
-- Name: inventario_resumido; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inventario_resumido AS
 SELECT i.nombre,
    inv.cantidad_stock,
    inv.fecha_caducidad,
    inv.ubicacion
   FROM (public.ingredientes i
     JOIN public.inventario inv ON ((inv.ingrediente_id = i.ingrediente_id)));


ALTER VIEW public.inventario_resumido OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16761)
-- Name: mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenimiento (
    mantenimiento_id integer NOT NULL,
    equipo_id integer,
    fecha_mantenimiento date,
    tipo_mantenimiento character varying(100),
    descripcion text,
    responsable integer,
    estado character varying(50)
);


ALTER TABLE public.mantenimiento OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16767)
-- Name: mantenimiento_mantenimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenimiento_mantenimiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mantenimiento_mantenimiento_id_seq OWNER TO postgres;

--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 238
-- Name: mantenimiento_mantenimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenimiento_mantenimiento_id_seq OWNED BY public.mantenimiento.mantenimiento_id;


--
-- TOC entry 239 (class 1259 OID 16768)
-- Name: oompaloompas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oompaloompas (
    empleado_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_ingreso date,
    especialidad character varying(100),
    rendimiento character varying(5),
    nivel_experiencia character varying(50),
    estado character varying(10)
);


ALTER TABLE public.oompaloompas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16773)
-- Name: oompaloompas_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oompaloompas_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oompaloompas_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 240
-- Name: oompaloompas_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oompaloompas_empleado_id_seq OWNED BY public.oompaloompas.empleado_id;


--
-- TOC entry 241 (class 1259 OID 16774)
-- Name: plan_produccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_produccion (
    plan_id integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    estado_plan character varying(50),
    observaciones text
);


ALTER TABLE public.plan_produccion OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16780)
-- Name: plan_produccion_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_produccion_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plan_produccion_plan_id_seq OWNER TO postgres;

--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 242
-- Name: plan_produccion_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_produccion_plan_id_seq OWNED BY public.plan_produccion.plan_id;


--
-- TOC entry 243 (class 1259 OID 16781)
-- Name: produccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produccion (
    produccion_id integer NOT NULL,
    receta_id integer,
    empleado_id integer,
    plan_produccion_id integer,
    fecha_inicio date,
    fecha_fin date,
    lote integer NOT NULL,
    estado_ejecucion character varying(50),
    unidades_producidas integer,
    costo_total numeric(10,2),
    observaciones text
);


ALTER TABLE public.produccion OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16788)
-- Name: produccion_equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produccion_equipos (
    produccion_id integer,
    equipo_id integer
);


ALTER TABLE public.produccion_equipos OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16791)
-- Name: produccion_lote_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produccion_lote_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produccion_lote_seq OWNER TO postgres;

--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 245
-- Name: produccion_lote_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produccion_lote_seq OWNED BY public.produccion.lote;


--
-- TOC entry 246 (class 1259 OID 16792)
-- Name: produccion_produccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produccion_produccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produccion_produccion_id_seq OWNER TO postgres;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 246
-- Name: produccion_produccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produccion_produccion_id_seq OWNED BY public.produccion.produccion_id;


--
-- TOC entry 247 (class 1259 OID 16793)
-- Name: recetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas (
    receta_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(500),
    tiempo_coccion interval,
    temperatura character varying(50),
    intrucciones text,
    imagen_url character varying(255),
    fecha_creacion date DEFAULT CURRENT_DATE,
    cantidad_produccion integer
);


ALTER TABLE public.recetas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16801)
-- Name: produccion_resumida; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.produccion_resumida AS
 SELECT r.nombre AS "Nombre receta",
    o.nombre AS encargado,
    p.lote,
    p.unidades_producidas,
    p.observaciones,
    pp.observaciones AS "Finalidad produccion"
   FROM (((public.produccion p
     JOIN public.recetas r ON ((r.receta_id = p.receta_id)))
     JOIN public.oompaloompas o ON ((o.empleado_id = p.empleado_id)))
     JOIN public.plan_produccion pp ON ((pp.plan_id = p.plan_produccion_id)));


ALTER VIEW public.produccion_resumida OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16806)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    proveedor_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100),
    acuerdos_comerciales text,
    pais character varying(100)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16813)
-- Name: proveedores_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores_proveedor_id_seq OWNER TO postgres;

--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 250
-- Name: proveedores_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_proveedor_id_seq OWNED BY public.proveedores.proveedor_id;


--
-- TOC entry 251 (class 1259 OID 16814)
-- Name: recetas_alergenos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas_alergenos (
    receta_id integer,
    alergeno_id integer
);


ALTER TABLE public.recetas_alergenos OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16817)
-- Name: recetas_equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas_equipos (
    recetas_equipo_id integer NOT NULL,
    receta_id integer,
    equipo_id integer,
    observaciones text
);


ALTER TABLE public.recetas_equipos OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16823)
-- Name: recetas_equipos_recetas_equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recetas_equipos_recetas_equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recetas_equipos_recetas_equipo_id_seq OWNER TO postgres;

--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 253
-- Name: recetas_equipos_recetas_equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recetas_equipos_recetas_equipo_id_seq OWNED BY public.recetas_equipos.recetas_equipo_id;


--
-- TOC entry 254 (class 1259 OID 16824)
-- Name: recetas_ingredientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas_ingredientes (
    receta_id integer,
    ingrediente_id integer
);


ALTER TABLE public.recetas_ingredientes OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16827)
-- Name: recetas_receta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recetas_receta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recetas_receta_id_seq OWNER TO postgres;

--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 255
-- Name: recetas_receta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recetas_receta_id_seq OWNED BY public.recetas.receta_id;


--
-- TOC entry 256 (class 1259 OID 16828)
-- Name: recetas_sabores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas_sabores (
    receta_id integer,
    sabor_id integer
);


ALTER TABLE public.recetas_sabores OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16831)
-- Name: reporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporte (
    reporte_id integer NOT NULL,
    produccion_id integer,
    fecha_reporte date,
    tipo_reporte character varying(100),
    observaciones text,
    responsable character varying(100)
);


ALTER TABLE public.reporte OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16837)
-- Name: reporte_reporte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporte_reporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reporte_reporte_id_seq OWNER TO postgres;

--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 258
-- Name: reporte_reporte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporte_reporte_id_seq OWNED BY public.reporte.reporte_id;


--
-- TOC entry 4960 (class 2604 OID 16838)
-- Name: alergenos alergeno_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alergenos ALTER COLUMN alergeno_id SET DEFAULT nextval('public.alergenos_alergeno_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 16839)
-- Name: biblioteca_sabores sabor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca_sabores ALTER COLUMN sabor_id SET DEFAULT nextval('public.biblioteca_sabores_sabor_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 16840)
-- Name: capacitacion capacitacion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacion ALTER COLUMN capacitacion_id SET DEFAULT nextval('public.capacitacion_capacitacion_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 16841)
-- Name: control_produccion control_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_produccion ALTER COLUMN control_id SET DEFAULT nextval('public.control_produccion_control_id_seq'::regclass);


--
-- TOC entry 4964 (class 2604 OID 16842)
-- Name: equipos equipo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipos ALTER COLUMN equipo_id SET DEFAULT nextval('public.equipos_equipo_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 16843)
-- Name: evaluaciones evaluacion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones ALTER COLUMN evaluacion_id SET DEFAULT nextval('public.evaluaciones_evaluacion_id_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 16844)
-- Name: ingredientes ingrediente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientes ALTER COLUMN ingrediente_id SET DEFAULT nextval('public.ingredientes_ingrediente_id_seq'::regclass);


--
-- TOC entry 4967 (class 2604 OID 16845)
-- Name: inventario inventario_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario ALTER COLUMN inventario_id SET DEFAULT nextval('public.inventario_inventario_id_seq'::regclass);


--
-- TOC entry 4969 (class 2604 OID 16846)
-- Name: mantenimiento mantenimiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento ALTER COLUMN mantenimiento_id SET DEFAULT nextval('public.mantenimiento_mantenimiento_id_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 16847)
-- Name: oompaloompas empleado_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oompaloompas ALTER COLUMN empleado_id SET DEFAULT nextval('public.oompaloompas_empleado_id_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 16848)
-- Name: plan_produccion plan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_produccion ALTER COLUMN plan_id SET DEFAULT nextval('public.plan_produccion_plan_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 16849)
-- Name: produccion produccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion ALTER COLUMN produccion_id SET DEFAULT nextval('public.produccion_produccion_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 16850)
-- Name: produccion lote; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion ALTER COLUMN lote SET DEFAULT nextval('public.produccion_lote_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 16851)
-- Name: proveedores proveedor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN proveedor_id SET DEFAULT nextval('public.proveedores_proveedor_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 16852)
-- Name: recetas receta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas ALTER COLUMN receta_id SET DEFAULT nextval('public.recetas_receta_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 16853)
-- Name: recetas_equipos recetas_equipo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_equipos ALTER COLUMN recetas_equipo_id SET DEFAULT nextval('public.recetas_equipos_recetas_equipo_id_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 16854)
-- Name: reporte reporte_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte ALTER COLUMN reporte_id SET DEFAULT nextval('public.reporte_reporte_id_seq'::regclass);


--
-- TOC entry 5192 (class 0 OID 16697)
-- Dependencies: 219
-- Data for Name: alergenos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alergenos (alergeno_id, nombre, descripcion, categoria_alergeno, nivel_riesgo) FROM stdin;
1	Frutos Rojos	Alergias a frutos rojos	Frutos	Alto
2	Lácteos	Alergias a productos lácteos	Lácteos	Medio
3	Gluten	Alergias al gluten en productos derivados de trigo	Cereales	Alto
4	Cacahuates	Alergia a los cacahuates (maní)	Frutos secos	Alto
5	Soja	Alergia a la soja y sus derivados	Legumbres	Medio
6	Frutos Secos	Alergia a nueces, almendras, avellanas, etc.	Frutos secos	Alto
7	Huevos	Alergia a las proteínas de los huevos	Proteínas animales	Alto
8	Mariscos	Alergia a mariscos como camarones, langostas, etc.	Mariscos	Alto
9	Pescado	Alergia al pescado	Mariscos	Alto
10	Sésamo	Alergia a las semillas de sésamo	Semillas	Medio
11	Lactosa	Alergia a la lactosa, el azúcar de la leche	Lácteos	Medio
12	Frutas Cítricas	Alergia a frutas cítricas como naranjas, limones	Frutas	Bajo
13	Apio	Alergia al apio	Vegetales	Bajo
14	Acelga	Alergia a las acelgas	Vegetales	Bajo
15	Mostaza	Alergia a la mostaza	Especias	Medio
16	Ajo	Alergia al ajo	Especias	Bajo
17	Canela	Alergia a la canela	Especias	Medio
18	Altramuces	Alergia a los altramuces	Legumbres	Alto
19	Miel	Alergia a la miel y sus componentes	Dulces	Bajo
20	Chocolate	Alergia al chocolate, especialmente al cacao	Frutos	Alto
21	Cilantro	Alergia al cilantro	Especias	Bajo
22	Pistacho	Alergia al pistacho	Frutos secos	Alto
23	Tomate	Alergia al tomate	Vegetales	Bajo
24	Pepitas	Alergia a las pepitas de calabaza	Semillas	Bajo
25	Vainilla	Alergia a la vainilla	Especias	Medio
26	Albahaca	Alergia a la albahaca	Especias	Bajo
27	Almendra	Alergia a las almendras	Frutos secos	Alto
28	Sulfito	Alergia a los sulfitos, común en vinos y conservas	Conservantes	Alto
29	Aceitunas	Alergia a las aceitunas	Frutos	Bajo
\.


--
-- TOC entry 5194 (class 0 OID 16705)
-- Dependencies: 221
-- Data for Name: biblioteca_sabores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biblioteca_sabores (sabor_id, nombre, descripcion, sabor, aroma) FROM stdin;
1	Dulce	Sabor dulce y suave	Dulce	Agradable
2	Picante	Sabor picante y fuerte	Picante	Fuerte
3	Ácido	Sabor ácido que despierta los sentidos	Ácido	Cítrico
4	Amargo	Sabor amargo que resalta la intensidad del cacao	Amargo	Terroso
5	Salado	Sabor salado con un toque suave	Salado	Sutil
6	Menta	Sabor fresco y refrescante	Menta	Herbáceo
7	Vainilla	Sabor suave y cremoso de vainilla	Dulce	Aromático
8	Caramelo	Sabor suave y cremoso, típico del caramelo	Dulce	Dulce
9	Frambuesa	Sabor afrutado con un toque ácido	Frutal	Fresco
10	Cítrico	Sabor vibrante y ácido de frutas cítricas	Ácido	Cítrico
11	Chocolate Amargo	Sabor fuerte y oscuro de chocolate puro	Amargo	Cacao
12	Coco	Sabor tropical y suave	Dulce	Tropical
13	Fresa	Sabor dulce y fresco de fresa madura	Frutal	Fresco
14	Mango	Sabor dulce con un toque exótico	Dulce	Tropical
15	Almendra	Sabor suave y ligeramente tostado	Nuez	Tostado
16	Especias	Sabor complejo con mezcla de especias	Especiado	Aromático
17	Pistacho	Sabor a nuez con un toque salado	Nuez	Aromático
18	Canela	Sabor cálido y especiado	Especiado	Dulce
19	Café	Sabor fuerte y amargo a café	Amargo	Aromático
20	Frutos Rojos	Sabor afrutado y ácido de frutos rojos	Frutal	Fresco
21	Lima	Sabor ácido con un toque de frescura	Ácido	Cítrico
22	Chili	Sabor picante y ardiente	Picante	Intenso
23	Rosa	Sabor floral y ligeramente dulce	Floral	Aromático
24	Lavanda	Sabor floral suave con toque herbal	Floral	Herbáceo
25	Peppermint	Sabor de menta con un toque más fuerte	Menta	Fresco
26	Haba Tonka	Sabor suave y almendrado	Dulce	Tóxico
27	Hielo	Sabor frío y refrescante	Frío	Aromático
28	Dulce de Leche	Sabor dulce, cremoso y lechoso	Dulce	Leche
29	Bajo Azúcar	Sabor suave y menos dulce	Sutil	Neutral
30	Frutas Cítricas	Combinación de sabores frescos de frutas cítricas	Ácido	Cítrico
\.


--
-- TOC entry 5196 (class 0 OID 16713)
-- Dependencies: 223
-- Data for Name: capacitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capacitacion (capacitacion_id, empleado_id, tipo_capacitacion, fecha_inicio, fecha_finalizacion, instructor, calificacion, habilidades_desarrolladas) FROM stdin;
1	1	Cocina Avanzada	2024-01-15	2024-01-20	Chef Maestro	95	Nuevas técnicas de cocina
2	2	Decoración de Postres	2024-01-18	2024-01-23	Decoradora Estrella	90	Decoración creativa
3	3	Cocina Internacional	2024-02-01	2024-02-05	Chef Internacional	92	Cocina de diferentes países
4	4	Pastelería Avanzada	2024-02-10	2024-02-15	Pastelero Experto	88	Elaboración de pasteles finos
5	5	Cocina Vegana	2024-02-12	2024-02-17	Chef Vegano	91	Técnicas de cocina vegana
6	6	Manipulación de Alimentos	2024-02-15	2024-02-20	Instructor en Higiene	85	Normas de seguridad alimentaria
7	7	Cocina Molecular	2024-02-20	2024-02-25	Chef Molecular	95	Uso de técnicas moleculares
8	8	Cocina Rápida y Saludable	2024-02-25	2024-03-01	Chef Saludable	89	Recetas rápidas y nutritivas
9	9	Cocina para Dietas Especiales	2024-03-01	2024-03-05	Chef Nutricionista	93	Dietas sin gluten, sin lactosa
10	10	Cocina de Alta Cocina	2024-03-05	2024-03-10	Chef Gourmet	96	Técnicas de alta cocina
11	11	Preparación de Sushi	2024-03-10	2024-03-15	Sushiman	90	Elaboración de sushi tradicional
12	12	Cocina Mediterránea	2024-03-15	2024-03-20	Chef Mediterráneo	91	Recetas de la cocina mediterránea
13	13	Cocina Mexicana	2024-03-20	2024-03-25	Chef Mexicano	87	Preparación de platillos mexicanos
14	14	Cocina Francesa	2024-03-25	2024-03-30	Chef Francés	94	Cocina francesa clásica
15	15	Cocina Asiática	2024-04-01	2024-04-05	Chef Asiático	92	Recetas asiáticas tradicionales
16	16	Panadería	2024-04-05	2024-04-10	Panadero Profesional	86	Elaboración de panadería artesanal
17	17	Cocina para Eventos Especiales	2024-04-10	2024-04-15	Chef de Eventos	90	Catering y menú para eventos
18	18	Cocina sin Azúcar	2024-04-15	2024-04-20	Chef de Dietas	91	Recetas sin azúcar añadida
19	19	Cocina Tradicional	2024-04-20	2024-04-25	Chef Tradicional	88	Técnicas de cocina clásica
20	20	Cocina Sin Tiempos	2024-04-25	2024-04-30	Chef Rápido	85	Preparación eficiente de platillos
21	21	Cocina para Niños	2024-05-01	2024-05-05	Chef Infantil	89	Recetas fáciles y nutritivas para niños
22	22	Cocina Criolla	2024-05-05	2024-05-10	Chef Criollo	90	Recetas autóctonas de la región
23	23	Cocina para Diabéticos	2024-05-10	2024-05-15	Chef Nutricionista	93	Recetas para control de azúcar
24	24	Cocina en Fogón	2024-05-15	2024-05-20	Chef de Fogón	91	Uso de técnicas de cocina en fogón
25	25	Cocina de Mariscos	2024-05-20	2024-05-25	Chef Marisco	92	Preparación de mariscos frescos
26	26	Cocina para Personas con Alergias	2024-05-25	2024-05-30	Chef alérgico	94	Recetas libres de alergenos comunes
27	27	Cocina Internacional Rápida	2024-06-01	2024-06-05	Chef Rápido Internacional	88	Recetas rápidas de cocina mundial
28	28	Cocina para Vegetarianos	2024-06-05	2024-06-10	Chef Vegetariano	91	Recetas vegetarianas innovadoras
29	29	Cocina a la Parrilla	2024-06-10	2024-06-15	Chef Grill	92	Técnicas de parrillada
30	30	Cocina de Fusión	2024-06-15	2024-06-20	Chef Fusión	95	Combinación de sabores de diferentes culturas
\.


--
-- TOC entry 5198 (class 0 OID 16721)
-- Dependencies: 225
-- Data for Name: control_produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.control_produccion (control_id, produccion_id, fecha_control, aprobado, observaciones, responsable) FROM stdin;
1	1	2024-01-03	t	Control exitoso	1
2	2	2024-02-03	t	Control exitoso	2
3	3	2024-03-03	t	Control exitoso	1
4	4	2024-04-03	t	Control exitoso	2
5	5	2024-05-03	t	Control exitoso	1
6	6	2024-06-03	t	Control exitoso	2
7	7	2024-07-03	t	Control exitoso	1
8	8	2024-08-03	t	Control exitoso	2
9	9	2024-09-03	t	Control exitoso	1
10	10	2024-10-03	t	Control exitoso	2
11	11	2024-11-03	t	Control exitoso	1
12	12	2024-12-03	t	Control exitoso	2
13	13	2025-01-03	t	Control exitoso	1
14	14	2025-02-03	t	Control exitoso	2
15	15	2025-03-03	t	Control exitoso	1
16	16	2025-04-03	t	Control exitoso	2
17	17	2025-05-03	t	Control exitoso	1
18	18	2025-06-03	t	Control exitoso	2
19	19	2025-07-03	t	Control exitoso	1
20	20	2025-08-03	t	Control exitoso	2
21	21	2025-09-03	t	Control exitoso	1
22	22	2025-10-03	t	Control exitoso	2
23	23	2025-11-03	t	Control exitoso	1
24	24	2025-12-03	t	Control exitoso	2
25	25	2026-01-03	t	Control exitoso	1
26	26	2026-02-03	t	Control exitoso	2
27	27	2026-03-03	t	Control exitoso	1
28	28	2026-04-03	t	Control exitoso	2
29	29	2026-05-03	t	Control exitoso	1
30	30	2026-06-03	t	Control exitoso	2
\.


--
-- TOC entry 5200 (class 0 OID 16728)
-- Dependencies: 227
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipos (equipo_id, nombre, tipo, fecha_adquisicion, ultima_calibracion, proximo_mantenimiento, estado) FROM stdin;
1	Olla de Presión	Electrodoméstico	2023-01-01	2023-12-31	2024-01-01	Activo
2	Batidora Industrial	Electrodoméstico	2023-02-01	2023-12-31	2024-02-01	Activo
3	Horno Eléctrico	Electrodoméstico	2023-03-01	2023-12-31	2024-03-01	Activo
4	Refrigerador	Electrodoméstico	2023-04-01	2023-12-31	2024-04-01	Activo
5	Microondas	Electrodoméstico	2023-05-01	2023-12-31	2024-05-01	Activo
6	Cafetera	Electrodoméstico	2023-06-01	2023-12-31	2024-06-01	Activo
7	Lavadora	Electrodoméstico	2023-07-01	2023-12-31	2024-07-01	Activo
8	Secadora	Electrodoméstico	2023-08-01	2023-12-31	2024-08-01	Activo
9	Aspiradora	Electrodoméstico	2023-09-01	2023-12-31	2024-09-01	Activo
10	Plancha	Electrodoméstico	2023-10-01	2023-12-31	2024-10-01	Activo
11	Extractor de Jugos	Electrodoméstico	2023-11-01	2023-12-31	2024-11-01	Activo
12	Cortadora de Vegetales	Electrodoméstico	2023-12-01	2023-12-31	2024-12-01	Activo
13	Cámara Fotográfica	Electrónica	2023-01-01	2023-12-31	2024-01-01	Activo
14	Proyector	Electrónica	2023-02-01	2023-12-31	2024-02-01	Activo
15	Laptop	Electrónica	2023-03-01	2023-12-31	2024-03-01	Activo
16	Monitor	Electrónica	2023-04-01	2023-12-31	2024-04-01	Activo
17	Teclado	Electrónica	2023-05-01	2023-12-31	2024-05-01	Activo
18	Maus	Electrónica	2023-06-01	2023-12-31	2024-06-01	Activo
19	Router	Electrónica	2023-07-01	2023-12-31	2024-07-01	Activo
20	Switch de Red	Electrónica	2023-08-01	2023-12-31	2024-08-01	Activo
21	Servidor	Electrónica	2023-09-01	2023-12-31	2024-09-01	Activo
22	Impresora	Electrónica	2023-10-01	2023-12-31	2024-10-01	Activo
23	Escáner	Electrónica	2023-11-01	2023-12-31	2024-11-01	Activo
24	Generador de Energía	Maquinaria	2023-01-01	2023-12-31	2024-01-01	Activo
25	Compresor	Maquinaria	2023-02-01	2023-12-31	2024-02-01	Activo
26	Taladro Eléctrico	Maquinaria	2023-03-01	2023-12-31	2024-03-01	Activo
27	Sierra Circular	Maquinaria	2023-04-01	2023-12-31	2024-04-01	Activo
28	Elevador	Maquinaria	2023-05-01	2023-12-31	2024-05-01	Activo
29	Carretilla	Maquinaria	2023-06-01	2023-12-31	2024-06-01	Activo
30	Hormigonera	Maquinaria	2023-07-01	2023-12-31	2024-07-01	Activo
31	Compresor de Aire	Maquinaria	2023-08-01	2023-12-31	2024-08-01	Activo
\.


--
-- TOC entry 5202 (class 0 OID 16734)
-- Dependencies: 229
-- Data for Name: evaluaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluaciones (evaluacion_id, empleado_id, fecha_evaluacion, puntuacion, comentarios, areas_mejorar, objetivos_personales) FROM stdin;
1	1	2024-01-10	85	Excelente trabajo, pero mejora en la puntualidad	Puntualidad	Ser más puntual
2	2	2024-01-12	90	Trabajo sobresaliente, sigue así	N/A	N/A
3	3	2024-01-14	80	Buen desempeño, pero mejorar la comunicación con el equipo	Comunicación	Mejorar la comunicación con el equipo
4	4	2024-01-16	75	Se necesita más proactividad	Proactividad	Iniciar tareas sin esperar instrucciones
5	5	2024-01-18	88	Buen trabajo, pero necesita mejorar en la gestión del tiempo	Gestión del tiempo	Optimizar el manejo de plazos
6	6	2024-01-20	92	Excelente rendimiento en proyectos recientes	N/A	Seguir trabajando con la misma dedicación
7	7	2024-01-22	84	Gran esfuerzo, pero debe mejorar en la toma de decisiones rápidas	Toma de decisiones	Ser más rápido al tomar decisiones
8	8	2024-01-24	89	Muy buen desempeño en todas las áreas	N/A	Seguir así
9	9	2024-01-26	91	Trabajo excepcional, solo un poco más de organización	Organización	Ser más organizado con las tareas diarias
10	10	2024-01-28	83	Buen rendimiento, pero falta mayor iniciativa	Iniciativa	Tomar más iniciativas en proyectos nuevos
11	11	2024-01-30	90	Trabajo muy bien realizado, sigue así	N/A	N/A
12	12	2024-02-01	82	Mejorar la gestión de tiempo durante las reuniones	Gestión de reuniones	Mejorar el tiempo durante las reuniones
13	13	2024-02-03	87	Buen trabajo, pero hay que mejorar en la adaptación a cambios rápidos	Adaptabilidad	Ser más flexible ante cambios inesperados
14	14	2024-02-05	85	Excelente trabajo, pero debe evitar distraerse fácilmente	Enfoque	Mejorar la concentración durante el trabajo
15	15	2024-02-07	78	Buen desempeño, pero debe mejorar en la delegación de tareas	Delegación	Delegar tareas de manera más efectiva
16	16	2024-02-09	93	Excelente trabajo y actitud, siempre dispuesto a aprender	N/A	Continuar con la misma actitud
17	17	2024-02-11	86	Trabajo muy bueno, pero debe mejorar en el control de estrés	Manejo del estrés	Controlar el estrés durante situaciones críticas
18	18	2024-02-13	81	Buen rendimiento, pero falta más proactividad en reuniones de equipo	Proactividad	Participar más activamente en reuniones
19	19	2024-02-15	80	Se necesita mejorar en la priorización de tareas	Priorización	Mejorar la habilidad para priorizar tareas importantes
20	20	2024-02-17	90	Buen desempeño, debe trabajar en la mejora de habilidades de liderazgo	Liderazgo	Desarrollar habilidades de liderazgo
21	21	2024-02-19	85	Buen trabajo, pero mejorar la atención al detalle	Atención al detalle	Ser más detallista en los proyectos
22	22	2024-02-21	88	Excelente trabajo, solo mejorar en el manejo del tiempo	Gestión del tiempo	Gestionar mejor el tiempo en tareas cotidianas
23	23	2024-02-23	92	Trabajo excepcional, no se necesita ninguna mejora	N/A	Seguir manteniendo el rendimiento
24	24	2024-02-25	79	Necesita mejorar en la toma de decisiones rápidas	Toma de decisiones	Ser más ágil al tomar decisiones
25	25	2024-02-27	82	Buen trabajo, pero debe trabajar más en la autonomía	Autonomía	Ser más independiente en la ejecución de tareas
26	26	2024-03-01	86	Trabajo sólido, pero falta mayor esfuerzo en proyectos a largo plazo	Compromiso a largo plazo	Trabajar con más dedicación en proyectos a largo plazo
27	27	2024-03-03	89	Excelente rendimiento, solo mejorar en la organización del tiempo	Organización	Organizar mejor el tiempo para tareas múltiples
28	28	2024-03-05	84	Buen desempeño, pero debe mejorar en la colaboración con otros equipos	Colaboración	Mejorar la colaboración interdepartamental
29	29	2024-03-07	91	Gran trabajo, pero debe seguir perfeccionando sus habilidades en diseño	Habilidades de diseño	Seguir perfeccionando habilidades creativas
30	30	2024-03-09	90	Excelente desempeño, pero debe mejorar en el equilibrio entre rapidez y calidad	Equilibrio rapidez-calidad	Mejorar el equilibrio entre velocidad y precisión
\.


--
-- TOC entry 5204 (class 0 OID 16742)
-- Dependencies: 231
-- Data for Name: ingredientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredientes (ingrediente_id, nombre, unidad_medida, precio_unitario, origen) FROM stdin;
1	Chocolate	kg	10.00	Brasil
2	Azúcar	kg	2.00	Colombia
3	Manteca de Cacao	kg	15.00	República Dominicana
4	Vainilla	g	5.00	Madagascar
5	Leche en Polvo	kg	3.50	Argentina
6	Café	kg	8.00	Colombia
7	Miel	kg	6.00	México
8	Nuez	kg	12.00	Estados Unidos
9	Almendra	kg	9.50	España
10	Frambuesa	kg	20.00	Chile
11	Fresa	kg	4.50	España
12	Cereza	kg	18.00	Turquía
13	Canela	kg	7.00	Indonesia
14	Clavo	kg	9.00	Sri Lanka
15	Jengibre	kg	10.50	India
16	Menta	kg	3.00	Argentina
17	Frutos Rojos	kg	25.00	Perú
18	Limón	kg	2.50	México
19	Naranja	kg	3.00	España
20	Coco	kg	8.50	Filipinas
21	Pistacho	kg	25.00	Irán
22	Avellana	kg	14.00	Turquía
23	Acelga	kg	1.50	España
24	Pepitas	kg	5.50	México
25	Aguacate	kg	4.00	México
26	Especias	kg	11.00	India
27	Sésamo	kg	6.00	Etiopía
28	Aceitunas	kg	4.00	Grecia
29	Cacahuetes	kg	8.00	Argentina
30	Almidón de maíz	kg	15.00	España
\.


--
-- TOC entry 5206 (class 0 OID 16748)
-- Dependencies: 233
-- Data for Name: ingredientes_proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredientes_proveedores (ingrediente_id, proveedor_id) FROM stdin;
1	1
1	2
1	3
2	4
2	5
3	6
3	1
4	2
4	3
5	4
6	5
7	6
7	2
8	3
8	1
9	4
9	5
10	6
11	1
11	2
12	3
12	4
13	5
14	6
14	2
15	3
15	1
16	4
17	5
17	6
18	1
19	2
19	3
20	4
20	5
21	6
22	1
22	2
23	3
24	4
25	5
25	6
26	1
27	2
28	3
29	4
30	5
\.


--
-- TOC entry 5207 (class 0 OID 16751)
-- Dependencies: 234
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (inventario_id, ingrediente_id, cantidad_stock, cantidad_comprometida, fecha_caducidad, punto_reorden, stock_maximo, ubicacion, fecha_ultimo_abastecimiento) FROM stdin;
1	1	50	10	2023-12-31	20	100	Almacén 1	2023-01-01
2	2	100	20	2023-12-31	30	150	Almacén 2	2023-01-01
3	3	200	50	2023-06-30	50	300	Almacén 3	2023-03-15
4	4	150	30	2023-11-15	40	200	Almacén 4	2023-05-10
5	5	80	15	2023-10-20	25	120	Almacén 5	2023-02-28
6	6	120	40	2023-07-30	35	160	Almacén 6	2023-03-01
7	7	250	60	2023-08-10	60	350	Almacén 7	2023-04-10
8	8	90	25	2023-09-25	30	130	Almacén 8	2023-02-18
9	9	110	10	2023-11-05	40	150	Almacén 9	2023-01-30
10	10	75	20	2023-12-01	20	100	Almacén 10	2023-02-23
11	11	160	50	2023-10-15	45	220	Almacén 11	2023-04-08
12	12	135	30	2023-06-20	25	180	Almacén 12	2023-03-12
13	13	90	15	2023-08-05	30	120	Almacén 13	2023-01-12
14	14	300	100	2023-05-01	80	400	Almacén 14	2023-02-25
15	15	60	10	2023-09-30	25	80	Almacén 15	2023-01-05
16	16	150	45	2023-07-15	50	200	Almacén 16	2023-03-18
17	17	200	70	2023-10-10	60	300	Almacén 17	2023-02-02
18	18	180	60	2023-08-20	55	250	Almacén 18	2023-03-22
19	19	110	35	2023-11-15	40	160	Almacén 19	2023-01-18
20	20	95	25	2023-12-15	30	130	Almacén 20	2023-02-10
21	21	220	80	2023-05-10	70	300	Almacén 21	2023-03-05
22	22	125	20	2023-06-25	30	150	Almacén 22	2023-03-20
23	23	170	40	2023-09-15	50	220	Almacén 23	2023-02-01
24	24	140	50	2023-07-05	40	190	Almacén 24	2023-03-07
25	25	90	15	2023-10-05	25	120	Almacén 25	2023-01-22
26	26	210	75	2023-11-10	60	300	Almacén 26	2023-03-02
27	27	80	20	2023-12-10	30	100	Almacén 27	2023-02-12
28	28	100	40	2023-08-25	35	150	Almacén 28	2023-01-15
29	29	120	50	2023-06-10	40	180	Almacén 29	2023-03-27
30	30	150	60	2023-07-25	45	200	Almacén 30	2023-02-06
\.


--
-- TOC entry 5209 (class 0 OID 16761)
-- Dependencies: 237
-- Data for Name: mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mantenimiento (mantenimiento_id, equipo_id, fecha_mantenimiento, tipo_mantenimiento, descripcion, responsable, estado) FROM stdin;
1	1	2024-01-01	Reparación General	Reparación de la olla de presión	1	Completado
2	2	2024-02-01	Limpieza y Calibración	Limpieza de la batidora industrial	2	Completado
3	3	2024-02-10	Reparación General	Reparación de la licuadora	3	Completado
4	4	2024-02-12	Limpieza y Calibración	Limpieza de la batidora de mano	4	Completado
5	5	2024-02-15	Reemplazo de Piezas	Reemplazo del motor de la licuadora	5	Completado
6	6	2024-02-18	Reparación General	Reparación del microondas	6	Completado
7	7	2024-02-20	Mantenimiento Preventivo	Revisión y ajuste de los controles del horno	7	Completado
8	8	2024-02-22	Reparación General	Cambio de piezas en la freidora	8	Completado
9	9	2024-02-25	Limpieza y Calibración	Limpieza interna de la licuadora	9	Completado
10	10	2024-02-28	Reemplazo de Piezas	Sustitución de la resistencia del horno	10	Completado
11	11	2024-03-01	Mantenimiento Preventivo	Revisión de funcionamiento de la máquina de café	11	Completado
12	12	2024-03-03	Reparación General	Reparación de la plancha	12	Completado
13	13	2024-03-05	Limpieza y Calibración	Desinfección y calibración de la máquina de hielo	13	Completado
14	14	2024-03-07	Reemplazo de Piezas	Cambio de la válvula de presión en la olla de vapor	14	Completado
15	15	2024-03-10	Mantenimiento Preventivo	Revisión y ajuste de la tostadora	15	Completado
16	16	2024-03-12	Reparación General	Reparación de la parrilla	16	Completado
17	17	2024-03-14	Limpieza y Calibración	Limpieza profunda del horno de convección	17	Completado
18	18	2024-03-16	Reemplazo de Piezas	Reemplazo de la bomba de agua en la máquina de espresso	18	Completado
19	19	2024-03-18	Mantenimiento Preventivo	Verificación de los controles del exprimidor	19	Completado
20	20	2024-03-20	Reparación General	Reemplazo de la puerta del microondas	20	Completado
21	21	2024-03-22	Limpieza y Calibración	Limpieza y calibración de la freidora	21	Completado
22	22	2024-03-25	Reemplazo de Piezas	Sustitución de la tapa de la olla de presión	22	Completado
23	23	2024-03-27	Mantenimiento Preventivo	Revisión de la maquinaria de la procesadora de alimentos	23	Completado
24	24	2024-03-29	Reparación General	Reparación de la licuadora industrial	24	Completado
25	25	2024-04-01	Limpieza y Calibración	Desinfección de la máquina de café	25	Completado
26	26	2024-04-03	Reemplazo de Piezas	Reemplazo de la resistencia en el horno	26	Completado
27	27	2024-04-05	Mantenimiento Preventivo	Ajuste de los controles en la licuadora de alta velocidad	27	Completado
28	28	2024-04-07	Reparación General	Reparación de la batidora industrial	28	Completado
29	29	2024-04-10	Limpieza y Calibración	Limpieza y verificación del funcionamiento de la freidora	29	Completado
30	30	2024-04-12	Reemplazo de Piezas	Sustitución de las partes dañadas en la licuadora	30	Completado
\.


--
-- TOC entry 5211 (class 0 OID 16768)
-- Dependencies: 239
-- Data for Name: oompaloompas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oompaloompas (empleado_id, nombre, fecha_ingreso, especialidad, rendimiento, nivel_experiencia, estado) FROM stdin;
1	Willy	2020-01-01	Chef	ALTO	Experto	Activo
2	Oompa	2021-01-01	Decorador	MEDIO	Intermedio	Activo
3	Choco	2019-06-15	Ingeniero de Chocolate	ALTO	Avanzado	Activo
4	Caramel	2022-03-22	Especialista en Caramelos	BAJO	Principiante	Activo
5	Menta	2018-07-01	Jefe de Producción	ALTO	Experto	Activo
6	Fudge	2020-09-10	Supervisor de Producción	ALTO	Avanzado	Activo
7	Gummy	2021-08-19	Diseñador de Galletas	MEDIO	Intermedio	Activo
8	Candy	2022-05-05	Preparador de Dulces	ALTO	Avanzado	Activo
9	Choccy	2021-02-28	Maestro Chocolatero	ALTO	Experto	Activo
10	Nutty	2019-04-18	Almendras y Nueces	ALTO	Avanzado	Activo
11	Lolly	2021-07-11	Fabricante de Paletas	MEDIO	Intermedio	Activo
12	Sprinkles	2018-09-14	Decorador de Tartas	ALTO	Experto	Activo
13	Marzipan	2020-12-03	Experto en Mazapán	ALTO	Avanzado	Activo
14	Caramelita	2021-01-13	Especialista en Caramelos	BAJO	Principiante	Activo
15	Whiskers	2022-01-10	Chef de Postres	ALTO	Avanzado	Activo
16	Sugar	2020-06-22	Gestor de Dulces	ALTO	Experto	Activo
17	Fizz	2022-09-18	Burbujas y Refrescos	ALTO	Intermedio	Activo
18	Melt	2019-05-15	Experto en Chocolate Derretido	ALTO	Avanzado	Activo
19	Lush	2021-03-29	Decorador de Galletas	MEDIO	Intermedio	Activo
20	Crunch	2020-11-21	Supervisor de Texturas	ALTO	Avanzado	Activo
21	Sweets	2019-08-10	Cocinero	ALTO	Experto	Activo
22	Zesty	2021-12-02	Cocinero de Limón	ALTO	Avanzado	Activo
23	Sugarloaf	2020-01-15	Cocinero de Azúcar	ALTO	Experto	Activo
24	Candyfloss	2022-04-10	Hacedor de Algodón de Azúcar	BAJO	Principiante	Activo
25	Toffee	2020-10-28	Cocinero de Toffees	ALTO	Experto	Activo
26	Chewy	2021-11-15	Especialista en Goma de Mascar	BAJO	Principiante	Activo
27	Taffy	2020-07-08	Preparador de Taffy	ALTO	Avanzado	Activo
28	Truffle	2021-02-01	Maestro Trufas	ALTO	Avanzado	Activo
29	Berry	2022-06-25	Experto en Frutas	MEDIO	Intermedio	Activo
30	Carrot	2021-03-17	Supervisor de Verduras Dulces	BAJO	Principiante	Activo
\.


--
-- TOC entry 5213 (class 0 OID 16774)
-- Dependencies: 241
-- Data for Name: plan_produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_produccion (plan_id, fecha_inicio, fecha_fin, estado_plan, observaciones) FROM stdin;
1	2024-01-01	2024-01-31	En Proceso	Producción de chocolates
2	2024-02-01	2024-02-28	En Proceso	Producción de caramelos
3	2024-03-01	2024-03-31	En Proceso	Producción de galletas
4	2024-04-01	2024-04-30	En Proceso	Producción de pasteles
5	2024-05-01	2024-05-31	En Proceso	Producción de helados
6	2024-06-01	2024-06-30	En Proceso	Producción de galletas rellenas
7	2024-07-01	2024-07-31	En Proceso	Producción de caramelos masticables
8	2024-08-01	2024-08-31	En Proceso	Producción de bombones
9	2024-09-01	2024-09-30	En Proceso	Producción de chocolates rellenos
10	2024-10-01	2024-10-31	En Proceso	Producción de pasteles de frutas
11	2024-11-01	2024-11-30	En Proceso	Producción de galletas decoradas
12	2024-12-01	2024-12-31	En Proceso	Producción de helados de frutas
13	2025-01-01	2025-01-31	En Proceso	Producción de galletas integrales
14	2025-02-01	2025-02-28	En Proceso	Producción de caramelos sin azúcar
15	2025-03-01	2025-03-31	En Proceso	Producción de bombones de chocolate
16	2025-04-01	2025-04-30	En Proceso	Producción de pasteles de chocolate
17	2025-05-01	2025-05-31	En Proceso	Producción de helados de chocolate
18	2025-06-01	2025-06-30	En Proceso	Producción de galletas sin gluten
19	2025-07-01	2025-07-31	En Proceso	Producción de caramelos de fruta
20	2025-08-01	2025-08-31	En Proceso	Producción de bombones con licor
21	2025-09-01	2025-09-30	En Proceso	Producción de pasteles de vainilla
22	2025-10-01	2025-10-31	En Proceso	Producción de galletas de avena
23	2025-11-01	2025-11-30	En Proceso	Producción de helados cremosos
24	2025-12-01	2025-12-31	En Proceso	Producción de caramelos con chocolate
25	2026-01-01	2026-01-31	En Proceso	Producción de galletas rellenas de crema
26	2026-02-01	2026-02-28	En Proceso	Producción de bombones de frutas
27	2026-03-01	2026-03-31	En Proceso	Producción de pasteles de crema
28	2026-04-01	2026-04-30	En Proceso	Producción de helados con trozos de fruta
29	2026-05-01	2026-05-31	En Proceso	Producción de galletas de chocolate
30	2026-06-01	2026-06-30	En Proceso	Producción de caramelos de goma
31	2026-07-01	2026-07-31	En Proceso	Producción de bombones rellenos
32	2026-08-01	2026-08-31	En Proceso	Producción de pasteles de frutas
33	2026-09-01	2026-09-30	En Proceso	Producción de helados en paleta
\.


--
-- TOC entry 5215 (class 0 OID 16781)
-- Dependencies: 243
-- Data for Name: produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produccion (produccion_id, receta_id, empleado_id, plan_produccion_id, fecha_inicio, fecha_fin, lote, estado_ejecucion, unidades_producidas, costo_total, observaciones) FROM stdin;
1	1	1	1	2024-01-01	2024-01-02	1	Completado	100	500.00	Producción exitosa
2	2	2	2	2024-02-01	2024-02-02	2	Completado	120	600.00	Producción exitosa
3	3	1	3	2024-03-01	2024-03-02	3	Completado	130	650.00	Producción exitosa
4	4	2	4	2024-04-01	2024-04-02	4	Completado	140	700.00	Producción exitosa
5	5	1	5	2024-05-01	2024-05-02	5	Completado	150	750.00	Producción exitosa
6	6	2	6	2024-06-01	2024-06-02	6	Completado	160	800.00	Producción exitosa
7	7	1	7	2024-07-01	2024-07-02	7	Completado	170	850.00	Producción exitosa
8	8	2	8	2024-08-01	2024-08-02	8	Completado	180	900.00	Producción exitosa
9	9	1	9	2024-09-01	2024-09-02	9	Completado	190	950.00	Producción exitosa
10	10	2	10	2024-10-01	2024-10-02	10	Completado	200	1000.00	Producción exitosa
11	11	1	11	2024-11-01	2024-11-02	11	Completado	210	1050.00	Producción exitosa
12	12	2	12	2024-12-01	2024-12-02	12	Completado	220	1100.00	Producción exitosa
13	13	1	13	2025-01-01	2025-01-02	13	Completado	230	1150.00	Producción exitosa
14	14	2	14	2025-02-01	2025-02-02	14	Completado	240	1200.00	Producción exitosa
15	15	1	15	2025-03-01	2025-03-02	15	Completado	250	1250.00	Producción exitosa
16	16	2	16	2025-04-01	2025-04-02	16	Completado	260	1300.00	Producción exitosa
17	17	1	17	2025-05-01	2025-05-02	17	Completado	270	1350.00	Producción exitosa
18	18	2	18	2025-06-01	2025-06-02	18	Completado	280	1400.00	Producción exitosa
19	19	1	19	2025-07-01	2025-07-02	19	Completado	290	1450.00	Producción exitosa
20	20	2	20	2025-08-01	2025-08-02	20	Completado	300	1500.00	Producción exitosa
21	21	1	21	2025-09-01	2025-09-02	21	Completado	310	1550.00	Producción exitosa
22	22	2	22	2025-10-01	2025-10-02	22	Completado	320	1600.00	Producción exitosa
23	23	1	23	2025-11-01	2025-11-02	23	Completado	330	1650.00	Producción exitosa
24	24	2	24	2025-12-01	2025-12-02	24	Completado	340	1700.00	Producción exitosa
25	25	1	25	2026-01-01	2026-01-02	25	Completado	350	1750.00	Producción exitosa
26	26	2	26	2026-02-01	2026-02-02	26	Completado	360	1800.00	Producción exitosa
27	27	1	27	2026-03-01	2026-03-02	27	Completado	370	1850.00	Producción exitosa
28	28	2	28	2026-04-01	2026-04-02	28	Completado	380	1900.00	Producción exitosa
29	29	1	29	2026-05-01	2026-05-02	29	Completado	390	1950.00	Producción exitosa
30	30	2	30	2026-06-01	2026-06-02	30	Completado	400	2000.00	Producción exitosa
\.


--
-- TOC entry 5216 (class 0 OID 16788)
-- Dependencies: 244
-- Data for Name: produccion_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produccion_equipos (produccion_id, equipo_id) FROM stdin;
3	2
4	1
6	20
7	15
10	5
2	8
9	11
13	9
14	17
5	12
12	6
15	10
18	14
20	3
19	18
11	13
16	16
8	4
21	7
23	22
24	19
25	23
26	21
27	24
28	25
29	28
30	29
22	26
1	30
17	27
\.


--
-- TOC entry 5220 (class 0 OID 16806)
-- Dependencies: 249
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (proveedor_id, nombre, contacto, acuerdos_comerciales, pais) FROM stdin;
1	Proveedor 1	1234567890	Acuerdo A	Brasil
2	Proveedor 2	0987654321	Acuerdo B	Colombia
3	Proveedor 3	1122334455	Acuerdo C	México
4	Proveedor 4	2233445566	Acuerdo D	Perú
5	Proveedor 5	3344556677	Acuerdo E	Chile
6	Proveedor 6	4455667788	Acuerdo F	Argentina
7	Proveedor 7	5566778899	Acuerdo G	Ecuador
8	Proveedor 8	6677889900	Acuerdo H	Paraguay
9	Proveedor 9	7788990011	Acuerdo I	Bolivia
10	Proveedor 10	8899001122	Acuerdo J	Uruguay
11	Proveedor 11	9900112233	Acuerdo K	Venezuela
12	Proveedor 12	1002233445	Acuerdo L	Guatemala
13	Proveedor 13	1103344556	Acuerdo M	Honduras
14	Proveedor 14	1204455667	Acuerdo N	Nicaragua
15	Proveedor 15	1305566778	Acuerdo O	Costa Rica
16	Proveedor 16	1406677889	Acuerdo P	El Salvador
17	Proveedor 17	1507788990	Acuerdo Q	Panamá
18	Proveedor 18	1608899001	Acuerdo R	Cuba
19	Proveedor 19	1709900112	Acuerdo S	República Dominicana
20	Proveedor 20	1801002233	Acuerdo T	Puerto Rico
21	Proveedor 21	1901103344	Acuerdo U	España
22	Proveedor 22	2001204455	Acuerdo V	Jamaica
23	Proveedor 23	2101305566	Acuerdo W	Trinidad y Tobago
24	Proveedor 24	2201406677	Acuerdo X	Barbados
25	Proveedor 25	2301507788	Acuerdo Y	Bahamas
26	Proveedor 26	2401608899	Acuerdo Z	Saint Lucia
27	Proveedor 27	2501709900	Acuerdo AA	Grenada
28	Proveedor 28	2601801002	Acuerdo BB	Antigua y Barbuda
29	Proveedor 29	2701901103	Acuerdo CC	Saint Kitts y Nevis
30	Proveedor 30	2802001204	Acuerdo DD	San Vicente y las Granadinas
\.


--
-- TOC entry 5219 (class 0 OID 16793)
-- Dependencies: 247
-- Data for Name: recetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas (receta_id, nombre, descripcion, tiempo_coccion, temperatura, intrucciones, imagen_url, fecha_creacion, cantidad_produccion) FROM stdin;
1	Chocolate Fluff	Un chocolate suave como una nube, ideal para niños	00:15:00	Baja	Mezclar ingredientes, calentar a fuego lento, enfriar y disfrutar	https://th.bing.com/th/id/OIP.mq6QZKawsR1LrfGQMeM9yAHaLI?w=189&h=285&c=7&r=0&o=5&pid=1.7	2024-01-10	100
2	Caramelo Elástico	Caramelo que se estira como goma de mascar, ideal para jugar	00:20:00	Media	Cocer a fuego lento y estirar con las manos	https://th.bing.com/th/id/OIP.BD6fouHyeAmN4BaBEE61LwHaET?w=1080&h=628&rs=1&pid=ImgDetMain	2024-01-12	80
3	Galletas Luminiscentes	Galletas que brillan en la oscuridad, perfectas para fiestas	00:25:00	Alta	Mezclar la masa, hornear, y dejar enfriar en un lugar oscuro	https://th.bing.com/th/id/OIP.7Ty5gv5xYZy0EpbX77BfLwHaFj?rs=1&pid=ImgDetMain	2024-01-14	150
4	Barras de Chocolate Explosivas	Barras de chocolate con un centro relleno de burbujas de aire	00:10:00	Alta	Verter el chocolate, rellenar con aire, y dejar enfriar	https://th.bing.com/th/id/OIP.e431oVE_q1Bo7uPHx89ruQHaFq?rs=1&pid=ImgDetMain	2024-01-16	120
5	Helado de Dulce de Leche	Helado cremoso con sabor a dulce de leche	00:30:00	Baja	Batir ingredientes, congelar y servir con caramelo	https://th.bing.com/th/id/R.e44d5b2cb9163e674d55050112a9072b?rik=9wtn1vnuc%2bXbpA&pid=ImgRaw&r=0	2024-01-18	200
6	Chicles Sabores Inesperados	Chicles que cambian de sabor con cada masticada	00:15:00	Baja	Moler sabores, mezclar con goma base, y formar chicles	https://th.bing.com/th/id/R.6afa231edc9b34de249693473093135a?rik=1v%2bUcqe7UlLghg&pid=ImgRaw&r=0	2024-01-20	250
7	Galletas Mágicas	Galletas que te hacen volar por unos segundos	00:20:00	Baja	Mezclar ingredientes, formar galletas y hornear	https://th.bing.com/th/id/R.048ff14c925dc7695391dc4c1da9b41e?rik=8AoRSR5xe1u3zw&pid=ImgRaw&r=0	2024-01-22	90
8	Líquido de Chocolate Fusión	Un chocolate líquido que nunca se derrite	00:15:00	Alta	Mezclar chocolate con ingredientes especiales, calentar	https://th.bing.com/th/id/OIP.w_C_xgi_4KoKjpGOyBCKQwHaHa?rs=1&pid=ImgDetMain	2024-01-25	180
9	Burbujas de Caramelo	Caramelos que explotan al tocarlos, liberando un sabor especial	00:30:00	Baja	Cocer el caramelo a fuego lento, formar burbujas y dejar enfriar	https://www.ruufe.com/cdn/shop/products/burbujasfinal2.jpg?v=1665870320	2024-01-28	100
10	Chocolate de Burbujas Gigantes	Chocolate que forma grandes burbujas al comerlo	00:20:00	Alta	Preparar chocolate espeso, formar burbujas y dejar enfriar	https://th.bing.com/th/id/R.6adcab4c96a253c2b8e43d4ef63fdc59?rik=1zUtLshvG%2bbCqw&pid=ImgRaw&r=0	2024-02-01	140
11	Muffins Mágicos	Muffins que cambian de sabor según el estado de ánimo	00:25:00	Baja	Mezclar los ingredientes según el humor, hornear	https://th.bing.com/th/id/OIP.oPwgc7l4NqFk61rjWCURvAHaFj?rs=1&pid=ImgDetMain	2024-02-03	75
12	Caramelos Flotantes	Caramelos que flotan por el aire, como si tuviesen helio	00:15:00	Baja	Cocer el caramelo y añadir un toque especial para que floten	https://img.freepik.com/free-photo/sweet-caramel-candies-sauce-isolated-white-delicious-caramel_157837-1285.jpg?size=626&ext=jpg	2024-02-06	160
13	Chocolates Espaciales	Chocolate que tiene un sabor diferente en el espacio exterior	00:20:00	Alta	Mezclar chocolate y esencia espacial, dejar enfriar	https://th.bing.com/th/id/OIP.Uyq2aP_MRF2c_5MdZk5nvQHaFj?rs=1&pid=ImgDetMain	2024-02-09	110
14	Caramelos Cuento de Hadas	Caramelos que cuentan historias al ser saboreados	00:30:00	Media	Mezclar ingredientes, infusionar con cuentos y hacer caramelos	https://th.bing.com/th/id/R.7ff1d76abeddcefc34382effaaf191ac?rik=WumMknqneg67lA&pid=ImgRaw&r=0	2024-02-11	130
15	Galletas de Chocolate Celestial	Galletas de chocolate con un toque celestial, elevan el ánimo	00:15:00	Baja	Hornear las galletas y añadir un toque de polvo estelar	https://th.bing.com/th/id/OIP.rDRNM2B_TCZxKYu4KwYobwHaFj?rs=1&pid=ImgDetMain	2024-02-14	190
16	Café de Chocolate	Una mezcla de café y chocolate que nunca se enfría	00:10:00	Baja	Mezclar café y chocolate, calentar hasta fusionar	https://th.bing.com/th/id/OIP.YAwGLsnS7ESd87ZYPe9U9AHaE7?rs=1&pid=ImgDetMain	2024-02-17	200
17	Galletas de Cielo Estrellado	Galletas cubiertas con azúcar estelar	00:25:00	Alta	Formar la masa, añadir el azúcar estelar y hornear	https://th.bing.com/th/id/OIP.89AF3RheqhA7C-DOd0dKAAHaHa?w=500&h=500&rs=1&pid=ImgDetMain	2024-02-19	170
18	ChocoPops	Palitos de chocolate que explotan al comerlos	00:20:00	Alta	Formar palitos de chocolate con explosivos de azúcar	https://th.bing.com/th/id/OIP.2IMNKiG181dPj0ZXx6GndwHaJQ?rs=1&pid=ImgDetMain	2024-02-22	120
19	Chicles de Goma Flotante	Chicles que flotan ligeramente en el aire	00:15:00	Baja	Mezclar goma con aire especial, formar chicles flotantes	https://th.bing.com/th/id/OIP.feB82rZkWcVvaKbCFUhzogHaFj?rs=1&pid=ImgDetMain	2024-02-24	100
20	Chocolate Multidimensional	Chocolate con un sabor que cambia al morderlo	00:25:00	Media	Preparar el chocolate y añadir dimensiones de sabor	https://cdn.thecoolist.com/wp-content/uploads/2015/01/Nendo-Chocolatexture-Box-of-Chocolates-Maison-et-Objet-7-345x200.jpg	2024-02-27	80
21	Caramelos de Sombra	Caramelos que desaparecen en la boca, dejando solo el sabor	00:30:00	Baja	Cocer caramelo y añadir sombra comestible	https://th.bing.com/th/id/R.965224c5b27d0258efca5ce6fd85cd0e?rik=kGnz4JcV7WElwA&pid=ImgRaw&r=0	2024-03-01	140
22	Barras de Chocolate Enroscado	Barras de chocolate con espirales que se deshacen al tocarlas	00:15:00	Alta	Formar barras en espiral, añadir relleno y enfriar	https://thumbs.dreamstime.com/b/el-lujo-elegante-adorn%C3%B3-las-tablas-con-los-dulces-para-una-boda-del-hap-67198586.jpg	2024-03-04	90
23	Tortas de Chocolate Viajeras	Tortas que viajan a donde sea que se las lleves	00:35:00	Alta	Hornear las tortas y añadir energía para viajar	https://th.bing.com/th/id/OIP.a6B1N2LSTnZy18mVtpxVZgHaIy?rs=1&pid=ImgDetMain	2024-03-06	100
24	Bombones con Relleno Sorpresa	Bombones con rellenos que te cuentan historias	00:20:00	Alta	Rellenar los bombones con historias secretas	https://th.bing.com/th/id/OIP.Xwo0uQBntvq3JQNZlBKjWAHaLH?w=565&h=848&rs=1&pid=ImgDetMain	2024-03-09	150
25	Chocolates con Raíces del Bosque	Chocolate con un toque misterioso del bosque	00:25:00	Alta	Preparar chocolate con hierbas secretas y raíces mágicas	http://example.com/img/chocolates_bosque.jpg	2024-03-12	120
26	Mentas Congeladas	Caramelos mentolados que te refrescan por dentro y fuera	00:10:00	Baja	Congelar menta con chocolate y caramelizar	https://th.bing.com/th/id/OIP.RloFGvhBzRS_7Nb4irRSkQHaEK?rs=1&pid=ImgDetMain	2024-03-14	200
27	Barras de Nube de Azúcar	Barras de azúcar que se disuelven en la boca	00:15:00	Baja	Formar barras con azúcar y aire, dejar disolverse	https://th.bing.com/th/id/OIP.BvChjVff5UxVSANp4bfzdAHaEL?rs=1&pid=ImgDetMain	2024-03-17	180
28	Galletas de Caramelo Volador	Galletas que flotan por un breve momento antes de caer	00:18:00	Baja	Mezclar la masa, agregar caramelo flotante y hornear	https://th.bing.com/th/id/R.8631c3a88bb56790be84ec3170edafa9?rik=w19vXw8fH2QlSQ&riu=http%3a%2f%2fzetagas.com.pe%2fstorage%2f2019%2f07%2fmini-voladores22.jpg&ehk=VpFVp2AqH3DYguDWBsZcwDNIA0o13vPaBH77lqcASjM%3d&risl=&pid=ImgRaw&r=0	2024-03-20	150
29	Piruletas de Espejismos	Piruletas que crean ilusiones visuales con colores cambiantes	00:25:00	Media	Preparar el jarabe, agregar colorantes mágicos y formar piruletas	https://th.bing.com/th/id/OIP.zvo_BIaRllv47T4t4z0f5QHaEC?rs=1&pid=ImgDetMain	2024-03-22	120
30	Tarta de Chocolate Viajero	Una tarta que puede trasladarse por el aire, ideal para eventos	00:45:00	Alta	Hornear la base de la tarta, preparar el chocolate y dejarla levitar ligeramente	https://th.bing.com/th/id/OIP.mS_lopjLPs5nWd-hQPZ0ewHaE8?rs=1&pid=ImgDetMain	2024-03-25	90
\.


--
-- TOC entry 5222 (class 0 OID 16814)
-- Dependencies: 251
-- Data for Name: recetas_alergenos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas_alergenos (receta_id, alergeno_id) FROM stdin;
1	1
1	2
1	3
1	4
2	1
2	5
2	6
3	2
3	7
3	8
3	9
4	1
4	10
4	6
4	7
5	3
5	4
5	11
5	12
6	1
6	13
6	14
7	2
7	5
7	6
8	9
8	10
8	11
9	3
9	12
9	13
10	4
10	5
10	14
11	1
11	7
11	8
12	2
12	9
12	10
13	3
13	11
13	12
14	1
14	13
14	14
15	6
15	7
15	8
16	4
16	5
16	6
17	2
17	9
17	10
18	3
18	11
18	12
19	1
19	5
19	6
20	7
20	8
20	9
21	2
21	3
21	4
22	10
22	11
22	12
23	1
23	5
23	6
24	13
24	14
24	2
25	7
25	8
25	9
26	1
26	4
26	5
27	2
27	10
27	11
28	3
28	12
28	13
29	6
29	7
29	14
30	1
30	2
30	3
\.


--
-- TOC entry 5223 (class 0 OID 16817)
-- Dependencies: 252
-- Data for Name: recetas_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas_equipos (recetas_equipo_id, receta_id, equipo_id, observaciones) FROM stdin;
1	1	4	Equipo usado para la receta de Chocolate Fluff
2	2	8	Equipo usado para la receta de Caramelo Elástico
3	3	2	Equipo usado para la receta de Tarta de Fresa
4	4	10	Equipo usado para la receta de Galletas de Vainilla
5	5	5	Equipo usado para la receta de Mousse de Limón
6	6	3	Equipo usado para la receta de Pastel de Chocolate
7	7	12	Equipo usado para la receta de Brownie
8	8	1	Equipo usado para la receta de Pudding de Arroz
9	9	9	Equipo usado para la receta de Cupcakes de Mora
10	10	6	Equipo usado para la receta de Gelatina de Frambuesa
11	11	7	Equipo usado para la receta de Tiramisu
12	12	11	Equipo usado para la receta de Donuts Glaseados
13	13	13	Equipo usado para la receta de Panqueques
14	14	14	Equipo usado para la receta de Panecillos de Ajo
15	15	4	Equipo usado para la receta de Puding de Mango
16	16	3	Equipo usado para la receta de Flan de Huevo
17	17	5	Equipo usado para la receta de Muffins de Plátano
18	18	15	Equipo usado para la receta de Bizcocho de Yogur
19	19	2	Equipo usado para la receta de Pastel de Nuez
20	20	8	Equipo usado para la receta de Crepas de Chocolate
21	21	6	Equipo usado para la receta de Crema de Cacao
22	22	7	Equipo usado para la receta de Tarta de Manzana
23	23	1	Equipo usado para la receta de Flan de Café
24	24	9	Equipo usado para la receta de Galletas de Avena
25	25	11	Equipo usado para la receta de Bizcocho de Mandarina
26	26	13	Equipo usado para la receta de Pan de Banana
27	27	12	Equipo usado para la receta de Tartaleta de Limón
28	28	14	Equipo usado para la receta de Pastel de Pera
29	29	10	Equipo usado para la receta de Trufas de Chocolate
30	30	15	Equipo usado para la receta de Helado de Vainilla
\.


--
-- TOC entry 5225 (class 0 OID 16824)
-- Dependencies: 254
-- Data for Name: recetas_ingredientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas_ingredientes (receta_id, ingrediente_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
2	6
2	7
2	8
2	9
2	10
3	11
3	12
3	13
3	14
3	15
4	16
4	17
4	18
4	19
4	20
5	21
5	22
5	23
5	24
5	25
6	26
6	27
6	28
6	29
6	30
7	1
7	2
7	3
7	4
7	5
8	6
8	7
8	8
8	9
8	10
9	11
9	12
9	13
9	14
9	15
10	16
10	17
10	18
10	19
10	20
11	21
11	22
11	23
11	24
11	25
12	26
12	27
12	28
12	29
12	30
13	1
13	2
13	3
13	4
13	5
14	6
14	7
14	8
14	9
14	10
15	11
15	12
15	13
15	14
15	15
16	16
16	17
16	18
16	19
16	20
17	21
17	22
17	23
17	24
17	25
18	26
18	27
18	28
18	29
18	30
19	1
19	2
19	3
19	4
19	5
20	6
20	7
20	8
20	9
20	10
21	11
21	12
21	13
21	14
21	15
22	16
22	17
22	18
22	19
22	20
23	21
23	22
23	23
23	24
23	25
24	26
24	27
24	28
24	29
24	30
25	1
25	2
25	3
25	4
25	5
26	6
26	7
26	8
26	9
26	10
27	11
27	12
27	13
27	14
27	15
28	16
28	17
28	18
28	19
28	20
29	21
29	22
29	23
29	24
29	25
30	26
30	27
30	28
30	29
30	30
\.


--
-- TOC entry 5227 (class 0 OID 16828)
-- Dependencies: 256
-- Data for Name: recetas_sabores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas_sabores (receta_id, sabor_id) FROM stdin;
1	1
1	2
1	3
1	4
2	1
2	5
2	6
3	2
3	7
3	8
3	9
4	3
4	5
4	10
5	1
5	2
5	11
6	4
6	12
6	13
7	1
7	7
7	14
8	2
8	8
8	9
9	3
9	10
9	11
10	4
10	5
10	6
11	1
11	12
11	13
12	2
12	7
12	14
13	3
13	8
13	9
14	1
14	5
14	10
15	6
15	12
15	13
16	2
16	7
16	11
17	3
17	8
17	9
18	4
18	14
18	6
19	1
19	5
19	12
20	2
20	10
20	13
21	3
21	7
21	8
22	1
22	6
22	9
23	4
23	5
23	13
24	2
24	10
24	11
25	3
25	8
25	12
26	1
26	7
26	14
27	4
27	9
27	13
28	2
28	6
28	10
29	3
29	5
29	11
30	1
30	4
30	12
\.


--
-- TOC entry 5228 (class 0 OID 16831)
-- Dependencies: 257
-- Data for Name: reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reporte (reporte_id, produccion_id, fecha_reporte, tipo_reporte, observaciones, responsable) FROM stdin;
1	7	2024-01-10	Informe de producción	Producción exitosa	Willy
2	12	2024-01-11	Informe de producción	Producción exitosa	Oompa
3	3	2024-01-12	Informe de producción	Producción exitosa	Willy
4	9	2024-01-13	Informe de producción	Producción exitosa	Oompa
5	15	2024-01-14	Informe de producción	Producción exitosa	Willy
6	19	2024-01-15	Informe de producción	Producción exitosa	Oompa
7	5	2024-01-16	Informe de producción	Producción exitosa	Willy
8	8	2024-01-17	Informe de producción	Producción exitosa	Oompa
9	6	2024-01-18	Informe de producción	Producción exitosa	Willy
10	4	2024-01-19	Informe de producción	Producción exitosa	Oompa
11	11	2024-01-20	Informe de producción	Producción exitosa	Willy
12	13	2024-01-21	Informe de producción	Producción exitosa	Oompa
13	14	2024-01-22	Informe de producción	Producción exitosa	Willy
14	16	2024-01-23	Informe de producción	Producción exitosa	Oompa
15	17	2024-01-24	Informe de producción	Producción exitosa	Willy
16	18	2024-01-25	Informe de producción	Producción exitosa	Oompa
17	20	2024-01-26	Informe de producción	Producción exitosa	Willy
18	22	2024-01-27	Informe de producción	Producción exitosa	Oompa
19	25	2024-01-28	Informe de producción	Producción exitosa	Willy
20	24	2024-01-29	Informe de producción	Producción exitosa	Oompa
21	27	2024-01-30	Informe de producción	Producción exitosa	Willy
22	29	2024-01-31	Informe de producción	Producción exitosa	Oompa
23	30	2024-02-01	Informe de producción	Producción exitosa	Willy
24	23	2024-02-02	Informe de producción	Producción exitosa	Oompa
25	21	2024-02-03	Informe de producción	Producción exitosa	Willy
26	28	2024-02-04	Informe de producción	Producción exitosa	Oompa
27	2	2024-02-05	Informe de producción	Producción exitosa	Willy
28	1	2024-02-06	Informe de producción	Producción exitosa	Oompa
29	10	2024-02-07	Informe de producción	Producción exitosa	Willy
30	26	2024-02-08	Informe de producción	Producción exitosa	Oompa
\.


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 220
-- Name: alergenos_alergeno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alergenos_alergeno_id_seq', 29, true);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 222
-- Name: biblioteca_sabores_sabor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biblioteca_sabores_sabor_id_seq', 30, true);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 224
-- Name: capacitacion_capacitacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capacitacion_capacitacion_id_seq', 30, true);


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 226
-- Name: control_produccion_control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.control_produccion_control_id_seq', 30, true);


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 228
-- Name: equipos_equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipos_equipo_id_seq', 31, true);


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 230
-- Name: evaluaciones_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluaciones_evaluacion_id_seq', 30, true);


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 232
-- Name: ingredientes_ingrediente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredientes_ingrediente_id_seq', 30, true);


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 235
-- Name: inventario_inventario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventario_inventario_id_seq', 30, true);


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 238
-- Name: mantenimiento_mantenimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mantenimiento_mantenimiento_id_seq', 30, true);


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 240
-- Name: oompaloompas_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oompaloompas_empleado_id_seq', 30, true);


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 242
-- Name: plan_produccion_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_produccion_plan_id_seq', 33, true);


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 245
-- Name: produccion_lote_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produccion_lote_seq', 1, false);


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 246
-- Name: produccion_produccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produccion_produccion_id_seq', 30, true);


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 250
-- Name: proveedores_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_proveedor_id_seq', 30, true);


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 253
-- Name: recetas_equipos_recetas_equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recetas_equipos_recetas_equipo_id_seq', 30, true);


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 255
-- Name: recetas_receta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recetas_receta_id_seq', 30, true);


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 258
-- Name: reporte_reporte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reporte_reporte_id_seq', 30, true);


--
-- TOC entry 4982 (class 2606 OID 16856)
-- Name: alergenos alergenos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alergenos
    ADD CONSTRAINT alergenos_pkey PRIMARY KEY (alergeno_id);


--
-- TOC entry 4984 (class 2606 OID 16858)
-- Name: biblioteca_sabores biblioteca_sabores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biblioteca_sabores
    ADD CONSTRAINT biblioteca_sabores_pkey PRIMARY KEY (sabor_id);


--
-- TOC entry 4986 (class 2606 OID 16860)
-- Name: capacitacion capacitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacion
    ADD CONSTRAINT capacitacion_pkey PRIMARY KEY (capacitacion_id);


--
-- TOC entry 4988 (class 2606 OID 16862)
-- Name: control_produccion control_produccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_produccion
    ADD CONSTRAINT control_produccion_pkey PRIMARY KEY (control_id);


--
-- TOC entry 4990 (class 2606 OID 16864)
-- Name: equipos equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (equipo_id);


--
-- TOC entry 4992 (class 2606 OID 16866)
-- Name: evaluaciones evaluaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT evaluaciones_pkey PRIMARY KEY (evaluacion_id);


--
-- TOC entry 4995 (class 2606 OID 16868)
-- Name: ingredientes ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientes
    ADD CONSTRAINT ingredientes_pkey PRIMARY KEY (ingrediente_id);


--
-- TOC entry 4998 (class 2606 OID 16870)
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (inventario_id);


--
-- TOC entry 5000 (class 2606 OID 16872)
-- Name: mantenimiento mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (mantenimiento_id);


--
-- TOC entry 5003 (class 2606 OID 16874)
-- Name: oompaloompas oompaloompas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oompaloompas
    ADD CONSTRAINT oompaloompas_pkey PRIMARY KEY (empleado_id);


--
-- TOC entry 5005 (class 2606 OID 16876)
-- Name: plan_produccion plan_produccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_produccion
    ADD CONSTRAINT plan_produccion_pkey PRIMARY KEY (plan_id);


--
-- TOC entry 5008 (class 2606 OID 16878)
-- Name: produccion produccion_lote_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT produccion_lote_key UNIQUE (lote);


--
-- TOC entry 5010 (class 2606 OID 16880)
-- Name: produccion produccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT produccion_pkey PRIMARY KEY (produccion_id);


--
-- TOC entry 5015 (class 2606 OID 16882)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (proveedor_id);


--
-- TOC entry 5017 (class 2606 OID 16884)
-- Name: recetas_equipos recetas_equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_equipos
    ADD CONSTRAINT recetas_equipos_pkey PRIMARY KEY (recetas_equipo_id);


--
-- TOC entry 5013 (class 2606 OID 16886)
-- Name: recetas recetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_pkey PRIMARY KEY (receta_id);


--
-- TOC entry 5019 (class 2606 OID 16888)
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (reporte_id);


--
-- TOC entry 4993 (class 1259 OID 16889)
-- Name: idx_ingredientes_nombre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ingredientes_nombre ON public.ingredientes USING btree (nombre);


--
-- TOC entry 4996 (class 1259 OID 16890)
-- Name: idx_inventario_stock; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventario_stock ON public.inventario USING btree (cantidad_stock);


--
-- TOC entry 5001 (class 1259 OID 16891)
-- Name: idx_oompaloompas_empleado_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oompaloompas_empleado_id ON public.oompaloompas USING btree (empleado_id);


--
-- TOC entry 5006 (class 1259 OID 16892)
-- Name: idx_produccion_fecha; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_produccion_fecha ON public.produccion USING btree (fecha_inicio);


--
-- TOC entry 5011 (class 1259 OID 16893)
-- Name: idx_recetas_recetas_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_recetas_recetas_id ON public.recetas USING btree (receta_id);


--
-- TOC entry 5034 (class 2606 OID 16894)
-- Name: recetas_alergenos fk_alergeno_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_alergenos
    ADD CONSTRAINT fk_alergeno_id FOREIGN KEY (alergeno_id) REFERENCES public.alergenos(alergeno_id);


--
-- TOC entry 5020 (class 2606 OID 16904)
-- Name: capacitacion fk_empleado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacion
    ADD CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES public.oompaloompas(empleado_id);


--
-- TOC entry 5023 (class 2606 OID 16899)
-- Name: evaluaciones fk_empleado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES public.oompaloompas(empleado_id);


--
-- TOC entry 5029 (class 2606 OID 16909)
-- Name: produccion fk_empleado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES public.oompaloompas(empleado_id);


--
-- TOC entry 5027 (class 2606 OID 16914)
-- Name: mantenimiento fk_equipo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT fk_equipo_id FOREIGN KEY (equipo_id) REFERENCES public.equipos(equipo_id);


--
-- TOC entry 5032 (class 2606 OID 16919)
-- Name: produccion_equipos fk_equipo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion_equipos
    ADD CONSTRAINT fk_equipo_id FOREIGN KEY (equipo_id) REFERENCES public.equipos(equipo_id);


--
-- TOC entry 5036 (class 2606 OID 16924)
-- Name: recetas_equipos fk_equipo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_equipos
    ADD CONSTRAINT fk_equipo_id FOREIGN KEY (equipo_id) REFERENCES public.equipos(equipo_id);


--
-- TOC entry 5024 (class 2606 OID 16939)
-- Name: ingredientes_proveedores fk_ingrediente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientes_proveedores
    ADD CONSTRAINT fk_ingrediente_id FOREIGN KEY (ingrediente_id) REFERENCES public.ingredientes(ingrediente_id);


--
-- TOC entry 5026 (class 2606 OID 16929)
-- Name: inventario fk_ingrediente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT fk_ingrediente_id FOREIGN KEY (ingrediente_id) REFERENCES public.ingredientes(ingrediente_id);


--
-- TOC entry 5038 (class 2606 OID 16934)
-- Name: recetas_ingredientes fk_ingrediente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_ingredientes
    ADD CONSTRAINT fk_ingrediente_id FOREIGN KEY (ingrediente_id) REFERENCES public.ingredientes(ingrediente_id);


--
-- TOC entry 5030 (class 2606 OID 16944)
-- Name: produccion fk_plan_produccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT fk_plan_produccion_id FOREIGN KEY (plan_produccion_id) REFERENCES public.plan_produccion(plan_id);


--
-- TOC entry 5021 (class 2606 OID 16949)
-- Name: control_produccion fk_produccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_produccion
    ADD CONSTRAINT fk_produccion_id FOREIGN KEY (produccion_id) REFERENCES public.produccion(produccion_id);


--
-- TOC entry 5033 (class 2606 OID 16954)
-- Name: produccion_equipos fk_produccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion_equipos
    ADD CONSTRAINT fk_produccion_id FOREIGN KEY (produccion_id) REFERENCES public.produccion(produccion_id);


--
-- TOC entry 5042 (class 2606 OID 16959)
-- Name: reporte fk_produccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fk_produccion_id FOREIGN KEY (produccion_id) REFERENCES public.produccion(produccion_id);


--
-- TOC entry 5025 (class 2606 OID 16964)
-- Name: ingredientes_proveedores fk_proveedor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientes_proveedores
    ADD CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(proveedor_id);


--
-- TOC entry 5031 (class 2606 OID 16969)
-- Name: produccion fk_receta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produccion
    ADD CONSTRAINT fk_receta_id FOREIGN KEY (receta_id) REFERENCES public.recetas(receta_id);


--
-- TOC entry 5035 (class 2606 OID 16979)
-- Name: recetas_alergenos fk_receta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_alergenos
    ADD CONSTRAINT fk_receta_id FOREIGN KEY (receta_id) REFERENCES public.recetas(receta_id);


--
-- TOC entry 5037 (class 2606 OID 16989)
-- Name: recetas_equipos fk_receta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_equipos
    ADD CONSTRAINT fk_receta_id FOREIGN KEY (receta_id) REFERENCES public.recetas(receta_id);


--
-- TOC entry 5039 (class 2606 OID 16974)
-- Name: recetas_ingredientes fk_receta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_ingredientes
    ADD CONSTRAINT fk_receta_id FOREIGN KEY (receta_id) REFERENCES public.recetas(receta_id);


--
-- TOC entry 5040 (class 2606 OID 16984)
-- Name: recetas_sabores fk_receta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_sabores
    ADD CONSTRAINT fk_receta_id FOREIGN KEY (receta_id) REFERENCES public.recetas(receta_id);


--
-- TOC entry 5022 (class 2606 OID 16999)
-- Name: control_produccion fk_responsable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_produccion
    ADD CONSTRAINT fk_responsable_id FOREIGN KEY (responsable) REFERENCES public.oompaloompas(empleado_id);


--
-- TOC entry 5028 (class 2606 OID 16994)
-- Name: mantenimiento fk_responsable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT fk_responsable_id FOREIGN KEY (responsable) REFERENCES public.oompaloompas(empleado_id);


--
-- TOC entry 5041 (class 2606 OID 17004)
-- Name: recetas_sabores fk_sabor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas_sabores
    ADD CONSTRAINT fk_sabor_id FOREIGN KEY (sabor_id) REFERENCES public.biblioteca_sabores(sabor_id);


-- Completed on 2026-06-03 11:42:25

--
-- PostgreSQL database dump complete
--

\unrestrict fUaGNYXMbZHCtYNPV3ohfMfEX5pFf6VQnuAsKpE4WbCdPWDjO8LUSelaeNVovqw

