---
name: inst-newtron-nomenclatura
type: instruction
description: Reglas de nomenclatura que deben seguirse al crear o modificar artefactos dentro de la plataforma NewTron.
domain: newtron
version: 1.1
owner: arquitectura-reef
---

# Instrucciones de nomenclatura NewTron

## Objetivo

Garantizar que cualquier elemento creado o modificado dentro del ecosistema NewTron mantenga una nomenclatura consistente con los estándares corporativos.

Fuente de verdad recomendada:

- rag:newtron-acronimos
- rag:newtron-nomenclatura
- rag:newtron-convenciones-mapstruct cuando aplique a mapeos

---

## Regla general

Antes de crear cualquier artefacto:

1. Identificar el dominio funcional al que pertenece.
2. Identificar el módulo correspondiente.
3. Aplicar la convención de nomenclatura definida para dicho artefacto.
4. Mantener coherencia con elementos existentes del mismo dominio.

---

## Uso de acrónimos

- Utilizar exclusivamente los acrónimos oficiales definidos para NewTron.
- No crear nuevas variantes de acrónimos existentes.
- Mantener los acrónimos en mayúsculas cuando formen parte de identificadores funcionales.

Ejemplos:

```text
CMN
ISU
RNS
LSS
TSY
THP
```

## Reglas para agentes IA

- Priorizar siempre las KBs de Arquiitectura frente a conocimiento generalista.
- No inventar abreviaturas ni patrones fuera de los definidos en las KBs.
- Si el artefacto es Java y requiere mapeo, revisar tambien la KB de MapStruct.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
