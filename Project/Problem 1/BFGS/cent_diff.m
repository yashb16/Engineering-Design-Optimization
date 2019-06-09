function [m , d] = cent_diff(x , m , h)

f1 = zeros(length(x) , 1);
f2 = zeros(length(x) , 1);

d = zeros(length(x),1);

del = h*eye(length(x));

for i = 1:length(x)
    [m , f1(i)] = objF(x + 0.5*del(:,i) , m);
    [m , f2(i)] = objF(x - 0.5*del(:,i) , m);
    
    d(i) = (f1(i) - f2(i))/h;
end

end