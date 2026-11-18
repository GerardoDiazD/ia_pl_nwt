# Copilot - Estado final de transformacion

## 1) Proposito y alcance

Este documento resume el estado del catálogo activo de `.github` tras la normalizacion de activos al modelo IKARO (knowledge, instruction, skill, agent), la consolidacion de conocimiento tecnico REEF y la evolucion a arquitectura multiagente por dominio.

Su objetivo es servir como:

- Resumen ejecutivo de la transformacion aplicada.
- Inventario final verificable de artefactos.
- Guia de uso para ejecucion con GitHub Copilot.

## 2) Transformacion realizada

La transformacion se ejecuto en etapas, priorizando preservacion de informacion, trazabilidad y gobernanza:

1. Integracion directa de conocimiento critico de mapeos
- `DOC_CCPP.md` se integro como knowledge final en `.github/knowledge/Mapeos/DOC_CCPP.md`.
- `ficol_asegurado.md`, `ficol_beneficiario.md` y `ficol_tomador.md` se consolidaron como knowledge dedicados en `.github/knowledge/Mapeos/`.

2. Consolidacion FICOL
- `ficol.md` y `ficol-2.md` se unificaron en un unico activo final: `.github/knowledge/Mapeos/ficol.md`.
- Se preservo cobertura de tablas/campos y referencias de trazabilidad.

3. Descomposicion de transformaciones basicas
- `transformaciones_basicas.md` se descompuso en un conjunto operativo dentro de `.git/copilot`.
- Se dejo trazabilidad entre instruction, skills y knowledge de soporte.

4. Normalizacion de metadatos y tipologias
- Estandar comun de version: `1.1`.
- Alineacion carpeta-tipo:
  - `ikaro` -> `knowledge`
  - `instructions` -> `instruction`
  - `skills` -> `skill`
  - `agents` -> `agent`
- Dependencias expresadas por archivo fisico `.md`.

5. Evolucion de arquitectura de agentes
- Se paso de un enfoque centrado en APIS a una arquitectura de especialistas por dominio mas un orquestador cross-domain.
- Se creo capacidad de ejecucion coordinada para APIS, Arquitectura, Back, BBDD, Mapeos y Transformaciones.

## 3) Inventario final

### 3.1 Totales globales (verificados)

- Total de markdown activos del catálogo: **102**
- `knowledge`: **30**
- `instruction`: **9**
- `skill`: **53**
- `agent`: **9**

### 3.2 Inventario por dominio/carpeta raiz

- `.github/agents`: **9**
- `.github/instructions`: **9**
- `.github/skills`: **53**
- `.github/knowledge`: **30**
- `.github/README.md`: **1**

### 3.3 Recursos en cuarentena

- `.github/candidates/legacy-ikaro`: corpus histórico pendiente de conciliación.
- Kafka AVRO: capacidad activa basada en evidencia. La configuración, esquemas y patrones concretos requieren validación del repositorio objetivo.

Los recursos en `.github/candidates/` no son activos de runtime ni pueden ser
dependencias de los agentes hasta que la gobernanza apruebe su promoción.

### 3.3 Agentes activos

1. `.github/agents/ag-orquestador-reef.md` (orquestador)
2. `.github/agents/ag-desarrollador-local-api-esp.md`
3. `.github/agents/ag-arquitectura-api-reef.md`
4. `.github/agents/ag-back-be-nwt.md`
5. `.github/agents/ag-eventos-kafka-avro-reef.md`
6. `.github/agents/ag-bbdd-newtron.md`
7. `.github/agents/ag-bbdd-tron-bkesp.md`
8. `.github/agents/ag-mapeos-host-reef.md`
9. `.github/agents/ag-transformaciones-reef.md`

## 4) Conectividad y gobernanza

Reglas aplicadas en esta base:

- Semantica estricta por carpeta-tipo.
- Version de activos normalizada a `1.1`.
- Dependencias declaradas por nombre de archivo `.md` existente.
- Cadena de consumo recomendada: `knowledge -> instruction -> skill -> agent`.

Estado de verificacion estructural:

- `TYPE_MISMATCHES=0` (validado).
- Dependencias y conectividad revisadas durante la normalizacion para evitar referencias rotas en frontmatter.

## 5) Instrucciones de uso con GitHub Copilot

### 5.1 Como elegir agente

Use este criterio de entrada:

- APIS local ESP: `ag-desarrollador-local-api-esp`
- Arquitectura API y nomenclatura NewTron: `ag-arquitectura-api-reef`
- Back BE-NWT (batch/export/auditoria/integraciones): `ag-back-be-nwt`
- Eventos Kafka AVRO: `ag-eventos-kafka-avro-reef`
- BBDD NewTron (DL/BL/SR/objetos/auditoria PLSQL): `ag-bbdd-newtron`
- BBDD TRON/BKESP (configuracion/despliegue): `ag-bbdd-tron-bkesp`
- Mapeos Host/IDMS/REEF: `ag-mapeos-host-reef`
- Transformaciones transversales REEF: `ag-transformaciones-reef`
- Caso multi-dominio: `ag-orquestador-reef`

### 5.2 Flujo recomendado de trabajo

Para cualquier requerimiento, siga la secuencia:

1. Analizar
- Delimitar alcance funcional/tecnico.
- Identificar dominios impactados.
- Levantar restricciones y dependencias.

2. Disenar
- Proponer solucion y alternativas.
- Definir artefactos objetivo y criterios de aceptacion.

