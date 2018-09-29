clc
clear all

syms x z;

A = [19 -5.6901 161.409; 7.5306 -0.4822 9.7102 ; 7.5159 -0.0027 10.0832];

subplot(3,2,[1 3])
a0 = 19;
a1 = -5.6901;
a2 = 161.409;
x1 = 0;
x2 = 1.875;
x3 = 3.75;
y1 = a0 + a1*(x-x1) + a2*(x-x1)*(x-x2);
fplot(x, y1, [-1 4])
hold on
plot(0,19,'r*')
hold on
plot(1.875,8.331,'r*')
hold on
plot(3.75,1132.6,'r*')
xlabel('x')
ylabel('y')
title('Iteration 1 parabola')
y = objF(z);
% Using a new variable name to avoid confusion
fplot(z , y, [-1 4])
hold on
legend('Approximation function' ,'', 'Control Points', '', 'Objective Function')


subplot(3,2,[2 4])
a0 = 7.5306;
a1 = -0.4822;
a2 = 9.7102;
x1 = 1.5479;
x2 = 1.5733;
x3 = 1.875;
y1 = a0 + a1*(x-x1) + a2*(x-x1)*(x-x2);
fplot(x, y1, [1.5 2])
hold on
plot(x1,7.5306,'r*')
hold on
plot(x2,7.5184,'r*')
hold on
plot(x3,8.331,'r*')
xlabel('x')
ylabel('y')
title('Iteration 5 parabola')
y = objF(z);
% Using a new variable name to avoid confusion
fplot(z , y, [1.5 2])
hold on
legend('Approximation function' ,'', 'Control Points', '', 'Objective Function')

subplot(3,2,[5 6])
a0 = 7.5159;
a1 = -0.0027;
a2 = 10.0832;
x1 = 1.5905;
x2 = 1.5906;
x3 = 1.875;
y1 = a0 + a1*(x-x1) + a2*(x-x1)*(x-x2);
fplot(x, y1, [1.55 1.9])
hold on
plot(x1,7.5159,'r*')
hold on
plot(x2,7.5159,'r*')
hold on
plot(x3,8.331,'r*')
xlabel('x')
ylabel('y')
title('Iteration 10 parabola')
y = objF(z);
% Using a new variable name to avoid confusion
fplot(z , y, [1.55 1.9])
hold on
legend('Approximation function' ,'', 'Control Points', '', 'Objective Function')
