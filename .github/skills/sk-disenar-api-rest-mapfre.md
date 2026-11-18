---
name: sk-disenar-api-rest-mapfre
type: skill
description: Diseña APIs REST alineadas con los estándares corporativos MAPFRE, aplicando las normativas de recursos, URIs, métodos HTTP, contratos, errores y versionado.
domain: api
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:normativas-api
  instructions:
    - instructions/inst-normativas-api.md
---

# Skill: Diseñar API REST MAPFRE

## Objetivo

Diseñar una API REST consistente con las normativas corporativas MAPFRE.

La skill debe transformar un requisito funcional en una propuesta de diseño técnico preparada para su implementación.

---

## Conocimiento requerido

Consultar:

```text
rag:normativas-api
```

---

## Procedimiento

### Paso 1: Identificar recursos

Transformar el requisito funcional en recursos de negocio y relaciones jerarquicas.

### Paso 2: Definir URIs

Aplicar la estructura corporativa correspondiente y nombrar recursos con las reglas de la normativa.

### Paso 3: Seleccionar metodos HTTP

Elegir GET, POST, PUT, DELETE, HEAD u OPTIONS segun la semantica real de la operacion.

### Paso 4: Definir contratos

Especificar:

- parametros de path,
- query params,
- request body,
- response body,
- codigos HTTP,
- errores esperados.

### Paso 5: Evaluar versionado

Determinar si el cambio es retrocompatible o requiere nueva version.

### Paso 6: Revisar antipatrones

Comprobar que la URI no incluye verbos, no rompe jerarquia y no fuerza versionado innecesario.

---

## Resultado esperado

- Diseno REST alineado con MAPFRE.
- URI, metodo HTTP y contratos definidos.
- Estrategia de versionado justificada.
- Riesgos y decisiones relevantes documentados.

## Criterios de exito

La skill se considera completada cuando:

- el recurso esta bien modelado,
- la URI cumple la normativa,
- los metodos y estados HTTP son coherentes,
- el cambio queda clasificado como retrocompatible o breaking.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
