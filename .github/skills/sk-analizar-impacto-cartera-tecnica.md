---
name: sk-analizar-impacto-cartera-tecnica
type: skill
description: Analiza el impacto funcional, técnico y actuarial de un campo, garantía, modalidad, prestación o regla de Cartera Técnica, identificando entidades afectadas, dependencias, cálculos involucrados, riesgos y validaciones necesarias.
domain: cartera-tecnica
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:cartera_tecnica
---

# Skill: Analizar Impacto en Cartera Técnica

## Objetivo

Determinar las consecuencias funcionales, técnicas y actuariales de una modificación dentro del dominio de Cartera Técnica.

La skill debe identificar:

```text
Qué cambia.
Qué entidades se ven afectadas.
Qué cálculos utilizan el dato.
Qué procesos dependen de él.
Qué riesgos existen.
Qué validaciones son necesarias.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Modificar una modalidad.
Modificar una garantía.
Modificar una prestación.
Cambiar una regla actuarial.
Cambiar una tabla REEF.
Analizar incidencias.
Preparar una migración.
Realizar una evolución funcional.
```

---

# Entradas

## Campo de Cartera Técnica

Ejemplos:

```text
EPNETA
ECAPGAR
PINTER-TEC
CTABMORTAL
CASADA
```

---

## Garantía

Ejemplos:

```text
CGARANTIA
CVR_VAL
```

---

## Prestación

Ejemplos:

```text
CPRESTACION
KPRESTA
```

---

## Modalidad

Ejemplos:

```text
307
309
404
901
```

---

## Tabla REEF

Ejemplos:

```text
A2000011
A2000020
A2000030
RL_PLY_NWT_XX_SBN
```

---

# Objetivos del Análisis

La skill debe determinar:

```text
Impacto funcional.
Impacto técnico.
Impacto actuarial.
Impacto operativo.
```

---

# Procedimiento

## Paso 1

Identificar el elemento afectado.

---

## Clasificar

### Campo

```text
EPNETA
CASADA
PINTER-TEC
```

---

### Garantía

```text
CGARANTIA
```

---

### Prestación

```text
CPRESTACION
```

---

### Modalidad

```text
MODALI
```

---

### Entidad REEF

```text
A2000030
RL_PLY_NWT_XX_SBN
```

---

# Paso 2

Localizar dependencias directas

---

## Identificar

```text
Tabla origen.
Tabla destino.
Campos relacionados.
```

---

## Ejemplo

```text
PINTER-TEC
↓
IT1
IT2
↓
JSON ajustes
↓
RL_PLY_NWT_XX_SBN
```

---

# Paso 3

Localizar dependencias funcionales

---

## Analizar impacto sobre

```text
Pólizas.
Certificados.
Suscripciones.
Garantías.
Prestaciones.
Modalidades.
```

---

## Resultado

Mapa funcional completo.

---

# Paso 4

Localizar dependencias actuariales

---

## Verificar

```text
Bases técnicas.
Interés técnico.
Mortalidad.
Capitales.
Primas.
Revalorizaciones.
```

---

## Ejemplos

### CTABMORTAL

Impacta:

```text
Cálculo actuarial.
Tarificación.
Reservas.
```

---

### CASADA

Impacta:

```text
Tramos de interés.
Duraciones.
Cálculos financieros.
```

---

# Paso 5

Analizar impacto económico

---

## Verificar

Afectación sobre:

```text
Primas.
Capitales.
Prestaciones.
Coaseguro.
Rentabilidad.
```

---

## Campos habituales

```text
EPNETA
ECAPGAR
EPRIMACT-TEORICA
PCOASE
```

---

# Paso 6

Analizar impacto contractual

---

## Verificar

Afectación sobre:

```text
Póliza.
Subpóliza.
Certificado.
Suplemento.
```

---

## Tablas principales

```text
A2000011
A2000030
```

---

# Paso 7

