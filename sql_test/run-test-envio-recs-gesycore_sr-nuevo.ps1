param(
  [string]$ConnectionString = "trc_es_sr/TRC_ES_PASS_25@RDSESP",

  [string]$pm_cmp_val = "20003",
  [string]$pm_gpp_val = "0000555592",
  [string]$pm_gpp_enr_sqn = "0",
  [string]$pm_del_val = "30644",
  [string]$pm_sbl_val = "99999",
  [string]$pm_ntc_dat = "NULL",
  [string]$pm_ntc_val = "NULL",
  [string]$pm_lng_val = "ES",
  [string]$pm_usr_val = "JUGEDIAZ",
  [ValidateSet("S", "N")]
  [string]$hacer_commit = "N",
  [string]$pm_dbg_idn = "JUGEDIAZ"
)

$scriptPath = Join-Path $PSScriptRoot "run-test-envio-recs-gesycore_sr-nuevo.sql"

if (-not (Test-Path $scriptPath)) {
  Write-Error "No existe el script SQL esperado: $scriptPath"
  exit 1
}

$sqlplus = Get-Command sqlplus -ErrorAction SilentlyContinue
if (-not $sqlplus) {
  Write-Error "No se encontro sqlplus en PATH. Instala Oracle Client/SQL*Plus o agrega sqlplus al PATH."
  exit 1
}

$arguments = @(
  "-s",
  $ConnectionString,
  "@$scriptPath",
  $pm_cmp_val,
  $pm_gpp_val,
  $pm_gpp_enr_sqn,
  $pm_del_val,
  $pm_sbl_val,
  $pm_ntc_dat,
  $pm_ntc_val,
  $pm_lng_val,
  $pm_usr_val,
  $hacer_commit,
  $pm_dbg_idn
)

Write-Host "Ejecutando test contra: $ConnectionString"
& $sqlplus.Source @arguments
$exitCode = $LASTEXITCODE

if ($exitCode -ne 0) {
  Write-Error "La ejecucion finalizo con codigo: $exitCode"
  exit $exitCode
}

Write-Host "Ejecucion finalizada correctamente."
