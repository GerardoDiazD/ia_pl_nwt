---
name: sk-validar-cartera-tecnica
type: skill
description: Valida información de Cartera Técnica comparando reglas funcionales, mappings REEF, cálculos actuariales, estados de póliza, garantías, prestaciones y suscripciones para detectar inconsistencias, omisiones y riesgos operativos.
domain: cartera-tecnica
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:cartera_tecnica
---

# Skill: Validar Cartera Técnica

## Objetivo

Validar registros, documentos funcionales o mappings de Cartera Técnica para garantizar que la información:

```text
Es consistente.
Es trazable.
Es calculable.
Es compatible con REEF.
Cumple las reglas funcionales y actuariales conocidas.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Validar una migración.
Auditar una carga.
Revisar una especificación funcional.
Comprobar datos actuariales.
Analizar incidencias de cartera.
Detectar inconsistencias.
```

---

# Entradas

## Registro de Cartera Técnica

Ejemplo:

```text
Póliza.
Certificado.
Garantía.
Prestación.
Suscripción.
```

---

## Especificación de Mapping

Ejemplo:

```text
Campo origen.
Campo REEF.
Transformación.
```

---

## Documento Funcional

Ejemplo:

```text
Diseño.
Análisis funcional.
Documento de migración.
```

---

# Objetivos del Análisis

La skill debe validar:

```text
Mappings.
Transformaciones.
Estados.
Primas.
Capitales.
Bases técnicas.
Prestaciones.
Integridad funcional.
```

---

# Procedimiento

## Paso 1

Validar identificadores.

---

## Verificar

```text
Ramo.
Modalidad.
Garantía.
Póliza.
Certificado.
Suscripción.
```

---

## Campos típicos

```text
KRAMO
MODALI
CGARANTIA
KPOLIZA
KCERTI
KSUSCRI
```

---

# Paso 2

Validar mappings REEF

---

## Verificar

```text
Tabla destino.
Campo destino.
Regla documentada.
```

---

## Ejemplos

```text
A2000011
A2000020
A2000030
RL_PLY_NWT_XX_SBN
```

---

# Paso 3

Validar consistencia contractual

---

## Verificar

Relaciones entre:

```text
Póliza.
Subpóliza.
Certificado.
Suplemento.
```

---

## Detectar

```text
Relaciones huérfanas.
Identificadores inconsistentes.
Datos incompletos.
```

---

# Paso 4

Validar prestaciones

---

## Campos principales

```text
CPRESTACION
KPRESTA
TITULARIDAD
```

---

## Verificar

```text
Prestación existente.
Prestación válida.
Titularidad coherente.
```

---

## Detectar

```text
Prestaciones inexistentes.
Prestaciones incompatibles.
```

---

# Paso 5

Validar estados

---

## Estado de póliza

```text
CESTADO-POL
```

---

## Estado de suscripción

```text
CESTADO-SUSCRI
```

---

## Motivos

```text
CMOTIVO-POL
CMOTIVO-SUSCRI
```

---

## Verificar

```text
Estado coherente.
Motivo coherente.
Fecha coherente.
```

---

# Paso 6

Validar fechas

---

## Fechas principales

```text
Fecha efecto.
Fecha vencimiento.
Fecha modificación.
Fecha suscripción.
```

---

## Verificar

```text
Inicio <= Fin.
Efecto <= Vencimiento.
```

---

## Detectar

```text
Fechas invertidas.
Vigencias inválidas.
```

---

# Paso 7

Validar primas

---

## Campos principales

```text
EPNETA
EPRIMINI-POL
EPRIMACT-TEORICA
```

---

## Verificar

```text
Importes positivos.
Formato correcto.
Coherencia entre campos.
```

---

## Detectar

```text
Primas negativas.
Primas inconsistentes.
```

---

# Paso 8

Validar capitales

---

## Campo principal

```text
ECAPGAR
```

---

## Verificar

```text
Capital informado.
Capital coherente.
Capital compatible con garantía.
```

---

# Paso 9

Validar bases técnicas

---

## Campos relevantes

```text
GBT
CASADA
PINTER-TEC
CTABMORTAL
NPERIODO-INTTEC
```

---

## Verificar

```text
Base técnica existente.
Intereses válidos.
Tabla mortalidad válida.
```

---

## Detectar

```text
Datos actuariales inconsistentes.
Configuraciones incompletas.
```

---

# Paso 10

Validar reglas actuariales

---

## CASADA

Regla:

```text
IT1 ≠ 0
y
IT2 ≠ 0

→ S
```

---

## Verificar

```text
Consistencia con los ajustes.
```

---

## Interés Técnico

Validar:

```text
IT1
IT2
DT1
DT2
```

---

## Gastos

Validar:

```text
GI
GE
GIPC
```

---

# Paso 11

Validar información comercial

---

## Campos

```text
OFICOMER
KINTER
CCANAL
```

---

## Verificar

```text
Canal válido.
Oficina válida.
Intermediario válido.
```

---

# Paso 12

Validar coaseguro

---

## Campos

```text
TIPO-COASE
PCOASE
```

---

## Verificar

```text
Porcentaje válido.
Configuración coherente.
```

---

# Paso 13

Identificar campos pendientes

---

## Clasificación

### No informado

```text
Campo no disponible.
```

---

### Pendiente funcional

```text
Regla no definida.
```

---

### Pendiente técnico

```text
Campo REEF pendiente.
```

---

### Pendiente actuarial

```text
Dependiente de análisis futuro.
```

---

# Análisis de Riesgo

## Riesgo Crítico

Ejemplos:

```text
Modalidad incorrecta.
Garantía incorrecta.
Interés técnico incorrecto.
Tabla mortalidad incorrecta.
```

---

## Riesgo Alto

Ejemplos:

```text
Primas erróneas.
Capitales erróneos.
Estado incoherente.
```

---

## Riesgo Medio

Ejemplos:

```text
Prestaciones incompletas.
Fechas inconsistentes.
```

---

## Riesgo Bajo

Ejemplos:

```text
Campos informativos.
Observaciones documentales.
```

---

# Salidas Esperadas

## Resultado General

Formato:

```text
VALIDADO

VALIDADO CON OBSERVACIONES

NO VALIDADO
```

---

## Hallazgos

Listado de inconsistencias detectadas.

---

## Campos Revisados

Inventario completo.

---

## Riesgos

Clasificados por criticidad.

---

## Recomendaciones

Acciones de corrección priorizadas.

---

# Formato de Respuesta Esperado

```text
Campo
↓
Validación ejecutada
↓
Resultado
↓
Observaciones
↓
Riesgo
↓
Recomendación
```

---

# Checklist

Verificar:

- [ ] Identificadores validados.
- [ ] Mappings validados.
- [ ] Prestaciones validadas.
- [ ] Estados validados.
- [ ] Fechas validadas.
- [ ] Primas validadas.
- [ ] Capitales validados.
- [ ] Bases técnicas validadas.
- [ ] Reglas actuariales validadas.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿La información es consistente?

¿Las reglas actuariales se cumplen?

¿Los mappings son correctos?

¿Las primas son coherentes?

¿Los capitales son válidos?

¿Existen errores en la cartera?

¿La carga puede considerarse válida?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Se valida la coherencia funcional de la cartera.
- Se revisan todas las reglas documentadas.
- Se detectan inconsistencias y riesgos.
- Se verifica la trazabilidad hacia REEF.
- Se emite un diagnóstico objetivo sobre la calidad de la información analizada.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
