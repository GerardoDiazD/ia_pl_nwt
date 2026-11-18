---
name: sk-generar-integracion-api-externa-be-nwt
type: skill
description: Diseña e implementa integraciones entre BE-NWT y servicios externos aplicando patrones de resiliencia, trazabilidad y desacoplamiento.
domain: be-nwt
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:be-nwt
    - rag:newtron-nomenclatura
    - rag:newtron-acronimos
    - rag:normativas-api
---

# Skill: Generar Integración con APIs Externas BE-NWT

## Objetivo

Diseñar e implementar integraciones entre BE-NWT y servicios externos garantizando:

- Robustez.
- Tolerancia a fallos.
- Trazabilidad.
- Reutilización.
- Cumplimiento de estándares corporativos.

La integración debe minimizar el impacto de incidencias externas sobre los procesos internos de REEF.

---

## Cuándo utilizar esta skill

Utilizar cuando se requiera:

- Consumir APIs REST externas.
- Consumir APIs corporativas.
- Integrar plataformas de terceros.
- Invocar servicios de proveedores.
- Interactuar con sistemas corporativos externos.
- Integrar servicios de autenticación.
- Consumir servicios documentales.
- Consumir servicios de comunicación.

---

## Contexto arquitectónico

Las integraciones externas deben aislarse del resto de la lógica funcional.

### Service Repository (SR)

Responsable de:

- Orquestar la integración.
- Gestionar errores.
- Aplicar reglas funcionales.
- Coordinar llamadas externas.

---

### Commons

Responsable de:

- Clientes reutilizables.
- Transformaciones.
- Serialización.
- Utilidades de integración.

---

### APIs externas

Responsables de:

- Exponer capacidades fuera de REEF.
- Proporcionar información especializada.
- Ejecutar procesos remotos.

---

## Patrón recomendado

```text
SR
 ↓
Cliente integración
 ↓
API externa
 ↓
Transformación respuesta
 ↓
Lógica funcional
```

---

## Procedimiento

### Paso 1. Identificar sistema externo

Determinar:

```text
Proveedor.
Sistema corporativo.
API MAPFRE.
Plataforma documental.
Servicio de comunicaciones.
Servicio financiero.
```

---

### Paso 2. Identificar operación

Determinar:

```text
Consulta.
Creación.
Actualización.
Cancelación.
Búsqueda.
Validación.
```

---

### Paso 3. Diseñar contrato de integración

Definir:

#### Request

```text
Headers.
Parámetros.
Body.
Autenticación.
```

---

#### Response

```text
Datos funcionales.
Errores funcionales.
Errores técnicos.
```

---

### Paso 4. Diseñar cliente de integración

Responsabilidades:

- Invocación HTTP.
- Gestión de cabeceras.
- Serialización.
- Deserialización.

Evitar:

```text
Llamadas REST embebidas en lógica funcional.
```

---

### Paso 5. Diseñar resiliencia

Implementar estrategias de:

#### Retry

Reintentos automáticos ante errores transitorios.

Ejemplos:

```text
Timeout.
Error temporal de red.
Servicio no disponible.
```

---

#### Timeout

Definir límites máximos de espera.

Evitar:

```text
Esperas indefinidas.
```

---

#### Recovery

Definir comportamiento cuando se agotan los intentos.

Posibles opciones:

```text
Respuesta alternativa.
Error controlado.
Registro para reproceso.
```

---

### Paso 6. Diseñar tratamiento de errores

Clasificar:

#### Funcionales

Ejemplos:

```text
Cliente inexistente.
Documento no encontrado.
Operación no permitida.
```

---

#### Técnicos

Ejemplos:

```text
Timeout.
Conexión rechazada.
Servicio indisponible.
Error de red.
```

---

### Paso 7. Diseñar transformaciones

Separar:

```text
Modelo REEF.
Modelo externo.
```

Utilizar mappers específicos.

Evitar contaminar modelos de dominio con estructuras externas.

---

### Paso 8. Diseñar trazabilidad

Registrar:

```text
Timestamp.
Operación.
Sistema externo.
Tiempo de respuesta.
Resultado.
```

---

### Paso 9. Diseñar auditoría

Registrar:

```text
Número de llamadas.
Llamadas correctas.
Llamadas erróneas.
Reintentos.
Tiempos medios.
```

---

## Convenciones arquitectónicas

### Desacoplamiento

Mantener separado:

```text
Dominio REEF.
Modelo externo.
```

---

### Reutilización

Centralizar:

```text
Clientes REST.
Mappers.
Configuración.
Errores comunes.
```

---

### Configuración

Externalizar:

```text
URL.
Timeouts.
Retries.
Credenciales por entorno.
Circuit breaker thresholds.
```

---

## Salidas esperadas

- Contrato de integracion definido.
- Cliente desacoplado y reutilizable.
- Estrategia de resiliencia documentada.
- Modelo de errores y trazabilidad definido.

## Criterios de exito

La skill se considera completada cuando:

- separa dominio REEF de modelo externo,
- define timeout/retry/recovery,
- clasifica errores funcionales y tecnicos,
- habilita trazabilidad para soporte operativo.
Timeouts.
Credenciales.
Retries.
```

---

### Seguridad

No almacenar:

```text
Tokens.
Passwords.
Secrets.
```

en código fuente.

---

## Estrategias recomendadas

### Integración síncrona

Utilizar cuando:

```text
La respuesta es necesaria inmediatamente.
```

---

### Integración asíncrona

Utilizar cuando:

```text
El sistema externo tarda en responder.
El proceso puede continuar sin respuesta inmediata.
Existen grandes volúmenes.
```

---

## Salidas esperadas

La skill debe generar:

### Diseño de integración

```text
Sistema origen.
Sistema destino.
Objetivo funcional.
```

---

### Contratos

```text
Request.
Response.
```

---

### Estrategia de resiliencia

```text
Retries.
Timeout.
Recovery.
```

---

### Estrategia de errores

```text
Errores técnicos.
Errores funcionales.
```

---

### Estrategia de auditoría

```text
Logs.
Métricas.
Trazabilidad.
```

---

## Checklist

Verificar:

- [ ] Cliente desacoplado de la lógica de negocio.
- [ ] Timeouts definidos.
- [ ] Reintentos definidos.
- [ ] Tratamiento de errores definido.
- [ ] Transformaciones separadas.
- [ ] Logging implementado.
- [ ] Auditoría disponible.
- [ ] Configuración externalizada.
- [ ] Seguridad aplicada.

---

## Preguntas que esta skill debe responder

```text
¿Cómo integrar un servicio externo desde BE-NWT?

¿Dónde debe residir el cliente REST?

¿Cómo gestionar timeout y retry?

¿Cómo desacoplar modelos externos?

¿Cómo registrar errores de integración?

¿Cómo diseñar una integración mantenible?
```

---

## Definición de éxito

La skill se considera completada cuando:

- La integración sigue la arquitectura BE-NWT.
- Existe desacoplamiento entre dominio y proveedor externo.
- Los errores están controlados.
- Existe resiliencia ante fallos.
- La solución es reutilizable.
- Existe trazabilidad completa de las llamadas.
- La configuración es parametrizable por entorno.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
