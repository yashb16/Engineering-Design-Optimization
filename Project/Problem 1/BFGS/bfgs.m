function [m ,minima] = bfgs(x0 , m)

x(:,1) = x0;
h = 0.05;
iter = 1;

% initial H matrix is the Identity matrix
H = eye(length(x0));

% Evaluating the gradient of F
% z = sym('z' , [1 length(x0)]);
% z = transpose(z);
% grad_f = gradF(z); 

[m ,C(:,1)] = cent_diff(x(:,1) , m ,h);

Ef = 0.001;


while true
    
    
    if iter == 2 || iter == 3 || iter == 4 || iter == 5 || iter == 6
        figure
        plot(x(1:10,iter) , x(11:20,iter) , '*')
        xlabel('x')
        ylabel('y')
        title(['Configuration number: ', num2str(iter)])
    end
    
%     Defining the Search vector
    S(:,iter) = linsolve(H , -1*C(:,iter));
    
%     Calculate alpha star using Golden Section algorithm and update x
    [m ,alpha_star] = gold_section(x(:,iter) , S(:,iter) , m);
    x(:,iter+1) = x(:,iter) + alpha_star*S(:,iter);
    
%     C matrix
%     C(:,iter+1) = vpa(subs(grad_f , z , x(:,iter+1)));
    [m ,C(:,iter+1)] = cent_diff(x(:,iter+1) , m , h);
    
%     Defining Y and P vectors
    Y = vpa(C(:,iter+1) - C(:,iter));
    P = x(:,iter+1) - x(:,iter);
    
%     Calculatinf D and E matrices
    D = ((Y.*transpose(Y))/(transpose(Y)*P));
    E = vpa((C(:,iter+1).*transpose(C(:,iter+1)))/(transpose(C(:,iter+1))*S(:,iter)));
    
%     Update H
    H = (H + E + D);
    
    [~,c] = size(x);
    
%     norm(x(:,iter+1) - x(:,iter))
    if norm(C(:,iter+1) - C(:,iter)) < Ef 
        break;
    end
    
    iter = iter + 1
    
end

minima = x(:,c)

figure
plot(x(1:10,1) , x(11:20,1) , '*')
xlabel('x')
ylabel('y')
title('Initial Configuration')

figure
plot(x(1:10,iter) , x(11:20,iter) , '*')
xlabel('x')
ylabel('y')
title('Final Configuration')

end