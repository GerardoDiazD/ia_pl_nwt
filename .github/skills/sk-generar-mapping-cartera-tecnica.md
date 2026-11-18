---
name: sk-generar-mapping-cartera-tecnica
type: skill
description: Genera especificaciones de mapping para Cartera Técnica identificando correspondencias entre campos funcionales, estructuras IDMS, entidades REEF, reglas de transformación, cálculos actuariales y dependencias de negocio.
domain: cartera-tecnica
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:cartera_tecnica
---

# Skill: Generar Mapping de Cartera Técnica

## Objetivo

Construir una especificación completa de mapping para datos de Cartera Técnica permitiendo la trazabilidad entre:

```text
Campo Funcional
↓
Origen IDMS
↓
REEF
↓
Reglas de Negocio
```

La finalidad es producir documentación reutilizable para:

```text
Migraciones.
Integraciones.
ETLs.
Procesos actuariales.
Validaciones funcionales.
Diseño técnico.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Migrar Cartera Técnica.
Diseñar una integración.
Documentar mappings.
Construir procesos ETL.
Actualizar especificaciones funcionales.
Auditar transformaciones.
```

---

# Entradas

## Documento Funcional

Ejemplo:

```text
Cartera Técnica.
Diseño funcional.
Catálogo de datos.
```

---

## Campo o grupo de campos

Ejemplos:

```text
Primas.
Capitales.
Prestaciones.
Suscripciones.
Garantías.
```

---

## Opcional

Puede incluir:

```text
Modalidad.
Garantía.
Prestación.
Producto.
Base técnica.
```

---

# Objetivos del Análisis

La skill debe determinar:

```text
Origen.
Destino.
Transformaciones.
Reglas de negocio.
Dependencias.
Validaciones.
```

---

# Procedimiento

## Paso 1

Inventariar campos de origen.

---

## Identificar

```text
Nombre funcional.
Descripción.
Clasificación.
```

---

## Clasificar

### Identificación

```text
KPOLIZA
KCERTI
KSUSCRI
```

### Actuarial

```text
PINTER-TEC
CTABMORTAL
CASADA
```

### Económica

```text
EPNETA
ECAPGAR
EPRIMINI-POL
```

### Estado

```text
CESTADO-POL
CESTADO-SUSCRI
```

---

# Paso 2

Identificar entidades REEF

---

## Determinar

```text
Tabla.
Campo.
Entidad funcional.
```

---

## Ejemplos

```text
A2000011
A2000020
A2000030
A2000100
RL_PLY_NWT_XX_SBN
G2990004
```

---

# Paso 3

Construir el mapping

---

## Formato

```text
Campo funcional
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

## Ejemplo

```text
RD030006-MODALI
↓
A2000011
↓
COD_MODALIDAD
```

---

# Paso 4

Identificar transformaciones

---

## Directas

Ejemplo:

```text
MODALI
↓
COD_MODALIDAD
```

---

## Derivadas

Ejemplo:

```text
CASADA
↓
IT1 e IT2
↓
Indicador S/N
```

---

## Calculadas

Ejemplo:

```text
NASEG-VIGOR
↓
COUNT asegurados vigentes
```

---

## Constantes

Ejemplo:

```text
ASEG-MECANIZADOS = S
```

---

## Blancos

Ejemplo:

```text
ESPACIOS
```

---

## Ceros

Ejemplo:

```text
0
000000
```

---

# Paso 5

Analizar reglas actuariales

---

## Interés Técnico

Campos:

```text
PINTER-TEC
NPERIODO-INTTEC
```

---

## Origen

```text
JSON de ajustes
```

---

## Campos asociados

```text
IT1
IT2
DT1
DT2
```

---

# Mortalidad

Campo:

```text
CTABMORTAL
```

---

## Origen

```text
JSON SBN_TCB_VAL
```

---

# Gastos

Campos:

```text
PGASTOS-INT
PGASTOS-EXT
```

---

## Origen

```text
GI
GIPC
GE
```

---

# Paso 6

Analizar reglas económicas

---

## Primas

```text
PRE_ANM
INL_PRE_ANM
```

---

## Capitales

```text
CPL_AMN
```

---

## Coaseguro

```text
TIP_COASEGURO
PARTICIPACION
```

---

# Paso 7

Analizar estados

---

## Estado Póliza

```text
CESTADO-POL
```

---

## Estado Suscripción

```text
CESTADO-SUSCRI
```

---

## Motivos

```text
CMOTIVO-POL
CMOTIVO-SUSCRI
```

---

# Paso 8

Detectar campos pendientes

---

## Clasificar

### No informado

```text
Sin origen conocido.
```

---

### Pendiente funcional

```text
Falta definición.
```

---

### Pendiente técnico

```text
Falta implementación.
```

---

### Pendiente actuarial

```text
Dependiente de base técnica.
```

---

# Paso 9

Generar matriz de mapping

---

## Formato esperado

```text
Campo Funcional
Descripción
Tabla REEF
Campo REEF
Transformación
Estado
Observaciones
```

---

# Validaciones

## Validación estructural

Verificar:

```text
Tabla existente.
Campo existente.
Entidad identificada.
```

---

## Validación funcional

Verificar:

```text
Regla conocida.
Origen identificable.
Destino identificable.
```

---

## Validación actuarial

Verificar:

```text
Bases técnicas.
Intereses.
Mortalidad.
Capitales.
```

---

# Riesgos

## Riesgo Crítico

Ejemplos:

```text
Interés técnico incorrecto.
Tabla mortalidad incorrecta.
Capital incorrecto.
```

---

## Riesgo Alto

Ejemplos:

```text
Primas incorrectas.
Prestaciones incorrectas.
Estados inconsistentes.
```

---

## Riesgo Medio

Ejemplos:

```text
Campos derivados mal calculados.
```

---

## Riesgo Bajo

Ejemplos:

```text
Campos informativos.
Valores constantes.
```

---

# Salidas Esperadas

## Matriz de Mapping

Completa.

---

## Campos Pendientes

Listado documentado.

---

## Reglas de Transformación

Detalladas.

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

Acciones necesarias antes de migrar o implementar.

---

# Formato de Respuesta Esperado

```text
Campo funcional
↓
Origen
↓
REEF
↓
Transformación
↓
Dependencias
↓
Validaciones
↓
Riesgos
```

---

# Checklist

Verificar:

- [ ] Campo identificado.
- [ ] Tabla identificada.
- [ ] Campo REEF identificado.
- [ ] Transformación documentada.
- [ ] Regla funcional documentada.
- [ ] Dependencia actuarial identificada.
- [ ] Campos pendientes detectados.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Dónde se almacena este dato en REEF?

¿Cómo se calcula?

¿Es un dato persistido o derivado?

¿Qué reglas actuariales intervienen?

¿Qué dependencias existen?

¿Qué riesgos tiene su migración?

¿Existe información pendiente de analizar?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Existe trazabilidad completa entre Cartera Técnica y REEF.
- Todas las transformaciones están documentadas.
- Las reglas actuariales son identificadas.
- Los cálculos derivados son comprendidos.
- Se documentan dependencias y riesgos.
- El resultado puede utilizarse directamente para migraciones, ETLs o integraciones.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
