function [m ,minima] = bfgs(x0 , lambda , rp , m)

x(:,1) = x0;
iter = 1;

% initial H matrix is the Identity matrix
H = eye(length(x0));

% Evaluating the gradient of F
z = sym('z' , [1 length(x0)]);
z = transpose(z);
grad_f = gradF(z); 
% IMPORTANT: Here augF can't be used since unable to evaluate 'max'
C(:,1) = subs(grad_f , z , x(:,1));
% C(:,1) = gradient(A(x(:,1) , l , rp))

Ef = 0.01;


while true
    
    if (norm(C(:,iter)) < Ef) 
        break;
    end
    
%     Defining the Search vector
    S(:,iter) = linsolve(H , -1*C(:,iter));
    
%     Calculate alpha star using Golden Section algorithm and update x
    [m ,alpha_star] = gold_section(x(:,iter) , S(:,iter) , lambda , rp , m);
    x(:,iter+1) = x(:,iter) + alpha_star*S(:,iter);
    
%     C matrix
    C(:,iter+1) = vpa(subs(grad_f , z , x(:,iter+1)));
%     C(:,cycle+1) = gradient(A(x(:,cycle+1)) , l , rp);
    
%     Defining Y and P vectors
    Y = eval(C(:,iter+1) - C(:,iter));
    P = x(:,iter+1) - x(:,iter);
    
%     Calculatinf D and E matrices
    D = ((Y.*transpose(Y))/(transpose(Y)*P));
    E = eval((C(:,iter+1).*transpose(C(:,iter+1)))/(transpose(C(:,iter+1))*S(:,iter)));
    
%     Update H
    H = (H + E + D);
    
    [~,c] = size(x);
    
%     norm(x(:,cycle+1) - x(:,cycle))
%     if norm(C(:,cycle+1)) < Ef  %|| norm(x(:,cycle+1) - x(:,cycle)) < Ef
%         break;
%     end
    
    iter = iter + 1
    
end

minima = x(:,c);

end