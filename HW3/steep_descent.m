function minima = steep_descent(x0)

syms z1 z2 z3

x(:,1) = x0;

z = [z1 ; z2 ; z3];
grad_f = gradient(objF(z));
% Calculating gradient of f

for cycle = 1:3
    
    x_curr = x(:,cycle)
    
%     Setting the search direction as the negative of the gradient
    S(:,cycle) = -1*subs(grad_f, z, x(:,cycle));
    
    S_curr = eval(S(:,cycle))
    
%     Alpha star evaluated by the Golden Section algorithm
    alpha_star = gold_section(x(:,cycle) , S(:,cycle))
    
%     Update x
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle)
    
    l = length(x);
    
end

minima = x(:,l);
end