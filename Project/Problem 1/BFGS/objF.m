function [m , fun] = objF(x , m)
[r,~] = size(m);
count = m(r , 1);

fun = projp1F(x);

count = count + 1;

m(count+1,:) = [count , fun];

% figure
% plot(m(:,1) , m(:,2))

end