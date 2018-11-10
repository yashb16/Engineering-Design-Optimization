function fun = g1(x)

P = 6000;
L = 14;
E = 30*10^6;
G = 12*10^6;
Tmax = 13600;
sigmax = 30000;
delmax = 0.25;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

M = P*(L+x2/2);
R = sqrt((x2/2)^2 + ((x1+x3)/2)^2);
J = 2*sqrt(2)*x1*x2*((x2^2)/12 + ((x1+x3)/2)^2);

Tp = P/(sqrt(2)*x1*x2);
Tpp = M*R/J;
T = sqrt(Tp^2 + 2*Tp*Tpp*x2/(2*R) + Tpp^2);

fun = T/Tmax - 1;

end