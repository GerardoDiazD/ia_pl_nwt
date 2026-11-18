---
name: sk-transformar-identificadores-reef
type: skill
version: 1.1
description: Gestiona la construcción, descomposición, validación y normalización de identificadores de contratación entre sistemas externos e infraestructura REEF.
domain: identificacion-polizas
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - identificadores_normalizados
  - identificadores_generados
  - advertencias
  - errores

tags:
  - reef
  - idms
  - polizas
  - certificados
  - migracion
  - trazabilidad
---

# Objetivo

Gestionar de forma uniforme todos los identificadores utilizados entre:

```text
IDMS

REEF

Procesos de migración

Interfaces batch

APIs

Eventos
```

garantizando:

```text
Unicidad.

Trazabilidad.

Compatibilidad.

Persistencia correcta.
```

---

# Cuándo utilizar esta skill

Utilizar cuando sea necesario:

```text
Generar identificadores.

Interpretar identificadores externos.

Construir NUM_POLIZA_CLIENTE.

Convertir certificados.

Validar formatos.

Analizar incidencias de numeración.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Validación funcional de productos.

Cálculo de primas.

Emisión documental.

Transformación de compañías.

Conversión de suplementos.
```

---

# Conceptos Gestionados

## Póliza Grupo

Representada por:

```text
A2000011.NUM_POLIZA_GRP
```

---

## Contrato

Representado por:

```text
G2990001.NUM_CONTRATO
```

---

## Subpóliza

Representada por:

```text
A2000011.NUM_SUBPOLIZA
```

---

## Certificado

Representado por:

```text
A2000030.NUM_POLIZA
```

---

## Identificador Externo

Representado por:

```text
A2000030.NUM_POLIZA_CLIENTE
```

---

# Capacidades

## Generar Identificación IDMS

Construye la identificación histórica IDMS.

---

### Entrada

```yaml
poliza: 125
subpoliza: 1456
certificado: 5
```

---

### Salida

```text
00001251456000005
```

---

### Formato

```text
Póliza      7 posiciones

Subpóliza   4 posiciones

Certificado 6 posiciones
```

---

# Descomponer Identificación IDMS

Obtiene los componentes desde una identificación completa.

---

### Entrada

```text
00001251456000005
```

---

### Salida

```yaml
poliza: 125

subpoliza: 1456

certificado: 5
```

---

# Generar Identificación REEF

Construye el formato corporativo utilizado en REEF.

---

### Entrada

```yaml
poliza: 125
subpoliza: 1456
certificado: 5
```

---

### Salida

```yaml
poliza: 0000000125

subpoliza: 1456

certificado: 0000000005
```

---

### Formato

```text
Póliza      10 posiciones

Subpóliza    4 posiciones

Certificado 10 posiciones
```

---

# Construir NUM_POLIZA_CLIENTE

Construye el identificador externo persistido en REEF.

---

### Entrada

```yaml
poliza: 125

subpoliza: 1456

certificado: 5
```

---

### Salida

```text
000000012514560000000005
```

---

### Composición

```text
10 posiciones póliza

4 posiciones subpóliza

10 posiciones certificado
```

---

# Descomponer NUM_POLIZA_CLIENTE

Obtiene los componentes originales desde el identificador externo.

---

### Entrada

```text
000000012514560000000005
```

---

### Salida

```yaml
poliza: 125

subpoliza: 1456

certificado: 5
```

---

# Adaptar Certificados hacia REEF

Convierte certificados externos al estándar REEF.

---

### Entrada

```text
123
```

---

### Salida

```text
0000000123
```

---

### Regla

```text
Longitud final = 10
```

---

# Adaptar Certificados hacia Sistemas Externos

Convierte certificados REEF al formato esperado por sistemas legacy.

---

### Entrada

```text
0000000123
```

---

### Salida

```text
000123
```

---

### Regla

```text
Longitud final = 6
```

---

