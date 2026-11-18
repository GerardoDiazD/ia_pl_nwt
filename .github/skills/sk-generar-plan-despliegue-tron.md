---
name: sk-generar-plan-despliegue-tron
type: skill
description: Genera planes de despliegue para cambios realizados en reef-vida-bkesp-tron_cmn, identificando dependencias, secuencia de instalación, riesgos, validaciones previas y estrategia de promoción entre entornos.
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
    - rag:kb-tron-cmn-despliegue
---

# Skill: Generar Plan de Despliegue TRON

## Objetivo

Construir un plan de despliegue seguro y trazable para modificaciones realizadas en:

```text
reef-vida-bkesp-tron_cmn
```

garantizando:

```text
Orden correcto de instalación.
Integridad funcional.
Compatibilidad entre entornos.
Control de dependencias.
Reducción de riesgos.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Preparar un despliegue.
Analizar una release.
Promocionar cambios entre entornos.
Instalar scripts SQL.
Planificar migraciones.
Coordinar releases TRON.
```

---

# Entradas Esperadas

## Scripts SQL

Ejemplos:

```text
202603_1_RAMO_01_EMISION_118_a2100300_27.sql
202603_1_RAMO_99_EMISION118_G1010031_5.sql
```

---

## Objetos Oracle

Ejemplos:

```text
Package
Procedure
Trigger
Type
Sequence
```

---

## Pull Request

```text
Lista de cambios.
Diffs.
Scripts nuevos.
Scripts modificados.
```

---

# Objetivos del Análisis

La skill debe determinar:

```text
Orden de ejecución.
Dependencias.
Objetos afectados.
Riesgos.
Entornos impactados.
Validaciones necesarias.
```

---

# Procedimiento

## Paso 1

Identificar activos a desplegar.

---

## Clasificar

```text
DDL
DML
PLSQL
CONFIGURACION
```

---

## Resultado

Inventario de despliegue.

---

# Paso 2

Identificar fase de instalación

Determinar si pertenece a:

```text
Fase 1 - Ajustes previos
Fase 2 - Preparación
Fase 3 - Carga principal
Fase 4 - Finalización
```

---

## Regla

La ejecución debe respetar la secuencia funcional.

---

# Paso 3

Identificar bloque funcional

Clasificar en:

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

## Resultado

Mapa funcional de despliegue.

---

# Paso 4

Analizar dependencias

---

## Dependencias técnicas

Ejemplos:

```text
Triggers.
Constraints.
Índices.
Tablas.
Views.
Packages.
```

---

## Dependencias funcionales

Ejemplos:

```text
Coberturas.
Modalidades.
Productos.
Compañía.
Ramo.
```

---

# Paso 5

Determinar orden de ejecución

---

## Regla principal

Los scripts se instalan por:

```text
Orden alfanumérico.
```

---

## Verificar

```text
Precondiciones.
Objetos requeridos.
Dependencias previas.
```

---

## Detectar

```text
Bloqueos.
Dependencias circulares.
Secuencia incorrecta.
```

---

# Paso 6

Analizar compañía y ramo

---

## Validar

```text
COD_CIA = 20003
COD_RAMO = 118
```

cuando corresponda al dominio principal.

---

## Detectar

```text
Configuraciones externas.
Impactos multicompañía.
Impactos multirramo.
```

---

# Paso 7

Analizar modalidades

Buscar:

```text
COD_MODALIDAD
```

---

## Identificar

Modalidades explícitas.

---

## Clasificar

```text
Modalidad única.
Modalidad múltiple.
Configuración transversal.
```

---

# Paso 8

Construir estrategia de despliegue

---

## Preparación

Ejemplos:

```text
Backup.
Validación de objetos.
Revisión de bloqueos.
```

---

## Instalación

Ejecutar según secuencia calculada.

---

## Validación post-despliegue

Verificar:

```text
Datos cargados.
Objetos compilados.
Integridad funcional.
```

---

# Entornos

## Flujo estándar

```text
DEV
↓
DEV-INT
↓
PRE
↓
PRO
```

---

## Validación obligatoria

Cada salto debe incluir evidencias.

---

# Gestión de DDL

## Casos típicos

```text
Triggers.
Particiones.
Constraints.
Índices.
```

---

## Recomendación

Separar despliegue DDL y DML cuando sea posible.

---

# Gestión de DML

## Casos típicos

```text
Configuraciones.
Parámetros.
Modalidades.
Coberturas.
```

---

## Verificar

```text
Volumen.
Filtros.
Impacto.
```

---

# Gestión de PL/SQL

## Validar

```text
Compilación.
Dependencias.
Errores.
```

---

## Aplicar

Normativa:

```text
inst-desarrollo-plsql-newtroniano
```

---

# Riesgos de Despliegue

## Riesgo Crítico

Ejemplos:

```text
Dependencia no resuelta.
Orden incorrecto.
Objeto inexistente.
```

---

## Riesgo Alto

Ejemplos:

```text
Actualización masiva.
Cambio transversal.
```

---

## Riesgo Medio

Ejemplos:

```text
Impacto funcional limitado.
Validaciones incompletas.
```

---

## Riesgo Bajo

Ejemplos:

```text
Cambios locales.
Configuración aislada.
```

---

# Salidas Esperadas

## Plan de Despliegue

Formato:

```text
Paso a paso.
```

---

## Secuencia de Instalación

Listado ordenado de scripts.

---

## Dependencias

Listado técnico y funcional.

---

## Riesgos

Clasificados por criticidad.

---

## Plan de Validación

Antes y después del despliegue.

---

## Go / No-Go

Resultado:

```text
APTO PARA DESPLIEGUE

APTO CON RIESGOS

NO APTO
```

---

# Formato de Respuesta Esperado

```text
Inventario
↓
Dependencias
↓
Orden de despliegue
↓
Riesgos
↓
Validaciones
↓
Resultado final
```

---

# Checklist de Despliegue

Verificar:

- [ ] Scripts identificados.
- [ ] Dependencias identificadas.
- [ ] Orden alfanumérico validado.
- [ ] Compañía validada.
- [ ] Ramo validado.
- [ ] Modalidades revisadas.
- [ ] Objetos Oracle compilables.
- [ ] Riesgos documentados.
- [ ] Validaciones definidas.
- [ ] Estrategia de rollback disponible.

---

# Preguntas que esta Skill debe responder

```text
¿Cuál es el orden correcto de despliegue?

¿Qué dependencias existen?

¿Qué riesgos tiene la instalación?

¿Qué validaciones deben ejecutarse?

¿Es seguro promocionar el cambio?

¿Se puede desplegar en producción?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se genera una secuencia completa y ejecutable.
- Las dependencias están identificadas.
- Los riesgos están clasificados.
- Existen validaciones pre y post despliegue.
- La promoción entre entornos puede realizarse de forma controlada.
- El resultado permite ejecutar el despliegue con trazabilidad y mínimo riesgo operativo.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
