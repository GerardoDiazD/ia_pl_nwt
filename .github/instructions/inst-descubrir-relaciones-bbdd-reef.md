---
name: inst-descubrir-relaciones-bbdd-reef
type: instruction
description: Instrucciones para analizar relaciones físicas y lógicas de tablas REEF mediante dependencias Oracle, resolución de sinónimos y detección de paquetes puente.
domain: database
version: 1.1
owner: arquitectura-reef
---

# Instrucción: Descubrimiento de Relaciones BBDD REEF

## Objetivo

Identificar todas las relaciones físicas y lógicas de una tabla REEF utilizando metadatos Oracle, dependencias de objetos, sinónimos y paquetes de acceso a datos.

El análisis debe producir una visión completa de las tablas asociadas y de los puntos de navegación funcional existentes en la plataforma.

Modo de ejecucion estricto:

- no iterar ni abrir nuevas busquedas fuera del plan,
- ejecutar una sola ronda de descubrimiento,
- respetar orden de consultas,
- limitar profundidad a 3 saltos maximo.

---

# Alcance

Aplicable a:

```text
TRON2000
NWT_DL
NWT_IL
```

y cualquier tabla funcional REEF.

Ejemplos:

```text
A1001332
A1001399
A2000011
A2000030
A2000060
G2990017
```

---

# Reglas Generales

## Análisis único

Realizar una única extracción controlada.

No ejecutar:

```text
Búsquedas iterativas.
Búsquedas recursivas abiertas.
Exploraciones sin control.
```

---

## Profundidad máxima

Limitar el análisis a:

```text
3 niveles de dependencia
```

No superar este límite.

---

## Tipos de objetos incluidos

Incluir:

```text
TABLE
VIEW
SYNONYM
PACKAGE
PACKAGE BODY
```

Excluir otros tipos de objeto salvo indicación explícita.

---

## Owners válidos

Analizar objetos pertenecientes a:

```text
TRON2000
NWT_DL
NWT_IL
```

No restringir la búsqueda únicamente a TRON2000.

---

## Resolución obligatoria de sinónimos

Todos los sinónimos detectados deben resolverse hasta la tabla física final.

Ejemplo:

```text
NWT_DL.A1001332
↓
TRON2000.A1001332
```

El resultado final siempre debe presentar la tabla física real.

---

# Clasificación de Relaciones

## Relaciones físicas

Son relaciones definidas mediante:

```text
Foreign Keys
Constraint Type = R
```

Representan dependencias estructurales reales de base de datos.

---

## Relaciones lógicas

Son relaciones inferidas mediante:

```text
Packages
Views
Dependencias Oracle
Accesos compartidos
Columnas de cruce
```

Representan relaciones funcionales.

---

# Procedimiento de Descubrimiento

Tabla base por defecto:

```text
A1001332 (owner TRON2000)
```

Si se recibe otra tabla base, sustituirla sin alterar el orden del procedimiento.

## Orden obligatorio de busquedas (sin derivaciones)

1. Claves foraneas fisicas:

- `ALL_CONSTRAINTS` con `(owner='TRON2000' AND table_name=:tabla_base AND constraint_type='R')`
- `ALL_CONSTRAINTS` con `(r_owner='TRON2000' AND r_table_name=:tabla_base AND constraint_type='R')`

2. Dependencias directas:

- `ALL_DEPENDENCIES` con `(referenced_name=:tabla_base AND referenced_owner='TRON2000')`
- `ALL_DEPENDENCIES` con `(referenced_name=:tabla_base AND referenced_owner IN ('NWT_DL','NWT_IL'))`

3. Paquetes que tocan la tabla base:

- `ALL_SOURCE` con `(owner='NWT_DL' AND text LIKE '%:tabla_base%')`

4. Dependencias de paquetes puente detectados:

- `ALL_DEPENDENCIES` con `(owner='NWT_DL' AND name=:paquete AND type='PACKAGE BODY')`
- filtrar solo `referenced_type='TABLE'` y owners `TRON2000, NWT_DL, NWT_IL`

5. Resolucion de sinonimos:

- `ALL_SYNONYMS` con `(owner IN ('NWT_DL','NWT_IL'))`

## Paso 1. Relaciones físicas

Identificar claves foráneas donde la tabla sea:

