---
name: sk-validar-configuracion-bkesp
type: skill
description: Valida configuraciones del repositorio reef-vida-bkesp-mongo verificando coherencia funcional, reglas país España, consistencia entre dominios, calidad JSON y compatibilidad con procesos consumidores.
domain: bkesp
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-bkesp.md
  knowledge:
    - rag:reglas_pais_espana
---

# Skill: Validar Configuración BKESP

## Objetivo

Analizar configuraciones del repositorio:

```text
reef-vida-bkesp-mongo
```

para verificar que cumplen las reglas funcionales y técnicas definidas para el dominio Vida España.

La validación debe detectar:

```text
Inconsistencias funcionales.
Errores de configuración.
Incumplimientos de formato.
Problemas de nomenclatura.
Incompatibilidades de integración.
Riesgos de despliegue.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Validar modificaciones JSON.
Revisar cambios antes de commit.
Preparar una Pull Request.
Analizar configuraciones existentes.
Auditar colecciones Mongo.
Detectar errores de parametrización.
```

---

# Entradas

La skill puede recibir:

## Ficheros JSON

Ejemplos:

```text
rte-int.BRANCHES.json
rte-int.TECHNICAL-BASIS.json
dup-int.RS-RULES-ACTIONS-CONDITIONS.json
rte-int.SUPPLEMENTS.json
```

---

## Colecciones completas

Ejemplos:

```text
BASES TECNICAS
OFERTA COMERCIAL
SELECCION DE RIESGOS
SUPLEMENTOS
```

---

## Cambios de Pull Request

```text
Ficheros modificados.
Diffs.
Nuevos registros.
Cambios de estructura.
```

---

# Procedimiento de Validación

## Paso 1

Validar sintaxis JSON.

---

## Verificar

```text
JSON válido.
Estructura correcta.
Colecciones cerradas.
Sin errores de parseo.
```

---

## Resultado

```text
OK
WARNING
ERROR
```

---

# Paso 2

Validar identidad del dominio.

---

## País

Valores permitidos:

```text
ESP
ES
ES0001
```

---

## Compañía

Valores esperados:

```text
20003
```

---

## Ramo

Valores esperados:

```text
118
```

---

## Detectar

```text
País incorrecto.
Company incorrecta.
Branch incorrecto.
```

---

# Paso 3

Validar formato Mongo

---

## Permitido

```json
{
  "$oid": "..."
}
```

---

```json
{
  "$date": "..."
}
```

---

## Detectar

```text
Formato inconsistente.
Fechas inválidas.
OID inválidos.
```

---

# Paso 4

Validar nombres de propiedades

---

## Verificar

Que no existan cambios sobre:

```text
country
company
branch
coverage
subBranch
operation
implementation
```

---

## Detectar

```text
Propiedades eliminadas.
Propiedades renombradas.
Cambio de estructura.
```

---

# Paso 5

Validar nomenclatura

---

## Ficheros técnicos

```text
rte-int.*
```

---

## Ficheros de reglas

```text
dup-int.*
```

---

## Directorios

```text
RAMO_118
```

---

## Detectar

```text
Nombres fuera de estándar.
Ubicaciones incorrectas.
```

---

# Validación por Dominio

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
Relaciones inconsistentes.
Tablas incompletas.
```

---

# Oferta Comercial

Verificar:

```text
country
company
branch
coverage
subBranch
```

---

## Detectar

```text
Coberturas huérfanas.
Subramos inconsistentes.
```

---

# Selección de Riesgos

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
Acciones sin condiciones.
Metadatos inexistentes.
```

---

## Regla especial

Si:

```text
active = "N"
```

validar existencia de justificación funcional.

---

# Suplementos

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
Operaciones inválidas.
Implementaciones inexistentes.
Suplementos inconsistentes.
```

---

# Validación Cruzada

## Verificar coherencia entre

```text
BASES TECNICAS
OFERTA COMERCIAL
SELECCION DE RIESGOS
SUPLEMENTOS
```

---

## Detectar

```text
Referencias no existentes.
Valores incompatibles.
Coberturas inconsistentes.
```

---

# Clasificación de Hallazgos

## Crítico

Impide despliegue.

Ejemplos:

```text
JSON inválido.
Company incorrecta.
Branch incorrecto.
```

---

## Alto

Puede romper integración.

Ejemplos:

```text
Cambio de propiedad.
Referencia inexistente.
```

---

## Medio

Afecta calidad funcional.

Ejemplos:

```text
Metadatos incompletos.
Reglas inconsistentes.
```

---

## Bajo

Mejoras recomendadas.

Ejemplos:

```text
Formato mejorable.
Documentación insuficiente.
```

---

# Salidas Esperadas

## Resumen General

Formato:

```text
VALIDO
VALIDO CON OBSERVACIONES
NO VALIDO
```

---

## Hallazgos

Formato:

```text
Severidad
Fichero
Descripción
```

---

## Errores Detectados

Listado detallado.

---

## Warnings

Listado detallado.

---

## Recomendaciones

Acciones propuestas.

---

# Checklist de Validación

Verificar:

- [ ] JSON válido.
- [ ] País correcto.
- [ ] Company = 20003.
- [ ] Branch = 118.
- [ ] Formato Mongo válido.
- [ ] Propiedades intactas.
- [ ] Nomenclatura correcta.
- [ ] Consistencia por dominio.
- [ ] Consistencia entre dominios.
- [ ] Compatibilidad preservada.

---

# Preguntas que esta Skill debe responder

```text
¿La configuración BKESP es válida?

¿Puede desplegarse sin riesgos?

¿Se ha roto alguna integración?

¿Se han modificado propiedades sensibles?

¿La configuración sigue las reglas del dominio España?

¿Existen inconsistencias funcionales entre colecciones?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Todas las validaciones estructurales se ejecutan.
- Se identifican errores críticos y warnings.
- Se valida la coherencia funcional del dominio.
- Se preserva la compatibilidad de integración.
- El resultado permite decidir objetivamente si la configuración puede promocionarse a los siguientes entornos.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
