-- Launcher del test equivalente a PL/SQL Developer para trc_es_sr.sr_rcp_grl_qry_mes.f_grl
-- Uso: @sql_test/run-test-envio-recs-gesycore_sr-nuevo.sql 20003 0000555592 0 30644 99999 NULL NULL ES JUGEDIAZ N JUGEDIAZ

set verify off
set define on
set serveroutput on size unlimited
whenever sqlerror exit failure rollback

define pm_cmp_val     = '&1'
define pm_gpp_val     = '&2'
define pm_gpp_enr_sqn = '&3'
define pm_del_val     = '&4'
define pm_sbl_val     = '&5'
define pm_ntc_dat     = '&6'
define pm_ntc_val     = '&7'
define pm_lng_val     = '&8'
define pm_usr_val     = '&9'
define hacer_commit   = '&10'
define pm_dbg_idn     = '&11'

prompt ===========================================================
prompt Ejecutando test-envio-recs-gesycore_sr-nuevo
prompt cmp=&pm_cmp_val gpp=&pm_gpp_val gpp_enr=&pm_gpp_enr_sqn del=&pm_del_val sbl=&pm_sbl_val
prompt ntc_dat=&pm_ntc_dat ntc_val=&pm_ntc_val lng=&pm_lng_val usr=&pm_usr_val commit=&hacer_commit dbg=&pm_dbg_idn
prompt ===========================================================

set linesize 300
set trimspool on

declare
  lv_o trc_es_o.o_rcp_grl_cct;
  lv_ntc_dat date;
  lv_ntc_val varchar2(4000);
  lv_dbg_idn varchar2(128);

  procedure prn(p_nam in varchar2, p_val in varchar2) is
  begin
    dbms_output.put_line(p_nam || ' : ' || nvl(p_val, '<NULL>'));
  end;

  procedure prn_num(p_nam in varchar2, p_val in number) is
  begin
    if p_val is null then prn(p_nam, null); else prn(p_nam, to_char(p_val)); end if;
  end;

  procedure prn_dat(p_nam in varchar2, p_val in date) is
  begin
    if p_val is null then prn(p_nam, null); else prn(p_nam, to_char(p_val, 'YYYY-MM-DD HH24:MI:SS')); end if;
  end;

