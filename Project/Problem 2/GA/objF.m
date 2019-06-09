function [m, fun] = objF(x , m)
[r,~] = size(m);
count = m(r , 1);

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);


fun = 0.7854*x1*x2*x2*(10*(x3^2)/3 + 14.933*x3 - 43.0934) - 1.508*x1*(x6^2 + x7^2) + 7.477*(x6^3 + x7^3) + 0.7854*(x4*x6^2 + x5*x7^2);

count = count + 1;

m(count+1,:) = [count , fun];

% figure
% plot(m(:,1) , m(:,2))

end