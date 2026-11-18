---
name: sk-generar-objeto-newtron
type: skill
description: Diseña objetos corporativos NewTRON (TYPE Oracle) con nomenclatura estandar, composicion correcta y gobierno Objerator.
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
    - rag:kb-gobierno-modelo-datos-newtron
---

# Skill: Generar Objeto NewTRON

## Objetivo

Modelar objetos O_* reutilizables para intercambio entre capas DL/BL/SR sin duplicidad semantica.

## Reglas clave

1. Buscar en catalogo antes de crear.
2. Reutilizar y extender con aprobacion.
3. No crear tipos paralelos.

## Ubicacion

```text
NWT_O
```

## Convencion

```text
O_[FAMILIA]_[CONCEPTO]_[TIPO]
```

Tipos admitidos:

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

## Procedimiento

1. Identificar familia y concepto.
2. Verificar existencia en Objerator.
3. Elegir tipo adecuado (S/P/T/PT/C/PC/CT/CPT).
4. Diseñar atributos funcionales y de proceso.
5. Definir contratos para consumo en DL/BL/SR.

## Reglas de modelado

- S: datos base.
- P: S + estado/mensajes/errores.
- T: TABLE OF ..._S.
- PT: TABLE OF ..._P.
- C: agregacion de objetos.
- PC, CT, CPT: variantes compuestas.

## Salida esperada

- Definicion de tipo(s) objetivo.
- Razon de seleccion del tipo.
- Relacion con objetos existentes.

## Checklist

- [ ] Nombre O_*_*_* valido.
- [ ] Familia y concepto corporativos.
- [ ] Seleccion correcta de tipo.
- [ ] Sin duplicidad funcional.
- [ ] Compatible con DL/BL/SR.

## Definicion de exito

El objeto es reutilizable, gobernable y coherente con el modelo corporativo NewTRON.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
