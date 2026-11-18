---
name: sk-generar-clave-negocio-reef
type: skill
version: 1.1
description: Genera, interpreta y valida claves funcionales de negocio para identificación unívoca de pólizas colectivas en REEF, utilizando póliza grupo, subpóliza, contrato y certificado.
domain: identificacion-polizas
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - clave_negocio
  - componentes
  - validaciones
  - advertencias
  - errores

tags:
  - reef
  - business-key
  - identificacion
  - polizas
  - certificados
  - integracion
  - trazabilidad
---

# Objetivo

Construir y validar claves funcionales de negocio para identificar de forma inequívoca una contratación dentro de REEF.

Esta skill permite generar identificadores consistentes para:

```text
Interfaces.

Eventos.

Logs.

Migraciones.

Auditorías.

Procesos de integración.
```

---

# Motivación

En REEF existen múltiples identificadores:

```text
NUM_POLIZA_GRP

NUM_CONTRATO

NUM_SUBPOLIZA

NUM_POLIZA

NUM_POLIZA_CLIENTE
```

Dependiendo del contexto es necesario construir una clave funcional que permita identificar correctamente una entidad de negocio.

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite:

```text
Construir claves funcionales.

Generar identificadores de integración.

Correlacionar eventos.

Indexar información.

Auditar procesos.

Identificar contratos de forma unívoca.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformar compañías.

Transformar suplementos.

Persistir contratos.

Modificar certificados.

Generar NUM_POLIZA_CLIENTE.
```

---

# Conceptos Gestionados

## Póliza Grupo

Campo:

```text
A2000011.NUM_POLIZA_GRP
```

Representa la póliza colectiva principal.

---

## Subpóliza

Campo:

```text
A2000011.NUM_SUBPOLIZA
```

Agrupa contratos dentro de una póliza grupo.

---

## Contrato

Campo:

```text
G2990001.NUM_CONTRATO
```

Identificador contractual interno de REEF.

---

## Certificado

Campo:

```text
A2000030.NUM_POLIZA
```

Identifica al asegurado dentro del colectivo.

---

# Capacidades

## Generar Clave Funcional Básica

Construye una clave compacta de negocio.

---

### Entrada

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numCertificado: 33
```

---

### Resultado

```text
1000-25-33
```

---

### Finalidad

```text
Logs.

Interfaces.

Eventos.

Depuración.
```

---

# Generar Clave Completa

Construye una clave ampliada incluyendo contrato.

---

### Entrada

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numContrato: ABC123

numCertificado: 33
```

---

### Resultado

```text
1000-25-ABC123-33
```

---

# Generar Clave Técnica REEF

Construye una clave utilizando los identificadores oficiales.

---

### Entrada

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numContrato: ABC123
```

---

### Resultado

```yaml
businessKey: "1000-25-ABC123"
```

---

# Interpretar Clave

Obtiene los componentes de una clave construida.

---

### Entrada

```text
1000-25-ABC123-33
```

---

### Resultado

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numContrato: ABC123

numCertificado: 33
```

---

# Comparar Claves

Determina si dos claves representan la misma entidad de negocio.

---

### Entrada

```yaml
clave1: 1000-25-ABC123-33

clave2: 1000-25-ABC123-33
```

---

### Resultado

```yaml
equivalentes: true
```

---

### Entrada

```yaml
clave1: 1000-25-ABC123-33

clave2: 1000-26-ABC123-33
```

---

### Resultado

```yaml
equivalentes: false
```

---

# Localizar Componentes Faltantes

Detecta claves incompletas.

---

### Entrada

```yaml
numPolizaGrp: 1000

numCertificado: 33
```

---

### Resultado

```yaml
incompleta: true

faltantes:
  - numSubpoliza
```

---

# Validaciones

## Póliza Grupo Obligatoria

Verificar:

```text
Existe numPolizaGrp.
```

---

### Error

```text
Póliza grupo obligatoria.
```

---

# Subpóliza Obligatoria

Verificar:

```text
Existe numSubpoliza.
```

---

### Error

```text
Subpóliza obligatoria.
```

---

# Contrato

Cuando se solicite una clave contractual:

```text
Debe existir contrato.
```

---

### Error

```text
Contrato obligatorio.
```

---

# Certificado

Cuando se solicite clave individual:

```text
Debe existir certificado.
```

---

### Error

```text
Certificado obligatorio.
```

---

# Formato

Verificar:

```text
No existen separadores inválidos.

No existen espacios.
```

---

### Error

```text
Formato de clave inválido.
```

---

# Reglas de Negocio

## Regla 1

La póliza grupo siempre debe ser el primer componente.

---

## Regla 2

La subpóliza siempre debe aparecer inmediatamente después de la póliza grupo.

---

## Regla 3

El contrato debe preceder al certificado.

---

## Regla 4

No utilizar NUM_POLIZA_CLIENTE como clave funcional.

NUM_POLIZA_CLIENTE es una clave de trazabilidad.

---

## Regla 5

Las claves de negocio deben ser legibles por negocio.

---

# Tipos de Clave Soportados

## CONTRACT_KEY

```text
POLIZA-GRUPO
SUBPOLIZA
CONTRATO
```

---

### Ejemplo

```text
1000-25-ABC123
```

---

## CERTIFICATE_KEY

```text
POLIZA-GRUPO
SUBPOLIZA
CONTRATO
CERTIFICADO
```

---

### Ejemplo

```text
1000-25-ABC123-33
```

---

## SIMPLE_KEY

```text
POLIZA-GRUPO
SUBPOLIZA
CERTIFICADO
```

---

### Ejemplo

```text
1000-25-33
```

---

# Advertencias

## Contrato Ausente

```text
Se genera una clave simplificada.
```

---

## Certificado Ausente

```text
La clave identifica una contratación pero no un asegurado.
```

---

## Formato Legacy

```text
Clave procedente de un sistema heredado.
```

---

# Errores

## Clave Incompleta

```text
Faltan componentes obligatorios.
```

---

## Formato Incorrecto

```text
Separadores inválidos.
```

---

## Póliza Grupo No Informada

```text
No puede construirse la clave.
```

---

## Subpóliza No Informada

```text
No puede construirse la clave.
```

---

# Salidas

## clave_negocio

Clave generada.

---

## componentes

Partes utilizadas en la construcción.

---

## validaciones

Resultado de las verificaciones realizadas.

---

## advertencias

Observaciones detectadas.

---

## errores

Problemas encontrados.

---

# Caso 1 — Clave Simple

Entrada:

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numCertificado: 33
```

Resultado:

```yaml
clave_negocio: 1000-25-33
```

---

# Caso 2 — Clave Completa

Entrada:

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numContrato: ABC123

numCertificado: 33
```

Resultado:

```yaml
clave_negocio: 1000-25-ABC123-33
```

---

# Caso 3 — Comparación

Entrada:

```yaml
clave1: 1000-25-ABC123-33

clave2: 1000-25-ABC123-33
```

Resultado:

```yaml
equivalentes: true
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Se dispone de una clave funcional homogénea.
- Las entidades de negocio pueden identificarse de forma unívoca.
- Los eventos e interfaces utilizan el mismo criterio de identificación.
- La auditoría y trazabilidad resultan más sencillas.
- Se evita el uso inconsistente de identificadores REEF.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
