---
name: sk-analizar-modalidades-tron
type: skill
description: Analiza modalidades de negocio dentro del repositorio reef-vida-bkesp-tron_cmn identificando scripts, tablas, configuraciones, dependencias funcionales, relaciones entre módulos e impacto de cambios sobre una modalidad específica.
domain: tron
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-tron-cmn.md
  knowledge:
    - rag:kb-tron-cmn-repositorio
    - rag:kb-tron-cmn-carga-ramo-118
    - rag:kb-tron-cmn-modalidades-118
---

# Skill: Analizar Modalidades TRON

## Objetivo

Analizar una modalidad funcional dentro del ecosistema:

```text
reef-vida-bkesp-tron_cmn
```

para determinar:

```text
Dónde se configura.
Qué tablas participan.
Qué scripts la cargan.
Qué coberturas utiliza.
Qué módulos dependen de ella.
Cuál es el riesgo de modificación.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Analizar una modalidad.
Modificar una modalidad existente.
Migrar modalidades.
Crear nuevas compañías.
Evaluar impacto funcional.
Investigar incidencias.
```

---

# Entradas

## Modalidad

Ejemplos:

```text
73
307
308
309
316
401
404
407
410
419
507
516
660
901
916
99999
40098
40099
40700
```

---

## Opcional

Puede incluir:

```text
Compañía.
Ramo.
Bloque funcional.
```

---

# Objetivos del Análisis

La skill debe identificar:

```text
Configuración asociada.
Scripts implicados.
Tablas afectadas.
Dependencias funcionales.
Dependencias técnicas.
Riesgo de modificación.
```

---

# Procedimiento

## Paso 1

Identificar la modalidad objetivo.

---

## Clasificación

Determinar si la modalidad es:

```text
Producto principal.
Modalidad especial.
Modalidad técnica.
Modalidad transversal.
```

---

## Resultado

Descripción general de la modalidad.

---

# Paso 2

Localizar scripts relacionados

Buscar referencias en:

```text
COD_MODALIDAD
MCA_MODALIDAD
TIP_FORMACION_MODALIDAD
```

---

## Scripts analizados

Buscar en:

```text
RAMO_01
RAMO_02
RAMO_04
RAMO_99
```

---

## Resultado

Listado completo de scripts que contienen referencias a la modalidad.

---

# Paso 3

Identificar tablas afectadas

Determinar qué tablas utilizan la modalidad.

---

## Ejemplos habituales

```text
A1002150
A2100300
A2300102
G2000020
G2000180
G2000190
G2990006
```

---

## Clasificar impacto

```text
Directo.
Indirecto.
Transversal.
```

---

# Paso 4

Identificar configuración funcional

Analizar si la modalidad participa en:

```text
Productos.
Coberturas.
Comisiones.
Eventos.
Fraccionamiento.
Campos funcionales.
```

---

## Resultado

Mapa funcional de la modalidad.

---

# Paso 5

Identificar coberturas

Buscar relación con:

```text
G2000180
G2000190
G2000200
G2000275
```

---

## Determinar

```text
Coberturas disponibles.
Articulación.
Excepciones.
```

---

# Paso 6

Identificar dependencias en emisión

Analizar:

```text
RAMO_01
```

---

## Verificar

```text
Productos.
Modalidades.
Tasas.
Comisiones.
Campos.
```

---

# Paso 7

Identificar dependencias en siniestros

Analizar:

```text
RAMO_02
RAMO_05
```

---

## Verificar

```text
Expedientes.
Reservas.
Garantías.
Liquidaciones.
```

---

# Paso 8

Identificar dependencias transversales

Analizar:

```text
RAMO_99
```

---

## Verificar

```text
Listas de valores.
Diccionarios.
Parámetros comunes.
Configuración global.
```

---

# Paso 9

Evaluar criticidad

---

## Baja

```text
Uso limitado.
Configuración aislada.
```

---

## Media

```text
Modalidad utilizada por un único producto.
```

---

## Alta

```text
Modalidad con coberturas activas.
Procesos dependientes.
```

---

## Crítica

```text
Modalidad transversal.
Parametrización corporativa.
Dependencias múltiples.
```

---

# Análisis de Modificación

Cuando se analiza una modificación verificar:

```text
Tablas afectadas.
Scripts afectados.
Procesos afectados.
Integraciones afectadas.
```

---

## Detectar

```text
Riesgos de emisión.
Riesgos de siniestros.
Riesgos de despliegue.
```

---

# Análisis de Migración

Cuando la modalidad forme parte de una migración:

---

## Verificar

```text
Presencia en MIG_ALCANCE_MODALIDAD.
```

---

## Identificar

```text
Objetos migrables.
Objetos no migrables.
Dependencias externas.
```

---

## Resultado

Plan de migración por modalidad.

---

# Salidas Esperadas

## Resumen de Modalidad

Formato:

```text
Código.
Descripción.
Clasificación.
```

---

## Scripts Asociados

Listado completo.

---

## Tablas Asociadas

Listado completo.

---

## Coberturas Asociadas

Listado identificado.

---

## Dependencias

```text
Técnicas.
Funcionales.
Transversales.
```

---

## Riesgos

Clasificados por criticidad.

---

## Recomendaciones

Acciones previas a cualquier modificación.

---

# Formato de Respuesta Esperado

```text
Modalidad
↓
Scripts implicados
↓
Tablas implicadas
↓
Coberturas
↓
Dependencias
↓
Riesgos
↓
Recomendaciones
```

---

# Checklist de Análisis

Verificar:

- [ ] Modalidad identificada.
- [ ] Scripts identificados.
- [ ] Tablas identificadas.
- [ ] Coberturas identificadas.
- [ ] Dependencias identificadas.
- [ ] Riesgos evaluados.
- [ ] Impacto funcional documentado.
- [ ] Impacto técnico documentado.

---

# Preguntas que esta Skill debe responder

```text
¿Qué configura esta modalidad?

¿Dónde se encuentra definida?

¿Qué scripts la utilizan?

¿Qué productos dependen de ella?

¿Qué coberturas están asociadas?

¿Qué ocurrirá si la modifico?

¿Puede migrarse a otra compañía?

¿Cuál es su nivel de criticidad?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se identifican todos los artefactos relacionados con la modalidad.
- Se documentan las dependencias funcionales y técnicas.
- Se identifican los módulos afectados.
- Se evalúa el riesgo de modificación o migración.
- Se proporciona una visión completa de la modalidad dentro del ecosistema TRON.
- El resultado permite tomar decisiones informadas sobre mantenimiento, despliegue o migración.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
