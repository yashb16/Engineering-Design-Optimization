clc
clear

x0 = [0 ; 0 ; 0];
 
count = 0;
m(1,:) = [count,0];
S = [1 ; 0 ; 1];
alpha = 0;

% step_size = 1.25;

% [aleft, aright , m] = bounding_phase_algo(x0, S, alpha, m)

% [a_star , m] = gold_section(x0, S , m)

% x_min = powell_method(x0)

% x_min = steep_descent(x0)

% [x_min , m] = fletcher_reeves(x0);

[x_min , m] = bfgs(x0);

% for i=1:5
%     [m , f] = objF(x0 + [i;i;i] , m)
% end
% syms x1 x2 x3
% x = [x1 ; x2 ; x3];
% fun = @(x) gradF(x);
% 
% x_min = fminunc(fun , x0)

[~ , Fmin] = objF(x_min , m)


figure
plot(m(:,1) , m(:,2) , '-')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function vs Number of evaluations')