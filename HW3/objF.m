
function fun = objF(x)

x1 = x(1);
x2 = x(2);
x3 = x(3);

fun = x1^2 + 2*x2^2 + 2*x3^2 + 2*x1*x2 + 2*x2*x3;

% fun = x1^2 + 2*x2^2 + 2*x1*x2;

end