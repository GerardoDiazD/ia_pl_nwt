---
name: sk-validar-trazabilidad-reef
type: skill
version: 1.1
description: Valida la trazabilidad completa entre identificadores externos e internos de REEF, verificando la existencia y coherencia de NUM_POLIZA_CLIENTE, G2990002 y las entidades de contratación asociadas.
domain: trazabilidad
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - estado_trazabilidad
  - validaciones
  - incidencias
  - advertencias
  - errores

tags:
  - reef
  - trazabilidad
  - migracion
  - integracion
  - identificadores
  - num_poliza_cliente
  - g2990002
---

# Objetivo

Garantizar que cualquier información procedente de sistemas externos conserve una trazabilidad completa dentro de REEF.

La skill verifica la relación entre:

```text
Sistema externo

↓

NUM_POLIZA_CLIENTE

↓

G2990002

↓

A2000030

↓

Contratación REEF
```

---

# Cuándo utilizar esta skill

Utilizar cuando sea necesario:

```text
Validar migraciones.

Auditar integraciones.

Verificar datos históricos.

Comprobar trazabilidad de certificados.

Diagnosticar incidencias funcionales.

Revisar cargas masivas.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformación de compañías.

Transformación de suplementos.

Conversión de certificados.

Normalización de contratos.

Cálculo de negocio.
```

---

# Conceptos Gestionados

## Identificador Externo

Representa la identificación original procedente del sistema origen.

---

### Campo

```text
A2000030.NUM_POLIZA_CLIENTE
```

---

### Finalidad

```text
Mantener trazabilidad.

Conservar identificación histórica.

Permitir localización cruzada.
```

---

## Registro de Trazabilidad

Representa la persistencia de identificadores externos.

---

### Tabla

```text
G2990002
```

---

### Finalidad

```text
Relacionar identificadores externos e internos.
```

---

## Certificado REEF

Representa el certificado generado internamente.

---

### Tabla

```text
A2000030
```

---

### Campo Principal

```text
NUM_POLIZA
```

---

# Capacidades

## Validar NUM_POLIZA_CLIENTE

Comprueba que existe una identificación externa válida.

---

### Entrada

```yaml
numPolizaCliente: "000000012514560000000005"
```

---

### Resultado

```yaml
valido: true
```

---

## Validar Formato

Verifica que la estructura sea correcta.

---

### Formato Esperado

```text
10 posiciones póliza

4 posiciones subpóliza

10 posiciones certificado
```

---

### Longitud Total

```text
24 posiciones
```

---

### Error

```text
NUM_POLIZA_CLIENTE inválido.
```

---

# Validar Existencia en G2990002

Comprueba que existe una referencia registrada.

---

### Regla

Todo:

```text
NUM_POLIZA_CLIENTE
```

debe existir en:

```text
G2990002
```

---

### Resultado Correcto

```yaml
registroG2990002: true
```

---

### Resultado Incorrecto

```yaml
registroG2990002: false
```

---

### Error

```text
No existe trazabilidad en G2990002.
```

---

# Validar Existencia en A2000030

Comprueba que existe el certificado asociado.

---

### Resultado

```yaml
registroA2000030: true
```

---

### Error

```text
No existe certificado asociado.
```

---

# Validar Cadena Completa

Verifica la trazabilidad completa entre origen y REEF.

---

### Cadena Esperada

```text
NUM_POLIZA_CLIENTE

↓

G2990002

↓

A2000030

↓

Certificado REEF
```

---

### Resultado

```yaml
estado: COMPLETO
```

---

### Posibles Valores

```text
COMPLETO

PARCIAL

INCONSISTENTE

NO_ENCONTRADO
```

---

# Análisis de Huérfanos

Detecta identificadores sin relación válida.

---

## Caso 1

Existe:

```text
NUM_POLIZA_CLIENTE
```

pero no existe:

```text
G2990002
```

---

### Resultado

```yaml
estado: HUERFANO
```

---

## Caso 2

Existe:

```text
G2990002
```

