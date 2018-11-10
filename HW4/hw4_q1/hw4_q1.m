clc
clear all
% 
% syms x1 x2
% 
% x = [1 ; -2];
% F = 2*x1^3 + 15*x2^2 - 8*x1*x2 + 15;
% f1 = subs(F,[x1,x2],[x(1),x(2)]);
% 
% Fx = gradient(F);
% fx1 = subs(Fx(1) , [x1,x2],[x(1),x(2)]);
% 
% g1 = x1^2 + x1*x2 + 1;
% g2 = 4*x1 - x2^2 - 4;
% 
% g1x = gradient(g1);
% g2x = gradient(g2);

f = [22 ; -68];

A1 = [1 , 1];
b1 = 2.5;
Aeq1 = [0 , 1];
beq1 = 0.5;
LB = [0.5 ; 0];
UB = [1.5 ; 1];

X = linprog(f , A1 , b1 , Aeq1 , beq1 , LB , UB)