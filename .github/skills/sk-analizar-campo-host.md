---
name: sk-analizar-campo-host
type: skill
description: Analiza un campo Host dentro de un layout BDM identificando su significado funcional, recorrido Host→IDMS→REEF, transformaciones asociadas, dependencias, calidad del mapping e impacto sobre procesos de migración.
domain: migracion-datos
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:BDM-Contratos
---

# Skill: Analizar Campo Host

## Objetivo

Realizar un análisis completo de un campo individual dentro de un layout Host para comprender:

```text
Qué representa.
Dónde se encuentra.
Cómo se transforma.
Qué tablas consume.
Qué procesos dependen de él.
Qué riesgos existen al modificarlo.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Entender un campo Host.
Investigar un problema de migración.
Analizar un mapping.
Resolver una incidencia funcional.
Documentar una integración.
Evaluar impacto de cambios.
```

---

# Entradas

## Campo Host

Ejemplos:

```text
GCLIDNI
GNOMCOMPLETO
CCONTRATO
MODAL
RAMO
KPRODUCTOR1
IPRIMNETACT
```

---

## Opcional

Puede incluir:

```text
Layout.
Entidad.
Tabla REEF.
Campo REEF.
Proceso funcional.
```

---

# Objetivos del Análisis

La skill debe identificar:

```text
Descripción funcional.
Tipo de dato.
Posición.
Origen.
Destino.
Transformaciones.
Dependencias.
Riesgos.
```

---

# Procedimiento

## Paso 1

Identificar el campo.

---

## Obtener

```text
Nombre.
Longitud.
Tipo.
Posición Host.
Posición ASCII.
```

---

## Resultado

Ficha técnica básica.

---

# Paso 2

Analizar significado funcional

---

## Determinar

Qué representa realmente el dato.

---

## Ejemplos

### GCLIDNI

```text
Documento identificativo.
```

---

### CCONTRATO

```text
Contrato compuesto.
```

---

### MODAL

```text
Modalidad de negocio.
```

---

### RAMO

```text
Ramo de negocio.
```

---

# Paso 3

Identificar recorrido del dato

---

## Trazabilidad

```text
Host
↓
IDMS
↓
REEF
```

---

## Resultado

Ruta completa de transformación.

---

# Paso 4

Identificar tabla destino

---

## Determinar

```text
Tabla REEF.
Campo REEF.
Entidad funcional.
```

---

## Ejemplos

```text
A2000011
A1001399
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
```

---

# Paso 5

Clasificar el mapping

---

## Directo

Ejemplo:

```text
RAMO
↓
COD_RAMO
```

---

## Transformado

Ejemplo:

```text
GNOMCOMPLETO
↓
Nombre + apellidos
```

---

## Compuesto

Ejemplo:

```text
CCONTRATO
↓
NUM_POLIZA_GRP + NUM_CONTRATO
```

---

## Pendiente

Ejemplo:

```text
KCLIENTE
```

---

# Paso 6

Identificar reglas de transformación

---

## Posibles reglas

### Conversión

```text
Texto a fecha.
Texto a número.
COMP-3 a NUMBER.
```

---

### Fragmentación

```text
Un origen.
Varios destinos.
```

---

### Agregación

```text
Varios valores.
Un destino.
```

---

### Valor fijo

```text
V
AG
00000000
```

---

# Paso 7

Identificar dependencias

---

## Dependencias funcionales

```text
Tomadores.
Pólizas.
Agentes.
Coberturas.
Modalidades.
```

---

## Dependencias técnicas

```text
Tablas.
ETLs.
Interfaces.
Procesos batch.
```

---

# Paso 8

Evaluar criticidad

---

## Baja

```text
Campo informativo.
```

---

## Media

```text
Campo operativo.
```

---

## Alta

```text
Campo utilizado en cálculos.
```

---

## Crítica

```text
Identificador principal.
Clave de negocio.
Campo contractual.
```

---

# Casos Especiales

## Identificadores

Ejemplos:

```text
GCLIDNI
COD_DOCUM
KCLIENTE
```

---

## Evaluación

Impacto máximo si se modifica.

---

# Campos Contractuales

Ejemplos:

```text
CCONTRATO
RAMO
MODAL
```

---

## Evaluación

Afectan:

```text
Pólizas.
Coberturas.
Modalidades.
```

---

# Campos Económicos

Ejemplos:

```text
IPRIMNETACT
PROVIS-MATEM
SUMA-APORT
```

---

## Evaluación

Afectan:

```text
Cálculos.
Reportes.
Migraciones.
```

---

# Campos Pendientes

Si el campo aparece como:

```text
Sin mapping REEF confirmado.
```

---

## Clasificar

### En estudio

```text
Existe descripción funcional.
```

---

### Pendiente

```text
Información insuficiente.
```

---

# Salidas Esperadas

## Ficha del Campo

Incluye:

```text
Tipo.
Longitud.
Posición.
Descripción.
```

---

## Mapeo

```text
Host.
IDMS.
REEF.
```

---

## Transformaciones

Listado detallado.

---

## Dependencias

Funcionales y técnicas.

---

## Riesgos

Clasificados por criticidad.

---

## Recomendaciones

Acciones para modificación o migración.

---

# Formato de Respuesta Esperado

```text
Campo
↓
Descripción
↓
Host
↓
IDMS
↓
REEF
↓
Transformaciones
↓
Dependencias
↓
Riesgos
↓
Recomendaciones
```

---

# Checklist

Verificar:

- [ ] Campo identificado.
- [ ] Origen identificado.
- [ ] Destino identificado.
- [ ] Tabla identificada.
- [ ] Transformaciones identificadas.
- [ ] Dependencias identificadas.
- [ ] Criticidad calculada.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Qué representa este campo?

¿Dónde se almacena en REEF?

¿Qué transformación necesita?

¿Es un campo crítico?

¿Qué procesos dependen de él?

¿Qué ocurrirá si cambia?

¿Existen incertidumbres en el mapping?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se documenta completamente el ciclo de vida del campo.
- Se identifica la trazabilidad Host → IDMS → REEF.
- Se conocen las transformaciones aplicables.
- Se identifican todas las dependencias relevantes.
- Se evalúa correctamente el riesgo funcional y técnico.
- El resultado permite tomar decisiones seguras sobre migración, integración o mantenimiento.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
