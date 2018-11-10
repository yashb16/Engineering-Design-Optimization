function [minima , m] = bfgs(x0)

syms z1 z2 z3

x(:,1) = x0;
h = 0.2;
cycle = 1;
count = 0;
m = [count , 0];
Ex = 0.001;
Ef = 0.001;

% initial H matrix is the Identity matrix
H = eye(length(x0))

% Evaluating the gradient of F
z = [z1 ; z2 ; z3];
grad_f = gradF(z);
C(:,1) = subs(grad_f , z , x(:,1));
% [m , C(:,1)] = cent_diff(x(:,1) , m , h);

while true
    
    if (norm(C(:,cycle)) < Ef) 
        break;
    end
    
%     Defining the Search vector
    S(:,cycle) = linsolve(H , -1*C(:,cycle));
    
%     Calculate alpha star using Golden Section algorithm and update x
    [alpha_star , m] = gold_section(x(:,cycle) , S(:,cycle) , m);
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle);
    
%     C matrix
    C(:,cycle+1) = eval(subs(grad_f , z , x(:,cycle+1)));
%     [m , C(:,cycle+1)] = cent_diff(x(:,cycle+1) , m , h);
%     use "eval" when calculating gradient analytically and no "eval" when
%     using central difference

%     Defining Y and P vectors
    Y = (C(:,cycle+1) - C(:,cycle));
    P = x(:,cycle+1) - x(:,cycle);
    
%     Calculatinf D and E matrices
    D = eval((Y.*transpose(Y))/(transpose(Y)*P))
    E = eval((C(:,cycle+1).*transpose(C(:,cycle+1)))/(transpose(C(:,cycle+1))*S(:,cycle)))
%     use "eval" when calculating gradient analytically and no "eval" when
%     using central difference

%     Update H
    H = (H + E + D)
    
    l = length(x);
    
    if (norm(x(:,cycle+1) - x(:,cycle)) < Ex)
        break
    end

    cycle = cycle + 1
    
end

minima = x(:,l);

end