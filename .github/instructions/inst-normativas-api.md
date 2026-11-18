---
name: inst-normativas-api
type: instruction
description: Instrucciones obligatorias para el diseño, evolución y validación de APIs REST conforme a los estándares corporativos MAPFRE.
domain: api
version: 1.1
owner: arquitectura-reef
---

# Instrucciones de Normativas API

## Objetivo

Garantizar que cualquier API REST diseñada, implementada o modificada cumpla los estándares corporativos MAPFRE de consistencia, mantenibilidad, seguridad y compatibilidad.

Fuente de verdad recomendada:

- rag:normativas-api

---

## Aplicabilidad

Aplicar estas instrucciones cuando:

- Se diseñe una nueva API.
- Se cree un nuevo endpoint.
- Se modifique un endpoint existente.
- Se versione una API.
- Se revisen contratos REST.
- Se validen especificaciones OpenAPI.

---

## Diseño de recursos

### Identificar recursos antes que operaciones

Diseñar la API alrededor de recursos de negocio.

Priorizar:

```text
policy
customer
claim
receipt
document
```

## Reglas para agentes IA

- Priorizar la KB de normativas API frente a conocimiento REST generalista.
- Tratar como breaking todo cambio no retrocompatible hasta que se demuestre lo contrario.
- Exigir evidencia de compatibilidad, versionado y codigos HTTP acordes.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
