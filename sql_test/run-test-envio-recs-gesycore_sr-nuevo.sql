-- Launcher para trc_es_sr.sr_rcp_grl_qry_mes.f_grl
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
  lv_j number;

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

  lv_o := trc_es_sr.sr_rcp_grl_qry_mes.f_grl(
    pm_cmp_val => to_number(trim('&&pm_cmp_val')),
    pm_gpp_val => trim('&&pm_gpp_val'),
    pm_gpp_enr_sqn => to_number(trim('&&pm_gpp_enr_sqn')),
    pm_del_val => to_number(trim('&&pm_del_val')),
    pm_sbl_val => to_number(trim('&&pm_sbl_val')),
    pm_ntc_dat => lv_ntc_dat,
    pm_ntc_val => lv_ntc_val,
    pm_lng_val => trim('&&pm_lng_val'),
    pm_usr_val => trim('&&pm_usr_val'));

  if nvl(upper(trim('&&hacer_commit')), 'N') = 'S' then commit; else rollback; end if;

  dbms_output.put_line('==================== OBJETO lv_o_rcp_grl_cct ====================');
  prn('lv_o_rcp_grl_cct.prc_trm_val', case when lv_o is null then null else lv_o.prc_trm_val end);

  if lv_o is null or lv_o.rcp_grl_ct is null or lv_o.rcp_grl_ct.count = 0 then
    prn_num('lv_o_rcp_grl_cct.rcp_grl_ct.count', 0);
  else
    prn_num('lv_o_rcp_grl_cct.rcp_grl_ct.count', lv_o.rcp_grl_ct.count);

    for i in lv_o.rcp_grl_ct.first .. lv_o.rcp_grl_ct.last loop
      dbms_output.put_line('----------------------------------------------------------------');
      dbms_output.put_line('RECIBO [' || i || ']');
      if lv_o.rcp_grl_ct(i).rcp_grl_c is null then
        prn('rcp_grl_c', '<NULL>');
      else
        -- ply_gpn_p O_PLY_GPN_P -- GPN (NOTICE)
        dbms_output.put_line('=====================================================');
        dbms_output.put_line('======= ply_gpn_p O_PLY_GPN_P -- GPN (NOTICE) =======');
        dbms_output.put_line('=====================================================');
        prn_num('ply_gpn_pt.count', 1);
        prn_num('ply_gpn_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cmp_val);
        prn('ply_gpn_s.gpp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.gpp_val);
        prn_num('ply_gpn_s.gpp_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.gpp_enr_sqn);
        prn_num('ply_gpn_s.del_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.del_val);
        prn_num('ply_gpn_s.sbl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sbl_val);
        prn('ply_gpn_s.sbl_ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sbl_ply_val);
        prn('ply_gpn_s.ntc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_val);
        prn('ply_gpn_s.pym_dcm_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.pym_dcm_typ_val);
        prn('ply_gpn_s.pym_dcm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.pym_dcm_val);
        prn_dat('ply_gpn_s.ntc_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_dat);
        prn('ply_gpn_s.usr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.usr_val);
        prn_dat('ply_gpn_s.mdf_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.mdf_dat);
        prn_num('ply_gpn_s.sqn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sqn_val);
        prn_num('ply_gpn_s.sqn_aco_crd_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sqn_aco_crd_val);
        prn('ply_gpn_s.ntc_rfr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_rfr_val);
        prn('ply_gpn_s.sts_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sts_typ_val);
        prn('ply_gpn_s.cvg_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cvg_val);
        prn('ply_gpn_s.chc_rvn_rcp', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.chc_rvn_rcp);
        prn_num('ply_gpn_s.nmr_rsf', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.nmr_rsf);
        prn_num('ply_gpn_s.nmr_rvt', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.nmr_rvt);
        prn('ply_gpn_s.sts_typ_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sts_typ_nam);
        prn('ply_gpn_s.cin_rcp_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cin_rcp_typ_val);

        -- thp_gsp_pt O_THP_GSP_PT -- GSP (TERCEROS)
        dbms_output.put_line('=========================================================');
        dbms_output.put_line('======= thp_gsp_pt O_THP_GSP_PT -- GSP (TERCEROS) =======');
        dbms_output.put_line('=========================================================');
        if lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt is not null then
          prn_num('thp_gsp_pt.count', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.count);
          for j in lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.last loop
            if lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s is not null then
              prn_num('thp_gsp_s[' || j || '].cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cmp_val);
              prn('thp_gsp_s[' || j || '].bnf_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bnf_typ_val);
              prn('thp_gsp_s[' || j || '].thp_dcm_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_typ_val);
              prn('thp_gsp_s[' || j || '].thp_dcm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_val);
              prn('thp_gsp_s[' || j || '].thp_frs_srn', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_frs_srn);
              prn('thp_gsp_s[' || j || '].thp_scd_srn', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_scd_srn);
              prn('thp_gsp_s[' || j || '].thp_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_nam);
              prn('thp_gsp_s[' || j || '].sex_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.sex_val);
              prn('thp_gsp_s[' || j || '].phy_prs', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.phy_prs);
              prn('thp_gsp_s[' || j || '].tlp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_val);
              prn('thp_gsp_s[' || j || '].tlp_cny_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_cny_val);
              prn('thp_gsp_s[' || j || '].frs_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.frs_adr_lin_nam);
              prn('thp_gsp_s[' || j || '].scn_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.scn_adr_lin_nam);
              prn('thp_gsp_s[' || j || '].thr_adr_lin_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thr_adr_lin_nam);
              prn('thp_gsp_s[' || j || '].cny_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_val);
              prn('thp_gsp_s[' || j || '].cny_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_nam);
              prn_num('thp_gsp_s[' || j || '].stt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_val);
              prn('thp_gsp_s[' || j || '].stt_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_nam);
              prn_num('thp_gsp_s[' || j || '].pvc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_val);
              prn('thp_gsp_s[' || j || '].pvc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_nam);
              prn_num('thp_gsp_s[' || j || '].twn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_val);
              prn('thp_gsp_s[' || j || '].twn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_nam);
              prn('thp_gsp_s[' || j || '].psl_cod_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.psl_cod_val);
              prn('thp_gsp_s[' || j || '].lng_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_val);
              prn('thp_gsp_s[' || j || '].lng_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_nam);
              prn('thp_gsp_s[' || j || '].bne_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_val);
              prn('thp_gsp_s[' || j || '].bne_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_nam);
              prn('thp_gsp_s[' || j || '].bno_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_val);
              prn('thp_gsp_s[' || j || '].bno_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_nam);
              prn('thp_gsp_s[' || j || '].bna_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_val);
              prn('thp_gsp_s[' || j || '].ibn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_val);
              prn('thp_gsp_s[' || j || '].bna_dgt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_dgt_val);
              prn('thp_gsp_s[' || j || '].ibn_dgt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_dgt_val);
              prn_num('thp_gsp_s[' || j || '].crn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_val);
              prn('thp_gsp_s[' || j || '].crn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_nam);
              prn('thp_gsp_s[' || j || '].hlr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.hlr_nam);
            end if;
          end loop;
        end if;

        -- rcp_grc_p O_RCP_GRC_P -- GRC (RECIBO)
        dbms_output.put_line('=====================================================');
        dbms_output.put_line('======= rcp_grc_p O_RCP_GRC_P -- GRC (RECIBO) =======');
        dbms_output.put_line('=====================================================');
        prn_num('rcp_grc_s.cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmp_val);
        prn_num('rcp_grc_s.thr_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.thr_lvl_val);
        prn_num('rcp_grc_s.agn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agn_val);
        prn_num('rcp_grc_s.cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmc_val);
        prn_num('rcp_grc_s.mvm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_val);
        prn('rcp_grc_s.mvm_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_nam);
        prn_num('rcp_grc_s.mdt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdt_val);
        prn_num('rcp_grc_s.rcp_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_amn);
        prn('rcp_grc_s.crn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_nam);
        prn('rcp_grc_s.isu_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.isu_typ_val);
        prn('rcp_grc_s.gpp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_val);
        prn_num('rcp_grc_s.gpp_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_enr_sqn);
        prn('rcp_grc_s.rcp_sts_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_sts_typ_val);

        -- ply_ina_pt O_PLY_INA_PT -- INA (INTERVINIENTES)
        dbms_output.put_line('===============================================================');
        dbms_output.put_line('======= ply_ina_pt O_PLY_INA_PT -- INA (INTERVINIENTES) =======');
        dbms_output.put_line('===============================================================');
        if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt is not null then
          prn_num('ply_ina_pt.count', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.count);        
          for j in lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.last loop
            if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s is not null then
              prn_num('ply_ina_s[' || j || '].cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmp_val);
              prn('ply_ina_s[' || j || '].ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.ply_val);
              prn('ply_ina_s[' || j || '].qtn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.qtn_val);
              prn_num('ply_ina_s[' || j || '].enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.enr_sqn);
              prn_num('ply_ina_s[' || j || '].apl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_val);
              prn_num('ply_ina_s[' || j || '].apl_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_enr_sqn);
              prn('ply_ina_s[' || j || '].itc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_val);
              prn('ply_ina_s[' || j || '].itc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_nam);
              prn_num('ply_ina_s[' || j || '].thp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_val);
              prn('ply_ina_s[' || j || '].thp_cpe_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_cpe_nam);
              prn_num('ply_ina_s[' || j || '].par_per', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.par_per);
              prn_num('ply_ina_s[' || j || '].cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_val);
              prn('ply_ina_s[' || j || '].cmc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_nam);
              prn_num('ply_ina_s[' || j || '].frs_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_val);
              prn('ply_ina_s[' || j || '].frs_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_nam);
              prn_num('ply_ina_s[' || j || '].scn_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_val);
              prn('ply_ina_s[' || j || '].scn_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_nam);
              prn_num('ply_ina_s[' || j || '].thr_lvl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_val);
              prn('ply_ina_s[' || j || '].thr_lvl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_nam);
              prn_dat('ply_ina_s[' || j || '].mvm_dat', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_dat);
              prn('ply_ina_s[' || j || '].mvm_tme', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_tme);
              prn('ply_ina_s[' || j || '].frs_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_val);
              prn('ply_ina_s[' || j || '].frs_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_nam);
              prn('ply_ina_s[' || j || '].scn_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_val);
              prn('ply_ina_s[' || j || '].scn_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_nam);
              prn('ply_ina_s[' || j || '].thr_dst_hnl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_val);
              prn('ply_ina_s[' || j || '].thr_dst_hnl_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_nam);
            end if;
          end loop;
        end if;

        -- rcp_gec_pt O_RCP_GEC_PT -- GEC (CONC. ECONOM.)
        dbms_output.put_line('============================================================');
        dbms_output.put_line('======= rcp_gec_pt O_RCP_GEC_PT -- GEC (CONC. ECON.) =======');
        dbms_output.put_line('============================================================');
        if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt is not null then
          prn_num('rcp_gec_pt.count', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.count);
          for j in lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.last loop
            if lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s is not null then
              prn_num('rcp_gec_s[' || j || '].cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cmp_val);
              prn('rcp_gec_s[' || j || '].ply_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ply_val);
              prn_num('rcp_gec_s[' || j || '].enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.enr_sqn);
              prn_num('rcp_gec_s[' || j || '].apl_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_val);
              prn_num('rcp_gec_s[' || j || '].apl_enr_sqn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_enr_sqn);
              prn_num('rcp_gec_s[' || j || '].inm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.inm_val);
              prn_num('rcp_gec_s[' || j || '].ecc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_val);
              prn('rcp_gec_s[' || j || '].ecc_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_nam);
              prn_num('rcp_gec_s[' || j || '].cvr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_val);
              prn('rcp_gec_s[' || j || '].cvr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_nam);
              prn_num('rcp_gec_s[' || j || '].ecc_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_amn);
              prn_num('rcp_gec_s[' || j || '].lob_val', lv_o.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.lob_val);
            end if;
          end loop;

        end if;

        -- ply_guc_pt O_PLY_GUC_PT -- GUC (COMISIONES)
        dbms_output.put_line('=============================c=============================');
        dbms_output.put_line('======= ply_guc_pt O_PLY_GUC_PT -- GUC (COMISIONES) =======');
        dbms_output.put_line('=============================c=============================');
        if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt is not null then
          prn_num('ply_guc_pt.count', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.count);
          for j in lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.first .. lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.last loop
            if lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s is not null then
              prn_num('ply_guc_s[' || j || '].cmp_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmp_val);
              prn_num('ply_guc_s[' || j || '].cvr_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_val);
              prn('ply_guc_s[' || j || '].cvr_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_nam);
              prn('ply_guc_s[' || j || '].ina_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.ina_val);
              prn_num('ply_guc_s[' || j || '].nto_bas_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_bas_amn);
              prn_num('ply_guc_s[' || j || '].nto_cms_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_cms_amn);
              prn_num('ply_guc_s[' || j || '].rcl_cms_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_cms_amn);
              prn_num('ply_guc_s[' || j || '].rsk_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rsk_val);
              prn('ply_guc_s[' || j || '].agn_typ_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_typ_val);
              prn_num('ply_guc_s[' || j || '].rcl_bas_amn', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_bas_amn);
              prn_num('ply_guc_s[' || j || '].agn_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_val);
              prn('ply_guc_s[' || j || '].agn_nam', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_nam);
              prn_num('ply_guc_s[' || j || '].mvm_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.mvm_val);
              prn_num('ply_guc_s[' || j || '].cmc_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmc_val);
              prn('ply_guc_s[' || j || '].dsb_row', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.dsb_row);
              prn('ply_guc_s[' || j || '].act_ind', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.act_ind);
              prn_num('ply_guc_s[' || j || '].agn_per', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_per);
              prn_num('ply_guc_s[' || j || '].apl_mdt_val', lv_o.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.apl_mdt_val);
            end if;
          end loop;
        else
          prn_num('ply_guc_pt.count', 0);
        end if;
      end if;
    end loop;

    
  end if;

exception
  when others then
    dbms_output.put_line('Error no controlado: ' || sqlerrm);
    raise;
end;
/
