% tmp evalute
pri_en = 0;
fee0 = 4;
wei0_v = 1-1.0./[2:1:10 20 50 100];

ai_v= [36000:1000:39000];
pr_v = [2996 2075 1270 661];

seg0 = [35000, 40000];
cur0 = [39000];

ear_tot_v = (-1000)*ones(length(ai_v),length(ai_v));
ear_ave_v = ear_tot_v;
max_vs_v  = zeros(length(ai_v),length(ai_v));
min_ear = 10000;
for Lidx=1:1:length(ai_v)-1,
    for Hidx=(Lidx+1):1:length(ai_v),
        
        % Lidx = 2;
        low_ai = ai_v(Lidx);
        low_p = pr_v(Lidx);
        % Hidx=3;
        high_ai = ai_v(Hidx);
        high_p = pr_v(Hidx);
        [E_ear,los0,max0 ] = func_risk_eva(cur0,seg0,low_ai,low_p,high_ai,high_p,fee0,pri_en);
        
        ear_tot_v(Lidx,Hidx) = E_ear;
        ear_ave_v(Lidx,Hidx) = E_ear/(high_ai-low_ai)*100; % Percent
        max_vs_v(Lidx,Hidx) = abs(max0 / los0)*100; % Per
        if (E_ear < min_ear);
            min_ear = E_ear;
        end
    end
end

ear_tot_v(ear_tot_v<min_ear) = min_ear;
% figure;plot(ear_tot_v);


ear_wei_tot_v = zeros(length(wei0_v),8);
for widx=1:1:length(wei0_v),
    wei0 = wei0_v(widx);
    ear_fin_v = ear_ave_v *wei0 + max_vs_v*(1-wei0);
    [co_va,co_id] = max(ear_fin_v,[],2);
    [ro_va,ro_id] = max(co_va);
    max_poi=[ro_id,co_id(ro_id)];
    ai_v(max_poi),;
    pr_v(max_poi),;
    [ear_ave_v(ro_id,co_id(ro_id)),max_vs_v(ro_id,co_id(ro_id)),ear_fin_v(ro_id,co_id(ro_id))],;
    
    ear_wei_tot_v(widx,:)=[wei0,ro_id,co_id(ro_id),ai_v(max_poi)/100, ear_ave_v(ro_id,co_id(ro_id)),max_vs_v(ro_id,co_id(ro_id)),ear_fin_v(ro_id,co_id(ro_id))];
    [E_ear,los0,max0 ] = func_risk_eva(cur0,seg0,ai_v(max_poi(1)),pr_v(max_poi(1)),ai_v(max_poi(2)),pr_v(max_poi(2)),fee0,1);
    
end
ear_wei_tot_v,;






