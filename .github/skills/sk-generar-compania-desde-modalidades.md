---
name: sk-generar-compania-desde-modalidades
type: skill
description: Genera un plan completo de creación o migración de una nueva compañía TRON a partir de modalidades seleccionadas, identificando scripts afectados, reglas de filtrado, tablas de control, dependencias y validaciones necesarias.
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

# Skill: Generar Compañía desde Modalidades

## Objetivo

Diseñar un proceso controlado para crear una nueva compañía TRON reutilizando la configuración existente de:

```text
COD_CIA = 20003
COD_RAMO = 118
```

seleccionando únicamente las modalidades necesarias.

La skill debe generar:

```text
Plan de migración.
Tablas de control.
Mapeos.
Dependencias.
Scripts candidatos.
Validaciones.
Riesgos.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Crear una nueva compañía.
Replicar parte del ramo 118.
Migrar modalidades.
Crear un entorno derivado.
Segregar productos.
Generar una configuración inicial.
```

---

# Entradas Esperadas

## Compañía origen

Ejemplo:

```text
20003
```

---

## Compañía destino

Ejemplos:

```text
20006
20008
Nueva compañía
```

---

## Ramo

Ejemplo:

```text
118
```

---

## Modalidades incluidas

Ejemplos:

```text
307
309
316
404
901
```

---

## Opcional

Mapeos de equivalencia:

```text
Agentes.
Canales.
Oficinas.
Productos.
```

---

# Objetivos del Análisis

La skill debe determinar:

```text
Qué scripts deben migrarse.
Qué scripts deben excluirse.
Qué tablas se ven afectadas.
Qué dependencias existen.
Qué reglas de transformación aplicar.
```

---

# Procedimiento

## Paso 1

Identificar alcance funcional.

---

## Determinar

```text
Compañía origen.
Compañía destino.
Ramo.
Modalidades.
```

---

## Resultado

Inventario inicial de migración.

---

# Paso 2

Construir alcance de modalidades

---

## Generar estructura lógica

```sql
MIG_ALCANCE_MODALIDAD
```

---

## Objetivo

Controlar:

```text
Modalidades incluidas.
Modalidades excluidas.
Prioridad.
Estado.
```

---

# Paso 3

Identificar scripts afectados

Buscar scripts con:

```text
COD_MODALIDAD
```

---

## Clasificar

### Incluidos

```text
Contienen modalidades seleccionadas.
```

---

### Parciales

```text
Contienen modalidades incluidas y excluidas.
```

---

### Excluidos

```text
No afectan al alcance definido.
```

---

# Paso 4

Clasificar scripts por bloque

---

## RAMO_01

```text
Productos.
Coberturas.
Modalidades.
Comisiones.
```

---

## RAMO_02

```text
Siniestros.
```

---

## RAMO_03

```text
Reaseguro.
```

---

## RAMO_04

```text
Configuración general de emisión.
```

---

## RAMO_05

```text
Configuración general de siniestros.
```

---

## RAMO_06

```text
Configuración general de reaseguro.
```

---

## RAMO_99

```text
Configuración transversal.
```

---

# Paso 5

Analizar configuraciones transversales

Aplicar atención especial a:

```text
RAMO_99
```

---

## Regla

No copiar automáticamente toda la configuración común.

---

## Identificar

```text
Elementos reutilizables.
Elementos exclusivos.
Elementos corporativos.
```

---

# Paso 6

Generar reglas de filtrado

---

## Caso 1

Scripts con modalidad explícita.

Ejemplo:

```sql
COD_MODALIDAD = 307
```

---

## Acción

Filtrado directo.

---

## Caso 2

Scripts sin modalidad explícita.

---

## Acción

Analizar relaciones con:

```text
Productos.
Coberturas.
Tablas puente.
```

---

# Paso 7

Identificar mapeos necesarios

---

## Ejemplos

