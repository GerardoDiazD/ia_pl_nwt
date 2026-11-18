---
name: sk-analizar-caso-uso-local-api-esp
type: skill
description: Analiza una necesidad funcional y determina cómo debe implementarse dentro del repositorio reef-vida-apisesp-local respetando la arquitectura REEF.
domain: apis-local-esp
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-local-api-esp-overview.md
  knowledge:
    - rag:local-api-esp
    - rag:normativas-api
---

# Skill: Analizar Caso de Uso en local-api-esp

## Objetivo

Determinar la ubicación, diseño e integración adecuada de una nueva funcionalidad dentro de `local-api-esp`, garantizando la alineación con la arquitectura REEF y evitando duplicidades con APIs Core o componentes existentes.

## Cuándo utilizar esta skill

Utiliza esta skill cuando:

- Debas implementar un nuevo endpoint.
- Debas modificar un endpoint existente.
- Debas exponer funcionalidad Core al contexto España.
- Debas analizar una historia de usuario o incidencia relacionada con `local-api-esp`.
- Tengas que decidir si una funcionalidad pertenece a Core o a País.

## Entradas

- Historia de usuario.
- Incidencia.
- Requisito funcional.
- Documento de análisis.
- Petición de negocio.

## Procedimiento

### Paso 1: Comprender el caso de uso

Analiza la necesidad funcional e identifica:

- Objetivo de negocio.
- Datos de entrada.
- Datos de salida.
- Sistemas implicados.
- Dominio funcional afectado.

Preguntas clave:

- ¿Qué problema se quiere resolver?
- ¿Qué información debe exponerse o procesarse?
- ¿Qué consumidor utilizará el endpoint?

---

### Paso 2: Identificar el dominio funcional

Determina el área funcional a la que pertenece la necesidad:

- Emisión.
- Siniestros.
- Tesorería.
- Terceros.
- Servicios comunes.
- Otro dominio local.

Acciones:

- Localizar paquetes relacionados.
- Revisar módulos similares.
- Mantener la organización existente.

---

### Paso 3: Localizar implementaciones similares

Busca componentes relacionados:

- Controladores.
- Servicios.
- DTOs.
- Mappers.
- Clientes de integración.

Analiza:

- Convenciones de nombres.
- Patrones de URL.
- Estructura de respuestas.
- Gestión de errores.

Objetivo:

- Mantener coherencia con el repositorio.

---

### Paso 4: Buscar capacidad existente en APIs Core

Verifica si la funcionalidad ya existe en alguna API Core:

- cmn-api
- isu-api
- lss-api
- tsy-api
- thp-api

Evaluar:

- Si existe una operación reutilizable.
- Si existe una integración ya construida.
- Si es suficiente una simple adaptación.

Resultado esperado:

- Reutilizar antes de construir.

---

### Paso 5: Determinar la responsabilidad adecuada

Clasifica la funcionalidad:

#### Caso A: Funcionalidad Core existente

Implementar únicamente:

- Adaptación de contratos.
- Validaciones locales.
- Transformaciones de datos.
- Enriquecimiento específico de España.

#### Caso B: Funcionalidad específica de España

Implementar dentro de:

- local-api-esp
- backend país correspondiente

según la complejidad de la lógica.

---

### Paso 6: Diseñar la solución

Definir:

- Endpoint REST.
- DTOs de entrada.
- DTOs de salida.
- Servicios necesarios.
- Integraciones requeridas.
- Estrategia de mapeo.

Validar:

- Compatibilidad con contratos existentes.
- Cumplimiento de normativas API.
- Consistencia de nomenclatura.

---

### Paso 7: Evaluar impacto

Identificar:

- Endpoints afectados.
- Integraciones afectadas.
- DTOs afectados.
- Clientes afectados.

Verificar:

- Compatibilidad hacia atrás.
- Posibles breaking changes.
- Dependencias cruzadas.

---

### Paso 8: Validar cumplimiento arquitectónico

Comprobar que:

- No se duplica lógica Core.
- La lógica compleja no reside en controladores.
- Las integraciones están encapsuladas.
- Los contratos permanecen coherentes.
- La separación Core / País se mantiene.

## Resultado esperado

La ejecución de esta skill debe producir:

- Ubicación correcta de la funcionalidad.
- Diseño técnico preliminar.
- Identificación de integraciones necesarias.
- Justificación de la pertenencia a Core o País.
- Impacto arquitectónico identificado.

## Criterios de éxito

La skill se considera completada cuando:

- Existe una propuesta técnica alineada con REEF.
- Se han revisado las capacidades Core existentes.
- No se introducen duplicidades innecesarias.
- Se mantiene la coherencia arquitectónica del repositorio.
- Se han identificado los componentes a modificar.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
