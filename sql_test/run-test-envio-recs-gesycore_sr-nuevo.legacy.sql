-- Launcher del test equivalente a PL/SQL Developer para trc_es_sr.sr_rcp_grl_qry_mes.f_grl
-- Uso (SQL*Plus/SQLcl):
-- @sql_test/run-test-envio-recs-gesycore_sr-nuevo.sql <pm_cmp_val> <pm_gpp_val> <pm_gpp_enr_sqn> <pm_del_val> <pm_sbl_val> <pm_ntc_dat> <pm_ntc_val> <pm_lng_val> <pm_usr_val> <hacer_commit> [pm_dbg_idn]
--
-- Ejemplo:
-- @sql_test/run-test-envio-recs-gesycore_sr-nuevo.sql 20003 0000555592 0 30644 99999 NULL NULL ES JUGEDIAZ N JUGEDIAZ
--
-- Reglas:
-- - Para valores nulos usar NULL
-- - pm_ntc_dat debe ir en formato YYYY-MM-DD o NULL

set verify off
set define on
set serveroutput on size unlimited
whenever sqlerror exit failure rollback


-- Parametros posicionales enviados por run-test-envio-recs-gesycore_sr-nuevo.ps1
-- 1=compania 2=gpp 3=gpp_enr_sqn 4=del 5=sbl 6=ntc_dat 7=ntc_val
-- 8=lenguaje 9=usuario 10=commit 11=debug
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
  lv_o_rcp_grl_cct trc_es_o.o_rcp_grl_cct;
  lv_ntc_dat date;
  lv_ntc_val varchar2(4000);
  lv_dbg_idn varchar2(128);

  procedure p_val(p_nam in varchar2, p_val in varchar2) is
  begin
    dbms_output.put_line(p_nam || ' : ' || nvl(p_val, '<NULL>'));
  end;

  procedure p_num(p_nam in varchar2, pv_val in number) is
  begin
    if pv_val is null then
      p_val(p_nam, null);
    else
      p_val(p_nam, to_char(pv_val));
    end if;
  end;

  procedure p_dat(p_nam in varchar2, pv_val in date) is
  begin
    if pv_val is null then
      p_val(p_nam, null);
    else
      p_val(p_nam, to_char(pv_val, 'YYYY-MM-DD HH24:MI:SS'));
    end if;
  end;

  procedure p_trn(p_trn in trc_es_o.o_trn_prc_s) is
  begin
    if p_trn is null then
      p_val('trn_prc_s', '<NULL>');
      return;
    end if;

    p_val('trn_prc_s.prc_acn_typ_val', p_trn.prc_acn_typ_val);
    p_val('trn_prc_s.prc_acn_org_typ_val', p_trn.prc_acn_org_typ_val);
    p_val('trn_prc_s.prc_trm_val', p_trn.prc_trm_val);
    p_val('trn_prc_s.row_slc', p_trn.row_slc);
    p_val('trn_prc_s.get_nam', p_trn.get_nam);
    p_val('trn_prc_s.opr_sts_typ_val', p_trn.opr_sts_typ_val);
    p_val('trn_prc_s.vld', p_trn.vld);
    p_val('trn_prc_s.pan_opn', p_trn.pan_opn);
    p_val('trn_prc_s.mdf', p_trn.mdf);
    p_val('trn_prc_s.vsb', p_trn.vsb);

    p_val('trn_prc_s.trn_err_t.count', case when p_trn.trn_err_t is null then '0' else to_char(p_trn.trn_err_t.count) end);
    if p_trn.trn_err_t is not null and p_trn.trn_err_t.count > 0 then
      for k in p_trn.trn_err_t.first .. p_trn.trn_err_t.last loop
        p_num('trn_err_t[' || k || '].sqn_val', p_trn.trn_err_t(k).sqn_val);
        p_val('trn_err_t[' || k || '].err_idn_val', p_trn.trn_err_t(k).err_idn_val);
        p_num('trn_err_t[' || k || '].err_val', p_trn.trn_err_t(k).err_val);
        p_val('trn_err_t[' || k || '].err_nam', p_trn.trn_err_t(k).err_nam);
        p_val('trn_err_t[' || k || '].prp_nam', p_trn.trn_err_t(k).prp_nam);
      end loop;
    end if;

    p_val('trn_prc_s.trn_rwd_t.count', case when p_trn.trn_rwd_t is null then '0' else to_char(p_trn.trn_rwd_t.count) end);
    if p_trn.trn_rwd_t is not null and p_trn.trn_rwd_t.count > 0 then
      for k in p_trn.trn_rwd_t.first .. p_trn.trn_rwd_t.last loop
        p_val('trn_rwd_t[' || k || '].rwd_val', p_trn.trn_rwd_t(k).rwd_val);
        if p_trn.trn_rwd_t(k).ext is not null then
          p_val('trn_rwd_t[' || k || '].ext.rwd_val', p_trn.trn_rwd_t(k).ext.rwd_val);
        else
          p_val('trn_rwd_t[' || k || '].ext', '<NULL>');
        end if;
      end loop;
    end if;

    p_val('trn_prc_s.trn_fld_t.count', case when p_trn.trn_fld_t is null then '0' else to_char(p_trn.trn_fld_t.count) end);
    if p_trn.trn_fld_t is not null and p_trn.trn_fld_t.count > 0 then
      for k in p_trn.trn_fld_t.first .. p_trn.trn_fld_t.last loop
        p_val('trn_fld_t[' || k || '].fld_nam', p_trn.trn_fld_t(k).fld_nam);
        p_val('trn_fld_t[' || k || '].rqr', p_trn.trn_fld_t(k).rqr);
        p_val('trn_fld_t[' || k || '].mdf', p_trn.trn_fld_t(k).mdf);
        p_val('trn_fld_t[' || k || '].vsb', p_trn.trn_fld_t(k).vsb);
        p_val('trn_fld_t[' || k || '].fld_typ_val', p_trn.trn_fld_t(k).fld_typ_val);
        p_num('trn_fld_t[' || k || '].fld_lnt_val', p_trn.trn_fld_t(k).fld_lnt_val);
        p_val('trn_fld_t[' || k || '].msk', p_trn.trn_fld_t(k).msk);
        p_val('trn_fld_t[' || k || '].idn_lst_val', p_trn.trn_fld_t(k).idn_lst_val);
        p_num('trn_fld_t[' || k || '].vrs_val', p_trn.trn_fld_t(k).vrs_val);
        p_val('trn_fld_t[' || k || '].tlt_val', p_trn.trn_fld_t(k).tlt_val);
        p_val('trn_fld_t[' || k || '].cul', p_trn.trn_fld_t(k).cul);
        p_num('trn_fld_t[' || k || '].dcl_val', p_trn.trn_fld_t(k).dcl_val);
        p_val('trn_fld_t[' || k || '].pan_val', p_trn.trn_fld_t(k).pan_val);
        p_val('trn_fld_t[' || k || '].pan_nam_val', p_trn.trn_fld_t(k).pan_nam_val);
        p_val('trn_fld_t[' || k || '].hlp_pgm_nam', p_trn.trn_fld_t(k).hlp_pgm_nam);
        p_val('trn_fld_t[' || k || '].pan_typ_val', p_trn.trn_fld_t(k).pan_typ_val);
        p_val('trn_fld_t[' || k || '].pan_opn', p_trn.trn_fld_t(k).pan_opn);
        p_val('trn_fld_t[' || k || '].rge', p_trn.trn_fld_t(k).rge);
        p_val('trn_fld_t[' || k || '].atr_fmt_typ_val', p_trn.trn_fld_t(k).atr_fmt_typ_val);
      end loop;
    end if;

    p_val('trn_prc_s.trn_wrn_t.count', case when p_trn.trn_wrn_t is null then '0' else to_char(p_trn.trn_wrn_t.count) end);
    if p_trn.trn_wrn_t is not null and p_trn.trn_wrn_t.count > 0 then
      for k in p_trn.trn_wrn_t.first .. p_trn.trn_wrn_t.last loop
        p_val('trn_wrn_t[' || k || '].wrn_idn_val', p_trn.trn_wrn_t(k).wrn_idn_val);
        p_num('trn_wrn_t[' || k || '].wrn_val', p_trn.trn_wrn_t(k).wrn_val);
        p_val('trn_wrn_t[' || k || '].wrn_nam', p_trn.trn_wrn_t(k).wrn_nam);
        p_val('trn_wrn_t[' || k || '].prp_nam', p_trn.trn_wrn_t(k).prp_nam);
      end loop;
    end if;

    if p_trn.trn_btc_s is not null then
      p_dat('trn_prc_s.trn_btc_s.lod_dat', p_trn.trn_btc_s.lod_dat);
      p_num('trn_prc_s.trn_btc_s.btc_prc_val', p_trn.trn_btc_s.btc_prc_val);
      p_val('trn_prc_s.trn_btc_s.btc_mvm_typ_val', p_trn.trn_btc_s.btc_mvm_typ_val);
      p_num('trn_prc_s.trn_btc_s.prc_thd_val', p_trn.trn_btc_s.prc_thd_val);
      p_val('trn_prc_s.trn_btc_s.btc_idn_val', p_trn.trn_btc_s.btc_idn_val);
      p_num('trn_prc_s.trn_btc_s.sqn_val', p_trn.trn_btc_s.sqn_val);
      p_val('trn_prc_s.trn_btc_s.prc_sts_val', p_trn.trn_btc_s.prc_sts_val);
      p_val('trn_prc_s.trn_btc_s.err_idn_val', p_trn.trn_btc_s.err_idn_val);
      p_val('trn_prc_s.trn_btc_s.rfr_val', p_trn.trn_btc_s.rfr_val);
      p_val('trn_prc_s.trn_btc_s.cpt_usr_val', p_trn.trn_btc_s.cpt_usr_val);
    else
      p_val('trn_prc_s.trn_btc_s', '<NULL>');
    end if;

    p_val('trn_prc_s.trn_dpn_t.count', case when p_trn.trn_dpn_t is null then '0' else to_char(p_trn.trn_dpn_t.count) end);
    if p_trn.trn_dpn_t is not null and p_trn.trn_dpn_t.count > 0 then
      for k in p_trn.trn_dpn_t.first .. p_trn.trn_dpn_t.last loop
        p_val('trn_dpn_t[' || k || '].dpn_obj_val', p_trn.trn_dpn_t(k).dpn_obj_val);
        p_num('trn_dpn_t[' || k || '].mnm_ocr_val', p_trn.trn_dpn_t(k).mnm_ocr_val);
        p_num('trn_dpn_t[' || k || '].mxm_ocr_val', p_trn.trn_dpn_t(k).mxm_ocr_val);
        p_num('trn_dpn_t[' || k || '].ocr_qnt_val', p_trn.trn_dpn_t(k).ocr_qnt_val);
        p_num('trn_dpn_t[' || k || '].lst_val', p_trn.trn_dpn_t(k).lst_val);
      end loop;
    end if;
  end;
