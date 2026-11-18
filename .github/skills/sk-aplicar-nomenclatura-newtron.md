---
name: sk-aplicar-nomenclatura-newtron
type: skill
description: Aplica las convenciones oficiales de nomenclatura NewTron para generar o validar nombres de artefactos técnicos y funcionales.
domain: newtron
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:newtron-acronimos
    - rag:newtron-nomenclatura
    - rag:newtron-convenciones-mapstruct
  instructions:
    - instructions/inst-newtron-nomenclatura.md
---

# Skill: Aplicar Nomenclatura NewTron

## Objetivo

Generar o validar nombres de artefactos siguiendo las convenciones oficiales de nomenclatura definidas para la plataforma NewTron.

Esta skill debe utilizarse siempre que se creen, modifiquen o revisen:

- Tablas.
- Vistas.
- Secuencias.
- Columnas.
- Procedimientos.
- Functions.
- Packages.
- Triggers.
- Programas Java.
- Packages Java.
- Clases.
- Variables.
- Constantes.
- Componentes funcionales.

---

## Conocimientos requeridos

Consultar:

```text
rag:newtron-acronimos
rag:newtron-nomenclatura
rag:newtron-convenciones-mapstruct
```

---

## Procedimiento

### Paso 1: Identificar el artefacto

Determinar si el elemento a nombrar o validar es:

- tabla, vista o secuencia,
- columna,
- procedimiento, function, package o trigger,
- programa Java,
- package Java,
- clase, metodo, variable o constante,
- mapper o componente asociado a integracion.

### Paso 2: Identificar dominio y modulo

Comprobar:

- dominio funcional,
- acronimo o codigo de modulo,
- si el artefacto es estandar o especifico de instalacion.

### Paso 3: Aplicar la plantilla correcta

Usar la estructura correspondiente:

- `TMMMONNN_UUU` para tablas, vistas y secuencias,
- `AAA_XXXXXX` para columnas,
- `mm_t_nombre_uuu` para procedimientos y objetos PL/SQL,
- `PPMMMNNN_UUU` para programas Java,
- lowerCamelCase para metodos,
- mayusculas con `_` para constantes.

### Paso 4: Validar restricciones

Revisar:

- longitud maxima,
- uso exclusivo de abreviaturas autorizadas,
- coherencia con artefactos vecinos,
- ausencia de caracteres no permitidos.

### Paso 5: Ajustar segun contexto

Si el artefacto participa en mapeos o integraciones, validar tambien consistencia con DTOs, mappers y contratos relacionados.

---

## Resultado esperado

- Nombre propuesto o validado.
- Justificacion de la convencion aplicada.
- Riesgos o incumplimientos detectados.

## Criterios de exito

La skill se considera completada cuando:

- el nombre sigue la plantilla correcta,
- usa acronimos oficiales,
- respeta las restricciones del tipo de artefacto,
- es coherente con el dominio NewTron.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
