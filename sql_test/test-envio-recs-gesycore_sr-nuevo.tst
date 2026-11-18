PL/SQL Developer Test script 3.0
182
declare
  -- Non-scalar parameters require additional processing 
  --
  lv_o_rcp_grl_cct trc_es_o.o_rcp_grl_cct;
  --
  l_fila trc_es_o.o_ply_guc_s;
  --
begin
  -- Call the function
  dl_trn_vrb.p_set ('cod_cia'    , :pm_cmp_val);
  dl_trn_vrb.p_set ('cod_usr'    , :pm_usr_val);
  dl_trn_vrb.p_set ('cod_idioma' , :pm_lng_val);
  --
  nwt_dl.dl_trn_dbg_trn.p_enb(pm_dbg_idn => 'JUGEDIAZ');
  --
  lv_o_rcp_grl_cct := trc_es_sr.sr_rcp_grl_qry_mes.f_grl(pm_cmp_val     => :pm_cmp_val    ,
                                                         pm_gpp_val     => :pm_gpp_val    ,
                                                         pm_gpp_enr_sqn => :pm_gpp_enr_sqn,
                                                         pm_del_val     => :pm_del_val    ,
                                                         pm_sbl_val     => :pm_sbl_val    ,
                                                         pm_ntc_dat     => :pm_ntc_dat    ,
                                                         pm_ntc_val     => :pm_ntc_val    ,
                                                         pm_lng_val     => :pm_lng_val    ,
                                                         pm_usr_val     => :pm_usr_val    );
  --
  IF NVL(:hacer_commit,'N') = 'S'
  THEN
    --
    COMMIT;
    --
  ELSE
    --
    ROLLBACK;
    --
  END IF;
  --
  DBMS_OUTPUT.PUT_LINE('Terminación: '||lv_o_rcp_grl_cct.prc_trm_val);
  --
  IF TO_NUMBER(lv_o_rcp_grl_cct.prc_trm_val) > 0 THEN
    --
    DBMS_OUTPUT.PUT_LINE('Termina con ERROR');
    --
    FOR i IN lv_o_rcp_grl_cct.rcp_grl_ct.FIRST .. lv_o_rcp_grl_cct.rcp_grl_ct.LAST 
    LOOP
      --
      FOR j IN lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t.FIRST .. lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t.LAST
      LOOP
        --
        DBMS_OUTPUT.PUT_LINE('j='||j);
        DBMS_OUTPUT.PUT_LINE('sqn_val:'    ||lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t(j).sqn_val);
        DBMS_OUTPUT.PUT_LINE('err_idn_val:'||lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t(j).err_idn_val);
        DBMS_OUTPUT.PUT_LINE('err_val:'    ||lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t(j).err_val);
        DBMS_OUTPUT.PUT_LINE('err_nam:'    ||lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t(j).err_nam);
        DBMS_OUTPUT.PUT_LINE('prp_nam:'    ||lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s.trn_err_t(j).prp_nam);
        --
      END LOOP;
      --
    END LOOP;      
    --
  ELSE
    --
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('- Total de recibos enviados : '||RPAD(lv_o_rcp_grl_cct.rcp_grl_ct.COUNT,27,' ')||' -');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------');
    --    
    FOR i IN lv_o_rcp_grl_cct.rcp_grl_ct.FIRST .. lv_o_rcp_grl_cct.rcp_grl_ct.LAST 
    LOOP
      --
      DBMS_OUTPUT.PUT_LINE('RECIBO ENVIADO: secu '||i);
      --
      DBMS_OUTPUT.PUT_LINE('-PLY_GPN----------------------------------------');
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.GPP_VAL         : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.gpp_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.SBL_PLY_VAL     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sbl_ply_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.NTC_VAL         : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.NTC_RFR_VAL     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_rfr_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.CVG_VAL         : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cvg_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.CIN_RCP_TYP_VAL : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cin_rcp_typ_val);
      DBMS_OUTPUT.PUT_LINE('PLY_GPN.CHC_RVN_RCP?    : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.chc_rvn_rcp);
      DBMS_OUTPUT.PUT_LINE('-RCP_GRC----------------------------------------');
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.AGT_VAL     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agn_val);
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.MDT_VAL     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdt_val);
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.CRN_VAL     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_val);
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.CRN_NAM     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_nam);
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.ISU_TYP_VAL : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.isu_typ_val);
      DBMS_OUTPUT.PUT_LINE('RCP_GRC.RCP_AMN     : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_amn);
      --
      DBMS_OUTPUT.PUT_LINE('Terceros cuantos : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.COUNT);
      --
      FOR j IN NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.FIRST,0) .. NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.LAST,-1)
      LOOP
        --
        DBMS_OUTPUT.PUT_LINE('TERCERO bnf_typ_val: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bnf_typ_val);
        DBMS_OUTPUT.PUT_LINE('TERCERO thp_nam: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_nam);
        DBMS_OUTPUT.PUT_LINE('TERCERO bna_val: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_val);
        DBMS_OUTPUT.PUT_LINE('TERCERO ibn_val: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_val);
        DBMS_OUTPUT.PUT_LINE('TERCERO pais   : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_val);
        --
      END LOOP;
      --
      DBMS_OUTPUT.PUT_LINE('C. Económicos cuantos : '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.COUNT);
      --
      FOR j IN NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.FIRST,0) .. NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.LAST,-1)
      LOOP
        --
        DBMS_OUTPUT.PUT_LINE('Cod.eco: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_val||' '||
                                          lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_amn);
        --
      END LOOP;
      --
      DBMS_OUTPUT.PUT_LINE('INA"S');
      --
      FOR j IN NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.FIRST,0) .. NVL(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.LAST,-1)
      LOOP
        --
        DBMS_OUTPUT.PUT_LINE('ina 3er niv: '||lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_val||' '||
                                              lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_nam);
        --
      END LOOP;
      --
      DBMS_OUTPUT.PUT_LINE('Comisiones');
      --
      IF lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt IS NULL OR lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('La tabla está vacía.');
      ELSE
        DBMS_OUTPUT.PUT_LINE(
          RPAD('FILA', 6) ||
          RPAD('CMP_VAL', 12) ||
          RPAD('CVR_VAL', 10) ||
          RPAD('CVR_NAM', 12) ||
          RPAD('INA_VAL', 10) ||
          RPAD('NTO_BAS_AMN', 14) ||
          RPAD('NTO_CMS_AMN', 14) ||
          RPAD('RCL_CMS_AMN', 14) ||
          RPAD('RSK_VAL', 10) ||
          RPAD('AGN_TYP_VAL', 14) ||
          RPAD('RCL_BAS_AMN', 14) ||
          RPAD('AGN_VAL', 10) ||
          RPAD('AGN_NAM', 12) ||
          RPAD('MVM_VAL', 10) ||
          RPAD('CMC_VAL', 10) ||
          RPAD('DSB_ROW', 10) ||
          RPAD('ACT_IND', 10) ||
          RPAD('AGN_PER', 10) ||
          'APL_MDT_VAL'
        );

        FOR ii IN lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.FIRST .. lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.LAST LOOP
          
          l_fila := lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(ii).ply_guc_s;

          IF l_fila IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE(
              RPAD(TO_CHAR(i), 6) ||
              RPAD(NVL(TO_CHAR(l_fila.cmp_val), 'NULL'), 12) ||
              RPAD(NVL(TO_CHAR(l_fila.cvr_val), 'NULL'), 10) ||
              RPAD(NVL(l_fila.cvr_nam, 'NULL'), 12) ||
              RPAD(NVL(l_fila.ina_val, 'NULL'), 10) ||
              RPAD(NVL(TO_CHAR(l_fila.nto_bas_amn), 'NULL'), 14) ||
              RPAD(NVL(TO_CHAR(l_fila.nto_cms_amn), 'NULL'), 14) ||
              RPAD(NVL(TO_CHAR(l_fila.rcl_cms_amn), 'NULL'), 14) ||
              RPAD(NVL(TO_CHAR(l_fila.rsk_val), 'NULL'), 10) ||
              RPAD(NVL(l_fila.agn_typ_val, 'NULL'), 14) ||
              RPAD(NVL(TO_CHAR(l_fila.rcl_bas_amn), 'NULL'), 14) ||
              RPAD(NVL(TO_CHAR(l_fila.agn_val), 'NULL'), 10) ||
              RPAD(NVL(l_fila.agn_nam, 'NULL'), 12) ||
              RPAD(NVL(TO_CHAR(l_fila.mvm_val), 'NULL'), 10) ||
              RPAD(NVL(TO_CHAR(l_fila.cmc_val), 'NULL'), 10) ||
              RPAD(NVL(l_fila.dsb_row, 'NULL'), 10) ||
              RPAD(NVL(l_fila.act_ind, 'NULL'), 10) ||
              RPAD(NVL(TO_CHAR(l_fila.agn_per), 'NULL'), 10) ||
              NVL(TO_CHAR(l_fila.apl_mdt_val), 'NULL')
            );
          END IF;
        END LOOP;
      
    END IF;  
    --
   END LOOP;
    --
  END IF;
  --  
END;
10
pm_cmp_val
1
20003
3
pm_gpp_val
1
0000555592
5
pm_gpp_enr_sqn
1
0
4
pm_del_val
1
30644
3
pm_sbl_val
1
99999
3
pm_ntc_dat
0
12
pm_ntc_val
0
5
pm_lng_val
1
ES
5
pm_usr_val
1
JUGEDIAZ
5
hacer_commit
1
N
5
0
