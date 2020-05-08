% tmp evalute
pri_en = 0;
fee0 = 4;
wei0_v = 1-1.0./[2:1:10 20 50 100 1000];

% % ai_v= [36000:1000:39000];
% % pr_v = [2996 2075 1270 661];
% ai_v= [35000:1000:39000];
% pr_v = [5000 4000 3038 2100 1282 659];
% seg0 = [34000, 40000];
% 
% ai_v= [36000:1000:39000];
% pr_v = [2970 2044 1228 612];
% seg0 = [35000, 40000];
% cur0 = [39070];

% ai_v= [35000:1000:40000];
% pr_v = [4000 3094 2276  1564  1000 600];
% seg0 = [34000, 41000];
% cur0 = [39120];

% ai_v= [35000:1000:40000];
% pr_v = [4339 3576  2871  2276   1771  1351];
% seg0 = [34000, 41000];
% cur0 = [39100];

ai_v= [36000:1000:41000];
pr_v = [3477 2515 1616 875 385 137];
seg0 = [ai_v(1)-1000, ai_v(end)+1000];
cur0 = [39600];
% ai_v= [36000:1000:40000];
% pr_v = [3477 2515 1616 875 385];
% seg0 = [ai_v(1)-1000, ai_v(end)+1000];
% cur0 = [39600];
% ai_v= [36000:1000:41000];
% pr_v = [3520  2655 1890  1240  760  442];
% seg0 = [ai_v(1)-1000, ai_v(end)+1000];
% cur0 = [39600];

% ai_v= [26000:500:29000];
% pr_v = [2352 1858 1401 987 641 373 194];
% seg0 = [25500, 29500];
% cur0 = [28450];
% ai_v= [26000:500:29000];
% pr_v = [2585 2095 1623 1171 772 458 241];
% seg0 = [25500, 30000];
% cur0 = [28710];


% [ear_wei_tot_v,ear_wei_cur_v,ear_tot_v,ear_ave_v,ear_cur_v,max_vs_v]=fucn_risk_eva_tot(cur0,seg0,ai_v,pr_v,wei0_v,fee0,pri_en);
% %     ear_wei_tot_v(widx,:)=[wei0,ro_id,co_id(ro_id),ai_v(max_poi)/100, ear_ave_v(ro_id,co_id(ro_id)),max_vs_v(ro_id,co_id(ro_id)),ear_fin_v(ro_id,co_id(ro_id))];
% ear_wei_tot_v,;
[ear_wei_tot_v,ear_tot_v,ear_ave_v,max_vs_v]=fucn_risk_eva_tot(cur0,seg0,ai_v,pr_v,wei0_v,fee0,0,pri_en);
%     ear_wei_tot_v(widx,:)=[wei0,ro_id,co_id(ro_id),ai_v(max_poi)/100, ear_ave_v(ro_id,co_id(ro_id)),max_vs_v(ro_id,co_id(ro_id)),ear_fin_v(ro_id,co_id(ro_id))];
ear_wei_tot_v,;
[ear_wei_cur_v,ear_tot_v,ear_cur_v,max_vs_v]=fucn_risk_eva_tot(cur0,seg0,ai_v,pr_v,wei0_v,fee0,2,pri_en);
ear_wei_cur_v,;

if (0)
ro_id=2; co_id=5; pro_mod =2;
func_risk_check_tmp(ro_id,co_id,ai_v,pr_v,ear_ave_v,max_vs_v,cur0,seg0,fee0,pro_mod);
    
end





