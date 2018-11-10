clc
clear

x0 = [0 ; 0 ; 0];

% S = [1 ; 0 ; 0];

% alpha = 0;

% step_size = 1.25;

% [aleft, aright] = bounding_phase_algo(x0, S, alpha)

% a_star = gold_section(x0, S);

% x_min = powell_method(x0)

% x_min = steep_descent(x0)

% x_min = fletcher_reeves(x0)

x_min = bfgs(x0)

Fmin = objF(x_min)