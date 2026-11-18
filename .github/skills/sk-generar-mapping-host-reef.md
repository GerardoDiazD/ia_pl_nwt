---
name: sk-generar-mapping-host-reef
type: skill
description: Genera especificaciones de mapeo entre estructuras Host, IDMS y REEF a partir de layouts de entrada, identificando transformaciones, tablas destino, reglas de conversión y trazabilidad extremo a extremo.
domain: migracion-datos
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:BDM-Contratos
---

# Skill: Generar Mapping Host → REEF

## Objetivo

Construir una especificación de mapeo funcional y técnico entre:

```text
Host
↓
IDMS
↓
REEF
```

a partir de layouts, documentos funcionales o estructuras de intercambio.

La finalidad es producir una definición completa y trazable de:

```text
Campos origen.
Transformaciones.
Tablas destino.
Campos destino.
Reglas de conversión.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Analizar un nuevo fichero Host.
Diseñar una migración.
Documentar integraciones.
Definir cargas masivas.
Preparar una especificación funcional.
Construir un mapeo Host → REEF.
```

---

# Entradas

## Layout Host

Ejemplo:

```text
Campo
Tipo
Longitud
Posición
Descripción
```

---

## Documento Funcional

Ejemplo:

```text
Análisis IDMS.
Diseño funcional.
Especificación de migración.
```

---

## Diccionario de Datos

Ejemplo:

```text
Entidades.
Tablas.
Campos.
```

---

# Procedimiento

## Paso 1

Inventariar campos origen.

---

## Identificar

```text
Nombre.
Tipo.
Longitud.
Posición.
Descripción.
```

---

## Clasificar

```text
Texto.
Numérico.
Fecha.
Indicador.
Código.
```

---

# Paso 2

Buscar correspondencia funcional

Determinar:

```text
Campo equivalente IDMS.
Campo equivalente REEF.
```

---

## Clasificación

### Mapeo directo

Ejemplo:

```text
RAMO
↓
COD_RAMO
```

---

### Mapeo transformado

Ejemplo:

```text
GNOMCOMPLETO
↓
Nombre
Apellido1
Apellido2
```

---

### Mapeo compuesto

Ejemplo:

```text
CCONTRATO
↓
Varias columnas destino
```

---

### Sin correspondencia

Ejemplo:

```text
Campo pendiente.
Campo no identificado.
```

---

# Paso 3

Determinar tabla destino

---

## Identificar

```text
Tabla REEF.
Entidad funcional.
Dominio de negocio.
```

---

## Ejemplos

```text
A2000011
A1001399
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
```

---

# Paso 4

Definir transformaciones

---

## Posibles transformaciones

### Conversión de fecha

```text
YYYYMMDD
↓
DATE
```

---

### Conversión numérica

```text
COMP-3
↓
NUMBER
```

---

### Fragmentación

```text
Nombre completo
↓
Nombre
Apellido1
Apellido2
```

---

### Concatenación

```text
Póliza
+ certificado
↓
Contrato
```

---

### Valores fijos

```text
V
AG
00000000
```

---

# Paso 5

Identificar reglas de negocio

---

## Ejemplos

```text
Persona física.
Persona jurídica.
Tomador.
Asegurado.
Beneficiario.
```

---

## Detectar

Casos de transformación condicionada.

---

# Paso 6

Clasificar calidad del mapeo

---

## Confirmado

Existe:

```text
Tabla.
Campo.
Regla.
```

---

## Parcial

Existe:

```text
Tabla.
Sin campo definitivo.
```

---

## Pendiente

Existe:

```text
Información insuficiente.
```

---

# Salidas Esperadas

## Matriz de Mapeo

Formato:

```text
Campo Host
↓
Campo IDMS
↓
Tabla REEF
↓
Campo REEF
```

---

## Reglas de Conversión

Listado detallado.

---

## Campos Pendientes

Listado de incertidumbres.

---

## Dependencias

Entidades involucradas.

---

## Riesgos

Ambigüedades detectadas.

---

# Formato de Respuesta Esperado

```text
Campo origen
↓
Transformación
↓
Tabla destino
↓
Campo destino
↓
Observaciones
```

---

# Checklist

Verificar:

- [ ] Campos identificados.
- [ ] Posiciones identificadas.
- [ ] Mapping definido.
- [ ] Tabla destino identificada.
- [ ] Transformaciones documentadas.
- [ ] Valores fijos identificados.
- [ ] Campos pendientes identificados.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Dónde carga este campo Host?

¿Qué tabla REEF utiliza?

¿Qué transformación necesita?

¿Existe equivalencia directa?

¿Qué campos están sin mapping?

¿Qué reglas funcionales aplican?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Existe trazabilidad completa Host → IDMS → REEF.
- Todas las transformaciones están documentadas.
- Se identifican las tablas y campos destino.
- Se documentan ambigüedades y riesgos.
- La especificación puede utilizarse directamente para implementar una migración o integración.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
