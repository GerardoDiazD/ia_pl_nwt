---
name: inst-transformaciones-basicas-reef
type: instruction
description: Instrucción corporativa para aplicar transformaciones estándar en integraciones REEF, garantizando consistencia en identificadores, compañías, contratos, certificados y suplementos entre REEF y sistemas externos.
domain: integracion-reef
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:transformaciones_basicas
---

# Instrucción: Transformaciones Básicas REEF

## Objetivo

Establecer las reglas obligatorias que deben aplicarse en cualquier integración entre:

```text
REEF
IDMS
APIs
Procesos Batch
Ficheros planos
Eventos
Sistemas externos
```

para garantizar:

```text
Consistencia.
Trazabilidad.
Compatibilidad.
Reutilización.
Homogeneidad.
```

---

# Ámbito

Esta instrucción aplica a:

```text
Migraciones.
Interfaces batch.
Servicios REST.
Servicios SOAP.
Procesos ETL.
Procesos de sincronización.
Eventos asíncronos.
```

---

# Fuente de Conocimiento

Antes de aplicar cualquier transformación deberán revisarse las definiciones contenidas en:

```text
kb-transformaciones-basicas-reef
```

---

# Principios Generales

## Principio de Trazabilidad

Todo identificador recibido desde un sistema externo debe poder ser rastreado posteriormente dentro de REEF.

---

## Principio de Conservación

Nunca debe perderse el identificador original procedente de sistemas externos.

---

## Principio de Compatibilidad

Las interfaces deben respetar el formato esperado por cada sistema consumidor.

---

## Principio de No Invención

No se deben inventar:

```text
Identificadores.
Contratos.
Subpólizas.
Tipos de suplementos.
Códigos de compañía.
```

---

# Regla de Transformación de Compañía

## Entrada a REEF

Cuando una interfaz reciba un código externo deberá transformarlo al código REEF correspondiente.

### Equivalencias

```text
3  -> 20003

60 -> 20006

80 -> 20008
```

---

## Salida desde REEF

Cuando una interfaz genere información para sistemas externos deberá aplicar la transformación inversa.

### Ejemplos

```text
20003 -> 3

20006 -> 60

20008 -> 80
```

---

# Regla de Identificación de Póliza

## Formato Externo

Las pólizas externas deberán considerarse formadas por:

```text
Póliza
Subpóliza
Certificado
```

---

## Regla

No asumir nunca que:

```text
Certificado
```

es único globalmente.

---

## Identificación Correcta

La unicidad debe construirse utilizando:

```text
Póliza
+
Subpóliza
+
Certificado
```

---

# Regla de Certificados

## Entrada desde Sistemas Externos

Cuando se reciba un certificado de:

```text
6 posiciones
```

deberá transformarse internamente a:

```text
10 posiciones
```

mediante relleno con ceros a la izquierda.

---

## Ejemplo

```text
123
↓
0000000123
```

---

## Salida hacia Sistemas Externos

Cuando un consumidor espere:

```text
6 posiciones
```

deberá adaptarse desde el formato REEF.

---

## Ejemplo

```text
0000000123
↓
000123
```

---

# Regla de Póliza Grupo

## Campo Oficial

Toda póliza grupo deberá identificarse mediante:

```text
A2000011.NUM_POLIZA_GRP
```

---

## Prohibido

Utilizar:

```text
NUM_POLIZA
```

como identificador de grupo.

---

# Regla de Contrato

## Campo Oficial

El contrato deberá identificarse mediante:

```text
G2990001.NUM_CONTRATO
```

---

## Consideraciones

Debe tratarse como:

```text
Identificador interno REEF.
```

---

# Regla de Subpóliza

## Campo Oficial

```text
A2000011.NUM_SUBPOLIZA
```

---

## Restricciones

```text
Máximo 4 posiciones.

Secuencial por póliza grupo.
```

---

# Regla de Certificado REEF

## Campo Oficial

```text
A2000030.NUM_POLIZA
```

