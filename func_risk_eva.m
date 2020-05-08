function [E_ear,los0,max0 ] = func_risk_eva(cur0,seg0,low_ai,low_p,high_ai,high_p,fee0,pro_mod,pri_en)
% pro_mod:0, wide, 1:narrow, 2:very narrow
low0 = seg0(1);
high0 = seg0(2);

seg_ev= [round(low0):1:round(high0)];
ear_v = 0*seg_ev;
pro_v = 0*seg_ev;

for cur_id=1:1:length(seg_ev),
    [ear0,los0,max0,pro0] = func_earn_ca(cur0,seg_ev(cur_id),low_ai,low_p,high_ai,high_p,pro_mod,fee0);
    pro_v(cur_id) = pro0;
    ear_v(cur_id) = ear0;
end
E_ear = sum(ear_v.*pro_v)/sum(pro_v);

if (pri_en == 1)
    E_ave = E_ear*100*func_ave_coef(low_ai,high_ai);
    figure;plot(seg_ev,ear_v);tit_str=sprintf('[%d,%d],Exp:%.2f,Ave:%.2fP,loss:%.1f,max:%.1f,ratio:%.2fP',round(low_ai/100),round(high_ai/100),E_ear,E_ave,los0,max0,abs(max0/los0*100));
    title(tit_str);
end

end


function [ear0,los0,max0,pro0] = func_earn_ca(cur0,cur_x, low_ai,low_p,high_ai,high_p,pro_mod,fee0)

los0 = high_p - low_p;
max0 = (high_ai + high_p)-(low_ai + low_p);
if (cur_x < low_ai)
    ear0 = los0-2*fee0;
elseif (cur_x > high_ai)
    ear0 = max0-4*fee0;
else
    ear0 = cur_x - low_ai+los0-3*fee0;
end

% probability,1000以内均匀，每1000，减半？或者，更复杂，[-2000，-1000]减半，[1000,1500]减半，后续每500减半？
% 按指数方式衰减吧，满足上述就好
pr500 = (cur_x - cur0)/500;

if (pro_mod==0)
    if (abs(pr500))<=2;
        pro0 = 1;
    elseif (pr500>2)
        pro0 = 0.5^(pr500-2);
    elseif (pr500 > -4),
        pro0 = 0.5^((-2-pr500)*0.5);
    else
        pro0 = (0.5^(-pr500-4))*0.5;
    end
    
elseif (pro_mod==1)
    % %% or, for debug, <0等概率，>0，概率衰减
    if (abs(pr500))<=1;
        pro0 = 1;
    elseif (pr500>1)
        pro0 = 0.5^(pr500-1);
    else
        pro0 = 0.75^(-pr500-1);
    end
else
    par0 = 0.01;
    if (abs(pr500))<=par0;
        pro0 = 1;
    elseif (pr500>par0)
        pro0 = 0.1^(pr500-par0);
    else
        pro0 = 0.2^(-pr500-par0);
    end
end


end