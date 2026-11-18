---
name: sk-analizar-campo-cartera-tecnica
type: skill
description: Analiza un campo de Cartera Técnica identificando su significado funcional, trazabilidad hacia REEF, reglas de cálculo, dependencias actuariales, entidades afectadas y riesgos asociados a modificaciones o migraciones.
domain: cartera-tecnica
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:cartera_tecnica
---

# Skill: Analizar Campo de Cartera Técnica

## Objetivo

Realizar un análisis completo de un campo de Cartera Técnica para determinar:

```text
Qué representa.
Cómo se obtiene.
Dónde se almacena.
Qué reglas de negocio aplica.
Qué cálculos intervienen.
Qué dependencias existen.
Qué impacto tiene una modificación.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Entender un campo funcional.
Investigar un dato incorrecto.
Analizar incidencias.
Documentar mappings.
Preparar migraciones.
Evaluar impactos funcionales.
```

---

# Entradas

## Campo de Cartera Técnica

Ejemplos:

```text
RD030006-EPNETA
RD030006-KAJUSTE
RD030006-KPOLIZA
RD030006-CASADA
RD030006-PINTER-TEC
RD030006-CTABMORTAL
RD030006-CMOTIVO-SUSCRI
```

---

## Opcional

Puede incluir:

```text
Tabla REEF.
Garantía.
Base técnica.
Modalidad.
Ramo.
```

---

# Objetivos del Análisis

La skill debe identificar:

```text
Significado funcional.
Origen.
Destino.
Transformaciones.
Dependencias.
Criticidad.
```

---

# Procedimiento

## Paso 1

Identificar el campo.

---

## Obtener

```text
Código.
Descripción.
Dominio funcional.
```

---

## Resultado

Ficha funcional básica.

---

# Paso 2

Clasificar el tipo de información

---

## Posibles categorías

### Identificación

Ejemplos:

```text
KPOLIZA
KCERTI
KSUSCRI
```

---

### Económica

Ejemplos:

```text
EPNETA
ECAPGAR
EPRIMINI-POL
```

---

### Actuarial

Ejemplos:

```text
PINTER-TEC
CTABMORTAL
CASADA
PGASTOS-INT
```

---

### Comercial

Ejemplos:

```text
OFICOMER
KINTER
CCANAL
```

---

### Estado

Ejemplos:

```text
CESTADO-POL
CESTADO-SUSCRI
CMOTIVO-SUSCRI
```

---

# Paso 3

Identificar trazabilidad

Construir el recorrido:

```text
Campo Cartera Técnica
↓
Tabla REEF
↓
Campo REEF
```

---

## Ejemplo

```text
RD030006-EPNETA
↓
RL_PLY_NWT_XX_SBN
↓
PRE_ANM
```

---

# Paso 4

Determinar origen del dato

---

## Posibles orígenes

```text
Dato persistido.
Dato calculado.
Dato derivado.
Dato fijo.
```

---

## Ejemplos

### Persistido

```text
COD_RAMO
COD_MODALIDAD
```

---

### Calculado

```text
NASEG-VIGOR
```

---

### Derivado

```text
CASADA
```

---

### Fijo

```text
ASEG-MECANIZADOS = S
```

---

# Paso 5

Analizar reglas de negocio

---

## Identificar

```text
Condiciones.
Parámetros.
Listas de valores.
Transformaciones.
```

---

## Ejemplos

### CASADA

```text
IT1 ≠ 0
y
IT2 ≠ 0

→ S
```

---

### FCOBRO

```text
TIP_FORMA_COB_XXX = U

→ 9
```

---

### CESTADO-POL

```text
MCA_INH = S

→ V
```

---

# Paso 6

Analizar dependencias

---

## Dependencias funcionales

```text
Póliza.
Garantía.
Prestación.
Modalidad.
Suscripción.
```

---

## Dependencias técnicas

```text
A2000011
A2000020
A2000030
RL_PLY_NWT_XX_SBN
G2990004
```

---

## Dependencias actuariales

```text
Base técnica.
Mortalidad.
Interés técnico.
Revalorización.
Capital.
```

---

# Paso 7

Analizar impacto

---

## Impacto Local

```text
Solo afecta una entidad.
```

---

## Impacto Funcional

```text
Afecta cálculos de negocio.
```

---

## Impacto Transversal

```text
Afecta múltiples procesos.
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
Campo económico.
```

---

## Crítica

```text
Identificador.
Base técnica.
Interés técnico.
Mortalidad.
Capital.
```

---

# Casos Especiales

## Campos Actuariales

Ejemplos:

```text
CTABMORTAL
PINTER-TEC
PGASTOS-INT
PGASTOS-EXT
```

---

## Validar

```text
Dependencias con JSON de ajustes.
Reglas actuariales.
Cálculos asociados.
```

---

# Campos Económicos

Ejemplos:

```text
EPNETA
ECAPGAR
EPRIMACT-TEORICA
```

---

## Validar

```text
Primas.
Capitales.
Importes.
```

---

# Campos de Estado

Ejemplos:

```text
CESTADO-POL
CESTADO-SUSCRI
CMOTIVO-SUSCRI
```

---

## Validar

```text
Estados vigentes.
Motivos.
Fechas.
```

---

# Salidas Esperadas

## Ficha del Campo

Incluye:

```text
Descripción.
Tipo.
Clasificación.
```

---

## Mapping

```text
Origen.
Destino.
Tabla.
Campo.
```

---

## Reglas de Negocio

Listado detallado.

---

## Dependencias

```text
Funcionales.
Técnicas.
Actuariales.
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
Campo
↓
Descripción
↓
Tabla REEF
↓
Campo REEF
↓
Reglas de negocio
↓
Dependencias
↓
Impacto
↓
Riesgos
↓
Recomendaciones
```

---

# Checklist

Verificar:

- [ ] Campo identificado.
- [ ] Significado funcional identificado.
- [ ] Tabla REEF identificada.
- [ ] Campo REEF identificado.
- [ ] Reglas de negocio documentadas.
- [ ] Dependencias identificadas.
- [ ] Criticidad evaluada.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Qué significa este campo?

¿De dónde se obtiene?

¿Dónde se almacena en REEF?

¿Qué cálculos lo utilizan?

¿Qué dependencias tiene?

¿Qué ocurre si cambia?

¿Es un campo crítico?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se comprende completamente el significado funcional del campo.
- Se identifica la trazabilidad hacia REEF.
- Se documentan las reglas de negocio asociadas.
- Se identifican todas las dependencias relevantes.
- Se evalúa correctamente la criticidad.
- El resultado permite analizar, migrar o modificar el campo con seguridad.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
