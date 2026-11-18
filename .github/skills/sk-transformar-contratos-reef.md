---
name: sk-transformar-contratos-reef
type: skill
version: 1.1
description: Gestiona la construcción, normalización, validación e interpretación de contratos REEF durante procesos de integración, migración y comunicación con Taller de Producto.
domain: contratos
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - contrato_normalizado
  - contrato_taller
  - validaciones
  - advertencias
  - errores

tags:
  - reef
  - contratos
  - taller-producto
  - integracion
  - migracion
  - identificacion
---

# Objetivo

Gestionar de forma homogénea el tratamiento de contratos dentro de REEF garantizando:

```text
Estructura correcta.

Compatibilidad con Taller de Producto.

Consistencia entre sistemas.

Trazabilidad.

Normalización de identificadores.
```

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite:

```text
Crear contratos.

Validar contratos.

Generar contratos para Taller.

Interpretar contratos existentes.

Migrar datos de contratación.

Diseñar interfaces de contratación.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformación de compañías.

Transformación de suplementos.

Conversión de certificados.

Cálculo de primas.

Reglas actuariales.
```

---

# Conceptos Gestionados

## Contrato

Identificador interno utilizado por REEF para representar una relación contractual.

---

### Campo Principal

```text
G2990001.NUM_CONTRATO
```

---

### Equivalencia IDMS

```text
No existe equivalencia directa.
```

---

### Características

```text
Asignado por Taller de Producto.

No editable.

Elemento propio de REEF.

Participa en la identificación contractual.
```

---

# Capacidades

## Normalizar Contrato

Verifica que el contrato se encuentre informado y en formato válido.

---

### Entrada

```yaml
contrato: 12345
```

---

### Resultado

```yaml
contrato_normalizado: "12345"
```

---

# Validar Contrato

Comprueba que un contrato puede utilizarse dentro de REEF.

---

### Validaciones

```text
Existe valor.

No es nulo.

No está vacío.

Cumple el formato establecido.
```

---

### Resultado

```yaml
valido: true
```

---

# Construir Identificador para Taller

Genera el formato utilizado antes del envío a Taller de Producto.

---

### Entrada

```yaml
subpoliza: 25

contrato: ABC123
```

---

### Resultado

```text
0025-ABC123
```

---

### Regla

```text
Subpóliza a cuatro posiciones.

Añadir separador "-".

Sin espacios.
```

---

# Construir Identificador de Contratación

Construye una referencia funcional compuesta.

---

### Entrada

```yaml
polizaGrupo: 1000

subpoliza: 25

contrato: ABC123
```

---

### Resultado

```text
1000-25-ABC123
```

---

### Uso

```text
Interfaces.

Logs.

Migraciones.

Auditorías.
```

---

# Interpretar Contrato

Explica la función de un contrato dentro del modelo REEF.

---

### Entrada

```yaml
contrato: ABC123
```

---

### Resultado

```yaml
tipo: CONTRATO_REEF

tabla: G2990001

editable: false

origen: TALLER_PRODUCTO
```

---

# Relación con Otros Identificadores

## Contrato y Póliza Grupo

Un contrato siempre pertenece a una póliza grupo.

---

### Relación

```text
Póliza Grupo
    |
    +-- Contrato
```

---

# Contrato y Subpóliza

La subpóliza forma parte de la estructura utilizada para construir contratos destinados a Taller.

---

### Ejemplo

```text
Subpóliza: 0025

Contrato: ABC123

Resultado: 0025-ABC123
```

---

# Contrato y Certificado

Un contrato puede contener múltiples certificados.

---

### Relación

```text
Contrato
   |
   +-- Certificado 1
   +-- Certificado 2
   +-- Certificado N
```

---

# Validaciones

## Contrato Obligatorio

Verificar:

```text
Existe valor informado.
```

---

### Error

```text
Contrato obligatorio no informado.
```

---

# Contrato Vacío

### Error

```text
Contrato vacío.
```

---

# Subpóliza Obligatoria para Taller

Cuando se genere un identificador para Taller:

```text
Debe existir subpóliza.
```

---

### Error

```text
Subpóliza obligatoria para construcción de contrato Taller.
```

---

# Longitud de Subpóliza

Validar:

```text
Máximo 4 posiciones.
```

---

### Error

```text
Subpóliza inválida.
```

---

# Formato Taller

Validar:

```text
NNNN-CONTRATO
```

---

### Ejemplo Válido

```text
0025-ABC123
```

---

### Ejemplo Inválido

```text
25ABC123
```

---

# Advertencias

## Contrato sin Póliza Grupo

```text
Contrato informado sin referencia de póliza grupo.
```

---

## Contrato sin Certificados

```text
No existen certificados asociados.
```

---

## Formato Legacy

```text
Contrato procedente de migración.
```

---

# Errores

## Contrato Obligatorio

```text
Contrato no informado.
```

---

## Contrato Inválido

```text
Formato de contrato inválido.
```

---

## Subpóliza Inválida

```text
No puede construirse identificador Taller.
```

---

## Identificador Taller Incorrecto

```text
Formato NNNN-CONTRATO no válido.
```

---

# Salidas

## contrato_normalizado

Contrato listo para persistencia o integración.

---

## contrato_taller

Contrato construido según estándares de Taller de Producto.

---

## validaciones

Resultado estructurado de validaciones ejecutadas.

---

## advertencias

Listado de advertencias detectadas.

---

## errores

Listado de errores encontrados.

---

# Casos de Uso

## Caso 1 — Envío a Taller

Entrada:

```yaml
subpoliza: 25

contrato: ABC123
```

---

Resultado:

```yaml
contrato_taller: "0025-ABC123"

errores: []

advertencias: []
```

---

## Caso 2 — Validación

Entrada:

```yaml
contrato: ""
```

---

Resultado:

```yaml
valido: false

errores:
  - Contrato obligatorio no informado
```

---

## Caso 3 — Interpretación

Entrada:

```yaml
contrato: ABC123
```

---

Resultado:

```yaml
tipo: CONTRATO_REEF

tabla: G2990001

origen: TALLER_PRODUCTO

editable: false
```

---

# Resultado Esperado

Al finalizar la ejecución:

- El contrato cumple el modelo REEF.
- El identificador es compatible con Taller de Producto.
- Las integraciones utilizan una representación homogénea.
- Se garantiza la trazabilidad contractual.
- Se reducen errores de identificación entre sistemas.
- Los procesos de migración e integración utilizan las mismas reglas corporativas.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
