% function [m, x_min] = sim_ann(x0)

clc
clear

x0 = [0;0;0];

x(:,1) = x0;
count = 0;
m = [count,0];
k = 1;
Temperature = 100;
i = 1;
n = 100;
c = 0.4;
% Et = 0.001;
Ef = 0.1;
[m ,f(1)] = objF(x(:,1) , m);
P(1) = exp(-f(1)/(k*Temperature));
move_limit = 0.25;
reject = 0;

while true
    
    for j = 1:length(x0)
        temp(j) = rand*2*move_limit+(x(j,i)-move_limit);
    end
    
    [m ,f(i+1)] = objF(temp, m);
    delE = f(i+1) - f(i)
    P(i+1) = min(1 , exp(-delE/(k*Temperature)));
    r = rand;
    if delE < 0
        x(:,i+1) = temp;
    elseif delE > 0
        if r < P(i+1)
            x(:,i+1) = temp;
        else
            reject = reject+1;
            continue
        end
    end
    
    i = i + 1;
    
    if i < n
            if (abs(delE) < Ef) %&& (Temperature < Et)
                x_min = x(:,i);
                break
            end
    elseif i == n
        Temperature = c*Temperature;
        x(:,1) = x(:,i);
        x(:,2:n) = 0;
        i = 1;
        continue
    end
    
end
[~,fmin] = objF(x_min , m)
% end