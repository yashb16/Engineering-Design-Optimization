clc
clear all

% x1 = 0:0.1:6;
% x2 = 0:0.1:6;

[x1 , x2] = meshgrid(0:0.1:6);

x = [x1 ; x2];
F = zeros(61, 61);
pF = zeros(61, 61);

for i = 1:61
    for j = 1:61
        F(i,j) = objF([x1(i,j) ; x2(i,j)]);
        pF(i,j) = pseudoF([x1(i,j) ; x2(i,j)] , 1000);
    end
end

v = [-4 3 -2 -1 0 100 500 1000 2000 3000 4000];

% [c1,h1] = contour(x1 , x2 , F , v);
% clabel(c1,h1)
% xlabel('x1')
% ylabel('x2')
% title('Original Objective Function')

[c2 , h2] = contour(x1 , x2 , pF , v);
clabel(c2,h2)
xlabel('x1')
ylabel('x2')
title('Pseudo Objective Function rp = 1000')