---

## Consideraciones

Es un identificador generado por REEF.

---

# Regla de Conservación del Identificador Externo

## Campo Obligatorio

El identificador externo deberá almacenarse en:

```text
A2000030.NUM_POLIZA_CLIENTE
```

---

## Aplicación

Tanto para:

```text
Migración.
Nueva producción.
Integraciones.
```

---

# Regla de Registro de Identificadores Externos

## Obligación

Antes de registrar datos asociados al certificado deberá existir una entrada en:

```text
G2990002
```

---

## Finalidad

Garantizar la trazabilidad del identificador externo.

---

# Regla de Construcción de Claves

## No utilizar individualmente

```text
NUM_SUBPOLIZA
```

---

## No utilizar individualmente

```text
NUM_POLIZA
```

---

## Construcción recomendada

```text
NUM_POLIZA_GRP
+
NUM_SUBPOLIZA
+
NUM_POLIZA
```

cuando se requiera una clave funcional completa.

---

# Regla de Migración

## Pólizas Grupo

Utilizar únicamente numeración dentro del rango reservado.

```text
0 - 549999
```

---

## Subpólizas

Utilizar únicamente numeración dentro del rango reservado.

```text
0 - 29999
```

---

# Regla de Tipos de Suplemento

## Principio General

No interpretar suplementos utilizando descripciones libres.

Siempre utilizar códigos REEF oficiales.

---

# Tipos Actualmente Operativos

## Alta

```text
XX
```

---

## Indeterminado

```text
IN
```

---

## Anulación

```text
AT
```

---

# Regla de Anulación

Cuando una operación represente:

```text
Anulación.
Cancelación.
Rescate total.
Terminación.
```

deberá verificarse el uso de un suplemento:

```text
AT
```

o equivalente configurado.

---

# Regla de Consulta de Suplementos

## Fuente Oficial

Los tipos válidos deberán obtenerse desde:

```text
A2991800
```

---

## Prohibido

Codificar manualmente catálogos alternativos.

---

# Regla de Integración

Antes de construir una interfaz debe validarse:

```text
Formato de compañía.

Formato de póliza.

Formato de certificado.

Identificador externo.

Tipo de suplemento.
```

---

# Validaciones Obligatorias

## Validación de Compañía

Verificar que:

```text
Existe equivalencia válida.
```

---

## Validación de Certificado

Verificar que:

```text
La longitud es correcta.
```

---

## Validación de Póliza

Verificar que:

```text
NUM_POLIZA_GRP existe.
```

---

## Validación de Contrato

Verificar que:

```text
NUM_CONTRATO existe.
```

---

## Validación de Identificador Externo

Verificar que:

```text
NUM_POLIZA_CLIENTE existe.
```

---

## Validación de Suplemento

Verificar que:

```text
Existe en A2991800.
```

---

# Casos de Uso

Esta instrucción debe aplicarse cuando se realicen tareas como:

```text
Diseño de interfaces.

Mapeos IDMS → REEF.

Mapeos REEF → sistemas externos.

Migraciones.

Sincronizaciones.

Publicación de APIs.

Generación de eventos.
```

---

# Resultado Esperado

La aplicación correcta de esta instrucción asegura que:

```text
Los identificadores son consistentes.

La compañía se transforma correctamente.

Los certificados mantienen trazabilidad.

La numeración es compatible.

Los suplementos son válidos.

Las integraciones reutilizan el mismo criterio corporativo.
```

---

# Definición de Éxito

La instrucción se considera correctamente aplicada cuando:

- Todas las compañías utilizan la equivalencia corporativa.
- Los certificados respetan las longitudes definidas para cada sistema.
- Se conserva el identificador externo en NUM_POLIZA_CLIENTE.
- Existe trazabilidad mediante G2990002.
- Los suplementos utilizados existen en A2991800.
- Las integraciones son compatibles entre REEF e IDMS.
- No se introducen reglas locales ni identificadores inventados.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
