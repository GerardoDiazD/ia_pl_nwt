---
name: sk-identificar-impacto-tabla-tron
type: skill
description: Analiza una tabla Oracle utilizada en reef-vida-bkesp-tron_cmn y determina su impacto funcional, dependencias, scripts relacionados, ramos implicados, modalidades asociadas y riesgos de modificación.
domain: tron
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-tron-cmn.md
  knowledge:
    - rag:kb-tron-cmn-repositorio
    - rag:kb-tron-cmn-carga-ramo-118
    - rag:kb-tron-cmn-modalidades-118
    - rag:kb-tron-cmn-despliegue
---

# Skill: Identificar Impacto de Tabla TRON

## Objetivo

Determinar el impacto funcional y técnico de una tabla Oracle dentro del ecosistema:

```text
reef-vida-bkesp-tron_cmn
```

La finalidad es comprender:

```text
Qué hace la tabla.
Dónde se configura.
Qué scripts la modifican.
Qué modalidades afecta.
Qué ramos utilizan la información.
Qué riesgos existen al modificarla.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando sea necesario:

```text
Analizar una tabla Oracle.
Preparar una modificación.
Evaluar impacto funcional.
Investigar incidencias.
Analizar despliegues.
Entender dependencias.
```

---

# Entradas

## Tabla Oracle

Ejemplos:

```text
A1002150
A2100300
G2000180
A7000100
A2500410
G1010031
```

---

## Opcional

Puede incluir:

```text
Compañía.
Ramo.
Modalidad.
Script.
```

para refinar el análisis.

---

# Objetivos de Análisis

La skill debe determinar:

```text
Dominio funcional.
Ramo asociado.
Fase de instalación.
Modalidades asociadas.
Dependencias relacionadas.
Scripts involucrados.
```

---

# Procedimiento

## Paso 1

Identificar la tabla.

---

## Clasificar por dominio

Posibles dominios:

```text
Emisión.
Siniestros.
Reaseguro.
Configuración transversal.
Terceros.
Comercial.
```

---

## Resultado

Descripción funcional de la tabla.

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

## Resultado

Clasificación funcional.

---

# Paso 3

Identificar scripts relacionados

Buscar scripts que:

```text
Inserten datos.
Actualicen datos.
Configuren datos.
Consulten datos.
```

---

## Resultado

Listado de scripts asociados.

---

### Ejemplo de salida

```text
202603_1_RAMO_01_EMISION_118_a2100300_27.sql
202603_1_RAMO_04_GRAL_EMISION_118_a2100100_4.sql
```

---

# Paso 4

Identificar modalidad

Buscar referencias a:

```text
COD_MODALIDAD
```

---

## Clasificar

### Modalidad explícita

```text
Existe filtro directo.
```

---

### Modalidad implícita

```text
Existe relación indirecta.
```

---

### Sin modalidad

```text
Configuración transversal.
```

---

# Paso 5

Identificar compañía

Validar relación con:

```text
COD_CIA
```

---

## Valores esperados

```text
20003
```

---

## Detectar

```text
Configuración compartida.
Configuración corporativa.
Configuración específica.
```

---

# Paso 6

Identificar dependencias

Determinar:

```text
Tablas relacionadas.
Listas de valores.
Configuraciones dependientes.
Objetos Oracle asociados.
```

---

## Clasificación

### Dependencias directas

```text
FK.
JOIN.
Carga de datos.
```

---

### Dependencias indirectas

```text
Parámetros.
Configuraciones funcionales.
Procesos.
```

---

# Paso 7

Analizar criticidad

---

## Baja

```text
Tabla auxiliar.
Configuración aislada.
```

---

## Media

```text
Configuración funcional.
Parámetros compartidos.
```

---

## Alta

```text
Productos.
Coberturas.
Modalidades.
Comisiones.
```

---

## Crítica

```text
Compañía.
Monedas.
Diccionario global.
Configuración corporativa.
```

---

# Casos Especiales

## Tablas de Emisión

Ejemplos:

```text
A1002150
A2100300
G2000180
G2000190
```

---

## Analizar

```text
Productos.
Coberturas.
Modalidades.
Comisiones.
```

---

# Tablas de Siniestros

Ejemplos:

```text
A7000100
G7000100
G7000130
```

---

## Analizar

```text
Estados.
Expedientes.
Reservas.
Garantías.
```

---

# Tablas de Reaseguro

Ejemplos:

```text
A2500340
A2500410
G2500200
```

---

## Analizar

```text
Acuerdos.
Cesiones.
Límites.
Factores.
```

---

# Tablas Transversales

Ejemplos:

```text
A1000500
G1010031
G2000010
```

---

## Analizar

```text
Impacto corporativo.
Impacto multirramo.
Dependencias globales.
```

---

# Salidas Esperadas

## Resumen Funcional

Formato:

```text
Qué representa la tabla.
```

---

## Localización

Formato:

```text
Ramo.
Bloque funcional.
Fase.
```

---

## Scripts Relacionados

Listado completo.

---

## Modalidades Relacionadas

Listado identificado.

---

## Dependencias

Directas e indirectas.

---

## Riesgos

Clasificados por criticidad.

---

## Recomendaciones

Acciones previas antes de modificar la tabla.

---

# Formato de Respuesta Esperado

```text
Tabla
↓
Dominio funcional
↓
Scripts asociados
↓
Modalidades afectadas
↓
Dependencias
↓
Riesgo
↓
Recomendaciones
```

---

# Checklist de Análisis

Verificar:

- [ ] Tabla identificada.
- [ ] Ramo identificado.
- [ ] Compañía identificada.
- [ ] Modalidades identificadas.
- [ ] Scripts relacionados identificados.
- [ ] Dependencias identificadas.
- [ ] Riesgo calculado.
- [ ] Recomendaciones documentadas.

---

# Preguntas que esta Skill debe responder

```text
¿Qué hace esta tabla?

¿Dónde se carga?

¿Qué scripts la modifican?

¿Qué modalidades dependen de ella?

¿Qué ocurrirá si la cambio?

¿Cuál es su nivel de criticidad?

¿Qué validaciones debo realizar antes de modificarla?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se identifica correctamente el propósito funcional de la tabla.
- Se localizan todos los scripts relevantes.
- Se identifican modalidades y ramos afectados.
- Se documentan las dependencias existentes.
- Se evalúa el riesgo de modificación.
- El resultado permite realizar cambios con conocimiento completo de impacto.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