# Generar Clave Funcional

Construye una clave funcional de negocio para trazabilidad.

---

### Entrada

```yaml
numPolizaGrp: 1000

numSubpoliza: 25

numCertificado: 33
```

---

### Salida

```text
1000-25-33
```

---

### Uso

```text
Logs.

Migraciones.

Interfaces.

Eventos.
```

---

# Normalización de Contratos

## Generar Identificador Taller

Cuando una integración requiera envío a Taller.

---

### Entrada

```yaml
subpoliza: 25

contrato: ABC123
```

---

### Salida

```text
0025-ABC123
```

---

### Regla

```text
Subpóliza a cuatro posiciones.

Añadir separador '-'.

Sin espacios.
```

---

# Validaciones

## Validación de Identificación IDMS

Validar:

```text
17 posiciones.

7 póliza.

4 subpóliza.

6 certificado.
```

---

### Error

```text
Formato IDMS inválido.
```

---

# Validación de Certificado REEF

Validar:

```text
10 posiciones.
```

---

### Error

```text
Certificado REEF inválido.
```

---

# Validación de NUM_POLIZA_CLIENTE

Validar:

```text
24 posiciones.
```

---

### Composición esperada

```text
10 póliza

4 subpóliza

10 certificado
```

---

### Error

```text
NUM_POLIZA_CLIENTE inválido.
```

---

# Validación de Subpóliza

Validar:

```text
Longitud máxima 4.
```

---

### Error

```text
Subpóliza fuera de rango.
```

---

# Validación de Rango de Migración

## Póliza Grupo

Validar que se encuentre entre:

```text
0 y 549999
```

---

### Advertencia

```text
Póliza fuera del rango reservado para migración.
```

---

## Subpóliza

Validar que se encuentre entre:

```text
0 y 29999
```

---

### Advertencia

```text
Subpóliza fuera del rango reservado para migración.
```

---

# Validaciones de Trazabilidad

## NUM_POLIZA_CLIENTE

Debe existir siempre que:

```text
Datos migrados.

Integraciones externas.

Sincronizaciones.
```

---

### Advertencia

```text
Identificador externo ausente.
```

---

## Registro G2990002

Debe existir referencia asociada.

---

### Error

```text
No existe trazabilidad G2990002.
```

---

# Salidas

## Identificadores Generados

Contiene:

```text
NUM_POLIZA_CLIENTE.

Identificación IDMS.

Certificados adaptados.

Contratos normalizados.
```

---

## Advertencias

Ejemplos:

```text
Subpóliza fuera de rango.

Identificador externo ausente.

Datos incompletos.
```

---

## Errores

Ejemplos:

```text
Formato IDMS inválido.

Longitud incorrecta.

NUM_POLIZA_CLIENTE inválido.

Error de trazabilidad.
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Todos los identificadores cumplen el estándar corporativo.
- Los formatos IDMS y REEF son compatibles.
- Los certificados se encuentran normalizados.
- NUM_POLIZA_CLIENTE puede reconstruirse y verificarse.
- La trazabilidad hacia sistemas externos queda garantizada.
- Los procesos de migración e integración utilizan una identificación homogénea.

---

# Ejemplo 1 — Migración IDMS → REEF

Entrada:

```yaml
idmsIdentifier: "00001251456000005"
```

Resultado:

```yaml
poliza: "0000000125"

subpoliza: "1456"

certificado: "0000000005"

numPolizaCliente: "000000012514560000000005"

errors: []

warnings: []
```

---

# Ejemplo 2 — Exportación REEF → Sistema Legacy

Entrada:

```yaml
certificado: "0000000123"
```

Resultado:

```yaml
certificadoLegacy: "000123"
```

---

# Ejemplo 3 — Validación

Entrada:

```yaml
numPolizaCliente: "123"
```

Resultado:

```yaml
errors:
  - "NUM_POLIZA_CLIENTE inválido"

warnings: []
```

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
