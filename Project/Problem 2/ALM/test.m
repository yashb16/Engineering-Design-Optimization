clc
clear

x0 = [3;0.75;20;8;8;3;5.2];
% x0 = [1;2]

% syms z1 z2 z3 z4 z5 z6 z7
% z = [z1;z2;z3;z4;z5;z6;z7];
% fgrad = gradF(z)

% g = constraints(x0)

l = ones(25,1);
rp = 1;
count = 0;
m = [count , 0];


% [m, xmin] = bfgs(x0 , l , rp , m);
[m , xmin] = alm(x0); 
[m , Fmin] = objF(xmin , m);

% i = 1;
% while true
%     
%     options = optimoptions(@fminunc,'Display','iter' , 'MaxIter', i);
%     [fun] = @(y) augF(y , m , lamda(:,cycle) , rp);
%     [x(:,cycle+1) , fval(i) , exitflag , output] = fminunc(fun, x(:,cycle),options);
%     [r,~] = size(m);
%     count = m(r , 1);
%     count = fcount_prev + output.funcCount;
%     m(r+1,:) = [count , fval(i)];
%     
%     
%     if i > 2
%        
%         if abs(fval(i) - fval(i-1)) < 0.0001
%             fcount_prev = count;  
%             break;
%         end
%         
%     end
%     
%     i = i+1;
% 
% end

% fun = @(z) f
% fun = subs(f, x0)


[r,c] = size(m);

figure
plot(m(2:r,1) , m(2:r,2) , '.')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function vs Number of evaluations')
% ylim([-0.5*10^5 , 0.5*10^5])
