---
name: sk-generar-auditoria-be-nwt
type: skill
description: Diseña e implementa mecanismos de auditoría, métricas y trazabilidad para procesos BE-NWT, permitiendo seguimiento operativo, diagnóstico y explotación de información.
domain: be-nwt
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:be-nwt
    - rag:newtron-nomenclatura
    - rag:newtron-acronimos
---

# Skill: Generar Auditoría y Métricas BE-NWT

## Objetivo

Diseñar e implementar capacidades de auditoría, monitorización y métricas para procesos ejecutados en BE-NWT.

La solución debe proporcionar información suficiente para:

- Seguimiento operativo.
- Diagnóstico de incidencias.
- Análisis de rendimiento.
- Auditoría funcional.
- Explotación estadística.

---

## Cuándo utilizar esta skill

Utilizar cuando se requiera:

- Auditar procesos batch.
- Auditar exportaciones.
- Auditar integraciones.
- Registrar actividad funcional.
- Obtener métricas de ejecución.
- Implementar trazabilidad de procesos.
- Generar informes de explotación.
- Facilitar soporte y operación.

---

## Contexto arquitectónico

La auditoría debe implementarse como una capacidad transversal reutilizable.

### Service Repository (SR)

Responsable de:

- Registrar eventos funcionales.
- Invocar componentes de auditoría.
- Gestionar contexto del proceso.

---

### Commons

Responsable de:

- Métricas.
- Estadísticas.
- Registro de errores.
- Generación de informes.
- Utilidades de auditoría.

---

### Observabilidad

Las métricas y eventos deben ser compatibles con las herramientas corporativas de observabilidad.

Ejemplo:

```text
DynaTrace
```

---

## Patrón recomendado

```text
Proceso
 ↓
Auditoría
 ↓
Métricas
 ↓
Estadísticas
 ↓
Logs
 ↓
Informe final
```

---

## Procedimiento

### Paso 1. Identificar el proceso

Determinar:

```text
Exportación.
Batch.
Integración.
Carga.
Transformación.
Migración.
```

---

### Paso 2. Identificar hitos relevantes

Registrar como mínimo:

```text
Inicio.
Fin.
Error.
Cancelación.
Reintento.
Resultado.
```

---

### Paso 3. Diseñar métricas

Registrar:

```text
Total procesados.
Total correctos.
Total erróneos.
Duración.
Tiempo medio.
Reintentos.
```

---

### Paso 4. Diseñar captura de errores

Registrar:

```text
Tipo error.
Mensaje.
Timestamp.
Proceso.
Identificador funcional.
```

---

### Paso 5. Diseñar auditoría funcional

Registrar eventos de negocio relevantes.

Ejemplos:

```text
Póliza exportada.
Certificado procesado.
Documento generado.
Integración completada.
```

---

### Paso 6. Diseñar auditoría técnica

Registrar:

```text
Errores técnicos.
Timeouts.
Problemas de red.
Problemas de base de datos.
```

---

### Paso 7. Diseñar estadísticas agregadas

Generar información resumida.

Ejemplos:

```text
Volumen procesado.
Ratio de éxito.
Ratio de error.
Tiempo medio por registro.
```

---

### Paso 8. Diseñar informes

Cuando aplique generar:

```text
Resumen de ejecución.
Detalle de errores.
Informe estadístico.
```

---

### Paso 9. Diseñar retención

Determinar:

```text
Qué datos conservar.
Durante cuánto tiempo.
Con qué nivel de detalle.
```

---

## Convenciones arquitectónicas

### Centralización

Todas las métricas y auditorías deben utilizar componentes reutilizables.

Evitar:

```text
Implementaciones aisladas por proceso.
```

---

### Trazabilidad

Cada ejecución debe disponer de:

```text
Identificador único.
Fecha inicio.
Fecha fin.
Resultado.
```

---

### Observabilidad

Toda ejecución relevante debe exponer información suficiente para:

```text
Monitorización.
Diagnóstico.
Explotación.
```

---

### Bajo impacto

La auditoría no debe convertirse en un cuello de botella del proceso principal.

---

## Métricas recomendadas

### Procesamiento

```text
Total registros.
Registros correctos.
Registros erróneos.
```

---

### Rendimiento

```text
Tiempo total.
Tiempo medio.
Tiempo máximo.
Tiempo mínimo.
```

---

### Calidad

```text
Ratio éxito.
Ratio error.
Errores por categoría.
```

---

### Integración

```text
Llamadas realizadas.
Llamadas exitosas.
Llamadas fallidas.
Retries ejecutados.
```

---

## Salidas esperadas

- Modelo de eventos de auditoria.
- Catalogo de metricas de proceso.
- Estrategia de logs y trazabilidad.
- Formato de informe de ejecucion.

## Criterios de exito

La skill se considera completada cuando:

- define hitos y metricas minimas por ejecucion,
- permite diagnostico de errores por categoria,
- soporta explotacion operativa y soporte,
- mantiene bajo impacto en el proceso principal.

La skill debe generar:

### Modelo de auditoría

```text
Eventos.
Errores.
Métricas.
```

---

### Modelo estadístico

```text
Indicadores.
Ratios.
Contadores.
```

---

### Estrategia de reporting

```text
Resumen.
Errores.
Indicadores.
```

---

### Estrategia de observabilidad

```text
Logs.
Métricas.
Monitorización.
```

---

## Checklist

Verificar:

- [ ] Inicio y fin auditados.
- [ ] Métricas definidas.
- [ ] Errores auditados.
- [ ] Identificadores de trazabilidad definidos.
- [ ] Estadísticas generadas.
- [ ] Informes definidos.
- [ ] Componentes reutilizables.
- [ ] Compatible con observabilidad corporativa.

---

## Preguntas que esta skill debe responder

```text
¿Cómo auditar un proceso BE-NWT?

¿Qué métricas deben registrarse?

¿Cómo calcular ratios de éxito?

¿Cómo generar informes de ejecución?

¿Cómo registrar errores de forma trazable?

¿Cómo monitorizar el comportamiento de un proceso?
```

---

## Definición de éxito

La skill se considera completada cuando:

- Existe trazabilidad completa del proceso.
- Los eventos relevantes están auditados.
- Los errores pueden diagnosticarse.
- Las métricas permiten medir el rendimiento.
- Se generan estadísticas explotables.
- La monitorización es compatible con los sistemas corporativos.
- La solución es reutilizable para futuros desarrollos BE-NWT.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
