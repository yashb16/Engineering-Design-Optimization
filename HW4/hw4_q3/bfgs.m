function minima = bfgs(x0 , rp)

x(:,1) = x0;

% initial H matrix is the Identity matrix
H = eye(length(x0));

% Evaluating the gradient of F
z = sym('z' , [1 length(x0)]);
z = z';
grad_f = gradient(objF(z)); 
% IMPORTANT: Here pseudoF can't be used since unable to evaluate 'max'
% C(:,1) = subs(grad_f , z , x(:,1));
C(:,1) = gradient(pseudoF(x(:,1)));

Ef = 0.000001;


for cycle = 1:3
    
%     Defining the Search vector
    S(:,cycle) = linsolve(H , -1*C(:,cycle));
    
%     Calculate alpha star using Golden Section algorithm and update x
    alpha_star = gold_section(x(:,cycle) , S(:,cycle) , rp);
    x(:,cycle+1) = x(:,cycle) + alpha_star*S(:,cycle);
    
%     C matrix
%     C(:,cycle+1) = subs(grad_f , z , x(:,cycle+1));
    C(:,cycle+1) = gradient(pseudoF(x(:,cycle+1)));
    
%     Defining Y and P vectors
    Y = eval(C(:,cycle+1) - C(:,cycle));
    P = x(:,cycle+1) - x(:,cycle);
    
%     Calculatinf D and E matrices
    D = ((Y.*transpose(Y))/(transpose(Y)*P));
    E = eval((C(:,cycle+1).*transpose(C(:,cycle+1)))/(transpose(C(:,cycle+1))*S(:,cycle)));
    
%     Update H
    H = (H + E + D);
    
    l = length(x);
    
    if norm(C(:,cycle+1)) < Ef
        break;
    end
    
end

minima = x(:,l);

end