clc
clear

x0 = [0.4 ; 6 ; 9 ; 0.5];

% x_min = bfgs(x0 , l , rp)

x_min = alm(x0)

Fmin = objF(x_min)