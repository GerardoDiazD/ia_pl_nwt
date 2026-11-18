---
name: inst-transformacion-host-ascii
type: instruction
description: Estándar corporativo para transformar especificaciones Host en documentación normalizada Host→ASCII→IDMS→REEF, incluyendo cálculo de posiciones ASCII, interpretación de tipos COBOL, reglas de mapping y generación de documentación reutilizable.
domain: migracion-datos
version: 1.1
owner: arquitectura-reef
---

# Instrucción: Transformación Host → ASCII → IDMS → REEF

## Objetivo

Definir las reglas obligatorias para transformar una especificación de campos Host en un documento de mapeo normalizado.

Esta instrucción garantiza que todos los documentos de migración mantengan:

```text
Consistencia.
Trazabilidad.
Reutilización.
Homogeneidad documental.
```

---

# Ámbito

Aplicable a:

```text
Ficheros Host.
Layouts COBOL.
Especificaciones CETL.
Migraciones IDMS.
Migraciones REEF.
Procesos ETL.
Documentación de integración.
```

---

# Estructura Objetivo

Todo documento generado debe utilizar la siguiente estructura:

```text
| Campo CETL |
| Tipo Host |
| Posición Host |
| Tipo ASCII |
| Posición ASCII |
| Descripción |
| Campo IDMS |
| Tabla Reef |
| Campo Reef |
| Notas |
```

---

# Principios Generales

## Principio de Trazabilidad

Todo campo debe poder seguirse a través de:

```text
Host
↓
IDMS
↓
REEF
```

siempre que exista la información necesaria.

---

## Principio de No Invención

Nunca se debe inventar:

```text
Tablas REEF.
Campos REEF.
Mappings.
Objetos NewTron.
Paquetes.
Relaciones funcionales.
```

---

## Principio de Evidencia

Todo mapping deberá apoyarse en:

```text
Documentación existente.
KBs corporativas.
Mapeos previamente validados.
```

---

## Principio de Continuidad

Las posiciones ASCII deben reconstruirse de forma continua.

---

# Reglas de Ordenación

## Regla General

Las filas deben ordenarse por:

```text
Posición Host
```

---

## Ejemplo

```text
1
2-3
4-5
6-13
14-15
```

---

## Prohibido

```text
Mantener el orden original
cuando no respete la continuidad posicional.
```

---

# Reglas de Conversión de Tipos

## Tipos Alfanuméricos

Cuando el tipo Host sea:

```text
X(n)
```

el tipo ASCII será:

```text
Alfanumérico
```

---

## Tipos Numéricos

Cuando el tipo Host sea:

```text
9(n)
999V99
9(3)V99
9(3)V9(4)
S9(10)V99
```

el tipo ASCII será:

```text
Numero
```

---

# Regla de la V Implícita

## Definición

La:

```text
V
```

representa el separador decimal implícito.

---

## Condición

La:

```text
V
```

no ocupa posición física.

---

## Ejemplo

### Tipo Host

```text
999V99
```

---

### Longitud ASCII

```text
5
```

---

### Interpretación

```text
12345
↓
123,45
```

---

## Ejemplo

### Tipo Host

```text
9(3)V9(4)
```

---

### Longitud ASCII

```text
7
```

---

### Interpretación

```text
1234567
↓
123,4567
```

---

# Regla del Signo

## Definición

Cuando el tipo incluya:

```text
S
```

debe añadirse una posición física para el signo.

---

## Ejemplo

### Tipo Host

```text
S9(10)V99
```

---

### Longitud ASCII

```text
13
```

compuesta por:

```text
1 signo
+
12 dígitos
```

---

# Cálculo de Longitud ASCII

## Regla X(n)

```text
Longitud ASCII = n
```

---

## Regla 9(n)

```text
Longitud ASCII = n
```

---

## Regla V

```text
Longitud ASCII =
suma total de dígitos
```

---

## Regla S

```text
Longitud ASCII =
1 + suma total de dígitos
```

---

## Ejemplos

