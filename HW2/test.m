clc
clear all

x0 = 0;

step_size = -1.25;

[xleft, xright] = bounding_phase_algo(x0, step_size)

% minima = quad_3pt_refine(x0, step_size);

% minima = gold_section(x0, step_size);

% syms x 
% y = objF(x);
% 
% fplot(x , y , [-1 4])
% xlabel('x')
% ylabel('y')
% title('(a) Objective Function')