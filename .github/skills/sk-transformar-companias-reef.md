---
name: sk-transformar-companias-reef
type: skill
version: 1.1
description: Gestiona la transformación, validación y normalización de códigos de compañía entre REEF y sistemas externos utilizando las equivalencias corporativas oficiales.
domain: companias
owner: arquitectura-reef

dependencies:
  knowledge:
    - rag:transformaciones_basicas

outputs:
  - companyCodeNormalizado
  - companyName
  - directionApplied
  - advertencias
  - errores

tags:
  - reef
  - companias
  - idms
  - integracion
  - migracion
  - interfaces
---

# Objetivo

Normalizar los códigos de compañía utilizados entre REEF y sistemas externos garantizando que:

```text
Todos los sistemas utilicen el código esperado.

Las integraciones sean consistentes.

No existan errores de identificación de compañía.

Se mantenga la trazabilidad entre sistemas.
```

---

# Cuándo utilizar esta skill

Utilizar cuando una integración:

```text
Reciba datos desde sistemas externos.

Envíe datos desde REEF.

Migre información histórica.

Consuma APIs corporativas.

Produzca eventos.

Genere ficheros batch.
```

---

# Cuándo NO utilizar esta skill

No utilizar para:

```text
Transformación de pólizas.

Transformación de certificados.

Transformación de suplementos.

Validaciones de negocio.

Cálculo actuarial.
```

---

# Alcance

La skill trabaja únicamente sobre:

```text
Códigos de compañía.
```

---

# Catálogo Corporativo

## Equivalencias Oficiales

### Mapfre Vida

```yaml
externo: 3

reef: 20003
```

---

### Bankinter

```yaml
externo: 60

reef: 20006
```

---

### Mapfre España

```yaml
externo: 80

reef: 20008
```

---

# Capacidades

## Transformación Externo → REEF

Convierte códigos procedentes de sistemas externos al estándar utilizado por REEF.

---

### Entrada

```yaml
direction: TO_REEF

companyCode: 3
```

---

### Resultado

```yaml
companyCode: 20003

companyName: MAPFRE_VIDA
```

---

### Entrada

```yaml
direction: TO_REEF

companyCode: 60
```

---

### Resultado

```yaml
companyCode: 20006

companyName: BANKINTER
```

---

### Entrada

```yaml
direction: TO_REEF

companyCode: 80
```

---

### Resultado

```yaml
companyCode: 20008

companyName: MAPFRE_ESPANA
```

---

# Transformación REEF → Externo

Convierte códigos internos de REEF al formato esperado por sistemas externos.

---

### Entrada

```yaml
direction: FROM_REEF

companyCode: 20003
```

---

### Resultado

```yaml
companyCode: 3

companyName: MAPFRE_VIDA
```

---

### Entrada

```yaml
direction: FROM_REEF

companyCode: 20006
```

---

### Resultado

```yaml
companyCode: 60

companyName: BANKINTER
```

---

### Entrada

```yaml
direction: FROM_REEF

companyCode: 20008
```

---

### Resultado

```yaml
companyCode: 80

companyName: MAPFRE_ESPANA
```

---

# Resolver Nombre de Compañía

Obtiene el nombre corporativo a partir de cualquier código conocido.

---

### Entrada

```yaml
companyCode: 20003
```

---

### Resultado

```yaml
companyName: MAPFRE_VIDA
```

---

### Entrada

```yaml
companyCode: 3
```

---

### Resultado

```yaml
companyName: MAPFRE_VIDA
```

---

# Determinar Tipo de Código

Identifica si el código pertenece al modelo REEF o al modelo externo.

---

### Entrada

```yaml
companyCode: 20006
```

---

### Resultado

```yaml
codeType: REEF
```

---

### Entrada

```yaml
companyCode: 60
```

---

### Resultado

```yaml
codeType: EXTERNO
```

---

# Validaciones

## Validación de Código Externo

Verificar que el código recibido pertenece al catálogo corporativo.

---

### Valores Permitidos

```text
3

60

80
```

---

### Error

```text
Código externo de compañía no reconocido.
```

---

# Validación de Código REEF

Verificar que el código recibido pertenece al catálogo corporativo REEF.

---

### Valores Permitidos

```text
20003

20006

20008
```

---

### Error

```text
Código REEF de compañía no reconocido.
```

---

# Validación de Dirección

La dirección debe estar informada.

---

### Valores Permitidos

```text
TO_REEF

FROM_REEF
```

---

### Error

```text
Dirección de transformación no informada.
```

---

# Reglas de Negocio

## Regla 1

Nunca persistir en REEF un código externo.

---

### Ejemplo Incorrecto

```yaml
companyCode: 3
```

---

### Ejemplo Correcto

```yaml
companyCode: 20003
```

---

# Regla 2

Nunca enviar a sistemas externos un código interno REEF salvo acuerdo explícito.

---

### Ejemplo Incorrecto

```yaml
companyCode: 20003
```

---

### Ejemplo Correcto

```yaml
companyCode: 3
```

---

# Regla 3

Toda integración debe realizar la transformación antes de cualquier persistencia.

---

# Advertencias

## Catálogo Incompleto

```text
Compañía existente pero pendiente de homologación.
```

---

## Código Nulo

```text
No se recibió código de compañía.
```

---

## Transformación Innecesaria

```text
El código ya se encuentra en el formato destino.
```

---

# Errores

## Código Externo Inválido

```text
Código externo de compañía desconocido.
```

---

## Código REEF Inválido

```text
Código REEF de compañía desconocido.
```

---

## Dirección Inválida

```text
Dirección de transformación no soportada.
```

---

## Valor Vacío

```text
Código de compañía obligatorio.
```

---

# Salidas

## companyCodeNormalizado

Código adaptado al sistema destino.

---

## companyName

Nombre corporativo de la compañía.

---

## directionApplied

Dirección de transformación aplicada.

---

## advertencias

Listado de advertencias detectadas.

---

## errores

Listado de errores detectados.

---

# Resultado Esperado

Al finalizar la ejecución:

- El código de compañía cumple el estándar del sistema destino.
- La compañía queda correctamente identificada.
- No existen códigos ambiguos.
- La integración mantiene compatibilidad entre REEF y sistemas externos.
- Las validaciones corporativas han sido aplicadas.

---

# Ejemplo 1 — Entrada desde IDMS

Entrada:

```yaml
direction: TO_REEF

companyCode: 3
```

Resultado:

```yaml
companyCodeNormalizado: 20003

companyName: MAPFRE_VIDA

advertencias: []

errores: []
```

---

# Ejemplo 2 — Exportación a Sistema Externo

Entrada:

```yaml
direction: FROM_REEF

companyCode: 20006
```

Resultado:

```yaml
companyCodeNormalizado: 60

companyName: BANKINTER

advertencias: []

errores: []
```

---

# Ejemplo 3 — Validación Incorrecta

Entrada:

```yaml
direction: TO_REEF

companyCode: 99
```

Resultado:

```yaml
errores:
  - Código externo de compañía desconocido

advertencias: []
```

## Uso de RAG IKARO

- #knowledge consultar temas de dependencies.knowledge antes de responder o proponer cambios.
