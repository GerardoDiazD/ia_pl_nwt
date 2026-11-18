---
name: sk-auditar-plsql-newtron
type: skill
description: Audita código PL/SQL NewTRON para verificar cumplimiento de arquitectura, nomenclatura, trazabilidad, gestión de errores, reutilización corporativa y separación de responsabilidades entre capas.
domain: plsql
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-desarrollo-plsql-newtroniano.md
  knowledge:
    - rag:kb-arquitectura-plsql-newtron
    - rag:kb-nomenclatura-newtron-plsql
    - rag:kb-tipos-newtron
    - rag:kb-framework-plsql-newtron
    - rag:kb-gobierno-modelo-datos-newtron
---

# Skill: Auditar Código PL/SQL NewTRON

## Objetivo

Analizar código PL/SQL y artefactos NewTRON para determinar si cumplen los estándares corporativos definidos para el ecosistema REEF.

La auditoría debe detectar:

- Incumplimientos arquitectónicos.
- Errores de nomenclatura.
- Uso incorrecto de capas.
- Violaciones transaccionales.
- Problemas de trazabilidad.
- Gestión incorrecta de errores.
- Falta de reutilización corporativa.

---

# Cuándo utilizar esta Skill

Utilizar cuando sea necesario:

```text
Revisar desarrollos.
Validar entregas.
Auditar paquetes existentes.
Realizar code review.
Analizar incidencias.
Preparar despliegues.
Evaluar deuda técnica.
```

---

# Artefactos Auditables

La skill puede auditar:

```text
TYPE Oracle.
PACKAGE.
PACKAGE BODY.
Function.
Procedure.
Scripts SQL.
Diseños técnicos.
```

---

# Alcance de Auditoría

## Arquitectura

Verificar uso correcto de:

```text
NWT_O
NWT_DL
NWT_BL
NWT_SR
```

---

## Nomenclatura

Verificar cumplimiento de:

```text
O_*
DL_*
BL_*
SR_*
OP_*
```

---

## Reutilización

Detectar:

```text
Duplicidades.
Objetos redundantes.
Lógica ya existente.
TYPEs no corporativos.
```

---

# Procedimiento

## Paso 1

Identificar el tipo de componente.

Ejemplos:

```text
DL
BL
SR
TYPE
```

---

## Paso 2

Identificar responsabilidades implementadas.

Determinar si corresponden realmente a la capa donde residen.

---

## Paso 3

Analizar dependencias.

Verificar:

```text
Llamadas entre capas.
Consumo de componentes.
Uso de objetos corporativos.
```

---

## Paso 4

Verificar cumplimiento normativo.

Aplicar reglas corporativas NewTRON.

---

# Auditoría de Nomenclatura

## Verificar formato

```text
[PREFIJO]_[FAMILIA]_[CONCEPTO]_TRN
```

---

## Ejemplos válidos

```text
DL_THP_AGN_TRN
BL_PLY_POL_TRN
SR_LSS_CLM_QRY_TRN
```

---

## Ejemplos inválidos

```text
GESTION_AGENTES
PAQ_AGENTE
UTILIDADES
TEST1
```

---

# Auditoría de DL

## Verificar

```text
Existe SQL.
Existe persistencia.
Existen consultas.
```

---

## Detectar incumplimientos

```text
Commit.
Rollback.
Reglas de negocio.
Llamadas SR.
```

---

# Auditoría de BL

## Verificar

```text
Validaciones.
Reglas.
Cálculos.
```

---

## Detectar incumplimientos

```text
SQL directo.
CRUD.
Commit.
Rollback.
```

---

# Auditoría de SR

## Verificar

```text
Orquestación.
Transacciones.
Control de flujo.
```

---

## Detectar incumplimientos

```text
SQL.
Reglas de negocio complejas.
Persistencia directa.
```

---

# Auditoría de Objetos

## Verificar

Uso correcto de:

```text
S
P
T
PT
C
PC
CT
CPT
```

---

## Detectar

```text
Objetos duplicados.
Modelos inconsistentes.
Estructuras no corporativas.
```

---

# Auditoría de SQL

## Verificar

Todo SQL debe encontrarse exclusivamente en:

```text
DL
```

---

## Incumplimiento

Detectar:

