---
name: sk-catalogo-suplementos-reef
type: skill
version: 1.1
description: Consulta, interpreta y documenta el catálogo corporativo de suplementos REEF definido en A2991800, proporcionando descripciones funcionales, clasificación de negocio y contexto operativo.
domain: suplementos
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - suplemento
  - descripcion
  - categoria
  - contexto_funcional
  - observaciones

tags:
  - reef
  - suplementos
  - catalogo
  - a2991800
  - conocimiento
  - documentacion
---

# Objetivo

Proporcionar una capa de conocimiento sobre el catálogo corporativo de suplementos REEF.

Esta skill permite responder preguntas como:

```text
¿Qué significa AT?

¿Qué es un suplemento RE?

¿Cuándo se utiliza RF?

¿Qué suplementos existen en REEF?

¿Qué categoría funcional tiene CA?
```

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite:

```text
Consultar un suplemento.

Documentar integraciones.

Analizar procesos.

Resolver incidencias funcionales.

Generar documentación.

Comprender el catálogo corporativo.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Validar suplementos.

Transformar operaciones IDMS.

Convertir suplementos.

Persistir datos.

Modificar parametrización.
```

---

# Fuente de Información

Catálogo corporativo:

```text
A2991800
```

---

# Capacidades

## Consultar Suplemento

Obtiene la información asociada a un tipo de suplemento.

---

### Entrada

```yaml
tipoSuplemento: AT
```

---

### Resultado

```yaml
tipo: AT

descripcion: ANULACION

categoria: ANULACION
```

---

### Entrada

```yaml
tipoSuplemento: RE
```

---

### Resultado

```yaml
tipo: RE

descripcion: REHABILITACION

categoria: REHABILITACION
```

---

# Obtener Descripción Funcional

Traduce un código técnico a lenguaje de negocio.

---

### Entrada

```yaml
tipoSuplemento: RF
```

---

### Resultado

```yaml
descripcion: RENOVACION MANUAL
```

---

### Entrada

```yaml
tipoSuplemento: CA
```

---

### Resultado

```yaml
descripcion: CAMBIO AGENTE
```

---

# Obtener Categoría Funcional

Agrupa suplementos por finalidad de negocio.

---

### Categorías

```text
ALTA

ANULACION

REHABILITACION

RENOVACION

CAMBIO_ADMINISTRATIVO

CAPITAL

FONDOS

GENERAL
```

---

### Entrada

```yaml
tipoSuplemento: CV
```

---

### Resultado

```yaml
categoria: CAMBIO_ADMINISTRATIVO
```

---

### Entrada

```yaml
tipoSuplemento: MV
```

---

### Resultado

```yaml
categoria: RENOVACION
```

---

# Explicar Uso Funcional

Proporciona contexto de utilización.

---

### Entrada

```yaml
tipoSuplemento: AT
```

---

### Resultado

```yaml
uso:
  - anulaciones
  - cancelaciones
  - rescates totales
```

---

### Entrada

```yaml
tipoSuplemento: RE
```

---

### Resultado

```yaml
uso:
  - rehabilitacion
  - reactivacion certificada
```

---

# Catálogo Corporativo

## AE

```text
Alta especial.
```

---

### Categoría

```text
ALTA
```

---

## AS

```text
Anulación de suplementos.
```

---

### Categoría

```text
ANULACION
```

---

## AT

```text
Anulaciones.
```

---

### Categoría

```text
ANULACION
```

---

## CA

```text
Cambio agente.
```

---

### Categoría

```text
CAMBIO_ADMINISTRATIVO
```

---

## CV

```text
Cambio forma de pago.
```

---

### Categoría

```text
CAMBIO_ADMINISTRATIVO
```

---

## DS

```text
Disminución por siniestro.
```

---

### Categoría

```text
CAPITAL
```

---

## ER

```text
Extinción riesgo.
```

---

### Categoría

```text
ANULACION
```

---

## IN

```text
General.
```

---

### Categoría

```text
GENERAL
```

---

## MV

```text
Extensión vigencia.
```

---

### Categoría

```text
RENOVACION
```

---

## RC

```text
Restitución capital.
```

---

### Categoría

```text
CAPITAL
```

---

## RE

```text
Rehabilitación.
```

---

### Categoría

```text
REHABILITACION
```

---

## RF

```text
Renovación manual.
```

---

### Categoría

```text
RENOVACION
```

---

# Suplementos de Fondos

La skill reconoce específicamente:

```text
Cambio Fondo.

Asignación UPS.

Rescate Parcial.

Rescate Total.

Aportación Pactada.

Aportación Extraordinaria.

Regularización Mensual.

Suspensión de Aportaciones.
```

---

### Categoría

```text
FONDOS
```

---

# Agrupaciones Funcionales

## Altas

```text
AE
XX
```

---

## Anulaciones

```text
AS
AT
ER
```

---

## Rehabilitaciones

```text
RE
```

---

## Renovaciones

```text
RF
MV
```

---

## Cambios Administrativos

```text
CA
CV
```

---

## Operaciones Generales

```text
IN
```

---

## Capitales

```text
RC
DS
```

---

## Operaciones sobre Fondos

```text
29
30
31
34
35
36
37
38
```

---

# Consultas Frecuentes

## ¿Qué significa AT?

Respuesta:

```text
Suplemento de anulación.
```

---

## ¿Qué significa RE?

Respuesta:

```text
Suplemento de rehabilitación.
```

---

## ¿Qué significa RF?

Respuesta:

```text
Renovación manual.
```

---

## ¿Qué significa CA?

Respuesta:

```text
Cambio de agente.
```

---

## ¿Qué significa CV?

Respuesta:

```text
Cambio de forma de pago.
```

---

# Observaciones

## Estado Actual

Actualmente los procesos estándar utilizan principalmente:

```text
XX

AT

IN
```

---

## Evolución

El resto de suplementos existen en catálogo pero pueden depender de:

```text
Parametrización.

Producto.

Ramo.

Proceso específico.
```

---

# Salidas

## suplemento

Información básica del suplemento solicitado.

---

## descripcion

Descripción funcional.

---

## categoria

Clasificación funcional.

---

## contexto_funcional

Explicación de uso de negocio.

---

## observaciones

Condiciones especiales y notas relevantes.

---

# Caso 1

Entrada:

```yaml
tipoSuplemento: AT
```

Resultado:

```yaml
descripcion: ANULACION

categoria: ANULACION

uso:
  - cancelacion
  - rescate total
  - anulacion
```

---

# Caso 2

Entrada:

```yaml
tipoSuplemento: RF
```

Resultado:

```yaml
descripcion: RENOVACION MANUAL

categoria: RENOVACION
```

---

# Caso 3

Entrada:

```yaml
tipoSuplemento: CA
```

Resultado:

```yaml
descripcion: CAMBIO AGENTE

categoria: CAMBIO_ADMINISTRATIVO
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Se conoce el significado funcional del suplemento.
- Se identifica su categoría de negocio.
- Se comprende cuándo debe utilizarse.
- Se dispone de una descripción homogénea para documentación e integraciones.
- Se facilita el análisis funcional de procesos REEF relacionados con suplementos.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
