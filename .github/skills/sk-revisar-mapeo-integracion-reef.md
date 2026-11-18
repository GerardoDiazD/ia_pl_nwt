---
name: sk-revisar-mapeo-integracion-reef
type: skill
version: 1.1
description: Analiza y revisa propuestas de integración entre sistemas externos y REEF, detectando incumplimientos de las reglas corporativas de transformación, identificación, trazabilidad y suplementación.
domain: integracion-reef
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - resultado_revision
  - incumplimientos
  - advertencias
  - recomendaciones
  - estado

tags:
  - reef
  - integracion
  - arquitectura
  - validacion
  - revision
  - migracion
  - calidad
---

# Objetivo

Revisar un diseño funcional, técnico o un mapeo de integración para comprobar que cumple las reglas corporativas de REEF.

La skill actúa como un revisor automático de integraciones.

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite revisar:

```text
Mapeos funcionales.

Especificaciones técnicas.

Interfaces batch.

Integraciones API.

Migraciones.

Eventos corporativos.

Diseños de arquitectura.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Persistir datos.

Transformar registros.

Consultar bases de datos.

Emitir pólizas.

Modificar información.
```

---

# Alcance de la Revisión

La skill revisa:

```text
Compañías.

Pólizas.

Subpólizas.

Contratos.

Certificados.

NUM_POLIZA_CLIENTE.

Trazabilidad.

Suplementos.
```

---

# Entradas Esperadas

La revisión puede realizarse sobre:

```yaml
mapping:
```

o

```yaml
payload:
```

o

```yaml
especificacion:
```

o cualquier definición equivalente que describa una integración.

---

# Flujo de Revisión

## Paso 1

Analizar identificadores.

---

## Paso 2

Analizar compañías.

---

## Paso 3

Analizar contratos.

---

## Paso 4

Analizar certificados.

---

## Paso 5

Analizar suplementos.

---

## Paso 6

Analizar trazabilidad.

---

## Paso 7

Generar observaciones.

---

# Controles de Compañía

## Regla

Verificar que:

```text
Los códigos externos no se persistan en REEF.
```

---

### Correcto

```yaml
entrada:
  companyCode: 3

persistencia:
  companyCode: 20003
```

---

### Incorrecto

```yaml
persistencia:
  companyCode: 3
```

---

### Incumplimiento

```text
La compañía no ha sido transformada al código REEF.
```

---

# Controles de Certificados

## Regla

Los certificados almacenados en REEF deben utilizar:

```text
10 posiciones.
```

---

### Correcto

```text
0000000123
```

---

### Incorrecto

```text
123
```

---

### Incumplimiento

```text
Certificado no adaptado al formato REEF.
```

---

# Controles de NUM_POLIZA_CLIENTE

## Regla

Debe preservarse el identificador externo.

---

### Verificar

```text
Existe NUM_POLIZA_CLIENTE.
```

---

### Incumplimiento

```text
No se conserva identificador externo.
```

---

# Controles de Contratos

## Regla

El contrato debe corresponder a:

```text
G2990001.NUM_CONTRATO
```

---

### Incumplimiento

```text
Se utiliza un identificador alternativo al contrato corporativo.
```

---

# Controles de Subpóliza

## Regla

La subpóliza debe tener:

```text
Máximo 4 posiciones.
```

---

### Incumplimiento

```text
Subpóliza fuera del formato corporativo.
```

---

# Controles de Trazabilidad

## Regla

Debe existir correspondencia entre:

```text
NUM_POLIZA_CLIENTE

↓

G2990002

↓

A2000030
```

---

### Incumplimiento

```text
La integración no garantiza trazabilidad completa.
```

---

# Controles de Suplementos

## Regla

El suplemento debe existir en:

```text
A2991800
```

---

### Correcto

```text
AT

RE

RF

IN

CA
```

---

### Incorrecto

```text
ZZ

XXY

TEST
```

---

### Incumplimiento

```text
Suplemento inexistente en catálogo.
```

---

# Controles de Migración

## Póliza Grupo

Validar:

```text
0 - 549999
```

---

### Advertencia

```text
Póliza fuera del rango reservado para migración.
```

---

## Subpóliza

Validar:

```text
0 - 29999
```

---

### Advertencia

```text
Subpóliza fuera del rango reservado para migración.
```

---

# Clasificación del Resultado

## CORRECTO

No existen incumplimientos.

---

## ACEPTABLE

Existen únicamente advertencias.

---

## DEFICIENTE

Existen incumplimientos corregibles.

---

## CRITICO

Existen errores bloqueantes.

---

# Generación de Recomendaciones

La skill propondrá acciones correctivas.

---

### Ejemplo

Incumplimiento:

```text
Certificado almacenado con longitud 6.
```

---

Recomendación:

```text
Adaptar certificado a 10 posiciones antes de persistir.
```

---

### Ejemplo

Incumplimiento:

```text
No existe NUM_POLIZA_CLIENTE.
```

---

Recomendación:

```text
Añadir conservación del identificador externo.
```

---

### Ejemplo

Incumplimiento:

```text
Suplemento no existente.
```

---

Recomendación:

```text
Utilizar únicamente suplementos parametrizados en A2991800.
```

---

# Advertencias

## Formato Legacy

```text
Diseño procedente de sistema heredado.
```

---

## Conversión No Especificada

```text
No se documenta la transformación de compañía.
```

---

## Trazabilidad Parcial

```text
No se identifica cómo se relaciona el origen con REEF.
```

---

# Errores

## Identificador Externo Ausente

```text
La integración pierde la trazabilidad histórica.
```

---

## Certificado Inválido

```text
Longitud incompatible con REEF.
```

---

## Compañía Inválida

```text
No existe equivalencia corporativa.
```

---

## Suplemento Inexistente

```text
Código fuera del catálogo oficial.
```

---

# Salidas

## estado

Resultado global.

---

## resultado_revision

Resumen ejecutivo de la revisión.

---

## incumplimientos

Listado de incumplimientos detectados.

---

## advertencias

Listado de observaciones no bloqueantes.

---

## recomendaciones

Acciones sugeridas para cumplir los estándares REEF.

---

# Caso 1 — Integración Correcta

Entrada:

```yaml
companyCode: 3

companyCodeDestino: 20003

certificate: 0000000123

supplementType: AT

numPolizaCliente: 000000012514560000000005
```

---

Resultado:

```yaml
estado: CORRECTO

incumplimientos: []

advertencias: []

recomendaciones: []
```

---

# Caso 2 — Integración con Problemas

Entrada:

```yaml
companyCode: 3

companyCodeDestino: 3

certificate: 123

supplementType: ZZ
```

---

Resultado:

```yaml
estado: CRITICO

incumplimientos:
  - Compañía no transformada a código REEF
  - Certificado no normalizado
  - Suplemento inexistente

recomendaciones:
  - Transformar compañía a 20003
  - Adaptar certificado a 10 posiciones
  - Utilizar suplemento válido
```

---

# Resultado Esperado

Al finalizar la ejecución:

- El diseño de integración queda validado frente a los estándares REEF.
- Se detectan incumplimientos tempranamente.
- Se garantiza consistencia entre sistemas.
- Se preserva la trazabilidad corporativa.
- Se evita la propagación de errores a desarrollo y pruebas.
- Los equipos reutilizan criterios homogéneos de integración.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
