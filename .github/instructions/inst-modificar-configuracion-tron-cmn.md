---
name: inst-modificar-configuracion-tron-cmn
type: instruction
description: Reglas operativas para modificar el repositorio reef-vida-bkesp-tron_cmn garantizando consistencia funcional, compatibilidad de despliegue, trazabilidad de configuración y alineamiento con la plataforma TRON/NewTRON.
domain: tron
version: 1.1
owner: arquitectura-reef
priority: alta
---

# Instrucción: Modificación de Configuración TRON CMN

## Objetivo

Garantizar que cualquier cambio realizado en el repositorio:

```text
reef-vida-bkesp-tron_cmn
```

mantenga:

```text
Consistencia funcional.
Integridad de configuración.
Compatibilidad de despliegue.
Trazabilidad por ramo.
Compatibilidad con TRON y NewTRON.
```

---

# Alcance

Aplica a:

```text
Scripts SQL.
Packages Oracle.
Stored Procedures.
Objetos Oracle.
Configuración de ramas.
Configuración de compañía.
Scripts de despliegue.
Configuración de modalidades.
```

---

# Contexto Funcional

## País

```text
España (ESP)
```

---

## Compañía principal

```text
20003
```

---

## Ramo principal

```text
118
```

---

## Plataforma

```text
TRON
NewTRON
```

---

# Principio General

Antes de realizar cualquier modificación:

```text
Analizar dependencias.
Identificar ramo afectado.
Identificar modalidad afectada.
Verificar impacto transversal.
```

---

# Regla de Compañía

## Obligatorio

Mantener:

```text
COD_CIA = 20003
```

cuando se trate de configuración estándar BKESP.

---

## Prohibido

Modificar identificadores de compañía sin requerimiento funcional explícito.

---

# Regla de Ramo

## Obligatorio

Mantener trazabilidad de:

```text
COD_RAMO = 118
```

cuando corresponda a Vida Individual España.

---

## Importante

Los bloques:

```text
RAMO_01
RAMO_02
RAMO_04
```

no representan códigos de ramo reales.

Representan:

```text
Bloques funcionales.
```

---

## Regla

No confundir:

```text
RAMO_01
```

con:

```text
COD_RAMO = 01
```

---

# Regla de Modalidades

Antes de modificar cualquier script verificar:

```text
Si afecta modalidades.
Qué modalidades impacta.
Si existen filtros COD_MODALIDAD.
```

---

## Obligatorio

Conservar la coherencia funcional de:

```text
COD_MODALIDAD
```

entre scripts relacionados.

---

## Prohibido

Agregar modalidades sin validar dependencias funcionales.

---

# Clasificación de Scripts

## Fase 1

```text
Ajustes previos.
Datos maestros.
Correcciones.
Usuarios.
```

---

## Fase 2

```text
Preparación.
DDL.
Deshabilitación de restricciones.
Triggers.
Índices.
```

---

## Fase 3

```text
Carga funcional principal.
```

---

## Fase 4

```text
Particiones.
Rehabilitación de triggers.
Finalización.
```

---

# Regla de Orden de Instalación

## Obligatorio

Los scripts se despliegan por:

```text
Orden alfanumérico.
```

---

## Prohibido

Introducir dependencias que requieran un orden distinto.

---

## Antes de crear un nuevo script

Verificar:

```text
Posición de despliegue.
Dependencias previas.
Objetos requeridos.
```

---

# Gestión de DDL

## Incluye

```text
Triggers.
Índices.
Constraints.
Particiones.
Tablas.
```

---

## Recomendado

Mantener los cambios DDL separados de los cambios DML.

---

## Evitar

Mezclar:

```text
Estructura.
Datos.
```

en un mismo cambio cuando no sea necesario.

---

# Gestión de DML

## Incluye

```text
INSERT
UPDATE
DELETE
MERGE
```

---

## Obligatorio

Mantener coherencia con:

```text
Compañía.
Ramo.
Modalidad.
```

---

# Regla de Scripts Productivos

## Carpeta

```text
sql/
```

---

## Contenido esperado

```text
Configuración productiva.
Configuración oficial.
Carga funcional.
```

---

# Regla de Scripts No Productivos

## Carpeta

```text
sql_noprod/
```

---

## Contenido esperado

```text
Configuración temporal.
Generación TRON21.
Utilidades auxiliares.
Procesos no productivos.
```

---

## Prohibido

Mover configuración productiva a:

```text
sql_noprod
```

sin validación previa.

---

# Modificación de Packages Oracle

## Obligatorio

Seguir las reglas NewTRON definidas en:

```text
inst-desarrollo-plsql-newtroniano
```

---

## Aplica a

```text
BL
DL
SR
IL
O
```

---

# Gestión de Objetos Oracle

## Obligatorio

Reutilizar:

```text
Objetos existentes.
Packages existentes.
Tipos existentes.
```

---

## Prohibido

Duplicar componentes ya existentes.

---

# Trazabilidad de Cambios

Toda modificación debe identificar:

```text
Ramo afectado.
Modalidad afectada.
Tablas afectadas.
Scripts afectados.
```

---

# Validaciones Previas

Antes de realizar commit verificar:

- Dependencias identificadas.
- Orden de despliegue correcto.
- Compañía validada.
- Ramo validado.
- Modalidades revisadas.
- Scripts consistentes.
- Objetos existentes reutilizados.

---

# Validaciones Previas al Pull Request

Verificar:

- Compatibilidad con despliegue.
- Compatibilidad funcional.
- Integridad de configuración.
- Ausencia de conflictos entre bloques funcionales.
- Trazabilidad documentada.

---

# Estrategia de Ramas

Seguir:

```text
feature/*
hotfix/*
develop
main
```

---

## Flujo estándar

```text
feature/*
↓
develop
↓
main
```

---

# Restricciones

No realizar:

```text
Cambios de compañía sin análisis.
Cambios de ramo sin análisis.
Cambios de modalidad sin trazabilidad.
Cambios de orden de despliegue.
Dependencias ocultas.
```

---

# Checklist de Cumplimiento

- [ ] Se conoce el ramo afectado.
- [ ] Se conoce la compañía afectada.
- [ ] Se conocen las modalidades afectadas.
- [ ] El orden de despliegue sigue siendo válido.
- [ ] No se rompen dependencias.
- [ ] Los cambios son compatibles con TRON.
- [ ] Los cambios son compatibles con NewTRON.
- [ ] Los componentes existentes se reutilizan.
- [ ] La trazabilidad está documentada.
- [ ] La PR incluye contexto funcional.

---

# Definición de Éxito

La instrucción se considera cumplida cuando:

- El cambio mantiene la integridad del repositorio.
- No se altera el orden de despliegue previsto.
- Las configuraciones continúan siendo coherentes para la compañía 20003 y el ramo 118.
- Las modalidades afectadas permanecen consistentes.
- Los procesos TRON y NewTRON continúan funcionando sin modificaciones adicionales.
- El cambio puede promocionarse entre entornos de forma segura y trazable.