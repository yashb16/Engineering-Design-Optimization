clc
clear

x0 = [1 ; 1];

rp = 0;

% x_min = bfgs(x0 , rp)

x_min = ext_penalty(x0)

Fmin = objF(x_min)