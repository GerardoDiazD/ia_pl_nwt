---
name: sk-generar-batch-be-nwt
type: skill
description: Diseña e implementa procesos batch en BE-NWT para el tratamiento masivo de datos utilizando patrones de cursor, procesamiento incremental y gestión controlada de errores.
domain: be-nwt
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
        - rag:be-nwt
        - rag:newtron-nomenclatura
        - rag:newtron-acronimos
---

# Skill: Generar Procesamiento Batch BE-NWT

## Objetivo

Diseñar e implementar procesos batch corporativos en BE-NWT para el procesamiento masivo de información de forma eficiente, trazable y escalable.

La solución debe minimizar el consumo de memoria, soportar grandes volúmenes de datos y permitir la recuperación ante errores.

---

## Cuándo utilizar esta skill

Utilizar cuando se requiera:

- Procesar grandes volúmenes de registros.
- Ejecutar procesos nocturnos.
- Ejecutar tratamientos masivos.
- Realizar migraciones de datos.
- Ejecutar recalculos masivos.
- Procesar lotes de pólizas.
- Procesar lotes de asegurados.
- Procesar lotes de siniestros.
- Procesar integraciones batch con sistemas externos.

---

## Contexto arquitectónico

Los procesos batch en BE-NWT deben ejecutarse respetando la separación de responsabilidades del sistema.

### Data Logic (DL)

Responsable de:

- Consultas SQL.
- Cursores.
- Recuperación de registros.
- Acceso a datos.

---

### Service Repository (SR)

Responsable de:

- Orquestación del lote.
- Gestión del flujo.
- Control de ejecución.
- Recuperación ante errores.
- Gestión del progreso.

---

### Commons

Responsable de:

- Utilidades de procesamiento.
- Estadísticas.
- Métricas.
- Logging.
- Componentes reutilizables.

---

## Patrón recomendado

```text
SR Batch
    ↓
DL Cursor
    ↓
Procesador
    ↓
Transformación
    ↓
Persistencia / Integración
    ↓
Auditoría
```

---

## Procedimiento

### Paso 1. Identificar la entidad de proceso

Determinar:

```text
Pólizas
Asegurados
Tomadores
Beneficiarios
Coberturas
Siniestros
Terceros
Documentos
```

---

### Paso 2. Determinar volumen esperado

Clasificar:

#### Bajo

```text
Hasta 10.000 registros.
```

---

#### Medio

```text
10.000 a 100.000 registros.
```

---

#### Alto

```text
Más de 100.000 registros.
```

---

### Paso 3. Diseñar recuperación de datos

Ubicar consultas en:

```text
nwt_be-{dominio}-dl-impl
```

Preferir:

```text
Cursores.
RowCallbackHandler.
Lectura secuencial.
```

Evitar:

```text
Carga masiva completa en memoria.
```

---

### Paso 4. Diseñar procesador batch

Crear un componente encargado de procesar cada registro individualmente.

Responsabilidades:

```text
Validación.
Transformación.
Aplicación de reglas.
Persistencia.
```

Cada registro debe poder procesarse de forma independiente.

---

### Paso 5. Diseñar estrategia de errores

Determinar:

#### Error recuperable

Permite continuar.

Ejemplos:

```text
Datos inválidos.
Formato incorrecto.
Error funcional puntual.
```

---

#### Error crítico

Detiene el proceso.

Ejemplos:

```text
Error de infraestructura.
Error de conexión.
Corrupción de datos.
```

---

### Paso 6. Diseñar estrategia de continuidad

Definir:

```text
Stop On Error
Continue On Error
Threshold Error Limit
```

según criticidad del proceso.

---

### Paso 7. Diseñar control de progreso

Registrar:

```text
Procesados.
Pendientes.
Correctos.
Erróneos.
```

Informar periódicamente del avance.

---

### Paso 8. Diseñar auditoría

Registrar:

```text
Inicio.
Fin.
Duración.
Volumen procesado.
Errores.
Resultado final.
```

---

### Paso 9. Diseñar recuperación

Determinar si el proceso requiere:

```text
Reinicio desde cero.
Reinicio desde último registro.
Reinicio desde checkpoint.
```

---

## Convenciones arquitectónicas

### Procesamiento incremental

Priorizar:

```text
Procesamiento registro a registro.
```

frente a:

```text
Procesamiento masivo en memoria.
```

---

### Bajo consumo de memoria

Reducir:

```text
Listas completas.
Colecciones masivas.
Objetos temporales innecesarios.
```

---

### Reutilización

Centralizar:

```text
Procesadores.
Transformadores.
Validadores.
Auditoría.
```

---

### Configuración

Externalizar:

```text
batch size
commit size
error threshold
timeouts
```

---

## Salidas esperadas

- Diseño de proceso batch por capas.
- Estrategia de lectura y continuidad.
- Politica de errores y reinicio.
- Metricas y auditoria de ejecucion.

## Criterios de exito

La skill se considera completada cuando:

- procesa incrementalmente sin carga masiva en memoria,
- distingue errores recuperables y criticos,
- define estrategia de reinicio,
- entrega trazabilidad operativa suficiente.

```text
Batch Size.
Límites de errores.
Timeouts.
Frecuencia de logs.
```

---

## Salidas esperadas

La skill debe generar:

### Diseño del lote

```text
Objetivo.
Entidad procesada.
Volumen estimado.
```

---

### Componentes involucrados

```text
DL.
SR.
Commons.
```

---

### Estrategia de ejecución

```text
Cursor.
Batch.
Streaming.
```

---

### Estrategia de errores

```text
Continuar.
Abortar.
Recuperar.
```

---

### Estrategia de auditoría

```text
Logs.
Métricas.
Estadísticas.
```

---

## Checklist

Verificar:

- [ ] Consulta optimizada.
- [ ] Procesamiento incremental.
- [ ] Sin carga masiva en memoria.
- [ ] Manejo de errores definido.
- [ ] Métricas disponibles.
- [ ] Auditoría disponible.
- [ ] Configuración externalizada.
- [ ] Componentes reutilizables.
- [ ] Posibilidad de recuperación evaluada.

---

## Preguntas que esta skill debe responder

```text
¿Cómo procesar millones de registros?

¿Dónde debe ubicarse la lógica batch?

¿Cómo controlar el consumo de memoria?

¿Cómo registrar estadísticas?

¿Cómo recuperar el proceso si falla?

¿Cómo gestionar errores sin perder trazabilidad?
```

---

## Definición de éxito

La skill se considera completada cuando:

- El proceso batch respeta la arquitectura BE-NWT.
- El consumo de memoria es controlado.
- El lote puede procesar grandes volúmenes.
- Existe trazabilidad completa.
- Se dispone de métricas y auditoría.
- El comportamiento ante errores está claramente definido.
- La solución es reutilizable y mantenible.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
