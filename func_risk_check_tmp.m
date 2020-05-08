function func_risk_check_tmp(ro_id,co_id,ai_v,pr_v,ear_ave_v,max_vs_v,cur0,seg0,fee0,pro_mod)
% pro_mod:0, wide, 1:narrow, 2:very narrow
max_poi=[ro_id,co_id];
%     ear_wei_tot_v(widx,:)=[wei0,ro_id,co_id,ai_v(max_poi)/100, ear_ave_v(ro_id,co_id),max_vs_v(ro_id,co_id),ear_fin_v(ro_id,co_id)];

if (1)
    ai_v(max_poi),;
    pr_v(max_poi),;
    [ear_ave_v(ro_id,co_id),max_vs_v(ro_id,co_id)],;
    
    [E_ear,los0,max0 ] = func_risk_eva(cur0,seg0,ai_v(max_poi(1)),pr_v(max_poi(1)),ai_v(max_poi(2)),pr_v(max_poi(2)),fee0,pro_mod,1);
end

end