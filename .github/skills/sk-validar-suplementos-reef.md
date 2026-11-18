---
name: sk-validar-suplementos-reef
type: skill
version: 1.1
description: Valida suplementos REEF contra el catálogo corporativo, verifica compatibilidad funcional, detecta inconsistencias de parametrización y garantiza el uso exclusivo de tipos homologados.
domain: suplementos
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - validacion
  - suplemento
  - categoria
  - advertencias
  - errores

tags:
  - reef
  - suplementos
  - validacion
  - catalogo
  - a2991800
  - integracion
---

# Objetivo

Validar que cualquier suplemento utilizado en REEF:

```text
Existe.

Está parametrizado.

Se encuentra homologado.

Pertenece al catálogo oficial.

Puede utilizarse en la operación solicitada.
```

---

# Cuándo utilizar esta skill

Utilizar cuando:

```text
Se reciba un suplemento desde una integración.

Se genere un suplemento desde REEF.

Se migren pólizas.

Se diseñen interfaces.

Se validen procesos de emisión.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformar suplementos.

Convertir operaciones IDMS.

Construir contratos.

Transformar compañías.

Generar identificadores.
```

---

# Fuente Oficial

La única fuente válida para validación de suplementos es:

```text
A2991800
```

---

# Capacidades

## Validar Existencia

Comprueba que el suplemento existe en el catálogo corporativo.

---

### Entrada

```yaml
tipoSuplemento: AT
```

---

### Resultado

```yaml
valido: true
```

---

### Entrada

```yaml
tipoSuplemento: ZZ
```

---

### Resultado

```yaml
valido: false

errores:
  - Suplemento inexistente
```

---

# Obtener Información del Suplemento

Devuelve información básica del suplemento.

---

### Entrada

```yaml
tipoSuplemento: RE
```

---

### Resultado

```yaml
tipo: RE

descripcion: REHABILITACION

categoria: REHABILITACION
```

---

# Clasificar Suplemento

Determina la categoría funcional.

---

### Categorías soportadas

```text
ALTA

ANULACION

REHABILITACION

CAMBIO_ADMINISTRATIVO

RENOVACION

FONDOS

GENERAL
```

---

### Entrada

```yaml
tipoSuplemento: CA
```

---

### Resultado

```yaml
categoria: CAMBIO_ADMINISTRATIVO
```

---

# Identificar Suplementos Operativos

Reconoce los suplementos de uso habitual actualmente en REEF.

---

### Tipos Operativos

```text
XX

IN

AT
```

---

### Entrada

```yaml
tipoSuplemento: XX
```

---

### Resultado

```yaml
operativo: true
```

---

# Detectar Suplementos Especializados

Identifica suplementos menos utilizados o dependientes de parametrización específica.

---

### Ejemplos

```text
CA

CV

MV

RC

RF

RE
```

---

### Resultado

```yaml
operativo: false

especializado: true
```

---

# Catálogo Reconocido

## AE

```text
Alta especial.
```

---

## AS

```text
Anulación de suplementos.
```

---

## AT

```text
Anulaciones.
```

---

## CA

```text
Cambio agente.
```

---

## CV

```text
Cambio forma de pago.
```

---

## DS

```text
Disminución por siniestro.
```

---

## ER

```text
Extinción riesgo.
```

---

## IN

```text
General.
```

---

## MV

```text
Extensión vigencia.
```

---

## RC

```text
Restitución capital.
```

---

## RE

```text
Rehabilitación.
```

---

## RF

```text
Renovación manual.
```

---

# Suplementos de Fondos

La skill reconoce también:

```text
Cambio fondo.

Asignación UPS.

Rescate parcial.

Rescate total.

Aportación pactada.

Aportación extraordinaria.

Regularización mensual.

Suspensión aportaciones.
```

---

# Validaciones

## Validación de Código

Verificar:

```text
Existe código informado.
```

---

### Error

```text
Código de suplemento obligatorio.
```

---

# Validación de Existencia

Verificar:

```text
El suplemento existe en A2991800.
```

---

### Error

```text
Suplemento no parametrizado.
```

---

# Validación de Descripción

Verificar:

```text
Existe descripción asociada.
```

---

### Advertencia

```text
Suplemento sin descripción funcional.
```

---

# Validación de Tipo

Verificar:

```text
Tipo coherente con catálogo corporativo.
```

---

### Error

```text
Tipo de suplemento inválido.
```

---

# Validación de Uso Operativo

Verificar si el suplemento forma parte del conjunto operativo actual.

---

### Advertencia

```text
Suplemento válido pero no utilizado actualmente.
```

---

# Reglas de Negocio

## Regla 1

Nunca utilizar suplementos fuera de:

```text
A2991800
```

---

## Regla 2

No inventar nuevos códigos.

---

## Regla 3

La existencia física del código tiene prioridad sobre cualquier descripción textual.

---

## Regla 4

Los suplementos:

```text
XX

IN

AT
```

deben considerarse válidos por defecto.

---

## Regla 5

Los suplementos especializados requieren validación adicional del contexto funcional.

---

# Advertencias

## Suplemento Poco Habitual

```text
Suplemento válido pero no utilizado actualmente por los procesos estándar.
```

---

## Descripción Ambigua

```text
No puede determinarse claramente la categoría funcional.
```

---

## Parametrización Especial

```text
El suplemento depende de una parametrización específica.
```

---

# Errores

## Código Obligatorio

```text
No se informó código de suplemento.
```

---

## Código Inexistente

```text
El suplemento no existe en A2991800.
```

---

## Tipo Inválido

```text
Tipo de suplemento no reconocido.
```

---

## Catálogo No Disponible

```text
No se pudo validar contra el catálogo corporativo.
```

---

# Salidas

## validacion

Resultado global de la validación.

---

## suplemento

Información del suplemento validado.

---

## categoria

Clasificación funcional obtenida.

---

## advertencias

Listado de advertencias detectadas.

---

## errores

Listado de errores encontrados.

---

# Caso 1 — Validación Correcta

Entrada:

```yaml
tipoSuplemento: AT
```

Resultado:

```yaml
valido: true

categoria: ANULACION

advertencias: []

errores: []
```

---

# Caso 2 — Suplemento Especializado

Entrada:

```yaml
tipoSuplemento: RF
```

Resultado:

```yaml
valido: true

categoria: RENOVACION

advertencias:
  - Suplemento válido pero no utilizado actualmente
```

---

# Caso 3 — Suplemento Incorrecto

Entrada:

```yaml
tipoSuplemento: ZZ
```

Resultado:

```yaml
valido: false

errores:
  - Suplemento inexistente
```

---

# Resultado Esperado

Al finalizar la ejecución:

- El suplemento existe en el catálogo corporativo.
- Se conoce su categoría funcional.
- Se identifica si es operativo o especializado.
- Se detectan inconsistencias de parametrización.
- Las integraciones utilizan únicamente suplementos homologados.
- Se evita el uso de códigos inválidos en procesos REEF.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
