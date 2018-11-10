function [m , d] = cent_diff(x , m , h)

% x1 = x(1) ;
% x2 = x(2) ;
% x3 = x(3) ;

f1 = zeros(length(x) , 1);
f2 = zeros(length(x) , 1);

d = zeros(3,1);

del = h*eye(3);

for i = 1:3
    [m , f1(i)] = objF(x + 0.5*del(:,i) , m);
    [m , f2(i)] = objF(x - 0.5*del(:,i) , m);
    
    d(i) = (f1(i) - f2(i))/h;
end

end