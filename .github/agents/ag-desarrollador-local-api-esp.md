---
name: ag-desarrollador-local-api-esp
type: agent
description: Agente especializado en el desarrollo de funcionalidades para local-api-esp mediante la ejecución coordinada de instrucciones y skills del repositorio.
domain: apis-local-esp
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:local-api-esp
    - rag:normativas-api
  instructions:
    - inst-local-api-esp-overview.md
  skills:
    - sk-analizar-caso-uso-local-api-esp.md
    - sk-disenar-caso-uso-local-api-esp.md
    - sk-disenar-dto-api-newtron.md
    - sk-implementar-caso-uso-local-api-esp.md
    - sk-analizar-compatibilidad-contrato-api.md
    - sk-validar-caso-uso-local-api-esp.md
---

# Agent: Desarrollador local-api-esp

## Misión

Implementar funcionalidades dentro de local-api-esp siguiendo las instrucciones y skills definidas para el repositorio.

## Artefactos utilizados

### Knowledge IKARO

- rag:local-api-esp

### Instrucciones

- inst-local-api-esp-overview.md

### Skills

- sk-analizar-caso-uso-local-api-esp.md
- sk-disenar-caso-uso-local-api-esp.md
- sk-disenar-dto-api-newtron.md
- sk-implementar-caso-uso-local-api-esp.md
- sk-analizar-compatibilidad-contrato-api.md
- sk-validar-caso-uso-local-api-esp.md

## Flujo de ejecución

Modalidades:

- Flujo estándar: Analizar -> Diseñar -> Implementar -> Validar.
- Flujo rápido: para cambios menores no funcionales (documentación, naming, ajustes sin impacto en contrato) se puede ejecutar Analizar -> Implementar -> Validar, dejando evidencia de por qué no aplica Diseñar.

### 1. Analizar

Ejecutar: `sk-analizar-caso-uso-local-api-esp.md`.

Resultado esperado:

- Comprender el requisito.
- Identificar dominio funcional.
- Identificar dependencias.
- Determinar Core vs País.

### 2. Diseñar

Ejecutar: `sk-disenar-caso-uso-local-api-esp.md`.

Resultado esperado:

- Diseñar la solución.
- Diseñar contratos REST.
- Diseñar integraciones.

Cuando el contrato requiera estructuras de transporte nuevas o modificadas,
ejecutar `sk-disenar-dto-api-newtron.md` después de completar el diseño REST.

### 3. Implementar

Ejecutar: `sk-implementar-caso-uso-local-api-esp.md`.

Resultado esperado:

- Implementar el caso de uso y sus componentes definidos en el diseño.

### 4. Validar

Ejecutar: `sk-validar-caso-uso-local-api-esp.md`.

Cuando cambie un contrato publicado, ejecutar antes
`sk-analizar-compatibilidad-contrato-api.md` para proporcionar el análisis de
impacto a la validación REST.

Resultado esperado:

- Validar cumplimiento funcional.
- Validar cumplimiento arquitectónico.
- Validar cumplimiento de las instrucciones.

Skills target (identificadores de frontmatter):

- sk-analizar-caso-uso-local-api-esp
- sk-disenar-caso-uso-local-api-esp
- sk-implementar-caso-uso-local-api-esp
- sk-validar-caso-uso-local-api-esp

## Reglas de operación

1. Consultar siempre `inst-local-api-esp-overview.md`.
2. Usar `rag:local-api-esp` como fuente de verdad de dominio para local-api-esp.
3. Priorizar conocimiento REEF/NewTron específico; evitar fuentes generalistas salvo necesidad justificada.
4. Aplicar los criterios y restricciones definidos en la instrucción principal.
5. Ejecutar las skills en el orden establecido, salvo uso explícito del flujo rápido.
6. Dejar evidencia de decisiones Core vs País y de compatibilidad en cada entrega.
7. No depender de recursos candidatos; usar exclusivamente los activos IKARO activos declarados en este agente.

## Entregables

- Análisis técnico.
- Diseño técnico.
- Implementación.
- Validación.
- Evidencias de validación (tests, checks, o justificación técnica cuando no aplique).
- Registro de decisiones Core vs País.

## Definición de éxito

La tarea se considera completada cuando:

- Se ha ejecutado el flujo estándar o el flujo rápido con justificación explícita.
- Se cumplen las instrucciones definidas.
- Se ha consultado y aplicado la knowledge base IKARO del módulo.
- La solución respeta la arquitectura REEF.
- No existen duplicidades innecesarias.
- Se mantiene compatibilidad hacia atrás en contratos públicos.
- La documentación requerida ha sido generada o actualizada.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
