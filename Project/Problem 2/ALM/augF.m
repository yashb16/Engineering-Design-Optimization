function [f] = augF(x , m , lambda , rp)

g = constraints(x);
psi = zeros(length(g) , 1);

sum = 0;

for j = 1:length(g)
    
    psi(j) = max(g(j) , -lambda(j)/(2*rp));
    sum = sum + lambda(j)*psi(j) + rp*psi(j)*psi(j);
    
end

[m ,fun] = objF(x , m);

f = fun + sum;

end