3. Implementar
- Ejecutar cambios en orden de dependencia.
- Mantener trazabilidad de decisiones y supuestos.

4. Validar
- Verificar consistencia con knowledge/instructions.
- Validar evidencia de cumplimiento y riesgos residuales.

### 5.3 Plantilla de prompt recomendada

Use una estructura como esta:

```text
Contexto:
- Dominio: <APIS|Arquitectura|Back|Eventos Kafka AVRO|BBDD|Mapeos|Transformaciones>
- Objetivo: <resultado esperado>
- Restricciones: <normativas, dependencias, no-regresiones>

Solicitud:
1) Analiza impacto.
2) Propone diseno.
3) Implementa cambios.
4) Valida resultado con evidencia.

Salida esperada:
- Supuestos
- Decisiones tecnicas
- Cambios aplicados
- Validaciones ejecutadas
- Riesgos y siguientes pasos
```

### 5.4 Checklist de calidad de salida

Antes de cerrar una tarea con Copilot, confirme:

- Se uso el agente correcto para el dominio.
- Se referenciaron assets de conocimiento e instrucciones pertinentes.
- Se reportaron validaciones (no solo implementacion).
- Se explicitaron riesgos, limites y acciones siguientes.

### 5.5 Ejemplos de prompts por dominio

#### APIS (ag-desarrollador-local-api-esp)

```text
Usa el agente ag-desarrollador-local-api-esp.
Contexto: necesito implementar un nuevo caso de uso en local-api-esp para consultar polizas por identificador.
Restricciones: respetar normativas API MAPFRE, no romper contratos existentes y mantener trazabilidad.
Solicitud:
1) Analiza impacto tecnico y funcional.
2) Disena la propuesta de endpoint y contrato.
3) Implementa cambios requeridos.
4) Valida con checklist de cumplimiento y riesgos.
Salida: supuestos, decisiones, cambios aplicados, validaciones y riesgos.
```

#### Arquitectura (ag-arquitectura-api-reef)

```text
Usa el agente ag-arquitectura-api-reef.
Contexto: debemos evaluar el impacto arquitectonico de exponer una nueva API para integracion externa.
Restricciones: cumplir nomenclatura NewTron y normativas API corporativas.
Solicitud: analiza impacto, propone diseno objetivo y valida cumplimiento normativo.
Salida: componentes afectados, riesgos, decisiones y recomendaciones de arquitectura.
```

#### Back (ag-back-be-nwt)

```text
Usa el agente ag-back-be-nwt.
Contexto: se requiere un proceso batch nocturno para consolidar cartera y exportar resultados.
Restricciones: robustez operativa, auditoria y manejo de errores.
Solicitud: analiza, disena, implementa y valida el proceso batch + exportacion.
Salida: estrategia de ejecucion, puntos de control, trazabilidad y riesgos operativos.
```

#### BBDD NewTron (ag-bbdd-newtron)

```text
Usa el agente ag-bbdd-newtron.
Contexto: necesito crear logica PLSQL para una nueva regla de negocio y su capa de datos.
Restricciones: respetar framework y nomenclatura NewTron.
Solicitud: define componentes (DL/BL/SR), implementa propuesta y audita calidad tecnica.
Salida: artefactos generados, convenciones aplicadas, validaciones y riesgos.
```

#### BBDD TRON/BKESP (ag-bbdd-tron-bkesp)

```text
Usa el agente ag-bbdd-tron-bkesp.
Contexto: se debe ajustar configuracion de modalidad y compania en TRON-CMN con impacto en BKESP.
Restricciones: mantener coherencia por tabla/ramo y plan de despliegue seguro.
Solicitud: analiza impacto, genera cambios, valida configuracion y define plan de despliegue.
Salida: scripts, evidencias de validacion y riesgos de rollout.
```

#### Mapeos (ag-mapeos-host-reef)

```text
Usa el agente ag-mapeos-host-reef.
Contexto: necesito mapear un nuevo layout Host hacia REEF usando reglas Host->ASCII->IDMS.
Restricciones: no inventar campos ni romper trazabilidad de origen.
Solicitud: analiza layout, genera mapeo tecnico-funcional y valida consistencia campo a campo.
Salida: especificacion final, transformaciones aplicadas y brechas detectadas.
```

#### Transformaciones (ag-transformaciones-reef)

```text
Usa el agente ag-transformaciones-reef.
Contexto: debo normalizar identificadores, contratos y suplementos en una integracion bidireccional.
Restricciones: aplicar catalogos oficiales y reglas base de transformaciones.
Solicitud: analiza modelo de identificacion, aplica transformaciones y valida trazabilidad end-to-end.
Salida: resultado normalizado, evidencia de validacion y advertencias.
```

#### Multi-dominio (ag-orquestador-reef)

```text
Usa el agente ag-orquestador-reef.
Contexto: iniciativa transversal que toca APIS, BBDD, Mapeos y Back.
Restricciones: mantener consistencia entre dominios y una unica salida integrada.
Solicitud: clasifica alcance, delega en agentes especialistas, consolida decisiones y valida coherencia global.
Salida: plan integrado, entregables por dominio, riesgos cruzados y recomendaciones finales.
```

## 6) Nota operativa

Este README representa el baseline de trabajo para nuevas iteraciones. Cualquier nuevo asset debe mantener gobernanza `v1.1`, semantica carpeta-tipo y dependencias trazables por archivo.
