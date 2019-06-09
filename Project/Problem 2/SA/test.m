clc
clear

x0 = [2.5;0.65;15;7;7;2.5;5];
% x0 = ones(7,1);

% syms z1 z2 z3 z4 z5 z6 z7
% z = [z1;z2;z3;z4;z5;z6;z7];
% fgrad = gradF(z)

% g = constraints(x0)

l = ones(25,1);
rp = 10000;
count = 0;
m = [count , 0];


[m , xmin] = sim_ann(x0);

[~ , Fmin] = objF(xmin , m)

% f = @(x) augF(x, m ,l ,rp);
% 
% fun = f;
% 
% fmin = fminunc(fun, x0)

[r,~] = size(m);

figure
plot(m(2:r,1) , m(2:r,2) , '.')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function vs Number of evaluations')



