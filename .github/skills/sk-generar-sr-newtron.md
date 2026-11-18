---
name: sk-generar-sr-newtron
type: skill
description: Genera servicios SR NewTRON para orquestacion funcional y control transaccional de extremo a extremo.
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

# Skill: Generar SR NewTRON

## Objetivo

Construir paquetes SR_* como punto unico de entrada del caso de uso, con control transaccional y coordinacion de BL/OP.

## Alcance

Permitido:

```text
Orquestacion
Control de flujo
COMMIT
ROLLBACK
Invocacion BL/OP
```

Prohibido:

```text
SQL directo
CRUD directo
Reglas de negocio complejas
```

## Ubicacion

```text
NWT_SR
```

## Convencion

```text
SR_[FAMILIA]_[CONCEPTO]_[OPERACION]_TRN
```

## Flujo recomendado

```text
Inicio
Traza
Validacion basica
Invocacion BL/OP
Verificacion de errores
Commit o Rollback
Respuesta
Fin
```

## Plantilla minima

```plsql
PROCEDURE p_exec (
    pm_idioma  IN VARCHAR2,
    pm_usuario IN VARCHAR2,
    pm_sesion  IN VARCHAR2,
    pm_obj_p   IN OUT NOCOPY O_THP_AGN_P
);
```

## Salida esperada

- PACKAGE y PACKAGE BODY SR.
- Flujo transaccional documentado.
- Integracion BL/OP trazable.

## Checklist

- [ ] Nombre SR_*_TRN.
- [ ] Sin SQL directo.
- [ ] Commit/Rollback centralizados en SR.
- [ ] Delegacion de reglas a BL.
- [ ] Trazabilidad completa.
- [ ] Gestion de errores corporativa.

## Definicion de exito

El servicio ejecuta el caso de uso completo, controla transaccion y expone salida corporativa consistente.


## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
