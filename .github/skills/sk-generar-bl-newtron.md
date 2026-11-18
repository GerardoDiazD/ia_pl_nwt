---
name: sk-generar-bl-newtron
type: skill
description: Genera paquetes BL NewTRON para validaciones y reglas de negocio sin SQL directo ni control transaccional.
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

# Skill: Generar BL NewTRON

## Objetivo

Implementar BL_* con reglas de negocio, validaciones y calculos reutilizando DL para acceso a datos.

## Alcance

Permitido:

```text
Validaciones
Reglas de negocio
Calculos
Transformaciones funcionales
```

Prohibido:

```text
SQL directo
CRUD directo
COMMIT
ROLLBACK
```

## Ubicacion

```text
NWT_BL
```

## Convencion

```text
BL_[FAMILIA]_[CONCEPTO]_TRN
```

## Procedimiento

1. Definir caso funcional y contrato de entrada/salida.
2. Consumir operaciones DL mediante esquema explicito.
3. Aplicar reglas de negocio y validaciones.
4. Integrar dl_trn_dbg y dl_trn_err.
5. Retornar estado funcional en objeto O_*_P u O_*_PT.

## Patron recomendado

```plsql
nwt_dl.dl_thp_agn_trn.f_get(...);
dl_trn_err.p_chc(pm_obj_p);
```

## Salida esperada

- PACKAGE y PACKAGE BODY BL.
- Reglas funcionales separadas de SQL.
- Contratos corporativos de objetos.

## Checklist

- [ ] Nombre BL_*_TRN.
- [ ] Sin SQL directo.
- [ ] Sin COMMIT/ROLLBACK.
- [ ] Reglas funcionales explicitas.
- [ ] Dependencias DL con esquema.
- [ ] Trazas y errores corporativos.

## Definicion de exito

La logica de negocio queda desacoplada de persistencia y de transaccion, y lista para orquestacion SR/OP.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
