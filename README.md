# 🍫 Fábrica de Chocolates Willy Wonka - Sistema de Gestión

Sistema de gestión de base de datos relacional desarrollado para la Fábrica de Chocolates Wonka Digital. Permite administrar **recetas, inventario de ingredientes, producción, empleados (Oompa Loompas), equipos y control de calidad**.

---

## 📊 Diagrama Entidad-Relación

![Diagrama ER - Fábrica Willy Wonka](./02-documentacion/diagrama_ER.png)

> 🖼️ Diagrama completo disponible en [`02-documentacion/diagrama_ER.png`](./02-documentacion/diagrama_ER.png)

---

## 📂 Estructura del Repositorio

```text
sql_proyecto_willy_wonka/
├── 01-scripts-sql/
│   ├── 00_backup_completo_pgdump.sql
│   ├── 01_creacion_estructura.sql
│   ├── 02_insercion_datos.sql
│   └── 03_consultas_ejemplos.sql
├── 02-documentacion/
│   ├── 01_diseno_bbdd.pdf
│   ├── 02_insercion_consulta.pdf
│   ├── 03_caso_estudio_wonka_digital.pdf
│   └── diagrama_ER.png
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

- 📘 **`01_diseno_bbdd.pdf`** — Modelado, normalización, diccionario de datos y diagramas.
- 📗 **`02_insercion_consulta.pdf`** — Carga masiva de datos, sentencias DML y casos de prueba.
- 📕 **`03_caso_estudio_wonka_digital.pdf`** — Planteamiento del problema y requerimientos del negocio.
- 🖼️ **`diagrama_ER.png`** — Diagrama Entidad-Relación del modelo de datos.

---

## 📜 Scripts SQL

| Archivo | Descripción |
|---------|-------------|
| `00_backup_completo_pgdump.sql` | Backup completo generado con `pg_dump` (estructura + datos) |
| `01_creacion_estructura.sql` | Creación de tablas, índices y vistas |
| `02_insercion_datos.sql` | Inserción masiva de datos (3.265 registros) |
| `03_consultas_ejemplos.sql` | Ejemplos de `SELECT`, `JOIN`, `UPDATE` y `DELETE` |

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
  <em>Universidad Nacional Experimental de las Telecomunicaciones e Informática</em>
</p>