pero no:

```text
A2000030
```

---

### Resultado

```yaml
estado: INCOMPLETO
```

---

# Análisis Inverso

Permite localizar el origen a partir de un certificado REEF.

---

### Entrada

```yaml
numPoliza: 123456
```

---

### Resultado

```yaml
numPolizaCliente: "000000012514560000000005"

trazabilidad: LOCALIZADA
```

---

# Análisis Directo

Permite localizar el certificado REEF a partir del identificador externo.

---

### Entrada

```yaml
numPolizaCliente: "000000012514560000000005"
```

---

### Resultado

```yaml
numPoliza: 123456

estado: LOCALIZADO
```

---

# Validaciones

## Identificador Obligatorio

Verificar:

```text
NUM_POLIZA_CLIENTE informado.
```

---

### Error

```text
Identificador externo no informado.
```

---

## Longitud Correcta

Verificar:

```text
24 posiciones.
```

---

### Error

```text
Longitud incorrecta.
```

---

## Registro G2990002

Verificar:

```text
Existe referencia.
```

---

### Error

```text
No existe referencia en G2990002.
```

---

## Registro A2000030

Verificar:

```text
Existe certificado.
```

---

### Error

```text
No existe certificado asociado.
```

---

## Consistencia

Verificar:

```text
La relación entre identificadores es coherente.
```

---

### Error

```text
Inconsistencia de trazabilidad.
```

---

# Indicadores de Estado

## COMPLETO

```text
Toda la trazabilidad existe.
```

---

## PARCIAL

```text
Existen elementos intermedios faltantes.
```

---

## INCONSISTENTE

```text
Los datos no coinciden.
```

---

## NO_ENCONTRADO

```text
No existe información asociada.
```

---

## HUERFANO

```text
Existe identificador sin relación.
```

---

# Advertencias

## Identificador Legacy

```text
Identificador procedente de migración histórica.
```

---

## Registro Incompleto

```text
La cadena de trazabilidad no está completamente construida.
```

---

## Relaciones Duplicadas

```text
Existen múltiples registros asociados.
```

---

# Errores

## NUM_POLIZA_CLIENTE No Informado

```text
Identificador externo obligatorio.
```

---

## Error de Longitud

```text
Formato inválido.
```

---

## G2990002 Ausente

```text
No existe trazabilidad registrada.
```

---

## Certificado Ausente

```text
No existe A2000030 asociado.
```

---

## Inconsistencia Detectada

```text
Los identificadores relacionados no coinciden.
```

---

# Salidas

## estado_trazabilidad

Estado general de la trazabilidad.

---

## validaciones

Resultado detallado de cada control realizado.

---

## incidencias

Problemas encontrados durante el análisis.

---

## advertencias

Situaciones no bloqueantes.

---

## errores

Errores críticos detectados.

---

# Caso 1 — Trazabilidad Correcta

Entrada:

```yaml
numPolizaCliente: "000000012514560000000005"
```

Resultado:

```yaml
estado_trazabilidad: COMPLETO

g2990002: true

a2000030: true

errores: []

advertencias: []
```

---

# Caso 2 — Registro Huérfano

Entrada:

```yaml
numPolizaCliente: "000000012514560000000005"
```

Resultado:

```yaml
estado_trazabilidad: HUERFANO

g2990002: false

a2000030: false

errores:
  - No existe trazabilidad en G2990002
```

---

# Caso 3 — Inconsistencia

Entrada:

```yaml
numPolizaCliente: "000000012514560000000005"
```

Resultado:

```yaml
estado_trazabilidad: INCONSISTENTE

errores:
  - Los identificadores relacionados no coinciden
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Se conoce el estado real de la trazabilidad.
- Se verifica la presencia de NUM_POLIZA_CLIENTE.
- Se valida la existencia de G2990002.
- Se valida la existencia de A2000030.
- Se detectan registros huérfanos o inconsistentes.
- Se garantiza la trazabilidad completa entre sistemas externos y REEF.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
