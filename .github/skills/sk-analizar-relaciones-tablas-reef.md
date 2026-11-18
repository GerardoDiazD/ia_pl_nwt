---
name: sk-analizar-relaciones-tablas-reef
type: skill
description: Analiza relaciones físicas y lógicas de tablas REEF mediante dependencias Oracle, resolución de sinónimos y análisis de paquetes de acceso a datos.
domain: database
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-descubrir-relaciones-bbdd-reef.md
---

# Skill: Analizar Relaciones de Tablas REEF

## Objetivo

Identificar el ecosistema de datos de una tabla REEF a partir de:

- Relaciones físicas.
- Dependencias Oracle.
- Sinónimos.
- Paquetes de acceso a datos.
- Tablas puente.
- Relaciones funcionales detectadas por navegación de código.

El objetivo es descubrir qué tablas participan realmente en un proceso funcional y cómo se encuentran conectadas.

Esta skill corresponde al Paso 1 del flujo y no debe generar diagramas.

---

## Cuándo utilizar esta skill

Utilizar cuando sea necesario:

- Analizar una tabla funcional REEF.
- Entender el modelo de datos de un proceso.
- Localizar tablas relacionadas.
- Identificar navegación entre entidades.
- Analizar impacto en base de datos.
- Preparar un modelo ER.
- Entender dependencias funcionales.

---

## Conocimiento requerido

Aplicar:

```text
inst-descubrir-relaciones-bbdd-reef
```

durante todo el análisis.

---

## Entrada

### Tabla origen

Ejemplos:

```text
A1001332
A1001399
A2000011
A2000030
A2000060
G2990017
```

Tabla por defecto si no se especifica:

```text
A1001332 (owner TRON2000)
```

---

## Procedimiento

Regla obligatoria:

```text
Seguir el orden definido en la instruccion inst-descubrir-relaciones-bbdd-reef sin derivaciones ni iteraciones.
```

### Paso 1. Identificar relaciones físicas

Localizar:

```text
Foreign Keys entrantes
Foreign Keys salientes
```

Clasificar:

```text
Tabla Padre
Tabla Hija
```

Generar inventario de relaciones físicas.

---

### Paso 2. Obtener dependencias directas

Analizar:

```text
ALL_DEPENDENCIES
```

Objetivo:

```text
Views dependientes
Packages dependientes
Sinónimos dependientes
```

---

### Paso 3. Detectar paquetes de acceso

Analizar:

```text
ALL_SOURCE
```

Localizar:

```text
Paquetes DL_*
Paquetes TRN_*
Paquetes de integración
```

que referencien directamente la tabla.

---

### Paso 4. Descubrir tablas puente

Para cada paquete identificado:

Analizar dependencias de:

```text
PACKAGE BODY
```

Filtrar únicamente:

```text
TABLE
```

Objetivo:

```text
Identificar navegación funcional.
Identificar tablas asociadas.
```

---

### Paso 5. Resolver sinónimos

Traducir:

```text
NWT_DL.*
NWT_IL.*
```

a:

```text
tabla física final
```

El resultado debe trabajar únicamente con tablas físicas.

---

### Paso 6. Clasificar tablas encontradas

Separar en grupos:

#### Tablas TRON2000

Ejemplos:

```text
A1001332
A1001399
A2000011
```

---

#### Tablas DF_THP_NWT_XX_*

Ejemplos:

```text
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
```

---

#### Tablas RL_THP_NWT_XX_*

Ejemplos:

```text
RL_THP_NWT_XX_SBN
RL_THP_NWT_XX_TRC
```

---

### Paso 7. Obtener claves primarias

Para cada tabla encontrada identificar:

```text
Primary Key
```

Generar:

```text
Tabla
Columnas PK
```

---

### Paso 8. Identificar paquetes puente

Detectar paquetes que conecten funcionalmente varias entidades.

Ejemplo:

```text
DL_THP_PERSON
```

Relacionando:

```text
A1001399
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
```

---

### Paso 9. Clasificar relaciones

Determinar:

#### Físicas

Basadas en:

```text
Foreign Keys
```

---

#### Lógicas

Basadas en:

```text
Dependencias Oracle
Paquetes
Consultas
Navegación funcional
```

---

## Salidas

La skill debe generar obligatoriamente:

### Tablas TRON2000

```text
tabla1, tabla2, tabla3
```

---

### Tablas DF_THP_NWT_XX_*

```text
tabla1, tabla2
```

---

### Tablas RL_THP_NWT_XX_*

```text
tabla1, tabla2
```

---

### Claves primarias

Formato:

```text
Tabla | PK
```

Ejemplo:

```text
A1001399 | COD_CIA, TIP_DOCUM, COD_DOCUM
```

---

### Paquetes puente

Formato:

```text
Paquete | Tablas relacionadas
```

Ejemplo:

```text
DL_THP_PERSON | A1001399, DF_THP_NWT_XX_ADR
```

---

### Resumen de relaciones físicas

Formato:

```text
Tabla origen
Tabla destino
Tipo
```

---

### Resumen de relaciones lógicas

Formato:

```text
Tabla origen
Tabla destino
Paquete puente
```

---

## Restricciones

No generar:

```text
Diagramas ER
Mermaid
Representaciones gráficas
```

No ejecutar:

```text
Busquedas iterativas
Consultas fuera del orden obligatorio
Profundidad mayor a 3 saltos
```

No superar:

```text
3 niveles de dependencia
```

No devolver:

```text
Sinónimos sin resolver
Objetos fuera del alcance definido
```

---

## Preguntas que esta skill debe responder

```text
¿Qué tablas están relacionadas con esta entidad?

¿Existen relaciones físicas?

¿Qué paquetes utilizan esta tabla?

¿Qué tablas se utilizan conjuntamente?

¿Cómo navega funcionalmente el sistema entre estas entidades?

¿Qué tablas puente existen?
```

---

## Definición de éxito

La skill se considera completada cuando:

- Se identifican relaciones físicas.
- Se identifican relaciones lógicas.
- Se resuelven los sinónimos.
- Se identifican las tablas funcionalmente relacionadas.
- Se obtienen las claves primarias.
- Se detectan paquetes puente.
- Se genera un inventario completo en una sola salida tabular reutilizable por la skill de diagrama ER.