clc
clear

x = [10 ; 20 ; 30 ; 40 ;50 ;60 ;70 ;80 ;90 ; 100];
y = -20*ones(10,1);
% y = zeros(10,1);
x0 = [x;y];
% h = 0.01;
count = 0;
m = [count , 0];

% [m , d] = cent_diff(x0 , m , h)

[m, xmin] = bfgs(x0 , m);

[m , Fmin] = objF(xmin , m);
Fmin

[r,c] = size(m);

figure
plot(m(2:r,1) , m(2:r,2) , '.')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function vs Number of evaluations')
ylim([-10^5 10^6])