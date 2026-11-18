---
name: sk-generar-especificacion-migracion-bdm
type: skill
description: Genera especificaciones funcionales y técnicas de migración a partir de mappings Host → IDMS → REEF, identificando reglas de transformación, entidades afectadas, dependencias, validaciones y criterios de carga.
domain: migracion-datos
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:BDM-Contratos
---

# Skill: Generar Especificación de Migración BDM

## Objetivo

Construir una especificación completa de migración a partir de un layout Host y su correspondencia con REEF.

La especificación debe describir:

```text
Origen.
Destino.
Transformaciones.
Reglas de negocio.
Validaciones.
Dependencias.
Riesgos.
```

de forma que pueda ser utilizada por:

```text
Equipos funcionales.
Equipos técnicos.
Equipos ETL.
Equipos de pruebas.
Equipos de migración.
```

---

# Cuándo utilizar esta Skill

Utilizar cuando se necesite:

```text
Diseñar una migración.
Preparar una carga masiva.
Construir documentación funcional.
Generar una especificación ETL.
Documentar una integración Host → REEF.
Formalizar reglas de transformación.
```

---

# Entradas

## Layout Host

Ejemplo:

```text
BDM Contratos
BDM Clientes
BDM Coberturas
```

---

## Mapping

Ejemplo:

```text
Campo Host.
Campo IDMS.
Tabla REEF.
Campo REEF.
```

---

## Reglas funcionales

Ejemplo:

```text
Persona física.
Persona jurídica.
Tomador.
Asegurado.
Beneficiario.
```

---

# Objetivos del Análisis

La skill debe determinar:

```text
Qué se migra.
Dónde se migra.
Cómo se transforma.
Qué dependencias existen.
Qué validaciones aplicar.
```

---

# Procedimiento

## Paso 1

Inventario de origen.

---

## Identificar

```text
Campos origen.
Posiciones.
Longitudes.
Tipos.
```

---

## Clasificar

```text
Texto.
Numérico.
Fecha.
Indicador.
Código.
```

---

# Paso 2

Inventario de destino.

---

## Identificar

```text
Tablas REEF.
Campos REEF.
Entidades funcionales.
```

---

## Ejemplos

```text
A2000011
A2000012
A1001399
A1001331
DF_THP_NWT_XX_ADR
DF_THP_NWT_XX_CNT
DF_THP_NWT_XX_PCM
```

---

# Paso 3

Definir transformaciones

---

## Conversión de formato

Ejemplos:

```text
YYYYMMDD → DATE
COMP-3 → NUMBER
```

---

## Fragmentación

Ejemplo:

```text
GNOMCOMPLETO
↓
NOMBRE
APELLIDO1
APELLIDO2
```

---

## Composición

Ejemplo:

```text
CCONTRATO
↓
NUM_POLIZA_GRP
NUM_CONTRATO
```

---

## Valores constantes

Ejemplos:

```text
V
AG
00000000
ZEROES
SPACES
```

---

# Paso 4

Definir reglas de negocio

---

## Persona física

Identificar:

```text
Nombre.
Sexo.
Estado civil.
Fecha nacimiento.
```

---

## Persona jurídica

Identificar:

```text
Razón social.
Constitución.
Identificadores.
```

---

## Contrato

Identificar:

```text
Póliza.
Modalidad.
Ramo.
Forma de pago.
Prima.
```

---

# Paso 5

Determinar secuencia de carga

---

## Personas

Ejemplo:

```text
A1001399
↓
A1001331
```

---

## Direcciones

Ejemplo:

```text
DF_THP_NWT_XX_ADR
```

---

## Contactos

Ejemplo:

```text
DF_THP_NWT_XX_CNT
```

---

## Contratos

Ejemplo:

```text
A2000011
A2000012
```

---

# Paso 6

Identificar dependencias

---

## Dependencias funcionales

```text
Tomadores.
Asegurados.
Agentes.
Oficinas.
Productos.
```

---

## Dependencias técnicas

```text
Tablas.
Procesos ETL.
Interfaces.
Objetos Oracle.
```

---

# Paso 7

Construir reglas de validación

---

## Validaciones de formato

Verificar:

```text
Longitud.
Tipo.
Formato fecha.
Formato numérico.
```

---

## Validaciones funcionales

Verificar:

```text
Ramo.
Modalidad.
Documento.
Contrato.
```

---

## Validaciones de integridad

Verificar:

```text
Referencias.
Duplicados.
Relaciones obligatorias.
```

---

# Paso 8

Analizar excepciones

---

## Campos sin mapping

Ejemplos:

```text
KCLIENTE
TIPO-FONDO
REVAL-PENS
RENTA-ACTUAL
```

---

## Clasificación

### Pendiente funcional

```text
Falta decisión de negocio.
```

---

### Pendiente técnica

```text
Falta implementación.
```

---

# Salidas Esperadas

## Documento de Migración

Incluye:

```text
Origen.
Destino.
Transformaciones.
Validaciones.
```

---

## Matriz de Mapping

Formato:

```text
Host
↓
IDMS
↓
REEF
```

---

## Reglas de Transformación

Listado detallado.

---

## Dependencias

Funcionales y técnicas.

---

## Excepciones

Campos pendientes.

---

## Riesgos

Clasificados por criticidad.

---

# Formato de Respuesta Esperado

```text
Entidad origen
↓
Campos origen
↓
Transformaciones
↓
Tablas destino
↓
Campos destino
↓
Validaciones
↓
Dependencias
↓
Riesgos
```

---

# Checklist

Verificar:

- [ ] Origen identificado.
- [ ] Destino identificado.
- [ ] Mapping documentado.
- [ ] Transformaciones definidas.
- [ ] Secuencia de carga definida.
- [ ] Dependencias identificadas.
- [ ] Validaciones definidas.
- [ ] Excepciones documentadas.
- [ ] Riesgos documentados.

---

# Preguntas que esta Skill debe responder

```text
¿Cómo migrar este fichero a REEF?

¿Qué tablas intervienen?

¿Qué transformaciones deben aplicarse?

¿Qué reglas funcionales existen?

¿Qué validaciones son obligatorias?

¿Qué campos siguen pendientes?

¿Qué riesgos tiene la migración?
```

---

# Definición de Éxito

La skill se considera completada cuando:

- Existe una especificación completa de migración.
- Todos los mappings están documentados.
- Las transformaciones son reproducibles.
- Las dependencias están identificadas.
- Las validaciones están definidas.
- Los riesgos y excepciones están documentados.
- El documento puede utilizarse directamente para implementar procesos ETL o migraciones hacia REEF.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
