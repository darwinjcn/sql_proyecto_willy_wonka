# 🍫 Fábrica de Chocolates Willy Wonka - Sistema de Gestión

Sistema de gestión de base de datos relacional desarrollado para la Fábrica de Chocolates Wonka Digital. Permite administrar **recetas, inventario de ingredientes, producción, empleados (Oompa Loompas), equipos y control de calidad**.

---

## 📂 Estructura del Repositorio

```text
proyecto-willy-wonka/
├── 01-scripts-sql/
│   ├── 01_creacion_estructura.sql    # Evaluación 1: Tablas, índices y vistas
│   ├── 02_insercion_datos.sql        # Evaluación 2: Inserts masivos
│   ├── 03_consultas_ejemplos.sql     # Evaluación 2: SELECT, JOIN, UPDATE, DELETE
│   └── 00_backup_completo_pgdump.sql # Backup completo (pg_dump)
├── 02-documentacion/
│   ├── Evaluacion_1_Diseno_BBDD.pdf
│   ├── Evaluacion_2_Insercion_Consulta.pdf
│   └── Caso_Estudio_Wonka_Digital.pdf
├── README.md
└── LICENSE
```

---

## 🚀 Cómo restaurar la Base de Datos

### 🔹 Opción Rápida (Backup completo)

Si tienes el archivo `00_backup_completo_pgdump.sql` (generado con `pg_dump`), puedes restaurar todo (estructura + datos) con:

```bash
psql -U tu_usuario -d nombre_base_datos -f 01-scripts-sql/00_backup_completo_pgdump.sql
```

### 🔹 Opción Paso a Paso (Evaluaciones)

**1. Crear la estructura (tablas, índices y vistas):**

```bash
psql -U tu_usuario -d nombre_base_datos -f 01-scripts-sql/01_creacion_estructura.sql
```

**2. Insertar los datos:**

```bash
psql -U tu_usuario -d nombre_base_datos -f 01-scripts-sql/02_insercion_datos.sql
```

**3. (Opcional) Ejecutar las consultas de ejemplo:**

```bash
psql -U tu_usuario -d nombre_base_datos -f 01-scripts-sql/03_consultas_ejemplos.sql
```

> 💡 **Tip:** Reemplaza `tu_usuario` y `nombre_base_datos` por tus credenciales reales de PostgreSQL.

---

## 🛠️ Tecnologías utilizadas

| Componente | Detalle |
|------------|---------|
| 🐘 Motor de Base de Datos | PostgreSQL 17+ |
| 📝 Lenguaje | SQL Estándar |
| 🗂️ Versionado | Git / GitHub |

---

## 📚 Documentación

Toda la documentación del proyecto se encuentra en la carpeta [`02-documentacion/`](./02-documentacion/):

- 📘 **Evaluación 1 - Diseño de BBDD:** Modelado, normalización, diccionario de datos y diagramas.
- 📗 **Evaluación 2 - Inserción y Consulta:** Carga masiva de datos, sentencias DML y casos de prueba.
- 📕 **Caso de Estudio - Wonka Digital:** Planteamiento del problema y requerimientos del negocio.

---

## 👥 Autores (Violet Team)

- 🧑‍💻 **Fernando Marcano**
- 🧑‍💻 **Adrian Villamizar**
- 🧑‍💻 **Darwin Colmenares**
- 👩‍💻 **Jelianny Nieves**

---

## 📜 Licencia

Este proyecto está bajo la licencia especificada en el archivo [`LICENSE`](./LICENSE).

---

<p align="center">
  <strong>Proyecto desarrollado para la cátedra de Base de Datos I - UNETI</strong><br>
  <em>Universidad Nacional Experimental de la Gran Caracas</em>
</p>
