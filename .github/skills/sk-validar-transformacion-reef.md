---
name: sk-validar-transformacion-reef
type: skill
version: 1.1
description: Ejecuta una validación integral de transformaciones corporativas REEF verificando compañías, identificadores, certificados, contratos, suplementos y trazabilidad antes de una migración o integración.
domain: integracion-reef
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas
  skills:
    - sk-transformar-companias-reef.md
    - sk-transformar-identificadores-reef.md
    - sk-validar-suplementos-reef.md
    - sk-validar-trazabilidad-reef.md

outputs:
  - estado
  - validaciones
  - incumplimientos
  - advertencias
  - errores
  - recomendaciones

tags:
  - reef
  - validacion
  - integracion
  - migracion
  - calidad
  - arquitectura
  - trazabilidad
---

# Objetivo

Realizar una validación corporativa completa sobre una integración o conjunto de datos antes de:

```text
Persistir información.

Migrar pólizas.

Publicar APIs.

Generar interfaces batch.

Emitir eventos.

Ejecutar cargas masivas.
```

---

# Propósito

Esta skill funciona como un control de calidad corporativo.

Su misión es determinar si una integración cumple las reglas obligatorias de REEF.

---

# Cuándo utilizar esta skill

Utilizar siempre que se quiera validar:

```text
Diseños de integración.

Mapeos funcionales.

Cargas de migración.

Mensajes de entrada.

Mensajes de salida.

Interfaces batch.

Servicios REST.

Eventos corporativos.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformar datos.

Persistir registros.

Modificar contratos.

Modificar certificados.

Modificar suplementos.
```

Su finalidad es exclusivamente:

```text
Validar.
```

---

# Alcance de la Validación

La skill revisa:

```text
Compañías.

Pólizas.

Subpólizas.

Contratos.

Certificados.

NUM_POLIZA_CLIENTE.

Suplementos.

Trazabilidad.
```

---

# Flujo de Ejecución

## Paso 1

Validar compañía.

---

## Paso 2

Validar identificadores.

---

## Paso 3

Validar contratos.

---

## Paso 4

Validar certificados.

---

## Paso 5

Validar suplementos.

---

## Paso 6

Validar trazabilidad.

---

## Paso 7

Clasificar resultado global.

---

# Validación de Compañías

## Compañías Externas Válidas

```text
3

60

80
```

---

## Compañías REEF Válidas

```text
20003

20006

20008
```

---

## Reglas

Verificar:

```text
La compañía existe.

La transformación es correcta.

No se persisten códigos externos en REEF.
```

---

### Error

```text
Código de compañía no válido.
```

---

### Error

```text
Compañía no transformada al formato REEF.
```

---

# Validación de Identificadores

## Identificación IDMS

Verificar:

```text
17 posiciones.

7 póliza.

4 subpóliza.

6 certificado.
```

---

### Error

```text
Identificador IDMS inválido.
```

---

# NUM_POLIZA_CLIENTE

Verificar:

```text
24 posiciones.

10 póliza.

4 subpóliza.

10 certificado.
```

---

### Error

```text
NUM_POLIZA_CLIENTE inválido.
```

---

# Validación de Certificados

## Certificado REEF

Verificar:

```text
10 posiciones.
```

---

### Error

```text
Certificado incompatible con REEF.
```

---

## Certificado Legacy

Verificar:

```text
6 posiciones.
```

cuando el destino sea un sistema externo.

---

### Advertencia

```text
Certificado no adaptado al formato requerido por el consumidor.
```

---

# Validación de Contratos

## Existencia

Verificar:

```text
NUM_CONTRATO informado.
```

---

### Error

```text
Contrato obligatorio.
```

---

## Formato Taller

Cuando aplique:

```text
NNNN-CONTRATO
```

---

### Error

```text
Formato de contrato no compatible con Taller.
```

---

# Validación de Subpóliza

Verificar:

```text
Máximo 4 posiciones.
```

---

### Error

```text
Subpóliza inválida.
```

---

# Validación de Suplementos

## Regla

El suplemento debe existir en:

```text
A2991800
```

---

### Válidos

```text
AT

IN

RE

RF

CA

CV

MV

RC

AE

AS

DS

ER
```

---

### Error

```text
Suplemento no existente.
```

---

# Validación de Trazabilidad

## NUM_POLIZA_CLIENTE

Debe existir cuando proceda de:

```text
Migración.

Sistema externo.

Proceso legado.
```

---

### Error

```text
No existe identificador externo.
```

---

# Registro G2990002

Debe existir referencia asociada.

---

### Error

