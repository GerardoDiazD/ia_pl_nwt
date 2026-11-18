---
name: sk-validar-layout-bdm
type: skill
description: Valida layouts BDM Host, sus mapeos hacia IDMS y REEF, detectando inconsistencias estructurales, errores de transformación, campos sin correspondencia, problemas de longitud y riesgos de migración.
domain: migracion-datos
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:BDM-Contratos
---

# Skill: Validar Layout BDM

## Objetivo

Analizar un layout Host y su especificación de mapping para verificar que la trazabilidad:

```text
Host
↓
IDMS
↓
REEF
```

es consistente, completa y técnicamente implementable.

La validación debe detectar:

```text
Campos sin mapping.
Longitudes incompatibles.
Transformaciones incompletas.
Inconsistencias funcionales.
Campos ambiguos.
Riesgos de migración.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Revisar una especificación de mapping.
Auditar un documento BDM.
Preparar una migración.
Validar una carga de datos.
Analizar calidad de un layout.
```

---

# Entradas

## Layout Host

Ejemplo:

```text
Campo.
Posición.
Longitud.
Tipo.
Descripción.
```

---

## Mapping Host → IDMS → REEF

Ejemplo:

```text
Campo Host.
Campo IDMS.
Tabla REEF.
Campo REEF.
```

---

## Documento Funcional

Opcionalmente:

```text
Análisis funcional.
Diseño técnico.
Documento de migración.
```

---

# Procedimiento

## Paso 1

Validar estructura Host.

---

## Verificar

```text
Posiciones.
Longitudes.
Solapamientos.
Huecos.
Tipos de dato.
```

---

## Detectar

```text
Posiciones duplicadas.
Campos fuera de rango.
Longitudes inconsistentes.
```

---

# Paso 2

Validar tipos de datos.

---

## Verificar

Compatibilidad entre:

```text
Host.
IDMS.
REEF.
```

---

## Ejemplos

### Fecha

```text
YYYYMMDD
↓
DATE
```

---

### Numérico

```text
COMP-3
↓
NUMBER
```

---

### Texto

```text
X(n)
↓
VARCHAR2
```

---

# Paso 3

Validar correspondencias

---

## Verificar

Que cada campo posea:

```text
Origen.
Destino.
Regla funcional.
```

---

## Clasificar

### Confirmado

```text
Mapping completo.
```

---

### Parcial

```text
Destino incompleto.
```

---

### Sin Mapping

```text
No existe correspondencia.
```

---

# Paso 4

Validar tablas REEF

---

## Verificar

Existencia de:

```text
Tabla.
Campo.
Entidad funcional.
```

---

## Ejemplos

```text
A2000011
A2000012
A1001399
A1001331
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
DF_THP_NWT_XX_PCM
```

---

# Paso 5

Validar transformaciones

---

## Transformación directa

Ejemplo:

```text
RAMO
↓
COD_RAMO
```

---

## Transformación compuesta

Ejemplo:

```text
CCONTRATO
↓
NUM_POLIZA_GRP
NUM_CONTRATO
```

---

## Transformación fragmentada

Ejemplo:

```text
GNOMCOMPLETO
↓
Nombre
Apellido1
Apellido2
```

---

## Detectar

```text
Transformaciones no documentadas.
Reglas incompletas.
```

---

# Paso 6

Validar valores constantes

---

## Ejemplos conocidos

```text
SECTOR = V

FULTSPTO = 00000000

CINTERVEN1 = AG

CINTERVEN2 = AG

CINTERVEN3 = AG

CINTERVEN4 = AG
```

---

## Verificar

```text
Coherencia.
Consistencia.
Documentación.
```

---

# Paso 7

Validar campos ambiguos

---

## Casos típicos

```text
GPAIS
KCLIENTE
CLINEANEG
REVAL-PENS
RENTA-ACTUAL
TIPO-FONDO
```

---

## Clasificar

### Ambiguo

```text
Existe significado pero no destino.
```

---

### Pendiente

```text
No existe diseño definitivo.
```

---

# Paso 8

Evaluar completitud

---

## Calcular

Porcentaje de:

```text
Campos mapeados.
Campos parciales.
Campos pendientes.
```

---

## Resultado

```text
Cobertura de mapping.
```

---

# Análisis de Riesgo

## Crítico

Ejemplos:

```text
Campo obligatorio sin mapping.
Campo clave sin destino.
```

---

## Alto

Ejemplos:

```text
Transformación no definida.
Campos ambiguos de negocio.
```

---

## Medio

Ejemplos:

```text
Campo auxiliar pendiente.
```

---

## Bajo

Ejemplos:

```text
Observaciones documentales.
```

---

# Salidas Esperadas

## Resultado General

Formato:

```text
VALIDO

VALIDO CON OBSERVACIONES

NO VALIDO
```

---

## Inventario de Campos

Clasificados por estado.

---

## Campos Sin Mapping

Listado completo.

---

## Campos Ambiguos

Listado completo.

---

## Riesgos Detectados

Clasificados por criticidad.

---

## Recomendaciones

Acciones correctivas.

---

# Formato de Respuesta Esperado

```text
Campo
↓
Estado Mapping
↓
Tabla Destino
↓
Riesgo
↓
Observaciones
```

---

# Checklist de Validación

Verificar:

- [ ] Posiciones correctas.
- [ ] Longitudes correctas.
- [ ] Tipos compatibles.
- [ ] Mapping identificado.
- [ ] Tablas identificadas.
- [ ] Transformaciones documentadas.
- [ ] Valores fijos identificados.
- [ ] Campos ambiguos identificados.
- [ ] Riesgos documentados.
- [ ] Cobertura calculada.

---

# Preguntas que esta Skill debe responder

```text
¿El layout es consistente?

¿Todos los campos tienen destino?

¿Existen transformaciones sin documentar?

¿Qué campos siguen pendientes?

¿Qué riesgos existen para la migración?

¿Qué porcentaje del mapping está resuelto?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se valida completamente el layout.
- Se identifican inconsistencias estructurales y funcionales.
- Se detectan campos sin correspondencia.
- Se evalúa la calidad del mapping.
- Se generan observaciones accionables para completar la migración.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
