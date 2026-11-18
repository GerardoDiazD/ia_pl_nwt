---
name: sk-analizar-modelo-identificacion-reef
type: skill
version: 1.1
description: Explica, interpreta y documenta el modelo de identificación corporativo utilizado por REEF e IDMS, incluyendo póliza grupo, contrato, subpóliza, certificado e identificadores externos.
domain: identificacion-polizas
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - explicacion
  - estructura
  - entidades_relacionadas
  - advertencias

tags:
  - reef
  - idms
  - identificacion
  - polizas
  - certificados
  - trazabilidad
  - conocimiento
---

# Objetivo

Explicar el significado funcional y técnico de cualquier identificador utilizado en REEF o en los sistemas heredados de origen.

Esta skill debe utilizarse cuando un analista, desarrollador o arquitecto necesite comprender:

```text
Qué representa un identificador.

Dónde se almacena.

Cómo se relaciona con otros identificadores.

Cuál es su equivalencia en IDMS.

Cómo participa en una integración.
```

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite responder preguntas como:

```text
¿Qué es NUM_POLIZA_GRP?

¿Qué diferencia existe entre contrato y subpóliza?

¿Qué representa NUM_POLIZA?

¿Qué es NUM_POLIZA_CLIENTE?

¿Por qué existen dos identificadores de póliza?

¿Cómo se relacionan REEF e IDMS?
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformar datos.

Modificar identificadores.

Persistir información.

Generar suplementos.

Convertir compañías.
```

---

# Conceptos Analizados

## Póliza Grupo

Representa la póliza principal dentro del modelo colectivo de REEF.

---

### Campo

```text
A2000011.NUM_POLIZA_GRP
```

---

### Equivalencia IDMS

```text
Póliza
```

---

### Características

```text
Asignada por Taller de Producto.

No editable.

Elemento raíz de la contratación.
```

---

### Preguntas habituales

```text
¿Puede repetirse?

NO.
```

---

```text
¿Identifica contratos?

NO.
```

---

```text
¿Identifica certificados?

NO.
```

---

# Contrato

Representa una entidad propia introducida por REEF.

No existe en IDMS.

---

### Campo

```text
G2990001.NUM_CONTRATO
```

---

### Equivalencia IDMS

```text
Sin equivalente directo.
```

---

### Características

```text
Identificador interno REEF.

Asignado por Taller de Producto.

No editable.
```

---

### Finalidad

Permitir separar múltiples relaciones contractuales bajo una misma póliza grupo.

---

### Preguntas habituales

```text
¿Existe en IDMS?

NO.
```

---

```text
¿Participa en integraciones?

SÍ.
```

---

# Subpóliza

Representa la agrupación organizativa equivalente a la subpóliza de IDMS.

---

### Campo

```text
A2000011.NUM_SUBPOLIZA
```

---

### Equivalencia IDMS

```text
Subpóliza
```

---

### Características

```text
Secuencial.

Máximo cuatro posiciones.

Dependiente de la póliza grupo.
```

---

### Regla de unicidad

Es única solamente dentro de una póliza grupo.

---

### Ejemplo

```text
Póliza Grupo 1000
 ├─ Subpóliza 0001
 ├─ Subpóliza 0002
 └─ Subpóliza 0003
```

---

# Certificado

Representa la unidad individual asegurada dentro de una póliza colectiva.

---

### Campo

```text
A2000030.NUM_POLIZA
```

---

### Equivalencia IDMS

```text
Certificado
```

---

### Características

```text
Generado por REEF.

Identifica al asegurado dentro del colectivo.
```

---

### Preguntas habituales

```text
¿Es la póliza?

NO.
```

---

```text
¿Es un certificado?

SÍ.
```

---

```text
¿Puede reutilizarse?

Depende del modelo de contratación.
```

---

# NUM_POLIZA_CLIENTE

Representa la identificación original procedente del sistema externo.

---

### Campo

```text
A2000030.NUM_POLIZA_CLIENTE
```