begin
  if upper(trim('&&pm_ntc_dat')) = 'NULL' or trim('&&pm_ntc_dat') is null then
    lv_ntc_dat := null;
  else
    lv_ntc_dat := to_date(trim('&&pm_ntc_dat'), 'YYYY-MM-DD');
  end if;

  if upper(trim('&&pm_ntc_val')) = 'NULL' or trim('&&pm_ntc_val') is null then
    lv_ntc_val := null;
  else
    lv_ntc_val := trim('&&pm_ntc_val');
  end if;

  if trim('&&pm_dbg_idn') is null then
    lv_dbg_idn := trim('&&pm_usr_val');
  else
    lv_dbg_idn := trim('&&pm_dbg_idn');
  end if;

  dl_trn_vrb.p_set('cod_cia', to_number(trim('&&pm_cmp_val')));
  dl_trn_vrb.p_set('cod_usr', trim('&&pm_usr_val'));
  dl_trn_vrb.p_set('cod_idioma', trim('&&pm_lng_val'));

  nwt_dl.dl_trn_dbg_trn.p_enb(pm_dbg_idn => lv_dbg_idn);

  lv_o_rcp_grl_cct := trc_es_sr.sr_rcp_grl_qry_mes.f_grl(
    pm_cmp_val     => to_number(trim('&&pm_cmp_val')),
    pm_gpp_val     => trim('&&pm_gpp_val'),
    pm_gpp_enr_sqn => to_number(trim('&&pm_gpp_enr_sqn')),
    pm_del_val     => to_number(trim('&&pm_del_val')),
    pm_sbl_val     => to_number(trim('&&pm_sbl_val')),
    pm_ntc_dat     => lv_ntc_dat,
    pm_ntc_val     => lv_ntc_val,
    pm_lng_val     => trim('&&pm_lng_val'),
    pm_usr_val     => trim('&&pm_usr_val')
  );

  if nvl(upper(trim('&&hacer_commit')), 'N') = 'S' then
    commit;
  else
    rollback;
  end if;

  dbms_output.put_line('==================== OBJETO lv_o_rcp_grl_cct ====================');
  if lv_o_rcp_grl_cct is null then
    p_val('lv_o_rcp_grl_cct', '<NULL>');
  else
    p_val('lv_o_rcp_grl_cct.prc_trm_val', lv_o_rcp_grl_cct.prc_trm_val);
    p_val('lv_o_rcp_grl_cct.rcp_grl_ct.count', case when lv_o_rcp_grl_cct.rcp_grl_ct is null then '0' else to_char(lv_o_rcp_grl_cct.rcp_grl_ct.count) end);

    if lv_o_rcp_grl_cct.rcp_grl_ct is not null and lv_o_rcp_grl_cct.rcp_grl_ct.count > 0 then
      for i in lv_o_rcp_grl_cct.rcp_grl_ct.first .. lv_o_rcp_grl_cct.rcp_grl_ct.last loop
        dbms_output.put_line('----------------------------------------------------------------');
        dbms_output.put_line('RECIBO [' || i || ']');
        p_trn('lv_o_rcp_grl_cct.rcp_grl_ct[' || i || ']', lv_o_rcp_grl_cct.rcp_grl_ct(i).trn_prc_s);

        if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c is not null then
          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p is not null then
            p_trn('lv_o_rcp_grl_cct.rcp_grl_ct[' || i || '].rcp_grl_c.ply_gpn_p', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.trn_prc_s);
            if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s is not null then
              p_num('ply_gpn_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cmp_val);
              p_val('ply_gpn_s.gpp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.gpp_val);
              p_num('ply_gpn_s.gpp_enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.gpp_enr_sqn);
              p_num('ply_gpn_s.del_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.del_val);
              p_num('ply_gpn_s.sbl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sbl_val);
              p_val('ply_gpn_s.sbl_ply_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sbl_ply_val);
              p_val('ply_gpn_s.ntc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_val);
              p_val('ply_gpn_s.pym_dcm_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.pym_dcm_typ_val);
              p_val('ply_gpn_s.pym_dcm_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.pym_dcm_val);
              p_dat('ply_gpn_s.ntc_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_dat);
              p_val('ply_gpn_s.usr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.usr_val);
              p_dat('ply_gpn_s.mdf_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.mdf_dat);
              p_num('ply_gpn_s.sqn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sqn_val);
              p_num('ply_gpn_s.sqn_aco_crd_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sqn_aco_crd_val);
              p_val('ply_gpn_s.ntc_rfr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.ntc_rfr_val);
              p_val('ply_gpn_s.sts_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sts_typ_val);
              p_val('ply_gpn_s.cvg_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cvg_val);
              p_val('ply_gpn_s.chc_rvn_rcp', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.chc_rvn_rcp);
              p_num('ply_gpn_s.nmr_rsf', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.nmr_rsf);
              p_num('ply_gpn_s.nmr_rvt', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.nmr_rvt);
              p_val('ply_gpn_s.sts_typ_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.sts_typ_nam);
              p_val('ply_gpn_s.cin_rcp_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_gpn_p.ply_gpn_s.cin_rcp_typ_val);
            end if;
          end if;

          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p is not null then
            p_trn('rcp_grc_p', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.trn_prc_s);
            if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s is not null then
              p_num('rcp_grc_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmp_val);
              p_num('rcp_grc_s.thr_lvl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.thr_lvl_val);
              p_num('rcp_grc_s.agn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agn_val);
              p_num('rcp_grc_s.cmc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cmc_val);
              p_num('rcp_grc_s.mvm_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_val);
              p_val('rcp_grc_s.mvm_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_nam);
              p_val('rcp_grc_s.ply_drt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_drt_val);
              p_val('rcp_grc_s.mnr_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mnr_typ_val);
              p_val('rcp_grc_s.mnr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mnr_val);
              p_num('rcp_grc_s.mdt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdt_val);
              p_num('rcp_grc_s.pms_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.pms_val);
              p_num('rcp_grc_s.lob_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.lob_val);
              p_num('rcp_grc_s.sec_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.sec_val);
              p_dat('rcp_grc_s.enr_isu_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_isu_dat);
              p_dat('rcp_grc_s.ply_efc_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_efc_dat);
              p_dat('rcp_grc_s.ply_exp_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_exp_dat);
              p_dat('rcp_grc_s.enr_efc_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_efc_dat);
              p_dat('rcp_grc_s.enr_exp_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_exp_dat);
              p_val('rcp_grc_s.usr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.usr_val);
              p_dat('rcp_grc_s.mdf_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mdf_dat);
              p_num('rcp_grc_s.agt_emp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.agt_emp_val);
              p_val('rcp_grc_s.mrr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mrr_val);
              p_val('rcp_grc_s.csn_rgh', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.csn_rgh);
              p_val('rcp_grc_s.isu_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.isu_typ_val);
              p_num('rcp_grc_s.rnw_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rnw_val);
              p_val('rcp_grc_s.gpp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_val);
              p_num('rcp_grc_s.gpp_enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.gpp_enr_sqn);
              p_val('rcp_grc_s.ply_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_val);
              p_num('rcp_grc_s.enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_sqn);
              p_val('rcp_grc_s.mvm_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.mvm_typ_val);
              p_val('rcp_grc_s.opr_org_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.opr_org_val);
              p_val('rcp_grc_s.ply_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.ply_typ_val);
              p_val('rcp_grc_s.sts_ply', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.sts_ply);
              p_val('rcp_grc_s.enr_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.enr_typ_val);
              p_num('rcp_grc_s.cer_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.cer_val);
              p_dat('rcp_grc_s.acg_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.acg_dat);
              p_num('rcp_grc_s.crn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_val);
              p_val('rcp_grc_s.crn_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.crn_nam);
              p_num('rcp_grc_s.rcp_org', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_org);
              p_num('rcp_grc_s.rcp_org_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_org_typ_val);
              p_dat('rcp_grc_s.rcp_efc_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_efc_dat);
              p_dat('rcp_grc_s.rcp_exp_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_exp_dat);
              p_dat('rcp_grc_s.xtr_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.xtr_dat);
              p_num('rcp_grc_s.rcp_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_amn);
              p_val('rcp_grc_s.rcp_sts_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_grc_p.rcp_grc_s.rcp_sts_typ_val);
            end if;
          end if;

          dbms_output.put_line('[THP_GSP_PT] count=' || case when lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt is null then '0' else to_char(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.count) end);
          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt is not null and lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.count > 0 then
            for j in lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.first .. lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt.last loop
              dbms_output.put_line('[THP_GSP_PT[' || j || '].TRN_PRC_S]');
              p_trn(lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).trn_prc_s);
              if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s is not null then
                p_num('thp_gsp_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cmp_val);
                p_val('thp_gsp_s.bnf_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bnf_typ_val);
                p_val('thp_gsp_s.thp_dcm_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_typ_val);
                p_val('thp_gsp_s.thp_dcm_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_dcm_val);
                p_val('thp_gsp_s.thp_frs_srn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_frs_srn);
                p_val('thp_gsp_s.thp_scd_srn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_scd_srn);
                p_val('thp_gsp_s.thp_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thp_nam);
                p_val('thp_gsp_s.sex_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.sex_val);
                p_val('thp_gsp_s.phy_prs', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.phy_prs);
                p_val('thp_gsp_s.tlp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_val);
                p_val('thp_gsp_s.tlp_cny_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.tlp_cny_val);
                p_val('thp_gsp_s.frs_adr_lin_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.frs_adr_lin_nam);
                p_val('thp_gsp_s.scn_adr_lin_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.scn_adr_lin_nam);
                p_val('thp_gsp_s.thr_adr_lin_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.thr_adr_lin_nam);
                p_val('thp_gsp_s.cny_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_val);
                p_val('thp_gsp_s.cny_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.cny_nam);
                p_num('thp_gsp_s.stt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_val);
                p_val('thp_gsp_s.stt_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.stt_nam);
                p_num('thp_gsp_s.pvc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_val);
                p_val('thp_gsp_s.pvc_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.pvc_nam);
                p_num('thp_gsp_s.twn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_val);
                p_val('thp_gsp_s.twn_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.twn_nam);
                p_val('thp_gsp_s.psl_cod_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.psl_cod_val);
                p_val('thp_gsp_s.lng_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_val);
                p_val('thp_gsp_s.lng_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.lng_nam);
                p_val('thp_gsp_s.bne_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_val);
                p_val('thp_gsp_s.bne_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bne_nam);
                p_val('thp_gsp_s.bno_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_val);
                p_val('thp_gsp_s.bno_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bno_nam);
                p_val('thp_gsp_s.bna_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_val);
                p_val('thp_gsp_s.ibn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_val);
                p_val('thp_gsp_s.bna_dgt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.bna_dgt_val);
                p_val('thp_gsp_s.ibn_dgt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.ibn_dgt_val);
                p_num('thp_gsp_s.crn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_val);
                p_val('thp_gsp_s.crn_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.crn_nam);
                p_val('thp_gsp_s.hlr_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.thp_gsp_pt(j).thp_gsp_s.hlr_nam);
              end if;
            end loop;
          end if;

          p_num('ply_ina_pt.count', case when lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt is null then 0 else lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.count end);
          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt is not null then
            for j in lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.first .. lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt.last loop
              p_trn('ply_ina_pt[' || j || ']', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).trn_prc_s);
              if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s is not null then
                p_num('ply_ina_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmp_val);
                p_val('ply_ina_s.ply_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.ply_val);
                p_val('ply_ina_s.qtn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.qtn_val);
                p_num('ply_ina_s.enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.enr_sqn);
                p_num('ply_ina_s.apl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_val);
                p_num('ply_ina_s.apl_enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.apl_enr_sqn);
                p_val('ply_ina_s.itc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_val);
                p_val('ply_ina_s.itc_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.itc_nam);
                p_num('ply_ina_s.thp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_val);
                p_val('ply_ina_s.thp_cpe_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thp_cpe_nam);
                p_num('ply_ina_s.par_per', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.par_per);
                p_num('ply_ina_s.cmc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_val);
                p_val('ply_ina_s.cmc_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.cmc_nam);
                p_num('ply_ina_s.frs_lvl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_val);
                p_val('ply_ina_s.frs_lvl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_lvl_nam);
                p_num('ply_ina_s.scn_lvl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_val);
                p_val('ply_ina_s.scn_lvl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_lvl_nam);
                p_num('ply_ina_s.thr_lvl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_val);
                p_val('ply_ina_s.thr_lvl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_lvl_nam);
                p_dat('ply_ina_s.mvm_dat', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_dat);
                p_val('ply_ina_s.mvm_tme', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.mvm_tme);
                p_val('ply_ina_s.frs_dst_hnl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_val);
                p_val('ply_ina_s.frs_dst_hnl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.frs_dst_hnl_nam);
                p_val('ply_ina_s.scn_dst_hnl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_val);
                p_val('ply_ina_s.scn_dst_hnl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.scn_dst_hnl_nam);
                p_val('ply_ina_s.thr_dst_hnl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_val);
                p_val('ply_ina_s.thr_dst_hnl_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_ina_pt(j).ply_ina_s.thr_dst_hnl_nam);
              end if;
            end loop;
          end if;

          p_num('rcp_gec_pt.count', case when lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt is null then 0 else lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.count end);
          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt is not null then
            for j in lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.first .. lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt.last loop
              p_trn('rcp_gec_pt[' || j || ']', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).trn_prc_s);
              if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s is not null then
                p_num('rcp_gec_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cmp_val);
                p_val('rcp_gec_s.ply_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ply_val);
                p_num('rcp_gec_s.enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.enr_sqn);
                p_num('rcp_gec_s.apl_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_val);
                p_num('rcp_gec_s.apl_enr_sqn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.apl_enr_sqn);
                p_num('rcp_gec_s.inm_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.inm_val);
                p_num('rcp_gec_s.ecc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_val);
                p_val('rcp_gec_s.ecc_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_nam);
                p_num('rcp_gec_s.cvr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_val);
                p_val('rcp_gec_s.cvr_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.cvr_nam);
                p_num('rcp_gec_s.ecc_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.ecc_amn);
                p_num('rcp_gec_s.lob_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.rcp_gec_pt(j).rcp_gec_s.lob_val);
              end if;
            end loop;
          end if;

          p_num('ply_guc_pt.count', case when lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt is null then 0 else lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.count end);
          if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt is not null then
            for j in lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.first .. lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt.last loop
              p_trn('ply_guc_pt[' || j || ']', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).trn_prc_s);
              if lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s is not null then
                p_num('ply_guc_s.cmp_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmp_val);
                p_num('ply_guc_s.cvr_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_val);
                p_val('ply_guc_s.cvr_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cvr_nam);
                p_val('ply_guc_s.ina_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.ina_val);
                p_num('ply_guc_s.nto_bas_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_bas_amn);
                p_num('ply_guc_s.nto_cms_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.nto_cms_amn);
                p_num('ply_guc_s.rcl_cms_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_cms_amn);
                p_num('ply_guc_s.rsk_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rsk_val);
                p_val('ply_guc_s.agn_typ_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_typ_val);
                p_num('ply_guc_s.rcl_bas_amn', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.rcl_bas_amn);
                p_num('ply_guc_s.agn_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_val);
                p_val('ply_guc_s.agn_nam', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_nam);
                p_num('ply_guc_s.mvm_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.mvm_val);
                p_num('ply_guc_s.cmc_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.cmc_val);
                p_val('ply_guc_s.dsb_row', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.dsb_row);
                p_val('ply_guc_s.act_ind', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.act_ind);
                p_num('ply_guc_s.agn_per', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.agn_per);
                p_num('ply_guc_s.apl_mdt_val', lv_o_rcp_grl_cct.rcp_grl_ct(i).rcp_grl_c.ply_guc_pt(j).ply_guc_s.apl_mdt_val);
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
