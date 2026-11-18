---
name: sk-generar-exportacion-be-nwt
type: skill
description: Diseña e implementa procesos de exportación de archivos en BE-NWT siguiendo los patrones arquitectónicos corporativos REEF.
domain: be-nwt
version: 1.1
owner: arquitectura-reef
dependencies:
  knowledge:
    - rag:be-nwt
    - rag:newtron-nomenclatura
    - rag:newtron-acronimos
---

# Skill: Generar Exportación de Archivos BE-NWT

## Objetivo

Diseñar e implementar procesos de generación de archivos en BE-NWT respetando la arquitectura estándar del ecosistema REEF.

La solución debe ser escalable, reutilizable, auditable y consistente con los patrones existentes del componente.

---

## Cuándo utilizar esta skill

Utilizar cuando se requiera:

- Exportar información de REEF a archivos.
- Generar interfaces batch para sistemas externos.
- Construir ficheros de longitud fija.
- Construir ficheros CSV.
- Generar extractos masivos de información.
- Crear reportes físicos para intercambio entre sistemas.

---

## Contexto arquitectónico

Las exportaciones en BE-NWT deben distribuir responsabilidades entre módulos especializados.

### Data Logic (DL)

Responsable de:

- Consultas SQL.
- Lectura de datos.
- Cursores.
- Acceso a base de datos.

---

### Service Repository (SR)

Responsable de:

- Orquestación del proceso.
- Reglas de negocio.
- Flujo de exportación.
- Gestión de errores.
- Coordinación de componentes.

---

### Commons

Responsable de:

- Transformaciones.
- Conversiones.
- Formateo.
- Generación de archivos.
- Utilidades reutilizables.

---

## Patrón recomendado

```text
SR
 ↓
DL (consulta principal)
 ↓
DL (consultas enriquecimiento)
 ↓
Transformadores
 ↓
Mapper archivo
 ↓
Generador archivo
```

---

## Procedimiento

### Paso 1. Identificar el origen de datos

Determinar:

- Tablas involucradas.
- Entidades funcionales.
- Volumen esperado.

Ejemplos:

```text
Pólizas
Asegurados
Tomadores
Beneficiarios
Coberturas
```

---

### Paso 2. Diseñar consultas DL

Las consultas deben ubicarse en:

```text
nwt_be-{dominio}-dl-impl
```

Responsabilidades:

- Recuperar información.
- Optimizar acceso a datos.
- Encapsular SQL.

Evitar:

```text
SQL en componentes SR.
```

---

### Paso 3. Definir estrategia de volumen

#### Volumen pequeño

```text
Menos de 10.000 registros.
```

Procesamiento completo en memoria.

---

#### Volumen medio

```text
10.000 - 100.000 registros.
```

Procesamiento mediante lotes.

---

#### Volumen alto

```text
Más de 100.000 registros.
```

Procesamiento mediante cursor y streaming.

---

### Paso 4. Diseñar transformaciones

Implementar transformaciones en componentes reutilizables.

Ejemplos:

```text
Conversión de códigos.
Formateo de fechas.
Conversión de importes.
Normalización de textos.
```

Ubicación recomendada:

```text
nwt_be-commons
```

---

### Paso 5. Diseñar mapper de archivo

Responsable de:

- Construir líneas de salida.
- Aplicar formatos.
- Garantizar longitudes.

Tipos habituales:

```text
Longitud fija.
CSV.
TXT.
Interfaces propietarias.
```

---

### Paso 6. Diseñar generación física

Responsable de:

- Escritura.
- Streaming.
- Archivos temporales.
- Consolidación.

Ubicación recomendada:

```text
nwt_be-commons
```

---

### Paso 7. Diseñar auditoría

Registrar:

- Inicio.
- Fin.
- Registros procesados.
- Registros exportados.
- Errores.

Generar cuando sea necesario:

```text
Archivo resumen.
Archivo de errores.
```

---

### Paso 8. Diseñar manejo de errores

Clasificar errores:

```text
Lectura de datos.
Transformación.
Generación archivo.
Integración externa.
```

Registrar contexto suficiente para diagnóstico.

---

## Convenciones arquitectónicas

### Reutilización

Priorizar:

```text
DL reutilizables.
Transformadores reutilizables.
Generadores reutilizables.
```

Evitar duplicaciones.

---

### Separación de responsabilidades

DL:

```text
Obtiene datos.
```

SR:

```text
Orquesta.
```

Commons:

```text
Transforma y genera.
```

---

### Configuración

Parámetros configurables:

```text
Batch size.
Rutas.
Nombres.
Límites.
```

No codificar valores fijos cuando puedan variar por entorno.

---

## Salidas esperadas

La skill debe generar:

### Diseño de componentes

```text
Componentes DL
Componentes SR
Componentes Commons
```

### Diseño de ejecución

```text
Estrategia por volumen
Patron de lectura
Patron de escritura
```

### Diseño de control operativo

```text
Manejo de errores
Auditoria
Metricas
```

---

## Criterios de exito

La skill se considera completada cuando:

- el diseño respeta separacion DL/SR/Commons,
- la estrategia de volumen es adecuada,
- incluye trazabilidad y manejo de errores,
- evita duplicaciones y acoplamiento innecesario.

```text
DL implicados.
SR implicados.
Commons implicados.
```

---

### Flujo de procesamiento

```text
Lectura
→ Transformación
→ Formateo
→ Exportación
```

---

### Estrategia de volumen

```text
Memoria
Batch
Streaming
```

---

### Estrategia de errores

```text
Recuperación
Continuación
Abortar proceso
```

---

### Estrategia de auditoría

```text
Logs.
Resumen.
Errores.
```

---

## Checklist

Verificar:

- [ ] SQL aislado en DL.
- [ ] Orquestación en SR.
- [ ] Transformaciones en Commons.
- [ ] Manejo de grandes volúmenes.
- [ ] Logging de progreso.
- [ ] Auditoría disponible.
- [ ] Configuración externalizada.
- [ ] Componentes reutilizables.

---

## Definición de éxito

La skill se considera completada cuando:

- La exportación respeta la arquitectura BE-NWT.
- Existe separación clara de responsabilidades.
- El proceso soporta el volumen esperado.
- La solución es reutilizable.
- El proceso es auditable.
- La generación del archivo puede ejecutarse de forma segura en producción.

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