```text
No existe trazabilidad en G2990002.
```

---

# Certificado REEF

Debe existir correspondencia con:

```text
A2000030
```

---

### Error

```text
No existe certificado asociado.
```

---

# Validación de Migración

## Póliza Grupo

Verificar:

```text
0 - 549999
```

---

### Advertencia

```text
Póliza fuera del rango reservado de migración.
```

---

## Subpóliza

Verificar:

```text
0 - 29999
```

---

### Advertencia

```text
Subpóliza fuera del rango reservado de migración.
```

---

# Clasificación del Resultado

## VALIDO

No existen errores ni advertencias.

---

## VALIDO_CON_ADVERTENCIAS

Existen advertencias pero ningún error.

---

## INVALIDO

Existen errores corregibles.

---

## CRITICO

Existen errores de trazabilidad o incumplimientos bloqueantes.

---

# Criterios de Severidad

## Baja

```text
Advertencias informativas.
```

---

## Media

```text
Incumplimientos corregibles.
```

---

## Alta

```text
Errores de identificación.
```

---

## Crítica

```text
Pérdida de trazabilidad.

Identificadores inválidos.

Datos incompatibles con REEF.
```

---

# Generación de Recomendaciones

Para cada incumplimiento la skill debe proponer una acción correctiva.

---

### Ejemplo

Incidencia:

```text
Certificado con 6 posiciones.
```

---

Recomendación:

```text
Convertir a 10 posiciones antes de persistir.
```

---

### Ejemplo

Incidencia:

```text
Compañía externa almacenada en REEF.
```

---

Recomendación:

```text
Aplicar transformación corporativa de compañía.
```

---

### Ejemplo

Incidencia:

```text
No existe G2990002.
```

---

Recomendación:

```text
Crear trazabilidad antes de registrar A2000030.
```

---

# Advertencias

## Identificador Legacy

```text
Datos procedentes de migración histórica.
```

---

## Conversión No Documentada

```text
No se observa transformación explícita.
```

---

## Catálogo Pendiente

```text
No puede verificarse completamente el suplemento.
```

---

## Rango de Migración

```text
Numeración fuera de los rangos reservados.
```

---

# Errores

## Compañía Inválida

```text
Código de compañía no reconocido.
```

---

## Identificador Inválido

```text
Formato incompatible.
```

---

## Certificado Inválido

```text
Certificado incompatible con REEF.
```

---

## Contrato Inválido

```text
Contrato obligatorio no informado.
```

---

## Suplemento Inexistente

```text
Suplemento fuera del catálogo corporativo.
```

---

## Error de Trazabilidad

```text
No existe relación entre identificador externo y REEF.
```

---

# Salidas

## estado

Resultado global de la validación.

---

## validaciones

Detalle de cada comprobación ejecutada.

---

## incumplimientos

Listado de incumplimientos encontrados.

---

## advertencias

Listado de advertencias detectadas.

---

## errores

Listado de errores bloqueantes.

---

## recomendaciones

Acciones propuestas para corregir los problemas detectados.

---

# Caso 1 — Integración Correcta

Entrada:

```yaml
companyCode: 20003

certificate: 0000000123

numPolizaCliente: 000000012514560000000005

supplementType: AT
```

Resultado:

```yaml
estado: VALIDO

errores: []

advertencias: []

incumplimientos: []
```

---

# Caso 2 — Integración con Advertencias

Entrada:

```yaml
companyCode: 20003

supplementType: RF

numPolizaGrp: 600000
```

Resultado:

```yaml
estado: VALIDO_CON_ADVERTENCIAS

advertencias:
  - Póliza fuera del rango reservado de migración
```

---

# Caso 3 — Integración Inválida

Entrada:

```yaml
companyCode: 99

certificate: 123

supplementType: ZZ
```

Resultado:

```yaml
estado: CRITICO

errores:
  - Código de compañía no reconocido
  - Certificado incompatible con REEF
  - Suplemento fuera del catálogo corporativo

recomendaciones:
  - Utilizar código de compañía homologado
  - Convertir certificado a 10 posiciones
  - Utilizar suplemento parametrizado en A2991800
```

---

# Resultado Esperado

Al finalizar la ejecución:

- Las transformaciones cumplen las reglas corporativas de REEF.
- Los identificadores son compatibles con el modelo de contratación.
- Los suplementos pertenecen al catálogo oficial.
- La trazabilidad está garantizada.
- Se detectan desviaciones antes del desarrollo o despliegue.
- Las integraciones mantienen un estándar homogéneo dentro del ecosistema REEF.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