---

### Finalidad

Preservar la identificación histórica utilizada fuera de REEF.

---

### Composición

```text
Póliza
+
Subpóliza
+
Certificado
```

---

### Formato

```text
10 posiciones póliza

4 posiciones subpóliza

10 posiciones certificado
```

---

### Ejemplo

```text
000000012514560000000005
```

---

### Utilización

```text
Migraciones.

APIs.

Integraciones.

Trazabilidad.
```

---

### Preguntas habituales

```text
¿Se genera en REEF?

NO.
```

---

```text
¿Se conserva siempre?

SÍ.
```

---

```text
¿Es consultable?

SÍ.
```

---

# G2990002

Repositorio de referencia para identificadores de origen externo.

---

### Finalidad

Mantener la relación entre:

```text
Sistema origen.

Identificación histórica.

Identificación REEF.
```

---

### Importancia

Elemento fundamental de trazabilidad.

---

# Relación entre Identificadores

## Modelo IDMS

```text
Póliza

Subpóliza

Certificado
```

---

### Ejemplo

```text
00001251456000005
```

---

# Modelo REEF

```text
Póliza Grupo

Contrato

Subpóliza

Certificado
```

---

### Ejemplo Conceptual

```text
Póliza Grupo: 1000

Contrato: 55

Subpóliza: 0003

Certificado: 245
```

---

# Relación IDMS → REEF

```text
IDMS Póliza
            ↓
REEF Póliza Grupo

IDMS Subpóliza
            ↓
REEF Subpóliza

IDMS Certificado
            ↓
REEF Certificado

IDMS Completo
            ↓
NUM_POLIZA_CLIENTE
```

---

# Interpretación de Identificadores

## Entrada

```text
00001251456000005
```

---

## Resultado Esperado

```yaml
modelo: IDMS

poliza: 125

subpoliza: 1456

certificado: 5
```

---

# Interpretación de NUM_POLIZA_CLIENTE

## Entrada

```text
000000012514560000000005
```

---

## Resultado Esperado

```yaml
modelo: REEF_EXTERNO

poliza: 125

subpoliza: 1456

certificado: 5
```

---

# Preguntas que Debe Resolver

```text
¿Qué identificador se utiliza para póliza grupo?

¿Qué identificador se utiliza para contrato?

¿Qué diferencia existe entre certificado y póliza?

¿Cómo se conserva la identificación histórica?

¿Cómo se relaciona IDMS con REEF?

¿Qué tabla almacena la trazabilidad?
```

---

# Advertencias

## Interpretación Ambigua

Cuando un identificador puede pertenecer a más de un modelo.

---

### Ejemplo

```text
12345
```

---

### Advertencia

```text
No puede determinarse automáticamente el tipo de identificador.
```

---

# Identificador Incompleto

### Advertencia

```text
Longitud insuficiente para identificar el modelo.
```

---

# Resultado Esperado

Al finalizar la ejecución:

- El usuario comprende el identificador consultado.
- Se identifica la entidad REEF correspondiente.
- Se conoce la equivalencia con IDMS.
- Se documenta la relación entre los distintos identificadores.
- Se explica la trazabilidad asociada.
- Se facilita el análisis funcional y técnico de integraciones.

---

# Ejemplo 1

Entrada:

```yaml
pregunta: ¿Qué es NUM_POLIZA_CLIENTE?
```

Resultado:

```yaml
tipo: Identificador Externo

tabla: A2000030

uso:
  - Migraciones
  - APIs
  - Integraciones

finalidad:
  - Trazabilidad
```

---

# Ejemplo 2

Entrada:

```yaml
pregunta: ¿Qué diferencia existe entre póliza grupo y certificado?
```

Resultado:

```yaml
polizaGrupo:
  campo: A2000011.NUM_POLIZA_GRP
  representa: Contrato colectivo principal

certificado:
  campo: A2000030.NUM_POLIZA
  representa: Unidad individual asegurada
```

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
