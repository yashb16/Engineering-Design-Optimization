clc 
clear all

[n1 , n2] = meshgrid(0:0.1:100 , 0:0.1:100);

[a,b] = size(n1);

for i = 1:a
    for j = 1:b
        F(i,j) = -200*n1(i,j) - 300*n2(i,j);
    end
end

v = [-5000 -10000 -15000 -20000 -25000 -30000 -35000 -40000 -50000];

figure
[c,h] = contour(n1,n2,F,v);
clabel(c,h);
xlabel("n1");
ylabel("n2");

hold on

g1 = (n1/100 + n2*4/500 - 1 <= 0) & (n1/200 + n2/100 - 1 <= 0) & (-n1 <= 0) & (-n2 <= 0);
g1 = double(g1);
g1(g1 == 0) = NaN;
surf(n1,n2,g1)
