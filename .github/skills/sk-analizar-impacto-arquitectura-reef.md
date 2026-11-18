---
name: sk-analizar-impacto-arquitectura-reef
type: skill
description: Analiza el impacto arquitectónico de un cambio funcional o técnico dentro de REEF, identificando los componentes, dominios y capas afectadas.
domain: reef
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:reef-arquitectura
    - rag:newtron-acronimos
    - rag:normativas-api
  instructions:
    - instructions/inst-normativas-api.md
---

# Skill: Analizar Impacto Arquitectónico REEF

## Objetivo

Determinar dónde debe implementarse una funcionalidad dentro de REEF y qué componentes resultarían afectados por un cambio funcional o técnico.

La skill proporciona una visión arquitectónica previa antes del diseño o la implementación.

---

## Cuándo utilizar esta skill

Utilizar esta skill cuando sea necesario:

- Incorporar una nueva funcionalidad.
- Modificar una funcionalidad existente.
- Analizar incidencias funcionales.
- Identificar el componente responsable de un proceso.
- Determinar si un cambio pertenece a Core o País.
- Estimar el impacto técnico de una evolución.
- Identificar integraciones involucradas.

---

## Conocimientos requeridos

Consultar:

```text
rag:reef-arquitectura
rag:newtron-acronimos
rag:normativas-api
```

---

## Entradas

- Requisito funcional o tecnico.
- Historia de usuario o incidencia.
- Componente inicial sospechado.
- Contexto de contratos/API, si aplica.

---

## Procedimiento

### Paso 1: Caracterizar el cambio

Identificar:

- objetivo del cambio,
- dominio funcional,
- tipo de cambio (contrato, logica, datos, integracion, UI).

### Paso 2: Determinar frontera Core vs Pais

Clasificar si la capacidad es:

- transversal/reutilizable,
- especifica de pais,
- mixta.

### Paso 3: Localizar capas impactadas

Evaluar impacto en:

- frontales,
- APIs Locales,
- APIs Core,
- backend/servicios auxiliares,
- persistencia Core/Pais.

### Paso 4: Identificar componentes concretos

Listar componentes potencialmente afectados (ejemplo: cmn-api, rpt-nwt, local-api-esp, be-nwt, modulos BBDD).

### Paso 5: Evaluar integraciones y contratos

Comprobar:

- consumidores aguas abajo,
- cambios de contrato,
- necesidad de versionado,
- dependencias externas.

### Paso 6: Evaluar impacto en datos y transformaciones

Determinar si se afectan:

- mapeos funcionales,
- tablas/columnas,
- transformaciones basicas.

### Paso 7: Clasificar riesgo

Asignar severidad de impacto:

- alto: rompe contrato o cambia comportamiento transversal,
- medio: afecta varios componentes sin romper contrato,
- bajo: cambio acotado sin impacto externo.

### Paso 8: Proponer estrategia

Definir plan de actuacion:

- donde implementar,
- que validar antes de construir,
- pruebas y mitigaciones minimas.

---

## Salida esperada

- Componentes afectados por capa.
- Decision Core vs Pais justificada.
- Riesgos tecnicos y de compatibilidad.
- Recomendacion de implementacion.
- Checklist minimo de validacion.

---

## Plantilla de salida

```text
Cambio analizado:
Dominio:

Decision Core vs Pais:
- Justificacion:

Componentes impactados:
- Frontales:
- APIs Locales:
- APIs Core:
- Backend/servicios:
- Persistencia:

Impacto en contratos/versionado:

Riesgo (alto/medio/bajo):

Plan recomendado:
```

---

## Criterios de exito

La skill se considera completada cuando:

- identifica capas y componentes afectados,
- justifica Core vs Pais,
- explicita riesgo de contrato/versionado,
- entrega una estrategia accionable de implementacion/validacion.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
