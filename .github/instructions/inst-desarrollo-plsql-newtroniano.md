---
name: inst-desarrollo-plsql-newtroniano
type: instruction
description: Instruccion principal para desarrollar PL/SQL NewTRON en REEF con reglas de nomenclatura, capas, errores, trazas, transacciones y gobierno del dato.
domain: plsql
version: 1.1
owner: arquitectura-reef
priority: alta
---

# Instruccion: Desarrollo PL/SQL Newtroniano

## Objetivo

Aplicar un criterio unico para decisiones de desarrollo PL/SQL en REEF/NewTRON.

Esta instruccion prevalece cuando exista conflicto de interpretacion en:

- Nomenclatura.
- Ubicacion de logica por capas.
- Uso de SQL.
- Gestion transaccional.
- Gestion de errores.
- Trazabilidad.
- Reutilizacion y gobierno de objetos.

## Reglas de decision obligatorias

1. Reutilizar antes de crear.
2. SQL solo en DL_*.
3. Reglas de negocio solo en BL_*.
4. Orquestacion y transaccion en SR_* y OP_*.
5. COMMIT y ROLLBACK solo en SR_*.
6. Objetos corporativos solo desde catalogo oficial (Objerator).
7. No silenciar excepciones.

## Arquitectura por capas

- NWT_O: tipos y objetos O_*.
- NWT_DL: acceso a datos, SQL y CRUD.
- NWT_BL: reglas de negocio y validaciones.
- NWT_SR: servicios, orquestacion y control transaccional.
- NWT_APP: consumidor, sin logica PL/SQL propia.

## Nomenclatura base

Formato:

```text
[PREFIJO]_[FAMILIA]_[CONCEPTO]_[SUFIJO]
```

Prefijos validos:

```text
O_
DL_
BL_
SR_
OP_
```

## Parametros corporativos

Incluir cuando aplique:

```text
pm_idioma
pm_usuario
pm_sesion
```

## Gestion de errores

- Usar dl_trn_err.p_chc(...) despues de llamadas criticas.
- Codigo 20001: no encontrado / NO_DATA_FOUND.
- Codigo 20013: error de descripcion.
- Prohibido: WHEN OTHERS THEN NULL.

## Trazabilidad

Registrar siempre:

- Inicio: dl_trn_dbg.p_set_mth_bgn(...)
- Parametros: dl_trn_dbg.p_set_prm(...)
- Fin: dl_trn_dbg.p_set_mth_trm(...)

## Gobierno del modelo

- Objerator es la fuente oficial.
- Prohibido crear TYPE corporativo local sin alta formal.
- Prohibido duplicar conceptos, constantes o paquetes ya existentes.

## Restricciones

No permitido:

```text
SQL en BL/SR/OP.
COMMIT o ROLLBACK en DL/BL.
Nombres locales fuera de estandar.
Tipos paralelos al catalogo.
```

## Checklist de salida

- [ ] Capa correcta para cada responsabilidad.
- [ ] Nomenclatura NewTRON valida.
- [ ] SQL solo en DL.
- [ ] Transacciones solo en SR.
- [ ] Trazabilidad completa.
- [ ] Gestion de errores corporativa.
- [ ] Reutilizacion validada.
- [ ] Sin antipatron WHEN OTHERS THEN NULL.

## Definicion de exito

La implementacion es aceptable cuando respeta arquitectura, gobierno del dato y estandares de ejecucion NewTRON sin desviaciones.
