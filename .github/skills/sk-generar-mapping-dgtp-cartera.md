---
name: sk-generar-mapping-dgtp-cartera
type: skill
description: Genera especificaciones de mapping para DGTP-Cartera (X490JW05 - RNEO), identificando correspondencias entre CETL, IDMS y REEF, reglas de transformación, valores fijos, campos calculados, dependencias funcionales y validaciones de carga.
domain: cartera
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:DGTP-Cartera
---

# Skill: Generar Mapping DGTP-Cartera

## Objetivo

Construir una especificación completa de mapping entre:

```text
DGTP-Cartera
↓
IDMS
↓
REEF
```

permitiendo documentar de forma trazable:

```text
Campos origen.
Transformaciones.
Tablas destino.
Campos destino.
Reglas de negocio.
Valores fijos.
Campos calculados.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Diseñar una migración.
Construir una interfaz.
Documentar un ETL.
Analizar un fichero DGTP.
Preparar una carga hacia REEF.
Auditar mappings existentes.
```

---

# Entradas

## Layout DGTP

Ejemplo:

```text
Campo CETL
Tipo
Posición
Descripción
```

---

## Información IDMS

Ejemplo:

```text
RB86900
RB86901
RB86906
RR001063
RA541026
```

---

## Modelo REEF

Ejemplo:

```text
A2000011
A2000012
A2000020
A2000030
A2000100
```

---

# Objetivos del Análisis

La skill debe identificar:

```text
Origen funcional.
Origen IDMS.
Destino REEF.
Transformación.
Validación.
Dependencias.
```

---

# Procedimiento

## Paso 1

Inventariar campos CETL.

---

## Identificar

```text
Nombre.
Tipo.
Longitud.
Posición.
Descripción.
```

---

## Clasificar

```text
Identificación.
Comercial.
Bancario.
Operativo.
Actuarial.
Administrativo.
```

---

# Paso 2

Identificar origen IDMS

---

## Determinar

```text
Programa.
Entidad.
Campo.
```

---

## Ejemplo

```text
RB86900-KSG-POLIZA
```

---

## Resultado

Inventario de origen.

---

# Paso 3

Identificar destino REEF

---

## Determinar

```text
Tabla.
Campo.
Entidad funcional.
```

---

## Ejemplos

```text
A2000011
A2000012
A2000020
A2000030
A2000100
A1001331
DF_THP_NWT_XX_PCM
```

---

# Paso 4

Clasificar el mapping

---

## Mapping Directo

Ejemplo:

```text
MODALIDAD
↓
COD_MODALIDAD
```

---

## Mapping Derivado

Ejemplo:

```text
IND_POLI_REDUCI
↓
Estado RE
↓
S
```

---

## Mapping Calculado

Ejemplo:

```text
PORC_COASEGU
↓
100
```

cuando no exista coaseguro.

---

## Mapping Fijo

Ejemplos:

```text
AHORRO
C
S
N
```

---

## Sin Mapping

Ejemplos:

```text
COD_MOTIVO_ANUL
IND_POLI_REASE
MCA_PIGNORADA
```

---

# Paso 5

Identificar reglas de negocio

---

## Forma de Cobro

Regla:

```text
Cuenta bancaria existente
↓
S

En otro caso
↓
P
```

---

## Reducción

Regla:

```text
Estado = RE
↓
S
```

---

## Coaseguro

Regla:

```text
TSGCOA vacío
↓
100%
```

---

## Flexible

Regla:

```text
Valor fijo = S
```

---

# Paso 6

Identificar dependencias funcionales

---

## Contratación

```text
Póliza.
Subpóliza.
Suplemento.
```

---

## Comercial

```text
Canales.
Oficinas.
Agentes.
```

---

## Financiero

```text
Cuenta bancaria.
Forma de pago.
Coaseguro.
```

---

## Cliente

```text
Tomadores.
Intermediarios.
Profesión.
```

---

# Paso 7

Identificar dependencias técnicas

---

## Tablas

```text
A2000011
A2000012
A2000020
A2000030
A2000100
```

---

## Personas

```text
A1001331
A1001332
A1001399
```

---

## Bancario

```text
DF_THP_NWT_XX_PCM
```

---

## Parametrización

```text
G2990017
```

---

# Paso 8

Detectar huecos funcionales

---

## Clasificar

### Sin Mapping

```text
No existe destino.
```

---

### Pendiente

```text
Existe información insuficiente.
```

---

### Ambiguo

```text
Existen múltiples destinos posibles.
```

---

# Paso 9

Generar matriz de mapping

---

## Formato

```text
Campo CETL
↓
Campo IDMS
↓
Tabla REEF
↓
Campo REEF
↓
Transformación
↓
Observaciones
```

---

# Validaciones

## Validación Estructural

Verificar:

```text
Tipo.
Longitud.
Posición.
```

---

## Validación Funcional

Verificar:

```text
Ramo.
Modalidad.
Compañía.
Estado.
```

---

## Validación Comercial

Verificar:

```text
Canal.
Oficina.
Agente.
```

---

## Validación Financiera

Verificar:

```text
Cuenta.
Banco.
Forma cobro.
Coaseguro.
```

---

# Riesgos

## Riesgo Crítico

Ejemplos:

```text
Modalidad incorrecta.
Compañía incorrecta.
Póliza incorrecta.
```

---

## Riesgo Alto

Ejemplos:

```text
Agentes incorrectos.
Canales incorrectos.
Datos bancarios incorrectos.
```

---

## Riesgo Medio

Ejemplos:

```text
Campos derivados inconsistentes.
```

---

## Riesgo Bajo

Ejemplos:

```text
Campos informativos.
Campos administrativos.
```

---

# Salidas Esperadas

## Matriz de Mapping

Completa.

---

## Transformaciones

Documentadas.

---

## Reglas de Negocio

Documentadas.

---

## Campos Pendientes

Listado completo.

---

## Dependencias

```text
Funcionales.
Técnicas.
```

---

## Riesgos

Clasificados por severidad.

---

# Formato de Respuesta Esperado

```text
Campo CETL
↓
Origen IDMS
↓
Destino REEF
↓
Transformación
↓
Dependencias
↓
Validaciones
↓
Riesgos
```

---

# Checklist

Verificar:

- [ ] Campo CETL identificado.
- [ ] Campo IDMS identificado.
- [ ] Tabla REEF identificada.
- [ ] Campo REEF identificado.
- [ ] Reglas documentadas.
- [ ] Valores fijos identificados.
- [ ] Campos calculados identificados.
- [ ] Campos pendientes identificados.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Dónde se almacena este dato en REEF?

¿Qué campo IDMS lo origina?

¿Qué transformación debe aplicarse?

¿Es un valor fijo, calculado o directo?

¿Qué tablas participan?

¿Qué dependencias existen?

¿Existen incertidumbres en el mapping?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Existe trazabilidad completa DGTP → IDMS → REEF.
- Todas las transformaciones están documentadas.
- Se identifican reglas de negocio y valores fijos.
- Se conocen las dependencias funcionales y técnicas.
- Se documentan huecos y ambigüedades.
- El resultado puede utilizarse directamente para migraciones, integraciones o procesos ETL.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
