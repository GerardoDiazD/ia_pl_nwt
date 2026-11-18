---
name: sk-auditar-pr-bkesp
type: skill
description: Audita cambios realizados en el repositorio reef-vida-bkesp-mongo para validar cumplimiento de reglas BKESP, consistencia funcional, integridad entre dominios y preparación para Pull Request.
domain: bkesp
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-bkesp.md
  knowledge:
    - rag:reglas_pais_espana
---

# Skill: Auditar Pull Request BKESP

## Objetivo

Analizar cambios realizados en configuraciones BKESP para determinar si pueden ser promovidos a revisión o despliegue.

La auditoría debe validar:

```text
Consistencia funcional.
Cumplimiento de estándares BKESP.
Compatibilidad técnica.
Integridad de integración.
Ausencia de impactos no deseados.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando exista:

```text
Pull Request.
Merge Request.
Cambios masivos.
Modificaciones de configuración.
Nuevos ficheros JSON.
Actualizaciones de reglas.
```

---

# Entradas

La skill puede recibir:

## Pull Request

Ejemplos:

```text
Cambios en develop.
Cambios feature/*.
Cambios release/*.
```

---

## Lista de ficheros modificados

Ejemplos:

```text
rte-int.BRANCHES.json

rte-int.TECHNICAL-BASIS.json

dup-int.RS-RULES-ACTIONS-CONDITIONS.json

rte-int.SUPPLEMENTS.json
```

---

## Diffs

```text
Altas.
Bajas.
Modificaciones.
```

---

# Procedimiento de Auditoría

## Paso 1

Identificar el dominio afectado.

---

## Clasificación

```text
BASES TECNICAS
OFERTA COMERCIAL
SELECCION DE RIESGOS
SUPLEMENTOS
```

---

## Resultado

Inventario de impacto.

---

# Paso 2

Validar identidad funcional.

---

## Compañía

Valor esperado:

```text
20003
```

---

## Ramo

Valor esperado:

```text
118
```

---

## País

Valores válidos:

```text
ESP
ES
ES0001
```

---

## Detectar

```text
Cambios accidentales.
Nuevos valores.
Inconsistencias.
```

---

# Paso 3

Validar JSON

---

## Verificar

```text
Sintaxis correcta.
Estructura válida.
Codificación correcta.
```

---

## Detectar

```text
JSON inválido.
Propiedades corruptas.
Objetos incompletos.
```

---

# Paso 4

Validar Compatibilidad

---

## Verificar

Que no se alteren:

```text
Contratos existentes.
Propiedades públicas.
Estructuras consumidas por integración.
```

---

## Detectar

```text
Breaking changes.
Renombrado de atributos.
Eliminación de propiedades.
```

---

# Paso 5

Auditoría de Nomenclatura

---

## Verificar

Prefijos correctos:

```text
rte-int.*
dup-int.*
```

---

## Verificar

Directorios correctos:

```text
RAMO_118
```

---

## Detectar

```text
Ficheros fuera de estándar.
Ubicación incorrecta.
```

---

# Paso 6

Validación Funcional por Dominio

---

## Bases Técnicas

Verificar:

```text
codBt
namBt
tableCode
tableDesc
```

---

## Detectar

```text
Bases técnicas inconsistentes.
Tablas incompletas.
```

---

## Oferta Comercial

Verificar:

```text
coverage
subBranch
country
company
branch
```

---

## Detectar

```text
Coberturas huérfanas.
Subramos inválidos.
```

---

## Selección de Riesgos

Verificar:

```text
execution_type
process_type
process_step
conditions
actions
```

---

## Detectar

```text
Reglas incompletas.
Condiciones ausentes.
Acciones inconsistentes.
```

---

## Regla Especial

Si:

```text
active = "N"
```

debe existir justificación funcional.

---

## Suplementos

Verificar:

```text
supplementCode
supplementSubCode
supplementType
operation
implementation
```

---

## Detectar

```text
Configuraciones incompatibles.
Operaciones inexistentes.
```

---

# Paso 7

Validación Cruzada

---

## Verificar relaciones entre

```text
Bases Técnicas
Oferta Comercial
Selección Riesgos
Suplementos
```

---

## Detectar

```text
Referencias rotas.
Valores inconsistentes.
Coberturas no existentes.
Parámetros incompatibles.
```

---

# Paso 8

Análisis de Riesgo

---

## Riesgo Crítico

Impide aprobación.

Ejemplos:

```text
JSON inválido.
Company incorrecta.
Branch incorrecto.
Breaking change.
```

---

## Riesgo Alto

Puede afectar integraciones.

Ejemplos:

```text
Propiedades eliminadas.
Coberturas inexistentes.
```

---

## Riesgo Medio

Puede afectar comportamiento funcional.

Ejemplos:

```text
Metadatos incompletos.
Configuración inconsistente.
```

---

## Riesgo Bajo

Mejoras recomendadas.

Ejemplos:

```text
Formato.
Documentación.
Homogeneización.
```

---

# Salidas Esperadas

## Resumen Ejecutivo

Formato:

```text
APROBADO

APROBADO CON OBSERVACIONES

RECHAZADO
```

---

## Inventario de Impacto

Listado de:

```text
Ficheros afectados.
Dominios afectados.
Configuraciones afectadas.
```

---

## Hallazgos

Formato:

```text
Severidad
Fichero
Descripción
Impacto
```

---

## Riesgos Detectados

Clasificados por criticidad.

---

## Recomendaciones

Acciones correctivas priorizadas.

---

## Checklist PR

Resultado para cada control.

---

# Checklist de Auditoría

Verificar:

- [ ] JSON válido.
- [ ] Company = 20003.
- [ ] Branch = 118.
- [ ] País coherente.
- [ ] Sin breaking changes.
- [ ] Nomenclatura correcta.
- [ ] Consistencia de dominios.
- [ ] Consistencia entre dominios.
- [ ] Compatibilidad de integración.
- [ ] Evidencias funcionales disponibles.

---

# Preguntas que esta Skill debe responder

```text
¿La Pull Request puede aprobarse?

¿Los cambios cumplen las reglas BKESP?

¿Existe riesgo de romper integraciones?

¿Hay inconsistencias entre dominios?

¿La configuración es desplegable?

¿Qué correcciones deben realizarse antes del merge?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se auditan todos los cambios realizados.
- Se identifican riesgos funcionales y técnicos.
- Se validan las reglas corporativas BKESP.
- Se verifica la compatibilidad con integraciones existentes.
- Se emite una recomendación objetiva de aprobación o rechazo.
- El resultado puede utilizarse directamente durante la revisión de una Pull Request.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