Analizar impacto comercial

---

## Verificar

```text
Canales.
Intermediarios.
Oficinas.
Modalidades.
```

---

## Campos habituales

```text
CCANAL
KINTER
OFICOMER
```

---

# Paso 8

Analizar impacto de modalidad

---

## Determinar

Si la modalidad afectada participa en:

```text
Garantías.
Bases técnicas.
Prestaciones.
Primas.
Capitales.
```

---

## Evaluar

```text
Impacto local.
Impacto transversal.
```

---

# Paso 9

Analizar impacto en migraciones

---

## Verificar

Si el elemento afecta:

```text
Carga histórica.
Conversión de datos.
Interfaces.
Procesos ETL.
```

---

## Detectar

```text
Transformaciones adicionales.
Conversión de formatos.
Dependencias ocultas.
```

---

# Paso 10

Identificar validaciones necesarias

---

## Validaciones funcionales

```text
Prestaciones.
Modalidades.
Estados.
```

---

## Validaciones económicas

```text
Primas.
Capitales.
Coaseguro.
```

---

## Validaciones actuariales

```text
Intereses.
Mortalidad.
Duraciones.
Bases técnicas.
```

---

## Validaciones técnicas

```text
Tablas.
Campos.
Integridad.
```

---

# Análisis de Riesgo

## Riesgo Crítico

Ejemplos:

```text
Cambio en mortalidad.
Cambio en interés técnico.
Cambio en capitales.
Cambio en primas.
```

---

## Riesgo Alto

Ejemplos:

```text
Cambio de garantía.
Cambio de prestación.
Cambio de modalidad.
```

---

## Riesgo Medio

Ejemplos:

```text
Cambio de estado.
Cambio de canal.
Cambio de intermediario.
```

---

## Riesgo Bajo

Ejemplos:

```text
Campos descriptivos.
Campos informativos.
```

---

# Salidas Esperadas

## Resumen Ejecutivo

Formato:

```text
SIN IMPACTO RELEVANTE

IMPACTO CONTROLADO

IMPACTO ALTO

IMPACTO CRÍTICO
```

---

## Dependencias Detectadas

Clasificadas en:

```text
Funcionales.
Técnicas.
Actuariales.
```

---

## Entidades Afectadas

Listado completo.

---

## Procesos Afectados

Listado completo.

---

## Riesgos

Clasificados por severidad.

---

## Validaciones Necesarias

Previas y posteriores al cambio.

---

## Recomendaciones

Acciones para minimizar riesgos.

---

# Formato de Respuesta Esperado

```text
Elemento Analizado
↓
Descripción
↓
Entidades afectadas
↓
Dependencias
↓
Impacto funcional
↓
Impacto actuarial
↓
Impacto económico
↓
Riesgos
↓
Validaciones
↓
Recomendaciones
```

---

# Checklist

Verificar:

- [ ] Elemento identificado.
- [ ] Dependencias técnicas identificadas.
- [ ] Dependencias funcionales identificadas.
- [ ] Dependencias actuariales identificadas.
- [ ] Procesos afectados identificados.
- [ ] Riesgos clasificados.
- [ ] Validaciones definidas.
- [ ] Recomendaciones documentadas.

---

# Preguntas que esta Skill debe responder

```text
¿Qué impacta este cambio?

¿Qué tablas se verán afectadas?

¿Qué cálculos actuariales dependen de este dato?

¿Qué pólizas y garantías podrían verse afectadas?

¿Existe riesgo económico?

¿Qué validaciones deben ejecutarse antes de desplegar?

¿Es seguro realizar la modificación?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se identifican todas las dependencias relevantes.
- Se documenta el impacto funcional, técnico y actuarial.
- Se evalúan adecuadamente los riesgos.
- Se definen las validaciones necesarias.
- El análisis permite tomar decisiones seguras antes de modificar cualquier elemento de Cartera Técnica.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
