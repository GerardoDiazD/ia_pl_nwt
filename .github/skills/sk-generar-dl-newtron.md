---
name: sk-generar-dl-newtron
type: skill
description: Genera paquetes DL NewTRON para acceso a datos y persistencia con estandar corporativo de trazas y errores.
domain: plsql
version: 1.1
owner: arquitectura-reef
dependencies:
  instructions:
    - inst-desarrollo-plsql-newtroniano.md
  knowledge:
    - rag:kb-arquitectura-plsql-newtron
    - rag:kb-nomenclatura-newtron-plsql
    - rag:kb-tipos-newtron
    - rag:kb-framework-plsql-newtron
---

# Skill: Generar DL NewTRON

## Objetivo

Diseñar e implementar paquetes DL_* para consultas y persistencia sin invadir responsabilidades de BL o SR.

## Alcance

Permitido:

```text
SELECT
INSERT
UPDATE
DELETE
MERGE
Cursores
Mapeo tabla <-> objeto
```

Prohibido:

```text
Reglas de negocio complejas
Orquestacion
COMMIT
ROLLBACK
```

## Ubicacion

```text
NWT_DL
```

## Convencion

```text
DL_[FAMILIA]_[CONCEPTO]_TRN
```

## Procedimiento

1. Identificar entidad, tabla fisica y objeto corporativo.
2. Definir interfaz minima (f_get, f_qry, p_ins, p_upd, p_del).
3. Implementar SQL y mapeo objeto-tabla.
4. Integrar trazas (dl_trn_dbg).
5. Integrar errores (dl_trn_err).
6. Verificar ausencia de transacciones.

## Plantilla minima

```plsql
FUNCTION f_get (
    pm_idioma IN VARCHAR2,
    pm_obj_p  IN OUT NOCOPY O_THP_AGN_P
) RETURN O_THP_AGN_P;

PROCEDURE p_ins (
    pm_idioma IN VARCHAR2,
    pm_obj_p  IN OUT NOCOPY O_THP_AGN_P
);
```

## Salida esperada

- PACKAGE y PACKAGE BODY listos para NWT_DL.
- Operaciones CRUD documentadas.
- Mapeo objeto-tabla explicito.
- Trazabilidad y gestion de errores activas.

## Checklist

- [ ] Nombre DL_*_TRN.
- [ ] SQL solo en DL.
- [ ] Sin COMMIT ni ROLLBACK.
- [ ] Sin reglas de negocio complejas.
- [ ] Uso de objetos corporativos.
- [ ] Uso de dl_trn_dbg y dl_trn_err.

## Definicion de exito

El paquete encapsula completamente la persistencia y puede ser consumido por BL/SR sin cambios.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
