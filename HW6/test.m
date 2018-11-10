clc
clear

x0 = [0;0;0];

[m , xmin] = sa(x0);

% F = @objF

% [xmin, fmin, exitflag, output] = simulannealbnd(F , x0)

[~,F] = objF(xmin,m)

plot(m(:,1) , m(:,2) , 'o')