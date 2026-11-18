---
name: sk-normalizar-integracion-reef
type: skill
version: 1.1
description: Aplica las reglas corporativas de normalización de datos para cualquier integración entre REEF y sistemas externos, garantizando consistencia en compañías, identificadores, certificados, contratos y suplementos.
domain: integracion-reef
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - datos_normalizados
  - advertencias
  - errores

tags:
  - reef
  - integracion
  - migracion
  - normalizacion
  - idms
  - suplementos
---

# Objetivo

Normalizar cualquier payload de entrada o salida entre REEF y sistemas externos aplicando de forma automática las reglas corporativas definidas para:

```text
Compañías.

Pólizas.

Subpólizas.

Contratos.

Certificados.

Identificadores externos.

Suplementos.
```

---

# Cuándo utilizar esta skill

Utilizar siempre que exista una integración:

```text
REEF → Sistema Externo

Sistema Externo → REEF

REEF → API

API → REEF

REEF → Batch

Batch → REEF

REEF → Evento

Evento → REEF
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Cálculos actuariales.

Reglas de negocio de emisión.

Tarificación.

Validaciones funcionales de producto.

Generación documental.
```

---

# Entradas Esperadas

La skill trabaja sobre estructuras funcionales equivalentes a:

```yaml
direction:
  TO_REEF
  FROM_REEF

companyCode:

policyGroup:

contract:

subPolicy:

certificate:

clientPolicyNumber:

supplementType:
```

---

# Flujo General

## Paso 1

Normalizar compañía.

---

## Paso 2

Normalizar identificadores.

---

## Paso 3

Normalizar certificados.

---

## Paso 4

Normalizar contratos.

---

## Paso 5

Normalizar suplementos.

---

## Paso 6

Generar advertencias y errores.

---

# Reglas de Compañía

## Entrada a REEF

Transformar:

```text
3  → 20003

60 → 20006

80 → 20008
```

---

## Salida de REEF

Transformar:

```text
20003 → 3

20006 → 60

20008 → 80
```

---

## Error

Generar error cuando:

```text
No exista equivalencia definida.
```

---

# Reglas de Certificados

## Entrada a REEF

Si el certificado tiene:

```text
6 posiciones
```

convertir a:

```text
10 posiciones
```

rellenando con ceros a la izquierda.

---

## Ejemplo

```text
123
```

↓

```text
0000000123
```

---

## Salida desde REEF

Si el consumidor requiere:

```text
6 posiciones
```

adaptar desde:

```text
10 posiciones
```

---

## Ejemplo

```text
0000000123
```

↓

```text
000123
```

---

# Reglas de Identificación

## Identificador Completo IDMS

Debe estar compuesto por:

```text
Póliza
+
Subpóliza
+
Certificado
```

---

## Longitudes

### Formato IDMS

```text
Póliza      7

Subpóliza   4

Certificado 6
```

---

### Formato REEF

```text
Póliza      10

Subpóliza   4

Certificado 10
```

---

# Reglas de Póliza Grupo

## Identificador válido

Utilizar siempre:

```text
A2000011.NUM_POLIZA_GRP
```

---

## No utilizar

```text
NUM_POLIZA
```

como identificador de póliza grupo.

---

# Reglas de Contrato

## Identificador válido

```text
G2990001.NUM_CONTRATO
```

---

## Normalización previa a Taller

Cuando se construya información destinada a Taller:

```text
NNNN-CONTRATO
```

donde:

```text
NNNN = Subpóliza a cuatro posiciones.
```

---

## Ejemplo

```text
25
```

↓

```text
0025-CONTRATO
```

---

# Reglas de Subpóliza

## Longitud máxima

```text
4 posiciones
```

---

## Contexto de unicidad

La subpóliza es única únicamente dentro de una póliza grupo.

---

# Reglas de Certificado REEF

## Identificador válido

```text
A2000030.NUM_POLIZA
```

---

## Consideración

Debe tratarse como un identificador interno generado por REEF.

---

# Reglas de Identificador Externo

## Campo Corporativo

```text
A2000030.NUM_POLIZA_CLIENTE
```

---

## Aplicación

Debe conservar:

```text
Identificador original.

Migración.

Nueva producción.

Integraciones.
```

---

## Advertencia

Generar advertencia cuando:

```text
No se reciba identificador externo.
```

---

# Reglas de Trazabilidad

## Obligación

Antes de generar un certificado REEF debe existir una referencia asociada en:

```text
G2990002
```

---

## Validación

Si no existe registro asociado:

```text
Generar error de trazabilidad.
```

---

# Reglas de Migración

## Póliza Grupo

Rango permitido:

```text
0 - 549999
```

---

## Subpóliza

Rango permitido:

```text
0 - 29999
```

---

## Advertencia

Si el valor se encuentra fuera de rango:

```text
Migración potencialmente inválida.
```

---

# Reglas de Suplementos

## Tipos Operativos

Actualmente deben considerarse válidos:

```text
XX
IN
AT
```

---

## Catálogo Oficial

La referencia corporativa es:

```text
A2991800
```

---

## Validación

Todo suplemento recibido debe existir en:

```text
A2991800
```

---

## Error

Generar error cuando:

```text
El suplemento no exista.
```

---

# Validaciones Obligatorias

## Compañía

Validar:

```text
Existe equivalencia corporativa.
```

---

## Certificado

Validar:

```text
Longitud correcta.
```

---

## Póliza Grupo

Validar:

```text
Existe valor.
```

---

## Contrato

Validar:

```text
Existe valor.
```

---

## Identificador Externo

Validar:

```text
NUM_POLIZA_CLIENTE.
```

---

## Suplemento

Validar:

```text
Existe en catálogo.
```

---

# Salidas

## Datos Normalizados

Estructura resultante lista para integración.

---

## Advertencias

Ejemplos:

```text
Identificador externo ausente.

Número fuera de rango reservado.

Contrato incompleto.
```

---

## Errores

Ejemplos:

```text
Compañía desconocida.

Suplemento inexistente.

Formato de certificado inválido.

Falta trazabilidad G2990002.
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Todas las compañías estarán en formato correcto.
- Los certificados estarán adaptados al sistema destino.
- Los identificadores cumplirán el modelo corporativo.
- Los suplementos serán válidos.
- Existirá trazabilidad entre identificadores externos y REEF.
- El payload será consistente para procesamiento posterior.

---

# Ejemplos de Invocación

## Migración IDMS → REEF

Entrada:

```yaml
direction: TO_REEF

companyCode: 3

certificate: 123

supplementType: XX
```

Resultado:

```yaml
companyCode: 20003

certificate: 0000000123

supplementType: XX

warnings: []

errors: []
```

---

## Exportación REEF → Externo

Entrada:

```yaml
direction: FROM_REEF

companyCode: 20003

certificate: 0000000123
```

Resultado:

```yaml
companyCode: 3

certificate: 000123
```

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
