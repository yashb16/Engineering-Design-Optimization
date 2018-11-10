function fun = objF(x)

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

% fun = x1^2 + 2*x2^2 + 2*x3^2 + 2*x1*x2 + 2*x2*x3;

fun = 1.10471*x2*x1^2 + 0.04811*x3*x4*(14+x2);

end