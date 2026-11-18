---
name: inst-local-api-esp-overview
type: instruction
description: Instruccion de referencia para analizar, disenar, implementar y validar casos de uso en local-api-esp alineados con arquitectura REEF y normativas API.
domain: apis-local-esp
module: local-api-esp
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:local-api-esp
    - rag:normativas-api
    - rag:newtron-nomenclatura
---

# Instrucciones para local-api-esp-overview

## Objetivo

Garantizar que cualquier modificación propuesta para el repositorio `reef-vida-apisesp-local` sea consistente con la arquitectura REEF, las normativas API y las convenciones NewTron.

## Comportamiento esperado

### Reutilización

- Busca siempre una capacidad existente antes de crear una nueva implementación.
- Prioriza la reutilización de APIs Core frente a la implementación de lógica duplicada.
- Reutiliza clientes, DTOs, mappers y componentes existentes siempre que sea posible.

### Separación de responsabilidades

- Mantén la separación entre funcionalidades Core y funcionalidades específicas de España.
- No propongas mover lógica local a Core sin una justificación explícita.
- Evita introducir lógica de negocio compleja en controladores REST.

### Diseño de APIs

- Sigue las Normativas API vigentes del ecosistema REEF.
- Mantén compatibilidad hacia atrás en endpoints ya publicados.
- Evita cambios breaking salvo que estén explícitamente solicitados.
- Conserva los patrones de URL existentes dentro del dominio funcional.

### Organización del código

- Respeta la estructura de paquetes ya existente.
- Mantén la responsabilidad de orquestación en la capa de servicios.
- Mantén las integraciones externas encapsuladas en componentes específicos.
- Separa claramente modelos internos, DTOs y adaptadores.

### DTOs y mapeos

- Utiliza DTOs para exponer contratos públicos.
- Evita exponer directamente entidades internas.
- Prioriza el uso de mecanismos de mapeo ya existentes.
- Mantén consistencia entre los contratos de entrada y salida del mismo dominio.

### Convenciones

- Aplica las convenciones de nomenclatura definidas para NewTron.
- Utiliza nombres consistentes con el dominio funcional existente.
- Sigue los estándares de codificación utilizados en el repositorio.

### Documentación

- Documenta todo nuevo endpoint público.
- Añade comentarios únicamente cuando aporten valor funcional o arquitectónico.
- Mantén actualizada la documentación asociada cuando se modifiquen contratos públicos.

## Proceso de análisis recomendado

Antes de proponer cambios:

1. Identifica el dominio funcional afectado.
2. Busca endpoints similares ya implementados.
3. Verifica si existe una API Core que cubra el caso de uso.
4. Comprueba si ya existe una integración reutilizable.
5. Diseña la solución siguiendo los patrones existentes.
6. Valida que se mantiene la separación Core / País.

## Criterios de decisión

Ante varias alternativas:

1. Priorizar reutilización sobre duplicación.
2. Priorizar coherencia arquitectónica sobre rapidez de implementación.
3. Priorizar compatibilidad sobre rediseños innecesarios.
4. Priorizar patrones existentes sobre nuevas aproximaciones.
5. Priorizar soluciones alineadas con REEF y NewTron.

## Qué evitar

- Duplicar capacidades ya presentes en APIs Core.
- Introducir lógica de negocio compleja en controladores.
- Crear clientes de integración redundantes.
- Romper contratos públicos existentes.
- Introducir nomenclatura inconsistente.
- Saltarse los patrones arquitectónicos del repositorio.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
