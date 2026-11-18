# Ejecutar test-envio-recs-gesycore sin PL/SQL Developer

Se agregaron dos archivos:

- `run-test-envio-recs-gesycore_sr-nuevo.sql`
- `run-test-envio-recs-gesycore_sr-nuevo.ps1`

## Opcion 1: SQL*Plus / SQLcl directo

```sql
@sql_test/run-test-envio-recs-gesycore_sr-nuevo.sql 20003 0000555592 0 30644 99999 NULL NULL ES JUGEDIAZ N JUGEDIAZ
```

Orden de parametros:

1. `pm_cmp_val`
2. `pm_gpp_val`
3. `pm_gpp_enr_sqn`
4. `pm_del_val`
5. `pm_sbl_val`
6. `pm_ntc_dat` (YYYY-MM-DD o `NULL`)
7. `pm_ntc_val` (valor o `NULL`)
8. `pm_lng_val`
9. `pm_usr_val`
10. `hacer_commit` (`S` o `N`)
11. `pm_dbg_idn` (opcional, normalmente usuario)

## Opcion 2: PowerShell (mas comodo)

```powershell
./sql_test/run-test-envio-recs-gesycore_sr-nuevo.ps1 `
  -ConnectionString "usuario/password@BBDD" `
  -pm_cmp_val 20003 `
  -pm_gpp_val 0000555592 `
  -pm_gpp_enr_sqn 0 `
  -pm_del_val 30644 `
  -pm_sbl_val 99999 `
  -pm_ntc_dat NULL `
  -pm_ntc_val NULL `
  -pm_lng_val ES `
  -pm_usr_val JUGEDIAZ `
  -hacer_commit N `
  -pm_dbg_idn JUGEDIAZ
```

Notas:

- Si no quieres persistir cambios, usa `-hacer_commit N`.
- El script SQL hace `ROLLBACK` cuando `hacer_commit` no es `S`.
- El output replica el `DBMS_OUTPUT` del test `.tst`.
