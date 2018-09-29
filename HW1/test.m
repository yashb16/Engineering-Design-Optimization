clc 
clear all

syms R L

[R , L] = meshgrid(0:0.05:25 , 0:0.05:25);

[a,b] = size(R);

for i = 1:a
    for j = 1:b
        v(i,j) = - real(45*R(i,j) + 34.465*R(i,j)*R(i,j)/(sqrt((L(i,j))^2 - 0.413*(R(i,j))^2 )));
        g1(i,j) = 2.5*R(i,j) - L(i,j);
        g2(i,j) = 1 - 2*R(i,j);
        g3(i,j) = 0.1*R(i,j) - 1;
        g4(i,j) = 1-0.4*L(i,j);
        g5(i,j) = 0.04*L(i,j) - 1;
        g6(i,j) = real(10 -0.766*R(i,j) - (sqrt((L(i,j))^2 - 0.413*(R(i,j))^2)));
        g7(i,j) = real(0.766*R(i,j) + sqrt((L(i,j))^2 - 0.413*(R(i,j))^2) - 20);
    end
end
val = [-100 -150 -200 -300 -400 -500 -600 -700];
g_v = [0,0];

figure
[c,h] = contour(R,L,v,val);
clabel(c,h);

hold on
[c,h] = contour(R,L,g1,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g2,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g3,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g4,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g5,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g6,g_v);
clabel(c,h);

hold on
[c,h] = contour(R,L,g7,g_v);
clabel(c,h);

xlabel("R");
ylabel("L");

% 
% g1 = (2.5*R - L <= 0) & (1 - 2*R <= 0) & (0.1*R - 1 <= 0) & (1 - 2*L/5 <= 0) & ((L/25) - 1 <= 0);
% g1 = double(g1);
% g1(g1 == 0) = NaN;
% surf(R,L,g1)