```text
Agentes.
Canales.
Oficinas.
Unidades comerciales.
```

---

## Generar

```sql
MIG_MAPEO_EQUIVALENCIAS
```

cuando sea necesario.

---

# Paso 8

Analizar dependencias

---

## Dependencias funcionales

```text
Productos.
Coberturas.
Comisiones.
Reservas.
```

---

## Dependencias técnicas

```text
Tablas.
FK.
Triggers.
Packages.
```

---

# Paso 9

Generar estrategia de despliegue

---

## Preparación

```text
Creación de compañía.
Validación de objetos.
Creación de catálogos.
```

---

## Carga

```text
RAMO_99
↓
RAMO_04
↓
RAMO_01
↓
RAMO_02
↓
RAMO_03
↓
RAMO_05
↓
RAMO_06
```

---

## Validación

```text
Conteos.
Integridad.
Pruebas funcionales.
```

---

# Validaciones Mínimas

## Datos

Verificar:

```text
Filas origen vs destino.
```

---

## Integridad

Verificar:

```text
FK.
Relaciones.
Referencias.
```

---

## Modalidades

Verificar:

```text
Todas las modalidades solicitadas existen.
```

---

## Funcionalidad

Verificar:

```text
Emisión.
Siniestros.
Reaseguro.
```

cuando aplique.

---

# Riesgos de Migración

## Riesgo Crítico

Ejemplos:

```text
Dependencias no identificadas.
Modalidades incompletas.
Configuración transversal incorrecta.
```

---

## Riesgo Alto

Ejemplos:

```text
Mapeos incompletos.
Relaciones huérfanas.
```

---

## Riesgo Medio

Ejemplos:

```text
Parámetros inconsistentes.
Datos parcialmente migrados.
```

---

## Riesgo Bajo

Ejemplos:

```text
Optimización pendiente.
Configuración opcional.
```

---

# Salidas Esperadas

## Alcance de Migración

Listado de:

```text
Modalidades.
Productos.
Coberturas.
```

---

## Scripts Seleccionados

Clasificados por:

```text
Incluido.
Parcial.
Excluido.
```

---

## Plan de Transformación

Reglas de adaptación.

---

## Mapeos Requeridos

Listado completo.

---

## Dependencias

Técnicas y funcionales.

---

## Plan de Despliegue

Secuencia recomendada.

---

## Plan de Validación

Validaciones obligatorias.

---

## Informe de Riesgos

Clasificación de riesgos.

---

# Formato de Respuesta Esperado

```text
Compañía origen
↓
Compañía destino
↓
Modalidades
↓
Scripts afectados
↓
Dependencias
↓
Transformaciones
↓
Validaciones
↓
Riesgos
↓
Plan de despliegue
```

---

# Checklist de Migración

Verificar:

- [ ] Compañía origen identificada.
- [ ] Compañía destino identificada.
- [ ] Modalidades definidas.
- [ ] Scripts analizados.
- [ ] Dependencias identificadas.
- [ ] Mapeos definidos.
- [ ] Configuración transversal revisada.
- [ ] Validaciones definidas.
- [ ] Riesgos evaluados.
- [ ] Plan de despliegue generado.

---

# Preguntas que esta Skill debe responder

```text
¿Qué necesito para crear una nueva compañía?

¿Qué modalidades se van a migrar?

¿Qué scripts forman parte de la migración?

¿Qué configuraciones deben adaptarse?

¿Qué riesgos existen?

¿Qué validaciones deben ejecutarse?

¿Cómo desplegar la nueva compañía de forma segura?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se identifica completamente el alcance de la nueva compañía.
- Las modalidades seleccionadas están trazadas de extremo a extremo.
- Se conocen todos los scripts y configuraciones afectados.
- Existe una estrategia clara de transformación y despliegue.
- Los riesgos están identificados y mitigados.
- La migración puede ejecutarse de forma repetible, auditable y controlada.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
