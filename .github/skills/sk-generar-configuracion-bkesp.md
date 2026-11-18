---
name: sk-generar-configuracion-bkesp
type: skill
description: Genera configuraciones JSON compatibles con el repositorio reef-vida-bkesp-mongo respetando las reglas funcionales de España, las estructuras ACDC y los estándares de integración definidos para BKESP.
domain: bkesp
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-modificar-configuracion-bkesp.md
  knowledge:
    - rag:reglas_pais_espana
---

# Skill: Generar Configuración BKESP

## Objetivo

Generar nuevos artefactos de configuración BKESP compatibles con el ecosistema:

```text
reef-vida-bkesp-mongo
```

garantizando:

```text
Consistencia funcional.
Compatibilidad técnica.
Cumplimiento de reglas país España.
Integridad entre dominios.
Compatibilidad con cargas Mongo.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Crear una nueva cobertura.
Crear un nuevo suplemento.
Crear una nueva base técnica.
Crear reglas de selección de riesgos.
Añadir configuraciones comerciales.
Generar nuevas parametrizaciones BKESP.
```

---

# Entradas Esperadas

La skill debe identificar:

## Dominio objetivo

Opciones:

```text
BASES TECNICAS
OFERTA COMERCIAL
SELECCION DE RIESGOS
SUPLEMENTOS
```

---

## Tipo de configuración

Ejemplos:

```text
Cobertura.
Subramo.
Tabla técnica.
Regla.
Suplemento.
Parámetro.
```

---

## Datos funcionales

Ejemplos:

```text
Cobertura afectada.
Producto.
Subramo.
Operación.
Atributos.
Condiciones.
```

---

# Principios de Generación

## Compatibilidad

La nueva configuración debe ser compatible con:

```text
Procesos de carga.
Procesos de integración.
Configuraciones existentes.
```

---

## No ruptura

Nunca eliminar:

```text
Propiedades obligatorias.
Claves funcionales.
Identificadores corporativos.
```

---

## Consistencia

Toda nueva información debe alinearse con:

```text
País.
Compañía.
Ramo.
```

---

# Valores Corporativos por Defecto

## País

Seleccionar según el patrón del fichero:

```text
ESP
ES
ES0001
```

---

## Compañía

Utilizar:

```text
20003
```

---

## Ramo

Utilizar:

```text
118
```

---

# Generación de JSON

## Estructura

Preferir:

```json
[
]
```

para cargas masivas.

---

## Objetos Mongo

Mantener formatos existentes:

```json
{
  "$oid": "..."
}
```

---

```json
{
  "$date": "..."
}
```

---

## Codificación

Generar contenido compatible con:

```text
UTF-8
```

---

# Generación para Bases Técnicas

## Obligatorio

Crear:

```text
codBt
namBt
```

---

## Técnicas

Si existen tablas asociadas incluir:

```text
tableCode
tableDesc
```

---

## Validar

Coherencia entre:

```text
Base técnica.
Factores.
Condiciones.
```

---

# Generación para Oferta Comercial

## Obligatorio

Crear:

```text
country
company
branch
```

---

## Mantener

Coherencia entre:

```text
coverage
subBranch
fields
```

---

## Información de carga

Incluir cuando aplique:

```text
jobId
isLatest
isModified
```

---

# Generación para Selección de Riesgos

## Obligatorio

Generar:

```text
execution_type
process_type
process_step
```

---

## Validaciones

Incluir:

```text
conditions
actions
```

cuando la regla lo requiera.

---

## Estado

Generar:

```text
active = "Y"
```

por defecto salvo requerimiento distinto.

---

# Generación para Suplementos

## Obligatorio

Crear:

```text
supplementCode
supplementSubCode
supplementType
```

---

## Mantener

Consistencia entre:

```text
operation
implementation
```

---

## Compatibilidad Legacy

Conservar:

```text
Mayúsculas.
Claves históricas.
Formato original.
```

---

# Reglas de Nomenclatura

## Integraciones técnicas

Utilizar:

```text
rte-int.*
```

---

## Reglas

Utilizar:

```text
dup-int.*
```

---

## Directorios

Ubicar en:

```text
RAMO_118
```

---

## Selección de riesgos

Generar únicamente en:

```text
PRE/NIVEL-ATRIBUTOS-*
POST/NIVEL-ATRIBUTOS-*
```

cuando proceda.

---

# Consistencia Cruzada

Antes de generar una configuración verificar coherencia con:

```text
Oferta comercial.
Selección de riesgos.
Bases técnicas.
Suplementos.
```

---

## Evitar

```text
Coberturas huérfanas.
Subramos inexistentes.
Reglas sin producto asociado.
Suplementos incompatibles.
```

---

# Salidas Esperadas

La skill debe generar:

## JSON completo

Listo para incorporar al repositorio.

---

## Validación funcional

Resumen de cumplimiento.

---

## Dependencias afectadas

Listado de elementos relacionados.

---

## Riesgos detectados

Cuando existan.

---

# Restricciones

No generar:

```text
Company diferente de 20003.
Branch diferente de 118.
Estructuras incompatibles.
Propiedades no documentadas.
```

---

## Prohibido

```text
Renombrar claves existentes.
Eliminar atributos corporativos.
Romper contratos de integración.
```

---

# Checklist de Generación

Verificar:

- [ ] JSON válido.
- [ ] País correcto.
- [ ] Company = 20003.
- [ ] Branch = 118.
- [ ] Formato Mongo compatible.
- [ ] Nomenclatura correcta.
- [ ] Consistencia funcional.
- [ ] Integración preservada.
- [ ] Dominio correcto.
- [ ] Configuración reutilizable.

---

# Preguntas que esta Skill debe responder

```text
¿Cómo crear una nueva configuración BKESP?

¿Cómo generar un JSON compatible con ACDC?

¿Qué atributos son obligatorios?

¿Cómo mantener consistencia entre dominios?

¿Cómo crear una cobertura o suplemento sin romper integraciones?

¿Cómo generar configuraciones listas para despliegue?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- La configuración generada cumple las reglas BKESP.
- Puede incorporarse directamente al repositorio.
- Mantiene compatibilidad con los procesos consumidores.
- Respeta país, compañía y ramo corporativos.
- No introduce inconsistencias funcionales.
- Puede ser validada y desplegada sin modificaciones adicionales.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
