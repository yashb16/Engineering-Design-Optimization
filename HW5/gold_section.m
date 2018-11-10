function [a_star , m] = gold_section(x0, S , m)

Ex = 0.001;
% Convergence criteria

alpha = 0;

[aL, aR , m] = bounding_phase_algo(x0, S, alpha , m);
% defining x_left and x_right from the bounding phase algorithm

L_init = (aR - aL);
L(1) = L_init;
% storing the initial value of L which is needed to check the convergence
% criteria

gamma = 0.618;

i = 1;

a1 = gamma*aL + (1-gamma)*aR;
a2 = (1-gamma)*aL + gamma*aR;
% values for the first iteration

while true
    
    A = [aL a1 a2 aR];
    % storing values in a matrix form for easier accessibility
    
    [m , f1] = objF(x0 + a1*S , m);
    [m , f2] = objF(x0 + a2*S , m);
    
    for j = 1:4
        X(:,j) = x0 + A(j)*S;
%         [m , f(j)] = objF(X(:,j) , m);
    end
    
    % checking whether the function is increasing or decreasing by
    % comparing values of f1 and f2
    % Values of xL, x1, x2 and xR are updated and stored in each iteration
    
    if f1 > f2
        aL = a1;
        a1 = a2;
        aR = aR;
        a2 = (1-gamma)*aL + gamma*aR;
        A = [aL a1 a2 aR];
        a_opt(i) = (aL + aR)/2;
        x_opt = x0 + a_opt(i)*S;
%         [m , f_opt(i)] = objF(x_opt,m);
    elseif f2 > f1
        aL = aL;
        aR = a2;
        a2 = a1;
        a1 = gamma*aL + (1-gamma)*aR;
        A = [aL a1 a2 aR];
        a_opt(i) = (aL + aR)/2;
        x_opt = x0 + a_opt(i)*S;
%         [m , f_opt(i)] = objF(x_opt,m);
    end
    
    % adding new values of L to the matrix
    L = [L, (aR - aL)];
    
    % checking the convergence criteria
    if (L(i)/L_init) <= Ex
        a_star = a_opt(i);
%         figure
%         subplot(4,2,i)
%         plot(a_opt, f_opt, '*')
        break
    else
        i = i+1;
        continue
    end
end

end