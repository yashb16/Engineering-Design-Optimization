function fun = g7(x)

P = 6000;
L = 14;
E = 30*10^6;
G = 12*10^6;
% Tmax = 13600;
% sigmax = 30000;
% delmax = 0.25;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

Pc = 4.013*E*sqrt((x3^2)*(x4^6)/36)*(1-x3*sqrt(E/(4*G))/(2*L));

fun = P/Pc - 1;

end