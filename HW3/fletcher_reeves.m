function minima = fletcher_reeves(x0)

syms z1 z2 z3

x(:,1) = x0;

% Calculate the gradient of F
z = [z1 ; z2 ; z3];
grad_f = gradient(objF(z));
f(:,1) = subs(grad_f , z , x(:,1));

S(:,1) = -1*f(:,1);

alpha_star = gold_section(x(:,1) , S(:,1))

x(:,2) = x(:,1) + alpha_star*S(:,1)

for cycle = 2:4
    
    f(:,cycle) = subs(grad_f , z , x(:,cycle));
    
%     Assigning values to Beta
    beta(cycle-1) = (norm(f(:,cycle))^2)/((norm(f(:,cycle-1)))^2);
    
%     Updating Search vector
    S(:,cycle) = -1*f(:,cycle) + beta(cycle-1)*S(:,cycle-1);
    
    x_curr = x(:,cycle)
    
    S_curr = eval(S(:,cycle))
    
%     Calculate alpha star and update x
    alpha_star = gold_section(x(:,cycle) , S(:,cycle))
    
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle);
    
    l = length(x);
    
end

minima = x(:,l);



end