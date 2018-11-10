function fun = g6(x)

P = 6000;
L = 14;
E = 30*10^6;
% G = 12*10^6;
% Tmax = 13600;
% sigmax = 30000;
delmax = 0.25;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

del = 4*P*(L^3)/(E*x4*x3^3);

fun = del/delmax - 1;

end