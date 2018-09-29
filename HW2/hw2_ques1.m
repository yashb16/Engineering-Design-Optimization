clc
clear all

n = 0:1:100;

C = (6336 + 20*n + (32*4000)./n)

[d,m] = min(C)
% d is the value of the min C
% m is index of the min value
n(m)

plot(n,C)
xlabel('No. of workers')
ylabel('Cost')
title('(c) Objective Function')