---
name: inst-modificar-configuracion-bkesp
type: instruction
description: Instrucciones operativas para modificar configuraciones del repositorio reef-vida-bkesp-mongo garantizando consistencia funcional, integridad de configuración y compatibilidad con los procesos de carga e integración.
domain: bkesp
version: 1.1
owner: arquitectura-reef
priority: alta
---

# Instrucción: Modificación de Configuración BKESP

## Objetivo

Garantizar que cualquier cambio realizado en el repositorio:

```text
reef-vida-bkesp-mongo
```

mantenga:

```text
Consistencia funcional.
Compatibilidad técnica.
Integridad de configuración.
Trazabilidad de negocio.
```

---

# Alcance

Aplica a cualquier modificación realizada en:

```text
BASES TECNICAS
OFERTA COMERCIAL
SELECCION DE RIESGOS
SUPLEMENTOS
```

y a cualquier fichero JSON gestionado dentro del modelo BKESP.

---

# Contexto Funcional

## País

Valores válidos observados:

```text
ESP
ES
ES0001
```

---

## Compañía principal

```text
20003
```

---

## Ramo principal

```text
118
```

---

# Principio General

Antes de modificar cualquier fichero:

```text
Analizar el dominio afectado.
Validar consistencia cruzada.
Mantener compatibilidad hacia atrás.
```

No introducir cambios aislados que rompan relaciones entre configuraciones.

---

# Regla de País

## Obligatorio

Respetar el formato utilizado por cada colección.

Ejemplos:

```text
ESP
ES
ES0001
```

---

## Prohibido

```text
Mezclar códigos de país dentro de la misma estructura
```

salvo que el modelo de datos lo requiera explícitamente.

---

# Regla de Compañía

## Obligatorio

Mantener:

```text
company = 20003
```

o

```text
cmpVal = 20003
```

cuando corresponda al modelo BKESP.

---

## Prohibido

Introducir compañías ajenas al dominio de Vida España sin justificación funcional documentada.

---

# Regla de Ramo

## Obligatorio

Mantener:

```text
branch = 118
```

o

```text
lobVal = 118
```

según el fichero.

---

## Prohibido

Modificar el ramo sin requerimiento funcional explícito.

---

# Reglas de Consistencia

## Obligatorio

Mantener coherencia entre:

```text
Oferta comercial.
Selección de riesgos.
Suplementos.
Bases técnicas.
```

---

## Verificar

Que los identificadores utilizados sean consistentes.

Ejemplos:

```text
Producto.
Cobertura.
Subramo.
Suplemento.
```

---

# Reglas de Formato JSON

## Obligatorio

Mantener estructura JSON válida.

---

## Preferido

Colecciones masivas como:

```json
[]
```

---

## Conservar

Formatos extendidos MongoDB existentes:

```json
{
  "$oid": "..."
}
```

```json
{
  "$date": "..."
}
```

---

## Prohibido

Renombrar propiedades existentes.

---

## Motivo

Compatibilidad con procesos de integración.

---

# Reglas de Flags

Respetar el formato utilizado por cada fichero.

---

## Booleanos

```json
true
false
```

---

## Legacy

```text
Y
N
```

---

## Prohibido

Mezclar modelos sin que el esquema lo requiera.

---

# Convenciones de Nomenclatura

## Integración técnica

```text
rte-int.*
```

---

## Reglas o duplicados

```text
dup-int.*
```

---

## Directorios de ramo

```text
RAMO_118
```

---

## Selección de riesgos

Mantener:

```text
PRE/NIVEL-ATRIBUTOS-*
POST/NIVEL-ATRIBUTOS-*
```

---

## Prohibido

Renombrar ficheros existentes sin necesidad funcional.

---

# Reglas para Bases Técnicas

## Obligatorio

Mantener relación unívoca entre:

```text
codBt
namBt
```

---

## Verificar

Que cada tabla técnica disponga de:

```text
tableCode
tableDesc
```

---

## Mantener

Coherencia entre:

```text
Condiciones.
Factores.
Cálculos.
```

---

# Reglas para Oferta Comercial

## Obligatorio

Mantener:

```text
country
company
branch
```

---

## Verificar

Coherencia entre:

```text
coverage
subBranch
fields
```

---

## Mantener

Información de carga:

```text
jobId
isLatest
isModified
fechas
```

---

# Reglas para Selección de Riesgos

## Obligatorio

Las reglas deben contener cuando aplique:

```text
execution_type
process_type
process_step
```

---

## Verificar

Existencia de:

```text
Condiciones.
Acciones.
Mensajes.
```

---

## Regla especial

Si:

```text
active = "N"
```

debe existir justificación funcional documentada.

---

## Mantener

Consistencia entre:

```text
COLLECTIONS
PRE
POST
```

---

# Reglas para Suplementos

## Obligatorio

Mantener coherencia entre:

```text
supplementCode
supplementSubCode
supplementType
```

---

## Verificar

Que:

```text
operation
implementation
```

sean válidos.

---

## Conservar

Nomenclatura legacy exacta.

Especialmente:

```text
Claves en mayúsculas.
Formato original.
```

---

# Compatibilidad

## Obligatorio

Preservar compatibilidad con procesos consumidores.

---

## Prohibido

```text
Eliminar propiedades existentes.
Modificar estructuras públicas.
Romper contratos de integración.
```

---

# Validaciones Previas al Commit

Verificar:

- JSON válido.
- Sin errores de estructura.
- Sin atributos obligatorios eliminados.
- Sin cambios accidentales de país.
- Sin cambios accidentales de compañía.
- Sin cambios accidentales de ramo.
- Consistencia entre dominios afectados.

---

# Validaciones Previas al Pull Request

Verificar:

- Consistencia funcional.
- Consistencia técnica.
- Compatibilidad de integración.
- Validación manual de JSON.
- Evidencias de prueba documentadas.

---

# Flujo de Contribución

Seguir el proceso estándar:

```text
feature/*
↓
commit
↓
push
↓
Pull Request
↓
revisión
↓
aprobación
```

---

# Restricciones

No realizar:

```text
Cambios masivos sin validación.
Cambios de identidad país.
Cambios de compañía.
Cambios de ramo.
Renombrado de propiedades públicas.
```

sin requerimiento funcional documentado.

---

# Checklist de Cumplimiento

- [ ] JSON válido.
- [ ] País consistente.
- [ ] Company = 20003.
- [ ] Branch = 118.
- [ ] Compatibilidad preservada.
- [ ] Nomenclatura respetada.
- [ ] Consistencia entre dominios.
- [ ] Integraciones no afectadas.
- [ ] Evidencias documentadas.
- [ ] PR preparada para revisión.

---

# Definición de Éxito

La instrucción se considera cumplida cuando:

- El cambio mantiene la coherencia del modelo BKESP.
- No se rompe ninguna integración existente.
- Se preservan los identificadores funcionales del dominio.
- Los datos siguen siendo consumibles por los procesos ACDC.
- La modificación es trazable, validable y desplegable sin impactos no controlados.