```text
SELECT en BL.
UPDATE en BL.
DELETE en SR.
INSERT en SR.
```

---

# Auditoría Transaccional

## Verificar

```text
COMMIT
ROLLBACK
```

---

## Permitido

Solo en:

```text
SR
```

---

## Incumplimiento

Detectar:

```text
COMMIT en DL.
ROLLBACK en BL.
```

---

# Auditoría de Errores

## Verificar

Uso de:

```text
dl_trn_err
```

---

## Verificar

Existencia de:

```plsql
dl_trn_err.p_chc(...)
```

---

## Detectar malas prácticas

### Prohibido

```plsql
WHEN OTHERS THEN NULL;
```

---

### Riesgo Alto

```plsql
WHEN OTHERS sin RAISE;
```

---

# Auditoría de Trazabilidad

## Verificar inicio

```plsql
dl_trn_dbg.p_set_mth_bgn(...)
```

---

## Verificar parámetros

```plsql
dl_trn_dbg.p_set_prm(...)
```

---

## Verificar finalización

```plsql
dl_trn_dbg.p_set_mth_trm(...)
```

---

## Detectar

```text
Métodos sin trazas.
Parámetros sin registrar.
Salidas sin cierre.
```

---

# Auditoría de Parámetros Corporativos

## Verificar existencia cuando aplique

```text
pm_idioma
pm_usuario
pm_sesion
```

---

## Detectar

```text
Falta de trazabilidad funcional.
Falta de auditoría.
```

---

# Auditoría de Reutilización

## Verificar

Antes de crear un nuevo componente comprobar:

```text
Objerator.
Objetos existentes.
Paquetes existentes.
```

---

## Detectar

```text
Duplicidades.
Implementaciones paralelas.
Constantes repetidas.
```

---

# Clasificación de Hallazgos

## Crítico

Impacta arquitectura o integridad.

Ejemplos:

```text
COMMIT en DL.
SQL en SR.
TYPE corporativo duplicado.
```

---

## Alto

Impacta mantenibilidad.

Ejemplos:

```text
Falta trazabilidad.
Errores mal gestionados.
```

---

## Medio

Impacta calidad.

Ejemplos:

```text
Nomenclatura incorrecta.
Documentación incompleta.
```

---

## Bajo

Mejoras recomendadas.

Ejemplos:

```text
Refactorización.
Simplificación.
Reutilización adicional.
```

---

# Salidas Esperadas

La skill debe generar:

## Resumen Ejecutivo

```text
Cumple.
Cumple parcialmente.
No cumple.
```

---

## Hallazgos

Formato:

```text
Severidad.
Descripción.
Ubicación.
```

---

## Incumplimientos Arquitectónicos

Listado completo.

---

## Incumplimientos de Nomenclatura

Listado completo.

---

## Riesgos Técnicos

Listado completo.

---

## Recomendaciones

Acciones priorizadas para corrección.

---

## Resultado Final

Formato:

```text
APROBADO

o

APROBADO CON OBSERVACIONES

o

RECHAZADO
```

---

# Checklist de Auditoría

Verificar:

- [ ] Nomenclatura NewTRON correcta.
- [ ] Separación de capas correcta.
- [ ] SQL únicamente en DL.
- [ ] Commit/Rollback únicamente en SR.
- [ ] Uso correcto de objetos corporativos.
- [ ] Gestión de errores corporativa.
- [ ] Trazabilidad implementada.
- [ ] Parámetros corporativos presentes.
- [ ] Reutilización validada.
- [ ] Ausencia de malas prácticas PL/SQL.
- [ ] Cumplimiento de arquitectura REEF.

---

# Preguntas que esta Skill debe responder

```text
¿Este código cumple los estándares NewTRON?

¿Hay violaciones arquitectónicas?

¿La capa seleccionada es correcta?

¿La nomenclatura sigue las normas corporativas?

¿Existen riesgos de mantenimiento?

¿El desarrollo es desplegable según los estándares REEF?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se evalúa el cumplimiento completo del estándar NewTRON.
- Se identifican todos los incumplimientos relevantes.
- Los hallazgos están clasificados por severidad.
- Se proponen acciones correctivas.
- El resultado permite decidir objetivamente si el desarrollo puede ser aceptado en el ecosistema REEF.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
