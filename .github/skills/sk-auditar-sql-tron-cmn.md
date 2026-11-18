---
name: sk-auditar-sql-tron-cmn
type: skill
description: Audita scripts SQL y artefactos Oracle del repositorio reef-vida-bkesp-tron_cmn para verificar cumplimiento de estándares de despliegue, coherencia funcional, trazabilidad por ramo, modalidad y compañía.
domain: tron
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-tron-cmn.md
    - inst-desarrollo-plsql-newtroniano.md
  knowledge:
    - rag:kb-tron-cmn-repositorio
    - rag:kb-tron-cmn-carga-ramo-118
    - rag:kb-tron-cmn-modalidades-118
    - rag:kb-tron-cmn-despliegue
---

# Skill: Auditar SQL TRON CMN

## Objetivo

Analizar scripts SQL, paquetes Oracle y cambios de configuración dentro del repositorio:

```text
reef-vida-bkesp-tron_cmn
```

para determinar si cumplen las reglas técnicas y funcionales establecidas para:

```text
TRON
NewTRON
Vida España
Compañía 20003
Ramo 118
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Revisar scripts SQL.
Auditar cambios en Pull Request.
Validar despliegues.
Analizar impactos funcionales.
Detectar riesgos de instalación.
Verificar coherencia de modalidad.
```

---

# Artefactos Auditables

La skill puede analizar:

```text
Scripts SQL.
Stored Procedures.
Package Specification.
Package Body.
Tipos Oracle.
Scripts DDL.
Scripts DML.
```

---

# Entradas Esperadas

## Script individual

Ejemplo:

```text
202603_1_RAMO_01_EMISION_118_a2100300_27.sql
```

---

## Conjunto de scripts

Ejemplo:

```text
RAMO_01
RAMO_04
RAMO_99
```

---

## Pull Request

Ejemplo:

```text
Ficheros modificados.
Altas.
Bajas.
Cambios.
```

---

# Procedimiento de Auditoría

## Paso 1

Identificar el artefacto.

---

## Clasificación

```text
DDL
DML
PLSQL
CONFIGURACION
```

---

## Resultado

Inventario técnico del cambio.

---

# Paso 2

Identificar bloque funcional

Determinar si pertenece a:

```text
RAMO_01
RAMO_02
RAMO_03
RAMO_04
RAMO_05
RAMO_06
RAMO_99
```

---

## Validar

Que el bloque funcional sea coherente con:

```text
Tablas utilizadas.
Objetivo del script.
Descripción funcional.
```

---

# Paso 3

Validar compañía

---

## Valor esperado

```text
COD_CIA = 20003
```

---

## Detectar

```text
Compañías incorrectas.
Cambios accidentales.
Configuración ajena a BKESP.
```

---

# Paso 4

Validar ramo

---

## Valor esperado

```text
COD_RAMO = 118
```

---

## Detectar

```text
Ramos inconsistentes.
Filtros incompletos.
Configuraciones cruzadas.
```

---

# Paso 5

Validar modalidades

---

## Buscar referencias a

```text
COD_MODALIDAD
```

---

## Verificar

Modalidades conocidas:

```text
73
307
308
309
316
401
404
407
410
419
507
516
660
901
916
99999
40098
40099
40700
```

---

## Detectar

```text
Modalidades inexistentes.
Filtros incoherentes.
Configuraciones huérfanas.
```

---

# Paso 6

Validar orden de instalación

---

## Regla

Los scripts se despliegan por:

```text
Orden alfanumérico.
```

---

## Verificar

```text
Dependencias previas.
Dependencias posteriores.
Secuencia de carga.
```

---

## Detectar

```text
Dependencias rotas.
Orden incorrecto.
Objetos inexistentes.
```

---

# Auditoría DDL

## Verificar

```text
Triggers.
Índices.
Constraints.
Particiones.
Tablas.
```

---

## Detectar

```text
DDL peligroso.
Cambios destructivos.
Dependencias no controladas.
```

---

# Auditoría DML

## Verificar

```text
INSERT.
UPDATE.
DELETE.
MERGE.
```

---

## Detectar

```text
Actualizaciones masivas.
Filtros insuficientes.
Impactos fuera del ramo.
Impactos fuera de compañía.
```

---

# Auditoría PL/SQL

## Aplicar estándar NewTRON

Validar:

```text
DL
BL
SR
O
```

---

## Verificar

```text
Arquitectura.
Errores.
Trazabilidad.
Transacciones.
```

---

## Referencia

Aplicar:

```text
inst-desarrollo-plsql-newtroniano
```

---

# Validación de Tablas

Identificar tablas afectadas.

---

## Ejemplos

```text
A1002150
A2100300
G2000180
G7000100
A2500410
```

---

## Verificar

```text
Propósito funcional.
Bloque correcto.
Dependencias.
```

---

# Análisis de Riesgo

## Riesgo Crítico

Impide despliegue.

Ejemplos:

```text
Script inválido.
Orden incorrecto.
DDL destructivo.
Modalidad inconsistente.
```

---

## Riesgo Alto

Puede afectar operación.

Ejemplos:

```text
Update masivo.
Dependencias faltantes.
Cambio transversal.
```

---

## Riesgo Medio

Impacta mantenibilidad.

Ejemplos:

```text
Nomenclatura irregular.
Documentación insuficiente.
```

---

## Riesgo Bajo

Mejoras recomendadas.

Ejemplos:

```text
Refactorización.
Simplificación.
```

---

# Salidas Esperadas

## Resumen Ejecutivo

Formato:

```text
APROBADO

APROBADO CON OBSERVACIONES

RECHAZADO
```

---

## Impacto Funcional

Listado de:

```text
Ramos.
Modalidades.
Tablas.
Objetos Oracle.
```

---

## Hallazgos

Formato:

```text
Severidad
Objeto
Descripción
Impacto
```

---

## Riesgos Detectados

Clasificados por criticidad.

---

## Recomendaciones

Acciones de corrección priorizadas.

---

## Validación de Despliegue

Resultado final:

```text
DESPLEGABLE

DESPLEGABLE CON RIESGOS

NO DESPLEGABLE
```

---

# Checklist de Auditoría

Verificar:

- [ ] Compañía correcta.
- [ ] Ramo correcto.
- [ ] Modalidades válidas.
- [ ] Orden de instalación correcto.
- [ ] Dependencias identificadas.
- [ ] Scripts consistentes.
- [ ] PL/SQL conforme a NewTRON.
- [ ] Sin impactos transversales no controlados.
- [ ] Riesgos documentados.
- [ ] Despliegue viable.

---

# Preguntas que esta Skill debe responder

```text
¿Este script puede desplegarse?

¿A qué ramo pertenece?

¿Qué modalidades afecta?

¿Qué tablas modifica?

¿Existe riesgo funcional?

¿Cumple los estándares TRON y NewTRON?

¿Puede aprobarse la Pull Request?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se identifica correctamente el impacto funcional y técnico.
- Se validan compañía, ramo y modalidad.
- Se comprueba la secuencia de despliegue.
- Se detectan riesgos de instalación.
- Se evalúa el cumplimiento de estándares TRON/NewTRON.
- Se emite una recomendación objetiva de aprobación o rechazo.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
