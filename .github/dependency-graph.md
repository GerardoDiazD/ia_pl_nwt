# Dependency Graph (.git/copilot)

Generado automaticamente para trazabilidad de dependencias entre agents, skills, instructions e ikaro.

## Mermaid

```mermaid
graph LR
  %% Nodos por tipo
  subgraph agents["Agents"]
    agents_ag_arquitectura_api_reef[ag-arquitectura-api-reef]
    agents_ag_back_be_nwt[ag-back-be-nwt]
    agents_ag_bbdd_newtron[ag-bbdd-newtron]
    agents_ag_bbdd_tron_bkesp[ag-bbdd-tron-bkesp]
    agents_ag_desarrollador_local_api_esp[ag-desarrollador-local-api-esp]
    agents_ag_eventos_kafka_avro_reef[ag-eventos-kafka-avro-reef]
    agents_ag_mapeos_host_reef[ag-mapeos-host-reef]
    agents_ag_orquestador_reef[ag-orquestador-reef]
    agents_ag_transformaciones_reef[ag-transformaciones-reef]
  end
  subgraph skills["Skills"]
    skills_sk_analizar_campo_cartera_tecnica[sk-analizar-campo-cartera-tecnica]
    skills_sk_analizar_campo_host[sk-analizar-campo-host]
    skills_sk_analizar_caso_uso_local_api_esp[sk-analizar-caso-uso-local-api-esp]
    skills_sk_analizar_compatibilidad_contrato_api[sk-analizar-compatibilidad-contrato-api]
    skills_reef_kafka_events[reef-kafka-events]
    skills_sk_analizar_impacto_arquitectura_reef[sk-analizar-impacto-arquitectura-reef]
    skills_sk_analizar_impacto_cartera_tecnica[sk-analizar-impacto-cartera-tecnica]
    skills_sk_analizar_modalidades_tron[sk-analizar-modalidades-tron]
    skills_sk_analizar_modelo_identificacion_reef[sk-analizar-modelo-identificacion-reef]
    skills_sk_analizar_relaciones_tablas_reef[sk-analizar-relaciones-tablas-reef]
    skills_sk_aplicar_nomenclatura_newtron[sk-aplicar-nomenclatura-newtron]
    skills_sk_auditar_plsql_newtron[sk-auditar-plsql-newtron]
    skills_sk_auditar_pr_bkesp[sk-auditar-pr-bkesp]
    skills_sk_auditar_sql_tron_cmn[sk-auditar-sql-tron-cmn]
    skills_sk_catalogo_suplementos_reef[sk-catalogo-suplementos-reef]
    skills_sk_disenar_api_rest_mapfre[sk-disenar-api-rest-mapfre]
    skills_sk_disenar_caso_uso_local_api_esp[sk-disenar-caso-uso-local-api-esp]
    skills_sk_disenar_dto_api_newtron[sk-disenar-dto-api-newtron]
    skills_sk_generar_auditoria_be_nwt[sk-generar-auditoria-be-nwt]
    skills_sk_generar_batch_be_nwt[sk-generar-batch-be-nwt]
    skills_sk_generar_bl_newtron[sk-generar-bl-newtron]
    skills_sk_generar_clave_negocio_reef[sk-generar-clave-negocio-reef]
    skills_sk_generar_compania_desde_modalidades[sk-generar-compania-desde-modalidades]
    skills_sk_generar_configuracion_bkesp[sk-generar-configuracion-bkesp]
    skills_sk_generar_diagrama_er_reef[sk-generar-diagrama-er-reef]
    skills_sk_generar_dl_newtron[sk-generar-dl-newtron]
    skills_sk_generar_especificacion_migracion_bdm[sk-generar-especificacion-migracion-bdm]
    skills_sk_generar_exportacion_be_nwt[sk-generar-exportacion-be-nwt]
    skills_sk_generar_integracion_api_externa_be_nwt[sk-generar-integracion-api-externa-be-nwt]
    skills_sk_generar_mapping_cartera_tecnica[sk-generar-mapping-cartera-tecnica]
    skills_sk_generar_mapping_dgtp_cartera[sk-generar-mapping-dgtp-cartera]
    skills_sk_generar_mapping_host_reef[sk-generar-mapping-host-reef]
    skills_sk_generar_objeto_newtron[sk-generar-objeto-newtron]
    skills_sk_generar_plan_despliegue_tron[sk-generar-plan-despliegue-tron]
    skills_sk_generar_sr_newtron[sk-generar-sr-newtron]
    skills_sk_identificar_impacto_tabla_tron[sk-identificar-impacto-tabla-tron]
    skills_sk_implementar_caso_uso_local_api_esp[sk-implementar-caso-uso-local-api-esp]
    skills_sk_interpretar_objeto_newtron[sk-interpretar-objeto-newtron]
    skills_sk_mapear_suplementos_idms_reef[sk-mapear-suplementos-idms-reef]
    skills_sk_normalizar_integracion_reef[sk-normalizar-integracion-reef]
    skills_sk_revisar_mapeo_integracion_reef[sk-revisar-mapeo-integracion-reef]
    skills_sk_transformar_companias_reef[sk-transformar-companias-reef]
    skills_sk_transformar_contratos_reef[sk-transformar-contratos-reef]
    skills_sk_transformar_identificadores_reef[sk-transformar-identificadores-reef]
    skills_sk_trazar_flujo_front_api_pl_reef[sk-trazar-flujo-front-api-pl-reef]
    skills_sk_validar_api_rest_mapfre[sk-validar-api-rest-mapfre]
    skills_sk_validar_cartera_tecnica[sk-validar-cartera-tecnica]
    skills_sk_validar_caso_uso_local_api_esp[sk-validar-caso-uso-local-api-esp]
    skills_sk_validar_configuracion_bkesp[sk-validar-configuracion-bkesp]
    skills_sk_validar_layout_bdm[sk-validar-layout-bdm]
    skills_sk_validar_suplementos_reef[sk-validar-suplementos-reef]
    skills_sk_validar_transformacion_reef[sk-validar-transformacion-reef]
    skills_sk_validar_trazabilidad_reef[sk-validar-trazabilidad-reef]
  end
  subgraph instructions["Instructions"]
    instructions_inst_desarrollo_plsql_newtroniano[inst-desarrollo-plsql-newtroniano]
    instructions_inst_descubrir_relaciones_bbdd_reef[inst-descubrir-relaciones-bbdd-reef]
    instructions_inst_local_api_esp_overview[inst-local-api-esp-overview]
    instructions_inst_modificar_configuracion_bkesp[inst-modificar-configuracion-bkesp]
    instructions_inst_modificar_configuracion_tron_cmn[inst-modificar-configuracion-tron-cmn]
    instructions_inst_newtron_nomenclatura[inst-newtron-nomenclatura]
    instructions_inst_normativas_api[inst-normativas-api]
    instructions_inst_transformaciones_basicas_reef[inst-transformaciones-basicas-reef]
    instructions_inst_transformacion_host_ascii[inst-transformacion-host-ascii]
  end
  subgraph ikaro["Knowledge (Ikaro)"]
    ikaro_BDM_Contratos[BDM-Contratos]
    ikaro_be_nwt[be-nwt]
    ikaro_cartera_tecnica[cartera_tecnica]
    ikaro_cmn_api[cmn-api]
    ikaro_DGTP_Cartera[DGTP-Cartera]
    ikaro_DOC_CCPP[DOC_CCPP]
    ikaro_ficol[ficol]
    ikaro_ficol_asegurado[ficol_asegurado]
    ikaro_ficol_beneficiario[ficol_beneficiario]
    ikaro_ficol_tomador[ficol_tomador]
    ikaro_kb_frontal_newtron[kb-frontal-newtron]
    ikaro_kb_arquitectura_plsql_newtron[kb-arquitectura-plsql-newtron]
    ikaro_kb_framework_plsql_newtron[kb-framework-plsql-newtron]
    ikaro_kb_gobierno_modelo_datos_newtron[kb-gobierno-modelo-datos-newtron]
    ikaro_kb_nomenclatura_newtron_plsql[kb-nomenclatura-newtron-plsql]
    ikaro_kb_tipos_newtron[kb-tipos-newtron]
    ikaro_kb_tron_cmn_carga_ramo_118[kb-tron-cmn-carga-ramo-118]
    ikaro_kb_tron_cmn_despliegue[kb-tron-cmn-despliegue]
    ikaro_kb_tron_cmn_modalidades_118[kb-tron-cmn-modalidades-118]
    ikaro_kb_tron_cmn_repositorio[kb-tron-cmn-repositorio]
    ikaro_local_api_esp[local-api-esp]
    ikaro_modelo_terceros[modelo_terceros]
    ikaro_newtron_acronimos[newtron-acronimos]
    ikaro_newtron_convenciones_mapstruct[newtron-convenciones-mapstruct]
    ikaro_newtron_nomenclatura[newtron-nomenclatura]
    ikaro_normativas_api[normativas-api]
    ikaro_reef_arquitectura[reef-arquitectura]
    ikaro_reglas_pais_espana[reglas_pais_espana]
    ikaro_rpt_nwt[rpt-nwt]
    ikaro_transformaciones_basicas[transformaciones_basicas]
  end

  %% Aristas de dependencia
  agents_ag_arquitectura_api_reef -- instructions --> instructions_inst_newtron_nomenclatura
  agents_ag_arquitectura_api_reef -- instructions --> instructions_inst_normativas_api
  agents_ag_arquitectura_api_reef -- knowledge --> ikaro_newtron_acronimos
  agents_ag_arquitectura_api_reef -- knowledge --> ikaro_newtron_convenciones_mapstruct
  agents_ag_arquitectura_api_reef -- knowledge --> ikaro_newtron_nomenclatura
  agents_ag_arquitectura_api_reef -- knowledge --> ikaro_normativas_api
  agents_ag_arquitectura_api_reef -- knowledge --> ikaro_reef_arquitectura
  agents_ag_arquitectura_api_reef -- skills --> skills_sk_analizar_impacto_arquitectura_reef
  agents_ag_arquitectura_api_reef -- skills --> skills_sk_aplicar_nomenclatura_newtron
  agents_ag_arquitectura_api_reef -- skills --> skills_sk_disenar_api_rest_mapfre
  agents_ag_arquitectura_api_reef -- skills --> skills_sk_validar_api_rest_mapfre
  agents_ag_back_be_nwt -- knowledge --> ikaro_be_nwt
  agents_ag_back_be_nwt -- knowledge --> ikaro_cmn_api
  agents_ag_back_be_nwt -- knowledge --> ikaro_newtron_acronimos
  agents_ag_back_be_nwt -- knowledge --> ikaro_newtron_nomenclatura
  agents_ag_back_be_nwt -- knowledge --> ikaro_normativas_api
  agents_ag_back_be_nwt -- skills --> skills_sk_generar_auditoria_be_nwt
  agents_ag_back_be_nwt -- skills --> skills_sk_generar_batch_be_nwt
  agents_ag_back_be_nwt -- skills --> skills_sk_generar_exportacion_be_nwt
  agents_ag_back_be_nwt -- skills --> skills_sk_generar_integracion_api_externa_be_nwt
  agents_ag_bbdd_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  agents_ag_bbdd_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  agents_ag_bbdd_newtron -- knowledge --> ikaro_kb_framework_plsql_newtron
  agents_ag_bbdd_newtron -- knowledge --> ikaro_kb_gobierno_modelo_datos_newtron
  agents_ag_bbdd_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  agents_ag_bbdd_newtron -- knowledge --> ikaro_kb_tipos_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_auditar_plsql_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_generar_bl_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_generar_dl_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_generar_objeto_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_generar_sr_newtron
  agents_ag_bbdd_newtron -- skills --> skills_sk_interpretar_objeto_newtron
  agents_ag_bbdd_tron_bkesp -- instructions --> instructions_inst_modificar_configuracion_bkesp
  agents_ag_bbdd_tron_bkesp -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  agents_ag_bbdd_tron_bkesp -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  agents_ag_bbdd_tron_bkesp -- knowledge --> ikaro_kb_tron_cmn_despliegue
  agents_ag_bbdd_tron_bkesp -- knowledge --> ikaro_kb_tron_cmn_modalidades_118
  agents_ag_bbdd_tron_bkesp -- knowledge --> ikaro_kb_tron_cmn_repositorio
  agents_ag_bbdd_tron_bkesp -- knowledge --> ikaro_reglas_pais_espana
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_analizar_modalidades_tron
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_auditar_pr_bkesp
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_auditar_sql_tron_cmn
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_generar_compania_desde_modalidades
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_generar_configuracion_bkesp
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_generar_plan_despliegue_tron
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_identificar_impacto_tabla_tron
  agents_ag_bbdd_tron_bkesp -- skills --> skills_sk_validar_configuracion_bkesp
  agents_ag_desarrollador_local_api_esp -- instructions --> instructions_inst_local_api_esp_overview
  agents_ag_desarrollador_local_api_esp -- knowledge --> ikaro_local_api_esp
  agents_ag_desarrollador_local_api_esp -- knowledge --> ikaro_normativas_api
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_analizar_caso_uso_local_api_esp
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_analizar_compatibilidad_contrato_api
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_disenar_caso_uso_local_api_esp
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_disenar_dto_api_newtron
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_implementar_caso_uso_local_api_esp
  agents_ag_desarrollador_local_api_esp -- skills --> skills_sk_validar_caso_uso_local_api_esp
  agents_ag_eventos_kafka_avro_reef -- knowledge --> ikaro_be_nwt
  agents_ag_eventos_kafka_avro_reef -- knowledge --> ikaro_local_api_esp
  agents_ag_eventos_kafka_avro_reef -- knowledge --> ikaro_normativas_api
  agents_ag_eventos_kafka_avro_reef -- skills --> skills_sk_analizar_compatibilidad_contrato_api
  agents_ag_eventos_kafka_avro_reef -- skills --> skills_reef_kafka_events
  agents_ag_eventos_kafka_avro_reef -- skills --> skills_sk_generar_integracion_api_externa_be_nwt
  agents_ag_mapeos_host_reef -- instructions --> instructions_inst_transformacion_host_ascii
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_BDM_Contratos
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_cartera_tecnica
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_DGTP_Cartera
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_DOC_CCPP
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_ficol
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_ficol_asegurado
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_ficol_beneficiario
  agents_ag_mapeos_host_reef -- knowledge --> ikaro_ficol_tomador
  agents_ag_mapeos_host_reef -- skills --> skills_sk_analizar_campo_cartera_tecnica
  agents_ag_mapeos_host_reef -- skills --> skills_sk_analizar_campo_host
  agents_ag_mapeos_host_reef -- skills --> skills_sk_analizar_impacto_cartera_tecnica
  agents_ag_mapeos_host_reef -- skills --> skills_sk_generar_especificacion_migracion_bdm
  agents_ag_mapeos_host_reef -- skills --> skills_sk_generar_mapping_cartera_tecnica
  agents_ag_mapeos_host_reef -- skills --> skills_sk_generar_mapping_dgtp_cartera
  agents_ag_mapeos_host_reef -- skills --> skills_sk_generar_mapping_host_reef
  agents_ag_mapeos_host_reef -- skills --> skills_sk_validar_cartera_tecnica
  agents_ag_mapeos_host_reef -- skills --> skills_sk_validar_layout_bdm
  agents_ag_orquestador_reef -- agents --> agents_ag_arquitectura_api_reef
  agents_ag_orquestador_reef -- agents --> agents_ag_back_be_nwt
  agents_ag_orquestador_reef -- agents --> agents_ag_bbdd_newtron
  agents_ag_orquestador_reef -- agents --> agents_ag_bbdd_tron_bkesp
  agents_ag_orquestador_reef -- agents --> agents_ag_desarrollador_local_api_esp
  agents_ag_orquestador_reef -- agents --> agents_ag_eventos_kafka_avro_reef
  agents_ag_orquestador_reef -- agents --> agents_ag_mapeos_host_reef
  agents_ag_orquestador_reef -- agents --> agents_ag_transformaciones_reef
  agents_ag_orquestador_reef -- skills --> skills_sk_trazar_flujo_front_api_pl_reef
  agents_ag_transformaciones_reef -- instructions --> instructions_inst_transformaciones_basicas_reef
  agents_ag_transformaciones_reef -- knowledge --> ikaro_transformaciones_basicas
  agents_ag_transformaciones_reef -- skills --> skills_sk_analizar_modelo_identificacion_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_catalogo_suplementos_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_generar_clave_negocio_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_mapear_suplementos_idms_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_normalizar_integracion_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_revisar_mapeo_integracion_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_transformar_companias_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_transformar_contratos_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_transformar_identificadores_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_validar_suplementos_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_validar_transformacion_reef
  agents_ag_transformaciones_reef -- skills --> skills_sk_validar_trazabilidad_reef
  instructions_inst_local_api_esp_overview -- knowledge --> ikaro_local_api_esp
  instructions_inst_local_api_esp_overview -- knowledge --> ikaro_newtron_nomenclatura
  instructions_inst_local_api_esp_overview -- knowledge --> ikaro_normativas_api
  instructions_inst_transformaciones_basicas_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_analizar_campo_cartera_tecnica -- knowledge --> ikaro_cartera_tecnica
  skills_sk_analizar_campo_host -- knowledge --> ikaro_BDM_Contratos
  skills_sk_analizar_caso_uso_local_api_esp -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_analizar_caso_uso_local_api_esp -- knowledge --> ikaro_local_api_esp
  skills_sk_analizar_caso_uso_local_api_esp -- knowledge --> ikaro_normativas_api
  skills_sk_analizar_compatibilidad_contrato_api -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_analizar_compatibilidad_contrato_api -- knowledge --> ikaro_local_api_esp
  skills_sk_analizar_compatibilidad_contrato_api -- knowledge --> ikaro_normativas_api
  skills_sk_analizar_compatibilidad_contrato_api -- skills --> skills_sk_validar_api_rest_mapfre
  skills_reef_kafka_events -- knowledge --> ikaro_be_nwt
  skills_reef_kafka_events -- knowledge --> ikaro_local_api_esp
  skills_reef_kafka_events -- knowledge --> ikaro_normativas_api
  skills_reef_kafka_events -- skills --> skills_sk_analizar_compatibilidad_contrato_api
  skills_reef_kafka_events -- skills --> skills_sk_generar_integracion_api_externa_be_nwt
  skills_sk_analizar_impacto_arquitectura_reef -- instructions --> instructions_inst_normativas_api
  skills_sk_analizar_impacto_arquitectura_reef -- knowledge --> ikaro_newtron_acronimos
  skills_sk_analizar_impacto_arquitectura_reef -- knowledge --> ikaro_normativas_api
  skills_sk_analizar_impacto_arquitectura_reef -- knowledge --> ikaro_reef_arquitectura
  skills_sk_analizar_impacto_cartera_tecnica -- knowledge --> ikaro_cartera_tecnica
  skills_sk_analizar_modalidades_tron -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  skills_sk_analizar_modalidades_tron -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  skills_sk_analizar_modalidades_tron -- knowledge --> ikaro_kb_tron_cmn_modalidades_118
  skills_sk_analizar_modalidades_tron -- knowledge --> ikaro_kb_tron_cmn_repositorio
  skills_sk_analizar_modelo_identificacion_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_analizar_relaciones_tablas_reef -- instructions --> instructions_inst_descubrir_relaciones_bbdd_reef
  skills_sk_aplicar_nomenclatura_newtron -- instructions --> instructions_inst_newtron_nomenclatura
  skills_sk_aplicar_nomenclatura_newtron -- knowledge --> ikaro_newtron_acronimos
  skills_sk_aplicar_nomenclatura_newtron -- knowledge --> ikaro_newtron_convenciones_mapstruct
  skills_sk_aplicar_nomenclatura_newtron -- knowledge --> ikaro_newtron_nomenclatura
  skills_sk_auditar_plsql_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_auditar_plsql_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_auditar_plsql_newtron -- knowledge --> ikaro_kb_framework_plsql_newtron
  skills_sk_auditar_plsql_newtron -- knowledge --> ikaro_kb_gobierno_modelo_datos_newtron
  skills_sk_auditar_plsql_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_auditar_plsql_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_auditar_pr_bkesp -- instructions --> instructions_inst_modificar_configuracion_bkesp
  skills_sk_auditar_pr_bkesp -- knowledge --> ikaro_reglas_pais_espana
  skills_sk_auditar_sql_tron_cmn -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_auditar_sql_tron_cmn -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  skills_sk_auditar_sql_tron_cmn -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  skills_sk_auditar_sql_tron_cmn -- knowledge --> ikaro_kb_tron_cmn_despliegue
  skills_sk_auditar_sql_tron_cmn -- knowledge --> ikaro_kb_tron_cmn_modalidades_118
  skills_sk_auditar_sql_tron_cmn -- knowledge --> ikaro_kb_tron_cmn_repositorio
  skills_sk_catalogo_suplementos_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_disenar_api_rest_mapfre -- instructions --> instructions_inst_normativas_api
  skills_sk_disenar_api_rest_mapfre -- knowledge --> ikaro_normativas_api
  skills_sk_disenar_caso_uso_local_api_esp -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_disenar_caso_uso_local_api_esp -- knowledge --> ikaro_local_api_esp
  skills_sk_disenar_caso_uso_local_api_esp -- knowledge --> ikaro_normativas_api
  skills_sk_disenar_dto_api_newtron -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_disenar_dto_api_newtron -- instructions --> instructions_inst_newtron_nomenclatura
  skills_sk_disenar_dto_api_newtron -- knowledge --> ikaro_local_api_esp
  skills_sk_disenar_dto_api_newtron -- knowledge --> ikaro_newtron_convenciones_mapstruct
  skills_sk_disenar_dto_api_newtron -- knowledge --> ikaro_normativas_api
  skills_sk_generar_auditoria_be_nwt -- knowledge --> ikaro_be_nwt
  skills_sk_generar_auditoria_be_nwt -- knowledge --> ikaro_newtron_acronimos
  skills_sk_generar_auditoria_be_nwt -- knowledge --> ikaro_newtron_nomenclatura
  skills_sk_generar_batch_be_nwt -- knowledge --> ikaro_be_nwt
  skills_sk_generar_batch_be_nwt -- knowledge --> ikaro_newtron_acronimos
  skills_sk_generar_batch_be_nwt -- knowledge --> ikaro_newtron_nomenclatura
  skills_sk_generar_bl_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_bl_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_generar_bl_newtron -- knowledge --> ikaro_kb_framework_plsql_newtron
  skills_sk_generar_bl_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_generar_bl_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_generar_clave_negocio_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_generar_compania_desde_modalidades -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_compania_desde_modalidades -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  skills_sk_generar_compania_desde_modalidades -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  skills_sk_generar_compania_desde_modalidades -- knowledge --> ikaro_kb_tron_cmn_despliegue
  skills_sk_generar_compania_desde_modalidades -- knowledge --> ikaro_kb_tron_cmn_modalidades_118
  skills_sk_generar_compania_desde_modalidades -- knowledge --> ikaro_kb_tron_cmn_repositorio
  skills_sk_generar_configuracion_bkesp -- instructions --> instructions_inst_modificar_configuracion_bkesp
  skills_sk_generar_configuracion_bkesp -- knowledge --> ikaro_reglas_pais_espana
  skills_sk_generar_diagrama_er_reef -- instructions --> instructions_inst_descubrir_relaciones_bbdd_reef
  skills_sk_generar_diagrama_er_reef -- skills --> skills_sk_analizar_relaciones_tablas_reef
  skills_sk_generar_dl_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_dl_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_generar_dl_newtron -- knowledge --> ikaro_kb_framework_plsql_newtron
  skills_sk_generar_dl_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_generar_dl_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_generar_especificacion_migracion_bdm -- knowledge --> ikaro_BDM_Contratos
  skills_sk_generar_exportacion_be_nwt -- knowledge --> ikaro_be_nwt
  skills_sk_generar_exportacion_be_nwt -- knowledge --> ikaro_newtron_acronimos
  skills_sk_generar_exportacion_be_nwt -- knowledge --> ikaro_newtron_nomenclatura
  skills_sk_generar_integracion_api_externa_be_nwt -- knowledge --> ikaro_be_nwt
  skills_sk_generar_integracion_api_externa_be_nwt -- knowledge --> ikaro_newtron_acronimos
  skills_sk_generar_integracion_api_externa_be_nwt -- knowledge --> ikaro_newtron_nomenclatura
  skills_sk_generar_integracion_api_externa_be_nwt -- knowledge --> ikaro_normativas_api
  skills_sk_generar_mapping_cartera_tecnica -- knowledge --> ikaro_cartera_tecnica
  skills_sk_generar_mapping_dgtp_cartera -- knowledge --> ikaro_DGTP_Cartera
  skills_sk_generar_mapping_host_reef -- knowledge --> ikaro_BDM_Contratos
  skills_sk_generar_objeto_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_objeto_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_generar_objeto_newtron -- knowledge --> ikaro_kb_gobierno_modelo_datos_newtron
  skills_sk_generar_objeto_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_generar_objeto_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_generar_plan_despliegue_tron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_plan_despliegue_tron -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  skills_sk_generar_plan_despliegue_tron -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  skills_sk_generar_plan_despliegue_tron -- knowledge --> ikaro_kb_tron_cmn_despliegue
  skills_sk_generar_plan_despliegue_tron -- knowledge --> ikaro_kb_tron_cmn_repositorio
  skills_sk_generar_sr_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_generar_sr_newtron -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_generar_sr_newtron -- knowledge --> ikaro_kb_framework_plsql_newtron
  skills_sk_generar_sr_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_generar_sr_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_identificar_impacto_tabla_tron -- instructions --> instructions_inst_modificar_configuracion_tron_cmn
  skills_sk_identificar_impacto_tabla_tron -- knowledge --> ikaro_kb_tron_cmn_carga_ramo_118
  skills_sk_identificar_impacto_tabla_tron -- knowledge --> ikaro_kb_tron_cmn_despliegue
  skills_sk_identificar_impacto_tabla_tron -- knowledge --> ikaro_kb_tron_cmn_modalidades_118
  skills_sk_identificar_impacto_tabla_tron -- knowledge --> ikaro_kb_tron_cmn_repositorio
  skills_sk_implementar_caso_uso_local_api_esp -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_implementar_caso_uso_local_api_esp -- knowledge --> ikaro_local_api_esp
  skills_sk_implementar_caso_uso_local_api_esp -- knowledge --> ikaro_normativas_api
  skills_sk_interpretar_objeto_newtron -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_interpretar_objeto_newtron -- instructions --> instructions_inst_newtron_nomenclatura
  skills_sk_interpretar_objeto_newtron -- knowledge --> ikaro_kb_gobierno_modelo_datos_newtron
  skills_sk_interpretar_objeto_newtron -- knowledge --> ikaro_kb_nomenclatura_newtron_plsql
  skills_sk_interpretar_objeto_newtron -- knowledge --> ikaro_kb_tipos_newtron
  skills_sk_mapear_suplementos_idms_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_normalizar_integracion_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_revisar_mapeo_integracion_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_transformar_companias_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_transformar_contratos_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_transformar_identificadores_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_trazar_flujo_front_api_pl_reef -- instructions --> instructions_inst_desarrollo_plsql_newtroniano
  skills_sk_trazar_flujo_front_api_pl_reef -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_trazar_flujo_front_api_pl_reef -- knowledge --> ikaro_kb_arquitectura_plsql_newtron
  skills_sk_trazar_flujo_front_api_pl_reef -- knowledge --> ikaro_kb_framework_plsql_newtron
  skills_sk_trazar_flujo_front_api_pl_reef -- knowledge --> ikaro_local_api_esp
  skills_sk_trazar_flujo_front_api_pl_reef -- skills --> skills_sk_analizar_caso_uso_local_api_esp
  skills_sk_trazar_flujo_front_api_pl_reef -- skills --> skills_sk_analizar_relaciones_tablas_reef
  skills_sk_validar_api_rest_mapfre -- instructions --> instructions_inst_normativas_api
  skills_sk_validar_api_rest_mapfre -- knowledge --> ikaro_normativas_api
  skills_sk_validar_cartera_tecnica -- knowledge --> ikaro_cartera_tecnica
  skills_sk_validar_caso_uso_local_api_esp -- instructions --> instructions_inst_local_api_esp_overview
  skills_sk_validar_caso_uso_local_api_esp -- knowledge --> ikaro_local_api_esp
  skills_sk_validar_caso_uso_local_api_esp -- knowledge --> ikaro_normativas_api
  skills_sk_validar_configuracion_bkesp -- instructions --> instructions_inst_modificar_configuracion_bkesp
  skills_sk_validar_configuracion_bkesp -- knowledge --> ikaro_reglas_pais_espana
  skills_sk_validar_layout_bdm -- knowledge --> ikaro_BDM_Contratos
  skills_sk_validar_suplementos_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_validar_transformacion_reef -- knowledge --> ikaro_transformaciones_basicas
  skills_sk_validar_transformacion_reef -- skills --> skills_sk_transformar_companias_reef
  skills_sk_validar_transformacion_reef -- skills --> skills_sk_transformar_identificadores_reef
  skills_sk_validar_transformacion_reef -- skills --> skills_sk_validar_suplementos_reef
  skills_sk_validar_transformacion_reef -- skills --> skills_sk_validar_trazabilidad_reef
  skills_sk_validar_trazabilidad_reef -- knowledge --> ikaro_transformaciones_basicas
```

## Resumen

- Total nodos: 101
- Total dependencias resueltas: 257
- Dependencias no resueltas: 0

