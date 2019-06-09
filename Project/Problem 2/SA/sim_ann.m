function [m, x_min] = sim_ann(x0)

count = 0;
m = [count , 0];
x(:,1) = x0;
rp = 10000000;
k = 1;
Temperature = 100000;
i = 1;
n = 100;
c = 0.4;
Et = 0.01;
Ef = 0.001;
[m ,f(1)] = penalty(x(:,1) , m , rp , 1);
P(1) = exp(-f(1)/(k*Temperature));
move_limit = 0.001;
cycle = 1;
reject(cycle) = 0;
delF(1) = f(1);

% temporary variable for storing new value of x 
% if move accepted, store the value of x, else erase it
temp = zeros(length(x0) , 1); 

g(:,1) = constraints(x0);

while true
    
    
    for j = 1:length(x0)
        temp(j) = rand*2*move_limit+(x(j,1)-move_limit);
    end
    
    [m ,f(i+1)] = penalty(temp, m, rp , i+1);
    delE = f(i+1) - f(i);
    P(i+1) = min(1 , exp(-delE/(k*Temperature)));
    r = rand;
    gtemp = constraints(temp);
    fl = true;
    for a = 1:length(gtemp)
        if gtemp(a) <= 0
                fl = fl && true;
        else
                fl = fl && false;
        end
    end

    if delE < 0 
        x(:,2) = temp
        x(:,1) = [];
    elseif delE > 0 
        if r < P(i+1)
            x(:,2) = temp
            x(:,1) = [];
        else
            reject(cycle) = reject(cycle)+1;
%             continue
        end
    end
    
    i = i + 1;
%     rp = 5*rp;
    
    if i == n
        Temperature = c*Temperature;
%         x(:,1) = x(:,2);
%         x(:,2:n) = 0;
        i = 1;
        cycle = cycle + 1
        reject(cycle) = 0;
        delF(cycle) = f(i);
        
        g(:,cycle) = constraints(x(:,1));
        flag = true;
        for a = 1:length(g(:,cycle))
            if g(a,cycle) <= 0
                flag = flag && true;
            else
                flag = flag && false;
            end
        end
        
        if (abs(delF(cycle) - delF(cycle-1)) < Ef) && (Temperature < Et) && flag
                x_min = x(:,1)
                constraints(x_min)
                break
        else
            continue
        end
    end

            
    
end

end