```text
X(8)
→ 8

9(6)
→ 6

999V99
→ 5

9(3)V99
→ 5

9(3)V9(4)
→ 7

S9(10)V99
→ 13
```

---

# Cálculo de Posiciones ASCII

## Regla General

La numeración ASCII debe comenzar en:

```text
1
```

---

## Condiciones

Debe ser:

```text
Continua.
Secuencial.
Sin huecos.
Sin solapamientos.
```

---

## Ejemplo

```text
Campo A → 1

Campo B → 2-3

Campo C → 4-8
```

---

# Tratamiento de Campo IDMS

## Caso 1 - Campo Real

Ejemplos:

```text
RB86900-KSG-POLIZA

RR001063-KRAMO

RB86909-CSGDC-VALOR
```

---

## Acción

Mantener:

```text
Campo IDMS
```

e intentar localizar:

```text
Tabla Reef
Campo Reef
```

si existen referencias documentadas.

---

# Tratamiento de Valores Fijos

## Valores Reconocidos

```text
ZEROES

SPACES

"C"

"S"

"N"

"AHORRO"
```

---

## Regla

No buscar mapping REEF.

---

## Resultado

```text
Campo IDMS = valor fijo

Tabla Reef = -

Campo Reef = mismo valor fijo
```

---

## Ejemplo

```text
"C"
↓
-
↓
"C"
```

---

## Ejemplo

```text
ZEROES
↓
-
↓
ZEROES
```

---

# Reglas de Mapping REEF

## Mapping Confirmado

Se considera confirmado cuando existe:

```text
Tabla REEF identificada.
Campo REEF identificado.
Evidencia documental.
```

---

## Mapping Parcial

Se considera parcial cuando existe:

```text
Tabla REEF identificada.
Campo REEF pendiente.
```

---

## Mapping Pendiente

Se considera pendiente cuando:

```text
No existe evidencia suficiente.
```

---

# Documentación de Ambigüedades

## Obligatorio

Cuando exista incertidumbre se deberá registrar en:

```text
Notas
```

---

## Ejemplos

```text
Mapping pendiente.

Campo REEF no confirmado.

Posible correspondencia.

Revisión funcional necesaria.
```

---

# Fuentes de Referencia

Antes de construir un mapping deben consultarse:

```text
KBs corporativas.

Documentos de mapeo existentes.

Documentación funcional validada.
```

---

## Reutilización

Todo nuevo documento validado pasa a convertirse en:

```text
Documentación de referencia.
```

para futuros trabajos.

---

# Validaciones Obligatorias

## Validación Estructural

Verificar:

```text
Posición Host.
Longitud.
Tipo.
Posición ASCII.
```

---

## Validación de Continuidad

Verificar:

```text
No existen huecos.
No existen solapamientos.
```

---

## Validación de Mapping

Verificar:

```text
Tabla REEF válida.
Campo REEF válido.
```

---

## Validación Documental

Verificar:

```text
No existen mappings inventados.
Las incertidumbres están documentadas.
```

---

# Reglas de Calidad

## Obligatorio

```text
Mantener nomenclatura original.

Conservar trazabilidad.

Documentar todas las decisiones.
```

---

## Prohibido

```text
Inventar mappings.

Inventar tablas.

Inventar objetos NewTron.

Inventar funciones NWT_SR.

Inventar reglas funcionales.
```

---

# Resultado Esperado

La aplicación de esta instrucción debe producir un documento:

```text
Ordenado.
Consistente.
Trazable.
Reutilizable.
Auditabile.
```

capaz de servir como referencia para:

```text
Migraciones.
ETLs.
Carga histórica.
Integraciones.
Documentación técnica.
Documentación funcional.
```

---

# Definición de Éxito

La instrucción se considera correctamente aplicada cuando:

- El layout está ordenado por posición Host.
- Las posiciones ASCII son correctas y continuas.
- Los tipos están correctamente interpretados.
- Los valores fijos están tratados adecuadamente.
- Los mappings REEF están respaldados por documentación.
- Las incertidumbres están reflejadas en Notas.
- El documento puede reutilizarse como referencia para futuras iniciativas de migración o integración.