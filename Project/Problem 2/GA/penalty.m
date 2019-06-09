function [m, f] = penalty(x , m , rp)

g = constraints(x);
psi = zeros(length(g) , 1);

sum = 0;

for j = 1:length(g)
    
    psi(j) = max(g(j) , 0);
    sum = sum + psi(j);
    
end

[m ,fun] = objF(x , m);

f = fun + rp*sum;

end