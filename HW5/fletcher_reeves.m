function [minima , m] = fletcher_reeves(x0)

syms z1 z2 z3

x(:,1) = x0;
h = 0.2;
cycle = 1;
count = 0;
m = [count , 0];
Ex = 0.001;
Ef = 0.001;

% Calculate the gradient of F
z = [z1 ; z2 ; z3];
grad_f = gradF(z);
f(:,1) = subs(grad_f , z , x(:,1));
% [m , f(:,1)] = cent_diff(x(:,1) , m , h);

S(:,1) = -1*f(:,1);

[alpha_star , m] = gold_section(x(:,1) , S(:,1) , m);

x(:,2) = x(:,1) + alpha_star*S(:,1);

while true
    
    cycle = cycle + 1
    
    f(:,cycle) = subs(grad_f , z , x(:,cycle));
%     [m , f(:,cycle)] = cent_diff(x(:,cycle) , m , h);
    
%     Assigning values to Beta
    beta(cycle-1) = (norm(f(:,cycle))^2)/((norm(f(:,cycle-1)))^2);
    
%     Updating Search vector
    S(:,cycle) = -1*f(:,cycle) + beta(cycle-1)*S(:,cycle-1);
    
    x_curr = x(:,cycle);

%     S_curr = (S(:,cycle))
%     use "eval" when calculating gradient analytically and no "eval" when
%     using central difference
    
%     Calculate alpha star and update x
    [alpha_star , m] = gold_section(x(:,cycle) , S(:,cycle) , m);
    
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle);
    
    l = length(x);
    
    if (norm(x(:,cycle+1) - x(:,cycle)) < Ex) || (norm(f(:,cycle)) < Ef)
       break;
    else 
        continue;
    end
    
end

minima = x(:,l);

end