### Tabla hija

```text
constraint_type = 'R'
owner = tabla_origen
```

---

### Tabla padre

```text
constraint_type = 'R'
r_owner = tabla_origen
```

---

## Paso 2. Dependencias directas

Identificar objetos que dependan directamente de la tabla objetivo.

Fuentes:

```text
ALL_DEPENDENCIES
```

Considerar propietarios:

```text
TRON2000
NWT_DL
NWT_IL
```

---

## Paso 3. Detección de paquetes de acceso

Identificar paquetes que referencien la tabla de forma explícita.

Fuentes:

```text
ALL_SOURCE
```

Objetivo:

```text
Detectar paquetes DL
Detectar paquetes TRN
Detectar paquetes de integración
```

---

## Paso 4. Dependencias de paquetes

Para cada paquete detectado:

Identificar únicamente:

```text
Referenced Type = TABLE
```

Considerar:

```text
TRON2000
NWT_DL
NWT_IL
```

Objetivo:

```text
Descubrir tablas puente.
Descubrir navegación funcional.
```

---

## Paso 5. Resolución de sinónimos

Mapear todos los sinónimos encontrados hacia:

```text
Tabla física final.
```

Nunca presentar únicamente el nombre del sinónimo.

---

# Clasificación de Tablas

Agrupar el resultado final en:

---

## Tablas funcionales TRON2000

Ejemplo:

```text
A1001332
A1001399
A2000011
```

---

## Tablas DF_THP_NWT_XX_*

Tablas de información especializada.

Ejemplo:

```text
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
```

---

## Tablas RL_THP_NWT_XX_*

Tablas de relación.

Ejemplo:

```text
RL_THP_NWT_XX_TRC
RL_THP_NWT_XX_SBN
```

---

# Obtención de Claves Primarias

Para cada tabla encontrada identificar:

```text
Primary Key
```

El resultado debe mostrar:

```text
tabla | columnas_pk
```

Ejemplo:

```text
A1001399 | COD_CIA, TIP_DOCUM, COD_DOCUM
```

---

# Identificación de Paquetes Puente

Para cada paquete detectado mostrar:

```text
nombre_paquete
tablas_relacionadas
```

Ejemplo:

```text
DL_THP_PERSON
A1001399, DF_THP_NWT_XX_ADR, DF_THP_NWT_XX_CNT
```

---

# Formato de Respuesta Obligatorio

La salida de Paso 1 debe entregarse en una sola respuesta y en formato tabular/listado, sin narrativas.

Formato exacto requerido:

1. Lista de tablas TRON2000: lista separada por comas.
2. Lista de tablas DF_THP_NWT_XX_*: lista separada por comas.
3. Lista de tablas RL_THP_NWT_XX_*: lista separada por comas.
4. Tabla de columnas PK por tabla: `tabla | pk1, pk2, ...`.
5. Paquetes NWT_DL puente: `paquete | tablas_que_toca`.

## Tablas TRON2000

```text
Tabla1
Tabla2
Tabla3
```

---

## Tablas DF_THP_NWT_XX

```text
Tabla1
Tabla2
```

---

## Tablas RL_THP_NWT_XX

```text
Tabla1
Tabla2
```

---

## Claves Primarias

```text
Tabla | PK
```

---

## Paquetes Puente

```text
Paquete | Tablas
```

---

# Restricciones

No generar:

```text
Diagramas
Explicaciones extensas
Narrativas funcionales
```

No ejecutar:

```text
Busquedas iterativas
Nuevas consultas fuera del orden definido
Profundidad mayor a 3 saltos
```

No realizar:

```text
Análisis recursivos ilimitados
Búsquedas abiertas
Exploraciones fuera del alcance definido
```

No devolver:

```text
Sinónimos sin resolver
Objetos fuera de TRON2000/NWT_DL/NWT_IL
```

---

# Definición de Éxito

La instrucción se considera cumplida cuando:

- Se identifican relaciones físicas.
- Se identifican relaciones lógicas.
- Se resuelven todos los sinónimos.
- Se localizan paquetes puente.
- Se obtienen las claves primarias.
- Las tablas quedan clasificadas por tipo.
- La salida queda en un unico bloque tabular utilizable para generar ER.
- El resultado puede utilizarse como entrada para un análisis ER posterior.