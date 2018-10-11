function minima = bfgs(x0)

syms z1 z2 z3

x(:,1) = x0;

% initial H matrix is the Identity matrix
H = eye(length(x0))

% Evaluating the gradient of F
z = [z1 ; z2 ; z3];
grad_f = gradient(objF(z));
C(:,1) = subs(grad_f , z , x(:,1));

% Ex = 0.0001;


for cycle = 1:3
    
%     Defining the Search vector
    S(:,cycle) = linsolve(H , -1*C(:,cycle));
    
%     Calculate alpha star using Golden Section algorithm and update x
    alpha_star = gold_section(x(:,cycle) , S(:,cycle))
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle)
    
%     C matrix
    C(:,cycle+1) = -1*subs(grad_f , z , x(:,cycle+1));
    
%     Defining Y and P vectors
    Y = eval(C(:,cycle+1) - C(:,cycle));
    P = x(:,cycle+1) - x(:,cycle);
    
%     Calculatinf D and E matrices
    D = ((Y.*transpose(Y))/(transpose(Y)*P))
    E = eval((C(:,cycle+1).*transpose(C(:,cycle+1)))/(transpose(C(:,cycle+1))*S(:,cycle)))
    
%     Update H
    H = (H + E + D)
    
    l = length(x);
    
end

minima = x(:,l);




end