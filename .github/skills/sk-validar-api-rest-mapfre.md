---
name: sk-validar-api-rest-mapfre
type: skill
description: Valida diseños o implementaciones de APIs REST verificando el cumplimiento de las normativas corporativas MAPFRE.
domain: api
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:normativas-api
  instructions:
    - instructions/inst-normativas-api.md
---

# Skill: Validar API REST MAPFRE

## Objetivo

Validar que una API REST, ya sea en fase de diseño o implementada, cumple las normativas corporativas MAPFRE y las buenas prácticas de diseño orientado a recursos.

La skill debe identificar incumplimientos, riesgos de diseño y oportunidades de mejora.

---

## Conocimiento requerido

Consultar:

```text
rag:normativas-api
```

---

## Procedimiento

### Paso 1: Validar modelado de recursos

Comprobar si la API esta orientada a recursos y no a operaciones.

### Paso 2: Validar URIs

Revisar naming, jerarquia, uso de parametros HTTP y formato corporativo.

### Paso 3: Validar metodos y codigos HTTP

Comprobar que los verbos HTTP y respuestas son coherentes con la operacion.

### Paso 4: Validar contratos

Revisar consistencia entre entrada, salida, optionalidad y errores.

### Paso 5: Validar versionado

Determinar si el cambio es retrocompatible o si requiere version nueva.

### Paso 6: Emitir hallazgos

Clasificar incumplimientos, riesgos y mejoras recomendadas.

---

## Resultado esperado

- API validada contra la normativa.
- Hallazgos priorizados.
- Riesgos de compatibilidad identificados.
- Recomendaciones accionables.

## Criterios de exito

La skill se considera completada cuando:

- se han revisado recursos, URIs, metodos, contratos y versionado,
- los incumplimientos quedan justificados,
- la salida permite corregir o aprobar el diseno con evidencia.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
