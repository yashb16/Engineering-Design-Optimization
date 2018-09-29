clear all

[x1,x2] = meshgrid(-2:.01:4,-4:.01:4);    %% Create matrices of x1 and x2 values

[m,n] = size(x1);                       %% Determine size of x1 and x2 matrices

for i = 1:m
    for j = 1:n
        
        F(i,j) = 2*x1(i,j) + 3*x2(i,j) - (x1(i,j))^3 - 2*(x2(i,j))^2;   %% Evaluate objective function at each x1,x2 combination
        
    end
end

v = [-50 -40 -30 -20 -10 -8 -6 -4 -2 0 2];  %% Define contour values to plot
[c,h] = contour(x1,x2,F,v);                 %% Create contour plot
clabel(c,h);                                %% Label the contours with values
xlabel('x1')                                %% Label x-axis as x1
ylabel('x2')                                %% Label y-axis as x2

hold on

g1 = (x1/8 + x2/2.667 - 1 <= 0) & (x1/2.4 + x2/6 - 1 <= 0) & (-x1 <= 0) & (-x2 <= 0);
g1 = double(g1);
g1(g1 == 0) = NaN;
surf(x1,x2,g1)