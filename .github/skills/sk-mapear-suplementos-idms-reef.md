---
name: sk-mapear-suplementos-idms-reef
type: skill
version: 1.1
description: Traduce, valida, clasifica y normaliza suplementos entre los modelos funcionales de IDMS y REEF utilizando el catálogo corporativo configurado en A2991800.
domain: suplementos
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - suplemento_normalizado
  - suplemento_reef
  - clasificacion
  - advertencias
  - errores

tags:
  - reef
  - suplementos
  - idms
  - migracion
  - emision
  - polizas
---

# Objetivo

Traducir operaciones funcionales procedentes de sistemas externos al modelo corporativo de suplementos utilizado en REEF.

La skill permite:

```text
Interpretar suplementos IDMS.

Mapear suplementos a REEF.

Validar suplementos.

Consultar el catálogo corporativo.

Clasificar operaciones.

Resolver dudas funcionales sobre suplementación.
```

---

# Cuándo utilizar esta skill

Utilizar cuando se necesite:

```text
Migrar suplementos desde IDMS.

Diseñar integraciones.

Interpretar movimientos de pólizas.

Validar tipos de suplemento.

Determinar el suplemento REEF apropiado.

Consultar el catálogo A2991800.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformar compañías.

Calcular primas.

Gestionar identificadores.

Construir NUM_POLIZA_CLIENTE.

Validaciones actuariales.
```

---

# Conceptos Gestionados

## Suplemento

Modificación realizada sobre una póliza, certificado o garantía.

---

## Movimiento Funcional

Descripción de negocio recibida desde sistemas externos.

Ejemplos:

```text
Alta certificado.

Rehabilitación.

Rescate total.

Cambio agente.

Anulación.
```

---

## Tipo de Suplemento REEF

Código corporativo utilizado internamente por REEF.

Ejemplos:

```text
XX

AT

IN

RE

CA

CV

RF
```

---

# Capacidades

## Traducir Operación Funcional a Suplemento REEF

Determina el tipo de suplemento que debe utilizarse en REEF.

---

### Entrada

```yaml
operacion: ALTA_CERTIFICADO
```

---

### Salida

```yaml
tipoSuplemento: XX
```

---

### Entrada

```yaml
operacion: REHABILITACION_CERTIFICADO
```

---

### Salida

```yaml
tipoSuplemento: RE
```

---

### Entrada

```yaml
operacion: ANULACION
```

---

### Salida

```yaml
tipoSuplemento: AT
```

---

# Clasificar un Suplemento

Obtiene la categoría funcional de un suplemento.

---

### Entrada

```yaml
tipoSuplemento: AT
```

---

### Salida

```yaml
categoria: ANULACION
```

---

### Entrada

```yaml
tipoSuplemento: RE
```

---

### Salida

```yaml
categoria: REHABILITACION
```

---

### Entrada

```yaml
tipoSuplemento: CA
```

---

### Salida

```yaml
categoria: CAMBIO_ADMINISTRATIVO
```

---

# Consultar Catálogo Corporativo

Obtiene información del suplemento.

---

### Entrada

```yaml
tipoSuplemento: RF
```

---

### Salida

```yaml
codigo: 7

tipo: RF

descripcion: RENOVACION MANUAL
```

---

### Entrada

```yaml
tipoSuplemento: CV
```

---

### Salida

```yaml
codigo: 4

tipo: CV

descripcion: CAMBIO FORMA DE PAGO
```

---

# Obtener Descripción Funcional

Transforma un código interno en una descripción de negocio.

---

### Entrada

```yaml
tipoSuplemento: RE
```

---

### Salida

```yaml
descripcion: REHABILITACION
```

---

### Entrada

```yaml
tipoSuplemento: DS
```

---

### Salida

```yaml
descripcion: DISMINUCION POR SINIESTRO
```

---

# Validar Suplemento

Verifica que el tipo recibido existe en el catálogo corporativo.

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
  - Suplemento inexistente.
```

---

# Catálogo Operativo Actual

## Tipos Utilizados Actualmente

Esta skill considerará como suplementos operativos estándar:

```text
XX = Alta

IN = Indeterminado

AT = Anulación
```

---

## Observación

El uso de otros suplementos depende de la parametrización existente en:

```text
A2991800
```

---

# Catálogo Funcional REEF

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
Cambio de agente.
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
Extinción de riesgo.
```

---

## IN

```text
Operación general.
```

---

## MV

```text
Extensión de vigencia.
```

---

## RC

```text
Restitución de capital.
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

# Suplementos Relacionados con Fondos

Esta skill también reconocerá:

```text
Cambio fondo.

Asignación UPS.

Rescate parcial.

Rescate total.

Aportación pactada.

Aportación extraordinaria.

Regularización mensual.

Suspensión de aportaciones.
```

---

# Reglas de Negocio

## Regla 1

Cuando una operación represente:

```text
Alta inicial.
```

utilizar:

```text
XX
```

---

## Regla 2

Cuando una operación represente:

```text
Rehabilitación.
```

utilizar:

```text
RE
```

---

## Regla 3

Cuando una operación represente:

```text
Rescate total.

Cancelación.

Anulación.

Terminación.
```

evaluar:

```text
AT
```

o alguno de los subtipos específicos de anulación.

---

## Regla 4

Cuando no exista correspondencia clara:

```text
IN
```

como tipo genérico.

---

## Regla 5

Nunca generar tipos de suplemento no existentes.

Todos los códigos deben proceder de:

```text
A2991800
```

---

# Validaciones

## Existencia

Verificar que el suplemento existe.

---

### Error

```text
Código de suplemento inexistente.
```

---

## Descripción

Verificar que existe descripción asociada.

---

### Advertencia

```text
Suplemento sin descripción funcional.
```

---

## Compatibilidad

Verificar que el suplemento es compatible con la operación solicitada.

---

### Advertencia

```text
Posible incompatibilidad funcional.
```

---

# Advertencias

Ejemplos:

```text
Operación con mapeo ambiguo.

Catálogo incompleto.

Tipo funcional pendiente de definición.

Uso de suplemento genérico IN.
```

---

# Errores

Ejemplos:

```text
Suplemento inexistente.

Código inválido.

Catálogo no encontrado.

Tipo no parametrizado.
```

---

# Resultado Esperado

Al finalizar la ejecución:

- La operación funcional queda asociada a un suplemento REEF válido.
- El suplemento existe en el catálogo corporativo.
- Se dispone de descripción funcional asociada.
- Se identifica correctamente la categoría de negocio.
- La integración puede continuar utilizando códigos homologados por REEF.

---

# Ejemplo 1 — Alta

Entrada:

```yaml
operacion: ALTA_CERTIFICADO
```

Resultado:

```yaml
tipoSuplemento: XX

descripcion: ALTA

errores: []

advertencias: []
```

---

# Ejemplo 2 — Rehabilitación

Entrada:

```yaml
operacion: REHABILITACION_CERTIFICADO
```

Resultado:

```yaml
tipoSuplemento: RE

descripcion: REHABILITACION
```

---

# Ejemplo 3 — Validación

Entrada:

```yaml
tipoSuplemento: ZZ
```

Resultado:

```yaml
errores:
  - Suplemento inexistente

valido: false
```

---

# Ejemplo 4 — Consulta de Catálogo

Entrada:

```yaml
tipoSuplemento: RF
```

Resultado:

```yaml
codigo: 7

tipo: RF

descripcion: RENOVACION MANUAL

valido: true
```

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