begin
  if upper(trim('&&pm_ntc_dat')) = 'NULL' or trim('&&pm_ntc_dat') is null then lv_ntc_dat := null;
  else lv_ntc_dat := to_date(trim('&&pm_ntc_dat'), 'YYYY-MM-DD'); end if;
  if upper(trim('&&pm_ntc_val')) = 'NULL' or trim('&&pm_ntc_val') is null then lv_ntc_val := null;
  else lv_ntc_val := trim('&&pm_ntc_val'); end if;
  if trim('&&pm_dbg_idn') is null then lv_dbg_idn := trim('&&pm_usr_val');
  else lv_dbg_idn := trim('&&pm_dbg_idn'); end if;

  dl_trn_vrb.p_set('cod_cia', to_number(trim('&&pm_cmp_val')));
  dl_trn_vrb.p_set('cod_usr', trim('&&pm_usr_val'));
  dl_trn_vrb.p_set('cod_idioma', trim('&&pm_lng_val'));
  nwt_dl.dl_trn_dbg_trn.p_enb(pm_dbg_idn => lv_dbg_idn);

  lv_o := trc_es_sr.sr_rcp_grl_qry_mes.f_grl( pm_cmp_val => to_number(trim('&&pm_cmp_val')), 
                                              pm_gpp_val => trim('&&pm_gpp_val'),
                                              pm_gpp_enr_sqn => to_number(trim('&&pm_gpp_enr_sqn')), 
                                              pm_del_val => to_number(trim('&&pm_del_val')),
                                              pm_sbl_val => to_number(trim('&&pm_sbl_val')), 
                                              pm_ntc_dat => lv_ntc_dat, pm_ntc_val => lv_ntc_val,
                                              pm_lng_val => trim('&&pm_lng_val'), 
                                              pm_usr_val => trim('&&pm_usr_val'));

  if nvl(upper(trim('&&hacer_commit')), 'N') = 'S' then commit; else rollback; end if;

  dbms_output.put_line('==================== OBJETO lv_o_rcp_grl_cct ====================');
  if lv_o is null then prn('lv_o_rcp_grl_cct', '<NULL>');
  else
    prn('lv_o_rcp_grl_cct.prc_trm_val', lv_o.prc_trm_val);
    prn_num('lv_o_rcp_grl_cct.rcp_grl_ct.count', case when lv_o.rcp_grl_ct is null then 0 else lv_o.rcp_grl_ct.count end);

    if lv_o.rcp_grl_ct is not null then
      for i in lv_o.rcp_grl_ct.first .. lv_o.rcp_grl_ct.last loop
        dbms_output.put_line('----------------------------------------------------------------');
        dbms_output.put_line('RECIBO [' || i || ']');
        if lv_o.rcp_grl_ct(i).rcp_grl_c is not null then
          if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p is not null then
            if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s is not null then
              prn_num('rcp_grc_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmp_val);
              prn_num('rcp_grc_s.thr_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.thr_lvl_val);
              prn_num('rcp_grc_s.agn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agn_val);
              prn_num('rcp_grc_s.cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmc_val);
              prn_num('rcp_grc_s.mvm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_val);
              prn('rcp_grc_s.mvm_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_nam);
              prn('rcp_grc_s.ply_drt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_drt_val);
              prn('rcp_grc_s.mnr_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mnr_typ_val);
              prn('rcp_grc_s.mnr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mnr_val);
              prn_num('rcp_grc_s.mdt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdt_val);
              prn_num('rcp_grc_s.pms_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.pms_val);
              prn_num('rcp_grc_s.lob_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.lob_val);
              prn_num('rcp_grc_s.sec_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.sec_val);
              prn_dat('rcp_grc_s.enr_isu_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_isu_dat);
              prn_dat('rcp_grc_s.ply_efc_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_efc_dat);
              prn_dat('rcp_grc_s.ply_exp_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_exp_dat);
              prn_dat('rcp_grc_s.enr_efc_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_efc_dat);
              prn_dat('rcp_grc_s.enr_exp_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_exp_dat);
              prn('rcp_grc_s.usr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.usr_val);
              prn_dat('rcp_grc_s.mdf_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdf_dat);
              prn_num('rcp_grc_s.agt_emp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agt_emp_val);
              prn('rcp_grc_s.mrr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mrr_val);
              prn('rcp_grc_s.csn_rgh', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.csn_rgh);
              prn('rcp_grc_s.isu_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.isu_typ_val);
              prn_num('rcp_grc_s.rnw_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rnw_val);
              prn('rcp_grc_s.gpp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_val);
              prn_num('rcp_grc_s.gpp_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_enr_sqn);
              prn('rcp_grc_s.ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_val);
              prn_num('rcp_grc_s.enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_sqn);
              prn('rcp_grc_s.mvm_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_typ_val);
              prn('rcp_grc_s.opr_org_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.opr_org_val);
              prn('rcp_grc_s.ply_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_typ_val);
              prn('rcp_grc_s.sts_ply', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.sts_ply);
              prn('rcp_grc_s.enr_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_typ_val);
              prn_num('rcp_grc_s.cer_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cer_val);
              prn_dat('rcp_grc_s.acg_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.acg_dat);
              prn_num('rcp_grc_s.crn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_val);
              prn('rcp_grc_s.crn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_nam);
              prn_num('rcp_grc_s.rcp_org', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_org);
              prn_num('rcp_grc_s.rcp_org_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_org_typ_val);
              prn_dat('rcp_grc_s.rcp_efc_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_efc_dat);
              prn_dat('rcp_grc_s.rcp_exp_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_exp_dat);
              prn_dat('rcp_grc_s.xtr_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.xtr_dat);
              prn_num('rcp_grc_s.rcp_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_amn);
              prn('rcp_grc_s.rcp_sts_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_sts_typ_val);
            end if;
          end if;

          prn_num('thp_gsp_pt.count', case when lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt is null then 0 else lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.count end);
          if lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt is not null then
            for j in lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.last loop
              if lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s is not null then
                prn_num('thp_gsp_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cmp_val);
                prn('thp_gsp_s.bnf_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bnf_typ_val);
                prn('thp_gsp_s.thp_dcm_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_typ_val);
                prn('thp_gsp_s.thp_dcm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_val);
                prn('thp_gsp_s.thp_frs_srn', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_frs_srn);
                prn('thp_gsp_s.thp_scd_srn', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_scd_srn);
                prn('thp_gsp_s.thp_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_nam);
                prn('thp_gsp_s.sex_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.sex_val);
                prn('thp_gsp_s.phy_prs', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.phy_prs);
                prn('thp_gsp_s.tlp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_val);
                prn('thp_gsp_s.tlp_cny_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_cny_val);
                prn('thp_gsp_s.frs_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.frs_adr_lin_nam);
                prn('thp_gsp_s.scn_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.scn_adr_lin_nam);
                prn('thp_gsp_s.thr_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thr_adr_lin_nam);
                prn('thp_gsp_s.cny_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_val);
                prn('thp_gsp_s.cny_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_nam);
                prn_num('thp_gsp_s.stt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_val);
                prn('thp_gsp_s.stt_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_nam);
                prn_num('thp_gsp_s.pvc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_val);
                prn('thp_gsp_s.pvc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_nam);
                prn_num('thp_gsp_s.twn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_val);
                prn('thp_gsp_s.twn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_nam);
                prn('thp_gsp_s.psl_cod_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.psl_cod_val);
                prn('thp_gsp_s.lng_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_val);
                prn('thp_gsp_s.lng_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_nam);
                prn('thp_gsp_s.bne_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_val);
                prn('thp_gsp_s.bne_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_nam);
                prn('thp_gsp_s.bno_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_val);
                prn('thp_gsp_s.bno_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_nam);
                prn('thp_gsp_s.bna_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_val);
                prn('thp_gsp_s.ibn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_val);
                prn('thp_gsp_s.bna_dgt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_dgt_val);
                prn('thp_gsp_s.ibn_dgt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_dgt_val);
                prn_num('thp_gsp_s.crn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_val);
                prn('thp_gsp_s.crn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_nam);
                prn('thp_gsp_s.hlr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.hlr_nam);
              end if;
            end loop;
          end if;

          prn_num('ply_ina_pt.count', case when lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt is null then 0 else lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.count end);
          if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt is not null then
            for j in lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.last loop
              if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s is not null then
                prn_num('ply_ina_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmp_val);
                prn('ply_ina_s.ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.ply_val);
                prn('ply_ina_s.qtn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.qtn_val);
                prn_num('ply_ina_s.enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.enr_sqn);
                prn_num('ply_ina_s.apl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_val);
                prn_num('ply_ina_s.apl_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_enr_sqn);
                prn('ply_ina_s.itc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_val);
                prn('ply_ina_s.itc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_nam);
                prn_num('ply_ina_s.thp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_val);
                prn('ply_ina_s.thp_cpe_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_cpe_nam);
                prn_num('ply_ina_s.par_per', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.par_per);
                prn_num('ply_ina_s.cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_val);
                prn('ply_ina_s.cmc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_nam);
                prn_num('ply_ina_s.frs_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_val);
                prn('ply_ina_s.frs_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_nam);
                prn_num('ply_ina_s.scn_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_val);
                prn('ply_ina_s.scn_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_nam);
                prn_num('ply_ina_s.thr_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_val);
                prn('ply_ina_s.thr_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_nam);
                prn_dat('ply_ina_s.mvm_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_dat);
                prn('ply_ina_s.mvm_tme', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_tme);
                prn('ply_ina_s.frs_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_val);
                prn('ply_ina_s.frs_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_nam);
                prn('ply_ina_s.scn_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_val);
                prn('ply_ina_s.scn_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_nam);
                prn('ply_ina_s.thr_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_val);
                prn('ply_ina_s.thr_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_nam);
              end if;
            end loop;
          end if;

          prn_num('rcp_gec_pt.count', case when lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt is null then 0 else lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.count end);
          if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt is not null then
            for j in lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.last loop
              if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s is not null then
                prn_num('rcp_gec_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cmp_val);
                prn('rcp_gec_s.ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ply_val);
                prn_num('rcp_gec_s.enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.enr_sqn);
                prn_num('rcp_gec_s.apl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_val);
                prn_num('rcp_gec_s.apl_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_enr_sqn);
                prn_num('rcp_gec_s.inm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.inm_val);
                prn_num('rcp_gec_s.ecc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_val);
                prn('rcp_gec_s.ecc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_nam);
                prn_num('rcp_gec_s.cvr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_val);
                prn('rcp_gec_s.cvr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_nam);
                prn_num('rcp_gec_s.ecc_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_amn);
                prn_num('rcp_gec_s.lob_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.lob_val);
              end if;
            end loop;
          end if;

          prn_num('ply_guc_pt.count', case when lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt is null then 0 else lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.count end);
          if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt is not null then
            for j in lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.last loop
              if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s is not null then
                prn_num('ply_guc_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmp_val);
                prn_num('ply_guc_s.cvr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_val);
                prn('ply_guc_s.cvr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_nam);
                prn('ply_guc_s.ina_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.ina_val);
                prn_num('ply_guc_s.nto_bas_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_bas_amn);
                prn_num('ply_guc_s.nto_cms_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_cms_amn);
                prn_num('ply_guc_s.rcl_cms_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_cms_amn);
                prn_num('ply_guc_s.rsk_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rsk_val);
                prn('ply_guc_s.agn_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_typ_val);
                prn_num('ply_guc_s.rcl_bas_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_bas_amn);
                prn_num('ply_guc_s.agn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_val);
                prn('ply_guc_s.agn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_nam);
                prn_num('ply_guc_s.mvm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.mvm_val);
                prn_num('ply_guc_s.cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmc_val);
                prn('ply_guc_s.dsb_row', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.dsb_row);
                prn('ply_guc_s.act_ind', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.act_ind);
                prn_num('ply_guc_s.agn_per', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_per);
                prn_num('ply_guc_s.apl_mdt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.apl_mdt_val);
              end if;
            end loop;
          end if;
        end if;
      end loop;
    end if;
  end if;
exception
  when others then
    dbms_output.put_line('Error no controlado: ' || sqlerrm);
    raise;
end;
/
